unit KVKNETAPILib;

interface

uses MainModule, ServerModule,
  System.SysUtils, System.JSON, IPPeerClient, REST.Client, REST.Types,
  System.NetEncoding;

function apiTokenAl:String;
function SendSMS(var Msg: String; Rcpnt: String; Fast: Boolean; IpAdres: String; SrcType: String; arId: Integer): Boolean;
function NufusKontrolEt(TCKimlikNo:String; dogumTarihi:String; adiSoyadi: String; veliTCKimlikNo:String; veliDogumTarihi:String; aile: integer; var sonuc:String): boolean;

procedure AddRestItem(RestReq: TRESTRequest; AName, AValue, AKind: String; AEncode: Boolean);

implementation

procedure AddRestItem(RestReq: TRESTRequest; AName, AValue, AKind: String; AEncode: Boolean);
var
  AItem : TRestRequestParameter;
begin
  AItem       := RestReq.Params.AddItem;
  AItem.name  := AName;
  AItem.Value := AValue;
  AItem.Kind  := pkGETorPOST;
  if AKind = 'HEADER' then AItem.Kind := pkHTTPHEADER;
  if not AEncode then AItem.Options := [poDoNotEncode];
end;

function apiTokenAl:String;
var
  RESTClient: TRESTClient;
  RESTResponse: TRESTResponse;
  RESTRequest: TRESTRequest;
  result_code: string;
  result_data: TJSONArray;
begin
  if (mainmod.apiToken <> '') and (mainmod.apiTokenBitis > now) then
  begin
    result := mainmod.apiToken;
    ServerMod.Logger.AddLog('API TOKEN Geçerlilik ' + FormatDateTime('dd.mm.yyyy hh:nn:ss', mainmod.apiTokenBitis));
    exit;
  end;

  RESTClient := TRESTClient.Create(nil);
  RESTResponse := TRESTResponse.Create(nil);
  RESTRequest := TRESTRequest.Create(nil);
  RESTRequest.Method := TRestRequestMethod.rmPOST;
  RESTClient.BaseURL := mainmod.apiAdres + '/api/Login';

  AddRestItem(RESTRequest, 'CompCode', TNetEncoding.Base64.EncodeBytesToString(TEncoding.UTF8.GetBytes(mainmod.mccode)), 'HEADER', false);
  AddRestItem(RESTRequest, 'Username', TNetEncoding.Base64.EncodeBytesToString(TEncoding.UTF8.GetBytes(mainmod.logininfo.username)), 'HEADER', false);
  AddRestItem(RESTRequest, 'Password', TNetEncoding.Base64.EncodeBytesToString(TEncoding.UTF8.GetBytes(mainmod.LoginInfo.Password)), 'HEADER', false);

  RESTRequest.Client := RESTClient;
  RESTRequest.Response := RESTResponse;

  try
    RESTRequest.Execute;

//'{"classname":"","detailedmessage":"","apperrorcode":0,"items":[],"statuscode":401,"reasonstring":"error","message":"Hatalý kullanýcý adý. Lütfen kontrol ediniz.","data":null}'
    TJsonObject(RESTResponse.jsonvalue).TryGetValue('resultCode', result_code);
    if result_code <> '0' then
    begin
      mainmod.apiToken := '';
      result := '';
      ServerMod.Logger.AddLog('API TOKEN Alýnamadý statuscode ' + result_code);
      exit;
    end;
  except on E:Exception do
    begin
      ServerMod.Logger.AddLog('SMS Gönderilemedi - API TOKEN alýnamadý ' + E.Message);
      exit;
    end;
  end;

  TJsonObject(RESTResponse.jsonvalue).TryGetValue('data', result_data);
  //mainmod.apiToken := RESTResponse.Content;
  mainmod.apiTokenBitis := Now + 0.5;
  mainmod.apiToken := Copy(result_data.ToString, 3, Length(result_data.ToString) - 4);
  result := mainmod.apiToken;
  ServerMod.Logger.AddLog('API TOKEN Alýndý Geçerlilik ' + FormatDateTime('dd.mm.yyyy hh:nn:ss', mainmod.apiTokenBitis));
end;


