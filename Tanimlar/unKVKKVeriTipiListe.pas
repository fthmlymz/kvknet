unit unKVKKVeriTipiListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniBasicGrid, uniDBGrid, uniButton, uniBitBtn, uniEdit, uniMultiItem,
  uniComboBox, uniLabel, uniGUIBaseClasses, uniPanel, System.Actions, Vcl.ActnList, uniSplitter, Data.DB,
  DBAccess, Uni, MemDS;

type
  TfrKVKKVeriTipiListe = class(TUniFrame)
    ActList: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actClose: TAction;
    pnlButtons: TUniPanel;
    btnAdd: TUniBitBtn;
    btnEdit: TUniBitBtn;
    btnDelete: TUniBitBtn;
    btnClose: TUniBitBtn;
    UniPanel1: TUniPanel;
    grdMain: TUniDBGrid;
    grdDetail: TUniDBGrid;
    UniPanel2: TUniPanel;
    UniPanel3: TUniPanel;
    UniSplitter1: TUniSplitter;
    qMain: TUniQuery;
    dsMain: TUniDataSource;
    dsVeriTipi: TUniDataSource;
    btnExcel: TUniBitBtn;
    actExcel: TAction;
    btnHelp: TUniBitBtn;
    procedure UniFrameCreate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure qMainAfterScroll(DataSet: TDataSet);
    procedure pnlButtonsAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure grdMainColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure grdDetailColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure actExcelExecute(Sender: TObject);
    procedure grdDetailDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
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

uses MainModule, McMLib, Main, unKVKKVeriTipiTanim, unHelpPage;

procedure TfrKVKKVeriTipiListe.actAddExecute(Sender: TObject);
begin
  if frmKVKKVeriTipiTanim.Insert(qMain.FieldByName('id').AsInteger, qMain.FieldByName('kategori').AsString) = mrOk then
     RefreshQuery(MainMod.qVeriTipi);
  ManageSettings;
end;

procedure TfrKVKKVeriTipiListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrKVKKVeriTipiListe.actDeleteExecute(Sender: TObject);
begin
  MessageDlg('Seçili veri tipi tanýmýný silmek istediðinizden emin misiniz?'#13, mtConfirmation, mbYesNo, DeleteControl);
end;

procedure TfrKVKKVeriTipiListe.actEditExecute(Sender: TObject);
begin
  if frmKVKKVeriTipiTanim.Edit(qMain.FieldByName('id').AsInteger, qMain.FieldByName('kategori').AsString) = mrOk then RefreshQuery(MainMod.qVeriTipi);
  ManageSettings;
end;

procedure TfrKVKKVeriTipiListe.actExcelExecute(Sender: TObject);
begin
  if MainMod.qVeriTipi.RecordCount < 1 then Exit;
  MainMod.DownloadDataSetToXls(grdDetail, 'Veri Tipi Listesi', 'Tanimlar_Veri_Tipleri.xlsx');
end;

procedure TfrKVKKVeriTipiListe.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('KVKKVeriTipiListe');
end;

procedure TfrKVKKVeriTipiListe.DeleteControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  if MainMod.CheckUsedID('data_envanter', 'veritipi_id', MainMod.qVeriTipi.FieldByName('id').AsString) then
  begin
    MessageDlg('Bu veri tipi tanýmý envanter kayýtlarýnda kullanýlýyor. Silemezsiniz.', mtError, [mbOk]);
    Exit;
  end;

  MainMod.qVeriTipi.Delete;
  ManageSettings;
end;

procedure TfrKVKKVeriTipiListe.grdDetailColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  MainMod.qVeriTipi.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrKVKKVeriTipiListe.grdDetailDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
  Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if Column.FieldName = 'veri_tipi' then
  begin
    if grdDetail.DataSource.DataSet.FieldByName('nitelik').AsString = 'ON' then
    begin
      Attribs.Font.Style := [fsBold];
      Attribs.Font.Color := clMaroon;
    end;
  end;
end;

procedure TfrKVKKVeriTipiListe.grdMainColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  qMain.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrKVKKVeriTipiListe.ManageSettings;
begin
  actAdd.Enabled    := MainMod.LoginInfo.Yetkiler[77] and (MainMod.qVeriTipi.State = dsBrowse);
  actEdit.Enabled   := MainMod.LoginInfo.Yetkiler[78] and (MainMod.qVeriTipi.State = dsBrowse) and (MainMod.qVeriTipi.FieldByName('id').AsInteger > 0);
  actDelete.Enabled := MainMod.LoginInfo.Yetkiler[79] and (MainMod.qVeriTipi.State = dsBrowse) and (MainMod.qVeriTipi.FieldByName('id').AsInteger > 0);

  actClose.Enabled  := not DataEditing(MainMod.qVeriTipi);
end;

procedure TfrKVKKVeriTipiListe.NewSQL;
begin
	QueryOpen(MainMod.qVeriTipi, 'SELECT * FROM def_data_veritipi WHERE mc_id = ' + IntToStr(MainMod.MCID) +
                       ' AND md_id = ' + qMain.FieldByName('id').AsString + ' ORDER BY veri_tipi');
  ManageSettings;
end;

procedure TfrKVKKVeriTipiListe.pnlButtonsAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
var
  Base : Integer;
  NewW : Integer;
begin
  if EventName = 'doResize' then
  begin
    Base := pnlButtons.Width - 25;
    NewW := Trunc(Base * 0.4);
    if NewW < 300 then NewW := 300;
    grdDetail.Columns[0].Width := NewW;
    NewW := Trunc(Base * 0.6);
    if NewW < 400 then NewW := 400;
    grdDetail.Columns[1].Width := NewW;
  end;
end;

procedure TfrKVKKVeriTipiListe.qMainAfterScroll(DataSet: TDataSet);
begin
  if DataLoading then Exit;

  NewSQL;
  ManageSettings;
end;

procedure TfrKVKKVeriTipiListe.UniFrameCreate(Sender: TObject);
begin
  DataLoading := True;
  QueryOpen(qMain, 'SELECT * FROM def_data_kategori WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY kategori');
  DataLoading := False;
  NewSQL;
  ManageSettings;
  grdMain.SetFocus;
end;

initialization
  RegisterClass(TfrKVKKVeriTipiListe);

end.
