unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, uniGUIBaseClasses, uniGUIClasses, uniImageList, McMLib,
  Uni, Data.DB, IniFiles, UniProvider, DBAccess, PostgreSQLUniProvider, MemDS, VCL.Graphics,
  VirtualTable, XSuperObject, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IdSSLOpenSSL, IdURI, uniDBGrid, VCL.FlexCel.Core, FlexCel.XlsAdapter,variants,
  Vcl.Imaging.pngimage, uniImage, uniGUIApplication, ActiveX, ActiveDs_TLB, ADShlp,ActiveDirectory.Client,
  StrUtils,System.Net.HttpClient,system.JSON,system.IOUtils, DASQLMonitor,math,dateutils,
  UniSQLMonitor,unTwoFactorAuth;

const
 // Versiyon = 'V2_240314';
 // versiyon = 'V2.1.4';
  build ='2';

type
  tLDAPType = (ltBos, ltActifDirectory, ltOpenLdap,ltKeyloak,ltmarmara);
  TSSOType  = (stBos, stUbys, stSSO, stCasSSO, stIDMAPP);
  TloginType = (ltyBos, ltyActifDirectory, ltyOpenLdap,ltyKeyloak,ltymarmara, ltyUbys, ltySSO, ltyCasSSO, ltyIDMAPP);


  TMainMod = class(TUniGUIMainModule)
    PgProvider: TPostgreSQLUniProvider;
    DBMain: TUniConnection;
    BtnImgList: TUniNativeImageList;
    qTmp: TUniQuery;
    qGCDef: TUniQuery;
    qMCDef: TUniQuery;
    qUsers: TUniQuery;
    qRoles: TUniQuery;
    qLog: TUniQuery;
    qDept: TUniQuery;
    qUser: TUniQuery;
    qRole: TUniQuery;
    qParam: TUniQuery;
    qKVKKDef: TUniQuery;
    qVeriTipi: TUniQuery;
    qDokuman: TUniQuery;
    qEkipman: TUniQuery;
    qEnvanter: TUniQuery;
    qCheckList: TUniQuery;
    qCFrom: TUniQuery;
    qCTo: TUniQuery;
    qVSBasvuru: TUniQuery;
    qAydinlatma: TUniQuery;
    HTTPReq: TIdHTTP;
    qVSBasvuruid: TIntegerField;
    qVSBasvurumc_id: TIntegerField;
    qVSBasvuruidy: TIntegerField;
    qVSBasvuruidt: TDateTimeField;
    qVSBasvurusdy: TIntegerField;
    qVSBasvurusdt: TDateTimeField;
    qVSBasvurukg_id: TIntegerField;
    qVSBasvurubasvuru_tarihi: TDateField;
    qVSBasvurucevap_tarihi: TDateField;
    qVSBasvuruson_tarih: TDateField;
    qVSBasvurukalan_sure: TIntegerField;
    qVSBasvurubasvuru_dept_id: TIntegerField;
    qSeq: TUniQuery;
    qMCParam: TUniQuery;
    qVSBasvurudurum: TStringField;
    qVSBasvuruadi: TStringField;
    qVSBasvurusoyadi: TStringField;
    qVSBasvurukimlik_no: TStringField;
    qVSBasvurutel1: TStringField;
    qVSBasvurutel2: TStringField;
    qVSBasvuruadres1: TStringField;
    qVSBasvuruadres2: TStringField;
    qVSBasvuruilce: TStringField;
    qVSBasvurusehir: TStringField;
    qVSBasvuruemail: TStringField;
    qVSBasvurukep: TStringField;
    qVSBasvurukisi: TStringField;
    qVSBasvurubasvuru_sekli: TStringField;
    qVSBasvurubasvuru_evrakno: TStringField;
    qVSBasvurubasvuru_aciklama: TStringField;
    qVSBasvurucevap_sekli: TStringField;
    qVSBasvurucevap_aciklama: TStringField;
    qVSBasvurucevap_evrakno: TStringField;
    qVSBasvurukg_detay: TStringField;
    qVSBasvurubasvuru_konu: TStringField;
    qVSBasvurucevap_sekli_talep: TStringField;
    qVSBasvurutitle: TStringField;
    PrjImgList: TUniNativeImageList;
    sqlMonitor: TUniSQLMonitor;
    qsysparam: TUniQuery;
    qsysPortalsetting: TUniQuery;
    procedure UniGUIMainModuleCreate(Sender: TObject);
    procedure qVSBasvuruCalcFields(DataSet: TDataSet);
    procedure UniGUIMainModuleSessionTimeout(ASession: TObject;
      var ExtendTimeOut: Integer);
    procedure sqlMonitorSQL(Sender: TObject; Text: string;
      Flag: TDATraceFlag);
    procedure MonitorSQL(Sender: TObject; Text: string; Flag: TDATraceFlag);
    procedure UniGUIMainModuleBrowserClose(Sender: TObject);
  private
    procedure CreateSysAdmin;
    procedure afterdatabaseOpenEvents;
    function IndexCheck(tableName,IndexName :string): integer;
    function VarToBoolDef(const AValue: Variant;
      const ADefault: Boolean): Boolean;
    procedure ParseUserPassword(const UserPassword: string; out UserName,
      Password: string);
  public
    LoginInfo    : TLoginInfo;
    GCID         ,
    MCID         ,
    MCType       : Integer;
    GCCode       ,
    MCCode       ,
    GCTitle      ,
    MCTitle      : String;
    ServerIP     : String;
    ServerPort   : Integer;
    ServerUser   : String;
    ServerPwd    : String;
    PermDB       : String;
    IpLength     : Integer;
    IYSVar       : Boolean;
    UBYSActive   : Boolean;
    SSOType      : TSSOType;
    AydinlatmaLink,
    OzelOnayLink  ,
    AcikRizaLink  ,
    VSBFormLink   ,
    KVKNetLink    ,
    KVKKPortalLink,
    genelLink     ,
    ShortUrlLink  : String;
    apiAdres     : String;
    apiToken     : String;
    apiTokenBitis: TDateTime;
    zd_usr,
    zd_pwd       : String;
    UBYSJwt      ,
    UbysUrl      ,
    UbysUName    ,
    UbysPassword : string;
    ParolaSuresi : integer;
    ipAdress : string;
    LoginType : TloginType;
    //twoFactor
    FLoginUser: integer;
    FTwoFACode: string;
    FTwoFAExpire: TDateTime;
    FTwoFaSecret : string;
    fTwoFAMetod : TTwoFAMethod;
    FCurrent2FAHandler: ITwoFAMethodHandler;
    FHandler: ITwoFAMethodHandler;
    FCode : string;
    property TwoFASecret: string read FTwoFASecret write FTwoFASecret;
    property Code: string read FCode write FCode;
    property TwoFaMetod: TTwoFAMethod read fTwoFAMetod write fTwoFAMetod;
    property Handler: ITwoFAMethodHandler read FHandler write FHandler;
    property LoginUser: integer read FLoginUser write FLoginUser;
    property TwoFACode: string read FTwoFACode write FTwoFACode;
    property TwoFAExpire: TDateTime read FTwoFAExpire write FTwoFAExpire;
    property Current2FAHandler: ITwoFAMethodHandler read FCurrent2FAHandler write FCurrent2FAHandler;

    function CheckUsedId(ATableName, AField, AValue: String): Boolean;
    function CheckUsedIds(ATableName, AField, AValue: String): Boolean;
    function MakeIDList(AData: TDataSet): String;
    /// <summary>Doğan akçay seçili kayıtları döndür    /// </summary>
    function MakeSelectIDList(AData: TDataSet;AsecimFieldName, AFieldName: string): String;
    function _Upper(AStr: String): String;
    function NewGuid: String;
    function ShortURL(var AURL: String): Boolean;
    function KullaniciGetir(AID: String): String;
    function CreateOTC(ALength: Integer = 5; ALetter: Boolean = False): String;
    function CreatePassword: String;
    function ValidatePwd(APwd: String; var AMsg: String): Boolean;
    function CheckLogin(ACode, AName, APwd: String ; Aldaptype : tLDAPType = ltBos ; AldapActive : boolean= false  ): Integer;
    function CheckLoginLDAP(ACode, AName, APwd: String): Integer;
    /// <summary>Doğan akçay openLdap ile giriş için yazıldı   /// </summary>
    function OpenLdapDogrulama(AuserName,Apwd:string):integer;
    /// <summary> doğan akçay Ldap Keyloak apisi ile erişim      ///
    function keyloakDogrulama(AuserName,Apwd:string):integer;
    function CheckLicence: Boolean;
    function CheckPacket(AID: Integer): Boolean;
    function GetSeq(SeqName: String): Integer;
    function GetSysParam(AData: TUniQuery; Parametre: String): String;
    function GetParameter(AData: TUniQuery; Modul, AltModul, Parametre: String): TParameter;
    function GetParameter2(AData: TUniQuery; AGID, ACID: Integer; Parametre: String): String;
    function DataSetToXls(DbGrid: TUniDBGrid; Title: String): string;
    function DownloadDataSetToXls(DbGrid: TUniDBGrid; Title, FileName: String): string;
    procedure ReadSettings;
    procedure ReadUbys;
    procedure SaveLoginLog(ACode, CmpActive, UsrActive, IsSuccess: String);
    procedure OpenTables;
    procedure SaveSMSLog(MCID, ARID, ResultID: Integer; AType, AIP, AResult: String);
    procedure CreateQRCode(aText: String; aImg:TuniImage);

    Function  CheckAndCreateUserSession(AUserID: Integer; AIPAddress: string) :boolean;
    procedure DeleteUserSession(AUserID: Integer);
    procedure HeartBeat;
    procedure NoActiveSessionDel;
    function IsUserAuthorized(const AuserId: integer): Boolean;
    procedure PortalAfisSetting;
  end;

const
  KVKFileSize = 2097152;
  logoFileSize = 51200;
  AdminCount = 3;
  AdminArr : Array [1..AdminCount, 1..2] of String = (('SysMan', 'erolmuh'),
                                                      ('BeyazMasa', '4 element'),
                                                      ('Pikachu', 'EjderYa')
                                                     );

function MainMod: TMainMod;

implementation

{$R *.dfm}

uses UniGUIVars, ServerModule, uniGUIForm, System.RegularExpressions,
  DelphiZXIngQRCode,unRptVerbisListelerDegisiklikler,LDAPUtils, UmarmaraLdap;

function MainMod: TMainMod;
begin
  Result := TMainMod(UniApplication.UniMainModule)
end;

function TMainMod.CheckLicence: Boolean;
var
  SonGun : String;
begin
  SonGun := MainMod.GetParameter2(MainMod.qTmp, MainMod.GCID, MCID, 'DATE FORMAT'); // Lisans Bitiş Tarihi
  Result := StrToDate(SonGun) >= Date;
end;

function TMainMod.CheckLogin(ACode, AName, APwd: String ; Aldaptype : tLDAPType = ltBos ; AldapActive : boolean= false  ): Integer;
var
  i     : Integer;
  sTmp  : String;
  errorcode :integer;

  ldap_aktif: Boolean;
  LDAP_Res: Boolean;
  ldap_host: String;
  OpenLdapUserDn: string ;
  OpenLdapBaseDn: string;
  Tokensername : string;
  TokenPass: string;
  TokenHost : string;
  Tokenuserandpass : string;
  mesaj : string ;
  Obj:IADs;
  KvkClient: TKvkNetClient;

