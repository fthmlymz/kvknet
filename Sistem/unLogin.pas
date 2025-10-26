unit unLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniLabel, uniEdit, uniButton, uniBitBtn,
  uniImage, IniFiles, Vcl.Imaging.jpeg, unIKCUSSOLib, uniTimer, MainModule,math,mcmlib,StrUtils,netencoding,
  uniMultiItem, uniComboBox, Data.DB, MemDS, DBAccess, Uni, uniDBComboBox,
  uniDBLookupComboBox, uniRadioGroup, uniPanel, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP,System.JSON, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, uniMemo;

type
 // tLDAPType = (ltBos,ltActifDirectory,LtOpenLdap);

  TfrmLogin = class(TUniLoginForm)
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    edUserName: TUniEdit;
    edUserPwd: TUniEdit;
    btnOk: TUniBitBtn;
    UniLabel3: TUniLabel;
    edCaptcha: TUniEdit;
    lbCaptcha: TUniLabel;
    LBKURUMKODU: TUniLabel;
    edCompCode: TUniEdit;
    UniBitBtn1: TUniBitBtn;
    UniImage1: TUniImage;
    tmrUBYS: TUniTimer;
    btnChangeLogin: TUniLabel;
    edUserNameLDAP: TUniEdit;
    btnUBYS: TUniLabel;
    qkuramlar: TUniQuery;
    cbkurumlar: TUniDBLookupComboBox;
    dskurumlar: TUniDataSource;
    cpnllogin: TUniContainerPanel;
    cpnlKurum: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    cbxdogrulama: TUniComboBox;
    lb2fdogrulama: TUniLabel;
    procedure UniLoginFormCreate(Sender: TObject);
    procedure UniLoginFormBeforeShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure tmrUBYSTimer(Sender: TObject);
    procedure btnChangeLoginClick(Sender: TObject);
    procedure btnUBYSClick(Sender: TObject);
    procedure UniLoginFormAfterShow(Sender: TObject);
    procedure kurumSelect(Sender: TObject);
    procedure UniLabel5Click(Sender: TObject);
    procedure edCompCodeChange(Sender: TObject);
  private
    SysState         ,
    ActiveCaptchaStr : String;
    ActiveCaptchaInt : Integer;
    ErrCount : Integer;
    InTest   : Boolean;
    LDAPActive : Boolean;
    LDAPtYPE : tLDAPType;
    SSOtYPE : TSSOType;
    SSOGirisZorunlu : boolean;
    SSOkodKontrol  : integer;
    UBYSURL    : String;
    UBYSToken  : String;
    OtoLogin    : boolean;
    AydinlatmaLink : string;
    UpdatingKurumKodu : boolean;
    guid_id : string;
    procedure CreateCaptcha;
//    function Slashcontrol(Astring: string): string;
    function RandomSayiUret: integer;
    procedure setAldinlatmaLink;
//    function GetIDMAPPTokenAndUserInfo(const Code: string): string;
  public
  end;

function frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses
  uniGUIVars, ServerModule, uniGUIApplication, unKullaniciParolaSifirla,
  unTwoFAInputForm,unTwoFactorAuth, unIDMAPPService;

function frmLogin: TfrmLogin;
begin
  Result := TfrmLogin(MainMod.GetFormInstance(TfrmLogin));
end;

procedure TfrmLogin.btnChangeLoginClick(Sender: TObject);
begin
  if LDAPActive then
  begin
    LDAPActive := false;
    btnChangeLogin.Caption := 'LDAP Kullanýcý Hesabý ile giriþ için týklayýnýz';
    edUserNameLDAP.Visible := false;
    edUserName.Visible := true;
  end
  else
  begin
    LDAPActive := true;
    btnChangeLogin.Caption := 'KVKNET Kullanýcý Hesabý ile giriþ için týklayýnýz';
    edUserNameLDAP.Visible := true;
    edUserName.Visible := false;
  end;

end;

procedure TfrmLogin.btnOkClick(Sender: TObject);
var
  FID : Integer;
  userCode : string;
  Attempt: Integer;
  Verified: Boolean;
