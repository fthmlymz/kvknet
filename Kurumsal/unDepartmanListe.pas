unit unDepartmanListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniBasicGrid, uniDBGrid, Data.DB, DBAccess, Uni, MemDS, uniGUIBaseClasses,
  uniPanel, uniLabel, uniEdit, uniMultiItem, uniComboBox, uniButton, uniBitBtn, System.Actions, Vcl.ActnList,
  uniDBComboBox, uniDBLookupComboBox;

type
  TfrDepartmanListe = class(TUniFrame)
    pnlTop: TUniPanel;
    dsDept: TUniDataSource;
    UniDBGrid1: TUniDBGrid;
    edSrcType: TUniComboBox;
    edSrcText: TUniEdit;
    edSrcActive: TUniComboBox;
    UniLabel1: TUniLabel;
    btnSearch: TUniBitBtn;
    btnClose: TUniBitBtn;
    btnAdd: TUniBitBtn;
    btnEdit: TUniBitBtn;
    ActList: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actSearch: TAction;
    actClose: TAction;
    UniLabel2: TUniLabel;
    btnHelp: TUniBitBtn;
    lbKayitSayisi: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure edSrcTypeChange(Sender: TObject);
    procedure edSrcActiveChange(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure btnHelpClick(Sender: TObject);
  private
    procedure NewSQL;
    procedure ManageSettings;
  public
  end;

implementation

{$R *.dfm}

uses MainModule, McMLib, Main, unDepartmanTanim, unHelpPage;

procedure TfrDepartmanListe.actAddExecute(Sender: TObject);
begin
  if frmDepartmanTanim.Insert = mrOk then RefreshQuery(MainMod.qDept);
  ManageSettings;
end;

procedure TfrDepartmanListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrDepartmanListe.actEditExecute(Sender: TObject);
begin
  if MainMod.qDept.FieldByName('active').AsString <> 'E' then
  begin
    if not MainMod.LoginInfo.Yetkiler[9] then
    begin
      MessageDlg('Deðiþtirmek istediðiniz kayýt PASÝF yapýlmýþ. Bu kaydý deðiþtirme yetkiniz yok.', mtError, [mbOk]);
      Exit;
    end;
  end;

  if frmDepartmanTanim.Edit = mrOk then RefreshQuery(MainMod.qDept);
  ManageSettings;
end;

procedure TfrDepartmanListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrDepartmanListe.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('DepartmanListe');
end;

procedure TfrDepartmanListe.edSrcActiveChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrDepartmanListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrDepartmanListe.edSrcTypeChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrDepartmanListe.ManageSettings;
begin
  actAdd.Enabled    := MainMod.LoginInfo.Yetkiler[7] and (MainMod.qDept.State = dsBrowse);
  actEdit.Enabled   := MainMod.LoginInfo.Yetkiler[8] and (MainMod.qDept.State = dsBrowse) and (MainMod.qDept.FieldByName('id').AsInteger > 0);

  actClose.Enabled  := not DataEditing(MainMod.qDept);
end;

procedure TfrDepartmanListe.NewSQL;
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

	SQLStr   := ' SELECT  d.*, m.full_name as man_name, m.email, m.phone, md.title as mainDept  '+
							' FROM sys_deptdef d ' +
              ' LEFT JOIN usr_user m ON m.id = d.manager ' +'  ' +
              ' left join sys_deptdef md ' +
              ' on md.id = d.main_dept_id ' ;

	WhereStr 	:= 'd.mc_id =:mc_id AND ';
	case edSrcActive.ItemIndex of
		0 : WhereStr := WhereStr + 'd.active = ''E'' AND ';
		1 : WhereStr := WhereStr + 'd.active = ''H'' AND ';
	end;
  if edSrcText.Text <> '' then
  begin
    if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
    case edSrcType.ItemIndex of
      0 : WhereStr := WhereStr + 'd.id::varchar LIKE :srctext AND ';
      1 : WhereStr := WhereStr + 'd.code  LIKE :srctext AND ';
      2 : WhereStr := WhereStr + 'd.title LIKE :srctext AND ';
      3 : WhereStr := WhereStr + 'm.full_name LIKE :srctext AND ';
      4 : WhereStr := WhereStr + 'md.title LIKE :srctext AND ';
		end;
	end;

	if Trim(WhereStr) <> '' then System.Delete(WhereStr, Length(WhereStr) - 3, 4);
	if Trim(WhereStr) <> '' then SQLStr := SQLStr + 'WHERE ' + WhereStr;
	SQLStr := SQLStr + ' ORDER BY d.id';

//	QueryOpen(MainMod.qDept, SQLStr);
   mainmod.qDept.SQL.Text := SQLStr ;
   mainmod.qDept.ParamByName('mc_id').AsString := inttostr(mainmod.MCID);
   if mainmod.qDept.FindParam('srctext') <> nil then
    mainmod.qDept.ParamByName('srctext').AsString := SrcText ;



   mainmod.qDept.Open;

  ManageSettings;
  lbKayitSayisi.Text := IntToStr(MainMod.qDept.RecordCount) + ' Kayýt Listelendi...';
end;

procedure TfrDepartmanListe.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  MainMod.qDept.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrDepartmanListe.UniFrameCreate(Sender: TObject);
begin
  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;
end;

initialization
  RegisterClass(TfrDepartmanListe);

end.
