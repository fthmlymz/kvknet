unit unRptChecklistLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, DateUtils,
  uniGUIClasses, uniGUIForm, Data.DB, DBAccess, Uni, MemDS, uniPanel, uniButton, uniBitBtn, uniEdit,
  uniMemo, uniDBMemo, uniDBEdit, uniLabel, uniGUIBaseClasses, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniGroupBox, uniRadioGroup, uniDBRadioGroup,
  uniBasicGrid, uniDBGrid, VirtualTable, uniDateTimePicker, VirtualQuery;

type
  TRptChecklistLog = class(TUniForm)
    pnlButtons: TUniPanel;
    btnCancel: TUniBitBtn;
    qDept: TUniQuery;
    qTitle: TUniQuery;
    qTmp: TUniQuery;
    tblRapor: TVirtualTable;
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
    qRapor: TVirtualQuery;
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
    procedure UniBitBtn1Click(Sender: TObject);
  private
    EnvID       : Integer;
    KaynakIDlist,
    kisiIdList   : TStringList;
    procedure PrepareReport;
    function KurumGetir(aId: String): String;
    function KaynakGetir(aId: String): String;
    function KisiGetir(aId: String): String;
    function DepartmanGetir(aId: String): String;
    function UnvanGetir(aId: String): String;
  public
    function Exec(v_EnvID: Integer): Integer;
  end;

function RptChecklistLog: TRptChecklistLog;

implementation

uses uniGUIApplication, MainModule, McMLib, unErisimYetkiListe, unHelpPage;

{$R *.dfm}

function RptChecklistLog: TRptChecklistLog;
begin
  Result := TRptChecklistLog(MainMod.GetFormInstance(TRptChecklistLog));
end;


procedure TRptChecklistLog.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrClose;
end;

procedure TRptChecklistLog.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('RptCheckListLog');
end;

procedure TRptChecklistLog.btnPrepareClick(Sender: TObject);
begin
  PrepareReport;
end;

function TRptChecklistLog.DepartmanGetir(aId: String): String;
begin
  Result := '';
  if (AID = '0') or (AID = '') then Exit;
  if qDept.State = dsInactive then
    qDept.Open;
  if qDept.Locate('id', aId, [loCaseInsensitive]) then
    Result := qDept.FieldByName('title').AsString;
end;

function TRptChecklistLog.Exec(v_EnvID: Integer): Integer;
begin
  //TODO: loglara eriþim yetkilendirme yapýlacak
  EnvId := v_EnvID;
  if (EnvId=0) then
  begin
    pnlAra.visible := true;
    grd.Columns[5].visible := true;
    grd.Columns[6].Visible := true;
  end
  else
    PrepareReport;
  ShowModal;
end;



function TRptChecklistLog.KaynakGetir(aId: String): String;
begin
  Result := '';
  if (AID = '0') or (AID = '') then Exit;
  if qKaynak.State = dsInactive then
    qKaynak.Open;
  if qKaynak.Locate('id', aId, [loCaseInsensitive]) then
    Result := qKaynak.FieldByName('kaynak').AsString;
end;

function TRptChecklistLog.KisiGetir(aId: String): String;
begin
  Result := '';
  if (AID = '0') or (AID = '') then Exit;
  if qkisi.State = dsInactive then
    qkisi.Open;
  if qkisi.Locate('id', aId, [loCaseInsensitive]) then
    Result := qkisi.FieldByName('kisi').AsString;
end;

function TRptChecklistLog.KurumGetir(aId: String): String;
begin
  Result := '';
  if (AID = '0') or (AID = '') then Exit;
  if qKurum.State = dsInactive then
    qKurum.Open;
  if qKurum.Locate('id', aId, [loCaseInsensitive]) then
    Result := qKurum.FieldByName('title').AsString;
end;

procedure TRptChecklistLog.PrepareReport;
var
  fltr: String;
  f1: Array of String;
  g1: string;
  i: integer;
