{***********************************************************************}
{                                                                       }
{           unTwoFactorAuth Unit                                       }
{                                                                       }
{  Bu ünite, kullanıcı girişlerinde güvenliği artırmak amacıyla         }
{  iki faktörlü kimlik doğrulama (2FA) işlemlerini yönetmek için        }
{  tasarlanmıştır.                                                     }
{                                                                       }
{  Desteklenen 2FA yöntemleri:                                          }
{    - TOTP (Time-based One Time Password)                              }
{    - Email ile doğrulama                                             }
{    - SMS ile doğrulama (örnek olarak tanımlı)                         }
{                                                                       }
{  İçerdiği Bileşenler:                                                 }
{    - TTwoFAMethod (tip tanımı: tfmTOTP, tfmEmail, tfmSMS)             }
{    - ITwoFAMethodHandler (arayüz tanımı)                              }
{    - GetTwoFAHandler fonksiyonu: Uygun handler nesnesini döner        }
{    - GetUser2FAMethod fonksiyonu: Kullanıcının doğrulama yöntemini    }
{      belirler (örn. veritabanından)                                   }
{                                                                       }
{  Kullanım:                                                            }
{    Kullanıcı adı alındıktan sonra:                                   }
{      1. Kullanıcının 2FA yöntemi alınır                               }
{      2. Uygun handler atanır                                          }
{      3. Kod üretilip kullanıcıya gönderilir                           }
{      4. Kullanıcının girdiği kod verify edilir                        }
{                                                                       }
{  Geliştirici: Doğan Akçay                                             }
{  Tarih: 23 Temmuz 2025                                                   }
{                                                                       }
{***********************************************************************}
unit unTwoFactorAuth;

interface

uses
  System.SysUtils, System.Classes, strutils, uni , uniGUIApplication, uniGUIForm,
  uniGUIDialogs,Base32U, IdGlobal,IdHMACSHA1,uniRadioGroup,uniComboBox;

type
  TTwoFAMethod = (tfmNone=0, tfmTOTP=1, tfmEmail=2, tfmSMS=3);

  ITwoFAMethodHandler = interface
    ['{1F76536E-24D6-4D12-BF93-6C71B9489D0F}']
    function GenerateCode(const AUser: integer): string;
    function SendCode(const AUser: integer ; ACode: string): Boolean;
    function VerifyCode(const AUser : integer ; AInputCode: string): Boolean;
  end;

function GetTwoFAHandler(AMethod: TTwoFAMethod): ITwoFAMethodHandler;
function GetUser2FAMethod(const AUser: integer): TTwoFAMethod; overload;
function GetUser2FAMethod(const AUser: integer; Cbb: TUniComboBox ): TTwoFAMethod; overload;
function BuildQRCodeURI(const Issuer, Account, Secret: string): string;
function GetUserSecret(const AUser: integer): string;


