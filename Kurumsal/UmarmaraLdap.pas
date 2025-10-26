unit UmarmaraLdap;

interface

uses
  System.SysUtils, System.Classes, System.JSON, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent, System.DateUtils;

type
  TKvkNetClient = class
  private
    FHttp: TNetHTTPClient;
    FAccessToken: string;
    FExpiresAt: TDateTime;

    FUsername: string;
    FPassword: string;

    FTokenUrl: string;
    FAuthUrl: string;
  public
    constructor Create(const AUsername, APassword, ATokenUrl, AAuthUrl: string);
    destructor Destroy; override;

    function Authenticate: Boolean;
    function VerifyUser(const ABysUsername, ABysPassword: string; out AMessage: string): Boolean;

    property AccessToken: string read FAccessToken;
    property ExpiresAt: TDateTime read FExpiresAt;
  end;

implementation

{ TKvkNetClient }

constructor TKvkNetClient.Create(const AUsername, APassword, ATokenUrl, AAuthUrl: string);
begin
  FHttp := TNetHTTPClient.Create(nil);
  FUsername := AUsername;
  FPassword := APassword;

  FTokenUrl := ATokenUrl;
  FAuthUrl := AAuthUrl;
end;

destructor TKvkNetClient.Destroy;
begin
  FHttp.Free;
  inherited;
end;

function TKvkNetClient.Authenticate: Boolean;
var
  JsonReq, JsonRes: TJSONObject;
  ReqStream, ResStream: TStringStream;
  ExpiresStr: string;
begin
  Result := False;
  JsonReq := TJSONObject.Create;
  try
    JsonReq.AddPair('Username', FUsername);
    JsonReq.AddPair('Password', FPassword);

    ReqStream := TStringStream.Create(JsonReq.ToJSON, TEncoding.UTF8);
    try
      FHttp.ContentType := 'application/json';
      ResStream := TStringStream.Create;
      try
        FHttp.Post(FTokenUrl, ReqStream, ResStream);
        ResStream.Position := 0;
        JsonRes := TJSONObject.ParseJSONValue(ResStream.DataString) as TJSONObject;
        try
          if Assigned(JsonRes) and
             JsonRes.TryGetValue<string>('AccessToken', FAccessToken) and
             JsonRes.TryGetValue<string>('ExpiresAt', ExpiresStr) then
          begin
            FExpiresAt := ISO8601ToDate(ExpiresStr);
            Result := True;
          end;
        finally
          JsonRes.Free;
        end;
      finally
        ResStream.Free;
      end;
    finally
      ReqStream.Free;
    end;
  finally
    JsonReq.Free;
  end;
end;

function TKvkNetClient.VerifyUser(const ABysUsername, ABysPassword: string; out AMessage: string): Boolean;
var
  JsonStr : string;
  JsonReq, JsonRes, AuthResult: TJSONObject;
  ReqStream, ResStream: TStringStream;

begin
  Result := False;
  AMessage := '';

  if FAccessToken = '' then
  begin
    AMessage := 'AccessToken alýnmamýþ. Önce Authenticate çaðýrýlmalý.';
    Exit;
  end;

  JsonReq := TJSONObject.Create;
  try
   JsonStr := Format('{"Username":"%s","Password":"%s"}', [
    ABysUsername,
    ABysPassword
  ]);
//    JsonReq.AddPair('Username', ABysUsername);
//    JsonReq.AddPair('Password', ABysPassword);

    ReqStream := TStringStream.Create(JsonStr, TEncoding.UTF8);
    try
      FHttp.CustomHeaders['Authorization'] := 'Bearer ' + FAccessToken;
      FHttp.ContentType := 'application/json';

      ResStream := TStringStream.Create('', TEncoding.UTF8);
      try
        FHttp.Post(FAuthUrl, ReqStream, ResStream);
        ResStream.Position := 0;
        JsonRes := TJSONObject.ParseJSONValue(ResStream.DataString) as TJSONObject;
        try
          if Assigned(JsonRes) and JsonRes.TryGetValue<TJSONObject>('KimlikDogrulama', AuthResult) then
          begin
            Result := AuthResult.GetValue<Boolean>('Basarili');
            AMessage := AuthResult.GetValue<string>('Mesaj');
          end;
        finally
          JsonRes.Free;
        end;
      finally
        ResStream.Free;
      end;
    finally
      ReqStream.Free;
    end;
  finally
    JsonReq.Free;
  end;
end;

end.