function SendSMS(var Msg: String; Rcpnt: String; Fast: Boolean; IpAdres: String; SrcType: String; arId: Integer): Boolean;
var
  RESTClient: TRESTClient;
  RESTResponse: TRESTResponse;
  RESTRequest: TRESTRequest;
  result_code, result_description: string;
  apiToken: string;
  aBody: TJSONObject;
begin
  try
    result := false;
    RESTClient := TRESTClient.Create(nil);
    RESTResponse := TRESTResponse.Create(nil);
    RESTRequest := TRESTRequest.Create(nil);
    RESTRequest.Method := TRestRequestMethod.rmPOST;
    RESTClient.BaseURL := mainmod.apiadres + '/api/SendSms';

    apiToken := ApiTokenAl;
      if apiToken = '' then
      begin
        msg := 'SMS gönderilemedi! (statuscode:401)';
        ServerMod.Logger.AddLog('SMS Gönderilemedi - API TOKEN alýnamadý');
        exit;
      end;
//    RESTRequest.AddParameter('Authorization', 'Bearer ' + apiToken, TRESTRequestParameterKind.pkHTTPHEADER);
//    RESTRequest.AddParameter('Accept-Encoding', 'gzip, deflate, br', TRESTRequestParameterKind.pkHTTPHEADER);
//    RESTRequest.AddParameter('Content-Type', 'application/json', TRESTRequestParameterKind.pkHTTPHEADER);

    AddRestItem(RESTRequest, 'Authorization', 'Bearer ' + apiToken, 'HEADER', false);
    AddRestItem(RESTRequest, 'Accept-Encoding', 'gzip, deflate, br', 'HEADER', false);
    AddRestItem(RESTRequest, 'Content-Type', 'application/json', 'HEADER', false);

    aBody := TJSONObject.Create;
    abody.AddPair('gsmno', rcpnt);
    abody.AddPair('mesaj', msg);
    if fast then
      abody.AddPair('fast', 'E')
    else
      abody.AddPair('fast', 'H');

    abody.AddPair('ipAdres', IpAdres);
    abody.AddPair('srcType', SrcType);
    abody.AddPair('arId', arId);
    RESTRequest.AddBody(aBody.ToString, ctAPPLICATION_JSON);

    RESTRequest.Client := RESTClient;
    RESTRequest.Response := RESTResponse;
    try
      RESTRequest.Execute;
      except on E:Exception do
      begin
        ServerMod.Logger.AddLog('SMS Gönderilemedi ' + E.Message);
        exit;
      end;

    end;
    TJsonObject(RESTResponse.jsonvalue).TryGetValue('resultCode', result_code);
    TJsonObject(RESTResponse.jsonvalue).TryGetValue('resultDesc', result_description).ToString;

    msg := '';
    if result_code = '0' then
    begin
      result := true;
      ServerMod.Logger.AddLog('SMS Gönderildi');
  //    memo1.lines.Add('Baþarýlý: ' + result_code + ' ' + result_description);
  //    memo1.lines.Add(TJsonObject(RESTResponse.jsonvalue).GetValue('data').ToString);
  //    result_data := TJSONArray(TJSonObject.ParseJSONValue(TJsonObject(RESTResponse.jsonvalue).GetValue('data').ToString));
    end
    else
    begin
      result := false;

      msg := 'Hata: ' + result_code + ' ' + result_description;
      if result_code = '' then
      begin
        TJsonObject(RESTResponse.jsonvalue).TryGetValue('statuscode', result_code).ToString;
        TJsonObject(RESTResponse.jsonvalue).TryGetValue('message', result_description).ToString;
        if result_code='401' then
        begin
          mainmod.apitoken := '';
          msg := 'Hata: Web servis hatasý, lütfen tekrar deneyiniz.';
        end;
        ServerMod.Logger.AddLog('SMS Gönderilemedi resultcode ' + result_code + ' ' + result_description);

      end;
    end;
  except on ex:exception do
  begin
    msg := ex.Message;
  end;
end;

end;

function NufusKontrolEt(TCKimlikNo, dogumTarihi, adiSoyadi, veliTCKimlikNo,
  veliDogumTarihi: String; aile: integer; var sonuc: String): boolean;
