unit unOzelOnayKayitTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Clipbrd, uniGUITypes,
  uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, Data.DB, MemDS, DBAccess, Uni, uniPanel, uniButton,
  uniBitBtn, uniCheckBox, uniDBCheckBox, uniDBLookupComboBox, uniMemo, uniDBMemo, uniMultiItem, uniComboBox,
  uniDBComboBox, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses, uniDateTimePicker, uniDBDateTimePicker,
  uniPageControl, uniBasicGrid, uniDBGrid, IdGlobal, IdSMTPBase, IdSMTP, IdSSL, IdSSLOpenSSL, IdMessage,
  IdText, IdExplicitTLSClientServerBase, uniImage, uniRadioGroup, uniGroupBox,StrUtils;

type
  TfrmOzelOnayKayitTanim = class(TUniForm)
    pnlButtons: TUniPanel;
    btnCancel: TUniBitBtn;
    btnPost: TUniBitBtn;
    dsOzOnay: TUniDataSource;
    qOzOnay: TUniQuery;
    qOOTnm: TUniQuery;
    dsOOTnm: TUniDataSource;
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
    edDurum: TUniDBComboBox;
    edDesc: TUniDBMemo;
    edOzelOnay: TUniDBLookupComboBox;
    edTarih: TUniDBDateTimePicker;
    edSaat: TUniDBEdit;
    grdDocs: TUniDBGrid;
    btnDocsAdd: TUniBitBtn;
    btnDocsDel: TUniBitBtn;
    btnDocsDown: TUniBitBtn;
    UniLabel11: TUniLabel;
    btnSendSMS: TUniBitBtn;
    edTimeStamp: TUniDBCheckBox;
    btnGoToLink: TUniBitBtn;
    edWebLink: TUniEdit;
    btnPrepLink: TUniBitBtn;
    btnEdit: TUniBitBtn;
    PgControl: TUniPageControl;
    pgGenel: TUniTabSheet;
    pgDocs: TUniTabSheet;
    pgVeriKaynagi: TUniTabSheet;
    edFaaliyetBitis: TUniDBDateTimePicker;
    UniLabel16: TUniLabel;
    grdVK: TUniDBGrid;
    qARVK: TUniQuery;
    dsARVK: TUniDataSource;
    btnVKChange: TUniBitBtn;
    btnVKRefresh: TUniBitBtn;
    btnVKDelete: TUniBitBtn;
    btnVKCalcDate: TUniBitBtn;
    imgQRCode: TUniImage;
    btnQRCode: TUniBitBtn;
    qARDocaciklama: TStringField;
    qARDocbelge_adi: TStringField;
    qARDocekleyen: TStringField;
    radioOnaySira: TUniRadioGroup;
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
    edVeliEmail: TUniDBEdit;
    UniLabel20: TUniLabel;
    UniLabel19: TUniLabel;
    edveliGSM: TUniDBEdit;
    edVeliKimlikNo: TUniDBEdit;
    UniLabel18: TUniLabel;
    edveliAdSoyad: TUniDBEdit;
    groupIYS: TUniGroupBox;
    edIYSSMS: TUniDBCheckBox;
    edIYSPhone: TUniDBCheckBox;
    lbIYSPhone: TUniLabel;
    lbIYSSMS: TUniLabel;
    edIYSEMail: TUniDBCheckBox;
    lbIYSEMail: TUniLabel;
    bIYSKontrol: TUniButton;
    btnIYSGonder: TUniButton;
    pnlLog: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    lbIDY: TUniLabel;
    lbIDT: TUniLabel;
    lbSDY: TUniLabel;
    lbSDT: TUniLabel;
    UniLabel8: TUniLabel;
    UniLabel13: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel10: TUniLabel;
    UniLabel15: TUniLabel;
    qAddIys: TUniQuery;
    lbSMSLog: TUniLabel;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSendSMSClick(Sender: TObject);
    procedure btnGoToLinkClick(Sender: TObject);
    procedure btnPrepLinkClick(Sender: TObject);
    procedure dsOzOnayStateChange(Sender: TObject);
    procedure edDurumChange(Sender: TObject);
    procedure btnDocsAddClick(Sender: TObject);
    procedure btnDocsDelClick(Sender: TObject);
    procedure btnDocsDownClick(Sender: TObject);
    procedure btnVKDeleteClick(Sender: TObject);
    procedure btnVKRefreshClick(Sender: TObject);
    procedure btnVKChangeClick(Sender: TObject);
    procedure btnVKCalcDateClick(Sender: TObject);
    procedure edOzelOnayChange(Sender: TObject);
    procedure btnQRCodeClick(Sender: TObject);
    procedure radioOnaySiraClick(Sender: TObject);
    procedure btnIYSGonderClick(Sender: TObject);
  private
    procedure ManageSettings;
    procedure PrepareTables;
    procedure PrepareVeriKaynaklari;
    procedure CloseTables;
    procedure DelDocControl(Sender: TComponent; Res: Integer);
    procedure DelVKControl(Sender: TComponent; Res: Integer);
    procedure AddVKControl(Sender: TComponent; Res: Integer);
    procedure AddDosyaControl(Sender: TComponent; Res: Integer);
    procedure ChangeDateVKControl(Sender: TComponent; Res: Integer);
    function ParseMsg(AData: TUniMemo; APwd: String): TStringList;
    function SendMail(AMsg, ARcpt: String): Boolean;
    function FindVK(KaynakID: Integer; KaynakStr: String; ImhaTur: String; Sure: Integer; SureTip: String): Boolean;
    procedure AutomaticVKAdd;
    procedure AutomaticDosyaAdd;
    procedure FaaliyetBitisKontrol;
    procedure VeriKaynaklariKontrol;
    procedure DosyalarKontrol;
    procedure IYSKontrol;

  public
    function Exec(AID, AOp: Integer): Integer;
  end;

