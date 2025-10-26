unit ServerModule;

interface

uses
  Classes, SysUtils, uniGUIServer, uniGUIMainModule, uniGUIApplication, uIdCustomHTTPServer,
  uniGUITypes, WinAPI.Windows, Vcl.Forms,StrUtils,System.Generics.Collections,
  uIdCookie;

type
  TServerMod = class(TUniGUIServerModule)
    procedure UniGUIServerModuleCreate(Sender: TObject);
    procedure UniGUIServerModuleBeforeInit(Sender: TObject);
    procedure UniGUIServerModuleHTTPCommand(ARequestInfo: TIdHTTPRequestInfo;
      AResponseInfo: TIdHTTPResponseInfo; var Handled: Boolean);
    procedure WriteVersion();
    procedure UniGUIServerModuleDestroy(Sender: TObject);

  private
//   FSessionList: TDictionary<string, TUniGUISession>;
   FSessionList: TDictionary<string, string>;
  protected
    procedure FirstInit; override;
  public
    VersionDegisti : boolean;
    Version: string;
    procedure AddUserSession(const AUserID: string; ASess: TUniGUISession);
    procedure RemoveUserSession(const AUserID: string);
    procedure exitUser(const AUserID, AMessage: string);
  end;

const
  // ThemeTexts : array of String = ['Mavi Tonlama', 'Gri Tonlama', 'Neptün', 'Varsayýlan Tema'];
  ThemeTexts : array of String = ['aria', 'classic', 'colors', 'crisp', 'graphite', 'gray', 'material', 'neptune', 'triton',
                                  'triton.modified', 'uni_aqua', 'uni_aqua_triton', 'uni_carbon', 'uni_carbon_triton', 'uni_classic',
                                  'uni_emerald', 'uni_flat_black', 'uni_flat_black_triton', 'uni_kde', 'uni_kde_neptune',
                                  'uni_kde_triton', 'uni_lavender', 'uni_lavender_triton', 'uni_mac', 'uni_mac_neptune',
                                  'uni_mac_triton', 'uni_mac_yosemite', 'uni_sencha', 'uni_sencha2', 'uni_sencha2_mono',
                                  'uni_sencha2_mono_triton', 'uni_sencha2_triton', 'uni_sencha_classic', 'uni_sencha_flat',
                                  'uni_sencha_triton', 'uni_ubuntu', 'uni_ubuntu_neptune', 'uni_ubuntu_triton', 'uni_win10',
                                  'uni_win7', 'uni_win8', 'uni_windows11', 'uni_windows11_triton', 'uni_winxp_blue', 'uni_winxp_silver'];

function ServerMod: TServerMod;

implementation

{$R *.dfm}

uses UniGUIVars, IniFiles, McMLib;

function ServerMod: TServerMod;
begin
  Result:=TServerMod(UniGUIServerInstance);
end;

procedure TServerMod.AddUserSession(const AUserID: string;
  ASess: TUniGUISession);
begin
 FSessionList.AddOrSetValue(AUserID, ASess.SessionId);
end;

procedure TServerMod.exitUser(const AUserID, AMessage: string);
var
  Sess: TUniGUISession;
  SId : string;

  U : TUniGUISession;
  I : Integer;
begin
  if FSessionList.TryGetValue(AUserID, SId) then
  begin
   if sid <> '' then
    if UniSession.SessionId <> sid then
    begin
       SessionManager.Sessions.Lock;
      try
        for I := 0 to SessionManager.Sessions.SessionList.Count -1 do
          begin
           u :=  SessionManager.Sessions.SessionList[i];
           if SId = u.SessionId then
           begin
            u.SendResponse('alert("' + AMessage + '");');
            Sleep(500);
            u.TerminateAfterSecs(5);
            break;
           end;
          end;
      finally
        SessionManager.Sessions.Unlock;
      end;
    end;
    FSessionList.Remove(AUserID); // eþleþtirmeyi de temizle
  end;
//var
//  Sess: TUniGUISession;
//  SId: string;
//begin
//  if FSessionList.TryGetValue(AUserID, Sess)  then
//  begin
//    if Assigned(Sess) then
//    try
//      SId := Sess.SessionId;
//      Sess := GetSession(SId);  // güvenli þekilde session al
//
//      Sess.SendResponse('alert("' + AMessage + '");');
//      ServerMod.RemoveUserSession( UniSession.SessionID);
//      Sess.TerminateAfterSecs(3);
//    finally
//      Sess.UnBusy;  // session’ý serbest býrak
//    end;
//  end;
//

end;

procedure TServerMod.FirstInit;
begin
  InitServerModule(Self);