begin
  if SysState <> 'E' then
  begin
    MessageDlg('KVKNET sunucularý bakýma alýnmýþtýr. Geçici bir süreyle hizmet veremiyoruz. Lütfen daha sonra tekrar deneyiniz.', mtInformation, [mbOk]);
    ModalResult := mrCancel;
  end;

  if edCaptcha.Text = '' then
  begin
    MessageDlg('Kontrol sonucu girilmemiþ.', mtError, [mbOk]);
    Inc(ErrCount);
    if ErrCount > 3 then ModalResult := mrCancel;
    Exit;
  end;
  if edCaptcha.Text <> IntToStr(ActiveCaptchaInt) then
  begin
    MessageDlg('Kontrol sonucu hatalý girilmiþ.', mtError, [mbOk]);
    CreateCaptcha;
    Inc(ErrCount);
    if ErrCount > 3 then ModalResult := mrCancel;
    Exit;
  end;

  FID := MainMod.CheckLogin(edCompCode.Text, ifthen(not LDAPActive, edUserName.Text,edUserNameLDAP.Text), edUserPwd.Text, LDAPtYPE, LDAPActive);

  if cbxdogrulama.ItemIndex > -1 then
    mainmod.TwoFaMetod := GetUser2FAMethod(MainMod.LoginInfo.ID, cbxdogrulama);

   if mainmod.TwoFaMetod = tfmSMS then
        begin

              QueryOpen(mainmod.qTmp, 'select phone from usr_user where id='+inttostr(MainMod.LoginInfo.ID)+
              ' and mc_id='+ inttostr(MainMod.LoginInfo.MCID)) ;

           if (mainmod.qTmp.fieldbyname('phone').AsString = '') or
                  (length(mainmod.qtmp.fieldbyname('phone').AsString) < 12 ) then
            begin
              MessageDlg('Cep Telefonu numarasý girilmemiþ. Lütfen kontrol ediniz.',mtConfirmation,[mbOK]) ;
              FID := -14;
              close;
            end;
        end;

  if cbxdogrulama.ItemIndex > -1 then
  begin
      if (FID > 0) and (mainmod.LoginType = ltyBos) and (MainMod.TwoFaMetod <> tfmNone)   then
      begin
        mainmod.LoginUser := MainMod.LoginInfo.ID;
    //    mainmod.TwoFaMetod := GetUser2FAMethod(MainMod.LoginInfo.ID);
        mainmod.Handler := GetTwoFAHandler(mainmod.TwoFaMetod);
        mainmod.Code := mainmod.handler.GenerateCode(MainMod.LoginInfo.ID);
        mainmod.Handler.SendCode(MainMod.LoginInfo.ID,mainmod.code);
        mainmod.Current2FAHandler := mainmod.Handler;
        MainMod.FTwoFaSecret := GetUserSecret(mainmod.LoginInfo.ID);

        Verified := false;



        for Attempt := 1 to 3 do
        begin
          if mainmod.TwoFaMetod = tfmTOTP then
          begin
            if frmTwoFAInput.Execute(UserCode, MainMod.TwoFAExpire, MainMod.TwoFASecret) = mrOk then
            begin
              if mainmod.Handler.VerifyCode(mainmod.LoginInfo.ID, UserCode) then
              begin
                Verified := True;
                Break;
              end
              else
                MessageDlg('Kod yanlýþ! Kalan deneme hakký: ' + IntToStr(3 - Attempt), mtWarning, [mbOK]);
            end
            else
            begin
              FID := -12;
              close;
              //Break;
            end;
          end
          else
          begin
            if frmTwoFAInput.Execute(UserCode, MainMod.TwoFAExpire) = mrOk then
            begin
              if mainmod.Handler.VerifyCode(mainmod.LoginUser, UserCode) then
              begin
                Verified := True;
                Break;
              end
              else
                MessageDlg('Kod yanlýþ! Kalan deneme hakký: ' + IntToStr(3 - Attempt), mtWarning, [mbOK]);
            end
            else
            begin
              //FID := -12;
              close;
              Break;
            end;
          end;
        end;

      end;
  end;




  if FID > 0 then
  begin
    ErrCount := 0;
    MainMod.OpenTables;

    if  not MainMod.CheckAndCreateUserSession(MainMod.LoginInfo.ID,MainMod.ipAdress) then
    begin
      MessageDlg( 'Bu kullanýcý baþka bir makinada oturum açmýþtý.',mtError,[mbYes]);
