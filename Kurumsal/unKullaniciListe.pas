unit unKullaniciListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Data.DB, DBAccess, Uni, MemDS,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPanel, uniBasicGrid,
  uniDBGrid, uniButton, uniBitBtn, uniEdit, uniMultiItem, uniComboBox, uniLabel, uniMemo,
  System.Actions, Vcl.ActnList, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdText, IdGlobal,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdMessage, VirtualTable,  VCL.FlexCel.Core,
  FlexCel.XlsAdapter, FlexCel.Report, FlexCel.Render, Vcl.Menus, uniMainMenu,
  uniMenuButton;

type
  TfrKullaniciListe = class(TUniFrame)
    pnlTop: TUniPanel;
    UniDBGrid1: TUniDBGrid;
    dsUser: TUniDataSource;
    ActList: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actResetPwd: TAction;
    actSearch: TAction;
    actClose: TAction;
    UniLabel1: TUniLabel;
    edSrcType: TUniComboBox;
    edSrcActive: TUniComboBox;
    edSrcText: TUniEdit;
    UniLabel2: TUniLabel;
    btnSearch: TUniBitBtn;
    btnAdd: TUniBitBtn;
    btnEdit: TUniBitBtn;
    btnDelete: TUniBitBtn;
    btnClose: TUniBitBtn;
    edMailMsg: TUniMemo;
    btnTopluEkle: TUniBitBtn;
    btnHelp: TUniBitBtn;
    btnExcel: TUniBitBtn;
    qExcel: TUniQuery;
    tblExcel: TVirtualTable;
    qTmp: TUniQuery;
    lbKayitSayisi: TUniLabel;
    btnDiger: TUniMenuButton;
    popDiger: TUniPopupMenu;
    mnLog: TUniMenuItem;
    procedure UniFrameCreate(Sender: TObject);
    procedure edSrcTypeChange(Sender: TObject);
    procedure edSrcActiveChange(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure actResetPwdExecute(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure btnTopluEkleClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
    procedure mnLogClick(Sender: TObject);
  private
    function ParseMsg(AData: TUniMemo; APwd: String): TStringList;
    function SendMail(APwd: String): Boolean;
    procedure ResetPwdControl(Sender: TComponent; Res: Integer);
    procedure NewSQL;
    procedure ManageSettings;
    function sendmail_enejibakanligi(APwd: String): boolean;
  public
  end;

implementation

{$R *.dfm}

uses MainModule, ServerModule, McMLib, Main, unKullaniciTanim,
     unKullaniciTanimTopluIslem, unHelpPage, unLogKullaniciTanim, unMailUtils;

{ TfrKullaniciListe }

procedure TfrKullaniciListe.actAddExecute(Sender: TObject);
var
  sCount,
  SQLStr : String;
  iCount : Integer;
  MCID   : Integer;
begin
  if MainMod.MCType = 0 then MCID := 0 else MCID := MainMod.MCID;

  sCount := MainMod.GetParameter2(MainMod.qTmp, MainMod.GCID, MCID, 'DB SERVER'); // Kullan�c� Say�s�
  iCount := StrToIntDef(sCount, 0);

  QueryOpen(qTmp, 'SELECT * FROM usr_user WHERE gc_id = ' + IntToStr(MainMod.GCID) + ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' AND active = ''E''');

  if qTmp.RecordCount >= iCount  then
  begin
    MessageDlg('Lisans�n�z�n izin verdi�i kullan�c� say�s�na ula�t�n�z. (Max. ' + IntToStr(iCount) + ' kullan�c�)'#13 +
               'Yeni kullan�c� olu�turamazs�n�z.', mtError, [mbOk]);
    Exit;
  end;

  if frmKullaniciTanim.Insert = mrOk then RefreshQuery(MainMod.qUser);
  ManageSettings;
end;

procedure TfrKullaniciListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrKullaniciListe.actResetPwdExecute(Sender: TObject);
begin
  if MainMod.qUser.FieldByName('active').AsString <> 'E' then
  begin
    MessageDlg('Bu kullan�c� PAS�F olarak i�aretlenmi�. Parolas� s�f�rlanamaz veya de�i�tirilemez.', mtError, [mbOk]);
    Exit;
  end;
  if  Trim(MainMod.qUser.FieldByName('email').AsString) = '' then   //Do�an Ak�ay 11.03.2024 bo� email eklenmesi engellenmeli
  begin
    MessageDlg('Bu kullan�c� i�in mail adresi belirtilmemi�. Parolas� s�f�rlanamaz veya de�i�tirilemez.', mtError, [mbOk]);
    Exit;
  end;

  if not CheckEMail(Trim(MainMod.qUser.FieldByName('email').AsString)) then     // Do�an Ak�ay 11. 03.2024
    begin
      MessageDlg('Kullanici  mail adresi uygun de�ildir. Parola s�f�rlanamaz ve de�i�tirilemez. ',mtError,[mbOK]);
      exit;
    end;


  MessageDlg('D�KKAT..! Kullan�c�n�n parolas�n� s�f�rlamak istedi�inizden emin misiniz?', mtConfirmation, mbYesNo, ResetPwdControl);
end;

procedure TfrKullaniciListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKullaniciListe.btnEditClick(Sender: TObject);
begin
  if MainMod.qUser.FieldByName('active').AsString <> 'E' then
  begin
    if not MainMod.LoginInfo.Yetkiler[15] then
    begin
      MessageDlg('De�i�tirmek istedi�iniz kay�t PAS�F yap�lm��. Bu kayd� de�i�tirme yetkiniz yok.', mtError, [mbOk]);
      Exit;
    end;
  end;

  if frmKullaniciTanim.Edit = mrOk then RefreshQuery(MainMod.qUser);
  ManageSettings;
end;

procedure TfrKullaniciListe.btnExcelClick(Sender: TObject);
var
  Report  : TFlexCelReport;
  FName   : String;
  TmpName : String;
  FUrl    : String;
	SQLStr,
  SrcText,
	WhereStr : string;
begin
  if MainMod.qUser.RecordCount < 1 then Exit;
  tblExcel.Clear;
	SQLStr   := 'SELECT user_name,full_name,phone,email,rol, fnc_id2str(list_dept, ''sys_deptdef'', ''title'') AS departman FROM usr_user ';

  WhereStr 	:= 'gc_id = ' + IntToStr(MainMod.GCID) + ' AND ';
  if MainMod.MCType = 0
     then WhereStr 	:= WhereStr + 'mc_id = 0 AND '
	   else WhereStr 	:= WhereStr + 'mc_id = ' + IntToStr(MainMod.MCID) + ' AND ';

	case edSrcActive.ItemIndex of
		0 : WhereStr := WhereStr + 'active = ''E'' AND ';
		1 : WhereStr := WhereStr + 'active = ''H'' AND ';
	end;
  if edSrcText.Text <> '' then
  begin
    srctext := StringReplace(edSrcText.Text, '*', '%', [rfReplaceAll]);
    case edSrcType.ItemIndex of
      0 : WhereStr := WhereStr + 'user_name LIKE ''%'  + SrcText  + '%'' AND ';
      1 : WhereStr := WhereStr + 'full_name  LIKE ''%' + SrcText  + '%'' AND ';
      2 : WhereStr := WhereStr + 'rol LIKE ''%' + SrcText  + '%'' AND ';
      { TK-22.05.2023
      3 : WhereStr := WhereStr + 'phone LIKE ''' + SrcText  + ''' AND ';
      4 : WhereStr := WhereStr + 'email LIKE ''' + SrcText  + ''' AND ';
      }
		end;
	end;

  if Trim(WhereStr) <> '' then System.Delete(WhereStr, Length(WhereStr) - 3, 4);
  if Trim(WhereStr) <> '' then SQLStr := SQLStr + 'WHERE ' + WhereStr;
  SQLStr := SQLStr + ' ORDER BY id';

  QueryOpen(qExcel, SQLStr);

  while not qExcel.Eof do
  begin
    tblExcel.Insert;
    tblExcel.FieldByName('uname_str').AsString    := qExcel.FieldByName('user_name').AsString;
    tblExcel.FieldByName('fullname_str').AsString := qExcel.FieldByName('full_name').AsString;
    tblExcel.FieldByName('phone_str').AsString    := qExcel.FieldByName('phone').AsString;
    tblExcel.FieldByName('mail_str').AsString     := qExcel.FieldByName('email').AsString;
    tblExcel.FieldByName('dept_str').AsString     := qExcel.FieldByName('departman').AsString;
    tblExcel.Post;
    qExcel.Next;
  end;
  Report := TFlexCelReport.Create(True);
  try
    Report.AddTable('tbllist', tblExcel);
    FUrl    := '';
    FName   := 'Kullanici_Departman_Excel_Listesi';
    TmpName := ServerMod.NewCacheFileUrl(False, 'xlsx', FName, '', FUrl, True);
    Report.Run(ServerMod.FilesFolderPath + 'temp_xls\kullanici_departman_liste.template.xlsx', TmpName);
  finally
    Report.Free;
  end;
  UniSession.SendFile(TmpName, FName + '.xlsx');
end;

procedure TfrKullaniciListe.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('KullaniciListe');
end;

procedure TfrKullaniciListe.btnTopluEkleClick(Sender: TObject);
begin
  frmKullaniciTanimTopluIslem.Exec('Ekle');
  RefreshQuery(MainMod.qUser);
  ManageSettings;
end;

procedure TfrKullaniciListe.edSrcActiveChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKullaniciListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrKullaniciListe.edSrcTypeChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKullaniciListe.ManageSettings;
begin
  actAdd.Enabled      := MainMod.LoginInfo.Yetkiler[13] and (MainMod.qUser.State = dsBrowse);
  actEdit.Enabled     := MainMod.LoginInfo.Yetkiler[14] and (MainMod.qUser.State = dsBrowse) and (MainMod.qUser.FieldByName('id').AsInteger > 0);

  actResetPwd.Enabled := MainMod.LoginInfo.Yetkiler[84] and (MainMod.qUser.State = dsBrowse) and (MainMod.qUser.FieldByName('id').AsInteger > 0);

  actClose.Enabled    := not DataEditing(MainMod.qUser);
end;

procedure TfrKullaniciListe.mnLogClick(Sender: TObject);
begin
  frmLogKullaniciTanim.Exec(dsUser.DataSet.FieldByName('id').AsInteger);
end;

procedure TfrKullaniciListe.NewSQL;
var
	SQLStr,
  srcText,
	WhereStr : string;
begin
  if not GuvenliGirisMi(edSrcText.Text) then
  begin
    MessageDlg('Ge�ersiz giri�! L�tfen �zel karakterler veya SQL komutlar� kullanmay�n.',mtConfirmation,[mbYes]) ;
    exit;
  end;

	SQLStr   := 'SELECT * FROM usr_user ';

  WhereStr 	:= 'gc_id =:gc_id AND ';
  if MainMod.MCType = 0
     then WhereStr 	:= WhereStr + 'mc_id = 0 AND '
	   else WhereStr 	:= WhereStr + 'mc_id =:mc_id AND ';

	case edSrcActive.ItemIndex of
		0 : WhereStr := WhereStr + 'active = ''E'' AND ';
		1 : WhereStr := WhereStr + 'active = ''H'' AND ';
	end;
  if edSrcText.Text <> '' then
  begin
    if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
    case edSrcType.ItemIndex of
      0 : WhereStr := WhereStr + 'user_name LIKE :srctext AND ';
      1 : WhereStr := WhereStr + 'full_name  LIKE :srctext AND ';
      2 : WhereStr := WhereStr + 'rol LIKE :srctext AND ';
      { TK-22.05.2023
      3 : WhereStr := WhereStr + 'phone LIKE ''' + SrcText  + ''' AND ';
      4 : WhereStr := WhereStr + 'email LIKE ''' + SrcText  + ''' AND ';
      }
		end;
	end;

  if Trim(WhereStr) <> '' then System.Delete(WhereStr, Length(WhereStr) - 3, 4);
  if Trim(WhereStr) <> '' then SQLStr := SQLStr + 'WHERE ' + WhereStr;
  SQLStr := SQLStr + ' ORDER BY id';

//	QueryOpen(MainMod.qUser, SQLStr);
  mainmod.qUser.SQL.Text := SQLStr ;
  mainmod.qUser.ParamByName('gc_id').AsString := IntToStr(mainmod.GCID);
  if mainmod.qUser.FindParam('mc_id') <> nil then
    mainmod.qUser.ParamByName('mc_id').asstring := inttostr(mainmod.MCID);
  if mainmod.qUser.FindParam('srctext') <> nil then
    mainmod.qUser.ParamByName('srctext').asstring := srcText ;

  MainMod.qUser.Open ;
  ManageSettings;
  lbKayitSayisi.Text := IntToStr(MainMod.qUser.RecordCount) + ' Kay�t Listelendi...';
end;

function TfrKullaniciListe.ParseMsg(AData: TUniMemo; APwd: String): TStringList;
var
  i   : Integer;
  Tmp      : String;
  Comp     ,
  UName    : String;
begin
  Result := TStringList.Create;
  if MainMod.MCType = 0 then Comp := MainMod.GCCode else Comp := MainMod.MCCode;
  UName  := MainMod.qUser.FieldByName('user_name').AsString;

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

procedure TfrKullaniciListe.ResetPwdControl(Sender: TComponent; Res: Integer);
var
  NewPwd : String;
  oldPWd :string;
  mailSonuc : Boolean;
  mailSaglayici : string;
begin
    if Res <> mrYes then Exit;
    oldPWd :=  MainMod.qUser.FieldByName('user_pwd').AsString;
  try
    NewPwd := MainMod.CreatePassword;

    edMailMsg.Lines.LoadFromFile(ServerMod.FilesFolderPath + 'temp_mail/pwdmail.htm');
    {
    QueryOpen(qTmp, 'SELECT p.email_saglayici saglayici FROM sys_param_mc p where p.mc_id = ' + inttostr(mainmod.MCID)) ;
    if qTmp.IsEmpty then  exit;
    if qTmp.FieldByName('saglayici').AsString ='' then
       mailSaglayici := 'VARSAYILAN'
    else
       mailSaglayici := qTmp.FieldByName('saglayici').AsString;

    if mailSaglayici ='VARSAYILAN' then
      mailSonuc := SendMail(NewPwd)
    ELSE if mailSaglayici ='ENERJIBAKANLIGI' then
      mailSonuc := sendmail_enejibakanligi(NewPwd);
      }
      //unmailutils kullan�ld�
     try
      mailSonuc := GenelSendEmail(MainMod.qUser.FieldByName('email').AsString,'KVKNET - Kullan�c� Bilgilendirme',ParseMsg(edMailMsg, NewPwd).Text) ;
     except
        on E: Exception do
            ShowMessageN(E.Message);
     end;


    if mailSonuc then
    begin
      MainMod.qUser.Edit;
      MainMod.qUser.FieldByName('user_pwd').AsString := EncryptStr(NewPwd);
      MainMod.qUser.Post;
      MessageDlg('Parola ba�ar� ile s�f�rland� ve ilgili kullan�c�ya parolas� mail g�nderildi.', mtInformation, [mbOk]);
    end;
    edMailMsg.Lines.Clear;
  except  on e: exception do
    begin
      if MainMod.qUser.State in[dsBrowse] then
        MainMod.qUser.Edit;
      MainMod.qUser.FieldByName('user_pwd').AsString := oldPWd;
      MainMod.qUser.Post;
     // MessageDlg('Mail g�nderiminde hata olu�tu, Parola S�f�rlama i�leminiz iptal edildi',TMsgDlgType.mtError,[mbok]);
     ShowMessageN('Mail g�nderiminde hata olu�tu, Parola S�f�rlama i�leminiz iptal edildi') ;
    end;

  end;
end;

function TfrKullaniciListe.sendmail_enejibakanligi(APwd: String): Boolean;
var
  MailAdr, SenderAcc, SenderPwd, SenderHost, SenderPort: String;
  senderSSL: Boolean;
  senderTLS: Integer;
  SMTP: TIdSMTP;
  Msg: TIdMessage;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  HTMLMsg: TStringList;
begin
  Result := False;

  // Mail ayarlar�n� �ek
  QueryOpen(mainmod.qTmp,
    'SELECT smtp_username, smtp_password, smtp_host, smtp_port, smtp_ssl, smtp_usetls ' +
    'FROM sys_param_mc WHERE mc_id=' + IntToStr(mainmod.MCID));


  SenderHost := mainmod.qTmp.FieldByName('smtp_host').AsString;
  SenderPort := mainmod.qTmp.FieldByName('smtp_port').AsString;
  senderSSL  := (mainmod.qTmp.FieldByName('smtp_ssl').AsString = 'E');
  senderTLS  := mainmod.qTmp.FieldByName('smtp_usetls').AsInteger;

  if (SenderHost = '') or (SenderPort = '') then
  begin
    MessageDlg('Firma Mail Sunucu ayarlar� yap�lmam��. L�tfen kurum parametrelerini kontrol ediniz.', mtError, [mbOk]);
    Exit;
  end;

  MailAdr := MainMod.qUser.FieldByName('email').AsString;
  if MailAdr = '' then
  begin
    MessageDlg('Kullan�c�n�n e-posta adresi tan�ml� de�il.', mtWarning, [mbOk]);
    Exit;
  end;

  SMTP := TIdSMTP.Create(nil);
  Msg := TIdMessage.Create(nil);
  SSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  HTMLMsg := TStringList.Create;

  try
    // Mail i�eri�i haz�rlan�yor
    Msg.From.Address := 'kvkkbildirim@enerji.gov.tr';//SenderAcc;
    Msg.Recipients.EmailAddresses := MailAdr;
    Msg.Subject := 'KVKNET - Kullan�c� Bilgilendirme';
    Msg.ContentType := 'multipart/alternative';

    HTMLMsg := ParseMsg(edMailMsg, APwd); // HTML i�eri�ini haz�rla

    with TIdText.Create(Msg.MessageParts, nil) do
    begin
      Body.Assign(HTMLMsg);
      ContentType := 'text/html';
    end;

    // SSL ayarlar�
    SSLHandler.SSLOptions.Method := sslvTLSv1_2;//sslvTLSv1;
    SSLHandler.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
    SSLHandler.SSLOptions.Mode := sslmClient;
    SSLHandler.SSLOptions.VerifyMode := [];
    SSLHandler.SSLOptions.VerifyDepth := 0;

    if senderSSL then
    begin
      SMTP.IOHandler := SSLHandler;
      SMTP.UseTLS := TIdUseTLS(senderTLS); // Gelen de�eri kullan
    end
    else
      SMTP.UseTLS := utUseExplicitTLS;

    SMTP.Host := SenderHost;
    SMTP.Port := StrToIntDef(SenderPort, 25);
    SMTP.ConnectTimeout := 10000;
    SMTP.AuthType := satNone;




    try
      SMTP.Connect;

      if SMTP.Connected then
      begin
       SMTP.Send(Msg);
        Result := True;
        SMTP.Disconnect;
      end;
    except
      on E: Exception do
      begin
        MessageDlg('E-posta g�nderilirken hata olu�tu: ' + E.Message , mtWarning, [mbOk]);
        Result := False;
      end;
    end;

  finally
    HTMLMsg.Free;
    SSLHandler.Free;
    Msg.Free;
    SMTP.Free;
  end;
end;

function TfrKullaniciListe.SendMail(APwd: String): Boolean;
var
  AParam     : TParameter;
  MailAdr    ,
  SenderAcc  ,
  SenderPwd  ,
  senderFrom ,
  SenderHost ,
  SenderPort : String;
  senderSSL  : Boolean;
  senderTLS  : Integer;
  SMTP       : TIdSMTP;
  Msg        : TIdMessage;
  SSLHandler : TIdSSLIOHandlerSocketOpenSSL;
  HTMLMsg    : TStringList;
  indx       : integer;
begin

  QueryOpen(mainmod.qTmp, 'select smtp_username, smtp_password, smtp_host, smtp_port, smtp_ssl, smtp_usetls from sys_param_mc where mc_id=' + IntToStr(mainmod.MCID));
  senderAcc  := mainmod.qTmp.fieldByName('smtp_username').AsString;
   indx := pos('&&',senderAcc);
  if indx <= 0 then
  begin
    senderAcc  := mainmod.qTmp.fieldByName('smtp_username').AsString;
    senderFrom := mainmod.qTmp.fieldByName('smtp_username').AsString;
  end else
  begin
    senderAcc  := Copy(senderAcc, 1, indx - 1);                  // '&&' �ncesi
    senderFrom := Copy(senderAcc, indx + Length('&&'), MaxInt); // '&&' sonras�
  end;

  senderPwd  := mainMod.qTmp.FieldByName('smtp_password').AsString;
  senderHost := mainmod.qTmp.fieldByName('smtp_host').AsString;
  senderPort := mainMod.qTmp.FieldByName('smtp_port').AsString;
  senderSSL  := (mainMod.qTmp.FieldByName('smtp_ssl').AsString = 'E');
  senderTLS  := mainMod.qTmp.FieldByName('smtp_usetls').AsInteger;

  if (SenderAcc = '') or (SenderPwd = '') then
  begin
    MessageDlg('Firma Mail Hesab� tan�mlanmam��. L�tfen kurum parametrelerini kontrol ediniz.', mtError, [mbOk]);
    Exit;
  end;

  if (SenderHost = '') or (SenderPort = '') then
  begin
    MessageDlg('Firma Mail Sunucu ayarlar� yap�lmam��. L�tfen kurum parametrelerini kontrol ediniz.', mtError, [mbOk]);
    Exit;
  end;

  senderPwd := DecryptStr(senderPwd);

  MailAdr  := MainMod.qUser.FieldByName('email').AsString;

  Msg := TIdMessage.Create(nil);
  try
    Msg.From.Address := senderFrom ;//SenderAcc;
    Msg.Recipients.EMailAddresses := MailAdr;
    Msg.Subject      := 'Kullan�c� Bilgileri Hk. - KVKNET';
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
      SSLHandler.SSLOptions.Method := sslvTLSv1_2;//sslvTLSv1; // sslvSSLv23;
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
    end;
  finally
    Msg.Free;
  end;
  if not Result then
  begin
    MessageDlg('Mail g�nderilirken hata olu�tu. ��lem ba�ar�s�z.', mtError, [mbOk]);
    Exit;
  end;
end;

procedure TfrKullaniciListe.UniButton1Click(Sender: TObject);
begin
  mainmod.qUser.First;
  while not mainmod.quser.Eof do
  begin
    if Length(mainmod.qUser.FieldByName('user_pwd').AsString) = 16 then
    begin
      MainMod.qUser.Edit;
      mainmod.qUser.FieldByName('user_pwd').AsString := EncryptStr(mainmod.qUser.FieldByName('user_pwd').AsString);
      mainmod.qUser.Post;
    end;

    mainmod.qUser.Next;
  end;
end;

procedure TfrKullaniciListe.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  MainMod.qUser.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrKullaniciListe.UniFrameCreate(Sender: TObject);
begin
  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;
  tblExcel.Open;
end;

initialization
  RegisterClass(TfrKullaniciListe);

end.