end;

procedure TServerMod.RemoveUserSession(const AUserID: string);
begin
   FSessionList.Remove(AUserID);
end;

procedure TServerMod.UniGUIServerModuleBeforeInit(Sender: TObject);
var
  Ini: TIniFile;
  Cipher : Integer;
begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'KVKNet.ini');
  try
    Port := Ini.ReadInteger('Settings', 'Port', 8888);
    SSL.SSLPort := Ini.ReadInteger('Settings', 'SSLPort', 443);
    if SSL.SSLPort > 0 then SSL.Enabled := True;
    SSL.SSLOptions.CipherList := GetCipherList(4);

    SessionTimeout := ini.ReadInteger('settings','SessionTimeout', 0);
    // yeni eklendiði için yok ise eklenmesini istiyorum
    if SessionTimeout = 0 then
    begin
      SessionTimeout := 900000;
      Ini.WriteInteger('Settings', 'SessionTimeout', 900000);
    end;
    {$IFDEF DEBUG}
       SessionTimeout := 1200000;
    {$ENDIF}
  finally
    Ini.Free;
  end;
end;

procedure TServerMod.UniGUIServerModuleCreate(Sender: TObject);
begin
  // Örnek : MimeTable.AddMimeType('dat', 'application/octet-stream', False);
  MimeTable.AddMimeType('pptx', 'application/pptx', False);
  MimeTable.AddMimeType('kve', 'application/x-pds', False);
  MimeTable.AddMimeType('zd', 'application/x-pds', False);

  ServerMessages.InvalidSessionTemplate.LoadFromFile(ServerMod.FilesFolderPath + 'temp_html/InvalidSessionTemplate.htm');
  ServerMessages.ExceptionTemplate.LoadFromFile(ServerMod.FilesFolderPath + 'temp_html/ExceptionTemplate.htm');
  ServerMessages.TerminateTemplate.LoadFromFile(ServerMod.FilesFolderPath + 'temp_html/TerminateTemplate.htm');
  // Added by TEVFIK 30.11.2022 13:31:36 KVKNet Versiyon
  WriteVersion;

  FSessionList := TDictionary<string, string>.Create;
//  FSessionList := TDictionary<string, TUniGUISession>.Create;
end;

procedure TServerMod.UniGUIServerModuleDestroy(Sender: TObject);
begin
  FSessionList.Free;
end;

procedure TServerMod.UniGUIServerModuleHTTPCommand(ARequestInfo: TIdHTTPRequestInfo;
  AResponseInfo: TIdHTTPResponseInfo; var Handled: Boolean);
var
  SessVal, HostName, CookieDomain, CookieLine: string;
  CookieObj: TIdCookie;
  MyHost ,
  MyURI  : String;
  FormattedDateTime : string;
  cachefolder,cachePaht :string;
  izinVerilen : TStringList;
  Fileext : string;
  function CountOccurences(AStr, ASearch: String): Integer;
  var
    Tmp : Integer;
  begin
    Result := 0;
    Tmp := 1;
    while Tmp > 0 do
    begin
      Tmp := Pos(ASearch, AStr);
      if Tmp > 0 then
      begin
        Inc(Result);
        System.Delete(AStr, 1, Tmp + Length(ASearch) - 1);
      end;
    end;
  end;
begin
    // SSL kontrolü ve redirect script
  if SSL.SSLPort <= 0 then
  begin

    CustomMeta.Clear;
  end
  else
  begin
    CustomMeta.Clear;
    CustomMeta.Add('<script language="JavaScript">');
    CustomMeta.Add('function redirectHttpToHttps(){');
    CustomMeta.Add('    var loc = window.location.href;');
    CustomMeta.Add('    if (loc.indexOf("http://")==0){');
    CustomMeta.Add('    		loc = "https://" + loc.substring(7, loc.lastIndexOf(":")) + ":' + IntToStr(SSL.SSLPort) + '";' );
    CustomMeta.Add('      window.location.href = loc}}');
    CustomMeta.Add('redirectHttpToHttps();');
    CustomMeta.Add('</script>');
    //-TK-20230411--//

  end;

