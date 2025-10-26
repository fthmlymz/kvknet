unit unEDanismanSoruListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniButton, uniBitBtn,
  uniLabel, uniEdit, uniGUIBaseClasses, uniPanel, Data.DB, DBAccess, Uni, System.Actions, Vcl.ActnList,
  uniMenuButton, Vcl.Menus, uniMainMenu, MemDS, VirtualTable,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report, FlexCel.Render;

type
  TfrmEDanismanSoruListe = class(TUniFrame)
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
    edSrcFonk: TUniComboBox;
    acExcel: TAction;
    qTmp: TUniQuery;
    qSoru: TUniQuery;
    btnDelete: TUniBitBtn;
    actDelete: TAction;
    btnTopluEkle: TUniBitBtn;
    hpnFiltre: TUniHiddenPanel;
    edfId: TUniNumberEdit;
    cbfAktif: TUniComboBox;
    edfSoruNo: TUniEdit;
    edfSoruMetin: TUniEdit;
    edfFunction: TUniEdit;
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
    procedure actDeleteExecute(Sender: TObject);
    procedure SoruSilControl(Sender: TComponent; Res: Integer);
    procedure btnTopluEkleClick(Sender: TObject);
    procedure UniDBGrid1ColumnFilter(Sender: TUniDBGrid;
      const Column: TUniDBGridColumn; const Value: Variant);
    procedure edSrcFonkChange(Sender: TObject);
  private
    funcIdList: TStringList;
    procedure NewSQL;
    procedure ManageSettings;

  public
  end;

implementation

{$R *.dfm}

uses MainModule, ServerModule, McMLib, Main, unHelpPage, unEDanismanSoruTanim, unEDanismanCevapTanim,
  unEDanismanSoruTopluIslem;

const
  ParantezAc    : String = #13'(';
  ParantezKapat : String = ')'#13;

procedure TfrmEDanismanSoruListe.actAddExecute(Sender: TObject);
begin
  if frmEDanismanSoruTanim.Exec(0, 0, 0) = mrOk then RefreshQuery(qSoru);
  ManageSettings;
end;

procedure TfrmEDanismanSoruListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrmEDanismanSoruListe.actDeleteExecute(Sender: TObject);
begin
  MessageDlg('Bu soruyu silmek istediðinizden emin misiniz?', mtConfirmation, mbYesNo, SoruSilControl);

end;

procedure TfrmEDanismanSoruListe.actEditExecute(Sender: TObject);
begin
  if frmEDanismanSoruTanim.Exec(qSoru.FieldByName('id').AsInteger, 0, 0) = mrOk then RefreshQuery(qSoru);
  ManageSettings;
end;

procedure TfrmEDanismanSoruListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrmEDanismanSoruListe.btnTopluEkleClick(Sender: TObject);
begin
  frmEDanismanSoruTopluIslem.Exec('Ekle');
end;

procedure TfrmEDanismanSoruListe.edSrcFonkChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrmEDanismanSoruListe.edSrcIysChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrmEDanismanSoruListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrmEDanismanSoruListe.edSrcTipiChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrmEDanismanSoruListe.ManageSettings;
begin
  actAdd.Enabled      := MainMod.LoginInfo.Yetkiler[164] and (qSoru.State = dsBrowse);
  actEdit.Enabled     := MainMod.LoginInfo.Yetkiler[165] and (qSoru.State = dsBrowse) and (qSoru.FieldByName('id').AsInteger > 0);
  actDelete.Enabled   := MainMod.LoginInfo.Yetkiler[166] and (qSoru.State = dsBrowse) and (qSoru.FieldByName('id').AsInteger > 0);
//  btnDownload.Enabled := MainMod.LoginInfo.Yetkiler[121] and (qSoru.State = dsBrowse) and (qSoru.FieldByName('id').AsInteger > 0);


  actClose.Enabled  := not DataEditing(qSoru);
end;

procedure TfrmEDanismanSoruListe.NewSQL;
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

	SQLStr   := 'SELECT sr.*, fnk.function ' +
              'FROM edns_soru sr ' +
              'LEFT JOIN sys_funcdef fnk ON sr.func_id=fnk.id ';

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
      0 : WhereStr := WhereStr + 'sr.id::varchar LIKE :srctext AND ';
      1 : WhereStr := WhereStr + 'sr.soru_metni LIKE :srctext AND ';
      2 : WhereStr := WhereStr + 'sr.soru_no LIKE :srctext AND ';
    end;
  end;


  if edSrcFonk.ItemIndex > 0 then
  begin
    WhereStr := WhereStr + 'sr.func_id =:func_id AND ';
  end;
{  else
  begin
    deptstr := 'coalesce(sr.dept_ids, '''')='''' OR ';
    for i := 0 to deptIdList.Count-1 do
      deptStr := deptStr + 'sr.func_id = ' + deptIdList[i] + ' OR ';
    if deptStr <> '' then
    WhereStr := whereStr + ' (' + copy(deptstr, 1, length(deptstr)-3) + ') AND ';
  end;}

	if Trim(WhereStr) <> '' then System.Delete(WhereStr, Length(WhereStr) - 3, 4);
	if Trim(WhereStr) <> '' then SQLStr := SQLStr + 'WHERE ' + WhereStr;
	SQLStr := SQLStr + ' ORDER BY sr.id';

