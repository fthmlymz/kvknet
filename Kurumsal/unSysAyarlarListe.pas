unit unSYSAyarlarListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniButton, uniBitBtn, uniEdit, uniMultiItem, uniComboBox, uniLabel,
  uniGUIBaseClasses, uniPanel, System.Actions, Vcl.ActnList, Data.DB, DBAccess, Uni, uniBasicGrid, uniDBGrid;

type
  TfrSYSAyarlarListe = class(TUniFrame)
    dsParam: TUniDataSource;
    ActList: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actSearch: TAction;
    actClose: TAction;
    pnlTop: TUniPanel;
    UniLabel1: TUniLabel;
    edSrcType: TUniComboBox;
    edSrcText: TUniEdit;
    UniLabel2: TUniLabel;
    btnSearch: TUniBitBtn;
    btnAdd: TUniBitBtn;
    btnEdit: TUniBitBtn;
    btnDelete: TUniBitBtn;
    btnClose: TUniBitBtn;
    UniDBGrid1: TUniDBGrid;
    procedure UniFrameCreate(Sender: TObject);
    procedure edSrcTypeChange(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
  private
    procedure NewSQL;
    procedure ManageSettings;
  public
  end;

implementation

{$R *.dfm}

uses MainModule, McMLib, Main, unsysAyarlar;

{ TfrSYSAyarlarListe }

procedure TfrSYSAyarlarListe.actAddExecute(Sender: TObject);
begin
  // Bu iþlem yok...
  ManageSettings;
end;

procedure TfrSYSAyarlarListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrSYSAyarlarListe.actDeleteExecute(Sender: TObject);
begin
  // Bu iþlem yok...
end;

procedure TfrSYSAyarlarListe.actEditExecute(Sender: TObject);
begin
  if frmsysAyarlarTanim.Edit = mrOk then RefreshQuery(MainMod.qsysParam);
  ManageSettings;
end;

procedure TfrSYSAyarlarListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrSYSAyarlarListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrSYSAyarlarListe.edSrcTypeChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrSYSAyarlarListe.ManageSettings;
begin
  actAdd.Enabled    := MainMod.LoginInfo.Yetkiler[11] and (MainMod.qsysParam.State = dsBrowse);
  actEdit.Enabled   := MainMod.LoginInfo.Yetkiler[11] and (MainMod.qsysParam.State = dsBrowse) and (MainMod.qsysParam.FieldByName('param_val').AsString <> '');
  actDelete.Enabled := MainMod.LoginInfo.Yetkiler[11] and (MainMod.qsysParam.State = dsBrowse) and (MainMod.qsysParam.FieldByName('param_val').AsString <> '');
  actAdd.Visible    := False;
  actDelete.Visible := False;

  actClose.Enabled  := not DataEditing(MainMod.qsysParam);
end;

procedure TfrSYSAyarlarListe.NewSQL;
var
	SQLStr,
	WhereStr : string;
begin
	SQLStr   := 'SELECT * FROM sys_parameter ';

	WhereStr 	:= '1 =  1 AND ';
  if edSrcText.Text <> '' then WhereStr := WhereStr + 'param_val LIKE ''%'  + edSrcText.Text  + '%'' AND ';

  if Trim(WhereStr) <> '' then System.Delete(WhereStr, Length(WhereStr) - 3, 4);
  if Trim(WhereStr) <> '' then SQLStr := SQLStr + 'WHERE ' + WhereStr;
  SQLStr := SQLStr + ' ORDER BY param_val';

	QueryOpen(MainMod.qsysParam, SQLStr);
  ManageSettings;
end;

procedure TfrSYSAyarlarListe.UniFrameCreate(Sender: TObject);
begin
  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;
end;

initialization
  RegisterClass(TfrSYSAyarlarListe);

end.
