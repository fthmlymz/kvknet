unit unAydinlatmaSablonTopluIslem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, DateUtils,
  uniGUIClasses, uniGUIForm, Data.DB, DBAccess, Uni, MemDS, uniPanel, uniButton, uniBitBtn, uniEdit,
  uniMemo, uniDBMemo, uniDBEdit, uniLabel, uniGUIBaseClasses, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniGroupBox, uniRadioGroup, uniDBRadioGroup,
  uniBasicGrid, uniDBGrid, VirtualTable, uniDateTimePicker, uniDBNavigator,
  uniFileUpload, System.RegularExpressions, FlexCel.XlsAdapter;

type
  TfrmAydinlatmaSablonTopluIslem = class(TUniForm)
    qTmp: TUniQuery;
    tblImport: TVirtualTable;
    dsImport: TUniDataSource;
    FileUp: TUniFileUpload;
    qAYD: TUniQuery;
    pnlExcelImport: TUniContainerPanel;
    grd: TUniDBGrid;
    UniPanel1: TUniPanel;
    UniDBNavigator1: TUniDBNavigator;
    pnlImportButtons: TUniPanel;
    btnCancel: TUniBitBtn;
    btnSablonIndir: TUniBitBtn;
    btnYukle: TUniBitBtn;
    btnAdd: TUniBitBtn;
    qKisi: TUniQuery;
    procedure btnCancelClick(Sender: TObject);
    procedure grdColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure tblImportBeforePost(DataSet: TDataSet);
    procedure btnSablonIndirClick(Sender: TObject);
    procedure btnYukleClick(Sender: TObject);
    procedure FileUpCompleted(Sender: TObject; AStream: TFileStream);
    procedure btnAddClick(Sender: TObject);
    procedure grdDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure UniFormBeforeShow(Sender: TObject);
  private
    aydID,
    kisiID       : Integer;
    Aydlist,
    kisiList     : TStringList;
    id_tur       : String;
    islem        : String;
    beforePostCheck: boolean;
    procedure ProcessExcel(xlsxfile: string);
    function CheckImportTbl: boolean;
    function CheckImportRow: boolean;
  protected
  public
    function ExecImport: Integer;
  end;

function frmAydinlatmaSablonTopluIslem: TfrmAydinlatmaSablonTopluIslem;

implementation

uses uniGUIApplication, MainModule, McMLib, unErisimYetkiListe, ServerModule;

{$R *.dfm}

function frmAydinlatmaSablonTopluIslem: TfrmAydinlatmaSablonTopluIslem;
begin
  Result := TfrmAydinlatmaSablonTopluIslem(MainMod.GetFormInstance(TfrmAydinlatmaSablonTopluIslem));
end;


procedure TfrmAydinlatmaSablonTopluIslem.btnAddClick(Sender: TObject);
var
  sCount : String;
  iCount : Integer;
  MCID   : Integer;
begin

  if tblImport.RecordCount < 1 then Exit;
  
  if MainMod.MCType = 0 then MCID := 0 else MCID := MainMod.MCID;

  queryOpen(qAYD, 'SELECT * FROM def_data_aydinlatma WHERE id=0 and mc_id=' + IntToStr(mainmod.MCID));

  beforepostcheck := false;
  tblImport.First;
  while not tblImport.Eof do
  begin
    if tblImport.FieldByName('islemdurum').AsString <> 'I' then
    begin
      tblImport.Next;
      continue;
    end;
    qAYD.Insert;
    qAYD.FieldByName('id').AsInteger         := MainMod.GetSeq('sq_def_data_aydinlatma_id');
    qAYD.FieldByName('mc_id').AsInteger      := MainMod.MCID;
    qAYD.FieldByName('idy').AsInteger        := MainMod.LoginInfo.ID;
    qAYD.FieldByName('idt').AsDateTime       := Now;
    qAYD.FieldByName('sdy').AsInteger        := MainMod.LoginInfo.ID;
    qAYD.FieldByName('sdt').AsDateTime       := Now;
    qAYD.FieldByName('durum').AsString       := tblImport.FieldByName('durum').AsString;
    qAYD.FieldByName('acik_riza').AsString   := tblImport.FieldByName('acik_riza').AsString;
    qAYD.FieldByName('iys_var').AsString     := tblImport.FieldByName('iys_var').AsString;
    qAYD.FieldByName('kisi_id').AsString     := tblImport.FieldByName('kisi_id').AsString;
    qAYD.FieldByName('tanim').AsString       := tblImport.FieldByName('tanim').AsString;
    qAYD.FieldByName('description').AsString := tblImport.FieldByName('description').AsString;
    qAYD.FieldByName('aguid').AsString       := MainMod.NewGuid;
    qAYD.Post;
    tblImport.Edit;
    tblImport.FieldByName('islemdurum').AsString := 'E';
    tblImport.FieldByName('islemmesaj').AsString := 'Aydýnlatma Þablonu eklendi.';
    tblImport.Next;
  end;
  beforepostcheck := true;