function frmOzelOnayKayitTanim: TfrmOzelOnayKayitTanim;

implementation

uses uniGUIApplication, MainModule, McMLib, KvknetapiLib, unAcikRizaKayitListe,
  unAcikRizaDokumanKayit, unAcikRizaVKDurum, ServerModule,UrlShortLib;

{$R *.dfm}

function frmOzelOnayKayitTanim: TfrmOzelOnayKayitTanim;
begin
  Result := TfrmOzelOnayKayitTanim(MainMod.GetFormInstance(TfrmOzelOnayKayitTanim));
end;

procedure TfrmOzelOnayKayitTanim.AddDosyaControl(Sender: TComponent; Res: Integer);
begin
  if Res = mrYes then AutomaticDosyaAdd;

  VeriKaynaklariKontrol;
end;

procedure TfrmOzelOnayKayitTanim.AddVKControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  AutomaticVKAdd;
end;

procedure TfrmOzelOnayKayitTanim.AutomaticDosyaAdd;
begin
  QueryOpen(qTmp, 'SELECT * FROM def_data_ozelonay_docs WHERE oo_id = ' + IntToStr(qOzOnay.FieldByName('oo_id').AsInteger));

  while not qTmp.EOF do
  begin
    qARDoc.Append;
    qARDoc.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_data_acikriza_docs_id');
    qARDoc.FieldByName('ar_id').AsInteger  := qOzOnay.FieldByName('id').AsInteger;
    qARDoc.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    qARDoc.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    qARDoc.FieldByName('idt').AsDateTime   := Now;
    qARDoc.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
    qARDoc.FieldByName('sdt').AsDateTime     := Now;
    //qARDoc.FieldByName('ekleyen').AsString   := MainMod.KullaniciGetir(qARDoc.FieldByName('idy').AsString);
    if qTmp.FieldByName('dosya_tur').AsString = 'PDF' then
    begin
      qARDoc.FieldByName('belge_adi').AsString := qTmp.FieldByName('dosya_adi').AsString;
      qARDoc.FieldByName('aciklama').AsString  := qTmp.FieldByName('dosya_aciklama').AsString;
    end
    else if qTmp.FieldByName('dosya_tur').AsString = 'HTML' then
    begin
      if qTmp.FieldByName('tur').AsString = '1' then // Aydýnlatma/Bilgilendirme HTML Belgesi
      begin
        qARDoc.FieldByName('belge_adi').AsString := 'Aydýnlatma_Metni.html';
        qARDoc.FieldByName('aciklama').AsString  := 'Aydýnlatma/Bilgilendirme Metni';
      end
      else // Özel Onay / Açýk Rýza HTML Belgesi
      begin
        qARDoc.FieldByName('belge_adi').AsString := 'OzelOnay_Riza_Metni.html';
        qARDoc.FieldByName('aciklama').AsString  := 'Özel Onay/Açýk Rýza Metni';
      end;
    end;

    qARDoc.FieldByName('belge').Assign(qTmp.FieldByName('dosya'));
    qARDoc.Post;

    qTmp.Next;
  end;

  try
    MainMod.DBMain.StartTransaction;
    qARDoc.ApplyUpdates();
    qARDoc.CommitUpdates;
    MainMod.DBMain.Commit;
  except
    qARDoc.CancelUpdates;
    MainMod.DBMain.Rollback;
  end;

end;

procedure TfrmOzelOnayKayitTanim.AutomaticVKAdd;
var
  Kaynak_IDs : String;
