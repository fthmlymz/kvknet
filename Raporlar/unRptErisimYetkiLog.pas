unit unRptErisimYetkiLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, DateUtils,
  uniGUIClasses, uniGUIForm, Data.DB, DBAccess, Uni, MemDS, uniPanel, uniButton, uniBitBtn, uniEdit,
  uniMemo, uniDBMemo, uniDBEdit, uniLabel, uniGUIBaseClasses, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniGroupBox, uniRadioGroup, uniDBRadioGroup,
  uniBasicGrid, uniDBGrid, VirtualTable, uniDateTimePicker;

type
  TRptErisimYetkiLog = class(TUniForm)
    pnlButtons: TUniPanel;
    btnCancel: TUniBitBtn;
    qDept: TUniQuery;
    qTitle: TUniQuery;
    qTmp: TUniQuery;
    dsRapor: TUniDataSource;
    pnlLog: TUniContainerPanel;
    grd: TUniDBGrid;
    qKurum: TUniQuery;
    qKaynak: TUniQuery;
    qkisi: TUniQuery;
    dsDept: TUniDataSource;
    dsTitle: TUniDataSource;
    dsKisi: TUniDataSource;
    dsKaynak: TUniDataSource;
    pnlAra: TUniPanel;
    UniLabel1: TUniLabel;
    cbAraKisi: TUniComboBox;
    UniLabel2: TUniLabel;
    cbAraKaynak: TUniComboBox;
    UniLabel3: TUniLabel;
    edAraTarih1: TUniDateTimePicker;
    edAraTarih2: TUniDateTimePicker;
    btnPrepare: TUniBitBtn;
    tblRapor: TVirtualTable;
    UniLabel4: TUniLabel;
    btnHelp: TUniBitBtn;
    UniBitBtn1: TUniBitBtn;
    procedure btnPrepareClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure grdDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure grdColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure UniFormCreate(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    AccessID,
    kaynakID,
    kisiID       : Integer;
    KaynakIDlist,
    kisiIdList   : TStringList;
    procedure PrepareReport;
    function KurumGetir(aId: String): String;
    function KaynakGetir(aId: String): String;
    function KisiGetir(aId: String): String;
    function DepartmanGetir(aId: String): String;
    function UnvanGetir(aId: String): String;
  public
    function Exec(v_AccessID, v_KaynakID, v_KisiID: Integer): Integer;
  end;

function RptErisimYetkiLog: TRptErisimYetkiLog;

implementation

uses uniGUIApplication, MainModule, McMLib, unErisimYetkiListe, unHelpPage;

{$R *.dfm}

function RptErisimYetkiLog: TRptErisimYetkiLog;
begin
  Result := TRptErisimYetkiLog(MainMod.GetFormInstance(TRptErisimYetkiLog));
end;


procedure TRptErisimYetkiLog.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrClose;
end;

procedure TRptErisimYetkiLog.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('ErisimYetkiLog');
end;

procedure TRptErisimYetkiLog.btnPrepareClick(Sender: TObject);
begin
  PrepareReport;
end;

function TRptErisimYetkiLog.DepartmanGetir(aId: String): String;
begin
  Result := '';
  if (AID = '0') or (AID = '') then Exit;
  if qDept.State = dsInactive then
    qDept.Open;
  if qDept.Locate('id', aId, [loCaseInsensitive]) then
    Result := qDept.FieldByName('title').AsString;
end;

function TRptErisimYetkiLog.Exec(v_AccessID, v_KaynakID, v_KisiID: Integer): Integer;
begin
  //TODO: loglara eriþim yetkilendirme yapýlacak
  accessId := v_AccessID;
  kaynakId := v_kaynakID;
  kisiID   := v_kisiID;

  if (accessId=0) and (kaynakid=0) and (kisiid=0) then
  begin
    pnlAra.visible := true;
    grd.Columns[5].visible := true;
    grd.Columns[6].Visible := true;
  end;

  Result := ShowModal;

end;



function TRptErisimYetkiLog.KaynakGetir(aId: String): String;
begin
  Result := '';
  if (AID = '0') or (AID = '') then Exit;
  if qKaynak.State = dsInactive then
    qKaynak.Open;
  if qKaynak.Locate('id', aId, [loCaseInsensitive]) then
    Result := qKaynak.FieldByName('kaynak').AsString;
end;

function TRptErisimYetkiLog.KisiGetir(aId: String): String;
begin
  Result := '';
  if (AID = '0') or (AID = '') then Exit;
  if qkisi.State = dsInactive then
    qkisi.Open;
  if qkisi.Locate('id', aId, [loCaseInsensitive]) then
    Result := qkisi.FieldByName('kisi').AsString;
end;

function TRptErisimYetkiLog.KurumGetir(aId: String): String;
begin
  Result := '';
  if (AID = '0') or (AID = '') then Exit;
  if qKurum.State = dsInactive then
    qKurum.Open;
  if qKurum.Locate('id', aId, [loCaseInsensitive]) then
    Result := qKurum.FieldByName('title').AsString;
end;

procedure TRptErisimYetkiLog.PrepareReport;
var
  fltr: String;
  f1,f2,f3,f4,f5,f6:string;
  g1: string;
begin
  if tblRapor.State = dsInactive then
    tblRapor.Open;

  tblRapor.First;
  while not tblRapor.EOF do
    tblRapor.Delete;

  f1 := '';
  f2 := '';
  f3 := '';
  f4 := '';
  f5 := '';
  f6 := '';
  g1 := '';

  fltr := ' ';
  if pnlAra.Visible then
  begin
    fltr := fltr + ' and l.log_tarih >= to_timestamp(''' + formatdatetime('ddmmyyyyhhnnss', edAraTarih1.DateTime) + ''', ''DDMMYYYYHH24MISS'') ';
    fltr := fltr + ' and l.log_tarih <= to_timestamp(''' + formatdatetime('ddmmyyyyhhnnss', edAraTarih2.DateTime) + ''', ''DDMMYYYYHH24MISS'') ';

    if cbAraKisi.Text <> '' then
      fltr := fltr + ' and l.kisi_id = ' + kisiIDList[cbAraKisi.ItemIndex] + ' ';
    //if cbAraKaynak.ItemIndex > -1 then
    if cbAraKaynak.Text <>'' then
      fltr := fltr + ' and l.kaynak_id = ' + KaynakIDList[cbAraKaynak.ItemIndex] + ' ';
  end
  else
  begin
    if accessID > 0 then
      fltr := fltr + ' and l.id = ' + IntToStr(accessId) + ' ';
    if kaynakID > 0 then
      fltr := fltr + ' and l.kaynak_id = ' + IntToStr(kaynakId) + ' ';
    if kisiID > 0 then
      fltr := fltr + ' and l.kisi_id = ' + IntToStr(kisiId) + ' ';
  end;


//  ShowMask('Lütfen bekleyiniz...');
//  UniSession.Synchronize;
  QueryOpen(qTmp,  'SELECT l.* ' +
                   '    FROM kvknet_log.log_data_access l ' +
                   '    WHERE l.mc_id = ' + IntToStr(MainMod.MCID) + fltr +
                   '  ORDER BY l.dept_id, l.title_id, kaynak_id, kisi_id, l.log_tarih');

  while not qTmp.Eof do
  begin
    tblRapor.Insert;
    tblRapor.FieldByName('log_tarih').AsDateTime := qTmp.FieldByName('log_tarih').AsDateTime;
    tblRapor.FieldByName('log_islem').AsString := qTmp.FieldByName('log_islem').AsString;
    tblRapor.FieldByName('log_kullanici_id').AsInteger := qTmp.FieldByName('log_kullanici_id').AsInteger;
    tblRapor.FieldByName('log_kullanici_adi').AsString := MainMod.KullaniciGetir(qTmp.FieldByName('log_kullanici_id').AsString);
    tblRapor.FieldByName('log_kullanici_ip').AsString := qTmp.FieldByName('log_kullanici_ip').AsString;
    tblRapor.FieldByName('id').AsInteger := qTmp.FieldByName('id').AsInteger;
    tblRapor.FieldByName('mc_id').AsInteger := qTmp.FieldByName('mc_id').AsInteger;
    tblRapor.FieldByName('kaynak_id').AsInteger := qTmp.FieldByName('kaynak_id').AsInteger;
    tblRapor.FieldByName('kisi_id').AsInteger := qTmp.FieldByName('kisi_id').AsInteger;
    tblRapor.FieldByName('dept_id').AsInteger := qTmp.FieldByName('dept_id').AsInteger;
    tblRapor.FieldByName('title_id').AsInteger := qTmp.FieldByName('title_id').AsInteger;
    tblRapor.FieldByName('permf').AsString := qTmp.FieldByName('permf').AsString;
    tblRapor.FieldByName('perms').AsString := qTmp.FieldByName('perms').AsString;
    tblRapor.FieldByName('idy').AsString := MainMod.KullaniciGetir(qTmp.FieldByName('idy').AsString);
    tblRapor.FieldByName('idt').AsDateTime := qTmp.FieldByName('idt').AsDateTime;
    tblRapor.FieldByName('sdy').AsString := MainMod.KullaniciGetir(qTmp.FieldByName('sdy').AsString);
    tblRapor.FieldByName('sdt').AsDateTime := qTmp.FieldByName('idt').AsDateTime;
    tblRapor.FieldByName('kurum').AsString := KurumGetir(qTmp.FieldByName('mc_id').AsString);
    tblRapor.FieldByName('kaynak').AsString := KaynakGetir(qTmp.FieldByName('kaynak_id').AsString);
    tblRapor.FieldByName('kisi').AsString := KisiGetir(qTmp.FieldByName('kisi_id').AsString);
    tblRapor.FieldByName('departman').AsString := DepartmanGetir(qTmp.FieldbyName('dept_id').AsString);
    tblRapor.FieldByName('unvan').AsString := UnvanGetir(qTmp.FieldByName('title_id').AsString);

    if tblRapor.FieldByName('log_islem').AsString = 'I' then
      tblRapor.FieldByName('log_islem').AsString := 'EKLEME'
    else
    if tblRapor.FieldByName('log_islem').AsString = 'U' then
      tblRapor.FieldByName('log_islem').AsString := 'DEÐÝÞTÝRME'
    else
    if tblRapor.FieldByName('log_islem').AsString = 'D' then
      tblRapor.FieldByName('log_islem').AsString := 'SÝLME';

    tblRapor.FieldByName('groupstr').AsString := DepartmanGetir(qTmp.FieldbyName('dept_id').AsString) + ' - ' + UnvanGetir(qTmp.FieldByName('title_id').AsString);
    tblRapor.FieldByName('formatstr').AsString := '';
    if g1 = tblRapor.FieldByName('groupstr').AsString then
    begin
      if f1 <> tblRapor.FieldByName('kaynak_id').AsString then
        tblRapor.FieldByName('formatstr').AsString := tblRapor.FieldByName('formatstr').AsString + '1'
      else
        tblRapor.FieldByName('formatstr').AsString := tblRapor.FieldByName('formatstr').AsString + '0';
      if f2 <> tblRapor.FieldByName('kisi_id').AsString then
        tblRapor.FieldByName('formatstr').AsString := tblRapor.FieldByName('formatstr').AsString + '1'
      else
        tblRapor.FieldByName('formatstr').AsString := tblRapor.FieldByName('formatstr').AsString + '0';
      if f3 <> tblRapor.FieldByName('dept_id').AsString then
        tblRapor.FieldByName('formatstr').AsString := tblRapor.FieldByName('formatstr').AsString + '1'
      else
        tblRapor.FieldByName('formatstr').AsString := tblRapor.FieldByName('formatstr').AsString + '0';
      if f4 <> tblRapor.FieldByName('title_id').AsString then
        tblRapor.FieldByName('formatstr').AsString := tblRapor.FieldByName('formatstr').AsString + '1'
      else
        tblRapor.FieldByName('formatstr').AsString := tblRapor.FieldByName('formatstr').AsString + '0';
      if f5 <> tblRapor.FieldByName('permf').AsString then
        tblRapor.FieldByName('formatstr').AsString := tblRapor.FieldByName('formatstr').AsString + '1'
      else
        tblRapor.FieldByName('formatstr').AsString := tblRapor.FieldByName('formatstr').AsString + '0';
      if f6 <> tblRapor.FieldByName('perms').AsString then
        tblRapor.FieldByName('formatstr').AsString := tblRapor.FieldByName('formatstr').AsString + '1'
      else
        tblRapor.FieldByName('formatstr').AsString := tblRapor.FieldByName('formatstr').AsString + '0';
    end
    else
      tblRapor.FieldByName('formatstr').AsString := '000000';

    tblRapor.Post;

    g1 := tblRapor.FieldByName('groupstr').AsString;
    f1 := tblRapor.FieldByName('kaynak_id').AsString;
    f2 := tblRapor.FieldByName('kisi_id').AsString;
    f3 := tblRapor.FieldByName('dept_id').AsString;
    f4 := tblRapor.FieldByName('title_id').AsString;
    f5 := tblRapor.FieldByName('permf').AsString;
    f6 := tblRapor.FieldByName('perms').AsString;
    qTmp.Next;
  end;
//  HideMask;
end;

procedure TRptErisimYetkiLog.grdColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
begin
  if SameText(Column.FieldName, 'groupstr') then begin end;
end;

procedure TRptErisimYetkiLog.grdDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
var
  formatStr: string;
begin
  formatStr := grd.DataSource.DataSet.FieldByName('formatstr').AsString;
  if length(formatstr) < 6 then
    exit;
  if column.FieldName = 'permf' then
  begin
    if formatstr[5] = '1' then
    begin
      Attribs.Color := clSilver;
      Attribs.Font.Style := [fsBold];
    end;
  end;
  if column.FieldName = 'perms' then
  begin
    if formatstr[6] = '1' then
    begin
      Attribs.Color := clSilver;
      Attribs.Font.Style := [fsBold];
    end;
  end;
//  if (column.FieldName = 'kaynak_id') or (column.FieldName = 'kaynak') then
//  begin
//    if formatstr[1] = '1' then
//    begin
//      Attribs.Color := clSilver;
//      Attribs.Font.Style := [fsBold];
//    end;
//  end
//  else
//  if (column.FieldName = 'kisi_id') or (column.FieldName = 'kisi') then
//  begin
//    if formatstr[2] = '1' then
//    begin
//      Attribs.Color := clSilver;
//      Attribs.Font.Style := [fsBold];
//    end;
//  end
//  else
//  if (column.FieldName = 'dept_id') or (column.FieldName = 'departman') then
//  begin
//    if formatstr[3] = '1' then
//    begin
//      Attribs.Color := clSilver;
//      Attribs.Font.Style := [fsBold];
//    end;
//  end
//  else
//  if (column.FieldName = 'title_id') or (column.FieldName = 'unvan') then
//  begin
//    if formatstr[4] = '1' then
//    begin
//      Attribs.Color := clSilver;
//      Attribs.Font.Style := [fsBold];
//    end;
//  end
end;

procedure TRptErisimYetkiLog.UniBitBtn1Click(Sender: TObject);
begin
  if tblRapor.IsEmpty then
  begin
    MessageDlg('Kayýt Bulunamadý!',TMsgDlgType.mtConfirmation,[mbYes]);
    exit;
  end;
  ExportQueryToExcel(tblRapor,grd,'Eriþim Yetki Deðiþiklik Log Kayýtlarý.xls');
end;

procedure TRptErisimYetkiLog.UniFormAfterShow(Sender: TObject);
begin
  if  not ((accessId = 0) and (kaynakid = 0) and (kisiid = 0)) then
  begin
    PrepareReport;
  end
end;

procedure TRptErisimYetkiLog.UniFormCreate(Sender: TObject);
begin
  qkisi.Close;
  qkisi.ParamByName('mc_id').AsInteger := mainmod.MCID;
  qkisi.Open;
  qKaynak.Close;
  qKaynak.ParamByName('mc_id').AsInteger := mainmod.MCID;
  qKaynak.Open;
  qDept.Open;
  qTitle.Open;

  kisiIDList := TStringList.Create;
  cbAraKisi.Items.Clear;
  qKisi.First;
  while not qKisi.Eof do
  begin
    cbAraKisi.Items.Add(qKisi.fieldbyname('kisi').AsString);
    kisiIDList.Add(qKisi.fieldbyname('id').AsString);
    qKisi.Next;
  end;

  kaynakIDList := TStringList.Create;
  cbAraKaynak.Items.Clear;
  qKaynak.First;
  while not qKaynak.Eof do
  begin
    cbAraKaynak.Items.Add(qKaynak.fieldbyname('kaynak').AsString);
    kaynakIDList.Add(qKaynak.fieldbyname('id').AsString);
    qKaynak.Next;
  end;

  edAraTarih1.DateTime := startoftheDay(now);
  edAraTarih2.DateTime := endOfTheDay(now);
end;

function TRptErisimYetkiLog.UnvanGetir(aId: String): String;
begin
  Result := '';
  if (AID = '0') or (AID = '') then Exit;
  if qTitle.State = dsInactive then
    qTitle.Open;
  if qTitle.Locate('id', aId, [loCaseInsensitive]) then
    Result := qTitle.FieldByName('title').AsString;
end;

end.