begin

  LoginInfo.UserName := AName;
  LoginInfo.Password := APwd;

  QueryPrep(qMCDef,'SELECT * FROM sys_mcdef WHERE code = :p_code');
  qMCDef.ParamByName('p_code').AsString := ACode;
  qMCDef.Open;
  if qMCDef.FieldByName('id').AsInteger < 1 then
  begin
    QueryPrep(qGCDef,'SELECT * FROM sys_gcdef WHERE code = :p_code');
    qGCDef.ParamByName('p_code').AsString := ACode;
    qGCDef.Open;
    if qGCDef.FieldByName('id').AsInteger < 1 then
    begin
      SaveLoginLog(ACode, 'H', '?', 'H');
      Result := -1;
      Exit;
    end;
    if qGCDef.FieldByName('active').AsString <> 'E' then
    begin
      SaveLoginLog(ACode, 'H', '?', 'H');
      Result := -2;
      Exit;
    end;

    QueryOpen(qMCDef, 'SELECT * FROM sys_mcdef WHERE gc_id = ' + qGCDef.FieldByName('id').AsString);
    GCID    := qGCDef.FieldByName('id').AsInteger;
    GCCode  := qGCDef.FieldByName('code').AsString;
    GCTitle := qGCDef.FieldByName('title').AsString;
    MCID    := 0;
    MCCode  := '';
    MCTitle := '';
  end
  else
  begin
    if qMCDef.FieldByName('active').AsString <> 'E' then
    begin
      SaveLoginLog(ACode, 'H', '?', 'H');
      Result := -3;
      Exit;
    end;

    QueryOpen(qGCDef, 'SELECT * FROM sys_gcdef WHERE id = ' + qMCDef.FieldByName('gc_id').AsString);
    GCID    := qGCDef.FieldByName('id').AsInteger;
    GCCode  := qGCDef.FieldByName('code').AsString;
    GCTitle := qGCDef.FieldByName('title').AsString;
    MCID    := qMCDef.FieldByName('id').AsInteger;
    MCCode  := qMCDef.FieldByName('code').AsString;
    MCTitle := qMCDef.FieldByName('title').AsString;
  end;

  QueryPrep(qUsers, 'SELECT * FROM usr_user WHERE gc_id = ' + IntToStr(GCID) +
                    ' AND mc_id = ' + IntToStr(MCID) +
                    ifthen( AldapActive ,' AND ldap_user_name = :p_name' , ' AND user_name =:p_name')); //ldap kontrolü var
  qUsers.ParamByName('p_name').AsString := AName;
  qUsers.Open;
  if qUsers.FieldByName('id').AsInteger < 1 then
  begin
    SaveLoginLog(ACode, 'E', 'H', 'H');
    Result := -4;
    Exit;
  end;
  if qUsers.FieldByName('active').AsString <> 'E' then
  begin
    SaveLoginLog(ACode, 'E', 'H', 'H');
    Result := -5;
    Exit;
  end;
  // Doğan akçay Ldapopen Entegrasyonu için değiştirildi
  if AldapActive then
  begin
   if Aldaptype = ltActifDirectory then
   begin
   //LDAP aktif mi?
    LoginType := ltyActifDirectory ;
    ldap_aktif := MainMod.GetSysParam(qTmp, 'LDAP AKTİF') = 'E';
    ldap_host  := MainMod.GetSysParam(qTmp, 'LDAP HOST');
    if (not ldap_aktif) or (ldap_host = '') then
    begin
      SaveLoginLog('', 'E', 'H', 'H');
      Result := -7;
      Exit;
    end;

    try
      LDAP_Res := ActiveDirectoryClient.AuthenticateUser(ldap_host, AName, APwd);
    except on e:Exception do
      begin
        SaveLoginLog('', 'E', 'E', 'H');
        Result := -6;
        Exit;
      end;
    end;

    if not LDAP_Res then
    begin
      SaveLoginLog('', 'E', 'E', 'H');
      Result := -6;
      Exit;
    end
    else
    begin
  //    MsgBox('Logged onto' + #10 + 'Name:' + Obj.Name + #10 + 'Path:' + Obj.ADsPath);
    end;

   end
   else  if Aldaptype = LtOpenLdap then
   begin
    LoginType := ltyOpenLdap ;
    ldap_aktif := MainMod.GetSysParam(qTmp, 'LDAP AKTİF') = 'L';
    ldap_host  := MainMod.GetSysParam(qTmp, 'LDAP HOST');
    OpenLdapUserDn := qTmp.FieldByName('val2').AsString ;
    OpenLdapBaseDn := qTmp.FieldByName('val3').AsString ;
    if (not ldap_aktif) or (ldap_host = '') or (OpenLdapUserDn = '') or (OpenLdapBaseDn = '') then
    begin
      SaveLoginLog('', 'E', 'H', 'H');
      Result := -7;
      Exit;
    end;

    errorcode := OpenLdapDogrulama(AName,APwd);
    if errorcode<0 then
    begin
     SaveLoginLog(ACode, 'E', 'E', 'H');
      Result := errorcode;
      Exit;
    end;
  end
  else  if Aldaptype = ltmarmara then
  begin
    LoginType := ltymarmara ;
    ldap_aktif := MainMod.GetSysParam(qTmp, 'LDAP AKTİF') = 'MARMARA';
    TokenHost := MainMod.GetSysParam(qTmp, 'LDAP HOST');
    ldap_host  := qTmp.FieldByName('val2').AsString;
    Tokenuserandpass := qTmp.FieldByName('val3').AsString;
    ParseUserPassword(Tokenuserandpass,Tokensername,TokenPass) ;
    if (not ldap_aktif) or (ldap_host = '') or (Tokensername = '') or (TokenPass = '') then
    begin
      SaveLoginLog('', 'E', 'H', 'H');
      Result := -10;
      Exit;
    end;
       KvkClient:= TKvkNetClient.Create(Tokensername,TokenPass,TokenHost,ldap_host);
     try
          if KvkClient.Authenticate then
          begin
            if KvkClient.VerifyUser(AName, APwd,  Mesaj) then
            begin
              result := 1 ;
            end
            else
            begin
                SaveLoginLog('', 'E', 'H', 'H');
                if trim(mesaj) ='İstek boş olamaz!' then result := -101
                else if trim(mesaj) ='Kullanıcı adı boş geçilemez!' then result := -102
                else if trim(mesaj) ='Şifre boş geçilemez!' then result := -103
                else if trim(mesaj) ='Kullanıcı adı veya şifre hatalı!' then result := -104
                else if trim(mesaj) ='Şifre kullanım süresi dolmuştur. Lütfen BYS'' den şifre değişikliği yapıp tekrar deneyiniz!' then result := 105
                else
                Result := -7;
                Exit;
            end;
          end
          else
          begin
           SaveLoginLog('', 'E', 'H', 'H');
           Result := -11;
           Exit;
          end;
     finally
       if Assigned(KvkClient) then
        KvkClient.Free;
     end;
  end
  else if Aldaptype=ltKeyloak then
  begin
    LoginType := ltyKeyloak ;
    errorcode := keyloakDogrulama(AName,APwd);
    if errorcode<0 then
     begin
       SaveLoginLog(ACode,'E' , 'E' , 'H' );
       RESULT := errorcode;
       exit;
     end;
  end;
 end
 else
 begin
    LoginType := ltyBos ;
    sTmp := DecryptStr(qUsers.FieldByName('user_pwd').AsString);
    if sTmp <> APwd then
    begin
      SaveLoginLog(ACode, 'E', 'E', 'H');
      Result := -6;
      Exit;
    end;
 end;

  MCType               := 1;
  LoginInfo.ID         := qUsers.FieldByName('id').AsInteger;
  LoginInfo.GCID       := GCID;
  LoginInfo.MCID       := MCID;
  LoginInfo.FullName   := qUsers.FieldByName('full_name').AsString;
  LoginInfo.Rol        := qUsers.FieldByName('rol').AsString;
  LoginInfo.Firmalar   := qUsers.FieldByName('list_mc').AsString;
  LoginInfo.Birimler   := qUsers.FieldByName('list_dept').AsString;
  LoginInfo.EMail      := qUsers.FieldByName('email').AsString;

  if not qUsers.FieldByName('password_changed_at').IsNull then
    LoginInfo.Password_change_tar := DateOf(qUsers.FieldByName('password_changed_at').AsDateTime)
  else
    LoginInfo.Password_change_tar := DateOf(qUsers.FieldByName('idt').AsDateTime) ;



  QueryOpen(qRoles, 'SELECT * FROM usr_role WHERE rol = ''' + LoginInfo.Rol + ''' AND gc_id = ' + IntToStr(GCID) +
                   ' AND mc_id = ' + IntToStr(MCID));
  sTmp := Data2Perm(qRoles);
  for i := 1 to 9999 do LoginInfo.Yetkiler[i] := sTmp[i] = '1';
  // for i := 1 to 9999 do LoginInfo.Yetkiler[i] := True;

  if mcid>0 then
  begin
    QueryPrep(qMCParam,'SELECT * FROM sys_param_mc WHERE mc_id = :mc_id');
    qMCParam.ParamByName('mc_id').AsInteger := MCID;
    qMCParam.Open;
    IYSVar := (qMCParam.FieldByName('iys_aktif').AsString = 'E');
    zd_usr := qMCParam.FieldByName('zd_username').AsString;
    zd_pwd := qMCParam.FieldByName('zd_password').AsString;
    if zd_pwd <> '' then
      zd_pwd := DecryptStr(zd_pwd);
  end
  else
    IYSVar := false;


  SaveLoginLog(ACode, 'E', 'E', 'E');

  Result := qUsers.FieldByName('id').AsInteger;

  QueryExec(qTmp, 'SET KVKNET.USER_ID=' + qUsers.FieldByName('id').AsString);
  QueryExec(qTmp, 'SET KVKNET.USER_IP=''' + UniGuiApplication.UniApplication.RemoteAddress+'''');
end;


function TMainMod.keyloakDogrulama(AuserName,Apwd:string):integer;
var
  HttpClient: THttpClient;
  Response: IHTTPResponse;
  Params: TStringList;
  JsonResponse: TJSONObject;
  url : string;
  client_id : string;
  secret : string;
begin
  Result := 0;
  QueryOpen(qtmp,' SELECT * FROM sys_parameter where param_val in (''LDAP AKTİF'',''LDAP HOST'') '  );
  if qTmp.IsEmpty then
    result := -10;

  qTmp.First;
  while not qTmp.Eof do
  begin
    if qTmp.FieldByName('param_val').AsString='LDAP HOST' then
    begin
      url := qTmp.FieldByName('val1').AsString;
      client_id := qTmp.FieldByName('val2').AsString;
      secret := qTmp.FieldByName('val3').AsString;
    end;
    qTmp.Next;
  end;
  if (url = '') or (client_id = '') or (secret = '') then
    result := -10;



  //URL := 'https://keycloak.enerji.gov.tr/realms/etkb-merkez/protocol/openid-connect/token';


  HttpClient := THttpClient.Create;
  HTTPClient.ConnectionTimeout := 15000;
  HTTPClient.ResponseTimeout := 30000;
  Params := TStringList.Create;
  try
    Params.Clear;
//    Params.Add('client_id=kvknet');
//    Params.Add('client_secret=XqaAfSzilr0agSFFWHZ7ZDciYOJwnPKA');
    Params.Add('client_id='+client_id);
    Params.Add('client_secret='+secret);
    Params.Add('grant_type=password');
    Params.Add('username=' + AuserName);
    Params.Add('password=' + Apwd);

    Response := HttpClient.Post(url, Params);

    if Response.StatusCode = 200 then
    begin
      JsonResponse := TJSONObject.ParseJSONValue(Response.ContentAsString) as TJSONObject;
      try
        if Assigned(JsonResponse) then
        begin
//          Result := JsonResponse.GetValue('access_token').Value;
          result := 0;
        end;
      finally
        JsonResponse.Free;
      end;
    end
    else
    begin
      ServerMod.Logger.AddLog('Hata: ' + Response.StatusCode.ToString + ' - ' + Response.ContentAsString);
      result := -8 ;
    end;
  except
    on E: Exception do
    begin
      ServerMod.Logger.AddLog('Ldap İstek gönderilirken hata oluştu: ' + E.Message);
      result := -8 ;
    end;

  end;
  Params.Free;
  HttpClient.Free;

end;

function TMainMod.OpenLdapDogrulama(AuserName,Apwd:string):integer;
var
  ldapManager : TLDAPManager;
  ldapHostPort : string;
  lDapUserNamepsw: string;
  ldapBasedn : string;
begin
    result := 0;
    try
      ldapHostPort := GetSysParam(MainMod.qTmp, 'LDAP HOST');
      lDapUserNamepsw := mainmod.qTmp.FieldByName('val2').AsString;
      ldapBasedn := qTmp.FieldByName('val3').AsString;
      ldapManager := TLDAPManager.create;
      try
        ldapManager.Configure(ldapHostPort,lDapUserNamepsw,ldapBasedn);
        if not ldapManager.connect then
        begin
          Result := -7;
          Exit;
        end;
        if not ldapManager.Authenticate(AuserName,APwd) then
        begin
          Result := -8;
          Exit;
        end;
      finally
        if assigned(ldapManager) then
          ldapManager.Free;
      end;
    except
      result := -7;
    end;
end;

procedure TMainMod.ParseUserPassword(const UserPassword: string; out UserName,
  Password: string);
var
  SeperatorCount: Integer;
begin
  SeperatorCount := Pos('&&', UserPassword);
  if SeperatorCount > 0 then
  begin
    UserName := Copy(UserPassword, 1, SeperatorCount - 1);
    Password := Copy(UserPassword, SeperatorCount + 2, Length(UserPassword) - SeperatorCount - 1);
  end
  else
  begin
    UserName := UserPassword;
    Password := ''; // Şifre sağlanmamışsa boş bırak
  end;

end;

function TMainMod.CheckLoginLDAP(ACode, AName, APwd: String): Integer;
var
  i     : Integer;
  sTmp  : String;
  ldap_aktif: Boolean;
  LDAP_Res: Boolean;
  ldap_host: String;
  Obj:IADs;
begin
  LoginInfo.UserName := AName;
  LoginInfo.Password := APwd;

  QueryPrep(qMCDef,'SELECT * FROM sys_mcdef WHERE code = :p_code');
  qMCDef.ParamByName('p_code').AsString := ACode;
  qMCDef.Open;
  if qMCDef.FieldByName('id').AsInteger < 1 then
  begin
    QueryPrep(qGCDef,'SELECT * FROM sys_gcdef WHERE code = :p_code');
    qGCDef.ParamByName('p_code').AsString := ACode;
    qGCDef.Open;
    if qGCDef.FieldByName('id').AsInteger < 1 then
    begin
      SaveLoginLog(ACode, 'H', '?', 'H');
      Result := -1;
      Exit;
    end;
    if qGCDef.FieldByName('active').AsString <> 'E' then
    begin
      SaveLoginLog(ACode, 'H', '?', 'H');
      Result := -2;
      Exit;
    end;

    QueryOpen(qMCDef, 'SELECT * FROM sys_mcdef WHERE gc_id = ' + qGCDef.FieldByName('id').AsString);
    GCID    := qGCDef.FieldByName('id').AsInteger;
    GCCode  := qGCDef.FieldByName('code').AsString;
    GCTitle := qGCDef.FieldByName('title').AsString;
    MCID    := 0;
    MCCode  := '';
    MCTitle := '';
  end
  else
  begin
    if qMCDef.FieldByName('active').AsString <> 'E' then
    begin
      SaveLoginLog(ACode, 'H', '?', 'H');
      Result := -3;
      Exit;
    end;

    QueryOpen(qGCDef, 'SELECT * FROM sys_gcdef WHERE id = ' + qMCDef.FieldByName('gc_id').AsString);
    GCID    := qGCDef.FieldByName('id').AsInteger;
    GCCode  := qGCDef.FieldByName('code').AsString;
    GCTitle := qGCDef.FieldByName('title').AsString;
    MCID    := qMCDef.FieldByName('id').AsInteger;
    MCCode  := qMCDef.FieldByName('code').AsString;
    MCTitle := qMCDef.FieldByName('title').AsString;
  end;

  QueryPrep(qUsers, 'SELECT * FROM usr_user WHERE gc_id = ' + IntToStr(GCID) + ' AND mc_id = ' + IntToStr(MCID) + ' AND ldap_user_name = :p_name');
  qUsers.ParamByName('p_name').AsString := AName;
  qUsers.Open;
  if qUsers.FieldByName('id').AsInteger < 1 then
  begin
    SaveLoginLog(ACode, 'E', 'H', 'H');
    Result := -4;
    Exit;
  end;
  if qUsers.FieldByName('active').AsString <> 'E' then
  begin
    SaveLoginLog(ACode, 'E', 'H', 'H');
    Result := -5;
    Exit;
  end;

  //LDAP aktif mi?
  ldap_aktif := MainMod.GetSysParam(qTmp, 'LDAP AKTİF') = 'E';
  ldap_host  := MainMod.GetSysParam(qTmp, 'LDAP HOST');
  if (not ldap_aktif) or (ldap_host = '') then
  begin
    SaveLoginLog('', 'E', 'H', 'H');
    Result := -7;
    Exit;
  end;

//  try
//    CoInitialize(nil);
//    Result:=ADsOpenObject('WinNT://'+ldap_host,AName,APwd,ADS_SECURE_AUTHENTICATION,IADs,Obj);
//  finally
//    CoUninitialize;
//  end;
//
//  If not Succeeded(Result) Then
//  begin
//    SaveLoginLog(ACode, 'E', 'E', 'H');
//    Result := -6;
//    Exit;
//  end
//  else Begin
////    MsgBox('Logged onto' + #10 + 'Name:' + Obj.Name + #10 + 'Path:' + Obj.ADsPath);
//  End;
  try
    LDAP_Res := ActiveDirectoryClient.AuthenticateUser(ldap_host, AName, APwd);
  except
    on e:Exception do
    begin
      SaveLoginLog('', 'E', 'E', 'H');
      Result := -6;
      Exit;
    end;
  end;

  if not LDAP_Res then
  begin
    SaveLoginLog('', 'E', 'E', 'H');
    Result := -6;
    Exit;
  end
  else
  begin
//    MsgBox('Logged onto' + #10 + 'Name:' + Obj.Name + #10 + 'Path:' + Obj.ADsPath);
  end;

  MCType               := 1;
  LoginInfo.ID         := qUsers.FieldByName('id').AsInteger;
  LoginInfo.GCID       := GCID;
  LoginInfo.MCID       := MCID;
  LoginInfo.FullName   := qUsers.FieldByName('full_name').AsString;
  LoginInfo.Rol        := qUsers.FieldByName('rol').AsString;
  LoginInfo.Firmalar   := qUsers.FieldByName('list_mc').AsString;
  LoginInfo.Birimler   := qUsers.FieldByName('list_dept').AsString;
  LoginInfo.EMail       := qUsers.FieldByName('email').AsString;
  if not qUsers.FieldByName('password_changed_at').IsNull then
    LoginInfo.Password_change_tar := DateOf(qUsers.FieldByName('password_changed_at').AsDateTime)
  else
    LoginInfo.Password_change_tar := DateOf(qUsers.FieldByName('idt').AsDateTime) ;

  QueryOpen(qRoles, 'SELECT * FROM usr_role WHERE rol = ''' + LoginInfo.Rol + ''' AND gc_id = ' + IntToStr(GCID) +
                   ' AND mc_id = ' + IntToStr(MCID));
  sTmp := Data2Perm(qRoles);
  for i := 1 to 9999 do LoginInfo.Yetkiler[i] := sTmp[i] = '1';
  // for i := 1 to 9999 do LoginInfo.Yetkiler[i] := True;

  if mcid>0 then
  begin
    QueryPrep(qMCParam,'SELECT * FROM sys_param_mc WHERE mc_id = :mc_id');
    qMCParam.ParamByName('mc_id').AsInteger := MCID;
    qMCParam.Open;
    IYSVar := (qMCParam.FieldByName('iys_aktif').AsString = 'E');
    zd_usr := qMCParam.FieldByName('zd_username').AsString;
    zd_pwd := qMCParam.FieldByName('zd_password').AsString;
    if zd_pwd <> '' then
      zd_pwd := DecryptStr(zd_pwd);
  end
  else
    IYSVar := false;


  SaveLoginLog(ACode, 'E', 'E', 'E');

  Result := qUsers.FieldByName('id').AsInteger;

  QueryExec(qTmp, 'SET KVKNET.USER_ID=' + qUsers.FieldByName('id').AsString);
  QueryExec(qTmp, 'SET KVKNET.USER_IP=''' + UniGuiApplication.UniApplication.RemoteAddress+'''');
end;

function TMainMod.CheckPacket(AID: Integer): Boolean;
var
  sPaket : String;
begin
  sPaket := MainMod.GetParameter2(MainMod.qTmp, MainMod.GCID, MCID, 'VERSION'); // Paket
  Result := StrToIntDef(sPaket, 0) >= AID;
end;

procedure TMainMod.CreateQRCode(aText: String; aImg:TuniImage);
var
  QRCodeBitmap: TBitmap;
  QRCode: TDelphiZXingQRCode;
  Row, Column: Integer;
//  PNG: TPNGImage;
//  aPngFile: String;
  fUrl    : String;
procedure ResizeBitmap(Bitmap: TBitmap; NewWidth, NewHeight: integer);
  var
    buffer: TBitmap;
  begin
    buffer := TBitmap.Create;
    if NewWidth < aImg.Width then
      newWidth := aImg.Width;
    if NewHeight < aImg.Height then
      NewHeight := aImg.Height;
    try
      buffer.SetSize(NewWidth, NewHeight);
      buffer.Canvas.StretchDraw(Rect(0, 0, NewWidth, NewHeight), Bitmap);
      Bitmap.SetSize(NewWidth, NewHeight);
      Bitmap.Canvas.Draw(0, 0, buffer);
    finally
      buffer.Free;
    end;
  end;
begin
//  aPngFile := ServerMod.NewCacheFileUrl(False, 'png', '', '', FUrl, True);
  QRCodeBitmap := nil;
  QRCode := nil;
//  PNG := nil;
  try
    QRCodeBitmap := TBitmap.Create;
    QRCode := TDelphiZXingQRCode.Create;
    QRCode.Data := aText;
    QRCodeBitmap.SetSize(QRCode.Rows, QRCode.Columns);
    for Row := 0 to QRCode.Rows - 1 do
    begin
      for Column := 0 to QRCode.Columns - 1 do
      begin
        if (QRCode.IsBlack[Row, Column]) then
        begin
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clBlack;
        end else
        begin
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clWhite;
        end;
      end;
    end;
    ResizeBitmap(QRCodeBitmap, QRCode.Rows*4, QRCode.Columns*4);
    aImg.Picture.Assign(QRCodeBitmap);
//    PNG := TPNGImage.Create;
//    PNG.Assign(QRCodeBitmap);
//    PNG.SaveToFile(aPngFile);
//    result := aPngFile;
  finally
    QRCodeBitmap.Free;
    QRCode.Free;
//    PNG.Free;
  end;
end;

procedure TMainMod.CreateSysAdmin;
var
  i   : Integer;
  Tmp : String;
  SQLStr : String;
begin
  Tmp := '';
  for i := 1 to 1000 do Tmp := Tmp + '1';
  SQLStr := 'UPDATE usr_role SET perms_01 = ''' + EncryptStr(Tmp) + ''', ' +
            'perms_02 = ''' + EncryptStr(Tmp) + ''', ' +
            'perms_03 = ''' + EncryptStr(Tmp) + ''', ' +
            'perms_04 = ''' + EncryptStr(Tmp) + ''', ' +
            'perms_05 = ''' + EncryptStr(Tmp) + ''', ' +
            'perms_06 = ''' + EncryptStr(Tmp) + ''', ' +
            'perms_07 = ''' + EncryptStr(Tmp) + ''', ' +
            'perms_08 = ''' + EncryptStr(Tmp) + ''', ' +
            'perms_09 = ''' + EncryptStr(Tmp) + ''', ' +
            'perms_10 = ''' + EncryptStr(Tmp) + ''' WHERE rol = ''SİSTEM YÖNETİCİSİ''';
  QueryExec(qTmp, SQLStr);
end;

function TMainMod.DataSetToXls(DbGrid: TUniDBGrid; Title: String): string;
var
  XLS       : TXlsFile;
  Row       : Integer;
  Fmt       : TFlxFormat;
  Alignment : THFlxAlignment;
  ColExcel, ColDbgrid    : Integer;
  DateXF                 ,
  DateTimeXF             ,
  FontSizeTitleXF        ,
  FontSizeDataXF         ,
  FontSizePageTitleXF    : Integer;
  File_Name : String;
  DS        : TDataSet;
  FName     : String;
  TmpName   : String;
  FUrl      : String;
  GrupHdr   : String;
  Grup1,      Grup2      : Boolean; // Grup2 üst groupheader
  Grup1str  , Grup2str   : String;  // Group header
  Grup1str_o, Grup2str_o : String;  // önceki grup header, birleştirme kararı için
  Grup1i_o  , Grup2i_o   : Integer; // önceki grup header indexi, birleştirme için
begin
  DS         := DbGrid.DataSource.DataSet;
  Grup1      := false;
  Grup2      := false;
  Grup1str   := '';
  Grup2str   := '';
  Grup1str_o := '';
  Grup2str_o := '';
  Grup1i_o   := 1;
  Grup2i_o   := 1;

  XLS := TXlsfile.Create(1, TExcelFileFormat.v2007, true);
  try
    Fmt := XLS.GetDefaultFormat;
    Fmt.Font.Size20     := 280;
    Fmt.Font.Style      := [TFlxFontStyles.Bold];
    Fmt.HAlignment      := THFlxAlignment.center;
    FontSizeTitleXF     := XLS.AddFormat(Fmt);
    Fmt := XLS.GetDefaultFormat;
    Fmt.Font.Size20     := 360;
    Fmt.Font.Style      := [TFlxFontStyles.Bold];
    Fmt.HAlignment      := THFlxAlignment.center;
    FontSizePageTitleXF := XLS.AddFormat(Fmt);

    XLS.SheetName       := Title;

    XLS.MergeCells(1, 1, 1, DbGrid.Columns.Count);
    XLS.SetCellValue(1, 1, Title, FontSizePageTitleXF);

    Row := 2;

    //groupheader var mı
    ColExcel := 0;
    for ColDbgrid := 0 to DbGrid.Columns.Count - 1 do
    begin
      if DbGrid.Columns.Items[ColDbgrid].Visible = False then Continue;

      if DbGrid.Columns.Items[ColDbgrid].GroupHeader <> '' then Grup1 := True;
      if Pos(';', DbGrid.Columns.Items[ColDbgrid].GroupHeader) > 0 then Grup2 := True;
    end;

    if Grup2 then
    begin
      for ColDbgrid := 0 to DbGrid.Columns.Count - 1 do
      begin
        if DbGrid.Columns.Items[ColDbgrid].Visible = False then Continue;

        GrupHdr  := DbGrid.Columns.Items[ColDbgrid].GroupHeader;
        Grup2str := ParseString(GrupHdr, ';');
        Grup1str := ParseString(GrupHdr, ';');

        ColExcel := ColExcel + 1;
        XLS.SetCellValue(2, ColExcel, Grup2str, FontSizeTitleXF);
        XLS.SetCellValue(3, ColExcel, Grup1str, FontSizeTitleXF);

        if Grup2str <> Grup2str_o then
        begin
          XLS.MergeCells(2, Grup2i_o, 2, ColExcel - 1); //grup başlığı değiştiyse, önceki grup indexinden bir önceki sütuna kadar birleştir
          Grup2str_o := Grup2str;
          Grup2i_o   := colExcel;

          XLS.MergeCells(3, Grup1i_o, 3, ColExcel - 1);
          Grup1str_o := Grup1str;
          Grup1i_o   := colExcel;
        end;

        if Grup1str <> Grup1str_o then
        begin
          XLS.MergeCells(3, Grup1i_o, 3, ColExcel - 1);
          Grup1str_o := Grup1str;
          Grup1i_o   := colExcel;
        end;
      end;
      Row := 4;
    end
    else if Grup1 then
    begin
      for ColDbgrid := 0 to DbGrid.Columns.Count - 1 do
      begin
        if DbGrid.Columns.Items[ColDbgrid].Visible = False then Continue;

        GrupHdr  := DbGrid.Columns.Items[ColDbgrid].GroupHeader;
        Grup1str := ParseString(GrupHdr, ';');

        ColExcel := ColExcel + 1;
        XLS.SetCellValue(2, ColExcel, Grup1str, FontSizeTitleXF);

        if Grup1str <> Grup1str_o then
        begin
          XLS.MergeCells(2, Grup1i_o + 1, 2, ColExcel);
          Grup1str_o := Grup1str;
          Grup1i_o   := colExcel;
        end;
      end;
      Row := 3;
    end;

    DS.First;
    // Row := 2;
    {Burda Excelin en başına satır no sütunu eklenmiş ama biz gridde olduğu gibi görmek isteyeceğimiz için kaldırdım
    XLS.SetCellValue(Row, 1, 'No', FontSizeTitleXF);
    XLS.SetColWidthInternal(ColExcel, 40);}

    ColExcel := 0;
    for ColDbgrid := 0 to DbGrid.Columns.Count - 1 do
    begin
      if DbGrid.Columns.Items[ColDbgrid].Visible = False then Continue;

      ColExcel := ColExcel + 1;
      XLS.SetCellValue(Row, ColExcel, DbGrid.Columns.Items[ColDbgrid].Title.Caption, FontSizeTitleXF);
      XLS.SetColWidthInternal(ColExcel, DbGrid.Columns.Items[ColDbgrid].Width * 35);
    end;

    Row := Row + 1;
    while not DS.Eof do
    begin
      ColExcel := 0;
      for ColDbgrid := 0 to DbGrid.Columns.Count - 1 do
      begin
        if DbGrid.Columns.Items[ColDbgrid].Visible = False then Continue;

        if DbGrid.Columns[ColDbgrid].Alignment = TAlignment.taLeftJustify then
           Alignment := THFlxAlignment.left
        else if DbGrid.Columns[ColDbgrid].Alignment = TAlignment.taCenter then
           Alignment := THFlxAlignment.center
        else if DbGrid.Columns[ColDbgrid].Alignment = TAlignment.taRightJustify then
           Alignment := THFlxAlignment.right
        else
           Alignment := THFlxAlignment.center;

        Fmt := XLS.GetDefaultFormat;
        Fmt.Format      := 'dd.mm.yyyy hh:MM:ss';
        Fmt.Font.Size20 := 240;
        Fmt.HAlignment  := Alignment;
        DateTimeXF      := XLS.AddFormat(Fmt);

        Fmt := XLS.GetDefaultFormat;
        Fmt.Format      := 'dd.mm.yyyy';
        Fmt.Font.Size20 := 240;
        Fmt.HAlignment  := Alignment;
        DateXF          := XLS.AddFormat(Fmt);

        Fmt := XLS.GetDefaultFormat;
        Fmt.Font.Size20 := 240;
        Fmt.HAlignment  := Alignment;
        FontSizeDataXF  := XLS.AddFormat(Fmt);

        { satır no
        if ColDbgrid = 0 then
        begin
          Fmt := XLS.GetDefaultFormat;
          Fmt.Font.Size20 := 240;
          Fmt.HAlignment := THFlxAlignment.center;

          XLS.SetCellValue(Row, 1, (Row - 2), XLS.AddFormat(Fmt));
        end;   }

        ColExcel := ColExcel + 1;
        if DS.FieldList.IndexOf(DbGrid.Columns.Items[ColDbgrid].FieldName) = -1 then
        begin
          XLS.SetCellValue(Row, ColExcel, '', FontSizeDataXF);
          Continue;
        end;

        case DS.FieldByName(DbGrid.Columns.Items[ColDbgrid].FieldName).DataType of
          TFieldType.ftDateTime:
            begin
              if DS.FieldByName(DbGrid.Columns.Items[ColDbgrid].FieldName).IsNull then
                XLS.SetCellValue(Row, ColExcel, '')
              else
                XLS.SetCellValue(Row, ColExcel, DS.FieldByName(DbGrid.Columns.Items[ColDbgrid].FieldName).AsDateTime, DateTimeXF);

              XLS.SetColWidthInternal(ColExcel, DbGrid.Columns.Items[ColDbgrid].Width * 50);
            end;

          TFieldType.ftDate:
            begin
              if DS.FieldByName(DbGrid.Columns.Items[ColDbgrid].FieldName).IsNull then
                XLS.SetCellValue(Row, ColExcel, '')
              else
                XLS.SetCellValue(Row, ColExcel, DS.FieldByName(DbGrid.Columns.Items[ColDbgrid].FieldName).AsDateTime, DateXF);

              XLS.SetColWidthInternal(ColExcel, DbGrid.Columns.Items[ColDbgrid].Width * 50);
            end;

          else
            begin
              XLS.SetCellValue(Row, ColExcel, DS.FieldByName(DbGrid.Columns.Items[ColDbgrid].FieldName).Value, FontSizeDataXF);
            end;
        end;

      end;

      DS.Next;

      Inc(Row);
    end;
    // XLS.SetCellValue(Row + 1, 1, XLS.RecalcExpression('=Sum(A3:A' + IntToStr(Row) + ')', False), FontSizePageTitleXF);

    XLS.AutofitCol(1, DbGrid.Columns.Count + 1, False, 1.2);

    FName     := Title;
    FUrl      := '';
    File_Name := ServerMod.NewCacheFileUrl(False, 'xls', FName, '', FUrl, True);

    XLS.Save(File_Name, TFileFormats.Xlsx);
    Result := File_Name;
  finally
    XLS.Free;
  end;
end;

function TMainMod.DownloadDataSetToXls(DbGrid: TUniDBGrid; Title, FileName: String): string;
var
  Tmp_Name: string;
begin
  Tmp_Name := DataSetToXls(DbGrid, Title);
  UniSession.SendFile(Tmp_Name, FileName);
  Result := Tmp_Name;
end;

function TMainMod.GetSeq(SeqName: String): Integer;
begin
  Result := GetSequence(qSeq, SeqName);
//  qTmp.Close;
//  qTmp.SQL.Clear;
//  qTmp.SQL.Add('SELECT NEXTVAL(''"' + SeqName + '"'')');
//  qTmp.Open;
//  Result := qTmp.Fields[0].AsInteger;
end;

function TMainMod.GetSysParam(AData: TUniQuery; Parametre: String): String;
begin
  QueryOpen(AData, 'SELECT * FROM sys_parameter WHERE module = ''YÖNETİM'' AND sub_module = ''PROGRAM'' AND param_val = ''' + Parametre + '''');
  Result := AData.FieldByName('val1').AsString;
end;


function TMainMod.GetParameter(AData: TUniQuery; Modul, AltModul, Parametre: String): TParameter;
var
  SQLStr : String;
begin
  SQLStr := 'SELECT * FROM sys_parameter_mc WHERE gc_id = ' + IntToStr(GCID) + ' AND mc_id = ' + IntToStr(MCID) +
            ' AND param_val = ''' + Parametre + '''';
  if Modul <> ''    then SQLStr := SQLStr + ' AND module = ''' + Modul + '''';
  if AltModul <> '' then SQLStr := SQLStr + ' AND sub_module = ''' + AltModul + '''';

  QueryOpen(AData, SQLStr);
  Result.Modul     := AData.FieldByName('module').AsString;
  Result.Alt_Modul := AData.FieldByName('sub_module').AsString;
  Result.Parametre := AData.FieldByName('param_val').AsString;
  Result.Aciklama  := AData.FieldByName('description').AsString;
  Result.Deger1    := AData.FieldByName('val1').AsString;
  Result.Deger2    := AData.FieldByName('val2').AsString;
  Result.Deger3    := AData.FieldByName('val3').AsString;
end;

function TMainMod.GetParameter2(AData: TUniQuery; AGID, ACID: Integer; Parametre: String): String;
begin
  QueryOpen(AData, 'SELECT * FROM sys_parameter_gc WHERE gc_id = ' + IntToStr(AGID) + ' AND mc_id = ' + IntToStr(ACID) +
                   ' AND module = ''SİSTEM'' AND sub_module = ''YÖNETİM'' AND param_val = ''' + Parametre + '''');
  Result := DecryptStr(AData.FieldByName('val1').AsString);
end;

function TMainMod.KullaniciGetir(AID: String): String;
begin
  Result := '';
  if (AID = '0') or (AID = '') then Exit;
  QueryOpen(qTmp, 'SELECT * FROM usr_user WHERE id = ' + AID);
  Result := qTmp.FieldByName('full_name').AsString;
end;

function TMainMod.MakeIDList(AData: TDataSet): String;
var
  sTmp : String;
begin
  sTmp := '';
  AData.DisableControls;
  AData.First;
  while not AData.EOF do
  begin
    Result := Result + AData.FieldByName('id').AsString + ',';
    AData.Next;
  end;
  AData.EnableControls;
  if Length(Result) > 1  then System.Delete(Result, Length(Result), 1) else Result := '0';
end;

function TMainMod.MakeSelectIDList(AData: TDataSet;AsecimFieldName, AFieldName: string): String;
var
  LFieldname : String;
  LSecimFielname :string;
begin

  AData.DisableControls;
  AData.First;
  while not AData.EOF do
  begin


    if VarToBoolDef(AData.FieldByName(AsecimFieldName).AsVariant,false)=true  then
      Result := Result + AData.FieldByName(AFieldName).AsString + ',';
    AData.Next;
  end;
  AData.EnableControls;
  if Length(Result) > 1  then System.Delete(Result, Length(Result), 1) else Result := '';
end;

procedure TMainMod.MonitorSQL(Sender: TObject; Text: string;
  Flag: TDATraceFlag);
var
  LogFile: TextFile;
begin
  AssignFile(LogFile, 'C:\SQL_Log.txt');
  if FileExists('C:\SQL_Log.txt') then
    Append(LogFile)  // Dosya varsa ekleme modunda aç
  else
    Rewrite(LogFile); // Dosya yoksa oluştur
  Writeln(LogFile, FormatDateTime('yyyy-mm-dd hh:nn:ss', Now) + ' - ' + Text);
  CloseFile(LogFile);

end;

function TMainMod.NewGuid: String;
begin
  Result := TGUID.NewGuid.ToString;
  System.Delete(Result, 1, 1);
  System.Delete(Result, Length(Result), 1);
end;

function TMainMod.VarToBoolDef(const AValue: Variant; const ADefault: Boolean): Boolean;
begin
  try
    // Boolean dönüşümünü dener
    Result := VarAsType(AValue, varBoolean);
  except
    // Dönüşüm başarısız olursa varsayılan değeri döndür
    Result := ADefault;
  end;
end;

procedure TMainMod.OpenTables;
begin

end;

procedure TMainMod.qVSBasvuruCalcFields(DataSet: TDataSet);
begin
  qVSBasvuru.FieldByName('son_tarih').AsDateTime := Trunc(qVSBasvuru.FieldByName('basvuru_tarihi').AsDateTime) + 30;
  qVSBasvuru.FieldByName('kalan_sure').AsInteger := Trunc(qVSBasvuru.FieldByName('son_tarih').AsDateTime - Date);
end;

procedure TMainMod.ReadSettings;
var
  MyIni : TIniFile;
begin
  if not Tfile.Exists(ServerMod.StartPath + 'aryom.ini') then
  begin
    DecryptSys(ServerMod.StartPath + 'aryom.sys', ServerMod.StartPath + 'aryom.ini');
   // DeleteFile(PWideChar(ServerMod.StartPath + 'aryom.sys'));
  end;

  MyIni      := TIniFile.Create(ServerMod.StartPath + 'aryom.ini');
  ServerIP   := MyIni.ReadString('Server', 'IP', '');
  ServerPort := MyIni.ReadInteger('Server', 'Port', 0);
  ServerUser := MyIni.ReadString('Server', 'User', '');
  ServerPwd  := MyIni.ReadString('Server', 'Admin', '');
  PermDB     := MyIni.ReadString('Permissions', 'DB', '');
  IpLength   := MyIni.ReadInteger('Server', 'Length', 0);
  MyIni.Free;

  //DeleteFile(PWideChar(ServerMod.StartPath + 'aryom.ini'));
end;

procedure TMainMod.ReadUbys;
var
  MyIni : TIniFile;
begin
  DecryptSys(ServerMod.StartPath + 'UBYS.sys', ServerMod.StartPath + 'UBYS.ini');

  MyIni        := TIniFile.Create(ServerMod.StartPath + 'UBYS.ini');
  UbysUrl      := DecryptStr(MyIni.ReadString('Settings', 'API_URL', ''));
  UbysUName    := DecryptStr(MyIni.ReadString('Settings', 'UName', ''));
  UbysPassword := DecryptStr(MyIni.ReadString('Settings', 'Password', ''));
  MyIni.Free;
  DeleteFile(PWideChar(ServerMod.StartPath + 'UBYS.ini'));
end;

procedure TMainMod.SaveLoginLog(ACode, CmpActive, UsrActive, IsSuccess: String);
var
  v1,v2,v3,v4: word;
begin
  qLog.Close;
  qLog.ParamByName('COMPCODE').AsString  := ACode;
  qLog.ParamByName('UNAME').AsString     := LoginInfo.UserName;
  if LoginInfo.Password <> '' then
    qLog.ParamByName('UPWD').AsString    := EncryptStr(LoginInfo.Password);
  qLog.ParamByName('CMPACTIVE').AsString := CmpActive;
  qLog.ParamByName('USRACTIVE').AsString := UsrActive;
  qLog.ParamByName('ISSUCCESS').AsString := IsSuccess;
  qLog.ParamByName('IPNO').AsString      := ''; //LoginInfo.MAC_IPNo;
  qLog.ParamByName('MACNO').AsString     := ''; //LoginInfo.MAC_Address;
  qLog.ParamByName('PRGID').AsString     := '1';
  qLog.ParamByName('PRGVERS').AsString   :=  ServerMod.Version;// Versiyon;
  qLog.ExecSQL;
end;

procedure TMainMod.SaveSMSLog(MCID, ARID, ResultID: Integer; AType, AIP,
  AResult: String);
begin
  qLog.Close;
  qLog.SQL.Clear;
  qLog.SQL.Add('SELECT prc_log_sms(' + IntToStr(MCID) + ', ' + IntToStr(ARID) + ', ''' + AType + ''', ''' +
               AIP + ''', ''' + AResult + ''', ' + IntToStr(ResultID) + ');');
  qLog.ExecSQL;
end;

function TMainMod.ShortURL(var AURL: String): Boolean;
var
  JSData : ISuperObject;

  Resp : TStringStream;
  SSL1 : TIdSSLIOHandlerSocketOpenSSL;
begin
  Result := False;
  AURL   := TIdURI.URLEncode(AURL);
  Resp   := TStringStream.Create('');

  try
    SSL1 := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    SSL1.SSLOptions.Method := sslvSSLv23;
    HTTPReq.Disconnect;
    HTTPReq.IOHandler := SSL1;
    // IdHTTP1.Post(Url, Veri, Response);
    HTTPReq.Get('https://0fs.me/api/?link=' + AURL, Resp);
    JSData := SO(Resp.DataString);
    AURL := JSData.S['shorturl'];
    Result := True;
  except on E: Exception do
    begin
      AURL := 'URL kısaltma hatası : ' + E.ToString;
    end;
  end;
  Resp.Free;
  SSL1.Free;
end;

procedure TMainMod.UniGUIMainModuleBrowserClose(Sender: TObject);
begin
 ServerMod.RemoveUserSession( UniSession.SessionID);
end;

procedure TMainMod.UniGUIMainModuleCreate(Sender: TObject);
var
  i: integer;
  tmp: string;
  SessVal: string;
begin
  ServerMessages.InvalidSessionTemplate.LoadFromFile(ServerMod.FilesFolderPath + 'temp_html/InvalidSessionTemplate.htm');
  ServerMessages.ExceptionTemplate.LoadFromFile(ServerMod.FilesFolderPath + 'temp_html/ExceptionTemplate.htm');
  ServerMessages.TerminateTemplate.LoadFromFile(ServerMod.FilesFolderPath + 'temp_html/TerminateTemplate.htm');
  DBMain.Connected := False;
  ReadSettings;
  ReadUbys;
  DBMain.ConnectString := '';
  DBMain.Server   := ServerIP;
  DBMain.Port     := ServerPort;
  DBMain.Username := ServerUser;
  DBMain.Password := ServerPwd;
  DBMain.Database := PermDB;
  DBMain.ProviderName := 'PostgreSQL';
//  DBMain.SpecificOptions.Values['UseUnicode'] := 'True';
//  DBMain.SpecificOptions.Values['Charset'] := 'utf8';
  DBMain.LoginPrompt := False;
  try
    servermod.Logger.AddLog('HedefConnectString :' + DBMain.ConnectString );
    DBMain.Connected := True;
    servermod.Logger.AddLog('AktifConnectString :' + DBMain.ConnectString );
  except on E: Exception do
    begin
      ServerMod.Logger.AddLog('HATA!', 'Veritabanına bağlanılamadı! ' + e.Message);
      ServerMessages.TerminateMessage := 'Veritabanı bağlantı hatası. Lütfen sistem yöneticisine bildiriniz.';
      MainMod.Terminate;
    end;
  end;
  ipAdress := MainMod.RemoteAddress;
  afterdatabaseOpenEvents ;// Tablo değişiklerini kontrol et

     QueryOpen(qtmp, 'SELECT id FROM "sys_permission"  where perm_def = ''DÖKÜMAN ŞABLONLARI'' ') ;
    if not qtmp.IsEmpty then
      QueryExec(qTmp,'UPDATE sys_permission SET perm_def =''DOKÜMAN ŞABLONLARI'' WHERE id='+
        qTmp.FieldByName('id').AsString);
      QueryOpen(qtmp, 'SELECT id FROM "sys_permission"  where perm_def = ''DÖKÜMAN ŞABLONLARI YÖNETİMİ'' ') ;
    if not qtmp.IsEmpty then
      QueryExec(qTmp,'UPDATE sys_permission SET perm_def =''DOKÜMAN ŞABLONLARI YÖNETİMİ'' WHERE id='+
        qTmp.FieldByName('id').AsString);



//  if qPrm.FieldByName('AKTIF').qAsString <> 'E' then
//  begin
//    ServerMessages.TerminateMessage := 'Online Tahsis Sistemi kapalıdır.';
//    MainMod.Terminate;
//  end;
//  BasTarih := qPrm.FieldByName('BAS_TARIH').AsDateTime;
//  BitTarih := qPrm.FieldByName('BIT_TARIH').AsDateTime;
//  if Now > BitTarih then
//  begin
//    ServerMessages.TerminateMessage := 'Online Tahsis Sistemi kapalıdır. Başvuru süresi doldu. İşlem yapamazsınız';
//    MainMod.Terminate;
//  end;
//  if Now < BasTarih then
//  begin
//    ServerMessages.TerminateMessage := 'Online Tahsis Sistemi kapalıdır. Başvurular henüz başlamadı. İşlem yapamazsınız';
//    MainMod.Terminate;
//  end;

  // cookie http bayrağı ve secure özelliği - sızma testi
  // servermod taşındı
// 	 UniGUIApplication.UniApplication.Cookies.SetCookie('UNI_GUI_SESSION_ID',
//   UniSession.UniApplication.Cookies.GetCookie('UNI_GUI_SESSION_ID'), 0, True, True, '/');



  // CreateSysAdmin;
  AydinlatmaLink := MainMod.GetSysParam(qTmp, 'AYDINLATMA LINK');
  OzelOnayLink   := MainMod.GetSysParam(qTmp, 'ÖZEL ONAY LINK');
  AcikRizaLink   := MainMod.GetSysParam(qTmp, 'AÇIK RIZA LINK');
  VSBFormLink    := MainMod.GetSysParam(qTmp, 'VERİ SAHİBİ BAŞVURU FORMU LINK');
  ApiAdres       := MainMod.GetSysParam(qTmp, 'KVKNET API ADRES');
  KVKNetLink     := MainMod.GetSysParam(qTmp, 'KVKNET GİRİŞ LINK');
  KVKKPortalLink := MainMod.GetSysParam(qTmp, 'KVKK PORTALI LINK');
  genelLink      := MainMod.GetSysParam(qTmp, 'GENEL YÖNLENDİRME LINK');
  ShortUrlLink   := MainMod.GetSysParam(qTmp, 'URL KISALTMA LINK');
  apiToken       := '';
  apiTokenBitis  := now;

end;

procedure TMainMod.afterdatabaseOpenEvents;
var
 query : TUniQuery;
 str : string;
 StringList : TStringList;

begin
  if not ServerMod.VersionDegisti then  exit;

 query := TUniQuery.Create(nil);
 try
 query.Connection := DBMain;

   try

//  Enerji bakanlığı için bir defa çalışacak birdefa zaten çalıştırıldı.
//      str := ' INSERT INTO sys_parameter ' +
//      ' (module, sub_module, param_val, description, val1, val2, val3) ' +
//      ' SELECT ' +
//      ' ''YÖNETİM'', ''PROGRAM'', ''KURUM KODU DOLDUR'', ''Seçili olduğunda login sayfasına kurum adları dolu gelir'', ''E'', NULL, NULL ' +
//      ' WHERE NOT EXISTS ( ' +
//      ' SELECT 1 FROM sys_parameter ' +
//      ' WHERE module = ''YÖNETİM'' ' +
//      ' AND sub_module = ''PROGRAM'' ' +
//      ' AND param_val = ''KURUM KODU DOLDUR'' ' +
//      ' ) ' ;
//      try
//        QueryExec(query,str);
//      finally
//       ;
//      end;



//    str :=
//          ' DO $$ ' +
//          ' BEGIN ' +
//          ' EXECUTE $func$ ' +
//          ' CREATE OR REPLACE FUNCTION public.fnc_id2str( ' +
//          ' id_list varchar, ' +
//          ' tbl_name varchar, ' +
//          ' fld_name varchar ' +
//          ' ) RETURNS varchar AS $fn$ ' +
//          ' DECLARE ' +
//          ' sList varchar; ' +
//          ' BEGIN ' +
//          ' IF id_list = '''' THEN RETURN ''''; END IF; ' +
//          ' IF tbl_name = '''' THEN RETURN ''''; END IF; ' +
//          ' IF fld_name = '''' THEN RETURN ''''; END IF; ' +
//          ' sList := ''''; ' +
//          ' IF lower(tbl_name) = ''sys_deptdef'' AND lower(fld_name) = ''title'' THEN ' +
//          ' EXECUTE ' +
//          ' ''SELECT (CASE WHEN COALESCE(dp.main_dept_id,0) > 0 ' +
//          ' THEN dp.title || '''' ('''') || dp_main.title || '''')'''') ' +
//          ' ELSE dp.title END) ' +
//          ' FROM sys_deptdef dp ' +
//          ' LEFT JOIN sys_deptdef dp_main ON dp_main.id = dp.main_dept_id ' +
//          ' WHERE dp.id IN ('' || id_list || '')'' ' +
//          ' INTO sList; ' +
//          ' ELSE ' +
//          ' EXECUTE ' +
//          ' ''SELECT string_agg('' || fld_name || '', ''''; '''') ' +
//          ' FROM '' || tbl_name ||'' ' +
//          ' WHERE id IN ('' || id_list || '')'' ' +
//          ' INTO sList; ' +
//          ' END IF; ' +
//          ' RETURN sList; ' +
//          ' EXCEPTION WHEN OTHERS THEN RETURN ''''; ' +
//          ' END; ' +
//          ' $fn$ LANGUAGE plpgsql VOLATILE COST 100; ' +
//          ' $func$; ' +
//          ' END; ' +
//          ' $$; '
//          ;
   str := ' DO $$ ' +
     ' BEGIN ' +
     ' IF NOT EXISTS ( ' +
     ' SELECT 1 FROM information_schema.columns ' +
     ' WHERE table_schema = ''public'' ' +
     ' AND table_name = ''data_acikriza'' ' +
     ' AND column_name = ''surec_ids'' ' +
     ' ) THEN ' +
     ' ALTER TABLE public.data_acikriza ' +
     ' ADD COLUMN surec_ids varchar(4000); ' +
     ' END IF; ' +
     ' END; ' +
     ' $$; ' ;
    try
     QueryExec(query,str);
    except
     ;
    end;

        str := ' DO $$ ' +
     ' BEGIN ' +
     ' IF NOT EXISTS ( ' +
     ' SELECT 1 FROM information_schema.columns ' +
     ' WHERE table_schema = ''public'' ' +
     ' AND table_name = ''data_acikriza'' ' +
     ' AND column_name = ''dept_ids'' ' +
     ' ) THEN ' +
     ' ALTER TABLE public.data_acikriza ' +
     ' ADD COLUMN dept_ids varchar(4000); ' +
     ' END IF; ' +
     ' END; ' +
     ' $$; ' ;
    try
     QueryExec(query,str);
    except
     ;
    end;

    str := ' DO $$ ' +
    ' BEGIN ' +
    ' UPDATE data_acikriza da ' +
    ' SET dept_ids = ( ' +
    ' SELECT string_agg(DISTINCT env.dept_id::varchar, '','') ' +
    ' FROM data_envanter env ' +
    ' WHERE env.kisi_id = da.kisi_id ' +
    ' AND env.active = ''E'' ' +
    ' ) ' +
    ' WHERE da.dept_ids IS NULL; ' +
    '  ' +
    ' UPDATE data_acikriza da ' +
    ' SET surec_ids = (select ' +
    ' string_agg(DISTINCT env.surec_id::varchar, '','') ' +
    ' FROM data_envanter env ' +
    ' WHERE env.kisi_id = da.kisi_id ' +
    ' AND env.active = ''E'' ' +
    ' ) ' +
    ' WHERE da.surec_ids IS NULL; ' +
    ' END; ' +
    ' $$; ' ;
    try
     QueryExec(query,str);
    except
     ;
    end;


    str := ' CREATE OR REPLACE FUNCTION public.prc_data_acikriza_before() ' +
    ' RETURNS trigger AS ' +
    ' $$ ' +
    ' DECLARE ' +
    ' user_id     INTEGER; ' +
    ' user_ip     VARCHAR; ' +
    ' log_islem   CHAR(1); ' +
    ' v_dept_ids  varchar(4000); ' +
    ' v_surec_ids varchar(4000); ' +
    ' BEGIN ' +
    ' log_islem := SUBSTRING(TG_OP, 1, 1); ' +
    '  ' +
    ' -- Kullanıcı bilgisini al ' +
    ' SELECT current_setting(''KVKNET.USER_ID'', true)::INTEGER, ' +
    ' current_setting(''KVKNET.USER_IP'', true) ' +
    ' INTO user_id, user_ip; ' +
    '  ' +
    ' -- Eğer INSERT ise departman ve süreçleri hazırla ' +
    ' IF (log_islem = ''I'') THEN ' +
    ' SELECT string_agg(DISTINCT env.dept_id::varchar, '',''), ' +
    ' string_agg(DISTINCT env.surec_id::varchar, '','') ' +
    ' INTO v_dept_ids, v_surec_ids ' +
    ' FROM data_envanter env ' +
    ' WHERE env.kisi_id = NEW.kisi_id ' +
    ' AND env.active = ''E''; ' +
    '  ' +
    ' -- Yeni kayıt üzerinde alanları doldur ' +
    ' NEW.dept_ids  := v_dept_ids; ' +
    ' NEW.surec_ids := v_surec_ids; ' +
    ' END IF; ' +
    '  ' +
    ' RETURN NEW; ' +
    ' END; ' +
    ' $$ LANGUAGE plpgsql; ' ;
    try
      QueryExec(query, str);
    except
      ;
    end;

    str := ' DO $$ ' +
    ' BEGIN ' +
    ' IF EXISTS ( ' +
    ' SELECT 1 ' +
    ' FROM pg_trigger ' +
    ' WHERE tgname = ''trg_data_acikriza_before'' ' +
    ' AND tgrelid = ''data_acikriza''::regclass ' +
    ' ) THEN ' +
    ' DROP TRIGGER trg_data_acikriza_before ON data_acikriza; ' +
    ' END IF; ' +
    '  ' +
    ' CREATE TRIGGER trg_data_acikriza_before ' +
    ' BEFORE INSERT OR UPDATE ON data_acikriza ' +
    ' FOR EACH ROW ' +
    ' EXECUTE FUNCTION public.prc_data_acikriza_before(); ' +
    ' END; ' +
    ' $$; ' ;
    try
      QueryExec(query, str);
    except
      ;
    end;



    str :=
      ' DO $$ ' +
      ' BEGIN ' +
      ' EXECUTE $func$ ' +
      ' CREATE OR REPLACE FUNCTION public.fnc_id2str( ' +
      ' id_list varchar, ' +
      ' tbl_name varchar, ' +
      ' fld_name varchar ' +
      ' ) RETURNS varchar AS $fn$ ' +
      ' DECLARE ' +
      ' sList varchar; ' +
      ' BEGIN ' +
      ' IF id_list = '''' THEN RETURN ''''; END IF; ' +
      ' IF tbl_name = '''' THEN RETURN ''''; END IF; ' +
      ' IF fld_name = '''' THEN RETURN ''''; END IF; ' +
      ' sList := ''''; ' +
      ' IF lower(tbl_name) = ''sys_deptdef'' AND lower(fld_name) = ''title'' THEN ' +
      ' EXECUTE ' +
      ' ''SELECT (CASE WHEN COALESCE(dp.main_dept_id,0) > 0 ' +
      ' THEN dp.title || '''' ('''' || dp_main.title || '''')'''' ' +
      ' ELSE dp.title END) ' +
      ' FROM sys_deptdef dp ' +
      ' LEFT JOIN sys_deptdef dp_main ON dp_main.id = dp.main_dept_id ' +
      ' WHERE dp.id IN ('' || id_list || '')'' ' +
      ' INTO sList; ' +
      ' ELSE ' +
      ' EXECUTE ' +
      ' ''SELECT string_agg('' || fld_name || '', ''''; '''') ' +
      ' FROM '' || tbl_name ||'' ' +
      ' WHERE id IN ('' || id_list || '')'' ' +
      ' INTO sList; ' +
      ' END IF; ' +
      ' RETURN sList; ' +
      ' EXCEPTION WHEN OTHERS THEN RETURN ''''; ' +
      ' END; ' +
      ' $fn$ LANGUAGE plpgsql VOLATILE COST 100; ' +
      ' $func$; ' +
      ' END; ' +
      ' $$; ' ;

    try
      QueryExec(query, str);
    except
      ;
    end;

    str := ' DO $$ ' +
    ' BEGIN ' +
    '  ' +
    ' IF NOT EXISTS ( ' +
    ' SELECT 1 FROM information_schema.columns ' +
    ' WHERE table_schema = ''public'' ' +
    ' AND table_name = ''sys_dynamic_properties'' ' +
    ' AND column_name = ''show_portal_krm_logo'' ' +
    ' ) THEN ' +
    ' ALTER TABLE public.sys_dynamic_properties ' +
    ' ADD COLUMN show_portal_krm_logo varchar(1); ' +
    ' END IF; ' +
    '  ' +
    ' IF NOT EXISTS ( ' +
    ' SELECT 1 FROM information_schema.columns ' +
    ' WHERE table_schema = ''public'' ' +
    ' AND table_name = ''sys_dynamic_properties'' ' +
    ' AND column_name = ''show_afis_web_link'' ' +
    ' ) THEN ' +
    ' ALTER TABLE public.sys_dynamic_properties ' +
    ' ADD COLUMN show_afis_web_link varchar(1); ' +
    ' END IF; ' +
    '  ' +
    ' IF NOT EXISTS ( ' +
    ' SELECT 1 FROM information_schema.columns ' +
    ' WHERE table_schema = ''public'' ' +
    ' AND table_name = ''sys_dynamic_properties'' ' +
    ' AND column_name = ''show_afis_portal_link'' ' +
    ' ) THEN ' +
    ' ALTER TABLE public.sys_dynamic_properties ' +
    ' ADD COLUMN show_afis_portal_link varchar(1); ' +
    ' END IF; ' +
    '  ' +
    ' IF NOT EXISTS ( ' +
    ' SELECT 1 FROM information_schema.columns ' +
    ' WHERE table_schema = ''public'' ' +
    ' AND table_name = ''sys_dynamic_properties'' ' +
    ' AND column_name = ''show_afis_mail'' ' +
    ' ) THEN ' +
    ' ALTER TABLE public.sys_dynamic_properties ' +
    ' ADD COLUMN show_afis_mail varchar(1); ' +
    ' END IF; ' +
    '  ' +
    ' IF NOT EXISTS ( ' +
    ' SELECT 1 FROM information_schema.columns ' +
    ' WHERE table_schema = ''public'' ' +
    ' AND table_name = ''sys_dynamic_properties'' ' +
    ' AND column_name = ''show_afis_gsm_no'' ' +
    ' ) THEN ' +
    ' ALTER TABLE public.sys_dynamic_properties ' +
    ' ADD COLUMN show_afis_gsm_no varchar(1); ' +
    ' END IF; ' +
    '  ' +
    ' IF NOT EXISTS ( ' +
    ' SELECT 1 FROM pg_constraint ' +
    ' WHERE conname = ''sys_dynamic_properties_show_portal_krm_logo_check'' ' +
    ' ) THEN ' +
    ' ALTER TABLE public.sys_dynamic_properties ' +
    ' ADD CONSTRAINT sys_dynamic_properties_show_portal_krm_logo_check ' +
    ' CHECK (show_portal_krm_logo  IN (''E'',''H'') ); ' +
    ' END IF; ' +
    '  ' +
    ' IF NOT EXISTS ( ' +
    ' SELECT 1 FROM pg_constraint ' +
    ' WHERE conname = ''sys_dynamic_properties_show_afis_web_link_check'' ' +
    ' ) THEN ' +
    ' ALTER TABLE public.sys_dynamic_properties ' +
    ' ADD CONSTRAINT sys_dynamic_properties_show_afis_web_link_check ' +
    ' CHECK (show_afis_web_link  IN (''E'',''H'') ); ' +
    ' END IF; ' +
    '  ' +
    ' IF NOT EXISTS ( ' +
    ' SELECT 1 FROM pg_constraint ' +
    ' WHERE conname = ''sys_dynamic_properties_show_afis_portal_link_check'' ' +
    ' ) THEN ' +
    ' ALTER TABLE public.sys_dynamic_properties ' +
    ' ADD CONSTRAINT sys_dynamic_properties_show_afis_portal_link_check ' +
    ' CHECK (show_afis_portal_link  IN (''E'',''H'') ); ' +
    ' END IF; ' +
    '  ' +
    ' IF NOT EXISTS ( ' +
    ' SELECT 1 FROM pg_constraint ' +
    ' WHERE conname = ''sys_dynamic_properties_show_afis_mail_check'' ' +
    ' ) THEN ' +
    ' ALTER TABLE public.sys_dynamic_properties ' +
    ' ADD CONSTRAINT sys_dynamic_properties_show_afis_mail_check ' +
    ' CHECK (show_afis_mail  IN (''E'',''H'') ); ' +
    ' END IF; ' +
    '  ' +
    ' IF NOT EXISTS ( ' +
    ' SELECT 1 FROM pg_constraint ' +
    ' WHERE conname = ''sys_dynamic_properties_show_afis_gsm_no_check'' ' +
    ' ) THEN ' +
    ' ALTER TABLE public.sys_dynamic_properties ' +
    ' ADD CONSTRAINT sys_dynamic_properties_show_afis_gsm_no_check ' +
    ' CHECK (show_afis_gsm_no  IN (''E'',''H'') ); ' +
    ' END IF; ' +
    ' END; ' +
    ' $$; ' ;

    try
      QueryExec(query, str);
    except
      ;
    end;

    str := ' CREATE TABLE IF NOT EXISTS public.sys_dynamic_properties ' +
    ' ( ' +
    ' id int4 NOT NULL , ' +
    ' mc_id int4 NOT NULL, ' +
    ' primary_color_code varchar(7) , ' +
    ' secondary_color_code varchar(7) , ' +
    ' show_commission_decisions char(1) , ' +
    ' show_policies char(1) , ' +
    ' show_information_texts char(1), ' +
    ' show_explicit_consent_texts char(1) , ' +
    ' show_data_subject_applications char(1) , ' +
    ' show_portal_kvknet_logo char(1) , ' +
    ' show_application_login_kvknet_logo char(1) , ' +
    ' data_subject_application_warning_text text , ' +
    ' show_ip_address char(1) , ' +
    ' show_portal_krm_logo varchar(1), ' +
    ' idy int4, ' +
    ' idt timestamp(6), ' +
    ' sdy int4, ' +
    ' sdt timestamp(6), ' +
    ' CONSTRAINT sys_dynamic_properties_pkey PRIMARY KEY (id), ' +
    ' CONSTRAINT sys_dynamic_properties_show_application_login_kvknet_logo_check ' +
    ' CHECK (show_application_login_kvknet_logo IN (''E'',''H'')), ' +
    ' CONSTRAINT sys_dynamic_properties_show_commission_decisions_check ' +
    ' CHECK (show_commission_decisions IN (''E'',''H'')), ' +
    ' CONSTRAINT sys_dynamic_properties_show_data_subject_applications_check ' +
    ' CHECK (show_data_subject_applications IN (''E'',''H'')), ' +
    ' CONSTRAINT sys_dynamic_properties_show_explicit_consent_texts_check ' +
    ' CHECK (show_explicit_consent_texts IN (''E'',''H'')), ' +
    ' CONSTRAINT sys_dynamic_properties_show_information_texts_check ' +
    ' CHECK (show_information_texts IN (''E'',''H'')), ' +
    ' CONSTRAINT sys_dynamic_properties_show_ip_address_check ' +
    ' CHECK (show_ip_address IN (''E'', ''H'')), ' +
    ' CONSTRAINT sys_dynamic_properties_show_policies_check ' +
    ' CHECK (show_policies IN (''E'',''H'')), ' +
    ' CONSTRAINT sys_dynamic_properties_show_portal_krm_logo_check ' +
    ' CHECK (show_portal_krm_logo IN (''E'',''H'')), ' +
    ' CONSTRAINT sys_dynamic_properties_show_portal_kvknet_logo_check ' +
    ' CHECK (show_portal_kvknet_logo IN (''E'',''H'')) ' +
    ' ); ' ;
    try
      QueryExec(query,str);
    except
     ;
    end;


    str := ' CREATE SEQUENCE IF NOT EXISTS public.sq_sys_dynamic_properties_id ' ;
    try
     QueryExec(query,str );
    except
      ;
    end;

    str := '  ' +
    ' DO $$ ' +
    ' BEGIN ' +
    '  ' +
    ' DELETE FROM "public"."sys_permission" WHERE id = 290; ' +
    ' INSERT INTO "public"."sys_permission" ("id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note") ' +
    ' select  290, 207, ''M'', 0, ''PORTAL SAYFA AYARI'', NULL ' +
    ' where not EXISTS (SELECT 1 FROM "public"."sys_permission" ' +
    ' WHERE "id" = 290 AND "parent_id" = 207 AND "perm_type" = ''M'' AND "perm_id" = 0 AND "perm_def" = ''PORTAL SAYFA AYARI'' ); ' +
    '  ' +
    ' DELETE FROM "public"."sys_permission" WHERE id = 291; ' +
    ' INSERT INTO "public"."sys_permission" ("id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note") ' +
    ' SELECT 291, 290, ''Y'', 214, ''Görme'', NULL ' +
    ' WHERE NOT EXISTS ( ' +
    ' SELECT 1 FROM "public"."sys_permission" ' +
    ' WHERE "id" = 291 AND "parent_id" = 290 AND "perm_type" = ''Y'' AND "perm_id" = 214 AND "perm_def" = ''Görme''); ' +
    '  ' +
    ' DELETE FROM "public"."sys_permission" WHERE id = 292; ' +
    ' INSERT INTO "public"."sys_permission" ("id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note") ' +
    ' SELECT 292, 290, ''Y'', 215, ''Değiştirme'', NULL ' +
    ' WHERE NOT EXISTS ( ' +
    ' SELECT 1 FROM "public"."sys_permission" ' +
    ' WHERE "id" = 292 AND "parent_id" = 290 AND "perm_type" = ''Y'' AND "perm_id" = 215 AND "perm_def" = ''Değiştirme''); ' +
    '  ' +
    '  ' +
    ' END $$; ';
    try
      QueryExec(query,str);
    except
     ;
    end;


    str := ' DO $$ ' +
     ' BEGIN ' +
     ' IF NOT EXISTS ( ' +
     ' SELECT 1 FROM information_schema.columns ' +
     ' WHERE table_schema = ''public'' ' +
     ' AND table_name = ''sys_deptdef'' ' +
     ' AND column_name = ''main_dept_id'' ' +
     ' ) THEN ' +
     ' ALTER TABLE public.sys_deptdef ' +
     ' ADD COLUMN main_dept_id int4; ' +
     ' END IF; ' +
     ' END; ' +
     ' $$; ' ;
    try
     QueryExec(query,str);
    except
     ;
    end;

    str := ' DO $$ ' +
    ' BEGIN ' +
    ' IF NOT EXISTS ( ' +
    ' SELECT 1 ' +
    ' FROM information_schema.columns ' +
    ' WHERE table_schema = ''public'' ' +
    ' AND table_name = ''sys_param_mc'' ' +
    ' AND column_name = ''kullanici_aydinlatma_link'' ' +
    ' ) THEN ' +
    ' ALTER TABLE public.sys_param_mc ' +
    ' ADD COLUMN kullanici_aydinlatma_link varchar(255); ' +
    ' END IF; ' +
    ' END; ' +
    ' $$ ' ;
    try
     QueryExec(query,str);
    except
     ;
    end;

    // iki faktörlü doğrulama
    str := ' DO $$ ' +
    ' BEGIN ' +
    ' IF NOT EXISTS ( ' +
    ' SELECT 1 FROM information_schema.columns ' +
    ' WHERE table_schema = ''public'' ' +
    ' AND table_name = ''usr_user'' ' +
    ' AND column_name = ''twosecret'' ' +
    ' ) THEN ' +
    ' ALTER TABLE public.usr_user ' +
    ' ADD COLUMN twosecret varchar(100); ' +
    ' END IF; ' +
    '  ' +
    ' END; ' +
    ' $$; ' ;
    try
     QueryExec(query,str);
    except
     ;
    end;

        str := ' INSERT INTO "public"."sys_parameter" ' +
        ' ("module", "sub_module", "param_val", "description", "val1", "val2", "val3") ' +
        ' SELECT ' +
        ' ''YÖNETİM'', ''PROGRAM'', ''İKİ FAKTÖRLÜ DOĞRULAMA TÜRÜ'', ''0: Boş, 1: Google OTP, 2: Email, 3: SMS'', '''', NULL, NULL ' +
        ' WHERE NOT EXISTS ( ' +
        ' SELECT 1 ' +
        ' FROM "public"."sys_parameter" ' +
        ' WHERE "module" = ''YÖNETİM'' ' +
        ' AND "sub_module" = ''PROGRAM'' ' +
        ' AND "param_val" = ''İKİ FAKTÖRLÜ DOĞRULAMA TÜRÜ'' ' +
        ' ) ' ;
    try
     QueryExec(query,str);
    except
     ;
    end;

    // kullanıcı şifre değişikliği kontrolü icin trigger fonksiyon ekleniyor
    str := ' CREATE OR REPLACE FUNCTION "public"."prc_update_password_changed_at"() ' +
    ' RETURNS "pg_catalog"."trigger" AS $BODY$ ' +
    ' BEGIN ' +
    ' IF TG_OP = ''INSERT'' THEN ' +
    ' NEW.password_changed_at := now(); ' +
    ' ELSIF TG_OP = ''UPDATE'' THEN ' +
    ' IF NEW.user_pwd IS DISTINCT FROM OLD.user_pwd THEN ' +
    ' NEW.password_changed_at := now(); ' +
    ' END IF; ' +
    ' END IF; ' +
    '  ' +
    ' RETURN NEW; ' +
    ' END; ' +
    ' $BODY$ ' +
    ' LANGUAGE plpgsql VOLATILE ' +
    ' COST 100; ' ;
    try
        QueryExec(query,str);
    except
      ;
    end;
    str := ' DO $$ ' +
    ' BEGIN ' +
    ' IF NOT EXISTS ( ' +
    ' SELECT 1 FROM pg_trigger ' +
    ' WHERE tgname = ''trg_log_usr_user_psw'' ' +
    ' ) THEN ' +
    ' EXECUTE '' ' +
    ' CREATE TRIGGER trg_log_usr_user_psw ' +
    ' BEFORE INSERT OR UPDATE ON public.usr_user ' +
    ' FOR EACH ROW ' +
    ' EXECUTE FUNCTION public.prc_update_password_changed_at() ' +
    ' ''; ' +
    ' END IF; ' +
    ' END; ' +
    ' $$; '     ;
    try
        QueryExec(query,str);
    except
      ;
    end;

    str := ' INSERT INTO "public"."sys_parameter" ' +
    ' ("module", "sub_module", "param_val", "description", "val1", "val2", "val3") ' +
    ' SELECT ' +
    ' ''YÖNETİM'', ''PROGRAM'', ''KULLANICI MAİL GÖNDERME'', ''E: Toplu Kullanıcı Ekleme SMS göndermez,H: Toplu Kullanıcı Eklemede SMS gönderir'', NULL, NULL, NULL ' +
    ' WHERE NOT EXISTS ( ' +
    ' SELECT 1 ' +
    ' FROM "public"."sys_parameter" ' +
    ' WHERE "module" = ''YÖNETİM'' ' +
    ' AND "sub_module" = ''PROGRAM'' ' +
    ' AND "param_val" = ''KULLANICI MAİL GÖNDERME'' ' +
    ' ) ';
    try
        QueryExec(query,str);
    except
      ;
    end;

    str := ' INSERT INTO "public"."sys_parameter" ' +
    ' ("module", "sub_module", "param_val", "description", "val1", "val2", "val3") ' +
    ' SELECT ' +
    ' ''YÖNETİM'', ''PROGRAM'', ''KURUM KODU DOLDUR'', ''Seçili olduğunda login sayfasına kurum adları dolu gelir'', NULL, NULL, NULL ' +
    ' WHERE NOT EXISTS ( ' +
    ' SELECT 1 ' +
    ' FROM "public"."sys_parameter" ' +
    ' WHERE "module" = ''YÖNETİM'' ' +
    ' AND "sub_module" = ''PROGRAM'' ' +
    ' AND "param_val" = ''KURUM KODU DOLDUR'' ' +
    ' ) ' ;
    try
        QueryExec(query,str);
    except
      ;
    end;




    str := ' DO $$ ' +
    ' BEGIN ' +
    ' IF NOT EXISTS ( ' +
    ' SELECT 1 FROM information_schema.columns ' +
    ' WHERE table_schema = ''public'' ' +
    ' AND table_name = ''usr_user'' ' +
    ' AND column_name = ''password_changed_at'' ' +
    ' ) THEN ' +
    ' ALTER TABLE public.usr_user ' +
    ' ADD COLUMN password_changed_at timestamp(6); ' +
    ' END IF; ' +
    '  ' +
    ' IF NOT EXISTS ( ' +
    ' SELECT 1 FROM information_schema.columns ' +
    ' WHERE table_schema = ''public'' ' +
    ' AND table_name = ''usr_user'' ' +
    ' AND column_name = ''inactive_note'' ' +
    ' ) THEN ' +
    ' ALTER TABLE public.usr_user ' +
    ' ADD COLUMN inactive_note varchar(255); ' +
    ' END IF; ' +
    ' END; ' +
    ' $$; ' ;
    try
     QueryExec(query, str);
    except;
     ;
    end;

    str := ' INSERT INTO "public"."sys_parameter" ' +
    ' ("module", "sub_module", "param_val", "description", "val1", "val2", "val3") ' +
    ' SELECT ' +
    ' ''YÖNETİM'', ''PROGRAM'', ''PAROLA GEÇERLİLİK SÜRESİ'', ''Parola geçerlilik süresi (gün)'', ''0'', NULL, NULL ' +
    ' WHERE NOT EXISTS ( ' +
    ' SELECT 1 ' +
    ' FROM "public"."sys_parameter" ' +
    ' WHERE "module" = ''YÖNETİM'' ' +
    ' AND "sub_module" = ''PROGRAM'' ' +
    ' AND "param_val" = ''PAROLA GEÇERLİLİK SÜRESİ'' ' +
    ' ) ' ;
    try
     QueryExec(query,str);
    except
     ;
    end;

    QueryOpen(query,' SELECT  table_name '+
    ' FROM information_schema.tables '+
    ' where table_schema in (''public'',''aryom_kvkk'') '+
    ' and table_name= ''user_sessions'' ' );
    if query.IsEmpty then
      QueryExec(query,' CREATE TABLE "public"."user_sessions" ( '+
      ' "session_id" int4 NOT NULL, '+
      ' "user_id" int4 NOT NULL, '+
      ' "ip_adress" varchar(30), '+
      ' "created_date" timestamp(6), '+
      ' "updated_date" timestamp(6), '+
      ' PRIMARY KEY ("session_id")  ) ') ;



    QueryOpen(query,' select * from sys_permission where id=248 ' );
    if query.IsEmpty then
      begin
      QueryPrep(query,' INSERT INTO sys_permission (id, parent_id, perm_type, perm_id, perm_def, perm_note) '+
                      ' VALUES '+
                      ' (248, 172, ''Y'', 189, ''Görme'', NULL) ' ) ;
        query.Execute;
      end;


    QueryOpen(query,' select * from sys_parameter t where t.param_val =''DGRNET GİRİŞ LINK'' ') ;
    if query.IsEmpty then
        QueryExec(query,' INSERT INTO sys_parameter (module, sub_module, param_val, description) '+
        ' VALUES(''YÖNETİM'', ''PROGRAM'', ''DGRNET GİRİŞ LINK'', ''DGRNET geçiş yapılmak istendiğinde kullanılacak link''); ' );

    QueryOpen(query,' select * from sys_parameter t where t.param_val =''DEFAULT SİSTEM KULLANICISI'' ') ;
    if query.IsEmpty then
        QueryExec(query,' INSERT INTO sys_parameter (module, sub_module, param_val, description) '+
        ' VALUES '+
        ' (''YÖNETİM'', ''PROGRAM'', ''DEFAULT SİSTEM KULLANICISI'', ''Login ekranı açıldığında LDAP var isede default olarak Sistem Giriş Kullanıcını ayarlar''); ' );

    QueryOpen(query,' select '+
    ' *  FROM information_schema.SEQUENCES '+
    ' where sequence_schema in (''public'',''aryom_kvkk'') '+
    ' and sequence_name =''sq_user_sessions_id'' ') ;
    if query.IsEmpty then
      QueryExec(query,' CREATE SEQUENCE "public"."sq_user_sessions_id" INCREMENT 1 MINVALUE  1 MAXVALUE 9223372036854775807 START 1 CACHE 1 ') ;


      if IndexCheck('data_envanter','data_envanter_idy_idx') < 1 then
         QueryExec(query,' CREATE INDEX data_envanter_idy_idx ON data_envanter(idy) ') ;

      if IndexCheck('data_envanter','data_envanter_sdy_idx') < 1 then
         QueryExec(query,' CREATE INDEX data_envanter_sdy_idx ON data_envanter(sdy)');

      if IndexCheck('data_envanter','data_envanter_surec_id_idx') < 1 then
         QueryExec(query,' CREATE INDEX data_envanter_surec_id_idx ON data_envanter(surec_id) ') ;

      if IndexCheck('data_envanter','data_envanter_kaynak_id_idx') < 1 then
         QueryExec(query,' CREATE INDEX data_envanter_kaynak_id_idx ON data_envanter(kaynak_id)') ;

      if IndexCheck('data_envanter','data_envanter_kategori_id_idx') < 1 then
      QueryExec(query,' CREATE INDEX data_envanter_kategori_id_idx ON data_envanter(kategori_id) ') ;

      if IndexCheck('data_envanter','data_envanter_veritipi_id_idx') < 1 then
      QueryExec(query,' CREATE INDEX data_envanter_veritipi_id_idx ON data_envanter(veritipi_id)') ;

      if IndexCheck('data_checklist','data_checklist_mc_kaynak_kisi_active_idx') < 1 then
      QueryExec(query,' CREATE INDEX data_checklist_mc_kaynak_kisi_active_idx ON data_checklist(mc_id, kaynak_id, kisi_id, active)') ;


      QueryOpen(query,'select * from sys_permission where id =256 ') ;
      if query.IsEmpty then
         QueryExec(query,' INSERT INTO sys_permission (id, parent_id, perm_type, perm_id, perm_def, perm_note) VALUES (256, 2, ''M'', 0, ''VERİ TİPİ ANALİZ'', NULL) ' );
      QueryOpen(query,'select * from sys_permission where id =257 ');
      if query.IsEmpty then
         QueryExec(query,' INSERT INTO sys_permission (id, parent_id, perm_type, perm_id, perm_def, perm_note) VALUES (257, 256, ''Y'', 190, ''Görme'', NULL) ' );
      QueryOpen(query,'select * from sys_permission where id =258');
      if query.IsEmpty then
         QueryExec(query,' INSERT INTO sys_permission (id, parent_id, perm_type, perm_id, perm_def, perm_note) VALUES (258, 256, ''Y'', 191, ''Ekleme'', NULL) ');
      QueryOpen(query,'select * from sys_permission where id =259');
      if query.IsEmpty then
         QueryExec(query,' INSERT INTO sys_permission (id, parent_id, perm_type, perm_id, perm_def, perm_note) VALUES (259, 256, ''Y'', 192, ''Değiştirme'', NULL) ' );
      QueryOpen(query,'select * from sys_permission where id =260');
      if query.IsEmpty then
         QueryExec(query,' INSERT INTO sys_permission (id, parent_id, perm_type, perm_id, perm_def, perm_note) VALUES (260, 256, ''Y'', 193, ''Silme'', NULL) '  );
     // 09.12.2024 Risk analiz ve bilenşenleri için gerekli veritabanı yapıları

    str :=
    ' DO $$ ' +
    ' BEGIN ' +
    ' IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = ''sys_param_mc'' AND column_name = ''email_saglayici'') 		THEN ' +
    ' ALTER TABLE public.sys_param_mc ADD COLUMN email_saglayici varchar(20) ; ' +
    ' END IF; ' +
    ' IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = ''sys_param_mc'' AND column_name = ''smtp_varsayilan_gonderen'') 		THEN ' +
    ' ALTER TABLE public.sys_param_mc ADD COLUMN smtp_varsayilan_gonderen varchar(255) ; ' +
    ' END IF; ' +
    ' IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = ''sys_param_mc'' AND column_name = ''smtp_kimlik_dogrulama_gerekli'') 		THEN ' +
    ' ALTER TABLE public.sys_param_mc ADD COLUMN smtp_kimlik_dogrulama_gerekli varchar(1) ; ' +
    ' END IF; ' +
    ' update sys_param_mc set email_saglayici=''RELAY'' WHERE email_saglayici=''ENERJIBAKANLIGI''; ' +
    ' END $$ ; '          ;
    try
     QueryExec(query,str );
    except
      ;
    end;


    str :=
     ' DO $$ BEGIN ' +
     ' IF ' +
     ' NOT EXISTS ( SELECT FROM information_schema.tables WHERE TABLE_NAME = ''def_data_risk'' ) THEN ' +
     ' CREATE TABLE PUBLIC.def_data_risk ( ' +
     ' ID INT4 NOT NULL, ' +
     ' mc_id INT4, ' +
     ' risk VARCHAR ( 250 ), ' +
     ' aciklama VARCHAR ( 1000 ), ' +
     ' kategori INT4, ' +
     ' olasilik INT4, ' +
     ' etki INT4, ' +
     ' seviye FLOAT4, ' +
     ' periyot_birimi INT4, ' +
     ' onlem INT4, ' +
     ' durum INT4, ' +
     ' idy INT4, ' +
     ' idt TIMESTAMP ( 6 ), ' +
     ' sdy INT4, ' +
     ' sdt TIMESTAMP ( 6 ), ' +
     ' periyot_miktari INT4, ' +
     ' metot INT4, ' +
     ' frekans INT4, ' +
     ' farkedilebilirlik INT4, ' +
     ' gozden_gecirme_tar TIMESTAMP ( 6 ), ' +
     ' sorumlu_id INT4, ' +
     ' CONSTRAINT def_data_risk_pkey PRIMARY KEY ( ID ) ' +
     ' ); ' +
     '  ' +
     ' END IF; ' +
     '  ' +
     ' IF ' +
     ' NOT EXISTS ( SELECT FROM information_schema.tables WHERE TABLE_NAME = ''def_data_risk_surec_eslesme'' ) THEN ' +
     ' CREATE TABLE PUBLIC.def_data_risk_surec_eslesme ( ' +
     ' ID INT4 NOT NULL, ' +
     ' mc_id INT4, ' +
     ' risk_id INT4, ' +
     ' surec_id INT4, ' +
     ' idy INT4, ' +
     ' idt TIMESTAMP ( 6 ), ' +
     ' sdy INT4, ' +
     ' sdt TIMESTAMP ( 6 ), ' +
     ' kaynak_ids VARCHAR ( 255 ), ' +
     ' CONSTRAINT def_data_risk_surec_eslesme_pkey PRIMARY KEY ( ID ) ' +
     ' ); ' +
     '  ' +
     ' END IF; ' +
     '  ' +
     ' IF ' +
     ' NOT EXISTS ( SELECT FROM information_schema.tables WHERE TABLE_NAME = ''def_data_risk_tedbir'' ) THEN ' +
     ' CREATE TABLE PUBLIC.def_data_risk_tedbir ( ' +
     ' ID INT4 NOT NULL, ' +
     ' mc_id INT4, ' +
     ' risk_id INT4, ' +
     ' tedbir VARCHAR ( 250 ), ' +
     ' aciklama VARCHAR ( 1000 ), ' +
     ' tarih DATE, ' +
     ' durum INT4, ' +
     ' idy INT4, ' +
     ' idt TIMESTAMP ( 6 ), ' +
     ' sdy INT4, ' +
     ' sdt TIMESTAMP ( 6 ), ' +
     ' sorumlu_id INT4, ' +
     ' CONSTRAINT def_data_risk_tedbir_pkey PRIMARY KEY ( ID ) ' +
     ' ); ' +
     '  ' +
     ' END IF; ' +
     '  ' +
     ' IF ' +
     ' NOT EXISTS ( SELECT FROM information_schema.tables WHERE TABLE_NAME = ''def_data_riskgd'' ) THEN ' +
     ' CREATE TABLE PUBLIC.def_data_riskgd ( ' +
     ' ID INT4 NOT NULL, ' +
     ' gozdengecirme_id INT4 NOT NULL, ' +
     ' mc_id INT4, ' +
     ' risk VARCHAR ( 250 ), ' +
     ' aciklama VARCHAR ( 1000 ) NOT NULL, ' +
     ' kategori INT4, ' +
     ' olasilik INT4, ' +
     ' etki INT4, ' +
     ' seviye FLOAT4, ' +
     ' periyot_birimi INT4, ' +
     ' onlem INT4, ' +
     ' durum INT4, ' +
     ' idy INT4, ' +
     ' idt TIMESTAMP ( 6 ), ' +
     ' sdy INT4, ' +
     ' sdt TIMESTAMP ( 6 ), ' +
     ' periyot_miktari INT4, ' +
     ' metot INT4, ' +
     ' frekans INT4, ' +
     ' farkedilebilirlik INT4, ' +
     ' gozden_gecirme_tar TIMESTAMP ( 6 ), ' +
     ' sorumlu_id INT4, ' +
     ' CONSTRAINT def_data_riskgd_pkey PRIMARY KEY ( gozdengecirme_id ) ' +
     ' ); ' +
     '  ' +
     ' END IF; ' +
     '  ' +
     ' IF ' +
     ' NOT EXISTS ( SELECT FROM information_schema.tables WHERE TABLE_NAME = ''def_data_risk_surec_eslesmegd'' ) THEN ' +
     ' CREATE TABLE PUBLIC.def_data_risk_surec_eslesmegd ( ' +
     ' ID INT4 NOT NULL, ' +
     ' gozdengecirme_id INT4, ' +
     ' mc_id INT4, ' +
     ' risk_id INT4, ' +
     ' surec_id INT4, ' +
     ' idy INT4, ' +
     ' idt TIMESTAMP ( 6 ), ' +
     ' sdy INT4, ' +
     ' sdt TIMESTAMP ( 6 ), ' +
     ' kaynak_ids VARCHAR ( 255 ) ' +
     ' ); ' +
     '  ' +
     ' END IF; ' +
     '  ' +
     ' IF ' +
     ' NOT EXISTS ( SELECT FROM information_schema.tables WHERE TABLE_NAME = ''def_data_risk_tedbirgd'' ) THEN ' +
     ' CREATE TABLE PUBLIC.def_data_risk_tedbirgd ( ' +
     ' ID INT4 NOT NULL, ' +
     ' gozdengecirme_id INT4, ' +
     ' mc_id INT4, ' +
     ' risk_id INT4, ' +
     ' tedbir VARCHAR ( 250 ), ' +
     ' aciklama VARCHAR ( 1000 ), ' +
     ' tarih DATE, ' +
     ' durum INT4, ' +
     ' idy INT4, ' +
     ' idt TIMESTAMP ( 6 ), ' +
     ' sdy INT4, ' +
     ' sdt TIMESTAMP ( 6 ), ' +
     ' sorumlu_id INT4 ' +
     ' ); ' +
     '  ' +
     ' END IF; ' +
     '  ' +
     ' IF ' +
     ' NOT EXISTS ( SELECT FROM information_schema.tables WHERE TABLE_NAME = ''def_data_risk_tanim'' ) THEN ' +
     ' CREATE TABLE PUBLIC.def_data_risk_tanim ( ' +
     ' ID INT4 NOT NULL, ' +
     ' mc_id INT4, ' +
     ' risk VARCHAR ( 250 ), ' +
     ' description VARCHAR ( 500 ), ' +
     ' idy INT4, ' +
     ' idt TIMESTAMP ( 6 ), ' +
     ' sdy INT4, ' +
     ' sdt TIMESTAMP ( 6 ), ' +
     ' CONSTRAINT def_data_risk_tanim_pkey PRIMARY KEY ( ID ) ' +
     ' ); ' +
     '  ' +
     ' END IF; ' +
     '  ' +
     ' IF ' +
     ' NOT EXISTS ( SELECT FROM information_schema.tables WHERE TABLE_NAME = ''sys_modul_parameter'' ) THEN ' +
     ' CREATE TABLE PUBLIC.sys_modul_parameter ( ' +
     ' MODULE VARCHAR ( 20 ), ' +
     ' main_parameter VARCHAR ( 20 ), ' +
     ' PARAMETER VARCHAR ( 100 ), ' +
     ' description VARCHAR ( 100 ), ' +
     ' subid INT4, ' +
     ' val2 VARCHAR ( 100 ), ' +
     ' val3 VARCHAR ( 100 ), ' +
     ' val4 VARCHAR ( 100 ), ' +
     ' CONSTRAINT sys_modul_parameter_uniq_idx UNIQUE ( MODULE, main_parameter, PARAMETER ) ' +
     ' ); ' +
     '  ' +
     ' END IF; ' +
     '  ' +
     ' IF ' +
     ' NOT EXISTS ( SELECT FROM pg_class WHERE relname = ''sq_def_data_risk_id'' ) THEN ' +
     ' CREATE SEQUENCE PUBLIC.sq_def_data_risk_id; ' +
     '  ' +
     ' END IF; ' +
     '  ' +
     ' IF ' +
     ' NOT EXISTS ( SELECT FROM pg_class WHERE relname = ''sq_def_data_risk_surec_eslesme_id'' ) THEN ' +
     ' CREATE SEQUENCE PUBLIC.sq_def_data_risk_surec_eslesme_id; ' +
     '  ' +
     ' END IF; ' +
     ' IF ' +
     ' NOT EXISTS ( SELECT FROM pg_class WHERE relname = ''sq_def_data_risk_tedbir_id'' ) THEN ' +
     ' CREATE SEQUENCE PUBLIC.sq_def_data_risk_tedbir_id; ' +
     '  ' +
     ' END IF; ' +
     ' IF ' +
     ' NOT EXISTS ( SELECT FROM pg_class WHERE relname = ''sq_def_data_risk_gozden_gecirme_id'' ) THEN ' +
     ' CREATE SEQUENCE PUBLIC.sq_def_data_risk_gozden_gecirme_id; ' +
     '  ' +
     ' END IF; ' +
     ' IF ' +
     ' NOT EXISTS ( SELECT FROM pg_class WHERE relname = ''sq_def_data_riks_tanim_id'' ) THEN ' +
     ' CREATE SEQUENCE PUBLIC.sq_def_data_riks_tanim_id; ' +
     '  ' +
     ' END IF; ' +
     ' DELETE FROM "public"."sys_permission"     WHERE id=274; ' +
     ' INSERT INTO "public"."sys_permission" ( "id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note" ) SELECT ' +
     ' 274, ' +
     ' 270, ' +
     ' ''Y'', ' +
     ' 204, ' +
     ' ''Silme'', ' +
     ' NULL ' +
     ' WHERE ' +
     ' NOT EXISTS ( SELECT 1 FROM "public"."sys_permission" WHERE "id" = 274 AND "parent_id" = 270 AND "perm_type" = ''Y'' AND "perm_id" = 204 AND "perm_def" = ''Silme'' ); ' +
     ' DELETE FROM "public"."sys_permission"     WHERE id=273; ' +
     ' INSERT INTO "public"."sys_permission" ( "id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note" ) SELECT ' +
     ' 273, ' +
     ' 270, ' +
     ' ''Y'', ' +
     ' 203, ' +
     ' ''Değiştirme'', ' +
     ' NULL ' +
     ' WHERE ' +
     ' NOT EXISTS ( SELECT 1 FROM "public"."sys_permission" WHERE "id" = 273 AND "parent_id" = 270 AND "perm_type" = ''Y'' AND "perm_id" = 203 AND "perm_def" = ''Değiştirme'' ); ' +
     ' DELETE FROM "public"."sys_permission"     WHERE id=272; ' +
     ' INSERT INTO "public"."sys_permission" ( "id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note" ) SELECT ' +
     ' 272, ' +
     ' 270, ' +
     ' ''Y'', ' +
     ' 202, ' +
     ' ''Ekleme'', ' +
     ' NULL ' +
     ' WHERE ' +
     ' NOT EXISTS ( SELECT 1 FROM "public"."sys_permission" WHERE "id" = 272 AND "parent_id" = 270 AND "perm_type" = ''Y'' AND "perm_id" = 202 AND "perm_def" = ''Ekleme'' ); ' +
     ' DELETE FROM "public"."sys_permission"     WHERE id=271; ' +
     ' INSERT INTO "public"."sys_permission" ( "id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note" ) SELECT ' +
     ' 271, ' +
     ' 270, ' +
     ' ''Y'', ' +
     ' 201, ' +
     ' ''Görme'', ' +
     ' NULL ' +
     ' WHERE ' +
     ' NOT EXISTS ( SELECT 1 FROM "public"."sys_permission" WHERE "id" = 271 AND "parent_id" = 270 AND "perm_type" = ''Y'' AND "perm_id" = 201 AND "perm_def" = ''Görme'' ); ' +
     ' DELETE FROM "public"."sys_permission"     WHERE id=270; ' +
     ' INSERT INTO "public"."sys_permission" ( "id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note" ) SELECT ' +
     ' 270, ' +
     ' 159, ' +
     ' ''M'', ' +
     ' 0, ' +
     ' ''RİSK ANALİZ'', ' +
     ' NULL ' +
     ' WHERE ' +
     ' NOT EXISTS ( SELECT 1 FROM "public"."sys_permission" WHERE "id" = 270 AND "parent_id" = 159 AND "perm_type" = ''M'' AND "perm_id" = 0 AND "perm_def" = ''RİSK ANALİZ'' ); ' +
     ' DELETE FROM "public"."sys_permission"     WHERE id=269; ' +
     ' INSERT INTO "public"."sys_permission" ( "id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note" ) SELECT ' +
     ' 269, ' +
     ' 265, ' +
     ' ''Y'', ' +
     ' 200, ' +
     ' ''Silme'', ' +
     ' NULL ' +
     ' WHERE ' +
     ' NOT EXISTS ( SELECT 1 FROM "public"."sys_permission" WHERE "id" = 269 AND "parent_id" = 265 AND "perm_type" = ''Y'' AND "perm_id" = 200 AND "perm_def" = ''Silme'' ); ' +
     ' DELETE FROM "public"."sys_permission"     WHERE id=268; ' +
     ' INSERT INTO "public"."sys_permission" ( "id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note" ) SELECT ' +
     ' 268, ' +
     ' 265, ' +
     ' ''Y'', ' +
     ' 199, ' +
     ' ''Değiştirme'', ' +
     ' NULL ' +
     ' WHERE ' +
     ' NOT EXISTS ( SELECT 1 FROM "public"."sys_permission" WHERE "id" = 268 AND "parent_id" = 265 AND "perm_type" = ''Y'' AND "perm_id" = 199 AND "perm_def" = ''Değiştirme'' ); ' +
     ' DELETE FROM "public"."sys_permission"     WHERE id=267; ' +
     ' INSERT INTO "public"."sys_permission" ( "id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note" ) SELECT ' +
     ' 267, ' +
     ' 265, ' +
     ' ''Y'', ' +
     ' 198, ' +
     ' ''Ekleme'', ' +
     ' NULL ' +
     ' WHERE ' +
     ' NOT EXISTS ( SELECT 1 FROM "public"."sys_permission" WHERE "id" = 267 AND "parent_id" = 265 AND "perm_type" = ''Y'' AND "perm_id" = 198 AND "perm_def" = ''Ekleme'' ); ' +
     ' DELETE FROM "public"."sys_permission"     WHERE id=266; ' +
     ' INSERT INTO "public"."sys_permission" ( "id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note" ) SELECT ' +
     ' 266, ' +
     ' 265, ' +
     ' ''Y'', ' +
     ' 197, ' +
     ' ''Görme'', ' +
     ' NULL ' +
     ' WHERE ' +
     ' NOT EXISTS ( SELECT 1 FROM "public"."sys_permission" WHERE "id" = 266 AND "parent_id" = 265 AND "perm_type" = ''Y'' AND "perm_id" = 197 AND "perm_def" = ''Görme'' ); ' +
     ' DELETE FROM "public"."sys_permission"     WHERE id=265; ' +
     ' INSERT INTO "public"."sys_permission" ( "id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note" ) SELECT ' +
     ' 265, ' +
     ' 159, ' +
     ' ''M'', ' +
     ' 0, ' +
     ' ''RİSK DEĞERLENDİRME'', ' +
     ' NULL ' +
     ' WHERE ' +
     ' NOT EXISTS ( SELECT 1 FROM "public"."sys_permission" WHERE "id" = 265 AND "parent_id" = 159 AND "perm_type" = ''M'' AND "perm_id" = 0 AND "perm_def" = ''RİSK DEĞERLENDİRME'' ); ' +
      'DELETE FROM "public"."sys_permission" WHERE id=275; ' +
      'INSERT INTO "public"."sys_permission" ("id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note") ' +
      'SELECT 275, 194, ''M'', 0, ''KULLANICI TANIM LOGLARI'', NULL ' +
      'WHERE NOT EXISTS (SELECT 1 FROM "public"."sys_permission" WHERE "id" = 275); ' +
      ' ' +
      'DELETE FROM "public"."sys_permission" WHERE id=276; ' +
      'INSERT INTO "public"."sys_permission" ("id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note") ' +
      'SELECT 276, 275, ''Y'', 205, ''Kullanıcı Tanım Logları Görme'', NULL ' +
      'WHERE NOT EXISTS (SELECT 1 FROM "public"."sys_permission" WHERE "id" = 276); ' +
      ' ' +
      'DELETE FROM "public"."sys_permission" WHERE id=277; ' +
      'INSERT INTO "public"."sys_permission" ("id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note") ' +
      'SELECT 277, 194, ''M'', 0, ''AÇIK RIZA KAYIT LOGLARI'', NULL ' +
      'WHERE NOT EXISTS (SELECT 1 FROM "public"."sys_permission" WHERE "id" = 277); ' +
      ' ' +
      'DELETE FROM "public"."sys_permission" WHERE id=278; ' +
      'INSERT INTO "public"."sys_permission" ("id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note") ' +
      'SELECT 278, 277, ''Y'', 206, ''Açık Rıza Kayıt Logları Görme'', NULL ' +
      'WHERE NOT EXISTS (SELECT 1 FROM "public"."sys_permission" WHERE "id" = 278); ' +
      ' ' +
      'DELETE FROM "public"."sys_permission" WHERE id=279; ' +
      'INSERT INTO "public"."sys_permission" ("id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note") ' +
      'SELECT 279, 194, ''M'', 0, ''VERİ SAHİBİ BAŞVURU LOGLARI'', NULL ' +
      'WHERE NOT EXISTS (SELECT 1 FROM "public"."sys_permission" WHERE "id" = 279); ' +
      ' ' +
      'DELETE FROM "public"."sys_permission" WHERE id=280; ' +
      'INSERT INTO "public"."sys_permission" ("id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note") ' +
      'SELECT 280, 279, ''Y'', 207, ''Veri Sahibi Kayıt Logları Görme'', NULL ' +
      'WHERE NOT EXISTS (SELECT 1 FROM "public"."sys_permission" WHERE "id" = 280); ' +




     ' DELETE FROM "public"."sys_permission"     WHERE id=264; ' +
     ' INSERT INTO "public"."sys_permission" ( "id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note" ) SELECT ' +
     ' 264, ' +
     ' 261, ' +
     ' ''Y'', ' +
     ' 196, ' +
     ' ''Değiştirme'', ' +
     ' NULL ' +
     ' WHERE ' +
     ' NOT EXISTS ( SELECT 1 FROM "public"."sys_permission" WHERE "id" = 264 AND "parent_id" = 261 AND "perm_type" = ''Y'' AND "perm_id" = 196 AND "perm_def" = ''Değiştirme'' ); ' +
     ' DELETE FROM "public"."sys_permission"     WHERE id=263; ' +
     ' INSERT INTO "public"."sys_permission" ( "id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note" ) SELECT ' +
     ' 263, ' +
     ' 261, ' +
     ' ''Y'', ' +
     ' 195, ' +
     ' ''Ekleme'', ' +
     ' NULL ' +
     ' WHERE ' +
     ' NOT EXISTS ( SELECT 1 FROM "public"."sys_permission" WHERE "id" = 263 AND "parent_id" = 261 AND "perm_type" = ''Y'' AND "perm_id" = 195 AND "perm_def" = ''Ekleme'' ); ' +
     ' DELETE FROM "public"."sys_permission"     WHERE id=262; ' +
     ' INSERT INTO "public"."sys_permission" ( "id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note" ) SELECT ' +
     ' 262, ' +
     ' 261, ' +
     ' ''Y'', ' +
     ' 194, ' +
     ' ''Görme'', ' +
     ' NULL ' +
     ' WHERE ' +
     ' NOT EXISTS ( SELECT 1 FROM "public"."sys_permission" WHERE "id" = 262 AND "parent_id" = 261 AND "perm_type" = ''Y'' AND "perm_id" = 194 AND "perm_def" = ''Görme'' ); ' +
     ' DELETE FROM "public"."sys_permission"     WHERE id=261; ' +
     ' INSERT INTO "public"."sys_permission" ( "id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note" ) SELECT ' +
     ' 261, ' +
     ' 159, ' +
     ' ''M'', ' +
     ' 0, ' +
     ' ''RİSK TANIMLAMALARI'', ' +
     ' NULL ' +
     ' WHERE ' +
     ' NOT EXISTS ( SELECT 1 FROM "public"."sys_permission" WHERE "id" = 261 AND "parent_id" = 159 AND "perm_type" = ''M'' AND "perm_id" = 0 AND "perm_def" = ''RİSK TANIMLAMALARI'' ); ' +
     //////////////  20.02.2025 eklendi
     'DELETE FROM "public"."sys_permission" WHERE id=275; ' +
     'INSERT INTO "public"."sys_permission" ("id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note") ' +
     'SELECT 275, 194, ''M'', 0, ''KULLANICI TANIM LOGLARI'', NULL ' +
     'WHERE NOT EXISTS (SELECT 1 FROM "public"."sys_permission" WHERE "id" = 275); ' +
     ' ' +
     'DELETE FROM "public"."sys_permission" WHERE id=276; ' +
     'INSERT INTO "public"."sys_permission" ("id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note") ' +
     'SELECT 276, 275, ''Y'', 205, ''Kullanıcı Tanım Logları Görme'', NULL ' +
     'WHERE NOT EXISTS (SELECT 1 FROM "public"."sys_permission" WHERE "id" = 276); ' +
     ' ' +
     'DELETE FROM "public"."sys_permission" WHERE id=277; ' +
     'INSERT INTO "public"."sys_permission" ("id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note") ' +
     'SELECT 277, 194, ''M'', 0, ''AÇIK RIZA KAYIT LOGLARI'', NULL ' +
     'WHERE NOT EXISTS (SELECT 1 FROM "public"."sys_permission" WHERE "id" = 277); ' +
     ' ' +
     'DELETE FROM "public"."sys_permission" WHERE id=278; ' +
     'INSERT INTO "public"."sys_permission" ("id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note") ' +
     'SELECT 278, 277, ''Y'', 206, ''Açık Rıza Kayıt Logları Görme'', NULL ' +
     'WHERE NOT EXISTS (SELECT 1 FROM "public"."sys_permission" WHERE "id" = 278); ' +
     ' ' +
     'DELETE FROM "public"."sys_permission" WHERE id=279; ' +
     'INSERT INTO "public"."sys_permission" ("id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note") ' +
     'SELECT 279, 194, ''M'', 0, ''VERİ SAHİBİ BAŞVURU LOGLARI'', NULL ' +
     'WHERE NOT EXISTS (SELECT 1 FROM "public"."sys_permission" WHERE "id" = 279); ' +
     ' ' +
     'DELETE FROM "public"."sys_permission" WHERE id=280; ' +
     'INSERT INTO "public"."sys_permission" ("id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note") ' +
     'SELECT 280, 279, ''Y'', 207, ''Veri Sahibi Kayıt Logları Görme'', NULL ' +
     'WHERE NOT EXISTS (SELECT 1 FROM "public"."sys_permission" WHERE "id" = 280); ' +

     ///////////////
     ' INSERT INTO "public"."sys_modul_parameter" ( "module", "main_parameter", "parameter", "description", "subid", "val2", "val3", "val4" ) SELECT ' +
     ' * ' +
     ' FROM ' +
     ' ( ' +
     ' VALUES ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK ETKİ'', ''ÇOK YÜKSEK ETKİ'', ''ÇOK YÜKSEK ETKİ'', 5, ''5'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK FARKEDİLME'', ''1 - ÇOK YÜKSEK HEMEN FARK EDİLİR'', ''1 - ÇOK YÜKSEK HEMEN FARK EDİLİR'', 1, ''1'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK OLASILIK FK'', ''10 - KESİN'', ''10 - KESİN'', 6, ''10'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK KATEGORİ'', ''OPERASYONEL'', ''OPERASYONEL'', 1, ''1'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK KATEGORİ'', ''BİLGİ GÜVENLİĞİ'', ''BİLGİ GÜVENLİĞİ'', 2, ''2'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK KATEGORİ'', ''YASAL'', ''YASAL'', 3, ''3'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK FARKEDİLME'', ''2 - YÜKSEK GENELDE FARK EDİLİR'', ''2 - YÜKSEK GENELDE FARK EDİLİR'', 2, ''2'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK FARKEDİLME'', ''3 - ORTA ÇOĞU DURUMDA FARK EDİLİR'', ''3 - ORTA ÇOĞU DURUMDA FARK EDİLİR'', 3, ''3'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK FARKEDİLME'', ''4 - DÜŞÜK NADİREN FARK EDİLİR'', ''4 - DÜŞÜK NADİREN FARK EDİLİR'', 4, ''4'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK FARKEDİLME'', ''5 - ÇOK DÜŞÜK HİÇ FARK EDİLMEZ'', ''5 - ÇOK DÜŞÜK HİÇ FARK EDİLMEZ'', 5, ''5'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK OLASILIK FK'', ''0.2 - BEKLENMEZ'', ''0.2 - BEKLENMEZ'', 1, ''0.2'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK OLASILIK FK'', ''0.5 - BEKLENMEZ FAKAT MÜMKÜN'', ''0.5 - BEKLENMEZ FAKAT MÜMKÜN'', 2, ''0.5'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK OLASILIK FK'', ''1 - MÜMKÜN FAKAT DÜŞÜK'', ''1 - MÜMKÜN FAKAT DÜŞÜK'', 3, ''1'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK OLASILIK FK'', ''3 - OLASI'', ''3 - OLASI'', 4, ''3'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK OLASILIK FK'', ''6 - YÜKSEK'', ''6 - YÜKSEK'', 5, ''6'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK SEVİYESİ'', ''KABUL EDİLEBİLİR RİSK'', ''KABUL EDİLEBİLİR RİSK'', 2, ''2'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK SEVİYESİ'', ''ORTA RİSK'', ''ORTA RİSK'', 3, ''3'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK SEVİYESİ'', ''YÜKSEK RİSK'', ''YÜKSEK RİSK'', 4, ''4'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK SEVİYESİ'', ''KRİTİK RİSK'', ''KRİTİK RİSK'', 5, ''5'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK SEVİYESİ'', ''DÜŞÜK RİSK'', ''DÜŞÜK RİSK'', 1, ''1'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK FREKANS FK'', ''0.5 - ÇOK SEYREK (YILDA BİR VEYA DAHA SEYREK)'', ''0.5 - ÇOK SEYREK (YILDA BİR VEYA DAHA SEYREK)'', 1, ''0,5'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK FREKANS FK'', ''1 - SEYREK (YILDA BİRKAÇ DEFA)'', ''1 - SEYREK (YILDA BİRKAÇ DEFA)'', 2, ''1'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK FREKANS FK'', ''2 - SIK DEĞİL (AYDA BİR VEYA BİRKAÇ DEFA)'', ''2 - SIK DEĞİL (AYDA BİR VEYA BİRKAÇ DEFA)'', 3, ''2'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK HESAP METOT'', ''L TİPİ MATRİS'', ''L TİPİ MATRİS'', 1, ''1'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK HESAP METOT'', ''FMEA'', ''FMEA'', 2, ''2'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK HESAP METOT'', ''FINE-KINNEY'', ''FINE-KINNEY'', 3, ''3'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK OLASILIK'', ''ÇOK DÜŞÜK OLASILIK'', ''ÇOK DÜŞÜK OLASILIK'', 1, ''1'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK OLASILIK'', ''DÜŞÜK OLASILIK'', ''DÜŞÜK OLASILIK'', 2, ''2'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK OLASILIK'', ''ORTA OLASILIK'', ''ORTA OLASILIK'', 3, ''3'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK OLASILIK'', ''YÜKSEK OLASILIK'', ''YÜKSEK OLASILIK'', 4, ''4'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK OLASILIK'', ''ÇOK YÜKSEK OLASILIK'', ''ÇOK YÜKSEK OLASILIK'', 5, ''5'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK FREKANS FK'', ''3 - ARA SIRA (HAFTADA BİR VEYA BİRKAÇ DEFA)'', ''3 - ARA SIRA (HAFTADA BİR VEYA BİRKAÇ DEFA)'', 4, ''3'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK ETKİ'', ''ÇOK DÜŞÜK ETKİ'', ''ÇOK DÜŞÜK ETKİ'', 1, ''1'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK ETKİ'', ''DÜŞÜK ETKİ'', ''DÜŞÜK ETKİ'', 2, ''2'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK ETKİ'', ''ORTA ETKİ'', ''ORTA ETKİ'', 3, ''3'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK ETKİ'', ''YÜKSEK ETKİ'', ''YÜKSEK ETKİ'', 4, ''4'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK FREKANS FK'', ''6 - SIK (GÜNDE BİR VEYA BİRKAÇ DEFA)'', ''6 - SIK (GÜNDE BİR VEYA BİRKAÇ DEFA)'', 5, ''6'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK FREKANS FK'', ''10 - HEMEN SÜREKLİ TEKRAR'', ''10 - HEMEN SÜREKLİ TEKRAR'', 6, ''10'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK ETKİ FK'', ''15 - ÇOK BÜYÜK (ÖNEMLİ İŞ SÜREÇLERİNİN DURMASI, MÜŞTERİ ETKİSİ)'', ''15 - ÇOK BÜYÜK (ÖNEMLİ İŞ SÜREÇLERİNİN DURMASI, MÜŞTERİ ETKİSİ)'', 5, ''15'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK ETKİ FK'', ''1 - ÖNEMSİZ (HİÇBİR ETKİ YOK, OPERASYON ETKİLENMEZ)'', ''1 - ÖNEMSİZ (HİÇBİR ETKİ YOK, OPERASYON ETKİLENMEZ)'', 1, ''1'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK ETKİ FK'', ''3 - KÜÇÜK (GEÇİCİ HİZMET KESİNTİSİ, MİNİMAL VERİ KAYBI)'', ''3 - KÜÇÜK (GEÇİCİ HİZMET KESİNTİSİ, MİNİMAL VERİ KAYBI)'', 2, ''3'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK ETKİ FK'', ''5 - ORTA (KISA SÜRELİ HİZMET KAYBI, KÜÇÜK BİR VERİ İHLALİ)'', ''5 - ORTA (KISA SÜRELİ HİZMET KAYBI, KÜÇÜK BİR VERİ İHLALİ)'', 3, ''5'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK ETKİ FK'', ''10 - BÜYÜK (SİSTEMLERİN DURMASI, HASSAS VERİLERİN KAYBI)'', ''10 - BÜYÜK (SİSTEMLERİN DURMASI, HASSAS VERİLERİN KAYBI)'', 4, ''10'', NULL, NULL ), ' +
     ' ( ''RİSK ANALİZİ'', ''RİSK ETKİ FK'', ''100 - KRİTİK (BÜYÜK VERİ İHLALİ, İTİBAR KAYBI, CEZAİ YAPTIRIM RİSKİ)'', ''100 - KRİTİK (BÜYÜK VERİ İHLALİ, İTİBAR KAYBI, CEZAİ YAPTIRIM RİSKİ)'', 6, ''100'', NULL, NULL ) ' +
     ' ) AS TEMP ( "module", "main_parameter", "parameter", "description", "subid", "val2", "val3", "val4" ) ' +
     ' WHERE ' +
     ' NOT EXISTS ( ' +
     ' SELECT ' +
     ' 1 ' +
     ' FROM ' +
     ' "public"."sys_modul_parameter" AS sp ' +
     ' WHERE ' +
     ' sp."module" = TEMP."module" ' +
     ' AND sp."main_parameter" = TEMP."main_parameter" ' +
     ' AND sp."parameter" = TEMP."parameter" ' +
     ' AND sp."subid" = TEMP."subid" ' +
     ' ); ' +
     '  ' +
     ' END $$; '  ;

//     StringList := TStringList.Create;
//      try
//        StringList.Add(str);
//        StringList.SaveToFile('C:\sqlscript.txt');
//      finally
//        StringList.Free;
//      end;
    try
     QueryExec(query,str );
    except
      ;
    end;


     str := ' DO $$ ' +
     ' BEGIN ' +
     ' IF NOT EXISTS (SELECT FROM information_schema.tables WHERE table_name = ''def_data_ihlal'') THEN ' +
     ' CREATE TABLE public.def_data_ihlal ( ' +
     ' id int4 NOT NULL, ' +
     ' mc_id int4, ' +
     ' baslangic_tarihi timestamp(6), ' +
     ' bitis_tarihi timestamp(6), ' +
     ' tespit_tarihi timestamp(6), ' +
     ' veri_isleyen varchar(255), ' +
     ' veri_isleyen_adresi varchar(1000), ' +
     ' ihlal_kaynagi_genel varchar(255) , ' +
     ' ihlal_kaynagi_siber_saldiri varchar(255) , ' +
     ' ihlal_etkisi varchar(255) , ' +
     ' ihlal_tespiti varchar(1000) , ' +
     ' etkilenen_kisi_sayisi int4, ' +
     ' etkilenen_kayit_sayisi int4, ' +
     ' ihlal_icerigi varchar(1000), ' +
     ' kullanici_gorev_unvan varchar(255), '+
     ' vs_bildirim_tarihi timestamp(6), '+
     ' kisisel_veri_ihlali char(1), '+
     ' idy int4, ' +
     ' idt timestamp(6), ' +
     ' sdy int4, ' +
     ' sdt timestamp(6), ' +
     ' CONSTRAINT data_ihlal_pkey PRIMARY KEY (id) ' +
     ' ); ' +
     ' END IF; ' +
     '  ' +
     ' IF NOT EXISTS (SELECT FROM pg_class WHERE relname = ''sq_def_data_ihlal_id'') THEN ' +
     ' CREATE SEQUENCE sq_def_data_ihlal_id; ' +
     ' END IF; ' +
     '  ' +
     ' IF NOT EXISTS(SELECT FROM information_schema.tables WHERE table_name = ''def_data_ihlal_surec_eslesme'') THEN ' +
     ' CREATE TABLE public.def_data_ihlal_surec_eslesme ( ' +
     ' id int4 NOT NULL, ' +
     ' mc_id int4, ' +
     ' ihlal_id int4, ' +
     ' surec_id int4, ' +
     ' kaynak_ids varchar(255) , ' +
     ' ilgili_kisi_ids varchar(255), '+
     ' idy int4, ' +
     ' idt timestamp(6), ' +
     ' sdy int4, ' +
     ' sdt timestamp(6), ' +
     ' CONSTRAINT def_data_ihlal_surec_eslesme_pkey PRIMARY KEY (id) ' +
     ' ); ' +
     ' END IF; ' +
     '  ' +
     ' IF NOT EXISTS (SELECT FROM pg_class WHERE relname = ''sq_def_data_ihlal_bildirim_id'') THEN ' +
     ' CREATE SEQUENCE sq_def_data_ihlal_bildirim_id; ' +
     ' END IF; ' +
     ' '+
     ' IF NOT EXISTS (SELECT FROM pg_class WHERE relname = ''sq_def_data_ihlal_surec_eslesme_id'') THEN ' +
     ' CREATE SEQUENCE sq_def_data_ihlal_surec_eslesme_id; ' +
     ' END IF; ' +
     '  ' +
     ' END $$; ' ;

//     StringList := TStringList.Create;
//      try
//        StringList.Add(str);
//        StringList.SaveToFile('C:\sqlscript.txt');
//      finally
//        StringList.Free;
//      end;

    try
     QueryExec(query,str );
    except
      ;
    end;
    // ihlal tablosu eksik kolonlar
    str :=' DO $$ ' +
    ' BEGIN ' +
    '  ' +
    ' IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = ''def_data_ihlal'' AND column_name = ''ihlal_kaynagi_aciklama'') THEN ' +
    ' ALTER TABLE public.def_data_ihlal ADD COLUMN ihlal_kaynagi_aciklama varchar(1000) COLLATE "pg_catalog"."default"; ' +
    ' END IF; ' +
    '  ' +
    ' IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = ''def_data_ihlal'' AND column_name = ''ihlal_etki_aciklama'') THEN ' +
    ' ALTER TABLE public.def_data_ihlal ADD COLUMN ihlal_etki_aciklama varchar(1000) COLLATE "pg_catalog"."default"; ' +
    ' END IF; ' +
    '  ' +
    ' IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = ''def_data_ihlal'' AND column_name = ''ihlal_etki_kisigrup_aciklama'') THEN ' +
    ' ALTER TABLE public.def_data_ihlal ADD COLUMN ihlal_etki_kisigrup_aciklama varchar(1000) COLLATE "pg_catalog"."default"; ' +
    ' END IF; ' +
    '  ' +
    ' IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = ''def_data_ihlal'' AND column_name = ''ihlal_etki_ilgili_kisi_aciklama'') THEN ' +
    ' ALTER TABLE public.def_data_ihlal ADD COLUMN ihlal_etki_ilgili_kisi_aciklama varchar(1000) COLLATE "pg_catalog"."default"; ' +
    ' END IF; ' +
    '  ' +
    ' IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = ''def_data_ihlal'' AND column_name = ''ihlal_etki_ilgili_kisi'') THEN ' +
    ' ALTER TABLE public.def_data_ihlal ADD COLUMN ihlal_etki_ilgili_kisi varchar(255) COLLATE "pg_catalog"."default"; ' +
    ' END IF; ' +
    '  ' +
    ' IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = ''def_data_ihlal'' AND column_name = ''olasi_kisisel_sonuc'') THEN ' +
    ' ALTER TABLE public.def_data_ihlal ADD COLUMN olasi_kisisel_sonuc int4; ' +
    ' END IF; ' +
    '  ' +
    ' IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = ''def_data_ihlal'' AND column_name = ''olasi_kisisel_sonuc_aciklama'') THEN ' +
    ' ALTER TABLE public.def_data_ihlal ADD COLUMN olasi_kisisel_sonuc_aciklama varchar(300) COLLATE "pg_catalog"."default"; ' +
    ' END IF; ' +
    '  ' +
    ' IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = ''def_data_ihlal'' AND column_name = ''olasi_kurumsal_sonuc'') THEN ' +
    ' ALTER TABLE public.def_data_ihlal ADD COLUMN olasi_kurumsal_sonuc int4; ' +
    ' END IF; ' +
    '  ' +
    ' IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = ''def_data_ihlal'' AND column_name = ''olasi_kurumsal_sonuc_aciklama'') THEN ' +
    ' ALTER TABLE public.def_data_ihlal ADD COLUMN olasi_kurumsal_sonuc_aciklama varchar(300) COLLATE "pg_catalog"."default"; ' +
    ' END IF; ' +
    '  ' +
    ' IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = ''def_data_ihlal'' AND column_name = ''personel_egitimi'') THEN ' +
    ' ALTER TABLE public.def_data_ihlal ADD COLUMN personel_egitimi varchar(1000) COLLATE "pg_catalog"."default"; ' +
    ' END IF; ' +
    '  ' +
    ' IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = ''def_data_ihlal'' AND column_name = ''teknik_tedbir_ihlal_oncesi'') THEN ' +
    ' ALTER TABLE public.def_data_ihlal ADD COLUMN teknik_tedbir_ihlal_oncesi varchar(1000) COLLATE "pg_catalog"."default"; ' +
    ' END IF; ' +
    '  ' +
    ' IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = ''def_data_ihlal'' AND column_name = ''idari_tedbir_ihlal_oncesi'') THEN ' +
    ' ALTER TABLE public.def_data_ihlal ADD COLUMN idari_tedbir_ihlal_oncesi varchar(1000) COLLATE "pg_catalog"."default"; ' +
    ' END IF; ' +
    '  ' +
    ' IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = ''def_data_ihlal'' AND column_name = ''teknik_tedbir_ihlal_sonrasi'') THEN ' +
    ' ALTER TABLE public.def_data_ihlal ADD COLUMN teknik_tedbir_ihlal_sonrasi varchar(1000) COLLATE "pg_catalog"."default"; ' +
    ' END IF; ' +
    '  ' +
    ' IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = ''def_data_ihlal'' AND column_name = ''idari_tedbir_ihlal_sonrasi'') THEN ' +
    ' ALTER TABLE public.def_data_ihlal ADD COLUMN idari_tedbir_ihlal_sonrasi varchar(1000) COLLATE "pg_catalog"."default"; ' +
    ' END IF; ' +
    '  ' +
    ' IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = ''def_data_ihlal'' AND column_name = ''ihlal_etkis_sayi_aciklama'') THEN ' +
    ' ALTER TABLE public.def_data_ihlal ADD COLUMN ihlal_etkis_sayi_aciklama varchar(1000) COLLATE "pg_catalog"."default"; ' +
    ' END IF; ' +
    '  ' +
    ' IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = ''def_data_ihlal'' AND column_name = ''kullanici_gorev_unvan'') THEN ' +
    ' ALTER TABLE public.def_data_ihlal ADD COLUMN kullanici_gorev_unvan varchar(255) COLLATE "pg_catalog"."default"; ' +
    ' END IF; ' +
    '  ' +
    ' IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = ''def_data_ihlal'' AND column_name = ''vs_bildirim_tarihi'') THEN ' +
    ' ALTER TABLE public.def_data_ihlal ADD COLUMN vs_bildirim_tarihi timestamp(6) ; ' +
    ' END IF; ' +
    '  ' +
    ' IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = ''def_data_ihlal'' AND column_name = ''kisisel_veri_ihlali'') THEN ' +
    ' ALTER TABLE public.def_data_ihlal ADD COLUMN kisisel_veri_ihlali char(1); ' +
    ' END IF; ' +
    '  ' +
    ' END $$; ' ;
     try
     QueryExec(query,str );
    except
      ;
    end;
    // ihlal bildirim tablosu oluşturma
    str := ' CREATE TABLE IF NOT EXISTS public.def_data_ihlal_bildirim ( ' +
    ' id SERIAL PRIMARY KEY, ' +
    ' ihlal_id INT, ' +
    ' mc_id INT, ' +
    ' bildirim_tarihi TIMESTAMP(6), ' +
    ' bildirim_yontemi VARCHAR(500), ' +
    ' bilgi_alma_yontemi VARCHAR(500), ' +
    ' yurtici_kurum_bildirim VARCHAR(1), ' +
    ' yurtdisi_kurum_bildirim VARCHAR(1), ' +
    ' yurtdisi_bildirim_aciklama varchar(500), '+
    ' yurtici_bildirim_aciklama varchar(500) , '+
    ' idy INT, ' +
    ' idt TIMESTAMP(6), ' +
    ' sdy INT, ' +
    ' sdt TIMESTAMP(6), ' +
    ' gec_bildirim_nedeni VARCHAR(500), ' +
    ' bildirim_yapildimi VARCHAR(1), ' +
    ' bildirim_yapildimi_aciklama VARCHAR(500) ' +
    ' ); ' ;

     try
     QueryExec(query,str );
    except
      ;
    end;
    // ihlal bildirim eksik kolonlar
      str := ' DO $$ ' +
      ' BEGIN ' +
      '  ' +
      ' IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = ''def_data_ihlal_bildirim'' AND column_name = ''yurtdisi_bildirim_aciklama'') THEN ' +
      ' ALTER TABLE public.def_data_ihlal_bildirim ADD COLUMN yurtdisi_bildirim_aciklama varchar(500) COLLATE "pg_catalog"."default"; ' +
      ' END IF; ' +
      '  ' +
      ' IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = ''def_data_ihlal_bildirim'' AND column_name = ''yurtici_bildirim_aciklama'') THEN ' +
      ' ALTER TABLE public.def_data_ihlal_bildirim ADD COLUMN yurtici_bildirim_aciklama varchar(500) COLLATE "pg_catalog"."default"; ' +
      ' END IF; ' +
      '  ' +
      ' END $$; ' ;
    try
     QueryExec(query,str );
    except
      ;
    end;

    // ihlal eşleşme eksik kolonlar
    str := ' DO $$ ' +
    ' BEGIN ' +
    '  ' +
    ' IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = ''def_data_ihlal_surec_eslesme'' AND column_name = ''ilgili_kisi_ids'') THEN ' +
    ' ALTER TABLE public.def_data_ihlal_surec_eslesme ADD COLUMN ilgili_kisi_ids varchar(255) COLLATE "pg_catalog"."default"; ' +
    ' END IF; ' +
    '  ' +
    ' END $$; ' ;

    try
     QueryExec(query,str );
    except
      ;
    end;

     // ihlal olayları için sys_modul_parametrelerinin oluşturulması
    str := ' DO $$ ' +
    ' BEGIN ' +
    ' IF NOT EXISTS ( ' +
    ' SELECT FROM information_schema.tables ' +
    ' WHERE table_schema = ''public'' ' +
    ' AND table_name = ''sys_modul_parameter'' ' +
    ' ) THEN ' +
    ' CREATE TABLE public.sys_modul_parameter ( ' +
    ' module VARCHAR(255), ' +
    ' main_parameter VARCHAR(255), ' +
    ' parameter VARCHAR(255), ' +
    ' description TEXT, ' +
    ' subid INT, ' +
    ' val2 VARCHAR(255), ' +
    ' val3 VARCHAR(255), ' +
    ' val4 VARCHAR(255), ' +
    ' PRIMARY KEY (module, main_parameter, parameter, subid) ' +
    ' ); ' +
    ' END IF; ' +
    '  ' +
    ' INSERT INTO public.sys_modul_parameter (module, main_parameter, parameter, description, subid, val2, val3, val4) ' +
    ' SELECT * FROM (VALUES ' +
    ' (''İHLAL OLAY'', ''KİŞİSEL ETKİ'', ''FİNANSAL KAYIP'', '''', 6, NULL, NULL, NULL), ' +
    ' (''İHLAL OLAY'', ''KİŞİSEL ETKİ'', ''İTİBAR KAYBI'', '''', 7, NULL, NULL, NULL), ' +
    ' (''İHLAL OLAY'', ''VERİ ETKİ'', ''VERİ GİZLİLİĞİ'', NULL, 1, NULL, NULL, NULL), ' +
    ' (''İHLAL OLAY'', ''KİŞİSEL ETKİ'', ''KİŞİSEL VERİLERİN GÜVENLİĞİ KAYBI'', '''', 8, NULL, NULL, NULL), ' +
    ' (''İHLAL OLAY'', ''VERİ ETKİ'', ''VERİ BÜTÜNLÜĞÜ'', NULL, 2, NULL, NULL, NULL), ' +
    ' (''İHLAL OLAY'', ''VERİ ETKİ'', ''VERİYE ERİŞİM/ULAŞABİLİRLİK'', NULL, 3, NULL, NULL, NULL), ' +
    ' (''İHLAL OLAY'', ''İHLAL KAYNAĞI'', ''BELGE/CİHAZ HIRSIZLIĞI VEYA KAYBOLMASI'', NULL, 1, NULL, NULL, NULL), ' +
    ' (''İHLAL OLAY'', ''İHLAL KAYNAĞI'', ''VERİLERİN GÜVENSİZ ORTAMDA DEPOLANMASI'', NULL, 2, NULL, NULL, NULL), ' +
    ' (''İHLAL OLAY'', ''KİŞİSEL ETKİ'', ''KİMLİK HIRSIZLIĞI'', '''', 2, NULL, NULL, NULL), ' +
    ' (''İHLAL OLAY'', ''KİŞİSEL ETKİ'', ''AYRIMCILIK'', '''', 3, NULL, NULL, NULL), ' +
    ' (''İHLAL OLAY'', ''KİŞİSEL ETKİ'', ''HAKLARIN KISITLANMASI'', '''', 4, NULL, NULL, NULL), ' +
    ' (''İHLAL OLAY'', ''KİŞİSEL ETKİ'', ''DOLANDIRICILIK'', '''', 5, NULL, NULL, NULL), ' +
    ' (''İHLAL OLAY'', ''İHLAL KAYNAĞI'', ''SABOTAJ'', NULL, 3, NULL, NULL, NULL), ' +
    ' (''İHLAL OLAY'', ''İHLAL KAYNAĞI'', ''KAZA/İHMAL'', NULL, 4, NULL, NULL, NULL), ' +
    ' (''İHLAL OLAY'', ''İHLAL KAYNAĞI'', ''DİĞER'', NULL, 5, NULL, NULL, NULL), ' +
    ' (''İHLAL OLAY'', ''SİBER SALDIRI'', ''ZARARLI YAZILIMLAR'', NULL, 1, NULL, NULL, NULL), ' +
    ' (''İHLAL OLAY'', ''SİBER SALDIRI'', ''SOSYAL MÜHENDİSLİK'', NULL, 2, NULL, NULL, NULL), ' +
    ' (''İHLAL OLAY'', ''SİBER SALDIRI'', ''HİZMET DIŞI BIRAKMA (dos-DDos)'', NULL, 3, NULL, NULL, NULL), ' +
    ' (''İHLAL OLAY'', ''SİBER SALDIRI'', ''FİDYE YAZILIMI (RANSOMWARE)'', NULL, 4, NULL, NULL, NULL), ' +
    ' (''İHLAL OLAY'', ''SİBER SALDIRI'', ''PAROLA SALDIRISI (BRUTE-FORCE ATTACK)'', NULL, 5, NULL, NULL, NULL), ' +
    ' (''İHLAL OLAY'', ''SİBER SALDIRI'', ''DİĞER'', NULL, 6, NULL, NULL, NULL), ' +
    ' (''RİSK ANALİZİ'', ''RİSK SEVİYESİ'', ''DÜŞÜK RİSK'', ''DÜŞÜK RİSK'', 1, ''1'', ''0'', ''200''), ' +
    ' (''RİSK ANALİZİ'', ''RİSK SEVİYESİ'', ''KABUL EDİLEBİLİR RİSK'', ''KABUL EDİLEBİLİR RİSK'', 2, ''2'', ''201'', NULL) ' +
    ' ) AS t(module, main_parameter, parameter, description, subid, val2, val3, val4) ' +
    ' WHERE NOT EXISTS ( ' +
    ' SELECT 1 FROM public.sys_modul_parameter p ' +
    ' WHERE p.module = t.module ' +
    ' AND p.main_parameter = t.main_parameter ' +
    ' AND p.parameter = t.parameter ' +
    ' AND p.subid = t.subid ' +
    ' ); '  +
    ' END $$; '     ;
    try
     QueryExec(query,str );
    except
      ;
    end;
    // data_ihlal_dokuman tablo oluşturma

    str := ' DO $$ ' +
    ' BEGIN ' +
    ' IF NOT EXISTS(SELECT FROM information_schema.tables WHERE table_name = ''data_ihlal_dokuman'') THEN ' +
    ' CREATE TABLE public.data_ihlal_dokuman ( ' +
    ' id int4 PRIMARY KEY, ' +
    ' mc_id int4, ' +
    ' ihlal_id int4, ' +
    ' konu varchar(100) , ' +
    ' dosya_adi varchar(100) , ' +
    ' file bytea ' +
    ' ); ' +
    ' END IF; ' +
    ' IF NOT EXISTS (SELECT FROM pg_class WHERE relname = ''sq_data_ihlal_dokuman_id'') THEN ' +
    ' CREATE SEQUENCE sq_data_ihlal_dokuman_id; ' +
    ' END IF; ' +
    '  ' +
    ' END $$; ' ;

    try
     QueryExec(query,str );
    except
      ;
    end;

        // usr_user log tanimlama
     str := ' CREATE SEQUENCE IF NOT EXISTS kvknet_log.sq_log_usr_user_log_id ';

    try
     QueryExec(query,str );
    except
      ;
    end;

     str := ' CREATE TABLE IF NOT EXISTS kvknet_log.log_usr_user ( ' +
     ' log_id INT NOT NULL DEFAULT nextval(''kvknet_log.sq_log_usr_user_log_id''), ' +
     ' log_tarih TIMESTAMP(6), ' +
     ' log_islem CHAR(1), ' +
     ' log_kullanici_id INT, ' +
     ' log_kullanici_ip VARCHAR(15), ' +
     ' "id" integer, "gc_id" integer, ' +
     ' "mc_id" integer, "user_name" character varying, "user_pwd" character varying, ' +
     '  "active" character varying, "full_name" character varying, "idy" integer, ' +
     '  "idt" timestamp without time zone, "sdy" integer, "sdt" timestamp without time zone, ' +
     '  "rol" character varying, "list_mc" character varying, "list_dept" character varying, ' +
     '  "email" character varying, "phone" character varying, "ldap_user_name" character varying, ' +
     '  "ubys_id" integer,  PRIMARY KEY (log_id)  ) '   ;

    try
     QueryExec(query,str );
    except
      ;
    end;

     str :=  ' CREATE OR REPLACE FUNCTION prc_log_usr_user() RETURNS trigger AS $$ ' +
     ' DECLARE ' +
     ' user_id INTEGER; ' +
     ' user_ip VARCHAR; ' +
     ' log_islem CHAR(1); ' +
     ' BEGIN ' +
     ' log_islem = SUBSTRING(TG_OP, 1, 1); ' +
     ' SELECT current_setting(''KVKNET.USER_ID'', true)::INTEGER, ' +
     ' current_setting(''KVKNET.USER_IP'', true) ' +
     ' INTO user_id, user_ip; ' +
     ' IF (log_islem = ''I'') THEN ' +
     ' INSERT INTO kvknet_log.log_usr_user (log_tarih, log_islem, log_kullanici_id, log_kullanici_ip, id, gc_id, mc_id, user_name, user_pwd, active, full_name, idy, idt, sdy, sdt, rol, list_mc, list_dept, email, phone, ldap_user_name, ubys_id) ' +
     ' VALUES (now(), ''I'', user_id, user_ip, NEW.id, NEW.gc_id, NEW.mc_id, NEW.user_name, NEW.user_pwd, NEW.active, NEW.full_name, NEW.idy, NEW.idt, NEW.sdy, NEW.sdt, NEW.rol, NEW.list_mc, NEW.list_dept, NEW.email, NEW.phone, NEW.ldap_user_name, NEW.ubys_id); ' +
     ' ELSIF (log_islem = ''D'') THEN ' +
     ' INSERT INTO kvknet_log.log_usr_user (log_tarih, log_islem, log_kullanici_id, log_kullanici_ip, id, gc_id, mc_id, user_name, user_pwd, active, full_name, idy, idt, sdy, sdt, rol, list_mc, list_dept, email, phone, ldap_user_name, ubys_id) ' +
     ' VALUES (now(), ''D'', user_id, user_ip, OLD.id, OLD.gc_id, OLD.mc_id, OLD.user_name, OLD.user_pwd, OLD.active, OLD.full_name, OLD.idy, OLD.idt, OLD.sdy, OLD.sdt, OLD.rol, OLD.list_mc, OLD.list_dept, OLD.email, OLD.phone, OLD.ldap_user_name, OLD.ubys_id); ' +
     ' ELSIF (log_islem = ''U'') THEN ' +
     ' INSERT INTO kvknet_log.log_usr_user (log_tarih, log_islem, log_kullanici_id, log_kullanici_ip, id, gc_id, mc_id, user_name, user_pwd, active, full_name, idy, idt, sdy, sdt, rol, list_mc, list_dept, email, phone, ldap_user_name, ubys_id) ' +
     ' VALUES (now(), ''U'', user_id, user_ip, OLD.id, OLD.gc_id, OLD.mc_id, OLD.user_name, OLD.user_pwd, OLD.active, OLD.full_name, OLD.idy, OLD.idt, OLD.sdy, OLD.sdt, OLD.rol, OLD.list_mc, OLD.list_dept, OLD.email, OLD.phone, OLD.ldap_user_name, OLD.ubys_id); ' +
     ' END IF; ' +
     ' RETURN NULL; ' +
     ' END; ' +
     ' $$ LANGUAGE plpgsql ' ;

    try
     QueryExec(query,str );
    except
      ;
    end;

     str := ' DO $$ ' +
     ' BEGIN ' +
     ' IF NOT EXISTS ( ' +
     ' SELECT 1 FROM information_schema.triggers ' +
     ' WHERE trigger_name = ''trg_log_usr_user'' ' +
     ' AND event_object_table = ''usr_user'' ' +
     ' ) THEN ' +
     ' CREATE TRIGGER trg_log_usr_user ' +
     ' AFTER INSERT OR UPDATE OR DELETE ON public.usr_user ' +
     ' FOR EACH ROW ' +
     ' EXECUTE FUNCTION prc_log_usr_user(); ' +
     ' END IF; ' +
     ' END $$; ';

    try
     QueryExec(query,str );
    except
      ;
    end;

    // acik_riza log tanimlama
     str := ' CREATE SEQUENCE IF NOT EXISTS kvknet_log.sq_log_data_acikriza_log_id ' ;

    try
     QueryExec(query,str );
    except
      ;
    end;

     str := ' CREATE TABLE IF NOT EXISTS kvknet_log.log_data_acikriza ( ' +
     ' log_id INT NOT NULL DEFAULT nextval(''kvknet_log.sq_log_data_acikriza_log_id''), ' +
     ' log_tarih TIMESTAMP(6), ' +
     ' log_islem CHAR(1), ' +
     ' log_kullanici_id INT, ' +
     ' log_kullanici_ip VARCHAR(15), ' +
     ' "id" integer, "mc_id" integer, "ayd_id" integer, "kisi_id" integer, "idy" integer, ' +
     '  "idt" timestamp without time zone, "sdy" integer, "sdt" timestamp without time zone, ' +
     '  "durum" character varying, "tarih" date, "saat" character varying, "ad_soyad" character varying, ' +
     '  "aciklama" character varying, "durum_aciklama" character varying, "gsmno" character varying, ' +
     '  "email" character varying, "aguid" character varying, "gkod" character varying, ' +
     '  "damga" character varying, "damga_info" jsonb, "faal_durum" character varying, "faal_bitis" date, ' +
     '  "id_tur" character varying, "oo_id" integer, "iys_email" character varying, "iys_sms" character varying, ' +
     '  "iys_phone" character varying, "ozel_1" character varying, "ozel_2" character varying, ' +
     '  "kimlik_no" character varying, "kimlik_no2" character varying, "ad_soyad2" character varying, ' +
     '  "gsmno2" character varying, "email2" character varying, "onay_sira" integer,  PRIMARY KEY (log_id)  ) ' ;

    try
     QueryExec(query,str );
    except
      ;
    end;

     str := ' CREATE OR REPLACE FUNCTION prc_log_data_acikriza() RETURNS trigger AS $$ ' +
     ' DECLARE ' +
     ' user_id INTEGER; ' +
     ' user_ip VARCHAR; ' +
     ' log_islem CHAR(1); ' +
     ' BEGIN ' +
     ' log_islem = SUBSTRING(TG_OP, 1, 1); ' +
     ' SELECT current_setting(''KVKNET.USER_ID'', true)::INTEGER, ' +
     ' current_setting(''KVKNET.USER_IP'', true) ' +
     ' INTO user_id, user_ip; ' +
     ' IF (log_islem = ''I'') THEN ' +
     ' INSERT INTO kvknet_log.log_data_acikriza (log_tarih, log_islem, log_kullanici_id, log_kullanici_ip, ' +
     '  id, mc_id, ayd_id, kisi_id, idy, idt, sdy, sdt, durum, tarih, saat, ad_soyad, aciklama, durum_aciklama, ' +
     '  gsmno, email, aguid, gkod, damga, damga_info, faal_durum, faal_bitis, id_tur, oo_id, iys_email, iys_sms, ' +
     '  iys_phone, ozel_1, ozel_2, kimlik_no, kimlik_no2, ad_soyad2, gsmno2, email2, onay_sira) ' +
     ' VALUES (now(), ''I'', user_id, user_ip, NEW.id, NEW.mc_id, NEW.ayd_id, NEW.kisi_id, NEW.idy, NEW.idt, ' +
     '  NEW.sdy, NEW.sdt, NEW.durum, NEW.tarih, NEW.saat, NEW.ad_soyad, NEW.aciklama, NEW.durum_aciklama, ' +
     '  NEW.gsmno, NEW.email, NEW.aguid, NEW.gkod, NEW.damga, NEW.damga_info, NEW.faal_durum, NEW.faal_bitis, ' +
     '  NEW.id_tur, NEW.oo_id, NEW.iys_email, NEW.iys_sms, NEW.iys_phone, NEW.ozel_1, NEW.ozel_2, NEW.kimlik_no, ' +
     '  NEW.kimlik_no2, NEW.ad_soyad2, NEW.gsmno2, NEW.email2, NEW.onay_sira); ' +
     ' ELSIF (log_islem = ''D'') THEN ' +
     ' INSERT INTO kvknet_log.log_data_acikriza (log_tarih, log_islem, log_kullanici_id, log_kullanici_ip, ' +
     '  id, mc_id, ayd_id, kisi_id, idy, idt, sdy, sdt, durum, tarih, saat, ad_soyad, aciklama, durum_aciklama, ' +
     '  gsmno, email, aguid, gkod, damga, damga_info, faal_durum, faal_bitis, id_tur, oo_id, iys_email, ' +
     '  iys_sms, iys_phone, ozel_1, ozel_2, kimlik_no, kimlik_no2, ad_soyad2, gsmno2, email2, onay_sira) ' +
     ' VALUES (now(), ''D'', user_id, user_ip, OLD.id, OLD.mc_id, OLD.ayd_id, OLD.kisi_id, OLD.idy, OLD.idt, ' +
     '  OLD.sdy, OLD.sdt, OLD.durum, OLD.tarih, OLD.saat, OLD.ad_soyad, OLD.aciklama, OLD.durum_aciklama, ' +
     '  OLD.gsmno, OLD.email, OLD.aguid, OLD.gkod, OLD.damga, OLD.damga_info, OLD.faal_durum, OLD.faal_bitis, ' +
     '  OLD.id_tur, OLD.oo_id, OLD.iys_email, OLD.iys_sms, OLD.iys_phone, OLD.ozel_1, OLD.ozel_2, OLD.kimlik_no, ' +
     '  OLD.kimlik_no2, OLD.ad_soyad2, OLD.gsmno2, OLD.email2, OLD.onay_sira); ' +
     ' ELSIF (log_islem = ''U'') THEN ' +
     ' INSERT INTO kvknet_log.log_data_acikriza (log_tarih, log_islem, log_kullanici_id, log_kullanici_ip, ' +
     '  id, mc_id, ayd_id, kisi_id, idy, idt, sdy, sdt, durum, tarih, saat, ad_soyad, aciklama, durum_aciklama, ' +
     '  gsmno, email, aguid, gkod, damga, damga_info, faal_durum, faal_bitis, id_tur, oo_id, iys_email, iys_sms, ' +
     '  iys_phone, ozel_1, ozel_2, kimlik_no, kimlik_no2, ad_soyad2, gsmno2, email2, onay_sira) ' +
     ' VALUES (now(), ''U'', user_id, user_ip, OLD.id, OLD.mc_id, OLD.ayd_id, OLD.kisi_id, OLD.idy, ' +
     '  OLD.idt, OLD.sdy, OLD.sdt, OLD.durum, OLD.tarih, OLD.saat, OLD.ad_soyad, OLD.aciklama, ' +
     '  OLD.durum_aciklama, OLD.gsmno, OLD.email, OLD.aguid, OLD.gkod, OLD.damga, OLD.damga_info, ' +
     '  OLD.faal_durum, OLD.faal_bitis, OLD.id_tur, OLD.oo_id, OLD.iys_email, OLD.iys_sms, OLD.iys_phone, ' +
     '  OLD.ozel_1, OLD.ozel_2, OLD.kimlik_no, OLD.kimlik_no2, OLD.ad_soyad2, OLD.gsmno2, OLD.email2, ' +
     '  OLD.onay_sira); ' +
     ' END IF; ' +
     ' RETURN NULL; ' +
     ' END; ' +
     ' $$ LANGUAGE plpgsql '      ;

    try
     QueryExec(query,str );
    except
      ;
    end;

     str := ' DO $$ ' +
     ' BEGIN ' +
     ' IF NOT EXISTS ( ' +
     ' SELECT 1 FROM information_schema.triggers ' +
     ' WHERE trigger_name = ''trg_log_data_acikriza'' ' +
     ' AND event_object_table = ''data_acikriza'' ' +
     ' ) THEN ' +
     ' CREATE TRIGGER trg_log_data_acikriza ' +
     ' AFTER INSERT OR UPDATE OR DELETE ON public.data_acikriza ' +
     ' FOR EACH ROW ' +
     ' EXECUTE FUNCTION prc_log_data_acikriza(); ' +
     ' END IF; ' +
     ' END $$; ' ;

    try
     QueryExec(query,str );
    except
      ;
    end;

    //vs başvuru log tanımlama
     str := ' CREATE SEQUENCE IF NOT EXISTS kvknet_log.sq_log_data_vsbasvuru_log_id ' ;

    try
     QueryExec(query,str );
    except
      ;
    end;

     str := ' CREATE TABLE IF NOT EXISTS kvknet_log.log_data_vsbasvuru ( ' +
     ' log_id INT NOT NULL DEFAULT nextval(''kvknet_log.sq_log_data_vsbasvuru_log_id''), ' +
     ' log_tarih TIMESTAMP(6), ' +
     ' log_islem CHAR(1), ' +
     ' log_kullanici_id INT, ' +
     ' log_kullanici_ip VARCHAR(15), ' +
     ' "id" integer, "mc_id" integer, "durum" character varying, "idy" integer, ' +
     ' "idt" timestamp without time zone, "sdy" integer, "sdt" timestamp without time zone, ' +
     '  "kg_id" integer, "adi" character varying, "soyadi" character varying, "kimlik_no" character varying, ' +
     '  "tel1" character varying, "tel2" character varying, "adres1" character varying, ' +
     '  "adres2" character varying, "ilce" character varying, "sehir" character varying, ' +
     '  "email" character varying, "kep" character varying, "basvuru_tarihi" date, ' +
     '  "basvuru_sekli" character varying, "basvuru_evrakno" character varying, ' +
     '  "basvuru_aciklama" character varying, "cevap_tarihi" date, "cevap_sekli" character varying, ' +
     '  "cevap_aciklama" character varying, "cevap_evrakno" character varying, "kg_detay" character varying, ' +
     '  "basvuru_konu" character varying, "basvuru_dept_id" integer, "cevap_sekli_talep" character varying, ' +
     '  "uyruk" character varying,  PRIMARY KEY (log_id) ) ' ;

    try
     QueryExec(query,str );
    except
      ;
    end;

     str := ' CREATE OR REPLACE FUNCTION prc_log_data_vsbasvuru() RETURNS trigger AS $$ ' +
     ' DECLARE ' +
     ' user_id INTEGER; ' +
     ' user_ip VARCHAR; ' +
     ' log_islem CHAR(1); ' +
     ' BEGIN ' +
     ' log_islem = SUBSTRING(TG_OP, 1, 1); ' +
     ' SELECT current_setting(''KVKNET.USER_ID'', true)::INTEGER, ' +
     ' current_setting(''KVKNET.USER_IP'', true) ' +
     ' INTO user_id, user_ip; ' +
     ' IF (log_islem = ''I'') THEN ' +
     ' INSERT INTO kvknet_log.log_data_vsbasvuru (log_tarih, log_islem, log_kullanici_id,' +
     ' log_kullanici_ip, id, mc_id, durum, idy, idt, sdy, sdt, kg_id, adi, soyadi, kimlik_no, tel1, tel2,' +
     '  adres1, adres2, ilce, sehir, email, kep, basvuru_tarihi, basvuru_sekli, basvuru_evrakno,' +
     '  basvuru_aciklama, cevap_tarihi, cevap_sekli, cevap_aciklama, cevap_evrakno, kg_detay, basvuru_konu, basvuru_dept_id, cevap_sekli_talep, uyruk) ' +
     ' VALUES (now(), ''I'', user_id, user_ip, NEW.id, NEW.mc_id, NEW.durum, NEW.idy, NEW.idt, NEW.sdy,' +
     '  NEW.sdt, NEW.kg_id, NEW.adi, NEW.soyadi, NEW.kimlik_no, NEW.tel1, NEW.tel2, NEW.adres1, NEW.adres2,' +
     '  NEW.ilce, NEW.sehir, NEW.email, NEW.kep, NEW.basvuru_tarihi, NEW.basvuru_sekli, NEW.basvuru_evrakno,' +
     '  NEW.basvuru_aciklama, NEW.cevap_tarihi, NEW.cevap_sekli, NEW.cevap_aciklama, NEW.cevap_evrakno,' +
     '  NEW.kg_detay, NEW.basvuru_konu, NEW.basvuru_dept_id, NEW.cevap_sekli_talep, NEW.uyruk); ' +
     ' ELSIF (log_islem = ''D'') THEN ' +
     ' INSERT INTO kvknet_log.log_data_vsbasvuru (log_tarih, log_islem, log_kullanici_id, log_kullanici_ip,' +
     '  id, mc_id, durum, idy, idt, sdy, sdt, kg_id, adi, soyadi, kimlik_no, tel1, tel2, adres1, adres2,' +
     '  ilce, sehir, email, kep, basvuru_tarihi, basvuru_sekli, basvuru_evrakno, basvuru_aciklama,' +
     '  cevap_tarihi, cevap_sekli, cevap_aciklama, cevap_evrakno, kg_detay, basvuru_konu, basvuru_dept_id, cevap_sekli_talep, uyruk) ' +
     ' VALUES (now(), ''D'', user_id, user_ip, OLD.id, OLD.mc_id, OLD.durum, OLD.idy, OLD.idt, OLD.sdy,' +
     '  OLD.sdt, OLD.kg_id, OLD.adi, OLD.soyadi, OLD.kimlik_no, OLD.tel1, OLD.tel2, OLD.adres1, OLD.adres2,' +
     '  OLD.ilce, OLD.sehir, OLD.email, OLD.kep, OLD.basvuru_tarihi, OLD.basvuru_sekli, OLD.basvuru_evrakno,' +
     '  OLD.basvuru_aciklama, OLD.cevap_tarihi, OLD.cevap_sekli, OLD.cevap_aciklama, OLD.cevap_evrakno,' +
     '  OLD.kg_detay, OLD.basvuru_konu, OLD.basvuru_dept_id, OLD.cevap_sekli_talep, OLD.uyruk); ' +
     ' ELSIF (log_islem = ''U'') THEN ' +
     ' INSERT INTO kvknet_log.log_data_vsbasvuru (log_tarih, log_islem, log_kullanici_id, log_kullanici_ip,' +
     '  id, mc_id, durum, idy, idt, sdy, sdt, kg_id, adi, soyadi, kimlik_no, tel1, tel2, adres1, adres2,' +
     '  ilce, sehir, email, kep, basvuru_tarihi, basvuru_sekli, basvuru_evrakno, basvuru_aciklama,' +
     '  cevap_tarihi, cevap_sekli, cevap_aciklama, cevap_evrakno, kg_detay, basvuru_konu, basvuru_dept_id,' +
     '  cevap_sekli_talep, uyruk) ' +
     ' VALUES (now(), ''U'', user_id, user_ip, OLD.id, OLD.mc_id, OLD.durum, OLD.idy, OLD.idt, OLD.sdy,' +
     '  OLD.sdt, OLD.kg_id, OLD.adi, OLD.soyadi, OLD.kimlik_no, OLD.tel1, OLD.tel2, OLD.adres1, OLD.adres2,' +
     '  OLD.ilce, OLD.sehir, OLD.email, OLD.kep, OLD.basvuru_tarihi, OLD.basvuru_sekli, OLD.basvuru_evrakno,' +
     '  OLD.basvuru_aciklama, OLD.cevap_tarihi, OLD.cevap_sekli, OLD.cevap_aciklama, OLD.cevap_evrakno,' +
     '  OLD.kg_detay, OLD.basvuru_konu, OLD.basvuru_dept_id, OLD.cevap_sekli_talep, OLD.uyruk); ' +
     ' END IF; ' +
     ' RETURN NULL; ' +
     ' END; ' +
     ' $$ LANGUAGE plpgsql ' ;

    try
     QueryExec(query,str );
    except
      ;
    end;

     str := ' DO $$ ' +
     ' BEGIN ' +
     ' IF NOT EXISTS ( ' +
     ' SELECT 1 FROM information_schema.triggers ' +
     ' WHERE trigger_name = ''trg_log_data_vsbasvuru'' ' +
     ' AND event_object_table = ''data_vsbasvuru'' ' +
     ' ) THEN ' +
     ' CREATE TRIGGER trg_log_data_vsbasvuru ' +
     ' AFTER INSERT OR UPDATE OR DELETE ON public.data_vsbasvuru ' +
     ' FOR EACH ROW ' +
     ' EXECUTE FUNCTION prc_log_data_vsbasvuru(); ' +
     ' END IF; ' +
     ' END $$ ';

    try
     QueryExec(query,str );
    except
      ;
    end;
    // acik riza secenek
    str := ' CREATE TABLE IF NOT EXISTS "public"."data_acikriza_detay_secenek" ( ' +
    ' "id" int4 NOT NULL, ' +
    ' "mc_id" int4, ' +
    ' "kisi_id" int4, ' +
    ' "kategori_ids" varchar(300) COLLATE "pg_catalog"."default", ' +
    ' "veritipi_ids" varchar(300) COLLATE "pg_catalog"."default", ' +
    ' "amac_ids" varchar(300) COLLATE "pg_catalog"."default", ' +
    ' "taraf_ids" varchar(300) COLLATE "pg_catalog"."default", ' +
    ' "kaynak_ids" varchar(300) COLLATE "pg_catalog"."default", ' +
    ' "idy" int4, ' +
    ' "idt" timestamp(6), ' +
    ' "sdy" int4, ' +
    ' "sdt" timestamp(6), ' +
    ' CONSTRAINT "data_acikriza_detay_secenek_pkey" PRIMARY KEY ("id") ' +
    ' ) ';

    try
     QueryExec(query,str );
    except
      ;
    end;

     str := ' CREATE SEQUENCE IF NOT EXISTS public.sq_data_acikriza_detay_secenek_id ' ;

    try
     QueryExec(query,str );
    except
      ;
    end;

    str := 'DO $$ ' +
    'BEGIN ' +
    'DELETE FROM "public"."sys_permission" WHERE id = 289; ' +
    'INSERT INTO "public"."sys_permission" ("id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note") ' +
    'SELECT 289, 286, ''Y'', 213, ''Değiştirme'', NULL ' +
    'WHERE NOT EXISTS ( ' +
    'SELECT 1 FROM "public"."sys_permission" ' +
    'WHERE "id" = 289 AND "parent_id" = 286 AND "perm_type" = ''Y'' AND "perm_id" = 213 AND "perm_def" = ''Değiştirme'' ' +
    '); ' +
    ' ' +
    'DELETE FROM "public"."sys_permission" WHERE id = 288; ' +
    'INSERT INTO "public"."sys_permission" ("id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note") ' +
    'SELECT 288, 286, ''Y'', 212, ''Ekleme'', NULL ' +
    'WHERE NOT EXISTS ( ' +
    'SELECT 1 FROM "public"."sys_permission" ' +
    'WHERE "id" = 288 AND "parent_id" = 286 AND "perm_type" = ''Y'' AND "perm_id" = 212 AND "perm_def" = ''Ekleme'' ' +
    '); ' +
    ' ' +
    'DELETE FROM "public"."sys_permission" WHERE id = 287; ' +
    'INSERT INTO "public"."sys_permission" ("id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note") ' +
    'SELECT 287, 286, ''Y'', 211, ''Görme'', NULL ' +
    'WHERE NOT EXISTS ( ' +
    'SELECT 1 FROM "public"."sys_permission" ' +
    'WHERE "id" = 287 AND "parent_id" = 286 AND "perm_type" = ''Y'' AND "perm_id" = 211 AND "perm_def" = ''Görme'' ' +
    '); ' +
    ' ' +
    'DELETE FROM "public"."sys_permission" WHERE id = 286; ' +
    'INSERT INTO "public"."sys_permission" ("id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note") ' +
    'SELECT 286, 281, ''M'', 0, ''İHLAL BİLDİRİMİ'', NULL ' +
    'WHERE NOT EXISTS ( ' +
    'SELECT 1 FROM "public"."sys_permission" ' +
    'WHERE "id" = 286 AND "parent_id" = 281 AND "perm_type" = ''M'' AND "perm_id" = 0 AND "perm_def" = ''İHLAL BİLDİRİMİ'' ' +
    '); ' +
    ' ' +
    'DELETE FROM "public"."sys_permission" WHERE id = 285; ' +
    'INSERT INTO "public"."sys_permission" ("id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note") ' +
    'SELECT 285, 282, ''Y'', 210, ''Değiştirme'', NULL ' +
    'WHERE NOT EXISTS ( ' +
    'SELECT 1 FROM "public"."sys_permission" ' +
    'WHERE "id" = 285 AND "parent_id" = 282 AND "perm_type" = ''Y'' AND "perm_id" = 210 AND "perm_def" = ''Değiştirme'' ' +
    '); ' +
    ' ' +
    'DELETE FROM "public"."sys_permission" WHERE id = 284; ' +
    'INSERT INTO "public"."sys_permission" ("id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note") ' +
    'SELECT 284, 282, ''Y'', 209, ''Ekleme'', NULL ' +
    'WHERE NOT EXISTS ( ' +
    'SELECT 1 FROM "public"."sys_permission" ' +
    'WHERE "id" = 284 AND "parent_id" = 282 AND "perm_type" = ''Y'' AND "perm_id" = 209 AND "perm_def" = ''Ekleme'' ' +
    '); ' +
    ' ' +
    'DELETE FROM "public"."sys_permission" WHERE id = 283; ' +
    'INSERT INTO "public"."sys_permission" ("id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note") ' +
    'SELECT 283, 282, ''Y'', 208, ''Görme'', NULL ' +
    'WHERE NOT EXISTS ( ' +
    'SELECT 1 FROM "public"."sys_permission" ' +
    'WHERE "id" = 283 AND "parent_id" = 282 AND "perm_type" = ''Y'' AND "perm_id" = 208 AND "perm_def" = ''Görme'' ' +
    '); ' +
    ' ' +
    'DELETE FROM "public"."sys_permission" WHERE id = 282; ' +
    'INSERT INTO "public"."sys_permission" ("id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note") ' +
    'SELECT 282, 281, ''M'', 0, ''İHLAL OLAYLARI'', NULL ' +
    'WHERE NOT EXISTS ( ' +
    'SELECT 1 FROM "public"."sys_permission" ' +
    'WHERE "id" = 282 AND "parent_id" = 281 AND "perm_type" = ''M'' AND "perm_id" = 0 AND "perm_def" = ''İHLAL OLAYLARI'' ' +
    '); ' +
    ' ' +
    'DELETE FROM "public"."sys_permission" WHERE id = 281; ' +
    'INSERT INTO "public"."sys_permission" ("id", "parent_id", "perm_type", "perm_id", "perm_def", "perm_note") ' +
    'SELECT 281, 1, ''M'', 0, ''İHLAL YÖNETİMİ'', NULL ' +
    'WHERE NOT EXISTS ( ' +
    'SELECT 1 FROM "public"."sys_permission" ' +
    'WHERE "id" = 281 AND "parent_id" = 1 AND "perm_type" = ''M'' AND "perm_id" = 0 AND "perm_def" = ''İHLAL YÖNETİMİ'' ' +
    '); ' +
    'END $$; ' ;

    try
     QueryExec(query,str );
    except
      ;
    end;




    except
//     StringList := TStringList.Create;
//      try
//        StringList.Add('hata oluştu ----'+#13#10+str);
//        StringList.SaveToFile('C:\sqlscript.txt');
//      finally
//        StringList.Free;
//      end;
    end;
finally
  if assigned( query) then
   FreeAndNil(query);
end;
end;


function TMainMod.IndexCheck(tableName,IndexName :string): integer;
var
Indexquery : TUniQuery;
begin
  result := 0;
 if (length(trim(tableName)) = 0 ) or (length(trim(IndexName)) = 0 ) then
 begin
  result := 0;
  exit;
 end;
 Indexquery := TUniQuery.Create(nil);
 try
  Indexquery.Connection := DBMain;
  QueryOpen(Indexquery,'SELECT * FROM pg_indexes WHERE tablename = '+QuotedStr(tableName)+' and indexname='+ QuotedStr(IndexName)) ;
  if Indexquery.IsEmpty then
    result := 0
  else
    result := Indexquery.RecordCount;
 finally
  if Assigned(Indexquery) then
    FreeAndNil(Indexquery);
 end;
end;

procedure TMainMod.UniGUIMainModuleSessionTimeout(ASession: TObject;
  var ExtendTimeOut: Integer);
begin

 ServerMod.RemoveUserSession( UniSession.SessionID);
  try
   DeleteUserSession(LoginInfo.ID);
  except
  ;
  end;
end;

procedure TMainMod.sqlMonitorSQL(Sender: TObject; Text: string;
  Flag: TDATraceFlag);
  var
  LogFile: TextFile;
  BasePath, LogDir, LogPath: string;
begin
 try
    BasePath := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));

    LogDir := BasePath + 'log\kvknet_sql_log\';
    ForceDirectories(LogDir);
    LogPath := LogDir + 'SQL_Log.txt';

    AssignFile(LogFile, LogPath);
    if FileExists(LogPath) then
      Append(LogFile)
    else
      Rewrite(LogFile);

    Writeln(LogFile, FormatDateTime('yyyy-mm-dd hh:nn:ss', Now) + ' - ' + Text);
    CloseFile(LogFile);
 except
  ;
 end;
