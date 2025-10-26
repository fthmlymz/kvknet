unit unLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniLabel, uniEdit, uniButton, uniBitBtn,
  uniImage, IniFiles, Vcl.Imaging.jpeg, unIKCUSSOLib, uniTimer, MainModule,math,mcmlib,StrUtils,netencoding,
  uniMultiItem, uniComboBox, Data.DB, MemDS, DBAccess, Uni, uniDBComboBox,
  uniDBLookupComboBox, uniRadioGroup;

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
    rgdogrulama: TUniRadioGroup;
    procedure UniLoginFormCreate(Sender: TObject);
    procedure UniLoginFormBeforeShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure tmrUBYSTimer(Sender: TObject);
    procedure btnChangeLoginClick(Sender: TObject);
    procedure btnUBYSClick(Sender: TObject);
    procedure UniLoginFormAfterShow(Sender: TObject);
    procedure kurumSelect(Sender: TObject);
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
    procedure CreateCaptcha;
    function Slashcontrol(Astring: string): string;
    function RandomSayiUret: integer;
  public
  end;

function frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses
  uniGUIVars, ServerModule, uniGUIApplication, unKullaniciParolaSifirla,
  unTwoFAInputForm,unTwoFactorAuth;

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

  if rgdogrulama.ItemIndex > -1 then
    mainmod.TwoFaMetod := GetUser2FAMethod(MainMod.LoginInfo.ID, rgdogrulama);
  if rgdogrulama.ItemIndex >  -1 then
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
      -4 : MessageDlg('Hatalý kullanýcý adý. Lütfen kontrol ediniz.', mtError, [mbOk]);
      -5 : MessageDlg('Kullanýcýnýn sisteme giriþi kapalý. Lütfen sistem yöneticisi ile görüþünüz.', mtError, [mbOk]);
      -6 : MessageDlg('Hatalý kullanýcý bilgileri. Lütfen kontrol ediniz.', mtError, [mbOk]);
      -7 : MessageDlg('Ldap Baðlanýlamadý.', mtError, [mbOk]);
      -8 : MessageDlg('Ldap kullanýcý Doðrulanamadý', mtError, [mbOk]);
      -9 : MessageDlg('SSO kullanýcý Doðrulamsý yapýlamad',mtError,[mbOK]) ;
      -10: MessageDlg('Ldap parametreleri tanýmlanmamýþtýr. Lütfen kontrol ediniz',mtError ,[mbOk]	);
      -11: MessageDlg('Token alýnamadý',mtError ,[mbOk]	);
      -12 : MessageDlg('Ýki Faktörlü doðrulama yapýlamadý',mtError,[mbOk]);
      -13 : MessageDlg('Giriþ iptal edildi',mtError,[mbOk]);
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
  end;
  UniSession.UrlRedirect(AuthURL);
    //'f.method="POST"; '
end;

function TfrmLogin.RandomSayiUret: integer;
begin
  Randomize;
  result := RandomRange(1,10000);
end;

function TfrmLogin.Slashcontrol(Astring  : string) :string;
begin
  if  (Length(Astring) > 0) and (Astring[Length(Astring)] <> '/') then
    result := Astring+'/'
    else
    result := Astring;
end;

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

procedure TfrmLogin.UniBitBtn1Click(Sender: TObject);
begin
  frmKullaniciParolaSifirla.Exec;
end;

procedure TfrmLogin.KurumSelect(Sender: TObject);
begin
  if cbkurumlar.ItemIndex > -1 then
    edCompCode.Text := cbkurumlar.KeyValue;

end;

procedure TfrmLogin.UniLoginFormAfterShow(Sender: TObject);
begin
  if (MainMod.UBYSActive and (MainMod.UBYSJwt <> '')) or (OtoLogin) then
    tmrUBYS.Enabled := true;
end;

procedure TfrmLogin.UniLoginFormBeforeShow(Sender: TObject);
var
  MyIni : TIniFile;
  UComp ,
  UName ,
  UPwd  : String;
  dogrulamaList : TStringList;
  I : integer;
