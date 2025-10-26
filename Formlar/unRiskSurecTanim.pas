unit unRiskSurecTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniGUIBaseClasses, uniMultiItem,
  uniComboBox, uniLabel, Data.DB, DBAccess, Uni, MemDS , StrUtils, uniMemo,
  uniDBMemo, uniEdit, uniDBEdit, uniButton, uniBitBtn,math, uniBasicGrid,
  uniDBGrid,McMLib, uniGroupBox, VirtualTable, uniDBComboBox,
  uniDBLookupComboBox, uniListBox, uniDBListBox, uniDBLookupListBox, uniCheckBox;

type
 //  TEylemTipi = (Etekleme,EtTekDegistirme,EtTopluDegistirme);
  TfrmRiskSurecTanim = class(TUniForm)
    cbdurum: TUniComboBox;
    cbetki: TUniComboBox;
    cbolasilik: TUniComboBox;
    pnlrisk: TUniPanel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    qdata: TUniQuery;
    dsdata: TUniDataSource;
    UniLabel29: TUniLabel;
    mmAciklama: TUniDBMemo;
    edRisk: TUniDBEdit;
    UniLabel5: TUniLabel;
    edriskseviye: TUniDBEdit;
    UniLabel7: TUniLabel;
    UniLabel8: TUniLabel;
    pnlButtons: TUniPanel;
    btnCancel: TUniBitBtn;
    btnPost: TUniBitBtn;
    UniLabel9: TUniLabel;
    lbIDY: TUniLabel;
    UniLabel10: TUniLabel;
    lbIDT: TUniLabel;
    UniLabel11: TUniLabel;
    lbSDY: TUniLabel;
    UniLabel12: TUniLabel;
    lbSDT: TUniLabel;
    btnHelp: TUniBitBtn;
    qTmp: TUniQuery;
    btnEtkiHesapla: TUniBitBtn;
    btnOlasilikHesapla: TUniBitBtn;
    btnTedbiradd: TUniBitBtn;
    pnltedbir: TUniPanel;
    pnltedbirbaslik: TUniPanel;
    UniDBGrid1: TUniDBGrid;
    QRiskTedbir: TUniQuery;
    dsRiskTedbir: TUniDataSource;
    UniDBMemo1: TUniDBMemo;
    UniPanel3: TUniPanel;
    UniLabel13: TUniLabel;
    UniLabel14: TUniLabel;
    cbRiskTedbirDurum: TUniComboBox;
    btntedbiredit: TUniBitBtn;
    btntedbirdelete: TUniBitBtn;
    pnlsurec: TUniPanel;
    pnldetay: TUniPanel;
    UniPanel1: TUniPanel;
    btnSurecAdd: TUniBitBtn;
    btnsurecdelete: TUniBitBtn;
    UniDBGrid2: TUniDBGrid;
    qrisksurec: TUniQuery;
    dsrisksurec: TUniDataSource;
    UniPanel2: TUniPanel;
    UniPanel4: TUniPanel;
    btnexit: TUniBitBtn;
    cbmetot: TUniComboBox;
    UniLabel15: TUniLabel;
    lbfrekans: TUniLabel;
    cbfrekans: TUniComboBox;
    lbfakredilme: TUniLabel;
    cbfarkedilme: TUniComboBox;
    UniGroupBox1: TUniGroupBox;
    lbriskseviyestr: TUniLabel;
    UniGroupBox2: TUniGroupBox;
    vqGddate: TVirtualTable;
    vqGdrisktedbir: TVirtualTable;
    vqGdrisksurec: TVirtualTable;
    btnHesapInfo: TUniBitBtn;
    edsorumlu: TUniDBLookupComboBox;
    qusers: TUniQuery;
    dsusers: TUniDataSource;
    qkategori: TUniQuery;
    dskategori: TUniDataSource;
    lcKategori: TUniDBLookupComboBox;
    btnrisktanimadd: TUniBitBtn;
    qkaynaklar: TUniQuery;
    dskaynaklar: TUniDataSource;
    UniPanel6: TUniPanel;
    UniDBGrid3: TUniDBGrid;
    btnKaynakAdd: TUniBitBtn;
    btnKayanakDelet: TUniBitBtn;
    UniPanel5: TUniPanel;
    pnlkaynak: TUniPanel;
    qkaynaklarkaynak_id: TIntegerField;
    qkaynaklarkaynak: TStringField;
    qkaynaklarSec: TBooleanField;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure Oncombochange(Sender: TObject);
    procedure btnEtkiHesaplaClick(Sender: TObject);
    procedure btnOlasilikHesaplaClick(Sender: TObject);
    procedure dsdataStateChange(Sender: TObject);
    procedure btnTedbiraddClick(Sender: TObject);
    procedure QRiskTedbirAfterScroll(DataSet: TDataSet);
    procedure btntedbireditClick(Sender: TObject);
    procedure btntedbirdeleteClick(Sender: TObject);
    procedure btnSurecAddClick(Sender: TObject);
    procedure btnsurecdeleteClick(Sender: TObject);
    procedure btnexitClick(Sender: TObject);
    procedure qdataAfterScroll(DataSet: TDataSet);
    procedure btnHesapInfoClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure btnrisktanimaddClick(Sender: TObject);
    procedure qrisksurecAfterScroll(DataSet: TDataSet);
    procedure UniButton1Click(Sender: TObject);
    procedure btnKaynakAddClick(Sender: TObject);
    procedure qkaynaklarCalcFields(DataSet: TDataSet);
    procedure UniDBGrid3CellClick(Column: TUniDBGridColumn);
    procedure btnHelpClick(Sender: TObject);

  private

    YardimKw : string;
    EylemTipi :  TEylemTipi;
    GozdenGecirme : boolean;
    combochange : boolean;
    surecDegisti ,tedbirDegisti, riskdegisti : boolean;
    FAnalizMetod: integer;
    Degistirilemez : boolean;
    procedure SetAnalizMetod(const Value: integer);
    procedure gozdengecirmeKaydet;
    property AnalizMetod: integer read FAnalizMetod write SetAnalizMetod;
    procedure PrepareTables;
    procedure tablesOpen(Arisk_id : string = '0');
  public
    function Exec(AIds: string='0'; AeylemTipi : TEylemTipi=Etekleme ; AGostedGecirme: boolean = false ): integer;overload;
    function ExecGozdenGecirme(AId: string ; AGdId :string): integer;
  end;

