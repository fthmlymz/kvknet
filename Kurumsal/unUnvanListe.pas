unit unUnvanListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, System.Actions, Vcl.ActnList, uniButton, uniBitBtn, uniLabel, uniEdit,
  uniMultiItem, uniComboBox, uniGUIBaseClasses, uniPanel, Data.DB, DBAccess, Uni, uniBasicGrid,
  uniDBGrid, MemDS, uniSplitter;

type
  TfrUnvanListe = class(TUniFrame)
    ActList: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actSearch: TAction;
    actClose: TAction;
    dsTitle: TUniDataSource;
    qTitle: TUniQuery;
    UniPanel2: TUniPanel;
    grdDept: TUniDBGrid;
    UniPanel3: TUniPanel;
    UniPanel1: TUniPanel;
    grdTitle: TUniDBGrid;
    pnlButtons: TUniPanel;
    btnAdd: TUniBitBtn;
    btnEdit: TUniBitBtn;
    btnDelete: TUniBitBtn;
    btnClose: TUniBitBtn;
    actDelete: TAction;
    qDept: TUniQuery;
    dsDept: TUniDataSource;
    UniLabel1: TUniLabel;
    edSrcActive: TUniComboBox;
    UniSplitter1: TUniSplitter;
    btnHelp: TUniBitBtn;
    procedure UniFrameCreate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure qDeptAfterScroll(DataSet: TDataSet);
    procedure pnlButtonsAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure grdDeptColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure grdTitleColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure edSrcActiveChange(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    DataLoading : Boolean;
    procedure DeleteControl(Sender: TComponent; Res: Integer);
    procedure NewSQL;
    procedure ManageSettings;
  public
  end;

implementation

{$R *.dfm}

uses MainModule, McMLib, Main, unUnvanTanim, unHelpPage;

procedure TfrUnvanListe.actAddExecute(Sender: TObject);
begin
  if frmUnvanTanim.Insert(qDept.FieldByName('id').AsInteger, qDept.FieldByName('title').AsString) = mrOk then RefreshQuery(qTitle);
  ManageSettings;
end;

procedure TfrUnvanListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrUnvanListe.actDeleteExecute(Sender: TObject);
begin
  MessageDlg('Seçili ünvan tanýmýný silmek istediðinizden emin misiniz?'#13, mtConfirmation, mbYesNo, DeleteControl);
end;

procedure TfrUnvanListe.actEditExecute(Sender: TObject);
begin
  if qTitle.FieldByName('id').AsInteger < 1 then Exit;

  if qTitle.FieldByName('active').AsString <> 'E' then
  begin
    if not MainMod.LoginInfo.Yetkiler[140] then
    begin
      MessageDlg('Deðiþtirmek istediðiniz kayýt PASÝF yapýlmýþ. Bu kaydý deðiþtirme yetkiniz yok.', mtError, [mbOk]);
      Exit;
    end;
  end;

  if frmUnvanTanim.Edit(qTitle.FieldByName('id').AsInteger, qDept.FieldByName('title').AsString) = mrOk then RefreshQuery(qTitle);
  ManageSettings;
end;

procedure TfrUnvanListe.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('UnvanListe');
end;

procedure TfrUnvanListe.DeleteControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  if MainMod.CheckUsedID('data_access', 'title_id', qTitle.FieldByName('id').AsString) then
  begin
    MessageDlg('Bu ünvan tanýmý yetki matrisinde kullanýlýyor. Silemezsiniz.', mtError, [mbOk]);
    Exit;
  end;

  qTitle.Delete;
  ManageSettings;
end;

procedure TfrUnvanListe.edSrcActiveChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrUnvanListe.grdDeptColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  qDept.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrUnvanListe.grdTitleColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  qTitle.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrUnvanListe.ManageSettings;
begin
  actAdd.Enabled    := MainMod.LoginInfo.Yetkiler[137] and (qTitle.State = dsBrowse);
  actEdit.Enabled   := MainMod.LoginInfo.Yetkiler[138] and (qTitle.State = dsBrowse) and (qTitle.FieldByName('id').AsInteger > 0);
  actDelete.Enabled := MainMod.LoginInfo.Yetkiler[139] and (qTitle.State = dsBrowse) and (qTitle.FieldByName('id').AsInteger > 0);

  actClose.Enabled  := not DataEditing(qTitle);
end;

procedure TfrUnvanListe.NewSQL;
var
	SQLStr : string;
begin
	SQLStr   := 'SELECT * FROM sys_titledef WHERE mc_id = ' +
              IntToStr(MainMod.MCID) + ' AND dept_id = ' +
              qDept.FieldByName('id').AsString;
	case edSrcActive.ItemIndex of
		0 : SQLStr := SQLStr + ' AND active = ''E'' ';
		1 : SQLStr := SQLStr + ' AND active = ''H'' ';
	end;

	SQLStr := SQLStr + ' ORDER BY id';

	QueryOpen(qTitle, SQLStr);
  ManageSettings;
end;

procedure TfrUnvanListe.pnlButtonsAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
var
  Base : Integer;
  NewW : Integer;
begin
  if EventName = 'doResize' then
  begin
    Base := pnlButtons.Width - 25;
    NewW := Trunc(Base * 0.2);
    if NewW < 75 then NewW := 75;
    grdTitle.Columns[0].Width := NewW;
    NewW := Trunc(Base * 0.2);
    if NewW < 75 then NewW := 75;
    grdTitle.Columns[1].Width := NewW;
    NewW := Trunc(Base * 0.6);
    if NewW < 350 then NewW := 350;
    grdTitle.Columns[2].Width := NewW;
  end;
end;

procedure TfrUnvanListe.qDeptAfterScroll(DataSet: TDataSet);
begin
  if DataLoading then Exit;

  NewSQL;
  ManageSettings;
end;

procedure TfrUnvanListe.UniFrameCreate(Sender: TObject);
begin
  UniPanel2.Width := 370;
  DataLoading := True;

  QueryOpen(qDept,  'SELECT dp.id, ' +
                    ' (case when coalesce(dp.main_dept_id,0) > 0 then dp.title||'' (''||dp_main.title||'') '' ' +
                    ' else dp.title end)::varchar(450) title, ' +
                    ' dp.active '+
                    ' FROM sys_deptdef dp left join sys_deptdef dp_main on dp_main.id = dp.main_dept_id ' +
                    ' WHERE dp.mc_id = ' +
                    IntToStr(MainMod.MCID) +
                    ' ORDER BY dp.title');
  DataLoading := False;
  NewSQL;
  ManageSettings;
  grdDept.SetFocus;
end;

initialization
  RegisterClass(TfrUnvanListe);

end.