//  CustomMeta.Add('<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>');
//  CustomMeta.Add('<script>');
//  CustomMeta.Add('$(function(){');
//  CustomMeta.Add('$("body").keydown(function(e){');
//  CustomMeta.Add('e.preventDefault();');
//  CustomMeta.Add('if(e.keyCode == 27 || e.key == "Esc"){');
//  CustomMeta.Add('  var btns = document.querySelectorAll("a[role=button], button");');
//  CustomMeta.Add('  btns.forEach(function(btn){');
//  CustomMeta.Add('    if(btn.innerText.trim() === "Kapat"){');
//  CustomMeta.Add('      btn.click();');
//  CustomMeta.Add('    }');
//  CustomMeta.Add('  });');
//  CustomMeta.Add('}');
//  CustomMeta.Add('})})</script>');

 (*
  //T.K. 20220927 - F Keys
  CustomMeta.Add('<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>');
  CustomMeta.Add('<script>');
  CustomMeta.Add('$(function(){');
  CustomMeta.Add('$("body").keydown(function(e){');
  CustomMeta.Add('e.preventDefault();');
  CustomMeta.Add('var keyCode = e.keyCode || e.which;');
  CustomMeta.Add('if((keyCode == 112 || e.key == ''F1''))');
  CustomMeta.Add('{document.getElementById("btnHelp").click();}');
  CustomMeta.Add('else if((e.keyCode == 113 || e.key == ''F2''))');
  CustomMeta.Add('{document.getElementById("btnAdd").click();}');
  CustomMeta.Add('else if((e.keyCode == 114 || e.key == ''F3''))');
  CustomMeta.Add('{document.getElementById("btnEdit").click();}');
  CustomMeta.Add('else if((e.keyCode == 115 || e.key == ''F4''))');
  CustomMeta.Add('{document.getElementById("btnPost").click();}');
  CustomMeta.Add('else if((e.keyCode == 117 || e.key == ''F6''))');
  CustomMeta.Add('{document.getElementById("btnCancel").click();}');
  CustomMeta.Add('else if((e.keyCode == 27 || e.key == ''Esc''))');
  CustomMeta.Add('{document.getElementById("btnclose").click();}');
  CustomMeta.Add('})})</script>');
  *)
  //
    // pentest sonucu mainmodul tarafýndan kaldýrýlarak buraya eklendi
   // -----------------------
  // SESSION COOKIE iþlemleri
  // -----------------------
  HostName := ARequestInfo.Host;
  if HostName.Contains(':') then
    HostName := Copy(HostName, 1, Pos(':', HostName)-1);

  // Mevcut cookieyi al
  CookieObj := ARequestInfo.Cookies.Cookie['UNI_GUI_SESSION_ID', HostName];

  if Assigned(CookieObj) then
    SessVal := CookieObj.Value
  else
  begin
    // Yoksa yeni session ID oluþtur
    SessVal := TGUID.NewGuid.ToString;
  end;

  // Cookie domain belirle
    CookieDomain := HostName;

  // Cookie oluþtur ve response'a ekle
  CookieLine :=
    Format('UNI_GUI_SESSION_ID=%s; Path=/; Domain=%s; Secure; HttpOnly; SameSite=Strict',
           [SessVal, CookieDomain]);
  AResponseInfo.CustomHeaders.AddValue('Set-Cookie', CookieLine);


   // -----------------------
  // Diðer güvenlik headerlarý
  // -----------------------

  // AResponseInfo.CustomHeaders.AddValue('X-Frame-Options', 'DENY');
//  var RequestOrigin: string;
//  RequestOrigin := ARequestInfo.RawHeaders.Values['Origin'];

 // AResponseInfo.CustomHeaders.Values['Access-Control-Allow-Origin'] := 'null';

  AResponseInfo.CustomHeaders.AddValue('X-XSS-Protection', '1, mode=block');
  AResponseInfo.CustomHeaders.AddValue('Strict-Transport-Security', 'max-age=31536000; includeSubDomains; preload');
  AResponseInfo.CustomHeaders.AddValue('Referrer-Policy', 'no-referrer');

  AResponseInfo.CustomHeaders.AddValue('Cache-Control', 'no-cache, no-store, max-age=0, must-revalidate'); //HTTP 1.1
  AResponseInfo.CustomHeaders.AddValue('Pragma','no-cache');////HTTP 1.0
  AResponseInfo.CustomHeaders.AddValue('Expires', '0');
  AResponseInfo.CustomHeaders.AddValue('X-Robots-Tag', 'noindex, nofollow');

//  // pentest sonucu eklendi
//  3. Güvenlik Header’larý Eksik
//  Sorun: CSP, Permissions-Policy, X-Content-Type-Options gibi baþlýklar eksik.


//      AResponseInfo.CustomHeaders.Values['Access-Control-Allow-Origin'] := '';
//      AResponseInfo.CustomHeaders.Values['Access-Control-Allow-Methods'] := 'GET, POST, PUT, DELETE, OPTIONS';
//      AResponseInfo.CustomHeaders.Values['Access-Control-Allow-Headers'] := 'Content-Type, Authorization';
//      AResponseInfo.CustomHeaders.Values['Access-Control-Allow-Credentials'] := 'true';

