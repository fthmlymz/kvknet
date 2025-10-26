unit unDuyuruListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniBasicGrid, uniDBGrid, uniButton, uniBitBtn, uniEdit, uniMultiItem,
  uniComboBox, uniLabel, uniGUIBaseClasses, uniPanel, System.Actions, Vcl.ActnList, Data.DB, DBAccess, Uni,
  MemDS;

type
  TfrDuyuruListe = class(TUniFrame)
    dsDuyuru: TUniDataSource;
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
    grdList: TUniDBGrid;
    qDuyuru: TUniQuery;
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
    procedure grdListColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure grdListDblClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    procedure DeleteControl(Sender: TComponent; Res: Integer);
    procedure NewSQL;
    procedure ManageSettings;
  public
  end;

implementation

{$R *.dfm}

uses MainModule, McMLib, Main, unDuyuruTanim, unDuyuruDetay, unHelpPage;

procedure TfrDuyuruListe.actAddExecute(Sender: TObject);
begin
  if frmDuyuruTanim.Exec(0, 0) = mrOk then RefreshQuery(qDuyuru);
  ManageSettings;
end;

procedure TfrDuyuruListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrDuyuruListe.actDeleteExecute(Sender: TObject);
begin
  // to do : Burada silerken silinecek olan duyurunun kapsam�na bak�lacak
  // E�er Global (Genel) Duyuru ise uyar� verdirilecek ve silinemeyecek

  if qDuyuru.FieldByName('mc_id').AsInteger = 0 then // Grup Duyurusu
  begin
    if not MainMod.LoginInfo.Yetkiler[143] then
    begin
      MessageDlg('Silmek istedi�iniz duyuru Grup Geneli i�in yap�lm�� bir duyuru. Bu duyuruyu silme yetkiniz yok.', mtInformation, [mbOk]);
      Exit;
    end;
  end;

  MessageDlg('Se�ili duyuruyu silmek istedi�inizden emin misiniz?'#13, mtConfirmation, mbYesNo, DeleteControl);
end;

procedure TfrDuyuruListe.actEditExecute(Sender: TObject);
begin
  // to do : Burada de�i�tirilecek olan duyurunun kapsam�na bak�lacak
  // E�er Global (Genel) Duyuru ise uyar� verdirilecek ve de�i�tirilemeyecek

  if qDuyuru.FieldByName('mc_id').AsInteger = 0 then // Grup Duyurusu
  begin
    if not MainMod.LoginInfo.Yetkiler[143] then
    begin
      MessageDlg('De�i�tirmek istedi�iniz duyuru Grup Geneli i�in yap�lm�� bir duyuru. Bu duyuruyu de�i�tirme yetkiniz yok.', mtInformation, [mbOk]);
      Exit;
    end;
  end;

  if frmDuyuruTanim.Exec(qDuyuru.FieldByName('id').AsInteger, 1) = mrOk then RefreshQuery(qDuyuru);
  ManageSettings;
end;

procedure TfrDuyuruListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrDuyuruListe.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('DuyuruListe');
end;

procedure TfrDuyuruListe.DeleteControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;
  qDuyuru.Delete;
  ManageSettings;
end;

procedure TfrDuyuruListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrDuyuruListe.edSrcTypeChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrDuyuruListe.ManageSettings;
begin
  actAdd.Enabled    := (MainMod.LoginInfo.Yetkiler[143] or MainMod.LoginInfo.Yetkiler[144]) and (qDuyuru.State = dsBrowse);
  actEdit.Enabled   := MainMod.LoginInfo.Yetkiler[145] and (qDuyuru.FieldByName('id').AsInteger > 0);
  actDelete.Enabled := MainMod.LoginInfo.Yetkiler[146] and (qDuyuru.FieldByName('id').AsInteger > 0);

  actClose.Enabled  := not DataEditing(qDuyuru);

  {
  143-Grup Duyurusu Ekleme
  144-Kurum Duyurusu Ekleme
  145-Duyurular� De�i�tirme
  146-Duyurular� Silme
  }
end;

procedure TfrDuyuruListe.NewSQL;
var
	SQLStr,
	WhereStr : string;
  srctext : string;
begin

  if not GuvenliGirisMi(edSrcText.Text) then
  begin
    MessageDlg('Ge�ersiz giri�! L�tfen �zel karakterler veya SQL komutlar� kullanmay�n.',mtConfirmation,[mbYes]) ;
    exit;
  end;

	SQLStr   := 'SELECT * FROM sys_news ';

	WhereStr 	:= '((mc_id =:mc_id) OR (mc_id = 0 AND gc_id =:gc_id)) AND ';
  if edSrcText.Text <> '' then
  begin
    if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
    WhereStr := WhereStr + ' ((title LIKE :srctext) OR (description LIKE :srctext )) AND ';
  end;

  if Trim(WhereStr) <> '' then System.Delete(WhereStr, Length(WhereStr) - 3, 4);
  if Trim(WhereStr) <> '' then SQLStr := SQLStr + 'WHERE ' + WhereStr;
  SQLStr := SQLStr + ' ORDER BY id';

//	QueryOpen(qDuyuru, SQLStr);
  qDuyuru.SQL.Text := sqlstr;
  qDuyuru.ParamByName('mc_id').AsString := inttostr(mainmod.MCID);
  qDuyuru.ParamByName('gc_id').AsString := inttostr(mainmod.GCID);
  if qDuyuru.FindParam('srctext') <> nil then
    qDuyuru.ParamByName('srctext').AsString := srctext;

  qDuyuru.Open;
  ManageSettings;
  lbKayitSayisi.Text := IntToStr(qDuyuru.RecordCount) + ' Kay�t Listelendi...';
end;

procedure TfrDuyuruListe.pnlTopAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
var
  Base : Integer;
  NewW : Integer;
begin
  if EventName = 'doResize' then
  begin
    Base := pnlTop.Width - 125;
    NewW := Trunc(Base * 0.3);
    if NewW < 200 then NewW := 200;
    grdList.Columns[1].Width := NewW;
    NewW := Trunc(Base * 0.7);
    if NewW < 400 then NewW := 400;
    grdList.Columns[2].Width := NewW;
  end;
end;

procedure TfrDuyuruListe.grdListColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  qDuyuru.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrDuyuruListe.grdListDblClick(Sender: TObject);
begin
  frmDuyuruDetay.Exec(qDuyuru.FieldByName('id').AsInteger);
end;

procedure TfrDuyuruListe.UniFrameCreate(Sender: TObject);
begin
  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;
end;

initialization
  RegisterClass(TfrDuyuruListe);

end.
