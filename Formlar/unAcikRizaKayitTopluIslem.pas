unit unAcikRizaKayitTopluIslem;

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
  TfrmAcikRizaKayitTopluIslem = class(TUniForm)
    qTmp: TUniQuery;
    tblImport: TVirtualTable;
    dsImport: TUniDataSource;
    FileUp: TUniFileUpload;
    qAR: TUniQuery;
    qAyd: TUniQuery;
    dsAyd: TUniDataSource;
    qOOTnm: TUniQuery;
    dsOOTnm: TUniDataSource;
    pnlExcelImport: TUniContainerPanel;
    grd: TUniDBGrid;
    UniPanel1: TUniPanel;
    UniDBNavigator1: TUniDBNavigator;
    pnlImportButtons: TUniPanel;
    btnCancel: TUniBitBtn;
    btnSablonIndir: TUniBitBtn;
    btnYukle: TUniBitBtn;
    btnAdd: TUniBitBtn;
    lbAydinlatma: TUniLabel;
    edAydinlatma: TUniDBLookupComboBox;
    procedure btnCancelClick(Sender: TObject);
    procedure grdColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure tblImportBeforePost(DataSet: TDataSet);
    procedure btnSablonIndirClick(Sender: TObject);
    procedure btnYukleClick(Sender: TObject);
    procedure FileUpCompleted(Sender: TObject; AStream: TFileStream);
    procedure btnAddClick(Sender: TObject);
    procedure grdDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
  private
    id_tur       : String;
//    islem        : String;
    beforePostCheck: boolean;
    procedure ProcessExcel(xlsxfile: string);
    function CheckImportTbl: boolean;
    function CheckImportRow: boolean;
  protected
  public
    function ExecImport(islem: String): Integer;
  end;

function frmAcikRizaKayitTopluIslem: TfrmAcikRizaKayitTopluIslem;

implementation

uses uniGUIApplication, MainModule, McMLib, unErisimYetkiListe, ServerModule;

{$R *.dfm}

function frmAcikRizaKayitTopluIslem: TfrmAcikRizaKayitTopluIslem;
begin
  Result := TfrmAcikRizaKayitTopluIslem(MainMod.GetFormInstance(TfrmAcikRizaKayitTopluIslem));
end;


procedure TfrmAcikRizaKayitTopluIslem.btnAddClick(Sender: TObject);
begin
  queryOpen(qAR, 'SELECT * FROM data_acikriza WHERE id=0 and mc_id=' + IntToStr(mainmod.MCID));

  beforepostcheck := false;
  // Added by TEVFIK 31.05.2023 17:39:30
  if tblImport.Active = False then tblImport.Active := True;

  if tblImport.RecordCount = 0 then
  begin
    MessageDlg('Sisteme kaydedilecek veri bulunamadý.', mtInformation, [mbOk]);
    Exit;
  end;
  
  tblImport.First;
  while not tblImport.Eof do
  begin
    if tblImport.FieldByName('islemdurum').AsString <> 'I' then
    begin
      tblImport.Next;
      continue;
    end;
    qAR.Insert;
    qAR.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_data_acikriza_id');
    if id_tur = 'AR' then
    begin
      qAR.FieldByName('ayd_id').AsInteger     := qayd.FieldByName('id').AsInteger;
      qAR.FieldByName('oo_id').AsInteger      := 0;
      qAR.FieldByName('id_tur').AsString      := 'AR';
      qAR.FieldByName('kisi_id').AsInteger  := qayd.FieldByName('kisi_id').AsInteger;
    end;
    if id_tur = 'OO' then
    begin
      qAR.FieldByName('ayd_id').AsInteger     := 0;
      qAR.FieldByName('oo_id').AsInteger      := qOOTnm.FieldByName('id').AsInteger;
      qAR.FieldByName('id_tur').AsString      := 'OO';
    end;
    qAR.FieldByName('mc_id').AsInteger    := MainMod.MCID;
    qAR.FieldByName('idy').AsInteger      := MainMod.LoginInfo.ID;
    qAR.FieldByName('idt').AsDateTime     := Now;
    qAR.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
    qAR.FieldByName('sdt').AsDateTime     := Now;
    qAR.FieldByName('durum').AsString     := tblImport.FieldByName('durum').AsString;
    qAR.FieldByName('tarih').AsDateTime   := tblImport.FieldByName('tarih').AsDateTime;
    qAR.FieldByName('saat').AsString      := tblImport.FieldByName('saat').AsString;
    qAR.FieldByName('ad_soyad').AsString  := tblImport.FieldByName('adsoyad').AsString;
    qAR.FieldByName('kimlik_no').AsString := tblImport.FieldByName('kimlik_no').AsString;
    qAR.FieldByName('gsmno').AsString     := tblImport.FieldByName('gsmno').AsString;
    qAR.FieldByName('email').AsString     := tblImport.FieldByName('email').AsString;
    qAR.FieldByName('aguid').AsString     := MainMod.NewGuid;
    qAR.FieldByName('onay_sira').AsString := '1';
    qAR.Post;
    tblImport.Edit;
    tblImport.FieldByName('islemdurum').AsString := 'E';
    if id_tur = 'AR' then
      tblImport.FieldByName('islemmesaj').AsString := 'Açýk Rýza eklendi.'
    else if id_tur = 'OO' then
      tblImport.FieldByName('islemmesaj').AsString := 'Özel Onay eklendi.';
    tblImport.Next;
  end;
  beforepostcheck := true;