end;

procedure TfrmAydinlatmaSablonTopluIslem.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrClose;
end;

procedure TfrmAydinlatmaSablonTopluIslem.btnSablonIndirClick(Sender: TObject);
begin
    UniSession.SendFile(ServerMod.FilesFolderPath + 'temp_xls\Aydinlatma_Toplu_Ekleme_Sablonu.xlsx', 'Aydinlatma_Toplu_Ekleme_Sablonu.xlsx');
end;

procedure TfrmAydinlatmaSablonTopluIslem.btnYukleClick(Sender: TObject);
begin
  FileUp.Execute;
end;

function TfrmAydinlatmaSablonTopluIslem.CheckImportTbl: boolean;
var
  regEx: TRegEx;
  match: TMatch;
begin
  result := true;
  beforepostcheck := false;

  QueryOpen(qKisi, 'SELECT DISTINCT env.kisi_id, ks.kisi ' +
                   'FROM data_envanter env ' +
                   '  LEFT JOIN def_data_kisi ks ON ks.id = env.kisi_id ' +
                   'WHERE env.active = ''E'' AND env.mc_id = ' +
                   IntToStr(MainMod.MCID) + ' ORDER BY 2');

  tblImport.First;
  while not tblImport.Eof do
  begin
    if tblImport.FieldByName('islemdurum').AsString = 'E' then
    begin
      tblImport.Next;
      continue;
    end;

    tblImport.edit;
    tblImport.FieldByName('islemdurum').AsString := 'I';
    tblImport.FieldByName('islemmesaj').AsString := 'Bilgiler tam ve uygun.';

    if tblImport.FieldByName('tanim').AsString = '' then
    begin
      tblImport.FieldByName('islemdurum').AsString := 'H';
      tblImport.FieldByName('islemmesaj').AsString := 'Taným boþ olamaz.';
    end
    else
    if Pos(','+tblImport.FieldByName('durum').AsString+',', ',YAYINDA,ÝNCELEMEDE,PASÝF,') <= 0 then

    begin
      tblImport.FieldByName('islemdurum').AsString := 'H';
      tblImport.FieldByName('islemmesaj').AsString := 'Durum "YAYINDA,ÝNCELEMEDE,PASÝF" seçeneklerinden biri olmalýdýr.';
    end
    else
    if Pos(','+tblImport.FieldByName('acik_riza').AsString+',', ',E,H,') <= 0 then
    begin
      tblImport.FieldByName('islemdurum').AsString := 'H';
      tblImport.FieldByName('islemmesaj').AsString := 'Açýk Rýza "E,H" seçeneklerinden biri olmalýdýr.';
    end
    else
    if Pos(','+tblImport.FieldByName('iys_var').AsString+',', ',E,H,') <= 0 then
    begin
      tblImport.FieldByName('islemdurum').AsString := 'H';
      tblImport.FieldByName('islemmesaj').AsString := 'ÝYS "E,H" seçeneklerinden biri olmalýdýr.';
    end;

    if qKisi.Locate('kisi', tblImport.FieldByName('ilgili_kisi').AsString, [loCaseInsensitive]) then
    begin
      QueryOpen(MainMod.qTmp, 'SELECT COUNT(id) FROM def_data_aydinlatma WHERE durum in (''YAYINDA'', ''ÝNCELEMEDE'',''PASÝF'') and mc_id = ' +
                            IntToStr(MainMod.MCID) +
                            ' AND kisi_id=' + qKisi.FieldByName('kisi_id').AsString);
      if MainMod.qTmp.Fields[0].AsInteger > 0 then
      begin
        tblImport.FieldByName('islemdurum').AsString := 'H';
        tblImport.FieldByName('islemmesaj').AsString := 'Ýlgili kiþi farklý bir aydýnlatma metni tanýmýnda kaydedilmiþtir.';
      end;
      tblImport.FieldByName('kisi_id').AsInteger := qKisi.FieldByName('kisi_id').AsInteger;
    end
    else
    begin
      tblImport.FieldByName('islemdurum').AsString := 'H';
      tblImport.FieldByName('islemmesaj').AsString := 'Ýlgili kiþi, Envanter listesinde geçen kiþi listesinden olmalýdýr.';
    end;

    result := result and (tblImport.FieldByName('islemdurum').AsString <> 'H');
    tblImport.post;
    tblImport.Next;
  end;
  beforepostcheck := true;