end;

function TMainMod.CheckUsedId(ATableName, AField, AValue: String): Boolean;
begin
  QueryOpen(MainMod.qTmp, 'SELECT COUNT(id) FROM ' + ATableName + ' WHERE mc_id = ' + IntToStr(MCID) + ' AND ' + AField + ' = ' + AValue);
  Result := MainMod.qTmp.Fields[0].AsInteger > 0;
end;

function TMainMod.CheckUsedIds(ATableName, AField, AValue: String): Boolean;
begin
  QueryOpen(MainMod.qTmp, 'SELECT COUNT(id) FROM ' + ATableName + ' WHERE mc_id = ' + IntToStr(MCID) +
                          ' AND ('','' || ' + AField + ' || '','') like ''%,' + AValue + ',%''');

  Result := MainMod.qTmp.Fields[0].AsInteger > 0;
end;

function TMainMod.CreateOTC(ALength: Integer; ALetter: Boolean): String;
var
  OTCChars   : String;  {possible characters}
  OTCString  : String;  {OTC string}
  FirstDigit : Integer; {position of first digit}
  i          : Integer;
begin
  if ALength < 4 then ALength := 4;
  
  OTCChars  := '0123456789';
  if ALetter then OTCChars  := OTCChars + 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  OTCString := '';
  for i := 1 to ALength do OTCString := OTCString + ' ';

  Randomize;
  OTCString[1] := OTCChars[1 + Random(9)]; {always digit number in first position}

  if ALetter then {if user wants Letter in password}
  begin
    FirstDigit := 2 + Random(ALength - 1); {position of first letter}
    OTCString[FirstDigit] := OTCChars[11 + Random(26)];
  end;

  for i := 2 to ALength do {Now fill up the rest of the string with digits}
  begin
    if i = ALength then   {if it is last character}
    begin
      if (OTCString[i] = ' ') then
      begin
        repeat
           if ALetter then OTCString[i] := OTCChars[11 + Random(26)]
            else OTCString[i] := OTCChars[1 + Random(9)]
        until OTCString[i] <> OTCString[i - 1]
      end;
    end
    else   {if not last character}
    begin
      if (OTCString[i] = ' ') then
      begin
        repeat
           if ALetter then OTCString[i] := OTCChars[11 + Random(26)]
            else OTCString[i] := OTCChars[1 + Random(9)]
        until (OTCString[i] <> OTCString[i - 1]) and (OTCString[i] <> OTCString[i + 1]);
      end;
    end;
  end;
	Result := Copy(OTCString, 1, ALength);
