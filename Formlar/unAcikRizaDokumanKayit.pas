unit unAcikRizaDokumanKayit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniEdit, uniDBEdit, uniLabel, uniButton, uniBitBtn, uniGUIBaseClasses, uniPanel,
  uniFileUpload, Data.DB, DBAccess, Uni, MemDS;

type
  TfrmAcikRizaDokumanKayit = class(TUniForm)
    pnlButtons: TUniPanel;
    btnCancel: TUniBitBtn;
    btnPost: TUniBitBtn;
    UniPanel1: TUniPanel;
    UniLabel34: TUniLabel;
    edAciklama: TUniDBEdit;
    UniLabel13: TUniLabel;
    edDosyaAdi: TUniDBEdit;
    btnSelect: TUniBitBtn;
    FileUp: TUniFileUpload;
    dsARDoc: TUniDataSource;
    qTmp: TUniQuery;
    procedure btnSelectClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FileUpCompleted(Sender: TObject; AStream: TFileStream);
  private
    Data : TUniQuery;
  public
    function Exec(AData: TUniQuery; AOp, ARId, DeptId: Integer): Integer;
  end;

function frmAcikRizaDokumanKayit: TfrmAcikRizaDokumanKayit;

implementation

uses uniGUIApplication, MainModule, McMLib;

{$R *.dfm}

function frmAcikRizaDokumanKayit: TfrmAcikRizaDokumanKayit;
begin
  Result := TfrmAcikRizaDokumanKayit(MainMod.GetFormInstance(TfrmAcikRizaDokumanKayit));
end;

procedure TfrmAcikRizaDokumanKayit.btnCancelClick(Sender: TObject);
begin
  Data.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmAcikRizaDokumanKayit.btnPostClick(Sender: TObject);
begin
  if Data.FieldByName('aciklama').AsString = '' then
  begin
    MessageDlg('Belge için açýklama belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edAciklama.SetFocus;
    Exit;
  end;
  if Data.FieldByName('belge_adi').AsString = '' then
  begin
    MessageDlg('Belge seçilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edDosyaAdi.SetFocus;
    Exit;
  end;

  if Data.State in [dsInsert] then
  begin
    if Data.FieldByName('id').AsInteger < 1 then Data.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_data_acikriza_docs_id');
    Data.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    Data.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    Data.FieldByName('idt').AsDateTime   := Now;
  end;
  Data.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  Data.FieldByName('sdt').AsDateTime     := Now;
  //Data.FieldByName('ekleyen').AsString   := MainMod.KullaniciGetir(Data.FieldByName('idy').AsString);
  Data.Post;
  ModalResult := mrOk;
end;

procedure TfrmAcikRizaDokumanKayit.btnSelectClick(Sender: TObject);
begin
  FileUp.Execute;
end;

function TfrmAcikRizaDokumanKayit.Exec(AData: TUniQuery; AOp, ARId, DeptId: Integer): Integer;
begin
  FileUp.MaxAllowedSize := KVKFileSize;
  Data := AData;
  dsARDoc.DataSet := Data;

  if AOp = 0 then // Insert
  begin
    btnSelect.Enabled := True;
    Data.Insert;
    Data.FieldByName('ar_id').AsInteger  := ARId;
  end
  else // Edit
  begin
    btnSelect.Enabled := False;
    Data.Edit;
  end;
  ActiveControl := edAciklama;
  Result := ShowModal;
end;

procedure TfrmAcikRizaDokumanKayit.FileUpCompleted(Sender: TObject; AStream: TFileStream);
begin
  if not DataEditing(Data) then Exit;

  try
    Data.FieldByName('belge_adi').AsString := FileUp.FileName;
    TBlobField(Data.FieldByName('belge')).LoadFromStream(AStream);
    MessageDlg('Dosya yüklendi : ' + FileUp.FileName, mtInformation, [mbOk]);
  except
    raise;
  end;
end;

end.