begin
  QueryOpen(qTmp, 'SELECT * FROM def_data_ozelonay WHERE id = ' + IntToStr(qOzOnay.FieldByName('oo_id').AsInteger));
  Kaynak_IDs := Trim(qTmp.FieldByName('vk_ids').AsString);
  if Kaynak_IDs = '' then Exit;

  QueryOpen(qTmp, 'SELECT DISTINCT * FROM ' +
                  '( ' +
                  '   SELECT env.kaynak_id, ky.kaynak AS kaynak_str, ''DÝJÝTAL'' as sakl_tip, env.sakl_ssure_imha AS sakl_sure_imha, ' +
                  '          env.sakl_ssure_sure AS sakl_sure_sure, env.sakl_ssure_tip AS sakl_sure_tip, env.sakl_ssure AS sakl_sure ' +
                  '   FROM data_envanter env ' +
                  '   LEFT JOIN def_data_kaynak ky ON env.kaynak_id=ky.id ' +
                  '   WHERE env.kaynak_id IN (' + Kaynak_IDs + ') AND env.active = ''E'' AND env.sakl_ssure_var = ''SAKLANIYOR'' ' +
                  '   GROUP BY env.kaynak_id, ky.kaynak, env.sakl_ssure_imha, env.sakl_ssure_sure, env.sakl_ssure_tip, env.sakl_ssure ' +
                  '   UNION ALL ' +
                  '   SELECT env.kaynak_id, ky.kaynak AS kaynak_str, ''FÝZÝKSEL'' as sakl_tip, env.sakl_fsure_imha AS sakl_sure_imha, ' +
                  '          env.sakl_fsure_sure AS sakl_sure_sure, env.sakl_fsure_tip AS sakl_sure_tip, env.sakl_fsure AS sakl_sure ' +
                  '   FROM data_envanter env ' +
                  '   LEFT JOIN def_data_kaynak ky ON env.kaynak_id=ky.id ' +
                  '   WHERE env.kaynak_id IN (' + Kaynak_IDs + ') AND env.active = ''E'' AND env.sakl_fsure_var = ''SAKLANIYOR'' ' +
                  '   GROUP BY env.kaynak_id, ky.kaynak, env.sakl_fsure_imha, env.sakl_fsure_sure, env.sakl_fsure_tip, env.sakl_fsure ' +
                  ') AS tbl_imha ' +
                  'ORDER BY kaynak_id');

  qTmp.First;
  while not qTmp.EOF do
  begin
    if not FindVK(qTmp.FieldByName('kaynak_id').AsInteger, qTmp.FieldByName('kaynak_str').AsString, qTmp.FieldByName('sakl_sure_imha').AsString,
                  qTmp.FieldByName('sakl_sure_sure').AsInteger, qTmp.FieldByName('sakl_sure_tip').AsString) then
    begin
      qARVK.Append;
      qARVK.FieldByName('id').AsInteger           := MainMod.GetSeq('sq_data_acikriza_vk_id');
      qARVK.FieldByName('mc_id').AsInteger        := MainMod.MCID;
      qARVK.FieldByName('ar_id').AsInteger        := qOzOnay.FieldByName('id').AsInteger;
      qARVK.FieldByName('oo_id').AsInteger        := qOzOnay.FieldByName('oo_id').AsInteger;
      qARVK.FieldByName('ayd_id').AsInteger       := 0;
      qARVK.FieldByName('kisi_id').AsInteger      := 0;
      qARVK.FieldByName('kaynak_id').AsInteger    := qTmp.FieldByName('kaynak_id').AsInteger;
      qARVK.FieldByName('kaynak_str').AsString    := qTmp.FieldByName('kaynak_str').AsString;
      qARVK.FieldByName('sakl_tip').AsString      := qTmp.FieldByName('sakl_tip').AsString;
      qARVK.FieldByName('sakl_imha').AsString     := qTmp.FieldByName('sakl_sure_imha').AsString;
      qARVK.FieldByName('sakl_sure').AsInteger    := qTmp.FieldByName('sakl_sure_sure').AsInteger;
      qARVK.FieldByName('sakl_sure_tip').AsString := qTmp.FieldByName('sakl_sure_tip').AsString;
      qARVK.FieldByName('sakl_str').AsString      := qTmp.FieldByName('sakl_sure').AsString;
      qARVK.FieldByName('durum').AsString         := 'ALINDI';

      if qARVK.FieldByName('sakl_imha').AsString = 'BAÞLANGIÇ' then
         qARVK.FieldByName('bitis_tarihi').AsDateTime := CalcNewDate(qOzOnay.FieldByName('tarih').AsDateTime, qARVK.FieldByName('sakl_sure').AsInteger, qARVK.FieldByName('sakl_sure_tip').AsString);

      qARVK.FieldByName('idy').AsInteger          := MainMod.LoginInfo.ID;
      qARVK.FieldByName('idt').AsDateTime         := Now;
      qARVK.FieldByName('sdy').AsInteger          := MainMod.LoginInfo.ID;
      qARVK.FieldByName('sdt').AsDateTime         := Now;
      qARVK.Post;
    end;

    qTmp.Next;
  end;
