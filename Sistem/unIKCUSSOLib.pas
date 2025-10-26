unit unIKCUSSOLib;

interface

uses ServerModule, MainModule, McMLib, uniGUIApplication,
     System.NetEncoding, System.JSON, System.SysUtils,Rest.Client,DateUtils,
     JOSE.Core.JWT, JOSE.Core.JWS, JOSE.Core.JWE, JOSE.Core.JWK, JOSE.Core.JWA,
     JOSE.Types.JSON, JOSE.Encoding.Base64, JOSE.Core.Builder, REST.Types,
     System.StrUtils,castutils ;
type
  THasAligoritma = (TaHS256,TaHS384,TaHS512);
  TSsoInfo = record
      UserName,
      Issuer,
      kurumId,
      ClentId,
      email : string;
      nonce : string;
      ExpDate: Int64;
//      preferred_username: string;
    end;
//  type
//  TJwtIDMAP = record
//    UserName : string;
//    nbf: Int64;
//    exp: Int64;
//    iss: string;
//    aud: TArray<string>;
//    client_id: string;
//    sub: string;
//    auth_time: Int64;
//    idp: string;
//    email_verified: Boolean;
//    name: string;
//    preferred_username: string;
//    given_name: string;
//    family_name: string;
//    email: string;
//    role: TArray<string>;
//    jti: string;
//    iat: Int64;
//    scope: TArray<string>;
//  end;


function UBYSDecode( Assoinfo:TSsoInfo ; JWT:string): string; overload;
//function UBYSDecode(var Assoinfo:TJwtIDMAP ; JWT:string): string; overload;
function ubysEncode(AKey ,Ausername : string; AHasAligoritma : THasAligoritma= TaHS256): string;

function UBYSCheckLogin( var JWT:string ;ASSOkodKontrol :integer =0): Integer;
function UBYSVerifyToken(AJWT, AKey: String): Boolean;
function UBYSGetDetail(UName:string; UbysId:String) : Integer;
procedure PrepareRESTRequest(url: string; method: TRestRequestMethod);
procedure AddRestItem(AName, AValue, AKind: String; AEncode: Boolean);
procedure FreeRESTRequest;
function Slashcontrol(Astring  : string) :string;
const
 jwtKey  : String = 'AES256-GCM-SHA384:AES128-GCM-SHA256:AES256-SHA256:AES128-SHA256:AES256-SHA:AES128-SHA';

implementation

var
  RESTReq     : TRESTRequest;
  RESTResp    : TRESTResponse;
  RESTCli     : TRESTClient;
  UbysDept_Id : String;
  UbysRole    : String;
  UName       ,
  Password    : String;

procedure FreeRESTRequest;
begin
  RESTReq.Free;
  RESTCli.Free;
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


procedure PrepareRESTRequest(url: string; method: TRestRequestMethod);
begin
  RESTReq  := TRESTRequest.Create(nil);
  RESTCli  := TRESTClient.Create(nil);
  RESTresp := TRESTResponse.Create(nil);
  RESTReq.Client := RESTCli;
  RESTReq.Response := RESTresp;
  RESTReq.Method := method;
  RESTReq.params.Clear;
  restReq.Body.ClearBody;
  RESTCli.BaseURL := url;
end;

function UBYSVerifyToken(AJWT, AKey: String): Boolean;
var
  LKey: TJWK;
  LToken: TJWT;
  LSigner: TJWS;
  LCompactToken: string;
  tmp: string;
begin
  Result := False;
  LCompactToken := AJWT;
  try
    LToken := TJWT.Create;
    try
      LSigner := TJWS.Create(LToken);
      LSigner.SkipKeyValidation := True;
      try
        LSigner.SetKey(AKey);
        LSigner.CompactToken := LCompactToken;
        LSigner.VerifySignature;
      finally
        LSigner.Free;
      end;
      if LToken.Verified then
        Result := True;
    finally
      LToken.Free;
    end;
  except
    on E: Exception do
      Servermod.Logger.AddLog('HATA!', 'UBYS Token doðrulanamadý: ' + e.Message)
  end;
