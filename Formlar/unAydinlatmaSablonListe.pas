unit unAydinlatmaSablonListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Data.DB, DBAccess, Uni, uniGUITypes, uniGUIAbstractClasses, uniGUIClasses,
  uniGUIFrame, uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniButton,
  uniBitBtn, uniLabel, uniEdit, uniGUIBaseClasses, uniPanel, System.Actions,
  Vcl.ActnList, uniMenuButton, Vcl.Menus, uniMainMenu, MemDS, VirtualTable,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report, FlexCel.Render,
  rXMLReport, uniImage, frxClass, frxDBSet, frxExportBaseDialog, frxExportXLS,
  frxExportDOCX, frxExportPDF, IniFiles, Registry, uniScreenMask,IOUtils;

type
  TfrAydinlatmaSablonListe = class(TUniFrame)
    ActList: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDownload: TAction;
    actSearch: TAction;
    actClose: TAction;
    dsAydinlatma: TUniDataSource;
    pnlTop: TUniPanel;
    edSrcText: TUniEdit;
    UniLabel1: TUniLabel;
    btnSearch: TUniBitBtn;
    btnClose: TUniBitBtn;
    btnAdd: TUniBitBtn;
    btnEdit: TUniBitBtn;
    UniLabel2: TUniLabel;
    edSrcDurumu: TUniComboBox;
    edSrcTipi: TUniComboBox;
    UniDBGrid1: TUniDBGrid;
    btnDownload: TUniMenuButton;
    ppmDownload: TUniPopupMenu;
    qTmp: TUniQuery;
    qSure: TUniQuery;
    tblAktarim: TVirtualTable;
    btnHelp: TUniBitBtn;
    UniLabel3: TUniLabel;
    edSrcDept: TUniComboBox;
    edSrcIys: TUniComboBox;
    actExcel: TAction;
    qExport: TUniQuery;
    DOCXRpt: TrXMLReport;
    tblKatVeriTipi: TVirtualTable;
    qAmac: TUniQuery;
    qDayanak: TUniQuery;
    qMetod: TUniQuery;
    ppmExcel: TUniPopupMenu;
    UniMenuItem5: TUniMenuItem;
    UniMenuItem6: TUniMenuItem;
    actImportExcel: TAction;
    UniMenuButton1: TUniMenuButton;
    ListeyiExceleKaydet1: TUniMenuItem;
    actTopluKarekod: TAction;
    tblKarekod: TVirtualTable;
    frxReportKarekod: TfrxReport;
    frxdsKarekod: TfrxDBDataset;
    frxXLSExport1: TfrxXLSExport;
    KarekodlarTopluKaydet1: TUniMenuItem;
    frxDOCXExport1: TfrxDOCXExport;
    frxReportKarekodA5: TfrxReport;
    frxDsMcDef: TfrxDBDataset;
    KarekodlarTopluKaydetA51: TUniMenuItem;
    actTopluKarekodA5: TAction;
    frxPDFExport1: TfrxPDFExport;
    UniLabel4: TUniLabel;
    AydnlatmaveAkRzaBelgesiPDF1: TUniMenuItem;
    AydnlatmaveAkRzaablonunuGncelle1: TUniMenuItem;
    N1: TUniMenuItem;
    qDocs: TUniQuery;
    ppmData: TUniPopupMenu;
    YeniKayt1: TUniMenuItem;
    Deitir1: TUniMenuItem;
    ndir1: TUniMenuItem;
    AydnlatmaveAkRzaablonuPDF1: TUniMenuItem;
    N2: TUniMenuItem;
    AydveARabGncelle1: TUniMenuItem;
    ListeyiExceleKaydet2: TUniMenuItem;
    N3: TUniMenuItem;
    N4: TUniMenuItem;
    N5: TUniMenuItem;
    oplulemler1: TUniMenuItem;
    ListeyiExceleKaydet3: TUniMenuItem;
    ListeyiExceleKaydet4: TUniMenuItem;
    KarekodlarTopluKaydet2: TUniMenuItem;
    KarekodAfileriTopluKaydet1: TUniMenuItem;
    Yardm1: TUniMenuItem;
    Kapat1: TUniMenuItem;
    UniScreenMask1: TUniScreenMask;
    lbKayitSayisi: TUniLabel;
    btnMetinGuncelle: TUniBitBtn;
    btnTest: TUniButton;
    procedure UniFrameCreate(Sender: TObject);
    procedure edSrcTipiChange(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure ppmiAydinlatmaMetniClick(Sender: TObject);
    procedure ppmiAcikRizaBeyaniClick(Sender: TObject);
    procedure UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure btnHelpClick(Sender: TObject);
    procedure edSrcIysChange(Sender: TObject);
    procedure actExcelExecute(Sender: TObject);
    procedure DOCXRptUserCalc(Sender: TObject; var CalcStr: string; var Replace: Boolean);
    procedure actImportExcelExecute(Sender: TObject);
    procedure actTopluKarekodExecute(Sender: TObject);
    procedure actTopluKarekodA5Execute(Sender: TObject);
    procedure AydnlatmaveAkRzaablonunuGncelle1Click(Sender: TObject);
    procedure AydnlatmaveAkRzaBelgesiPDF1Click(Sender: TObject);
    procedure UniDBGrid1AjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure actDenemeExecute(Sender: TObject);
    procedure edSrcDeptChange(Sender: TObject);
    procedure btnMetinGuncelleClick(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
  private
    DeptIdList: TStringList;
    procedure NewSQL;
    procedure ManageSettings;
    procedure DefVariables(VL: TStrings);
    procedure Download(ADoc, AName: string);

    function MakeStr_AR_VeriTipi(LineFeed: Boolean): string;
    function MakeStr_AR_IslemePaylasmaAmaci(LineFeed: Boolean): string;
    function MakeStr_AR_AktarilacakYerler(LineFeed: Boolean): string;
    procedure PrepTbl_AM_KategoriVeriTipi;
    procedure PrepTbl_AM_IslemeAmaci;
    procedure PrepTbl_AM_HukukiDayanaklar;
    procedure PrepTbl_AM_ToplamaMetodu;
    procedure PrepTbl_AM_VeriAktarimYerleri;
    procedure PrepTbl_AM_SaklamaSureleri;
    procedure AdinlatmaAcikRizaSablonGuncelle;
    procedure AydinlatmaMetniTest(AAydGuiId:string);


  public
    procedure KeyDown(var Key: Word; Shift: TShiftState);
  end;

implementation

{$R *.dfm}

uses
  MainModule, ServerModule, McMLib, Main, unAydinlatmaSablonTanim, unHelpPage,
  unAydinlatmaSablonTopluIslem;

const
  ParantezAc: string = #13'(';
  ParantezKapat: string = ')'#13;

procedure TfrAydinlatmaSablonListe.actExcelExecute(Sender: TObject);
var
  i: Integer;
  Report: TFlexCelReport;
  FName: string;
  TmpName: string;
  FUrl: string;
  SQLStr, srcText, WhereStr, deptstr: string;
begin
  if MainMod.qAydinlatma.RecordCount < 1 then Exit;
  
  SQLStr := 'SELECT distinct ayd.id as ref_no, ayd.kisi_id as ilgili_kisi_no, ' +
      'kisi.kisi as ilgili_kisi, ayd.tanim, ayd.durum, ' +
      'case when ayd.acik_riza =''E'' then ''AÇIK RIZA'' else ''AYDINLATMA'' ' +
      ' end as dokuman_turu, ' + 'case when ayd.iys_var = ''E'' then ''VAR'' else ''YOK'' ' +
      ' end as iys_entegrasyonu, ' + '(''' + MainMod.AydinlatmaLink +
      ''' || ayd.aguid)::character varying (200) AS web_adresi, ' +
      'ayd.description as aciklama, ' +
      ' (case when COALESCE(dp.main_dept_id,0) > 0 THEN  dp.title||'' (''||dp_main.title||'') '' else dp.title end)::character varying(410) AS departman ' +
//      ' dp.title departman ' +
      ' FROM def_data_aydinlatma ayd ' +
      ' LEFT JOIN def_data_kisi kisi ON kisi.id = ayd.kisi_id ' +
      ' LEFT JOIN data_envanter env ON env.kisi_id=ayd.kisi_id and env.active=''E'' ' +
      ' LEFT JOIN sys_deptdef dp ON env.dept_id = dp.id ' +
      ' LEFT JOIN sys_deptdef dp_main ON dp_main.id = dp.main_dept_id '
      ;

  WhereStr := ' ayd.mc_id = ' + IntToStr(MainMod.MCID) + ' AND ';
  if edSrcDurumu.ItemIndex > 0 then
    WhereStr := WhereStr + 'ayd.durum = ''' + edSrcDurumu.Text + ''' AND ';

  if edSrcText.Text <> '' then
  begin
    srcText := StringReplace(edSrcText.Text, '*', '%', [rfReplaceAll]);
    case edSrcTipi.ItemIndex of
      0:
        WhereStr := WhereStr + 'ayd.id = ' + IntToStr(StrToIntDef(edSrcText.Text, 0)) + ' AND ';
      1:
        WhereStr := WhereStr + 'ayd.tanim LIKE ''%' + srcText + '%'' AND ';
      2:
        WhereStr := WhereStr + 'kisi.kisi LIKE ''%' + srcText + '%'' AND ';
      3:
        WhereStr := WhereStr + 'ayd.description LIKE ''%' + srcText + '%'' AND ';
    end;
  end;

  if mainMod.iysvar and (edSrcIys.Text <> '') then
  begin
    case edSrcIys.ItemIndex of
      1:
        WhereStr := WhereStr + 'coalesce(ayd.iys_var, ''H'') = ''E'' AND ';
      2:
        WhereStr := WhereStr + 'coalesce(ayd.iys_var, ''H'') = ''H'' AND ';
    end;
  end;

  if edSrcDept.ItemIndex > 0 then
  begin
    WhereStr := WhereStr + 'ayd.kisi_id in (SELECT env.kisi_id FROM data_envanter env ' + 'WHERE env.kisi_id=ayd.kisi_id and env.active=''E'' and env.dept_id = ' + deptIdList[edSrcDept.ItemIndex] + ') AND ';
  end
  else
  begin
    deptstr := 'ayd.kisi_id IN (SELECT env.kisi_id FROM data_envanter env WHERE env.kisi_id = ayd.kisi_id ' + 'AND ( ';
    for i := 0 to deptIdList.Count - 1 do
      deptstr := deptstr + 'env.dept_id = ' + deptIdList[i] + ' OR ';
    if deptstr <> '' then
    begin
      WhereStr := WhereStr + copy(deptstr, 1, length(deptstr) - 3) + ') ) AND ';
    end;
  end;

  if Trim(WhereStr) <> '' then
    System.Delete(WhereStr, Length(WhereStr) - 3, 4);
  if Trim(WhereStr) <> '' then
    SQLStr := SQLStr + 'WHERE ' + WhereStr;
  SQLStr := SQLStr + ' ORDER BY 2, 3';

  QueryOpen(qExport, SQLStr);

  Report := TFlexCelReport.Create(True);
  try
    Report.AddTable('tbllist', qExport);
    FUrl := '';
    FName := 'Aydinlatma_Sablon_Listesi';
    TmpName := ServerMod.NewCacheFileUrl(False, 'xlsx', FName, '', FUrl, True);
    Report.Run(ServerMod.FilesFolderPath + 'temp_xls\aydinlatma_sablon.template.xlsx', TmpName);
  finally
    Report.Free;
  end;

  UniSession.SendFile(TmpName, FName + '.xlsx');

end;

procedure TfrAydinlatmaSablonListe.actTopluKarekodA5Execute(Sender: TObject);
var
  Report: TFlexCelReport;
  FName: string;
  TmpName: string;
  FUrl: string;
  SQLStr, srcText, deptStr, WhereStr: string;
  imgQRCode: TUniImage;
  i: integer;
  aQRCodeFile: string;
  memo : TfrxMemoView;
  atop : real;
begin
  if MainMod.qAydinlatma.RecordCount<=0 then
    begin
    MessageDlg('Kayýt Bulunamadý !',TMsgDlgType.mtConfirmation,[mbOK]);
    exit;
    end;
  imgQRCode := TUniImage.Create(self);
  imgQRCode.Width := 664;
  imgQRCode.Height := 664;

  frxReportKarekodA5.PrintOptions.ShowDialog := False;
  frxReportKarekodA5.ShowProgress := false;
  frxReportKarekodA5.EngineOptions.MaxMemSize := 50; // Added by TEVFIK 23.05.2023 15:59:34 Tevfik
  frxReportKarekodA5.EngineOptions.SilentMode := True;
  frxReportKarekodA5.EngineOptions.EnableThreadSafe := True;
  frxReportKarekodA5.EngineOptions.DestroyForms := False;
  frxReportKarekodA5.EngineOptions.UseGlobalDataSetList := False;
  frxPDFExport1.ShowProgress := False;
  frxPDFExport1.ShowDialog := False;
  frxPDFExport1.DefaultPath := '';
  frxReportKarekodA5.PreviewOptions.AllowEdit := False;

  QueryOpen(mainmod.qTmp,' select ' +
      ' show_afis_web_link , ' +
      ' show_afis_portal_link, ' +
      ' show_afis_mail, ' +
      ' show_afis_gsm_no ' +
      ' from sys_dynamic_properties where mc_id= ' + inttostr(mainmod.MCID) );

  if not mainmod.qTmp.IsEmpty then
  begin
      Memo := frxReportKarekodA5.FindObject('frxDsMcDefkrm_web1') as TfrxMemoView;
      if Assigned(Memo) then
        Memo.Visible := mainmod.qTmp.FieldByName('show_afis_web_link').AsString = 'E' ;

      Memo := frxReportKarekodA5.FindObject('frxDsMcDefkrm_web2') as TfrxMemoView;
      if Assigned(Memo) then
        Memo.Visible := mainmod.qTmp.FieldByName('show_afis_portal_link').AsString = 'E' ;

      Memo := frxReportKarekodA5.FindObject('frxDsMcDefkrm_email') as TfrxMemoView;
      if Assigned(Memo) then
        Memo.Visible := mainmod.qTmp.FieldByName('show_afis_mail').AsString = 'E' ;

      Memo := frxReportKarekodA5.FindObject('frxDsMcDefkrm_telefon1') as TfrxMemoView;
      if Assigned(Memo) then
        Memo.Visible := mainmod.qTmp.FieldByName('show_afis_gsm_no').AsString = 'E' ;
  end;



  SQLStr := 'SELECT distinct ayd.id as ref_no, ' + 'kisi.kisi as ilgili_kisi, ayd.durum, ayd.tanim, ' + 'case when ayd.acik_riza =''E'' then ''AYDINLATMA VE AÇIK RIZA METNÝ'' else ''AYDINLATMA METNÝ'' end as dokuman_turu, ' + '(''' + MainMod.AydinlatmaLink + ''' || ayd.aguid)::character varying (200) AS web_adresi, ' + 'ayd.description as aciklama ' + ' FROM def_data_aydinlatma ayd ' + ' LEFT JOIN def_data_kisi kisi ON kisi.id = ayd.kisi_id ';

  WhereStr := ' ayd.mc_id = ' + IntToStr(MainMod.MCID) + ' AND ';
  if edSrcDurumu.ItemIndex > 0 then
    WhereStr := WhereStr + 'ayd.durum = ''' + edSrcDurumu.Text + ''' AND ';

  if edSrcText.Text <> '' then
  begin
    srcText := StringReplace(edSrcText.Text, '*', '%', [rfReplaceAll]);
    case edSrcTipi.ItemIndex of
      0:
        WhereStr := WhereStr + 'ayd.id = ' + IntToStr(StrToIntDef(edSrcText.Text, 0)) + ' AND ';
      1:
        WhereStr := WhereStr + 'ayd.tanim LIKE ''%' + srcText + '%'' AND ';
      2:
        WhereStr := WhereStr + 'kisi.kisi LIKE ''%' + srcText + '%'' AND ';
      3:
        WhereStr := WhereStr + 'ayd.description LIKE ''%' + srcText + '%'' AND ';
    end;
  end;

  if mainMod.iysvar and (edSrcIys.Text <> '') then
  begin
    case edSrcIys.ItemIndex of
      1:
        WhereStr := WhereStr + 'coalesce(ayd.iys_var, ''H'') = ''E'' AND ';
      2:
        WhereStr := WhereStr + 'coalesce(ayd.iys_var, ''H'') = ''H'' AND ';
    end;
  end;

  if edSrcDept.ItemIndex > 0 then
  begin
    WhereStr := WhereStr + 'ayd.kisi_id in (SELECT env.kisi_id FROM data_envanter env ' + 'WHERE env.kisi_id=ayd.kisi_id and env.active=''E'' and env.dept_id = ' + deptIdList[edSrcDept.ItemIndex] + ') AND ';
  end
  else
  begin
    deptStr := 'ayd.kisi_id IN (SELECT env.kisi_id FROM data_envanter env WHERE env.kisi_id = ayd.kisi_id ' + 'AND ( ';
    for i := 0 to deptIdList.Count - 1 do
      deptStr := deptStr + 'env.dept_id = ' + deptIdList[i] + ' OR ';
    if deptStr <> '' then
    begin
      WhereStr := WhereStr + copy(deptStr, 1, length(deptStr) - 3) + ') ) AND ';
    end;
  end;

  if Trim(WhereStr) <> '' then
    System.Delete(WhereStr, Length(WhereStr) - 3, 4);
  if Trim(WhereStr) <> '' then
    SQLStr := SQLStr + 'WHERE ' + WhereStr;
  SQLStr := SQLStr + ' ORDER BY 2, 3';

  QueryOpen(qExport, SQLStr);

  i := 1;
  if tblKarekod.Active = false then
    tblKarekod.Active := true;
  tblKarekod.First;
  while not tblKarekod.Eof do
    tblKarekod.Delete;
  qExport.First;
  while not qExport.Eof do
  begin
    tblKarekod.insert;
    tblKarekod.FieldByName('ref_no').AsInteger := qExport.FieldByName('ref_no').AsInteger;
    tblKarekod.FieldByName('ilgili_kisi').AsString := qExport.FieldByName('ilgili_kisi').AsString;
    tblKarekod.FieldByName('durum').AsString := qExport.FieldByName('durum').AsString;
//    tblKarekod.FieldByName('tanim').AsString := qExport.FieldByName('tanim').AsString + ' ' + qExport.FieldByName('dokuman_turu').AsString;
// Doðan akçay adinlatma karekod afiþleri baþlýk kýsmýna ilgili kiþi ve dokuman türünün gelmesi saðlandý
    tblKarekod.FieldByName('tanim').AsString := qExport.FieldByName('ilgili_kisi').AsString + ' ' + qExport.FieldByName('dokuman_turu').AsString;
    tblKarekod.FieldByName('dokuman_turu').AsString := qExport.FieldByName('dokuman_turu').AsString;
    tblKarekod.FieldByName('web_adresi').AsString := qExport.FieldByName('web_adresi').AsString;
    tblKarekod.FieldByName('aciklama').AsString := qExport.FieldByName('aciklama').AsString;

    MainMod.CreateQRCode(qExport.FieldByName('web_adresi').AsString, imgQRCode);
    aQRCodeFile := ServerMod.NewCacheFileUrl(False, 'png', '', '', FUrl, True);
    imgQRCode.Picture.SaveToFile(aQRCodeFile);
    TBlobField(tblKarekod.FieldByName('karekod')).LoadFromFile(aQRCodeFile);

    tblKarekod.Post;
    qExport.next;

    if tblKarekod.RecordCount = 100 then
    begin
      aQRCodeFile := ServerMod.NewCacheFileUrl(False, 'pdf', '', '', FUrl, True);
      frxPDFExport1.FileName := aQRCodeFile;
      frxReportKarekodA5.PrepareReport;
      if frxReportKarekodA5.Export(frxPDFExport1) then
      begin
        UniSession.SendFile(aQRCodeFile, 'Aydinlatma_Karekod_Afiþleri_' + IntToStr(i) + '.pdf');
      end;
      i := i + 1;

      tblKarekod.First;
      while not tblKarekod.Eof do
        tblKarekod.Delete;
    end;
  end;

  if tblKarekod.RecordCount > 0 then
  begin
    aQRCodeFile := ServerMod.NewCacheFileUrl(False, 'pdf', '', '', FUrl, True);
    frxPDFExport1.FileName := aQRCodeFile;
    frxReportKarekodA5.PrepareReport;
    if frxReportKarekodA5.Export(frxPDFExport1) then
    begin
      UniSession.SendFile(aQRCodeFile, 'Aydinlatma_Karekod_Afiþleri_' + IntToStr(i) + '.pdf');
    end;
  end;
end;

procedure TfrAydinlatmaSablonListe.actTopluKarekodExecute(Sender: TObject);
var
  Report: TFlexCelReport;
  FName: string;
  TmpName: string;
  FUrl: string;
  SQLStr, srcText, deptStr, WhereStr: string;
  imgQRCode: TUniImage;
  i: integer;
  aQRCodeFile: string;
begin
  if MainMod.qAydinlatma.RecordCount<=0 then
    begin
    MessageDlg('Kayýt Bulunamadý !',TMsgDlgType.mtConfirmation,[mbOK]);
    exit;
    end;
  imgQRCode := TUniImage.Create(self);
  imgQRCode.Width := 664;
  imgQRCode.Height := 664;
  SQLStr := 'SELECT distinct ayd.id as ref_no, ' + 'kisi.kisi as ilgili_kisi, ayd.durum, ayd.tanim, ' + 'case when ayd.acik_riza =''E'' then ''AÇIK RIZA'' else ''AYDINLATMA'' end as dokuman_turu, ' + '(''' + MainMod.AydinlatmaLink + ''' || ayd.aguid)::character varying (200) AS web_adresi, ' + 'ayd.description as aciklama ' + ' FROM def_data_aydinlatma ayd ' + ' LEFT JOIN def_data_kisi kisi ON kisi.id = ayd.kisi_id ';

  WhereStr := ' ayd.mc_id = ' + IntToStr(MainMod.MCID) + ' AND ';
  if edSrcDurumu.ItemIndex > 0 then
    WhereStr := WhereStr + 'ayd.durum = ''' + edSrcDurumu.Text + ''' AND ';

  if edSrcText.Text <> '' then
  begin
    srcText := StringReplace(edSrcText.Text, '*', '%', [rfReplaceAll]);
    case edSrcTipi.ItemIndex of
//      0:
//        WhereStr := WhereStr + 'ayd.id = ' + IntToStr(StrToIntDef(edSrcText.Text, 0)) + ' AND ';
//      1:
//        WhereStr := WhereStr + 'ayd.tanim LIKE ''' + srcText + ''' AND ';
//      2:
//        WhereStr := WhereStr + 'kisi.kisi LIKE ''' + srcText + ''' AND ';
//      3:
//        WhereStr := WhereStr + 'ayd.description LIKE ''' + srcText + ''' AND ';

      0:
        WhereStr := WhereStr + 'ayd.id::varchar  LIKE ''%' + srcText + '%'' AND ';
      1:
        WhereStr := WhereStr + 'ayd.tanim LIKE ''%' + srcText + '%'' AND ';
      2:
        WhereStr := WhereStr + 'kisi.kisi LIKE ''%' + srcText + '%'' AND ';
      3:
        WhereStr := WhereStr + 'ayd.description LIKE ''%' + srcText + '%'' AND ';

    end;
  end;

  if mainMod.iysvar and (edSrcIys.Text <> '') then
  begin
    case edSrcIys.ItemIndex of
      1:
        WhereStr := WhereStr + 'coalesce(ayd.iys_var, ''H'') = ''E'' AND ';
      2:
        WhereStr := WhereStr + 'coalesce(ayd.iys_var, ''H'') = ''H'' AND ';
    end;
  end;

  if edSrcDept.ItemIndex > 0 then
  begin
    WhereStr := WhereStr + 'ayd.kisi_id in (SELECT env.kisi_id FROM data_envanter env ' + 'WHERE env.kisi_id=ayd.kisi_id and env.active=''E'' and env.dept_id = ' + deptIdList[edSrcDept.ItemIndex] + ') AND ';
  end
  else
  begin
    deptStr := 'ayd.kisi_id IN (SELECT env.kisi_id FROM data_envanter env WHERE env.kisi_id = ayd.kisi_id ' + 'AND ( ';
    for i := 0 to deptIdList.Count - 1 do
      deptStr := deptStr + 'env.dept_id = ' + deptIdList[i] + ' OR ';
    if deptStr <> '' then
    begin
      WhereStr := WhereStr + copy(deptStr, 1, length(deptStr) - 3) + ') ) AND ';
    end;
  end;



//  if edSrcDept.ItemIndex > 0 then
//  begin
//    WhereStr := WhereStr + 'ayd.kisi_id in (SELECT env.kisi_id FROM data_envanter env WHERE env.kisi_id=ayd.kisi_id ' +
//                'and env.dept_id = ' + deptIdList[edSrcDept.ItemIndex] + ') AND ';
//    WhereStr := WhereStr + 'dp.id = ' + deptIdList[edSrcDept.ItemIndex] + ' AND ';
//  end;

  if Trim(WhereStr) <> '' then
    System.Delete(WhereStr, Length(WhereStr) - 3, 4);
  if Trim(WhereStr) <> '' then
    SQLStr := SQLStr + 'WHERE ' + WhereStr;
  SQLStr := SQLStr + ' ORDER BY 2, 3';

  QueryOpen(qExport, SQLStr);

  if tblKarekod.Active = false then
    tblKarekod.Active := true;
  tblKarekod.First;
  while not tblKarekod.Eof do
    tblKarekod.Delete;
  qExport.First;
  while not qExport.Eof do
  begin
    tblKarekod.insert;
    tblKarekod.FieldByName('ref_no').AsInteger := qExport.FieldByName('ref_no').AsInteger;
    tblKarekod.FieldByName('ilgili_kisi').AsString := qExport.FieldByName('ilgili_kisi').AsString;
    tblKarekod.FieldByName('durum').AsString := qExport.FieldByName('durum').AsString;
    tblKarekod.FieldByName('tanim').AsString := qExport.FieldByName('tanim').AsString;
    tblKarekod.FieldByName('dokuman_turu').AsString := qExport.FieldByName('dokuman_turu').AsString;
    tblKarekod.FieldByName('web_adresi').AsString := qExport.FieldByName('web_adresi').AsString;
    tblKarekod.FieldByName('aciklama').AsString := qExport.FieldByName('aciklama').AsString;

    MainMod.CreateQRCode(qExport.FieldByName('web_adresi').AsString, imgQRCode);
    aQRCodeFile := ServerMod.NewCacheFileUrl(False, 'png', '', '', FUrl, True);
    imgQRCode.Picture.SaveToFile(aQRCodeFile);
    TBlobField(tblKarekod.FieldByName('karekod')).LoadFromFile(aQRCodeFile);

    tblKarekod.Post;
    qExport.next;
  end;

  frxReportKarekod.PrintOptions.ShowDialog := False;
  frxReportKarekod.ShowProgress := false;

  frxReportKarekod.EngineOptions.SilentMode := True;
  frxReportKarekod.EngineOptions.EnableThreadSafe := True;
  frxReportKarekod.EngineOptions.DestroyForms := False;
  frxReportKarekod.EngineOptions.UseGlobalDataSetList := False;

  frxDOCXExport1.ShowProgress := False;
  frxDOCXExport1.ShowDialog := False;
  aQRCodeFile := ServerMod.NewCacheFileUrl(False, 'docx', '', '', FUrl, True);
  frxDOCXExport1.FileName := aQRCodeFile;
  frxDOCXExport1.DefaultPath := '';

  frxReportKarekod.PreviewOptions.AllowEdit := False;
  frxReportKarekod.PrepareReport;
  if frxReportKarekod.Export(frxDOCXExport1) then
  begin
    UniSession.SendFile(aQRCodeFile, 'Aydinlatma_Karekod_Listesi.docx');
  end;
end;

procedure TfrAydinlatmaSablonListe.AydinlatmaMetniTest(AAydGuiId:string);
var
  qry: TUniQuery;
  ms: TMemoryStream;
  TempFileName: string;
  FUrl: string;
begin
  qry := TUniQuery.Create(nil);
  try
    qry.Connection := mainmod.DBMain;  // Veritabaný baðlantýnýzý burada belirtin
    qry.SQL.Text := 'SELECT dosya FROM def_data_aydinlatma_docs WHERE ayd_guid = :ayd_guid';
    qry.ParamByName('ayd_guid').AsString := AAydGuiId;
    qry.Open;
    if not qry.IsEmpty then
    begin
      ms := TMemoryStream.Create;
      try
        // BLOB alanýndaki PDF verisini belleðe aktar
      //  qry.CreateBlobStream(qry.FieldByName('dosya'), bmRead).SaveToStream(ms); //asil yazmak istediðim
        TBlobField(qry.FieldByName('dosya')).SaveToStream(ms);
        ms.Position := 0; // Bellek akýþýnýn baþýna dön
        // PDF dosyasýný geçici bir dosyaya kaydet
         FUrl := '';
        TempFileName := TPath.GetTempPath + TPath.GetGUIDFileName + '.pdf';
        TempFileName := ServerMod.NewCacheFileUrl(False, 'pdf', 'deneme', '', FUrl, True);
        ms.SaveToFile(TempFileName);
        // PDF dosyasýný kullanýcýya sunma
        UniSession.SendFile(TempFileName, 'deneme.pdf');
      finally
        ms.Free;
      end;
    end
    else
    begin
      ShowMessage('Kayýt bulunamadý.');
    end;
  finally
    qry.Free;
  end;

end;

procedure TfrAydinlatmaSablonListe.AydnlatmaveAkRzaablonunuGncelle1Click(Sender: TObject);
begin
  AdinlatmaAcikRizaSablonGuncelle;
end;

procedure TfrAydinlatmaSablonListe.AdinlatmaAcikRizaSablonGuncelle;
var
  FilePath: string;
  MyIni: TIniFile;
  tmpStr: string;
  Reg: TRegistry;
begin
  FilePath := ExtractFilePath(Application.ExeName);  //ExtractFilePath(Application.ExeName) serviste iþe yaramaz, syswow64 gelir

  if FileExists(FilePath + '/KVKNet_FR_Svc.ini') then
    MyIni := TIniFile.Create(FilePath + '/KVKNet_FR_Svc.ini')
  else
  begin
    MessageDlg('KVKNET þablon oluþturma servisi bulunamadý!', mtInformation, [mbOk]);
    exit;
  end;

  tmpStr := MyIni.ReadString('Control', 'AydIDs', '');
  if tmpStr <> '' then
    tmpStr := tmpStr + ',';

  MainMod.qAydinlatma.First;
  while not MainMod.qAydinlatma.Eof do
  begin
    tmpStr := tmpStr + MainMod.qAydinlatma.FieldByName('id').AsString + ',';
    MainMod.qAydinlatma.Next;
  end;
  if tmpStr <> '' then
  begin
    tmpStr := copy(tmpStr, 1, Length(tmpStr) - 1);
    MyIni.DeleteKey('Control', 'AydIDs');
    MyIni.WriteString('Control', 'AydIDs', tmpStr);
    MessageDlg('Þablonlar birkaç dakika içinde güncellenecektir.', mtInformation, [mbOk]);
  end;
  MyIni.Free;
end;

procedure TfrAydinlatmaSablonListe.AydnlatmaveAkRzaBelgesiPDF1Click(Sender: TObject);
var
  AStream: TMemoryStream;
  FStream: TStream;
  TmpName: string;
  NewName: string;
  FileExt: string;
  FUrl: string;
begin
  // Added by TEVFIK 31.05.2023 12:41:43(NewName :=StringReplace...);
  NewName := StringReplace(MainMod.qAydinlatma.FieldByName('tanim').AsString + '.pdf', '/', '-', [rfReplaceAll]);
  TmpName := ServerMod.NewCacheFileUrl(False, 'pdf', '', '', FUrl, True);
  qDocs.Close;
  qDocs.ParamByName('ayd_id').AsInteger := MainMod.qAydinlatma.FieldByName('id').AsInteger;
  qDocs.Open;
  if qDocs.FieldByName('dosya').IsNull = false then
  begin
    AStream := TMemoryStream.Create;
    try
      TBlobField(qDocs.FieldByName('dosya')).SaveToStream(AStream);
      FStream := TFileStream.Create(TmpName, fmCreate);
      AStream.SaveToStream(FStream);
      FStream.Free;
    finally
      AStream.Free;
    end;
  end
  else
  begin
     Messagedlg('Þablon oluþturulmamýþ!', mtInformation, [mbOk]);
      exit;     // pdf dosyasý dosya olarak kaydedilmiyor galiba ilk zamanlarda dosya olarak kaydedilmiþ
//    if MainMod.qAydinlatma.FieldByName('acik_riza').AsString = 'E' then
//      ExecAndWait('KVKNet_FR.exe', 'AM ' + NewName + ' ' + MainMod.qAydinlatma.FieldByName('aguid').AsString + ' ' + MainMod.LoginInfo.MAC_IPNo)
//    else
//      ExecAndWait('KVKNet_FR.exe', 'AMR ' + NewName + ' ' + MainMod.qAydinlatma.FieldByName('aguid').AsString + ' ' + MainMod.LoginInfo.MAC_IPNo);
  end;
  UniSession.SendFile(TmpName, NewName);
end;

procedure TfrAydinlatmaSablonListe.actAddExecute(Sender: TObject);
begin
  if frmAydinlatmaSablonTanim.Insert = mrOk then
    RefreshQuery(MainMod.qAydinlatma);
  ManageSettings;
end;

procedure TfrAydinlatmaSablonListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrAydinlatmaSablonListe.actDenemeExecute(Sender: TObject);
begin
  edSrcText.SetFocus;
end;

procedure TfrAydinlatmaSablonListe.actEditExecute(Sender: TObject);
begin
  if MainMod.qAydinlatma.FieldByName('durum').AsString = 'PASÝF' then
  begin
    if not MainMod.LoginInfo.Yetkiler[120] then
    begin
      MessageDlg('Deðiþtirmek istediðiniz kayýt PASÝF yapýlmýþ. Bu kaydý deðiþtirme yetkiniz yok.', mtError, [mbOk]);
      Exit;
    end;
  end;

  if frmAydinlatmaSablonTanim.Edit = mrOk then
    RefreshQuery(MainMod.qAydinlatma);
  ManageSettings;
end;

procedure TfrAydinlatmaSablonListe.actImportExcelExecute(Sender: TObject);
begin
  frmAydinlatmaSablonTopluIslem.ExecImport;
end;

procedure TfrAydinlatmaSablonListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrAydinlatmaSablonListe.DefVariables(VL: TStrings);
begin
  VL.Clear;
  VL.Add('COMPANYADDRESS' + '=' + Trim(Trim(MainMod.qMCDef.FieldByName('krm_adres1').AsString) + ' ' + Trim(MainMod.qMCDef.FieldByName('krm_adres2').AsString)));
  VL.Add('TAXOFFICE' + '=' + Trim(MainMod.qMCDef.FieldByName('krm_vdairesi').AsString));
  VL.Add('TAXNO' + '=' + Trim(MainMod.qMCDef.FieldByName('krm_vkn').AsString));
  VL.Add('COMPANYTITLE' + '=' + Trim(MainMod.qMCDef.FieldByName('title').AsString));
  VL.Add('COMPANYFULLNAME' + '=' + Trim(MainMod.qMCDef.FieldByName('krm_unvan').AsString));
  VL.Add('COMPANYKEPMAIL' + '=' + Trim(MainMod.qMCDef.FieldByName('krm_kep').AsString));
  VL.Add('COMPANYEMAIL' + '=' + Trim(MainMod.qMCDef.FieldByName('krm_email').AsString));
  VL.Add('COMPANYWEBPAGE' + '=' + Trim(MainMod.qMCDef.FieldByName('krm_web1').AsString));
  VL.Add('COMPANYCITY' + '=' + Trim(MainMod.qMCDef.FieldByName('krm_sehir').AsString));
  VL.Add('COMPANYTELNO' + '=' + Trim(MainMod.qMCDef.FieldByName('krm_telefon1').AsString));
  VL.Add('CONFIRMDATE' + '=' + ''); // FormatDateTime('dd.mm.yyyy', Date));
  VL.Add('CONFIRMPERSON' + '=' + '');
  VL.Add('CONFIRMTEL' + '=' + '');
  VL.Add('CONFIRMEMAIL' + '=' + '');
  VL.Add('CONFIRMIPADDRESS' + '=' + ''); //'(IP Adresi: ' + Trim(lbIPAdres.Caption) + ')'
  VL.Add('PERSONOFINTEREST' + '=' + Trim(MainMod.qAydinlatma.FieldByName('kisi_str').AsString));
//  VL.Add('TXTWEBSITEINFO_EN'       + '=@@'); // Trim(MainMod.qMCDef.FieldByName('krm_').AsString));
//  VL.Add('TXTWEBSITEINFO_TR'       + '=' + Trim(MainMod.qMCDef.FieldByName('krm_web2').AsString));
//  VL.Add('TXTWEBSITEINFOACCEPT_TR' + '=' + Trim(MainMod.qMCDef.FieldByName('krm_web3').AsString));
end;

procedure TfrAydinlatmaSablonListe.DOCXRptUserCalc(Sender: TObject; var CalcStr: string; var Replace: Boolean);
var
  TagValue: string;
begin
  Replace := True;
  TagValue := AnsiUpperCase(CalcStr);

  if TagValue = 'DATATYPELIST' then
    TagValue := MakeStr_AR_VeriTipi(True)             // Açýk Rýza
  else if TagValue = 'PURPOSELIST' then
    TagValue := MakeStr_AR_IslemePaylasmaAmaci(True)  // Açýk Rýza
  else if TagValue = 'TRANSFERLOCATIONLIST' then
    TagValue := MakeStr_AR_AktarilacakYerler(True)    // Açýk Rýza
  else if TagValue = 'COMPANYLOGO' then
    TagValue := MainForm.GetLogoFileName
  else
    Replace := False;

  if Replace then
    CalcStr := TagValue;
end;

procedure TfrAydinlatmaSablonListe.Download(ADoc, AName: string);
var
  TmpName: string;
  FUrl: string;
begin
  try
    DOCXRpt.ReportFile := ServerMod.FilesFolderPath + 'temp\' + ADoc; // Template file name
    DOCXRpt.OutputFile := ServerMod.NewCacheFileUrl(False, 'docx', '', '', FUrl, True);
    DOCXRpt.Execute([MainMod.qMCDef, tblKatVeriTipi, qMetod, qDayanak, qAmac, qSure, tblAktarim]);
  except
    on E: Exception do
    begin
      ShowMessageN('Hata..'#13 + E.Message);
      Exit;
    end;
  end;

  UniSession.SendFile(DOCXRpt.OutputFile, AName);
end;

procedure TfrAydinlatmaSablonListe.edSrcDeptChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrAydinlatmaSablonListe.edSrcIysChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrAydinlatmaSablonListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then
    NewSQL;
end;

procedure TfrAydinlatmaSablonListe.edSrcTipiChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrAydinlatmaSablonListe.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F1 then
    edSrcText.SetFocus;
end;

function TfrAydinlatmaSablonListe.MakeStr_AR_AktarilacakYerler(LineFeed: Boolean): string;
var
  sTmp: string;
  sTaraf: string;
begin
  QueryOpen(qTmp, 'SELECT DISTINCT payl_taraf_ids as taraf from data_envanter ' + 'WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) + ' AND kisi_id = ' + MainMod.qAydinlatma.FieldByName('kisi_id').AsString);

  sTmp := '';
  while not qTmp.EOF do
  begin
    if qTmp.FieldByName('taraf').AsString <> '' then
      sTmp := sTmp + qTmp.FieldByName('taraf').AsString + ',';
    qTmp.Next;
  end;
  if sTmp <> '' then
    System.Delete(sTmp, Length(sTmp), 1); // Delete the last "," character from string

  sTaraf := '';
  Result := '';
  if sTmp = '' then
    Exit;

  QueryOpen(qTmp, 'SELECT taraf FROM def_data_taraf WHERE id IN (' + sTmp + ') ORDER BY id');
  while not qTmp.EOF do
  begin
    if qTmp.FieldByName('taraf').AsString <> '' then
      sTaraf := sTaraf + '- ' + Trim(qTmp.FieldByName('taraf').AsString) + ','#13;
    qTmp.Next;
  end;
  if sTaraf <> '' then
    System.Delete(sTaraf, Length(sTaraf) - 1, 2); // Delete the last ",#13" character from string

  if not LineFeed then
    sTaraf := StringReplace(sTaraf, #13, ' ', [rfReplaceAll]);

  Result := sTaraf;
end;

function TfrAydinlatmaSablonListe.MakeStr_AR_IslemePaylasmaAmaci(LineFeed: Boolean): string;
var
  sTmp: string;
  sAmac: string;
begin
  QueryOpen(qTmp, 'SELECT topl_amac_ids as amac from data_envanter ' + 'WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) + ' AND kisi_id = ' + MainMod.qAydinlatma.FieldByName('kisi_id').AsString + ' UNION ' + 'SELECT payl_amac_ids as amac from data_envanter ' + 'WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) + ' AND kisi_id = ' + MainMod.qAydinlatma.FieldByName('kisi_id').AsString);

  sTmp := '';
  while not qTmp.EOF do
  begin
    if qTmp.FieldByName('amac').AsString <> '' then
      sTmp := sTmp + qTmp.FieldByName('amac').AsString + ',';
    qTmp.Next;
  end;
  if sTmp <> '' then
    System.Delete(sTmp, Length(sTmp), 1); // Delete the last "," character from string

  sAmac := '';
  Result := '';
  if sTmp = '' then
    Exit;

  QueryOpen(qTmp, 'SELECT amac FROM def_data_amac WHERE id IN (' + sTmp + ') ORDER BY id');
  while not qTmp.EOF do
  begin
    if qTmp.FieldByName('amac').AsString <> '' then
      sAmac := sAmac + '- ' + Trim(qTmp.FieldByName('amac').AsString) + ','#13;
    qTmp.Next;
  end;
  if sAmac <> '' then
    System.Delete(sAmac, Length(sAmac) - 1, 2); // Delete the last ",#13" character from string

  if not LineFeed then
    sAmac := StringReplace(sAmac, #13, ' ', [rfReplaceAll]);

  Result := sAmac;
end;

function TfrAydinlatmaSablonListe.MakeStr_AR_VeriTipi(LineFeed: Boolean): string;
var
  sTmp: string;
  Kategori: string;
begin
  sTmp := '';
  Kategori := '';
  QueryOpen(qTmp, 'SELECT DISTINCT env.veritipi_id, vt.veri_tipi AS veritipi_str, vt.md_id, ktg.kategori ' + 'FROM data_envanter env ' + '   LEFT JOIN def_data_veritipi vt on vt.id = env.veritipi_id ' + '   LEFT JOIN def_data_kategori ktg on ktg.id = vt.md_id ' + 'WHERE env.main_id > 0 AND env.active = ''E'' AND env.mc_id = ' + IntToStr(MainMod.MCID) + ' AND env.kisi_id = ' + MainMod.qAydinlatma.FieldByName('kisi_id').AsString + ' ORDER BY 3, 1');
  while not qTmp.EOF do
  begin
    if Kategori <> qTmp.FieldByName('kategori').AsString then
    begin
      Kategori := Trim(qTmp.FieldByName('kategori').AsString);
      if sTmp = '' then
      begin
        sTmp := sTmp + Kategori + ParantezAc;
      end
      else
      begin
        System.Delete(sTmp, Length(sTmp) - 1, 2); // Delete the last ", " character from string
        sTmp := sTmp + ParantezKapat + Kategori + ParantezAc;
      end;
    end;

    sTmp := sTmp + Trim(qTmp.FieldByName('veritipi_str').AsString) + ', ';
    qTmp.Next;
  end;

  if sTmp <> '' then
  begin
    System.Delete(sTmp, Length(sTmp) - 1, 2); // Delete the last ", " character from string
    sTmp := sTmp + ParantezKapat;
  end;

  if not LineFeed then
    sTmp := StringReplace(sTmp, #13, ' ', [rfReplaceAll]);

  Result := sTmp;
end;

procedure TfrAydinlatmaSablonListe.ManageSettings;
begin
  actAdd.Enabled := MainMod.LoginInfo.Yetkiler[118] and (MainMod.qAydinlatma.State = dsBrowse);
  actEdit.Enabled := MainMod.LoginInfo.Yetkiler[119] and (MainMod.qAydinlatma.State = dsBrowse) and (MainMod.qAydinlatma.FieldByName('id').AsInteger > 0);
  btnDownload.Enabled := MainMod.LoginInfo.Yetkiler[121] and (MainMod.qAydinlatma.State = dsBrowse) and (MainMod.qAydinlatma.FieldByName('id').AsInteger > 0);
  actImportExcel.Enabled := MainMod.LoginInfo.Yetkiler[118] and (MainMod.qAydinlatma.State = dsBrowse);
  {$IFDEF DEBUG}
  btnTest.Visible := true;
  {$ENDIF}
  actClose.Enabled := not DataEditing(MainMod.qAydinlatma);
end;

procedure TfrAydinlatmaSablonListe.NewSQL;
var
  SQLStr, srcText, WhereStr, deptStr: string;
  i: integer;
begin
  if not GuvenliGirisMi(edSrcText.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;

  SQLStr := 'SELECT ayd.*, ks.kisi as kisi_str FROM def_data_aydinlatma ayd ' +
            'LEFT JOIN def_data_kisi ks ON ks.id = ayd.kisi_id where ayd.mc_id =:mc_id ';
  if edSrcDurumu.ItemIndex > 0 then
    SQLStr := SQLStr + ' and ayd.durum =:durumu ';

  if edSrcText.Text <> '' then
  begin
      if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
    case edSrcTipi.ItemIndex of
      0:
        SQLStr := SQLStr + ' and ayd.id::varchar  LIKE :SrcText ';
      1:
        SQLStr := SQLStr + ' and ayd.tanim LIKE :SrcText ';
      2:
        SQLStr := SQLStr + ' and ks.kisi LIKE :SrcText ';
      3:
        SQLStr := SQLStr + ' and ayd.description LIKE :SrcText ';
    end;
  end;

  if mainMod.iysvar and (edSrcIys.Text <> '') then
  begin
    case edSrcIys.ItemIndex of
      1:
        SQLStr := SQLStr + ' and coalesce(ayd.iys_var, ''H'') = ''E''  ';
      2:
        SQLStr := SQLStr + ' and coalesce(ayd.iys_var, ''H'') = ''H''  ';
    end;
  end;

  if edSrcDept.ItemIndex > 0 then
  begin
    SQLStr := SQLStr + ' and ayd.kisi_id in (SELECT env.kisi_id FROM data_envanter env ' +
      'WHERE env.kisi_id=ayd.kisi_id and env.active=''E'' and env.dept_id = :dept_id)  ';
  end
  else
  begin

  end;

  SQLStr := SQLStr + ' ORDER BY ayd.id';

  mainmod.qAydinlatma.SQL.Text := SQLStr ;
  mainmod.qAydinlatma.ParamByName('mc_id').AsString := inttostr(mainmod.MCID);
  if mainmod.qAydinlatma.FindParam('durumu') <> nil then
    mainmod.qAydinlatma.ParamByName('durumu').AsString := edSrcDurumu.Text;
  if mainmod.qAydinlatma.FindParam('SrcText') <> nil then
    mainmod.qAydinlatma.ParamByName('SrcText').AsString := srcText;
  if mainmod.qAydinlatma.FindParam('dept_id') <> nil then
    mainmod.qAydinlatma.ParamByName('dept_id').AsString := deptIdList[edSrcDept.ItemIndex];


  MainMod.qAydinlatma.Open;

  ManageSettings;
  lbKayitSayisi.Text := IntToStr(MainMod.qAydinlatma.RecordCount) + ' Kayýt Listelendi...';
end;

procedure TfrAydinlatmaSablonListe.ppmiAcikRizaBeyaniClick(Sender: TObject);
begin
  //30/03/2023 yapýlan istiþare ile kaldýrýldý. PDF kullanýlacak.
  {
  if not MainMod.LoginInfo.Yetkiler[121] then
  begin
    MessageDlg('Doküman indirme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;
  DefVariables(DOCXRpt.Variables);

  Download('UNIVERSAL_ACIK_RIZA_BEYANI.docx', MainMod.qAydinlatma.FieldByName('tanim').AsString + '_ACIK_RIZA_BEYANI.docx');
  }
end;

procedure TfrAydinlatmaSablonListe.ppmiAydinlatmaMetniClick(Sender: TObject);
begin
  //30/03/2023 yapýlan istiþare ile kaldýrýldý. PDF kullanýlacak.
  {
  if not MainMod.LoginInfo.Yetkiler[121] then
  begin
    MessageDlg('Doküman indirme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  DefVariables(DOCXRpt.Variables);
  PrepTbl_AM_KategoriVeriTipi;
  PrepTbl_AM_ToplamaMetodu;
  PrepTbl_AM_HukukiDayanaklar;
  PrepTbl_AM_IslemeAmaci;
  PrepTbl_AM_SaklamaSureleri;
  PrepTbl_AM_VeriAktarimYerleri;
  Download('UNIVERSAL_AYDINLATMA_METNI.docx', MainMod.qAydinlatma.FieldByName('tanim').AsString + '_AYDINLATMA_METNI.docx');
  }
end;

procedure TfrAydinlatmaSablonListe.PrepTbl_AM_HukukiDayanaklar;
var
  sTmp: string;
begin
  QueryOpen(qTmp, 'SELECT DISTINCT chl.dayanak_ids FROM data_checklist chl ' + 'WHERE chl.active = ''E'' AND chl.mc_id = ' + IntToStr(MainMod.MCID) + ' AND chl.kisi_id = ' + MainMod.qAydinlatma.FieldByName('kisi_id').AsString + ' AND chl.kaynak_id IN (' + '     SELECT DISTINCT env.kaynak_id FROM data_envanter env WHERE env.active = ''E'' AND env.mc_id = ' + IntToStr(MainMod.MCID) + ' AND env.kisi_id = ' + MainMod.qAydinlatma.FieldByName('kisi_id').AsString + ')');

  sTmp := '';
  while not qTmp.EOF do
  begin
    if qTmp.FieldByName('dayanak_ids').AsString <> '' then
      sTmp := sTmp + qTmp.FieldByName('dayanak_ids').AsString + ',';
    qTmp.Next;
  end;

  if sTmp = '' then
  begin
    QueryOpen(qDayanak, 'SELECT dayanak FROM def_data_dayanak WHERE id = 0');
    Exit;
  end;
  System.Delete(sTmp, Length(sTmp), 1); // Delete the last "," character from string

  QueryOpen(qDayanak, 'SELECT dayanak FROM def_data_dayanak WHERE id IN (' + sTmp + ') ORDER BY id');
end;

procedure TfrAydinlatmaSablonListe.PrepTbl_AM_IslemeAmaci;
var
  sTmp: string;
begin
//  QueryOpen(qTmp, 'SELECT topl_amac_ids as amac from data_envanter ' +
//                  'WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) + ' AND kisi_id = ' +
//                  MainMod.qAydinlatma.FieldByName('kisi_id').AsString +
//                  ' UNION ' +
//                  'SELECT payl_amac_ids as amac from data_envanter ' +
//                  'WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) + ' AND kisi_id = ' +
//                  MainMod.qAydinlatma.FieldByName('kisi_id').AsString);

  QueryOpen(qTmp, 'SELECT DISTINCT topl_amac_ids as amac from data_envanter ' + 'WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) + ' AND kisi_id = ' + MainMod.qAydinlatma.FieldByName('kisi_id').AsString);
  sTmp := '';
  while not qTmp.EOF do
  begin
    if qTmp.FieldByName('amac').AsString <> '' then
      sTmp := sTmp + qTmp.FieldByName('amac').AsString + ',';
    qTmp.Next;
  end;

  if sTmp = '' then
  begin
    Exit;
    QueryOpen(qAmac, 'SELECT amac FROM def_data_amac WHERE id = 0');
  end;
  System.Delete(sTmp, Length(sTmp), 1); // Delete the last "," character from string

  QueryOpen(qAmac, 'SELECT amac FROM def_data_amac WHERE id IN (' + sTmp + ') ORDER BY id');
end;

procedure TfrAydinlatmaSablonListe.PrepTbl_AM_KategoriVeriTipi;
var
  sKat: string;
  sVT: string;
begin
  if not tblKatVeriTipi.Active then
    tblKatVeriTipi.Open;
  tblKatVeriTipi.First;
  while not tblKatVeriTipi.EOF do
    tblKatVeriTipi.Delete;

  QueryOpen(qTmp, 'SELECT DISTINCT env.veritipi_id, vt.veri_tipi AS veritipi_str, vt.md_id, ktg.kategori ' + 'FROM data_envanter env ' + '   LEFT JOIN def_data_veritipi vt on vt.id = env.veritipi_id ' + '   LEFT JOIN def_data_kategori ktg on ktg.id = vt.md_id ' + 'WHERE env.main_id > 0 AND env.active = ''E'' AND env.mc_id = ' + IntToStr(MainMod.MCID) + ' AND env.kisi_id = ' + MainMod.qAydinlatma.FieldByName('kisi_id').AsString + ' ORDER BY 3, 1');

  if qTmp.FieldByName('md_id').AsInteger < 1 then
    Exit;
  sKat := qTmp.FieldByName('kategori').AsString;
  sVT := '';

  while not qTmp.EOF do
  begin
    if sKat = qTmp.FieldByName('kategori').AsString then
    begin
      sVT := sVT + qTmp.FieldByName('veritipi_str').AsString + ', ';
    end
    else
    begin
      if sVT <> '' then
        System.Delete(sVT, Length(sVT) - 1, 2); // Delete the last ", " character from string
      tblKatVeriTipi.Append;
      tblKatVeriTipi.FieldByName('kategori').AsString := sKat;
      tblKatVeriTipi.FieldByName('veritipi').AsString := sVT;
      tblKatVeriTipi.Post;

      sKat := qTmp.FieldByName('kategori').AsString;
      sVT := qTmp.FieldByName('veritipi_str').AsString + ', ';
    end;
    qTmp.Next;
  end;

  if sVT <> '' then
  begin
    System.Delete(sVT, Length(sVT) - 1, 2); // Delete the last ", " character from string
    tblKatVeriTipi.Append;
    tblKatVeriTipi.FieldByName('kategori').AsString := sKat;
    tblKatVeriTipi.FieldByName('veritipi').AsString := sVT;
    tblKatVeriTipi.Post;
  end;

  tblKatVeriTipi.First;
end;

procedure TfrAydinlatmaSablonListe.PrepTbl_AM_SaklamaSureleri;
begin
  QueryOpen(qSure, 'SELECT DISTINCT ky.kaynak AS kaynak_str, sakl_ssure, sakl_fsure ' + 'FROM data_envanter env LEFT JOIN def_data_kaynak ky ON env.kaynak_id=ky.id ' + 'WHERE env.active = ''E'' AND main_id = 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) + ' AND env.kisi_id = ' + MainMod.qAydinlatma.FieldByName('kisi_id').AsString);
end;

procedure TfrAydinlatmaSablonListe.PrepTbl_AM_ToplamaMetodu;
var
  sTmp: string;
begin
  QueryOpen(qTmp, 'SELECT DISTINCT topl_metod_ids from data_envanter ' + 'WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) + ' AND kisi_id = ' + MainMod.qAydinlatma.FieldByName('kisi_id').AsString);

  sTmp := '';
  while not qTmp.EOF do
  begin
    if qTmp.FieldByName('topl_metod_ids').AsString <> '' then
      sTmp := sTmp + qTmp.FieldByName('topl_metod_ids').AsString + ',';
    qTmp.Next;
  end;

  if sTmp = '' then
  begin
    QueryOpen(qMetod, 'SELECT metod FROM def_data_metod WHERE id = 0');
    Exit;
  end;
  if sTmp <> '' then
    System.Delete(sTmp, Length(sTmp), 1); // Delete the last "," character from string

  QueryOpen(qMetod, 'SELECT metod FROM def_data_metod WHERE id IN (' + sTmp + ') ORDER BY id');
end;

procedure TfrAydinlatmaSablonListe.PrepTbl_AM_VeriAktarimYerleri;
var
  sPayStr, sPayID: string;
begin
  if not tblAktarim.Active then
    tblAktarim.Open;
  tblAktarim.First;
  while not tblAktarim.EOF do
    tblAktarim.Delete;

  QueryOpen(qTmp, 'SELECT DISTINCT kaynak_id, ky.kaynak as kaynak_str ' + 'FROM data_envanter env LEFT JOIN def_data_kaynak ky ON env.kaynak_id=ky.id ' + 'WHERE env.active = ''E'' AND env.mc_id = ' + IntToStr(MainMod.MCID) + ' AND env.kisi_id = ' + MainMod.qAydinlatma.FieldByName('kisi_id').AsString + ' ORDER BY 1');
  while not qTmp.EOF do
  begin
    tblAktarim.Append;
    tblAktarim.FieldByName('kaynak_id').AsInteger := qTmp.FieldByName('kaynak_id').AsInteger;
    tblAktarim.FieldByName('kaynak_str').AsString := qTmp.FieldByName('kaynak_str').AsString;
    tblAktarim.Post;

    qTmp.Next;
  end;

  tblAktarim.First;
  while not tblAktarim.EOF do
  begin
    // Kategori Listesi -- Þimdilik Tablodan kaldýrýldý
    (*
    QueryOpen(qTmp, 'SELECT DISTINCT kategori_id, kategori_str FROM vw_data_envanter ' +
                    'WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) + ' AND kaynak_id = ' +
                    tblAktarim.FieldByName('kaynak_id').AsString + ' AND kisi_id = ' +
                    MainMod.qAydinlatma.FieldByName('kisi_id').AsString + ' ORDER BY 1 ');
    sKatStr := '';
    sKatID  := '';
    while not qTmp.EOF do
    begin
      if qTmp.FieldByName('kategori_id').AsInteger > 0 then
      begin
        sKatID  := sKatID + qTmp.FieldByName('kategori_id').AsString + ',';
        sKatStr := sKatStr + qTmp.FieldByName('kategori_str').AsString + ', ';
      end;

      qTmp.Next;
    end;
    if sKatID <> '' then
    begin
      System.Delete(sKatID, Length(sKatID), 1);
      System.Delete(sKatStr, Length(sKatStr) - 1, 2);
    end;
    tblAktarim.Edit;
    tblAktarim.FieldByName('kategori_ids').AsString := sKatID;
    tblAktarim.FieldByName('kategori_str').AsString := sKatStr;
    tblAktarim.Post; *)

    // Veri Tipi Listesi -- Þimdilik Tablodan kaldýrýldý
    (*
    if sKatID <> '' then
    begin
      QueryOpen(qTmp, 'SELECT DISTINCT veritipi_id, veritipi_str from vw_data_envanter ' +
                      'WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) + ' AND kategori_id IN (' + sKatID +
                      ') AND kisi_id = ' + MainMod.qAydinlatma.FieldByName('kisi_id').AsString + ' ORDER BY 1');
      sVTStr := '';
      sVTID  := '';
      while not qTmp.EOF do
      begin
        if qTmp.FieldByName('veritipi_id').AsInteger > 0 then
        begin
          sVTID  := sVTID + qTmp.FieldByName('veritipi_id').AsString + ',';
          sVTStr := sVTStr + qTmp.FieldByName('veritipi_str').AsString + ', ';
        end;

        qTmp.Next;
      end;
      if sVTID <> '' then
      begin
        System.Delete(sVTID, Length(sVTID), 1);
        System.Delete(sVTStr, Length(sVTStr) - 1, 2);
      end;
      tblAktarim.Edit;
      tblAktarim.FieldByName('veritipi_ids').AsString := sVTID;
      tblAktarim.FieldByName('veritipi_str').AsString := sVTStr;
      tblAktarim.Post;
    end;*)

    // Paylaþým Amaçlarý Listesi
    begin
      QueryOpen(qTmp, 'SELECT DISTINCT payl_amac_ids from data_envanter ' + 'WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) + ' AND kisi_id = ' + MainMod.qAydinlatma.FieldByName('kisi_id').AsString + ' AND kaynak_id = ' + tblAktarim.FieldByName('kaynak_id').AsString + ' ORDER BY 1');
      sPayStr := '';
      sPayID := '';
      while not qTmp.EOF do
      begin
        if qTmp.FieldByName('payl_amac_ids').AsString <> '' then
          sPayID := sPayID + qTmp.FieldByName('payl_amac_ids').AsString + ',';

        qTmp.Next;
      end;
      if sPayID <> '' then
      begin
        System.Delete(sPayID, Length(sPayID), 1);
        QueryOpen(qTmp, 'SELECT id, amac FROM def_data_amac WHERE id IN (' + sPayID + ')');

        sPayStr := '';
        sPayID := '';
        while not qTmp.EOF do
        begin
          sPayID := sPayID + qTmp.FieldByName('id').AsString + ',';
          sPayStr := sPayStr + qTmp.FieldByName('amac').AsString + ', ';

          qTmp.Next;
        end;
        if sPayID <> '' then
        begin
          System.Delete(sPayID, Length(sPayID), 1);
          System.Delete(sPayStr, Length(sPayStr) - 1, 2);
        end;
        tblAktarim.Edit;
        tblAktarim.FieldByName('payl_amac_ids').AsString := sPayID;
        tblAktarim.FieldByName('payl_amac_str').AsString := sPayStr;
        tblAktarim.Post;
      end;
    end;

    // Paylaþým Taraflarý Listesi
    begin
      QueryOpen(qTmp, 'SELECT DISTINCT payl_taraf_ids from data_envanter ' + 'WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) + ' AND kisi_id = ' + MainMod.qAydinlatma.FieldByName('kisi_id').AsString + ' AND kaynak_id = ' + tblAktarim.FieldByName('kaynak_id').AsString + ' ORDER BY 1');
      sPayStr := '';
      sPayID := '';
      while not qTmp.EOF do
      begin
        if qTmp.FieldByName('payl_taraf_ids').AsString <> '' then
          sPayID := sPayID + qTmp.FieldByName('payl_taraf_ids').AsString + ',';

        qTmp.Next;
      end;
      if sPayID <> '' then
      begin
        System.Delete(sPayID, Length(sPayID), 1);
        QueryOpen(qTmp, 'SELECT id, taraf FROM def_data_taraf WHERE id IN (' + sPayID + ')');

        sPayStr := '';
        sPayID := '';
        while not qTmp.EOF do
        begin
          if qTmp.FieldByName('taraf').AsString = 'VERÝ AKTARILMAMAKTADIR' then
          begin
            qTmp.Next;
            Continue;
          end;

          sPayID := sPayID + qTmp.FieldByName('id').AsString + ',';
          sPayStr := sPayStr + qTmp.FieldByName('taraf').AsString + ', ';

          qTmp.Next;
        end;
        if sPayID <> '' then
        begin
          System.Delete(sPayID, Length(sPayID), 1);
          System.Delete(sPayStr, Length(sPayStr) - 1, 2);
        end;

        if sPayStr = '' then
          sPayStr := 'VERÝ AKTARILMAMAKTADIR';
        tblAktarim.Edit;
        tblAktarim.FieldByName('payl_taraf_ids').AsString := sPayID;
        tblAktarim.FieldByName('payl_taraf_str').AsString := sPayStr;
        tblAktarim.Post;
      end;
    end;

    // Paylaþým Metodlarý Listesi
    begin
      QueryOpen(qTmp, 'SELECT DISTINCT payl_metod_ids from data_envanter ' + 'WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) + ' AND kisi_id = ' + MainMod.qAydinlatma.FieldByName('kisi_id').AsString + ' AND kaynak_id = ' + tblAktarim.FieldByName('kaynak_id').AsString + ' ORDER BY 1');
      sPayStr := '';
      sPayID := '';
      while not qTmp.EOF do
      begin
        if qTmp.FieldByName('payl_metod_ids').AsString <> '' then
          sPayID := sPayID + qTmp.FieldByName('payl_metod_ids').AsString + ',';

        qTmp.Next;
      end;
      if sPayID <> '' then
      begin
        System.Delete(sPayID, Length(sPayID), 1);
        QueryOpen(qTmp, 'SELECT id, metod FROM def_data_metod WHERE id IN (' + sPayID + ')');

        sPayStr := '';
        sPayID := '';
        while not qTmp.EOF do
        begin
          sPayID := sPayID + qTmp.FieldByName('id').AsString + ',';
          sPayStr := sPayStr + qTmp.FieldByName('metod').AsString + ', ';

          qTmp.Next;
        end;
        if sPayID <> '' then
        begin
          System.Delete(sPayID, Length(sPayID), 1);
          System.Delete(sPayStr, Length(sPayStr) - 1, 2);
        end;
        tblAktarim.Edit;
        tblAktarim.FieldByName('payl_metod_ids').AsString := sPayID;
        tblAktarim.FieldByName('payl_metod_str').AsString := sPayStr;
        tblAktarim.Post;
      end;

      tblAktarim.Next;
    end;
  end;

  tblAktarim.First;
end;

procedure TfrAydinlatmaSablonListe.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('AydinlatmaSablonListe');
end;

procedure TfrAydinlatmaSablonListe.btnMetinGuncelleClick(Sender: TObject);
begin
  AdinlatmaAcikRizaSablonGuncelle;
end;

procedure TfrAydinlatmaSablonListe.btnTestClick(Sender: TObject);
begin
QueryOpen(qTmp,'SELECT * FROM def_data_aydinlatma_docs where ayd_id =' +
  mainmod.qAydinlatma.FieldByName('id').AsString);
if  qtmp.IsEmpty then exit;

AydinlatmaMetniTest( qTmp.FieldByName('ayd_guid').AsString);

end;

procedure TfrAydinlatmaSablonListe.UniDBGrid1AjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'popup' then
    ppmData.Popup(StrToInt(Params.Values['x']), StrToInt(Params.Values['y']), UniDBGrid1);
end;

procedure TfrAydinlatmaSablonListe.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir: string;
begin
  if not Column.Sortable then
    Exit;

  if Direction then
    Dir := 'ASC'
  else
    Dir := 'DESC';
  MainMod.qAydinlatma.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrAydinlatmaSablonListe.UniFrameCreate(Sender: TObject);
begin
  edSrcDept.Items.Clear;
  edSrcDept.Items.Add('-- TÜM DEPARTMANLAR --');
  deptIdList := TSTringList.Create;
  deptIdList.Add('0');

  if mainmod.LoginInfo.Birimler <> '' then
    QueryOpen(qTmp, 'SELECT id, title FROM sys_deptdef WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' AND id in (' + mainmod.LoginInfo.Birimler + ') ORDER BY title')
  else
  begin
    QueryOpen(qTmp, 'SELECT id, title FROM sys_deptdef WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' AND id in (0) ORDER BY title');
    MessageDlg('Kullanýcýnýza yetkili departman tanýmlanmadýðý için ilgili Aydýnlatma Metinlerini göremezsiniz. Lütfen kurum yetkilisi ile iletiþime geçiniz.', mtError, [mbOk]);
  end;
  qTmp.First;
  while not qTmp.Eof do
  begin
    edSrcDept.Items.Add(qTmp.FieldByName('title').AsString);
    deptIdList.Add(qTmp.FieldByName('id').AsString);
    qTmp.Next;
  end;

  edSrcDept.ItemIndex := 0;
  edSrcIys.Visible := MainMod.IYSVar;

  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;
end;

initialization
  RegisterClass(TfrAydinlatmaSablonListe);

end.

