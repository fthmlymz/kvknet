unit unKullaniciParolaSifirla;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniButton, uniBitBtn, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox, uniCheckBox, uniDBCheckBox, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses,
  uniListBox, uniDBListBox, Data.DB, DBAccess, Uni, MemDS, VirtualTable, uniBasicGrid, uniDBGrid,
  uniMemo, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdText, IdGlobal,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdMessage;

type
  TfrmKullaniciParolaSifirla = class(TUniForm)
    pnlData: TUniPanel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    qTmp: TUniQuery;
    UniLabel3: TUniLabel;
    edKurumKodu: TUniEdit;
    edKullaniciAdi: TUniEdit;
    edePosta: TUniEdit;
    btnPost: TUniBitBtn;
    btnCancel: TUniBitBtn;
    edMailMsg: TUniMemo;
    lbCaptcha: TUniLabel;
    edCaptcha: TUniEdit;
    UniLabel4: TUniLabel;
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure ResetPwdControl(Sender: TComponent; Res: Integer);
    function SendMail(APwd: String): Boolean;
    function ParseMsg(AData: TUniMemo; APwd: String): TStringList;
    procedure CreateCaptcha;
    procedure UniFormCreate(Sender: TObject);
  private
    ActiveCaptchaStr : String;
    ActiveCaptchaInt : Integer;
    GC_ID,
    MC_ID  : Integer;
    comp,
    uName  : String;
    DataDB : TUniQuery;
  public
    function Exec: Integer;
  end;

function frmKullaniciParolaSifirla: TfrmKullaniciParolaSifirla;

implementation

uses uniGUIApplication, MainModule, McMLib, unKullaniciListe, unDepartmanSec, ServerModule,
  unMailUtils;

{$R *.dfm}

function frmKullaniciParolaSifirla: TfrmKullaniciParolaSifirla;
begin
  Result := TfrmKullaniciParolaSifirla(MainMod.GetFormInstance(TfrmKullaniciParolaSifirla));
end;

function TfrmKullaniciParolaSifirla.Exec: Integer;
begin
  result := ShowModal;
end;

function TfrmKullaniciParolaSifirla.ParseMsg(AData: TUniMemo; APwd: String): TStringList;
var
  i   : Integer;
  Tmp      : String;
begin
  Result := TStringList.Create;
  UName  := qtmp.FieldByName('user_name').AsString;

  for i := 0 to AData.Lines.Count - 1 do
  begin
    Tmp := AData.Lines[i];
    Tmp := Str2HTMLStr(StringReplace(Tmp, '%%%COMPCODE%%%', Comp,    [rfReplaceAll]));
    Tmp := Str2HTMLStr(StringReplace(Tmp, '%%%UNAME%%%',    UName,   [rfReplaceAll]));
    Tmp := Str2HTMLStr(StringReplace(Tmp, '%%%UPWD%%%',     APwd,    [rfReplaceAll]));
    Tmp := Str2HTMLStr(StringReplace(Tmp, '%%%LINK%%%',     mainMod.KVKNetLink,    [rfReplaceAll]));
    Result.Add(Tmp);
  end;
end;

procedure TfrmKullaniciParolaSifirla.ResetPwdControl(Sender: TComponent; Res: Integer);
var
  NewPwd : String;
  mailSonuc : boolean;
begin
  if Res <> mrYes then Exit;

  NewPwd := MainMod.CreatePassword;

  edMailMsg.Lines.LoadFromFile(ServerMod.FilesFolderPath + 'temp_mail/pwdmail.htm');

  try
   mailSonuc := GenelSendEmail(qTmp.FieldByName('email').AsString,
        'KVKNET - Kullanýcý Bilgilendirme',
        ParseMsg(edMailMsg, NewPwd).Text,inttostr(mc_id));
  except
   on E: Exception do
    ShowMessageN(E.Message);
  end;

 // if SendMail(NewPwd) then
  if mailSonuc then
  begin
    qTmp.Edit;
    qTmp.FieldByName('user_pwd').AsString := EncryptStr(NewPwd);
    qTmp.Post;
    MessageDlg('Parola baþarý ile sýfýrlandý ve ilgili kullanýcýya parolasý mail gönderildi.', mtInformation, [mbOk]);
  end;
  edMailMsg.Lines.Clear;
  ModalResult := mrOk;
end;