//      MessageDlg( 'Bu kullanýcý zaten baþka bir cihazda oturum açtý. Lütfen önce diðer oturumu kapatýn.',mtError,[mbYes]);
//      exit;
    end;

    // doðan akçay session ile user_id birleþtirmek için
    servermod.AddUserSession(inttostr(FID), UniSession);

    ModalResult:= mrOK;  // Login is valid so proceed to MainForm
  end
  else
  begin
    Inc(ErrCount);
    CreateCaptcha;
    case FID of
      -1 : MessageDlg('Hatalý kurum kodu. Lütfen kontrol ediniz.', mtError, [mbOk]);
      -2 : MessageDlg('Kurum bilgileri eriþime kapalý. Lütfen sistem yöneticisi ile görüþünüz.', mtError, [mbOk]);
      -3 : MessageDlg('Firma bilgileri eriþime kapalý. Lütfen sistem yöneticisi ile görüþünüz.', mtError, [mbOk]);
      -4 : MessageDlg('Hatalý kullanýcý bilgileri. Lütfen kontrol ediniz.', mtError, [mbOk]);
      -5 : MessageDlg('Kullanýcýnýn sisteme giriþi kapalý. Lütfen sistem yöneticisi ile görüþünüz.', mtError, [mbOk]);
      -6 : MessageDlg('Hatalý kullanýcý bilgileri. Lütfen kontrol ediniz.', mtError, [mbOk]);
      -7 : MessageDlg('Ldap Baðlanýlamadý.', mtError, [mbOk]);
      -8 : MessageDlg('Ldap kullanýcý Doðrulanamadý', mtError, [mbOk]);
      -9 : MessageDlg('SSO kullanýcý Doðrulamsý yapýlamad',mtError,[mbOK]) ;
      -10: MessageDlg('Ldap parametreleri tanýmlanmamýþtýr. Lütfen kontrol ediniz',mtError ,[mbOk]	);
      -11: MessageDlg('Token alýnamadý',mtError ,[mbOk]	);
      -12 : MessageDlg('Ýki Faktörlü doðrulama yapýlamadý',mtError,[mbOk]);
      -13 : MessageDlg('Giriþ iptal edildi',mtError,[mbOk]);
      -14 : MessageDlg('SMS doðrulamasý için Telefon tanýmlanmamýþtýr.',mtError,[mbOK]);
      -101 : MessageDlg('Ýstek boþ olamaz!',mtError ,[mbOk]);
      -102 : MessageDlg('Kullanýcý adý boþ geçilemez!',mtError ,[mbOk]);
      -103 : MessageDlg('Þifre boþ geçilemez!',mtError ,[mbOk]);
      -104 : MessageDlg('Kullanýcý adý veya þifre hatalý!',mtError ,[mbOk]);
      -105 : MessageDlg(' Þifre kullaným süresi dolmuþtur. Lütfen BYS'' den þifre deðiþikliði yapýp tekrar deneyiniz!',mtError ,[mbOk]);
      -106 : MessageDlg('Ýstek boþ olamaz!',mtError ,[mbOk]);
      -107 : MessageDlg('Ýstek boþ olamaz!',mtError ,[mbOk]);
    end;
    if ErrCount > 3 then ModalResult := mrCancel;
  end;
end;

procedure TfrmLogin.btnUBYSClick(Sender: TObject);
var
  AuthURL: string;
  Girislink :string;
begin
  if MainMod.SSOType = stUbys then
  begin
    AuthURL := 'http://ubs.ikc.edu.tr/Framework/Integration/Authenticater/Authenticate?authToken=' + UBYSURL;
    MainMod.LoginType := ltyUbys;
  end
  else if MainMod.SSOType = stSSO then
  begin
     // sdu üniversitesi
     // id_token için https://sts4.sdu.edu.tr/connect/authorize?response_type=id_token&client_id=kvknet&redirect_uri=https://giris.kvknet.com.tr/&scope=openid&nonce=123
     //access-token için: https://sts4.sdu.edu.tr/connect/authorize?response_type=token&client_id=kvknet&redirect_uri=https://giris.kvknet.com.tr/&scope=api_kimlik_no
    SSOkodKontrol := RandomSayiUret;
    Girislink :=  Slashcontrol( MainMod.GetSysParam(mainmod.qTmp,'KVKNET GÝRÝÞ LINK'));
    AuthURL := UBYSURL +
               '?response_type=id_token' +
               '&client_id=' + 'kvknet' +
               '&redirect_uri=' + Slashcontrol( MainMod.GetSysParam(mainmod.qTmp,'KVKNET GÝRÝÞ LINK'))+
               '&scope=openid%20kimlik_no&nonce='+ IntToStr( SSOkodKontrol);
    mainmod.LoginType := ltySSO;
  end
  else if mainmod.SSOType = stCasSSO then
  begin
    Girislink :=  TNetEncoding.URL.Encode(Slashcontrol( MainMod.GetSysParam(mainmod.qTmp,'KVKNET GÝRÝÞ LINK')));
    AuthURL := UBYSURL + girislink;
    mainmod.LoginType := ltyCasSSO;
  end
  else if mainmod.SSOType = stIDMAPP then
  begin