//AResponseInfo.CustomHeaders.AddValue('Content-Security-Policy',
//  'default-src ''self''; ' +
//  'script-src ''self'' ''unsafe-inline'' ''unsafe-eval''; ' +
//  'style-src ''self'' ''unsafe-inline''; ' +
//  'img-src ''self'' data:; ' +
//  'font-src ''self''; ' +
//  'connect-src ''self''; ' +
//  'object-src ''none'';');

  AResponseInfo.CustomHeaders.AddValue('Permissions-Policy',
  'geolocation=(), microphone=(), camera=()');
  AResponseInfo.CustomHeaders.AddValue('X-Content-Type-Options', 'nosniff');


  // -----------------------
  // URI filtreleme / ret iþlemleri
  // -----------------------
//  cachefolder := LocalCachePath ; // önbellek paht
  cachePaht :=  LocalCacheURL ;   //önbellek url

 if ( (ARequestInfo.URI <> '/') and (ARequestInfo.Referer = '') ) then
      begin
          MyHost:= LowerCase(ARequestInfo.Host);
          MyURI:= LowerCase(ARequestInfo.URI);
          if (CountOccurences(MyHost+MyURI, '/') > 1) then
          begin
            if  ( pos(StringReplace(cachepaht,'//','/',[rfReplaceAll, rfIgnoreCase]), MyHost+MyURI)=0)
            and ( not ((Pos('/uni-', MyURI) = 1) or
                 (Pos('/ext-', MyURI) = 1) or
                 (Pos('/files/', MyURI) = 1) or
                 (EndsStr('.js', MyURI) or
                  EndsStr('.css', MyURI) or
                  EndsStr('.png', MyURI) or
                  EndsStr('.jpg', MyURI) or
                  EndsStr('.ico', MyURI)) ))  then
            begin
              // loga yaz
              DateTimeToString(FormattedDateTime, 'dd/mm/yyyy hh:nn:ss.z', Now());
              Logger.AddLog('DOGANAKCAY', 'Ret edildi - '+
                            FormattedDateTime + ' - ' +
                            'IP: ' + ARequestInfo.RemoteIP + ', ' +
                            'URI: ' + MyURI + ', ' +
                            'Dosya: ' + ARequestInfo.Document);
              // ret et
              Handled:= True;
              AResponseInfo.ResponseNo:= 405;
              AResponseInfo.CloseConnection:= True;
              AResponseInfo.CloseSession;
            end;
          end; // Occurences
          if (MyURI ='/robots.txt')  then
          begin
                          // loga yaz
              DateTimeToString(FormattedDateTime, 'dd/mm/yyyy hh:nn:ss.z', Now());
              Logger.AddLog('DOGANAKCAY', 'Ret edildi - '+
                            FormattedDateTime + ' - ' +
                            'IP: ' + ARequestInfo.RemoteIP + ', ' +
                            'URI: ' + MyURI + ', ' +
                            'Dosya: ' + ARequestInfo.Document);
              // ret et
              Handled:= True;
              AResponseInfo.ResponseNo:= 405;
              AResponseInfo.CloseConnection:= True;
              AResponseInfo.CloseSession;
          end;

      end;
  // doðan akçay bitirdi

end;



// Added by TEVFIK 30.11.2022 13:30:54 KVKNet Versiyon
procedure TServerMod.WriteVersion;
var
  Ini: TIniFile;
 // Version: string;
  oldversiyon : string;
  v1,v2,v3,v4: word;
begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'KVKNet.ini');
//  Version := 'V2.'+ FormatDateTime('yymmdd', FileDateToDateTime(Fileage(Application.ExeName)));
  Version := 'V_' + Projeversiyon(Application.ExeName,v1,v2,v3,v4);
  try
    oldversiyon := ini.ReadString('Settings','Version','');
    VersionDegisti := Version <> oldversiyon;
    Ini.WriteString('Settings','Version',Version);
  finally
    Ini.Free;
  end;
end;

initialization
  RegisterServerModuleClass(TServerMod);
end.

{
ALL:!LOW:!SSLv2:!aNULL:!aECDH:!eNULL:!EXP:!EXPORT:!DES:!RC4:!MD5:!PSK:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA:@STRENGTH

TLSv1:TLSv1.2:SSLv3:!RC4:!NULL-MD5:!NULL-SHA:!NULL-SHA256:!DES-CBC-SHA:!DES-CBC3-SHA:!IDEA-CBC-SHA

CipherList := '!ADH:!EXP:!RC4:!eNULL@STRENGTH';

}

