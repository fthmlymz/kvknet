unit unRiskSurecMevcutDurum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniEdit, uniLabel, uniMultiItem, uniComboBox,
  uniGUIBaseClasses, uniPanel, uniButton, uniBitBtn, uniBasicGrid, uniDBGrid,
  Data.DB, DBAccess, Uni, MemDS, unRiskUtls,math, uniRadioGroup,strutils;

type
  TfrRiskSurecMevcutDurum = class(TUniFrame)
    pnlbaslik: TUniPanel;
    pnledit: TUniPanel;
    pnlbutton: TUniPanel;
    btnSearch: TUniBitBtn;
    pnlliste: TUniPanel;
    grd: TUniDBGrid;
    qdata: TUniQuery;
    dsdata: TUniDataSource;
    UniLabel4: TUniLabel;
    cbSrcType: TUniComboBox;
    cbdurum: TUniComboBox;
    UniLabel6: TUniLabel;
    edSrcText: TUniEdit;
    cbseviye: TUniComboBox;
    btnGzdGListe: TUniBitBtn;
    btnGzdGecir: TUniBitBtn;
    cbSK: TUniComboBox;
    pnlcolors: TUniPanel;
    UniPanel1: TUniPanel;
    clrdusuk: TUniLabel;
    UniPanel2: TUniPanel;
    UniLabel1: TUniLabel;
    UniPanel3: TUniPanel;
    UniLabel2: TUniLabel;
    UniPanel4: TUniPanel;
    UniLabel5: TUniLabel;
    UniPanel5: TUniPanel;
    UniLabel7: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure grdDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure grdColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure btnSearchClick(Sender: TObject);
    procedure btnGzdGListeClick(Sender: TObject);
    procedure btnGzdGecirClick(Sender: TObject);
    procedure cbseviyeChange(Sender: TObject);
    procedure cbSKChange(Sender: TObject);
    procedure cbdurumChange(Sender: TObject);
    procedure edSrcTextAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
  private
    procedure newsql;
    procedure renkkodlariHelp;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses McMLib, MainModule, unRiskSurecTanim, UnRiskGozdengecirmeListe;



procedure TfrRiskSurecMevcutDurum.btnGzdGecirClick(Sender: TObject);
begin
 if qdata.IsEmpty then exit;
    if frmRiskSurecTanim.Exec(qdata.FieldByName('risk_id').AsString,EtTekDegistirme,true) = mrOk then
     NewSQL;
end;

procedure TfrRiskSurecMevcutDurum.btnGzdGListeClick(Sender: TObject);
var
GozdenGecirmeId :integer;
begin
 if qdata.IsEmpty then exit;

  if frmRiskGozdengecirmeListe.Exec(qdata.FieldByName('risk_id').AsString,GozdenGecirmeId)= mrOk   then
  begin
    if GozdenGecirmeId >0 then
      begin
         frmRiskSurecTanim.ExecGozdenGecirme(qdata.FieldByName('risk_id').AsString , inttostr(GozdenGecirmeId));
      end;
  end;

end;

procedure TfrRiskSurecMevcutDurum.btnSearchClick(Sender: TObject);
begin
 newsql;
end;

procedure TfrRiskSurecMevcutDurum.cbdurumChange(Sender: TObject);
begin
newsql;
end;

procedure TfrRiskSurecMevcutDurum.cbseviyeChange(Sender: TObject);
begin
newsql;
end;

procedure TfrRiskSurecMevcutDurum.cbSKChange(Sender: TObject);
begin
newsql;
end;

