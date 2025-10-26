unit unAcikRizaKayitTopluMesaj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, DateUtils,
  uniGUIClasses, uniGUIForm, Data.DB, DBAccess, Uni, MemDS, uniPanel, uniButton, uniBitBtn, uniEdit,
  uniMemo, uniDBMemo, uniDBEdit, uniLabel, uniGUIBaseClasses, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniGroupBox, uniRadioGroup, uniDBRadioGroup,
  uniBasicGrid, uniDBGrid, VirtualTable, uniDateTimePicker, uniDBNavigator,
  uniFileUpload, System.RegularExpressions,
  IdMessage, IdText, IdSSLOpenSSL, IdSMTP, IdGlobal,
  IdExplicitTLSClientServerBase, uniProgressBar;


type
  TfrmAcikRizaKayitTopluMesaj = class(TUniForm)
    qTmp: TUniQuery;
    tblImport: TVirtualTable;
    dsImport: TUniDataSource;
    FileUp: TUniFileUpload;
    pnlExcelImport: TUniContainerPanel;
    grd: TUniDBGrid;
    UniPanel1: TUniPanel;
    UniDBNavigator1: TUniDBNavigator;
    pnlMailButtons: TUniPanel;
    btnClose: TUniBitBtn;
    bTopluSmsGonder: TUniBitBtn;
    bTopluEMailGonder: TUniBitBtn;
    edMailMsg: TUniMemo;
    UniProgressBar1: TUniProgressBar;
    btnDurdur: TUniBitBtn;
    procedure btnCancelClick(Sender: TObject);
    procedure grdColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure tblImportBeforePost(DataSet: TDataSet);
    procedure grdDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure bTopluSmsGonderClick(Sender: TObject);
    procedure bTopluEMailGonderClick(Sender: TObject);
    procedure btnDurdurClick(Sender: TObject);
  private
    aydID,
    kisiID       : Integer;
    Aydlist,
    kisiList     : TStringList;
    id_tur       : String;
    islem        : String;
    durdur       : boolean;
    beforePostCheck: boolean;
    function CheckTbl: boolean;
    function CheckRow: boolean;
    procedure PrepareTable(ar_ids: String);
    function ParseMsg(AData: TUniMemo; APwd: String): TStringList;
    function SendMail(aAdr,APwd: String): Boolean;
    procedure HepsineSMSGonder(Sender: TComponent; Res: Integer);
    procedure HepsineEMailGonder(Sender: TComponent; Res: Integer);
  protected
  public
    function Exec(ar_ids: String): Integer;
  end;

function frmAcikRizaKayitTopluMesaj: TfrmAcikRizaKayitTopluMesaj;

implementation

uses uniGUIApplication, MainModule, McMLib, unErisimYetkiListe, ServerModule, KVKNetAPILib, JETSMSLib,UrlShortLib,
  unMailUtils;

{$R *.dfm}

function frmAcikRizaKayitTopluMesaj: TfrmAcikRizaKayitTopluMesaj;
begin
  Result := TfrmAcikRizaKayitTopluMesaj(MainMod.GetFormInstance(TfrmAcikRizaKayitTopluMesaj));
end;


procedure TfrmAcikRizaKayitTopluMesaj.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrClose;
end;

procedure TfrmAcikRizaKayitTopluMesaj.btnDurdurClick(Sender: TObject);
begin
  durdur := true;
end;

procedure TfrmAcikRizaKayitTopluMesaj.bTopluEMailGonderClick(Sender: TObject);
var
  mesaj: string;
begin
  islem:='emailgonder';
  if checktbl = false then
  begin
    MessageDlg('Bir veya daha fazla kayýtta hata bulunmaktadýr.'#13 +
               'Lütfen uyarý mesajlarýný kontrol ederek hatalý satýrlarý düzeltiniz.', mtError, [mbOk]);
    Exit;
  end;

  mesaj := IntToStr(tblImport.RecordCount) + ' kiþiye E-MAIL GÖNDERÝLECEK, devam etmek istediðinizden emin misiniz?';
  MessageDlg(mesaj, mtConfirmation, mbYesNo, HepsineEMailGonder);