end;

function TfrmAydinlatmaSablonTopluIslem.CheckImportRow: boolean;
var
  regEx: TRegEx;
  match: TMatch;
begin
  if tblImport.FieldByName('islemdurum').AsString = 'E' then exit;

  tblImport.FieldByName('islemdurum').AsString := 'I';
  tblImport.FieldByName('islemmesaj').AsString := 'Bilgiler tam ve uygun.';

  if tblImport.FieldByName('tanim').AsString = '' then
  begin
    tblImport.FieldByName('islemdurum').AsString := 'H';
    tblImport.FieldByName('islemmesaj').AsString := 'Taným boþ olamaz.';
  end
  else
  if Pos(','+tblImport.FieldByName('durum').AsString+',', ',YAYINDA,ÝNCELEMEDE,PASÝF,') <= 0 then

  begin
    tblImport.FieldByName('islemdurum').AsString := 'H';
    tblImport.FieldByName('islemmesaj').AsString := 'Durum "YAYINDA,ÝNCELEMEDE,PASÝF" seçeneklerinden biri olmalýdýr.';
  end
  else
  if Pos(','+tblImport.FieldByName('acik_riza').AsString+',', ',E,H,') <= 0 then
  begin
    tblImport.FieldByName('islemdurum').AsString := 'H';
    tblImport.FieldByName('islemmesaj').AsString := 'Açýk Rýza "E,H" seçeneklerinden biri olmalýdýr.';
  end
  else
  if Pos(','+tblImport.FieldByName('iys_var').AsString+',', ',E,H,') <= 0 then
  begin
    tblImport.FieldByName('islemdurum').AsString := 'H';
    tblImport.FieldByName('islemmesaj').AsString := 'ÝYS "E,H" seçeneklerinden biri olmalýdýr.';
  end;

  if qKisi.Locate('kisi', tblImport.FieldByName('ilgili_kisi').AsString, [loCaseInsensitive]) then
  begin
    QueryOpen(MainMod.qTmp, 'SELECT COUNT(id) FROM def_data_aydinlatma WHERE durum in (''YAYINDA'', ''ÝNCELEMEDE'') and mc_id = ' +
                          IntToStr(MainMod.MCID) +
                          ' AND kisi_id=' + qKisi.FieldByName('kisi_id').AsString);
    if MainMod.qTmp.Fields[0].AsInteger > 0 then
    begin
      tblImport.FieldByName('islemdurum').AsString := 'H';
      tblImport.FieldByName('islemmesaj').AsString := 'Ýlgili kiþi farklý bir aydýnlatma metni tanýmýnda kaydedilmiþtir.';
    end;

    tblImport.FieldByName('kisi_id').AsInteger := qKisi.FieldByName('kisi_id').AsInteger;
  end
  else
  begin
    tblImport.FieldByName('islemdurum').AsString := 'H';
    tblImport.FieldByName('islemmesaj').AsString := 'Ýlgili kiþi, Envanter listesinde geçen kiþi listesinden olmalýdýr.';
  end;



  result := (tblImport.FieldByName('islemdurum').AsString = 'I');
end;

function TfrmAydinlatmaSablonTopluIslem.ExecImport: Integer;
begin
  islem := 'ExcelImport';

  grd.DataSource := dsImport;
  pnlImportButtons.visible := true;
  ShowModal;
end;

procedure TfrmAydinlatmaSablonTopluIslem.FileUpCompleted(Sender: TObject;
  AStream: TFileStream);
var
  TmpName: String;
  fileExt: String;
  FS     : TFileStream;
  FUrl   : String;
