unit unRptEnvanterLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, DateUtils,
  uniGUIClasses, uniGUIForm, Data.DB, DBAccess, Uni, MemDS, uniPanel, uniButton, uniBitBtn, uniEdit,
  uniMemo, uniDBMemo, uniDBEdit, uniLabel, uniGUIBaseClasses, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniGroupBox, uniRadioGroup, uniDBRadioGroup,
  uniBasicGrid, uniDBGrid, VirtualTable, uniDateTimePicker, VirtualQuery;

type
  TRptEnvanterLog = class(TUniForm)
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
    UniBitBtn1: TUniBitBtn;
    procedure btnPrepareClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure grdDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure grdColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure UniFormCreate(Sender: TObject);
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

function RptEnvanterLog: TRptEnvanterLog;

implementation

uses uniGUIApplication, MainModule, McMLib, unErisimYetkiListe;

{$R *.dfm}

function RptEnvanterLog: TRptEnvanterLog;
begin
  Result := TRptEnvanterLog(MainMod.GetFormInstance(TRptEnvanterLog));
end;


procedure TRptEnvanterLog.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrClose;
end;

procedure TRptEnvanterLog.btnPrepareClick(Sender: TObject);
begin
  PrepareReport;
end;

function TRptEnvanterLog.DepartmanGetir(aId: String): String;
begin
  Result := '';
  if (AID = '0') or (AID = '') then Exit;
  if qDept.State = dsInactive then
    qDept.Open;
  if qDept.Locate('id', aId, [loCaseInsensitive]) then
    Result := qDept.FieldByName('title').AsString;
end;

function TRptEnvanterLog.Exec(v_EnvID: Integer): Integer;
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



function TRptEnvanterLog.KaynakGetir(aId: String): String;
begin
  Result := '';
  if (AID = '0') or (AID = '') then Exit;
  if qKaynak.State = dsInactive then
    qKaynak.Open;
  if qKaynak.Locate('id', aId, [loCaseInsensitive]) then
    Result := qKaynak.FieldByName('kaynak').AsString;
end;

function TRptEnvanterLog.KisiGetir(aId: String): String;
begin
  Result := '';
  if (AID = '0') or (AID = '') then Exit;
  if qkisi.State = dsInactive then
    qkisi.Open;
  if qkisi.Locate('id', aId, [loCaseInsensitive]) then
    Result := qkisi.FieldByName('kisi').AsString;
end;

function TRptEnvanterLog.KurumGetir(aId: String): String;
begin
  Result := '';
  if (AID = '0') or (AID = '') then Exit;
  if qKurum.State = dsInactive then
    qKurum.Open;
  if qKurum.Locate('id', aId, [loCaseInsensitive]) then
    Result := qKurum.FieldByName('title').AsString;
end;