end;

procedure TfrmAcikRizaKayitTopluMesaj.bTopluSmsGonderClick(Sender: TObject);
var
  mesaj: string;
begin
  islem:='smsgonder';
  if checktbl = false then
  begin
    MessageDlg('Bir veya daha fazla kayýtta hata bulunmaktadýr.'#13 +
               'Lütfen uyarý mesajlarýný kontrol ederek hatalý satýrlarý düzeltiniz.', mtError, [mbOk]);
    Exit;
  end;

  mesaj := IntToStr(tblImport.RecordCount) + ' kiþiye SMS GÖNDERÝLECEK, devam etmek istediðinizden emin misiniz?';
  MessageDlg(mesaj, mtConfirmation, mbYesNo, HepsineSMSGonder);
end;

function TfrmAcikRizaKayitTopluMesaj.CheckRow: boolean;
var
  regEx: TRegEx;
  match: TMatch;
begin
  result := true;

//    if tblImport.FieldByName('islemdurum').AsString = 'E' then
//      exit;

    if tblImport.FieldByName('id').AsString = '' then
      exit;

//    tblImport.edit;
    tblImport.FieldByName('islemdurum').AsString := 'I';
    tblImport.FieldByName('islemmesaj').AsString := 'Bilgiler tam ve uygun.';

//    if tblImport.FieldByName('adsoyad').AsString = '' then
//    begin
//      tblImport.FieldByName('islemdurum').AsString := 'H';
//      tblImport.FieldByName('islemmesaj').AsString := 'Ad Soyad boþ olamaz.';
//    end
//    else
//    if tblImport.FieldByName('gsmno').AsString = '' then
//    begin
//      tblImport.FieldByName('islemdurum').AsString := 'H';
//      tblImport.FieldByName('islemmesaj').AsString := 'Cep Telefonu boþ olamaz.';
//    end
//    else
//    if tblImport.FieldByName('durum').AsString = '' then
//    begin
//      tblImport.FieldByName('islemdurum').AsString := 'H';
//      tblImport.FieldByName('islemmesaj').AsString := 'Durum boþ olamaz.';
//    end
//    else
//    if tblImport.FieldByName('tarih').AsString = '' then
//    begin
//      tblImport.FieldByName('islemdurum').AsString := 'H';
//      tblImport.FieldByName('islemmesaj').AsString := 'Tarih boþ olamaz.';
//    end
//    else
//    if tblImport.FieldByName('saat').AsString = '' then
//    begin
//      tblImport.FieldByName('islemdurum').AsString := 'H';
//      tblImport.FieldByName('islemmesaj').AsString := 'Saat boþ olamaz.';
//    end;
//
//    if tblImport.FieldByName('tarih').AsString <> '' then
//    begin
//      regEx.Create('(0?[1-9]|[12][0-9]|3[01])[\/\-\.](0?[1-9]|1[012])[\/\-\.]\d{4}');
//      Match := regEx.Match(tblImport.FieldByName('tarih').AsString);
//      if not Match.Success then
//      begin
//        tblImport.FieldByName('islemdurum').AsString := 'H';
//        tblImport.FieldByName('islemmesaj').AsString := 'Tarih biçimi yanlýþ (GG.AA.YYYY).';
//      end;
//    end;
//
//    if tblImport.FieldByName('saat').AsString <> '' then
//    begin
//      regEx.Create('([0-1]?[0-9]|2[0-3]):[0-5][0-9]');
//      Match := regEx.Match(tblImport.FieldByName('saat').AsString);
//      if not Match.Success then
//      begin
//        tblImport.FieldByName('islemdurum').AsString := 'H';
//        tblImport.FieldByName('islemmesaj').AsString := 'Saat biçimi yanlýþ (SS:DD).';
//      end;
//    end;

    if islem='smsgonder' then
    begin
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
    end;

    if islem='emailgonder' then
    begin
      if Pos('@', tblImport.FieldByName('email').AsString) <= 0 then
      begin
        tblImport.FieldByName('islemdurum').AsString := 'H';
        tblImport.FieldByName('islemmesaj').AsString := 'E-Mail biçimi yanlýþ.';
      end;
    end;