var
  RESTClient: TRESTClient;
  RESTResponse: TRESTResponse;
  RESTRequest: TRESTRequest;
  result_code, result_description: string;
  apiToken: string;
  aBody: TJSONObject;
begin
  if Length(TCKimlikNo) <> 11 then
  begin
    sonuc := 'TC Kimlik No hatalý';
    result := false;
    exit;
  end;
  if Length(dogumtarihi) <> 10 then
  begin
    sonuc := 'Doðum Tarihi hatalý';
    result := false;
    exit;
  end;
  if Length(adiSoyadi) = 0 then
  begin
    sonuc := 'Adý Soyadý hatalý';
    result := false;
    exit;
  end;

try
    result := false;
    RESTClient := TRESTClient.Create(nil);
    RESTResponse := TRESTResponse.Create(nil);
    RESTRequest := TRESTRequest.Create(nil);
    RESTRequest.Method := TRestRequestMethod.rmPOST;
    RESTClient.BaseURL := mainmod.apiadres + '/api/GetNufusDogrula';

    apiToken := ApiTokenAl;
      if apiToken = '' then
      begin
        sonuc := 'Hata! (statuscode:401)';
        ServerMod.Logger.AddLog('Nufus Doðrulanamadý - API TOKEN alýnamadý');
        exit;
      end;
    RESTRequest.AddAuthParameter('Authentication', 'bearer' + apiToken, TRESTRequestParameterKind.pkHTTPHEADER);
    RESTRequest.AddParameter('Accept-Encoding', 'gzip, deflate, br', TRESTRequestParameterKind.pkHTTPHEADER);
    RESTRequest.AddParameter('Content-Type', 'text/plain', TRESTRequestParameterKind.pkHTTPHEADER);

    aBody := TJSONObject.Create;
    if aile = 0 then
    begin
      abody.AddPair('tckimlikno', tckimlikno);
      abody.AddPair('dogumtarihi', dogumTarihi);
      abody.AddPair('aile', TjsonNumber.Create(aile));
    end
    else
    if aile = 1 then
    begin
      abody.AddPair('tckimlikno_cocuk', tckimlikno);
      abody.AddPair('dogumtarihi_cocuk', dogumTarihi);
      abody.AddPair('tckimlikno', veliTCKimlikNo);
      abody.AddPair('dogumtarihi', veliDogumTarihi);
      abody.AddPair('aile', TjsonNumber.Create(aile));
    end;
    RESTRequest.AddBody(aBody.ToString, ctAPPLICATION_JSON);

    RESTRequest.Client := RESTClient;
    RESTRequest.Response := RESTResponse;
    try
      RESTRequest.Execute;
      except on E:Exception do
      begin
        ServerMod.Logger.AddLog('Hata! ' + E.Message);
        exit;
      end;

    end;
    TJsonObject(RESTResponse.jsonvalue).TryGetValue('resultCode', result_code);
    TJsonObject(RESTResponse.jsonvalue).TryGetValue('resultDesc', result_description).ToString;

    sonuc := '';
    if result_code = '0' then
    begin


      result := true;
//      ServerMod.Logger.AddLog('Nüfus Doðrulandý');
  //    memo1.lines.Add('Baþarýlý: ' + result_code + ' ' + result_description);
  //    memo1.lines.Add(TJsonObject(RESTResponse.jsonvalue).GetValue('data').ToString);
  //    result_data := TJSONArray(TJSonObject.ParseJSONValue(TJsonObject(RESTResponse.jsonvalue).GetValue('data').ToString));
    end
    else
    begin
      result := false;

      sonuc := 'Hata: ' + result_code + ' ' + result_description;
      if result_code = '' then
      begin
        TJsonObject(RESTResponse.jsonvalue).TryGetValue('statuscode', result_code).ToString;
        TJsonObject(RESTResponse.jsonvalue).TryGetValue('message', result_description).ToString;
        if result_code='401' then
        begin
          mainmod.apitoken := '';
          sonuc := 'Hata: Web servis hatasý, lütfen tekrar deneyiniz.';
        end;
        ServerMod.Logger.AddLog('Hata! resultcode ' + result_code + ' ' + result_description);

      end;
    end;
  except on ex:exception do
  begin
    sonuc := ex.Message;
  end;

  end;
end;

end.