begin
  try
    fileExt := UpperCase(ExtractFileExt(FileUp.FileName));
    if Pos(','+fileExt+',', ',.XLSX,') <= 0 then
    begin
      MessageDlg('Sadece saðlanan Excel þablonunu yükleyebilirsiniz.', mtInformation, [mbOk]);
      exit;
    end;

    TmpName := ServerMod.NewCacheFileUrl(False, 'XLSX', '', '', FUrl, True);
    fs := TFileStream.Create(tmpname, fmCreate);
    fs.CopyFrom(fileup.Stream, fileup.Stream.size);
    fs.Free;
    processExcel(tmpName);
  except
    raise;
  end;
end;

procedure TfrmAydinlatmaSablonTopluIslem.ProcessExcel(xlsxfile: string);
var
  x,
  y      : integer;
  durum       ,
  acik_riza   ,
  iys_var     ,
  ilgili_kisi ,
  tanim       ,
  aciklama     : String;
  kisi_id      : integer;

  cIndex       : integer;
  xls          : TXlsFile;
begin
  xls := TXlsFile.Create(false);
  XLS.Open(xlsxfile);
  xls.ActiveSheet := 1;

  if tblImport.State = dsInactive then
    tblImport.Open;

  tblImport.First;
  while not tblImport.EOF do
    tblImport.Delete;

  beforepostcheck := true;
  try

    for y := 2 to xls.RowCount do
    begin
//      for cIndex := 1 to Xls.ColCountInRow(r) do
      begin
//        x := Xls.ColFromIndex(y, cIndex);
        durum       := Xls.GetStringFromCell(y, 1);
        acik_riza   := Xls.GetStringFromCell(y, 2);
        iys_var     := Xls.GetStringFromCell(y, 3);
        ilgili_kisi := Xls.GetStringFromCell(y, 4);
        tanim       := Xls.GetStringFromCell(y, 5);
        aciklama    := Xls.GetStringFromCell(y, 6);

        tblImport.insert;
        tblImport.fieldbyname('durum').AsString       := tr_upper(durum);
        tblImport.fieldbyname('acik_riza').AsString   := tr_upper(acik_riza);
        tblImport.fieldbyname('iys_var').AsString     := tr_upper(iys_var);
        tblImport.fieldbyname('ilgili_kisi').AsString := tr_upper(ilgili_kisi);
        tblImport.fieldbyname('tanim').AsString       := tr_upper(tanim);
        tblImport.fieldbyname('description').AsString := tr_upper(aciklama);
        tblImport.fieldbyname('sirano').AsInteger     := y-1;
        tblImport.Post;
      end;
    end;

    except
    raise;
  end;

  if CheckImportTbl = false then
  begin
    MessageDlg('Bir veya daha fazla kayýtta hata bulunmaktadýr.'#13 +
               'Lütfen uyarý mesajlarýný kontrol ederek hatalý satýrlarý düzeltiniz.', mtError, [mbOk]);
    Exit;
  end;

end;

procedure TfrmAydinlatmaSablonTopluIslem.tblImportBeforePost(DataSet: TDataSet);
var
  REgEx: TRegEx;
  match: TMatch;
begin
  if beforepostcheck = false then exit;

  if islem = 'ExcelImport' then
    checkImportRow;
end;

procedure TfrmAydinlatmaSablonTopluIslem.UniFormBeforeShow(Sender: TObject);
begin
  QueryOpen(qKisi, 'SELECT DISTINCT env.kisi_id, ks.kisi ' +
                   'FROM data_envanter env ' +
                   '  LEFT JOIN def_data_kisi ks ON ks.id = env.kisi_id ' +
                   'WHERE env.active = ''E'' AND env.mc_id = ' +
                   IntToStr(MainMod.MCID));
end;

procedure TfrmAydinlatmaSablonTopluIslem.grdColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
begin
  if SameText(Column.FieldName, 'groupstr') then begin end;
end;

procedure TfrmAydinlatmaSablonTopluIslem.grdDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if column.FieldName = 'islemmesaj' then
  begin
    if grd.DataSource.DataSet.FieldByName('islemdurum').AsString = 'H' then
    begin
      Attribs.Color := clRed;
      Attribs.Font.Style := [fsBold];
    end
    else
    if grd.DataSource.DataSet.FieldByName('islemdurum').AsString = 'E' then
    begin
      Attribs.Color := clGreen;
      Attribs.Font.Style := [];
    end
    else
    begin
      Attribs.Color := clInfoBk;
      Attribs.Font.Style := [];
    end;
  end;

end;

end.