//    CLIENT_ID     = 'kvknet';       // size verilen client_id
//    CLIENT_SECRET = 'OnnliAkbn8pGzL1wZXdHErV0tGCPqrWw';   // gerekliyse
//    REDIRECT_URI  = {'https://www.google.com/';//'http://localhost:8077';//}'http://localhost:8085/callback';
//    AUTH_ENDPOINT = 'https://login2.uab.gov.tr/realms/master/protocol/openid-connect/auth';
//    TOKEN_ENDPOINT = 'https://login2.uab.gov.tr/realms/master/protocol/openid-connect/token';
//    USERINFO_ENDPOINT = 'https://login.uab.gov.tr/realms/master/protocol/openid-connect/userinfo';
//    SCOPE = 'openid profile email';

    Girislink := MainMod.GetSysParam(mainmod.qTmp,'KVKNET GÝRÝÞ LINK');
    AuthURL := MainMod.GetSysParam(mainmod.qTmp,'UBYS URL');

    AuthURL := //'https://login2.uab.gov.tr/realms/master/protocol/openid-connect/auth'+
              AuthURL +
             '?response_type=code' +
             '&client_id=' + 'kvknet' +
             '&redirect_uri=' + TNetEncoding.URL.Encode(Slashcontrol(Girislink)) +
             '&scope=' + TNetEncoding.URL.Encode('openid profile email') +
             '&state=xyz123';

     mainmod.LoginType := ltyIDMAPP;
  end;
  UniSession.UrlRedirect(AuthURL);

    //'f.method="POST"; '
end;

function TfrmLogin.RandomSayiUret: integer;
begin
  Randomize;
  result := RandomRange(1,10000);
end;

//function TfrmLogin.Slashcontrol(Astring  : string) :string;
//begin
//  if  (Length(Astring) > 0) and (Astring[Length(Astring)] <> '/') then
//    result := Astring+'/'
//    else
//    result := Astring;
//end;

procedure TfrmLogin.CreateCaptcha;
var
  a, b, c : Integer;
  Top     : Integer;
begin
  Randomize;
  a := Random(10);
  b := Random(10);
  c := Random(10);
  Top := a + b;
  ACtiveCaptchaStr := '( ' + IntToStr(a) + ' + ' + IntToStr(b) + ' )';

  if Top > c then
  begin
    Top := Top - c;
    ACtiveCaptchaStr := ACtiveCaptchaStr + ' - ' + IntToStr(c) + ' = ';
  end
  else
  begin
    Top := Top + c;
    ACtiveCaptchaStr := ACtiveCaptchaStr + ' + ' + IntToStr(c) + ' = ';
  end;
  ActiveCaptchaInt := Top;
  lbCaptcha.Caption := ActiveCaptchaStr;
  if InTest then edCaptcha.Text := IntToStr(ActiveCaptchaInt);
end;

procedure TfrmLogin.edCompCodeChange(Sender: TObject);
var
idx : integer;
begin
  AydinlatmaLink := '';
  UniLabel5.Visible := AydinlatmaLink <> '';
 if UpdatingKurumKodu then  exit;
 UpdatingKurumKodu := true;
 try
 cbkurumlar.KeyValue := edCompCode.Text;
  if cbkurumlar.ItemIndex >-1 then
    setAldinlatmaLink;
 finally
  UpdatingKurumKodu := false;
 end;
end;

procedure TfrmLogin.UniBitBtn1Click(Sender: TObject);
begin
  frmKullaniciParolaSifirla.Exec;
end;

procedure TfrmLogin.setAldinlatmaLink;
var
  aydLinkParam, aguid: string;
begin

  if edCompCode.Text = '' then exit;
 QueryPrep(mainmod.qTmp,
      ' select P.kullanici_aydinlatma_link from sys_param_mc p,sys_mcdef mc ' +
      ' where mc.id = p.mc_id ' +
      ' AND mc.code =:code ' );
  mainmod.qTmp.ParamByName('code').AsString :=  edCompCode.Text;
  mainmod.qTmp.Open;
  if not MainMod.qTmp.IsEmpty then
    if MainMod.qTmp.FieldByName('kullanici_aydinlatma_link').AsString <> '' then
      AydinlatmaLink := MainMod.qTmp.FieldByName('kullanici_aydinlatma_link').AsString;

   UniLabel5.Visible := AydinlatmaLink <> '';
   MainMod.qTmp.Close;
//    if mainmod.qTmp.IsEmpty then
//      Exit;
//
//
//    aydLinkParam := mainmod.qTmp.FieldByName('val1').AsString;
//
//    QueryOpen(mainmod.qTmp,' SELECT ' +
//    ' aguid ' +
//    ' FROM ' +
//    ' def_data_aydinlatma ayd ' +
//    ' JOIN def_data_kisi ks ON ks.ID = ayd.kisi_id ' +
//    ' JOIN sys_mcdef mc on mc.id = ayd.mc_id ' +
//    ' WHERE ' +
//    ' mc.code =' + QuotedStr(Trim(edCompCode.Text)) +
//    ' AND ayd.durum = ''YAYINDA'' ' +
//     ' AND trim(ks.kisi) = trim(''ÞÝRKET PERSONELÝ'') ' +
//    // ' AND trim(ks.kisi) = trim(''KÝÞÝSEL VERÝ SÜREÇ YÖNETÝM YAZILIMI KULLANICI SÜRECÝ ÝLGÝLÝ KÝÞÝ'') ' +
//    ' ORDER BY ' +
//    ' ayd.ID'   );
//
//
//
//    if mainmod.qTmp.IsEmpty then
//      Exit;
//
//
//    aguid := mainmod.qTmp.FieldByName('aguid').AsString;
//    if aguid = '' then
//      Exit;
//    AydinlatmaLink := aydLinkParam + aguid;