const
 STwoFAMethod: array[TTwoFAMethod] of string= ('Yok','OTP','Eposta','SMS');
 html : string =' <!DOCTYPE html> ' +
 ' <html> ' +
 ' <head> ' +
 ' <meta name="viewport" content="width=device-width, initial-scale=1.0"> ' +
 ' <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> ' +
 ' <meta http-equiv="content-type" content="text/html;charset=windows-1254" /> ' +
 ' <style> ' +
 '  ' +
 ' html { ' +
 ' -webkit-background-size: cover; ' +
 ' -moz-background-size: cover; ' +
 ' -o-background-size: cover; ' +
 ' background-size: cover; ' +
 ' } ' +
 '  ' +
 ' @media (max-width: 1000px) { ' +
 ' .center{} ' +
 ' .center-inner{ ' +
 ' left:25%; ' +
 ' top:5%; ' +
 ' position:absolute; ' +
 ' width:50%; ' +
 ' height:auto; ' +
 ' text-align:left; ' +
 ' opacity:0.9; ' +
 ' } ' +
 ' } ' +
 '  ' +
 ' @media (min-width: 1000px) { ' +
 ' .center{ ' +
 ' left:50%; ' +
 ' top:5%; ' +
 ' position:absolute; ' +
 ' } ' +
 ' .center-inner{ ' +
 ' left:25%; ' +
 ' top:5%; ' +
 ' position:absolute; ' +
 ' width:50%; ' +
 ' height:auto; ' +
 ' text-align:left; ' +
 ' opacity:0.9; ' +
 ' } ' +
 ' } ' +
 '  ' +
 ' </style> ' +
 ' </head> ' +
 ' <body style="font-family:Verdana;"> ' +
 ' <div class="center-inner" style="background-color: white; font-family: sans-serif; font-size: 15px; line-height: 140%; color: #000000;"> ' +
 ' <div style="padding: 20px;"> ' +
 ' <p>KVKNET Ki&#351;isel Veri Envanteri Y&#246;netim Sistemi kullan&#305;c&#305; bilgileri.</p> ' +
 ' </br> ' +
 ' <p> ' +
 ' <table style="font-family:Verdana"> ' +
 ' <tr> ' +
 ' <td><strong style="color: blue;">Doğrulama Kodu :</strong></td><td>: <strong>%%%DKOD%%%</strong></td> ' +
 ' </tr> ' +
 ' </br> ' +
 ' </table></p> ' +
 ' <p></br></p> ' +
 ' <p>Yandaki linkten sisteme giri&#351; yapabilirsiniz&nbsp:&nbsp&nbsp<a '+
 ' href="%%%LINK%%%">KVKNET Ki&#351;isel Veri Envanteri Y&#246;netim Sistemi</a></br></p> ' +
 ' <p>&#304;yi &#231;al&#305;&#351;malar...</br></p> ' +
 ' <p></br></p> ' +
 ' <p></br></p> ' +
 ' <p style="font-family: sans-serif; font-size: 10px; line-height: 140%; color: #000000;"> '+
 ' Bu mesaj <strong>KVKNET Ki&#351;isel Veri Envanteri Y&#246;netim Sistemi</strong> '+
 ' taraf&#305;ndan bilgilendirme amac&#305;yla, otomatik olarak g&#246;nderilmi&#351;tir.</p> ' +
 ' <p style="font-family: sans-serif; font-size: 10px; line-height: 140%; color: #000000;"> '+
  'This is an automated message to inform you, created by <strong>KVKNET Personal Data Management System</strong>.</p> ' +
 ' </div> ' +
 ' </div> ' +
 ' </body> ' +
 ' </html> ' ;

implementation

uses
  // Projenize özel modülleri buraya ekleyin
  Dialogs, DateUtils, MainModule,unMailUtils, McMLib, KVKNETAPILib, GoogleOTP;

type
  // TOTP Handler (örnek: Google Authenticator)
  TTwoFATOTP = class(TInterfacedObject, ITwoFAMethodHandler)
  private

  public
    function GenerateCode(const AUser: integer): string;
    function SendCode(const AUser:integer ; ACode: string): Boolean;
    function VerifyCode(const AUser :integer ; AInputCode: string): Boolean;
  end;

  // E-posta Handler
  TTwoFAEmail = class(TInterfacedObject, ITwoFAMethodHandler)
  public
    function GenerateCode(const AUser: integer): string;
    function SendCode(const AUser: integer ; ACode: string): Boolean;
    function VerifyCode(const AUser: integer; AInputCode: string): Boolean;
  end;

  // SMS Handler
  TTwoFASMS = class(TInterfacedObject, ITwoFAMethodHandler)
  public
    function GenerateCode(const AUser: integer): string;
    function SendCode(const AUser: integer ; ACode: string): Boolean;
    function VerifyCode(const AUser: integer ; AInputCode: string): Boolean;
  end;

{ === TOTP === }

function TTwoFATOTP.GenerateCode(const AUser: integer): string;
begin
  // TOTP kod üretilmeyecek;
  Result := '';
end;

function TTwoFATOTP.SendCode(const AUser:integer ; ACode: string): Boolean;
begin
  // TOTP kodu gönderilmez,
  Result := True;
end;

function TTwoFATOTP.VerifyCode(const AUser: integer; AInputCode: string): Boolean;
var
  Secret: string;
begin
   result := false;