function TfrmKullaniciParolaSifirla.SendMail(APwd: String): Boolean;
var
  AParam     : TParameter;
  MailAdr    ,
  SenderAcc  ,
  SenderPwd  ,
  SenderHost ,
  SenderPort : String;
  senderSSL  : Boolean;
  senderTLS  : Integer;
  SMTP       : TIdSMTP;
  Msg        : TIdMessage;
  SSLHandler : TIdSSLIOHandlerSocketOpenSSL;
  HTMLMsg    : TStringList;
begin
  {Result     := False;
  AParam     := MainMod.GetParameter(MainMod.qTmp, 'KVKK', 'GENEL', 'MAIL ACCOUNT');
  SenderAcc  := AParam.Deger1;
  SenderPwd  := AParam.Deger2;
  AParam     := MainMod.GetParameter(MainMod.qTmp, 'KVKK', 'GENEL', 'MAIL SERVER');
  SenderHost := AParam.Deger1;
  SenderPort := AParam.Deger2;}

  QueryOpen(mainmod.qTmp, 'select smtp_username, smtp_password, smtp_host, smtp_port, smtp_ssl, smtp_usetls from sys_param_mc where mc_id=' + IntToStr(MC_ID));
  senderAcc  := mainmod.qTmp.fieldByName('smtp_username').AsString;
  senderPwd  := mainMod.qTmp.FieldByName('smtp_password').AsString;
  senderHost := mainmod.qTmp.fieldByName('smtp_host').AsString;
  senderPort := mainMod.qTmp.FieldByName('smtp_port').AsString;
  senderSSL  := (mainMod.qTmp.FieldByName('smtp_ssl').AsString = 'E');
  senderTLS  := mainMod.qTmp.FieldByName('smtp_usetls').AsInteger;

  if (SenderAcc = '') or (SenderPwd = '') then
  begin
    MessageDlg('Firma Mail Hesabý tanýmlanmamýþ. Lütfen kurum parametrelerini kontrol ediniz.', mtError, [mbOk]);
    Exit;
  end;
  if (SenderHost = '') or (SenderPort = '') then
  begin
    MessageDlg('Firma Mail Sunucu ayarlarý yapýlmamýþ. Lütfen kurum parametrelerini kontrol ediniz.', mtError, [mbOk]);
    Exit;
  end;

  senderPwd := DecryptStr(senderPwd);

  MailAdr  := qTmp.FieldByName('email').AsString;

  Msg := TIdMessage.Create(nil);
  try
    Msg.From.Address := SenderAcc;
    Msg.Recipients.EMailAddresses := MailAdr;
    Msg.Subject      := 'Kullanýcý Bilgileri Hk. - KVKNET';
    Msg.ContentType  := 'multipart/mixed';
    with TIdText.Create(Msg.MessageParts, nil) do begin
      // Body.Text := 'HTML goes here';
      HTMLMsg := ParseMsg(edMailMsg, APwd);
      Body.Assign(HTMLMsg);
      // Body.LoadFromFile('index.html');
      ContentType := 'text/html';
    end;

    SSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    SMTP := TIdSMTP.Create(nil);
    try
      SSLHandler.MaxLineAction := maException;
      SSLHandler.SSLOptions.Method := sslvTLSv1_2; //sslvTLSv1; // sslvSSLv23;
      SSLHandler.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
      SSLHandler.SSLOptions.Mode := sslmClient; // sslmUnassigned;
      SSLHandler.SSLOptions.VerifyMode := [];
      SSLHandler.SSLOptions.VerifyDepth := 0;

      if senderSSl then
      begin
        SMTP.IOHandler := SSLHandler;
        SMTP.UseTLS := TIdUseTLS(senderTLS);
      end;
      SMTP.AuthType  := satDefault;
      SMTP.Host      := SenderHost;
      SMTP.Port      := StrToIntDef(SenderPort, 0);
      SMTP.Username  := SenderAcc;
      SMTP.Password  := SenderPwd;
      SMTP.ConnectTimeout := 10000;
      SMTP.Connect;
      if SMTP.Connected then
      begin
        SMTP.Authenticate;
        SMTP.Send(Msg);
        SMTP.Disconnect;
        Result := True;
      end;
    finally
      SMTP.Free;
      SSLHandler.Free;
    end;
  finally
    Msg.Free;
  end;
  if not Result then
  begin
    MessageDlg('Mail gönderilirken hata oluþtu. Ýþlem baþarýsýz.', mtError, [mbOk]);
    Exit;
  end;
end;

procedure TfrmKullaniciParolaSifirla.UniFormCreate(Sender: TObject);
begin
  CreateCaptcha;
end;

procedure TfrmKullaniciParolaSifirla.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmKullaniciParolaSifirla.btnPostClick(Sender: TObject);
var
  stmp   : String;