end;

function UBYSGetDetail(UName:string; UbysId:String) : Integer;
var
  Parola     ,
  ABody      ,
  UserName   ,
  UID        : String;
  ValueList  : TJSONArray;
  jsonObject : TJSONObject;
begin
  Result := -201;
  Parola := TNetEncoding.Base64.Encode(MainMod.UbysUName + ':' + MainMod.UbysPassword);
  try
    PrepareRESTRequest(MainMod.UbysUrl, rmPOST);
    AddRestItem('Authorization', 'Basic '+Parola, 'HEADER', false);
    ABody   := '{"serviceName":"GetWebReportResult",' +
                 '"serviceCriteria":{"ReportId": 60'+
                 '}}';

    RESTReq.AddBody(ABody,ctAPPLICATION_JSON);
    RESTReq.Execute;
  except on E: Exception do
    begin
      ServerMod.Logger.AddLog('Error connecting to UBYS API : ' + E.Message);
    end;
  end;

  if not RESTResp.Status.Success then
  begin
    ServerMod.Logger.AddLog('No response from the UBYS service ! Error: '+RESTResp.StatusText+' '+inttostr(RESTResp.StatusCode));
  end
  else
  begin
    jsonObject := TJSONObject.ParseJSONValue(RESTResp.Content) as TJSONObject;
    TJsonObject(jsonObject).TryGetValue('ValueList', ValueList);


    if ValueList.Count > 0 then
    begin
      for var value in ValueList do
      begin
          ValueList := value.GetValue<TJSONArray>;

          UserName := StringReplace(ValueList.Items[1].ToString, '"', '', [rfReplaceAll, rfIgnoreCase]);
          UID      := IfThen(StringReplace(ValueList.Items[0].ToString, '"', '', [rfReplaceAll, rfIgnoreCase]) = '', '0', StringReplace(ValueList.Items[0].ToString, '"', '', [rfReplaceAll, rfIgnoreCase]));
          if (UserName = UName) AND (UID = UbysId) then
          begin
            UbysDept_Id := StringReplace(ValueList.Items[12].ToString, '"', '', [rfReplaceAll, rfIgnoreCase]);
            UbysRole    := TR_Upper(StringReplace(ValueList.Items[11].ToString, '"', '', [rfReplaceAll, rfIgnoreCase]));
            Result := -200;
            Break;
          end;
      end;
    end;
  end;

end;

function ubysEncode(AKey ,Ausername : string; AHasAligoritma : THasAligoritma= TaHS256): string;
var
  LToken: TJWT;
  LAlg: TJOSEAlgorithmId;
  FCompact: string;
  LKeyPair: TKeyPair;
  LSigner: TJWS;
  LpayLoadString : string;
  LNow: TDateTime;
  LExp: TDateTime;
