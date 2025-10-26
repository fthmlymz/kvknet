unit UrlShortLib;

interface
uses MainModule, ServerModule,
  System.SysUtils, System.JSON, IPPeerClient, REST.Client, REST.Types,
  System.NetEncoding;


function GetShortUrl(link: String): String;
procedure PrepareRESTRequest(url: string; method: TRestRequestMethod);
procedure FreeRESTRequest;
procedure AddRestItem(AName, AValue, AKind: String; AEncode: Boolean);

implementation
var
    RESTReq: TRESTRequest;
    RESTResp: TRESTResponse;
    RESTCli: TRESTClient;

procedure PrepareRESTRequest(url: string; method: TRestRequestMethod);
begin
  RESTReq  := TRESTRequest.Create(nil);
  RESTCli  := TRESTClient.Create(nil);
  RESTresp := TRESTResponse.Create(nil);
  RESTReq.Client := RESTCli;
  RESTReq.Response := RESTResp;
  RESTReq.Method := method;
  RESTReq.params.Clear;
  restReq.Body.ClearBody;
  RESTCli.BaseURL := url;
end;

procedure FreeRESTRequest;
begin
  RESTReq.Free;
  RESTCli.Free;
  RESTResp.Free;
end;

procedure AddRestItem(AName, AValue, AKind: String; AEncode: Boolean);
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

function GetShortUrl(link: String): String;
var
  url: string;
  sonuc: String;
  params: string;
begin
  if MainMod.ShortUrlLink = '' then
  begin
    Result :=  'Error';
    Exit;
  end;

  url :=  MainMod.ShortUrlLink + 'api/UrlEnc/?';
  PrepareRESTRequest(url, rmGET);
  params := params + 'originalUrl=' + link;
  RESTCli.BaseURL := url + params;
  try
    RESTReq.Execute;
    sonuc := RESTResp.Content;
    if (AnsiPos('error',sonuc) > 0) then
    begin
      Result := 'Error';
    end
    else if RESTReq.Response.StatusCode <> 200 then
      Result := 'Error'
    else
    begin
      Result := MainMod.ShortUrlLink + '?url=' + StringReplace(sonuc, '"', '', [rfReplaceAll]);
    end;
  except
    Result := 'Error'
  end;


  FreeRESTRequest;
end;

end.
