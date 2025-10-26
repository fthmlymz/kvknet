unit unKVKKAmacListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, System.Actions, Vcl.ActnList, Data.DB, DBAccess, Uni, uniBasicGrid, uniDBGrid,
  uniButton, uniBitBtn, uniLabel, uniEdit, uniMultiItem, uniComboBox, uniGUIBaseClasses, uniPanel, MemDS;

type
  TfrKVKKAmacListe = class(TUniFrame)
    dsAmac: TUniDataSource;
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
    qAmac: TUniQuery;
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

uses MainModule, McMLib, Main, unKVKKAmacTanim, unHelpPage;

procedure TfrKVKKAmacListe.actAddExecute(Sender: TObject);
begin
  if frmKVKKAmacTanim.Exec(0, 0) = mrOk then RefreshQuery(qAmac);
  ManageSettings;
end;

procedure TfrKVKKAmacListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrKVKKAmacListe.actDeleteExecute(Sender: TObject);
begin
  MessageDlg('Seçili amaç tanýmýný silmek istediðinizden emin misiniz?'#13, mtConfirmation, mbYesNo, DeleteControl);
end;

procedure TfrKVKKAmacListe.actEditExecute(Sender: TObject);
begin
  if frmKVKKAmacTanim.Exec(qAmac.FieldByName('id').AsInteger, 1) = mrOk then RefreshQuery(qAmac);
  ManageSettings;
end;

procedure TfrKVKKAmacListe.actExcelExecute(Sender: TObject);
begin
  if qAmac.RecordCount < 1 then Exit;
  
  MainMod.DownloadDataSetToXls(UniDBGrid1, 'Amaç Listesi', 'Tanimlar_Amaclar.xlsx');
end;

procedure TfrKVKKAmacListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKVKKAmacListe.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('KVKKAmacListe');
end;

procedure TfrKVKKAmacListe.DeleteControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  if MainMod.CheckUsedIds('data_envanter', 'topl_amac_ids', qAmac.FieldByName('id').AsString) then
  begin
    MessageDlg('Bu taným envanter kayýtlarýnda kullanýlýyor. Silemezsiniz.', mtError, [mbOk]);
    Exit;
  end;
  if MainMod.CheckUsedIds('data_envanter', 'sakl_amac_ids', qAmac.FieldByName('id').AsString) then
  begin
    MessageDlg('Bu taným envanter kayýtlarýnda kullanýlýyor. Silemezsiniz.', mtError, [mbOk]);
    Exit;
  end;
  if MainMod.CheckUsedIds('data_envanter', 'payl_amac_ids', qAmac.FieldByName('id').AsString) then
  begin
    MessageDlg('Bu taným envanter kayýtlarýnda kullanýlýyor. Silemezsiniz.', mtError, [mbOk]);
    Exit;
  end;

  qAmac.Delete;
  ManageSettings;
end;

procedure TfrKVKKAmacListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrKVKKAmacListe.edSrcTypeChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKVKKAmacListe.ManageSettings;
begin
  actAdd.Enabled    := MainMod.LoginInfo.Yetkiler[37] and (qAmac.State = dsBrowse);
  actEdit.Enabled   := MainMod.LoginInfo.Yetkiler[38] and (qAmac.State = dsBrowse) and (qAmac.FieldByName('id').AsInteger > 0);
  actDelete.Enabled := MainMod.LoginInfo.Yetkiler[39] and (qAmac.State = dsBrowse) and (qAmac.FieldByName('id').AsInteger > 0);

  actClose.Enabled  := not DataEditing(qAmac);
end;

procedure TfrKVKKAmacListe.NewSQL;
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

	SQLStr   := 'SELECT * FROM def_data_amac where mc_id =:mc_id ';

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
    SQLStr := SQLStr + ' and amac LIKE :SrcText ';
  end;

	SQLStr := SQLStr + ' ORDER BY id';
  qAmac.SQL.Text := SQLStr;
  qAmac.ParamByName('mc_id').AsString := inttostr(mainmod.MCID);
  if qAmac.FindParam('SrcText') <> nil then
    qAmac.ParamByName('SrcText').AsString :=  SrcText;

	qAmac.Open;
  ManageSettings;
  lbKayitSayisi.Text := IntToStr(qAmac.RecordCount) + ' Kayýt Listelendi...';
end;

procedure TfrKVKKAmacListe.pnlTopAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
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

procedure TfrKVKKAmacListe.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  qAmac.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrKVKKAmacListe.UniFrameCreate(Sender: TObject);
begin
  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;
end;

initialization
  RegisterClass(TfrKVKKAmacListe);

end.
