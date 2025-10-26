unit unAcikRizaKayitTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Clipbrd, uniGUITypes,
  uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, Data.DB, MemDS, DBAccess, Uni, uniPanel, uniButton,
  uniBitBtn, uniCheckBox, uniDBCheckBox, uniDBLookupComboBox, uniMemo, uniDBMemo, uniMultiItem, uniComboBox,
  uniDBComboBox, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses, uniDateTimePicker, uniDBDateTimePicker,
  uniPageControl, uniBasicGrid, uniDBGrid, IdGlobal, IdSMTPBase, IdSMTP, IdSSL, IdSSLOpenSSL, IdMessage,
  IdText, IdExplicitTLSClientServerBase, uniGroupBox, uniImage, uniRadioGroup, uniDBRadioGroup,
  uniSpeedButton,StrUtils;

type
  TfrmAcikRizaKayitTanim = class(TUniForm)
    pnlButtons: TUniPanel;
    btnCancel: TUniBitBtn;
    btnPost: TUniBitBtn;
    pnlLog: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    lbIDY: TUniLabel;
    lbIDT: TUniLabel;
    lbSDY: TUniLabel;
    lbSDT: TUniLabel;
    dsRiza: TUniDataSource;
    qRiza: TUniQuery;
    qAyd: TUniQuery;
    dsAyd: TUniDataSource;
    qTmp: TUniQuery;
    qARDoc: TUniQuery;
    qARDocid: TIntegerField;
    qARDocmc_id: TIntegerField;
    qARDocidy: TIntegerField;
    qARDocidt: TDateTimeField;
    qARDocsdy: TIntegerField;
    qARDocsdt: TDateTimeField;
    qARDocbelge: TBlobField;
    dsARDoc: TUniDataSource;
    qARDocar_id: TIntegerField;
    UniLabel1: TUniLabel;
    UniLabel8: TUniLabel;
    edDesc: TUniDBMemo;
    UniLabel9: TUniLabel;
    edAydinlatma: TUniDBLookupComboBox;
    edKisi: TUniEdit;
    grdDocs: TUniDBGrid;
    btnDocsAdd: TUniBitBtn;
    btnDocsDel: TUniBitBtn;
    btnDocsDown: TUniBitBtn;
    UniLabel11: TUniLabel;
    UniLabel13: TUniLabel;
    btnSendSMS: TUniBitBtn;
    btnGoToLink: TUniBitBtn;
    edWebLink: TUniEdit;
    btnPrepLink: TUniBitBtn;
    btnEdit: TUniBitBtn;
    PgControl: TUniPageControl;
    pgGenel: TUniTabSheet;
    pgDocs: TUniTabSheet;
    pgVeriKaynagi: TUniTabSheet;
    UniLabel16: TUniLabel;
    grdVK: TUniDBGrid;
    qARVK: TUniQuery;
    dsARVK: TUniDataSource;
    btnVKChange: TUniBitBtn;
    btnVKDelete: TUniBitBtn;
    btnVKCalcDate: TUniBitBtn;
    lbSMSLog: TUniLabel;
    qAddIys: TUniQuery;
    groupIYS: TUniGroupBox;
    edIYSSMS: TUniDBCheckBox;
    edIYSPhone: TUniDBCheckBox;
    lbIYSPhone: TUniLabel;
    lbIYSSMS: TUniLabel;
    bIYSKontrol: TUniButton;
    edIYSEMail: TUniDBCheckBox;
    lbIYSEMail: TUniLabel;
    btnHelp: TUniBitBtn;
    lbOzel1: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    lbOzel2: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    imgQRCode: TUniImage;
    btnQRCode: TUniBitBtn;
    qARDocaciklama: TStringField;
    qARDocbelge_adi: TStringField;
    qARDocekleyen: TStringField;
    gbKisi: TUniGroupBox;
    UniLabel3: TUniLabel;
    UniLabel14: TUniLabel;
    edKimlikNo: TUniDBEdit;
    edGSMNo: TUniDBEdit;
    edEMail: TUniDBEdit;
    edAdSoyad: TUniDBEdit;
    UniLabel30: TUniLabel;
    UniLabel12: TUniLabel;
    gbVeli: TUniGroupBox;
    UniLabel17: TUniLabel;
    edVelieMail: TUniDBEdit;
    UniLabel20: TUniLabel;
    UniLabel19: TUniLabel;
    edveliGSM: TUniDBEdit;
    edVeliKimlikNo: TUniDBEdit;
    UniLabel18: TUniLabel;
    edVeliAdSoyad: TUniDBEdit;
    UniLabel10: TUniLabel;
    UniLabel2: TUniLabel;
    edDurum: TUniDBComboBox;
    edSaat: TUniDBEdit;
    edTarih: TUniDBDateTimePicker;
    edTimeStamp: TUniDBCheckBox;
    UniLabel15: TUniLabel;
    edFaaliyetBitis: TUniDBDateTimePicker;
    radioOnaySira: TUniRadioGroup;
    btnIYSGonder: TUniButton;
    btnVKRefresh: TUniBitBtn;
    btnSendMail: TUniBitBtn;
    edMailMsg: TUniMemo;
    cbTumDepartman: TUniCheckBox;
    UniLabel21: TUniLabel;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSendSMSClick(Sender: TObject);
    procedure btnGoToLinkClick(Sender: TObject);
    procedure btnPrepLinkClick(Sender: TObject);
    procedure dsRizaStateChange(Sender: TObject);
    procedure edAydinlatmaChange(Sender: TObject);
    procedure edDurumChange(Sender: TObject);
    procedure btnDocsAddClick(Sender: TObject);
    procedure btnDocsDelClick(Sender: TObject);
    procedure btnDocsDownClick(Sender: TObject);
    procedure btnVKDeleteClick(Sender: TObject);
    procedure btnVKRefreshClick(Sender: TObject);
    procedure btnVKChangeClick(Sender: TObject);
    procedure btnVKCalcDateClick(Sender: TObject);
    procedure btnIYSGonderClick(Sender: TObject);
    procedure bIYSKontrolClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure btnQRCodeClick(Sender: TObject);
    procedure radioOnaySiraClick(Sender: TObject);
    procedure btnSendMailClick(Sender: TObject);
    procedure cbTumDepartmanChange(Sender: TObject);
  private
    YardimKw : string;
    procedure ManageSettings;
    procedure PrepareTables;
    procedure PrepareVeriKaynaklari;
    procedure CloseTables;
    procedure DelDocControl(Sender: TComponent; Res: Integer);
    procedure DelVKControl(Sender: TComponent; Res: Integer);
    procedure AddVKControl(Sender: TComponent; Res: Integer);
    procedure ChangeDateVKControl(Sender: TComponent; Res: Integer);
    function ParseMsg(AData: TUniMemo; APwd: String): TStringList;
    function ParseMsgAr(AData: TUniMemo; APwd: String): TStringList;
    function SendMail(AMsg, ARcpt: String): Boolean;
    function SendMailAr(aAdr, APwd: String): Boolean;
    function FindVK(KaynakID: Integer; KaynakStr: String; SaklTip: String; ImhaTur: String; Sure: Integer; SureTip: String): Boolean;
    procedure AutomaticVKAdd;
    procedure FaaliyetBitisKontrol;
    procedure VeriKaynaklariKontrol;
    procedure VeriKaynaklariSureKontrol;
    procedure IYSKontrol;
    procedure AydinlatmaListeRefresh;

  public
    function Exec(AID, AOp: Integer): Integer;
  end;

function frmAcikRizaKayitTanim: TfrmAcikRizaKayitTanim;

implementation

uses uniGUIApplication, MainModule, McMLib, wsJETSMS, KvknetapiLib, unAcikRizaKayitListe,
  unAcikRizaDokumanKayit, unAcikRizaVKDurum, unHelpPage, ServerModule,UrlShortLib,
  unMailUtils;

