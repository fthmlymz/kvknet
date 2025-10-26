unit unRolListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, System.Actions, Vcl.ActnList, Data.DB, DBAccess, Uni, uniBasicGrid, uniDBGrid,
  uniButton, uniBitBtn, uniEdit, uniMultiItem, uniComboBox, uniLabel, uniGUIBaseClasses, uniPanel;

type
  TfrRolListe = class(TUniFrame)
    dsRole: TUniDataSource;
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

uses MainModule, McMLib, Main, unRolTanim, unHelpPage;

{ TfrRolListe }

procedure TfrRolListe.actAddExecute(Sender: TObject);
begin
  if frmRolTanim.Insert = mrOk then RefreshQuery(MainMod.qRole);
  ManageSettings;
end;

procedure TfrRolListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrRolListe.actDeleteExecute(Sender: TObject);
begin
  if MainMod.qRole.FieldByName('rol').AsString = 'S�STEM Y�NET�C�S�' then
  begin
    MessageDlg('S�STEM Y�NET�C�S� rol� silinemez.', mtError, [mbOk]);
    Exit;
  end;

  MessageDlg('E�er bu ROL''� silerseniz bu role sahip kullan�c�lar i�lem yapamaz.'#13 +
             'Se�ili ROL tan�m�n� silmek istedi�inizden emin misiniz?'#13, mtConfirmation, mbYesNo, DeleteControl);
end;

procedure TfrRolListe.actEditExecute(Sender: TObject);
begin
  if MainMod.qRole.FieldByName('rol').AsString = 'S�STEM Y�NET�C�S�' then
  begin
    MessageDlg('S�STEM Y�NET�C�S� rol� de�i�tirilemez.', mtError, [mbOk]);
    Exit;
  end;

  if frmRolTanim.Edit = mrOk then RefreshQuery(MainMod.qRole);
  ManageSettings;
end;

procedure TfrRolListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrRolListe.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('RolListe');
end;

procedure TfrRolListe.DeleteControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  QueryOpen(MainMod.qTmp, 'SELECT COUNT(id) FROM usr_user WHERE mc_id = ' + IntToStr(MainMod.MCID) +
                          ' AND rol = ''' + MainMod.qRole.FieldByName('rol').AsString + '''');
  if MainMod.qTmp.Fields[0].AsInteger > 0 then
  begin
    MessageDlg('Bu rol tan�m� kullan�c� tan�mlar�nda kullan�l�yor. Silemezsiniz.', mtError, [mbOk]);
    Exit;
  end;

  MainMod.qRole.Delete;
  ManageSettings;
end;

procedure TfrRolListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrRolListe.edSrcTypeChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrRolListe.ManageSettings;
begin
  actAdd.Enabled    := MainMod.LoginInfo.Yetkiler[17] and (MainMod.qRole.State = dsBrowse);
  actEdit.Enabled   := MainMod.LoginInfo.Yetkiler[18] and (MainMod.qRole.State = dsBrowse) and (MainMod.qRole.FieldByName('rol').AsString <> '');
  actDelete.Enabled := MainMod.LoginInfo.Yetkiler[19] and (MainMod.qRole.State = dsBrowse) and (MainMod.qRole.FieldByName('rol').AsString <> '');
  // actDelete.Enabled   := (LoginInfo.Rol = 'S�STEM Y�NET�C�S�') and (qRoller.State = dsBrowse) and (qRoller.FieldByName('rol').AsString <> '');

  actClose.Enabled  := not DataEditing(MainMod.qRole);
end;

procedure TfrRolListe.NewSQL;
var
	SQLStr,
  SrcText,
	WhereStr : string;
begin

  if not GuvenliGirisMi(edSrcText.Text) then
  begin
    MessageDlg('Ge�ersiz giri�! L�tfen �zel karakterler veya SQL komutlar� kullanmay�n.',mtConfirmation,[mbYes]) ;
    exit;
  end;

	SQLStr   := 'SELECT * FROM usr_role ';

  WhereStr 	:= 'gc_id =:gc_id AND ';
  if MainMod.MCType = 0
     then WhereStr 	:= WhereStr + 'mc_id = 0 AND '
	   else WhereStr 	:= WhereStr + 'mc_id =:mc_id AND ';

  if edSrcText.Text <> '' then
  begin
    if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
    WhereStr := WhereStr + 'rol LIKE :SrcText AND ';
  end;

  if Trim(WhereStr) <> '' then System.Delete(WhereStr, Length(WhereStr) - 3, 4);
  if Trim(WhereStr) <> '' then SQLStr := SQLStr + 'WHERE ' + WhereStr;
  SQLStr := SQLStr + ' ORDER BY rol';

//	QueryOpen(MainMod.qRole, SQLStr);
  mainmod.qRole.SQL.Text := sqlstr;
  mainmod.qRole.ParamByName('gc_id').AsString := IntToStr(MainMod.GCID);
  if mainmod.qRole.FindParam('mc_id') <> nil then
    mainmod.qRole.ParamByName('mc_id').AsString :=  IntToStr(MainMod.MCID);
  if mainmod.qRole.FindParam('SrcText') <> nil then
    mainmod.qRole.ParamByName('SrcText').AsString :=  SrcText;

  mainmod.qRole.Open;

  ManageSettings;
  lbKayitSayisi.Text := IntToStr(MainMod.qRole.RecordCount) + ' Kay�t Listelendi...';
end;

procedure TfrRolListe.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  MainMod.qRole.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrRolListe.UniFrameCreate(Sender: TObject);
begin
  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;
end;

initialization
  RegisterClass(TfrRolListe);

end.