function frmRiskSurecTanim: TfrmRiskSurecTanim;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication,  unRiskUtls , UnRiskEtkiHesaplamaAnketi,
  UnRiskOlasilikHesaplamaAnketi, UnRiskSurecTedbirTanim, unKVKKSurecSec,
  unRiskSurecAnilizHesapInfo, UnRiskSec, unKVKKKaynakSec,unHelpPage;

function frmRiskSurecTanim: TfrmRiskSurecTanim;
begin
  Result := TfrmRiskSurecTanim(mainmod.GetFormInstance(TfrmRiskSurecTanim));
end;

{ TfrmRiskSurecTanim }

procedure TfrmRiskSurecTanim.btnCancelClick(Sender: TObject);
begin
  qdata.Cancel;
end;

procedure TfrmRiskSurecTanim.btnPostClick(Sender: TObject);
var
 NewId : integer;
begin
  newid := 0;
  if not (qdata.State in [dsEdit,dsInsert]) then
  begin
    MessageDlg('Hiçbir deðiþiklik bulunamadý', mtWarning, [mbOK]);
    exit;
  end;

  if qdata.FieldByName('risk').IsNull  then
  begin
    MessageDlg('Risk tanýmý en az 10 karakter olmalýdýr.', mtWarning, [mbOK]);
    edRisk.SetFocus;
    exit;
  end;

  QueryOpen(qTmp,'select * from def_data_risk r where r.mc_id='+
    inttostr(mainmod.MCID)+' and r.risk=' +  QuotedStr(qdata.FieldByName('risk').AsString)+
    IfThen(EylemTipi = EtTekDegistirme,' and r.id<>'+ qdata.FieldByName('id').AsString ) );
  if qtmp.RecordCount>0 then
  begin
    MessageDlg('Ayný isimde birden fazla Risk tanýmý kullanýlamaz .', mtWarning, [mbOK]);
    edRisk.SetFocus;
    exit;
  end;

  if cbdurum.ItemIndex < 0 then
  begin
    MessageDlg('Risk Durumunu Belitrmeniz gerekmektedir.', mtWarning, [mbOK]);
    cbdurum.SetFocus;
    exit;
  end;

  if lcKategori.ItemIndex  < 0 then
  begin
    MessageDlg('Risk Kategorisi Belitrmeniz gerekmektedir.', mtWarning, [mbOK]);
    lcKategori.SetFocus;
    exit;
  end;

  if cbetki.ItemIndex < 0 then
  begin
    MessageDlg('Riskin Etkisini Belitrmeniz gerekmektedir.', mtWarning, [mbOK]);
    cbetki.SetFocus;
    exit;
  end;

  if cbolasilik.ItemIndex < 0 then
  begin
    MessageDlg('Riskin oluþma olasýlýðýný Belitrmeniz gerekmektedir.', mtWarning, [mbOK]);
    cbolasilik.SetFocus;
    exit;
  end;

  if  (qdata.FieldByName('sorumlu_id').AsString = '') or ( qdata.FieldByName('sorumlu_id').IsNull) then
  begin
    MessageDlg('Bir sorumlu belirtmeniz gerekmektedir.', mtWarning, [mbOK]);
    edSorumlu.SetFocus;
    exit;
  end;

  if EylemTipi = Etekleme then
  begin
    NewId :=  MainMod.GetSeq('sq_def_data_risk_id');
    qdata.FieldByName('id').AsInteger     := NewId ;
    qdata.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    qdata.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    qdata.FieldByName('idt').AsDateTime   := Now;
  end;
  qdata.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  qdata.FieldByName('sdt').AsDateTime     := Now;
  qdata.FieldByName('gozden_gecirme_tar').AsString :=
      ifthen((GozdenGecirme) and (EylemTipi = EtTekDegistirme),DateToStr(now),'') ;

  qdata.Post;
  riskdegisti := true;

  if (EylemTipi = Etekleme) and (NewId>0)then
  begin
      qdata.SQL.Text := 'select * from def_data_risk r where r.mc_id=' +IntToStr(MainMod.MCID) + ' and r.id= '+ IntToStr(NewId);
        qdata.Open;
      tablesOpen(IntToStr(NewId) );
      PrepareTables;
  end;
  if (GozdenGecirme) and (EylemTipi = EtTekDegistirme) then
    gozdengecirmeKaydet;
