unit unParametreMCTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StdCtrls,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniCheckBox, uniDBCheckBox, uniEdit, uniDBEdit, uniLabel,
  uniGUIBaseClasses, uniPanel, uniBasicGrid, uniDBGrid, uniDBLookupComboBox, uniMultiItem, uniComboBox,
  uniDBComboBox, uniPageControl, Data.DB, DBAccess, Uni, uniImage, uniDBImage, uniFileUpload,
  uniMemo, uniDBMemo, MemDS, uniHTMLMemo;

type
  TfrmParametreMCTanim = class(TUniForm)
    btnEdit: TUniBitBtn;
    btnPost: TUniBitBtn;
    btnCancel: TUniBitBtn;
    pnlLog: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    lbIDY: TUniLabel;
    lbIDT: TUniLabel;
    lbSDY: TUniLabel;
    lbSDT: TUniLabel;
    PgControl: TUniPageControl;
    pgSMS: TUniTabSheet;
    edSMSOrijin: TUniDBEdit;
    UniLabel30: TUniLabel;
    pgVeriSorumlusu: TUniTabSheet;
    UniLabel13: TUniLabel;
    UniLabel34: TUniLabel;
    edVSAd: TUniDBEdit;
    edSMTPHost: TUniDBEdit;
    edVSAdresNo: TUniDBEdit;
    pgIYS: TUniTabSheet;
    dsMCParam: TUniDataSource;
    pnlButtons: TUniPanel;
    UniLabel18: TUniLabel;
    UniLabel20: TUniLabel;
    UniLabel21: TUniLabel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    edSMSHost: TUniDBEdit;
    cbSMSSaglayici: TUniDBComboBox;
    UniDBCheckBox1: TUniDBCheckBox;
    UniLabel3: TUniLabel;
    UniLabel9: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniDBEdit3: TUniDBEdit;
    UniLabel11: TUniLabel;
    UniLabel12: TUniLabel;
    UniLabel14: TUniLabel;
    UniDBEdit4: TUniDBEdit;
    cbIysSaglayici: TUniDBComboBox;
    UniDBEdit5: TUniDBEdit;
    UniLabel15: TUniLabel;
    UniLabel16: TUniLabel;
    UniDBCheckBox2: TUniDBCheckBox;
    pgAR: TUniTabSheet;
    UniLabel23: TUniLabel;
    UniLabel24: TUniLabel;
    UniLabel25: TUniLabel;
    pgOO: TUniTabSheet;
    UniLabel29: TUniLabel;
    UniLabel31: TUniLabel;
    UniLabel32: TUniLabel;
    edIYSPassword: TUniEdit;
    edSMTPPassword: TUniEdit;
    UniDBMemo1: TUniDBMemo;
    UniDBMemo2: TUniDBMemo;
    UniDBMemo3: TUniDBMemo;
    UniDBMemo4: TUniDBMemo;
    UniDBMemo5: TUniDBMemo;
    UniDBMemo6: TUniDBMemo;
    UniLabel17: TUniLabel;
    UniDBCheckBox3: TUniDBCheckBox;
    pgZD: TUniTabSheet;
    UniLabel8: TUniLabel;
    UniLabel10: TUniLabel;
    edSMSUsername: TUniDBEdit;
    edSMSPassword: TUniEdit;
    UniLabel19: TUniLabel;
    UniLabel22: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    edzdPassword: TUniEdit;
    UniLabel26: TUniLabel;
    cbSMTPUseTLS: TUniComboBox;
    UniLabel27: TUniLabel;
    UniDBCheckBox4: TUniDBCheckBox;
    UniDBCheckBox5: TUniDBCheckBox;
    UniLabel28: TUniLabel;
    pgKurum: TUniTabSheet;
    UniLabel33: TUniLabel;
    UniDBComboBox1: TUniDBComboBox;
    UniLabel35: TUniLabel;
    UniLabel36: TUniLabel;
    UniDBEdit6: TUniDBEdit;
    UniDBEdit7: TUniDBEdit;
    UniLabel37: TUniLabel;
    edAPIPassword: TUniEdit;
    UniLabel38: TUniLabel;
    UniDBEdit8: TUniDBEdit;
    UniLabel39: TUniLabel;
    UniDBComboBox2: TUniDBComboBox;
    UniLabel40: TUniLabel;
    UniDBEdit9: TUniDBEdit;
    UniLabel41: TUniLabel;
    UniDBEdit10: TUniDBEdit;
    btnHelp: TUniBitBtn;
    UniLabel42: TUniLabel;
    UniDBCheckBox6: TUniDBCheckBox;
    btnZDKontor: TUniButton;
    pgldap: TUniTabSheet;
    qsysparameter: TUniQuery;
    dssysparameter: TUniDataSource;
    cbldapturu: TUniComboBox;
    UniLabel43: TUniLabel;
    UniLabel44: TUniLabel;
    edldapurl: TUniEdit;
    UniLabel45: TUniLabel;
    edldapclientid: TUniEdit;
    UniLabel46: TUniLabel;
    edldapscret: TUniEdit;
    edvarsiyalangonderici: TUniDBEdit;
    UniLabel47: TUniLabel;
    UniLabel48: TUniLabel;
    UniDBCheckBox7: TUniDBCheckBox;
    UniLabel49: TUniLabel;
    cbSMTPTip: TUniDBComboBox;
    UniPanel1: TUniPanel;
    UniLabel50: TUniLabel;
    UniLabel51: TUniLabel;
    UniLabel52: TUniLabel;
    UniLabel53: TUniLabel;
    UniLabel54: TUniLabel;
    UniLabel55: TUniLabel;
    UniLabel56: TUniLabel;
    UniLabel57: TUniLabel;
    UniLabel58: TUniLabel;
    UniLabel59: TUniLabel;
    UniLabel60: TUniLabel;
    UniLabel61: TUniLabel;
    UniLabel62: TUniLabel;
    UniLabel63: TUniLabel;
    UniLabel64: TUniLabel;
    UniLabel65: TUniLabel;
    UniDBEdit11: TUniDBEdit;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    Data : TUniQuery;
    ldapTuru : string;
    ldapurl: string;
    ldapclient_id: string;
    ldapsecret: string;
    procedure ManageSettings;
  public
  end;

