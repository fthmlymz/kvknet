unit unKVKKTedbirTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniButton, uniBitBtn, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses,
  uniMemo, uniDBMemo, Data.DB, DBAccess, Uni, MemDS,strutils;

type
  TfrmKVKKTedbirTanim = class(TUniForm)
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
    qTedbir: TUniQuery;
    dsTedbir: TUniDataSource;
    qTmp: TUniQuery;
    btnHelp: TUniBitBtn;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    YardimKw : string;
  public
    function Exec(AID, AOp: Integer): Integer;
  end;

function frmKVKKTedbirTanim: TfrmKVKKTedbirTanim;

implementation

uses uniGUIApplication, MainModule, McMLib, unHelpPage;

{$R *.dfm}

function frmKVKKTedbirTanim: TfrmKVKKTedbirTanim;
begin
  Result := TfrmKVKKTedbirTanim(MainMod.GetFormInstance(TfrmKVKKTedbirTanim));
end;

procedure TfrmKVKKTedbirTanim.btnCancelClick(Sender: TObject);
begin
  qTedbir.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmKVKKTedbirTanim.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmKVKKTedbirTanim.btnPostClick(Sender: TObject);
var
sqlstr : string;
begin
  if qTedbir.FieldByName('tedbir').AsString = '' then
  begin
    MessageDlg('Güvenlik Tedbiri belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edTanim.SetFocus;
    Exit;
  end;
   // Doðan Akçay Takip Numarasý (ID):	PYW-QUY-MS6X (Talep numarasý: 579)
  sqlstr := 'SELECT count(*) rec FROM def_data_tedbir where mc_id=%d and tedbir=%s'+
  IfThen(qTedbir.State = dsEdit, ' and id<>'+qTedbir.FieldByName('id').AsString);
  sqlstr := format(sqlstr,[MainMod.MCID, QuotedStr(qTedbir.FieldByName('tedbir').AsString)]);
  QueryOpen(MainMod.qTmp,sqlstr) ;
  if  (MainMod.qTmp.FieldByName('rec').AsInteger>0) then
  begin
    MessageDlg('Daha Önce Ayný Ýsimde Güvenlik Tedbiri Tanýmlanmýþtýr. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edTanim.SetFocus;
    Exit;
  end;

  if qTedbir.State in [dsInsert] then
  begin
    qTedbir.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_def_data_tedbir_id');
    qTedbir.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    qTedbir.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    qTedbir.FieldByName('idt').AsDateTime   := Now;
  end;
  qTedbir.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  qTedbir.FieldByName('sdt').AsDateTime     := Now;
  qTedbir.Post;
  ModalResult := mrOk;
end;

function TfrmKVKKTedbirTanim.Exec(AID, AOp: Integer): Integer;
begin
  if AOp = 0 then // Insert
  begin
    QueryOpen(qTedbir, 'SELECT * FROM def_data_tedbir WHERE id = 0');
    qTedbir.Insert;
    YardimKw := 'TedbirYeniKayit';
  end
  else // Edit
  begin
    QueryOpen(qTedbir, 'SELECT * FROM def_data_tedbir WHERE id = ' + IntToStr(AID));
    qTedbir.Edit;
    YardimKw := 'TedbirDegistirme';
  end;

  ActiveControl := edTanim;
  Result := ShowModal;
end;

procedure TfrmKVKKTedbirTanim.UniFormBeforeShow(Sender: TObject);
begin
  lbIDY.Caption := MainMod.KullaniciGetir(qTedbir.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(qTedbir.FieldByName('sdy').AsString);

  if dsTedbir.State = dsEdit then
  begin
    if lbIDY.Text = '' then lbIDY.Text := 'SÝSTEM';
    if lbSDY.Text = '' then lbSDY.Text := 'SÝSTEM';
  end;

  if qTedbir.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qTedbir.FieldByName('idt').AsDateTime);
  if qTedbir.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qTedbir.FieldByName('sdt').AsDateTime);
end;

end.