//IFJFST2NFZBU6TJOJNLEWTSFKQ--ARYOM.COM.KVKNET
  Secret := MainMod.TwoFASecret; //GetUserSecret(AUser);
	if ValidateTOPT(Secret, StrToInt(AInputCode) ) then
		result := true;

end;

function GetUserSecret(const AUser: integer): string;
var
  RawSecret: TBytes;
  qtmp : TUniQuery;
begin
  result := '';
  qtmp := TUniQuery.Create(nil);
  try
    qtmp.Connection := mainmod.DBMain;
    QueryOpen(qtmp,'select twosecret from usr_user ' +
    ' where active=''E'' and id='+inttostr(AUser)+
    '  and mc_id=' + inttostr(mainmod.MCID));
    if  not qtmp.IsEmpty  then
    begin
          if qtmp.FieldByName('twosecret').AsString<>'' then
            result := qtmp.FieldByName('twosecret').AsString
        else
        begin
          SetLength(RawSecret, 10); // 80-bit
          for var i := 0 to High(RawSecret) do
            RawSecret[i] := Random(256);
          Result := Base32.Encode(RawSecret);

          with TUniQuery.Create(nil) do
            try
              Connection := mainmod.DBMain;
              SQL.Text := 'UPDATE usr_user SET twosecret = :s WHERE id = :id AND mc_id = :mcid';
              ParamByName('s').AsString := Result;
              ParamByName('id').AsInteger := AUser;
              ParamByName('mcid').AsInteger := mainmod.MCID;
              ExecSQL;
            finally
              Free;
            end;


        end;
    end;
    qtmp.Close;
  finally
    qtmp.Free;
  end;




  //Result := 'IFJFST2NFZBU6TJOJNLEWTSFKQ'; // ARYOM.COM.KVKNET
end;

{ === Email === }

function TTwoFAEmail.GenerateCode(const AUser: integer): string;
begin
  Result := Format('%06d', [Random(1000000)]);
  mainmod.TwoFACode := Result;
  mainmod.TwoFAExpire := Now + EncodeTime(0, 5, 0, 0); // 5 dk geçerli
end;

function TTwoFAEmail.SendCode(const AUser:integer; ACode: string): Boolean;
var
  edMailMsg : TStringList;
  i : integer;
  tmp : string;
  mailSonuc : boolean;
  qtmp        : TUniQuery;
begin
  result := false;
   edMailMsg := TStringList.Create;
   qtmp := TUniQuery.Create(nil);
  try
      qtmp.Connection := MainMod.DBMain;
      QueryOpen(qtmp, 'select email from usr_user where id='+inttostr(AUser)+
      ' and mc_id='+ inttostr(MainMod.LoginInfo.MCID)) ;

      edMailMsg.Text := html ;
      for i := 0 to edMailMsg.Count - 1 do
      begin
        Tmp := edMailMsg[i]; // her satırı al
        Tmp := StringReplace(Tmp, '%%%DKOD%%%', ACode, [rfReplaceAll]);
        Tmp := Str2HTMLStr(Tmp);
        edMailMsg[i] := Tmp;
      end;

     mailSonuc := GenelSendEmail(qTmp.FieldByName('email').AsString,
     'KVKNET - Kullanıcı iki faktörlü doğrulama kodu', edMailMsg.Text,inttostr(mainmod.LoginInfo.MCID));

    if mailSonuc then
    begin
     MessageDlg(qTmp.FieldByName('email').AsString + ' adresine doğrulama kodu gönderildi ',mtConfirmation,[mbOK]) ;

     Result := True;
    end;
    qtmp.Close;
  finally

   edMailMsg.Free;
   qtmp.Free;
  end;
end;

function TTwoFAEmail.VerifyCode(const AUser: integer ; AInputCode: string): Boolean;
begin
  Result := (AInputCode = mainmod.TwoFACode) and (Now < mainmod.TwoFAExpire);
end;

{ === SMS === }

function TTwoFASMS.GenerateCode(const AUser: integer): string;
begin
  Result := Format('%06d', [Random(1000000)]);
  mainmod.TwoFACode := Result;
  mainmod.TwoFAExpire := Now + EncodeTime(0, 5, 0, 0);