//    if Pos(','+tblImport.FieldByName('durum').AsString+',', ',AKTÝF,RIZA ALINMADI,PASÝF/ÝPTAL,FAALÝYET BÝTTÝ,RIZA GERÝ ÇEKÝLDÝ,') <= 0 then
    if tblImport.FieldByName('durum').AsString <> 'RIZA ALINMADI' then
    begin
      tblImport.FieldByName('islemdurum').AsString := 'H';
      tblImport.FieldByName('islemmesaj').AsString := 'Durum "RIZA ALINMADI olmalý.';
    end;

//    if (tblImport.FieldByName('durum').AsString = 'AKTÝF') or (tblImport.FieldByName('durum').AsString = 'RIZA ALINMADI') then
//    begin
//      tblImport.FieldByName('faal_bitis').Clear;
//    end
//    else
//    begin
//      if (tblImport.FieldByName('faal_bitis').AsString = '') or (tblImport.FieldByName('faal_bitis').AsString = '30.12.1899') then
//      begin
//        tblImport.FieldByName('islemdurum').AsString := 'H';
//        tblImport.FieldByName('islemmesaj').AsString := 'Faaliyetin Bitiþ/Ýptal/Pasif Tarihi belirtilmemiþ.';
//      end;
//    end;


    result := result and (tblImport.FieldByName('islemdurum').AsString <> 'H');
//    tblImport.post;
  end;

function TfrmAcikRizaKayitTopluMesaj.CheckTbl: boolean;
var
  regEx: TRegEx;
  match: TMatch;
begin
  result := true;
  beforepostcheck := false;
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

//    if tblImport.FieldByName('adsoyad').AsString = '' then
//    begin
//      tblImport.FieldByName('islemdurum').AsString := 'H';
//      tblImport.FieldByName('islemmesaj').AsString := 'Ad Soyad boþ olamaz.';
//    end
//    else
//    if tblImport.FieldByName('gsmno').AsString = '' then
//    begin
//      tblImport.FieldByName('islemdurum').AsString := 'H';
//      tblImport.FieldByName('islemmesaj').AsString := 'Cep Telefonu boþ olamaz.';
//    end
//    else
//    if tblImport.FieldByName('durum').AsString = '' then
//    begin
//      tblImport.FieldByName('islemdurum').AsString := 'H';
//      tblImport.FieldByName('islemmesaj').AsString := 'Durum boþ olamaz.';
//    end
//    else
//    if tblImport.FieldByName('tarih').AsString = '' then
//    begin
//      tblImport.FieldByName('islemdurum').AsString := 'H';
//      tblImport.FieldByName('islemmesaj').AsString := 'Tarih boþ olamaz.';
//    end
//    else
//    if tblImport.FieldByName('saat').AsString = '' then
//    begin
//      tblImport.FieldByName('islemdurum').AsString := 'H';
//      tblImport.FieldByName('islemmesaj').AsString := 'Saat boþ olamaz.';
//    end;
//
//    if tblImport.FieldByName('tarih').AsString <> '' then
//    begin
//      regEx.Create('(0?[1-9]|[12][0-9]|3[01])[\/\-\.](0?[1-9]|1[012])[\/\-\.]\d{4}');
//      Match := regEx.Match(tblImport.FieldByName('tarih').AsString);
//      if not Match.Success then
//      begin
//        tblImport.FieldByName('islemdurum').AsString := 'H';
//        tblImport.FieldByName('islemmesaj').AsString := 'Tarih biçimi yanlýþ (GG.AA.YYYY).';
//      end;
//    end;
//
//    if tblImport.FieldByName('saat').AsString <> '' then
//    begin
//      regEx.Create('([0-1]?[0-9]|2[0-3]):[0-5][0-9]');
//      Match := regEx.Match(tblImport.FieldByName('saat').AsString);
//      if not Match.Success then
//      begin
//        tblImport.FieldByName('islemdurum').AsString := 'H';
//        tblImport.FieldByName('islemmesaj').AsString := 'Saat biçimi yanlýþ (SS:DD).';
//      end;
//    end;

    if islem='smsgonder' then
    begin
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
    end;

    if islem='emailgonder' then
    begin
      if Pos('@', tblImport.FieldByName('email').AsString) <= 0 then
      begin
        tblImport.FieldByName('islemdurum').AsString := 'H';
        tblImport.FieldByName('islemmesaj').AsString := 'E-Mail biçimi yanlýþ.';
      end;
    end;

