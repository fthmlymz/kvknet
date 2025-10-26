unit unRiskListeSurec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPanel, Data.DB, MemDS,
  DBAccess, Uni, uniBasicGrid, uniDBGrid, uniDBComboBox, uniDBLookupComboBox,
  uniMultiItem, uniComboBox, Vcl.StdCtrls, uniEdit, uniButton, uniLabel,
  uniBitBtn;

type
  TfrRiskLiseSurec = class(TUniFrame)
    pnlbaslik: TUniPanel;
    pnlliste: TUniPanel;
    pnledit: TUniPanel;
    pnlbutton: TUniPanel;
    cbseviye: TUniComboBox;
    cbdurum: TUniComboBox;
    UniDBGrid1: TUniDBGrid;
    qdata: TUniQuery;
    dsdata: TUniDataSource;
    btnSearch: TUniBitBtn;
    UniLabel6: TUniLabel;
    edSrcText: TUniEdit;
    UniLabel3: TUniLabel;
    btnAdd: TUniBitBtn;
    btnEdit: TUniBitBtn;
    cbSrcType: TUniComboBox;
    UniLabel4: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure cbseviyeChange(Sender: TObject);
    procedure cbdurumChange(Sender: TObject);
    procedure edSrcTextAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
  private
//    procedure NewSQL;
  public
     procedure NewSQL;
  end;

implementation

{$R *.dfm}
uses MainModule, ServerModule, McMLib,unRiskUtls//, Main, unHelpPage
, unRiskSurecTanim;

procedure TfrRiskLiseSurec.btnAddClick(Sender: TObject);
begin
  if frmRiskSurecTanim.Exec() = mrOk then
    NewSQL;
end;

procedure TfrRiskLiseSurec.btnEditClick(Sender: TObject);
begin
  if qdata.IsEmpty then exit;

    if frmRiskSurecTanim.Exec(qdata.FieldByName('id').AsString,EtTekDegistirme) = mrOk then
    NewSQL;
end;

procedure TfrRiskLiseSurec.btnSearchClick(Sender: TObject);
begin
NewSQL;
end;

procedure TfrRiskLiseSurec.cbdurumChange(Sender: TObject);
begin
NewSQL;
end;

procedure TfrRiskLiseSurec.cbseviyeChange(Sender: TObject);
begin
NewSQL;
end;

