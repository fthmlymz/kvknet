unit unKullaniciTanimTopluIslem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, DateUtils,
  uniGUIClasses, uniGUIForm, Data.DB, DBAccess, Uni, MemDS, uniPanel, uniButton, uniBitBtn, uniEdit,
  uniMemo, uniDBMemo, uniDBEdit, uniLabel, uniGUIBaseClasses, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniGroupBox, uniRadioGroup, uniDBRadioGroup,
  uniBasicGrid, uniDBGrid, VirtualTable, uniDateTimePicker, uniDBNavigator,
  uniFileUpload, FlexCel.XlsAdapter,  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdText, IdGlobal,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdMessage,strutils,RegularExpressions;

type
  TfrmKullaniciTanimTopluIslem = class(TUniForm)
    pnlButtons: TUniPanel;
    btnCancel: TUniBitBtn;
    qTmp: TUniQuery;
    tblImport: TVirtualTable;
    dsImport: TUniDataSource;
    pnlLog: TUniContainerPanel;
    grd: TUniDBGrid;
    btnSablonIndir: TUniBitBtn;
    btnYukle: TUniBitBtn;
    btnAdd: TUniBitBtn;
    UniPanel1: TUniPanel;
    UniDBNavigator1: TUniDBNavigator;
    FileUp: TUniFileUpload;
    qUser: TUniQuery;
    edMailMsg: TUniMemo;
    procedure btnCancelClick(Sender: TObject);
    procedure tblImportBeforePost(DataSet: TDataSet);
    procedure btnSablonIndirClick(Sender: TObject);
    procedure btnYukleClick(Sender: TObject);
    procedure FileUpCompleted(Sender: TObject; AStream: TFileStream);
    procedure btnAddClick(Sender: TObject);
    procedure grdDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
  private
    AccessID,
    kaynakID,
    kisiID       : Integer;
    KaynakIDlist,
    kisiIdList   : TStringList;
    beforePostCheck: boolean;
    procedure ProcessExcel(xlsxfile: string);
    function CheckUsers: boolean;
    function SendMail(APwd: String): Boolean;
    function ParseMsg(AData: TUniMemo; APwd: String): TStringList;
  public
    function Exec(islem: String): Integer;
  end;

function frmKullaniciTanimTopluIslem: TfrmKullaniciTanimTopluIslem;

implementation

uses uniGUIApplication, MainModule, McMLib, unErisimYetkiListe, ServerModule,
  unMailUtils;

{$R *.dfm}

function frmKullaniciTanimTopluIslem: TfrmKullaniciTanimTopluIslem;
begin
  Result := TfrmKullaniciTanimTopluIslem(MainMod.GetFormInstance(TfrmKullaniciTanimTopluIslem));
end;


procedure TfrmKullaniciTanimTopluIslem.btnAddClick(Sender: TObject);
var
  sCount : String;
  iCount : Integer;
  MCID   : Integer;
  NewPwd : String;
  MailGonderme : boolean;
