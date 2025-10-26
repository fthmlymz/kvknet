unit unRptVerbisListeler;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIFrame, System.Actions,
  Vcl.ActnList, Data.DB, DBAccess, Uni, uniButton, uniBitBtn, uniEdit,
  uniMultiItem, uniComboBox, uniLabel, uniGUIBaseClasses, uniPanel, uniBasicGrid,
  uniDBGrid, MemDS, VirtualTable, VirtualQuery, uniDBTreeGrid, VCL.FlexCel.Core,
  FlexCel.XlsAdapter, FlexCel.Report, FlexCel.Render, uniPageControl;

type
  TfrRptVerbisListeler = class(TUniFrame)
    ActList: TActionList;
    actSearch: TAction;
    actClose: TAction;
    pnlTop: TUniPanel;
    btnSearch: TUniBitBtn;
    btnClose: TUniBitBtn;
    tblVTipi: TVirtualTable;
    dsVTipi: TUniDataSource;
    qTmp: TUniQuery;
    qVTipi: TVirtualQuery;
    actExcel: TAction;
    btnExcel: TUniBitBtn;
    UniPageControl1: TUniPageControl;
    tsVeriKategori: TUniTabSheet;
    gridVeriKategorileri: TUniDBGrid;
    tsAmac: TUniTabSheet;
    tblAmac: TVirtualTable;
    qAmac: TVirtualQuery;
    dsAmac: TUniDataSource;
    qKategori: TUniQuery;
    gridAmac: TUniDBGrid;
    tsAktarimAlici: TUniTabSheet;
    gridAktarimAlici: TUniDBGrid;
    tsSaklamaSuresi: TUniTabSheet;
    qSure: TVirtualQuery;
    dsSure: TUniDataSource;
    tblSure: TVirtualTable;
    gridSaklamaSuresi: TUniDBGrid;
    tsVeriKonusuKisi: TUniTabSheet;
    tblKisi: TVirtualTable;
    qKisi: TVirtualQuery;
    dsKisi: TUniDataSource;
    gridVeriKonusuKisi: TUniDBGrid;
    tblYabanci: TVirtualTable;
    qYabanci: TVirtualQuery;
    dsYabanci: TUniDataSource;
    tsAktarimYabanci: TUniTabSheet;
    gridAktarimYabanci: TUniDBGrid;
    tsGuvenlikTedbir: TUniTabSheet;
    tblTedbir: TVirtualTable;
    qTedbir: TVirtualQuery;
    dsTedbir: TUniDataSource;
    gridGuvenlikTedbir: TUniDBGrid;
    tblAlici: TVirtualTable;
    qAlici: TVirtualQuery;
    dsAlici: TUniDataSource;
    UniLabel1: TUniLabel;
    edTarihSec: TUniComboBox;
    btnArsivle: TUniBitBtn;
    qArchive: TUniQuery;
    btnHelp: TUniBitBtn;
    procedure UniFrameCreate(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure gridVeriKategorileriColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure pnlTopAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure actExcelExecute(Sender: TObject);
    procedure gridAmacColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure gridSaklamaSuresiColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure gridVeriKonusuKisiColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure gridAktarimYabanciColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure gridGuvenlikTedbirColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure gridAktarimAliciColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure btnArsivleClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    rapor_tarihi: TDateTime;
    procedure PrepareReportVeriKategori;
    procedure PrepareReportVeriAmaci;
    procedure PrepareReportVeriAktarimAlici;
    procedure PrepareReportVeriSaklamaSuresi;
    procedure PrepareReportVeriKonusuKisi;
    procedure PrepareReportVeriAktarimYabanci;
    procedure PrepareReportVeriGuvenligitedbirleri;
    procedure ExportReportVeriKategori;
    procedure ExportReportVeriAmaci;
    procedure ExportReportVeriAktarimAlici;
    procedure ExportReportVeriSaklamaSuresi;
    procedure ExportReportVeriKonusuKisi;
    procedure ExportReportVeriAktarimYabanci;
    procedure ExportReportVeriGuvenligitedbirleri;
    procedure ArchiveReport;
    // Yazdýrma Yetkisi : 100 olarbiler
  public
  end;

implementation

{$R *.dfm}

uses
  MainModule, McMLib, Main, ServerModule, unHelpPage;

procedure TfrRptVerbisListeler.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrRptVerbisListeler.actExcelExecute(Sender: TObject);
begin
  if not MainMod.LoginInfo.Yetkiler[101] then  {TODO: Excel yetki no Veri Tipleri}
  begin
    MessageDlg('Doküman indirme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if uniPageControl1.activePage = tsVeriKategori then
    ExportReportVeriKategori;
  if uniPageControl1.activePage = tsAmac then
    ExportReportVeriAmaci;
  if uniPageControl1.activePage = tsAktarimAlici then
    ExportReportVeriAktarimAlici;
  if uniPageControl1.activePage = tsSaklamaSuresi then
    ExportReportVeriSaklamaSuresi;
  if uniPageControl1.activePage = tsVeriKonusuKisi then
    ExportReportVeriKonusuKisi;
  if uniPageControl1.activePage = tsAktarimYabanci then
    ExportReportVeriAktarimYabanci;
  if uniPageControl1.activePage = tsGuvenlikTedbir then
    ExportReportVeriGuvenligitedbirleri;
end;

procedure TfrRptVerbisListeler.actSearchExecute(Sender: TObject);
begin
  if edTarihSec.Text = 'BUGÜN' then
  begin
    rapor_tarihi := trunc(now);
    btnArsivle.Enabled := true;
  end
  else
  begin
    rapor_tarihi := strtodatetime(edTarihSec.Text);
    btnArsivle.Enabled := false;
  end;
  ShowMask('Lütfen Bekleyiniz...');
  UniSession.Synchronize;
//  if uniPageControl1.activePage = tsVeriKategori then
  PrepareReportVeriKategori;
//  if uniPageControl1.activePage = tsAmac then
  PrepareReportVeriAmaci;
//  if uniPageControl1.activePage = tsAktarimAlici then
  PrepareReportVeriAktarimAlici;
//  if uniPageControl1.activePage = tsSaklamaSuresi then
  PrepareReportVeriSaklamaSuresi;
//  if uniPageControl1.activePage = tsVeriKonusuKisi then
  PrepareReportVeriKonusuKisi;
//  if uniPageControl1.activePage = tsAktarimYabanci then
  PrepareReportVeriAktarimYabanci;
//  if uniPageControl1.activePage = tsGuvenlikTedbir then
  PrepareReportVeriGuvenligitedbirleri;
  HideMask;
end;

procedure TfrRptVerbisListeler.ArchiveReport;

  procedure ArchiveQueryOpen(tbl_name: string);
  begin
    qArchive.Close;
    qArchive.SQL.Clear;
    qArchive.SQL.Add('SELECT * FROM ' + tbl_name + ' WHERE rapor_tarihi = to_date(''' + formatdatetime('DD.MM.YYYY', rapor_tarihi) + ''', ''DD.MM.YYYY'') AND mc_id = ' + IntToStr(MainMod.MCID));
    qArchive.Open;
    while not qArchive.Eof do
    begin
      qArchive.Delete;
    end;
  end;

begin
  if rapor_tarihi <> trunc(now) then
  begin
    MessageDlg('Rapor tarihi geçmiþte kalmýþ, arþivlemek için "BUGÜN" tarihli rapor hazýrlayýnýz.', mtError, [mbOK]);
    exit;
  end;

  ArchiveQueryOpen('rpt_verbis_verikategorileri');
  qVTipi.First;
  while not qVTipi.Eof do
  begin
    qArchive.Insert;
    qArchive.FieldByName('rapor_tarihi').AsDateTime := rapor_tarihi;
    qArchive.FieldByName('mc_id').AsInteger := MainMod.MCID;
    qArchive.FieldByName('cat_id').AsString := qVTipi.FieldByName('cat_id').AsString;
    qArchive.FieldByName('cat_str').AsString := qVTipi.FieldByName('cat_str').AsString;
    qArchive.FieldByName('data_id').AsString := qVTipi.FieldByName('data_id').AsString;
    qArchive.FieldByName('data_str').AsString := qVTipi.FieldByName('data_str').AsString;
    qArchive.FieldByName('id').AsInteger := MainMod.GetSeq('sq_rpt_verbis_verikategorileri_id');
    qArcHive.Post;
    qVTipi.Next;
  end;

  ArchiveQueryOpen('rpt_verbis_veriislemeamaclari');
  qAmac.First;
  while not qAmac.Eof do
  begin
    qArchive.Insert;
    qArchive.FieldByName('rapor_tarihi').AsDateTime := rapor_tarihi;
    qArchive.FieldByName('mc_id').AsInteger := MainMod.MCID;
    qArchive.FieldByName('cat_id').AsString := qAmac.FieldByName('cat_id').AsString;
    qArchive.FieldByName('cat_str').AsString := qAmac.FieldByName('cat_str').AsString;
    qArchive.FieldByName('data_id').AsString := qAmac.FieldByName('data_id').AsString;
    qArchive.FieldByName('data_str').AsString := qAmac.FieldByName('data_str').AsString;
    qArchive.FieldByName('id').AsInteger := MainMod.GetSeq('sq_rpt_verbis_veriislemeamaclari_id');
    qArcHive.Post;
    qAmac.Next;
  end;

  ArchiveQueryOpen('rpt_verbis_veriaktarimalicilar');
  qAlici.First;
  while not qAlici.Eof do
  begin
    qArchive.Insert;
    qArchive.FieldByName('rapor_tarihi').AsDateTime := rapor_tarihi;
    qArchive.FieldByName('mc_id').AsInteger := MainMod.MCID;
    qArchive.FieldByName('data_id').AsString := qAlici.FieldByName('data_id').AsString;
    qArchive.FieldByName('data_str').AsString := qAlici.FieldByName('data_str').AsString;
    qArchive.FieldByName('id').AsInteger := MainMod.GetSeq('sq_rpt_verbis_veriaktarimalicilar_id');
    qArcHive.Post;
    qAlici.Next;
  end;

  ArchiveQueryOpen('rpt_verbis_verisaklamasureleri');
  qSure.First;
  while not qSure.Eof do
  begin
    qArchive.Insert;
    qArchive.FieldByName('rapor_tarihi').AsDateTime := rapor_tarihi;
    qArchive.FieldByName('mc_id').AsInteger := MainMod.MCID;
    qArchive.FieldByName('cat_id').AsString := qSure.FieldByName('cat_id').AsString;
    qArchive.FieldByName('cat_str').AsString := qSure.FieldByName('cat_str').AsString;
    qArchive.FieldByName('data_str').AsString := qSure.FieldByName('data_str').AsString;
    qArchive.FieldByName('id').AsInteger := MainMod.GetSeq('sq_rpt_verbis_verisaklamasureleri_id');
    qArcHive.Post;
    qSure.Next;
  end;

  ArchiveQueryOpen('rpt_verbis_verikonusukisiler');
  qKisi.First;
  while not qKisi.Eof do
  begin
    qArchive.Insert;
    qArchive.FieldByName('rapor_tarihi').AsDateTime := rapor_tarihi;
    qArchive.FieldByName('mc_id').AsInteger := MainMod.MCID;
    qArchive.FieldByName('cat_id').AsString := qKisi.FieldByName('cat_id').AsString;
    qArchive.FieldByName('cat_str').AsString := qKisi.FieldByName('cat_str').AsString;
    qArchive.FieldByName('data_id').AsString := qKisi.FieldByName('data_id').AsString;
    qArchive.FieldByName('data_str').AsString := qKisi.FieldByName('data_str').AsString;
    qArchive.FieldByName('id').AsInteger := MainMod.GetSeq('sq_rpt_verbis_verikonusukisiler_id');
    qArcHive.Post;
    qKisi.Next;
  end;

  ArchiveQueryOpen('rpt_verbis_yabanciulkelereaktarimlar');
  qYabanci.First;
  while not qYabanci.Eof do
  begin
    qArchive.Insert;
    qArchive.FieldByName('rapor_tarihi').AsDateTime := rapor_tarihi;
    qArchive.FieldByName('mc_id').AsInteger := MainMod.MCID;
    qArchive.FieldByName('data_id').AsString := qYabanci.FieldByName('data_id').AsString;
    qArchive.FieldByName('data_str').AsString := qYabanci.FieldByName('data_str').AsString;
    qArchive.FieldByName('id').AsInteger := MainMod.GetSeq('sq_rpt_verbis_yabanciulkelereaktarimlar_id');
    qArcHive.Post;
    qYabanci.Next;
  end;

  ArchiveQueryOpen('rpt_verbis_guvenliktedbirleri');
  qTedbir.First;
  while not qTedbir.Eof do
  begin
    qArchive.Insert;
    qArchive.FieldByName('rapor_tarihi').AsDateTime := rapor_tarihi;
    qArchive.FieldByName('mc_id').AsInteger := MainMod.MCID;
    qArchive.FieldByName('data_id').AsString := qTedbir.FieldByName('data_id').AsString;
    qArchive.FieldByName('data_str').AsString := qTedbir.FieldByName('data_str').AsString;
    qArchive.FieldByName('id').AsInteger := MainMod.GetSeq('sq_rpt_verbis_guvenliktedbirleri_id');
    qArcHive.Post;
    qTedbir.Next;
  end;

  MessageDlg('Bugün tarihli Verbis Raporlarý Arþivi kaydedildi.', TMsgDlgType.mtInformation, [mbOk]);
end;

procedure TfrRptVerbisListeler.ExportReportVeriAktarimAlici;
var
  Report: TFlexCelReport;
  FName: string;
  TmpName: string;
  FUrl: string;
begin
  if not MainMod.LoginInfo.Yetkiler[101] then  {TODO: Excel yetki no Veri Ýþleme Amaçlarý}
  begin
    MessageDlg('Doküman indirme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if qAlici.FieldByName('data_id').AsInteger < 1 then
    Exit;

  Report := TFlexCelReport.Create(True);
  try
    Report.AddTable('tbllist', qAlici);
    FUrl := '';
    FName := 'Veri_Aktarim_Alici_Gruplari_Listesi';
    TmpName := ServerMod.NewCacheFileUrl(False, 'xlsx', FName, '', FUrl, True);
    Report.Run(ServerMod.FilesFolderPath + 'temp_xls\verbis_veriaktarimalicigruplari.template.xlsx', TmpName);
  finally
    Report.Free;
  end;

  UniSession.SendFile(TmpName, FName + '.xlsx');
end;

procedure TfrRptVerbisListeler.ExportReportVeriAktarimYabanci;
var
  Report: TFlexCelReport;
  FName: string;
  TmpName: string;
  FUrl: string;
begin
  if not MainMod.LoginInfo.Yetkiler[101] then  {TODO: Excel yetki no Veri Konusu Kiþi}
  begin
    MessageDlg('Doküman indirme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if qYabanci.FieldByName('data_id').AsInteger < 1 then
    Exit;

  Report := TFlexCelReport.Create(True);
  try
    Report.AddTable('tbllist', qYabanci);
    FUrl := '';
    FName := 'Yabanci_Ulkelere_Aktarim_Listesi';
    TmpName := ServerMod.NewCacheFileUrl(False, 'xlsx', FName, '', FUrl, True);
    Report.Run(ServerMod.FilesFolderPath + 'temp_xls\verbis_yabanciulkelereaktarim.template.xlsx', TmpName);
  finally
    Report.Free;
  end;

  UniSession.SendFile(TmpName, FName + '.xlsx');
end;

procedure TfrRptVerbisListeler.ExportReportVeriAmaci;
var
  Report: TFlexCelReport;
  FName: string;
  TmpName: string;
  FUrl: string;
begin
  if not MainMod.LoginInfo.Yetkiler[101] then  {TODO: Excel yetki no Veri Ýþleme Amaçlarý}
  begin
    MessageDlg('Doküman indirme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if qAmac.FieldByName('cat_id').AsInteger < 1 then
    Exit;

  Report := TFlexCelReport.Create(True);
  try
    Report.AddTable('tbllist', qAmac);
    FUrl := '';
    FName := 'Veri_Isleme_Amaclari_Listesi';
    TmpName := ServerMod.NewCacheFileUrl(False, 'xlsx', FName, '', FUrl, True);
    Report.Run(ServerMod.FilesFolderPath + 'temp_xls\verbis_veriislemeamaclari.template.xlsx', TmpName);
  finally
    Report.Free;
  end;

  UniSession.SendFile(TmpName, FName + '.xlsx');
end;

procedure TfrRptVerbisListeler.ExportReportVeriGuvenligitedbirleri;
var
  Report: TFlexCelReport;
  FName: string;
  TmpName: string;
  FUrl: string;
begin
  if not MainMod.LoginInfo.Yetkiler[101] then  {TODO: Excel yetki no Veri Konusu Kiþi}
  begin
    MessageDlg('Doküman indirme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if qTedbir.FieldByName('data_id').AsInteger < 1 then
    Exit;

  Report := TFlexCelReport.Create(True);
  try
    Report.AddTable('tbllist', qTedbir);
    FUrl := '';
    FName := 'Veri_Guvenligi_Tedbirleri_Listesi';
    TmpName := ServerMod.NewCacheFileUrl(False, 'xlsx', FName, '', FUrl, True);
    Report.Run(ServerMod.FilesFolderPath + 'temp_xls\verbis_veriguvenligitedbirleri.template.xlsx', TmpName);
  finally
    Report.Free;
  end;

  UniSession.SendFile(TmpName, FName + '.xlsx');
end;

procedure TfrRptVerbisListeler.ExportReportVeriKategori;
var
  Report: TFlexCelReport;
  FName: string;
  TmpName: string;
  FUrl: string;
begin
  if edTarihSec.Text = 'BUGÜN' then
    QueryOpen(qTmp, 'SELECT kategori_id, fnc_tr_regular(kat.kategori) AS kategori_str, veritipi_id, fnc_tr_regular(ver.veri_tipi) AS veritipi_str ' + 'FROM data_envanter env ' + 'LEFT JOIN def_data_kategori kat ON env.kategori_id = kat.id ' + 'LEFT JOIN def_data_veritipi ver ON env.veritipi_id = ver.id ' + 'WHERE env.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) + ' ' + 'GROUP BY kategori_id, veritipi_id, kat.kategori, ver.veri_tipi ' + 'ORDER BY 1')
  else
    QueryOpen(qTmp, 'SELECT cat_id kategori_id, fnc_tr_regular(cat_str) kategori_str, data_id veritipi_id, fnc_tr_regular(data_str) veritipi_str ' + 'FROM rpt_verbis_verikategorileri WHERE rapor_tarihi=''' + edtarihsec.Text + ''' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY cat_id, data_id');

  if qTmp.FieldByName('kategori_id').AsInteger < 1 then
    Exit;

  Report := TFlexCelReport.Create(True);
  try
    Report.AddTable('tbllist', qTmp);
    FUrl := '';
    FName := 'Veri_Kategorileri_Listesi';
    TmpName := ServerMod.NewCacheFileUrl(False, 'xlsx', FName, '', FUrl, True);
    Report.Run(ServerMod.FilesFolderPath + 'temp_xls\verbis_verikategorileri.template.xlsx', TmpName);
  finally
    Report.Free;
  end;

  UniSession.SendFile(TmpName, FName + '.xlsx');
end;

procedure TfrRptVerbisListeler.ExportReportVeriKonusuKisi;
var
  Report: TFlexCelReport;
  FName: string;
  TmpName: string;
  FUrl: string;
begin
  if not MainMod.LoginInfo.Yetkiler[101] then  {TODO: Excel yetki no Veri Konusu Kiþi}
  begin
    MessageDlg('Doküman indirme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if qKisi.FieldByName('cat_id').AsInteger < 1 then
    Exit;

  Report := TFlexCelReport.Create(True);
  try
    Report.AddTable('tbllist', qKisi);
    FUrl := '';
    FName := 'Veri_Konusu_Kisi_Gruplari_Listesi';
    TmpName := ServerMod.NewCacheFileUrl(False, 'xlsx', FName, '', FUrl, True);
    Report.Run(ServerMod.FilesFolderPath + 'temp_xls\verbis_verikonusukisigruplari.template.xlsx', TmpName);
  finally
    Report.Free;
  end;

  UniSession.SendFile(TmpName, FName + '.xlsx');
end;

procedure TfrRptVerbisListeler.ExportReportVeriSaklamaSuresi;
var
  Report: TFlexCelReport;
  FName: string;
  TmpName: string;
  FUrl: string;
begin
  if not MainMod.LoginInfo.Yetkiler[101] then  {TODO: Excel yetki no Veri Saklama Süreleri}
  begin
    MessageDlg('Doküman indirme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if qSure.FieldByName('cat_id').AsInteger < 1 then
    Exit;

  Report := TFlexCelReport.Create(True);
  try
    Report.AddTable('tbllist', qSure);
    FUrl := '';
    FName := 'Veri_Saklama_Süreleri_Listesi';
    TmpName := ServerMod.NewCacheFileUrl(False, 'xlsx', FName, '', FUrl, True);
    Report.Run(ServerMod.FilesFolderPath + 'temp_xls\verbis_verisaklamasureleri.template.xlsx', TmpName);
  finally
    Report.Free;
  end;

  UniSession.SendFile(TmpName, FName + '.xlsx');
end;

procedure TfrRptVerbisListeler.pnlTopAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doResize' then
  begin
    gridVeriKategorileri.Columns[3].Width := pnlTop.Width - 30;
    gridAmac.Columns[3].Width := pnlTop.Width - 30;
    gridAktarimAlici.Columns[1].Width := pnlTop.Width - 30;
    gridSaklamaSuresi.Columns[2].Width := pnlTop.Width - 30;
    gridVeriKonusuKisi.Columns[3].Width := pnlTop.Width - 30;
    gridAktarimYabanci.Columns[1].Width := pnlTop.Width - 30;
    gridGuvenliktedbir.Columns[1].Width := pnlTop.Width - 30;
  end;
end;

procedure TfrRptVerbisListeler.PrepareReportVeriAktarimAlici;
var
  IDList: string;
begin
  tblAlici.First;
  while not tblAlici.EOF do
    tblAlici.Delete;

  if edTarihSec.Text = 'BUGÜN' then
  begin
    IDList := '';

    QueryOpen(qTmp, 'SELECT payl_taraf_ids FROM data_envanter WHERE active= ''E'' AND mc_id = ' + IntToStr(MainMod.MCID));
    while not qTmp.EOF do
    begin
      if qTmp.FieldByName('payl_taraf_ids').AsString <> '' then
        IDList := IDList + qTmp.FieldByName('payl_taraf_ids').AsString + ',';
      qTmp.Next;
    end;
    if IDList <> '' then
      System.Delete(IDList, Length(IDList), 1);

    if IDList <> '' then
    begin
      QueryOpen(qTmp, 'SELECT DISTINCT id, taraf FROM def_data_taraf WHERE id IN (' + IDList + ') ORDER BY id');
      while not qTmp.EOF do
      begin
        tblAlici.Insert;
        tblAlici.FieldByName('data_id').AsInteger := qTmp.FieldByName('id').AsInteger;
        tblAlici.FieldByName('data_str').AsString := tr_regular(qTmp.FieldByName('taraf').AsString);
        tblAlici.Post;

        qTmp.Next;
      end;
    end;
  end
  else
  begin
    QueryOpen(qTmp, 'SELECT * FROM rpt_verbis_veriaktarimalicilar WHERE rapor_tarihi=''' + edtarihsec.Text + ''' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY data_id');

    while not qTmp.EOF do
    begin
      tblAlici.Insert;
      tblAlici.FieldByName('data_id').AsInteger := qTmp.FieldByName('data_id').AsInteger;
      tblAlici.FieldByName('data_str').AsString := tr_regular(qTmp.FieldByName('data_str').AsString);
      tblAlici.Post;

      qTmp.Next;
    end;
  end;

  qAlici.Close;
  qAlici.SQL.Clear;
  qAlici.SQL.Add('SELECT * FROM tblAlici ORDER BY data_id');
  qAlici.Open;
end;

procedure TfrRptVerbisListeler.PrepareReportVeriAktarimYabanci;
begin
  tblYabanci.First;
  while not tblYabanci.EOF do
    tblYabanci.Delete;

  if edTarihSec.Text = 'BUGÜN' then
  begin
    QueryOpen(qTmp, 'SELECT kategori_id, kat.kategori AS kategori_str, count(env.id) ' + 'FROM data_envanter env ' + 'LEFT JOIN def_data_kategori kat ON env.kategori_id = kat.id ' + 'WHERE env.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) + ' ' + ' AND (payl_taraftipi IN (''YURT DIÞI'', ''Y.ÝÇÝ/Y.DIÞI'')) ' + 'GROUP BY kategori_id, kat.kategori ' + 'ORDER BY 1');

    while not qTmp.EOF do
    begin
      tblYabanci.Insert;
      tblYabanci.FieldByName('data_id').AsInteger := qTmp.FieldByName('kategori_id').AsInteger;
      tblYabanci.FieldByName('data_str').AsString := tr_regular(qTmp.FieldByName('kategori_str').AsString);
      tblYabanci.Post;

      qTmp.Next;
    end;
  end
  else
  begin
    QueryOpen(qTmp, 'SELECT * FROM rpt_verbis_yabanciulkelereaktarimlar WHERE rapor_tarihi=''' + edtarihsec.Text + ''' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY data_id');

    while not qTmp.EOF do
    begin
      tblYabanci.Insert;
      tblYabanci.FieldByName('data_id').AsInteger := qTmp.FieldByName('data_id').AsInteger;
      tblYabanci.FieldByName('data_str').AsString := tr_regular(qTmp.FieldByName('data_str').AsString);
      tblYabanci.Post;

      qTmp.Next;
    end;
  end;

  qYabanci.Close;
  qYabanci.SQL.Clear;
  qYabanci.SQL.Add('SELECT * FROM tblYabanci ORDER BY data_id');
  qYabanci.Open;
end;

procedure TfrRptVerbisListeler.PrepareReportVeriAmaci;
var
  IDList: string;
begin
  tblAmac.First;
  while not tblAmac.EOF do
    tblAmac.Delete;

  if edTarihSec.Text = 'BUGÜN' then
  begin
    QueryOpen(qKategori, 'SELECT kategori_id, kat.kategori AS kategori_str, count(env.id) ' + 'FROM data_envanter env ' + 'LEFT JOIN def_data_kategori kat ON env.kategori_id = kat.id ' + 'WHERE env.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) + ' ' + 'GROUP BY kategori_id, kategori_str ' + 'ORDER BY 1');

    while not qKategori.EOF do
    begin
      IDList := '';
      QueryOpen(qTmp, 'SELECT topl_amac_ids, sakl_amac_ids, payl_amac_ids FROM data_envanter WHERE active= ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) + ' AND kategori_id = ' + qKategori.FieldByName('kategori_id').AsString + ' UNION ' + 'SELECT topl_amac_ids, sakl_amac_ids, payl_amac_ids FROM data_envanter WHERE id in ( ' + '  SELECT  main_id FROM data_envanter WHERE active= ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) + ' AND kategori_id = ' + qKategori.FieldByName('kategori_id').AsString + ')');
      while not qTmp.EOF do
      begin
        if qTmp.FieldByName('topl_amac_ids').AsString <> '' then
          IDList := IDList + qTmp.FieldByName('topl_amac_ids').AsString + ',';
        if qTmp.FieldByName('sakl_amac_ids').AsString <> '' then
          IDList := IDList + qTmp.FieldByName('sakl_amac_ids').AsString + ',';
        if qTmp.FieldByName('payl_amac_ids').AsString <> '' then
          IDList := IDList + qTmp.FieldByName('payl_amac_ids').AsString + ',';
        qTmp.Next;
      end;
      if IDList <> '' then
        System.Delete(IDList, Length(IDList), 1);

      if IDList <> '' then
      begin
        QueryOpen(qTmp, 'SELECT DISTINCT id, amac FROM def_data_amac WHERE id IN (' + IDList + ') ORDER BY id');
        while not qTmp.EOF do
        begin
          tblAmac.Insert;
          tblAmac.FieldByName('cat_id').AsInteger := qKategori.FieldByName('kategori_id').AsInteger;
          tblAmac.FieldByName('cat_str').AsString := tr_regular(qKategori.FieldByName('kategori_str').AsString);
          tblAmac.FieldByName('data_id').AsInteger := qTmp.FieldByName('id').AsInteger;
          tblAmac.FieldByName('data_str').AsString := tr_regular(qTmp.FieldByName('amac').AsString);
          tblAmac.Post;

          qTmp.Next;
        end;
      end;

      qKategori.Next;
    end;
  end
  else
  begin
    QueryOpen(qTmp, 'SELECT * FROM rpt_verbis_veriislemeamaclari WHERE rapor_tarihi=''' + edtarihsec.Text + ''' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY cat_id, data_id');

    while not qTmp.EOF do
    begin
      tblAmac.Insert;
      tblAmac.FieldByName('cat_id').AsInteger := qTmp.FieldByName('cat_id').AsInteger;
      tblAmac.FieldByName('cat_str').AsString := tr_regular(qTmp.FieldByName('cat_str').AsString);
      tblAmac.FieldByName('data_id').AsInteger := qTmp.FieldByName('data_id').AsInteger;
      tblAmac.FieldByName('data_str').AsString := tr_regular(qTmp.FieldByName('data_str').AsString);
      tblAmac.Post;

      qTmp.Next;
    end;
  end;

  qAmac.Close;
  qAmac.SQL.Clear;
  qAmac.SQL.Add('SELECT * FROM tblAmac ORDER BY cat_id, data_id');
  qAmac.Open;
end;

procedure TfrRptVerbisListeler.PrepareReportVeriGuvenligitedbirleri;
var
  IDList: string;
begin
  tblTedbir.First;
  while not tblTedbir.EOF do
    tblTedbir.Delete;

  if edTarihSec.Text = 'BUGÜN' then
  begin
    IDList := '';
    QueryOpen(qTmp, 'SELECT tedbir_ids FROM data_checklist WHERE active= ''E'' AND mc_id = ' + IntToStr(MainMod.MCID));
    while not qTmp.EOF do
    begin
      if qTmp.FieldByName('tedbir_ids').AsString <> '' then
        IDList := IDList + qTmp.FieldByName('tedbir_ids').AsString + ',';
      qTmp.Next;
    end;
    if IDList <> '' then
      System.Delete(IDList, Length(IDList), 1);

    if IDList <> '' then
    begin
      QueryOpen(qTmp, 'SELECT DISTINCT id, tedbir FROM def_data_tedbir WHERE id IN (' + IDList + ') ORDER BY id');
      while not qTmp.EOF do
      begin
        tblTedbir.Insert;
        tblTedbir.FieldByName('data_id').AsInteger := qTmp.FieldByName('id').AsInteger;
        tblTedbir.FieldByName('data_str').AsString := tr_regular(qTmp.FieldByName('tedbir').AsString);
        tblTedbir.Post;

        qTmp.Next;
      end;
    end;
  end
  else
  begin
    QueryOpen(qTmp, 'SELECT * FROM rpt_verbis_guvenliktedbirleri WHERE rapor_tarihi=''' + edtarihsec.Text + ''' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY data_id');

    while not qTmp.EOF do
    begin
      tblTedbir.Insert;
      tblTedbir.FieldByName('data_id').AsInteger := qTmp.FieldByName('data_id').AsInteger;
      tblTedbir.FieldByName('data_str').AsString := tr_regular(qTmp.FieldByName('data_str').AsString);
      tblTedbir.Post;

      qTmp.Next;
    end;
  end;

  qTedbir.Close;
  qTedbir.SQL.Clear;
  qTedbir.SQL.Add('SELECT * FROM tblTedbir ORDER BY data_id');
  qTedbir.Open;
end;

procedure TfrRptVerbisListeler.PrepareReportVeriKategori;
begin

  tblVTipi.First;
  while not tblVTipi.EOF do
    tblVTipi.Delete;

  if edTarihSec.Text = 'BUGÜN' then
  begin
    QueryOpen(qTmp, 'SELECT kategori_id, kat.kategori AS kategori_str, veritipi_id, ver.veri_tipi AS veritipi_str ' + 'FROM data_envanter env ' + 'LEFT JOIN def_data_kategori kat ON env.kategori_id = kat.id ' + 'LEFT JOIN def_data_veritipi ver ON env.veritipi_id = ver.id ' + 'WHERE env.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) + ' ' + 'GROUP BY kategori_id, veritipi_id, kat.kategori, ver.veri_tipi ' + 'ORDER BY 1');

    while not qTmp.EOF do
    begin
      tblVTipi.Insert;
      tblVTipi.FieldByName('cat_id').AsInteger := qTmp.FieldByName('kategori_id').AsInteger;
      tblVTipi.FieldByName('cat_str').AsString := tr_regular(qTmp.FieldByName('kategori_str').AsString);
      tblVTipi.FieldByName('data_id').AsInteger := qTmp.FieldByName('veritipi_id').AsInteger;
      tblVTipi.FieldByName('data_str').AsString := tr_regular(qTmp.FieldByName('veritipi_str').AsString);
      tblVTipi.Post;

      qTmp.Next;
    end;
  end
  else
  begin
    QueryOpen(qTmp, 'SELECT * FROM rpt_verbis_verikategorileri WHERE rapor_tarihi=''' + edtarihsec.Text + ''' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY cat_id, data_id');

    while not qTmp.EOF do
    begin
      tblVTipi.Insert;
      tblVTipi.FieldByName('cat_id').AsInteger := qTmp.FieldByName('cat_id').AsInteger;
      tblVTipi.FieldByName('cat_str').AsString := tr_regular(qTmp.FieldByName('cat_str').AsString);
      tblVTipi.FieldByName('data_id').AsInteger := qTmp.FieldByName('data_id').AsInteger;
      tblVTipi.FieldByName('data_str').AsString := tr_regular(qTmp.FieldByName('data_str').AsString);
      tblVTipi.Post;

      qTmp.Next;
    end;
  end;

  qVTipi.Close;
  qVTipi.SQL.Clear;
  qVTipi.SQL.Add('SELECT * FROM tblVTipi ORDER BY cat_id, data_id');
  qVTipi.Open;
end;

procedure TfrRptVerbisListeler.PrepareReportVeriKonusuKisi;
begin
  tblKisi.First;
  while not tblKisi.EOF do
    tblKisi.Delete;

  if edTarihSec.Text = 'BUGÜN' then
  begin
    QueryOpen(qTmp, 'SELECT kategori_id, kat.kategori AS kategori_str, kisi_id, ks.kisi as kisi_str ' + 'FROM data_envanter env ' + 'LEFT JOIN def_data_kategori kat ON env.kategori_id = kat.id ' + 'LEFT JOIN def_data_kisi ks ON env.kisi_id = ks.id ' + 'WHERE env.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) + ' ' + 'GROUP BY kategori_id, kat.kategori, kisi_id, ks.kisi ' + 'ORDER BY 1');

    while not qTmp.EOF do
    begin
      tblKisi.Insert;
      tblKisi.FieldByName('cat_id').AsInteger := qTmp.FieldByName('kategori_id').AsInteger;
      tblKisi.FieldByName('cat_str').AsString := tr_regular(qTmp.FieldByName('kategori_str').AsString);
      tblKisi.FieldByName('data_id').AsInteger := qTmp.FieldByName('kisi_id').AsInteger;
      tblKisi.FieldByName('data_str').AsString := tr_regular(qTmp.FieldByName('kisi_str').AsString);
      tblKisi.Post;

      qTmp.Next;
    end;
  end
  else
  begin
    QueryOpen(qTmp, 'SELECT * FROM rpt_verbis_verikonusukisiler WHERE rapor_tarihi=''' + edtarihsec.Text + ''' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY cat_id, data_id');

    while not qTmp.EOF do
    begin
      tblKisi.Insert;
      tblKisi.FieldByName('cat_id').AsInteger := qTmp.FieldByName('cat_id').AsInteger;
      tblKisi.FieldByName('cat_str').AsString := tr_regular(qTmp.FieldByName('cat_str').AsString);
      tblKisi.FieldByName('data_id').AsInteger := qTmp.FieldByName('data_id').AsInteger;
      tblKisi.FieldByName('data_str').AsString := tr_regular(qTmp.FieldByName('data_str').AsString);
      tblKisi.Post;

      qTmp.Next;
    end;
  end;

  qKisi.Close;
  qKisi.SQL.Clear;
  qKisi.SQL.Add('SELECT * FROM tblKisi ORDER BY cat_id, data_id');
  qKisi.Open;
end;

procedure TfrRptVerbisListeler.PrepareReportVeriSaklamaSuresi;
begin
  tblSure.First;
  while not tblSure.EOF do
    tblSure.Delete;

  if edTarihSec.Text = 'BUGÜN' then
  begin
    QueryOpen(qKategori, 'SELECT kategori_id, kat.kategori AS kategori_str, count(env.id) ' + 'FROM data_envanter env ' + 'LEFT JOIN def_data_kategori kat ON env.kategori_id = kat.id ' + 'WHERE env.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) + ' ' + 'GROUP BY kategori_id, kategori_str ' + 'ORDER BY 1');

    while not qKategori.EOF do
    begin
      QueryOpen(qTmp, 'SELECT sakl_ssure AS sstr FROM data_envanter env WHERE active= ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) + ' AND kategori_id = ' + qKategori.FieldByName('kategori_id').AsString + ' UNION ' + 'SELECT sakl_fsure AS sstr FROM data_envanter env WHERE active= ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) + ' AND kategori_id = ' + qKategori.FieldByName('kategori_id').AsString);
      while not qtmp.Eof do
      begin
        if qTmp.FieldByName('sstr').AsString <> '' then
        begin
          tblSure.Insert;
          tblSure.FieldByName('cat_id').AsInteger := qKategori.FieldByName('kategori_id').AsInteger;
          tblSure.FieldByName('cat_str').AsString := tr_regular(qKategori.FieldByName('kategori_str').AsString);
          tblSure.FieldByName('data_str').AsString := tr_regular(qTmp.FieldByName('sstr').AsString);
          tblSure.Post;
        end;

        qTmp.Next;
      end;
      qKategori.Next;
    end;
  end
  else
  begin
    QueryOpen(qTmp, 'SELECT * FROM rpt_verbis_verisaklamasureleri WHERE rapor_tarihi=''' + edtarihsec.Text + ''' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY cat_id');

    while not qTmp.EOF do
    begin
      tblSure.Insert;
      tblSure.FieldByName('cat_id').AsInteger := qTmp.FieldByName('cat_id').AsInteger;
      tblSure.FieldByName('cat_str').AsString := tr_regular(qTmp.FieldByName('cat_str').AsString);
      tblSure.FieldByName('data_str').AsString := tr_regular(qTmp.FieldByName('data_str').AsString);
      tblSure.Post;

      qTmp.Next;
    end;
  end;

  qSure.Close;
  qSure.SQL.Clear;
  qSure.SQL.Add('SELECT * FROM tblSure ORDER BY cat_id, data_str');
  qSure.Open;
end;

procedure TfrRptVerbisListeler.gridVeriKategorileriColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
begin
  if SameText(Column.FieldName, 'cat_id') then
  begin
  end;
end;

procedure TfrRptVerbisListeler.gridVeriKonusuKisiColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
begin
  if SameText(Column.FieldName, 'cat_id') then
  begin
  end;
end;

procedure TfrRptVerbisListeler.gridAktarimAliciColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
begin
  if SameText(Column.FieldName, 'cat_id') then
  begin
  end;
end;

procedure TfrRptVerbisListeler.gridAktarimYabanciColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
begin
  if SameText(Column.FieldName, 'cat_id') then
  begin
  end;
end;

procedure TfrRptVerbisListeler.gridAmacColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
begin
  if SameText(Column.FieldName, 'cat_id') then
  begin
  end;
end;

procedure TfrRptVerbisListeler.gridGuvenlikTedbirColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
begin
  if SameText(Column.FieldName, 'cat_id') then
  begin
  end;
end;

procedure TfrRptVerbisListeler.gridSaklamaSuresiColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
begin
  if SameText(Column.FieldName, 'cat_id') then
  begin
  end;
end;

procedure TfrRptVerbisListeler.btnArsivleClick(Sender: TObject);
begin
  ArchiveReport;
end;

procedure TfrRptVerbisListeler.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('RptVerbisListeler');
end;

procedure TfrRptVerbisListeler.UniFrameCreate(Sender: TObject);
begin
  tblVTipi.Open;
  tblAmac.Open;
  tblAlici.Open;
  tblSure.Open;
  tblKisi.Open;
  tblYabanci.Open;
  tblTedbir.Open;
  //  PrepareReport;

  edTarihSec.Items.Clear;
  edTarihSec.Items.Add('BUGÜN');
  QueryOpen(qTmp, 'SELECT DISTINCT rapor_tarihi FROM rpt_verbis_verikategorileri WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY rapor_tarihi DESC');
  while not qTmp.Eof do
  begin
    edTarihSec.Items.Add(qTmp.fieldbyname('rapor_tarihi').AsString);
    qTmp.Next;
  end;
end;

initialization
  RegisterClass(TfrRptVerbisListeler);

end.