begin


     QueryOpen(mainmod.qTmp,'SELECT * FROM sys_mcdef ');
  if MainMod.qTmp.RecordCount=1 then
    edCompCode.Text := MainMod.qTmp.FieldByName('code').AsString ;

  if mainmod.GetSysParam(mainmod.qtmp,'KURUM KODU DOLDUR') = 'E' then
    begin
     QueryOpen(qkuramlar,
                    ' SELECT DISTINCT code,  title FROM sys_mcdef  order BY title ');
    cbkurumlar.BeginUpdate;
      try
        cbkurumlar.ListSource := dskurumlar;
        cbkurumlar.ListField := 'title;code';
        cbkurumlar.ListFormat := '%s - %s';
        cbkurumlar.KeyField := 'code';
        cbkurumlar.EmptyText := 'Kurum Kodunu Seçiniz';
        cbkurumlar.OnChange := kurumSelect;
      finally
        cbkurumlar.EndUpdate;
      end;

      cbkurumlar.Visible := true;
      edCompCode.Visible := false;
      LBKURUMKODU.Visible := false;
      cbkurumlar.Top := 1;
      cbkurumlar.Left := 1;
      cbkurumlar.Width := frmLogin.Width-6;
    end else
    begin
     cbkurumlar.Visible := false ;
     edCompCode.Visible := true ;
     LBKURUMKODU.Visible := true ;
    end;

   dogrulamalist := TStringList.Create;
   try
   rgdogrulama.Items.Clear;
   dogrulamalist.Sorted := true;
   dogrulamaList.Duplicates := dupIgnore;
   dogrulamalist.Delimiter := ',';
   dogrulamalist.CommaText := mainmod.GetSysParam(mainmod.qTmp,'ÝKÝ FAKTÖRLÜ DOÐRULAMA TÜRÜ');


   if dogrulamaList.Count > 0 then
   begin
     for I := 0 to dogrulamaList.Count -1 do
     begin
      rgdogrulama.Items.Add( STwoFAMethod[TTwoFAMethod(strtoint( dogrulamalist[i]))] );
      rgdogrulama.ItemIndex := 0;
     end;
   end;
   finally
       rgdogrulama.Visible := rgdogrulama.Items.Count >0 ;
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
   end;

   mainmod.UBYSActive  := (MainMod.SSOType = stUbys) or (mainmod.SSOType = stsso) or (mainmod.SSOType = stCasSSO) ;

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
     btnUBYS.Caption := 'CAS SSO Kullanýcý hesabi ile giriþ için týklayýnýz';


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





 // if (MainMod.GetSysParam(MainMod.qTmp, 'LDAP AKTÝF') <> 'E')  then
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


  // Doðan Akçay SDU üniversitesi token fragment olarak geliyor (?token yerine #token geliyor )
  // token tekrar yönlendirildiðinden yeni url yakalamak için beforeshow metoduna taþýndý
//  UBYSToken := UniApplication.Parameters.Values['token'];
//  if UBYSToken = '' then
//    UBYSToken := UniApplication.Parameters.Values['id_token'];
//
//  UBYSURL := MainMod.GetSysParam(MainMod.qTmp, 'UBYS URL');
//  MainMod.UBYSActive := (MainMod.GetSysParam(MainMod.qTmp, 'UBYS AKTÝF') = 'E');
//  MainMod.UBYSJwt := UBYSToken;
//  if MainMod.UBYSActive and (UBYSURL <> '') then
//  begin
//    MainMod.UBYSActive := true;
//    btnUBYS.Visible := true;
//  end
//  else
//  begin
//    MainMod.UBYSActive := false;
//    btnUBYS.Visible := false;
//  end;
//
//  if  (UBYSToken<>'') and (not ( MainMod.UBYSActive and (UBYSURL <> ''))) then
//  begin
//      MainMod.UBYSJwt := UBYSToken;
//      OtoLogin := UBYSToken <> '';
//  end;

  ActiveCaptchaStr := '';
  ActiveCaptchaInt := -1;
  ErrCount := 0;
  InTest   := False;
  ActiveControl := edCompCode;

end;

procedure TfrmLogin.tmrUBYSTimer(Sender: TObject);
var
  FID: Integer;
begin
  tmrUBYS.Enabled := false;
  FID := unIKCUSSOLib.UBYSCheckLogin(MainMod.UBYSJwt,SSOkodKontrol);
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
      -4  : MessageDlg('Hatalý kullanýcý adý. Lütfen kontrol ediniz.', mtError, [mbOk]);
      -5  : MessageDlg('Kullanýcýnýn sisteme giriþi kapalý. Lütfen sistem yöneticisi ile görüþünüz.', mtError, [mbOk]);
      -6  : MessageDlg('Hatalý kullanýcý bilgileri. Lütfen kontrol ediniz.', mtError, [mbOk]);
      -7  : MessageDlg('Hatalý token bilgileri. Lütfen yeniden deneyiniz.', mtError, [mbOk]);
      -8  : MessageDlg('Kullanýcý doðrulanamadý.', mtError, [mbOk]);
      -9  : MessageDlg('Kullanýcýnýn birimi bulunamadý. Lütfen sistem yöneticisi ile görüþünüz.', mtError, [mbOk]);
      -10 : MessageDlg('Kullanýcýnýn rolü bulunamadý. Lütfen sistem yöneticisi ile görüþünüz.', mtError, [mbOk]);
      -11 : MessageDlg('SSO Kullanýcý Doðrulamasý yapýlamadý.', mtError, [mbOk]);

    end;
    if ErrCount > 3 then ModalResult := mrCancel;
  end;

end;

initialization
  RegisterAppFormClass(TfrmLogin);
end.