procedure TfrRiskSurecMevcutDurum.edSrcTextAjaxEvent(Sender: TComponent;
  EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then
    newsql;
end;

procedure TfrRiskSurecMevcutDurum.grdColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;
  if Direction then Dir := 'ASC' else Dir := 'DESC';
  qdata.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;

end;

procedure TfrRiskSurecMevcutDurum.grdDrawColumnCell(Sender: TObject;
  ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
var
  RiskValue: TRiskSeviyesi;
  RiskStr : string;

begin

 // if Column.FieldName = 'strseviye' then
  begin
    if StrToIntDef( grd.DataSource.DataSet.FieldByName('seviye').AsString,0)>0 then
    begin
      RiskValue := GetRiskSeviyesi(RiskStr, StrToIntDef( grd.DataSource.DataSet.FieldByName('seviye').AsString,0),RhmLTipiMatris);
      Attribs.Color := CRiskColors[RiskValue];
      Attribs.Font.Style := [fsBold];
    end else
    begin
      Attribs.Color := clInfoBk;
      Attribs.Font.Style := [];
    end;
  end;


end;
procedure TfrRiskSurecMevcutDurum.newsql;
var
 sqlstr: string;
 wherestr : string;
 SrcText : string;
begin

    if not GuvenliGirisMi(edSrcText.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;

  if edSrcText.Text <> '' then
  begin
    if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
  end;

  sqlstr := 'SELECT * FROM (SELECT distinct r.gozden_gecirme_tar, r.id risk_id, r.mc_id, '+
  ifthen(cbsk.ItemIndex=0, ' s.surec surec_kaynak,  ','s.kaynak surec_kaynak,')+
  ' r.risk,r.aciklama,r.durum,r.kategori,r.olasilik,r.etki,r.seviye,r.metot, '+
  EnumDegeriIcinCaseIfadesiOlustur('r.metot', SriskHesapMetod) + ' strmetot ,'+
  EnumDegeriIcinCaseIfadesiOlustur('r.kategori',SriskKategoriler) +'strkategori , '+
  EnumDegeriIcinCaseIfadesiOlustur('r.durum',SriskDurum) +  ' strdurum ,' +
  ' case when r.metot = 1  then '+
  EnumDegeriIcinCaseIfadesiOlustur('r.olasilik',SriskOlasilik) +
  '  when r.metot = 2  then '+
  EnumDegeriIcinCaseIfadesiOlustur('r.olasilik',SriskOlasilik) +
  '  when r.metot =3 then ' +
  EnumDegeriIcinCaseIfadesiOlustur('r.olasilik',SRiskOlasilikFk) + ' end strolasilik ,'+
  ' case when r.metot = 1  then '+
  EnumDegeriIcinCaseIfadesiOlustur('r.etki',SriskOlasilik) +
  '  when r.metot = 2  then '+
  EnumDegeriIcinCaseIfadesiOlustur('r.etki',SriskOlasilik) +
  '  when r.metot =3 then ' +
  EnumDegeriIcinCaseIfadesiOlustur('r.etki',SRiskOlasilikFk) + ' end stretki ,'+
  EnumDegeriIcinCaseIfadesiOlustur('r.frekans', SRiskFrekansFk) + '  strfrekans ,' +
  EnumDegeriIcinCaseIfadesiOlustur('r.farkedilebilirlik', SRiskFrekansFk) + '  strfarkedilebilirlik ,' +
  ' case  when r.metot =1 then ' +
  ' (case ' +
  ' when r.seviye < 5  then  ''DÜÞÜK RÝSK'' ' +
  ' when r.seviye >= 5 and r.seviye <= 10 then  ''KABUL EDÝLEBÝLÝR RÝSK'' ' +
  ' when r.seviye >= 11 and r.seviye <= 15 then ''ORTA RÝSK'' ' +
  ' when r.seviye >= 16 and r.seviye <= 20 then ''YÜKSEK RÝSK'' ' +
  ' when r.seviye > 21  then ''KRÝTÝK RÝSK'' ' +
  ' end) ' +
  ' when r.metot =2  then ' +
  ' (case when r.seviye <25 THEN ''DÜÞÜK RÝSK'' ' +
  ' when r.seviye >=25 and r.seviye <= 50  THEN ''KABUL EDÝLEBÝLÝR RÝSK'' ' +
  ' when r.seviye >= 50 and r.seviye <= 75 THEN ''ORTA RÝSK'' ' +
  ' when r.seviye >= 75 and r.seviye <= 100 THEN ''YÜKSEK RÝSK'' ' +
  ' when r.seviye > 100 THEN ''KRÝTÝK RÝSK'' ' +
  ' end) ' +
  ' when r.metot =3  then ' +
  ' (case when r.seviye <200 THEN ''DÜÞÜK RÝSK'' ' +
  ' when r.seviye >=200 and r.seviye <= 400  THEN ''KABUL EDÝLEBÝLÝR RÝSK'' ' +
  ' when r.seviye >= 400 and r.seviye <= 600 THEN ''ORTA RÝSK'' ' +
  ' when r.seviye >= 600 and r.seviye <= 800 THEN ''YÜKSEK RÝSK'' ' +
  ' when r.seviye > 800 THEN ''KRÝTÝK RÝSK'' ' +
  ' end) ' +
  ' end strseviye, ' +
  ' case when r.risk<>'''' then case when COALESCE(at.durum,kt.durum,it.durum,0)>0 then ''VAR'' else ''YOK'' END end  tedbivar, ' +
  ' case when r.risk<>'''' then case when COALESCE(at.durum,it.durum,0) > 0 then ''DEVAM EDÝYOR'' else ''TAMAMLANDI'' END end tedbirdurum ' +
 ifthen(cbSK.ItemIndex=0 , ' from def_data_surec s ' +
  ' left join def_data_risk_surec_eslesme rs ON rs.surec_id= s.id  and rs.mc_id= s.mc_id ',
  ' from def_data_kaynak s '+
  '       left join def_data_risk_surec_eslesme rs '+
	'				on  s.id=any(string_to_array(rs.kaynak_ids, '','')::int[])and rs.mc_id= s.mc_id ' ) +
  ' left join def_data_risk r on r.id =rs.risk_id and r.mc_id=s.mc_id ' +
  ' left join def_data_risk_tedbir at on at.risk_id=rs.risk_id and at.mc_id=s.mc_id and at.durum=1 ' +
  ' left join def_data_risk_tedbir kt on kt.risk_id=rs.risk_id and kt.mc_id=s.mc_id and kt.durum=2 ' +
  ' left join def_data_risk_tedbir it on it.risk_id=rs.risk_id and it.mc_id=s.mc_id and it.durum=3' +
  ' left join sys_modul_parameter mp on mp.module=''RÝSK ANALÝZÝ'' AND MP.main_parameter=''RÝSK KATEGORÝ'' AND mp.subid=r.kategori ' +
  ifthen(cbsk.ItemIndex=1,' left join def_data_kaynak ky on ky.id=any(string_to_array(rs.kaynak_ids, '','')::int[]) ')+
  ' ) tl' ;

  wherestr :=  '  mc_id=:mc_id ' ;


  if cbdurum.ItemIndex > -1 then
    WhereStr := WhereStr + ' and durum =:durum ';
  if cbseviye.ItemIndex > -1 then
    WhereStr  := WhereStr + ' and strseviye like :strseviye ';
  if edSrcText.Text <> '' then
   begin
    case cbSrcType.ItemIndex of
      0: WhereStr := WhereStr + ' and risk like :srctext ';
      1: WhereStr := WhereStr + ' and strmetot like :srctext ';
      2: WhereStr := WhereStr + ' and strolasilik like :srctext ';
      3: WhereStr := WhereStr + ' and stretki like :srctext ';
      4: WhereStr := WhereStr + ' and strfrekans like :srctext ';
      5: WhereStr := WhereStr + ' and strfarkedilebilirlik like :srctext ';
      6: WhereStr := WhereStr + ' and sorumlu like :srctext ';
    end;
   end;
  sqlstr := SQLStr +' where  '+ WhereStr;

   grd.Columns[grd.ColumnByName('surec_kaynak').Index ].Title.Caption := ifthen(cbsk.ItemIndex=0,'Süreç', 'Kaynak');
  //QueryOpen(qdata,sqlstr);
  qdata.SQL.Text := sqlstr ;
  qdata.ParamByName('mc_id').AsString := inttostr(mainmod.MCID);
  if qdata.FindParam('durum') <> nil then
    qdata.ParamByName('durum').AsString := IntToStr(ComboboxEnumDegerAl(cbdurum, SriskDurum));
  if qdata.FindParam('strseviye') <> nil then
    qdata.ParamByName('strseviye').AsString := '%'+ cbseviye.Text +'%';
  if qdata.FindParam('srctext') <> nil then
    qdata.ParamByName('srctext').AsString := SrcText;
  qdata.Open;
end;

procedure TfrRiskSurecMevcutDurum.renkkodlariHelp;

var
  RiskSeviye: TRiskSeviyesi;
begin
//clrYuksek.Caption := sRiskSeviyesi[rsyuksek];
//clrYuksek.Color := CRiskColors[rsyuksek];
//  for RiskSeviye := Low(TRiskSeviyesi) to High(TRiskSeviyesi) do
//  begin
//    NewLabel.Caption := sRiskSeviyesi[RiskSeviye];
//    NewLabel.Font.Color := clWhite;
//    NewLabel.Color := CRiskColors[RiskSeviye];
//  end;
end;

procedure TfrRiskSurecMevcutDurum.UniFrameCreate(Sender: TObject);
var
durum : TRiskDurum;
seviye : TRiskSeviyesi;
begin

    btnGzdGecir.Visible := MainMod.LoginInfo.Yetkiler[203];

  cbdurum.Items.Clear;
  for durum := low(Triskdurum) to High(triskdurum) do
    cbdurum.Items.Add(SriskDurum[durum]);
  cbdurum.ItemIndex:=0;
  // olasýlýk
//  for olasilik := Low(triskolasilik) to High(triskolasilik) do
//    cbolasilik.Items.Add(SriskOlasilik[olasilik]);
  cbseviye.Items.Clear;
  for seviye := Low(TRiskSeviyesi) to High(TRiskSeviyesi)  do
    cbseviye.Items.Add(sRiskSeviyesi[seviye]) ;

  // olasýlýk
//  for olasilik := Low(triskolasilik) to High(triskolasilik) do
//    cbolasilik.Items.Add(SriskOlasilik[olasilik]);
  cbseviye.Items.Clear;
  for seviye := Low(TRiskSeviyesi) to High(TRiskSeviyesi)  do
    cbseviye.Items.Add(sRiskSeviyesi[seviye]) ;

 newsql;
// renkkodlariHelp  ;
end;

initialization
 RegisterClass(TfrRiskSurecMevcutDurum);
end.
