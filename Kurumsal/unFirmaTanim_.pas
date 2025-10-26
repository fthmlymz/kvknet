unit unFirmaTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StdCtrls,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniCheckBox, uniDBCheckBox, uniEdit, uniDBEdit, uniLabel,
  uniGUIBaseClasses, uniPanel, uniBasicGrid, uniDBGrid, uniDBLookupComboBox, uniMultiItem, uniComboBox,
  uniDBComboBox, uniPageControl, Data.DB, DBAccess, Uni, uniImage, uniDBImage, uniFileUpload,
  MemDS, Vcl.Menus, uniMainMenu, uniMenuButton;

type
  TfrmFirmaTanim = class(TUniForm)
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
    pgKurum: TUniTabSheet;
    UniLabel8: TUniLabel;
    UniLabel17: TUniLabel;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    UniLabel11: TUniLabel;
    UniLabel16: TUniLabel;
    edUnvan: TUniDBEdit;
    edKrmVDairesi: TUniDBEdit;
    edKrmVNo: TUniDBEdit;
    edKrmKEP: TUniDBEdit;
    edKrmTel1: TUniDBEdit;
    edKrmAdresNo: TUniDBEdit;
    UniLabel30: TUniLabel;
    UniLabel29: TUniLabel;
    pgVeriSorumlusu: TUniTabSheet;
    UniLabel13: TUniLabel;
    UniLabel34: TUniLabel;
    UniLabel35: TUniLabel;
    edVSAd: TUniDBEdit;
    edVSSoyad: TUniDBEdit;
    edVSTCK: TUniDBEdit;
    edVSEMail: TUniDBEdit;
    edVSTel1: TUniDBEdit;
    edVSTel2: TUniDBEdit;
    edVSAdresNo: TUniDBEdit;
    edVSAdres1: TUniDBEdit;
    edVSAdres2: TUniDBEdit;
    pgDiger: TUniTabSheet;
    dsMCDef: TUniDataSource;
    pnlButtons: TUniPanel;
    edKrmEMail: TUniDBEdit;
    edKrmTel2: TUniDBEdit;
    UniLabel12: TUniLabel;
    edKrmAdres1: TUniDBEdit;
    edKrmAdres2: TUniDBEdit;
    UniLabel14: TUniLabel;
    UniLabel15: TUniLabel;
    UniLabel18: TUniLabel;
    UniLabel19: TUniLabel;
    UniLabel20: TUniLabel;
    UniLabel21: TUniLabel;
    edVSKEP: TUniDBEdit;
    UniLabel22: TUniLabel;
    edWeb1: TUniDBEdit;
    UniLabel25: TUniLabel;
    edSehir: TUniDBEdit;
    UniDBImage1: TUniDBImage;
    btnEditPic: TUniBitBtn;
    FileUp: TUniFileUpload;
    UniLabel1: TUniLabel;
    edCode: TUniDBEdit;
    UniLabel2: TUniLabel;
    edTitle: TUniDBEdit;
    UniLabel23: TUniLabel;
    edWeb2: TUniDBEdit;
    UniLabel24: TUniLabel;
    edWeb3: TUniDBEdit;
    UniLabel3: TUniLabel;
    edFax: TUniDBEdit;
    UniLabel27: TUniLabel;
    edMersisNo: TUniDBEdit;
    UniLabel28: TUniLabel;
    edVSBFormLink: TUniEdit;
    btnGoToVSBForm: TUniBitBtn;
    btnGoToWeb2: TUniBitBtn;
    btnGoToWeb3: TUniBitBtn;
    UniBitBtn1: TUniBitBtn;
    UniLabel31: TUniLabel;
    UniLabel32: TUniLabel;
    UniLabel33: TUniLabel;
    UniLabel36: TUniLabel;
    UniLabel37: TUniLabel;
    qTmp: TUniQuery;
    imgQRCode: TUniImage;
    btnQRCode: TUniBitBtn;
    UniMenuButton1: TUniMenuButton;
    menuKVKKSayfasi: TUniPopupMenu;
    btnKVKKSayfasi: TUniMenuItem;
    btnKVKKSayfasiDepartman: TUniMenuItem;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnEditPicClick(Sender: TObject);
    procedure FileUpCompleted(Sender: TObject; AStream: TFileStream);
    procedure btnGoToVSBFormClick(Sender: TObject);
    procedure btnGoToWeb2Click(Sender: TObject);
    procedure btnGoToWeb3Click(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure btnKVKKSayfasiClick(Sender: TObject);
    procedure btnQRCodeClick(Sender: TObject);
    procedure btnKVKKSayfasiDepartmanClick(Sender: TObject);
  private
    Data : TUniQuery;
    procedure ManageSettings;
  public
  end;

function frmFirmaTanim: TfrmFirmaTanim;

implementation

uses
  uniGUIApplication, MainModule, McMLib, unHelpPage, ServerModule;

{$R *.dfm}

function frmFirmaTanim: TfrmFirmaTanim;
begin
  Result := TfrmFirmaTanim(MainMod.GetFormInstance(TfrmFirmaTanim));
end;

procedure TfrmFirmaTanim.btnCancelClick(Sender: TObject);
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

procedure TfrmFirmaTanim.btnEditClick(Sender: TObject);
begin
  if Data.FieldByName('active').AsString <> 'E' then
  begin
    if not MainMod.LoginInfo.Yetkiler[5] then
    begin
      MessageDlg('Deðiþtirmek istediðiniz kayýt PASÝF yapýlmýþ. Bu kaydý deðiþtirme yetkiniz yok.', mtError, [mbOk]);
      Exit;
    end;
  end;

  Data.Edit;
  ManageSettings;
  //edTitle.SetFocus;
end;

procedure TfrmFirmaTanim.btnEditPicClick(Sender: TObject);
begin
  FileUp.Execute;
end;

procedure TfrmFirmaTanim.btnGoToVSBFormClick(Sender: TObject);
begin
  if edVSBFormLink.Text = '' then
  begin
    MessageDlg('Link adresi henüz hazýr deðil. Bilgileri kaydettiðinizde baðlantýlar da hazýr olacak.', mtError, [mbOk]);
    Exit;
  end;

  UniSession.BrowserWindow(edVSBFormLink.Text, 0, 0, '_blank');
end;

procedure TfrmFirmaTanim.btnGoToWeb2Click(Sender: TObject);
begin
  if edWeb2.Text = '' then
  begin
    MessageDlg('Link adresi belirtilmemiþ.', mtError, [mbOk]);
    Exit;
  end;

  UniSession.BrowserWindow(edWeb2.Text, 0, 0, '_blank');
end;

procedure TfrmFirmaTanim.btnGoToWeb3Click(Sender: TObject);
begin
  if edWeb3.Text = '' then
  begin
    MessageDlg('Link adresi belirtilmemiþ.', mtError, [mbOk]);
    Exit;
  end;

  UniSession.BrowserWindow(edWeb3.Text, 0, 0, '_blank');
end;

procedure TfrmFirmaTanim.btnKVKKSayfasiClick(Sender: TObject);
var
  sqlStr   : String;
  strList  : TStringList;
  strHtml  : TStringList;
  aFileName: String;
  fUrl     : String;
begin
  strList := TStringList.Create;
  strHtml := TStringList.Create;
  strHtml.LoadFromFile(ServerMod.FilesFolderPath + 'temp_html/kvkkSayfasiTemplate.htm');

	SQLStr   := 'SELECT distinct ayd.id as ref_no, ayd.tanim, ' +
              '(''' + MainMod.AydinlatmaLink + ''' || ayd.aguid)::character varying (200) AS web_adresi ' +
              ' FROM def_data_aydinlatma ayd ' +
              ' WHERE ayd.mc_id = ' + IntToStr(MainMod.MCID) +
              ' AND AYD.durum = ''YAYINDA'' AND ayd.acik_riza =''H''' +
              ' ORDER BY ayd.tanim';
  QueryOpen(qTmp, sqlStr);
  strList.Clear;
  qTmp.First;
  while not qTmp.Eof do
  begin
    strList.Add('<a class="Link" href="' + qTmp.FieldByName('web_adresi').AsString + '" target="_blank" rel="noopener">'
                + tr_regular(qTmp.FieldByName('tanim').AsString) + ' Aydýnlatma Metni</a>');
    qTmp.Next;
  end;
  strHtml.Text := StringReplace(strHtml.Text, '%%%AYDINLATMALINK%%%', strList.Text, [rfReplaceAll]);

	SQLStr   := 'SELECT distinct ayd.id as ref_no, ayd.tanim, ' +
              '(''' + MainMod.AydinlatmaLink + ''' || ayd.aguid)::character varying (200) AS web_adresi ' +
              ' FROM def_data_aydinlatma ayd ' +
              ' WHERE ayd.mc_id = ' + IntToStr(MainMod.MCID) +
              ' AND AYD.durum = ''YAYINDA'' AND ayd.acik_riza =''E''' +
              ' ORDER BY ayd.tanim';
  QueryOpen(qTmp, sqlStr);
  strList.Clear;
  qTmp.First;
  while not qTmp.Eof do
  begin
    strList.Add('<a class="Link" href="' + qTmp.FieldByName('web_adresi').AsString + '" target="_blank" rel="noopener">'
                +  tr_regular(qTmp.FieldByName('tanim').AsString) + ' Aydýnlatma ve Açýk Rýza Metni</a>');
    qTmp.Next;
  end;
  strHtml.Text := StringReplace(strHtml.Text, '%%%ACIKRIZALINK%%%', strList.Text, [rfReplaceAll]);

	SQLStr   := 'SELECT distinct oo.id as ref_no, oo.tanim, ' +
              '(''' + MainMod.OzelOnayLink + ''' || oo.aguid)::character varying (200) AS web_adresi ' +
              ' FROM def_data_ozelonay oo ' +
              ' WHERE oo.mc_id = ' + IntToStr(MainMod.MCID) +
              ' AND oo.durum = ''YAYINDA'' AND oo.tanim like ''%POLÝTÝKA%''' +
              ' ORDER BY oo.tanim';

  QueryOpen(qTmp, sqlStr);
  strList.Clear;
  qTmp.First;
  while not qTmp.Eof do
  begin
    strList.Add('<a class="Link" href="' + qTmp.FieldByName('web_adresi').AsString + '" target="_blank" rel="noopener">'
                +  tr_regular(qTmp.FieldByName('tanim').AsString) + '</a>');
    qTmp.Next;
  end;
  strHtml.Text := StringReplace(strHtml.Text, '%%%POLITIKALINK%%%', strList.Text, [rfReplaceAll]);

  strHtml.Text := StringReplace(strHtml.Text, '%%%ILGILIKISILINK%%%',
                         '<a class="Link" href="' + edVSBFormLink.Text + '" target="_blank" rel="noopener">' + Str2HTMLStr('Ýlgili Kiþi Baþvuru Formu') + '</a>', [rfReplaceAll]);

  aFileName := ServerMod.NewCacheFileUrl(False, 'html', '', '', FUrl, True);
  strHtml.SaveToFile(aFileName);
  UniSession.SendFile(aFileName, 'kvkkSayfasi.html');
end;

procedure TfrmFirmaTanim.btnKVKKSayfasiDepartmanClick(Sender: TObject);
var
  sqlStr   : String;
  strList  : TStringList;
  strHtml  : TStringList;
  aFileName: String;
  fUrl     : String;
  deptListAM : TStringList;
  deptListAR : TStringList;
  i        : integer;
begin
  strList := TStringList.Create;
  strHtml := TStringList.Create;
  strHtml.LoadFromFile(ServerMod.FilesFolderPath + 'temp_html/kvkkSayfasiDeptTemplate.htm');

  deptListAM := TStringList.Create;
  deptListAR := TStringList.Create;

	SQLStr   := 'SELECT distinct dp.title departman, env.dept_id ' +
              ' FROM def_data_aydinlatma ayd, '+
              ' def_data_kisi kisi, ' +
              ' data_envanter env, ' +
              ' sys_deptdef dp ' +
              ' WHERE kisi.id = ayd.kisi_id and env.kisi_id=ayd.kisi_id AND env.active=''E'' AND' +
              ' env.dept_id = dp.id AND ayd.mc_id = ' + IntToStr(MainMod.MCID) +
              ' AND AYD.durum = ''YAYINDA'' AND ayd.acik_riza =''H''' +
              ' ORDER BY departman';
  QueryOpen(qTmp, sqlStr);
  DeptListAM.Clear;
  qTmp.First;
  while not qTmp.Eof do
  begin
    DeptListAM.Add(qTmp.FieldByName('dept_id').AsString);
    qTmp.Next;
  end;

  strList.Clear;
  for i := 0 to deptListAM.Count-1 do
  begin
    SQLStr   := 'SELECT distinct ayd.id as ref_no, ayd.kisi_id as ilgili_kisi_no, ' +
                'kisi.kisi as ilgili_kisi, ayd.durum, ayd.tanim, ' +
                'case when ayd.acik_riza =''E'' then ''AÇIK RIZA'' else ''AYDINLATMA'' end as dokuman_turu, ' +
                'case when ayd.iys_var = ''E'' then ''VAR'' else ''YOK'' end as iys_entegrasyonu, ' +
                '(''' + MainMod.AydinlatmaLink + ''' || ayd.aguid)::character varying (200) AS web_adresi, ' +
                'ayd.description as aciklama, dp.title departman ' +
                ' FROM def_data_aydinlatma ayd, '+
                ' def_data_kisi kisi, ' +
                ' data_envanter env, ' +
                ' sys_deptdef dp ' +
                ' WHERE kisi.id = ayd.kisi_id and env.kisi_id=ayd.kisi_id AND env.active=''E'' AND' +
                ' env.dept_id = dp.id AND ayd.mc_id = ' + IntToStr(MainMod.MCID) +
                ' AND dp.id = ' + deptListAM[i] +
                ' AND AYD.durum = ''YAYINDA'' AND ayd.acik_riza =''H''' +
                ' ORDER BY ayd.tanim';
    QueryOpen(qTmp, sqlStr);
    qTmp.First;
    strList.Add('<div class="divAcilan Acilan_Departman">' +
                '    <div class="divSatir satir_departman goster_am' + deptListAM[i] + ' ">' +
                '        <h3 class="h3Baslik  noselect">' + Str2HTMLStr(qTmp.FieldByName('departman').AsString) + '</h3>' +
                '    </div>' +
                '    <div class="divMetinler metin_departman" id="detay_am' + deptListAM[i] + '">');
    while not qTmp.Eof do
    begin
      strList.Add('       <a class="Link" href="' + qTmp.FieldByName('web_adresi').AsString + '" target="_blank" rel="noopener">' +
                  Str2HTMLStr(tr_regular(qTmp.FieldByName('tanim').AsString)) + ' Ayd&#305;nlatma Metni</a>');

      qTmp.Next;
    end;
    strList.Add('    </div></div>');
  end;


  strHtml.Text := StringReplace(strHtml.Text, '%%%AYDINLATMALINK%%%', strList.Text, [rfReplaceAll]);

	SQLStr   := 'SELECT distinct dp.title departman, env.dept_id ' +
              ' FROM def_data_aydinlatma ayd, '+
              ' def_data_kisi kisi, ' +
              ' data_envanter env, ' +
              ' sys_deptdef dp ' +
              ' WHERE kisi.id = ayd.kisi_id and env.kisi_id=ayd.kisi_id AND env.active=''E'' AND' +
              ' env.dept_id = dp.id AND ayd.mc_id = ' + IntToStr(MainMod.MCID) +
              ' AND AYD.durum = ''YAYINDA'' AND ayd.acik_riza =''E''' +
              ' ORDER BY departman';
  QueryOpen(qTmp, sqlStr);
  DeptListAR.Clear;
  qTmp.First;
  while not qTmp.Eof do
  begin
    DeptListAR.Add(qTmp.FieldByName('dept_id').AsString);
    qTmp.Next;
  end;
  strList.Clear;
  for i := 0 to deptListAR.Count-1 do
  begin
    SQLStr   := 'SELECT distinct ayd.id as ref_no, ayd.kisi_id as ilgili_kisi_no, ' +
                'kisi.kisi as ilgili_kisi, ayd.durum, ayd.tanim, ' +
                'case when ayd.acik_riza =''E'' then ''AÇIK RIZA'' else ''AYDINLATMA'' end as dokuman_turu, ' +
                'case when ayd.iys_var = ''E'' then ''VAR'' else ''YOK'' end as iys_entegrasyonu, ' +
                '(''' + MainMod.AydinlatmaLink + ''' || ayd.aguid)::character varying (200) AS web_adresi, ' +
                'ayd.description as aciklama, dp.title departman ' +
                ' FROM def_data_aydinlatma ayd, '+
                ' def_data_kisi kisi, ' +
                ' data_envanter env, ' +
                ' sys_deptdef dp ' +
                ' WHERE kisi.id = ayd.kisi_id and env.kisi_id=ayd.kisi_id AND env.active=''E'' AND' +
                ' env.dept_id = dp.id AND ayd.mc_id = ' + IntToStr(MainMod.MCID) +
                ' AND dp.id = ' + deptListAR[i] +
                ' AND AYD.durum = ''YAYINDA'' AND ayd.acik_riza =''E''' +
                ' ORDER BY ayd.tanim';
    QueryOpen(qTmp, sqlStr);
    qTmp.First;
    strList.Add('<div class="divAcilan Acilan_Departman">' +
                '    <div class="divSatir satir_departman goster_ar' + deptListAR[i] + ' ">' +
                '        <h3 class="h3Baslik  noselect">' + Str2HTMLStr(qTmp.FieldByName('departman').AsString) + '</h3>' +
                '    </div>' +
                '    <div class="divMetinler metin_departman" id="detay_ar' + deptListAR[i] + '">');
    while not qTmp.Eof do
    begin
      strList.Add('       <a class="Link" href="' + qTmp.FieldByName('web_adresi').AsString + '" target="_blank" rel="noopener">' +
                  Str2HTMLStr(tr_regular(qTmp.FieldByName('tanim').AsString)) + ' Ayd&#305;nlatma ve A&#231;&#305;k R&#305;za Metni</a>');

      qTmp.Next;
    end;
    strList.Add('    </div></div>');
  end;
  strHtml.Text := StringReplace(strHtml.Text, '%%%ACIKRIZALINK%%%', strList.Text, [rfReplaceAll]);

	SQLStr   := 'SELECT distinct oo.id as ref_no, oo.tanim, ' +
              '(''' + MainMod.OzelOnayLink + ''' || oo.aguid)::character varying (200) AS web_adresi ' +
              ' FROM def_data_ozelonay oo ' +
              ' WHERE oo.mc_id = ' + IntToStr(MainMod.MCID) +
              ' AND oo.durum = ''YAYINDA'' AND oo.tanim like ''%POLÝTÝKA%''' +
              ' ORDER BY oo.tanim';

  QueryOpen(qTmp, sqlStr);
  strList.Clear;
  qTmp.First;
  while not qTmp.Eof do
  begin
    strList.Add('<a class="Link" href="' + qTmp.FieldByName('web_adresi').AsString + '" target="_blank" rel="noopener">'
                +  Str2HTMLStr(tr_regular(qTmp.FieldByName('tanim').AsString)) + '</a>');
    qTmp.Next;
  end;
  strHtml.Text := StringReplace(strHtml.Text, '%%%POLITIKALINK%%%', strList.Text, [rfReplaceAll]);

  strHtml.Text := StringReplace(strHtml.Text, '%%%ILGILIKISILINK%%%',
                         '<a class="Link" href="' + edVSBFormLink.Text + '" target="_blank" rel="noopener">' + Str2HTMLStr('Ýlgili Kiþi Baþvuru Formu') + '</a>', [rfReplaceAll]);

  strList.Clear;
  for i := 0 to deptListAM.Count-1 do
  begin
    strList.Add('$(''.goster_am' + deptListAM[i] + ''').on(''click'', function () {$(''#detay_am' + deptListAM[i] + ''').toggle(''100'');});');
  end;
  for i := 0 to deptListAR.Count-1 do
  begin
    strList.Add('$(''.goster_ar' + deptListAR[i] + ''').on(''click'', function () {$(''#detay_ar' + deptListAR[i] + ''').toggle(''100'');});');
  end;
  strHtml.Text := StringReplace(strHtml.Text, '%%%SCRIPTREADY%%%', strList.Text, [rfReplaceAll]);


  aFileName := ServerMod.NewCacheFileUrl(False, 'html', '', '', FUrl, True);
  strHtml.SaveToFile(aFileName);
  UniSession.SendFile(aFileName, 'kvkkSayfasi.html');