{$R *.dfm}

function frmAcikRizaKayitTanim: TfrmAcikRizaKayitTanim;
begin
  Result := TfrmAcikRizaKayitTanim(MainMod.GetFormInstance(TfrmAcikRizaKayitTanim));
end;

procedure TfrmAcikRizaKayitTanim.AddVKControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  AutomaticVKAdd;
end;

procedure TfrmAcikRizaKayitTanim.AutomaticVKAdd;
var
  KisiID : String;
begin
  KisiID := qRiza.FieldByName('kisi_id').AsString;

  QueryOpen(qTmp, 'SELECT DISTINCT * FROM ' +
                  '( ' +
                  '   SELECT env.kaynak_id, ky.kaynak AS kaynak_str, ''DÝJÝTAL'' as sakl_tip, env.sakl_ssure_imha AS sakl_sure_imha, ' +
                  '          env.sakl_ssure_sure AS sakl_sure_sure, env.sakl_ssure_tip AS sakl_sure_tip, env.sakl_ssure AS sakl_sure ' +
                  '   FROM data_envanter env ' +
                  '   LEFT JOIN def_data_kaynak ky ON env.kaynak_id=ky.id ' +
                  '   WHERE env.kisi_id = ' + KisiID + ' AND env.active = ''E'' AND env.sakl_ssure_var = ''SAKLANIYOR'' ' +
                  '   GROUP BY env.kaynak_id, ky.kaynak, env.sakl_ssure_imha, env.sakl_ssure_sure, env.sakl_ssure_tip, env.sakl_ssure ' +
                  '   UNION ALL ' +
                  '   SELECT env.kaynak_id, ky.kaynak AS kaynak_str, ''FÝZÝKSEL'' as sakl_tip, env.sakl_fsure_imha AS sakl_sure_imha, ' +
                  '          env.sakl_fsure_sure AS sakl_sure_sure, env.sakl_fsure_tip AS sakl_sure_tip, env.sakl_fsure AS sakl_sure ' +
                  '   FROM data_envanter env ' +
                  '   LEFT JOIN def_data_kaynak ky ON env.kaynak_id=ky.id ' +
                  '   WHERE env.kisi_id = ' + KisiID + ' AND env.active = ''E'' AND env.sakl_fsure_var = ''SAKLANIYOR'' ' +
                  '   GROUP BY env.kaynak_id, ky.kaynak, env.sakl_fsure_imha, env.sakl_fsure_sure, env.sakl_fsure_tip, env.sakl_fsure ' +
                  ') AS tbl_imha ' +
                  'ORDER BY kaynak_id');

  qTmp.First;
  while not qTmp.EOF do
  begin
    if not FindVK(qTmp.FieldByName('kaynak_id').AsInteger, qTmp.FieldByName('kaynak_str').AsString, qTmp.FieldByName('sakl_tip').AsString,
                  qTmp.FieldByName('sakl_sure_imha').AsString, qTmp.FieldByName('sakl_sure_sure').AsInteger, qTmp.FieldByName('sakl_sure_tip').AsString) then
    begin
      qARVK.Append;
      qARVK.FieldByName('id').AsInteger           := MainMod.GetSeq('sq_data_acikriza_vk_id');
      qARVK.FieldByName('mc_id').AsInteger        := MainMod.MCID;
      qARVK.FieldByName('ar_id').AsInteger        := qRiza.FieldByName('id').AsInteger;
      qARVK.FieldByName('oo_id').AsInteger        := 0;
      qARVK.FieldByName('ayd_id').AsInteger       := qRiza.FieldByName('ayd_id').AsInteger;
      qARVK.FieldByName('kisi_id').AsInteger      := qRiza.FieldByName('kisi_id').AsInteger;
      qARVK.FieldByName('kaynak_id').AsInteger    := qTmp.FieldByName('kaynak_id').AsInteger;
      qARVK.FieldByName('kaynak_str').AsString    := qTmp.FieldByName('kaynak_str').AsString;
      qARVK.FieldByName('sakl_tip').AsString      := qTmp.FieldByName('sakl_tip').AsString;
      qARVK.FieldByName('sakl_imha').AsString     := qTmp.FieldByName('sakl_sure_imha').AsString;
      qARVK.FieldByName('sakl_sure').AsInteger    := qTmp.FieldByName('sakl_sure_sure').AsInteger;
      qARVK.FieldByName('sakl_sure_tip').AsString := qTmp.FieldByName('sakl_sure_tip').AsString;
      qARVK.FieldByName('sakl_str').AsString      := qTmp.FieldByName('sakl_sure').AsString;
      qARVK.FieldByName('durum').AsString         := 'ALINDI';

      if qARVK.FieldByName('sakl_imha').AsString = 'BAÞLANGIÇ' then
         qARVK.FieldByName('bitis_tarihi').AsDateTime := CalcNewDate(qRiza.FieldByName('tarih').AsDateTime, qARVK.FieldByName('sakl_sure').AsInteger, qARVK.FieldByName('sakl_sure_tip').AsString);

      qARVK.FieldByName('idy').AsInteger          := MainMod.LoginInfo.ID;
      qARVK.FieldByName('idt').AsDateTime         := Now;
      qARVK.FieldByName('sdy').AsInteger          := MainMod.LoginInfo.ID;
      qARVK.FieldByName('sdt').AsDateTime         := Now;
      qARVK.Post;
    end;

    qTmp.Next;
  end
end;

procedure TfrmAcikRizaKayitTanim.bIYSKontrolClick(Sender: TObject);
begin
  IYSKontrol;
end;

procedure TfrmAcikRizaKayitTanim.btnCancelClick(Sender: TObject);
begin
  if btnCancel.Caption = 'Ýptal' then
  begin
    qRiza.Cancel;
    qARDoc.CancelUpdates;
    ManageSettings;
  end
  else
  begin
    ModalResult := mrOk;
  end;
end;


procedure TfrmAcikRizaKayitTanim.btnGoToLinkClick(Sender: TObject);
begin
  if qRiza.State in [dsInsert] then
  begin
    MessageDlg('Link adresi henüz hazýr deðil. Bilgileri kaydettiðinizde baðlantýlar da hazýr olacak.', mtError, [mbOk]);
    Exit;
  end;
  if edWebLink.Text = '' then
  begin
    MessageDlg('Link adresi henüz hazýr deðil. Bilgileri kaydettiðinizde baðlantýlar da hazýr olacak.', mtError, [mbOk]);
    Exit;
  end;

  UniSession.BrowserWindow(edWebLink.Text, 0, 0, '_blank');
end;

procedure TfrmAcikRizaKayitTanim.btnIYSGonderClick(Sender: TObject);
var
  GSMNo: String;
  cevap: string;