end;

procedure TfrmLogin.KurumSelect(Sender: TObject);
var
  aydLinkParam, aguid: string;
begin
    AydinlatmaLink := '';
  UniLabel5.Visible := AydinlatmaLink <> '';

  if UpdatingKurumKodu then exit;

  UpdatingKurumKodu := true;
  try
    if cbkurumlar.ItemIndex < 0 then
      Exit;

    edCompCode.Text := cbkurumlar.KeyValue;
    setAldinlatmaLink;

  finally
    UpdatingKurumKodu := false;
  end;

end;


procedure TfrmLogin.UniLabel5Click(Sender: TObject);
begin
  if AydinlatmaLink <> '' then
    UniSession.BrowserWindow(AydinlatmaLink, 0, 0, '_blank')
  else
    MessageDlg('Aydýnlatma metni oluþturulmamýþ',mtconfirmation,[mbok]);
end;

procedure TfrmLogin.UniLoginFormAfterShow(Sender: TObject);
begin
  if (MainMod.UBYSActive and (MainMod.UBYSJwt <> '')) or (OtoLogin) then
    tmrUBYS.Enabled := true;
end;

procedure TfrmLogin.UniLoginFormBeforeShow(Sender: TObject);

//const
//  CLIENT_ID     = 'kvknet';       // size verilen client_id
//  CLIENT_SECRET = 'OnnliAkbn8pGzL1wZXdHErV0tGCPqrWw';   // gerekliyse
//  REDIRECT_URI  = 'http://localhost:8077';//'http://localhost:8085/callback';
//  AUTH_ENDPOINT = 'https://login2.uab.gov.tr/realms/master/protocol/openid-connect/auth';
//  TOKEN_ENDPOINT = 'https://login2.uab.gov.tr/realms/master/protocol/openid-connect/token';
//  USERINFO_ENDPOINT = 'https://login.uab.gov.tr/realms/master/protocol/openid-connect/userinfo';
//  SCOPE = 'openid profile email';
var
  MyIni : TIniFile;
  UComp ,
  UName ,
  UPwd  : String;
  dogrulamaList : TStringList;
  I : integer;
  Girislink, AuthURL,code : string;
  IdmappSer : TIDMAPPService;
  UserInfo : string;

begin


     QueryOpen(mainmod.qTmp,'SELECT * FROM sys_mcdef ');
  if MainMod.qTmp.RecordCount=1 then
  begin
    edCompCode.Text := MainMod.qTmp.FieldByName('code').AsString ;
    AydinlatmaLink := '';
    setAldinlatmaLink;
  end;

  if mainmod.GetSysParam(mainmod.qtmp,'KURUM KODU DOLDUR') = 'E' then
    begin
     QueryOpen(qkuramlar,
                    ' SELECT DISTINCT code,  title FROM sys_mcdef  order BY title ');
//     QueryOpen(qkuramlar,
//                    ' SELECT * FROM ( ' +
//                    ' SELECT CAST(-1 AS varchar) code, ''Kurum Seçiniz'' title ' +
//                    ' UNION ALL ' +
//                    ' SELECT DISTINCT CAST(code AS varchar(50)), CAST(title AS varchar(100)) FROM sys_mcdef ' +
//                    ' ) t ' +
//                    ' ORDER BY ' +
//                    ' CASE WHEN title = ''Kurum Seçiniz'' THEN 0 ELSE 1 END, ' +
//                    ' title '
//                     );
    cbkurumlar.BeginUpdate;
      try
        cbkurumlar.ListSource := dskurumlar;
        cbkurumlar.ListField := 'title;code';
        cbkurumlar.ListFormat := '%s - %s';
        cbkurumlar.KeyField := 'code';
        //cbkurumlar.EmptyText := 'Kurum Kodunu Seçiniz';
        cbkurumlar.OnChange := kurumSelect;
      finally
        cbkurumlar.EndUpdate;
      end;

     cpnlKurum.Visible := true;
     Height := 380;
    end else
    begin
     cpnlKurum.Visible := false ;
     Height := 310;

    end;

   dogrulamalist := TStringList.Create;
   try

     cbxdogrulama.Items.Clear;
     dogrulamalist.Sorted := true;
     dogrulamaList.Duplicates := dupIgnore;
     dogrulamalist.Delimiter := ',';
     dogrulamalist.CommaText := mainmod.GetSysParam(mainmod.qTmp,'ÝKÝ FAKTÖRLÜ DOÐRULAMA TÜRÜ');


   if dogrulamaList.Count > 0 then
   begin
     for I := 0 to dogrulamaList.Count -1 do
     begin

        cbxdogrulama.Items.Add(STwoFAMethod[TTwoFAMethod(strtoint( dogrulamalist[i]))] ) ;
        cbxdogrulama.ItemIndex := 0;
     end;
   end;
   finally
      cbxdogrulama.Visible := cbxdogrulama.Items.Count > 0 ;
      lb2fdogrulama.Visible := cbxdogrulama.Items.Count > 0 ;
      dogrulamalist.Free;
   end;


  // URL parametresi eriþimini kontrol edin
