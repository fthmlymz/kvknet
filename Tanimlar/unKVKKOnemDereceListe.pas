unit unKVKKOnemDereceListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniBasicGrid, uniDBGrid, uniButton, uniBitBtn, uniEdit, uniMultiItem,
  uniComboBox, uniLabel, uniGUIBaseClasses, uniPanel, System.Actions, Vcl.ActnList, Data.DB, DBAccess, Uni,
  MemDS;

type
  TfrKVKKOnemDereceListe = class(TUniFrame)
    dsOnemDerece: TUniDataSource;
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
    qOnemDerece: TUniQuery;
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

uses MainModule, McMLib, Main, unKVKKOnemDereceTanim, unHelpPage;

procedure TfrKVKKOnemDereceListe.actAddExecute(Sender: TObject);
begin
  if frmKVKKOnemDereceTanim.Exec(0, 0) = mrOk then RefreshQuery(qOnemDerece);
  ManageSettings;
end;

procedure TfrKVKKOnemDereceListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrKVKKOnemDereceListe.actDeleteExecute(Sender: TObject);
begin
  MessageDlg('Seçili önem derecesi tanýmýný silmek istediðinizden emin misiniz?'#13, mtConfirmation, mbYesNo, DeleteControl);
end;

procedure TfrKVKKOnemDereceListe.actEditExecute(Sender: TObject);
begin
  if frmKVKKOnemDereceTanim.Exec(qOnemDerece.FieldByName('id').AsInteger, 1) = mrOk then RefreshQuery(qOnemDerece);
  ManageSettings;
end;

procedure TfrKVKKOnemDereceListe.actExcelExecute(Sender: TObject);
begin
  if qOnemDerece.RecordCount < 1 then Exit;
  MainMod.DownloadDataSetToXls(UniDBGrid1, 'Önem Dereceleri Listesi', 'Tanimlar_Onem_Dereceleri.xlsx');
end;

procedure TfrKVKKOnemDereceListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKVKKOnemDereceListe.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('KVKKOnemDereceListe');
end;

procedure TfrKVKKOnemDereceListe.DeleteControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  if MainMod.CheckUsedId('data_checklist', 'onem_derecesi_id', qOnemDerece.FieldByName('id').AsString) then
  begin
    MessageDlg('Bu taným kontrol listelerinde kullanýlýyor. Silemezsiniz.', mtError, [mbOk]);
    Exit;
  end;

  qOnemDerece.Delete;
  ManageSettings;
end;

procedure TfrKVKKOnemDereceListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrKVKKOnemDereceListe.edSrcTypeChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKVKKOnemDereceListe.ManageSettings;
begin
  actAdd.Enabled    := MainMod.LoginInfo.Yetkiler[57] and (qOnemDerece.State = dsBrowse);
  actEdit.Enabled   := MainMod.LoginInfo.Yetkiler[58] and (qOnemDerece.State = dsBrowse) and (qOnemDerece.FieldByName('id').AsInteger > 0);
  actDelete.Enabled := MainMod.LoginInfo.Yetkiler[59] and (qOnemDerece.State = dsBrowse) and (qOnemDerece.FieldByName('id').AsInteger > 0);

  actClose.Enabled  := not DataEditing(qOnemDerece);
end;

procedure TfrKVKKOnemDereceListe.NewSQL;
var
	SQLStr,
  SrcText,
	WhereStr : string;
begin
	SQLStr   := 'SELECT * FROM def_data_onemderece ';

	WhereStr 	:= 'mc_id = ' + IntToStr(MainMod.MCID) + ' AND ';

  if edSrcText.Text <> '' then
  begin
    SrcText := StringReplace(edSrcText.Text, '*', '%', [rfReplaceAll]);
    WhereStr := WhereStr + 'onemderece LIKE ''%'  + SrcText  + '%'' AND ';
  end;


  if Trim(WhereStr) <> '' then System.Delete(WhereStr, Length(WhereStr) - 3, 4);
  if Trim(WhereStr) <> '' then SQLStr := SQLStr + 'WHERE ' + WhereStr;
  SQLStr := SQLStr + ' ORDER BY id';

	QueryOpen(qOnemDerece, SQLStr);
  ManageSettings;
  lbKayitSayisi.Text := IntToStr(qOnemDerece.RecordCount) + ' Kayýt Listelendi...';
end;

procedure TfrKVKKOnemDereceListe.pnlTopAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
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

procedure TfrKVKKOnemDereceListe.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  qOnemDerece.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrKVKKOnemDereceListe.UniFrameCreate(Sender: TObject);
begin
  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;
end;

initialization
  RegisterClass(TfrKVKKOnemDereceListe);

end.