end;

procedure TfrmRiskSurecTanim.gozdengecirmeKaydet;
var
  I : integer;
  gozdengecirme_id : integer;
begin
  gozdengecirme_id := mainmod.GetSeq('sq_def_data_risk_gozden_gecirme_id');
  QueryOpen(qtmp,'select * from def_data_riskgd where id=0');
  qTmp.Append;
   for I := 0 to qtmp.Fields.Count-1 do
   begin
    if qTmp.Fields[i].FieldName = 'gozdengecirme_id' then
      qTmp.Fields[i].Value := gozdengecirme_id
    else
    begin
      if assigned(qdata.FindField(qTmp.Fields[i].FieldName)) then
        qtmp.Fields[i].Value := qdata.FindField(qTmp.Fields[i].FieldName).Value;
    end;
   end;
   qTmp.Post;

   if QRiskTedbir.RecordCount > 0 then
   begin
      QueryOpen(qtmp,'select * from def_data_risk_tedbirgd where id=0');
      QRiskTedbir.DisableControls;
      QRiskTedbir.First;
      while not  QRiskTedbir.Eof do
      begin
        qTmp.Append;
        for I := 0 to qtmp.Fields.Count-1 do
         begin
          if qTmp.Fields[i].FieldName = 'gozdengecirme_id' then
            qTmp.Fields[i].Value := gozdengecirme_id
          else
          begin
            if assigned(QRiskTedbir.FindField(qTmp.Fields[i].FieldName)) then
              qtmp.Fields[i].Value := QRiskTedbir.FindField(qTmp.Fields[i].FieldName).Value;
          end;
         end;
        qTmp.Post;
        QRiskTedbir.Next;
      end;
   end;

     if qrisksurec.RecordCount > 0 then
       begin
        QueryOpen(qtmp,'select * from def_data_risk_surec_eslesmegd where id=0');
        qrisksurec.DisableControls;
        qrisksurec.First;
        while not  qrisksurec.Eof do
        begin
          qTmp.Append;
          for I := 0 to qtmp.Fields.Count-1 do
           begin
            if qTmp.Fields[i].FieldName = 'gozdengecirme_id' then
              qTmp.Fields[i].Value := gozdengecirme_id
            else
            begin
              if assigned(qrisksurec.FindField(qTmp.Fields[i].FieldName)) then
                qtmp.Fields[i].Value := qrisksurec.FindField(qTmp.Fields[i].FieldName).Value;
            end;
           end;
          qTmp.Post;
          qrisksurec.Next;
        end;
     end;


end;

procedure TfrmRiskSurecTanim.btnSurecAddClick(Sender: TObject);
var
i : integer;
Acount : integer;
AId : integer;
AsurecIds : TStringList;

begin

  AsurecIds := TStringList.Create;
  try
    qrisksurec.DisableControls;
      qrisksurec.First;
      while not qrisksurec.Eof do
      begin
        AsurecIds.Add(qrisksurec.FieldByName('surec_id').AsString);
        qrisksurec.Next;
      end;
    qrisksurec.EnableControls;
      frmKVKKSurecSec.GizliKriter := 'id IN (SELECT DISTINCT surec_id FROM data_envanter WHERE active = ''E'' '+
      ' and dept_id=any(string_to_array('+QuotedStr(mainmod.LoginInfo.Birimler)+', '','')::int[]) ' +
      ' AND mc_id = ' + IntToStr(MainMod.MCID) + ') '+
       ifthen( AsurecIds.Count > 0 ,' and id not in ('+AsurecIds.DelimitedText+')','') ;
      ACount := frmKVKKSurecSec.Select(True);
      for i := 0 to ACount - 1 do
      begin
        frmKVKKSurecSec.qTanim.GotoBookmark(frmKVKKSurecSec.grdList.SelectedRows[i]);
        AID   := frmKVKKSurecSec.qTanim.FieldByName('id').AsInteger;
       QueryPrep(qtmp,' INSERT INTO def_data_risk_surec_eslesme (id, mc_id, risk_id, surec_id, idy, idt, sdy, sdt) ' +
                  ' VALUES ' +
                  ' (:id, :mc_id, :risk_id, :surec_id, :idy, :idt, :sdy, :sdt) '  ) ;
       qTmp.ParamByName('id').AsInteger := MainMod.GetSeq('sq_def_data_risk_surec_eslesme_id');
       qTmp.ParamByName('mc_id').AsInteger := MainMod.MCID;
       qTmp.ParamByName('risk_id').AsInteger := qdata.FieldByName('id').AsInteger;
       qTmp.ParamByName('surec_id').AsInteger := AId;
       qTmp.ParamByName('idy').AsInteger := MainMod.LoginInfo.ID;
       qTmp.ParamByName('idt').AsDateTime := now;
       qTmp.ParamByName('sdy').AsInteger := MainMod.LoginInfo.ID;
       qTmp.ParamByName('sdt').AsDateTime := now;
       qTmp.ExecSQL;
      end;
      surecDegisti := true;
  finally
    if Assigned(AsurecIds) then
      FreeAndNil(AsurecIds);
    RefreshQuery(qrisksurec);
  end;

