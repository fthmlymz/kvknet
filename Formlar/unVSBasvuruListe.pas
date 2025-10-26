unit unVSBasvuruListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniBasicGrid, uniDBGrid, uniEdit, uniDateTimePicker, uniButton, uniBitBtn,
  uniLabel, uniMultiItem, uniComboBox, uniGUIBaseClasses, uniPanel, System.Actions, Vcl.ActnList, Data.DB,
  DBAccess, Uni, frxClass, frxDBSet, frxExportBaseDialog, frxExportPDF, frxRich,
  Vcl.Menus, uniMainMenu, uniMenuButton;

type
  TfrVSBasvuruListe = class(TUniFrame)
    dsVSBasvuru: TUniDataSource;
    ActList: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actCopy: TAction;
    actSearch: TAction;
    actClose: TAction;
    pnlTop: TUniPanel;
    edSrcType: TUniComboBox;
    edSrcDurum: TUniComboBox;
    UniLabel1: TUniLabel;
    btnSearch: TUniBitBtn;
    btnClose: TUniBitBtn;
    btnAdd: TUniBitBtn;
    btnEdit: TUniBitBtn;
    UniLabel2: TUniLabel;
    edSrcText: TUniEdit;
    UniDBGrid1: TUniDBGrid;
    edSrcBvSekil: TUniComboBox;
    edSrcCvSekil: TUniComboBox;
    btnPrint: TUniBitBtn;
    actPrint: TAction;
    frxReportVSB: TfrxReport;
    frxdsMCDef: TfrxDBDataset;
    frxdsVSBasvuru: TfrxDBDataset;
    dsMCDef: TUniDataSource;
    frxPDFExport1: TfrxPDFExport;
    btnHelp: TUniBitBtn;
    lbKayitSayisi: TUniLabel;
    popDiger: TUniPopupMenu;
    mnLog: TUniMenuItem;
    btnDiger: TUniMenuButton;
    procedure UniFrameCreate(Sender: TObject);
    procedure edSrcTypeChange(Sender: TObject);
    procedure edSrcDurumChange(Sender: TObject);
    procedure edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure actPrintExecute(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure mnLogClick(Sender: TObject);
  private
    procedure NewSQL;
    procedure ManageSettings;
  public
  end;

implementation

{$R *.dfm}

uses MainModule, McMLib, Main, unVSBasvuruKayit, ServerModule, unHelpPage,
  unLogVSBasvuruTanim;

procedure TfrVSBasvuruListe.actAddExecute(Sender: TObject);
begin
  if frmVSBasvuruKayit.Exec(0, 0) = mrOk then RefreshQuery(MainMod.qVSBasvuru);
  ManageSettings;
end;

procedure TfrVSBasvuruListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrVSBasvuruListe.actEditExecute(Sender: TObject);
begin
  if MainMod.qVSBasvuru.FieldByName('durum').AsString <> 'CEVAPLANDI' then
  begin
    if not MainMod.LoginInfo.Yetkiler[111] then
    begin
      MessageDlg('Deðiþtirmek istediðiniz baþvuru CEVAPLANMIÞ. Bu kaydý deðiþtirme yetkiniz yok.', mtError, [mbOk]);
      Exit;
    end;
  end;

  if frmVSBasvuruKayit.Exec(MainMod.qVSBasvuru.FieldByName('id').AsInteger, 1) = mrOk then RefreshQuery(MainMod.qVSBasvuru);
  ManageSettings;
end;

procedure TfrVSBasvuruListe.actPrintExecute(Sender: TObject);
var
 fUrl:string;
begin
  if MainMod.qVSBasvuru.RecordCount < 1 then Exit;

  frxReportVSB.PrintOptions.ShowDialog := False;
  frxReportVSB.ShowProgress := false;

  frxReportVSB.EngineOptions.SilentMode := True;
  frxReportVSB.EngineOptions.EnableThreadSafe := True;
  frxReportVSB.EngineOptions.DestroyForms := False;
  frxReportVSB.EngineOptions.UseGlobalDataSetList := False;

  frxReportVSB.PreviewOptions.AllowEdit := False;
  frxReportVSB.PrepareReport;

  frxPDFExport1.Background := True;
  frxPDFExport1.ShowProgress := False;
  frxPDFExport1.ShowDialog := False;
  frxPDFExport1.FileName := ServerMod.NewCacheFileUrl(False, 'pdf', '', '', FUrl, True);
  frxPDFExport1.DefaultPath := '';

  frxPDFExport1.Compressed := false;

  if frxReportVSB.Export(frxPDFExport1) then
    UniSession.SendFile(frxPDFExport1.FileName, 'ÝLGÝLÝ KÝÞÝ BAÞVURU.PDF');
end;

procedure TfrVSBasvuruListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrVSBasvuruListe.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('VSBasvuruListe');
end;

procedure TfrVSBasvuruListe.edSrcDurumChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrVSBasvuruListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrVSBasvuruListe.edSrcTypeChange(Sender: TObject);
begin
  edSrcText.Visible    := edSrcType.ItemIndex in [0, 3, 5, 6, 7, 8, 9, 10, 11];
  edSrcDurum.Visible   := edSrcType.ItemIndex = 1;
  edSrcBvSekil.Visible := edSrcType.ItemIndex = 2;
  edSrcCvSekil.Visible := edSrcType.ItemIndex = 4;

  NewSQL;
end;

procedure TfrVSBasvuruListe.ManageSettings;
begin
  actAdd.Enabled    := MainMod.LoginInfo.Yetkiler[105] and (MainMod.qVSBasvuru.State = dsBrowse);
  actEdit.Enabled   := MainMod.LoginInfo.Yetkiler[106] and (MainMod.qVSBasvuru.State = dsBrowse) and (MainMod.qVSBasvuru.FieldByName('id').AsInteger > 0);

  actClose.Enabled  := not DataEditing(MainMod.qVSBasvuru);
end;

procedure TfrVSBasvuruListe.mnLogClick(Sender: TObject);
begin
  frmLogVSBasvuruTanim.Exec(dsVSBasvuru.DataSet.FieldByName('id').AsInteger);
end;

procedure TfrVSBasvuruListe.NewSQL;
var
	SQLStr,
  SrcText : string;
	//WhereStr : string;
begin

if not GuvenliGirisMi(edSrcText.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;

	SQLStr   := 'SELECT vsb.*, dp.title, kg.kisi FROM data_vsbasvuru vsb ' +
              '   LEFT JOIN sys_deptdef dp ON dp.id = vsb.basvuru_dept_id ' +
              '   LEFT JOIN def_data_kisi kg ON kg.id = vsb.kg_id where vsb.mc_id =:mc_id ';

  SrcText := StringReplace(edSrcText.Text, '*', '%', [rfReplaceAll]);
  case edSrcType.ItemIndex of
    0 : if edSrcText.Text <> '' then SQLStr := SQLStr + 'and vsb.id::varchar LIKE :srctext ';
    1 : if edSrcDurum.ItemIndex > 0 then SQLStr := SQLStr + ' and vsb.durum =:durum ';
    2 : if edSrcBvSekil.ItemIndex > 0 then SQLStr := SQLStr + ' and vsb.basvuru_sekli =:basvuru_sekli ';
    3 : if edSrcText.Text <> '' then SQLStr := SQLStr + ' and vsb.basvuru_evrakno LIKE :basvuru_evrakno ';
    4 : if edSrcCvSekil.ItemIndex > 0 then SQLStr := SQLStr + ' and vsb.cevap_sekli = :cevap_sekli ';
    5 : if edSrcText.Text <> '' then SQLStr := SQLStr + ' and vsb.cevap_evrakno LIKE :cevap_evrakno ';
    6 : if edSrcText.Text <> '' then SQLStr := SQLStr + ' and kg.kisi LIKE :srctext ';
    7 : if edSrcText.Text <> '' then SQLStr := SQLStr + ' and vsb.adi LIKE :srctext ';
    8 : if edSrcText.Text <> '' then SQLStr := SQLStr + ' and vsb.soyadi LIKE :srctext';
    9 : if edSrcText.Text <> '' then SQLStr := SQLStr + ' and vsb.sehir LIKE :srctext';
   10 : if edSrcText.Text <> '' then SQLStr := SQLStr + ' and vsb.tel1 LIKE :srctext ';
   // Added by TEVFIK 23.05.2023 11:57:43 - Kaldýrýldý.
   //11 : if edSrcText.Text <> '' then WhereStr := WhereStr + 'vsb.email LIKE ''%' + edSrcText.Text  + '%'' AND ';
  end;


	SQLStr := SQLStr + ' ORDER BY vsb.basvuru_tarihi';
  mainmod.qVSBasvuru.SQL.Text := SQLStr ;
  MainMod.qVSBasvuru.ParamByName('mc_id').AsString := inttostr(mainmod.MCID);
  if mainmod.qVSBasvuru.FindParam('srctext') <> nil then
    mainmod.qVSBasvuru.ParamByName('srctext').AsString := SrcText;
  if mainmod.qVSBasvuru.FindParam('durum') <> nil then
    mainmod.qVSBasvuru.ParamByName('durum').AsString := edSrcDurum.Text ;
  if mainmod.qVSBasvuru.FindParam('basvuru_sekli') <> nil then
    mainmod.qVSBasvuru.ParamByName('basvuru_sekli').AsString :=  edSrcBvSekil.Text ;
  if mainmod.qVSBasvuru.FindParam('basvuru_evrakno') <> nil then
    mainmod.qVSBasvuru.ParamByName('basvuru_evrakno').AsString :=  SrcText ;
  if mainmod.qVSBasvuru.FindParam('cevap_sekli') <> nil then
    mainmod.qVSBasvuru.ParamByName('cevap_sekli').AsString :=  edSrcCvSekil.Text;
  if mainmod.qVSBasvuru.FindParam('cevap_evrakno') <> nil then
    mainmod.qVSBasvuru.ParamByName('cevap_evrakno').AsString :=  SrcText;

	MainMod.qVSBasvuru.Open;
  ManageSettings;
  lbKayitSayisi.Text := IntToStr(MainMod.qVSBasvuru.RecordCount) + ' Kayýt Listelendi...';
end;

procedure TfrVSBasvuruListe.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  MainMod.qVSBasvuru.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrVSBasvuruListe.UniFrameCreate(Sender: TObject);
begin
  edSrcBvSekil.Top := 45;
  edSrcCvSekil.Top := 45;
  edSrcText.Top    := 45;
  edSrcDurum.Top   := 45;
  pnlTop.Height    := 145;
  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;
end;

initialization
  RegisterClass(TfrVSBasvuruListe);

end.