begin
  GSMNo := '+90' + qRiza.FieldByName('gsmno').AsString;
  GSMNo := StringReplace(GSMNo, '(', '', [rfReplaceAll]);
  GSMNo := StringReplace(GSMNo, ')', '', [rfReplaceAll]);

  if ediyssms.Checked then
  begin
    QueryOpen(qTmp, 'SELECT p_status, p_creationdate ' +
                    'FROM fnc_iys_consent_status(' + IntToStr(MainMod.MCID) +
                    ', ''' + gsmno + ''', ''BÝREYSEL'', ''MESAJ'')');
    if (qtmp.fieldbyname('p_creationdate').AsDateTime < edtarih.DateTime-1) then
    begin
      qAddIys.Close;
      qAddIys.ParamByName('p_mcid').AsInteger := mainmod.MCID;
      qAddIys.ParamByName('p_idy').AsInteger := mainmod.LoginInfo.ID;
      qAddIys.ParamByName('p_recipient').AsString := gsmNo;
      qAddIys.ParamByName('p_recipienttype').AsString := 'BIREYSEL';
      qAddIys.ParamByName('p_type').AsString := 'MESAJ';
      qAddIys.ParamByName('p_consentdate').AsDateTime := edtarih.DateTime;
      qAddIys.ParamByName('p_recipient').AsString := gsmNo;
      qAddIys.ParamByName('p_source').AsString := 'HS_EORTAM';
      qAddIys.ExecSQL;
      cevap := qAddIys.Fields[0].AsString;
      MessageDlg(cevap, mtInformation, [mbOk]);
    end;
  end;

  if ediysPhone.Checked then
  begin
    QueryOpen(qTmp, 'SELECT p_status, p_creationdate ' +
                    'FROM fnc_iys_consent_status(' + IntToStr(MainMod.MCID) +
                    ', ''' + gsmno + ''', ''BÝREYSEL'', ''ARAMA'')');
    if (qtmp.fieldbyname('p_creationdate').AsDateTime < edtarih.DateTime-1) then
    begin
      qAddIys.Close;
      qAddIys.ParamByName('p_mcid').AsInteger := mainmod.MCID;
      qAddIys.ParamByName('p_idy').AsInteger := mainmod.LoginInfo.ID;
      qAddIys.ParamByName('p_recipient').AsString := gsmNo;
      qAddIys.ParamByName('p_recipienttype').AsString := 'BÝREYSEL';
      qAddIys.ParamByName('p_type').AsString := 'ARAMA';
      qAddIys.ParamByName('p_consentdate').AsDateTime := edtarih.DateTime;
      qAddIys.ParamByName('p_recipient').AsString := gsmNo;
      qAddIys.ParamByName('p_source').AsString := 'HT_EORTAM';
      qAddIys.ExecSQL;
      cevap := qAddIys.Fields[0].AsString;
      MessageDlg(cevap, mtInformation, [mbOk]);
    end;
  end;

  if edIysemail.Checked then
  begin
    QueryOpen(qTmp, 'SELECT p_status, p_creationdate ' +
                    'FROM fnc_iys_consent_status(' + IntToStr(MainMod.MCID) +
                    ', ''' + edEMail.Text + ''', ''BÝREYSEL'', ''EPOSTA'')');
    if (qtmp.fieldbyname('p_creationdate').AsDateTime < edtarih.DateTime-1) then
    begin
      qAddIys.Close;
      qAddIys.ParamByName('p_mcid').AsInteger := mainmod.MCID;
      qAddIys.ParamByName('p_idy').AsInteger := mainmod.LoginInfo.ID;
      qAddIys.ParamByName('p_recipient').AsString := gsmNo;
      qAddIys.ParamByName('p_recipienttype').AsString := 'BÝREYSEL';
      qAddIys.ParamByName('p_type').AsString := 'EPOSTA';
      qAddIys.ParamByName('p_consentdate').AsDateTime := edtarih.DateTime;
      qAddIys.ParamByName('p_recipient').AsString := edEMail.Text;
      qAddIys.ParamByName('p_source').AsString := 'HT_EORTAM';
      qAddIys.ExecSQL;
      cevap := qAddIys.Fields[0].AsString;
      MessageDlg(cevap, mtInformation, [mbOk]);
    end;
  end;
end;

procedure TfrmAcikRizaKayitTanim.btnDocsAddClick(Sender: TObject);
begin
  if not MainMod.LoginInfo.Yetkiler[188] then
  begin
    MessageDlg('Doküman Ekleme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if qRiza.FieldByName('id').AsInteger < 1 then qRiza.FieldByName('id').AsInteger := MainMod.GetSeq('sq_data_acikriza_id');

  if  frmAcikRizaDokumanKayit.Exec(qARDoc, 0, qRiza.FieldByName('id').AsInteger, 0) =mrOk then
    begin
        if not (qRiza.State in [dsEdit,dsInsert]) then
       begin
          qRiza.Edit;
          btnPost.Enabled := true;
        end;
    end;
end;

procedure TfrmAcikRizaKayitTanim.btnDocsDelClick(Sender: TObject);
var
  Msg : String;
begin
  if not MainMod.LoginInfo.Yetkiler[126] then
  begin
    MessageDlg('Doküman silme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if qARDoc.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Listeden seçili dokümaný çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelDocControl);
end;

procedure TfrmAcikRizaKayitTanim.btnDocsDownClick(Sender: TObject);
var
  AStream : TMemoryStream;
begin
  if not MainMod.LoginInfo.Yetkiler[127] then
  begin
    MessageDlg('Açýk Rýza Formlarýndan, Doküman indirme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if qARDoc.FieldByName('id').AsInteger < 1 then Exit;

  AStream := TMemoryStream.Create;
  try
    TBlobField(qARDoc.FieldByName('belge')).SaveToStream(AStream);
    UniSession.SendStream(AStream, qARDoc.FieldByName('belge_adi').AsString);
  finally
    AStream.Free;
  end;
end;

procedure TfrmAcikRizaKayitTanim.btnEditClick(Sender: TObject);
begin
  if (qRiza.FieldByName('durum').AsString <> 'AKTÝF') and (qRiza.FieldByName('durum').AsString <> 'RIZA ALINMADI') then
  begin
    if not MainMod.LoginInfo.Yetkiler[125] then
    begin
      MessageDlg('Deðiþtirmek istediðiniz kayýt PASÝF yapýlmýþ. Bu kaydý deðiþtirme yetkiniz yok.', mtError, [mbOk]);
      Exit;
    end;
  end;

  qRiza.Edit;
  ManageSettings;
end;

procedure TfrmAcikRizaKayitTanim.btnPostClick(Sender: TObject);
begin
  if qRiza.FieldByName('ayd_id').AsInteger < 1 then
  begin
    MessageDlg('Açýk Rýza Türü belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edAydinlatma.SetFocus;
    Exit;
  end;
  if qRiza.FieldByName('durum').AsString = '' then
  begin
    MessageDlg('Durum belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edDurum.SetFocus;
    Exit;
  end;
  if qRiza.FieldByName('tarih').AsString = '' then
  begin
    MessageDlg('Tarih belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edTarih.SetFocus;
    Exit;
  end;
  if qRiza.FieldByName('saat').AsString = '' then
  begin
    MessageDlg('Saat belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edSaat.SetFocus;
    Exit;
  end;
  if qRiza.FieldByName('ad_soyad').AsString = '' then
  begin
    MessageDlg('Kayýt Sahibinin Adý-Soyadý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edAdSoyad.SetFocus;
    Exit;
  end;
  if qRiza.FieldByName('kimlik_no').AsString = '' then
  begin
    MessageDlg('Kayýt Sahibinin Kimlik Numarasý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edKimlikNo.SetFocus;
    Exit;
  end;
  if qRiza.FieldByName('gsmno').AsString = '' then
  begin
    MessageDlg('Kayýt Sahibinin Cep Telefonu belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edGSMNo.SetFocus;
    Exit;
  end;
  if (qRiza.FieldByName('durum').AsString = 'AKTÝF') or (qRiza.FieldByName('durum').AsString = 'RIZA ALINMADI') then
  begin
    qRiza.FieldByName('faal_bitis').Clear;
  end
  else
  begin
    if (qRiza.FieldByName('faal_bitis').AsString = '30.12.1899') or (qRiza.FieldByName('faal_bitis').Value = null) then
    begin
      MessageDlg('Faaliyetin Bitiþ/Ýptal/Pasif Tarihi belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
      Exit;
    end;
  end;
  if radioOnaySira.ItemIndex < 0 then
  begin
    MessageDlg('Onaylayan belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    radioOnaySira.SetFocus;
    Exit;
  end;
  qRiza.FieldByName('onay_sira').AsInteger  := radioOnaySira.ItemIndex+1;

  if radioOnaySira.ItemIndex = 1 then
  begin
    if qRiza.FieldByName('ad_soyad2').AsString = '' then
    begin
      MessageDlg('Veli/Vasi Adý-Soyadý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
      edAdSoyad.SetFocus;
      Exit;
    end;
    if qRiza.FieldByName('kimlik_no2').AsString = '' then
    begin
      MessageDlg('Veli/Vasi Kimlik Numarasý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
      edKimlikNo.SetFocus;
      Exit;
    end;
    if qRiza.FieldByName('gsmno2').AsString = '' then
    begin
      MessageDlg('Veli/Vasi Cep Telefonu belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
      edGSMNo.SetFocus;
      Exit;
    end;
  end;



  if qRiza.State in [dsInsert] then
  begin
    if qRiza.FieldByName('id').AsInteger < 1 then qRiza.FieldByName('id').AsInteger := MainMod.GetSeq('sq_data_acikriza_id');
    qRiza.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    qRiza.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    qRiza.FieldByName('idt').AsDateTime   := Now;
  end;
  qRiza.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  qRiza.FieldByName('sdt').AsDateTime     := Now;
  if qRiza.FieldByName('aguid').AsString = '' then qRiza.FieldByName('aguid').AsString   := MainMod.NewGuid;
  qRiza.Post;

  try
    MainMod.DBMain.StartTransaction;
    qARDoc.ApplyUpdates();
    qARDoc.CommitUpdates;
    MainMod.DBMain.Commit;
  except
    qARDoc.CancelUpdates;
    MainMod.DBMain.Rollback;
  end;

  ManageSettings;
  if qRiza.FieldByName('durum').AsString = 'AKTÝF' then VeriKaynaklariKontrol
    else if qRiza.FieldByName('durum').AsString = 'FAALÝYET BÝTTÝ' then FaaliyetBitisKontrol
      else
        begin
          MessageDlg('Lütfen Veri Kaynaklarýnýn durumlarýný kontrol etmeyi unutmayýnýz.', mtInformation, [mbOk]);
        end;
end;

procedure TfrmAcikRizaKayitTanim.btnPrepLinkClick(Sender: TObject);
begin
  if edWebLink.Text <> '' then exit;

  if qRiza.FieldByName('aguid').AsString = '' then
    qRiza.FieldByName('aguid').AsString   := MainMod.NewGuid;

  edWebLink.Text := MainMod.AcikRizaLink + qRiza.FieldByName('aguid').AsString;
  MainMod.CreateQRCode(edWebLink.Text, imgQRCode);
end;

procedure TfrmAcikRizaKayitTanim.btnSendMailClick(Sender: TObject);
var
  URLLink ,
  OTC     ,
  Mail    : String;
  Mesaj   : String;
begin
  if qRiza.FieldByName('email').AsString = '' then
  begin
    MessageDlg('Mail adresi girilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    Exit;
  end;

  if edWebLink.Text = '' then
  begin
    MessageDlg('Link adresi henüz hazýr deðil. Bilgileri kaydettiðinizde baðlantýlar da hazýr olacak.', mtError, [mbOk]);
    Exit;
  end;

  URLLink := edWebLink.Text;


  Mail := qRiza.FieldByName('email').AsString;

  edMailMsg.Lines.LoadFromFile(ServerMod.FilesFolderPath + 'temp_mail/arlinkmail.htm');


//  if not SendMailAr(Mail, URLLink) then
//  begin
//    MessageDlg('Ýþlem Baþarýsýz... Mail Gönderilemedi.', mtError, [mbOk]);
//    Exit;
//  end;

  try
       GenelSendEmail(Mail,'AÇIK RIZA Hk. - KVKNET',ParseMsgAr(edMailMsg, URLLink).Text) ;
  except
        on E: Exception do
        begin
          MessageDlg('Ýþlem Baþarýsýz... Mail Gönderilemedi.', mtError, [mbOk]);
          Exit;
        end;
            //ShowMessageN(E.Message);
  end;

  MessageDlg('Ýþlem Tamam... Mail Gönderildi.', mtInformation, [mbOk]);
  IYSKontrol; //loglarý yenile
end;

procedure TfrmAcikRizaKayitTanim.btnSendSMSClick(Sender: TObject);
var
  URLLink ,
  OTC     ,
  GSMNo   : String;
  Mesaj   : String;
  Fast    : Boolean;
begin
 if radioOnaySira.ItemIndex = 0 then
  begin
    if qRiza.FieldByName('gsmno').AsString = '' then
    begin
      MessageDlg('Cep Telefonu numarasý girilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
      Exit;
    end;
  end else
  begin
    if qRiza.FieldByName('gsmno2').AsString = '' then
    begin
      MessageDlg('Veli/Vasi Cep Telefonu numarasý girilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
      Exit;
    end;
  end;


  if edWebLink.Text = '' then
  begin
    MessageDlg('Link adresi henüz hazýr deðil. Bilgileri kaydettiðinizde baðlantýlar da hazýr olacak.', mtError, [mbOk]);
    Exit;
  end;

  URLLink := GetShortUrl(edWebLink.Text);
//
  if URLLink = 'Error' then
    URLLink := edWebLink.Text;
//  if not MainMod.ShortURL(URLLink) then
//  begin
//    MessageDlg(URLLink, mtError, [mbOk]);
//    Exit;
//  end;
//
//  if URLLink = '' then
//  begin
//    MessageDlg('URL kýsaltma hatasý : Yeni baðlantý oluþturulamadý.', mtError, [mbOk]);
//    Exit;
//  end;

  GSMNo := IfThen(radioOnaySira.ItemIndex = 0 , qRiza.FieldByName('gsmno').AsString, qRiza.FieldByName('gsmno2').AsString);
  GSMNo := StringReplace(GSMNo, '(', '', [rfReplaceAll]);
  GSMNo := StringReplace(GSMNo, ')', '', [rfReplaceAll]);

// to do : Bu þimdilik kaldýrýldý...
//  OTC := MainMod.CreateOTC;
//  qRiza.Edit;
//  qRiza.FieldByName('gkod').AsString := OTC;
//  qRiza.Post;

  // to do : Bu parametrik olacak
  // Mesaj := 'ONAY/AÇIK RIZA iþlemlerini tamamlamak için ' + URLLink + ' adresindeki forma ' + OTC + ' kodunu girerek iþleminizi onaylayabilirsiniz.';

  Mesaj := 'KVKK kapsamýnda açýk rýza vermek için ' + URLLink + ' baðlantýsýna týklayabilirsiniz. ';
//  Mesaj := 'Özel onay iþlemini tamamlamak için ' + URLLink + ' baðlantýsýna týklayabilirsiniz.' ;
//  Mesaj := 'ONAY/AÇIK RIZA iþlemlerini tamamlamak için ' + URLLink + ' adresindeki formu onaylayabilirsiniz.';
  Fast  := (MainMod.qMCParam.FieldByName('sms_otp_aktif').AsString = 'E');

  if not SendSMS(Mesaj, GSMNo, Fast, UniGuiApplication.UniApplication.RemoteAddress,'01AR', qRiza.FieldByName('id').AsInteger) then
  begin
    MessageDlg(Mesaj, mtError, [mbOk]);
      MainMod.SaveSMSLog(MainMod.MCID, qRiza.FieldByName('id').AsInteger, 0, '01AR', '', 'HATA : ' + Mesaj);
    Exit;
  end;
  //MainMod.SaveSMSLog(MainMod.MCID, qRiza.FieldByName('id').AsInteger, 1, 'ESAPL', '', 'ÝÞLEM BAÞARILI : ' + Mesaj);

  MessageDlg('Ýþlem Tamam... SMS Gönderildi.', mtInformation, [mbOk]);
  IYSKontrol; //loglarý yenile
end;

procedure TfrmAcikRizaKayitTanim.btnQRCodeClick(Sender: TObject);
var
  aQRCodeFile: String;
  FUrl: String;
begin
  if qRiza.State in [dsInsert] then
  begin
    MessageDlg('Link adresi henüz hazýr deðil. Bilgileri kaydettiðinizde baðlantýlar da hazýr olacak.', mtError, [mbOk]);
    Exit;
  end;
  if edWebLink.Text = '' then
  begin
    MessageDlg('Link adresi henüz hazýr deðil. Bilgileri kaydettiðinizde baðlantýlar da hazýr olacak.', mtError, [mbOk]);
    Exit;
  end;

//  MainMod.CreateQRCode(edWebLink.Text, imgQRCode);
  aQRCodeFile := ServerMod.NewCacheFileUrl(False, 'png', '', '', FUrl, True);
  imgQRCode.Picture.SaveToFile(aQRCodeFile);
  if aQRCodeFile <> '' then
    UniSession.SendFile(aQRCodeFile, 'Karekod.png');
end;

procedure TfrmAcikRizaKayitTanim.btnVKCalcDateClick(Sender: TObject);
var
  Msg : String;
begin
  Msg := 'DÝKKAT..! Onay/Rýza Durumuna göre ÝMHA EDÝLMEMÝÞ veri kaynaklarý için '#13 +
         'Planlanan Ýmha Tarihleri yeniden hesaplanacak. Onaylýyor musunuz?';

  MessageDlg(Msg, mtConfirmation, mbYesNo, ChangeDateVKControl);
end;

procedure TfrmAcikRizaKayitTanim.btnVKChangeClick(Sender: TObject);
var
  Durum    ,
  Aciklama : String;
  Tarih    : TDateTime;
begin
  if qARVK.RecordCount = 0 then
  begin
    MessageDlg('Deðiþtirilecek kayýt bulunamadý.', mtError, [mbOk]);
    Exit;
  end;

  Durum    := qARVK.FieldByName('durum').AsString;
  Tarih    := qARVK.FieldByName('imha_tarihi').AsDateTime;
  Aciklama := qARVK.FieldByName('imha_aciklama').AsString;

  if Durum = 'ÝMHA EDÝLDÝ' then
  begin
    if not MainMod.LoginInfo.Yetkiler[133] then
    begin
      MessageDlg('Ýmha edilmiþ bir veri kaynaðý üzerinde deðiþiklik yapma yetkiniz yok.', mtError, [mbOk]);
      Exit;
    end;
  end;

  if frmAcikRizaVKDurum.Exec(Durum, Tarih, Aciklama) = mrOk then
  begin
    if Durum = 'ÝMHA EDÝLDÝ' then
    begin
      if (qARVK.FieldByName('bitis_tarihi').AsDateTime > now) or (qARVK.FieldByName('bitis_tarihi').AsString = '') then
      begin
        if ((qRiza.FieldByName('durum').AsString <> 'RIZA GERÝ ÇEKÝLDÝ') and (qRiza.FieldByName('durum').AsString <> 'PASÝF/ÝPTAL')) then
        begin
          MessageDlg('Bitiþ tarihi gelmemiþ bir veri kaynaðý imha edilemez.', mtError, [mbOk]);
          Exit;
        end;
      end;
    end;

    qARVK.Edit;
    qARVK.FieldByName('durum').AsString := Durum;
    qARVK.FieldByName('imha_tarihi').AsDateTime := Tarih;
    if qARVK.FieldByName('durum').AsString <> 'ÝMHA EDÝLDÝ' then qARVK.FieldByName('imha_tarihi').Clear;
    qARVK.FieldByName('imha_aciklama').AsString := Aciklama;
    qARVK.Post;
  end;
  ManageSettings;
end;

procedure TfrmAcikRizaKayitTanim.btnVKDeleteClick(Sender: TObject);
var
  Msg : String;
begin
  if not MainMod.LoginInfo.Yetkiler[132] then
  begin
    MessageDlg('Veri Kaynaðý silme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if qARVK.FieldByName('id').AsInteger < 1 then Exit;
  if qARVK.FieldByName('durum').AsString <> 'ALINMADI' then
  begin
    MessageDlg('Veri Kaynaðý durumu "ALINMADI" deðilse silme iþlemi yapýlamaz.', mtError, [mbOk]);
    Exit;
  end;

  Msg := 'Listeden seçili Veri Kaynaðýný çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelVKControl);
end;

procedure TfrmAcikRizaKayitTanim.btnVKRefreshClick(Sender: TObject);
var
  Msg : String;
begin
  //VK düzenleme yapýlmayacak, envanter deðiþiklikleri geçmiþ kayýtlarý baðlamamalý
  MessageDlg('Veri Kaynaklarýný güncelleme yetkiniz yok.', mtError, [mbOk]);
  Exit;

  if not MainMod.LoginInfo.Yetkiler[131] then
  begin
    MessageDlg('Veri Kaynaklarýný güncelleme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if qARDoc.FieldByName('id').AsInteger < 1 then Exit;

//  Msg := 'Listeden seçili dokümaný çýkartmak istediðinizden emin misiniz?';
//  MessageDlg(Msg, mtConfirmation, mbYesNo, DelDocControl);

end;

procedure TfrmAcikRizaKayitTanim.cbTumDepartmanChange(Sender: TObject);
begin
  AydinlatmaListeRefresh;
end;

procedure TfrmAcikRizaKayitTanim.ChangeDateVKControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  // to do : Bu tamamlanacak
end;

procedure TfrmAcikRizaKayitTanim.CloseTables;
begin
  qAyd.Close;
  qARDoc.Close;
  qRiza.Close;
end;

procedure TfrmAcikRizaKayitTanim.DelDocControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  qARDoc.Delete;
end;

procedure TfrmAcikRizaKayitTanim.DelVKControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  qARVK.Delete;
end;

procedure TfrmAcikRizaKayitTanim.dsRizaStateChange(Sender: TObject);
begin
  ManageSettings;
end;

procedure TfrmAcikRizaKayitTanim.edAydinlatmaChange(Sender: TObject);
begin
  if qRiza.FieldByName('ayd_id').AsInteger < 1 then
  begin
    qRiza.FieldByName('kisi_id').AsInteger := 0;
    edKisi.Text := '';
    Exit;
  end;

  QueryOpen(qTmp, 'SELECT ayd.kisi_id, ayd.iys_var, ks.kisi as kisi_str FROM def_data_aydinlatma ayd ' +
                  '  LEFT JOIN def_data_kisi ks ON ks.id = ayd.kisi_id ' +
                  'WHERE ayd.id = ' + qRiza.FieldByName('ayd_id').AsString);

  qRiza.FieldByName('kisi_id').AsInteger := qTmp.FieldByName('kisi_id').AsInteger;
  edKisi.Text := qTmp.FieldByName('kisi_str').AsString;

  groupIYS.Visible  := (qTmp.FieldByName('iys_var').AsString = 'E') and (MainMod.IYSVar);
  edIYSEMail.Checked := edIYSEMail.Checked and MainMod.IYSVar and groupIYS.Visible;
  edIYSSMS.Checked   := edIYSSMS.Checked   and MainMod.IYSVar and groupIYS.Visible;
  edIYSPhone.Checked := edIYSPhone.Checked and MainMod.IYSVar and groupIYS.Visible;
  btnIYSGonder.Visible := groupIYS.Visible;
//  btnIYSGonder.Caption := 'Tekrar<br/>ONAY<br/>Gönder';

  IYSKontrol;
end;

procedure TfrmAcikRizaKayitTanim.edDurumChange(Sender: TObject);
begin
  edFaaliyetBitis.Enabled := edDurum.ItemIndex in [2, 3, 4];

  edKimlikNo.Enabled := edDurum.ItemIndex in [1];
  edGSMNo.Enabled    := edDurum.ItemIndex in [1];
  edEMail.Enabled    := edDurum.ItemIndex in [1];

  edVeliAdSoyad.Enabled :=  (edDurum.ItemIndex <> 0) and ( radioOnaySira.ItemIndex = 1);
  edVeliKimlikNo.Enabled :=   (edDurum.ItemIndex <> 0) and (radioOnaySira.ItemIndex = 1);
  edveliGSM.Enabled :=  (edDurum.ItemIndex <> 0 ) and (radioOnaySira.ItemIndex = 1)  ;
  edVelieMail.Enabled :=  (edDurum.ItemIndex <> 0) and (radioOnaySira.ItemIndex = 1)  ;

//AKTÝF
//RIZA ALINMADI
//PASÝF/ÝPTAL
//FAALÝYET BÝTTÝ
//RIZA GERÝ ÇEKÝLDÝ

end;

function TfrmAcikRizaKayitTanim.Exec(AID, AOp: Integer): Integer;
begin

  if AOp = 0 then // Insert
  begin
    QueryOpen(qRiza, 'SELECT * FROM data_acikriza WHERE id = 0');
    qRiza.Insert;
    qRiza.FieldByName('durum').AsString      := 'RIZA ALINMADI';
    qRiza.FieldByName('aguid').AsString      := '';
    qRiza.FieldByName('gkod').AsString       := '';
    qRiza.FieldByName('damga').AsString      := 'H';
    qRiza.FieldByName('id_tur').AsString     := 'AR';
    qRiza.FieldByName('onay_sira').AsString   := '1';
    qRiza.FieldByName('saat').AsString       := FormatDateTime('hh:nn', Now);
    qRiza.FieldByName('tarih').AsDateTime    := Date;
    radioOnaySira.ItemIndex := 0;
    YardimKw := 'AcikRizaYeniKayit';
  end
  else // Edit
  begin
    QueryOpen(qRiza, 'SELECT * FROM data_acikriza WHERE id = ' + IntToStr(AID));
    radioOnaySira.ItemIndex := qRiza.FieldByName('onay_sira').AsInteger-1;
    PrepareVeriKaynaklari;
    qRiza.Edit;
    YardimKw := 'AcikRizaDegistirme'
  end;
  PrepareTables;

  PgControl.ActivePage := pgGenel;
  edAydinlatmaChange(edAydinlatma);
  edDurumChange(edDurum);
  radioOnaySiraClick(radioOnaySira);
  ActiveControl := edAydinlatma;
  Result := ShowModal;

  CloseTables;
end;

procedure TfrmAcikRizaKayitTanim.FaaliyetBitisKontrol;
begin
  if qRiza.FieldByName('durum').AsString <> 'FAALÝYET BÝTTÝ' then Exit;
  PrepareVeriKaynaklari;

  qARVK.First;
  while not qARVK.EOF do
  begin
    if (qARVK.FieldByName('durum').AsString = 'ALINDI') and (qARVK.FieldByName('sakl_imha').AsString = 'BÝTÝÞ') then
    begin
      qARVK.Edit;
      qARVK.FieldByName('bitis_tarihi').AsDateTime := CalcNewDate(qRiza.FieldByName('faal_bitis').AsDateTime, qARVK.FieldByName('sakl_sure').AsInteger, qARVK.FieldByName('sakl_sure_tip').AsString);
      qARVK.Post;
    end;
    qARVK.Next;
  end;
  qARVK.First;
end;

function TfrmAcikRizaKayitTanim.FindVK(KaynakID: Integer; KaynakStr: String; SaklTip: String; ImhaTur: String; Sure: Integer; SureTip: String): Boolean;
var
  Found : Boolean;
begin
  Found := False;
  qARVK.First;
  while not qARVK.EOF do
  begin
    if (qARVK.FieldByName('kaynak_id').AsInteger    = KaynakID) and
       (qARVK.FieldByName('kaynak_str').AsString    = KaynakStr) and
       (qARVK.FieldByName('sakl_tip').AsString      = SaklTip) and
       (qARVK.FieldByName('sakl_imha').AsString     = ImhaTur) and
       (qARVK.FieldByName('sakl_sure').AsInteger    = Sure) and
       (qARVK.FieldByName('sakl_sure_tip').AsString = SureTip) then
    begin
      Found := True;
      Break;
    end;
    qARVK.Next;
  end;

  Result := Found;
end;

procedure TfrmAcikRizaKayitTanim.IYSKontrol;
var
  GSMNo: String;
begin
  if groupIYS.Visible then
  begin
    GSMNo := qRiza.FieldByName('gsmno').AsString;
    GSMNo := StringReplace(GSMNo, '(', '', [rfReplaceAll]);
    GSMNo := StringReplace(GSMNo, ')', '', [rfReplaceAll]);

    QueryOpen(qTmp, 'SELECT p_status, p_creationdate ' +
                    'FROM fnc_iys_consent_status(' + IntToStr(MainMod.MCID) +
                    ', ''+90' + gsmno + ''', ''BÝREYSEL'', ''MESAJ'')');
    if qTmp.fieldByName('p_status').AsString = 'ONAY' then
      lbiyssms.Color := clMoneyGreen
    else if qTmp.fieldByName('p_status').AsString = 'RED' then
      lbiyssms.Color := $008080FF;
    if qtmp.fieldbyname('p_creationdate').AsString <> '' then
      lbiyssms.Text := qTmp.fieldByName('p_status').AsString + ' ' + qtmp.fieldbyname('p_creationdate').AsString
    else
      lbiyssms.Text := '';

    QueryOpen(qTmp, 'SELECT p_status, p_creationdate ' +
                    'FROM fnc_iys_consent_status(' + IntToStr(MainMod.MCID) +
                    ', ''+90' + gsmno + ''', ''BÝREYSEL'', ''ARAMA'')');
    if qTmp.fieldByName('p_status').AsString = 'ONAY' then
      lbIYSPhone.Color := clMoneyGreen
    else if qTmp.fieldByName('p_status').AsString = 'RED' then
      lbIYSPhone.Color := $008080FF;
    if qtmp.fieldbyname('p_creationdate').AsString <> '' then
      lbIYSPhone.Text := qTmp.fieldByName('p_status').AsString + ' ' + qtmp.fieldbyname('p_creationdate').AsString
    else
      lbIYSPhone.Text := '';

    QueryOpen(qTmp, 'SELECT p_status, p_creationdate ' +
                    'FROM fnc_iys_consent_status(' + IntToStr(MainMod.MCID) +
                    ', ''' + edEMail.Text + ''', ''BÝREYSEL'', ''ARAMA'')');
    if qTmp.fieldByName('p_status').AsString = 'ONAY' then
      lbIYSEMail.Color := clMoneyGreen
    else if qTmp.fieldByName('p_status').AsString = 'RED' then
      lbIYSEMail.Color := $008080FF;
    if qtmp.fieldbyname('p_creationdate').AsString <> '' then
      lbIYSEMail.Text := qTmp.fieldByName('p_status').AsString + ' ' + qtmp.fieldbyname('p_creationdate').AsString
    else
      lbIYSEMail.Text := '';

//    btnIYSGonder.Caption := 'Tekrar<br/>ONAY<br/>Gönder';
  end;

    QueryOpen(qTmp, 'SELECT src_time, result_str ' +
                    'FROM sys_sms_log ' +
                    'WHERE ar_id=' + qRiza.FieldByName('id').AsString +
                    ' ORDER BY src_time DESC');
    if Pos('ÝÞLEM BAÞARILI', qTmp.fieldByName('result_str').AsString) > 0 then
    begin
      lbSMSLog.Color := clMoneyGreen;
      lbSMSLog.Text := 'GÝTTÝ';
    end
    else if qTmp.FieldByName('result_str').AsString <> '' then
    begin
      lbSMSLog.Color := $008080FF;
      lbSMSLog.Text := 'HATA!';
    end
    else
    begin
      lbSMSLog.Color := clBtnFace;
      lbSMSLog.Text := '';
    end;
    if qtmp.fieldbyname('src_time').AsString <> '' then
    begin
      lbSMSLog.Text := lbSMSLog.Text + ' ' + formatdatetime('dd.mm.yyyy hh:nn', qtmp.fieldbyname('src_time').AsDateTime);
    end
    else
    begin
      lbSMSLog.Text := '';
      lbSMSLog.Color := clBtnFace;
    end;
end;

procedure TfrmAcikRizaKayitTanim.ManageSettings;
begin
  btnEdit.Enabled      := MainMod.LoginInfo.Yetkiler[124] and (qRiza.State = dsBrowse) and (qRiza.FieldByName('id').AsInteger > 0);
  btnPost.Enabled      := DataEditing(qRiza);

  btnPrepLink.Enabled  := btnPost.Enabled;
  btnGoToLink.Enabled  := not btnPost.Enabled;
  btnQRCode.Enabled    := not btnPost.Enabled;
  btnSendSMS.Enabled   := not btnPost.Enabled;
  btnSendMail.Enabled  := not btnPost.Enabled;

  btnVKChange.Enabled  := MainMod.LoginInfo.Yetkiler[130] and (qRiza.State = dsBrowse);
  btnVKRefresh.Enabled := MainMod.LoginInfo.Yetkiler[131] and (qRiza.State = dsBrowse);
  btnVKDelete.Enabled  := MainMod.LoginInfo.Yetkiler[132] and (qRiza.State = dsBrowse);

  btnDocsAdd.Enabled   := MainMod.LoginInfo.Yetkiler[188] and (qRiza.State = dsBrowse);
  btnDocsDel.Enabled   := MainMod.LoginInfo.Yetkiler[126] and (qRiza.State = dsBrowse);
  btnDocsDown.Enabled  := MainMod.LoginInfo.Yetkiler[127] and (qRiza.State = dsBrowse);

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
end;

function TfrmAcikRizaKayitTanim.ParseMsg(AData: TUniMemo; APwd: String): TStringList;
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
    Result.Add(Tmp);
  end;
end;

function TfrmAcikRizaKayitTanim.ParseMsgAr(AData: TUniMemo;
  APwd: String): TStringList;
var
  i   : Integer;
  Tmp      : String;
  UName    : String;
begin
  Result := TStringList.Create;

  for i := 0 to AData.Lines.Count - 1 do
  begin
    Tmp := AData.Lines[i];
    Tmp := Str2HTMLStr(StringReplace(Tmp, '%%%COMPNAME%%%', Trim(MainMod.qMCDef.FieldByName('title').AsString),    [rfReplaceAll]));
    Tmp := Str2HTMLStr(StringReplace(Tmp, '%%%UNAME%%%',    qRiza.fieldbyname('ad_soyad').AsString,   [rfReplaceAll]));
    Tmp := Str2HTMLStr(StringReplace(Tmp, '%%%AYD%%%',    qAyd.FieldByName('tanim').AsString,   [rfReplaceAll]));
    Tmp := Str2HTMLStr(StringReplace(Tmp, '%%%WEBLINK%%%',     APwd,    [rfReplaceAll]));
    Result.Add(Tmp);
  end;
end;

procedure TfrmAcikRizaKayitTanim.PrepareTables;

begin
  if qRiza.FieldByName('id').AsInteger < 1 then qRiza.FieldByName('id').AsInteger := MainMod.GetSeq('sq_data_acikriza_id');
  AydinlatmaListeRefresh;
//Doðan Departman yetkisine göre aþaðýya yazýldý . istenir ise deðiþtirilecek
//  QueryOpen(qAyd, 'SELECT id, tanim FROM def_data_aydinlatma  WHERE durum = ''YAYINDA'' AND ' +
//                  'acik_riza = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY tanim');


  QueryOpen(qARDoc,  'SELECT ard.*, us.full_name as ekleyen ' +
                     'FROM data_acikriza_docs ard ' +
                     '  LEFT JOIN usr_user us ON us.id = ard.idy ' +
                     'WHERE ard.mc_id = ' + IntToStr(MainMod.MCID) + '  AND ard.ar_id = ' +
                     qRiza.FieldByName('id').AsString + ' ORDER BY ard.id');
end;

procedure TfrmAcikRizaKayitTanim.AydinlatmaListeRefresh;
var
  Aydinlatmasql : string;
begin

  Aydinlatmasql := IfThen(cbTumDepartman.Checked ,
    'SELECT id, tanim FROM def_data_aydinlatma  WHERE durum = ''YAYINDA'' AND ' +
    'acik_riza = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY tanim',
   ' SELECT distinct ayd.id,ayd.tanim '+
   ' FROM def_data_aydinlatma ayd '+
   ' LEFT JOIN def_data_kisi kisi ON kisi.id = ayd.kisi_id '+
   ' LEFT JOIN data_envanter env ON env.kisi_id=ayd.kisi_id and env.active=''E'' '+
   ' JOIN sys_deptdef dp ON env.dept_id = dp.id and dp.id in ('+MainMod.LoginInfo.Birimler+') '+
   ' WHERE ayd.acik_riza =''E''  and ayd.durum =''YAYINDA'' AND AYD.mc_id= '+ IntToStr(MainMod.MCID) ) ;
   QueryOpen(qAyd,Aydinlatmasql);
end;

procedure TfrmAcikRizaKayitTanim.PrepareVeriKaynaklari;
begin
  if qRiza.FieldByName('id').AsInteger < 1 then Exit;

  QueryOpen(qARVK, 'SELECT vk.*, us1.full_name as ekleyen, us2.full_name as degistiren ' +
                   'FROM data_acikriza_vk vk ' +
                   '  LEFT JOIN usr_user us1 ON us1.id = vk.idy ' +
                   '  LEFT JOIN usr_user us2 ON us2.id = vk.sdy ' +
                   'WHERE vk.mc_id = ' + IntToStr(MainMod.MCID) + ' AND vk.ar_id = ' +
                   qRiza.FieldByName('id').AsString + ' ORDER BY vk.id');
end;

procedure TfrmAcikRizaKayitTanim.radioOnaySiraClick(Sender: TObject);
begin
//  gbVeli.Enabled := radioOnaySira.ItemIndex = 1;
  edDurumChange(edDurum);
end;

function TfrmAcikRizaKayitTanim.SendMail(AMsg, ARcpt: String): Boolean;
var
  AParam     : TParameter;
  MailAdr    ,
  SenderAcc  ,
  SenderPwd  ,
  SenderHost ,
  SenderPort : String;
  senderSSL  : boolean;
  SMTP       : TIdSMTP;
  Msg        : TIdMessage;
  SSLHandler : TIdSSLIOHandlerSocketOpenSSL;
  HTMLMsg    : TStringList;
begin
  Result     := False;
  QueryOpen(mainmod.qTmp, 'select smtp_username, smtp_password, smtp_host, smtp_port, smtp_ssl from sys_param_mc where mc_id=' + IntToStr(mainmod.MCID));
  senderAcc  := mainmod.qTmp.fieldByName('smtp_username').AsString;
  senderPwd  := mainMod.qTmp.FieldByName('smtp_password').AsString;
  senderHost := mainmod.qTmp.fieldByName('smtp_host').AsString;
  senderPort := mainMod.qTmp.FieldByName('smtp_port').AsString;
  senderSSL  := (mainMod.qTmp.FieldByName('smtp_ssl').AsString = 'E');

  if (SenderAcc = '') or (SenderPwd = '') then
  begin
    MessageDlg('Firma Mail Hesabý tanýmlanmamýþ. Lütfen firma parametrelerini kontrol ediniz.', mtError, [mbOk]);
    Exit;
  end;
  if (SenderHost = '') or (SenderPort = '') then
  begin
    MessageDlg('Firma Mail Sunucu ayarlarý yapýlmamýþ. Lütfen firma parametrelerini kontrol ediniz.', mtError, [mbOk]);
    Exit;
  end;

  senderPwd := DecryptStr(senderPwd);
  MailAdr  := qRiza.FieldByName('email').AsString;

  Msg := TIdMessage.Create(nil);
  try
    Msg.From.Address := SenderAcc;
    Msg.Recipients.EMailAddresses := MailAdr;
    Msg.Subject      := 'Kullanýcý Bilgileri Hk. - KVKNET';
    Msg.ContentType  := 'multipart/mixed';
    with TIdText.Create(Msg.MessageParts, nil) do begin
      // Body.Text := 'HTML goes here';
      Body.Add(AMsg);
      // Body.LoadFromFile('index.html');
      ContentType := 'text/html';
    end;

    SSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    SMTP := TIdSMTP.Create(nil);
    try
      SSLHandler.MaxLineAction := maException;
      SSLHandler.SSLOptions.Method := sslvTLSv1_2; //sslvTLSv1; // sslvSSLv23;
      SSLHandler.SSLOptions.Mode := sslmUnassigned;
      SSLHandler.SSLOptions.VerifyMode := [];
      SSLHandler.SSLOptions.VerifyDepth := 0;

      if senderSSl then
      begin
        SMTP.IOHandler := SSLHandler;
        SMTP.UseTLS    := utUseExplicitTLS;
      end;
      SMTP.Host      := SenderHost;
      SMTP.Port      := StrToIntDef(SenderPort, 0);
      SMTP.AuthType  := satDefault;
      SMTP.Username  := SenderAcc;
      SMTP.Password  := SenderPwd;
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

function TfrmAcikRizaKayitTanim.SendMailAr(aAdr, APwd: String): Boolean;
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
//    MessageDlg('Firma Mail Hesabý tanýmlanmamýþ. Lütfen kurum parametrelerini kontrol ediniz.', mtError, [mbOk]);
    result := false;
    Exit;
  end;
  if (SenderHost = '') or (SenderPort = '') then
  begin
//    MessageDlg('Firma Mail Sunucu ayarlarý yapýlmamýþ. Lütfen kurum parametrelerini kontrol ediniz.', mtError, [mbOk]);
    result := false;
    Exit;
  end;

  senderPwd := DecryptStr(senderPwd);

  MailAdr  := aAdr;

  Msg := TIdMessage.Create(nil);
  try
    Msg.From.Address := SenderAcc;
    Msg.Recipients.EMailAddresses := MailAdr;
    Msg.Subject      := 'AÇIK RIZA Hk. - KVKNET';
    Msg.ContentType  := 'multipart/mixed';
    with TIdText.Create(Msg.MessageParts, nil) do begin
      // Body.Text := 'HTML goes here';
      HTMLMsg := ParseMsgAr(edMailMsg, APwd);
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

procedure TfrmAcikRizaKayitTanim.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmAcikRizaKayitTanim.UniFormBeforeShow(Sender: TObject);
begin
  PgControl.ActivePage := pgGenel;
  if qRiza.FieldByName('aguid').AsString = '' then edWebLink.Text := ''
  else
  begin
    edWebLink.Text := MainMod.AcikRizaLink + qRiza.FieldByName('aguid').AsString;
    MainMod.CreateQRCode(edWebLink.Text, imgQRCode);
  end;

  ManageSettings;
  lbIDY.Caption := MainMod.KullaniciGetir(qRiza.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(qRiza.FieldByName('sdy').AsString);

  if dsRiza.State = dsEdit then
  begin
    if lbIDY.Text = '' then lbIDY.Text := 'SÝSTEM';
    if lbSDY.Text = '' then lbSDY.Text := 'SÝSTEM';
  end;

  if qRiza.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qRiza.FieldByName('idt').AsDateTime);
  if qRiza.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qRiza.FieldByName('sdt').AsDateTime);

  lbOzel1.Caption := mainMod.qMCParam.fieldByName('ar_ozel_1').AsString;
  lbOzel2.Caption := mainMod.qMCParam.fieldByName('ar_ozel_2').AsString;
  IYSKontrol;
end;

procedure TfrmAcikRizaKayitTanim.VeriKaynaklariKontrol;
var
  Msg : String;
begin
  if qRiza.FieldByName('durum').AsString <> 'AKTÝF' then Exit;
  PrepareVeriKaynaklari;
  if qARVK.RecordCount > 0 then
  begin
    VeriKaynaklariSureKontrol;
  end
  else
  begin
    Msg := 'Bu onay/rýza için veri kaynaklarý oluþturulmamýþ. Þimdi otomatik oluþturmak ister misiniz?<br><br>' +
           'NOT : Eðer fiziksel alýnmýþ rýza kaydý giriyorsanýz EVET seçiniz. Aksi durumda ONLINE açýk rýza ' +
           'alýnacak ise HAYIR seçiniz.';
    MessageDlg(Msg, mtConfirmation, mbYesNo, AddVKControl);
  end;
end;

procedure TfrmAcikRizaKayitTanim.VeriKaynaklariSureKontrol;
var
  sqlstr: string;
begin
  qArVk.First;
  while not qARVK.Eof do
  begin
    if qARVK.FieldByName('sakl_imha').AsString <> 'BÝTÝÞ' then
    begin
      qARVK.Next;
      continue;
    end;

    sqlstr := 'SELECT count(*) ';
    sqlstr := sqlstr + 'FROM data_envanter env ' ;
    sqlstr := sqlstr + 'LEFT JOIN def_data_kaynak ky ON env.kaynak_id=ky.id ';
    sqlstr := sqlstr + 'WHERE env.kisi_id = ' + qARVK.FieldByName('kisi_id').AsString + ' ';
    sqlstr := sqlstr + 'AND ky.kaynak = ''' + qARVK.FieldByName('kaynak_str').AsString + ''' ';
    if qARVK.FieldByName('sakl_tip').AsString = 'DÝJÝTAL' then
    begin
      sqlstr := sqlstr + 'AND env.sakl_ssure_imha = ''' +qARVK.FieldByName('sakl_imha').AsString + ''' ';
      sqlstr := sqlstr + 'AND env.sakl_ssure = ''' +qARVK.FieldByName('sakl_sure').AsString + ''' ';
      sqlstr := sqlstr + 'AND env.sakl_ssure_tip = ''' +qARVK.FieldByName('sakl_sure_tip').AsString + ''' ';
      sqlstr := sqlstr + 'AND env.sakl_ssure_var = ''SAKLANIYOR'' ';
    end
    else
    begin
      sqlstr := sqlstr + 'AND env.sakl_fsure_imha = ''' +qARVK.FieldByName('sakl_imha').AsString + ''' ';
      sqlstr := sqlstr + 'AND env.sakl_fsure = ''' +qARVK.FieldByName('sakl_sure').AsString + ''' ';
      sqlstr := sqlstr + 'AND env.sakl_fsure_tip = ''' +qARVK.FieldByName('sakl_sure_tip').AsString + ''' ';
      sqlstr := sqlstr + 'AND env.sakl_fsure_var = ''SAKLANIYOR'' ';
    end;
    sqlstr := sqlstr + 'AND env.active = ''E'' ';

    QueryOpen(qTmp, sqlstr);

    if qTmp.RecordCount > 0 then
    begin
      qARVK.edit;
      qARVK.FieldByName('bitis_tarihi').Value := null;
      qARVK.Post;
    end;

    qARVK.Next;
  end;
end;

end.