begin
  LNow := Now;
  LExp := LNow + (10 / (24 * 60)); // 10 dakika sonrasýný hesapla
  LpayLoadString :=   '{  "subject": "Aryomyazilim", '+
                      ' "Issuer": "DgrNet-KVKKNet", '+
                      ' "username": "'+Ausername+ '", '+
                      ' "IssuedAt": "'+IntToStr(DateTimeToUnix(LNow)) +'",'+
                      '  "exp": "'+ IntToStr(DateTimeToUnix(LExp)) +'" } ';
  result := '';
  LToken := TJWT.Create;
  try
    // Header'ý JSON olarak ayarlama
    LToken.Header.Create ;//:= TJWTHeader.Create;
    LToken.Header.JSON := TJSONObject(TJSONObject.ParseJSONValue('{ "alg": "HS256", "typ": "JWT" }'));
    // Claims'i JSON olarak  ayarlayýn
    LToken.Claims.Create;// := TJWTClaims.Create;
    LToken.Claims.JSON := TJSONObject(TJSONObject.ParseJSONValue(LpayLoadString));
    case AHasAligoritma of
      TaHS256: LAlg := TJOSEAlgorithmId.HS256;
      TaHS384: LAlg := TJOSEAlgorithmId.HS384;
      TaHS512: LAlg := TJOSEAlgorithmId.HS512;
    else
      LAlg := TJOSEAlgorithmId.HS256;
    end;
    if Assigned(LToken.Header) and Assigned(LToken.Claims) then
    begin
      LSigner := TJWS.Create(LToken);
      LKeyPair := TKeyPair.Create;
      try
        // Anahtarýnýzý Base64 olarak ayarý
        LKeyPair.PrivateKey.Key := TBase64.Decode('your-base64-encoded-key');
        LSigner.SkipKeyValidation := True;
        LSigner.Sign(LKeyPair.PrivateKey, LAlg);
        // Sonuç olarak CompactToken'ý ayarý
        result := LSigner.CompactToken;
      finally
        LKeyPair.Free;
        LSigner.Free;
      end;
    end;
  finally
    LToken.Free;
  end;


   {
  // Create a JWT Object
  LToken := TJWT.Create;
  try
    // Token claims
    LToken.Claims.Subject := 'AryomYazilim';      // Token sahibi
    LToken.Claims.Issuer := 'DgrNet-KvkkNet'; // Token'ý oluþturan
    LToken.Claims.Audience := 'AryomYazilim';           // Tek bir audience deðeri
    LToken.Claims.SetClaim('userName',Ausername);
    LToken.Claims.IssuedAt := Now;                // Token'ýn oluþturulma zamaný
    LToken.Claims.Expiration := Now + 10 / (24 * 60); // 10 dakika geçerlilik süresi

    // Signing algorithm
    case ord(AHasAligoritma) of
      0: LAlg := TJOSEAlgorithmId.HS256;
      1: LAlg := TJOSEAlgorithmId.HS384;
      2: LAlg := TJOSEAlgorithmId.HS512;
    else
      LAlg := TJOSEAlgorithmId.HS256;
    end;
      // Custom claims

    // Signing and compact format creation.
    FCompact := TJOSE.SerializeCompact(Akey, LAlg, LToken);
    // Token in compact representation
//    memoCompact.Lines.Add(FCompact);
    result := FCompact;
    // Header and Claims JSON representation
//    mmoCompact.Lines.Add('Header: ' + TJSONUtils.ToJSON(LToken.Header.JSON));
//    mmoCompact.Lines.Add('Claims: ' + TJSONUtils.ToJSON(LToken.Claims.JSON));
  finally
    LToken.Free;
  end;
  }
end;



function UBYSDecode( Assoinfo:TSsoInfo ; JWT:string): string;
var
  Header, PayLoad,Signature, UserName, Issuer: string;
  ExpDate: Int64;
  PayLoadJSON: TJsonObject;
 // Ssoinfo : TSsoInfo;

begin

  Header := TNetEncoding.Base64.Decode(Copy(Jwt,1,Pos('.',Jwt)-1));
  Delete(Jwt,1,Pos('.',Jwt));
  PayLoad := TNetEncoding.Base64.Decode(Copy(Jwt,1,Pos('.',Jwt)-1));