end;

procedure TfrmOzelOnayKayitTanim.btnCancelClick(Sender: TObject);
begin
  if btnCancel.Caption = 'Ýptal' then
  begin
    qOzOnay.Cancel;
    qARDoc.CancelUpdates;
    ManageSettings;
  end
  else
  begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmOzelOnayKayitTanim.btnGoToLinkClick(Sender: TObject);
begin
  if qOzOnay.State in [dsInsert] then
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

procedure TfrmOzelOnayKayitTanim.btnIYSGonderClick(Sender: TObject);
var
  GSMNo: String;
  cevap: string;
begin
  GSMNo := '+90' + qOzOnay.FieldByName('gsmno').AsString;
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

procedure TfrmOzelOnayKayitTanim.btnDocsAddClick(Sender: TObject);
begin
  if qOzOnay.FieldByName('id').AsInteger < 1 then qOzOnay.FieldByName('id').AsInteger := MainMod.GetSeq('sq_data_acikriza_id');

  frmAcikRizaDokumanKayit.Exec(qARDoc, 0, qOzOnay.FieldByName('id').AsInteger, 0);
end;

procedure TfrmOzelOnayKayitTanim.btnDocsDelClick(Sender: TObject);
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

procedure TfrmOzelOnayKayitTanim.btnDocsDownClick(Sender: TObject);
var
  AStream : TMemoryStream;
begin
  if not MainMod.LoginInfo.Yetkiler[127] then
  begin
    MessageDlg('Özel Onay Formlarýndan, Doküman indirme yetkiniz yok.', mtError, [mbOk]);
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

procedure TfrmOzelOnayKayitTanim.btnEditClick(Sender: TObject);
begin
  if (qOzOnay.FieldByName('durum').AsString <> 'AKTÝF') and (qOzOnay.FieldByName('durum').AsString <> 'RIZA ALINMADI') then
  begin
    if not MainMod.LoginInfo.Yetkiler[125] then
    begin
      MessageDlg('Deðiþtirmek istediðiniz kayýt PASÝF yapýlmýþ. Bu kaydý deðiþtirme yetkiniz yok.', mtError, [mbOk]);
      Exit;
    end;
  end;

  qOzOnay.Edit;
  ManageSettings;
end;