end;

procedure TfrmRiskSurecTanim.btnsurecdeleteClick(Sender: TObject);
begin
    if qrisksurec.IsEmpty then  exit;

  qrisksurec.Delete;
  surecDegisti := true;
  RefreshQuery(qrisksurec);
end;

procedure TfrmRiskSurecTanim.dsdataStateChange(Sender: TObject);
begin
  btnPost.Enabled := qdata.State in [dsEdit,dsInsert];
  btnCancel.Enabled := qdata.State in [dsEdit,dsInsert];
end;

procedure TfrmRiskSurecTanim.btnEtkiHesaplaClick(Sender: TObject);
var
  puan : integer;
begin
  if AnalizMetod<1 then exit;

  if frmRiskEtkiHesaplamaAnketi.Exec(puan, TriskHesapMetod(AnalizMetod)) = mrOk then
    begin
    cbetki.ItemIndex := puan -1 ;
      Oncombochange(cbetki);
    end;
end;

function TfrmRiskSurecTanim.Exec(AIds: string='0'; AeylemTipi : TEylemTipi=Etekleme ; AGostedGecirme: boolean = false ): integer;
var

  AnalizMetot : TriskHesapMetod;
begin

  YardimKw := 'RiskTanimlama';
  cbmetot.Items.Clear;
  for AnalizMetot := Low(TriskHesapMetod) to High(TriskHesapMetod) do
    cbmetot.Items.Add(sriskHesapMetod[AnalizMetot]);


    EylemTipi := AeylemTipi;
    GozdenGecirme := AGostedGecirme;
    Degistirilemez := false;

    QueryOpen(qusers,' select t.id,t.full_name sorumlu from usr_user t where t.active =''E'' and mc_id='+ inttostr(mainmod.MCID) +' order by t.full_name '     ) ;

    qdata.SQL.Text := 'select * from def_data_risk r where r.mc_id=' +IntToStr(MainMod.MCID) +
      ifthen(EylemTipi = Etekleme ,' and r.id= 0',ifthen(EylemTipi=EtTekDegistirme ,' and r.id =' +AIds ,' and r.id in ('+AIds+')')) ;
    qdata.Open;



    if EylemTipi=Etekleme then
      qdata.Append ;

    if qdata.RecordCount>0 then
       tablesOpen(qdata.FieldByName('id').AsString);

    AnalizMetod :=  IfThen(qdata.RecordCount>0,qdata.FieldByName('metot').AsInteger ,-1) ;

    PrepareTables;
    result := ShowModal;

end;

function TfrmRiskSurecTanim.ExecGozdenGecirme(AId: string ; AGdId :string): integer;
var
  AnalizMetot : TriskHesapMetod;
begin

  YardimKw := 'RiskTanimlama';
    Degistirilemez := true;
    cbmetot.Items.Clear;
    for AnalizMetot := Low(TriskHesapMetod) to High(TriskHesapMetod) do
      cbmetot.Items.Add(sriskHesapMetod[AnalizMetot]);

    QueryOpen(qusers,' select t.id,t.full_name sorumlu from usr_user t where t.active =''E'' and mc_id='+ inttostr(mainmod.MCID) +' order by t.full_name '     ) ;


    QueryOpen(qdata, 'select * from def_data_riskgd r where r.mc_id=' +IntToStr(MainMod.MCID) +
      ' and r.id =' + AId + ' and r.gozdengecirme_id =' + AGdId);

    QueryOpen(QRiskTedbir,'select * from def_data_risk_tedbirgd where mc_id='+ IntToStr(mainmod.MCID)+
        ' and gozdengecirme_id='+ AGdId + '  and risk_id=' + AId );

    qrisksurec.SQL.Text := ' select * from  def_data_risk_surec_eslesmegd es ' +
      ' join  def_data_riskgd r on r.mc_id=es.mc_id and es.risk_id=r.id and r.gozdengecirme_id=es.gozdengecirme_id' +
      ' join def_data_surec s on s.mc_id=es.mc_id and s.id=es.surec_id ' +
      ' where es.mc_id= :mc_id and es.risk_id=:risk_id  and es.gozdenGecirme_id =:gozdenGecirme_id order by surec '        ;
      qrisksurec.ParamByName('mc_id').AsString := inttostr(mainmod.MCID);
      qrisksurec.ParamByName('risk_id').AsString := AId;
      qrisksurec.ParamByName('gozdenGecirme_id').AsString := AGdId;

      qrisksurec.Open;

      AnalizMetod :=  IfThen(qdata.RecordCount>0,qdata.FieldByName('metot').AsInteger ,-1) ;
      PrepareTables;

      btnCancel.Visible := false;
      btnrisktanimadd.Visible := false;
      btnPost.Visible := false;
      btnTedbiradd.Visible := false;
      btntedbirdelete.Visible := false;
      btnSurecAdd.Visible := false;
      btnsurecdelete.Visible := false;
      btnEtkiHesapla.Visible := false;
      btnOlasilikHesapla.Visible := false;
      btnrisktanimadd.Visible := false;
      PaneldeOkunurYap(pnlrisk,true);
      PaneldeOkunurYap(pnldetay,true);
      result := ShowModal;

