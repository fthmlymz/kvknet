unit unRptYetkiMatrisi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniBasicGrid, uniDBGrid, Data.DB, DBAccess, Uni, MemDS,
  System.Actions, Vcl.ActnList, uniMultiItem, uniComboBox, uniLabel, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniPanel, VirtualTable, uniRadioGroup, uniGridExporters;

type
  TfrRptYetkiMatrisi = class(TUniFrame)
    pnlTop: TUniPanel;
    btnSearch: TUniBitBtn;
    btnClose: TUniBitBtn;
    UniBitBtn1: TUniBitBtn;
    ActList: TActionList;
    actSearch: TAction;
    actExcel: TAction;
    actClose: TAction;
    qErisim: TUniQuery;
    grdMatris: TUniDBGrid;
    tblMatris: TVirtualTable;
    qTmp: TUniQuery;
    dsMatris: TUniDataSource;
    UniLabel1: TUniLabel;
    edRapor: TUniComboBox;
    btnHelp: TUniBitBtn;
    procedure UniFrameCreate(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actExcelExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure grdMatrisColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure btnHelpClick(Sender: TObject);
    procedure edRaporChange(Sender: TObject);
  private
    procedure SetVisibleColumns;
    procedure AddDefaultFields;
    procedure AddTitleFields;
    procedure AddRows;

    procedure PrepareReport;
  public
  end;

implementation

{$R *.dfm}

uses MainModule, ServerModule, McMLib, Main, unHelpPage;

(*
function DataSetToXls(DbGrid: TUniDBGrid; Tile: string): string;
var
  xls: TXlsfile;
  Row: integer;
  Fmt: TFlxFormat;
  DateXF, DateTimeXF, FontSizeTitleXF, FontSizeDataXF,
    FontSizePageTitleXF: integer;
  file_name: string;
  ds: TDataSet;
  Alignment: THFlxAlignment;
  ColExcel, ColDbgrid: Integer;
  FName: String;
  TmpName: String;
  FUrl: String;
begin
  ds := DbGrid.DataSource.DataSet;

  xls := TXlsfile.Create(1, TExcelFileFormat.v2003, true);
  try
    Fmt := xls.GetDefaultFormat;
    Fmt.Font.Size20 := 280;
    Fmt.Font.Style := [TFlxFontStyles.Bold];
    Fmt.HAlignment := THFlxAlignment.center;
    FontSizeTitleXF := xls.AddFormat(Fmt);

    Fmt := xls.GetDefaultFormat;
    Fmt.Font.Size20 := 360;
    Fmt.Font.Style := [TFlxFontStyles.Bold];
    Fmt.HAlignment := THFlxAlignment.center;
    FontSizePageTitleXF := xls.AddFormat(Fmt);

    xls.SheetName := Tile;

    xls.MergeCells(1, 1, 1, DbGrid.Columns.Count + 1);
    xls.SetCellValue(1, 1, Tile, FontSizePageTitleXF);

    ds.First;
    Row := 2;

    xls.SetCellValue(Row, 1, 'No', FontSizeTitleXF);
    xls.SetColWidthInternal(ColExcel, 40);

    for ColDbgrid := 0 to DbGrid.Columns.Count - 1 do
    begin
      ColExcel := ColDbgrid + 2;
      xls.SetCellValue(Row, ColExcel, DbGrid.Columns.Items[ColDbgrid]
        .Title.Caption, FontSizeTitleXF);
      xls.SetColWidthInternal(ColExcel, DbGrid.Columns.Items[ColDbgrid]
        .Width * 35);
    end;

    Row := 3;
    while not ds.Eof do
    begin
      for ColDbgrid := 0 to DbGrid.Columns.Count - 1 do
      begin

        if DbGrid.Columns[ColDbgrid].Alignment = TAlignment.taLeftJustify then
          Alignment := THFlxAlignment.left
        else if DbGrid.Columns[ColDbgrid].Alignment = TAlignment.taCenter then
          Alignment := THFlxAlignment.center
        else if DbGrid.Columns[ColDbgrid].Alignment = TAlignment.taRightJustify
        then
          Alignment := THFlxAlignment.right
        else
          Alignment := THFlxAlignment.center;

        Fmt := xls.GetDefaultFormat;
        Fmt.Format := 'yyyy-mm-dd hh:MM:ss';
        Fmt.Font.Size20 := 240;
        Fmt.HAlignment := Alignment;
        DateTimeXF := xls.AddFormat(Fmt);

        Fmt := xls.GetDefaultFormat;
        Fmt.Format := 'yyyy-mm-dd';
        Fmt.Font.Size20 := 240;
        Fmt.HAlignment := Alignment;
        DateXF := xls.AddFormat(Fmt);

        Fmt := xls.GetDefaultFormat;
        Fmt.Font.Size20 := 240;
        Fmt.HAlignment := Alignment;
        FontSizeDataXF := xls.AddFormat(Fmt);

        if ColDbgrid = 0 then
        begin
          Fmt := xls.GetDefaultFormat;
          Fmt.Font.Size20 := 240;
          Fmt.HAlignment := THFlxAlignment.center;

          xls.SetCellValue(Row, 1, (Row - 2), xls.AddFormat(Fmt));
        end;

        ColExcel := ColDbgrid + 2;
        if ds.FieldList.IndexOf(DbGrid.Columns.Items[ColDbgrid].FieldName) = -1
        then
        begin
          xls.SetCellValue(Row, ColExcel, '', FontSizeDataXF);

          Continue;
        end;

        case ds.FieldByName(DbGrid.Columns.Items[ColDbgrid].FieldName)
          .DataType of
          TFieldType.ftDateTime:
            begin
              if ds.FieldByName(DbGrid.Columns.Items[ColDbgrid].FieldName).IsNull
              then
                xls.SetCellValue(Row, ColExcel, '')
              else
                xls.SetCellValue(Row, ColExcel,
                  ds.FieldByName(DbGrid.Columns.Items[ColDbgrid].FieldName)
                  .AsDateTime, DateTimeXF);

              xls.SetColWidthInternal(ColExcel, DbGrid.Columns.Items[ColDbgrid]
                .Width * 50);
            end;

          TFieldType.ftDate:
            begin
              if ds.FieldByName(DbGrid.Columns.Items[ColDbgrid].FieldName).IsNull
              then
                xls.SetCellValue(Row, ColExcel, '')
              else
                xls.SetCellValue(Row, ColExcel,
                  ds.FieldByName(DbGrid.Columns.Items[ColDbgrid].FieldName)
                  .AsDateTime, DateXF);

              xls.SetColWidthInternal(ColExcel, DbGrid.Columns.Items[ColDbgrid]
                .Width * 50);
            end;

        else
          begin
            xls.SetCellValue(Row, ColExcel,
              ds.FieldByName(DbGrid.Columns.Items[ColDbgrid].FieldName).Value,
              FontSizeDataXF);
          end;
        end;

      end;

      ds.Next;

      Inc(Row);
    end;
    // xls.SetCellValue(row+1,1,xls.RecalcExpression('=Sum(A3:A'+IntToStr(row)+')',False),FontSizePageTitleXF);

    xls.AutofitCol(1, DbGrid.Columns.Count + 1, False, 1.2);

    FName := Tile;
    FUrl := '';
    file_name := ServerMod.NewCacheFileUrl(False, 'xls', FName, '', FUrl, true);

    xls.Save(file_name);
    Result := file_name;
  finally
    xls.Free;
  end;
end;
*)

procedure TfrRptYetkiMatrisi.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrRptYetkiMatrisi.actExcelExecute(Sender: TObject);
begin
  //Tevfik-15-06-2023 14:19:30
  if tblMatris.Active = False then Exit;
  MainMod.DownloadDataSetToXls(grdMatris, 'Yetki Matrisi Raporu', 'Yetki Matrisi Raporu.xlsx');
end;

procedure TfrRptYetkiMatrisi.actSearchExecute(Sender: TObject);
begin
  PrepareReport;
end;

procedure TfrRptYetkiMatrisi.AddDefaultFields;
var
  ACol : TUniBaseDBGridColumn;
begin
  tblMatris.FieldDefs.Clear;
  grdMatris.Columns.Clear;

  tblMatris.FieldDefs.Add('kaynak_id', ftInteger);
  tblMatris.FieldDefs.Add('kisi_id'  , ftInteger);

  tblMatris.FieldDefs.Add('kaynak_str', ftString, 100);
  tblMatris.FieldDefs.Add('kisi_str', ftString, 100);

  ACol := grdMatris.Columns.Add;
  ACol.FieldName           := 'kisi_str';
  ACol.Title.Caption       := 'Kiþi Grubu';
  ACol.Width               := 300;
  ACol.Menu.MenuEnabled    := False;
  ACol.Menu.ColumnHideable := False;
  ACol.Locked              := True;
  ACol.DisplayMemo         := True;

  ACol := grdMatris.Columns.Add;
  ACol.FieldName           := 'kaynak_str';
  ACol.Title.Caption       := 'Veri Kaynaðý';
  ACol.Width               := 300;
  ACol.Menu.MenuEnabled    := False;
  ACol.Menu.ColumnHideable := False;
  ACol.Locked              := True;
  ACol.DisplayMemo         := True;
end;

procedure TfrRptYetkiMatrisi.AddRows;
var
  sTmp : String;
begin
  ShowMask('Lütfen bekleyiniz...');
  UniSession.Synchronize;
  QueryOpen(qTmp, 'SELECT env.kaynak_id, ky.kaynak AS kaynak_str, env.kisi_id, ks.kisi AS kisi_str ' +
                   'FROM data_envanter env ' +
                   '  LEFT JOIN def_data_kaynak ky ON env.kaynak_id = ky.id ' +
                   '  LEFT JOIN def_data_kisi ks ON env.kisi_id = ks.id ' +
                   'WHERE env.mc_id = ' + IntToStr(MAinMod.MCID) + ' ' +
                   'GROUP BY env.kaynak_id, ky.kaynak, env.kisi_id, ks.kisi ' +
                   'ORDER BY ks.kisi, ky.kaynak ');

  while not qTmp.EOF do
  begin
    tblMatris.Append;
    tblMatris.FieldByName('kaynak_id').AsInteger  := qTmp.FieldByName('kaynak_id').AsInteger;
    tblMatris.FieldByName('kisi_id').AsInteger    := qTmp.FieldByName('kisi_id').AsInteger;
    tblMatris.FieldByName('kaynak_str').AsString  := qTmp.FieldByName('kaynak_str').AsString;
    tblMatris.FieldByName('kisi_str').AsString    := qTmp.FieldByName('kisi_str').AsString;

    qErisim.Close;
    qErisim.ParamByName('pMCID').AsInteger := MainMod.MCID;
    qErisim.ParamByName('pKyID').AsInteger := qTmp.FieldByName('kaynak_id').AsInteger;
    qErisim.ParamByName('pKsID').AsInteger := qTmp.FieldByName('kisi_id').AsInteger;
    qErisim.Open;

      while not qErisim.EOF do
      begin
        sTmp := qErisim.FieldByName('title_id').AsString;
        sTmp := qErisim.FieldByName('permf').AsString;

        if sTmp = 'YOK' then sTmp := '';

        tblMatris.FieldByName('permf_' + qErisim.FieldByName('title_id').AsString).AsString := sTmp;

        sTmp := qErisim.FieldByName('perms').AsString;

        if sTmp = 'YOK' then sTmp := '';

        tblMatris.FieldByName('perms_' + qErisim.FieldByName('title_id').AsString).AsString := sTmp;

        qErisim.Next;
      end;

      tblMatris.Post;

    qTmp.Next;
  end;
  HideMask;
end;

procedure TfrRptYetkiMatrisi.AddTitleFields;
var
  sTmp    : String;
  TitleID : String;
  ACol    : TUniBaseDBGridColumn;
  i       : Integer;
begin
  i := 0;
  while i <= grdMatris.Columns.Count - 1 do
  begin
    sTmp := grdMatris.Columns[i].FieldName;
    if Copy(sTmp, 1, 4) = 'perm' then grdMatris.Columns.Delete(i) else Inc(i);
  end;
  i := 0;
  while i <= tblMatris.FieldDefs.Count - 1 do
  begin
    sTmp := tblMatris.FieldDefs[i].Name;
    if Copy(sTmp, 1, 4) = 'perm' then tblMatris.FieldDefs.Delete(i) else Inc(i);
  end;

  QueryOpen(qTmp, 'SELECT t.id, t.title, t.dept_id, '+
                  ' (case when coalesce(d.main_dept_id,0) > 0 then d.title||'' (''||d_main.title||'') '' ' +
                  ' else d.title end) as dept_str ' +
//                  ' d.title as dept_str ' +
                  'FROM sys_titledef t ' +
                  '  LEFT JOIN sys_deptdef d ON d.id = t.dept_id ' +
                  '  LEFT JOIN sys_deptdef d_main ON d_main.id = d.main_dept_id ' +
                  'WHERE d.active = ''E'' AND d.mc_id = ' + IntToStr(MainMod.MCID) + ' ' +
                  'ORDER BY dept_str, title');

  while not qTmp.EOF do
  begin
    TitleID := qTmp.FieldByName('id').AsString;
    if TitleID = '' then TitleID := '0';

    tblMatris.FieldDefs.Add('permf_' + TitleID, ftString, 10);
    ACol := grdMatris.Columns.Add;
    ACol.FieldName           := 'permf_' + TitleID;
    ACol.Title.Caption       := 'Fiziksel';
    ACol.Width               := 200;
    ACol.Menu.MenuEnabled    := False;
    ACol.Menu.ColumnHideable := False;
    ACol.Alignment           := taCenter;
    ACol.GroupHeader         := qTmp.FieldByName('dept_str').AsString + ';' + qTmp.FieldByName('title').AsString;

    tblMatris.FieldDefs.Add('perms_' + TitleID, ftString, 10);
    ACol := grdMatris.Columns.Add;
    ACol.FieldName           := 'perms_' + TitleID;
    ACol.Title.Caption       := 'Dijital';
    ACol.Width               := 200;
    ACol.Menu.MenuEnabled    := False;
    ACol.Menu.ColumnHideable := False;
    ACol.Alignment           := taCenter;
    ACol.GroupHeader         := qTmp.FieldByName('dept_str').AsString + ';' + qTmp.FieldByName('title').AsString;

    qTmp.Next;
  end;
end;

procedure TfrRptYetkiMatrisi.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('RptYetkiMatrisi');
end;

procedure TfrRptYetkiMatrisi.edRaporChange(Sender: TObject);
begin
  PrepareReport;
end;

procedure TfrRptYetkiMatrisi.grdMatrisColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
begin
  if SameText(Column.FieldName, 'kisi_id') then begin end;
end;

procedure TfrRptYetkiMatrisi.PrepareReport;
begin
  grdMatris.BeginUpdate;
  tblMatris.DisableControls;
  if tblMatris.Active then
  begin
     tblMatris.First;
     while not tblMatris.EOF do tblMatris.Delete;
  end;

  tblMatris.Close;
  //AddDefaultFields;
  AddTitleFields;
  tblMatris.Open;
  AddRows;
  tblMatris.First;
  tblMatris.EnableControls;
  SetVisibleColumns;
  grdMatris.EndUpdate;
end;

procedure TfrRptYetkiMatrisi.SetVisibleColumns;
var
  sTmp  : String;
  FName : String;
  i: Integer;
  ACol  : TUniBaseDBGridColumn;
begin
  grdMatris.BeginUpdate;
  for i := 0 to grdMatris.Columns.Count - 1 do grdMatris.Columns[i].Visible := True;

  case edRapor.ItemIndex of
    0 : begin grdMatris.EndUpdate; Exit; end; // Hepsi
    1 : sTmp := 's'; // Fiziksel rapor... Dijital'i gizle
    2 : sTmp := 'f'; // Dijital rapor... Fiziksel'i gizle
  end;

  for i := 0 to grdMatris.Columns.Count - 1 do
  begin
    ACol := grdMatris.Columns[i];
    FName := ACol.FieldName;
    if Copy(FName, 1, 5) = 'perm' + sTmp then ACol.Visible := False;
  end;
  grdMatris.EndUpdate;
end;

procedure TfrRptYetkiMatrisi.UniFrameCreate(Sender: TObject);
begin
  edRapor.ItemIndex := 0;
end;

initialization
  RegisterClass(TfrRptYetkiMatrisi);

end.