//  AccessToken := UniApplication.Parameters.Values['access_token'];
//  if AccessToken='' then
//   AccessToken := UniApplication.Parameters.Values['id_token'];

  if MainMod.GetSysParam(mainmod.qTmp,'UBYS AKTÝF')= 'E' then
    MainMod.SSOType := stUbys
  else if MainMod.GetSysParam(mainmod.qTmp,'UBYS AKTÝF')= 'S' then
    MainMod.SSOType := stSSO
  else if mainmod.GetSysParam(mainmod.qTmp,'UBYS AKTÝF')= 'C' then
    mainmod.SSOType := stCasSSO
  ELSE if mainmod.GetSysParam(mainmod.qTmp,'UBYS AKTÝF')= 'I' then
    mainmod.SSOType := stIDMAPP
  else MainMod.SSOType := stBos ;

   if mainmod.SSOType = stUbys then
   begin
     UBYSURL := MainMod.GetSysParam(MainMod.qTmp, 'UBYS URL');
   end else
   if MainMod.SSOType = stSSO then
   begin
     UBYSURL := MainMod.GetSysParam(MainMod.qTmp, 'UBYS URL');
     SSOGirisZorunlu := MainMod.qTmp.FieldByName('val2').AsString = 'E'
   end else
   if mainmod.SSOType = stCasSSO then
   begin
     UBYSURL := mainmod.GetSysParam(mainmod.qTmp,'UBYS URL');
   end
   else
   if mainmod.SSOType = stIDMAPP then
   begin
    UBYSURL := mainmod.GetSysParam(mainmod.qTmp,'UBYS URL');
   end;

   mainmod.UBYSActive  := (MainMod.SSOType = stUbys) or (mainmod.SSOType = stsso) or (mainmod.SSOType = stCasSSO) or
      (mainmod.SSOType = stIDMAPP) ;

   if mainmod.SSOType = stIDMAPP then
   begin
     code := UniApplication.Parameters.Values['code'];

      if trim(code)<>'' then
      begin

           IdmappSer := TIDMAPPService.Create;
          try
             IdmappSer.GetTokenAndUserInfo(code, UserInfo);
              UBYSToken := UserInfo ;
          finally
            IdmappSer.Free;
          end;
      end;
   end;

  if UBYSToken = '' then
    UBYSToken := UniApplication.Parameters.Values['token'];
  if UBYSToken = '' then
    UBYSToken := UniApplication.Parameters.Values['id_token'];
  if UBYSToken= '' then
    UBYSToken := UniApplication.Parameters.Values['access_token'];
  if UBYSToken = '' then
      UBYSToken := UniApplication.Parameters.Values['ticket'];


//  UBYSURL := MainMod.GetSysParam(MainMod.qTmp, 'UBYS URL');
//  MainMod.UBYSActive := (MainMod.GetSysParam(MainMod.qTmp, 'UBYS AKTÝF') = 'E');
  MainMod.UBYSJwt := UBYSToken;


  if MainMod.UBYSActive and (UBYSURL <> '') then
  begin
    MainMod.UBYSActive := true;
    btnUBYS.Visible := true;
  end
  else
  begin
    MainMod.UBYSActive := false;
    btnUBYS.Visible := false;
  end;
  if MainMod.SSOType = stUbys then
    btnUBYS.Caption := 'UBYS Kullanýcý Hesabý ile giriþ için týklayýnýz'
  else if mainmod.SSOType = stSSO then
     btnUBYS.Caption := 'SSO Kullanýcý Hesabý ile giriþ için týklayýnýz'
  else if mainmod.SSOType = stCasSSO then
     btnUBYS.Caption := 'CAS SSO Kullanýcý hesabý ile giriþ için týklayýnýz'
  else if MainMod.SSOType = stIDMAPP then
     btnUBYS.Caption := 'IDMAPP kullanýcý hesabý ile giriþ için týklayýnýz ';


  OtoLogin := UBYSToken <> '';

  SysState := MainMod.GetSysParam(MainMod.qTmp, 'SÝSTEM AKTÝF');
  if FileExists(ServerMod.StartPath + 'erolmuh.ini') then
  begin
    MyIni  := TIniFile.Create(ServerMod.StartPath + 'erolmuh.ini');
    UComp  := MyIni.ReadString('User', 'Comp', '');
    UName  := MyIni.ReadString('User', 'Name', '');
    UPwd   := MyIni.ReadString('User', 'Password', '');
    MyIni.Free;

    edCompCode.Text := UComp;
    edUserName.Text := UName;
    edUserPwd.Text  := UPwd;
    edUserNameLDAP.Text := UName;
    InTest := True;
    ActiveControl := btnOk;
  end;
  CreateCaptcha;

  uniImage1.Picture.LoadFromFile(ServerMod.FilesFolderPath + 'images/kvknet_login.jpg');
