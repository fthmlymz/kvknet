unit unKVKKTedbirListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniBasicGrid, uniDBGrid, uniButton, uniBitBtn, uniEdit, uniMultiItem,
  uniComboBox, uniLabel, uniGUIBaseClasses, uniPanel, System.Actions, Vcl.ActnList, Data.DB, DBAccess, Uni,
  MemDS;

type
  TfrKVKKTedbirListe = class(TUniFrame)
    dsTedbir: TUniDataSource;
    ActList: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actSearch: TAction;
    actClose: TAction;
    pnlTop: TUniPanel;
    edSrcText: TUniEdit;
    UniLabel2: TUniLabel;
    btnSearch: TUniBitBtn;
    btnAdd: TUniBitBtn;
    btnEdit: TUniBitBtn;
    btnDelete: TUniBitBtn;
    btnClose: TUniBitBtn;
    UniDBGrid1: TUniDBGrid;
    qTedbir: TUniQuery;
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

uses MainModule, McMLib, Main, unKVKKTedbirTanim, unHelpPage;

procedure TfrKVKKTedbirListe.actAddExecute(Sender: TObject);
begin
  if frmKVKKTedbirTanim.Exec(0, 0) = mrOk then RefreshQuery(qTedbir);
  ManageSettings;
end;

procedure TfrKVKKTedbirListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrKVKKTedbirListe.actDeleteExecute(Sender: TObject);
begin
  MessageDlg('Seçili güvenlik tedbiri tanýmýný silmek istediðinizden emin misiniz?'#13, mtConfirmation, mbYesNo, DeleteControl);
end;

procedure TfrKVKKTedbirListe.actEditExecute(Sender: TObject);
begin
  if frmKVKKTedbirTanim.Exec(qTedbir.FieldByName('id').AsInteger, 1) = mrOk then RefreshQuery(qTedbir);
  ManageSettings;
end;

procedure TfrKVKKTedbirListe.actExcelExecute(Sender: TObject);
begin
  if qTedbir.RecordCount < 1 then Exit;
  
  MainMod.DownloadDataSetToXls(UniDBGrid1, 'Veri Güvenliði Tedbirleri Listesi', 'Tanimlar_Veri_Guvenligi_Tedbirleri.xlsx');
end;

procedure TfrKVKKTedbirListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKVKKTedbirListe.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('KVKKTedbirListe');
end;

procedure TfrKVKKTedbirListe.DeleteControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  if MainMod.CheckUsedIds('data_checklist', 'tedbir_ids', qTedbir.FieldByName('id').AsString) then
  begin
    MessageDlg('Bu taným kontrol listelerinde kullanýlýyor. Silemezsiniz.', mtError, [mbOk]);
    Exit;
  end;

  qTedbir.Delete;
  ManageSettings;
end;

procedure TfrKVKKTedbirListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrKVKKTedbirListe.edSrcTypeChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKVKKTedbirListe.ManageSettings;
begin
  actAdd.Enabled    := MainMod.LoginInfo.Yetkiler[65] and (qTedbir.State = dsBrowse);
  actEdit.Enabled   := MainMod.LoginInfo.Yetkiler[66] and (qTedbir.State = dsBrowse) and (qTedbir.FieldByName('id').AsInteger > 0);
  actDelete.Enabled := MainMod.LoginInfo.Yetkiler[67] and (qTedbir.State = dsBrowse) and (qTedbir.FieldByName('id').AsInteger > 0);

  actClose.Enabled  := not DataEditing(qTedbir);
end;

procedure TfrKVKKTedbirListe.NewSQL;
var
	SQLStr,
  SrcText : string;
begin
  if not GuvenliGirisMi(edSrcText.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;

	SQLStr   := 'SELECT * FROM def_data_tedbir where mc_id =:mc_id ';

  if edSrcText.Text <> '' then
  begin
      if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
    SQLStr := SQLStr + ' and tedbir LIKE :SrcText ';
  end;

  SQLStr := SQLStr + ' ORDER BY id';
  qTedbir.SQL.Text := SQLStr;
  qTedbir.ParamByName('mc_id').AsString := inttostr(mainmod.MCID);
  if qTedbir.FindParam('SrcText') <> nil then
    qTedbir.ParamByName('SrcText').AsString := SrcText;
	qTedbir.Open;
  ManageSettings;
  lbKayitSayisi.Text := IntToStr(qTedbir.RecordCount) + ' Kayýt Listelendi...';
end;

procedure TfrKVKKTedbirListe.pnlTopAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
var
  Base : Integer;
  NewW : Integer;
begin
  if EventName = 'doResize' then
  begin
    Base := pnlTop.Width - 25;
    NewW := Trunc(Base * 0.4);
    if NewW < 300 then NewW := 300;
    UniDBGrid1.Columns[0].Width := NewW;
    NewW := Trunc(Base * 0.6);
    if NewW < 400 then NewW := 400;
    UniDBGrid1.Columns[1].Width := NewW;
  end;
end;

procedure TfrKVKKTedbirListe.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  qTedbir.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrKVKKTedbirListe.UniFrameCreate(Sender: TObject);
begin
  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;
end;

initialization
  RegisterClass(TfrKVKKTedbirListe);

end.