procedure TRptEnvanterLog.PrepareReport;
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
    fltr := fltr + ' and env.log_tarih >= to_timestamp(''' + formatdatetime('ddmmyyyyhhnnss', edAraTarih1.DateTime) + ''', ''DDMMYYYYHH24MISS'') ';
    fltr := fltr + ' and env.log_tarih <= to_timestamp(''' + formatdatetime('ddmmyyyyhhnnss', edAraTarih2.DateTime) + ''', ''DDMMYYYYHH24MISS'') ';
  end
  else
  begin
    if EnvID > 0 then
      fltr := fltr + ' and env.id = ' + IntToStr(EnvId) + ' ';
  end;

  if cbAraKisi.Text <> '' then
  begin
      fltr := fltr + ' and env.kisi_id = ' + kisiIDList[cbAraKisi.ItemIndex] + ' ';
  end;

  if cbAraKaynak.Text <> '' then
  begin
      fltr := fltr + ' and env.kaynak_id = ' + kaynakIdList[cbAraKaynak.ItemIndex] + ' ';
  end;

//  ShowMask('Lütfen bekleyiniz...');
//  UniSession.Synchronize;
  QueryOpen(qTmp,  'SELECT env.* ' +
                   '    FROM kvknet_log.vw_log_data_envanter env ' +
                   '    WHERE env.mc_id = ' + IntToStr(MainMod.MCID) + fltr +
                   '  ORDER BY env.id, env.log_tarih');

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
    tblRapor.FieldByName('active').AsString := qTmp.FieldByName('active').AsString;
    tblRapor.FieldByName('idy').AsString := MainMod.KullaniciGetir(qTmp.FieldByName('idy').AsString);
    tblRapor.FieldByName('idt').AsDateTime := qTmp.FieldByName('idt').AsDateTime;
    tblRapor.FieldByName('sdy').AsString := MainMod.KullaniciGetir(qTmp.FieldByName('sdy').AsString);
    tblRapor.FieldByName('sdt').AsDateTime := qTmp.FieldByName('idt').AsDateTime;
    tblRapor.FieldByName('kurum').AsString := KurumGetir(qTmp.FieldByName('mc_id').AsString);
    tblRapor.FieldByName('tarih').AsDateTime := qTmp.FieldByName('tarih').AsDateTime;
    tblRapor.FieldByName('dept_str').AsString := qTmp.FieldByName('dept_str').AsString;
    tblRapor.FieldByName('surec_str').AsString := qTmp.FieldByName('surec_str').AsString;
    tblRapor.FieldByName('kaynak_str').AsString := qTmp.FieldByName('kaynak_str').AsString;
    tblRapor.FieldByName('veritipi_str').AsString := qTmp.FieldByName('veritipi_str').AsString;
    tblRapor.FieldByName('kategori_str').AsString := qTmp.FieldByName('kategori_str').AsString;
    tblRapor.FieldByName('kisi_str').AsString := qTmp.FieldByName('kisi_str').AsString;
    tblRapor.FieldByName('nitelik').AsString := qTmp.FieldByName('nitelik').AsString;
    tblRapor.FieldByName('topl_amac_str').AsString := qTmp.FieldByName('topl_amac_str').AsString;
    tblRapor.FieldByName('topl_metod_str').AsString := qTmp.FieldByName('topl_metod_str').AsString;
    tblRapor.FieldByName('topl_detay').AsString := qTmp.FieldByName('topl_detay').AsString;
    tblRapor.FieldByName('topl_cikti').AsString := qTmp.FieldByName('topl_cikti').AsString;
    tblRapor.FieldByName('topl_paylasim').AsString := qTmp.FieldByName('topl_paylasim').AsString;
    tblRapor.FieldByName('topl_paylasimtipi').AsString := qTmp.FieldByName('topl_paylasimtipi').AsString;
    tblRapor.FieldByName('sakl_amac_str').AsString := qTmp.FieldByName('sakl_amac_str').AsString;
    tblRapor.FieldByName('sakl_metod_str').AsString := qTmp.FieldByName('sakl_metod_str').AsString;
    tblRapor.FieldByName('sakl_erisim_str').AsString := qTmp.FieldByName('sakl_erisim_str').AsString;
    tblRapor.FieldByName('sakl_sanalonlem').AsString := qTmp.FieldByName('sakl_sanalonlem').AsString;
    tblRapor.FieldByName('sakl_fizikselonlem').AsString := qTmp.FieldByName('sakl_fizikselonlem').AsString;
    tblRapor.FieldByName('sakl_ssure_var').AsString := qTmp.FieldByName('sakl_ssure_var').AsString;
    tblRapor.FieldByName('sakl_ssure_tip').AsString := qTmp.FieldByName('sakl_ssure_tip').AsString;
    tblRapor.FieldByName('sakl_ssure_sure').AsString := qTmp.FieldByName('sakl_ssure_sure').AsString;
    tblRapor.FieldByName('sakl_ssure_imha').AsString := qTmp.FieldByName('sakl_ssure_imha').AsString;
    tblRapor.FieldByName('sakl_ssure').AsString := qTmp.FieldByName('sakl_ssure').AsString;
    tblRapor.FieldByName('sakl_fsure_var').AsString := qTmp.FieldByName('sakl_fsure_var').AsString;
    tblRapor.FieldByName('sakl_fsure_tip').AsString := qTmp.FieldByName('sakl_fsure_tip').AsString;
    tblRapor.FieldByName('sakl_fsure_sure').AsString := qTmp.FieldByName('sakl_fsure_sure').AsString;
    tblRapor.FieldByName('sakl_fsure_imha').AsString := qTmp.FieldByName('sakl_fsure_imha').AsString;
    tblRapor.FieldByName('sakl_fsure').AsString := qTmp.FieldByName('sakl_fsure').AsString;
    tblRapor.FieldByName('payl_amac_str').AsString := qTmp.FieldByName('payl_amac_str').AsString;
    tblRapor.FieldByName('payl_metod_str').AsString := qTmp.FieldByName('payl_metod_str').AsString;
    tblRapor.FieldByName('payl_taraf_str').AsString := qTmp.FieldByName('payl_taraf_str').AsString;
    tblRapor.FieldByName('payl_taraftipi').AsString := qTmp.FieldByName('payl_taraftipi').AsString;
    tblRapor.FieldByName('payl_sozlesme').AsString := qTmp.FieldByName('payl_sozlesme').AsString;
    tblRapor.FieldByName('payl_sozisim').AsString := qTmp.FieldByName('payl_sozisim').AsString;
    tblRapor.FieldByName('payl_sozmadde').AsString := qTmp.FieldByName('payl_sozmadde').AsString;
    tblRapor.FieldByName('dgr_dayanak_str').AsString := qTmp.FieldByName('dgr_dayanak_str').AsString;
    tblRapor.FieldByName('dgr_dokuman_str').AsString := qTmp.FieldByName('dgr_dokuman_str').AsString;
    tblRapor.FieldByName('dgr_politika').AsString := qTmp.FieldByName('dgr_politika').AsString;
    tblRapor.FieldByName('dgr_polisim').AsString := qTmp.FieldByName('dgr_polisim').AsString;
    tblRapor.FieldByName('dgr_polmadde').AsString := qTmp.FieldByName('dgr_polmadde').AsString;
    tblRapor.FieldByName('dgr_sozlesme').AsString := qTmp.FieldByName('dgr_sozlesme').AsString;
    tblRapor.FieldByName('dgr_sozisim').AsString := qTmp.FieldByName('dgr_sozisim').AsString;
    tblRapor.FieldByName('dgr_sozmadde').AsString := qTmp.FieldByName('dgr_sozmadde').AsString;
    tblRapor.FieldByName('kilitli').AsString := qTmp.FieldByName('kilitli').AsString;
    tblRapor.FieldByName('main_id').AsInteger := qTmp.FieldByName('main_id').AsInteger;

    if tblRapor.FieldByName('log_islem').AsString = 'I' then
      tblRapor.FieldByName('log_islem').AsString := 'EKLEME'
    else
    if tblRapor.FieldByName('log_islem').AsString = 'U' then
      tblRapor.FieldByName('log_islem').AsString := 'DEÐÝÞTÝRME'
    else
    if tblRapor.FieldByName('log_islem').AsString = 'D' then
      tblRapor.FieldByName('log_islem').AsString := 'SÝLME';


    if tblRapor.FieldByName('main_id').AsInteger = 0 then
      tblRapor.FieldByName('groupstr').AsString := tblRapor.FieldByName('id').AsString
    else
      tblRapor.FieldByName('groupstr').AsString := tblRapor.FieldByName('main_id').AsString;
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

procedure TRptEnvanterLog.grdColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
begin
  if SameText(Column.FieldName, 'groupstr') then begin end;
end;

procedure TRptEnvanterLog.grdDrawColumnCell(Sender: TObject; ACol,
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

procedure TRptEnvanterLog.UniBitBtn1Click(Sender: TObject);
begin
  if qRapor.IsEmpty then
  begin
    MessageDlg('Kayýt Bulunamadý !',TMsgDlgType.mtConfirmation,[mbYes]);
    exit;
  end;
  ExportQueryToExcel(qRapor,grd,'Envanter Listesi Log Kayýtlarý.xls')
end;

procedure TRptEnvanterLog.UniFormCreate(Sender: TObject);
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

function TRptEnvanterLog.UnvanGetir(aId: String): String;
begin
  Result := '';
  if (AID = '0') or (AID = '') then Exit;
  if qTitle.State = dsInactive then
    qTitle.Open;
  if qTitle.Locate('id', aId, [loCaseInsensitive]) then
    Result := qTitle.FieldByName('title').AsString;
end;

end.
