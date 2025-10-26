unit unVSBasvuruDokumanKayit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniEdit, uniDBEdit, uniLabel, uniButton, uniBitBtn, uniGUIBaseClasses, uniPanel,
  uniFileUpload, Data.DB, DBAccess, Uni, MemDS;

type
  TfrmVSBasvuruDokumanKayit = class(TUniForm)
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
    dsBsvDoc: TUniDataSource;
    qTmp: TUniQuery;
    procedure btnSelectClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FileUpCompleted(Sender: TObject; AStream: TFileStream);
  private
    Data : TUniQuery;
    function GetDepartmentName(DeptID: Integer): String;
  public
    function Exec(AData: TUniQuery; AOp, VsbId, DeptId: Integer): Integer;
  end;

function frmVSBasvuruDokumanKayit: TfrmVSBasvuruDokumanKayit;

implementation

uses uniGUIApplication, MainModule, McMLib;

{$R *.dfm}

function frmVSBasvuruDokumanKayit: TfrmVSBasvuruDokumanKayit;
begin
  Result := TfrmVSBasvuruDokumanKayit(MainMod.GetFormInstance(TfrmVSBasvuruDokumanKayit));
end;

procedure TfrmVSBasvuruDokumanKayit.btnCancelClick(Sender: TObject);
begin
  Data.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmVSBasvuruDokumanKayit.btnPostClick(Sender: TObject);
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
    if Data.FieldByName('id').AsInteger < 1 then Data.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_data_vsbasvuru_docs_id');
    Data.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    Data.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    Data.FieldByName('idt').AsDateTime   := Now;
  end;
  Data.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  Data.FieldByName('sdt').AsDateTime     := Now;
//  Data.FieldByName('ekleyen').AsString   := MainMod.KullaniciGetir(Data.FieldByName('idy').AsString);
//  Data.FieldByName('dept_name').AsString := GetDepartmentName(Data.FieldByName('dept_id').AsInteger);
  Data.Post;
  ModalResult := mrOk;
end;

procedure TfrmVSBasvuruDokumanKayit.btnSelectClick(Sender: TObject);
begin
  FileUp.Execute;
end;

function TfrmVSBasvuruDokumanKayit.Exec(AData: TUniQuery; AOp, VsbId, DeptId: Integer): Integer;
begin
  FileUp.MaxAllowedSize := KVKFileSize;
  Data := AData;
  dsBsvDoc.DataSet := Data;

  if AOp = 0 then // Insert
  begin
    btnSelect.Enabled := True;
    Data.Insert;
    Data.FieldByName('vsb_id').AsInteger  := VsbId;
    Data.FieldByName('dept_id').AsInteger := DeptId;
  end
  else // Edit
  begin
    btnSelect.Enabled := False;
    Data.Edit;
  end;
  ActiveControl := edAciklama;
  Result := ShowModal;
end;

procedure TfrmVSBasvuruDokumanKayit.FileUpCompleted(Sender: TObject; AStream: TFileStream);
begin
  if not DataEditing(Data) then Exit;

  try
    Data.FieldByName('belge_adi').AsString := FileUp.FileName;
    TBlobField(Data.FieldByName('belge')).LoadFromStream(AStream);
  except
    raise;
  end;
end;

function TfrmVSBasvuruDokumanKayit.GetDepartmentName(DeptID: Integer): String;
begin
  Result := '';
  if DeptID < 1 then Exit;

  QueryOpen(qTmp, 'SELECT id, title FROM sys_deptdef WHERE id = ' + IntToStr(DeptId));
  if qTmp.FieldByName('id').AsInteger = DeptID then Result := qTmp.FieldByName('title').AsString;
end;

end.
