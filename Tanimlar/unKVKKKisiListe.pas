unit unKVKKKisiListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIFrame, uniBasicGrid,
  uniDBGrid, uniButton, uniBitBtn, uniEdit, uniMultiItem, uniComboBox, uniLabel,
  uniGUIBaseClasses, uniPanel, System.Actions, Vcl.ActnList, Data.DB, DBAccess,
  Uni, MemDS;

type
  TfrKVKKKisiListe = class(TUniFrame)
    dsKisi: TUniDataSource;
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
    qKisi: TUniQuery;
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

uses
  MainModule, McMLib, Main, unKVKKKisiTanim, unHelpPage;

procedure TfrKVKKKisiListe.actAddExecute(Sender: TObject);
begin
  if frmKVKKKisiTanim.Exec(0, 0) = mrOk then
    RefreshQuery(qKisi);
  ManageSettings;
end;

procedure TfrKVKKKisiListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrKVKKKisiListe.actDeleteExecute(Sender: TObject);
begin
  MessageDlg('Seçili kiþi tanýmý silmek istediðinizden emin misiniz?'#13, mtConfirmation, mbYesNo, DeleteControl);
end;

procedure TfrKVKKKisiListe.actEditExecute(Sender: TObject);
begin
  if frmKVKKKisiTanim.Exec(qKisi.FieldByName('id').AsInteger, 1) = mrOk then
    RefreshQuery(qKisi);
  ManageSettings;
end;

procedure TfrKVKKKisiListe.actExcelExecute(Sender: TObject);
begin
  if qKisi.RecordCount < 1 then Exit;
  MainMod.DownloadDataSetToXls(UniDBGrid1, 'Veri Konusu Kiþi Listesi', 'Tanimlar_Veri_Konusu_Kisi.xlsx');
end;

procedure TfrKVKKKisiListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKVKKKisiListe.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('KVKKKisiListe');
end;

procedure TfrKVKKKisiListe.DeleteControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then
    Exit;

  if MainMod.CheckUsedId('data_envanter', 'kisi_id', qKisi.FieldByName('id').AsString) then
  begin
    MessageDlg('Bu kiþi tanýmý envanter kayýtlarýnda kullanýlýyor. Silemezsiniz.', mtError, [mbOk]);
    Exit;
  end;
  if MainMod.CheckUsedId('data_checklist', 'kisi_id', qKisi.FieldByName('id').AsString) then
  begin
    MessageDlg('Bu kiþi tanýmý kontrol listelerinde kullanýlýyor. Silemezsiniz.', mtError, [mbOk]);
    Exit;
  end;
//todo: Tahir: kiþi silinince aydýnlatma boþa düþüyor, envanterde de kontrol edilmeli
//  if MainMod.CheckUsedId('def_data_aydinlatma', 'kisi_id', qKisi.FieldByName('id').AsString) then
//  begin
//    MessageDlg('Bu kiþi tanýmý aydýnlatma metinlerinde kullanýlýyor. Silemezsiniz.', mtError, [mbOk]);
//    Exit;
//  end;

  qKisi.Delete;
  ManageSettings;
end;

procedure TfrKVKKKisiListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then
    NewSQL;
end;

procedure TfrKVKKKisiListe.edSrcTypeChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKVKKKisiListe.ManageSettings;
begin
  actAdd.Enabled := MainMod.LoginInfo.Yetkiler[33] and (qKisi.State = dsBrowse);
  actEdit.Enabled := MainMod.LoginInfo.Yetkiler[34] and (qKisi.State = dsBrowse) and (qKisi.FieldByName('id').AsInteger > 0);
  actDelete.Enabled := MainMod.LoginInfo.Yetkiler[35] and (qKisi.State = dsBrowse) and (qKisi.FieldByName('id').AsInteger > 0);

  actClose.Enabled := not DataEditing(qKisi);
end;

procedure TfrKVKKKisiListe.NewSQL;
var
  SQLStr : string;
  SrcText : string;
  WhereStr: string;
begin
//  SQLStr := 'SELECT * FROM def_data_kisi ';
//
//  WhereStr := 'mc_id = ' + IntToStr(MainMod.MCID) + ' AND ';
//  if edSrcText.Text <> '' then
//  begin
//    SrcText := StringReplace(edSrcText.Text, '*', '%', [rfReplaceAll]);
//    WhereStr := WhereStr + 'kisi LIKE ''%' + SrcText + '%'' AND ';
//  end;
//
//
//  if Trim(WhereStr) <> '' then
//    System.Delete(WhereStr, Length(WhereStr) - 3, 4);
//  if Trim(WhereStr) <> '' then
//    SQLStr := SQLStr + 'WHERE ' + WhereStr;
//  SQLStr := SQLStr + ' ORDER BY id';
//
//  QueryOpen(qKisi, SQLStr);
//  ManageSettings;
//  lbKayitSayisi.Text := IntToStr(qKisi.RecordCount) + ' Kayýt Listelendi...';

  if not GuvenliGirisMi(edSrcText.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;

  SQLStr := 'SELECT * FROM def_data_kisi where mc_id =:mc_id ' ;
  if edSrcText.Text <> '' then
  begin
    if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
    SQLStr := SQLStr + ' and kisi LIKE :SrcText ';
  end;
  SQLStr := SQLStr + ' ORDER BY id';
  qKisi.SQL.Text := SQLStr ;
  qKisi.ParamByName('mc_id').AsString :=  inttostr(MainMod.MCID) ;
  if (qKisi.FindParam('SrcText') <> nil ) and ( edSrcText.Text <> '' ) then
    qKisi.ParamByName('SrcText').Value := SrcText;

  qKisi.Open;
  ManageSettings;
  lbKayitSayisi.Text := IntToStr(qKisi.RecordCount) + ' Kayýt Listelendi...';
end;

procedure TfrKVKKKisiListe.pnlTopAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
var
  Base: Integer;
  NewW: Integer;
begin
  if EventName = 'doResize' then
  begin
    Base := pnlTop.Width - 25;
    NewW := Trunc(Base * 0.4);
    if NewW < 300 then
      NewW := 300;
    UniDBGrid1.Columns[0].Width := NewW;
    NewW := Trunc(Base * 0.6);
    if NewW < 400 then
      NewW := 400;
    UniDBGrid1.Columns[1].Width := NewW;
  end;
end;

procedure TfrKVKKKisiListe.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir: string;
begin
  if not Column.Sortable then
    Exit;

  if Direction then
    Dir := 'ASC'
  else
    Dir := 'DESC';
  qKisi.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrKVKKKisiListe.UniFrameCreate(Sender: TObject);
begin
  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;
end;

initialization
  RegisterClass(TfrKVKKKisiListe);

end.

