unit unKVKKEkipmanListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, System.Actions, Vcl.ActnList, Data.DB, DBAccess, Uni, uniBasicGrid, uniDBGrid,
  uniButton, uniBitBtn, uniLabel, uniEdit, uniMultiItem, uniComboBox, uniGUIBaseClasses, VCL.FlexCel.Core,
  FlexCel.XlsAdapter, FlexCel.Report, FlexCel.Render, uniPanel;

type
  TfrKVKKEkipmanListe = class(TUniFrame)
    dsEkipman: TUniDataSource;
    ActList: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actSearch: TAction;
    actClose: TAction;
    pnlTop: TUniPanel;
    edSrcText: TUniEdit;
    UniLabel1: TUniLabel;
    btnSearch: TUniBitBtn;
    btnClose: TUniBitBtn;
    btnAdd: TUniBitBtn;
    btnEdit: TUniBitBtn;
    btnDelete: TUniBitBtn;
    UniLabel2: TUniLabel;
    UniDBGrid1: TUniDBGrid;
    edSrcTipi: TUniComboBox;
    edSrcDurumu: TUniComboBox;
    btnExcel: TUniBitBtn;
    actExcel: TAction;
    btnHelp: TUniBitBtn;
    lbKayitSayisi: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure edSrcTypeChange(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actExcelExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure pnlTopAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure btnHelpClick(Sender: TObject);
  private
    procedure DeleteControl(Sender: TComponent; Res: Integer);
    procedure NewSQL;
    procedure ManageSettings;
  public
  end;

implementation

{$R *.dfm}

uses MainModule, ServerModule, McMLib, Main, unKVKKEkipmanTanim, unHelpPage;

procedure TfrKVKKEkipmanListe.actAddExecute(Sender: TObject);
begin
  if frmKVKKEkipmanTanim.Insert = mrOk then RefreshQuery(MainMod.qEkipman);
  ManageSettings;
end;

procedure TfrKVKKEkipmanListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrKVKKEkipmanListe.actDeleteExecute(Sender: TObject);
begin
  MessageDlg('Seçili ekipman tanýmýný silmek istediðinizden emin misiniz?'#13, mtConfirmation, mbYesNo, DeleteControl);
end;

procedure TfrKVKKEkipmanListe.actEditExecute(Sender: TObject);
begin
  if frmKVKKEkipmanTanim.Edit = mrOk then RefreshQuery(MainMod.qEkipman);
  ManageSettings;
end;

procedure TfrKVKKEkipmanListe.actExcelExecute(Sender: TObject);
var
  Report  : TFlexCelReport;
  FName   : String;
  TmpName : String;
  FUrl    : String;
begin
  if MainMod.qEkipman.FieldByName('id').AsInteger < 1 then Exit;

  Report := TFlexCelReport.Create(True);
  try
    Report.AddTable('ekip', MainMod.qEkipman);
    FUrl    := '';
    FName   := 'Ekipman_Analiz_Raporu';
    TmpName := ServerMod.NewCacheFileUrl(False, 'xlsx', FName, '', FUrl, True);
    Report.Run(ServerMod.FilesFolderPath + 'temp_xls\ekipman.template.xlsx', TmpName);
  finally
    Report.Free;
  end;

  UniSession.SendFile(TmpName, FName + '.xlsx');
end;

procedure TfrKVKKEkipmanListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKVKKEkipmanListe.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('KVKKEkipmanListe')
end;

procedure TfrKVKKEkipmanListe.DeleteControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  if MainMod.CheckUsedIDs('data_checklist', 'ekipman_ids', MainMod.qEkipman.FieldByName('id').AsString) then
  begin
    MessageDlg('Bu ekipman tanýmý kontrol listelerinde kullanýlýyor. Silemezsiniz.', mtError, [mbOk]);
    Exit;
  end;

  MainMod.qEkipman.Delete;
  ManageSettings;
end;

procedure TfrKVKKEkipmanListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrKVKKEkipmanListe.edSrcTypeChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKVKKEkipmanListe.ManageSettings;
begin
  actAdd.Enabled    := MainMod.LoginInfo.Yetkiler[86] and (MainMod.qEkipman.State = dsBrowse);
  actEdit.Enabled   := MainMod.LoginInfo.Yetkiler[87] and (MainMod.qEkipman.State = dsBrowse) and (MainMod.qEkipman.FieldByName('id').AsInteger > 0);
  actDelete.Enabled := MainMod.LoginInfo.Yetkiler[88] and (MainMod.qEkipman.State = dsBrowse) and (MainMod.qEkipman.FieldByName('id').AsInteger > 0);

  actClose.Enabled  := not DataEditing(MainMod.qEkipman);
end;

procedure TfrKVKKEkipmanListe.NewSQL;
var
	SQLStr,
  SrcText : string;
begin
  if not GuvenliGirisMi(edSrcText.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;

	SQLStr   := 'SELECT * FROM def_data_ekipman where mc_id =:mc_id ';

  if edSrcTipi.ItemIndex > 0   then SQLStr := SQLStr + ' and tipi =:tipi  ';
  if edSrcDurumu.ItemIndex > 0 then SQLStr := SQLStr + ' and durumu =:durumu  ';
//   if edSrcTipi.ItemIndex > 0   then SQLStr := SQLStr + ' and tipi = ''' + edSrcTipi.Text  + '''  ';
//  if edSrcDurumu.ItemIndex > 0 then SQLStr := SQLStr + ' and durumu = ''' + edSrcDurumu.Text  + '''  ';
  if edSrcText.Text <> '' then
  begin
    if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
    SQLStr := SQLStr + ' and ekipman LIKE :SrcText ';
  end;
	SQLStr := SQLStr + ' ORDER BY id';
  MainMod.qEkipman.SQL.Text := SQLStr;
  MainMod.qEkipman.ParamByName('mc_id').AsString := inttostr(mainmod.MCID);
  if mainmod.qEkipman.FindParam('tipi') <> nil then
    mainmod.qEkipman.ParamByName('tipi').AsString := edSrcTipi.Text;
  if mainmod.qEkipman.FindParam('durumu') <> nil then
    mainmod.qEkipman.ParamByName('durumu').AsString := edSrcDurumu.Text;
  if MainMod.qEkipman.FindParam('SrcText') <> nil then
    mainmod.qEkipman.ParamByName('SrcText').AsString := SrcText;

  MainMod.qEkipman.Open;

  ManageSettings;
  lbKayitSayisi.Text := IntToStr(MainMod.qEkipman.RecordCount) + ' Kayýt Listelendi...';
end;

procedure TfrKVKKEkipmanListe.pnlTopAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
var
  Base : Integer;
  NewW : Integer;
begin
  if EventName = 'doResize' then
  begin
    Base := pnlTop.Width - 25 - 240;
    NewW := Trunc(Base * 0.4);
    if NewW < 300 then NewW := 300;
    UniDBGrid1.Columns[2].Width := NewW;
    NewW := Trunc(Base * 0.6);
    if NewW < 400 then NewW := 400;
    UniDBGrid1.Columns[3].Width := NewW;
  end;
end;

procedure TfrKVKKEkipmanListe.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  MainMod.qEkipman.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrKVKKEkipmanListe.UniFrameCreate(Sender: TObject);
begin
  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;
end;

initialization
  RegisterClass(TfrKVKKEkipmanListe);

end.