end;

procedure TfrmAcikRizaKayitTopluIslem.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrClose;
end;

procedure TfrmAcikRizaKayitTopluIslem.btnSablonIndirClick(Sender: TObject);
var
  dosyaAdi: String;
begin
    if id_tur = 'AR' then
      dosyaAdi := 'Acik_Riza_Toplu_Ekleme_Sablonu.xlsx'
    else if id_tur = 'OO' then
      dosyaAdi := 'Ozel_Onay_Toplu_Ekleme_Sablonu.xlsx';
    UniSession.SendFile(ServerMod.FilesFolderPath + 'temp_xls\Acik_Riza_Toplu_Ekleme_Sablonu.xlsx', dosyaAdi);
end;

procedure TfrmAcikRizaKayitTopluIslem.btnYukleClick(Sender: TObject);
begin
  if edAydinlatma.ItemIndex = -1 then
  begin
    if id_tur = 'AR' then
    begin
      MessageDlg('Açýk Rýza Türü seçmelisiniz.', mtInformation, [mbOk]);
      exit;
    end;
    if id_tur = 'OO' then
    begin
      MessageDlg('Özel Onay Türü seçmelisiniz.', mtInformation, [mbOk]);
      exit;
    end;
  end;
  FileUp.Execute;
end;

function TfrmAcikRizaKayitTopluIslem.CheckImportTbl: boolean;
var
  regEx: TRegEx;
  match: TMatch;