end;


procedure TfrmRiskSurecTanim.tablesOpen(Arisk_id : string= '0');
begin
      QueryOpen(QRiskTedbir,'select * from def_data_risk_tedbir where mc_id='+ IntToStr(mainmod.MCID)+
        ' and risk_id=' + Arisk_id );

      qrisksurec.SQL.Text := ' select * from  def_data_risk_surec_eslesme es ' +
      ' join  def_data_risk r on r.mc_id=es.mc_id and es.risk_id=r.id ' +
      ' join def_data_surec s on s.mc_id=es.mc_id and s.id=es.surec_id ' +
      ' where es.mc_id= :mc_id and es.risk_id=:risk_id  order by surec'        ;
      qrisksurec.ParamByName('mc_id').AsString := inttostr(mainmod.MCID);
      qrisksurec.ParamByName('risk_id').AsString := Arisk_id;
      qrisksurec.Open;

    if (GozdenGecirme)  and (EylemTipi =EtTekDegistirme) then
    begin
      CopyFieldsFromQueryToVirtualTable(qdata,vqgddate,true);
      CopyFieldsFromQueryToVirtualTable(QRiskTedbir,vqgdrisktedbir);
      CopyFieldsFromQueryToVirtualTable(qrisksurec,vqgdrisksurec);

    end;



end;

procedure TfrmRiskSurecTanim.Oncombochange(Sender: TObject);
var
metotDegisti : boolean;
RiskStr : string;
begin

 metotDegisti := qdata.fieldbyname('metot').asinteger <> cbmetot.ItemIndex +1 ;


 if not combochange then   exit;

 combochange := false;
  if not ( qdata.State in [dsEdit,dsInsert]) then
    qdata.Edit;
  qdata.fieldbyname('metot').asinteger := cbmetot.ItemIndex +1;
  if metotDegisti then
    AnalizMetod := cbmetot.ItemIndex +1;
  qdata.FieldByName('durum').AsInteger := cbdurum.ItemIndex + 1;
 // qdata.FieldByName('kategori').AsInteger := cbkategori.ItemIndex + 1;

  if sender=cbmetot then
  begin

    qdata.FieldByName('olasilik').Clear;
    cbolasilik.ItemIndex:= -1;
    qdata.FieldByName('etki').clear;
    cbetki.ItemIndex := -1;
    qdata.FieldByName('seviye').Clear;
    qdata.FieldByName('frekans').Clear;
    cbetki.ItemIndex := -1;
    qdata.FieldByName('farkedilebilirlik').Clear;
    cbfarkedilme.ItemIndex := -1;
    lbriskseviyestr.Caption := '';

  end else
  begin
    qdata.FieldByName('olasilik').AsInteger := cbolasilik.ItemIndex + 1;
    qdata.FieldByName('etki').AsInteger := cbetki.ItemIndex + 1;
    qdata.FieldByName('frekans').AsInteger := cbfrekans.ItemIndex +1;
    qdata.FieldByName('farkedilebilirlik').AsInteger := cbfarkedilme.ItemIndex +1;

    if TriskHesapMetod(AnalizMetod)= RhmLTipiMatris then
    begin
      if  (not qdata.FieldByName('etki').IsNull) and (not qdata.FieldByName('olasilik').IsNull)   then
        begin
          qdata.FieldByName('seviye').AsFloat :=  qdata.FieldByName('etki').AsInteger *
                                                    qdata.FieldByName('olasilik').AsInteger ;
          GetRiskSeviyesi(RiskStr,qdata.FieldByName('seviye').AsFloat,RhmLTipiMatris );
          lbriskseviyestr.Caption := riskstr;
        end else
        begin
          qdata.FieldByName('seviye').Clear;
          lbriskseviyestr.Caption := '';
        end;
    end
    else if TriskHesapMetod(AnalizMetod)= RhmFineKinney then
    begin
     if (not qdata.FieldByName('etki').IsNull ) and (not qdata.FieldByName('olasilik').isnull) and (not qdata.FieldByName('frekans').IsNull) then
     begin
      qdata.FieldByName('seviye').AsFloat := ( NriskEtkiFk[ TRiskEtkiFk( qdata.FieldByName('etki').AsInteger)] *
                                               NRiskOlasilikFk[TRiskOlasilikFk( qdata.FieldByName('olasilik').AsInteger)] *
                                              NRiskFrekansFk[ TRiskFrekansFk(qdata.FieldByName('frekans').AsInteger )]);

      GetRiskSeviyesi(RiskStr,qdata.FieldByName('seviye').AsFloat,RhmFineKinney );
      lbriskseviyestr.Caption := riskstr;
     end else
     begin
       qdata.FieldByName('seviye').Clear;
       lbriskseviyestr.Caption := '';;
     end;
    end
    else  if TriskHesapMetod(AnalizMetod)= RhmFMEA  then
    begin
      if (not qdata.FieldByName('etki').isnull) and (not qdata.FieldByName('olasilik').IsNull) and (not qdata.FieldByName('farkedilebilirlik').isnull ) then
      begin
        qdata.FieldByName('seviye').AsFloat :=  qdata.FieldByName('etki').AsInteger *
                                                  qdata.FieldByName('olasilik').AsInteger *
                                                  qdata.FieldByName('farkedilebilirlik').AsInteger ;

        GetRiskSeviyesi(RiskStr,qdata.FieldByName('seviye').AsFloat,RhmFMEA );
        lbriskseviyestr.Caption := riskstr;
      end else
      begin
       qdata.FieldByName('seviye').Clear;
       lbriskseviyestr.Caption := '';
      end;
    end;

  end;

  combochange := true;

