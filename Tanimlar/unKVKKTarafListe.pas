unit unKVKKTarafListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniBasicGrid, uniDBGrid, uniButton, uniBitBtn, uniEdit, uniMultiItem,
  uniComboBox, uniLabel, uniGUIBaseClasses, uniPanel, System.Actions, Vcl.ActnList, Data.DB, DBAccess, Uni,
  MemDS;

type
  TfrKVKKTarafListe = class(TUniFrame)
    dsTaraf: TUniDataSource;
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
    qTaraf: TUniQuery;
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

uses MainModule, McMLib, Main, unKVKKTarafTanim, unHelpPage;

procedure TfrKVKKTarafListe.actAddExecute(Sender: TObject);
begin
  if frmKVKKTarafTanim.Exec(0, 0) = mrOk then RefreshQuery(qTaraf);
  ManageSettings;
end;

procedure TfrKVKKTarafListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrKVKKTarafListe.actDeleteExecute(Sender: TObject);
begin
  MessageDlg('Seçili taraf tanýmýný silmek istediðinizden emin misiniz?'#13, mtConfirmation, mbYesNo, DeleteControl);
end;

procedure TfrKVKKTarafListe.actEditExecute(Sender: TObject);
begin
  if frmKVKKTarafTanim.Exec(qTaraf.FieldByName('id').AsInteger, 1) = mrOk then RefreshQuery(qTaraf);
  ManageSettings;
end;

procedure TfrKVKKTarafListe.actExcelExecute(Sender: TObject);
begin
  if qTaraf.RecordCount < 1 then Exit;
  MainMod.DownloadDataSetToXls(UniDBGrid1, 'Veri Paylaþým Taraflarý Listesi', 'Tanimlar_Veri_Paylasim_Taraflari.xlsx');
end;

procedure TfrKVKKTarafListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKVKKTarafListe.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('KVKKTarafListe');
end;

procedure TfrKVKKTarafListe.DeleteControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  if MainMod.CheckUsedIds('data_envanter', 'payl_taraf_ids', qTaraf.FieldByName('id').AsString) then
  begin
    MessageDlg('Bu taným envanter kayýtlarýnda kullanýlýyor. Silemezsiniz.', mtError, [mbOk]);
    Exit;
  end;

  qTaraf.Delete;
  ManageSettings;
end;

procedure TfrKVKKTarafListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrKVKKTarafListe.edSrcTypeChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKVKKTarafListe.ManageSettings;
begin
  actAdd.Enabled    := MainMod.LoginInfo.Yetkiler[45] and (qTaraf.State = dsBrowse);
  actEdit.Enabled   := MainMod.LoginInfo.Yetkiler[46] and (qTaraf.State = dsBrowse) and (qTaraf.FieldByName('id').AsInteger > 0);
  actDelete.Enabled := MainMod.LoginInfo.Yetkiler[47] and (qTaraf.State = dsBrowse) and (qTaraf.FieldByName('id').AsInteger > 0);

  actClose.Enabled  := not DataEditing(qTaraf);
end;

procedure TfrKVKKTarafListe.NewSQL;
var
	SQLStr,
  SrcText : string;

begin
  if not GuvenliGirisMi(edSrcText.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;

	SQLStr   := 'SELECT * FROM def_data_taraf where mc_id =:mc_id ' ;

  if edSrcText.Text <> '' then
  begin
       if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';

    SQLStr := SQLStr + ' and taraf LIKE :SrcText ';
  end;

  SQLStr := SQLStr + ' ORDER BY id';
  qTaraf.SQL.Text := SQLStr;
  qTaraf.ParamByName('mc_id').AsString := inttostr(mainmod.MCID);
  if qTaraf.FindParam('srctext') <> nil then
    qTaraf.ParamByName('SrcText').AsString := SrcText;
  qTaraf.Open;
  ManageSettings;
  lbKayitSayisi.Text := IntToStr(qTaraf.RecordCount) + ' Kayýt Listelendi...';
end;

procedure TfrKVKKTarafListe.pnlTopAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
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

procedure TfrKVKKTarafListe.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  qTaraf.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrKVKKTarafListe.UniFrameCreate(Sender: TObject);
begin
  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;
end;

initialization
  RegisterClass(TfrKVKKTarafListe);

end.
