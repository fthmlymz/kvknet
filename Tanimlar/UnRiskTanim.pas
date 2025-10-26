unit UnRiskTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniButton, uniBitBtn, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses,
  uniMemo, uniDBMemo, Data.DB, DBAccess, Uni, MemDS,strutils, McMLib;

type
  TfrmRiskTanim = class(TUniForm)
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
    qrisk: TUniQuery;
    dsrisk: TUniDataSource;
    qTmp: TUniQuery;
    btnHelp: TUniBitBtn;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    YardimKw : string;
  public
    function Exec(AID:integer ; AEylemtipi: TEylemTipi): Integer;
  end;

function frmRiskTanim: TfrmRiskTanim;

implementation

uses uniGUIApplication, MainModule,  unHelpPage;

{$R *.dfm}

function frmRiskTanim: TfrmRiskTanim;
begin
  Result := TfrmRiskTanim(MainMod.GetFormInstance(TfrmRiskTanim));
end;

procedure TfrmRiskTanim.btnCancelClick(Sender: TObject);
begin
  qrisk.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmRiskTanim.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmRiskTanim.btnPostClick(Sender: TObject);
var
sqlstr : string;
begin
  if qrisk.FieldByName('risk').AsString = '' then
  begin
    MessageDlg('Risk belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edTanim.SetFocus;
    Exit;
  end;

  sqlstr := 'SELECT count(*) rec FROM def_data_Risk_tanim where mc_id=%d and risk=%s'+
  IfThen(qrisk.State = dsEdit, ' and id<>'+qrisk.FieldByName('id').AsString);
  sqlstr := format(sqlstr,[MainMod.MCID, QuotedStr(qrisk.FieldByName('risk').AsString)]);
  QueryOpen(qTmp,sqlstr) ;
  if  (qTmp.FieldByName('rec').AsInteger>0) then
  begin
    MessageDlg('Daha Önce Ayný Risk Tanýmlanmýþtýr. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edTanim.SetFocus;
    Exit;
  end;

  if qrisk.State in [dsInsert] then
  begin
    qrisk.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_def_data_riks_tanim_id');
    qrisk.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    qrisk.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    qrisk.FieldByName('idt').AsDateTime   := Now;
  end;
  qrisk.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  qrisk.FieldByName('sdt').AsDateTime     := Now;
  qrisk.Post;
  ModalResult := mrOk;
end;

function TfrmRiskTanim.Exec(AID:integer ; AEylemtipi: TEylemTipi): Integer;
begin
  if AEylemtipi = Etekleme then // Insert
  begin
    QueryOpen(qrisk, 'SELECT * FROM def_data_risk_tanim WHERE id = 0');
    qrisk.Insert;
    YardimKw := 'RiskYeniKayit';
  end
  else if AEylemtipi = EtTekDegistirme then

  begin
    QueryOpen(qrisk, 'SELECT * FROM def_data_risk_tanim WHERE id = ' + IntToStr(AID));
    qrisk.Edit;
    YardimKw := 'RiskDegistirme';
  end;

  ActiveControl := edTanim;
  Result := ShowModal;
end;

procedure TfrmRiskTanim.UniFormBeforeShow(Sender: TObject);
begin
  lbIDY.Caption := MainMod.KullaniciGetir(qrisk.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(qrisk.FieldByName('sdy').AsString);

  if qrisk.State = dsEdit then
  begin
    if lbIDY.Text = '' then lbIDY.Text := 'SÝSTEM';
    if lbSDY.Text = '' then lbSDY.Text := 'SÝSTEM';
  end;

  if qrisk.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qrisk.FieldByName('idt').AsDateTime);
  if qrisk.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qrisk.FieldByName('sdt').AsDateTime);
end;

end.