end;

function TTwoFASMS.SendCode(const AUser: integer ; ACode: string): Boolean;
var
  URLLink ,
  OTC     ,
  GSMNo   : String;
  Mesaj   : String;
  Fast    : Boolean;
  qtmp : TUniQuery;
begin
  result := false;
  qtmp := TUniQuery.Create(nil);
try
    qtmp.Connection := MainMod.DBMain;
    QueryOpen(qtmp, 'select phone from usr_user where id='+inttostr(AUser)+
    ' and mc_id='+ inttostr(MainMod.LoginInfo.MCID)) ;

 if (qtmp.fieldbyname('phone').AsString = '') or
        (length(qtmp.fieldbyname('phone').AsString) < 12 ) then
  begin
    MessageDlg('Cep Telefonu numarası girilmemiş. Lütfen kontrol ediniz.',mtConfirmation,[mbOK]) ;
    Exit;
  end;

    GSMNo := qtmp.FieldByName('phone').AsString;
    GSMNo := StringReplace(GSMNo, '(', '', [rfReplaceAll]);
    GSMNo := StringReplace(GSMNo, ')', '', [rfReplaceAll]);
    Mesaj := 'KVKKnet uygulaması doğrulama kodu: ' + ACode + ' ilgili alana giriniz. ';

  if not SendSMS(Mesaj, GSMNo, Fast, UniGuiApplication.UniApplication.RemoteAddress,'', 0) then
  begin
    MessageDlg('sms gönderilemedi.',mtConfirmation,[mbOK]);
      MainMod.SaveSMSLog(MainMod.MCID, 0, 0, '', '', 'HATA : ' + Mesaj);
    Exit;
  end
  else
  begin
    MessageDlg('SMS ile doğrulama kodu gönderildi. ',mtConfirmation,[mbOK]);
     Result := True;
  end;
  qtmp.Close;
finally
  qtmp.Free;
end;
  Result := True;
end;

function TTwoFASMS.VerifyCode(const AUser: integer ; AInputCode: string): Boolean;
begin
  Result := (AInputCode = mainmod.TwoFACode) and (Now < mainmod.TwoFAExpire);
end;

{ === Factory === }

function GetTwoFAHandler(AMethod: TTwoFAMethod): ITwoFAMethodHandler;
begin
  case AMethod of
    tfmTOTP: Result := TTwoFATOTP.Create;
    tfmEmail: Result := TTwoFAEmail.Create;
    tfmSMS: Result := TTwoFASMS.Create;
  else
    raise Exception.Create('Desteklenmeyen 2FA yöntemi.');
  end;
end;

function GetUser2FAMethod(const AUser: integer): TTwoFAMethod;
var
  twoMetod : integer;
  qtmp : TUniQuery;
begin

//  if AUser = 0 then
//    Result := tfmTOTP
//  else if AUser = 1 then
//    Result := tfmEmail
//  else
//    Result := tfmSMS // Varsayılan
qtmp := TUniQuery.Create(nil);
 try
 qtmp.Connection := mainmod.DBMain;
  twoMetod := StrToIntDef(mainmod.GetSysParam(qtmp,'İKİ FAKTÖRLÜ DOĞRULAMA TÜRÜ' ),0);
   result := TTwoFAMethod(twoMetod); //tfmEmail;
 finally
   qtmp.Free;
 end;

end;

function GetUser2FAMethod(const AUser: integer; Cbb: TUniComboBox ): TTwoFAMethod;
var
 Selectedstr : string;
 selectedMethot : TTwoFAMethod;
begin
  Selectedstr := Cbb.items[Cbb.ItemIndex];
  for selectedMethot := Low(TTwoFAMethod) to High(TTwoFAMethod) do
  begin
    if STwoFAMethod[selectedMethot] = selectedstr then
      result := selectedMethot;
  end;
end;

function BuildQRCodeURI(const Issuer, Account, Secret: string): string;
begin
  Result := Format('otpauth://totp/%s:%s?secret=%s&issuer=%s&digits=6&period=30',
    [Issuer, Account, Secret, Issuer]);
end;


end.