function frmParametreMCTanim: TfrmParametreMCTanim;

implementation

uses
  uniGUIApplication, MainModule, McMLib, unHelpPage;

{$R *.dfm}

function frmParametreMCTanim: TfrmParametreMCTanim;
begin
  Result := TfrmParametreMCTanim(MainMod.GetFormInstance(TfrmParametreMCTanim));
end;

procedure TfrmParametreMCTanim.btnCancelClick(Sender: TObject);
begin
  if btnCancel.Caption = 'Ýptal' then
  begin
    Data.Cancel;
    ManageSettings;
  end
  else
  begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmParametreMCTanim.btnEditClick(Sender: TObject);
begin
{TODO:kurum parametre yetkileri}
//  if Data.FieldByName('active').AsString <> 'E' then
//  begin
//    if not MainMod.LoginInfo.Yetkiler[5] then
//    begin
//      MessageDlg('Deðiþtirmek istediðiniz kayýt PASÝF yapýlmýþ. Bu kaydý deðiþtirme yetkiniz yok.', mtError, [mbOk]);
//      Exit;
//    end;
//  end;

  Data.Edit;
  ManageSettings;
  //edTitle.SetFocus;
end;

procedure TfrmParametreMCTanim.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('ParametreMCTanim');
end;

procedure TfrmParametreMCTanim.btnPostClick(Sender: TObject);
var
ldapchange : boolean;
begin
  ldapchange := false;
  if (Data.FieldByName('ar_genel_yonlendirme_adresi').AsString <> '')
    and (pos('HTTP', UpperCase(Data.FieldByName('ar_genel_yonlendirme_adresi').AsString)) <= 0) then
  begin
    MessageDlg('Açýk Rýza sonrasý yönlendirme adresini kontrol ediniz.', mtError, [mbOk]);
    UniDBMemo3.SetFocus;
    Exit;
  end;

  if (Data.FieldByName('oo_genel_yonlendirme_adresi').AsString <> '')
    and (pos('HTTP', UpperCase(Data.FieldByName('oo_genel_yonlendirme_adresi').AsString)) <= 0) then
  begin
    MessageDlg('Özel Onay sonrasý yönlendirme adresini kontrol ediniz.', mtError, [mbOk]);
    UniDBMemo6.SetFocus;
    Exit;
  end;

  if (Data.FieldByName('ar_sms_dogrulama').AsString <> 'E')
    and (Data.FieldByName('ar_email_dogrulama').AsString <> 'E') then
  begin
    MessageDlg('Açýk Rýza parametrelerinde SMS veya EMAIL ile doðrulama seçeneklerinden biri seçilmelidir.', mtError, [mbOk]);
    UniDBMemo6.SetFocus;
    Exit;
  end;

  Data.FieldByName('sdy').AsInteger  := MainMod.LoginInfo.ID;
  Data.FieldByName('sdt').AsDateTime := Now;
  if edSMTPPassword.Text <> '' then
    Data.FieldByName('smtp_password').AsString := EncryptStr(edSMTPPassword.Text);

  if edSMSPassword.Text <> '' then
    Data.FieldByName('sms_password').AsString := EncryptStr(edSMSPassword.Text);

  if edIYSPassword.Text <> '' then
    Data.FieldByName('iys_password').AsString := EncryptStr(edIYSPassword.Text);

  if edzdPassword.Text <> '' then
    Data.FieldByName('zd_password').AsString := EncryptStr(edzdPassword.Text);


    DecryptStr(Data.FieldByName('zd_password').AsString) ;

  if edAPIPassword.Text <> '' then
    Data.FieldByName('api_password').AsString := EncryptStr(edAPIPassword.Text);

  if data.FieldByName('mc_id').AsString = '' then
    data.FieldByName('mc_id').AsInteger := mainmod.MCID;

  if (cbSMTPUseTLS.ItemIndex > -1) and (cbSMTPUseTLS.ItemIndex < 4) then
    data.fieldByName('smtp_usetls').AsInteger := cbSMTPUseTLS.ItemIndex
  else
  begin
    MessageDlg('SMTP ayarlarýnda TLS belitrilmemiþ.', mtError, [mbOk]);
    cbSMTPUseTLS.SetFocus;
    Exit;
  end;

  Data.Post;

  qsysparameter.First;
  while not qsysparameter.Eof do
  begin
    if qsysparameter.FieldByName('param_val').AsString='LDAP HOST' then
     begin
       if (qsysparameter.FieldByName('val1').AsString <> edldapurl.Text) or
          (qsysparameter.FieldByName('val2').AsString <> edldapclientid.Text) or
          (qsysparameter.FieldByName('val2').AsString <> edldapscret.Text)  then
       begin
         qsysparameter.Edit ;
         qsysparameter.FieldByName('val1').AsString := edldapurl.Text;
         qsysparameter.FieldByName('val2').AsString := edldapclientid.Text;
         qsysparameter.FieldByName('val3').AsString := edldapscret.Text;
         qsysparameter.Post;
       end;

     end;

    if qsysparameter.FieldByName('param_val').AsString='LDAP AKTÝF' then
     begin
       if (qsysparameter.FieldByName('val1').AsString <> cbldapturu.Text)  then
       begin
         qsysparameter.Edit ;
         qsysparameter.FieldByName('val1').AsString := cbldapturu.Text;
         qsysparameter.Post;
       end;
     end;


    qsysparameter.Next;
  end;

  ManageSettings;
