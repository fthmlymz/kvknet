unit LDAPUtils ;
/// <summary>
/// Doðan Akçay : OpenLdap  entegrasyonu için yazýldý.
/// </summary>
interface

uses  SysUtils,Classes, ldapsend,ServerModule ;


type
 TLDAPManager = class
 // admin
   FLDAP : TLDAPSend;
   FHost : String;
   FPort : string;
   FUserName : string;
   FPassword : string;
   FBaseDn : string;
 //user
   FUserDn : string;
   FUserPassword : string;
   procedure ParseHostPort(const HostPort: string;
  out Host, Port: string);
   procedure ParseUserPassword(const UserPassword: string; out UserName, Password: string);
 public
  constructor create;
  Destructor Destroy ; override;

  procedure configure(AHost,APort,AUserName,APassWord ,AbaseDn: string);overload;
  procedure Configure(ConnectionString: string; Credentials: string; BaseDN: string); overload;

  function connect : boolean;
  function Authenticate(AUserDn,AUserPassword :string ): boolean;
  function Search(AsearcBase, ASearchFilter: string;
  AAttributes: TStrings): boolean;
  Function GetResult : string;


 end;


implementation

{ TLDAPManager }

function TLDAPManager.Authenticate(AUserDn,AUserPassword :string ): boolean;
var
searchResult : TStringList;
begin
//uid='+kullanici.Text+','+ outadres.Text


 searchResult := TStringList.Create;
 try
  result := false;
  connect;
  ServerMod.Logger.AddLog('LDAP','connect olundu');

  FUserDn := 'uid='+ AUserDn +','+ FBaseDn;
  FUserPassword := AUserPassword;
  fldap.UserName := FUserDn;
  FLDAP.Password := FUserPassword;
//  Result := FLDAP.Bind;
  if FLDAP.Bind then
  begin
      ServerMod.Logger.AddLog('LDAP','Bind ');
   // LDAP aramasý gerçekleþtir
      FLDAP.UserName := FUserName;
      FLDAP.Password := FPassword ;
      if FLDAP.Bind then
      begin

      ServerMod.Logger.AddLog('LDAP','master user bind');
         if FLDAP.Search('dc=marmara,dc=edu,dc=tr',
                       False,
                       '(&(objectClass=zimbraAccount)(zimbraAccountStatus=active)(uid=' + FUserName + '))',
                       searchResult) then
        begin

        ServerMod.Logger.AddLog('LDAP','search iþlemi');
          Result := searchResult.Count > 0;
        end;
      end;
  end;
 finally
   searchResult.Free;
 end;
end;

procedure TLDAPManager.configure(AHost,APort,AUserName,APassWord ,AbaseDn: string);
begin
  Fhost := Ahost;
  Fport := Aport;
  FUserName := AUserName;
  FPassword := APassWord;
  FBaseDn := ABaseDn ;
  ServerMod.Logger.AddLog('LDAP','Konfigre edildi');
end;


procedure TLDAPManager.Configure(ConnectionString: string; Credentials: string; BaseDN: string);
begin
  ParseHostPort(ConnectionString, FHost, FPort);
  ParseUserPassword(Credentials, FUserName, FPassword);
  FBaseDN := BaseDN;

  ServerMod.Logger.AddLog('LDAP','Konfigre edildi');

end;

function TLDAPManager.connect: boolean;
begin

  FLDAP.TargetHost := FHost;
  FLDAP.TargetPort := FPort;
  FLDAP.UserName := FUserName;
  FLDAP.Password := FPassword;
  Result := FLDAP.Login;

  ServerMod.Logger.AddLog('LDAP','login olundu');


end;

constructor TLDAPManager.create;
begin
  Inherited ;
  FLDAP:= TLDAPSend.Create;
end;

destructor TLDAPManager.Destroy;
begin
  FLDAP.Free;
  inherited destroy;
end;

function TLDAPManager.GetResult: string;
var
  I : integer;
  RawResponse : AnsiString;
  ProcessedResponse : string;
begin
  RawResponse := FLDAP.FullResult;
  ProcessedResponse := 'Kod Çözemü:' +sLineBreak;

  I :=1;
  while I<= Length(RawResponse) do
  begin
    ProcessedResponse := ProcessedResponse + IntToHex(ord(RawResponse[I]),2)+' ';
    inc(i);
  end;

  result := ProcessedResponse;
end;

procedure TLDAPManager.ParseHostPort(const HostPort: string;
  out Host, Port: string);
var
  SeperatorCount: Integer;
begin
  SeperatorCount := Pos(':', HostPort);
  if SeperatorCount > 0 then
  begin
    Host := Copy(HostPort, 1, SeperatorCount - 1);
    Port := Copy(HostPort, SeperatorCount + 1, Length(HostPort) - SeperatorCount);
  end
  else
  begin
    Host := HostPort;
    Port := '389'; // Varsayýlan port
  end;

end;

procedure TLDAPManager.ParseUserPassword(const UserPassword: string; out UserName,
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
    Password := ''; // Þifre saðlanmamýþsa boþ býrak
  end;

end;

function TLDAPManager.Search(AsearcBase, ASearchFilter: string;
  AAttributes: TStrings): boolean;
begin
 FLDAP.SearchScope := SS_WholeSubtree;
 FLDAP.SearchSizeLimit := 10;
 FLDAP.SearchTimeLimit := 30;
 FLDAP.SearchPageSize :=0;
 FLDAP.SearchCookie :='';

 result := FLDAP.Search(AsearcBase,false,ASearchFilter,AAttributes);

end;

end.