end;

procedure TfrmRiskSurecTanim.PrepareTables;
var
Riskstr :string;
begin

  combochange := false;
  cbmetot.ItemIndex := ifthen(not qdata.FieldByName('metot').IsNull,qdata.FieldByName('metot').AsInteger-1,-1);
  cbdurum.ItemIndex := ifthen( not qdata.FieldByName('durum').IsNull, qdata.FieldByName('durum').AsInteger -1,-1);
 // cbkategori.ItemIndex := ifthen( not qdata.FieldByName('kategori').IsNull, qdata.FieldByName('kategori').AsInteger -1,-1);
  cbolasilik.ItemIndex := ifthen( not qdata.FieldByName('olasilik').IsNull, qdata.FieldByName('olasilik').AsInteger -1,-1);
  cbetki.ItemIndex :=  ifthen( not qdata.FieldByName('etki').IsNull,qdata.FieldByName('etki').AsInteger-1,-1);
  cbfrekans.ItemIndex := ifthen(not qdata.FieldByName('frekans').IsNull,qdata.FieldByName('frekans').AsInteger-1,-1);
  cbfarkedilme.ItemIndex := ifthen(not qdata.FieldByName('farkedilebilirlik').IsNull,qdata.FieldByName('farkedilebilirlik').AsInteger-1,-1);
  GetRiskSeviyesi(Riskstr,qdata.FieldByName('seviye').AsFloat,TriskHesapMetod(AnalizMetod) );
  lbriskseviyestr.Caption := riskstr;

  combochange := true;
end;

procedure TfrmRiskSurecTanim.qdataAfterScroll(DataSet: TDataSet);
begin
    pnldetay.Enabled := qdata.RecordCount > 0  ;
end;

procedure TfrmRiskSurecTanim.qkaynaklarCalcFields(DataSet: TDataSet);
var
  index  : Integer;
  IDLists : TStringList;
begin
Idlists := TStringList.Create;
try
  Idlists.CommaText := qrisksurec.FieldByName('kaynak_ids').AsString;
  Index := Idlists.IndexOf( qkaynaklar.FieldByName('kaynak_id').AsString );

  if index <> -1 then
    qkaynaklarSec.AsBoolean := true
    else
    qkaynaklarSec.AsBoolean := false  ;

finally
  Idlists.Free;
end;

end;

procedure TfrmRiskSurecTanim.qrisksurecAfterScroll(DataSet: TDataSet);
var
  SelectedIDs: TStringList;
  i, ItemIndex: Integer;
begin
  if not qrisksurec.IsEmpty then
  begin

    SelectedIDs := TStringList.Create;
    try
      SelectedIDs.CommaText := qrisksurec.FieldByName('kaynak_ids').AsString;

      QueryOpen(qkaynaklar,
        ' select distinct kaynak_id, k.kaynak ' +
        ' from data_envanter t ' +
        ' join def_data_kaynak k on k.id = t.kaynak_id ' +
        ' where t.mc_id = ' + IntToStr(mainmod.MCID) +
      //  ' and k.id=any(string_to_array('+ QuotedStr( qrisksurec.FieldByName('kaynak_ids').AsString)+ ', '','')::int[]) ' +
        ' and t.active = ''E'' and surec_id = ' +
        qrisksurec.FieldByName('surec_id').AsString +
        ' order by k.kaynak');

    finally
      SelectedIDs.Free;
    end;
  end;


end;

procedure TfrmRiskSurecTanim.QRiskTedbirAfterScroll(DataSet: TDataSet);
begin
  if (not QRiskTedbir.IsEmpty) and (QRiskTedbir.FieldByName('durum').AsString<>'') then
    cbRiskTedbirDurum.ItemIndex :=  QRiskTedbir.FieldByName('durum').AsInteger-1
  else
    cbRiskTedbirDurum.ItemIndex := -1;


end;



procedure TfrmRiskSurecTanim.SetAnalizMetod(const Value: integer);
var
  Kategori: TRiskKategoriler;
  Durum : TRiskDurum;
  etki : TRiskEtki;
  etkifk : TRiskEtkiFk;
  olasilik : TRiskOlasilik ;
  olasilikfk : TRiskOlasilikFk;
  frekansfk : TriskFrekansFk ;
  periyotBirim : TPeriyotBirimi;
  risktedbirdurum : TRiskTedbirDurum;
  Farkedilebilirlik : TriskFarkedilebilirlik;
  I: Integer;
begin


  FAnalizMetod := Value;