//    if Pos(','+tblImport.FieldByName('durum').AsString+',', ',AKTÝF,RIZA ALINMADI,PASÝF/ÝPTAL,FAALÝYET BÝTTÝ,RIZA GERÝ ÇEKÝLDÝ,') <= 0 then
    if tblImport.FieldByName('durum').AsString <> 'RIZA ALINMADI' then
    begin
      tblImport.FieldByName('islemdurum').AsString := 'H';
      tblImport.FieldByName('islemmesaj').AsString := 'Durum "RIZA ALINMADI olmalý.';
    end;

//    if (tblImport.FieldByName('durum').AsString = 'AKTÝF') or (tblImport.FieldByName('durum').AsString = 'RIZA ALINMADI') then
//    begin
//      tblImport.FieldByName('faal_bitis').Clear;
//    end
//    else
//    begin
//      if (tblImport.FieldByName('faal_bitis').AsString = '') or (tblImport.FieldByName('faal_bitis').AsString = '30.12.1899') then
//      begin
//        tblImport.FieldByName('islemdurum').AsString := 'H';
//        tblImport.FieldByName('islemmesaj').AsString := 'Faaliyetin Bitiþ/Ýptal/Pasif Tarihi belirtilmemiþ.';
//      end;
//    end;


    result := result and (tblImport.FieldByName('islemdurum').AsString <> 'H');
    tblImport.post;
    tblImport.Next;
  end;
  beforepostcheck := true;
end;

function TfrmAcikRizaKayitTopluMesaj.Exec(ar_ids: String): Integer;
begin
  islem := '';
  preparetable(ar_ids);
  ShowModal;
end;

procedure TfrmAcikRizaKayitTopluMesaj.tblImportBeforePost(DataSet: TDataSet);
var
  REgEx: TRegEx;
  match: TMatch;
begin
  if beforepostcheck then checkRow;
end;

procedure TfrmAcikRizaKayitTopluMesaj.grdColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
begin
  if SameText(Column.FieldName, 'groupstr') then begin end;
end;

procedure TfrmAcikRizaKayitTopluMesaj.grdDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if column.FieldName = 'mesaj' then
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

procedure TfrmAcikRizaKayitTopluMesaj.HepsineEMailGonder(Sender: TComponent; Res: Integer);
var
  s: integer;
begin
  if Res <> mrYes then Exit;
  durdur := False;
  btndurdur.Visible := true;
  beforePostCheck := false;
  tblImport.First;
  UniProgressBar1.Visible := true;
  UniProgressBar1.Min := 1;
  UniProgressBar1.Max := tblImport.RecordCount;
  s := 1;
  grd.loadmask.message := 'E-Mail Gönderiliyor 0 / ' + IntToStr(tblImport.recordcount);
  UniSession.Synchronize;
  while not tblImport.Eof do
  begin
    if tblImport.FieldByName('islemdurum').AsString <> 'I' then
    begin
      tblImport.next;
      continue;
    end;

    edMailMsg.Lines.LoadFromFile(ServerMod.FilesFolderPath + 'temp_mail/arlinkmail.htm');
