unit unMailUtils;

interface

uses
  System.SysUtils, System.Classes, IdSMTP, IdMessage, IdSSLOpenSSL,
  IdText,  MainModule, strutils,McMLib,math, uni,
  IdExplicitTLSClientServerBase,forms;

function GenelSendEmail(const ARecipient, ASubject, ABody: String; AMC_ID: string = ''): Boolean;
function GuncellemeMail(): Boolean;

implementation
uses uniMemo,ServerModule ;

function GuncellemeMail(): Boolean;
var
  mailSonuc   : Boolean;
  edMailMsg   : TStringList;
  i           : Integer;
  Tmp         : String;
  UName       : String;
  qtmp        : TUniQuery;
begin

   qtmp:= TUniQuery.Create(nil);
   try
      qtmp.Connection := MainMod.DBMain;
      QueryOpen(qTmp,' SELECT email,full_name, mc_id FROM usr_user ' +
          ' where active =''E'' AND email is NOT null ');
      qtmp.First;
      while not qtmp.Eof do
      begin
        edmailMSg := TStringList.Create;
        try
          edMailMsg.LoadFromFile(ServerMod.FilesFolderPath + 'temp_mail/GuncellemeMail.htm', TEncoding.UTF8);
           try
                UName  := qtmp.FieldByName('full_name').AsString;

                for i := 0 to edMailMsg.Count - 1 do
                begin
                  Tmp := edMailMsg[i]; // her satırı al
                  Tmp := StringReplace(Tmp, '%%%VRSY%%%', ServerMod.Version, [rfReplaceAll]);
                  Tmp := StringReplace(Tmp, '%%%UNAME%%%', UName, [rfReplaceAll]);
                  Tmp := Str2HTMLStr(Tmp);
                  edMailMsg[i] := Tmp;
                end;
            if qtmp.FieldByName('mc_id').AsInteger > 0 then
              mailSonuc := GenelSendEmail(qTmp.FieldByName('email').AsString,
                  'KVKNET - Güncelleme Bilgilendirme',edMailMsg.Text,
                   qTmp.FieldByName('mc_id').AsString) ;
           except
              on E: Exception do
                 raise Exception.Create(e.Message);
           end;

        finally
          edMailMsg.free;
        end;
        qtmp.Next;
      end;
   finally
     qtmp.Free;
   end;

end;


function GenelSendEmail(const ARecipient, ASubject, ABody: String; AMC_ID: string = ''): Boolean;
var
  SenderAcc, SenderPwd, SenderHost, SenderPort: String;
  SenderFrom: String;
  SenderSSL: Boolean;
  SenderTLS: Integer;
  UseAuth: Boolean;
  SMTP: TIdSMTP;
  Msg: TIdMessage;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  HTMLMsg: TStringList;
  indx: Integer;
  mc_id : integer;
begin

  Result := False;
  mc_id := ifthen(AMC_ID ='',mainmod.MCID,StrToIntDef(AMC_ID,0));
  QueryOpen(mainmod.qTmp, 'SELECT smtp_username, smtp_password, smtp_host, smtp_port,'+
    ' smtp_ssl, smtp_usetls, email_auth,smtp_varsayilan_gonderen '+
    ' FROM sys_param_mc WHERE mc_id=' + IntToStr(mc_id) );

  SenderAcc := mainmod.qTmp.FieldByName('smtp_username').AsString;
  SenderFrom := ifthen( mainmod.qtmp.fieldbyname('smtp_varsayilan_gonderen').asstring <> '',
                       mainmod.qtmp.fieldbyname('smtp_varsayilan_gonderen').asstring,
                       mainmod.qTmp.FieldByName('smtp_username').AsString);

//  if AFromAddress <> '' then
//    SenderFrom := AFromAddress;

  SenderPwd := DecryptStr(mainMod.qTmp.FieldByName('smtp_password').AsString);
  SenderHost := mainmod.qTmp.FieldByName('smtp_host').AsString;
  SenderPort := mainMod.qTmp.FieldByName('smtp_port').AsString;
  SenderSSL := (mainMod.qTmp.FieldByName('smtp_ssl').AsString = 'E');
  SenderTLS := mainMod.qTmp.FieldByName('smtp_usetls').AsInteger;
  UseAuth := (mainMod.qTmp.FieldByName('email_auth').AsString <> 'H');

  if (SenderHost = '') or (SenderPort = '') then
  begin
    raise Exception.Create('Firma Mail Sunucu ayarları yapılmamış. Lütfen kurum parametrelerini kontrol ediniz.');
    Exit;
  end;

  Msg := TIdMessage.Create(nil);
  SSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  SMTP := TIdSMTP.Create(nil);
  HTMLMsg := TStringList.Create;

  try
    Msg.From.Address := SenderFrom;
    Msg.Recipients.EMailAddresses := ARecipient;
    Msg.Subject := ASubject;
    Msg.ContentType := 'multipart/alternative';
   // Msg.ContentType  := 'multipart/mixed';

    HTMLMsg.Text := ABody;

    with TIdText.Create(Msg.MessageParts, nil) do
    begin
      Body.Assign(HTMLMsg);
      ContentType := 'text/html';
    end;

//    SSLHandler.SSLOptions.Method :=  sslvTLSv1;
//    SSLHandler.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
//    SSLHandler.SSLOptions.Mode := sslmClient;
//    SSLHandler.SSLOptions.VerifyMode := [];
//    SSLHandler.SSLOptions.VerifyDepth := 0;

    SSLHandler.SSLOptions.Method := sslvTLSv1_2;
    SSLHandler.SSLOptions.SSLVersions := [sslvTLSv1_2]; // sadece TLS 1.2
    SSLHandler.SSLOptions.Mode := sslmClient;
    {$IFDEF DEBUG}
    SSLHandler.SSLOptions.VerifyMode := [];
    SSLHandler.SSLOptions.VerifyDepth := 0;
    {$ELSE}
    SSLHandler.SSLOptions.VerifyMode := [];//[sslvrfPeer]; // sunucu sertifikası doğrulansın
    SSLHandler.SSLOptions.VerifyDepth := 2;
    {$ENDIF}

    if SenderSSL then
    begin
      SMTP.IOHandler := SSLHandler;
      SMTP.UseTLS := TIdUseTLS(SenderTLS);
    end else
    SMTP.UseTLS    := utUseExplicitTLS;

    SMTP.Host := SenderHost;
    SMTP.Port := StrToIntDef(SenderPort, 25);
    SMTP.ConnectTimeout := 10000;

    if UseAuth then
    begin
      SMTP.AuthType := satDefault;
      SMTP.Username := SenderAcc;
      SMTP.Password := SenderPwd;
    end
    else
      SMTP.AuthType := satNone;

    SMTP.Connect;
    if SMTP.Connected then
    begin
      if UseAuth then
        SMTP.Authenticate;
      SMTP.Send(Msg);
      SMTP.Disconnect;
      Result := True;
    end;
  except
    on E: Exception do
    begin
   raise Exception.Create('E-posta gönderilirken hata oluştu:' + E.Message);
    end;
  end;

  HTMLMsg.Free;
  SMTP.Free;
  SSLHandler.Free;
  Msg.Free;
end;

end.
