unit unHelpListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniBasicGrid, uniDBGrid, uniButton, uniBitBtn, uniEdit, uniMultiItem,
  uniComboBox, uniLabel, uniGUIBaseClasses, uniPanel, System.Actions, Vcl.ActnList, Data.DB, DBAccess, Uni,
  MemDS;

type
  TfrHelpListe = class(TUniFrame)
    dsHelp: TUniDataSource;
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
    grdList: TUniDBGrid;
    qHelp: TUniQuery;
    UniBitBtn1: TUniBitBtn;
    procedure UniFrameCreate(Sender: TObject);
    procedure edSrcTypeChange(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure pnlTopAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure grdListColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure grdListDblClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    procedure DeleteControl(Sender: TComponent; Res: Integer);
    procedure NewSQL;
    procedure ManageSettings;
  public
  end;

implementation

{$R *.dfm}

uses MainModule, McMLib, Main, unHelpTanim, unHelpPage;

procedure TfrHelpListe.actAddExecute(Sender: TObject);
begin
  if frmHelpTanim.Exec(0, 0) = mrOk then RefreshQuery(qHelp);
  ManageSettings;
end;

procedure TfrHelpListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrHelpListe.actDeleteExecute(Sender: TObject);
begin
  MessageDlg('Seçili yardýmý silmek istediðinizden emin misiniz?'#13, mtConfirmation, mbYesNo, DeleteControl);
end;

procedure TfrHelpListe.actEditExecute(Sender: TObject);
begin
  if frmHelpTanim.Exec(qHelp.FieldByName('id').AsInteger, 1) = mrOk then RefreshQuery(qHelp);
  ManageSettings;
end;

procedure TfrHelpListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrHelpListe.DeleteControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;
  qHelp.Delete;
  ManageSettings;
end;

procedure TfrHelpListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrHelpListe.edSrcTypeChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrHelpListe.ManageSettings;
begin
  actAdd.Enabled    := MainMod.LoginInfo.Yetkiler[155] and (qHelp.State = dsBrowse);
  actEdit.Enabled   := MainMod.LoginInfo.Yetkiler[156] and (qHelp.FieldByName('id').AsInteger > 0);
  actDelete.Enabled := MainMod.LoginInfo.Yetkiler[157] and (qHelp.FieldByName('id').AsInteger > 0);

  actAdd.Visible    := MainMod.LoginInfo.Yetkiler[155] and (qHelp.State = dsBrowse);
  actEdit.Visible   := MainMod.LoginInfo.Yetkiler[156] and (qHelp.FieldByName('id').AsInteger > 0);
  actDelete.Visible := MainMod.LoginInfo.Yetkiler[157] and (qHelp.FieldByName('id').AsInteger > 0);

  actClose.Enabled  := not DataEditing(qHelp);


//  if now > 44781 then //08.08.2022 de kapanýr
  if MainMod.LoginInfo.UserName <> 'M.EROL' then
  begin
  actAdd.Enabled    := false;
  actEdit.Enabled   := false;
  actDelete.Enabled := false;

  actAdd.Visible    := false;
  actEdit.Visible   := false;
  actDelete.Visible := false;
  end;
end;

procedure TfrHelpListe.NewSQL;
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

	SQLStr   := 'SELECT * FROM sys_help ';
  WhereStr := '';

  if edSrcText.Text <> ''  then
  begin
    if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
    WhereStr := WhereStr + 'lower(title) LIKE :srctext AND ';
  end;

  if Trim(WhereStr) <> '' then System.Delete(WhereStr, Length(WhereStr) - 3, 4);
	if Trim(WhereStr) <> '' then SQLStr := SQLStr + 'WHERE ' + WhereStr;
	SQLStr := SQLStr + ' ORDER BY id';

//  QueryOpen(qHelp, SQLStr);
  qHelp.SQL.Text := sqlstr;
  if qhelp.FindParam('srctext') <> nil then
    qHelp.ParamByName('srctext').AsString := TR_Lower(SrcText) ;
  qHelp.Open;
  ManageSettings;
end;

procedure TfrHelpListe.pnlTopAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
var
  Base : Integer;
  NewW : Integer;
begin
  if EventName = 'doResize' then
  begin
    Base := pnlTop.Width - 125;
    NewW := Trunc(Base * 0.3);
    if NewW < 200 then NewW := 200;
    grdList.Columns[1].Width := NewW;
    NewW := Trunc(Base * 0.7);
    if NewW < 400 then NewW := 400;
    grdList.Columns[2].Width := NewW;
  end;
end;

procedure TfrHelpListe.grdListColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  qHelp.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrHelpListe.grdListDblClick(Sender: TObject);
begin
  frmHelpPage.ExecById(qHelp.FieldByName('id').AsInteger);
end;

procedure TfrHelpListe.UniBitBtn1Click(Sender: TObject);
begin
  frmHelpPage.ExecById(qHelp.FieldByName('id').AsInteger);
end;

procedure TfrHelpListe.UniFrameCreate(Sender: TObject);
begin
  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;
end;

initialization
  RegisterClass(TfrHelpListe);

end.