begin
  if edKurumKodu.Text = '' then
  begin
    MessageDlg('Kurum Kodu belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edKurumKodu.SetFocus;
    Exit;
  end;
  if edKullaniciAdi.Text = '' then
  begin
    MessageDlg('Kullanýcýadý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edKullaniciAdi.SetFocus;
    Exit;
  end;
  if edePosta.Text = '' then
  begin
    MessageDlg('E-Posta adresi belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edePosta.SetFocus;
    Exit;
  end;
  if edCaptcha.Text <> IntToStr(ActiveCaptchaInt) then
  begin
    MessageDlg('Güvenlik kodu yanlýþ girilmiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    CreateCaptcha;
    edCaptcha.SetFocus;
    Exit;
  end;

  uName := edKullaniciAdi.Text;
  QueryPrep(qTmp,'SELECT * FROM sys_mcdef WHERE code = :p_code');
  qTmp.ParamByName('p_code').AsString := edKurumKodu.Text;
  qTmp.Open;
  //kurum kodu deðil, grup kodu mu?
  if qTmp.FieldByName('id').AsInteger < 1 then
  begin
    QueryPrep(qTmp,'SELECT * FROM sys_gcdef WHERE code = :p_code');
    qTmp.ParamByName('p_code').AsString := edKurumKodu.Text;
    qTmp.Open;
    if qTmp.FieldByName('id').AsInteger < 1 then
    begin
      MessageDlg('Kurum kodu yanlýþ girilmiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
      CreateCaptcha;
      edCaptcha.SetFocus;
      Exit;
    end;
    if qTmp.FieldByName('active').AsString <> 'E' then
    begin
      MessageDlg('Kurum kodu yanlýþ girilmiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
      CreateCaptcha;
      edCaptcha.SetFocus;
      Exit;
    end;

    GC_ID := qTmp.FieldByName('id').AsInteger;
    comp  := qTmp.FieldByName('code').AsString;
    MC_ID := 0;
//    QueryOpen(qTmp, 'SELECT * FROM sys_mcdef WHERE gc_id = ' + IntToStr(GC_ID));
//    MC_ID := qTmp.FieldByName('id').AsInteger;
  end
  else
  begin
    if qTmp.FieldByName('active').AsString <> 'E' then
    begin
      MessageDlg('Kurum kodu yanlýþ girilmiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
      CreateCaptcha;
      edCaptcha.SetFocus;
      Exit;
    end;

    MC_ID    := qTmp.FieldByName('id').AsInteger;
    GC_ID    := qTmp.FieldByName('gc_id').AsInteger;
    comp     := qTmp.FieldByName('code').AsString;
  end;

  QueryPrep(qTmp, 'SELECT * FROM usr_user WHERE gc_id = ' + IntToStr(GC_ID) + ' AND mc_id = ' + IntToStr(MC_ID) + ' AND user_name = :p_name AND email = :p_mail');
  qTmp.ParamByName('p_name').AsString := edKullaniciAdi.Text;
  qTmp.ParamByName('p_mail').AsString := edePosta.Text;
  qTmp.Open;
  if (qTmp.FieldByName('id').AsInteger < 1) and (qTmp.FieldByName('active').AsString <> 'E') then
  begin
    MessageDlg('Bu bilgiler ile kayýtlý kullanýcý bulunmamaktadýr. Lütfen kontrol ediniz.', mtError, [mbOk]);
    CreateCaptcha;
    edCaptcha.SetFocus;
    Exit;
  end;

  MessageDlg('Kullanýcýnýn parolasýný sýfýrlamak istediðinizden emin misiniz?', mtConfirmation, mbYesNo, ResetPwdControl);
end;


procedure TfrmKullaniciParolaSifirla.CreateCaptcha;
var
  a, b, c : Integer;
  Top     : Integer;
begin
  Randomize;
  a := Random(10);
  b := Random(10);
  c := Random(10);
  Top := a + b;
  ACtiveCaptchaStr := '( ' + IntToStr(a) + ' + ' + IntToStr(b) + ' )';

  if Top > c then
  begin
    Top := Top - c;
    ACtiveCaptchaStr := ACtiveCaptchaStr + ' - ' + IntToStr(c) + ' = ';
  end
  else
  begin
    Top := Top + c;
    ACtiveCaptchaStr := ACtiveCaptchaStr + ' + ' + IntToStr(c) + ' = ';
  end;
  ActiveCaptchaInt := Top;
  lbCaptcha.Caption := ActiveCaptchaStr;
end;

end.