begin
  if tblRapor.State = dsInactive then
    tblRapor.Open;

  tblRapor.First;
  while not tblRapor.EOF do
    tblRapor.Delete;


  g1 := '';
  setlength(f1, tblRapor.FieldDefs.Count);
  for i := 0 to tblRapor.FieldDefs.Count-1 do
    f1[i] := '';

  fltr := ' ';
  if pnlAra.Visible then
  begin
    fltr := fltr + ' and chk.log_tarih >= to_timestamp(''' + formatdatetime('ddmmyyyyhhnnss', edAraTarih1.DateTime) + ''', ''DDMMYYYYHH24MISS'') ';
    fltr := fltr + ' and chk.log_tarih <= to_timestamp(''' + formatdatetime('ddmmyyyyhhnnss', edAraTarih2.DateTime) + ''', ''DDMMYYYYHH24MISS'') ';
  end
  else
  begin
    if EnvID > 0 then
      fltr := fltr + ' and chk.id = ' + IntToStr(EnvId) + ' ';
  end;

  if cbAraKisi.Text <> '' then
  begin
      fltr := fltr + ' and chk.kisi_id = ' + kisiIDList[cbAraKisi.ItemIndex] + ' ';
  end;

  if cbAraKaynak.Text <> '' then
  begin
      fltr := fltr + ' and chk.kaynak_id = ' + kaynakIdList[cbAraKaynak.ItemIndex] + ' ';
  end;

//  ShowMask('Lütfen bekleyiniz...');
//  UniSession.Synchronize;
  QueryOpen(qTmp,  'SELECT chk.* ' +
                   '    FROM kvknet_log.vw_log_data_checklist chk ' +
                   '    WHERE chk.mc_id = ' + IntToStr(MainMod.MCID) + fltr +
                   '  ORDER BY chk.id, chk.log_tarih');

  while not qTmp.Eof do
  begin
    tblRapor.Insert;
    tblRapor.FieldByName('log_id').AsInteger := qTmp.FieldByName('log_id').AsInteger;
    tblRapor.FieldByName('log_tarih').AsDateTime := qTmp.FieldByName('log_tarih').AsDateTime;
    tblRapor.FieldByName('log_kullanici_id').AsString := qTmp.FieldByName('log_kullanici_id').AsString;
    tblRapor.FieldByName('log_kullanici_adi').AsString := MainMod.KullaniciGetir(qTmp.FieldByName('log_kullanici_id').AsString);
    tblRapor.FieldByName('log_kullanici_ip').AsString := qTmp.FieldByName('log_kullanici_ip').AsString;
    tblRapor.FieldByName('id').AsInteger := qTmp.FieldByName('id').AsInteger;
    tblRapor.FieldByName('mc_id').AsInteger := qTmp.FieldByName('mc_id').AsInteger;
    tblRapor.FieldByName('active').AsString := qTmp.FieldByName('active').AsString;
    tblRapor.FieldByName('idy').AsInteger := qTmp.FieldByName('idy').AsInteger;
    tblRapor.FieldByName('idt').AsDateTime := qTmp.FieldByName('idt').AsDateTime;
    tblRapor.FieldByName('sdy').AsInteger := qTmp.FieldByName('sdy').AsInteger;
    tblRapor.FieldByName('sdt').AsDateTime := qTmp.FieldByName('sdt').AsDateTime;
    tblRapor.FieldByName('olusturan').AsString := qTmp.FieldByName('olusturan').AsString;
    tblRapor.FieldByName('degistiren').AsString := qTmp.FieldByName('degistiren').AsString;
    tblRapor.FieldByName('tarih').AsDateTime := qTmp.FieldByName('tarih').AsDateTime;
    tblRapor.FieldByName('kaynak_id').AsString := qTmp.FieldByName('kaynak_id').AsString;
    tblRapor.FieldByName('kaynak_str').AsString := qTmp.FieldByName('kaynak_str').AsString;
    tblRapor.FieldByName('kisi_id').AsString := qTmp.FieldByName('kisi_id').AsString;
    tblRapor.FieldByName('kisi_str').AsString := qTmp.FieldByName('kisi_str').AsString;
    tblRapor.FieldByName('kontrol_id').AsString := qTmp.FieldByName('kontrol_id').AsString;
    tblRapor.FieldByName('kontrol_str').AsString := qTmp.FieldByName('kontrol_str').AsString;
    tblRapor.FieldByName('tedbir_ids').AsString := qTmp.FieldByName('tedbir_ids').AsString;
    tblRapor.FieldByName('tedbir_str').AsString := qTmp.FieldByName('tedbir_str').AsString;
    tblRapor.FieldByName('dayanak_ids').AsString := qTmp.FieldByName('dayanak_ids').AsString;
    tblRapor.FieldByName('dayanak_str').AsString := qTmp.FieldByName('dayanak_str').AsString;
    tblRapor.FieldByName('dokuman_ids').AsString := qTmp.FieldByName('dokuman_ids').AsString;
    tblRapor.FieldByName('dokuman_str').AsString := qTmp.FieldByName('dokuman_str').AsString;
    tblRapor.FieldByName('ekipman_ids').AsString := qTmp.FieldByName('ekipman_ids').AsString;
    tblRapor.FieldByName('ekipman_str').AsString := qTmp.FieldByName('ekipman_str').AsString;
    tblRapor.FieldByName('sorumlu_ids').AsString := qTmp.FieldByName('sorumlu_ids').AsString;
    tblRapor.FieldByName('sorumlu_str').AsString := qTmp.FieldByName('sorumlu_str').AsString;
    tblRapor.FieldByName('hkk_gereksinim').AsString := qTmp.FieldByName('hkk_gereksinim').AsString;
    tblRapor.FieldByName('hkk_sozlesme').AsString := qTmp.FieldByName('hkk_sozlesme').AsString;
    tblRapor.FieldByName('hkk_sozmadde').AsString := qTmp.FieldByName('hkk_sozmadde').AsString;
    tblRapor.FieldByName('calisma_talimat').AsString := qTmp.FieldByName('calisma_talimat').AsString;
    tblRapor.FieldByName('oneriler').AsString := qTmp.FieldByName('oneriler').AsString;
    tblRapor.FieldByName('guncelleme_araligi').AsString := qTmp.FieldByName('guncelleme_araligi').AsString;
    tblRapor.FieldByName('tetkik_araligi').AsString := qTmp.FieldByName('tetkik_araligi').AsString;
    tblRapor.FieldByName('tetkik_yonetim').AsString := qTmp.FieldByName('tetkik_yonetim').AsString;
    tblRapor.FieldByName('onem_derecesi_id').AsString := qTmp.FieldByName('onem_derecesi_id').AsString;
    tblRapor.FieldByName('onem_derecesi_str').AsString := qTmp.FieldByName('onem_derecesi_str').AsString;
    tblRapor.FieldByName('koru_idarionlem').AsString := qTmp.FieldByName('koru_idarionlem').AsString;
    tblRapor.FieldByName('koru_teknikonlem').AsString := qTmp.FieldByName('koru_teknikonlem').AsString;
    tblRapor.FieldByName('danisman_notu').AsString := qTmp.FieldByName('danisman_notu').AsString;
    tblRapor.FieldByName('kilitli').AsString := qTmp.FieldByName('kilitli').AsString;
    tblRapor.FieldByName('kilitli_sdy').AsString := qTmp.FieldByName('kilitli_sdy').AsString;
    tblRapor.FieldByName('kilitli_sdt').AsString := qTmp.FieldByName('kilitli_sdt').AsString;

    tblRapor.FieldByName('log_islem').AsString := qTmp.FieldByName('log_islem').AsString;
    if tblRapor.FieldByName('log_islem').AsString = 'I' then
      tblRapor.FieldByName('log_islem').AsString := 'EKLEME'
    else
    if tblRapor.FieldByName('log_islem').AsString = 'U' then
      tblRapor.FieldByName('log_islem').AsString := 'DEÐÝÞTÝRME'
    else
    if tblRapor.FieldByName('log_islem').AsString = 'D' then
      tblRapor.FieldByName('log_islem').AsString := 'SÝLME';

    tblRapor.FieldByName('groupstr').AsString := tblRapor.FieldByName('id').AsString;
    tblRapor.FieldByName('formatstr').AsString := '';

    if g1 = tblRapor.FieldByName('groupstr').AsString then
    begin
      for i := 0 to tblRapor.FieldDefs.Count-1 do
      begin
        if f1[i] <> tblRapor.fields[i].AsString then
          tblRapor.FieldByName('formatstr').AsString := tblRapor.FieldByName('formatstr').AsString + '1'
        else
          tblRapor.FieldByName('formatstr').AsString := tblRapor.FieldByName('formatstr').AsString + '0';
      end;
    end
    else
    begin
      for i := 0 to tblRapor.FieldDefs.Count-1 do
        tblRapor.FieldByName('formatstr').AsString := tblRapor.FieldByName('formatstr').AsString + '0';
    end;
    tblRapor.Post;

    g1 := tblRapor.FieldByName('groupstr').AsString;
    for i := 0 to tblRapor.FieldDefs.Count-1 do
    begin
      f1[i] := tblRapor.fields[i].AsString;
    end;

    qTmp.Next;
  end;
//  HideMask;

  qRapor.Close;
  qRapor.SQL.Clear;
  qRapor.SQL.Add('select * from tblRapor order by id, log_tarih');
  qRapor.Open;
end;

procedure TRptChecklistLog.grdColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
begin
  if SameText(Column.FieldName, 'groupstr') then begin end;
end;

procedure TRptChecklistLog.grdDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
var
  formatStr: string;
begin
  formatStr := grd.DataSource.DataSet.FieldByName('formatstr').AsString;
  if length(formatstr) < tblRapor.FieldDefs.Count then
    exit;
  if (copy(column.FieldName, 1,4)  <> 'log_') then
  begin
    if formatstr[tblRapor.FieldDefs.IndexOf(column.FieldName)+1] = '1' then
    begin
      Attribs.Color := clSilver;
      Attribs.Font.Style := [fsBold];
    end;
  end;
end;

procedure TRptChecklistLog.UniBitBtn1Click(Sender: TObject);
begin
  if qRapor.IsEmpty then
  begin
    MessageDlg('Kayýt bulunamadý!',TMsgDlgType.mtConfirmation,[mbYes]);
    exit;
  end;
  ExportQueryToExcel(qRapor,grd,'Kontrol Listesi Log kayýtlarý.xls');
end;

procedure TRptChecklistLog.UniFormCreate(Sender: TObject);
begin
  qDept.Open;
  qTitle.Open;

  kisiIDList := TStringList.Create;
  cbAraKisi.Items.Clear;
  QueryOpen(qKisi, 'SELECT id, kisi FROM def_data_kisi WHERE mc_id=' + IntToStr(MainMod.MCID) + ' ORDER BY kisi');
  qKisi.First;
  while not qKisi.Eof do
  begin
    cbAraKisi.Items.Add(qKisi.fieldbyname('kisi').AsString);
    kisiIDList.Add(qKisi.fieldbyname('id').AsString);
    qKisi.Next;
  end;

  kaynakIDList := TStringList.Create;
  cbAraKaynak.Items.Clear;
  QueryOpen(qKaynak, 'SELECT id, kaynak FROM def_data_kaynak WHERE mc_id=' + IntToStr(MainMod.MCID) + ' ORDER BY kaynak');
  qKaynak.First;
  while not qKaynak.Eof do
  begin
    cbAraKaynak.Items.Add(qKaynak.fieldbyname('kaynak').AsString);
    kaynakIDList.Add(qKaynak.fieldbyname('id').AsString);
    qKaynak.Next;
  end;

  edAraTarih1.DateTime := startoftheDay(Now);
  edAraTarih2.DateTime := endOfTheDay(now);
end;

function TRptChecklistLog.UnvanGetir(aId: String): String;
begin
  Result := '';
  if (AID = '0') or (AID = '') then Exit;
  if qTitle.State = dsInactive then
    qTitle.Open;
  if qTitle.Locate('id', aId, [loCaseInsensitive]) then
    Result := qTitle.FieldByName('title').AsString;
end;

end.
