unit unKVKKSurecListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniBasicGrid, uniDBGrid, uniButton, uniBitBtn, uniEdit, uniMultiItem,
  uniComboBox, uniLabel, uniGUIBaseClasses, uniPanel, System.Actions, Vcl.ActnList, Data.DB, DBAccess, Uni,
  MemDS;

type
  TfrKVKKSurecListe = class(TUniFrame)
    dsSurec: TUniDataSource;
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
    qSurec: TUniQuery;
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

uses MainModule, McMLib, Main, unKVKKSurecTanim, unHelpPage;

procedure TfrKVKKSurecListe.actAddExecute(Sender: TObject);
begin
  if frmKVKKSurecTanim.Exec(0, 0) = mrOk then RefreshQuery(qSurec);
  ManageSettings;
end;

procedure TfrKVKKSurecListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrKVKKSurecListe.actDeleteExecute(Sender: TObject);
begin
  MessageDlg('Seçili süreç tanýmý silmek istediðinizden emin misiniz?'#13, mtConfirmation, mbYesNo, DeleteControl);
end;

procedure TfrKVKKSurecListe.actEditExecute(Sender: TObject);
begin
  if frmKVKKSurecTanim.Exec(qSurec.FieldByName('id').AsInteger, 1) = mrOk then RefreshQuery(qSurec);
  ManageSettings;
end;

procedure TfrKVKKSurecListe.actExcelExecute(Sender: TObject);
begin
  if qSurec.RecordCount < 1 then Exit;
  MainMod.DownloadDataSetToXls(UniDBGrid1, 'Süreç Listesi', 'Tanimlar_Surecler.xlsx');
end;

procedure TfrKVKKSurecListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKVKKSurecListe.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('KVKKSurecListe');
end;

procedure TfrKVKKSurecListe.DeleteControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  if MainMod.CheckUsedId('data_envanter', 'surec_id', qSurec.FieldByName('id').AsString) then
  begin
    MessageDlg('Bu süreç tanýmý envanter kayýtlarýnda kullanýlýyor. Silemezsiniz.', mtError, [mbOk]);
    Exit;
  end;

  qSurec.Delete;
  ManageSettings;
end;

procedure TfrKVKKSurecListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrKVKKSurecListe.edSrcTypeChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKVKKSurecListe.ManageSettings;
begin
  actAdd.Enabled    := MainMod.LoginInfo.Yetkiler[21] and (qSurec.State = dsBrowse);
  actEdit.Enabled   := MainMod.LoginInfo.Yetkiler[22] and (qSurec.State = dsBrowse) and (qSurec.FieldByName('id').AsInteger > 0);
  actDelete.Enabled := MainMod.LoginInfo.Yetkiler[23] and (qSurec.State = dsBrowse) and (qSurec.FieldByName('id').AsInteger > 0);

  actClose.Enabled  := not DataEditing(qSurec);
end;

procedure TfrKVKKSurecListe.NewSQL;
var
	SQLStr,
  SrcText,
	WhereStr : string;
begin
//	SQLStr   := 'SELECT * FROM def_data_surec ';
//
//	WhereStr 	:= 'mc_id = ' + IntToStr(MainMod.MCID) + ' AND ';
//  if edSrcText.Text <> '' then
//  begin
//    SrcText := StringReplace(edSrcText.Text, '*', '%', [rfReplaceAll]);
//    WhereStr := WhereStr + 'surec LIKE ''%'  + SrcText  + '%'' AND ';
//  end;
//
//
//  if Trim(WhereStr) <> '' then System.Delete(WhereStr, Length(WhereStr) - 3, 4);
//  if Trim(WhereStr) <> '' then SQLStr := SQLStr + 'WHERE ' + WhereStr;
//  SQLStr := SQLStr + ' ORDER BY id';
//
//	QueryOpen(qSurec, SQLStr);
//  ManageSettings;
//  lbKayitSayisi.Text := IntToStr(qSurec.RecordCount) + ' Kayýt Listelendi...';

if not GuvenliGirisMi(edSrcText.Text) then
begin
  MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
  exit;
end;

SQLStr := 'SELECT * FROM def_data_surec WHERE mc_id = :MCID ';

if edSrcText.Text <> '' then
begin
  SQLStr := SQLStr + ' AND surec LIKE :SrcText';
    if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
end;
SQLStr := SQLStr + ' ORDER BY id';
qSurec.SQL.Text := SQLStr;
qSurec.ParamByName('MCID').AsInteger := MainMod.MCID;
if edSrcText.Text <> '' then
  qSurec.ParamByName('SrcText').AsString :=  SrcText ;
qSurec.Open;
ManageSettings;
lbKayitSayisi.Text := IntToStr(qSurec.RecordCount) + ' Kayýt Listelendi...';
end;

procedure TfrKVKKSurecListe.pnlTopAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
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

procedure TfrKVKKSurecListe.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  qSurec.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrKVKKSurecListe.UniFrameCreate(Sender: TObject);
begin
  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;
end;

initialization
  RegisterClass(TfrKVKKSurecListe);

end.