end;

function TMainMod.CreatePassword: String;
var
  PwdChars   : String;  {possible characters}
  PwdString  : String;  {password string}
  FirstDigit : Integer; {position of first digit}
  i, j       : Integer;
const
  LoCase  = True;
  Digits  = True;
  Special = False;
  Length  = 16;
begin
  PwdChars  := 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
  PwdChars  := PwdChars + '0123456789*.:()/\%&+';
  PwdString := '                ';
  Randomize;
  PwdString[1] := PwdChars[1 + Random(26)]; {always capital letter in first position}

  if Digits then {if user wants digits in password}
  begin
    FirstDigit := 2 + Random(Length - 1); {position of first digit}
    PwdString[FirstDigit] := PwdChars[53 + Random(9)];
  end;

	if Special then   {if user wants one special character in password}
	begin
   	i := 1;
		repeat  { first find position to insert special character}
      i := i + 1;
      j := 2 + Random(Length - 1);
      if j = FirstDigit then j := 0;
    until j > 0;
		PwdString[j] := PwdChars[63 + Random(10)]; {find password character}
	end;

  for i := 2 to Length do {Now fill up the rest of the string with characters}
  begin
    if i = Length then   {if it is last character}
    begin
      if (PwdString[i] = ' ') then
      begin
        repeat
          if Digits then PwdString[i] := PwdChars[1 + Random(62)]
           else PwdString[i] := PwdChars[1 + Random(52)]
        until PwdString[i] <> PwdString[i - 1]
      end;
    end
    else   {if not last character}
    begin
      if (PwdString[i] = ' ') then
      begin
        repeat
          if Digits then PwdString[i] := PwdChars[1 + Random(62)]
           else PwdString[i] := PwdChars[1 + Random(52)];
        until (PwdString[i] <> PwdString[i - 1]) and (PwdString[i] <> PwdString[i + 1]);
      end;
    end;
  end;
	Result := Copy(PwdString, 1, Length);
  if not LoCase then Result := UpperCase(Result);
