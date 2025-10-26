unit unRptSMSLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, DateUtils,
  uniGUIClasses, uniGUIForm, Data.DB, DBAccess, Uni, MemDS, uniPanel, uniButton, uniBitBtn, uniEdit,
  uniMemo, uniDBMemo, uniDBEdit, uniLabel, uniGUIBaseClasses, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniGroupBox, uniRadioGroup, uniDBRadioGroup,
  uniBasicGrid, uniDBGrid, VirtualTable, uniDateTimePicker;

type
  TRptSMSLog = class(TUniForm)
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
    function KurumGetir(aId: String): String;
    function KaynakGetir(aId: String): String;
    function KisiGetir(aId: String): String;
    function DepartmanGetir(aId: String): String;
    function UnvanGetir(aId: String): String;
  public
    function Exec(v_AccessID: Integer): Integer;
  end;

function RptSMSLog: TRptSMSLog;

implementation

uses uniGUIApplication, MainModule, McMLib, unErisimYetkiListe, unHelpPage;

{$R *.dfm}

function RptSMSLog: TRptSMSLog;
begin
  Result := TRptSMSLog(MainMod.GetFormInstance(TRptSMSLog));
end;


procedure TRptSMSLog.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrClose;
end;

procedure TRptSMSLog.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('RptSMSLog');
end;

procedure TRptSMSLog.btnPrepareClick(Sender: TObject);
begin
  PrepareReport;
end;

function TRptSMSLog.DepartmanGetir(aId: String): String;
begin
  Result := '';
  if (AID = '0') or (AID = '') then Exit;
  if qDept.State = dsInactive then
    qDept.Open;
  if qDept.Locate('id', aId, [loCaseInsensitive]) then
    Result := qDept.FieldByName('title').AsString;
end;

function TRptSMSLog.Exec(v_AccessID: Integer): Integer;
begin
  //TODO: loglara eriþim yetkilendirme yapýlacak
  accessId := v_AccessID;
//  PrepareReport;
  ShowModal;
end;



function TRptSMSLog.KaynakGetir(aId: String): String;
begin
  Result := '';
  if (AID = '0') or (AID = '') then Exit;
  if qKaynak.State = dsInactive then
    qKaynak.Open;
  if qKaynak.Locate('id', aId, [loCaseInsensitive]) then
    Result := qKaynak.FieldByName('kaynak').AsString;
end;

function TRptSMSLog.KisiGetir(aId: String): String;
begin
  Result := '';
  if (AID = '0') or (AID = '') then Exit;
  if qkisi.State = dsInactive then
    qkisi.Open;
  if qkisi.Locate('id', aId, [loCaseInsensitive]) then
    Result := qkisi.FieldByName('kisi').AsString;
end;

function TRptSMSLog.KurumGetir(aId: String): String;
begin
  Result := '';
  if (AID = '0') or (AID = '') then Exit;
  if qKurum.State = dsInactive then
    qKurum.Open;
  if qKurum.Locate('id', aId, [loCaseInsensitive]) then
    Result := qKurum.FieldByName('title').AsString;
end;

procedure TRptSMSLog.PrepareReport;
var
  sqlstr,
  fltr: String;