end;

procedure TfrmFirmaTanim.btnPostClick(Sender: TObject);
begin
  Data.FieldByName('sdy').AsInteger  := MainMod.LoginInfo.ID;
  Data.FieldByName('sdt').AsDateTime := Now;
  if Data.FieldByName('krm_guid').AsString = '' then Data.FieldByName('krm_guid').AsString   := MainMod.NewGuid;
  Data.Post;
  ManageSettings;
end;

procedure TfrmFirmaTanim.btnQRCodeClick(Sender: TObject);
var
  aQRCodeFile: String;
  FUrl: String;
begin
  if edVSBFormLink.Text = '' then
  begin
    MessageDlg('Link adresi henüz hazýr deðil.', mtError, [mbOk]);
    Exit;
  end;

  aQRCodeFile := ServerMod.NewCacheFileUrl(False, 'png', '', '', FUrl, True);
  imgQRCode.Picture.SaveToFile(aQRCodeFile);
  if aQRCodeFile <> '' then
    UniSession.SendFile(aQRCodeFile, 'Karekod.png');
end;

procedure TfrmFirmaTanim.FileUpCompleted(Sender: TObject; AStream: TFileStream);
var
  FExt  : String;
begin
  if not DataEditing(MainMod.qMCDef) then Exit;

  try
    FExt := UpperCase(Copy(ExtractFileExt(FileUp.FileName), 2, 5));
    if (FExt = 'JPG') or (FExt = 'PNG') then
    begin
      TBlobField(MainMod.qMCDef.FieldByName('krm_logo')).LoadFromStream(AStream);
      MainMod.qMCDef.FieldByName('krm_logo_type').AsString := FExt;
    end
    else
    begin
      MessageDlg('Kurum Logosu olarak kullanýlacak resim JPG veya PNG formatlarýnda olmalýdýr. Yüklediðiniz dosya kullanýlamýyor.', mtError, [mbOk]);
      Exit;
    end;
  except
    raise;
  end;
