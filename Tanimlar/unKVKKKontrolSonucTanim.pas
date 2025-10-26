unit unKVKKKontrolSonucTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniButton, uniBitBtn, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses,
  uniMemo, uniDBMemo, Data.DB, DBAccess, Uni, MemDS;

type
  TfrmKVKKKontrolSonucTanim = class(TUniForm)
    pnlData: TUniPanel;
    UniLabel2: TUniLabel;
    UniLabel9: TUniLabel;
    edTanim: TUniDBEdit;
    pnlButtons: TUniPanel;
    btnCancel: TUniBitBtn;
    btnPost: TUniBitBtn;
    pnlLog: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    lbIDY: TUniLabel;
    lbIDT: TUniLabel;
    lbSDY: TUniLabel;
    lbSDT: TUniLabel;
    edDesc: TUniDBMemo;
    qKontrolSonuc: TUniQuery;
    dsKontrolSonuc: TUniDataSource;
    qTmp: TUniQuery;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    YardimKw: string;
  public
    function Exec(AID, AOp: Integer): Integer;
  end;

function frmKVKKKontrolSonucTanim: TfrmKVKKKontrolSonucTanim;

implementation

uses uniGUIApplication, MainModule, McMLib, unHelpPage;

{$R *.dfm}

function frmKVKKKontrolSonucTanim: TfrmKVKKKontrolSonucTanim;
begin
  Result := TfrmKVKKKontrolSonucTanim(MainMod.GetFormInstance(TfrmKVKKKontrolSonucTanim));
end;

procedure TfrmKVKKKontrolSonucTanim.btnCancelClick(Sender: TObject);
begin
  qKontrolSonuc.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmKVKKKontrolSonucTanim.btnPostClick(Sender: TObject);
begin
  if qKontrolSonuc.FieldByName('kontrolsonuc').AsString = '' then
  begin
    MessageDlg('Kontrol Sonuç Tanýmý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edTanim.SetFocus;
    Exit;
  end;

  if qKontrolSonuc.State in [dsInsert] then
  begin
    qKontrolSonuc.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_def_data_kontrolsonuc_id');
    qKontrolSonuc.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    qKontrolSonuc.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    qKontrolSonuc.FieldByName('idt').AsDateTime   := Now;
  end;
  qKontrolSonuc.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  qKontrolSonuc.FieldByName('sdt').AsDateTime     := Now;
  qKontrolSonuc.Post;
  ModalResult := mrOk;
end;

function TfrmKVKKKontrolSonucTanim.Exec(AID, AOp: Integer): Integer;
begin
  if AOp = 0 then // Insert
  begin
    QueryOpen(qKontrolSonuc, 'SELECT * FROM def_data_kontrolsonuc WHERE id = 0');
    qKontrolSonuc.Insert;
    YardimKw := 'KontrolSonucYeniKayit';
  end
  else // Edit
  begin
    QueryOpen(qKontrolSonuc, 'SELECT * FROM def_data_kontrolsonuc WHERE id = ' + IntToStr(AID));
    qKontrolSonuc.Edit;
    YardimKw := 'KontrolSonucDegistirme';
  end;

  ActiveControl := edTanim;
  Result := ShowModal;
end;

procedure TfrmKVKKKontrolSonucTanim.UniFormBeforeShow(Sender: TObject);
begin
  lbIDY.Caption := MainMod.KullaniciGetir(qKontrolSonuc.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(qKontrolSonuc.FieldByName('sdy').AsString);
  if qKontrolSonuc.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qKontrolSonuc.FieldByName('idt').AsDateTime);
  if qKontrolSonuc.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qKontrolSonuc.FieldByName('sdt').AsDateTime);
end;

end.