//	QueryOpen(qSoru, SQLStr);
  qSoru.SQL.Text := SQLStr ;
  qSoru.ParamByName('mc_id').AsString := inttostr(mainmod.MCID);
  if qSoru.FindParam('srctext') <> nil then
    qSoru.ParamByName('srctext').AsString := srctext;
  if qSoru.FindParam('func_id') <> nil then
    qSoru.ParamByName('func_id').AsString := funcIdList[edSrcFonk.ItemIndex];

  qSoru.Open;
  ManageSettings;
  lbKayitSayisi.Text := IntToStr(qSoru.RecordCount) + ' Kayýt Listelendi...';
end;

procedure TfrmEDanismanSoruListe.SoruSilControl(Sender: TComponent;
  Res: Integer);
begin
  if Res <> mrYes then Exit;
  qSoru.Delete;
  ManageSettings;
end;

procedure TfrmEDanismanSoruListe.UniBitBtn1Click(Sender: TObject);
begin
  frmHelpPage.Exec('EDanismanSoruListe');
end;

procedure TfrmEDanismanSoruListe.UniDBGrid1ColumnFilter(Sender: TUniDBGrid;
  const Column: TUniDBGridColumn; const Value: Variant);
begin
  if (edfId.Value > 0) then
  begin
    qSoru.Filtered      := False;
    qSoru.FilterOptions := [foCaseInsensitive];
    qSoru.Filter        := 'id' + ' LIKE ' + QuotedStr('%' +(TR_Upper(edfId.Text))+ '%');
    qSoru.Filtered := True;
  end
  else if Length(cbfAktif.Text) > 0 then
  begin
    qSoru.Filtered      := False;
    qSoru.FilterOptions := [foCaseInsensitive];
    qSoru.Filter        := 'active' + ' LIKE ' + QuotedStr('%' +(TR_Upper(cbfAktif.Text))+ '%');
    qSoru.Filtered := True;
  end
  else if Length(edfSoruNo.Text) > 0 then
  begin
    qSoru.Filtered      := False;
    qSoru.FilterOptions := [foCaseInsensitive];
    qSoru.Filter        := 'soru_no' + ' LIKE ' + QuotedStr('%' +(TR_Upper(edfSoruNo.Text))+ '%');
    qSoru.Filtered := True;
  end
  else if Length(edfSoruMetin.Text) > 2 then
  begin
    qSoru.Filtered      := False;
    qSoru.FilterOptions := [foCaseInsensitive];
    qSoru.Filter        := 'soru_metni' + ' LIKE ' + QuotedStr('%' +(TR_Upper(edfSoruMetin.Text))+ '%');
    qSoru.Filtered := True;
  end
  else if Length(edfFunction.Text) > 0 then
  begin
    qSoru.Filtered      := False;
    qSoru.FilterOptions := [foCaseInsensitive];
    qSoru.Filter        := 'function' + ' LIKE ' + QuotedStr('%' +(TR_Upper(edfFunction.Text))+ '%');
    qSoru.Filtered := True;
  end
  else
  begin
    qSoru.Filtered := False;
  end;
end;

procedure TfrmEDanismanSoruListe.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  qSoru.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrmEDanismanSoruListe.UniFrameCreate(Sender: TObject);
begin
  edSrcFonk.Items.Clear;
  edSrcFonk.Items.Add('-- TÜM FONKSÝYONLAR --');
  funcIdList := TSTringList.Create;
  funcIdList.Add('0');

  QueryOpen(qtmp, 'SELECT id, function FROM sys_funcdef WHERE active=''E'' AND (mc_id=0 OR mc_id = ' + IntToStr(MainMod.MCID) + ') ORDER BY function');
  qTmp.First;
  while not qTmp.Eof do
  begin
    edSrcFonk.Items.Add(qTmp.FieldByName('function').AsString);
    funcIdList.Add(qTmp.FieldByName('id').AsString);
    qTmp.Next;
  end;
  edSrcFonk.ItemIndex := 0;

  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;
end;

initialization
  RegisterClass(TfrmEDanismanSoruListe);

end.