end;

function TMainMod.ValidatePwd(APwd: String; var AMsg: String): Boolean;
begin
  Result := False;
  AMsg   := '';

  if Length(APwd) < 8 then
  begin
    AMsg := 'Parola EN AZ 8 karakter uzunluğunda OLMALI. Lütfen kontrol ediniz.';
    Exit;
  end;
  if Length(APwd) > 15 then
  begin
    AMsg := 'Parola EN FAZLA 15 karakter uzunluğunda OLMALI. Lütfen kontrol ediniz.';
    Exit;
  end;
  if not TRegEx.IsMatch(APwd, '[a-z]') then
  begin
    AMsg := 'Parola içerisinde en az 1 tane KÜÇÜK HARF bulunmalı. Lütfen kontrol ediniz.';
    Exit;
  end;
  if not TRegEx.IsMatch(APwd, '[A-Z]') then
  begin
    AMsg := 'Parola içerisinde en az 1 tane BÜYÜK HARF bulunmalı. Lütfen kontrol ediniz.';
    Exit;
  end;
  if not TRegEx.IsMatch(APwd, '\d') then
  begin
    AMsg := 'Parola içerisinde en az 1 tane RAKAM bulunmalı. Lütfen kontrol ediniz.';
    Exit;
  end;
  // if not TRegEx.IsMatch(APwd, '[!,#,%,&,*,@]') then
  // begin
  //   AMsg := 'Parola içerisinde en az 1 tane şu karakterlerden bulunmalı: !,#,%,&,*,@';
  //   Exit;
  // end;

  Result := True;