end;

//function TfrmLogin.GetIDMAPPTokenAndUserInfo(const Code: string): string;
//const
//  CLIENT_ID     = 'kvknet';       // size verilen client_id
//  CLIENT_SECRET = 'OnnliAkbn8pGzL1wZXdHErV0tGCPqrWw';   // gerekliyse
//  REDIRECT_URI  = 'http://10.6.7.22:8888/';//'http://localhost:8085/callback';
//  AUTH_ENDPOINT = 'https://login2.uab.gov.tr/realms/master/protocol/openid-connect/auth';
//  TOKEN_ENDPOINT = 'https://login2.uab.gov.tr/realms/master/protocol/openid-connect/token';
//  USERINFO_ENDPOINT = 'https://login.uab.gov.tr/realms/master/protocol/openid-connect/userinfo';
//  SCOPE = 'openid profile email';
//var
//  Params, ResultStr, AccessToken: string;
//  PostData: TStringStream;
//  JSON: TJSONObject;
//begin
//
//  result := '';
//
//
//   // SSL ayarlarýný IdHTTP1'e baðla
//  IdHTTP1.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
//
//  // TLS 1.2 zorunlu
//  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.SSLVersions := [sslvTLSv1_2];
//
//  // Gerekirse sertifika doðrulamayý kapat (test ortamý için)
//  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.VerifyMode := [];
//  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.VerifyDepth := 0;
//
//
//  Params := 'grant_type=authorization_code' +
//            '&code=' + TNetEncoding.URL.Encode(Code) +
//            '&redirect_uri=' + TNetEncoding.URL.Encode(REDIRECT_URI) +
//            '&client_id=' + CLIENT_ID +
//            '&client_secret=' + CLIENT_SECRET;
//
//  IdHTTP1.Request.ContentType := 'application/x-www-form-urlencoded';
//  PostData := TStringStream.Create(Params, TEncoding.UTF8);
//  try
//
//    ResultStr := IdHTTP1.Post(TOKEN_ENDPOINT, PostData);
//    memo1.Lines.Add(ResultStr);
//
//
//    JSON := TJSONObject.ParseJSONValue(ResultStr) as TJSONObject;
//    memo1.Lines.Add(JSON.ToString);
//    try
//      AccessToken := JSON.GetValue<string>('access_token');
//      result := ResultStr;
////      GetUserInfo(AccessToken);
//    finally
//      JSON.Free;
//    end;
//  except
//    on E: Exception do
//    begin
//      memo1.Lines.Add('Token Error: ' + E.Message+' params : ' +params);
//    end;
//  end;
//
//end;


procedure TfrmLogin.UniLoginFormCreate(Sender: TObject);
var
id_Token :string;
begin
UniSession.AddJS(
  ' Ext.onReady(function() { '+
  ' setTimeout(function() { '+
  ' var fragment = window.location.hash.substring(1); '+
  ' var params = new URLSearchParams(fragment); '+
  '  '+
  ' var accessToken = params.get("access_token"); '+
  ' var idToken = params.get("id_token"); '+
  '  '+
  ' var newUrl = window.location.href.split("#")[0]; '+
  ' var newParams = []; '+
  '  '+
  ' if (accessToken) { '+
  ' newParams.push("access_token=" + encodeURIComponent(accessToken)); '+
  ' } '+
  '  '+
  ' if (idToken) { '+
  ' newParams.push("id_token=" + encodeURIComponent(idToken)); '+
  ' } '+
  '  '+
  ' if (newParams.length > 0) { '+
  ' newUrl += "?" + newParams.join("&"); '+
  ' if (window.location.href !== newUrl) { '+
  ' window.location.replace(newUrl); '+
  ' } '+
  ' } '+
  ' }, 100); '+
  ' }); ');