// kategori
//  cbKategori.Items.Clear;
//  for Kategori := Low(TriskKategoriler) to High(TRiskKategoriler) do
//    cbKategori.Items.Add(SriskKategoriler[Kategori]);
  // durum
  cbdurum.Items.Clear;
  for durum := low(Triskdurum) to High(triskdurum) do
    cbdurum.Items.Add(SriskDurum[durum]);
  //risk taným


  
  //tedbirdurum
  cbRiskTedbirDurum.Items.Clear;
  for risktedbirdurum := Low(TRiskTedbirDurum) to High(TRiskTedbirDurum) do
    cbRiskTedbirDurum.Items.Add(SRiskTedbirDurum[risktedbirdurum]);
  //etki

  If TriskHesapMetod(AnalizMetod) = RhmLTipiMatris   then
  begin
    // etki
    cbEtki.Items.Clear;
    for etki := Low(trisketki) to High(trisketki) do
      cbEtki.Items.Add(SRiskEtki[etki]);
    // olasýlýk
     cbolasilik.Items.Clear;
    for olasilik := Low(triskolasilik) to High(triskolasilik) do
      cbolasilik.Items.Add(SriskOlasilik[olasilik]);

    cbfrekans.Items.Clear;
    cbfarkedilme.Items.Clear;
  end   else
  if TriskHesapMetod(AnalizMetod) = RhmFMEA then
  begin
     // etki
    cbEtki.Items.Clear;
    for etki := Low(trisketki) to High(trisketki) do
      cbEtki.Items.Add(SRiskEtki[etki]);
    // olasýlýk
     cbolasilik.Items.Clear;
    for olasilik := Low(triskolasilik) to High(triskolasilik) do
      cbolasilik.Items.Add(SriskOlasilik[olasilik]);
    //fark edilme
    cbfarkedilme.Items.Clear;
    for Farkedilebilirlik := Low(TriskFarkedilebilirlik) to High(TriskFarkedilebilirlik) do
       cbfarkedilme.Items.Add(sriskFarkedilebilirlik[Farkedilebilirlik]);

    cbfrekans.Items.Clear;
  end else
  if TriskHesapMetod(AnalizMetod) = RhmFineKinney then
  begin
  // etki
    cbEtki.Items.Clear;
    for etkifk := Low(TRiskEtkiFk) to High(TRiskEtkiFk) do
      cbEtki.Items.Add(SRiskEtkiFk[etkifk]);
    // olasýlýk
     cbolasilik.Items.Clear;
    for olasilikfk := Low(TriskOlasilikFk) to High(TriskOlasilikFk) do
      cbolasilik.Items.Add(SriskOlasilikFk[olasilikfk]);

    // frekans
      cbfrekans.Items.Clear;
      for frekansfk := Low(TriskFrekansFk) to High(TriskFrekansFk) do
        cbfrekans.Items.Add(SRiskFrekansFk[frekansfk]) ;

     cbfarkedilme.Items.Clear;
  end ;

  btnOlasilikHesapla.Enabled := cbolasilik.Items.Count>0;
  btnEtkiHesapla.enabled := cbetki.Items.Count>0;
  cbfrekans.Visible := TriskHesapMetod(AnalizMetod)= RhmFineKinney;
  lbfrekans.Visible := TriskHesapMetod(AnalizMetod)= rhmfinekinney;
  cbfarkedilme.Visible := TriskHesapMetod(AnalizMetod) = RhmFMEA;
  lbfakredilme.Visible := TriskHesapMetod(AnalizMetod) = RhmFMEA;
  PrepareTables;
end;

procedure TfrmRiskSurecTanim.btnOlasilikHesaplaClick(Sender: TObject);
var
  puan : integer;
begin
  if frmRiskOlasilikHesaplamaAnketi.Exec(puan, TriskHesapMetod(AnalizMetod)) = mrOk then
  begin
    cbolasilik.ItemIndex:= puan -1 ;
    Oncombochange(cbolasilik);
  end;
end;

procedure TfrmRiskSurecTanim.btnTedbiraddClick(Sender: TObject);
begin
 if frmRiskSurecTedbirTanim.Exec(qdata.FieldByName('id').AsInteger) = mrOk then
 begin
  RefreshQuery(QRiskTedbir) ;
  tedbirDegisti := true;
 end;

end;

procedure TfrmRiskSurecTanim.btntedbirdeleteClick(Sender: TObject);
begin
 if QRiskTedbir.IsEmpty then  exit;

 if not(QRiskTedbir.State in [dsEdit,dsInsert])  then
  QRiskTedbir.Edit;

  QRiskTedbir.FieldByName('risk_id').Clear;
  QRiskTedbir.Post;
  tedbirDegisti := true;
  RefreshQuery(QRiskTedbir);
end;

procedure TfrmRiskSurecTanim.btntedbireditClick(Sender: TObject);
begin
   frmRiskSurecTedbirTanim.degistirelemez :=  Degistirilemez ;

  if frmRiskSurecTedbirTanim.Exec(
      qdata.FieldByName('id').AsInteger, QRiskTedbir.FieldByName('id').AsString,EtTekDegistirme) = mrOk then
      begin
        RefreshQuery(QRiskTedbir);
        surecDegisti := true;
      end;
end;