begin
  result := true;
  beforepostcheck := false;
  // Added by TEVFIK 31.05.2023 17:40:23
  if tblImport.Active = False then tblImport.Active := True;
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

    if tblImport.FieldByName('kimlik_no').AsString = '' then
    begin
      tblImport.FieldByName('islemdurum').AsString := 'H';
      tblImport.FieldByName('islemmesaj').AsString := 'Kimlik No boþ olamaz.';
    end
    else
    if tblImport.FieldByName('adsoyad').AsString = '' then
    begin
      tblImport.FieldByName('islemdurum').AsString := 'H';
      tblImport.FieldByName('islemmesaj').AsString := 'Ad Soyad boþ olamaz.';
    end
    else
    if tblImport.FieldByName('gsmno').AsString = '' then
    begin
      tblImport.FieldByName('islemdurum').AsString := 'H';
      tblImport.FieldByName('islemmesaj').AsString := 'Cep Telefonu boþ olamaz.';
    end
    else
    if tblImport.FieldByName('durum').AsString = '' then
    begin
      tblImport.FieldByName('islemdurum').AsString := 'H';
      tblImport.FieldByName('islemmesaj').AsString := 'Durum boþ olamaz.';
    end
    else
    if tblImport.FieldByName('tarih').AsString = '' then
    begin
      tblImport.FieldByName('islemdurum').AsString := 'H';
      tblImport.FieldByName('islemmesaj').AsString := 'Tarih boþ olamaz.';
    end
    else
    if tblImport.FieldByName('saat').AsString = '' then
    begin
      tblImport.FieldByName('islemdurum').AsString := 'H';
      tblImport.FieldByName('islemmesaj').AsString := 'Saat boþ olamaz.';
    end;

    if tblImport.FieldByName('tarih').AsString <> '' then
    begin
      regEx.Create('(0?[1-9]|[12][0-9]|3[01])[\/\-\.](0?[1-9]|1[012])[\/\-\.]\d{4}');
      Match := regEx.Match(tblImport.FieldByName('tarih').AsString);
      if not Match.Success then
      begin
        tblImport.FieldByName('islemdurum').AsString := 'H';
        tblImport.FieldByName('islemmesaj').AsString := 'Tarih biçimi yanlýþ (GG.AA.YYYY).';
      end;
    end;

    if tblImport.FieldByName('saat').AsString <> '' then
    begin
      regEx.Create('([0-1]?[0-9]|2[0-3]):[0-5][0-9]');
      Match := regEx.Match(tblImport.FieldByName('saat').AsString);
      if not Match.Success then
      begin
        tblImport.FieldByName('islemdurum').AsString := 'H';
        tblImport.FieldByName('islemmesaj').AsString := 'Saat biçimi yanlýþ (SS:DD).';
      end;
    end;

    if tblImport.FieldByName('gsmno').AsString <> '' then
    begin
      regEx.Create('\([5][0-9]{2}\)[0-9]{7}');  //    '\(5\d{2}\)\d{7}');
      Match := regEx.Match(tblImport.FieldByName('gsmno').AsString);
      if not Match.Success then
      begin
        tblImport.FieldByName('islemdurum').AsString := 'H';
        tblImport.FieldByName('islemmesaj').AsString := 'Cep Telefonu biçimi yanlýþ ( (5XX)XXXXXXX ).';
      end;
    end;

//    if Pos(tblImport.FieldByName('email').AsString, '@') <= 0 then
//    begin
//      tblImport.FieldByName('islemdurum').AsString := 'H';
//      tblImport.FieldByName('islemmesaj').AsString := 'E-Mail biçimi yanlýþ.';
//    end;

    if Pos(','+tblImport.FieldByName('durum').AsString+',', ',AKTÝF,RIZA ALINMADI,PASÝF/ÝPTAL,FAALÝYET BÝTTÝ,RIZA GERÝ ÇEKÝLDÝ,') <= 0 then
    begin
      tblImport.FieldByName('islemdurum').AsString := 'H';
      tblImport.FieldByName('islemmesaj').AsString := 'Durum alaný yanlýþ. (AKTÝF,RIZA ALINMADI,PASÝF/ÝPTAL,FAALÝYET BÝTTÝ,RIZA GERÝ ÇEKÝLDÝ)';
    end;

    if (tblImport.FieldByName('durum').AsString = 'AKTÝF') or (tblImport.FieldByName('durum').AsString = 'RIZA ALINMADI') then
    begin
      tblImport.FieldByName('faal_bitis').Clear;
    end
    else
    begin
      if (tblImport.FieldByName('faal_bitis').AsString = '') or (tblImport.FieldByName('faal_bitis').AsString = '30.12.1899') then
      begin
        tblImport.FieldByName('islemdurum').AsString := 'H';
        tblImport.FieldByName('islemmesaj').AsString := 'Faaliyetin Bitiþ/Ýptal/Pasif Tarihi belirtilmemiþ.';
      end;
    end;


    result := result and (tblImport.FieldByName('islemdurum').AsString <> 'H');
    tblImport.post;
    tblImport.Next;
  end;
  beforepostcheck := true;
end;

function TfrmAcikRizaKayitTopluIslem.CheckImportRow: boolean;
var
  regEx: TRegEx;
  match: TMatch;
