unit unAyarlarListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniButton, uniBitBtn, uniEdit, uniMultiItem, uniComboBox, uniLabel,
  uniGUIBaseClasses, uniPanel, System.Actions, Vcl.ActnList, Data.DB, DBAccess, Uni, uniBasicGrid, uniDBGrid;

type
  TfrAyarlarListe = class(TUniFrame)
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

uses MainModule, McMLib, Main, unAyarlarTanim;

{ TfrAyarlarListe }

procedure TfrAyarlarListe.actAddExecute(Sender: TObject);
begin
  // Bu iþlem yok...
  ManageSettings;
end;

procedure TfrAyarlarListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrAyarlarListe.actDeleteExecute(Sender: TObject);
begin
  // Bu iþlem yok...
end;

procedure TfrAyarlarListe.actEditExecute(Sender: TObject);
begin
  if frmAyarlarTanim.Edit = mrOk then RefreshQuery(MainMod.qParam);
  ManageSettings;
end;

procedure TfrAyarlarListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrAyarlarListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrAyarlarListe.edSrcTypeChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrAyarlarListe.ManageSettings;
begin
  actAdd.Enabled    := MainMod.LoginInfo.Yetkiler[11] and (MainMod.qParam.State = dsBrowse);
  actEdit.Enabled   := MainMod.LoginInfo.Yetkiler[11] and (MainMod.qParam.State = dsBrowse) and (MainMod.qParam.FieldByName('param_val').AsString <> '');
  actDelete.Enabled := MainMod.LoginInfo.Yetkiler[11] and (MainMod.qParam.State = dsBrowse) and (MainMod.qParam.FieldByName('param_val').AsString <> '');
  actAdd.Visible    := False;
  actDelete.Visible := False;

  actClose.Enabled  := not DataEditing(MainMod.qParam);
end;

procedure TfrAyarlarListe.NewSQL;
var
	SQLStr,
	WhereStr : string;
begin
	SQLStr   := 'SELECT * FROM sys_parameter_mc ';

	WhereStr 	:= 'mc_id = ' + IntToStr(MainMod.MCID) + ' AND ';
  if edSrcText.Text <> '' then WhereStr := WhereStr + 'param_val LIKE ''%'  + edSrcText.Text  + '%'' AND ';

  if Trim(WhereStr) <> '' then System.Delete(WhereStr, Length(WhereStr) - 3, 4);
  if Trim(WhereStr) <> '' then SQLStr := SQLStr + 'WHERE ' + WhereStr;
  SQLStr := SQLStr + ' ORDER BY param_val';

	QueryOpen(MainMod.qParam, SQLStr);
  ManageSettings;
end;

procedure TfrAyarlarListe.UniFrameCreate(Sender: TObject);
begin
  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;
end;

initialization
  RegisterClass(TfrAyarlarListe);

end.
