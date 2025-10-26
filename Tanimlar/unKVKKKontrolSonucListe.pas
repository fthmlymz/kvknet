unit unKVKKKontrolSonucListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniBasicGrid, uniDBGrid, uniButton, uniBitBtn, uniEdit, uniMultiItem,
  uniComboBox, uniLabel, uniGUIBaseClasses, uniPanel, System.Actions, Vcl.ActnList, Data.DB, DBAccess, Uni,
  MemDS;

type
  TfrKVKKKontrolSonucListe = class(TUniFrame)
    dsKontrolSonuc: TUniDataSource;
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
    qKontrolSonuc: TUniQuery;
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

uses MainModule, McMLib, Main, unKVKKKontrolSonucTanim, unHelpPage;

procedure TfrKVKKKontrolSonucListe.actAddExecute(Sender: TObject);
begin
  if frmKVKKKontrolSonucTanim.Exec(0, 0) = mrOk then RefreshQuery(qKontrolSonuc);
  ManageSettings;
end;

procedure TfrKVKKKontrolSonucListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrKVKKKontrolSonucListe.actDeleteExecute(Sender: TObject);
begin
  MessageDlg('Seçili kontrol sonucu tanýmýný silmek istediðinizden emin misiniz?'#13, mtConfirmation, mbYesNo, DeleteControl);
end;

procedure TfrKVKKKontrolSonucListe.actEditExecute(Sender: TObject);
begin
  if frmKVKKKontrolSonucTanim.Exec(qKontrolSonuc.FieldByName('id').AsInteger, 1) = mrOk then RefreshQuery(qKontrolSonuc);
  ManageSettings;
end;

procedure TfrKVKKKontrolSonucListe.actExcelExecute(Sender: TObject);
begin
  if qKontrolSonuc.RecordCount < 1 then Exit;
  MainMod.DownloadDataSetToXls(UniDBGrid1, 'Kontrol Sonuçlarý Listesi', 'Tanimlar_Kontrol_Sonuclari.xlsx');
end;

procedure TfrKVKKKontrolSonucListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKVKKKontrolSonucListe.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('KVKKKontrolSonucListe');
end;

procedure TfrKVKKKontrolSonucListe.DeleteControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  if MainMod.CheckUsedId('data_checklist', 'kontrol_id', qKontrolSonuc.FieldByName('id').AsString) then
  begin
    MessageDlg('Bu taným kontrol listelerinde kullanýlýyor. Silemezsiniz.', mtError, [mbOk]);
    Exit;
  end;

  qKontrolSonuc.Delete;
  ManageSettings;
end;

procedure TfrKVKKKontrolSonucListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrKVKKKontrolSonucListe.edSrcTypeChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKVKKKontrolSonucListe.ManageSettings;
begin
  actAdd.Enabled    := MainMod.LoginInfo.Yetkiler[69] and (qKontrolSonuc.State = dsBrowse);
  actEdit.Enabled   := MainMod.LoginInfo.Yetkiler[70] and (qKontrolSonuc.State = dsBrowse) and (qKontrolSonuc.FieldByName('id').AsInteger > 0);
  actDelete.Enabled := MainMod.LoginInfo.Yetkiler[71] and (qKontrolSonuc.State = dsBrowse) and (qKontrolSonuc.FieldByName('id').AsInteger > 0);

  actClose.Enabled  := not DataEditing(qKontrolSonuc);
end;

procedure TfrKVKKKontrolSonucListe.NewSQL;
var
	SQLStr,
  SrcText,
	WhereStr : string;
begin
	SQLStr   := 'SELECT * FROM def_data_kontrolsonuc ';

	WhereStr 	:= 'mc_id = ' + IntToStr(MainMod.MCID) + ' AND ';
  if edSrcText.Text <> '' then
  begin
    SrcText := StringReplace(edSrcText.Text, '*', '%', [rfReplaceAll]);
    WhereStr := WhereStr + 'kontrolsonuc LIKE ''%'  + SrcText  + '%'' AND ';
  end;


  if Trim(WhereStr) <> '' then System.Delete(WhereStr, Length(WhereStr) - 3, 4);
  if Trim(WhereStr) <> '' then SQLStr := SQLStr + 'WHERE ' + WhereStr;
  SQLStr := SQLStr + ' ORDER BY id';

	QueryOpen(qKontrolSonuc, SQLStr);
  ManageSettings;
  lbKayitSayisi.Text := IntToStr(qKontrolSonuc.RecordCount) + ' Kayýt Listelendi...';
end;

procedure TfrKVKKKontrolSonucListe.pnlTopAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
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

procedure TfrKVKKKontrolSonucListe.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  qKontrolSonuc.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrKVKKKontrolSonucListe.UniFrameCreate(Sender: TObject);
begin
  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;
end;

initialization
  RegisterClass(TfrKVKKKontrolSonucListe);

end.