end;

function TMainMod._Upper(AStr: String): String;
var
  i   : Integer;
  Str : String;
begin
  Str := '';
  for i := 1 to Length(AStr) do
  begin
    case AStr[i] of
      'i' : Str := Str + 'İ';
      'ı' : Str := Str + 'I';
      'ü' : Str := Str + 'Ü';
      'ö' : Str := Str + 'Ö';
      'ş' : Str := Str + 'Ş';
      'ç' : Str := Str + 'Ç';
      'ğ' : Str := Str + 'Ğ';
    else Str := Str + UpperCase(AStr[i]);
    end;
  end;
  Result := Str;
end;

Function TMainMod.CheckAndCreateUserSession( AUserID: Integer;  AIPAddress :  string):boolean;
begin
  result := true;
  NoActiveSessionDel;
  qTmp.SQL.Text := 'SELECT session_id FROM user_sessions WHERE user_id = :user_id and ip_adress <>:ip_adress ';
  qTmp.ParamByName('user_id').AsInteger := AUserID;
  qTmp.ParamByName('ip_adress').AsString := MainMod.ipAdress;
  qTmp.Open;
  if not qTmp.Eof then
  begin
    // Mevcut oturum var, yeni oturum açma işlemini reddet
    ServerMod.Logger.AddLog('Uyarı!', 'Bu kullanıcı zaten başka bir cihazda oturum açtı.');
    result := false;
  end
  else
  begin
    qTmp.SQL.Text := 'SELECT session_id FROM user_sessions WHERE user_id = :user_id  ';
    qTmp.ParamByName('user_id').AsInteger := AUserID;
    qTmp.Open;
    if not qTmp.IsEmpty then
    begin
      HeartBeat;
    end else
    begin
      // Yeni oturum  kaydet
      qTmp.Close;
      qTmp.SQL.Text := 'INSERT INTO user_sessions ' +
        ' (session_id, user_id,  ip_adress, created_date, updated_date) ' +
        ' VALUES (:session_id, :user_id,  :ip_address, current_timestamp, current_timestamp)';
      qTmp.ParamByName('session_id').AsInteger := GetSeq('sq_user_sessions_id');
      qTmp.ParamByName('user_id').AsInteger := AUserID;
      qTmp.ParamByName('ip_address').AsString := AIPAddress;
      qTmp.ExecSQL;
    end;
  end;
