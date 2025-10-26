unit unKVKKKaynakListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniBasicGrid, uniDBGrid, uniButton, uniBitBtn, uniEdit, uniMultiItem,
  uniComboBox, uniLabel, uniGUIBaseClasses, uniPanel, System.Actions, Vcl.ActnList, Data.DB, DBAccess, Uni,
  MemDS;

type
  TfrKVKKKaynakListe = class(TUniFrame)
    dsKaynak: TUniDataSource;
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
    qKaynak: TUniQuery;
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

uses MainModule, McMLib, Main, unKVKKKaynakTanim, unHelpPage;

procedure TfrKVKKKaynakListe.actAddExecute(Sender: TObject);
begin
  if frmKVKKKaynakTanim.Exec(0, 0) = mrOk then RefreshQuery(qKaynak);
  ManageSettings;
end;

procedure TfrKVKKKaynakListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrKVKKKaynakListe.actDeleteExecute(Sender: TObject);
begin
  MessageDlg('Seçili veri kaynaðý tanýmýný silmek istediðinizden emin misiniz?'#13, mtConfirmation, mbYesNo, DeleteControl);
end;

procedure TfrKVKKKaynakListe.actEditExecute(Sender: TObject);
begin
  if frmKVKKKaynakTanim.Exec(qKaynak.FieldByName('id').AsInteger, 1) = mrOk then RefreshQuery(qKaynak);
  ManageSettings;
end;

procedure TfrKVKKKaynakListe.actExcelExecute(Sender: TObject);
var
  TmpName: String;
begin
  if qKaynak.RecordCount < 1 then Exit;
  TmpName := MainMod.DataSetToXls(UniDBGrid1, 'Veri Kaynaklarý Listesi');
  UniSession.SendFile(TmpName, 'Tanimlar_Veri_Kaynaklari.xlsx');
end;

procedure TfrKVKKKaynakListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKVKKKaynakListe.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('KVKKKaynakListe');
end;

procedure TfrKVKKKaynakListe.DeleteControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  if MainMod.CheckUsedId('data_envanter', 'kaynak_id', qKaynak.FieldByName('id').AsString) then
  begin
    MessageDlg('Bu veri kaynaðý tanýmý envanter kayýtlarýnda kullanýlýyor. Silemezsiniz.', mtError, [mbOk]);
    Exit;
  end;
  if MainMod.CheckUsedId('data_checklist', 'kaynak_id', qKaynak.FieldByName('id').AsString) then
  begin
    MessageDlg('Bu veri kaynaðý tanýmý kontrol listelerinde kullanýlýyor. Silemezsiniz.', mtError, [mbOk]);
    Exit;
  end;

  qKaynak.Delete;
  ManageSettings;
end;

procedure TfrKVKKKaynakListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrKVKKKaynakListe.edSrcTypeChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKVKKKaynakListe.ManageSettings;
begin
  actAdd.Enabled    := MainMod.LoginInfo.Yetkiler[25] and (qKaynak.State = dsBrowse);
  actEdit.Enabled   := MainMod.LoginInfo.Yetkiler[26] and (qKaynak.State = dsBrowse) and (qKaynak.FieldByName('id').AsInteger > 0);
  actDelete.Enabled := MainMod.LoginInfo.Yetkiler[27] and (qKaynak.State = dsBrowse) and (qKaynak.FieldByName('id').AsInteger > 0);

  actClose.Enabled  := not DataEditing(qKaynak);
end;

procedure TfrKVKKKaynakListe.NewSQL;
var
	SQLStr,
  SrcText,
	WhereStr : string;
begin
//	SQLStr   := 'SELECT * FROM def_data_kaynak ';
//
//	WhereStr 	:= 'mc_id = ' + IntToStr(MainMod.MCID) + ' AND ';
//  if edSrcText.Text <> '' then
//  begin
//    SrcText := StringReplace(edSrcText.Text, '*', '%', [rfReplaceAll]);
//    WhereStr := WhereStr + 'kaynak LIKE ''%'  + SrcText    + '%'' AND ';
//  end;
//
//
//  if Trim(WhereStr) <> '' then System.Delete(WhereStr, Length(WhereStr) - 3, 4);
//  if Trim(WhereStr) <> '' then SQLStr := SQLStr + 'WHERE ' + WhereStr;
//  SQLStr := SQLStr + ' ORDER BY id';
//
//	QueryOpen(qKaynak, SQLStr);
//  ManageSettings;
//  lbKayitSayisi.Text := IntToStr(qKaynak.RecordCount) + ' Kayýt Listelendi...';

if not GuvenliGirisMi(edSrcText.Text) then
begin
  MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
  exit;
end;

SQLStr := 'SELECT * FROM def_data_kaynak WHERE mc_id = :MCID ';

if edSrcText.Text <> '' then
begin
   if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
  SQLStr := SQLStr + ' AND kaynak LIKE :SrcText';
end;
SQLStr := SQLStr + ' ORDER BY id';
qKaynak.SQL.Text := SQLStr;
qKaynak.ParamByName('MCID').AsInteger := MainMod.MCID;
if edSrcText.Text <> '' then
  qKaynak.ParamByName('SrcText').AsString :=  SrcText;
qKaynak.Open;
ManageSettings;
lbKayitSayisi.Text := IntToStr(qKaynak.RecordCount) + ' Kayýt Listelendi...';

end;

procedure TfrKVKKKaynakListe.pnlTopAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
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

procedure TfrKVKKKaynakListe.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  qKaynak.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrKVKKKaynakListe.UniFrameCreate(Sender: TObject);
begin
  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;
end;

initialization
  RegisterClass(TfrKVKKKaynakListe);

end.