//UniSession.AddJS(
//    'Ext.onReady(function() {' +
//    '  setTimeout(function() {' +
//    '    var fragment = window.location.hash.substring(1);' +
//    '    var params = new URLSearchParams(fragment);' +
//    '    var accessToken = params.get("access_token");' +
//    '    if (accessToken) {' +
//    '      var newUrl = window.location.href.split("#")[0] + "?access_token=" + encodeURIComponent(accessToken);' +
//    '      if (window.location.href !== newUrl) {' +
//    '        window.location.replace(newUrl);' +
//    '      }' +
//    '    }' +
//    '  }, 100);' +
//    '});'
//  );

  // UniSession.AddJS('document.body.style.background = ''url("/files/images/aryom_bg.jpg") repeat scroll 0% 0%''');

   // Doðan Akçay OpenLdap entegrasyonu için düzenleme yapýldý
   if MainMod.GetSysParam(MainMod.qTmp, 'LDAP AKTÝF')='E' then
      LDAPtYPE := ltActifDirectory
    else if MainMod.GetSysParam(MainMod.qTmp, 'LDAP AKTÝF')='L' then
      LDAPtYPE :=ltOpenLdap
    else if MainMod.GetSysParam(mainmod.qtmp,'LDAP AKTÝF')='KEYLOAK' then
      LDAPtYPE := ltKeyloak
    else  if MainMod.GetSysParam(mainmod.qtmp,'LDAP AKTÝF')='MARMARA' then
      LDAPtYPE := ltmarmara
    else
      LDAPtYPE := ltBos;

 if LDAPtYPE = ltBos then
  begin
    LDAPActive := false;
    btnChangeLogin.Visible := false;
    edUserNameLDAP.Visible := false;
    edUserName.Visible := true;
  end
  else if (LDAPtYPE<> ltBos)  and (MainMod.GetSysParam(MainMod.qTmp, 'DEFAULT SÝSTEM KULLANICISI') = 'E') then
  begin
    LDAPActive := false;
    btnChangeLogin.Visible := true;
    btnChangeLogin.Caption := 'LDAP Kullanýcý Hesabý ile giriþ için týklayýnýz' ;
    edUserNameLDAP.Visible := false;
    edUserName.Visible := true;
  end
  else
  begin
    LDAPActive := true;
    btnChangeLogin.Visible := true;
    edUserNameLDAP.Visible := true;
    edUserName.Visible := false;
  end;

  ActiveCaptchaStr := '';
  ActiveCaptchaInt := -1;
  ErrCount := 0;
  InTest   := False;
  ActiveControl := edCompCode;

end;

procedure TfrmLogin.tmrUBYSTimer(Sender: TObject);
var
  FID: Integer;
  msg: string;
begin
  tmrUBYS.Enabled := false;
  FID := unIKCUSSOLib.UBYSCheckLogin( MainMod.UBYSJwt,SSOkodKontrol);

  SSOkodKontrol := 0;

  if FID > 0 then
  begin
    ErrCount := 0;
    MainMod.OpenTables;
    ModalResult:= mrOK;  // Login is valid so proceed to MainForm
  end
  else
  begin
    Inc(ErrCount);
    CreateCaptcha;
    case FID of
      -1  : MessageDlg('Hatalý kurum kodu. Lütfen kontrol ediniz.', mtError, [mbOk]);
      -2  : MessageDlg('Kurum bilgileri eriþime kapalý. Lütfen sistem yöneticisi ile görüþünüz.', mtError, [mbOk]);
      -3  : MessageDlg('Firma bilgileri eriþime kapalý. Lütfen sistem yöneticisi ile görüþünüz.', mtError, [mbOk]);
      -4  : MessageDlg('Hatalý kullanýcý bilgileri. Lütfen kontrol ediniz.', mtError, [mbOk]);
      -5  : MessageDlg('Kullanýcýnýn sisteme giriþi kapalý. Lütfen sistem yöneticisi ile görüþünüz.', mtError, [mbOk]);
      -6  : MessageDlg('Hatalý kullanýcý bilgileri. Lütfen kontrol ediniz.', mtError, [mbOk]);
      -7  : MessageDlg('Hatalý token bilgileri. Lütfen yeniden deneyiniz.', mtError, [mbOk]);
      -8  : MessageDlg('Kullanýcý doðrulanamadý.', mtError, [mbOk]);
      -9  : MessageDlg('Kullanýcýnýn birimi bulunamadý. Lütfen sistem yöneticisi ile görüþünüz.', mtError, [mbOk]);
      -10 : MessageDlg('Kullanýcýnýn rolü bulunamadý. Lütfen sistem yöneticisi ile görüþünüz.', mtError, [mbOk]);
      -11 : MessageDlg('SSO Kullanýcý Doðrulamasý yapýlamadý.', mtError, [mbOk]);
      -1500 : MessageDlg('IDMAP TEST', mtError, [mbOk]);


    end;
    if ErrCount > 3 then ModalResult := mrCancel;
  end;

end;

initialization
  RegisterAppFormClass(TfrmLogin);
end.