//    GenelSendEmail(tblImport.FieldByName('email').AsString ,
//    'AÇIK RIZA Hk. - KVKNET' ,
//     ParseMsg(edMailMsg, tblImport.FieldByName('weblink').AsString).Text) ;
//    if not SendMail(tblImport.FieldByName('email').AsString, tblImport.FieldByName('weblink').AsString) then
    if not GenelSendEmail(tblImport.FieldByName('email').AsString ,
    'AÇIK RIZA Hk. - KVKNET' ,
     ParseMsg(edMailMsg, tblImport.FieldByName('weblink').AsString).Text) then
    begin
      tblImport.Edit;
      tblImport.FieldByName('islemdurum').AsString := 'H';
      tblImport.FieldByName('islemmesaj').AsString := 'E-Mail gönderilemedi! ';
      tblImport.Post;
    end
    else
    begin
      tblImport.Edit;
      tblImport.FieldByName('islemdurum').AsString := 'E';
      tblImport.FieldByName('islemmesaj').AsString := 'E-Mail gönderildi';
      tblImport.Post;
    end;

    if s mod 2 = 0 then
    begin
      grd.loadmask.message := 'E-Mail Gönderiliyor ' + IntToStr(s) + ' / ' + IntToStr(tblImport.recordcount);
      UniProgressBar1.Position := s;
      UniSession.Synchronize;
    end;
    if durdur then Break;
    s := s + 1;
    tblImport.Next;
  end;
  if durdur = false then
    MessageDlg('Gönderim tamamlandý', mtInformation, [mbOk])
  else
    MessageDlg('Gönderim Kullanýcý tarafýndan durduruldu. (' + IntToStr(s) + ' / ' + IntToStr(tblImport.recordcount) + ' gönderildi.', mtInformation, [mbOk]);

  btndurdur.visible := false;
end;

procedure TfrmAcikRizaKayitTopluMesaj.HepsineSMSGonder(Sender: TComponent; Res: Integer);
var
  mesaj: string;
  GSMNo: string;
  Fast: Boolean;
  s: integer;
  msgA,
  rcptA,
  idA,
  rsltA: TSTringList;
  i: Integer;
  id, rslt,UrlLink: string;
  UName, UPwd, Origin, addr: string;
begin
  if Res <> mrYes then Exit;
  beforepostcheck := false;
  durdur := False;
  btndurdur.Visible := true;
  beforePostCheck := false;
  tblImport.First;
  UniProgressBar1.Visible := true;
  UniProgressBar1.Min := 1;
  UniProgressBar1.Max := tblImport.RecordCount;
  s := 1;
  grd.loadmask.message := 'SMS Gönderiliyor 0 / ' + IntToStr(tblImport.recordcount);
//  ShowMask('SMS Gönderiliyor 0 / ' + IntToStr(tblImport.recordcount));