end;

procedure TMainMod.DeleteUserSession(AUserID: Integer);
begin
  qTmp.SQL.Text := 'DELETE FROM user_sessions WHERE user_id = :user_id and ip_adress =:ip_adress ';
  qTmp.ParamByName('user_id').AsInteger := AUserID;
  qTmp.ParamByName('ip_adress').AsString := MainMod.ipAdress;
  qTmp.ExecSQL;
end;

procedure TMainMod.HeartBeat;
begin
  qTmp.SQL.Text := 'UPDATE user_sessions SET updated_date = current_timestamp WHERE user_id = :user_id' +
  ' and ip_adress =:ip_adress' ;
  qTmp.ParamByName('user_id').AsInteger := LoginInfo.ID;
  qTmp.ParamByName('ip_adress').AsString := MainMod.ipAdress;
  qTmp.ExecSQL;
end;

procedure TMainMod.NoActiveSessionDel;
begin
  qTmp.SQL.Text := 'DELETE FROM user_sessions WHERE  updated_date < (current_timestamp - interval ''6 minutes'')';
  qTmp.ExecSQL;
end;

function TMainMod.IsUserAuthorized(const AuserId: integer): Boolean;
var
  q: TUniQuery;
begin
  Result := False;

  q := TUniQuery.Create(nil);
  try
    q.Connection := dbmain;
    q.SQL.Text := 'select active FROM usr_user where active = ''E'' and id =:id ';
    q.ParamByName('id').AsInteger := AuserId;
    q.Open;

      Result := not q.IsEmpty;

  finally
    q.Free;
  end;