begin
  if tblRapor.State = dsInactive then
    tblRapor.Open;

  tblRapor.First;
  while not tblRapor.EOF do
    tblRapor.Delete;

  sqlstr := 'SELECT l.id, l.mc_id, l.ar_id, l.src_time, l.src_type, l.src_ip, l.result_str, l.result_id, mc.krm_unvan, ' +
            'ar.id_tur as ar_tur, ' +
            'CASE ' +
            'WHEN ar.id_tur = ''AR'' THEN (SELECT ayd1.tanim FROM def_data_aydinlatma ayd1 WHERE ayd1.id=ar.ayd_id) ' +
            'WHEN ar.id_tur = ''OO'' THEN (SELECT oo1.tanim FROM def_data_ozelonay oo1 WHERE oo1.id=ar.oo_id) end ar_aciklama ' +
            'FROM sys_sms_log l ' +
            'LEFT JOIN data_acikriza ar ON l.ar_id=ar.id ' +
            'LEFT JOIN sys_mcdef mc ON l.mc_id=mc.id ';

  fltr := ' ';
  if pnlAra.Visible then
  begin
    fltr := fltr + ' and l.src_time >= to_timestamp(''' + formatdatetime('ddmmyyyyhhnnss', edAraTarih1.DateTime) + ''', ''DDMMYYYYHH24MISS'') ';
    fltr := fltr + ' and l.src_time <= to_timestamp(''' + formatdatetime('ddmmyyyyhhnnss', edAraTarih2.DateTime) + ''', ''DDMMYYYYHH24MISS'') ';
  end
  else
  begin
  end;

  sqlstr := sqlstr + 'WHERE l.mc_id = ' + IntToStr(MainMod.MCID) + fltr + 'ORDER BY l.src_time';

//  ShowMask('Lütfen bekleyiniz');
//  UniSession.Synchronize;
  QueryOpen(qTmp,  sqlstr);

  while not qTmp.Eof do
  begin
    tblRapor.Insert;
    tblRapor.FieldByName('kurum').AsString := qTmp.FieldByName('krm_unvan').AsString;
    tblRapor.FieldByName('ar_id').AsString := qTmp.FieldByName('ar_id').AsString;
    tblRapor.FieldByName('src_time').AsDateTime := qTmp.FieldByName('src_time').AsDateTime;
    tblRapor.FieldByName('src_type').AsString := qTmp.FieldByName('src_type').AsString;
    tblRapor.FieldByName('src_ip').AsString := qTmp.FieldByName('src_ip').AsString;
    tblRapor.FieldByName('result_str').AsString := qTmp.FieldByName('result_str').AsString;
    tblRapor.FieldByName('result_id').AsInteger := qTmp.FieldByName('result_id').AsInteger;
    tblRapor.FieldByName('ar_aciklama').AsString := qTmp.FieldByName('ar_aciklama').AsString;

    if qTmp.FieldByName('result_id').AsInteger = 1 then
      tblRapor.FieldByName('result').AsString := 'BAÞARILI'
    else if qTmp.FieldByName('result_id').AsInteger = 0 then
      tblRapor.FieldByName('result').AsString := 'HATALI';

    if (qTmp.FieldByName('src_type').AsString = 'ESAPL') then
      tblRapor.FieldByName('src_aciklama').AsString := 'AÇIK RIZA KÝÞÝSEL LÝNK GÖNDERME (KVKNET)'
    else
    if (qTmp.FieldByName('src_type').AsString = 'ESOPL') then
      tblRapor.FieldByName('src_aciklama').AsString := 'ÖZEL ONAY KÝÞÝSEL LÝNK GÖNDERME (KVKNET)'
    else
    if ((qTmp.FieldByName('src_type').AsString = 'AWAGC') or (qTmp.FieldByName('src_type').AsString = 'WGF') and (qTmp.FieldByName('ar_tur').AsString = 'AR')) then
      tblRapor.FieldByName('src_aciklama').AsString := 'AÇIK RIZA GÜVENLÝK KODU (WEB GENEL LÝNK)'
    else
    if ((qTmp.FieldByName('src_type').AsString = 'AWAPC') or (qTmp.FieldByName('src_type').AsString = 'WPF') and (qTmp.FieldByName('ar_tur').AsString = 'AR')) then
      tblRapor.FieldByName('src_aciklama').AsString := 'AÇIK RIZA GÜVENLÝK KODU (WEB KÝÞÝSEL LÝNK)'
    else
    if ((qTmp.FieldByName('src_type').AsString = 'AWOGC') or (qTmp.FieldByName('src_type').AsString = 'WGF') and (qTmp.FieldByName('ar_tur').AsString = 'OO')) then
      tblRapor.FieldByName('src_aciklama').AsString := 'ÖZEL ONAY GÜVENLÝK KODU (WEB GENEL LÝNK)'
    else
    if ((qTmp.FieldByName('src_type').AsString = 'AWOPC') or (qTmp.FieldByName('src_type').AsString = 'WPF') and (qTmp.FieldByName('ar_tur').AsString = 'OO')) then
      tblRapor.FieldByName('src_aciklama').AsString := 'ÖZEL ONAY GÜVENLÝK KODU (WEB KÝÞÝSEL LÝNK)'
    else
    if (qTmp.FieldByName('src_type').AsString = 'VWVGC') then
      tblRapor.FieldByName('src_aciklama').AsString := 'VERÝ SAHÝBÝ BAÞVURU GÜVENLÝK KODU (WEB GENEL LÝNK)'
    else
    if (qTmp.FieldByName('src_type').AsString = 'WAAPC') then
      tblRapor.FieldByName('src_aciklama').AsString := 'AÇIK RIZA GÜVENLÝK KODU (KVKNET APÝ)'
    else
    if (qTmp.FieldByName('src_type').AsString = 'WAAPL') then
      tblRapor.FieldByName('src_aciklama').AsString := 'AÇIK RIZA KÝÞÝSEL LÝNK GÖNDERME (KVKNET APÝ)'
    else
    if (qTmp.FieldByName('src_type').AsString = 'WAOPC') then
      tblRapor.FieldByName('src_aciklama').AsString := 'ÖZEL ONAY GÜVENLÝK KODU (KVKNET APÝ)'
    else
    if (qTmp.FieldByName('src_type').AsString = 'WAOPL') then
      tblRapor.FieldByName('src_aciklama').AsString := 'ÖZEL ONAY KÝÞÝSEL LÝNK GÖNDERME (KVKNET APÝ)'
    else
    if (qTmp.FieldByName('src_type').AsString = 'WAVPC') then
      tblRapor.FieldByName('src_aciklama').AsString := 'VERÝ SAHÝBÝ BAÞVURU GÜVENLÝK KODU (KVKNET APÝ)';

    tblRapor.Post;
    qTmp.Next;
  end;
//  HideMask;
end;

procedure TRptSMSLog.grdColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
begin
  if SameText(Column.FieldName, 'groupstr') then begin end;
end;

procedure TRptSMSLog.grdDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
var
  formatStr: string;
begin
//  formatStr := grd.DataSource.DataSet.FieldByName('formatstr').AsString;
//  if length(formatstr) < 6 then
//    exit;
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

procedure TRptSMSLog.UniBitBtn1Click(Sender: TObject);
begin
  if tblRapor.IsEmpty then
  begin
    MessageDlg('Kayýt Bulunamadý !',TMsgDlgType.mtConfirmation,[mbYes]);
    exit;
  end;
 ExportQueryToExcel(tblRapor,grd,'SMS Log Kayýtlarý.xls') ;
end;

procedure TRptSMSLog.UniFormCreate(Sender: TObject);
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

function TRptSMSLog.UnvanGetir(aId: String): String;
begin
  Result := '';
  if (AID = '0') or (AID = '') then Exit;
  if qTitle.State = dsInactive then
    qTitle.Open;
  if qTitle.Locate('id', aId, [loCaseInsensitive]) then
    Result := qTitle.FieldByName('title').AsString;
end;

end.