begin
  if tblImport.FieldByName('islemdurum').AsString = 'E' then exit;

  tblImport.FieldByName('islemdurum').AsString := 'I';
  tblImport.FieldByName('islemmesaj').AsString := 'Bilgiler tam ve uygun.';

  if tblImport.FieldByName('adsoyad').AsString = '' then
  begin
    tblImport.FieldByName('islemdurum').AsString := 'H';
    tblImport.FieldByName('islemmesaj').AsString := 'Ad Soyad boþ olamaz.';
  end
  else
  if tblImport.FieldByName('kimlik_no').AsString = '' then
  begin
    tblImport.FieldByName('islemdurum').AsString := 'H';
    tblImport.FieldByName('islemmesaj').AsString := 'Kimlik No boþ olamaz.';
  end
  else
  if tblImport.FieldByName('gsmno').AsString = '' then
  begin
    tblImport.FieldByName('islemdurum').AsString := 'H';
    tblImport.FieldByName('islemmesaj').AsString := 'Cep Telefonu boþ olamaz.';
  end
  else
  if tblImport.FieldByName('durum').AsString = '' then
  begin
    tblImport.FieldByName('islemdurum').AsString := 'H';
    tblImport.FieldByName('islemmesaj').AsString := 'Durum boþ olamaz.';
  end
  else
  if tblImport.FieldByName('tarih').AsString = '' then
  begin
    tblImport.FieldByName('islemdurum').AsString := 'H';
    tblImport.FieldByName('islemmesaj').AsString := 'Tarih boþ olamaz.';
  end
  else
  if tblImport.FieldByName('saat').AsString = '' then
  begin
    tblImport.FieldByName('islemdurum').AsString := 'H';
    tblImport.FieldByName('islemmesaj').AsString := 'Saat boþ olamaz.';
  end;

  if tblImport.FieldByName('tarih').AsString <> '' then
  begin
    regEx.Create('(0?[1-9]|[12][0-9]|3[01])[\/\-\.](0?[1-9]|1[012])[\/\-\.]\d{4}');
    Match := regEx.Match(tblImport.FieldByName('tarih').AsString);
    if not Match.Success then
    begin
      tblImport.FieldByName('islemdurum').AsString := 'H';
      tblImport.FieldByName('islemmesaj').AsString := 'Tarih biçimi yanlýþ (GG.AA.YYYY).';
    end;
  end;

  if tblImport.FieldByName('saat').AsString <> '' then
  begin
    regEx.Create('([0-1]?[0-9]|2[0-3]):[0-5][0-9]');
    Match := regEx.Match(tblImport.FieldByName('saat').AsString);
    if not Match.Success then
    begin
      tblImport.FieldByName('islemdurum').AsString := 'H';
      tblImport.FieldByName('islemmesaj').AsString := 'Saat biçimi yanlýþ (SS:DD).';
    end;
  end;

  if tblImport.FieldByName('gsmno').AsString <> '' then
  begin
    regEx.Create('\([5][0-9]{2}\)[0-9]{7}');  //    '\(5\d{2}\)\d{7}');
    Match := regEx.Match(tblImport.FieldByName('gsmno').AsString);
    if not Match.Success then
    begin
      tblImport.FieldByName('islemdurum').AsString := 'H';
      tblImport.FieldByName('islemmesaj').AsString := 'Cep Telefonu biçimi yanlýþ ( (5XX)XXXXXXX ).';
    end;
  end;

//    if tblImport.FieldByName('email').AsString <> '' then
//    begin
//      regEx.Create('/^\S+@\S+\.\S+$/');
//      Match := regEx.Match(tblImport.FieldByName('email').AsString);
//      if not Match.Success then
//      begin
//        tblImport.FieldByName('islemdurum').AsString := 'H';
//        tblImport.FieldByName('islemmesaj').AsString := 'E-Mail biçimi yanlýþ.';
//      end;
//    end;
//    if Pos(tblImport.FieldByName('email').AsString, '@') <= 0 then
//    begin
//      tblImport.FieldByName('islemdurum').AsString := 'H';
//      tblImport.FieldByName('islemmesaj').AsString := 'E-Mail biçimi yanlýþ.';
//    end;

  if Pos(','+tblImport.FieldByName('durum').AsString+',', ',AKTÝF,RIZA ALINMADI,PASÝF/ÝPTAL,FAALÝYET BÝTTÝ,RIZA GERÝ ÇEKÝLDÝ,') <= 0 then
  begin
    tblImport.FieldByName('islemdurum').AsString := 'H';
    tblImport.FieldByName('islemmesaj').AsString := 'Durum alaný yanlýþ. (AKTÝF,RIZA ALINMADI,PASÝF/ÝPTAL,FAALÝYET BÝTTÝ,RIZA GERÝ ÇEKÝLDÝ)';
  end
  else
  begin
    if (tblImport.FieldByName('durum').AsString = 'AKTÝF') or (tblImport.FieldByName('durum').AsString = 'RIZA ALINMADI') then
    begin
      tblImport.FieldByName('faal_bitis').Clear;
    end
    else
    begin
      if (tblImport.FieldByName('faal_bitis').AsString = '') or (tblImport.FieldByName('faal_bitis').AsString = '30.12.1899') then
      begin
        tblImport.FieldByName('islemdurum').AsString := 'H';
        tblImport.FieldByName('islemmesaj').AsString := 'Faaliyetin Bitiþ/Ýptal/Pasif Tarihi belirtilmemiþ.';
      end;
    end;
  end;

  result := (tblImport.FieldByName('islemdurum').AsString = 'I');
