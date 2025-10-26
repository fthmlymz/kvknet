unit UrlShortLib;

interface
uses MainModule, ServerModule,
  System.SysUtils, System.JSON, IPPeerClient, REST.Client, REST.Types,
  System.NetEncoding;


function UrlShort(var Url: String): String;
procedure AddRestItem(RestReq: TRESTRequest; AName, AValue, AKind: String; AEncode: Boolean);

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


end.
