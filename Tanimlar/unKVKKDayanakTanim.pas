unit unKVKKDayanakTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Data.DB, MemDS, DBAccess, Uni, uniPanel, uniButton, uniBitBtn, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniCheckBox, uniDBCheckBox, uniEdit, uniDBEdit, uniLabel,
  uniGUIBaseClasses, uniMemo, uniDBMemo,StrUtils;

type
  TfrmKVKKDayanakTanim = class(TUniForm)
    dsDayanak: TUniDataSource;
    qTmp: TUniQuery;
    pnlData: TUniPanel;
    UniLabel3: TUniLabel;
    edDayanak: TUniDBEdit;
    UniLabel8: TUniLabel;
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
    qDayanak: TUniQuery;
    edTipi: TUniDBComboBox;
    UniLabel1: TUniLabel;
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

function frmKVKKDayanakTanim: TfrmKVKKDayanakTanim;

implementation

uses uniGUIApplication, MainModule, McMLib, unDepartmanListe, unHelpPage;

{$R *.dfm}

function frmKVKKDayanakTanim: TfrmKVKKDayanakTanim;
begin
  Result := TfrmKVKKDayanakTanim(MainMod.GetFormInstance(TfrmKVKKDayanakTanim));
end;

procedure TfrmKVKKDayanakTanim.btnCancelClick(Sender: TObject);
begin
  qDayanak.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmKVKKDayanakTanim.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmKVKKDayanakTanim.btnPostClick(Sender: TObject);
var
sqlstr: string;
begin
  if qDayanak.FieldByName('tipi').AsString = '' then
  begin
    MessageDlg('Dayanak Türü belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edTipi.SetFocus;
    Exit;
  end;
  if qDayanak.FieldByName('dayanak').AsString = '' then
  begin
    MessageDlg('Dayanak Tanýmý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edDayanak.SetFocus;
    Exit;
  end;
  // Doðan Akçay Takip Numarasý (ID):	PYW-QUY-MS6X (Talep numarasý: 579)
 sqlstr := 'SELECT count(*) rec FROM def_data_dayanak where mc_id=%d and dayanak=%s'+
 IfThen(qDayanak.State = dsEdit, ' and id<>'+qDayanak.FieldByName('id').AsString);
 sqlstr := format(sqlstr,[MainMod.MCID, QuotedStr(qDayanak.FieldByName('dayanak').AsString)]);
 QueryOpen(mainmod.qTmp,sqlstr);
 if (MainMod.qTmp.FieldByName('rec').AsInteger>0) then
  begin
    MessageDlg('Daha Önce Ayný isimte Dayanak Tanýmlanmýþtýr. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edDayanak.SetFocus;
    Exit;
  end;

  if qDayanak.State in [dsInsert] then
  begin
    qDayanak.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_def_data_dayanak_id');
    qDayanak.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    qDayanak.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    qDayanak.FieldByName('idt').AsDateTime   := Now;
  end;
  qDayanak.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  qDayanak.FieldByName('sdt').AsDateTime     := Now;
  qDayanak.Post;
  ModalResult := mrOk;
end;

function TfrmKVKKDayanakTanim.Exec(AID, AOp: Integer): Integer;
begin
  if AOp = 0 then // Insert
  begin
    QueryOpen(qDayanak, 'SELECT * FROM def_data_dayanak WHERE id = 0');
    qDayanak.Insert;
    YardimKw := 'DayanakYeniKayit';
  end
  else // Edit
  begin
    QueryOpen(qDayanak, 'SELECT * FROM def_data_dayanak WHERE id = ' + IntToStr(AID));
    qDayanak.Edit;
    YardimKw := 'DayanakDegistirme';
  end;

  ActiveControl := edDayanak;
  Result := ShowModal;
end;

procedure TfrmKVKKDayanakTanim.UniFormBeforeShow(Sender: TObject);
begin
  lbIDY.Caption := MainMod.KullaniciGetir(qDayanak.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(qDayanak.FieldByName('sdy').AsString);

  if dsDayanak.State = dsEdit then
  begin
    if lbIDY.Text = '' then lbIDY.Text := 'SÝSTEM';
    if lbSDY.Text = '' then lbSDY.Text := 'SÝSTEM';
  end;

  if qDayanak.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qDayanak.FieldByName('idt').AsDateTime);
  if qDayanak.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qDayanak.FieldByName('sdt').AsDateTime);
end;

end.