// JETSMS toplu hýzlý gönderim þeklinde tasarlanmýþ fakat diðer saðlayýcýlar desteklemediði için yeniden yazýldý
  if mainmod.qMCParam.FieldByName('sms_saglayici').AsString = 'JETSMS' then
  begin
    msgA := TStringList.Create;
    rcptA := TStringList.Create;
    idA := TStringList.Create;

    tblImport.First;
    while not tblImport.Eof do
    begin
      GSMNo := tblImport.FieldByName('gsmno').AsString;
      GSMNo := StringReplace(GSMNo, '(', '', [rfReplaceAll]);
      GSMNo := StringReplace(GSMNo, ')', '', [rfReplaceAll]);

      URLLink := GetShortUrl(tblImport.FieldByName('weblink').AsString);
      if URLLink = 'Error' then
        URLLink := tblImport.FieldByName('weblink').AsString;

      Mesaj := Trim(MainMod.qMCDef.FieldByName('title').AsString) +
        ' ONAY/AÇIK RIZA iþlemlerini tamamlamak için ' + URLLink + ' adresindeki formu onaylayabilirsiniz.';

      rcptA.Add(gsmNo);
      msgA.Add(mesaj);
      idA.Add(tblImport.FieldByName('id').AsString);

      tblImport.Next;
    end;

    uName  :=  mainmod.qMCParam.fieldbyname('sms_username').AsString;
    origin := mainmod.qMCParam.fieldbyname('sms_origin').AsString;
    addr   := mainmod.qMCParam.fieldbyname('sms_host').AsString;
    uPwd :=   mainmod.qMCParam.fieldbyname('sms_password').AsString;
    uPwd := DecryptStr(uPwd);

    rsltA := sendSMSA(msga, rcpta, ida, false, UName, UPwd, Origin, addr);

    if rslta.count = 1 then
      if copy(rsltA[0], 1, 5) = 'HATA:' then
      begin
        MessageDlg(rsltA[0], mtError, [mbOk]);
        exit;
      end;

    for i := 0 to rsltA.Count-1 do
    begin
      id := copy(rsltA[i], 1, pos(':', rsltA[i])-1);
      rslt := copy(rsltA[i], pos(':', rsltA[i])+1, length(rsltA[i])-pos(':', rsltA[i]));

      if tblImport.Locate('id', id, []) then
      begin
      tblImport.Edit;
      tblImport.FieldByName('islemdurum').AsString := 'E';
      tblImport.FieldByName('islemmesaj').AsString := 'SMS gönderildi';
      tblImport.Post;
      end;
    end;
  end
  else
  begin
    tblImport.First;
    while not tblImport.Eof do
    begin
      GSMNo := tblImport.FieldByName('gsmno').AsString;
      GSMNo := StringReplace(GSMNo, '(', '', [rfReplaceAll]);
      GSMNo := StringReplace(GSMNo, ')', '', [rfReplaceAll]);

      URLLink := GetShortUrl(tblImport.FieldByName('weblink').AsString);
      if URLLink = 'Error' then
        URLLink := tblImport.FieldByName('weblink').AsString;

      Fast  := (MainMod.qMCParam.FieldByName('sms_otp_aktif').AsString = 'E'); //
      Mesaj := Trim(MainMod.qMCDef.FieldByName('title').AsString) +
        ' ONAY/AÇIK RIZA iþlemlerini tamamlamak için ' + URLLink + ' adresindeki formu onaylayabilirsiniz.';

      if not KVKNetAPILib.SendSMS(Mesaj, GSMNo, Fast, UniGuiApplication.UniApplication.RemoteAddress,'01AR', tblImport.FieldByName('id').AsInteger) then
      begin
        MessageDlg(Mesaj, mtError, [mbOk]);
        MainMod.SaveSMSLog(MainMod.MCID, tblImport.FieldByName('id').AsInteger, 0, '01AR', '', 'HATA : ' + Mesaj);
      end
      else
      begin
        //MainMod.SaveSMSLog(MainMod.MCID, tblImport.FieldByName('id').AsInteger, 1, '01AR', '', 'ÝÞLEM BAÞARILI : ' + Mesaj);
        tblImport.Edit;
        tblImport.FieldByName('islemdurum').AsString := 'E';
        tblImport.FieldByName('islemmesaj').AsString := 'SMS gönderildi';
        tblImport.Post;
      end;

      tblImport.Next;
    end;
  end;

  btndurdur.visible := false;
  beforepostcheck := true;
end;

function TfrmAcikRizaKayitTopluMesaj.ParseMsg(AData: TUniMemo; APwd: String): TStringList;
var
  i   : Integer;
  Tmp      : String;
  UName    : String;