//   Header := TNetEncoding.Base64Url.Decode(JWT.Split(['.'])[0]);
//   Payload := TNetEncoding.Base64Url.Decode(JWT.Split(['.'])[1]);
//   Signature := JWT.Split(['.'])[2];

  PayLoadJSON := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(PayLoad), 0) as TJSONObject;
  try

    PayLoadJSON.TryGetValue('username', Assoinfo.UserName);
    PayLoadJSON.TryGetValue('exp',Assoinfo.ExpDate);
    PayLoadJSON.TryGetValue('Issuer',Assoinfo.Issuer);
    PayLoadJSON.TryGetValue('kurumId',Assoinfo.kurumId);
    //sdu üniversitesi parametreleri
    PayLoadJSON.TryGetValue('aud', Assoinfo.ClentId);
    PayLoadJSON.TryGetValue('nonce',Assoinfo.nonce);
    PayLoadJSON.TryGetValue('email',Assoinfo.email ) ;

    if Assoinfo.UserName ='' then
     PayLoadJSON.TryGetValue('kimlik_no', Assoinfo.UserName);
    if Assoinfo.Issuer='' then
    PayLoadJSON.TryGetValue('iss',Assoinfo.Issuer);
    // sdu üniversitesi parmetre sonu

     //IDMAPP
    if Assoinfo.UserName = '' then
      PayLoadJSON.TryGetValue<string>('preferred_username',assoinfo.UserName);
     //IDMAPP SON
    if (Assoinfo.ExpDate < DateTimeToUnix(Now)) then
      Result := ''
    else
      Result := Assoinfo.UserName;
  except on E: Exception do
  begin
    ServerMod.Logger.AddLog('Hata','UBYS SSO baþarýsýz!');
  end;
  end
end;

function Slashcontrol(Astring  : string) :string;
begin
  if  (Length(Astring) > 0) and (Astring[Length(Astring)] <> '/') then
    result := Astring+'/'
    else
    result := Astring;
end;

function UBYSCheckLogin( var JWT:string ;ASSOkodKontrol :integer =0): Integer;
var
  i      ,
  Detail : Integer;
  sTmp   : String;
  AName  : string;
  UBYSSecret: string;
  Assoinfo : TSsoInfo;
  CasClient : TMyCASClient;
  UBYSURL : string;
  CASSSOValidurl : string;
//  Issuer : string;
//  kurumId:string;
begin

  UBYSSecret := MainMod.GetSysParam(MainMod.qTmp, 'UBYS SECRET');
  if mainmod.SSOType = stCasSSO then
  begin
    UBYSURL := MainMod.GetSysParam(MainMod.qTmp, 'UBYS URL');
    CASSSOValidurl := MainMod.qTmp.FieldByName('val2').AsString ;
    CasClient := TMyCASClient.Create(CASSSOValidurl) ;
    Aname := CasClient.ValidateTicket(jwt,Slashcontrol( MainMod.GetSysParam(mainmod.qTmp,'KVKNET GÝRÝÞ LINK'))) ;
  end
  else

    AName := UBYSDecode(Assoinfo ,JWT);
    AName := ifthen(MainMod.SSOType  in [stCasSSO,stIDMAPP] , TR_Upper( AName) ,AName);

  if AName = '' then
  begin
    MainMod.SaveLoginLog('', 'E', 'H', 'H');
    Result := -7;
    Exit;
  end;
  if (Assoinfo.Issuer='DgrNet-KVKKNet') and (Assoinfo.kurumId='') then
  begin
    MainMod.SaveLoginLog('','E','H','H');
    Result := -1;
    exit;
  end;
  if Assoinfo.Issuer='https://sts4.sdu.edu.tr' then
  begin
    if (Assoinfo.ClentId <> 'kvknet') then
     begin
      MainMod.SaveLoginLog('','E','H','H');
      Result := -11;
      exit;
     end;
  end;