procedure TfrmRiskSurecTanim.btnexitClick(Sender: TObject);
begin
 if surecDegisti or tedbirDegisti or riskdegisti then
  ModalResult := mrOk
  else
  ModalResult := mrCancel;
end;

procedure TfrmRiskSurecTanim.btnHelpClick(Sender: TObject);
begin
 frmHelpPage.Exec(YardimKw);
end;

procedure TfrmRiskSurecTanim.btnHesapInfoClick(Sender: TObject);
begin
  FrmRiskHesapInfo.Exec;
end;

procedure TfrmRiskSurecTanim.btnKaynakAddClick(Sender: TObject);
var
  index  : Integer;

  IDLists : TStringList;
begin

  Idlists := TStringList.Create;
  try
    IDLists.CommaText := qrisksurec.FieldByName('kaynak_ids').AsString;
    index := IDLists.IndexOf(qkaynaklar.FieldByName('kaynak_id').AsString) ;
    if index <> -1 then
      IDLists.Delete(index);

      QueryExec(qtmp, 'update def_data_risk_surec_eslesme set kaynak_ids='+QuotedStr(IDLists.CommaText)+' WHERE mc_id='+inttostr(MainMod.MCID)+' and id= '+
        qrisksurec.FieldByName('id').AsString)  ;
     RefreshQuery(qrisksurec);
  finally
    IDLists.Free;
  end;

end;

procedure TfrmRiskSurecTanim.btnrisktanimaddClick(Sender: TObject);
begin

  if frmRiskSec.select=mrOk then
    if not Degistirilemez then
    begin
      if not (qdata.State in [dsInsert,dsEdit]) then
        qdata.Edit;
     // edRisk.Text := frmRiskSec.qdata.FieldByName('risk').AsString;
      qdata.FieldByName('risk').AsString := frmRiskSec.qdata.FieldByName('risk').AsString;
    end;

end;


procedure TfrmRiskSurecTanim.UniButton1Click(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID    : Integer;
  AName  : String;
  IDList : String;
begin
   IDList := '';
  frmKVKKKaynakSec.GizliKriter := 'id IN ( '+
   ' select distinct kaynak_id ' +
   ' from data_envanter t ' +
   ' join def_data_kaynak k on k.id=t.kaynak_id ' +
   ' where t.mc_id=' + IntToStr(MainMod.MCID) + ' and t.active=''E'' and surec_id='+
    qrisksurec.FieldByName('surec_id').AsString +' ) ' ;



//  SELECT DISTINCT kaynak_id FROM data_envanter WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) + ') '+
//    ' and id not in ('+ qrisksurec.FieldByName('kaynak_ids').AsString+ ')' ;
  ACount := frmKVKKKaynakSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKKaynakSec.qTanim.GotoBookmark(frmKVKKKaynakSec.grdList.SelectedRows[i]);
      if IDList <>'' then
        IDList := IDList + ',' ;
      IDList := IDList + frmKVKKKaynakSec.qTanim.FieldByName('id').AsString ;
  end;
    QueryExec(qTmp,' update def_data_risk_surec_eslesme set kaynak_ids='+QuotedStr(Idlist)+' WHERE mc_id='+inttostr(MainMod.MCID)+' and id= '+
      qrisksurec.FieldByName('id').AsString   )   ;
    RefreshQuery(qrisksurec);



end;

procedure TfrmRiskSurecTanim.UniDBGrid3CellClick(Column: TUniDBGridColumn);
var
IdLists : TStringList;
index : integer;
begin
  if Column.Index = 0 then
  begin
    IdLists := TStringList.Create;
    try
      IdLists.CommaText := qrisksurec.FieldByName('kaynak_ids').AsString;
      if qkaynaklarSec.AsBoolean = True  then
      begin
        index := IdLists.IndexOf(qkaynaklar.FieldByName('kaynak_id').AsString) ;
        if index = -1  then
        begin
          IdLists.Add(qkaynaklar.FieldByName('kaynak_id').AsString);
            QueryExec(qTmp,' update def_data_risk_surec_eslesme set kaynak_ids='+QuotedStr(IdLists.CommaText)+' WHERE mc_id='+inttostr(MainMod.MCID)+' and id= '+
            qrisksurec.FieldByName('id').AsString   )   ;
        end;
      end
      else
      begin
        index := IdLists.IndexOf(qkaynaklar.FieldByName('kaynak_id').AsString) ;
        if index > -1  then
        begin
          IdLists.Delete(index);
            QueryExec(qTmp,' update def_data_risk_surec_eslesme set kaynak_ids='+QuotedStr(IdLists.CommaText)+' WHERE mc_id='+inttostr(MainMod.MCID)+' and id= '+
            qrisksurec.FieldByName('id').AsString   )   ;
        end;
      end;
      RefreshQuery(qrisksurec);
    finally
     IdLists.Free;
    end;
  end;
end;

procedure TfrmRiskSurecTanim.UniFormBeforeShow(Sender: TObject);
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

procedure TfrmRiskSurecTanim.UniFormCreate(Sender: TObject);
begin
  QueryOpen(qkategori,'SELECT * FROM sys_modul_parameter WHERE module=''RÝSK ANALÝZÝ'' and main_parameter=''RÝSK KATEGORÝ'' ORDER BY subid') ;

end;

end.
