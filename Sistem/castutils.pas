unit castutils;

interface

uses ServerModule,IdHTTP, IdSSLOpenSSL, IdGlobal, System.Net.URLClient, System.Net.HttpClient, System.Net.HttpClientComponent,
strutils,system.classes,netencoding,uniGUIFrame,sysutils;

type
  TMyCASClient = class
  private
    FBaseUrl: string;
    FHttpClient: TIdHTTP;
    FSSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  public
    constructor Create(const ABaseUrl: string);
    destructor Destroy; override;
    function ValidateTicket(const ATicket: string; ServiceUrl: string): String; // Ticket do�rulama
    function GetUserAttributes(const ATicket: string; const ServiceUrl: string): TStringList; // Kullan�c� bilgilerini alma
  end;

implementation

{ TMyCASClient }

constructor TMyCASClient.Create(const ABaseUrl: string);
begin
  FBaseUrl := ABaseUrl;
  FHttpClient := TIdHTTP.Create(nil);
  FSSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  // HTTPS i�in SSL yap�land�rmas�

  {
      FSSLHandler.MaxLineAction := maException;
      FSSLHandler.SSLOptions.Method := sslvTLSv1_2; //sslvTLSv1; // sslvSSLv23;
      FSSLHandler.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
      FSSLHandler.SSLOptions.Mode := sslmClient; // sslmUnassigned;
      FSSLHandler.SSLOptions.VerifyMode := [];
      FSSLHandler.SSLOptions.VerifyDepth := 0;
   }

  FHttpClient.IOHandler := FSSLHandler;
end;

destructor TMyCASClient.Destroy;
begin
FHttpClient.Free;
  FSSLHandler.Free;
  inherited;
end;

function TMyCASClient.GetUserAttributes(const ATicket: string; const ServiceUrl: string): TStringList;
var
  Response, UserAttributesXml: string;
  AttrStart, AttrEnd: Integer;
begin
  Result := TStringList.Create;
  try
    // Kullan�c� bilgilerini almak i�in ticket ve servis URL'si ile bir do�rulama iste�i yap
    Response := FHttpClient.Get(FBaseUrl + '/serviceValidate?ticket=' + ATicket + '&service=' + TNetEncoding.URL.Encode(ServiceUrl));
    // Yan�tta kullan�c� �zelliklerini ar�yoruz (�rne�in, cas:attributes etiketi i�inde)
    AttrStart := Pos('<cas:attributes>', Response);
    AttrEnd := Pos('</cas:attributes>', Response);
    if (AttrStart > 0) and (AttrEnd > 0) then
    begin
      // �zellikleri ��kar�yoruz
      UserAttributesXml := Copy(Response, AttrStart, AttrEnd - AttrStart + Length('</cas:attributes>'));
      // Burada kullan�c� �zelliklerini ayr��t�r�p Result listesine ekleyebilirsiniz
      // �rne�in, XML format�ndaki yan�t� par�alayarak ilgili alanlar� Result'a ekleyin.
      Result.Add('User attributes XML: ' + UserAttributesXml);
    end
    else
    begin
      // Kullan�c� �zellikleri bulunamad�ysa
      Result.Add('Kullan�c� �zellikleri bulunamad�.');
    end;
  except
    Result.Free;
    raise;
  end;

end;

function TMyCASClient.ValidateTicket(const ATicket: string; ServiceUrl: string): String;
var
   ValidationUrl, Response ,user: string;
   UserStart, UserEnd: Integer;
   UserAttributes: TStringList;
begin
  // CAS do�rulama URL'sini olu�tur
  ValidationUrl := FBaseUrl + '/serviceValidate?ticket=' + ATicket + '&service=' + TNetEncoding.URL.Encode(ServiceUrl);
  try
    // HTTP iste�ini g�nder ve yan�t� al
    Response := FHttpClient.Get(ValidationUrl);
  except
    on E: Exception do
    begin
      ServerMod.Logger.AddLog('Hata','CAS SSO ba�ar�s�z!');
      Result := '';
    end;
  end;
  // Yan�t�n do�rulan�p do�rulanmad���n� kontrol et
  if  Pos('<cas:authenticationSuccess>', Response) > 0 then
  begin
    UserStart := Pos('<cas:user>', Response) + Length('<cas:user>');
    UserEnd := Pos('</cas:user>', Response);
    if (UserStart > 0) and (UserEnd > 0) then
    begin
      // Kullan�c� ad�n� ��kar ve d�nd�r
        result := Copy(Response, UserStart, UserEnd - UserStart);
    end else
      result := '';
  end else
  begin
    result := '';
    ServerMod.Logger.AddLog('Hata','Kullan�c� Do�rulama  ba�ar�s�z!');
  end;

end;

end.
