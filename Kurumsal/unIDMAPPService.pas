unit unIDMAPPService;

interface

uses
  SysUtils, Classes, NetEncoding, IdHTTP, IdSSLOpenSSL, Json;

type
  TIDMAPPService = class
  private
    FClientID: string;
    FClientSecret: string;
    FRedirectURI: string;
    FTokenEndpoint: string;
    FUserInfoEndpoint: string;
    FScope: string;
    FAUTHEndpoint: string;

    FIdHTTP: TIdHTTP;
    FSSL: TIdSSLIOHandlerSocketOpenSSL;
  public
    constructor Create;
    destructor Destroy; override;

    function GetTokenAndUserInfo(const Code: string; out UserInfoJSON: string): string;
    function GetUserInfo(const AccessToken: string): string;

    property ClientID: string read FClientID write FClientID;
    property ClientSecret: string read FClientSecret write FClientSecret;
    property RedirectURI: string read FRedirectURI write FRedirectURI;
    property TokenEndpoint: string read FTokenEndpoint write FTokenEndpoint;
    property UserInfoEndpoint: string read FUserInfoEndpoint write FUserInfoEndpoint;
    property Scope: string read FScope write FScope;
    property AUTHEndpoint: string read FAUTHEndpoint write fAUTHEndpoint ;
  end;

implementation
 uses mcMlib,MainModule;
{ TAuthService }

constructor TIDMAPPService.Create;
begin
//  FClientID := 'kvknet';
//  FClientSecret := 'OnnliAkbn8pGzL1wZXdHErV0tGCPqrWw';
//  FRedirectURI := 'http://10.6.7.22:8888';//'http://localhost:8888';//'http://localhost:8077';
//  FAUTHEndpoint := 'https://login2.uab.gov.tr/realms/master/protocol/openid-connect/auth';  // sadece login sayfasýnda kullanýlýyor.
//  FTokenEndpoint := 'https://login2.uab.gov.tr/realms/master/protocol/openid-connect/token';
  // þimdilik kullanmayacaðýz sabit kalsýn
  FUserInfoEndpoint := 'https://login2.uab.gov.tr/realms/master/protocol/openid-connect/userinfo';
  FScope := 'openid profile email';


  FRedirectURI := mainmod.GetSysParam(mainmod.qTmp,'KVKNET GÝRÝÞ LINK') ;
  FClientSecret := mainmod.GetSysParam(mainmod.qTmp,'UBYS SECRET') ;
  FAUTHEndpoint := mainmod.GetSysParam(mainmod.qTmp,'UBYS URL') ;
  FTokenEndpoint := mainmod.qTmp.FieldByName('val2').AsString;
  FClientID := mainmod.qTmp.FieldByName('val3').AsString;

  FIdHTTP := TIdHTTP.Create(nil);
  FSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);

  FSSL.SSLOptions.SSLVersions := [sslvTLSv1_2];
  FSSL.SSLOptions.VerifyMode := [];
  FSSL.SSLOptions.VerifyDepth := 0;

  FIdHTTP.IOHandler := FSSL;
  FIdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
  FIdHTTP.ProtocolVersion := pv1_1;
end;

destructor TIDMAPPService.Destroy;
begin
  FSSL.Free;
  FIdHTTP.Free;
  inherited;
end;

function TIDMAPPService.GetTokenAndUserInfo(const Code: string; out UserInfoJSON: string): string;
var
  Params, ResultStr, AccessToken: string;
  PostData: TStringStream;
  JSON: TJSONObject;
begin
  Result := '';
  UserInfoJSON := '';

  Params := 'grant_type=authorization_code' +
            '&code=' + TNetEncoding.URL.Encode(Code) +
            '&redirect_uri=' + TNetEncoding.URL.Encode(Slashcontrol(FRedirectURI) ) +
            '&client_id=' + FClientID +
            '&client_secret=' + FClientSecret;

  FIdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
  PostData := TStringStream.Create(Params, TEncoding.UTF8);
  try
    try
      ResultStr := FIdHTTP.Post(FTokenEndpoint, PostData);

      JSON := TJSONObject.ParseJSONValue(ResultStr) as TJSONObject;
      try
        AccessToken := JSON.GetValue<string>('access_token');
//        AccessToken := JSON.GetValue<string>('id_token');
        UserInfoJSON := AccessToken;
        result :=  UserInfoJSON;
//       UserInfoJSON := ResultStr;
      finally
        JSON.Free;
      end;

//      UserInfoJSON := GetUserInfo(AccessToken);

    except
      on E: Exception do
      begin
        UserInfoJSON := 'Token Error: ' + E.Message;
      end;
    end;
  finally
    PostData.Free;
  end;
end;

function TIDMAPPService.GetUserInfo(const AccessToken: string): string;
var
  HTTP: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
begin
  HTTP := TIdHTTP.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    SSL.SSLOptions.SSLVersions := [sslvTLSv1_2];
    HTTP.IOHandler := SSL;
    HTTP.Request.CustomHeaders.Clear;
    HTTP.Request.CustomHeaders.Add('Authorization: Bearer ' + AccessToken);

    Result := HTTP.Get(FUserInfoEndpoint);
  finally
    SSL.Free;
    HTTP.Free;
  end;
end;

end.
