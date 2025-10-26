unit unRptLoginLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, DateUtils,
  uniGUIClasses, uniGUIForm, Data.DB, DBAccess, Uni, MemDS, uniPanel, uniButton, uniBitBtn, uniEdit,
  uniMemo, uniDBMemo, uniDBEdit, uniLabel, uniGUIBaseClasses, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniGroupBox, uniRadioGroup, uniDBRadioGroup,
  uniBasicGrid, uniDBGrid, VirtualTable, uniDateTimePicker;

type
  TRptLoginLog = class(TUniForm)
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
    dsDept: TUniDataSource;
    dsTitle: TUniDataSource;
    dsKisi: TUniDataSource;
    dsKaynak: TUniDataSource;
    pnlAra: TUniPanel;
    UniLabel3: TUniLabel;
    edAraTarih1: TUniDateTimePicker;
    edAraTarih2: TUniDateTimePicker;
    btnPrepare: TUniBitBtn;
    tblRapor: TVirtualTable;
    qkisi: TUniQuery;
    qKullanici: TUniQuery;
    UniLabel1: TUniLabel;
    btnHelp: TUniBitBtn;
    UniBitBtn1: TUniBitBtn;
    procedure btnPrepareClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure grdDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure grdColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure UniFormCreate(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    AccessID,
    kaynakID,
    kisiID       : Integer;
    KaynakIDlist,
    kisiIdList   : TStringList;
    procedure PrepareReport;
    function KurumGetir(aCode: String): String;
    function KullaniciGetir(aUserName, aCompCode: String): String;
    function KaynakGetir(aId: String): String;
    function KisiGetir(aId: String): String;
    function DepartmanGetir(aId: String): String;
    function UnvanGetir(aId: String): String;
  public
    function Exec(v_AccessID: Integer): Integer;
  end;

function RptLoginLog: TRptLoginLog;

implementation

uses uniGUIApplication, MainModule, McMLib, unErisimYetkiListe, unHelpPage;

{$R *.dfm}

function RptLoginLog: TRptLoginLog;
begin
  Result := TRptLoginLog(MainMod.GetFormInstance(TRptLoginLog));
end;


procedure TRptLoginLog.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrClose;
end;

procedure TRptLoginLog.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('RptLoginLog');
end;

procedure TRptLoginLog.btnPrepareClick(Sender: TObject);
var
  GunFarki : integer;
begin
  GunFarki := DaysBetween(edAraTarih2.DateTime, edAraTarih1.DateTime);

  if GunFarki >= 15 then
  begin

  end;
  PrepareReport;
end;

function TRptLoginLog.DepartmanGetir(aId: String): String;
begin
  Result := '';
  if (AID = '0') or (AID = '') then Exit;
  if qDept.State = dsInactive then
    qDept.Open;
  if qDept.Locate('id', aId, [loCaseInsensitive]) then
    Result := qDept.FieldByName('title').AsString;
end;

function TRptLoginLog.Exec(v_AccessID: Integer): Integer;
begin
  //TODO: loglara eriþim yetkilendirme yapýlacak
  accessId := v_AccessID;
//  PrepareReport;
  ShowModal;
end;



function TRptLoginLog.KaynakGetir(aId: String): String;
begin
  Result := '';
  if (AID = '0') or (AID = '') then Exit;
  if qKaynak.State = dsInactive then
    qKaynak.Open;
  if qKaynak.Locate('id', aId, [loCaseInsensitive]) then
    Result := qKaynak.FieldByName('kaynak').AsString;
end;

function TRptLoginLog.KisiGetir(aId: String): String;
begin
  Result := '';
  if (AID = '0') or (AID = '') then Exit;
  if qkisi.State = dsInactive then
    qkisi.Open;
  if qkisi.Locate('id', aId, [loCaseInsensitive]) then
    Result := qkisi.FieldByName('kisi').AsString;
end;

function TRptLoginLog.KullaniciGetir(aUserName, aCompCode: String): String;
begin
  Result := '';
  if (aUserName = '0') or (aUserName = '') then Exit;
  if (aCompCode = '0') or (aCompCode = '') then Exit;

  QueryOpen(qKurum, 'select code, id from sys_gcdef where code=''' + aCompCode + '''');
  if qKurum.FieldByName('code').AsString = aCompCode then
  begin
    QueryOpen(qKullanici, 'select user_name, full_name from usr_user where user_name=''' + aUserName + ''' and gc_id=' + qKurum.FieldByName('id').AsString);
    if qKullanici.FieldByName('user_name').AsString = aUserName then
      Result := qKullanici.FieldByName('full_name').AsString;
  end
  else
  begin
    QueryOpen(qKurum, 'select code, id from sys_mcdef where code=''' + aCompCode + '''');
    if qKurum.FieldByName('code').AsString = aCompCode then
    begin
      QueryOpen(qKullanici, 'select user_name, full_name from usr_user where user_name=''' + aUserName + ''' and mc_id=' + qKurum.FieldByName('id').AsString);
      if qKullanici.FieldByName('user_name').AsString = aUserName then
        Result := qKullanici.FieldByName('full_name').AsString;
    end;
  end;
end;

function TRptLoginLog.KurumGetir(aCode: String): String;
begin
  Result := '';
  if (aCode = '0') or (aCode = '') then Exit;

  QueryOpen(qKurum, 'select code, title from sys_gcdef where code=''' + aCode + '''');
  if qKurum.FieldByName('code').AsString = aCode then
    Result := qKurum.FieldByName('title').AsString
  else
  begin
    QueryOpen(qKurum, 'select code, title from sys_mcdef where code=''' + aCode + '''');
    if qKurum.FieldByName('code').AsString = aCode then
      Result := qKurum.FieldByName('title').AsString;
  end;
end;

procedure TRptLoginLog.PrepareReport;
var
  fltr: String;
begin
  if tblRapor.State = dsInactive then
    tblRapor.Open;
  //todo: baþarýsýz login giriþimleri görünmüyor, görülmeli
  tblRapor.First;
  while not tblRapor.EOF do
    tblRapor.Delete;

  fltr := ' ';
  if pnlAra.Visible then
  begin
    fltr := fltr + ' and l.log_time >= to_timestamp(''' + formatdatetime('ddmmyyyyhhnnss', edAraTarih1.DateTime) + ''', ''DDMMYYYYHH24MISS'') ';
    fltr := fltr + ' and l.log_time <= to_timestamp(''' + formatdatetime('ddmmyyyyhhnnss', edAraTarih2.DateTime) + ''', ''DDMMYYYYHH24MISS'') ';
  end
  else
  begin
  end;

//  ShowMask('Lütfen bekleyiniz...');
//  UniSession.Synchronize();
  QueryOpen(qTmp,  'SELECT l.* ' +
                   '    FROM sys_login_log l ' +
                   '    WHERE (l.cmp_code = ''' + MainMod.MCCode + ''' or l.cmp_code = ''' + MainMod.GCCode + ''') ' + fltr +
                   '  ORDER BY log_time');

  while not qTmp.Eof do
  begin
    tblRapor.Insert;
    tblRapor.FieldByName('kurum').AsString := KurumGetir(qTmp.FieldByName('cmp_code').AsString);
    tblRapor.FieldByName('cmp_code').AsString := qTmp.FieldByName('cmp_code').AsString;
    tblRapor.FieldByName('user_name').AsString := qTmp.FieldByName('user_name').AsString;
    tblRapor.FieldByName('user').AsString := KullaniciGetir(qTmp.FieldByName('user_name').AsString, qTmp.FieldByName('cmp_code').AsString);
    tblRapor.FieldByName('cmp_active').AsString := qTmp.FieldByName('cmp_active').AsString;
    tblRapor.FieldByName('usr_active').AsString := qTmp.FieldByName('usr_active').AsString;
    tblRapor.FieldByName('log_time').AsDateTime := qTmp.FieldByName('log_time').AsDateTime;
    tblRapor.FieldByName('log_success').AsString := qTmp.FieldByName('log_success').AsString;
    tblRapor.FieldByName('ip_no').AsString := qTmp.FieldByName('ip_no').AsString;
    tblRapor.FieldByName('mac_no').AsString := qTmp.FieldByName('mac_no').AsString;
    tblRapor.FieldByName('prg_id').AsString := qTmp.FieldByName('prg_id').AsString;
    tblRapor.FieldByName('prg_vers').AsString := qTmp.FieldByName('prg_vers').AsString;
    tblRapor.FieldByName('db_pid').AsInteger := qTmp.FieldByName('db_pid').AsInteger;
    if qTmp.FieldByName('prg_id').AsString = '1' then
      tblRapor.FieldByName('prg_id').AsString := 'KVKNET Kiþisel Veri Envanteri Yönetim Sistemi'
    else
    if qTmp.FieldByName('prg_id').AsString = '2' then
      tblRapor.FieldByName('prg_id').AsString := 'KVKNET API'
    else
      tblRapor.FieldByName('prg_id').AsString := qTmp.FieldByName('prg_id').AsString;
    tblRapor.Post;
    qTmp.Next;
  end;
//  HideMask;
end;

procedure TRptLoginLog.grdColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
begin
  if SameText(Column.FieldName, 'groupstr') then begin end;
end;

procedure TRptLoginLog.grdDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
var
  formatStr: string;
begin
  formatStr := grd.DataSource.DataSet.FieldByName('log_success').AsString;
  if length(formatstr) < 1 then
    exit;
    if formatstr <> 'E' then
    begin
//      Attribs.Color := clSilver;
      Attribs.Font.Style := [fsBold];
    end;
//  if column.FieldName = 'permf' then
//  begin
//    if formatstr[5] = '1' then
//    begin
//      Attribs.Color := clSilver;
//      Attribs.Font.Style := [fsBold];
//    end;
//  end;
//  if column.FieldName = 'perms' then
//  begin
//    if formatstr[6] = '1' then
//    begin
//      Attribs.Color := clSilver;
//      Attribs.Font.Style := [fsBold];
//    end;
//  end;
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

procedure TRptLoginLog.UniBitBtn1Click(Sender: TObject);
begin
  if tblRapor.IsEmpty then
  begin
    MessageDlg('Kayýt Bulunamadý !',TMsgDlgType.mtConfirmation,[mbYes]);
    exit;
  end;
  ExportQueryToExcel(tblRapor,grd,'Kullanýcý Giriþ Log Kayýtlarý.xls')
end;

procedure TRptLoginLog.UniFormCreate(Sender: TObject);
begin
  qKisi.Open;
  qKaynak.Open;
  qDept.Open;
  qTitle.Open;

  kisiIDList := TStringList.Create;
  qKisi.First;
  while not qKisi.Eof do
  begin
    kisiIDList.Add(qKisi.fieldbyname('id').AsString);
    qKisi.Next;
  end;

  kaynakIDList := TStringList.Create;
  qKaynak.First;
  while not qKaynak.Eof do
  begin
    kaynakIDList.Add(qKaynak.fieldbyname('id').AsString);
    qKaynak.Next;
  end;

  edAraTarih1.DateTime := startoftheDay(now);
  edAraTarih2.DateTime := endOfTheDay(now);
end;

function TRptLoginLog.UnvanGetir(aId: String): String;
begin
  Result := '';
  if (AID = '0') or (AID = '') then Exit;
  if qTitle.State = dsInactive then
    qTitle.Open;
  if qTitle.Locate('id', aId, [loCaseInsensitive]) then
    Result := qTitle.FieldByName('title').AsString;
end;

end.