begin
  MailGonderme := MainMod.GetSysParam(qTmp, 'KULLANICI MAÝL GÖNDERME') = 'E';
  if MainMod.MCType = 0 then MCID := 0 else MCID := MainMod.MCID;
  if tblImport.RecordCount < 1 then Exit;
  
  sCount := MainMod.GetParameter2(MainMod.qTmp, MainMod.GCID, MCID, 'DB SERVER'); // Kullanýcý Sayýsý
  iCount := StrToIntDef(sCount, 0);
  QueryOpen(qTmp, 'SELECT * FROM usr_user WHERE gc_id = ' + IntToStr(MainMod.GCID) + ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' AND active = ''E''');

  if qTmp.RecordCount + tblImport.RecordCount > iCount  then
  begin
    MessageDlg('Lisansýnýzýn izin verdiði kullanýcý sayýsýna ulaþtýnýz. (Max. ' + IntToStr(iCount) + ' kullanýcý)'#13 +
               'Yeni kullanýcý oluþturamazsýnýz.', mtError, [mbOk]);
    Exit;
  end;

  if checkusers = false then
  begin
    MessageDlg('Bir veya daha fazla kullanýcýda hata bulunmaktadýr.'#13 +
               'Lütfen uyarý mesajlarýný kontrol ederek hatalý satýrlarý düzeltiniz.', mtError, [mbOk]);
    Exit;
  end;

  queryOpen(qUser, 'SELECT * FROM usr_user WHERE mc_id=' + IntToStr(mainmod.MCID));

  beforepostcheck := false;
  tblImport.First;
  while not tblImport.Eof do
  begin
    if tblImport.FieldByName('durum').AsString <> 'I' then
    begin
      tblImport.Next;
      continue;
    end;
    qUser.Insert;
    qUser.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_usr_user_id');
    qUser.FieldByName('gc_id').AsInteger  := MainMod.GCID;
    if MainMod.MCType = 0
       then qUser.FieldByName('mc_id').AsInteger  := 0
       else qUser.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    qUser.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    qUser.FieldByName('idt').AsDateTime   := Now;
    qUser.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
    qUser.FieldByName('sdt').AsDateTime     := Now;
    qUser.FieldByName('active').AsString    := 'E';
    qUser.FieldByName('user_name').AsString := TR_Upper( Trim(tblImport.FieldByName('user_name').AsString));
    qUser.FieldByName('full_name').AsString := Trim(tblImport.FieldByName('full_name').AsString);
    qUser.FieldByName('email').AsString     := Trim(tblImport.FieldByName('email').AsString);
    qUser.FieldByName('phone').AsString     := Trim(tblImport.FieldByName('phone').AsString);
    qUser.FieldByName('rol').AsString       := trim(tblImport.FieldByName('rol').AsString);
    qUser.FieldByName('list_dept').AsString       := trim(tblImport.FieldByName('list_dept').AsString);
    qUser.FieldByName('ldap_user_name').asstring  :=  Trim(tblImport.FieldByName('ldap_user_name').AsString) ;
    NewPwd := MainMod.CreatePassword;
    qUser.FieldByName('user_pwd').AsString  := EncryptStr(NewPwd);
    qUser.Post;
    tblImport.Edit;
    tblImport.FieldByName('durum').AsString := 'E';
    tblImport.FieldByName('mesaj').AsString :=  ifthen( MailGonderme, 'Kullanýcý eklendi','Kullanýcý eklendi, parola gönderildi.');
    if  not MailGonderme then
    begin
      edMailMsg.Lines.LoadFromFile(ServerMod.FilesFolderPath + 'temp_mail/pwdmail.htm');
     // SendMail(NewPwd);
     try
      GenelSendEmail(tblImport.FieldByName('email').AsString,
        'Kullanýcý Bilgileri Hk. - KVKNET',ParseMsg(edMailMsg, NewPwd).Text  )  ;
     except
      on E:Exception do
        ShowMessageN(e.Message);
     end;

    end;
    tblImport.Next;
  end;
  beforepostcheck := true;
end;

procedure TfrmKullaniciTanimTopluIslem.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrClose;
end;

procedure TfrmKullaniciTanimTopluIslem.btnSablonIndirClick(Sender: TObject);
begin
  UniSession.SendFile(ServerMod.FilesFolderPath + 'temp_xls\Kullanici_Toplu_Ekleme_Sablonu.xlsx', 'Kullanici_Toplu_Ekleme_Sablonu.xlsx');
end;

procedure TfrmKullaniciTanimTopluIslem.btnYukleClick(Sender: TObject);
begin
  FileUp.Execute;
end;

function TfrmKullaniciTanimTopluIslem.CheckUsers: boolean;
var
  usernamelist: TStringList;
  ldapNameList: TStringList;
  deplist : TStringList;
  deptliste : string;
  i : integer;