begin
  Result := TStringList.Create;

  for i := 0 to AData.Lines.Count - 1 do
  begin
    Tmp := AData.Lines[i];
    Tmp := Str2HTMLStr(StringReplace(Tmp, '%%%COMPNAME%%%', Trim(MainMod.qMCDef.FieldByName('title').AsString),    [rfReplaceAll]));
    Tmp := Str2HTMLStr(StringReplace(Tmp, '%%%UNAME%%%',    tblImport.FieldByName('adsoyad').AsString,   [rfReplaceAll]));
    Tmp := Str2HTMLStr(StringReplace(Tmp, '%%%AYD%%%',    tblImport.FieldByName('ayd_tanim').AsString,   [rfReplaceAll]));
    Tmp := Str2HTMLStr(StringReplace(Tmp, '%%%WEBLINK%%%',     APwd,    [rfReplaceAll]));
    Result.Add(Tmp);
  end;
end;

procedure TfrmAcikRizaKayitTopluMesaj.PrepareTable(ar_ids: String);
var
  s: integer;
begin
  if tblImport.State = dsInactive then
    tblImport.Open;

  tblImport.First;
  while not tblImport.EOF do
    tblImport.Delete;

  queryOpen(qtmp, 'SELECT rz.id, rz.durum, rz.tarih, rz.saat, rz.ad_soyad, rz.gsmno, rz.email, rz.kimlik_no, ' +
                  'rz.aguid, rz.id_tur, (select ks.kisi from def_data_kisi ks where ks.id=rz.kisi_id) kisi_tanim, ' +
                  'case when rz.id_tur=''AR'' then (select ayd.tanim from def_data_aydinlatma ayd where ayd.id=rz.ayd_id) ' +
                  'when rz.id_tur=''OO'' then (select oo.tanim from def_data_ozelonay oo where oo.id=rz.ayd_id) end ayd_tanim ' +
                  'FROM data_acikriza rz ' +
                  'WHERE rz.id in ('+ ar_ids + ')');

  beforepostcheck := true;
  s := 1;
  while not qtmp.eof do
  begin
    tblImport.insert;
    tblImport.fieldbyname('id').AsInteger        := qTmp.FieldByName('id').AsInteger;
    tblImport.fieldbyname('durum').AsString      := qTmp.FieldByName('durum').AsString;
    tblImport.fieldbyname('tarih').AsDateTime    := qTmp.FieldByName('tarih').AsDateTime;
    tblImport.fieldbyname('saat').AsString       := qTmp.FieldByName('saat').AsString;
    tblImport.fieldbyname('kimlik_no').AsString  := qTmp.fieldbyname('kimlik_no').AsString;
    tblImport.fieldbyname('adsoyad').AsString    := qTmp.fieldbyname('ad_soyad').AsString;
    tblImport.fieldbyname('gsmno').AsString      := qTmp.fieldbyname('gsmno').AsString;
    tblImport.fieldbyname('email').AsString      := qTmp.fieldbyname('email').AsString;
    tblImport.fieldbyname('aguid').AsString      := qTmp.fieldbyname('aguid').AsString;
    tblImport.fieldbyname('id_tur').AsString     := qTmp.fieldbyname('id_tur').AsString;
    tblImport.fieldbyname('weblink').AsString    := MainMod.AcikRizaLink + qTmp.FieldByName('aguid').AsString;
    tblImport.fieldbyname('sirano').AsInteger    := s;
    tblImport.fieldbyname('kisi_tanim').AsString := qTmp.fieldbyname('kisi_tanim').AsString;
    tblImport.fieldbyname('ayd_tanim').AsString  := qTmp.fieldbyname('ayd_tanim').AsString;
    tblImport.Post;
    s := s+1;
    qTmp.Next;
  end;
  qTmp.Close;
end;

