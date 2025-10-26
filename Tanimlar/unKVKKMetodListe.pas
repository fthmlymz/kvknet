unit unKVKKMetodListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, System.Actions, Vcl.ActnList, Data.DB, DBAccess, Uni, uniBasicGrid, uniDBGrid,
  uniButton, uniBitBtn, uniLabel, uniEdit, uniMultiItem, uniComboBox, uniGUIBaseClasses, uniPanel, MemDS;

type
  TfrKVKKMetodListe = class(TUniFrame)
    dsMetod: TUniDataSource;
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
    qMetod: TUniQuery;
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

uses MainModule, McMLib, Main, unKVKKMetodTanim, unHelpPage;

procedure TfrKVKKMetodListe.actAddExecute(Sender: TObject);
begin
  if frmKVKKMetodTanim.Exec(0, 0) = mrOk then RefreshQuery(qMetod);
  ManageSettings;
end;

procedure TfrKVKKMetodListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrKVKKMetodListe.actDeleteExecute(Sender: TObject);
begin
  MessageDlg('Seçili metod tanýmýný silmek istediðinizden emin misiniz?'#13, mtConfirmation, mbYesNo, DeleteControl);
end;

procedure TfrKVKKMetodListe.actEditExecute(Sender: TObject);
begin
  if frmKVKKMetodTanim.Exec(qMetod.FieldByName('id').AsInteger, 1) = mrOk then RefreshQuery(qMetod);
  ManageSettings;
end;

procedure TfrKVKKMetodListe.actExcelExecute(Sender: TObject);
begin
  if qMetod.RecordCount < 1 then Exit;
  MainMod.DownloadDataSetToXls(UniDBGrid1, 'Metod Listesi', 'Tanimlar_Metodlar.xlsx');
end;

procedure TfrKVKKMetodListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKVKKMetodListe.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('KVKKMetodListe');
end;

procedure TfrKVKKMetodListe.DeleteControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  if MainMod.CheckUsedIds('data_envanter', 'topl_metod_ids', qMetod.FieldByName('id').AsString) then
  begin
    MessageDlg('Bu taným envanter kayýtlarýnda kullanýlýyor. Silemezsiniz.', mtError, [mbOk]);
    Exit;
  end;
  if MainMod.CheckUsedIds('data_envanter', 'sakl_metod_ids', qMetod.FieldByName('id').AsString) then
  begin
    MessageDlg('Bu taným envanter kayýtlarýnda kullanýlýyor. Silemezsiniz.', mtError, [mbOk]);
    Exit;
  end;
  if MainMod.CheckUsedIds('data_envanter', 'payl_metod_ids', qMetod.FieldByName('id').AsString) then
  begin
    MessageDlg('Bu taným envanter kayýtlarýnda kullanýlýyor. Silemezsiniz.', mtError, [mbOk]);
    Exit;
  end;

  qMetod.Delete;
  ManageSettings;
end;

procedure TfrKVKKMetodListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrKVKKMetodListe.edSrcTypeChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKVKKMetodListe.ManageSettings;
begin
  actAdd.Enabled    := MainMod.LoginInfo.Yetkiler[53] and (qMetod.State = dsBrowse);
  actEdit.Enabled   := MainMod.LoginInfo.Yetkiler[54] and (qMetod.State = dsBrowse) and (qMetod.FieldByName('id').AsInteger > 0);
  actDelete.Enabled := MainMod.LoginInfo.Yetkiler[55] and (qMetod.State = dsBrowse) and (qMetod.FieldByName('id').AsInteger > 0);

  actClose.Enabled  := not DataEditing(qMetod);
end;

procedure TfrKVKKMetodListe.NewSQL;
var
	SQLStr,
  SrcText : string;

begin
  if not GuvenliGirisMi(edSrcText.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;

	SQLStr   := 'SELECT * FROM def_data_metod where mc_id =:mc_id ';

  case edSrcAlan.ItemIndex of
    1 : SQLStr := SQLStr + ' and toplama = ''E''  ';
    2 : SQLStr := SQLStr + ' and saklama = ''E''  ';
    3 : SQLStr := SQLStr + ' and paylasma = ''E''  ';
  end;

  if edSrcText.Text <> '' then
  begin
        if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
    SQLStr := SQLStr + ' and metod LIKE :SrcText ';
  end;

	SQLStr := SQLStr + ' ORDER BY id';
  qmetod.SQL.Text := sqlstr;
  qMetod.ParamByName('mc_id').AsString := inttostr(MainMod.MCID);
  if qMetod.FindParam('SrcText') <> nil then
    qMetod.ParamByName('SrcText').AsString := SrcText;
	qMetod.Open;
  ManageSettings;
  lbKayitSayisi.Text := IntToStr(qMetod.RecordCount) + ' Kayýt Listelendi...';
end;

procedure TfrKVKKMetodListe.pnlTopAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
var
  Base : Integer;
  NewW : Integer;
begin
  if EventName = 'doResize' then
  begin
    Base := pnlTop.Width - 25 - 270;
    NewW := Trunc(Base * 0.4);
    if NewW < 300 then NewW := 300;
    UniDBGrid1.Columns[0].Width := NewW;
    NewW := Trunc(Base * 0.6);
    if NewW < 400 then NewW := 400;
    UniDBGrid1.Columns[4].Width := NewW;
  end;
end;

procedure TfrKVKKMetodListe.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  qMetod.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrKVKKMetodListe.UniFrameCreate(Sender: TObject);
begin
  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;
end;

initialization
  RegisterClass(TfrKVKKMetodListe);

end.