procedure TfrmOzelOnayKayitTanim.btnPostClick(Sender: TObject);
begin
  if qOzOnay.FieldByName('oo_id').AsInteger < 1 then
  begin
    MessageDlg('Özel Onay Türü belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edOzelOnay.SetFocus;
    Exit;
  end;
  if qOzOnay.FieldByName('durum').AsString = '' then
  begin
    MessageDlg('Durum belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edDurum.SetFocus;
    Exit;
  end;
  if qOzOnay.FieldByName('tarih').AsString = '' then
  begin
    MessageDlg('Tarih belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edTarih.SetFocus;
    Exit;
  end;
  if qOzOnay.FieldByName('saat').AsString = '' then
  begin
    MessageDlg('Saat belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edSaat.SetFocus;
    Exit;
  end;
  if qOzOnay.FieldByName('ad_soyad').AsString = '' then
  begin
    MessageDlg('Kayýt Sahibinin Adý-Soyadý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edAdSoyad.SetFocus;
    Exit;
  end;
  if qOzOnay.FieldByName('kimlik_no').AsString = '' then
  begin
    MessageDlg('Kayýt Sahibinin Kimlik Numarasý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edKimlikNo.SetFocus;
    Exit;
  end;
  if qOzOnay.FieldByName('gsmno').AsString = '' then
  begin
    MessageDlg('Kayýt Sahibinin Cep Telefonu belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edGSMNo.SetFocus;
    Exit;
  end;
  if (qOzOnay.FieldByName('durum').AsString = 'AKTÝF') or (qOzOnay.FieldByName('durum').AsString = 'RIZA ALINMADI') then
  begin
    qOzOnay.FieldByName('faal_bitis').Clear;
  end
  else
  begin
    if qOzOnay.FieldByName('faal_bitis').AsString = '30.12.1899' then
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
  qOzOnay.FieldByName('onay_sira').AsInteger  := radioOnaySira.ItemIndex+1;

  if radioOnaySira.ItemIndex = 1 then
  begin
    if qOzOnay.FieldByName('ad_soyad2').AsString = '' then
    begin
      MessageDlg('Veli/Vasi Adý-Soyadý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
      edAdSoyad.SetFocus;
      Exit;
    end;
    if qOzOnay.FieldByName('kimlik_no2').AsString = '' then
    begin
      MessageDlg('Veli/Vasi Kimlik Numarasý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
      edKimlikNo.SetFocus;
      Exit;
    end;
    if qOzOnay.FieldByName('gsmno2').AsString = '' then
    begin
      MessageDlg('Veli/Vasi Cep Telefonu belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
      edGSMNo.SetFocus;
      Exit;
    end;
  end;

  if qOzOnay.State in [dsInsert] then
  begin
    if qOzOnay.FieldByName('id').AsInteger < 1 then qOzOnay.FieldByName('id').AsInteger := MainMod.GetSeq('sq_data_acikriza_id');
    qOzOnay.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    qOzOnay.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    qOzOnay.FieldByName('idt').AsDateTime   := Now;
  end;
  qOzOnay.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  qOzOnay.FieldByName('sdt').AsDateTime     := Now;
  if qOzOnay.FieldByName('aguid').AsString = '' then qOzOnay.FieldByName('aguid').AsString   := MainMod.NewGuid;
  qOzOnay.Post;

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
  if qOzOnay.FieldByName('durum').AsString = 'AKTÝF' then DosyalarKontrol
    else if qOzOnay.FieldByName('durum').AsString = 'FAALÝYET BÝTTÝ' then FaaliyetBitisKontrol
      else
        begin
          MessageDlg('Lütfen Veri Kaynaklarýnýn durumlarýný kontrol etmeyi unutmayýnýz.', mtInformation, [mbOk]);
        end;
end;

procedure TfrmOzelOnayKayitTanim.btnPrepLinkClick(Sender: TObject);
begin
  if qOzOnay.FieldByName('aguid').AsString = '' then
  begin
    qOzOnay.FieldByName('aguid').AsString   := MainMod.NewGuid;
    edWebLink.Text := MainMod.AcikRizaLink + qOzOnay.FieldByName('aguid').AsString;
    MainMod.CreateQRCode(edWebLink.Text, imgQRCode);
  end;
end;

procedure TfrmOzelOnayKayitTanim.btnSendSMSClick(Sender: TObject);
var
  URLLink ,
  OTC     ,
  GSMNo   : String;
  Mesaj   : String;
begin
 if radioOnaySira.ItemIndex = 0 then
  begin
    if qOzOnay.FieldByName('gsmno').AsString = '' then
    begin
      MessageDlg('Cep Telefonu numarasý girilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
      Exit;
    end;
  end else
    begin
    if qOzOnay.FieldByName('gsmno2').AsString = '' then
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

  GSMNo := qOzOnay.FieldByName('gsmno').AsString;
  GSMNo := StringReplace(GSMNo, '(', '', [rfReplaceAll]);
  GSMNo := StringReplace(GSMNo, ')', '', [rfReplaceAll]);

// to do : Bu þimdilik kaldýrýldý...
//  OTC := MainMod.CreateOTC;
//  qOzOnay.Edit;
//  qOzOnay.FieldByName('gkod').AsString := OTC;
//  qOzOnay.Post;

  // to do : Bu parametrik olacak
  // Mesaj := 'ONAY/AÇIK RIZA iþlemlerini tamamlamak için ' + URLLink + ' adresindeki forma ' + OTC + ' kodunu girerek iþleminizi onaylayabilirsiniz.';
  //Mesaj := 'ONAY/AÇIK RIZA iþlemlerini tamamlamak için ' + URLLink + ' adresindeki formu onaylayabilirsiniz.';
  Mesaj := 'Özel onay iþlemini tamamlamak için ' + URLLink + ' baðlantýsýna týklayabilirsiniz.' ;

  if not SendSMS(Mesaj, GSMNo, True, UniGuiApplication.UniApplication.RemoteAddress,'01OO',qOzOnay.FieldByName('id').AsInteger) then
  begin
    MessageDlg(Mesaj, mtError, [mbOk]);
    MainMod.SaveSMSLog(MainMod.MCID, qOzOnay.FieldByName('id').AsInteger, 0, '01OO', '', 'HATA : ' + Mesaj);
    Exit;
  end;
  //MainMod.SaveSMSLog(MainMod.MCID, qOzOnay.FieldByName('id').AsInteger, 1, 'ESOPL', '', 'ÝÞLEM BAÞARILI : ' + Mesaj);

  MessageDlg('Ýþlem Tamam... SMS Gönderildi.', mtInformation, [mbOk]);
  IYSKontrol; //loglarý yenile
end;

procedure TfrmOzelOnayKayitTanim.btnQRCodeClick(Sender: TObject);
var
  aQRCodeFile: String;
  FUrl: String;
begin
  if qOzOnay.State in [dsInsert] then
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

procedure TfrmOzelOnayKayitTanim.btnVKCalcDateClick(Sender: TObject);
var
  Msg : String;
begin
  Msg := 'DÝKKAT..! Onay/Rýza Durumuna göre ÝMHA EDÝLMEMÝÞ veri kaynaklarý için '#13 +
         'Planlanan Ýmha Tarihleri yeniden hesaplanacak. Onaylýyor musunuz?';

  MessageDlg(Msg, mtConfirmation, mbYesNo, ChangeDateVKControl);
end;

procedure TfrmOzelOnayKayitTanim.btnVKChangeClick(Sender: TObject);
var
  Durum    ,
  Aciklama : String;
  Tarih    : TDateTime;
begin
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
    qARVK.Edit;
    qARVK.FieldByName('durum').AsString := Durum;
    qARVK.FieldByName('imha_tarihi').AsDateTime := Tarih;
    if qARVK.FieldByName('durum').AsString <> 'ÝMHA EDÝLDÝ' then qARVK.FieldByName('imha_tarihi').Clear;
    qARVK.FieldByName('imha_aciklama').AsString := Aciklama;
    qARVK.Post;
  end;
  ManageSettings;
end;

procedure TfrmOzelOnayKayitTanim.btnVKDeleteClick(Sender: TObject);
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

procedure TfrmOzelOnayKayitTanim.btnVKRefreshClick(Sender: TObject);
var
  Msg : String;
begin
  MessageDlg('Veri Kaynaklarýný güncelleme yetkiniz yok.', mtError, [mbOk]);
  Exit;

  if not MainMod.LoginInfo.Yetkiler[131] then
  begin
    MessageDlg('Veri Kaynaklarýný güncelleme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if qARDoc.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Listeden seçili dokümaný çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelDocControl);

end;

procedure TfrmOzelOnayKayitTanim.ChangeDateVKControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  // to do : Bu tamamlanacak
end;

procedure TfrmOzelOnayKayitTanim.CloseTables;
begin
  qOOTnm.Close;
  qARDoc.Close;
  qOzOnay.Close;
end;

procedure TfrmOzelOnayKayitTanim.DelDocControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  qARDoc.Delete;
end;

procedure TfrmOzelOnayKayitTanim.DelVKControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  qARVK.Delete;
end;

procedure TfrmOzelOnayKayitTanim.DosyalarKontrol;
var
  Msg : String;
begin
  if qOzOnay.FieldByName('durum').AsString <> 'AKTÝF' then Exit;
  if qARDoc.RecordCount > 0 then Exit;

  Msg := 'Bu onay/rýza için dokümanlar eklenmemiþ. Þimdi otomatik eklemek ister misiniz?<br><br>' +
         'NOT : Eðer fiziksel alýnmýþ rýza/onay kaydý giriyorsanýz EVET seçiniz. Aksi durumda ONLINE rýza/onay ' +
         'alýnacak ise HAYIR seçiniz.';
  MessageDlg(Msg, mtConfirmation, mbYesNo, AddDosyaControl);
end;

procedure TfrmOzelOnayKayitTanim.dsOzOnayStateChange(Sender: TObject);
begin
  ManageSettings;
end;

procedure TfrmOzelOnayKayitTanim.edDurumChange(Sender: TObject);
begin
  edFaaliyetBitis.Enabled := edDurum.ItemIndex in [2, 3, 4];


  edVeliAdSoyad.Enabled := (edDurum.ItemIndex <> 0) and (radioOnaySira.ItemIndex = 1);
  edVeliKimlikNo.Enabled :=  (edDurum.ItemIndex <> 0) and (radioOnaySira.ItemIndex = 1);
  edveliGSM.Enabled :=  (edDurum.ItemIndex <> 0 ) and (radioOnaySira.ItemIndex = 1)  ;
  edVelieMail.Enabled :=  (edDurum.ItemIndex <> 0) and (radioOnaySira.ItemIndex = 1)  ;
end;

procedure TfrmOzelOnayKayitTanim.edOzelOnayChange(Sender: TObject);
begin
  if qOzOnay.FieldByName('oo_id').AsInteger < 1 then
  begin
    groupIYS.Visible := False;
    Exit;
  end;

  QueryOpen(qTmp, 'SELECT iys_var FROM def_data_ozelonay WHERE id = ' + qOzOnay.FieldByName('oo_id').AsString);
  groupIYS.Visible   := (qTmp.FieldByName('iys_var').AsString = 'E') and (MainMod.IYSVar);
  edIYSEMail.Checked := edIYSEMail.Checked and MainMod.IYSVar and groupIYS.Visible;
  edIYSSMS.Checked   := edIYSSMS.Checked   and MainMod.IYSVar and groupIYS.Visible;
  edIYSPhone.Checked := edIYSPhone.Checked and MainMod.IYSVar and groupIYS.Visible;

  IYSKontrol;
end;

function TfrmOzelOnayKayitTanim.Exec(AID, AOp: Integer): Integer;
begin
  if AOp = 0 then // Insert
  begin
    QueryOpen(qOzOnay, 'SELECT * FROM data_acikriza WHERE id = 0');
    qOzOnay.Insert;
    qOzOnay.FieldByName('durum').AsString      := 'RIZA ALINMADI';
    qOzOnay.FieldByName('aguid').AsString      := '';
    qOzOnay.FieldByName('gkod').AsString       := '';
    qOzOnay.FieldByName('damga').AsString      := 'H';
    qOzOnay.FieldByName('id_tur').AsString     := 'OO';
    qOzOnay.FieldByName('onay_sira').AsString   := '1';
    qOzOnay.FieldByName('saat').AsString       := FormatDateTime('hh:nn', Now);
    qOzOnay.FieldByName('tarih').AsDateTime    := Date;
    qOzOnay.FieldByName('iys_email').AsString  := 'E';
    qOzOnay.FieldByName('iys_sms').AsString    := 'E';
    qOzOnay.FieldByName('iys_phone').AsString  := 'E';
    radioOnaySira.ItemIndex := 0;
  end
  else // Edit
  begin
    QueryOpen(qOzOnay, 'SELECT * FROM data_acikriza WHERE id = ' + IntToStr(AID));
    radioOnaySira.ItemIndex := qOzOnay.FieldByName('onay_sira').AsInteger-1;
    PrepareVeriKaynaklari;
    qOzOnay.Edit;
  end;
  PrepareTables;

  PgControl.ActivePage := pgGenel;
  ActiveControl := edOzelOnay;
  edOzelOnayChange(edOzelOnay);
  radioOnaySiraClick(radioOnaySira);
  edDurumChange(edDurum);
  Result := ShowModal;

  CloseTables;
end;

procedure TfrmOzelOnayKayitTanim.FaaliyetBitisKontrol;
begin
  if qOzOnay.FieldByName('durum').AsString <> 'FAALÝYET BÝTTÝ' then Exit;
  PrepareVeriKaynaklari;

  qARVK.First;
  while not qARVK.EOF do
  begin
    if (qARVK.FieldByName('durum').AsString = 'ALINDI') and (qARVK.FieldByName('sakl_imha').AsString = 'BÝTÝÞ') then
    begin
      qARVK.Edit;
      qARVK.FieldByName('bitis_tarihi').AsDateTime := CalcNewDate(qOzOnay.FieldByName('faal_bitis').AsDateTime, qARVK.FieldByName('sakl_sure').AsInteger, qARVK.FieldByName('sakl_sure_tip').AsString);
      qARVK.Post;
    end;
    qARVK.Next;
  end;
  qARVK.First;
end;

function TfrmOzelOnayKayitTanim.FindVK(KaynakID: Integer; KaynakStr: String; ImhaTur: String; Sure: Integer; SureTip: String): Boolean;
var
  Found : Boolean;
begin
  Found := False;
  qARVK.First;
  while not qARVK.EOF do
  begin
    if (qARVK.FieldByName('kaynak_id').AsInteger    = KaynakID) and
       (qARVK.FieldByName('kaynak_str').AsString    = KaynakStr) and
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

procedure TfrmOzelOnayKayitTanim.IYSKontrol;
var
  GSMNo: String;
begin
  if groupIYS.Visible then
  begin
    GSMNo := qOzOnay.FieldByName('gsmno').AsString;
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
                    'WHERE ar_id=' + qOzOnay.FieldByName('id').AsString +
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

procedure TfrmOzelOnayKayitTanim.ManageSettings;
begin
  // to do : Yetkiler ayarlanacak
  btnEdit.Enabled      := MainMod.LoginInfo.Yetkiler[124] and (qOzOnay.State = dsBrowse) and (qOzOnay.FieldByName('id').AsInteger > 0);
  btnPost.Enabled      := DataEditing(qOzOnay);

  btnPrepLink.Enabled  := btnPost.Enabled;
  btnGoToLink.Enabled  := not btnPost.Enabled;
  btnQRCode.Enabled    := not btnPost.Enabled;
  btnSendSMS.Enabled   := not btnPost.Enabled;

  btnVKChange.Enabled  := MainMod.LoginInfo.Yetkiler[130] and (qOzOnay.State = dsBrowse);
  btnVKRefresh.Enabled := MainMod.LoginInfo.Yetkiler[131] and (qOzOnay.State = dsBrowse);
  btnVKDelete.Enabled  := MainMod.LoginInfo.Yetkiler[132] and (qOzOnay.State = dsBrowse);
  btnVKDelete.Enabled  := (qOzOnay.State = dsBrowse);

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

function TfrmOzelOnayKayitTanim.ParseMsg(AData: TUniMemo; APwd: String): TStringList;
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

procedure TfrmOzelOnayKayitTanim.PrepareTables;
begin
  if qOzOnay.FieldByName('id').AsInteger < 1 then qOzOnay.FieldByName('id').AsInteger := MainMod.GetSeq('sq_data_acikriza_id');

  QueryOpen(qOOTnm, 'SELECT id, tanim FROM def_data_ozelonay  WHERE durum = ''YAYINDA'' AND ' +
                    'onay_var = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY id');

  QueryOpen(qARDoc,  'SELECT ard.*, us.full_name as ekleyen ' +
                     'FROM data_acikriza_docs ard ' +
                     '  LEFT JOIN usr_user us ON us.id = ard.idy ' +
                     'WHERE ard.mc_id = ' + IntToStr(MainMod.MCID) + '  AND ard.ar_id = ' +
                     qOzOnay.FieldByName('id').AsString + ' ORDER BY ard.id');
end;

procedure TfrmOzelOnayKayitTanim.PrepareVeriKaynaklari;
begin
  if qOzOnay.FieldByName('id').AsInteger < 1 then Exit;

  QueryOpen(qARVK, 'SELECT vk.*, us1.full_name as ekleyen, us2.full_name as degistiren ' +
                   'FROM data_acikriza_vk vk ' +
                   '  LEFT JOIN usr_user us1 ON us1.id = vk.idy ' +
                   '  LEFT JOIN usr_user us2 ON us2.id = vk.sdy ' +
                   'WHERE vk.mc_id = ' + IntToStr(MainMod.MCID) + ' AND vk.ar_id = ' +
                   qOzOnay.FieldByName('id').AsString + ' ORDER BY vk.id');
end;

procedure TfrmOzelOnayKayitTanim.radioOnaySiraClick(Sender: TObject);
begin
  gbVeli.Enabled := radioOnaySira.ItemIndex = 1;
  edDurumChange(edDurum);
end;

function TfrmOzelOnayKayitTanim.SendMail(AMsg, ARcpt: String): Boolean;
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
  MailAdr  := qOzOnay.FieldByName('email').AsString;

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

procedure TfrmOzelOnayKayitTanim.UniFormBeforeShow(Sender: TObject);
begin
  if qOzOnay.FieldByName('aguid').AsString = '' then edWebLink.Text := ''
  else
  begin
    edWebLink.Text := MainMod.AcikRizaLink + qOzOnay.FieldByName('aguid').AsString;
    MainMod.CreateQRCode(edWebLink.Text, imgQRCode);
  end;

  ManageSettings;
  lbIDY.Caption := MainMod.KullaniciGetir(qOzOnay.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(qOzOnay.FieldByName('sdy').AsString);

  if dsOzOnay.State = dsEdit then
  begin
    if lbIDY.Text = '' then lbIDY.Text := 'SÝSTEM';
    if lbSDY.Text = '' then lbSDY.Text := 'SÝSTEM';
  end;

  if qOzOnay.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qOzOnay.FieldByName('idt').AsDateTime);
  if qOzOnay.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qOzOnay.FieldByName('sdt').AsDateTime);
  IYSKontrol;
end;

procedure TfrmOzelOnayKayitTanim.VeriKaynaklariKontrol;
var
  Msg : String;
begin
  if qOzOnay.FieldByName('durum').AsString <> 'AKTÝF' then Exit;
  PrepareVeriKaynaklari;
  if qARVK.RecordCount > 0 then Exit;

  Msg := 'Bu onay/rýza için veri kaynaklarý oluþturulmamýþ. Þimdi otomatik oluþturmak ister misiniz?<br><br>' +
         'NOT : Eðer fiziksel alýnmýþ rýza/onay kaydý giriyorsanýz EVET seçiniz. Aksi durumda ONLINE rýza/onay ' +
         'alýnacak ise HAYIR seçiniz.';
  MessageDlg(Msg, mtConfirmation, mbYesNo, AddVKControl);
end;

end.