function TfrmAcikRizaKayitTopluMesaj.SendMail(aAdr, APwd: String): Boolean;
var
  MailAdr    ,
  SenderAcc  ,
  SenderPwd  ,
  SenderHost ,
  SenderPort : String;
  senderSSL  : Boolean;
  senderTLS  : Integer;
  SMTP       : TIdSMTP;
  Msg        : TIdMessage;
  SSLHandler : TIdSSLIOHandlerSocketOpenSSL;
  HTMLMsg    : TStringList;
begin
  QueryOpen(mainmod.qTmp, 'select smtp_username, smtp_password, smtp_host, smtp_port, smtp_ssl, smtp_usetls from sys_param_mc where mc_id=' + IntToStr(mainmod.MCID));
  senderAcc  := mainmod.qTmp.fieldByName('smtp_username').AsString;
  senderPwd  := mainMod.qTmp.FieldByName('smtp_password').AsString;
  senderHost := mainmod.qTmp.fieldByName('smtp_host').AsString;
  senderPort := mainMod.qTmp.FieldByName('smtp_port').AsString;
  senderSSL  := (mainMod.qTmp.FieldByName('smtp_ssl').AsString = 'E');
  senderTLS  := mainMod.qTmp.FieldByName('smtp_usetls').AsInteger;

  if (SenderAcc = '') or (SenderPwd = '') then
  begin
//    MessageDlg('Firma Mail Hesabý tanýmlanmamýþ. Lütfen kurum parametrelerini kontrol ediniz.', mtError, [mbOk]);
    result := false;
    Exit;
  end;
  if (SenderHost = '') or (SenderPort = '') then
  begin
//    MessageDlg('Firma Mail Sunucu ayarlarý yapýlmamýþ. Lütfen kurum parametrelerini kontrol ediniz.', mtError, [mbOk]);
    result := false;
    Exit;
  end;

  senderPwd := DecryptStr(senderPwd);

  MailAdr  := aAdr;

  Msg := TIdMessage.Create(nil);
  try
    Msg.From.Address := SenderAcc;
    Msg.Recipients.EMailAddresses := MailAdr;
    Msg.Subject      := 'AÇIK RIZA Hk. - KVKNET';
    Msg.ContentType  := 'multipart/mixed';
    with TIdText.Create(Msg.MessageParts, nil) do begin
      // Body.Text := 'HTML goes here';
      HTMLMsg := ParseMsg(edMailMsg, APwd);
      Body.Assign(HTMLMsg);
      // Body.LoadFromFile('index.html');
      ContentType := 'text/html';
    end;

    SSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    SMTP := TIdSMTP.Create(nil);
    try
      SSLHandler.MaxLineAction := maException;
      SSLHandler.SSLOptions.Method := sslvTLSv1_2;//sslvTLSv1; // sslvSSLv23;
      SSLHandler.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
      SSLHandler.SSLOptions.Mode := sslmClient; // sslmUnassigned;
      SSLHandler.SSLOptions.VerifyMode := [];
      SSLHandler.SSLOptions.VerifyDepth := 0;

      if senderSSl then
      begin
        SMTP.IOHandler := SSLHandler;
        SMTP.UseTLS := TIdUseTLS(senderTLS);
      end;
      SMTP.AuthType  := satDefault;
      SMTP.Host      := SenderHost;
      SMTP.Port      := StrToIntDef(SenderPort, 0);
      SMTP.Username  := SenderAcc;
      SMTP.Password  := SenderPwd;
      SMTP.ConnectTimeout := 10000;
      SMTP.Connect;
      if SMTP.Connected then
      begin
        SMTP.Authenticate;
        SMTP.Send(Msg);
        SMTP.Disconnect;
        Result := True;
      end;
    finally
      SMTP.Free;
      SSLHandler.Free;
    end;
  finally
    Msg.Free;
  end;
  if not Result then
  begin
    MessageDlg('Mail gönderilirken hata oluþtu. Ýþlem baþarýsýz.', mtError, [mbOk]);
    Exit;
  end;
end;

end.