begin
  result := true;
  beforepostcheck := false;
  usernamelist:= TStringlist.Create;
  ldapNameList := TStringList.Create;
  try
    tblImport.First;
    while not tblImport.Eof do
    begin
      tblImport.edit;
      tblImport.FieldByName('durum').AsString := 'I';
      tblImport.FieldByName('mesaj').AsString := 'Kullanýcý bilgileri tam ve uygun.';

      if tblImport.FieldByName('user_name').AsString = '' then
      begin
        tblImport.FieldByName('durum').AsString := 'H';
        tblImport.FieldByName('mesaj').AsString := 'Kullanýcý adý boþ olamaz.';
      end
      else
      if tblImport.FieldByName('full_name').AsString = '' then
      begin
        tblImport.FieldByName('durum').AsString := 'H';
        tblImport.FieldByName('mesaj').AsString := 'Adý Soyadý boþ olamaz.';
      end
      else
      if tblImport.FieldByName('phone').AsString = '' then
      begin
        tblImport.FieldByName('durum').AsString := 'H';
        tblImport.FieldByName('mesaj').AsString := 'Telefon numarasý boþ olamaz.';
      end
      else
      if tblImport.FieldByName('email').AsString = '' then
      begin
        tblImport.FieldByName('durum').AsString := 'H';
        tblImport.FieldByName('mesaj').AsString := 'E-Mail adresi boþ olamaz.';
      end
      else
      begin
        tblImport.FieldByName('durum').AsString := 'I';
        tblImport.FieldByName('mesaj').AsString := 'Kullanýcý bilgileri tam ve uygun.';
      end;

      QueryOpen(qtmp, 'select user_name, full_name from usr_user ' +
        'where user_name=''' +Trim(tblImport.FieldByName('user_name').AsString) + '''' +
        ' and mc_id=' + IntToStr(mainMod.MCID));
      if qtmp.recordcount > 0 then
      begin
        tblImport.FieldByName('durum').AsString := 'H';
        tblImport.FieldByName('mesaj').AsString := 'Ayný kullanýcý adý ile daha önce eklenmiþ kullanýcý bulunmakta, kayýtlý kullanýcý: ' + qtmp.FieldByName('full_name').AsString;
      end;

      // Doðan Akçay Mail Adresinin uniq olmasý saðlandý.
      QueryOpen(MainMod.qTmp,'SELECT full_name  FROM usr_user WHERE email ='+ QuotedStr( tblImport.FieldByName('email').AsString))  ;
      if not qTmp.IsEmpty then
        begin
         tblImport.FieldByName('durum').AsString := 'H';
         tblImport.FieldByName('mesaj').AsString := 'Ayný mail  adresi ile daha önce eklenmiþ kullanýcý bulunmakta, kayýtlý kullanýcý: ' + qtmp.FieldByName('full_name').AsString;
        end;

      if usernameList.IndexOf(tblImport.FieldByName('user_name').AsString) > -1 then
      begin
        tblImport.FieldByName('durum').AsString := 'H';
        tblImport.FieldByName('mesaj').AsString := 'Ayný kullanýcý adý tekrarlanmýþ.';
      end;

      if ldapNameList.IndexOf(tblImport.FieldByName('ldap_user_name').AsString) > -1 then
      begin
        tblImport.FieldByName('durum').AsString := 'H';
        tblImport.FieldByName('mesaj').AsString := 'Ayný LDAP kullanýcý adý tekrarlanmýþ.';
      end;

      if tblImport.FieldByName('ldap_user_name').asstring <>'' then
      begin
        QueryOpen(qTmp,'select * from usr_user where ldap_user_name ='+QuotedStr(tblImport.FieldByName('ldap_user_name').asstring)) ;
        if qTmp.RecordCount > 0 then
        begin
          tblImport.FieldByName('durum').AsString := 'H';
          tblImport.FieldByName('mesaj').AsString :=
            'Ayný LDAP kullanýcý adý ile daha önce eklenmiþ kullanýcý bulunmakta, kayýtlý kullanýcý: ' + qtmp.FieldByName('full_name').AsString;
        end;
      end;

      if tblImport.FieldByName('rol').AsString <> '' then
      begin
        QueryOpen(qtmp,' select * from usr_role where mc_id=' + inttostr(mainmod.MCID) +
          ' AND  rol=' + quotedstr(trim(tblImport.FieldByName('rol').AsString)) );
        if qTmp.IsEmpty then
        begin
          tblImport.FieldByName('durum').AsString := 'H';
          tblImport.FieldByName('mesaj').AsString :=
            'Tanýmlý rol bulunamadý :' + qtmp.FieldByName('rol').AsString;
        end;
      end;

      if tblImport.FieldByName('list_dept').AsString <> '' then
      begin
        deptliste := StringReplace(trim(tblImport.FieldByName('list_dept').AsString),' ','',[rfReplaceAll]);
        if  TRegEx.IsMatch(deptliste, '^\d+(,\d+)*$') then
        begin
            DepList := TStringList.Create;
            try
              DepList.StrictDelimiter := True;
              DepList.Delimiter := ',';
              DepList.DelimitedText := deptliste;
              for I := 0 to deplist.Count -1 do
              begin
                QueryOpen(qTmp,'SELECT * FROM sys_deptdef WHERE active=''E'' AND mc_id='+inttostr(mainmod.MCID)+
                ' and id='+ deplist[i]);
                if qTmp.IsEmpty then
                begin
                  tblImport.FieldByName('durum').AsString := 'H';
                  tblImport.FieldByName('mesaj').AsString :=
                  deplist[i] + ': Yetkili Departman listesinde bulunamadý.';
                end;
              end;
            finally
              DepList.Free;
            end;
        end else
        begin
          tblImport.FieldByName('durum').AsString := 'H';
          tblImport.FieldByName('mesaj').AsString :=
            'Yetkili Departman listesine hata bulundu.';
        end;
      end;

      usernamelist.Add(tblImport.FieldByName('user_name').AsString);
      if tblImport.FieldByName('ldap_user_name').AsString <>'' then
        ldapNameList.Add(tblImport.FieldByName('ldap_user_name').AsString);

      // Added by TEVFIK 15.11.2022 23:13:15 usernamelist free edilmeyecek mi?
      result := result and (tblImport.FieldByName('durum').AsString <> 'H');
      tblImport.post;
      tblImport.Next;
    end;
    beforepostcheck := true;
  finally
    if Assigned(usernamelist) then
     usernamelist.Free;
    if Assigned(ldapNameList) then
     ldapNameList.Free;
  end;

end;

function TfrmKullaniciTanimTopluIslem.Exec(islem: String): Integer;
begin
  ShowModal;
end;

procedure TfrmKullaniciTanimTopluIslem.FileUpCompleted(Sender: TObject;
  AStream: TFileStream);
var
  TmpName: String;
  fileExt: String;
  FS     : TFileStream;
  FUrl   : String;
begin
  try
    fileExt := UpperCase(ExtractFileExt(FileUp.FileName));
    if Pos(','+fileExt+',', ',.XLSX,') <= 0 then
    begin
      MessageDlg('Sadece saðlanan Excel þablonunu yükleyebilirsiniz.', mtInformation, [mbOk]);
      exit;
    end;

    TmpName := ServerMod.NewCacheFileUrl(False, 'XLSX', '', '', FUrl, True);
    fs := TFileStream.Create(tmpname, fmCreate);
    fs.CopyFrom(fileup.Stream, fileup.Stream.size);
    fs.Free;
    processExcel(tmpName);
  except
    raise;
  end;
end;

procedure TfrmKullaniciTanimTopluIslem.ProcessExcel(xlsxfile: string);
var
  x,
  y      : integer;
  user_name,
  full_name,
  phone    ,
  email    : String;
  ldapName  : string;
  rol : string;
  list_dept : string;
  cIndex       : integer;
  xls          : TXlsFile;
begin
  xls := TXlsFile.Create(false);
  XLS.Open(xlsxfile);
  xls.ActiveSheet := 1;

  if tblImport.State = dsInactive then
    tblImport.Open;

  tblImport.First;
  while not tblImport.EOF do
    tblImport.Delete;

  beforepostcheck := true;
  try
    for y := 2 to xls.RowCount do
    begin
      user_name := Xls.GetStringFromCell(y, 1);
      full_name := Xls.GetStringFromCell(y, 2);
      phone     := Xls.GetStringFromCell(y, 3);
      email     := Xls.GetStringFromCell(y, 4);
      ldapName  := xls.GetStringFromCell(y, 5) ;
      rol       := xls.GetStringFromCell(y, 6);
      list_dept := xls.GetStringFromCell(y, 7);

      tblImport.insert;
      tblImport.fieldbyname('user_name').AsString := TR_Upper( Trim(user_name) );
      tblImport.fieldbyname('full_name').AsString := Trim(full_name);
      tblImport.fieldbyname('phone').AsString     := Trim(phone);
      tblImport.fieldbyname('email').AsString     := Trim(email);
      tblImport.FieldByName('ldap_user_name').AsString := Trim(ldapName);
      tblImport.FieldByName('rol').AsString := trim(rol);
      tblImport.FieldByName('list_dept').AsString := trim(list_dept);
      tblImport.fieldbyname('sirano').AsInteger   := y-1;
      tblImport.Post;
    end;

    except
    raise;
  end;

  if checkusers = false then
  begin
    MessageDlg('Bir veya daha fazla kullanýcýda hata bulunmaktadýr.'#13 +
               'Lütfen uyarý mesajlarýný kontrol ederek hatalý satýrlarý düzeltiniz.', mtError, [mbOk]);
    Exit;
  end;

end;


function TfrmKullaniciTanimTopluIslem.SendMail(APwd: String): Boolean;
var
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
  QueryOpen(mainmod.qTmp, 'select smtp_username, smtp_password, smtp_host, smtp_port, smtp_ssl, smtp_usetls from sys_param_mc where mc_id=' + IntToStr(mainmod.MCID));
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

  MailAdr  := tblImport.FieldByName('email').AsString;

  Msg := TIdMessage.Create(nil);
  try
    Msg.From.Address := SenderAcc;
    Msg.Recipients.EMailAddresses := MailAdr;
    Msg.Subject      := 'Kullanýcý Bilgileri Hk. - KVKNET';
    Msg.ContentType  := 'multipart/mixed';
    with TIdText.Create(Msg.MessageParts, nil) do begin
      // Body.Text := 'HTML goes here';
      edMailMsg.Lines.LoadFromFile(ServerMod.FilesFolderPath + 'temp_mail/pwdmail.htm');
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
      SMTP.UseTLS    := utUseExplicitTLS;
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
      edMailMsg.Lines.Clear;
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

function TfrmKullaniciTanimTopluIslem.ParseMsg(AData: TUniMemo; APwd: String): TStringList;
var
  i   : Integer;
  Tmp      : String;
  Comp     ,
  UName    : String;
begin
  Result := TStringList.Create;
  if MainMod.MCType = 0 then Comp := MainMod.GCCode else Comp := MainMod.MCCode;
  UName  := tblImport.FieldByName('user_name').AsString;

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

procedure TfrmKullaniciTanimTopluIslem.tblImportBeforePost(DataSet: TDataSet);
var

  deptliste : string;
  deplist : TStringList;
  i : integer;
begin
  if beforepostcheck = false then exit;

  tblImport.FieldByName('durum').AsString := 'I';
  tblImport.FieldByName('mesaj').AsString := 'Kullanýcý bilgileri tam ve uygun.';

  if tblImport.FieldByName('user_name').AsString = '' then
  begin
    tblImport.FieldByName('durum').AsString := 'H';
    tblImport.FieldByName('mesaj').AsString := 'Kullanýcý adý boþ olamaz.';
  end
  else
  if tblImport.FieldByName('full_name').AsString = '' then
  begin
    tblImport.FieldByName('durum').AsString := 'H';
    tblImport.FieldByName('mesaj').AsString := 'Adý Soyadý boþ olamaz.';
  end
  else
  if tblImport.FieldByName('phone').AsString = '' then
  begin
    tblImport.FieldByName('durum').AsString := 'H';
    tblImport.FieldByName('mesaj').AsString := 'Telefon numarasý boþ olamaz.';
  end
  else
  if tblImport.FieldByName('email').AsString = '' then
  begin
    tblImport.FieldByName('durum').AsString := 'H';
    tblImport.FieldByName('mesaj').AsString := 'E-Mail adresi boþ olamaz.';
  end
  else
  begin
    tblImport.FieldByName('durum').AsString := 'I';
    tblImport.FieldByName('mesaj').AsString := 'Kullanýcý bilgileri tam ve uygun.';
  end;

  queryOpen(qtmp, 'select user_name, full_name from usr_user where user_name=''' +Trim(tblImport.FieldByName('user_name').AsString) + ''' and mc_id=' + IntToStr(mainMod.MCID));
  if qtmp.recordcount > 0 then
  begin
    tblImport.FieldByName('durum').AsString := 'H';
    tblImport.FieldByName('mesaj').AsString := 'Ayný kullanýcý adý ile daha önce eklenmiþ kullanýcý bulunmakta, kayýtlý kullanýcý: ' + qtmp.FieldByName('full_name').AsString;
  end;
  if tblImport.FieldByName('ldap_user_name').asstring <>'' then
  begin
    QueryOpen(qTmp,'select * from usr_user where ldap_user_name ='+QuotedStr(tblImport.FieldByName('ldap_user_name').asstring)) ;
    if qTmp.RecordCount>0 then
    begin
      tblImport.FieldByName('durum').AsString := 'H';
      tblImport.FieldByName('mesaj').AsString :=
        'Ayný LDAP kullanýcý adý ile daha önce eklenmiþ kullanýcý bulunmakta, kayýtlý kullanýcý: ' + qtmp.FieldByName('full_name').AsString;
    end;
  end;
  if tblImport.FieldByName('rol').AsString <> '' then
  begin
    QueryOpen(qtmp,' select * from usr_role where mc_id=' + inttostr(mainmod.MCID) +
      ' AND  rol=' + quotedstr(trim(tblImport.FieldByName('rol').AsString)) );
    if qTmp.IsEmpty then
    begin
      tblImport.FieldByName('durum').AsString := 'H';
      tblImport.FieldByName('mesaj').AsString :=
        'Tanýmlý rol bulunamadý :' + qtmp.FieldByName('rol').AsString;
    end;
  end;

       if tblImport.FieldByName('list_dept').AsString <> '' then
      begin
        deptliste := StringReplace(trim(tblImport.FieldByName('list_dept').AsString),' ','',[rfReplaceAll]);
        if  TRegEx.IsMatch(deptliste, '^\d+(,\d+)*$') then
        begin
            DepList := TStringList.Create;
            try
              DepList.StrictDelimiter := True;
              DepList.Delimiter := ',';
              DepList.DelimitedText := deptliste;
              for I := 0 to deplist.Count -1 do
              begin
                QueryOpen(qTmp,'SELECT * FROM sys_deptdef WHERE active=''E'' AND mc_id='+inttostr(mainmod.MCID)+
                ' and id='+ deplist[i]);
                if qTmp.IsEmpty then
                begin
                  tblImport.FieldByName('durum').AsString := 'H';
                  tblImport.FieldByName('mesaj').AsString :=
                  deplist[i] + ': Yetkili Departman listesinde bulunamadý.';
                end;
              end;
            finally
              DepList.Free;
            end;
        end else
        begin
          tblImport.FieldByName('durum').AsString := 'H';
          tblImport.FieldByName('mesaj').AsString :=
            'Yetkili Departman listesine hata bulundu.';
        end;
      end;

end;

procedure TfrmKullaniciTanimTopluIslem.grdDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if column.FieldName = 'mesaj' then
  begin
    if grd.DataSource.DataSet.FieldByName('durum').AsString = 'H' then
    begin
      Attribs.Color := clRed;
      Attribs.Font.Style := [fsBold];
    end
    else
    if grd.DataSource.DataSet.FieldByName('durum').AsString = 'E' then
    begin
      Attribs.Color := clGreen;
      Attribs.Font.Style := [];
    end
    else
    begin
      Attribs.Color := clInfoBk;
      Attribs.Font.Style := [];
    end;
  end;
end;

end.
