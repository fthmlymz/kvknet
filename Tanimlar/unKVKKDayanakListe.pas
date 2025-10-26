unit unKVKKDayanakListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, System.Actions, Vcl.ActnList, Data.DB, DBAccess, Uni, uniBasicGrid, uniDBGrid,
  uniButton, uniBitBtn, uniLabel, uniEdit, uniMultiItem, uniComboBox, uniGUIBaseClasses, uniPanel, MemDS;

type
  TfrKVKKDayanakListe = class(TUniFrame)
    dsDayanak: TUniDataSource;
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
    edSrcAlan: TUniComboBox;
    qDayanak: TUniQuery;
    actExcel: TAction;
    btnExcel: TUniBitBtn;
    btnHelp: TUniBitBtn;
    lbKayitSayisi: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure edSrcTypeChange(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure pnlTopAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure actExcelExecute(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    procedure DeleteControl(Sender: TComponent; Res: Integer);
    procedure NewSQL;
    procedure ManageSettings;
  public
  end;

implementation

{$R *.dfm}

uses MainModule, McMLib, Main, unKVKKDayanakTanim, unHelpPage;

procedure TfrKVKKDayanakListe.actAddExecute(Sender: TObject);
begin
  if frmKVKKDayanakTanim.Exec(0, 0) = mrOk then RefreshQuery(qDayanak);
  ManageSettings;
end;

procedure TfrKVKKDayanakListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrKVKKDayanakListe.actDeleteExecute(Sender: TObject);
begin
  MessageDlg('Seçili dayanak tanýmýný silmek istediðinizden emin misiniz?'#13, mtConfirmation, mbYesNo, DeleteControl);
end;

procedure TfrKVKKDayanakListe.actEditExecute(Sender: TObject);
begin
  if frmKVKKDayanakTanim.Exec(qDayanak.FieldByName('id').AsInteger, 1) = mrOk then RefreshQuery(qDayanak);
  ManageSettings;
end;

procedure TfrKVKKDayanakListe.actExcelExecute(Sender: TObject);
begin
  if qDayanak.RecordCount < 1 then Exit;
  MainMod.DownloadDataSetToXls(UniDBGrid1, 'Dayanak Listesi', 'Tanimlar_Dayanaklar.xlsx');
end;

procedure TfrKVKKDayanakListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKVKKDayanakListe.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('KVKKDayanakListe');
end;

procedure TfrKVKKDayanakListe.DeleteControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  if MainMod.CheckUsedIds('data_envanter', 'dgr_dayanak_ids', qDayanak.FieldByName('id').AsString) then
  begin
    MessageDlg('Bu taným envanter kayýtlarýnda kullanýlýyor. Silemezsiniz.', mtError, [mbOk]);
    Exit;
  end;
  if MainMod.CheckUsedIds('data_checklist', 'dayanak_ids', qDayanak.FieldByName('id').AsString) then
  begin
    MessageDlg('Bu taným kontrol listelerinde kullanýlýyor. Silemezsiniz.', mtError, [mbOk]);
    Exit;
  end;

  qDayanak.Delete;
  ManageSettings;
end;

procedure TfrKVKKDayanakListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrKVKKDayanakListe.edSrcTypeChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKVKKDayanakListe.ManageSettings;
begin
  actAdd.Enabled    := MainMod.LoginInfo.Yetkiler[61] and (qDayanak.State = dsBrowse);
  actEdit.Enabled   := MainMod.LoginInfo.Yetkiler[62] and (qDayanak.State = dsBrowse) and (qDayanak.FieldByName('id').AsInteger > 0);
  actDelete.Enabled := MainMod.LoginInfo.Yetkiler[63] and (qDayanak.State = dsBrowse) and (qDayanak.FieldByName('id').AsInteger > 0);

  actClose.Enabled  := not DataEditing(qDayanak);
end;

procedure TfrKVKKDayanakListe.NewSQL;
var
	SQLStr,
  SrcText : string;
begin
  if not GuvenliGirisMi(edSrcText.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;

	SQLStr   := 'SELECT * FROM def_data_dayanak where mc_id =:mc_id ';

  case edSrcAlan.ItemIndex of
    1 : SQLStr := SQLStr + ' and tipi = ''HUKUKSAL''  ';
    2 : SQLStr := SQLStr + ' and tipi = ''KURUMSAL''  ';
    3 : SQLStr := SQLStr + ' and tipi = ''DÝÐER''  ';
  end;

  if edSrcText.Text <> '' then
  begin
  if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
    SQLStr := SQLStr + ' and dayanak LIKE :SrcText ';
  end;
	SQLStr := SQLStr + ' ORDER BY id';
  qDayanak.SQL.Text := SQLStr;

  qDayanak.ParamByName('mc_id').AsString := inttostr(mainmod.MCID);
  if qDayanak.FindParam('srcText') <> nil then
    qDayanak.ParamByName('srctext').AsString := SrcText ;
  qDayanak.Open;

  ManageSettings;
  lbKayitSayisi.Text := IntToStr(qDayanak.RecordCount) + ' Kayýt Listelendi...';
end;

procedure TfrKVKKDayanakListe.pnlTopAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
var
  Base : Integer;
  NewW : Integer;
begin
  if EventName = 'doResize' then
  begin
    Base := pnlTop.Width - 25 - 120;
    NewW := Trunc(Base * 0.4);
    if NewW < 300 then NewW := 300;
    UniDBGrid1.Columns[1].Width := NewW;
    NewW := Trunc(Base * 0.6);
    if NewW < 400 then NewW := 400;
    UniDBGrid1.Columns[2].Width := NewW;
  end;
end;

procedure TfrKVKKDayanakListe.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  qDayanak.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrKVKKDayanakListe.UniFrameCreate(Sender: TObject);
begin
  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;
end;

initialization
  RegisterClass(TfrKVKKDayanakListe);

end.
