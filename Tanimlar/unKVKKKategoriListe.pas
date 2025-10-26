unit unKVKKKategoriListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniBasicGrid, uniDBGrid, uniButton, uniBitBtn, uniEdit, uniMultiItem,
  uniComboBox, uniLabel, uniGUIBaseClasses, uniPanel, System.Actions, Vcl.ActnList, Data.DB, DBAccess, Uni,
  MemDS,system.Generics.Collections;

type
  TfrKVKKKategoriListe = class(TUniFrame)
    dsKategori: TUniDataSource;
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
    qKategori: TUniQuery;
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

uses MainModule, McMLib, Main, unKVKKKategoriTanim, unHelpPage;

procedure TfrKVKKKategoriListe.actAddExecute(Sender: TObject);
begin
  if frmKVKKKategoriTanim.Exec(0, 0) = mrOk then RefreshQuery(qKategori);
  ManageSettings;
end;

procedure TfrKVKKKategoriListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrKVKKKategoriListe.actDeleteExecute(Sender: TObject);
begin
  MessageDlg('Seçili veri kategorisini silmek istediðinizden emin misiniz?'#13, mtConfirmation, mbYesNo, DeleteControl);
end;

procedure TfrKVKKKategoriListe.actEditExecute(Sender: TObject);
begin
  if frmKVKKKategoriTanim.Exec(qKategori.FieldByName('id').AsInteger, 1) = mrOk then RefreshQuery(qKategori);
  ManageSettings;
end;

procedure TfrKVKKKategoriListe.actExcelExecute(Sender: TObject);
begin
  if qKategori.RecordCount < 1 then Exit;
  MainMod.DownloadDataSetToXls(UniDBGrid1, 'Veri Kategorileri Listesi', 'Tanimlar_Veri_Kategorileri.xlsx');
end;

procedure TfrKVKKKategoriListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKVKKKategoriListe.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('KVKKKategoriListe');
end;

procedure TfrKVKKKategoriListe.DeleteControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  if MainMod.CheckUsedId('data_envanter', 'kategori_id', qKategori.FieldByName('id').AsString) then
  begin
    MessageDlg('Bu kategori tanýmý envanter kayýtlarýnda kullanýlýyor. Silemezsiniz.', mtError, [mbOk]);
    Exit;
  end;
  if MainMod.CheckUsedId('def_data_veritipi', 'md_id', qKategori.FieldByName('id').AsString) then
  begin
    MessageDlg('Bu kategori veri tipi kayýtlarýnda kullanýlýyor. Silemezsiniz.', mtError, [mbOk]);
    Exit;
  end;

  qKategori.Delete;
  ManageSettings;
end;

procedure TfrKVKKKategoriListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrKVKKKategoriListe.edSrcTypeChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKVKKKategoriListe.ManageSettings;
begin
  actAdd.Enabled    := MainMod.LoginInfo.Yetkiler[29] and (qKategori.State = dsBrowse);
  actEdit.Enabled   := MainMod.LoginInfo.Yetkiler[30] and (qKategori.State = dsBrowse) and (qKategori.FieldByName('id').AsInteger > 0);
  actDelete.Enabled := MainMod.LoginInfo.Yetkiler[31] and (qKategori.State = dsBrowse) and (qKategori.FieldByName('id').AsInteger > 0);

  actClose.Enabled  := not DataEditing(qKategori);
end;

procedure TfrKVKKKategoriListe.NewSQL;
var
	SQLStr,
  SrcText,
	WhereStr : string;
  Params: array of TPair<string, Variant>;
begin
//	SQLStr   := 'SELECT * FROM def_data_kategori ';
//
//	WhereStr 	:= 'mc_id = ' + IntToStr(MainMod.MCID) + ' AND ';
//  if edSrcText.Text <> '' then
//  begin
//    SrcText := StringReplace(edSrcText.Text, '*', '%', [rfReplaceAll]);
//    WhereStr := WhereStr + 'kategori LIKE ''%'  + SrcText  + '%'' AND ';
//  end;
//
//  if Trim(WhereStr) <> '' then System.Delete(WhereStr, Length(WhereStr) - 3, 4);
//  if Trim(WhereStr) <> '' then SQLStr := SQLStr + 'WHERE ' + WhereStr;
//  SQLStr := SQLStr + ' ORDER BY id';
//
//	QueryOpen(qKategori, SQLStr);
//  ManageSettings;
//  lbKayitSayisi.Text := IntToStr(qKategori.RecordCount) + ' Kayýt Listelendi...';

  if not GuvenliGirisMi(edSrcText.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;

  SQLStr := 'SELECT * FROM def_data_kategori where mc_id = :mc_id';

  if edSrcText.Text <> '' then
  begin
    if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
      SQLStr := SQLStr + ' AND kategori LIKE :SrcText';
  end;

  SQLStr := SQLStr + ' ORDER BY id';
  qKategori.SQL.Text := SQLStr;
  qKategori.ParamByName('mc_id').Value := MainMod.MCID;
  if edSrcText.Text <> '' then
    qKategori.ParamByName('SrcText').Value := SrcText;
  qKategori.Open;
  lbKayitSayisi.Text := IntToStr(qKategori.RecordCount) + ' Kayýt Listelendi...';

end;

procedure TfrKVKKKategoriListe.pnlTopAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
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

procedure TfrKVKKKategoriListe.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  qKategori.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrKVKKKategoriListe.UniFrameCreate(Sender: TObject);
begin
  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;
end;

initialization
  RegisterClass(TfrKVKKKategoriListe);

end.