end;

procedure TfrmFirmaTanim.ManageSettings;
begin
  btnEdit.Enabled     := MainMod.LoginInfo.Yetkiler[4] and (Data.State = dsBrowse) and (Data.FieldByName('id').AsInteger > 0);
  btnPost.Enabled     := DataEditing(Data);
  btnEditPic.Enabled  := DataEditing(Data);

  if btnPost.Enabled then
  begin
    btnCancel.Caption := 'Ýptal';
    btnCancel.ImageIndex := 2;
  end
  else
  begin
    btnCancel.Caption := 'Kapat';
    btnCancel.ImageIndex := 3;
  end;
end;

procedure TfrmFirmaTanim.UniBitBtn1Click(Sender: TObject);
begin
  frmHelpPage.Exec('FirmaTanim');
end;

procedure TfrmFirmaTanim.UniFormBeforeShow(Sender: TObject);
begin
  FileUp.MaxAllowedSize := LogoFileSize;
  Data := MainMod.qMCDef;
  ManageSettings;
  PgControl.ActivePage := pgKurum;
  ActiveControl := edKrmTel1;
  if Data.FieldByName('krm_guid').AsString = '' then edVSBFormLink.Text := ''
   else
  begin
    edVSBFormLink.Text := MainMod.VSBFormLink + Data.FieldByName('krm_guid').AsString;
    MainMod.CreateQRCode(edVSBFormLink.Text, imgQRCode);
  end;

  lbIDY.Caption := MainMod.KullaniciGetir(Data.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(Data.FieldByName('sdy').AsString);
  if Data.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', Data.FieldByName('idt').AsDateTime);
  if Data.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', Data.FieldByName('sdt').AsDateTime);
end;

end.