end;

procedure TMainMod.PortalAfisSetting;
begin

     QueryOpen(qsysPortalsetting,
        ' select * from sys_dynamic_properties where mc_id ='+ IntToStr(MCID)  );
      if qsysPortalsetting.IsEmpty then
      begin
         qsysPortalsetting.Insert;
         qsysPortalsetting.FieldByName('id').AsInteger := mainmod.GetSeq('sq_sys_dynamic_properties_id');
         qsysPortalsetting.FieldByName('mc_id').AsInteger := mainmod.MCID;
         qsysPortalsetting.FieldByName('primary_color_code').asstring := '';
         qsysPortalsetting.FieldByName('secondary_color_code').asstring := '';
         qsysPortalsetting.FieldByName('show_commission_decisions').asstring := 'E' ;
         qsysPortalsetting.FieldByName('show_policies').asstring := 'E' ;
         qsysPortalsetting.FieldByName('show_information_texts').asstring := 'E' ;
         qsysPortalsetting.FieldByName('show_explicit_consent_texts').asstring := 'E' ;
         qsysPortalsetting.FieldByName('show_data_subject_applications').asstring := 'E' ;
         qsysPortalsetting.FieldByName('show_portal_kvknet_logo').asstring := 'E' ;
         qsysPortalsetting.FieldByName('show_application_login_kvknet_logo').asstring := 'E' ;
         qsysPortalsetting.FieldByName('show_ip_address').asstring := 'E' ;
         qsysPortalsetting.FieldByName('data_subject_application_warning_text').asstring := '' ;
         qsysPortalsetting.FieldByName('show_portal_krm_logo').asstring := 'E' ;
         qsysPortalsetting.FieldByName('show_afis_web_link').asstring := 'E' ;
         qsysPortalsetting.FieldByName('show_afis_portal_link').asstring := 'E' ;
         qsysPortalsetting.FieldByName('show_afis_mail').asstring := 'E' ;
         qsysPortalsetting.FieldByName('show_afis_gsm_no').asstring := 'E' ;
         qsysPortalsetting.FieldByName('idy').AsInteger :=  0;
         qsysPortalsetting.FieldByName('idt').AsDateTime :=  now;
         qsysPortalsetting.FieldByName('sdy').AsInteger :=  0;
         qsysPortalsetting.FieldByName('sdt').AsDateTime :=  now;
         qsysPortalsetting.Post;
      end;

end;




initialization
  RegisterMainModuleClass(TMainMod);
end.

(* Ajax Functions

function keyup(sender, e, eOpts)
{
  var val = sender.getValue() ;
  sender.setValue(val.toLocaleUpperCase());
}

function keypress(sender, e, eOpts)
{
   if (e.getKey() == 13)
   {
      ajaxRequest(sender, 'doSearch', ["aText="+sender.getValue()]);
   };
}

*)

