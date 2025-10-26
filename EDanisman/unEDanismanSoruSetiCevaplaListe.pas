unit unEDanismanSoruSetiCevaplaListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniButton, uniBitBtn,
  uniLabel, uniEdit, uniGUIBaseClasses, uniPanel, Data.DB, DBAccess, Uni, System.Actions, Vcl.ActnList,
  uniMenuButton, Vcl.Menus, uniMainMenu, MemDS, VirtualTable,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report, FlexCel.Render,
  rXMLReport, VirtualQuery, frxClass, frxDBSet, frxExportPDF,
  frxExportBaseDialog, frxExportDOCX, frxExportPPTX, uniDateTimePicker;

type
  TfrmEDanismanSoruSetiCevaplaListe = class(TUniFrame)
    ActList: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDownload: TAction;
    actSearch: TAction;
    actClose: TAction;
    dsSoruSeti: TUniDataSource;
    pnlTop: TUniPanel;
    edSrcText: TUniEdit;
    UniLabel1: TUniLabel;
    btnSearch: TUniBitBtn;
    btnClose: TUniBitBtn;
    UniLabel2: TUniLabel;
    edSrcDurumu: TUniComboBox;
    edSrcTipi: TUniComboBox;
    UniDBGrid1: TUniDBGrid;
    UniBitBtn1: TUniBitBtn;
    UniLabel3: TUniLabel;
    edSrcDept: TUniComboBox;
    acExcel: TAction;
    qTmp: TUniQuery;
    qSoruSeti: TUniQuery;
    UniBitBtn2: TUniBitBtn;
    actCevapla: TAction;
    actSonuc: TAction;
    DOCXRpt: TrXMLReport;
    tblRapor: TVirtualTable;
    qRapor: TVirtualQuery;
    rptSonuc: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    dsRapor: TUniDataSource;
    qRaporsoruno: TStringField;
    qRaporsorumetni: TStringField;
    qRaporsecenekno: TStringField;
    qRaporsecenekmetni: TStringField;
    qRaporsonucmetni: TStringField;
    qRaporbulgumetni: TStringField;
    qRaporriskseviyesi: TStringField;
    qRaporriskmetni: TStringField;
    qRaporreferansmetni: TStringField;
    qRaporsatirno: TIntegerField;
    dsSonucDetay: TfrxDBDataset;
    qRaporfonksiyon: TStringField;
    qRaporhdr_kurum: TStringField;
    qRaporhdr_departman: TStringField;
    qRaporhdr_ssbaslik: TStringField;
    qRaporhdr_tarih: TStringField;
    qRaporhdr_logo: TBlobField;
    frxDOCXExport1: TfrxDOCXExport;
    ppmDownload: TUniPopupMenu;
    ppmiAydinlatmaMetni: TUniMenuItem;
    ppmiAcikRizaBeyani: TUniMenuItem;
    UniMenuButton1: TUniMenuButton;
    frxPPTXExport1: TfrxPPTXExport;
    rptSonuc2: TfrxReport;
    SonucRaporuYatayPDF1: TUniMenuItem;
    SonuraporuPPT1: TUniMenuItem;
    hpnFiltre: TUniHiddenPanel;
    cbfAktif: TUniComboBox;
    edfSoruSetiNo: TUniEdit;
    edfBaslik: TUniEdit;
    edfDepartman: TUniEdit;
    edfSoruSayi: TUniEdit;
    edfCevaplandi: TUniNumberEdit;
    lbKayitSayisi: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure edSrcTipiChange(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure edSrcIysChange(Sender: TObject);
    procedure actCevaplaExecute(Sender: TObject);
    procedure UniDBGrid1DrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure DOCXRptUserCalc(Sender: TObject; var CalcStr: string;
      var Replace: Boolean);
    procedure ppmiAydinlatmaMetniClick(Sender: TObject);
    procedure ppmiAcikRizaBeyaniClick(Sender: TObject);
    procedure SonucRaporuYatayPDF1Click(Sender: TObject);
    procedure SonuraporuPPT1Click(Sender: TObject);
    procedure UniDBGrid1ColumnFilter(Sender: TUniDBGrid;
      const Column: TUniDBGridColumn; const Value: Variant);
    procedure edSrcDeptAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
    procedure edSrcDurumuChange(Sender: TObject);
    procedure edSrcDeptChange(Sender: TObject);
  private
    DeptIdList: TStringList;
    procedure NewSQL;
    procedure PrepareReport(format: String);
    procedure ManageSettings;

  public
  end;

implementation

{$R *.dfm}

uses MainModule, ServerModule, McMLib, Main,
  unHelpPage, unEDanismanSoruTanim, unEDanismanCevapTanim,
  unEDanismanSoruSetiTanim;

const
  ParantezAc    : String = #13'(';
  ParantezKapat : String = ')'#13;

procedure TfrmEDanismanSoruSetiCevaplaListe.actCevaplaExecute(Sender: TObject);
begin
  if qSoruSeti.FieldByName('tarih').AsDateTime > now then
  begin
    MessageDlg('Tarihi gelmemiþ soru setinde deðiþiklik yapamazsýnýz.', mtWarning, [mbOk]);
    exit;
  end;
  if qSoruSeti.FieldByName('bitis_tarihi').AsDateTime < now then
  begin
    MessageDlg('Bitiþ Tarihi geçmiþ soru setinde deðiþiklik yapamazsýnýz.', mtWarning, [mbOk]);
//    exit;
  end;

  if frmEDanismanSoruSetiTanim.Exec(qSoruSeti.FieldByName('id').AsInteger, 1) = mrOk then RefreshQuery(qSoruSeti);
  ManageSettings;
end;

procedure TfrmEDanismanSoruSetiCevaplaListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrmEDanismanSoruSetiCevaplaListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrmEDanismanSoruSetiCevaplaListe.DOCXRptUserCalc(Sender: TObject;
  var CalcStr: string; var Replace: Boolean);
var
  TagValue : String;
begin
  Replace  := True;
  TagValue := AnsiUpperCase(CalcStr);

  if TagValue = 'COMPANYLOGO' then TagValue := MainForm.GetLogoFileName
  else if TagValue = 'COMPANYTITLE' then TagValue := Trim(MainMod.qMCDef.FieldByName('title').AsString)
  else if TagValue = 'SORUSETINO' then TagValue := qSoruSeti.FieldByName('ss_no').AsString
  else if TagValue = 'SORUSETIBASLIGI' then TagValue := qSoruSeti.FieldByName('baslik').AsString
  else if TagValue = 'RAPORTARIHI' then TagValue := formatdatetime('dd.mm.yyyy', now)
  else Replace := False;

  if Replace then CalcStr := TagValue;
end;

procedure TfrmEDanismanSoruSetiCevaplaListe.edSrcDeptAjaxEvent(
  Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  NewSQL;
end;

procedure TfrmEDanismanSoruSetiCevaplaListe.edSrcDeptChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrmEDanismanSoruSetiCevaplaListe.edSrcDurumuChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrmEDanismanSoruSetiCevaplaListe.edSrcIysChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrmEDanismanSoruSetiCevaplaListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrmEDanismanSoruSetiCevaplaListe.edSrcTipiChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrmEDanismanSoruSetiCevaplaListe.ManageSettings;
begin
//  actAdd.Enabled      := MainMod.LoginInfo.Yetkiler[172] and (qSoruSeti.State = dsBrowse);
  actCevapla.Enabled  := MainMod.LoginInfo.Yetkiler[172] and (qSoruSeti.State = dsBrowse) and (qSoruSeti.FieldByName('id').AsInteger > 0);
  actsonuc.Enabled    := MainMod.LoginInfo.Yetkiler[173] and (qSoruSeti.State = dsBrowse) and (qSoruSeti.FieldByName('id').AsInteger > 0);


  actClose.Enabled  := not DataEditing(qSoruSeti);
end;

procedure TfrmEDanismanSoruSetiCevaplaListe.NewSQL;
var
	SQLStr,
  srcText,
  deptStr,
	WhereStr : string;
  i: integer;
begin
  if not GuvenliGirisMi(edSrcText.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;

	SQLStr   := 'SELECT sr.*, fnc_id2str(sr.dept_ids, ''sys_deptdef'', ''title'') departman, ' +
              '(SELECT count(*) FROM edns_soruseti_soru WHERE ss_id=sr.id) sorusayisi, ' +
              '(SELECT count(*) FROM edns_soruseti_cevap WHERE ss_id=sr.id) cevaplandi ' +
              'FROM edns_soruseti sr ';

	WhereStr := 'sr.mc_id =:mc_id AND ';
  case edSrcDurumu.ItemIndex of
    1: WhereStr := WhereStr + 'sr.active = ''E'' AND ';
    2: WhereStr := WhereStr + 'sr.active = ''H'' AND ';
    3: WhereStr := WhereStr + 'sr.active = ''E'' AND NOT sr.id in (SELECT soru_id FROM edns_soruseti_cevap WHERE soru_id=sr.id) AND ';
  end;

  if edSrcText.Text <> '' then
  begin
    if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
    case edSrcTipi.ItemIndex of
      0 : WhereStr := WhereStr + 'sr.id::varchar LIKE :srctext  AND ';
      1 : WhereStr := WhereStr + 'sr.baslik LIKE :srctext  AND ';
      2 : WhereStr := WhereStr + 'sr.ss_no LIKE :srctext  AND ';
    end;
  end;

  if MainMod.LoginInfo.Birimler = '' then WhereStr  := WhereStr + 'sr.dept_ids = ''0'' AND '
   else WhereStr  := WhereStr + ' '',' + MainMod.LoginInfo.Birimler + ','' like ''%,''||sr.dept_ids||'',%'' AND ';

  if edSrcDept.ItemIndex > 0 then
  begin
    WhereStr := WhereStr + ''',''||sr.dept_ids||'','' like ''%,' + deptIdList[edSrcDept.ItemIndex] + ',%'' AND ';
  end
  else
  begin
    deptstr := 'coalesce(sr.dept_ids, '''')='''' OR ';
    for i := 0 to deptIdList.Count-1 do
      deptStr := deptStr + ''',''||sr.dept_ids||'','' like ''%,' + deptIdList[i] + ',%'' OR ';
    if deptStr <> '' then
    WhereStr := whereStr + ' (' + copy(deptstr, 1, length(deptstr)-3) + ') AND ';
  end;

	if Trim(WhereStr) <> '' then System.Delete(WhereStr, Length(WhereStr) - 3, 4);
	if Trim(WhereStr) <> '' then SQLStr := SQLStr + 'WHERE ' + WhereStr;
	SQLStr := SQLStr + ' ORDER BY sr.id';

//	QueryOpen(qSoruSeti, SQLStr);
  qSoruSeti.SQL.Text := SQLStr ;
  qSoruSeti.ParamByName('mc_id').AsString := inttostr(mainmod.MCID);
  if qSoruSeti.FindParam('srcText') <> nil then
    qSoruSeti.ParamByName('srcText').AsString := srcText;
  qSoruSeti.Open;
  ManageSettings;
  lbKayitSayisi.Text := IntToStr(qSoruSeti.RecordCount) + ' Kayýt Listelendi...';
end;

procedure TfrmEDanismanSoruSetiCevaplaListe.ppmiAcikRizaBeyaniClick(
  Sender: TObject);
begin
  if qSoruSeti.FieldByName('cevaplandi').AsInteger > 0 then
    PrepareReport('DOCX');
end;

procedure TfrmEDanismanSoruSetiCevaplaListe.ppmiAydinlatmaMetniClick(
  Sender: TObject);
begin
    if qSoruSeti.FieldByName('cevaplandi').AsInteger > 0 then
      PrepareReport('PDF');
end;

procedure TfrmEDanismanSoruSetiCevaplaListe.PrepareReport(format: String);
var
  sqlStr: String;
  msgStr: String;
  TmpName : String;
  FUrl    : String;
  secno   : Integer;
  satirno : Integer;
  rpt   : TFrxReport;
begin
  sqlStr := 'SELECT ' +
            '(SELECT count(*) FROM edns_soruseti_soru WHERE ss_id=sr.id) sorusayisi, ' +
            '(SELECT count(*) FROM edns_soruseti_cevap WHERE ss_id=sr.id) cevapsayisi ' +
            'FROM edns_soruseti sr ' +
            'WHERE sr.id=' + qSoruSeti.FieldByName('id').AsString;
  queryOpen(qTmp, sqlStr);
  msgStr := '<p>Soru Seti ' + qSoruSeti.FieldByName('ss_no').AsString + ' ' + qSoruSeti.FieldByName('baslik').AsString + '</p>';
  if qtmp.FieldByName('sorusayisi').AsString > qtmp.FieldByName('cevapsayisi').AsString then
    msgStr := msgstr + '<p>(Tamamlanmadý!)</p>';
  msgstr := msgstr + '<p>Soru Sayýsý: ' + qtmp.FieldByName('sorusayisi').AsString + '</p>';
  msgstr := msgstr + '<p>Cevap Sayýsý: ' + qtmp.FieldByName('cevapsayisi').AsString + '</p>';
  MessageDlg(msgStr, mtInformation, [mbOk]);

  if tblrapor.active = false then
    tblRapor.Open;
  tblrapor.First;
  while not tblRapor.Eof do
    tblRapor.Delete;

  sqlStr := 'SELECT st.id, sr.id, sr.soru_no, cvp.id, cvp.soru_no, cvp.soru_metni, cvp.referans, ' +
            'cvp.secenek_1, cvp.secenek_1_secildi, cvp.secenek_1_sonuc, ' +
            'cvp.secenek_2, cvp.secenek_2_secildi, cvp.secenek_2_sonuc, ' +
            'cvp.secenek_3, cvp.secenek_3_secildi, cvp.secenek_3_sonuc, ' +
            'cvp.secenek_4, cvp.secenek_4_secildi, cvp.secenek_4_sonuc, ' +
            'cvp.secenek_5, cvp.secenek_5_secildi, cvp.secenek_5_sonuc, ' +
            'cvp.secenek_1_riskseviye, cvp.secenek_2_riskseviye, cvp.secenek_3_riskseviye, cvp.secenek_4_riskseviye, cvp.secenek_5_riskseviye, ' +
            'cvp.secenek_1_risk, cvp.secenek_2_risk, cvp.secenek_3_risk, cvp.secenek_4_risk, cvp.secenek_5_risk, ' +
            'cvp.sdt, cvp.sdt ' +
            'FROM edns_soruseti st ' +
            'LEFT JOIN edns_soruseti_soru sr ON st.id=sr.ss_id ' +
            'LEFT JOIN edns_soruseti_cevap cvp ON st.id=cvp.ss_id AND sr.id=cvp.soru_id ' +
            'WHERE st.id= ' + qSoruSeti.FieldByName('id').AsString +
            ' order by sr.func_id, sr.id ';
  queryOpen(qTmp, sqlStr);
  satirno := 1;
  qTmp.First;
  while not qtmp.eof do
  begin
    for secno := 1 to 5 do
    begin
      if qTmp.FieldByName('secenek_' + IntToStr(secno) + '_secildi').AsString = 'E' then
      begin
        tblRapor.insert;
        tblRapor.FieldByName('soruno').AsString := qTmp.FieldByName('soru_no').AsString;
        tblRapor.FieldByName('sorumetni').AsString := qTmp.FieldByName('soru_metni').AsString;
        tblRapor.FieldByName('secenekno').AsString := IntToStr(secno);
        tblRapor.FieldByName('secenekmetni').AsString := qTmp.FieldByName('secenek_' + IntToStr(secno)).AsString;
        tblRapor.FieldByName('sonucmetni').AsString := qTmp.FieldByName('secenek_' + IntToStr(secno) + '_sonuc').AsString;
        tblRapor.FieldByName('riskseviyesi').AsString := qTmp.FieldByName('secenek_' + IntToStr(secno) + '_riskseviye').AsString;
        tblRapor.FieldByName('riskmetni').AsString := qTmp.FieldByName('secenek_' + IntToStr(secno) + '_risk').AsString;
        tblRapor.FieldByName('referansmetni').AsString := qTmp.FieldByName('referans').AsString;

        tblRapor.FieldByName('hdr_kurum').AsString := Trim(MainMod.qMCDef.FieldByName('title').AsString);
        tblRapor.FieldByName('hdr_departman').AsString := qSoruSeti.FieldByName('departman').AsString;
        tblRapor.FieldByName('hdr_baslik').AsString := qSoruSeti.FieldByName('baslik').AsString;
        tblRapor.FieldByName('hdr_tarih').AsString := formatdatetime('dd.mm.yyyy', now);
        tblRapor.FieldByName('hdr_logo').AsBytes := MainMod.qMCDef.FieldByName('krm_logo').AsBytes;

        tblRapor.FieldByName('satirno').AsInteger := satirno;
        tblRapor.Post;
        satirno := satirno + 1;
      end;
    end;
    qTmp.Next;
  end;

  qRapor.Close;
  qRapor.SQL.Text := 'SELECT * FROM tblRapor ORDER BY satirno';
  qRapor.Open;



//  try
//    DOCXRpt.ReportFile := ServerMod.FilesFolderPath + 'temp\E_DANISMAN_SONUC_RAPORU.docx'; //Template file name
//    DOCXRpt.OutputFile := ServerMod.NewCacheFileUrl(False, 'docx', '', '', FUrl, True);
//    DOCXRpt.Execute([qRapor]);
//  except on E: Exception do
//    begin
//      MessageDlg('Hata.. Þablon oluþturulamýyor.'#13 + E.Message, mtError, [mbOk]);
//      Exit;
//    end;
//  end;

  if (format='PDF') or (format='DOCX') then
    rpt := rptSonuc
  else
  if (format='PDF2') or (format='PPTX') then
    rpt := rptSonuc2;

  rpt.PrintOptions.ShowDialog := False;
  rpt.ShowProgress := false;

  rpt.EngineOptions.SilentMode := True;
  rpt.EngineOptions.EnableThreadSafe := True;
  rpt.EngineOptions.DestroyForms := False;
  rpt.EngineOptions.UseGlobalDataSetList := False;

  rpt.PreviewOptions.AllowEdit := False;
  rpt.PrepareReport;

  if (format='PDF') or (format='PDF2') then
  begin
    frxPDFExport1.Background := True;
    frxPDFExport1.ShowProgress := False;
    frxPDFExport1.ShowDialog := False;
    frxPDFExport1.FileName := ServerMod.NewCacheFileUrl(False, 'pdf', '', '', FUrl, True);
    frxPDFExport1.DefaultPath := '';

    if rpt.Export(frxPDFExport1) then
      UniSession.SendFile(frxPDFExport1.FileName, DosyaAdiTemizle(qSoruSeti.FieldByName('ss_no').AsString) + '_SONUC_RAPORU.PDF');
  end
  else
  if format='DOCX' then
  begin
    frxDOCXExport1.ShowProgress := False;
    frxDOCXExport1.ShowDialog := False;
    frxDOCXExport1.FileName := ServerMod.NewCacheFileUrl(False, 'docx', '', '', FUrl, True);
    frxDOCXExport1.DefaultPath := '';

    if rpt.Export(frxDOCXExport1) then
      UniSession.SendFile(frxDOCXExport1.FileName, DosyaAdiTemizle( qSoruSeti.FieldByName('ss_no').AsString) + '_SONUC_RAPORU.DOCX');
  end
  else
  if format='PPTX' then
  begin
    frxPPTXExport1.ShowProgress := False;
    frxPPTXExport1.ShowDialog := False;
    frxPPTXExport1.FileName := ServerMod.NewCacheFileUrl(False, 'pptx', '', '', FUrl, True);
    frxPPTXExport1.DefaultPath := '';

    if rpt.Export(frxPPTXExport1) then
      UniSession.SendFile(frxPPTXExport1.FileName, DosyaAdiTemizle(qSoruSeti.FieldByName('ss_no').AsString) + '_SONUC_RAPORU.PPTX');
  end;

end;

procedure TfrmEDanismanSoruSetiCevaplaListe.SonucRaporuYatayPDF1Click(
  Sender: TObject);
begin
  if qSoruSeti.FieldByName('cevaplandi').AsInteger > 0 then
    PrepareReport('PDF2');
end;

procedure TfrmEDanismanSoruSetiCevaplaListe.SonuraporuPPT1Click(
  Sender: TObject);
begin
  if qSoruSeti.FieldByName('cevaplandi').AsInteger > 0 then
    PrepareReport('PPTX');
end;

procedure TfrmEDanismanSoruSetiCevaplaListe.UniBitBtn1Click(Sender: TObject);
begin
  frmHelpPage.Exec('EDanismanSoruSetiCevaplaListe');
end;

procedure TfrmEDanismanSoruSetiCevaplaListe.UniDBGrid1ColumnFilter(
  Sender: TUniDBGrid; const Column: TUniDBGridColumn; const Value: Variant);
begin
  if Length(cbfAktif.Text) > 0 then
  begin
    qSoruSeti.Filtered      := False;
    qSoruSeti.FilterOptions := [foCaseInsensitive];
    qSoruSeti.Filter        := 'active' + ' LIKE ' + QuotedStr('%' +(TR_Upper(cbfAktif.Text))+ '%');
    qSoruSeti.Filtered := True;
  end
  else if Length(edfSoruSetiNo.Text) > 0 then
  begin
    qSoruSeti.Filtered      := False;
    qSoruSeti.FilterOptions := [foCaseInsensitive];
    qSoruSeti.Filter        := 'ss_no' + ' LIKE ' + QuotedStr('%' +(TR_Upper(edfSoruSetiNo.Text))+ '%');
    qSoruSeti.Filtered := True;
  end
  else if Length(edfBaslik.Text) > 2 then
  begin
    qSoruSeti.Filtered      := False;
    qSoruSeti.FilterOptions := [foCaseInsensitive];
    qSoruSeti.Filter        := 'baslik' + ' LIKE ' + QuotedStr('%' +(TR_Upper(edfBaslik.Text))+ '%');
    qSoruSeti.Filtered := True;
  end
  else if Length(edfDepartman.Text) > 2 then
  begin
    qSoruSeti.Filtered      := False;
    qSoruSeti.FilterOptions := [foCaseInsensitive];
    qSoruSeti.Filter        := 'departman' + ' LIKE ' + QuotedStr('%' +(TR_Upper(edfDepartman.Text))+ '%');
    qSoruSeti.Filtered := True;
  end
  else if Length(edfSoruSayi.Text) > 0 then
  begin
    qSoruSeti.Filtered      := False;
    qSoruSeti.FilterOptions := [foCaseInsensitive];
    qSoruSeti.Filter        := 'sorusayisi' + ' LIKE ' + QuotedStr('%' +(TR_Upper(edfSoruSayi.Text))+ '%');
    qSoruSeti.Filtered := True;
  end
  else if Length(edfCevaplandi.Text) > 0 then
  begin
    qSoruSeti.Filtered      := False;
    qSoruSeti.FilterOptions := [foCaseInsensitive];
    qSoruSeti.Filter        := 'cevaplandi' + ' LIKE ' + QuotedStr('%' +(TR_Upper(edfCevaplandi.Text))+ '%');
    qSoruSeti.Filtered := True;
  end
  else
  begin
    qSoruSeti.Filtered := False;
  end;
end;

procedure TfrmEDanismanSoruSetiCevaplaListe.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  qSoruSeti.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrmEDanismanSoruSetiCevaplaListe.UniDBGrid1DrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if (column.FieldName = 'sorusayisi') or (column.FieldName = 'cevaplandi') then
    if UniDBGrid1.DataSource.DataSet.FieldByName('cevaplandi').AsInteger > 0 then
  begin
    begin
//      Attribs.Font.Style := [fsItalic];
      Attribs.Color := clInfoBk;
    end;
  end;
end;

procedure TfrmEDanismanSoruSetiCevaplaListe.UniFrameCreate(Sender: TObject);
begin
  edSrcDept.Items.Clear;
  deptIdList := TSTringList.Create;

  if MainMod.LoginInfo.Birimler = '' then
  begin
    MessageDlg('Kullanýcýnýza tanýmlý departman yetkisi bulunamamýþtýr. Sistem yöneticisi ile görüþünüz..', mtInformation, [mbOk]);
  end
  else
  begin

    edSrcDept.Items.Add('-- TÜM DEPARTMANLAR --');
    deptIdList.Add('0');


  QueryOpen(qTmp, ' SELECT dp.id, ' +
                  ' (case when coalesce(dp.main_dept_id,0) > 0 then dp.title||'' (''||dp_main.title||'') '' ' +
                  ' else dp.title end)::character varying (450) title ' +
                  ' FROM sys_deptdef dp left join sys_deptdef dp_main on dp_main.id = dp.main_dept_id ' +
                  ' WHERE dp.id in (' + MainMod.LoginInfo.Birimler + ') ' +
                  ' AND dp.mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY dp.title');
    qTmp.First;
    while not qTmp.Eof do
    begin
      edSrcDept.Items.Add(qTmp.FieldByName('title').AsString);
      deptIdList.Add(qTmp.FieldByName('id').AsString);
      qTmp.Next;
    end;
    edSrcDept.ItemIndex := 0;
    NewSQL;
  end;

  ManageSettings;
  edSrcText.SetFocus;

  actCevapla.caption := 'Cevapla-Cevap Göster';
end;

initialization
  RegisterClass(TfrmEDanismanSoruSetiCevaplaListe);

end.