end;

procedure TfrmParametreMCTanim.ManageSettings;
begin
  btnEdit.Enabled     := MainMod.LoginInfo.Yetkiler[4] and (Data.State = dsBrowse) and (Data.FieldByName('mc_id').AsInteger > 0);
  btnPost.Enabled     := DataEditing(Data);

  if btnPost.Enabled then
  begin
    btnCancel.Caption := 'Ýptal';
//    btnCancel.ImageIndex := 2;
  end
  else
  begin
    btnCancel.Caption := 'Kapat';
//    btnCancel.ImageIndex := 3;
  end;

  edSMSPassword.ReadOnly := btnEdit.Enabled;
  edSMTPPassword.ReadOnly := btnEdit.Enabled;
  edIYSPassword.ReadOnly := btnEdit.Enabled;
  edzdPassword.ReadOnly := btnEdit.Enabled;
  cbSMSSaglayici.ReadOnly := btnEdit.Enabled;
  cbIysSaglayici.ReadOnly := btnEdit.Enabled;
  cbSMTPUseTLS.ReadOnly := btnEdit.Enabled;
  edSMTPHost.ReadOnly := btnEdit.Enabled;

  cbldapturu.ReadOnly := not ( Data.State  in [dsEdit] );
  edldapurl.ReadOnly := not ( Data.State  in [dsEdit] );
  edldapclientid.ReadOnly := not ( Data.State  in [dsEdit] );
  edldapscret.ReadOnly := not ( Data.State  in [dsEdit] );