//  if not UBYSVerifyToken(JWT, UBYSSecret) then
//  begin
//    MainMod.SaveLoginLog('', 'E', 'H', 'H');
//    Result := -7;
//    Exit;
//  end;

  QueryPrep(MainMod.qUsers, 'SELECT * FROM usr_user WHERE active=''E'' and '+
        ifthen((Assoinfo.Issuer<>'DgrNet-KVKKNet')  ,' user_name',' Email')+' = :p_name' +
        IfThen(Assoinfo.Issuer='DgrNet-KVKKNet',' and mc_id= (select id from sys_mcdef where code=:kurumId LIMIT 1) ','' )
      );
  MainMod.qUsers.ParamByName('p_name').AsString :=  AName;
  if mainmod.qUsers.Params.FindParam('kurumId')<> nil then
    mainmod.qUsers.ParamByName('kurumId').AsString := Assoinfo.kurumId;

  MainMod.qUsers.Open;
  if MainMod.qUsers.FieldByName('id').AsInteger < 1 then
  begin
    MainMod.SaveLoginLog('', 'E', 'H', 'H');
    Result := -4;
    Exit;
  end;
  if MainMod.qUsers.FieldByName('active').AsString <> 'E' then
  begin
    MainMod.SaveLoginLog('', 'E', 'H', 'H');
    Result := -5;
    Exit;
  end;

  //  if  (Assoinfo.Issuer<>'DgrNet-KVKKNet') and
//      (Assoinfo.Issuer <>'https://sts4.sdu.edu.tr') and
//      (MainMod.SSOType <> stCasSSO) and
//      (MainMod.SSOType <> stIDMAPP)   then
  if mainmod.SSOType in [stUbys] then
  begin
      Detail := UBYSGetDetail(MainMod.qUsers.FieldByName('user_name').AsString, MainMod.qUsers.FieldByName('ubys_id').AsString);
      if Detail = -201 then
      begin
        MainMod.SaveLoginLog('', 'E', 'H', 'H');
        Result := -8;
        Exit;
      end;
  end;



  QueryPrep(MainMod.qMCDef,'SELECT * FROM sys_mcdef WHERE id = :p_id');
  MainMod.qMCDef.ParamByName('p_id').AsInteger := MainMod.qUsers.FieldByName('mc_id').AsInteger;
  MainMod.qMCDef.Open;
  if MainMod.qMCDef.FieldByName('active').AsString <> 'E' then
  begin
    MainMod.SaveLoginLog(MainMod.qMCDef.FieldByName('code').AsString, 'H', '?', 'H');
    Result := -3;
    Exit;
  end;
  QueryOpen(MainMod.qGCDef, 'SELECT * FROM sys_gcdef WHERE id = ' + MainMod.qMCDef.FieldByName('gc_id').AsString);
  MainMod.GCID    := MainMod.qGCDef.FieldByName('id').AsInteger;
  MainMod.GCCode  := MainMod.qGCDef.FieldByName('code').AsString;
  MainMod.GCTitle := MainMod.qGCDef.FieldByName('title').AsString;
  MainMod.MCID    := MainMod.qMCDef.FieldByName('id').AsInteger;
  MainMod.MCCode  := MainMod.qMCDef.FieldByName('code').AsString;
  MainMod.MCTitle := MainMod.qMCDef.FieldByName('title').AsString;

//  if (Assoinfo.Issuer<>'DgrNet-KVKKNet') and
//      (Assoinfo.Issuer <>'https://sts4.sdu.edu.tr') and
//      (MainMod.SSOType <> stCasSSO) and
//      (MainMod.SSOType <> stIDMAPP)
//      then
 if mainmod.SSOType in [stUbys] then
  begin
      QueryOpen(MainMod.qTmp, 'SELECT * FROM sys_deptdef WHERE ubys_dept_id = ' + UbysDept_Id + ' AND mc_id = ' + IntToStr(MainMod.MCID));
      if MainMod.qTmp.RecordCount < 1 then
      begin
        MainMod.SaveLoginLog('', 'E', 'H', 'H');
        Result := -9;
        Exit;
      end;
  end;


  MainMod.MCType               := 1;
  MainMod.LoginInfo.ID         := MainMod.qUsers.FieldByName('id').AsInteger;
  MainMod.LoginInfo.GCID       := MainMod.GCID;
  MainMod.LoginInfo.MCID       := MainMod.MCID;
  MainMod.LoginInfo.FullName   := MainMod.qUsers.FieldByName('full_name').AsString;

  if not MainMod.qUsers.FieldByName('password_changed_at').IsNull then
    MainMod.LoginInfo.Password_change_tar := DateOf(MainMod.qUsers.FieldByName('password_changed_at').AsDateTime)
  else
    MainMod.LoginInfo.Password_change_tar := DateOf(MainMod.qUsers.FieldByName('idt').AsDateTime) ;