procedure TfrRiskLiseSurec.edSrcTextAjaxEvent(Sender: TComponent;
  EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then
    NewSQL;
end;

procedure TfrRiskLiseSurec.NewSQL;
var
	SQLStr :string  ;
  WhereStr : string;
  srctext : string;
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

	SQLStr   := ' SELECT * FROM (SELECT u.full_name sorumlusu, '+
  ' r.id ,  r.mc_id ,  r.risk ,  r.aciklama ,  r.kategori ,  r.olasilik ,  r.etki ,  r.seviye , ' +
  ' r.periyot_birimi ,  r.onlem ,   r.durum ,  r.idy ,  r.idt ,  r.sdy ,  r.sdt , ' +
  ' r.periyot_miktari ,  r.metot ,  r.frekans ,  r.farkedilebilirlik ,  r.gozden_gecirme_tar ,  r.Sorumlu_id, '  +

  EnumDegeriIcinCaseIfadesiOlustur('r.kategori',SriskKategoriler) +'skategori , '+
  EnumDegeriIcinCaseIfadesiOlustur('r.durum',SriskDurum) +  ' sdurum ,' +
  EnumDegeriIcinCaseIfadesiOlustur('r.metot', SriskHesapMetod) + ' smetot ,'+
  ' case when r.metot = 1  then '+
  EnumDegeriIcinCaseIfadesiOlustur('r.olasilik',SriskOlasilik) +
  '  when r.metot = 2  then '+
  EnumDegeriIcinCaseIfadesiOlustur('r.olasilik',SriskOlasilik) +
  '  when r.metot =3 then ' +
  EnumDegeriIcinCaseIfadesiOlustur('r.olasilik',SRiskOlasilikFk) + ' end solasilik ,'+
  ' case when r.metot = 1  then '+
  EnumDegeriIcinCaseIfadesiOlustur('r.etki',SriskOlasilik) +
  '  when r.metot = 2  then '+
  EnumDegeriIcinCaseIfadesiOlustur('r.etki',SriskOlasilik) +
  '  when r.metot =3 then ' +
  EnumDegeriIcinCaseIfadesiOlustur('r.etki',SRiskOlasilikFk) + ' end setki ,'+
  EnumDegeriIcinCaseIfadesiOlustur('r.frekans', SRiskFrekansFk) + '  sfrekans ,' +
  EnumDegeriIcinCaseIfadesiOlustur('r.farkedilebilirlik', SRiskFrekansFk) + '  sfarkedilebilirlik ,' +
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
  ' end sseviye ' +

  ' FROM def_data_risk r left join usr_user u on u.mc_id=r.mc_id and u.id=r.sorumlu_id ) detail ';

	WhereStr := 'detail.mc_id =:mc_id ' ;


  if cbdurum.ItemIndex > -1 then
    WhereStr := WhereStr + ' and detail.durum = ' + IntToStr(ComboboxEnumDegerAl(cbdurum, SriskDurum));
  if cbseviye.ItemIndex > -1 then
    WhereStr  := WhereStr + ' and detail.sseviye like ''%'+ cbseviye.Text +'%''';
  if edSrcText.Text <> '' then
   begin
    case cbSrcType.ItemIndex of
      0: WhereStr := WhereStr + ' and detail.risk like :srctext ';
      1: WhereStr := WhereStr + ' and detail.smetot like :srctext ';
      2: WhereStr := WhereStr + ' and detail.solasilik like :srctext ';
      3: WhereStr := WhereStr + ' and detail.setki like :srctext ';
      4: WhereStr := WhereStr + ' and detail.sfrekans like :srctext ';
      5: WhereStr := WhereStr + ' and detail.sfarkedilebilirlik like :srctext ';
      6: WhereStr := WhereStr + ' and detail.sorumlusu like :srctext ';
    end;
   end;
  qdata.SQL.Text := SQLStr +' where  '+ WhereStr;

  qdata.ParamByName('mc_id').AsString := inttostr(mainmod.MCID);
  if qdata.FindParam('srctext') <> nil then
    qdata.ParamByName('srctext').AsString := srctext ;

  qdata.Open;


end;

procedure TfrRiskLiseSurec.UniFrameCreate(Sender: TObject);
var
  Kategori: TRiskKategoriler;
  Durum : TRiskDurum;
  etki : TRiskEtki;
  olasilik : TRiskOlasilik ;
  seviye : TRiskSeviyesi;
begin
// kategori
//  cbKategori.Items.Clear;
//  for Kategori := Low(TriskKategoriler) to High(TRiskKategoriler) do
//    cbKategori.Items.Add(SriskKategoriler[Kategori]);
  //etki
//  cbEtki.Items.Clear;
//  for etki := Low(trisketki) to High(trisketki) do
//    cbEtki.Items.Add(SRiskEtki[etki]);
  // durum
  cbdurum.Items.Clear;
  for durum := low(Triskdurum) to High(triskdurum) do
    cbdurum.Items.Add(SriskDurum[durum]);
  cbdurum.ItemIndex :=0;
  // olasýlýk
//  for olasilik := Low(triskolasilik) to High(triskolasilik) do
//    cbolasilik.Items.Add(SriskOlasilik[olasilik]);
  cbseviye.Items.Clear;
  for seviye := Low(TRiskSeviyesi) to High(TRiskSeviyesi)  do
    cbseviye.Items.Add(sRiskSeviyesi[seviye]) ;

    btnAdd.Visible := MainMod.LoginInfo.Yetkiler[198] ;
    btnEdit.Visible := mainmod.LoginInfo.Yetkiler[199] ;



    NewSQL;
end;

initialization
  RegisterClass(TfrRiskLiseSurec);

end.