end;

procedure TfrmParametreMCTanim.UniFormBeforeShow(Sender: TObject);
begin
  Data := MainMod.qMCParam;
  data.Refresh;

   QueryOpen(qsysparameter,' SELECT * FROM sys_parameter where param_val in (''LDAP AKTÝF'',''LDAP HOST'') '  );
  qsysparameter.First;
  while not qsysparameter.Eof do
  begin
    if qsysparameter.FieldByName('param_val').AsString='LDAP AKTÝF' then
    begin
      ldapTuru := qsysparameter.FieldByName('val1').AsString;
      cbldapturu.Text := ldapTuru;
    end;
    if qsysparameter.FieldByName('param_val').AsString='LDAP HOST' then
    begin
      ldapurl := qsysparameter.FieldByName('val1').AsString;
      edldapurl.Text := ldapurl;
      ldapclient_id := qsysparameter.FieldByName('val2').AsString;
      edldapclientid.text := ldapclient_id;
      ldapsecret := qsysparameter.FieldByName('val3').AsString;
      edldapscret.text := ldapsecret ;
    end;
    qsysparameter.Next;
  end;

  ManageSettings;
  PgControl.ActivePage := pgKurum;

{  þifrelerin ele geçirilmesine karþý ekrana yüklemiyoruz
try
  if Data.FieldByName('smtp_password').AsString <> '' then
    edSMTPPassword.Text := DecryptStr(Data.FieldByName('smtp_password').AsString)
  else
    edSMTPPassword.Text := '';
except
    edSMTPPassword.Text := '';
end;
try
  if Data.FieldByName('sms_password').AsString <> '' then
    edSMSPassword.Text  := DecryptStr(Data.FieldByName('sms_password').AsString)
  else
    edSMSPassword.Text  := '';
except
    edSMSPassword.Text  := '';
end;
try
  if Data.FieldByName('iys_password').AsString <> '' then
    edIYSPassword.Text  := DecryptStr(Data.FieldByName('iys_password').AsString)
  else
    edIYSPassword.Text  := '';
except
    edIYSPassword.Text  := '';
end;
try
  if Data.FieldByName('zd_password').AsString <> '' then
    edzdPassword.Text  := DecryptStr(Data.FieldByName('zd_password').AsString)
  else
    edzdPassword.Text  := '';
except
    edzdPassword.Text  := '';
end;

try
  if Data.FieldByName('api_password').AsString <> '' then
    edAPIPassword.Text  := DecryptStr(Data.FieldByName('api_password').AsString)
  else
    edAPIPassword.Text  := '';
except
    edAPIPassword.Text  := '';
end;
}


  if (data.fieldByName('smtp_usetls').AsString <> '') then
    cbSMTPUseTLS.ItemIndex := data.fieldByName('smtp_usetls').AsInteger;

  lbIDY.Caption := MainMod.KullaniciGetir(Data.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(Data.FieldByName('sdy').AsString);

  if lbIDY.Text = '' then lbIDY.Text := 'SÝSTEM';
  if lbSDY.Text = '' then lbSDY.Text := 'SÝSTEM';

  if Data.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', Data.FieldByName('idt').AsDateTime);
  if Data.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', Data.FieldByName('sdt').AsDateTime);

//  Data.Edit;
  ManageSettings;
end;

end.
