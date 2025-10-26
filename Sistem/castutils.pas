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
    function ValidateTicket(const ATicket: string; ServiceUrl: string): String; // Ticket doðrulama
    function GetUserAttributes(const ATicket: string; const ServiceUrl: string): TStringList; // Kullanýcý bilgilerini alma
  end;

implementation

{ TMyCASClient }

constructor TMyCASClient.Create(const ABaseUrl: string);
begin
  FBaseUrl := ABaseUrl;
  FHttpClient := TIdHTTP.Create(nil);
  FSSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  // HTTPS için SSL yapýlandýrmasý

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
    // Kullanýcý bilgilerini almak için ticket ve servis URL'si ile bir doðrulama isteði yap
    Response := FHttpClient.Get(FBaseUrl + '/serviceValidate?ticket=' + ATicket + '&service=' + TNetEncoding.URL.Encode(ServiceUrl));
    // Yanýtta kullanýcý özelliklerini arýyoruz (örneðin, cas:attributes etiketi içinde)
    AttrStart := Pos('<cas:attributes>', Response);
    AttrEnd := Pos('</cas:attributes>', Response);
    if (AttrStart > 0) and (AttrEnd > 0) then
    begin
      // Özellikleri çýkarýyoruz
      UserAttributesXml := Copy(Response, AttrStart, AttrEnd - AttrStart + Length('</cas:attributes>'));
      // Burada kullanýcý özelliklerini ayrýþtýrýp Result listesine ekleyebilirsiniz
      // Örneðin, XML formatýndaki yanýtý parçalayarak ilgili alanlarý Result'a ekleyin.
      Result.Add('User attributes XML: ' + UserAttributesXml);
    end
    else
    begin
      // Kullanýcý özellikleri bulunamadýysa
      Result.Add('Kullanýcý özellikleri bulunamadý.');
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
  // CAS doðrulama URL'sini oluþtur
  ValidationUrl := FBaseUrl + '/serviceValidate?ticket=' + ATicket + '&service=' + TNetEncoding.URL.Encode(ServiceUrl);
  try
    // HTTP isteðini gönder ve yanýtý al
    Response := FHttpClient.Get(ValidationUrl);
  except
    on E: Exception do
    begin
      ServerMod.Logger.AddLog('Hata','CAS SSO baþarýsýz!');
      Result := '';
    end;
  end;
  // Yanýtýn doðrulanýp doðrulanmadýðýný kontrol et
  if  Pos('<cas:authenticationSuccess>', Response) > 0 then
  begin
    UserStart := Pos('<cas:user>', Response) + Length('<cas:user>');
    UserEnd := Pos('</cas:user>', Response);
    if (UserStart > 0) and (UserEnd > 0) then
    begin
      // Kullanýcý adýný çýkar ve döndür
        result := Copy(Response, UserStart, UserEnd - UserStart);
    end else
      result := '';
  end else
  begin
    result := '';
    ServerMod.Logger.AddLog('Hata','Kullanýcý Doðrulama  baþarýsýz!');
  end;

end;

end.
