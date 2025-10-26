unit UnRiskSurecTedbirTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniEdit, uniDBEdit, uniMemo,
  uniDBMemo, uniLabel, uniMultiItem, uniComboBox, uniGUIBaseClasses, uniPanel,
  Data.DB, DBAccess, Uni, MemDS, strutils, math, uniDateTimePicker,
  uniDBDateTimePicker,McMLib, uniDBComboBox, uniDBLookupComboBox;

type

 //TEylemTipi = (Etekleme,EtTekDegistirme,EtTopluDegistirme);

  TfrmRiskSurecTedbirTanim = class(TUniForm)
    UniPanel2: TUniPanel;
    UniPanel1: TUniPanel;
    cbdurum: TUniComboBox;
    UniLabel1: TUniLabel;
    UniLabel29: TUniLabel;
    mmAciklama: TUniDBMemo;
    edTedbir: TUniDBEdit;
    UniLabel5: TUniLabel;
    pnlButtons: TUniPanel;
    UniLabel9: TUniLabel;
    lbIDY: TUniLabel;
    UniLabel10: TUniLabel;
    lbIDT: TUniLabel;
    UniLabel11: TUniLabel;
    lbSDY: TUniLabel;
    UniLabel12: TUniLabel;
    lbSDT: TUniLabel;
    btnCancel: TUniBitBtn;
    btnPost: TUniBitBtn;
    btnHelp: TUniBitBtn;
    qdata: TUniQuery;
    dsdata: TUniDataSource;
    qTmp: TUniQuery;
    UniLabel13: TUniLabel;
    edrisk: TUniEdit;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    UniLabel2: TUniLabel;
    edtarih: TUniLabel;
    pnllog: TUniPanel;
    pnlbutton: TUniPanel;
    edsorumlu: TUniDBLookupComboBox;
    qusers: TUniQuery;
    dsusers: TUniDataSource;
    procedure dsdataStateChange(Sender: TObject);
    procedure Oncombochange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure qdataBeforePost(DataSet: TDataSet);
  private
    EylemTipi : TEylemTipi;
    RiskId : integer;
    combochange: Boolean;
    TedbirTamamlandi :boolean;
    procedure PrepareTables;

  public
    degistirelemez : boolean;
    function Exec(AriskId: integer; AIds: string = '0';  AeylemTipi : TEylemTipi=Etekleme ): integer;
  end;

function frmRiskSurecTedbirTanim: TfrmRiskSurecTedbirTanim;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, unRiskUtls;

function frmRiskSurecTedbirTanim: TfrmRiskSurecTedbirTanim;
begin
  Result := TfrmRiskSurecTedbirTanim(mainmod.GetFormInstance(TfrmRiskSurecTedbirTanim));
end;

{ TfrmRiskSurecTedbir }

procedure TfrmRiskSurecTedbirTanim.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmRiskSurecTedbirTanim.btnPostClick(Sender: TObject);
begin

  if not (qdata.State in [dsEdit,dsInsert]) then
  begin
    MessageDlg('Hiçbir deðiþiklik bulunamadý', mtWarning, [mbOK]);
    exit;
  end;
    if qdata.FieldByName('tedbir').IsNull or (Length(qdata.FieldByName('tedbir').AsString) < 10) then
  begin
    MessageDlg('Risk tanýmý en az 10 karakter olmalýdýr.', mtWarning, [mbOK]);
    edRisk.SetFocus;
    exit;
  end;
  if cbdurum.ItemIndex < 0 then
  begin
    MessageDlg('Risk Durumunu Belitrmeniz gerekmektedir.', mtWarning, [mbOK]);
    cbdurum.SetFocus;
    exit;
  end;
  if  (qdata.FieldByName('sorumlu_id').AsString = '') or ( qdata.FieldByName('sorumlu_id').IsNull) then
  begin
    MessageDlg('Bir sorumlu belirtmeniz gerekmektedir.', mtWarning, [mbOK]);
    edSorumlu.SetFocus;
    exit;
  end;

    QueryOpen(qTmp,'select * from def_data_risk_tedbir r where r.mc_id='+
    inttostr(mainmod.MCID)+' and r.tedbir = ' +  QuotedStr(qdata.FieldByName('tedbir').AsString)+
    IfThen(EylemTipi = EtTekDegistirme,' and r.id<>'+ qdata.FieldByName('id').AsString ) );
  if qtmp.RecordCount>0 then
  begin
    MessageDlg('Ayný isimde birden fazla tedbir tanýmý kullanýlamaz .', mtWarning, [mbOK]);
    edTedbir.SetFocus;
    exit;
  end;
  QueryOpen(qTmp,'select * from def_data_risk where mc_id='+
    IntToStr(mainmod.MCID) + ' and id='+ qdata.FieldByName('risk_id').AsString);
  if qTmp.IsEmpty then
  begin
   MessageDlg('Ayný isimde birden fazla tedbir tanýmý kullanýlamaz .', mtWarning, [mbOK]);
    exit;
  end;

  if EylemTipi = Etekleme then
  begin
    qdata.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_def_data_risk_id');
    qdata.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    qdata.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    qdata.FieldByName('idt').AsDateTime   := Now;
  end;
  qdata.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  qdata.FieldByName('sdt').AsDateTime     := Now;
  qdata.Post;
  if (EylemTipi <> Etekleme) and (TedbirTamamlandi)  then
  begin
   MessageDlg('Tamamlanan tedbir doðrultusunda Risk olasýlýk ve etkilerini yeniden gözden geçiriniz ', mtWarning, [mbOK]);
  end;
  ModalResult := mrOk;

