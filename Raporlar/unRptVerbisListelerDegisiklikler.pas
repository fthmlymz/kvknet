unit unRptVerbisListelerDegisiklikler;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, System.Actions, Vcl.ActnList, Data.DB, DBAccess, Uni, uniButton, uniBitBtn,
  uniEdit, uniMultiItem, uniComboBox, uniLabel, uniGUIBaseClasses, uniPanel, uniBasicGrid, uniDBGrid, MemDS,
  VirtualTable, VirtualQuery, uniDBTreeGrid, VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  FlexCel.Render, uniPageControl, uniCheckBox, uniGridExporters;

type
  TfrRptVerbisListelerDegisiklikler = class(TUniFrame)
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
    qArchive: TUniQuery;
    UniLabel2: TUniLabel;
    edTarihSec2: TUniComboBox;
    qTmp2: TUniQuery;
    qTmp1: TUniQuery;
    UniLabel3: TUniLabel;
    cbSolVarSagYok: TUniCheckBox;
    cbSolYokSagVar: TUniCheckBox;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    cbSolVarSagVar: TUniCheckBox;
    tblTmp1: TVirtualTable;
    tblTmp2: TVirtualTable;
    UniBitBtn1: TUniBitBtn;
    UniGridExcelExporter1: TUniGridExcelExporter;
    procedure UniFrameCreate(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure gridVeriKategorileriColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure pnlTopAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure gridAmacColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure gridSaklamaSuresiColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure gridVeriKonusuKisiColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure gridAktarimYabanciColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure gridGuvenlikTedbirColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure gridAktarimAliciColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure gridVeriKategorileriDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure gridAmacDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure gridAktarimAliciDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure gridSaklamaSuresiDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure gridVeriKonusuKisiDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure gridAktarimYabanciDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure gridGuvenlikTedbirDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure actExcelExecute(Sender: TObject);
    procedure tblVTipiBeforePost(DataSet: TDataSet);
    procedure tblAmacBeforePost(DataSet: TDataSet);
    procedure tblAliciBeforePost(DataSet: TDataSet);
    procedure tblSureBeforePost(DataSet: TDataSet);
    procedure tblKisiBeforePost(DataSet: TDataSet);
    procedure tblYabanciBeforePost(DataSet: TDataSet);
    procedure tblTedbirBeforePost(DataSet: TDataSet);
  private
    Rapor_Tarihi: TDateTime;
    Rapor_Tarihi2: TDateTime;
    procedure PrepareReportVeriKategori;
    procedure PrepareReportVeriAmaci;
    procedure PrepareReportVeriAktarimAlici;
    procedure PrepareReportVeriSaklamaSuresi;
    procedure PrepareReportVeriKonusuKisi;
    procedure PrepareReportVeriAktarimYabanci;
    procedure PrepareReportVeriGuvenligitedbirleri;
    function DataSetToXlsDeneme(DbGrid: TUniDBGrid; Title: String): string;
    function DownloadDataSetToXlsDeneme(DbGrid: TUniDBGrid; Title, FileName: String): string;
    procedure UniDBGridToExcel(UniDBGrid: TUniDBGrid);
    // Yazdýrma Yetkisi : 100 olarbiler
  public
  end;

implementation

{$R *.dfm}

uses MainModule, McMLib, Main, ServerModule, ComObj;

procedure TfrRptVerbisListelerDegisiklikler.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrRptVerbisListelerDegisiklikler.actExcelExecute(Sender: TObject);
begin
  if qVTipi.RecordCount < 1 then Exit;

//  if UniPageControl1.ActivePage = tsVeriKategori then
//    MainMod.DownloadDataSetToXls(gridVeriKategorileri, 'VERÝ KATEGORÝLERÝ', 'VERÝ KATEGORÝLERÝ.XLSX')
//  else
//  if UniPageControl1.ActivePage = tsAmac then
//    MainMod.DownloadDataSetToXls(gridAmac, 'KÝÞÝSEL VERÝ ÝÞLEME AMAÇLARI', 'KÝÞÝSEL VERÝ ÝÞLEME AMAÇLARI.XLSX')
//  else
//  if UniPageControl1.ActivePage = tsAktarimAlici then
//    MainMod.DownloadDataSetToXls(gridAktarimAlici, 'VERÝ AKTARIMI ALICI GRUPLARI', 'VERÝ AKTARIMI ALICI GRUPLARI.XLSX')
//  else
//  if UniPageControl1.ActivePage = tsSaklamaSuresi then
//    MainMod.DownloadDataSetToXls(gridSaklamaSuresi, 'VERÝ SAKLAMA SÜRELERÝ', 'VERÝ SAKLAMA SÜRELERÝ.XLSX')
//  else
//  if UniPageControl1.ActivePage = tsVeriKonusuKisi then
//  begin
//    gridVeriKonusuKisi.Exporter.ExportGrid;
//  end
//  else
//  if UniPageControl1.ActivePage = tsAktarimYabanci then
//    MainMod.DownloadDataSetToXls(gridAktarimYabanci, 'YABANCI ÜLKELERE AKTARIMLAR', 'YABANCI ÜLKELERE AKTARIMLAR.XLSX')
//  else
//  if UniPageControl1.ActivePage = tsGuvenlikTedbir then
//    MainMod.DownloadDataSetToXls(gridGuvenlikTedbir, 'VERÝ GÜVENLÝÐÝ TEDBÝRLER', 'VERÝ GÜVENLÝÐÝ TEDBÝRLER.XLSX');

  if UniPageControl1.ActivePage = tsVeriKategori then
  begin
    if qVTipi.RecordCount = 0 then Exit;
    gridVeriKategorileri.Exporter.ExportGrid;
  end
  else
  if UniPageControl1.ActivePage = tsAmac then
  begin
    if qAmac.RecordCount = 0 then Exit;
    gridAmac.Exporter.ExportGrid
  end
  else
  if UniPageControl1.ActivePage = tsAktarimAlici then
  begin
    if qAlici.RecordCount = 0 then Exit;
    gridAktarimAlici.Exporter.ExportGrid
  end
  else
  if UniPageControl1.ActivePage = tsSaklamaSuresi then
  begin
    if qSure.RecordCount = 0 then Exit;
    gridSaklamaSuresi.Exporter.ExportGrid
  end
  else
  if UniPageControl1.ActivePage = tsVeriKonusuKisi then
  begin
    if qKisi.RecordCount = 0 then Exit;
    gridVeriKonusuKisi.Exporter.ExportGrid
  end
  else
  if UniPageControl1.ActivePage = tsAktarimYabanci then
  begin
    if qYabanci.RecordCount = 0 then Exit;
    gridAktarimYabanci.Exporter.ExportGrid
  end
  else
  if UniPageControl1.ActivePage = tsGuvenlikTedbir then
  begin
    if qTedbir.RecordCount = 0 then Exit;
    gridGuvenlikTedbir.Exporter.ExportGrid
  end;
end;


procedure TfrRptVerbisListelerDegisiklikler.actSearchExecute(Sender: TObject);
begin
  if edTarihSec.Text = edTarihSec2.Text then
  begin
    MessageDlg('Karþýlaþtýrýlacak tarihleri birbirinden farklý seçiniz.', mtError, [mbOk]);
    exit;
  end;

  if edTarihSec.Text = 'BUGÜN' then
  begin
    Rapor_Tarihi := Trunc(Now);
  end
  else
  begin
    Rapor_Tarihi := StrToDateTime(edTarihSec.Text);
  end;

  Rapor_Tarihi2 := StrToDateTime(edTarihSec2.Text);

    ShowMask('Lütfen bekleyiniz...');
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


function TfrRptVerbisListelerDegisiklikler.DataSetToXlsDeneme(
  DbGrid: TUniDBGrid; Title: String): string;
var
  XLS: TXlsFile;
  Row: Integer;
  Fmt: TFlxFormat;
  Alignment: THFlxAlignment;
  ColExcel, ColDbgrid: Integer;
  DateXF, DateTimeXF, FontSizeTitleXF, FontSizeDataXF, FontSizePageTitleXF: Integer;
  File_Name: String;
  DS: TDataSet;
  FName: String;
  TmpName: String;
  FUrl: String;
  GrupHdr: String;
  Grup1, Grup2: Boolean; // Grup2 üst groupheader
  Grup1str, Grup2str: String;  // Group header
  Grup1str_o, Grup2str_o: String;  // önceki grup header, birleþtirme kararý için
  Grup1i_o, Grup2i_o: Integer; // önceki grup header indexi, birleþtirme için
begin
  DS := DbGrid.DataSource.DataSet;
  Grup1 := False;
  Grup2 := False;
  Grup1str := '';
  Grup2str := '';
  Grup1str_o := '';
  Grup2str_o := '';
  Grup1i_o := 1;
  Grup2i_o := 1;

  XLS := TXlsfile.Create(1, TExcelFileFormat.v2007, true);
  try
    Fmt := XLS.GetDefaultFormat;
    Fmt.Font.Size20 := 280;
    Fmt.Font.Style := [TFlxFontStyles.Bold];
    Fmt.HAlignment := THFlxAlignment.center;
    FontSizeTitleXF := XLS.AddFormat(Fmt);
    Fmt := XLS.GetDefaultFormat;
    Fmt.Font.Size20 := 360;
    Fmt.Font.Style := [TFlxFontStyles.Bold];
    Fmt.HAlignment := THFlxAlignment.center;
    FontSizePageTitleXF := XLS.AddFormat(Fmt);

    XLS.SheetName := Title;

    XLS.MergeCells(1, 1, 1, DbGrid.Columns.Count);
    XLS.SetCellValue(1, 1, Title, FontSizePageTitleXF);

    Row := 2;

    //groupheader var mý
    ColExcel := 0;
    for ColDbgrid := 0 to DbGrid.Columns.Count - 1 do
    begin
      if DbGrid.Columns.Items[ColDbgrid].Visible = False then Continue;

      if DbGrid.Columns.Items[ColDbgrid].GroupHeader <> '' then Grup1 := True;
      if Pos(';', DbGrid.Columns.Items[ColDbgrid].GroupHeader) > 0 then Grup2 := True;
    end;

    if Grup2 then
    begin
      for ColDbgrid := 0 to DbGrid.Columns.Count - 1 do
      begin
        if DbGrid.Columns.Items[ColDbgrid].Visible = False then Continue;

        GrupHdr := DbGrid.Columns.Items[ColDbgrid].GroupHeader;
        Grup2str := ParseString(GrupHdr, ';');
        Grup1str := ParseString(GrupHdr, ';');

        ColExcel := ColExcel + 1;
        XLS.SetCellValue(2, ColExcel, Grup2str, FontSizeTitleXF);
        XLS.SetCellValue(3, ColExcel, Grup1str, FontSizeTitleXF);

        if Grup2str <> Grup2str_o then
        begin
          XLS.MergeCells(2, Grup2i_o, 2, ColExcel - 1); //grup baþlýðý deðiþtiyse, önceki grup indexinden bir önceki sütuna kadar birleþtir
          Grup2str_o := Grup2str;
          Grup2i_o := colExcel;

          XLS.MergeCells(3, Grup1i_o, 3, ColExcel - 1);
          Grup1str_o := Grup1str;
          Grup1i_o := colExcel;
        end;

        if Grup1str <> Grup1str_o then
        begin
          XLS.MergeCells(3, Grup1i_o, 3, ColExcel - 1);
          Grup1str_o := Grup1str;
          Grup1i_o := colExcel;
        end;
      end;
      Row := 4;
    end
    else if Grup1 then
    begin
      for ColDbgrid := 0 to DbGrid.Columns.Count - 1 do
      begin
        if DbGrid.Columns.Items[ColDbgrid].Visible = False then Continue;

        GrupHdr := DbGrid.Columns.Items[ColDbgrid].GroupHeader;
        Grup1str := ParseString(GrupHdr, ';');

        ColExcel := ColExcel + 1;
        XLS.SetCellValue(2, ColExcel, Grup1str, FontSizeTitleXF);

        if Grup1str <> Grup1str_o then
        begin
          XLS.MergeCells(2, Grup1i_o + 1, 2, ColExcel);
          Grup1str_o := Grup1str;
          Grup1i_o := colExcel;
        end;
      end;
      Row := 3;
    end;

    DS.First;
    ColExcel := 0;
    for ColDbgrid := 0 to DbGrid.Columns.Count - 1 do
    begin
      if DbGrid.Columns.Items[ColDbgrid].Visible = False then Continue;

      ColExcel := ColExcel + 1;
      XLS.SetCellValue(Row, ColExcel, DbGrid.Columns.Items[ColDbgrid].Title.Caption, FontSizeTitleXF);
      XLS.SetColWidthInternal(ColExcel, DbGrid.Columns.Items[ColDbgrid].Width * 35);
    end;

    Row := Row + 1;
    while not DS.Eof do
    begin
      ColExcel := 0;
      for ColDbgrid := 0 to DbGrid.Columns.Count - 1 do
      begin
        if DbGrid.Columns.Items[ColDbgrid].Visible = False then Continue;

        if DbGrid.Columns[ColDbgrid].Alignment = TAlignment.taLeftJustify then
          Alignment := THFlxAlignment.left
        else if DbGrid.Columns[ColDbgrid].Alignment = TAlignment.taCenter then
          Alignment := THFlxAlignment.center
        else if DbGrid.Columns[ColDbgrid].Alignment = TAlignment.taRightJustify then
          Alignment := THFlxAlignment.right
        else
          Alignment := THFlxAlignment.center;

        Fmt := XLS.GetDefaultFormat;
        Fmt.Format := 'dd.mm.yyyy hh:MM:ss';
        Fmt.Font.Size20 := 240;
        Fmt.HAlignment := Alignment;
        DateTimeXF := XLS.AddFormat(Fmt);

        Fmt := XLS.GetDefaultFormat;
        Fmt.Format := 'dd.mm.yyyy';
        Fmt.Font.Size20 := 240;
        Fmt.HAlignment := Alignment;
        DateXF := XLS.AddFormat(Fmt);

        Fmt := XLS.GetDefaultFormat;
        Fmt.Font.Size20 := 240;
        Fmt.HAlignment := Alignment;
        FontSizeDataXF := XLS.AddFormat(Fmt);

        ColExcel := ColExcel + 1;
        if DS.FieldList.IndexOf(DbGrid.Columns.Items[ColDbgrid].FieldName) = -1 then
        begin
          XLS.SetCellValue(Row, ColExcel, '', FontSizeDataXF);
          Continue;
        end;

        case DS.FieldByName(DbGrid.Columns.Items[ColDbgrid].FieldName).DataType of
          TFieldType.ftDateTime:
            begin
              if DS.FieldByName(DbGrid.Columns.Items[ColDbgrid].FieldName).IsNull then
                XLS.SetCellValue(Row, ColExcel, '')
              else
                XLS.SetCellValue(Row, ColExcel, DS.FieldByName(DbGrid.Columns.Items[ColDbgrid].FieldName).AsDateTime, DateTimeXF);

              XLS.SetColWidthInternal(ColExcel, DbGrid.Columns.Items[ColDbgrid].Width * 50);
            end;

          TFieldType.ftDate:
            begin
              if DS.FieldByName(DbGrid.Columns.Items[ColDbgrid].FieldName).IsNull then
                XLS.SetCellValue(Row, ColExcel, '')
              else
                XLS.SetCellValue(Row, ColExcel, DS.FieldByName(DbGrid.Columns.Items[ColDbgrid].FieldName).AsDateTime, DateXF);

              XLS.SetColWidthInternal(ColExcel, DbGrid.Columns.Items[ColDbgrid].Width * 50);
            end;

          else
            begin
              XLS.SetCellValue(Row, ColExcel, DS.FieldByName(DbGrid.Columns.Items[ColDbgrid].FieldName).Value, FontSizeDataXF);
            end;
        end;

      end;

      DS.Next;

      Inc(Row);
    end;

    XLS.AutofitCol(1, DbGrid.Columns.Count + 1, False, 1.2);

    FName := Title;
    FUrl := '';
    File_Name := ServerMod.NewCacheFileUrl(False, 'xls', FName, '', FUrl, True);

    XLS.Save(File_Name, TFileFormats.Xlsx);
    Result := File_Name;
  finally
    XLS.Free;
  end;
end;

function TfrRptVerbisListelerDegisiklikler.DownloadDataSetToXlsDeneme(
  DbGrid: TUniDBGrid; Title, FileName: String): string;
var
  Tmp_Name: string;
begin
  Tmp_Name := DataSetToXlsDeneme(DbGrid, Title);
  UniSession.SendFile(Tmp_Name, FileName);
  Result := Tmp_Name;
end;

procedure TfrRptVerbisListelerDegisiklikler.pnlTopAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doResize' then
  begin
    gridVeriKategorileri.Columns[3].Width := trunc((pnlTop.Width - 30)/2);
    gridVeriKategorileri.Columns[4].Width := trunc((pnlTop.Width - 30)/2);
    gridAmac.Columns[3].Width             := trunc((pnlTop.Width - 30)/2);
    gridAmac.Columns[4].Width             := trunc((pnlTop.Width - 30)/2);
    gridAktarimAlici.Columns[1].Width     := trunc((pnlTop.Width - 30)/2);
    gridAktarimAlici.Columns[2].Width     := trunc((pnlTop.Width - 30)/2);
    gridSaklamaSuresi.Columns[2].Width    := trunc((pnlTop.Width - 30)/2);
    gridSaklamaSuresi.Columns[3].Width    := trunc((pnlTop.Width - 30)/2);
    gridVeriKonusuKisi.Columns[3].Width   := trunc((pnlTop.Width - 30)/2);
    gridVeriKonusuKisi.Columns[4].Width   := trunc((pnlTop.Width - 30)/2);
    gridAktarimYabanci.Columns[1].Width   := trunc((pnlTop.Width - 30)/2);
    gridAktarimYabanci.Columns[2].Width   := trunc((pnlTop.Width - 30)/2);
    gridGuvenliktedbir.Columns[1].Width   := trunc((pnlTop.Width - 30)/2);
    gridGuvenliktedbir.Columns[2].Width   := trunc((pnlTop.Width - 30)/2);
  end;
end;

procedure TfrRptVerbisListelerDegisiklikler.PrepareReportVeriAktarimAlici;
var
  IDList : String;
  buldu: boolean;
begin
  tblAlici.First;
  while not tblAlici.EOF do tblAlici.Delete;
  tblTmp1.Open;
  tblTmp1.First;
  while not tblTmp1.EOF do tblTmp1.Delete;
  tblTmp2.Open;
  tblTmp2.First;
  while not tblTmp2.EOF do tblTmp2.Delete;

  if edTarihSec.Text = 'BUGÜN' then
  begin
    IDList := '';
    QueryOpen(qTmp, 'SELECT payl_taraf_ids FROM data_envanter WHERE active= ''E'' AND mc_id = ' + IntToStr(MainMod.MCID));
    while not qTmp.EOF do
    begin
      if qTmp.FieldByName('payl_taraf_ids').AsString <> '' then IDList := IDList + qTmp.FieldByName('payl_taraf_ids').AsString + ',';
      qTmp.Next;
    end;
    if IDList <> '' then System.Delete(IDList, Length(IDList), 1);

    if IDList <> '' then
    begin
      QueryOpen(qTmp, 'SELECT DISTINCT id, taraf FROM def_data_taraf WHERE id IN (' + IDList + ') ORDER BY id');
      while not qTmp.EOF do
      begin
        tblTmp1.Insert;
        tblTmp1.FieldByName('data_id').AsInteger := qTmp.FieldByName('id').AsInteger;
        tblTmp1.FieldByName('data_str').AsString := qTmp.FieldByName('taraf').AsString;
        tblTmp1.Post;

        qTmp.Next;
      end;
    end;
  end
  else
  begin

    QueryOpen(qTmp, 'SELECT * FROM rpt_verbis_veriaktarimalicilar WHERE rapor_tarihi=''' + DateTimeToStr(Rapor_Tarihi) + ''' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY data_id');

    while not qTmp.EOF do
    begin
      tblTmp1.Insert;
      tblTmp1.FieldByName('data_id').AsInteger := qTmp.FieldByName('data_id').AsInteger;
      tblTmp1.FieldByName('data_str').AsString := qTmp.FieldByName('data_str').AsString;
      tblTmp1.Post;

      qTmp.Next;
    end;
  end;

  if edTarihSec2.Text = 'BUGÜN' then
  begin
    IDList := '';
    QueryOpen(qTmp, 'SELECT payl_taraf_ids FROM data_envanter WHERE active= ''E'' AND mc_id = ' + IntToStr(MainMod.MCID));
    while not qTmp.EOF do
    begin
      if qTmp.FieldByName('payl_taraf_ids').AsString <> '' then IDList := IDList + qTmp.FieldByName('payl_taraf_ids').AsString + ',';
      qTmp.Next;
    end;
    if IDList <> '' then System.Delete(IDList, Length(IDList), 1);

    if IDList <> '' then
    begin
      QueryOpen(qTmp, 'SELECT DISTINCT id, taraf FROM def_data_taraf WHERE id IN (' + IDList + ') ORDER BY id');
      while not qTmp.EOF do
      begin
        tblTmp2.Insert;
        tblTmp2.FieldByName('data_id').AsInteger := qTmp.FieldByName('id').AsInteger;
        tblTmp2.FieldByName('data_str').AsString := qTmp.FieldByName('taraf').AsString;
        tblTmp2.Post;

        qTmp.Next;
      end;
    end;
  end
  else
  begin
    QueryOpen(qTmp, 'SELECT * FROM rpt_verbis_veriaktarimalicilar WHERE rapor_tarihi=''' + DateTimeToStr(Rapor_Tarihi2) + ''' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY data_id');

    while not qTmp.EOF do
    begin
      tblTmp2.Insert;
      tblTmp2.FieldByName('data_id').AsInteger := qTmp.FieldByName('data_id').AsInteger;
      tblTmp2.FieldByName('data_str').AsString := qTmp.FieldByName('data_str').AsString;
      tblTmp2.Post;

      qTmp.Next;
    end;
  end;

  tbltmp1.First;
  while not tblTmp1.Eof do
  begin
    tblAlici.Insert;
    tblAlici.FieldByName('data_str').AsString  := tblTmp1.FieldByName('data_str').AsString;
    tblAlici.FieldByName('data_id').AsInteger  := tblTmp1.FieldByName('data_id').AsInteger;
    tblAlici.FieldByName('data_flag').AsInteger:= 1;
    tblAlici.Post;
    tblTmp1.Next;
  end;
  tbltmp2.first;
  while not tbltmp2.EOF do
  begin
    buldu := false;
    tblAlici.first;
    while not tblAlici.eof do
    begin
      if (tbltmp2.FieldByName('data_id').AsInteger = tblAlici.FieldByName('data_id').AsInteger) then
      begin
        tblAlici.Edit;
        tblAlici.FieldByName('data_str2').AsString := tbltmp2.FieldByName('data_str').AsString;
        tblAlici.FieldByName('data_id2').AsInteger := tbltmp2.FieldByName('data_id').AsInteger;
        tblAlici.FieldByName('data_flag').AsInteger:= 3;
        tblAlici.Post;
        buldu := true;
        break;
      end;
      tblAlici.next;
    end;
    if not buldu then
    begin
      tblAlici.Insert;
      tblAlici.FieldByName('data_str2').AsString := tblTmp2.FieldByName('data_str').AsString;
      tblAlici.FieldByName('data_id2').AsInteger := tbltmp2.FieldByName('data_id').AsInteger;
      tblAlici.FieldByName('data_flag').AsInteger:= 2;
      tblAlici.Post;
    end;
    tblTmp2.next;
  end;

  tblAlici.first;
  while not tblAlici.Eof do
  begin
    buldu := false;
    if (tblAlici.FieldByName('data_str').AsString <> '') and (tblAlici.FieldByName('data_str2').AsString <> '') then
    begin
      if cbSolVarSagVar.Checked = false then
      begin
        tblAlici.Delete;
        buldu := true;
      end;
    end
    else if (tblAlici.FieldByName('data_str').AsString <> '') then
    begin
      if cbSolVarSagYok.Checked = false then
      begin
        tblAlici.Delete;
        buldu := true;
      end;
    end
    else if (tblAlici.FieldByName('data_str2').AsString <> '') then
    begin
      if cbSolYokSagVar.Checked = false then
      begin
        tblAlici.Delete;
        buldu := true;
      end;
    end;
    if buldu = false then
      tblAlici.Next;
  end;

  qAlici.Close;
  qAlici.SQL.Clear;
  qAlici.SQL.Add('SELECT * FROM tblAlici ORDER BY data_id');
  qAlici.Open;

  gridAktarimAlici.Columns[1].Title.Caption := 'Veri Aktarým Alýcý Gruplarý - ' + edTarihSec.Text;
  gridAktarimAlici.Columns[2].Title.Caption := 'Veri Aktarým Alýcý Gruplarý - ' + edTarihSec2.Text;
  tbltmp1.Close;
  tbltmp2.Close;
end;

procedure TfrRptVerbisListelerDegisiklikler.PrepareReportVeriAktarimYabanci;
var
  sql1,
  sql2,
  whr1,
  whr2: String;
  buldu: boolean;
begin
  tblYabanci.First;
  while not tblYabanci.EOF do tblYabanci.Delete;

  if edTarihSec.Text = 'BUGÜN' then
  begin
    sql1 := 'SELECT DISTINCT kategori_id AS data_id, kat.kategori AS data_str ' +
                    'FROM data_envanter env ' +
                    'LEFT JOIN def_data_kategori kat ON env.kategori_id = kat.id ' +
                    'WHERE env.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) +
                    ' AND (payl_taraftipi IN (''YURT DIÞI'', ''Y.ÝÇÝ/Y.DIÞI'')) ';
    whr1 := ' AND kategori_id = ';
  end
  else
  begin
    sql1 := 'SELECT data_id, data_str FROM rpt_verbis_yabanciulkelereaktarimlar WHERE rapor_tarihi=''' + DateTimeToStr(Rapor_Tarihi) +
            ''' AND mc_id = ' + IntToStr(MainMod.MCID);
    whr1 := ' AND data_id = ';
  end;

  if edTarihSec2.Text = 'BUGÜN' then
  begin
    sql2 := 'SELECT DISTINCT kategori_id AS data_id, kat.kategori AS data_str ' +
                    'FROM data_envanter env ' +
                    'LEFT JOIN def_data_kategori kat ON env.kategori_id = kat.id ' +
                    'WHERE env.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) +
                    ' AND (payl_taraftipi IN (''YURT DIÞI'', ''Y.ÝÇÝ/Y.DIÞI'')) ';
    whr2 := ' AND kategori_id = ';
  end
  else
  begin
    sql2 := 'SELECT data_id, data_str FROM rpt_verbis_yabanciulkelereaktarimlar WHERE rapor_tarihi=''' + DateTimeToStr(Rapor_Tarihi2) +
            ''' AND mc_id = ' + IntToStr(MainMod.MCID);
    whr2 := ' AND data_id = ';
  end;

//  queryOpen(qtmp, 'SELECT DISTINCT cat_id FROM (SELECT cat_id FROM (' + sql1 + ') s1 UNION ALL SELECT cat_id FROM (' + sql2 + ') s2 ) t ORDER BY cat_id');
//
//  while not qtmp.Eof do
  begin
//    queryOpen(qtmp1, sql1 + whr1 + qTmp.fieldByName('cat_id').AsString + ' order by 2');
//    queryOpen(qtmp2, sql2 + whr2 + qTmp.fieldByName('cat_id').AsString + ' order by 2');
    queryOpen(qtmp1, sql1 + ' order by 2');
    queryOpen(qtmp2, sql2 + ' order by 2');

    qtmp1.First;
    while not qtmp1.Eof do
    begin
      tblYabanci.Insert;
      tblYabanci.FieldByName('data_str').AsString  := qtmp1.FieldByName('data_str').AsString;
      tblYabanci.FieldByName('data_flag').AsInteger:= 1;
      tblYabanci.Post;
      qtmp1.Next;
    end;
    qtmp2.first;
    while not qtmp2.EOF do
    begin
      buldu := false;
      tblYabanci.first;
      while not tblYabanci.eof do
      begin
        if (qtmp2.FieldByName('data_str').AsString = tblYabanci.FieldByName('data_str').AsString) then
        begin
          tblYabanci.Edit;
          tblYabanci.FieldByName('data_str2').AsString := qtmp2.FieldByName('data_str').AsString;
          tblYabanci.FieldByName('data_flag').AsInteger:= 3;
          tblYabanci.Post;
          buldu := true;
          break;
        end;
        tblYabanci.next;
      end;
      if not buldu then
      begin
        tblYabanci.Insert;
        tblYabanci.FieldByName('data_str2').AsString := qtmp2.FieldByName('data_str').AsString;
        tblYabanci.FieldByName('data_flag').AsInteger:= 2;
        tblYabanci.Post;
      end;
      qtmp2.next;
    end;

    qTmp.Next;
  end;


  tblYabanci.first;
  while not tblYabanci.Eof do
  begin
    buldu := false;
    if (tblYabanci.FieldByName('data_str').AsString <> '') and (tblYabanci.FieldByName('data_str2').AsString <> '') then
    begin
      if cbSolVarSagVar.Checked = false then
      begin
        tblYabanci.Delete;
        buldu := true;
      end;
    end
    else if (tblYabanci.FieldByName('data_str').AsString <> '') then
    begin
      if cbSolVarSagYok.Checked = false then
      begin
        tblYabanci.Delete;
        buldu := true;
      end;
    end
    else if (tblYabanci.FieldByName('data_str2').AsString <> '') then
    begin
      if cbSolYokSagVar.Checked = false then
      begin
        tblYabanci.Delete;
        buldu := true;
      end;
    end;
    if buldu = false then
      tblYabanci.Next;
  end;


  qYabanci.Close;
  qYabanci.SQL.Clear;
  qYabanci.SQL.Add('SELECT * FROM tblYabanci ORDER BY 2');
  qYabanci.Open;

  gridAktarimYabanci.Columns[1].Title.Caption := 'Yabancý Ülkelere Aktarýlacak Bilgiler - ' + edTarihSec.Text;
  gridAktarimYabanci.Columns[2].Title.Caption := 'Yabancý Ülkelere Aktarýlacak Bilgiler - ' + edTarihSec2.Text;

end;

procedure TfrRptVerbisListelerDegisiklikler.PrepareReportVeriAmaci;
var
  IDList : String;
  buldu: boolean;
begin
  tblAmac.First;
  while not tblAmac.EOF do tblAmac.Delete;
  tblTmp1.Open;
  tblTmp1.First;
  while not tblTmp1.EOF do tblTmp1.Delete;
  tblTmp2.Open;
  tblTmp2.First;
  while not tblTmp2.EOF do tblTmp2.Delete;

  if edTarihSec.Text = 'BUGÜN' then
  begin
    QueryOpen(qKategori, 'SELECT kategori_id, kat.kategori AS kategori_str, count(env.id) ' +
                         'FROM data_envanter env ' +
                         'LEFT JOIN def_data_kategori kat ON env.kategori_id = kat.id ' +
                         'WHERE env.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) + ' ' +
                         'GROUP BY kategori_id, kategori_str ' +
                         'ORDER BY 1');


    while not qKategori.EOF do
    begin
      IDList := '';
      QueryOpen(qTmp, 'SELECT topl_amac_ids, sakl_amac_ids, payl_amac_ids FROM data_envanter WHERE active= ''E'' AND mc_id = ' +
                      IntToStr(MainMod.MCID) + ' AND kategori_id = ' + qKategori.FieldByName('kategori_id').AsString +
                      ' UNION ' +
                      'SELECT topl_amac_ids, sakl_amac_ids, payl_amac_ids FROM data_envanter WHERE id in ( ' +
                       'SELECT  main_id FROM data_envanter WHERE active= ''E'' AND mc_id = ' +
                      IntToStr(MainMod.MCID) + ' AND kategori_id = ' + qKategori.FieldByName('kategori_id').AsString + ')'
                      );
      while not qTmp.EOF do
      begin
        if qTmp.FieldByName('topl_amac_ids').AsString <> '' then IDList := IDList + qTmp.FieldByName('topl_amac_ids').AsString + ',';
        if qTmp.FieldByName('sakl_amac_ids').AsString <> '' then IDList := IDList + qTmp.FieldByName('sakl_amac_ids').AsString + ',';
        if qTmp.FieldByName('payl_amac_ids').AsString <> '' then IDList := IDList + qTmp.FieldByName('payl_amac_ids').AsString + ',';
        qTmp.Next;
      end;
      if IDList <> '' then System.Delete(IDList, Length(IDList), 1);

      if IDList <> '' then
      begin
        QueryOpen(qTmp, 'SELECT DISTINCT id, amac FROM def_data_amac WHERE id IN (' + IDList + ') ORDER BY id');
        while not qTmp.EOF do
        begin
          tblTmp1.Insert;
          tblTmp1.FieldByName('cat_id').AsInteger  := qKategori.FieldByName('kategori_id').AsInteger;
          tblTmp1.FieldByName('cat_str').AsString  := qKategori.FieldByName('kategori_str').AsString;
          tblTmp1.FieldByName('data_id').AsInteger := qTmp.FieldByName('id').AsInteger;
          tblTmp1.FieldByName('data_str').AsString := qTmp.FieldByName('amac').AsString;
          tblTmp1.Post;

          qTmp.Next;
        end;
      end;

      qKategori.Next;
    end;
  end
  else
  begin
    QueryOpen(qTmp, 'SELECT * FROM rpt_verbis_veriislemeamaclari WHERE rapor_tarihi=''' + DateTimeToStr(Rapor_Tarihi) + ''' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY cat_id, data_id');

//    if qTmp.RecordCount = 0 then
//    begin
//      MessageDlg(edtarihsec.Text + ' tarihinde arþivlenmiþ veri bulunmamaktadýr.', mtError, [mbOk]);
//    end;
    while not qTmp.EOF do
    begin
      tblTmp1.Insert;
      tblTmp1.FieldByName('cat_id').AsInteger  := qTmp.FieldByName('cat_id').AsInteger;
      tblTmp1.FieldByName('cat_str').AsString  := qTmp.FieldByName('cat_str').AsString;
      tblTmp1.FieldByName('data_id').AsInteger := qTmp.FieldByName('data_id').AsInteger;
      tblTmp1.FieldByName('data_str').AsString := qTmp.FieldByName('data_str').AsString;
      tblTmp1.Post;

      qTmp.Next;
    end;
  end;


  if edTarihSec2.Text = 'BUGÜN' then
  begin
    QueryOpen(qKategori, 'SELECT kategori_id, kat.kategori AS kategori_str, count(env.id) ' +
                         'FROM data_envanter env ' +
                         'LEFT JOIN def_data_kategori kat ON env.kategori_id = kat.id ' +
                         'WHERE env.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) + ' ' +
                         'GROUP BY kategori_id, kategori_str ' +
                         'ORDER BY 1');

    while not qKategori.EOF do
    begin
      IDList := '';
      QueryOpen(qTmp, 'SELECT topl_amac_ids, sakl_amac_ids, payl_amac_ids FROM data_envanter WHERE active= ''E'' AND mc_id = ' +
                      IntToStr(MainMod.MCID) + ' AND kategori_id = ' + qKategori.FieldByName('kategori_id').AsString +
                      ' UNION ALL ' +
                      'SELECT topl_amac_ids, sakl_amac_ids, payl_amac_ids FROM data_envanter WHERE id in ( ' +
                       'SELECT  main_id FROM data_envanter WHERE active= ''E'' AND mc_id = ' +
                      IntToStr(MainMod.MCID) + ' AND kategori_id = ' + qKategori.FieldByName('kategori_id').AsString + ')'
                      );
      while not qTmp.EOF do
      begin
        if qTmp.FieldByName('topl_amac_ids').AsString <> '' then IDList := IDList + qTmp.FieldByName('topl_amac_ids').AsString + ',';
        if qTmp.FieldByName('sakl_amac_ids').AsString <> '' then IDList := IDList + qTmp.FieldByName('sakl_amac_ids').AsString + ',';
        if qTmp.FieldByName('payl_amac_ids').AsString <> '' then IDList := IDList + qTmp.FieldByName('payl_amac_ids').AsString + ',';
        qTmp.Next;
      end;
      if IDList <> '' then System.Delete(IDList, Length(IDList), 1);

      if IDList <> '' then
      begin
        QueryOpen(qTmp, 'SELECT DISTINCT id, amac FROM def_data_amac WHERE id IN (' + IDList + ') ORDER BY id');
        while not qTmp.EOF do
        begin
          tblTmp2.Insert;
          tblTmp2.FieldByName('cat_id').AsInteger  := qKategori.FieldByName('kategori_id').AsInteger;
          tblTmp2.FieldByName('cat_str').AsString  := qKategori.FieldByName('kategori_str').AsString;
          tblTmp2.FieldByName('data_id').AsInteger := qTmp.FieldByName('id').AsInteger;
          tblTmp2.FieldByName('data_str').AsString := qTmp.FieldByName('amac').AsString;
          tblTmp2.Post;

          qTmp.Next;
        end;
      end;

      qKategori.Next;
    end;
  end
  else
  begin
    QueryOpen(qTmp, 'SELECT * FROM rpt_verbis_veriislemeamaclari WHERE rapor_tarihi=''' + DateTimeToStr(Rapor_Tarihi2) + ''' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY cat_id, data_id');
//    if qTmp.RecordCount = 0 then
//    begin
//      MessageDlg(edTarihSec2.Text + ' tarihinde arþivlenmiþ veri bulunmamaktadýr.', mtError, [mbOk]);
//    end;
    while not qTmp.EOF do
    begin
      tblTmp2.Insert;
      tblTmp2.FieldByName('cat_id').AsInteger  := qTmp.FieldByName('cat_id').AsInteger;
      tblTmp2.FieldByName('cat_str').AsString  := qTmp.FieldByName('cat_str').AsString;
      tblTmp2.FieldByName('data_id').AsInteger := qTmp.FieldByName('data_id').AsInteger;
      tblTmp2.FieldByName('data_str').AsString := qTmp.FieldByName('data_str').AsString;
      tblTmp2.Post;

      qTmp.Next;
    end;
  end;

  tbltmp1.First;
  while not tblTmp1.Eof do
  begin
    tblAmac.Insert;
    tblAmac.FieldByName('cat_id').AsInteger   := tblTmp1.FieldByName('cat_id').AsInteger;
    tblAmac.FieldByName('cat_str').AsString   := tblTmp1.FieldByName('cat_str').AsString;
    tblAmac.FieldByName('data_str').AsString  := tblTmp1.FieldByName('data_str').AsString;
    tblAmac.FieldByName('data_id').AsInteger  := tblTmp1.FieldByName('data_id').AsInteger;
    tblAmac.FieldByName('data_flag').AsInteger:= 1;
    tblAmac.Post;
    tblTmp1.Next;
  end;
  tbltmp2.first;
  while not tbltmp2.EOF do
  begin
    buldu := false;
    tblamac.first;
    while not tblAmac.eof do
    begin
      if (tbltmp2.FieldByName('cat_id').AsInteger = tblAmac.FieldByName('cat_id').AsInteger)
        and (tbltmp2.FieldByName('data_id').AsInteger = tblAmac.FieldByName('data_id').AsInteger) then
      begin
        tblAmac.Edit;
        tblAmac.FieldByName('data_str2').AsString := tbltmp2.FieldByName('data_str').AsString;
        tblAmac.FieldByName('data_id2').AsInteger := tbltmp2.FieldByName('data_id').AsInteger;
        tblAmac.FieldByName('data_flag').AsInteger:= 3;
        tblAmac.Post;
        buldu := true;
        break;
      end;
      tblAmac.next;
    end;
    if not buldu then
    begin
      tblAmac.Insert;
      tblAmac.FieldByName('cat_id').AsInteger   := tblTmp2.FieldByName('cat_id').AsInteger;
      tblAmac.FieldByName('cat_str').AsString   := tblTmp2.FieldByName('cat_str').AsString;
      tblAmac.FieldByName('data_str2').AsString := tblTmp2.FieldByName('data_str').AsString;
      tblAmac.FieldByName('data_id2').AsInteger := tbltmp2.FieldByName('data_id').AsInteger;
      tblAmac.FieldByName('data_flag').AsInteger:= 2;
      tblAmac.Post;
    end;
    tblTmp2.next;
  end;

  tblAmac.first;
  while not tblAmac.Eof do
  begin
    buldu := false;
    if (tblAmac.FieldByName('data_str').AsString <> '') and (tblAmac.FieldByName('data_str2').AsString <> '') then
    begin
      if cbSolVarSagVar.Checked = false then
      begin
        tblAmac.Delete;
        buldu := true;
      end;
    end
    else if (tblAmac.FieldByName('data_str').AsString <> '') then
    begin
      if cbSolVarSagYok.Checked = false then
      begin
        tblAmac.Delete;
        buldu := true;
      end;
    end
    else if (tblAmac.FieldByName('data_str2').AsString <> '') then
    begin
      if cbSolYokSagVar.Checked = false then
      begin
        tblAmac.Delete;
        buldu := true;
      end;
    end;
    if buldu = false then
      tblAmac.Next;
  end;

  qAmac.Close;
  qAmac.SQL.Clear;
  qAmac.SQL.Add('SELECT * FROM tblAmac ORDER BY cat_id, data_id');
  qAmac.Open;

  gridAmac.Columns[3].Title.Caption := 'Kiþisel Veri Ýþleme Amaçlarý - ' + edTarihSec.Text;
  gridAmac.Columns[4].Title.Caption := 'Kiþisel Veri Ýþleme Amaçlarý - ' + edTarihSec2.Text;
  tbltmp1.Close;
  tbltmp2.Close;
end;


procedure TfrRptVerbisListelerDegisiklikler.PrepareReportVeriGuvenligitedbirleri;
var
  IDList : String;
  buldu: boolean;
begin
  tblTedbir.First;
  while not tblTedbir.EOF do tblTedbir.Delete;
  tblTmp1.Open;
  tblTmp1.First;
  while not tblTmp1.EOF do tblTmp1.Delete;
  tblTmp2.Open;
  tblTmp2.First;
  while not tblTmp2.EOF do tblTmp2.Delete;

  IDList := '';

  QueryOpen(qTmp, 'SELECT tedbir_ids FROM data_checklist WHERE active= ''E'' AND mc_id = ' + IntToStr(MainMod.MCID));
  while not qTmp.EOF do
  begin
    if qTmp.FieldByName('tedbir_ids').AsString <> '' then IDList := IDList + qTmp.FieldByName('tedbir_ids').AsString + ',';
    qTmp.Next;
  end;
  if IDList <> '' then System.Delete(IDList, Length(IDList), 1)
  else IDList := '0';

  if edTarihSec.Text = 'BUGÜN' then
  begin
    if IDList <> '' then
    begin
      QueryOpen(qTmp, 'SELECT DISTINCT id, tedbir FROM def_data_tedbir WHERE id IN (' + IDList + ') ORDER BY id');
      while not qTmp.EOF do
      begin
        tbltmp1.Insert;
        tbltmp1.FieldByName('data_id').AsInteger := qTmp.FieldByName('id').AsInteger;
        tbltmp1.FieldByName('data_str').AsString := qTmp.FieldByName('tedbir').AsString;
        tbltmp1.Post;

        qTmp.Next;
      end;
    end;
  end
  else
  begin
    QueryOpen(qTmp, 'SELECT * FROM rpt_verbis_guvenliktedbirleri WHERE rapor_tarihi=''' + DateTimeToStr(Rapor_Tarihi) + ''' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY data_id');

    while not qTmp.EOF do
    begin
      tbltmp1.Insert;
      tbltmp1.FieldByName('data_id').AsInteger := qTmp.FieldByName('data_id').AsInteger;
      tbltmp1.FieldByName('data_str').AsString := qTmp.FieldByName('data_str').AsString;
      tbltmp1.Post;

      qTmp.Next;
    end;
  end;

  if edTarihSec2.Text = 'BUGÜN' then
  begin
    if IDList <> '' then
    begin
      QueryOpen(qTmp, 'SELECT DISTINCT id, tedbir FROM def_data_tedbir WHERE id IN (' + IDList + ') ORDER BY id');
      while not qTmp.EOF do
      begin
        tbltmp2.Insert;
        tbltmp2.FieldByName('data_id').AsInteger := qTmp.FieldByName('id').AsInteger;
        tbltmp2.FieldByName('data_str').AsString := qTmp.FieldByName('tedbir').AsString;
        tbltmp2.Post;

        qTmp.Next;
      end;
    end;
  end
  else
  begin
    QueryOpen(qTmp, 'SELECT * FROM rpt_verbis_guvenliktedbirleri WHERE rapor_tarihi=''' + DateTimeToStr(Rapor_Tarihi2) + ''' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY data_id');

    while not qTmp.EOF do
    begin
      tbltmp2.Insert;
      tbltmp2.FieldByName('data_id').AsInteger := qTmp.FieldByName('data_id').AsInteger;
      tbltmp2.FieldByName('data_str').AsString := qTmp.FieldByName('data_str').AsString;
      tbltmp2.Post;

      qTmp.Next;
    end;
  end;

  tbltmp1.First;
  while not tblTmp1.Eof do
  begin
    tblTedbir.Insert;
    tblTedbir.FieldByName('data_str').AsString  := tblTmp1.FieldByName('data_str').AsString;
    tblTedbir.FieldByName('data_id').AsInteger  := tblTmp1.FieldByName('data_id').AsInteger;
    tblTedbir.FieldByName('data_flag').AsInteger:= 1;
    tblTedbir.Post;
    tblTmp1.Next;
  end;
  tbltmp2.first;
  while not tbltmp2.EOF do
  begin
    buldu := false;
    tblTedbir.first;
    while not tblTedbir.eof do
    begin
      if (tbltmp2.FieldByName('data_id').AsInteger = tblTedbir.FieldByName('data_id').AsInteger) then
      begin
        tblTedbir.Edit;
        tblTedbir.FieldByName('data_str2').AsString := tbltmp2.FieldByName('data_str').AsString;
        tblTedbir.FieldByName('data_id2').AsInteger := tbltmp2.FieldByName('data_id').AsInteger;
        tblTedbir.FieldByName('data_flag').AsInteger:= 3;
        tblTedbir.Post;
        buldu := true;
        break;
      end;
      tblTedbir.next;
    end;
    if not buldu then
    begin
      tblTedbir.Insert;
      tblTedbir.FieldByName('data_str2').AsString := tblTmp2.FieldByName('data_str').AsString;
      tblTedbir.FieldByName('data_id2').AsInteger := tbltmp2.FieldByName('data_id').AsInteger;
      tblTedbir.FieldByName('data_flag').AsInteger:= 2;
      tblTedbir.Post;
    end;
    tblTmp2.next;
  end;

  tblTedbir.first;
  while not tblTedbir.Eof do
  begin
    buldu := false;
    if (tblTedbir.FieldByName('data_str').AsString <> '') and (tblTedbir.FieldByName('data_str2').AsString <> '') then
    begin
      if cbSolVarSagVar.Checked = false then
      begin
        tblTedbir.Delete;
        buldu := true;
      end;
    end
    else if (tblTedbir.FieldByName('data_str').AsString <> '') then
    begin
      if cbSolVarSagYok.Checked = false then
      begin
        tblTedbir.Delete;
        buldu := true;
      end;
    end
    else if (tblTedbir.FieldByName('data_str2').AsString <> '') then
    begin
      if cbSolYokSagVar.Checked = false then
      begin
        tblTedbir.Delete;
        buldu := true;
      end;
    end;
    if buldu = false then
      tblTedbir.Next;
  end;


  qTedbir.Close;
  qTedbir.SQL.Clear;
  qTedbir.SQL.Add('SELECT * FROM tblTedbir ORDER BY data_id');
  qTedbir.Open;

  gridGuvenlikTedbir.Columns[1].Title.Caption := 'Veri Güvenliði Tedbirleri - ' + edTarihSec.Text;
  gridGuvenlikTedbir.Columns[2].Title.Caption := 'Veri Güvenliði Tedbirleri - ' + edTarihSec2.Text;
  tbltmp1.Close;
  tbltmp2.Close;

end;

procedure TfrRptVerbisListelerDegisiklikler.PrepareReportVeriKategori;
var
  sql1,
  sql2,
  whr1,
  whr2: String;
  buldu: boolean;
begin
  tblVTipi.First;
  while not tblVTipi.EOF do tblVTipi.Delete;

  if edTarihSec.Text = 'BUGÜN' then
  begin
    sql1 := 'SELECT DISTINCT kategori_id AS cat_id, kat.kategori AS cat_str, veritipi_id AS data_id, ver.veri_tipi AS data_str ' +
                         'FROM data_envanter env ' +
                         'LEFT JOIN def_data_kategori kat ON env.kategori_id = kat.id ' +
                         'LEFT JOIN def_data_veritipi ver ON env.veritipi_id = ver.id ' +
                         'WHERE env.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) + ' ';
    whr1 := ' AND kategori_id = ';
  end
  else
  begin
    sql1 := 'SELECT cat_id, cat_str, data_id, data_str FROM rpt_verbis_verikategorileri WHERE rapor_tarihi=''' + DateTimeToStr(Rapor_Tarihi) +
                    ''' AND mc_id = ' + IntToStr(MainMod.MCID);
    whr1 := ' AND cat_id = ';
  end;

  sql2 := 'SELECT cat_id, cat_str, data_id, data_str FROM rpt_verbis_verikategorileri WHERE rapor_tarihi=''' + DateTimeToStr(Rapor_Tarihi2) +
                  ''' AND mc_id = ' + IntToStr(MainMod.MCID);
  whr2 := ' AND cat_id = ';

  queryOpen(qtmp, 'SELECT DISTINCT cat_id FROM (SELECT cat_id FROM (' + sql1 + ') s1 UNION ALL SELECT cat_id FROM (' + sql2 + ') s2 ) t ORDER BY cat_id');

  while not qtmp.Eof do
  begin
    queryOpen(qtmp1, sql1 + whr1 + qTmp.fieldByName('cat_id').AsString + ' ORDER BY 3');
    queryOpen(qtmp2, sql2 + whr2 + qTmp.fieldByName('cat_id').AsString + ' ORDER BY 3');

    qTmp1.First;
    while not qtmp1.Eof do
    begin
      tblVtipi.Insert;
      tblVtipi.FieldByName('cat_id').AsInteger   := qTmp1.FieldByName('cat_id').AsInteger;
      tblVtipi.FieldByName('cat_str').AsString   := qTmp1.FieldByName('cat_str').AsString;
      tblVtipi.FieldByName('data_id').AsInteger  := qTmp1.FieldByName('data_id').AsInteger;
      tblVtipi.FieldByName('data_str').AsString  := qTmp1.FieldByName('data_str').AsString;
      tblVtipi.FieldByName('data_flag').AsInteger:= 1;
      tblVtipi.Post;
      qtmp1.Next;
    end;
    qtmp2.first;
    while not qtmp2.EOF do
    begin
      buldu := false;
      tblVtipi.first;
      while not tblVtipi.eof do
      begin
        if (qtmp2.FieldByName('cat_id').AsInteger = tblVtipi.FieldByName('cat_id').AsInteger)
          and (qtmp2.FieldByName('data_id').AsInteger = tblVtipi.FieldByName('data_id').AsInteger) then
        begin
          tblVtipi.Edit;
          tblVtipi.FieldByName('data_id2').AsInteger := qtmp2.FieldByName('data_id').AsInteger;
          tblVtipi.FieldByName('data_str2').AsString := qtmp2.FieldByName('data_str').AsString;
          tblVtipi.FieldByName('data_flag').AsInteger:= 3;
          tblVtipi.Post;
          buldu := true;
          break;
        end;
        tblVtipi.next;
      end;
      if not buldu then
      begin
        tblVtipi.Insert;
        tblVtipi.FieldByName('cat_id').AsInteger    := qTmp2.FieldByName('cat_id').AsInteger;
        tblVtipi.FieldByName('cat_str').AsString    := qTmp2.FieldByName('cat_str').AsString;
        tblVtipi.FieldByName('data_str2').AsString  := qTmp2.FieldByName('data_str').AsString;
        tblVtipi.FieldByName('data_id2').AsInteger  := qTmp2.FieldByName('data_id').AsInteger;
        tblVtipi.FieldByName('data_flag').AsInteger:= 2;
        tblVtipi.Post;
      end;
      qTmp2.next;
    end;
    qTmp.Next;
  end;


  tblVtipi.first;
  while not tblVtipi.Eof do
  begin
    buldu := false;
    if (tblVtipi.FieldByName('data_str').AsString <> '') and (tblVtipi.FieldByName('data_str2').AsString <> '') then
    begin
      if cbSolVarSagVar.Checked = false then
      begin
        tblVtipi.Delete;
        buldu := true;
      end;
    end
    else if (tblVtipi.FieldByName('data_str').AsString <> '') then
    begin
      if cbSolVarSagYok.Checked = false then
      begin
        tblVtipi.Delete;
        buldu := true;
      end;
    end
    else if (tblVtipi.FieldByName('data_str2').AsString <> '') then
    begin
      if cbSolYokSagVar.Checked = false then
      begin
        tblVtipi.Delete;
        buldu := true;
      end;
    end;
    if buldu = false then
      tblVtipi.Next;
  end;

  qVTipi.Close;
  qVTipi.SQL.Clear;
  qVTipi.SQL.Add('SELECT * FROM tblVTipi ORDER BY cat_id, data_id');
  qVTipi.Open;

  gridVeriKategorileri.Columns[3].Title.Caption := 'Ýþlenen Veri Tipleri - ' + edTarihSec.Text;
  gridVeriKategorileri.Columns[4].Title.Caption := 'Ýþlenen Veri Tipleri - ' + edTarihSec2.Text;
  qtmp1.close;
  qtmp2.close;
  qtmp.close;
end;

procedure TfrRptVerbisListelerDegisiklikler.PrepareReportVeriKonusuKisi;
var
  sql1,
  sql2,
  whr1,
  whr2: String;
  buldu: boolean;
begin
  tblKisi.First;
  while not tblKisi.EOF do tblKisi.Delete;


    QueryOpen(qTmp, 'SELECT kategori_id, kat.kategori AS kategori_str, kisi_id, kisi as kisi_str ' +
                         'FROM data_envanter env ' +
                         'LEFT JOIN def_data_kategori kat ON env.kategori_id = kat.id ' +
                         'LEFT JOIN def_data_kisi kisi ON env.kisi_id = kisi.id ' +
                         'WHERE env.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) + ' ' +
                         'GROUP BY kategori_id, kategori_str, kisi_id, kisi_str ' +
                         'ORDER BY 1');



  if edTarihSec.Text = 'BUGÜN' then
  begin
    sql1 := 'SELECT DISTINCT env.kategori_id AS cat_id, kat.kategori AS cat_str, env.kisi_id AS data_id, kisi.kisi AS data_str ' +
                         'FROM data_envanter env ' +
                         'LEFT JOIN def_data_kategori kat ON env.kategori_id = kat.id ' +
                         'LEFT JOIN def_data_kisi kisi ON env.kisi_id = kisi.id ' +
                         'WHERE env.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) + ' ';
    whr1 := ' AND kategori_id = ';
  end
  else
  begin
    sql1 := 'SELECT * FROM rpt_verbis_verikonusukisiler WHERE rapor_tarihi=''' + DateTimeToStr(Rapor_Tarihi) + ''' AND mc_id = ' + IntToStr(MainMod.MCID);
    whr1 := ' AND cat_id = ';
  end;

  if edTarihSec2.Text = 'BUGÜN' then
  begin
    sql2 := 'SELECT DISTINCT env.kategori_id AS cat_id, kat.kategori AS cat_str, env.kisi_id AS data_id, kisi.kisi AS data_str ' +
                         'FROM data_envanter env ' +
                         'LEFT JOIN def_data_kategori kat ON env.kategori_id = kat.id ' +
                         'LEFT JOIN def_data_kisi kisi ON env.kisi_id = kisi.id ' +
                         'WHERE env.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) + ' ';
    whr2 := ' AND kategori_id = ';
  end
  else
  begin
    sql2 := 'SELECT * FROM rpt_verbis_verikonusukisiler WHERE rapor_tarihi=''' + DateTimeToStr(Rapor_Tarihi2) + ''' AND mc_id = ' + IntToStr(MainMod.MCID);
    whr2 := ' AND cat_id = ';
  end;

  queryOpen(qtmp, 'SELECT DISTINCT cat_id FROM (SELECT cat_id FROM (' + sql1 + ') s1 UNION ALL SELECT cat_id FROM (' + sql2 + ') s2 ) t ORDER BY cat_id');

  while not qtmp.Eof do
  begin
    queryOpen(qtmp1, sql1 + whr1 + qTmp.fieldByName('cat_id').AsString + ' ORDER BY 3');
    queryOpen(qtmp2, sql2 + whr2 + qTmp.fieldByName('cat_id').AsString + ' ORDER BY 3');

    qtmp1.First;
    while not qtmp1.Eof do
    begin
      tblKisi.Insert;
      tblKisi.FieldByName('cat_id').AsInteger   := qtmp1.FieldByName('cat_id').AsInteger;
      tblKisi.FieldByName('cat_str').AsString   := qtmp1.FieldByName('cat_str').AsString;
      tblKisi.FieldByName('data_str').AsString  := qtmp1.FieldByName('data_str').AsString;
      tblKisi.FieldByName('data_id').AsInteger  := qtmp1.FieldByName('data_id').AsInteger;
      tblKisi.FieldByName('data_flag').AsInteger:= 1;
      tblKisi.Post;
      qtmp1.Next;
    end;
    qtmp2.first;
    while not qtmp2.EOF do
    begin
      buldu := false;
      tblKisi.first;
      while not tblKisi.eof do
      begin
        if (qtmp2.FieldByName('cat_id').AsInteger = tblKisi.FieldByName('cat_id').AsInteger)
          and (qtmp2.FieldByName('data_id').AsInteger = tblKisi.FieldByName('data_id').AsInteger) then
        begin
          tblKisi.Edit;
          tblKisi.FieldByName('data_str2').AsString := qtmp2.FieldByName('data_str').AsString;
          tblKisi.FieldByName('data_id2').AsInteger := qtmp2.FieldByName('data_id').AsInteger;
          tblKisi.FieldByName('data_flag').AsInteger:= 3;
          tblKisi.Post;
          buldu := true;
          break;
        end;
        tblKisi.next;
      end;
      if not buldu then
      begin
        tblKisi.Insert;
        tblKisi.FieldByName('cat_id').AsInteger   := qtmp2.FieldByName('cat_id').AsInteger;
        tblKisi.FieldByName('cat_str').AsString   := qtmp2.FieldByName('cat_str').AsString;
        tblKisi.FieldByName('data_str2').AsString := qtmp2.FieldByName('data_str').AsString;
        tblKisi.FieldByName('data_id2').AsInteger := qtmp2.FieldByName('data_id').AsInteger;
        tblKisi.FieldByName('data_flag').AsInteger:= 2;
        tblKisi.Post;
      end;
      qtmp2.next;
    end;

    qTmp.Next;
  end;

  tblKisi.first;
  while not tblKisi.Eof do
  begin
    buldu := false;
    if (tblKisi.FieldByName('data_str').AsString <> '') and (tblKisi.FieldByName('data_str2').AsString <> '') then
    begin
      if cbSolVarSagVar.Checked = false then
      begin
        tblKisi.Delete;
        buldu := true;
      end;
    end
    else if (tblKisi.FieldByName('data_str').AsString <> '') then
    begin
      if cbSolVarSagYok.Checked = false then
      begin
        tblKisi.Delete;
        buldu := true;
      end;
    end
    else if (tblKisi.FieldByName('data_str2').AsString <> '') then
    begin
      if cbSolYokSagVar.Checked = false then
      begin
        tblKisi.Delete;
        buldu := true;
      end;
    end;
    if buldu = false then
      tblKisi.Next;
  end;

  qKisi.Close;
  qKisi.SQL.Clear;
  qKisi.SQL.Add('SELECT * FROM tblKisi ORDER BY cat_id, data_id');
  qKisi.Open;

  gridVeriKonusuKisi.Columns[3].Title.Caption := 'Ýþlenen Veri Tipleri - ' + edTarihSec.Text;
  gridVeriKonusuKisi.Columns[4].Title.Caption := 'Ýþlenen Veri Tipleri - ' + edTarihSec2.Text;
  qtmp1.close;
  qtmp2.close;
end;

procedure TfrRptVerbisListelerDegisiklikler.PrepareReportVeriSaklamaSuresi;
var
  Buldu: boolean;
begin
  tblSure.First;
  while not tblSure.EOF do tblSure.Delete;
  tblTmp1.Open;
  tblTmp1.First;
  while not tblTmp1.EOF do tblTmp1.Delete;
  tblTmp2.Open;
  tblTmp2.First;
  while not tblTmp2.EOF do tblTmp2.Delete;

  if edTarihSec.Text = 'BUGÜN' then
  begin
    QueryOpen(qKategori, 'SELECT kategori_id, kat.kategori AS kategori_str, count(env.id) ' +
                         'FROM data_envanter env ' +
                         'LEFT JOIN def_data_kategori kat ON env.kategori_id = kat.id ' +
                         'WHERE env.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) + ' ' +
                         'GROUP BY kategori_id, kategori_str ' +
                         'ORDER BY 1');

    while not qKategori.EOF do
    begin
      QueryOpen(qTmp, 'SELECT distinct sstr FROM ( ' +
                      'SELECT sakl_ssure AS sstr FROM data_envanter env WHERE active= ''E'' AND mc_id = ' +
                      IntToStr(MainMod.MCID) + ' AND kategori_id = ' + qKategori.FieldByName('kategori_id').AsString +
                      ' UNION ' +
                      'SELECT sakl_fsure AS sstr FROM data_envanter env WHERE active= ''E'' AND mc_id = ' +
                      IntToStr(MainMod.MCID) + ' AND kategori_id = ' + qKategori.FieldByName('kategori_id').AsString +
                      ') t');
      while not qTmp.EOF do
      begin
        if qTmp.FieldByName('sstr').AsString <> '' then
        begin
          tblTmp1.Insert;
          tblTmp1.FieldByName('cat_id').AsInteger  := qKategori.FieldByName('kategori_id').AsInteger;
          tblTmp1.FieldByName('cat_str').AsString  := qKategori.FieldByName('kategori_str').AsString;
          tblTmp1.FieldByName('data_str').AsString := qTmp.FieldByName('sstr').AsString;
          tblTmp1.Post;
        end;
        qTmp.Next;
      end;

      qKategori.Next;
    end;
  end
  else
  begin
    QueryOpen(qTmp, 'SELECT * FROM rpt_verbis_verisaklamasureleri WHERE rapor_tarihi=''' + DateTimeToStr(Rapor_Tarihi) + ''' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY cat_id, data_str');

    while not qTmp.EOF do
    begin
      tblTmp1.Insert;
      tblTmp1.FieldByName('cat_id').AsInteger  := qTmp.FieldByName('cat_id').AsInteger;
      tblTmp1.FieldByName('cat_str').AsString  := qTmp.FieldByName('cat_str').AsString;
      tblTmp1.FieldByName('data_str').AsString := qTmp.FieldByName('data_str').AsString;
      tblTmp1.Post;

      qTmp.Next;
    end;
  end;

  if edTarihSec2.Text = 'BUGÜN' then
  begin
    QueryOpen(qKategori, 'SELECT kategori_id, kat.kategori AS kategori_str, count(env.id) ' +
                         'FROM data_envanter env ' +
                         'LEFT JOIN def_data_kategori kat ON env.kategori_id = kat.id ' +
                         'WHERE env.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) + ' ' +
                         'GROUP BY kategori_id, kategori_str ' +
                         'ORDER BY 1');

    while not qKategori.EOF do
    begin
      QueryOpen(qTmp, 'SELECT distinct sstr FROM ( ' +
                      'SELECT sakl_ssure AS sstr FROM data_envanter env WHERE active= ''E'' AND mc_id = ' +
                      IntToStr(MainMod.MCID) + ' AND kategori_id = ' + qKategori.FieldByName('kategori_id').AsString +
                      ' UNION ' +
                      'SELECT sakl_fsure AS sstr FROM data_envanter env WHERE active= ''E'' AND mc_id = ' +
                      IntToStr(MainMod.MCID) + ' AND kategori_id = ' + qKategori.FieldByName('kategori_id').AsString +
                      ') t');
      while not qTmp.EOF do
      begin
        if qTmp.FieldByName('sstr').AsString <> '' then
        begin
          tblTmp2.Insert;
          tblTmp2.FieldByName('cat_id').AsInteger  := qKategori.FieldByName('kategori_id').AsInteger;
          tblTmp2.FieldByName('cat_str').AsString  := qKategori.FieldByName('kategori_str').AsString;
          tblTmp2.FieldByName('data_str').AsString := qTmp.FieldByName('sstr').AsString;
          tblTmp2.Post;
        end;

        qTmp.Next;
      end;

      qKategori.Next;
    end;
  end
  else
  begin
    QueryOpen(qTmp, 'SELECT * FROM rpt_verbis_verisaklamasureleri WHERE rapor_tarihi=''' + DateTimeToStr(Rapor_Tarihi2) + ''' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY cat_id, data_str');

    while not qTmp.EOF do
    begin
      tblTmp2.Insert;
      tblTmp2.FieldByName('cat_id').AsInteger  := qTmp.FieldByName('cat_id').AsInteger;
      tblTmp2.FieldByName('cat_str').AsString  := qTmp.FieldByName('cat_str').AsString;
      tblTmp2.FieldByName('data_str').AsString := qTmp.FieldByName('data_str').AsString;
      tblTmp2.Post;

      qTmp.Next;
    end;
  end;

  tbltmp1.First;
  while not tblTmp1.Eof do
  begin
    tblSure.Insert;
    tblSure.FieldByName('cat_id').AsInteger   := tblTmp1.FieldByName('cat_id').AsInteger;
    tblSure.FieldByName('cat_str').AsString   := tblTmp1.FieldByName('cat_str').AsString;
    tblSure.FieldByName('data_str').AsString  := tblTmp1.FieldByName('data_str').AsString;
    tblSure.FieldByName('data_flag').AsInteger:= 1;
    tblSure.Post;
    tblTmp1.Next;
  end;
  tbltmp2.first;
  while not tbltmp2.EOF do
  begin
    buldu := false;
    tblSure.first;
    while not tblSure.eof do
    begin
      if (tbltmp2.FieldByName('cat_id').AsInteger = tblSure.FieldByName('cat_id').AsInteger)
        and (tbltmp2.FieldByName('data_str').AsString = tblSure.FieldByName('data_str').AsString) then
      begin
        tblSure.Edit;
        tblSure.FieldByName('data_str2').AsString := tbltmp2.FieldByName('data_str').AsString;
        tblSure.FieldByName('data_flag').AsInteger:= 3;
        tblSure.Post;
        buldu := true;
        break;
      end;
      tblSure.next;
    end;
    if not buldu then
    begin
      tblSure.Insert;
      tblSure.FieldByName('cat_id').AsInteger   := tblTmp2.FieldByName('cat_id').AsInteger;
      tblSure.FieldByName('cat_str').AsString   := tblTmp2.FieldByName('cat_str').AsString;
      tblSure.FieldByName('data_str2').AsString  := tblTmp2.FieldByName('data_str').AsString;
      tblSure.FieldByName('data_flag').AsInteger:= 2;
      tblSure.Post;
    end;
    tblTmp2.next;
  end;
  tblsure.first;
  while not tblsure.Eof do
  begin
    buldu := false;
    if (tblsure.FieldByName('data_str').AsString <> '') and (tblsure.FieldByName('data_str2').AsString <> '') then
    begin
      if cbSolVarSagVar.Checked = false then
      begin
        tblSure.Delete;
        buldu := true;
      end;
    end
    else if (tblsure.FieldByName('data_str').AsString <> '') then
    begin
      if cbSolVarSagYok.Checked = false then
      begin
        tblSure.Delete;
        buldu := true;
      end;
    end
    else if (tblsure.FieldByName('data_str2').AsString <> '') then
    begin
      if cbSolYokSagVar.Checked = false then
      begin
        tblSure.Delete;
        buldu := true;
      end;
    end;
    if buldu = false then
      tblSure.Next;
  end;

{
  tblTmp1.First;
  tblTmp2.First;
  while (not tblTmp1.EOF) or (not tblTmp2.EOF) do
  begin
    if (tblTmp1.FieldByName('data_str').AsString = tblTmp2.FieldByName('data_str').AsString) then
    begin
      if cbSolVarSagVar.Checked then
      begin
        tblSure.Insert;
        tblSure.FieldByName('cat_id').AsInteger   := tblTmp1.FieldByName('cat_id').AsInteger;
        tblSure.FieldByName('cat_str').AsString   := tblTmp1.FieldByName('cat_str').AsString;
        tblSure.FieldByName('data_str').AsString  := tblTmp1.FieldByName('data_str').AsString;
        tblSure.FieldByName('data_str2').AsString := tblTmp2.FieldByName('data_str').AsString;
        tblSure.FieldByName('data_flag').AsInteger:= 3;
        tblSure.Post;
      end;
      tblTmp1.Next;
      tblTmp2.Next;
    end
    else
    if (tblTmp1.FieldByName('data_str').AsString < tblTmp2.FieldByName('data_str').AsString)
      and (tblTmp1.FieldByName('data_str').AsString <> '') and (not tbltmp1.EOF) then
    begin
      if cbSolVarSagYok.Checked then
      begin
        tblSure.Insert;
        tblSure.FieldByName('cat_id').AsInteger   := tblTmp1.FieldByName('cat_id').AsInteger;
        tblSure.FieldByName('cat_str').AsString   := tblTmp1.FieldByName('cat_str').AsString;
        tblSure.FieldByName('data_str').AsString  := tblTmp1.FieldByName('data_str').AsString;
        tblSure.FieldByName('data_str2').AsString := '';
        tblSure.FieldByName('data_flag').AsInteger:= 1;
        tblSure.Post;
      end;
      tblTmp1.Next;
    end
    else
    if (tblTmp1.FieldByName('data_str').AsString > tblTmp2.FieldByName('data_str').AsString)
      and (tblTmp2.FieldByName('data_str').AsString <> '') and (not tbltmp2.EOF) then
    begin
      if cbSolYokSagVar.Checked then
      begin
        tblSure.Insert;
        tblSure.FieldByName('cat_id').AsInteger   := tblTmp2.FieldByName('cat_id').AsInteger;
        tblSure.FieldByName('cat_str').AsString   := tblTmp2.FieldByName('cat_str').AsString;
        tblSure.FieldByName('data_str').AsString  := '';
        tblSure.FieldByName('data_str2').AsString := tblTmp2.FieldByName('data_str').AsString;
        tblSure.FieldByName('data_flag').AsInteger:= 2;
        tblSure.Post;
      end;
      tblTmp2.Next;
    end
    else
    if (not tbltmp1.EOF) then
    begin
      if cbSolVarSagYok.Checked then
      begin
        tblSure.Insert;
        tblSure.FieldByName('cat_id').AsInteger   := tblTmp1.FieldByName('cat_id').AsInteger;
        tblSure.FieldByName('cat_str').AsString   := tblTmp1.FieldByName('cat_str').AsString;
        tblSure.FieldByName('data_str').AsString  := tblTmp1.FieldByName('data_str').AsString;
        tblSure.FieldByName('data_str2').AsString := '';
        tblSure.FieldByName('data_flag').AsInteger:= 1;
        tblSure.Post;
      end;
      tblTmp1.Next;
    end
    else
    if (not tbltmp2.EOF) then
    begin
      if cbSolYokSagVar.Checked then
      begin
        tblSure.Insert;
        tblSure.FieldByName('cat_id').AsInteger   := tblTmp2.FieldByName('cat_id').AsInteger;
        tblSure.FieldByName('cat_str').AsString   := tblTmp2.FieldByName('cat_str').AsString;
        tblSure.FieldByName('data_str').AsString  := '';
        tblSure.FieldByName('data_str2').AsString := tblTmp2.FieldByName('data_str').AsString;
        tblSure.FieldByName('data_flag').AsInteger:= 2;
        tblSure.Post;
      end;
      tblTmp2.Next;
    end;
  end;
}

  qSure.Close;
  qSure.SQL.Clear;
  qSure.SQL.Add('SELECT * FROM tblSure ORDER BY cat_id, data_str');
  qSure.Open;

  gridSaklamaSuresi.Columns[2].Title.Caption := 'Veri Saklama Süreleri - ' + edTarihSec.Text;
  gridSaklamaSuresi.Columns[3].Title.Caption := 'Veri Saklama Süreleri - ' + edTarihSec2.Text;
  tbltmp1.Close;
  tbltmp2.Close;
end;

procedure TfrRptVerbisListelerDegisiklikler.tblAliciBeforePost(
  DataSet: TDataSet);
begin
  if (tblAlici.FieldByName('data_str').AsString <>
  tblAlici.FieldByName('data_str2').AsString) then
  begin
    tblAlici.FieldByName('mesaj_str').AsString := 'DEÐÝÞÝKLÝK VAR';
  end
  else tblAlici.FieldByName('mesaj_str').AsString := 'DEÐÝÞÝKLÝK YOK';
end;

procedure TfrRptVerbisListelerDegisiklikler.tblAmacBeforePost(
  DataSet: TDataSet);
begin
  if (tblAmac.FieldByName('data_str').AsString <>
  tblAmac.FieldByName('data_str2').AsString) then
  begin
    tblAmac.FieldByName('mesaj_str').AsString := 'DEÐÝÞÝKLÝK VAR';
  end
  else tblAmac.FieldByName('mesaj_str').AsString := 'DEÐÝÞÝKLÝK YOK';
end;

procedure TfrRptVerbisListelerDegisiklikler.tblKisiBeforePost(
  DataSet: TDataSet);
begin
  if (tblKisi.FieldByName('data_str').AsString <>
  tblKisi.FieldByName('data_str2').AsString) then
  begin
    tblKisi.FieldByName('mesaj_str').AsString := 'DEÐÝÞÝKLÝK VAR';
  end
  else tblKisi.FieldByName('mesaj_str').AsString := 'DEÐÝÞÝKLÝK YOK';
end;

procedure TfrRptVerbisListelerDegisiklikler.tblSureBeforePost(
  DataSet: TDataSet);
begin
  if (tblSure.FieldByName('data_str').AsString <>
  tblSure.FieldByName('data_str2').AsString) then
  begin
    tblSure.FieldByName('mesaj_str').AsString := 'DEÐÝÞÝKLÝK VAR';
  end
  else tblSure.FieldByName('mesaj_str').AsString := 'DEÐÝÞÝKLÝK YOK';
end;

procedure TfrRptVerbisListelerDegisiklikler.tblTedbirBeforePost(
  DataSet: TDataSet);
begin
  if (tblTedbir.FieldByName('data_str').AsString <>
  tblTedbir.FieldByName('data_str2').AsString) then
  begin
    tblTedbir.FieldByName('mesaj_str').AsString := 'DEÐÝÞÝKLÝK VAR';
  end
  else tblTedbir.FieldByName('mesaj_str').AsString := 'DEÐÝÞÝKLÝK YOK';
end;

procedure TfrRptVerbisListelerDegisiklikler.tblVTipiBeforePost(
  DataSet: TDataSet);
begin
  if (tblVTipi.FieldByName('data_str').AsString <>
  tblVTipi.FieldByName('data_str2').AsString) then
  begin
    tblVTipi.FieldByName('mesaj_str').AsString := 'DEÐÝÞÝKLÝK VAR';
  end
  else tblVTipi.FieldByName('mesaj_str').AsString := 'DEÐÝÞÝKLÝK YOK';
end;

procedure TfrRptVerbisListelerDegisiklikler.tblYabanciBeforePost(
  DataSet: TDataSet);
begin
  if (tblYabanci.FieldByName('data_str').AsString <>
  tblYabanci.FieldByName('data_str2').AsString) then
  begin
    tblYabanci.FieldByName('mesaj_str').AsString := 'DEÐÝÞÝKLÝK VAR';
  end
  else tblYabanci.FieldByName('mesaj_str').AsString := 'DEÐÝÞÝKLÝK YOK';
end;

procedure TfrRptVerbisListelerDegisiklikler.gridVeriKategorileriColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
begin
  if SameText(Column.FieldName, 'cat_id') then begin end;
end;

procedure TfrRptVerbisListelerDegisiklikler.gridVeriKategorileriDrawColumnCell(
  Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if (gridVeriKategorileri.DataSource.DataSet.FieldByName('data_str').AsString = '')
    and (gridVeriKategorileri.DataSource.DataSet.FieldByName('data_str2').AsString <> '') then
  begin
    Attribs.Font.Style := [fsBold];
    Attribs.Color := $00C0C0FF;
  end
  else
  if (gridVeriKategorileri.DataSource.DataSet.FieldByName('data_str').AsString <> '')
    and (gridVeriKategorileri.DataSource.DataSet.FieldByName('data_str2').AsString = '') then
  begin
    Attribs.Font.Style := [fsBold];
    Attribs.Color := $00C0FFFF;
  end
  else
  if (gridVeriKategorileri.DataSource.DataSet.FieldByName('data_str').AsString <>
    gridVeriKategorileri.DataSource.DataSet.FieldByName('data_str2').AsString) then
  begin
    Attribs.Font.Style := [fsBold];
    Attribs.Color := $00B58A0B;    //Doðan Akçay $00C0C0C0  Fark edilir bir renk ile deðiþtirildi Talep numarasý: 591
  end;
end;

procedure TfrRptVerbisListelerDegisiklikler.gridVeriKonusuKisiColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
begin
  if SameText(Column.FieldName, 'cat_id') then begin end;
end;

procedure TfrRptVerbisListelerDegisiklikler.gridVeriKonusuKisiDrawColumnCell(
  Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if (gridVeriKonusuKisi.DataSource.DataSet.FieldByName('data_str').AsString = '')
    and (gridVeriKonusuKisi.DataSource.DataSet.FieldByName('data_str2').AsString <> '') then
  begin
    Attribs.Font.Style := [fsBold];
    Attribs.Color := $00C0C0FF;
  end
  else
  if (gridVeriKonusuKisi.DataSource.DataSet.FieldByName('data_str').AsString <> '')
    and (gridVeriKonusuKisi.DataSource.DataSet.FieldByName('data_str2').AsString = '') then
  begin
    Attribs.Font.Style := [fsBold];
    Attribs.Color := $00C0FFFF;
  end
  else
  if (gridVeriKonusuKisi.DataSource.DataSet.FieldByName('data_str').AsString <>
    gridVeriKonusuKisi.DataSource.DataSet.FieldByName('data_str2').AsString) then
  begin
    Attribs.Font.Style := [fsBold];
    Attribs.Color := $00B58A0B; //Doðan Akçay $00C0C0C0  Fark edilir bir renk ile deðiþtirildi Talep numarasý: 591
  end;
end;

procedure TfrRptVerbisListelerDegisiklikler.gridAktarimAliciColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
begin
//  if SameText(Column.FieldName, 'cat_id') then begin end;
end;

procedure TfrRptVerbisListelerDegisiklikler.gridAktarimAliciDrawColumnCell(
  Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if (gridAktarimAlici.DataSource.DataSet.FieldByName('data_str').AsString = '')
    and (gridAktarimAlici.DataSource.DataSet.FieldByName('data_str2').AsString <> '') then
  begin
    Attribs.Font.Style := [fsBold];
    Attribs.Color := $00C0C0FF;
  end
  else
  if (gridAktarimAlici.DataSource.DataSet.FieldByName('data_str').AsString <> '')
    and (gridAktarimAlici.DataSource.DataSet.FieldByName('data_str2').AsString = '') then
  begin
    Attribs.Font.Style := [fsBold];
    Attribs.Color := $00C0FFFF;
  end
  else
  if (gridAktarimAlici.DataSource.DataSet.FieldByName('data_str').AsString <>
    gridAktarimAlici.DataSource.DataSet.FieldByName('data_str2').AsString) then
  begin
    Attribs.Font.Style := [fsBold];
    Attribs.Color := $00B58A0B;   //Doðan Akçay $00C0C0C0  Fark edilir bir renk ile deðiþtirildi Talep numarasý: 591
  end;
end;

procedure TfrRptVerbisListelerDegisiklikler.gridAktarimYabanciColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
begin
  if SameText(Column.FieldName, 'cat_id') then begin end;
end;

procedure TfrRptVerbisListelerDegisiklikler.gridAktarimYabanciDrawColumnCell(
  Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if (gridAktarimYabanci.DataSource.DataSet.FieldByName('data_str').AsString = '')
    and (gridAktarimYabanci.DataSource.DataSet.FieldByName('data_str2').AsString <> '') then
  begin
    Attribs.Font.Style := [fsBold];
    Attribs.Color := $00C0C0FF;
  end
  else
  if (gridAktarimYabanci.DataSource.DataSet.FieldByName('data_str').AsString <> '')
    and (gridAktarimYabanci.DataSource.DataSet.FieldByName('data_str2').AsString = '') then
  begin
    Attribs.Font.Style := [fsBold];
    Attribs.Color := $00C0FFFF;
  end
  else
  if (gridAktarimYabanci.DataSource.DataSet.FieldByName('data_str').AsString <>
    gridAktarimYabanci.DataSource.DataSet.FieldByName('data_str2').AsString) then
  begin
    Attribs.Font.Style := [fsBold];
    Attribs.Color := $00B58A0B;    //Doðan Akçay $00C0C0C0  Fark edilir bir renk ile deðiþtirildi Talep numarasý: 591
  end;
end;

procedure TfrRptVerbisListelerDegisiklikler.gridAmacColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
begin
  if SameText(Column.FieldName, 'cat_id') then begin end;
end;

procedure TfrRptVerbisListelerDegisiklikler.gridAmacDrawColumnCell(
  Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if (gridAmac.DataSource.DataSet.FieldByName('data_str').AsString = '')
    and (gridAmac.DataSource.DataSet.FieldByName('data_str2').AsString <> '') then
  begin
    Attribs.Font.Style := [fsBold];
    Attribs.Color := $00C0C0FF;
  end
  else
  if (gridAmac.DataSource.DataSet.FieldByName('data_str').AsString <> '')
    and (gridAmac.DataSource.DataSet.FieldByName('data_str2').AsString = '') then
  begin
    Attribs.Font.Style := [fsBold];
    Attribs.Color := $00C0FFFF;
  end
  else
  if (gridAmac.DataSource.DataSet.FieldByName('data_str').AsString <>
    gridAmac.DataSource.DataSet.FieldByName('data_str2').AsString) then
  begin
    Attribs.Font.Style := [fsBold];
    Attribs.Color := $00B58A0B;  // $00B58A0B   //Doðan Akçay $00C0C0C0  Fark edilir bir renk ile deðiþtirildi Talep numarasý: 591
  end;
end;

procedure TfrRptVerbisListelerDegisiklikler.gridGuvenlikTedbirColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
begin
  if SameText(Column.FieldName, 'cat_id') then begin end;
end;

procedure TfrRptVerbisListelerDegisiklikler.gridGuvenlikTedbirDrawColumnCell(
  Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if (gridGuvenlikTedbir.DataSource.DataSet.FieldByName('data_str').AsString = '')
    and (gridGuvenlikTedbir.DataSource.DataSet.FieldByName('data_str2').AsString <> '') then
  begin
    Attribs.Font.Style := [fsBold];
    Attribs.Color := $00C0C0FF;
  end
  else
  if (gridGuvenlikTedbir.DataSource.DataSet.FieldByName('data_str').AsString <> '')
    and (gridGuvenlikTedbir.DataSource.DataSet.FieldByName('data_str2').AsString = '') then
  begin
    Attribs.Font.Style := [fsBold];
    Attribs.Color := $00C0FFFF;
  end
  else
  if (gridGuvenlikTedbir.DataSource.DataSet.FieldByName('data_str').AsString <>
    gridGuvenlikTedbir.DataSource.DataSet.FieldByName('data_str2').AsString) then
  begin
    Attribs.Font.Style := [fsBold];
    Attribs.Color := $00B58A0B;  //Doðan Akçay $00C0C0C0  Fark edilir bir renk ile deðiþtirildi Talep numarasý: 591
  end;
end;

procedure TfrRptVerbisListelerDegisiklikler.gridSaklamaSuresiColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
begin
  if SameText(Column.FieldName, 'cat_id') then begin end;
end;

procedure TfrRptVerbisListelerDegisiklikler.gridSaklamaSuresiDrawColumnCell(
  Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if (gridSaklamaSuresi.DataSource.DataSet.FieldByName('data_str').AsString = '')
    and (gridSaklamaSuresi.DataSource.DataSet.FieldByName('data_str2').AsString <> '') then
  begin
    Attribs.Font.Style := [fsBold];
    Attribs.Color := $00C0C0FF;
  end
  else
  if (gridSaklamaSuresi.DataSource.DataSet.FieldByName('data_str').AsString <> '')
    and (gridSaklamaSuresi.DataSource.DataSet.FieldByName('data_str2').AsString = '') then
  begin
    Attribs.Font.Style := [fsBold];
    Attribs.Color := $00C0FFFF;
  end
  else
  if (gridSaklamaSuresi.DataSource.DataSet.FieldByName('data_str').AsString <>
    gridSaklamaSuresi.DataSource.DataSet.FieldByName('data_str2').AsString) then
  begin
    Attribs.Font.Style := [fsBold];
    Attribs.Color := $00B58A0B;    //Doðan Akçay $00C0C0C0  Fark edilir bir renk ile deðiþtirildi Talep numarasý: 591
  end;
end;

procedure TfrRptVerbisListelerDegisiklikler.UniDBGridToExcel(
  UniDBGrid: TUniDBGrid);
var
  ExcelApp: Variant;
  Sheet: Variant;
  i, j: Integer;
begin
  try
    // Excel uygulamasýný baþlat
    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.Visible := True;

    // Yeni bir çalýþma kitabý oluþtur
    ExcelApp.Workbooks.Add;
    Sheet := ExcelApp.ActiveSheet;

    // UniDBGrid verilerini Excel'e kopyala
    for i := 0 to UniDBGrid.DataSource.DataSet.RecordCount - 1 do
    begin
      for j := 0 to UniDBGrid.Columns.Count - 1 do
      begin
        Sheet.Cells[i + 1, j + 1] := UniDBGrid.DataSource.DataSet.FieldByName(UniDBGrid.Columns[j].FieldName).AsString;
      end;
      UniDBGrid.DataSource.DataSet.Next;
    end;
  finally
    // Excel uygulamasýný serbest býrak
    ExcelApp := Unassigned;
  end;
end;

procedure TfrRptVerbisListelerDegisiklikler.UniFrameCreate(Sender: TObject);
begin

  UniPageControl1.ActivePageIndex := 0; // Added by TEVFIK 29.05.2023 16:19:35
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
  edTarihSec.ItemIndex := 0;
  edTarihSec2.Items.Clear;

  ShowMask('Lütfen bekleyiniz...');
  UniSession.Synchronize;
  QueryOpen(qtmp, 'SELECT DISTINCT rapor_tarihi FROM rpt_verbis_verikategorileri WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY rapor_tarihi DESC');
  while not qtmp.Eof do
  begin
    edTarihSec.Items.Add(qtmp.fieldbyname('rapor_tarihi').AsString);
    edTarihSec2.Items.Add(qtmp.fieldbyname('rapor_tarihi').AsString);
    qtmp.Next;
  end;
  HideMask;

  if edTarihSec2.Items.Count > 1 then
    edTarihSec2.ItemIndex := 1;
end;

initialization
  RegisterClass(TfrRptVerbisListelerDegisiklikler);

end.
