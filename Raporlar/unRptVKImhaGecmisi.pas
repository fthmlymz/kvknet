unit unRptVKImhaGecmisi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, System.Actions, Vcl.ActnList, uniButton, uniBitBtn, uniGUIBaseClasses,
  uniPanel, Data.DB, MemDS, DBAccess, Uni, uniDateTimePicker, uniLabel, uniBasicGrid, uniDBGrid,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report, FlexCel.Render,
  uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniEdit;

type
  TfrRptVKImhaGecmisi = class(TUniFrame)
    pnlTop: TUniPanel;
    btnSearch: TUniBitBtn;
    btnClose: TUniBitBtn;
    ActList: TActionList;
    actSearch: TAction;
    actClose: TAction;
    qTmp: TUniQuery;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    edBasTarih: TUniDateTimePicker;
    edBitTarih: TUniDateTimePicker;
    qImha: TUniQuery;
    dsImha: TUniDataSource;
    UniDBGrid1: TUniDBGrid;
    actExcel: TAction;
    btnExcel: TUniBitBtn;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    edVeriKaynagi: TUniEdit;
    edAdiSoyadi: TUniEdit;
    edCepTel: TUniEdit;
    btnHelp: TUniBitBtn;
    procedure UniFrameCreate(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure actExcelExecute(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure edAdiSoyadiAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
    procedure edVeriKaynagiAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
    procedure edCepTelAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
  private
    procedure PrepareReport(Date1, Date2: TDate);
    // Yazdýrma Yetkisi : 98 olarbiler
  public
  end;

implementation

{$R *.dfm}

uses MainModule, McMLib, Main, ServerModule, unHelpPage;

procedure TfrRptVKImhaGecmisi.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrRptVKImhaGecmisi.actExcelExecute(Sender: TObject);
var
  Report  : TFlexCelReport;
  FName   : String;
  TmpName : String;
  FUrl    : String;
begin
  if not MainMod.LoginInfo.Yetkiler[129] then  {TODO: Excel yetki no Veri Ýmha}
  begin
    MessageDlg('Doküman indirme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if qImha.RecordCount= 0 then Exit;

  Report := TFlexCelReport.Create(True);
  try
    Report.AddTable('tbllist', qImha);
    FUrl    := '';
    FName   := 'Veri_Imha_Gecmisi_Raporu';
    TmpName := ServerMod.NewCacheFileUrl(False, 'xlsx', FName, '', FUrl, True);
    Report.Run(ServerMod.FilesFolderPath + 'temp_xls\rpt_veriimhagecmisi.template.xlsx', TmpName);
  finally
    Report.Free;
  end;

  UniSession.SendFile(TmpName, FName + '.xlsx');
end;

procedure TfrRptVKImhaGecmisi.actSearchExecute(Sender: TObject);
var
  Trh1, Trh2 : TDate;
begin
  Trh1 := Trunc(edBasTarih.DateTime);
  Trh2 := Trunc(edBitTarih.DateTime);

  if Trh1 > Trh2 then
  begin
    MessageDlg('Baþlangýç Tarihi, Bitiþ Tarihinden büyük olamaz. Lütfen kontrol ediniz.', mtError, [mbOk]);
    Exit;
  end;

  PrepareReport(Trh1, Trh2);
end;

procedure TfrRptVKImhaGecmisi.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('RptVKImhaGecmisi');
end;

procedure TfrRptVKImhaGecmisi.edAdiSoyadiAjaxEvent(Sender: TComponent;
  EventName: string; Params: TUniStrings);
var
  Trh1, Trh2 : TDate;
begin
  Trh1 := Trunc(edBasTarih.DateTime);
  Trh2 := Trunc(edBitTarih.DateTime);
  if EventName = 'doSearch' then PrepareReport(Trh1, Trh2);
end;

procedure TfrRptVKImhaGecmisi.edCepTelAjaxEvent(Sender: TComponent;
  EventName: string; Params: TUniStrings);
var
  Trh1, Trh2 : TDate;
begin
  Trh1 := Trunc(edBasTarih.DateTime);
  Trh2 := Trunc(edBitTarih.DateTime);
  if EventName = 'doSearch' then PrepareReport(Trh1, Trh2);
end;

procedure TfrRptVKImhaGecmisi.edVeriKaynagiAjaxEvent(Sender: TComponent;
  EventName: string; Params: TUniStrings);
var
  Trh1, Trh2 : TDate;
begin
  Trh1 := Trunc(edBasTarih.DateTime);
  Trh2 := Trunc(edBitTarih.DateTime);
  if EventName = 'doSearch' then PrepareReport(Trh1, Trh2);
end;

procedure TfrRptVKImhaGecmisi.PrepareReport(Date1, Date2: TDate);
var
  Trh1, Trh2 : String;
  fltr: String;
  SQLstr : string;
begin

  if not GuvenliGirisMi(edVeriKaynagi.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;
    if not GuvenliGirisMi(edAdiSoyadi.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;
    if not GuvenliGirisMi(edCepTel.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;

  Trh1 := FormatDateTime('dd.mm.yyyy', Date1);
  Trh2 := FormatDateTime('dd.mm.yyyy', Date2);
  fltr := ' ';
  if edAdiSoyadi.Text <> '' then
    fltr := fltr + ' and ar.ad_soyad like :ad_soyad ';
  if edCepTel.Text <> '' then
    fltr := fltr + ' and ar.gsmno like :gsmno ';
  if edVeriKaynagi.Text <> '' then
    fltr := fltr + ' and vk.kaynak_str like :kaynak_str ';

  ShowMask('Lütfen bekleyiniz...');
  UniSession.Synchronize;
  SQLstr := 'SELECT * FROM ( ' +
                   '  (SELECT ar.id AS ref_no, ''NORMAL''::character varying (10) AS onem, ayd.tanim AS aydinlatma, kisi.kisi, ar.durum AS ar_durum, ' +
                   '    ar.ad_soyad, ar.gsmno, ar.tarih, null::DATE AS bit_tarih, vk.kaynak_str, vk.sakl_tip, vk.sakl_str, vk.bitis_tarihi, vk.durum AS vk_durum, vk.imha_tarihi ' +
                   '  FROM data_acikriza_vk vk ' +
                   '    LEFT JOIN data_acikriza ar ON ar.id = vk.ar_id ' +
                   '    LEFT JOIN def_data_aydinlatma ayd ON ayd.id = vk.ayd_id ' +
                   '    LEFT JOIN def_data_kisi kisi ON kisi.id = vk.kisi_id ' +
                   '  WHERE vk.durum = ''ÝMHA EDÝLDÝ'' AND ' + //ar.durum = ''AKTÝF'' AND ' +
                   '    vk.imha_tarihi BETWEEN ''' + Trh1 + ''' AND ''' + Trh2 + ''' AND vk.mc_id =:mc_id ' + fltr +
                   '  ORDER BY ar.id) ' +
{                   'UNION ALL ' +
                   '  SELECT ar.id AS ref_no, ''ACÝL''::character varying (10) AS onem, ayd.tanim AS aydinlatma, kisi.kisi, ar.durum AS ar_durum, ' +
                   '    ar.ad_soyad, ar.gsmno, ar.tarih, null::DATE AS bit_tarih, vk.kaynak_str, vk.sakl_tip, vk.sakl_str, vk.bitis_tarihi, vk.durum AS vk_durum, vk.imha_tarihi ' +
                   '  FROM data_acikriza_vk vk ' +
                   '    LEFT JOIN data_acikriza ar ON ar.id = vk.ar_id ' +
                   '    LEFT JOIN def_data_aydinlatma ayd ON ayd.id = vk.ayd_id ' +
                   '    LEFT JOIN def_data_kisi kisi ON kisi.id = vk.kisi_id ' +
                   '  WHERE vk.durum <> ''ÝMHA EDÝLDÝ'' AND ' + // ar.durum = ''AKTÝF'' AND ' +
                   '    vk.ar_id in ( ' +
                   '  (SELECT ar.id ' +
                   '  FROM data_acikriza_vk vk ' +
                   '    LEFT JOIN data_acikriza ar ON ar.id = vk.ar_id ' +
                   '    LEFT JOIN def_data_aydinlatma ayd ON ayd.id = vk.ayd_id ' +
                   '    LEFT JOIN def_data_kisi kisi ON kisi.id = vk.kisi_id ' +
                   '  WHERE vk.durum = ''ÝMHA EDÝLDÝ'' AND ' +
                   '    vk.imha_tarihi BETWEEN ''' + Trh1 + ''' AND ''' + Trh2 + ''' AND vk.mc_id = ' + IntToStr(MainMod.MCID) + fltr +
                   '  )) ' +  } //bu bölümde belge ile ayný açýk rýzadaki iptal olmayan belgeler vardý, gereksiz bulunduðu için kaldýrýldý
                   ') AS X ';

   qImha.SQL.Text := SQLstr ;
   qImha.ParamByName('mc_id').AsString := inttostr(mainmod.MCID);
   if qimha.FindParam('ad_soyad') <> nil then
    qimha.ParamByName('ad_soyad').AsString := '%' + edadisoyadi.Text + '%';
   if qimha.FindParam('gsmno') <> nil then
    qimha.ParamByName('gsmno').AsString :=  '%' + edCepTel.Text + '%';
   if qimha.FindParam('kaynak_str') <> nil then
    qimha.ParamByName('kaynak_str').AsString :=  '%' + edVeriKaynagi.Text + '%';


   qImha.Open;
  HideMask;
end;

procedure TfrRptVKImhaGecmisi.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
begin
  if SameText(Column.FieldName, 'ref_no') then begin end;
end;

procedure TfrRptVKImhaGecmisi.UniFrameCreate(Sender: TObject);
begin
  edBasTarih.DateTime := Date - 90;
  edBitTarih.DateTime := Date;
end;

initialization
  RegisterClass(TfrRptVKImhaGecmisi);

end.