end;

function TfrmAcikRizaKayitTopluIslem.ExecImport(islem: String): Integer;
begin
  if islem='AR' then
  begin
    id_tur := islem;
    caption := 'Açýk Rýza Listesi Toplu Ekleme';
    lbAydinlatma.Caption := 'Açýk Rýza Türü';
    edAydinlatma.ListSource := dsAyd;

    QueryOpen(qAyd, 'SELECT id, tanim, kisi_id FROM def_data_aydinlatma  WHERE durum = ''YAYINDA'' AND ' +
                  'acik_riza = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY id');

  end
  else
  if islem='OO' then
  begin
    id_tur := islem;
    caption := 'Özel Onay Listesi Toplu Ekleme';
    lbAydinlatma.Caption := 'Özel Onay Türü';
    edAydinlatma.ListSource := dsOOTnm;

    QueryOpen(qOOTnm, 'SELECT id, tanim FROM def_data_ozelonay  WHERE durum = ''YAYINDA'' AND ' +
                    'onay_var = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY id');

  end
  else
    exit;

  grd.DataSource := dsImport;
  pnlImportButtons.visible := true;
  ShowModal;
end;

procedure TfrmAcikRizaKayitTopluIslem.FileUpCompleted(Sender: TObject;
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

procedure TfrmAcikRizaKayitTopluIslem.ProcessExcel(xlsxfile: string);
var
  y      : integer;
  durum    ,
  tarih    ,
  saat     ,
  tarihbit ,
  kimlik_no,
  adsoyad  ,
  gsmno    ,
  email    : String;
  tarihDate: TDateTime;
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
      tarih     := Xls.GetStringFromCell(y, 1);
      saat      := Xls.GetStringFromCell(y, 2);
      kimlik_no := Xls.GetStringFromCell(y, 3);
      adsoyad   := Xls.GetStringFromCell(y, 4);
      gsmno     := Xls.GetStringFromCell(y, 5);
      email     := Xls.GetStringFromCell(y, 6);

      if tarih <> '' then
        tarihDate := StrToDate(tarih);

      tblImport.insert;
      tblImport.fieldbyname('durum').AsString        := 'RIZA ALINMADI';
      tblImport.fieldbyname('tarih').AsDateTime      := tarihDate;
      tblImport.fieldbyname('saat').AsString         := saat;
      tblImport.fieldbyname('kimlik_no').AsString    := kimlik_no;
      tblImport.fieldbyname('adsoyad').AsString      := tr_upper(adsoyad);
      tblImport.fieldbyname('gsmno').AsString        := gsmno;
      tblImport.fieldbyname('email').AsString        := email;
      tblImport.fieldbyname('sirano').AsInteger      := y-1;
      tblImport.Post;
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

procedure TfrmAcikRizaKayitTopluIslem.tblImportBeforePost(DataSet: TDataSet);
begin
  if beforepostcheck = false then exit;

  checkImportRow;
end;

procedure TfrmAcikRizaKayitTopluIslem.grdColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
begin
  if SameText(Column.FieldName, 'groupstr') then begin end;
end;

procedure TfrmAcikRizaKayitTopluIslem.grdDrawColumnCell(Sender: TObject; ACol,
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
