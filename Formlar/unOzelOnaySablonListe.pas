unit unOzelOnaySablonListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniButton, uniBitBtn,
  uniLabel, uniEdit, uniGUIBaseClasses, uniPanel, Data.DB, DBAccess, Uni, System.Actions, Vcl.ActnList,
  uniMenuButton, Vcl.Menus, uniMainMenu, MemDS, VirtualTable, frxClass, frxExportBaseDialog, uniImage,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report, FlexCel.Render,
  frxExportDOCX, frxDBSet, DASQLMonitor//, UniSQLMonitor
  ;

type
  TfrOzelOnaySablonListe = class(TUniFrame)
    ActList: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDownload: TAction;
    actSearch: TAction;
    actClose: TAction;
    dsOzelOnay: TUniDataSource;
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
    qTmp: TUniQuery;
    qSure: TUniQuery;
    tblAktarim: TVirtualTable;
    qOzelOnay: TUniQuery;
    edSrcIys: TUniComboBox;
    UniMenuButton1: TUniMenuButton;
    actExcel: TAction;
    actTopluKarekod: TAction;
    ppmExcel: TUniPopupMenu;
    UniMenuItem5: TUniMenuItem;
    KarekodlarTopluKaydet1: TUniMenuItem;
    tblKarekod: TVirtualTable;
    frxReportKarekod: TfrxReport;
    frxdsKarekod: TfrxDBDataset;
    frxDOCXExport1: TfrxDOCXExport;
    qExport: TUniQuery;
    btnHelp: TUniBitBtn;
    lbKayitSayisi: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure edSrcTipiChange(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure edSrcIysChange(Sender: TObject);
    procedure actTopluKarekodExecute(Sender: TObject);
    procedure actExcelExecute(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    procedure NewSQL;
    procedure ManageSettings;

  public
  end;

implementation

{$R *.dfm}

uses MainModule, ServerModule, McMLib, Main, unOzelOnaySablonTanim, unHelpPage;

const
  ParantezAc    : String = #13'(';
  ParantezKapat : String = ')'#13;

procedure TfrOzelOnaySablonListe.actAddExecute(Sender: TObject);
begin
  if frmOzelOnaySablonTanim.Exec(qOzelOnay.FieldByName('id').AsInteger, 0)= mrOk then RefreshQuery(qOzelOnay);
  ManageSettings;
end;

procedure TfrOzelOnaySablonListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrOzelOnaySablonListe.actEditExecute(Sender: TObject);
begin
  if qOzelOnay.FieldByName('durum').AsString = 'PASÝF' then
  begin
    if not MainMod.LoginInfo.Yetkiler[150] then
    begin
      MessageDlg('Deðiþtirmek istediðiniz kayýt PASÝF yapýlmýþ. Bu kaydý deðiþtirme yetkiniz yok.', mtError, [mbOk]);
      Exit;
    end;
  end;

  if frmOzelOnaySablonTanim.Exec(qOzelOnay.FieldByName('id').AsInteger, 1) = mrOk then RefreshQuery(qOzelOnay);
  ManageSettings;
end;

procedure TfrOzelOnaySablonListe.actExcelExecute(Sender: TObject);
var
  Report  : TFlexCelReport;
  FName   : String;
  TmpName : String;
  FUrl    : String;
	SQLStr,
  srcText,
	WhereStr : string;
begin
  if qOzelOnay.RecordCount < 1 then Exit;
  
	SQLStr   := 'SELECT distinct oo.id as ref_no, oo.durum, oo.tanim, ' +
              'case when oo.onay_var =''E'' then ''ONAY VAR'' else ''ONAY YOK'' end as dokuman_turu, ' +
              'case when oo.iys_var = ''E'' then ''VAR'' else ''YOK'' end as iys_entegrasyonu, ' +
              '(''' + MainMod.OzelOnayLink + ''' || oo.aguid)::character varying (200) AS web_adresi, ' +
              'oo.description as aciklama ' +
              ' FROM def_data_ozelonay oo ';

	WhereStr := 'mc_id = ' + IntToStr(MainMod.MCID) + ' AND ';
  if edSrcDurumu.ItemIndex > 0 then WhereStr := WhereStr + 'durum = ''' + edSrcDurumu.Text  + ''' AND ';

  if edSrcText.Text <> '' then
  begin
    case edSrcTipi.ItemIndex of
      0 : WhereStr := WhereStr + 'id = '  + IntToStr(StrToIntDef(edSrcText.Text, 0))  + ' AND ';
      1 : WhereStr := WhereStr + 'tanim LIKE ''%' + edSrcText.Text  + '%'' AND ';
      2 : WhereStr := WhereStr + 'description LIKE ''%' + edSrcText.Text  + '%'' AND ';
    end;
  end;

  if mainMod.iysvar and (edSrcIys.Text <> '') then
  begin
    case edSrcIys.ItemIndex of
      1 : WhereStr := WhereStr + 'coalesce(iys_var, ''H'') = ''E'' AND ';
      2 : WhereStr := WhereStr + 'coalesce(iys_var, ''H'') = ''H'' AND ';
    end;
  end;

	if Trim(WhereStr) <> '' then System.Delete(WhereStr, Length(WhereStr) - 3, 4);
	if Trim(WhereStr) <> '' then SQLStr := SQLStr + 'WHERE ' + WhereStr;
	SQLStr := SQLStr + ' ORDER BY id';

	QueryOpen(qExport, SQLStr);

  Report := TFlexCelReport.Create(True);
  try
    Report.AddTable('tbllist', qExport);
    FUrl    := '';
    FName   := 'Ozel_Onay_Sablon_Listesi';
    TmpName := ServerMod.NewCacheFileUrl(False, 'xlsx', FName, '', FUrl, True);
    Report.Run(ServerMod.FilesFolderPath + 'temp_xls\ozel_onay_sablon.template.xlsx', TmpName);
  finally
    Report.Free;
  end;

  UniSession.SendFile(TmpName, FName + '.xlsx');
end;

procedure TfrOzelOnaySablonListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrOzelOnaySablonListe.actTopluKarekodExecute(Sender: TObject);
var
  FName   : String;
  TmpName : String;
  FUrl    : String;
	SQLStr,
  srcText,
	WhereStr : string;
  imgQRCode: TUniImage;
  aQRCodeFile: string;
begin
  imgQRCode := TUniImage.Create(self);
  imgQrCode.Width := 664;
  imgQrCode.Height := 664;


	SQLStr   := 'SELECT * FROM def_data_ozelonay ';

	WhereStr := 'mc_id = ' + IntToStr(MainMod.MCID) + ' AND ';
  if edSrcDurumu.ItemIndex > 0 then WhereStr := WhereStr + 'durum = ''' + edSrcDurumu.Text  + ''' AND ';

  if edSrcText.Text <> '' then
  begin
    case edSrcTipi.ItemIndex of
      0 : WhereStr := WhereStr + 'id = '  + IntToStr(StrToIntDef(edSrcText.Text, 0))  + ' AND ';
      1 : WhereStr := WhereStr + 'tanim LIKE ''%' + edSrcText.Text  + '%'' AND ';
      2 : WhereStr := WhereStr + 'description LIKE ''%' + edSrcText.Text  + '%'' AND ';
    end;
  end;

  if mainMod.iysvar and (edSrcIys.Text <> '') then
  begin
    case edSrcIys.ItemIndex of
      1 : WhereStr := WhereStr + 'coalesce(iys_var, ''H'') = ''E'' AND ';
      2 : WhereStr := WhereStr + 'coalesce(iys_var, ''H'') = ''H'' AND ';
    end;
  end;

	if Trim(WhereStr) <> '' then System.Delete(WhereStr, Length(WhereStr) - 3, 4);
	if Trim(WhereStr) <> '' then SQLStr := SQLStr + 'WHERE ' + WhereStr;
	SQLStr := SQLStr + ' ORDER BY id';


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
    tblKarekod.FieldByName('ref_no').AsInteger := qExport.FieldByName('id').AsInteger;
    tblKarekod.FieldByName('durum').AsString := qExport.FieldByName('durum').AsString;
    tblKarekod.FieldByName('tanim').AsString := qExport.FieldByName('tanim').AsString;
    tblKarekod.FieldByName('web_adresi').AsString := MainMod.OzelOnayLink + qExport.FieldByName('aguid').AsString;
    tblKarekod.FieldByName('aciklama').AsString := qExport.FieldByName('description').AsString;

    MainMod.CreateQRCode(tblKarekod.FieldByName('web_adresi').AsString, imgQRCode);
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
    UniSession.SendFile(aQRCodeFile, 'Ozel_Onay_Karekod_Listesi.docx');
  end;
end;

procedure TfrOzelOnaySablonListe.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('OzelOnaySablonListe');
end;

procedure TfrOzelOnaySablonListe.edSrcIysChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrOzelOnaySablonListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrOzelOnaySablonListe.edSrcTipiChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrOzelOnaySablonListe.ManageSettings;
begin
  actAdd.Enabled      := MainMod.LoginInfo.Yetkiler[148] and (qOzelOnay.State = dsBrowse);
  actEdit.Enabled     := MainMod.LoginInfo.Yetkiler[149] and (qOzelOnay.State = dsBrowse) and (qOzelOnay.FieldByName('id').AsInteger > 0);

  actClose.Enabled  := not DataEditing(qOzelOnay);
end;

procedure TfrOzelOnaySablonListe.NewSQL;
var
	SQLStr,
  SrcText,
	WhereStr : string;
begin
  if not GuvenliGirisMi(edSrcText.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;
	SQLStr   := 'SELECT * FROM def_data_ozelonay where mc_id =:mc_id';
  if edSrcDurumu.ItemIndex > 0 then
    SQLStr := SQLStr + ' and durum =:durum ';

  if edSrcText.Text <> '' then
  begin
     if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
    case edSrcTipi.ItemIndex of
      0 : SQLStr := SQLStr + ' and id::varchar  LIKE :SrcText ';
      1 : SQLStr := SQLStr + ' and tanim LIKE :SrcText ';
      2 : SQLStr := SQLStr + ' and description LIKE :SrcText ';
    end;
  end;

  if mainMod.iysvar and (edSrcIys.Text <> '') then
  begin
    case edSrcIys.ItemIndex of
      1 : SQLStr := SQLStr + ' and coalesce(iys_var, ''H'') = ''E'' ';
      2 : SQLStr := SQLStr + ' and coalesce(iys_var, ''H'') = ''H''  ';
    end;
  end;


	SQLStr := SQLStr + ' ORDER BY id';

  qOzelOnay.SQL.Text := SQLStr;
  qOzelOnay.ParamByName('mc_id').AsString := inttostr(mainmod.MCID);
  if qOzelOnay.FindParam('durum') <> nil then
    qOzelOnay.ParamByName('durum').AsString := edSrcDurumu.Text;
  if qOzelOnay.FindParam('SrcText') <> nil then
    qOzelOnay.ParamByName('SrcText').AsString := SrcText ;


  qOzelOnay.Open;
  ManageSettings;
  lbKayitSayisi.Text := IntToStr(qOzelOnay.RecordCount) + ' Kayýt Listelendi...';
end;

procedure TfrOzelOnaySablonListe.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  qOzelOnay.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrOzelOnaySablonListe.UniFrameCreate(Sender: TObject);
begin
  edSrcIys.visible := mainmod.IYSVar;
  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;
end;

initialization
  RegisterClass(TfrOzelOnaySablonListe);

end.
