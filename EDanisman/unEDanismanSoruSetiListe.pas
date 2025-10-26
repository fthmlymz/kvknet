unit unEDanismanSoruSetiListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniButton, uniBitBtn,
  uniLabel, uniEdit, uniGUIBaseClasses, uniPanel, Data.DB, DBAccess, Uni, System.Actions, Vcl.ActnList,
  uniMenuButton, Vcl.Menus, uniMainMenu, MemDS, VirtualTable,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report, FlexCel.Render,
  rXMLReport, VirtualQuery;

type
  TfrmEDanismanSoruSetiListe = class(TUniFrame)
    ActList: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDownload: TAction;
    actSearch: TAction;
    actClose: TAction;
    dsSoru: TUniDataSource;
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
    UniBitBtn1: TUniBitBtn;
    UniLabel3: TUniLabel;
    edSrcDept: TUniComboBox;
    acExcel: TAction;
    qTmp: TUniQuery;
    qSoruSeti: TUniQuery;
    UniBitBtn2: TUniBitBtn;
    actCevapla: TAction;
    UniBitBtn3: TUniBitBtn;
    actSonuc: TAction;
    DOCXRpt: TrXMLReport;
    tblRapor: TVirtualTable;
    qRapor: TVirtualQuery;
    actCopy: TAction;
    UniBitBtn4: TUniBitBtn;
    hpnFiltre: TUniHiddenPanel;
    cbfActive: TUniComboBox;
    edfSSNo: TUniEdit;
    edfBaslik: TUniEdit;
    edfDepartman: TUniEdit;
    lbKayitSayisi: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure edSrcTipiChange(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
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
    procedure actCopyExecute(Sender: TObject);
    procedure UniDBGrid1ColumnFilter(Sender: TUniDBGrid;
      const Column: TUniDBGridColumn; const Value: Variant);
    procedure edSrcDeptChange(Sender: TObject);
  private
    DeptIdList: TStringList;
    procedure NewSQL;
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

procedure TfrmEDanismanSoruSetiListe.actAddExecute(Sender: TObject);
begin
  if frmEDanismanSoruSetiTanim.Exec(0, 0) = mrOk then RefreshQuery(qSoruSeti);
  ManageSettings;
end;

procedure TfrmEDanismanSoruSetiListe.actCevaplaExecute(Sender: TObject);
begin
  if qSoruSeti.RecordCount < 1 then Exit;


  if frmEDanismanSoruSetiTanim.Exec(qSoruSeti.FieldByName('id').AsInteger, 1) = mrOk then RefreshQuery(qSoruSeti);
  ManageSettings;
end;

procedure TfrmEDanismanSoruSetiListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrmEDanismanSoruSetiListe.actCopyExecute(Sender: TObject);
begin
  if qSoruSeti.RecordCount < 1 then Exit;

  if frmEDanismanSoruSetiTanim.Exec(qSoruSeti.FieldByName('id').AsInteger, 2) = mrOk then RefreshQuery(qSoruSeti);
  ManageSettings;
end;

procedure TfrmEDanismanSoruSetiListe.actEditExecute(Sender: TObject);
begin
//  if qSoruSeti.FieldByName('cevaplandi').AsInteger > 0 then  //todo: açýlacak
//  begin
//    MessageDlg('Cevaplanan soru setinde deðiþiklik yapamazsýnýz.', mtWarning, [mbOk]);
//    exit;
//  end;
//  if trunc(qSoruSeti.FieldByName('tarih').AsDateTime) <= trunc(now) then
//  begin
//    MessageDlg('Tarihi geçmiþ (baþlamýþ) soru setinde deðiþiklik yapamazsýnýz.', mtWarning, [mbOk]);
//    exit;
//  end;
//  if trunc(qSoruSeti.FieldByName('bitis_tarihi').AsDateTime) <= now then
//  begin
//    MessageDlg('Tarihi geçmiþ (bitmiþ) soru setinde deðiþiklik yapamazsýnýz.', mtWarning, [mbOk]);
//    exit;
//  end;

  if frmEDanismanSoruSetiTanim.Exec(qSoruSeti.FieldByName('id').AsInteger, 0) = mrOk then RefreshQuery(qSoruSeti);
  ManageSettings;
end;

procedure TfrmEDanismanSoruSetiListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrmEDanismanSoruSetiListe.DOCXRptUserCalc(Sender: TObject;
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

procedure TfrmEDanismanSoruSetiListe.edSrcDeptChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrmEDanismanSoruSetiListe.edSrcIysChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrmEDanismanSoruSetiListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrmEDanismanSoruSetiListe.edSrcTipiChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrmEDanismanSoruSetiListe.ManageSettings;
begin
  actAdd.Enabled      := MainMod.LoginInfo.Yetkiler[168] and (qSoruSeti.State = dsBrowse);
  actEdit.Enabled     := MainMod.LoginInfo.Yetkiler[169] and (qSoruSeti.State = dsBrowse) and (qSoruSeti.FieldByName('id').AsInteger > 0);
  actCevapla.Enabled  := MainMod.LoginInfo.Yetkiler[172] and (qSoruSeti.State = dsBrowse) and (qSoruSeti.FieldByName('id').AsInteger > 0);
  actsonuc.Enabled    := MainMod.LoginInfo.Yetkiler[173] and (qSoruSeti.State = dsBrowse) and (qSoruSeti.FieldByName('id').AsInteger > 0);
//  actDelete.Enabled   := MainMod.LoginInfo.Yetkiler[170] and (qSoruSeti.State = dsBrowse) and (qSoruSeti.FieldByName('id').AsInteger > 0);


  actClose.Enabled  := not DataEditing(qSoruSeti);
end;

procedure TfrmEDanismanSoruSetiListe.NewSQL;
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
    3: WhereStr := WhereStr + 'sr.active = ''E'' AND NOT sr.id IN (SELECT soru_id FROM edns_soruseti_cevap WHERE soru_id=sr.id) AND ';
  end;

  if edSrcText.Text <> '' then
  begin
     if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
    case edSrcTipi.ItemIndex of
      0 : WhereStr := WhereStr + 'sr.id =:id AND ';
      1 : WhereStr := WhereStr + 'sr.baslik LIKE :srctext AND ';
      2 : WhereStr := WhereStr + 'sr.ss_no LIKE :srctext AND ';
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
  if qSoruSeti.FindParam('id') <> nil then
    qSoruSeti.ParamByName('id').AsInteger :=  StrToIntDef(edSrcText.Text, 0);

  if qSoruSeti.FindParam('srctext') <> nil then
    qSoruSeti.ParamByName('srctext').AsString :=  srctext;

  qSoruSeti.Open;


  ManageSettings;
  lbKayitSayisi.Text := IntToStr(qSoruSeti.RecordCount) + ' Kayýt Listelendi...';
end;


procedure TfrmEDanismanSoruSetiListe.UniBitBtn1Click(Sender: TObject);
begin
  frmHelpPage.Exec('EDanismanSoruSetiListe');
end;

procedure TfrmEDanismanSoruSetiListe.UniDBGrid1ColumnFilter(Sender: TUniDBGrid;
  const Column: TUniDBGridColumn; const Value: Variant);
begin
  if Length(cbfActive.Text) > 0 then
  begin
    qSoruSeti.Filtered := False;
    qSoruSeti.FilterOptions := [foCaseInsensitive];
    qSoruSeti.Filter        := 'active' + ' = ' + QuotedStr('' +(TR_Upper(cbfActive.Text))+ '');
    qSoruSeti.Filtered := True;
  end
  else if edfSSNo.Text <> '' then
  begin
    qSoruSeti.Filtered := False;
    qSoruSeti.FilterOptions := [foCaseInsensitive];
    qSoruSeti.Filter        := 'ss_no' + ' LIKE ' + QuotedStr('%' +(TR_Upper(edfSSNo.Text))+ '%');
    qSoruSeti.Filtered := True;
  end
  else if Length(edfBaslik.Text) > 2 then
  begin
    qSoruSeti.Filtered := False;
    qSoruSeti.FilterOptions := [foCaseInsensitive];
    qSoruSeti.Filter        := 'baslik' + ' LIKE ' + QuotedStr('%' +(TR_Upper(edfBaslik.Text))+ '%');
    qSoruSeti.Filtered := True;
  end
  else if Length(edfDepartman.Text) > 2 then
  begin
    qSoruSeti.Filtered := False;
    qSoruSeti.FilterOptions := [foCaseInsensitive];
    qSoruSeti.Filter        := 'departman' + ' LIKE ' + QuotedStr('%' +(TR_Upper(edfDepartman.Text))+ '%');
    qSoruSeti.Filtered := True;
  end
  else
  begin
    qSoruSeti.Filtered := False;
  end;
end;

procedure TfrmEDanismanSoruSetiListe.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  qSoruSeti.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrmEDanismanSoruSetiListe.UniDBGrid1DrawColumnCell(Sender: TObject; ACol,
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

procedure TfrmEDanismanSoruSetiListe.UniFrameCreate(Sender: TObject);
begin
  edSrcDept.Items.Clear;
  edSrcDept.Items.Add('-- TÜM DEPARTMANLAR --');
  deptIdList := TSTringList.Create;
  deptIdList.Add('0');

  if mainmod.LoginInfo.Birimler <> '' then

  QueryOpen(qTmp, ' SELECT dp.id, ' +
                  ' (case when coalesce(dp.main_dept_id,0) > 0 then dp.title||'' (''||dp_main.title||'') '' ' +
                  ' else dp.title end) title ' +
                  ' FROM sys_deptdef dp left join sys_deptdef dp_main on dp_main.id = dp.main_dept_id ' +
                  ' WHERE dp.id in (' + mainmod.LoginInfo.Birimler + ') ' +
                  ' AND dp.mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY dp.title')
  else
  begin
  QueryOpen(qTmp, ' SELECT dp.id, ' +
                  ' (case when coalesce(dp.main_dept_id,0) > 0 then dp.title||'' (''||dp_main.title||'') '' ' +
                  ' else dp.title end) title ' +
                  ' FROM sys_deptdef dp left join sys_deptdef dp_main on dp_main.id = dp.main_dept_id ' +
                  ' WHERE dp.id in (0) ' +
                  ' AND dp.mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY dp.title')

  end;
  qTmp.First;
  while not qTmp.Eof do
  begin
    edSrcDept.Items.Add(qTmp.FieldByName('title').AsString);
    deptIdList.Add(qTmp.FieldByName('id').AsString);
    qTmp.Next;
  end;
  edSrcDept.ItemIndex := 0;

  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;

  actCevapla.caption := 'Cevapla<br/>-<br>Cevap Göster';
end;

initialization
  RegisterClass(TfrmEDanismanSoruSetiListe);

end.