//  MainMod.LoginInfo.Rol        :=
//        ifthen((Assoinfo.Issuer<>'DgrNet-KVKKNet') and
//               (Assoinfo.Issuer <>'https://sts4.sdu.edu.tr') and
//              (not (MainMod.SSOType in [ stCasSSO,stIDMAPP] )), UbysRole,mainmod.qUsers.FieldByName('rol').AsString);
  mainmod.loginInfo.rol := ifthen(mainmod.SSOType = stUbys,UbysRole, mainmod.qUsers.FieldByName('rol').AsString);

  MainMod.LoginInfo.Firmalar   := MainMod.qUsers.FieldByName('list_mc').AsString;

//  if (Assoinfo.Issuer<>'DgrNet-KVKKNet') and (Assoinfo.Issuer <>'https://sts4.sdu.edu.tr') and
//      (not (MainMod.SSOType in [stCasSSO, stIDMAPP])) then
   if mainmod.SSOType = stUbys then
    MainMod.LoginInfo.Birimler   :=  MainMod.qTmp.FieldByName('id').AsString
  else
  MainMod.LoginInfo.Birimler   := mainmod.qUsers.FieldByName('list_dept').AsString;

  mainmod.LoginInfo.EMail      := MainMod.qUsers.FieldByName('email').AsString;

  QueryOpen(MainMod.qRoles, 'SELECT * FROM usr_role WHERE rol = ''' + MainMod.LoginInfo.Rol + ''' AND gc_id = ' + IntToStr(MainMod.GCID) +
                   ' AND mc_id = ' + IntToStr(MainMod.MCID));
  if MainMod.qRoles.RecordCount < 1 then
  begin
    MainMod.SaveLoginLog('', 'E', 'H', 'H');
    Result := -10;
    Exit;
  end;

  sTmp := Data2Perm(MainMod.qRoles);
  for i := 1 to 9999 do MainMod.LoginInfo.Yetkiler[i] := sTmp[i] = '1';
  // for i := 1 to 9999 do LoginInfo.Yetkiler[i] := True;

  if MainMod.mcid>0 then
  begin
    QueryPrep(MainMod.qMCParam,'SELECT * FROM sys_param_mc WHERE mc_id = :mc_id');
    MainMod.qMCParam.ParamByName('mc_id').AsInteger := MainMod.MCID;
    MainMod.qMCParam.Open;
    MainMod.IYSVar := (MainMod.qMCParam.FieldByName('iys_aktif').AsString = 'E');
    MainMod.zd_usr := MainMod.qMCParam.FieldByName('zd_username').AsString;
    MainMod.zd_pwd := MainMod.qMCParam.FieldByName('zd_password').AsString;
    if MainMod.zd_pwd <> '' then
      MainMod.zd_pwd := DecryptStr(MainMod.zd_pwd);
  end
  else
    MainMod.IYSVar := false;

  MainMod.SaveLoginLog(MainMod.MCCode, 'E', 'E', 'E');

  Result := MainMod.qUsers.FieldByName('id').AsInteger;

  QueryExec(MainMod.qTmp, 'SET KVKNET.USER_ID=' + MainMod.qUsers.FieldByName('id').AsString);
  QueryExec(MainMod.qTmp, 'SET KVKNET.USER_IP=''' + UniGuiApplication.UniApplication.RemoteAddress+'''');
end;



end.
