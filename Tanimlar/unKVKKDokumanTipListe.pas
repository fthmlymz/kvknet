unit unKVKKDokumanTipListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniBasicGrid, uniDBGrid, uniButton, uniBitBtn, uniEdit, uniMultiItem,
  uniComboBox, uniLabel, uniGUIBaseClasses, uniPanel, System.Actions, Vcl.ActnList, Data.DB, DBAccess, Uni,
  MemDS;

type
  TfrKVKKDokumanTipListe = class(TUniFrame)
    dsDokumanTip: TUniDataSource;
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
    qDokumanTip: TUniQuery;
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

uses MainModule, McMLib, Main, unKVKKDokumanTipTanim, unHelpPage;

procedure TfrKVKKDokumanTipListe.actAddExecute(Sender: TObject);
begin
  if frmKVKKDokumanTipTanim.Exec(0, 0) = mrOk then RefreshQuery(qDokumanTip);
  ManageSettings;
end;

procedure TfrKVKKDokumanTipListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrKVKKDokumanTipListe.actDeleteExecute(Sender: TObject);
begin
  MessageDlg('Seçili doküman tipi tanýmýný silmek istediðinizden emin misiniz?'#13, mtConfirmation, mbYesNo, DeleteControl);
end;

procedure TfrKVKKDokumanTipListe.actEditExecute(Sender: TObject);
begin
  if frmKVKKDokumanTipTanim.Exec(qDokumanTip.FieldByName('id').AsInteger, 1) = mrOk then RefreshQuery(qDokumanTip);
  ManageSettings;
end;

procedure TfrKVKKDokumanTipListe.actExcelExecute(Sender: TObject);
begin
  if qDokumanTip.RecordCount < 1 then Exit;
  MainMod.DownloadDataSetToXls(UniDBGrid1, 'Doküman Tipleri Listesi', 'Tanimlar_Dokuman_Tipleri.xlsx');
end;

procedure TfrKVKKDokumanTipListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKVKKDokumanTipListe.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('KVKKDokumanTipListe');
end;

procedure TfrKVKKDokumanTipListe.DeleteControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  if MainMod.CheckUsedId('def_data_dokuman', 'md_id', qDokumanTip.FieldByName('id').AsString) then
  begin
    MessageDlg('Bu tip tanýmý doküman tanýmlarýnda kullanýlýyor. Silemezsiniz.', mtError, [mbOk]);
    Exit;
  end;

  qDokumanTip.Delete;
  ManageSettings;
end;

procedure TfrKVKKDokumanTipListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrKVKKDokumanTipListe.edSrcTypeChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKVKKDokumanTipListe.ManageSettings;
begin
  actAdd.Enabled    := MainMod.LoginInfo.Yetkiler[73] and (qDokumanTip.State = dsBrowse);
  actEdit.Enabled   := MainMod.LoginInfo.Yetkiler[74] and (qDokumanTip.State = dsBrowse) and (qDokumanTip.FieldByName('id').AsInteger > 0);
  actDelete.Enabled := MainMod.LoginInfo.Yetkiler[75] and (qDokumanTip.State = dsBrowse) and (qDokumanTip.FieldByName('id').AsInteger > 0);

  actClose.Enabled  := not DataEditing(qDokumanTip);
end;

procedure TfrKVKKDokumanTipListe.NewSQL;
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

	SQLStr   := 'SELECT * FROM def_data_dokumantip where mc_id =:mc_id';
  if edSrcText.Text <> '' then
  begin
    if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';

    SQLStr := SQLStr + ' and dokumantip LIKE :srctext ';
  end;

  SQLStr := SQLStr + ' ORDER BY id';

  qDokumanTip.SQL.Text := SQLStr ;

  qDokumanTip.ParamByName('mc_id').AsString := inttostr(mainmod.MCID);
  if qDokumanTip.FindParam('srctext') <> nil then
    qDokumanTip.ParamByName('srctext').AsString := SrcText ;

 qDokumanTip.Open;
  ManageSettings;
  lbKayitSayisi.Text := IntToStr(qDokumanTip.RecordCount) + ' Kayýt Listelendi...';
end;

procedure TfrKVKKDokumanTipListe.pnlTopAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
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

procedure TfrKVKKDokumanTipListe.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  qDokumanTip.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrKVKKDokumanTipListe.UniFrameCreate(Sender: TObject);
begin
  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;
end;

initialization
  RegisterClass(TfrKVKKDokumanTipListe);

end.
