unit unit2;

interface

uses
  SysUtils, Classes, NetEncoding, IdHTTP, IdSSLOpenSSL, Json;

type
  TAuthService = class
  private
    FClientID: string;
    FClientSecret: string;
    FRedirectURI: string;
    FTokenEndpoint: string;
    FUserInfoEndpoint: string;
    FScope: string;

    FIdHTTP: TIdHTTP;
    FSSL: TIdSSLIOHandlerSocketOpenSSL;
  public
    constructor Create;
    destructor Destroy; override;

    function GetTokenAndUserInfo(const Code: string; out UserInfoJSON: string): Boolean;
    function GetUserInfo(const AccessToken: string): string;

    property ClientID: string read FClientID write FClientID;
    property ClientSecret: string read FClientSecret write FClientSecret;
    property RedirectURI: string read FRedirectURI write FRedirectURI;
    property TokenEndpoint: string read FTokenEndpoint write FTokenEndpoint;
    property UserInfoEndpoint: string read FUserInfoEndpoint write FUserInfoEndpoint;
    property Scope: string read FScope write FScope;
  end;

implementation

{ TAuthService }

constructor TAuthService.Create;
begin
  FClientID := 'kvknet';
  FClientSecret := 'OnnliAkbn8pGzL1wZXdHErV0tGCPqrWw';
  FRedirectURI := 'http://localhost:8077';
  FTokenEndpoint := 'https://login2.uab.gov.tr/realms/master/protocol/openid-connect/token';
  FUserInfoEndpoint := 'https://login2.uab.gov.tr/realms/master/protocol/openid-connect/userinfo';
  FScope := 'openid profile email';

  FIdHTTP := TIdHTTP.Create(nil);
  FSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);

  FSSL.SSLOptions.SSLVersions := [sslvTLSv1_2];
  FSSL.SSLOptions.VerifyMode := [];
  FSSL.SSLOptions.VerifyDepth := 0;

  FIdHTTP.IOHandler := FSSL;
  FIdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
  FIdHTTP.ProtocolVersion := pv1_1;
end;

destructor TAuthService.Destroy;
begin
  FSSL.Free;
  FIdHTTP.Free;
  inherited;
end;

function TAuthService.GetTokenAndUserInfo(const Code: string; out UserInfoJSON: string): Boolean;
var
  Params, ResultStr, AccessToken: string;
  PostData: TStringStream;
  JSON: TJSONObject;
begin
  Result := False;
  UserInfoJSON := '';

  Params := 'grant_type=authorization_code' +
            '&code=' + TNetEncoding.URL.Encode(Code) +
            '&redirect_uri=' + TNetEncoding.URL.Encode(FRedirectURI) +
            '&client_id=' + FClientID +
            '&client_secret=' + FClientSecret;

  PostData := TStringStream.Create(Params, TEncoding.UTF8);
  try
    try
      ResultStr := FIdHTTP.Post(FTokenEndpoint, PostData);

      JSON := TJSONObject.ParseJSONValue(ResultStr) as TJSONObject;
      try
        AccessToken := JSON.GetValue<string>('access_token');
      finally
        JSON.Free;
      end;

      UserInfoJSON := GetUserInfo(AccessToken);
      Result := True;
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

function TAuthService.GetUserInfo(const AccessToken: string): string;
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