end;

procedure TfrmRiskSurecTedbirTanim.dsdataStateChange(Sender: TObject);
begin
  btnPost.Enabled := qdata.State in [dsEdit,dsInsert];
end;

function TfrmRiskSurecTedbirTanim.Exec(AriskId: integer; AIds: string='0';  AeylemTipi : TEylemTipi=Etekleme ): integer;
var
durum : TRiskTedbirDurum;
begin
   EylemTipi := AeylemTipi;
   RiskId := AriskId;

      QueryOpen(qusers,' select t.id,t.full_name sorumlu from usr_user t where t.active =''E'' and mc_id='+ inttostr(mainmod.MCID) +' order by t.full_name '     ) ;

    qdata.SQL.Text := ' select * from def_data_risk_tedbir t where t.mc_id =' +
     IntToStr(MainMod.MCID) + ' and t.risk_id = ' + inttostr(RiskId) +
     IfThen(EylemTipi=Etekleme,' and t.id=0',       ifthen(EylemTipi = EtTekDegistirme,' and t.id=' + AIds, ' and t.id in ('+AIds+')') );

      qdata.Open;

      QueryOpen(qTmp,'select * from def_data_risk r where r.id='+ IntToStr(AriskId));
      edrisk.Text := IfThen(not qTmp.IsEmpty,qTmp.FieldByName('risk').AsString) ;

    if EylemTipi=Etekleme then
    begin
      qdata.Append;
      qdata.FieldByName('risk_id').AsInteger := RiskId;
    end;

   for durum := low(TRisktedbirDurum) to High(TRisktedbirDurum) do
    cbdurum.Items.Add(SRiskTedbirDurum[durum]);

    PrepareTables;
    PaneldeOkunurYap(UniPanel1,degistirelemez);
    result := ShowModal;

end;

procedure TfrmRiskSurecTedbirTanim.Oncombochange(Sender: TObject);
begin
 if not combochange then   exit;
  if not ( qdata.State in [dsEdit,dsInsert]) then
    qdata.Edit;
  qdata.FieldByName('durum').AsInteger := cbdurum.ItemIndex + 1;

end;
procedure TfrmRiskSurecTedbirTanim.PrepareTables;
begin
 combochange := false;
  cbdurum.ItemIndex := ifthen( not qdata.FieldByName('durum').IsNull, qdata.FieldByName('durum').AsInteger -1,-1);
 combochange := true;
end;

procedure TfrmRiskSurecTedbirTanim.qdataBeforePost(DataSet: TDataSet);
begin
  TedbirTamamlandi := false;
 if qdata.FieldByName('durum').OldValue <> qdata.FieldByName('durum').OldValue then
  if  qdata.FieldByName('durum').NewValue = 1 then
    if ( qdata.FieldByName('durum').OldValue = 0) or ( qdata.FieldByName('durum').OldValue = 2) then
      TedbirTamamlandi := true;
end;

procedure TfrmRiskSurecTedbirTanim.UniFormBeforeShow(Sender: TObject);
begin
 lbIDY.Caption := MainMod.KullaniciGetir(qdata.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(qdata.FieldByName('sdy').AsString);

  if (EylemTipi = EtTekDegistirme ) or ( EylemTipi =EtTopluDegistirme ) then
  begin
    if lbIDY.Text = '' then lbIDY.Text := 'SÝSTEM';
    if lbSDY.Text = '' then lbSDY.Text := 'SÝSTEM';
  end;

  if qdata.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qdata.FieldByName('idt').AsDateTime);
  if qdata.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qdata.FieldByName('sdt').AsDateTime);
end;

end.
