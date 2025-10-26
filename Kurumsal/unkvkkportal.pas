unit unkvkkportal;

interface

uses
  Windows, Messages, SysUtils, System.IOUtils,Variants, Classes, Graphics, StdCtrls,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniCheckBox, uniDBCheckBox, uniEdit, uniDBEdit, uniLabel,
  uniGUIBaseClasses, uniPanel, uniBasicGrid, uniDBGrid, uniDBLookupComboBox, uniMultiItem, uniComboBox,
  uniDBComboBox, uniPageControl, Data.DB, DBAccess, Uni, uniImage, uniDBImage, uniFileUpload,
  MemDS, Vcl.Menus, uniMainMenu, uniMenuButton, frxClass, frxExportBaseDialog, frxTableObject,
  frxExportPDF, frxDBSet, uniGroupBox,IdHTTP,System.Net.HttpClientComponent,System.Net.HttpClient;
type
  TDynamicProperties = record
    PrimaryColorCode: string;
    SecondaryColorCode: string;
    ShowCommissionDecisions: string;
    ShowPolicies: string;
    ShowInformationTexts: string;
    ShowExplicitConsentTexts: string;
    ShowDataSubjectApplications: string;
    ShowPortalKvknetLogo: string;
    ShowApplicationLoginKvknetLogo: string;
    DataSubjectApplicationWarningText: string;
    show_ip_address : string;
  end;
type
  TfrmkvkkPortal = class(TUniForm)
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
    pgDiger: TUniTabSheet;
    dsMCDef: TUniDataSource;
    pnlButtons: TUniPanel;
    FileUp: TUniFileUpload;
    edVSBFormLink: TUniEdit;
    btnGoToVSBForm: TUniBitBtn;
    UniBitBtn1: TUniBitBtn;
    qTmp: TUniQuery;
    imgQRCode: TUniImage;
    btnQRCode: TUniBitBtn;
    menuKVKKSayfasi: TUniPopupMenu;
    btnKVKKSayfasi: TUniMenuItem;
    btnKVKKSayfasiDepartman: TUniMenuItem;
    edKvkkPortalLink: TUniEdit;
    UniBitBtn2: TUniBitBtn;
    btnKvkkQRCode: TUniBitBtn;
    imgKvkkQRCode: TUniImage;
    edKvkkPortalDeptLink: TUniEdit;
    UniBitBtn3: TUniBitBtn;
    rptPDF: TfrxReport;
    fdbVSB: TfrxDBDataset;
    frxPDFExport: TfrxPDFExport;
    gbVerisahibiBasVuru: TUniGroupBox;
    gbkvkkportal: TUniGroupBox;
    gbkvkkPortalDepartman: TUniGroupBox;
    UniBitBtn4: TUniBitBtn;
    UniBitBtn5: TUniBitBtn;
    UniGroupBox1: TUniGroupBox;
    UniGroupBox2: TUniGroupBox;
    edWeb2: TUniDBEdit;
    btnGoToWeb2: TUniBitBtn;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnEditPicClick(Sender: TObject);
    procedure FileUpCompleted(Sender: TObject; AStream: TFileStream);
    procedure btnGoToVSBFormClick(Sender: TObject);
//    procedure btnGoToWeb2Click(Sender: TObject);
//    procedure btnGoToWeb3Click(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure btnQRCodeClick(Sender: TObject);
    procedure UniBitBtn2Click(Sender: TObject);
    procedure btnKvkkQRCodeClick(Sender: TObject);
    procedure UniBitBtn3Click(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;

      Shift: TShiftState);
    procedure UniBitBtn4Click(Sender: TObject);
    procedure UniBitBtn5Click(Sender: TObject);
    procedure btnGoToWeb2Click(Sender: TObject);
  private
    Data : TUniQuery;
    procedure ManageSettings;
    procedure PrepareVSB;
    function GetHTML(const URL: string): string;
    function GetDynamicProperties(AConnection: TUniConnection;
      AMcID: Integer): TDynamicProperties;
  public
  end;
  const
  ShowCommissionDecisions_text : string =' <div class="divAcilan"> ' +
  ' <div class="divSatir goster2"> ' +
  ' <span class="Cizgiler"></span> ' +
  ' <h3 class="h3Baslik noselect">POLÝTÝKALAR</h3> ' +
  ' <div class="incele detay2">incele</div> ' +
  ' </div> ' +
  ' <div class="divMetinler" id="detay2"> ' +
  ' %%%POLITIKALINK%%% ' +
  ' </div> ' +
  ' </div> ' ;

  ShowPolicies_text : string =' <div class="divAcilan"> ' +
  ' <div class="divSatir goster2"> ' +
  ' <span class="Cizgiler"></span> ' +
  ' <h3 class="h3Baslik noselect">POLÝTÝKALAR</h3> ' +
  ' <div class="incele detay2">incele</div> ' +
  ' </div> ' +
  ' <div class="divMetinler" id="detay2"> ' +
  ' %%%POLITIKALINK%%% ' +
  ' </div> ' +
  ' </div> ';

  ShowInformationTexts : string =' <div class="divAcilan"> ' +
  ' <div class="divSatir goster3"> ' +
  ' <span class="Cizgiler"></span> ' +
  ' <h3 class="h3Baslik noselect">AYDINLATMA METÝNLERÝ</h3> ' +
  ' <div class="incele detay3">incele</div> ' +
  ' </div> ' +
  ' <div class="divMetinler" id="detay3"> ' +
  ' %%%AYDINLATMALINK%%% ' +
  ' </div> ' +
  ' </div> ' ;

  ShowExplicitConsentTexts : string =' <div class="divAcilan"> ' +
  ' <div class="divSatir goster4"> ' +
  ' <span class="Cizgiler"></span> ' +
  ' <h3 class="h3Baslik noselect">AÇIK RIZA METÝNLERÝ</h3> ' +
  ' <div class="incele detay4">incele</div> ' +
  ' </div> ' +
  ' <div class="divMetinler" id="detay4"> ' +
  ' %%%ACIKRIZALINK%%% ' +
  ' </div> '  +
  ' </div> ' ;

  ShowDataSubjectApplications: string =' <div class="divAcilan"> ' +
  ' <div class="divSatir goster5"> ' +
  ' <span class="Cizgiler"></span> ' +
  ' <h3 class="h3Baslik noselect">ÝLGÝLÝ KÝÞÝ BAÞVURUSU <span>(ÝÞ, YARDIM, BURS VB. BAÞVURU ALANI DEÐÝLDÝR.)</span></h3> ' +
  ' <div class="incele detay5">incele</div> ' +
  ' </div> ' +
  ' <div class="divMetinler" id="detay5"> ' +
  ' <a class="Link" onclick="showAlert(''%%%ILGILIKISILINK%%%'')" style="cursor:pointer;">Ýlgili Kiþi Baþvuru</a> ' +
  ' </div> ' +
  ' </div> ' ;




function frmkvkkPortal: TfrmkvkkPortal;

implementation

uses
  uniGUIApplication, MainModule, McMLib, unHelpPage, ServerModule;

{$R *.dfm}

function frmkvkkPortal: TfrmkvkkPortal;
begin
  Result := TfrmkvkkPortal(MainMod.GetFormInstance(TfrmkvkkPortal));
end;

procedure TfrmkvkkPortal.btnCancelClick(Sender: TObject);
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

procedure TfrmkvkkPortal.btnEditClick(Sender: TObject);
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

procedure TfrmkvkkPortal.btnEditPicClick(Sender: TObject);
begin
  FileUp.Execute;
end;

procedure TfrmkvkkPortal.btnGoToVSBFormClick(Sender: TObject);
begin
  if edVSBFormLink.Text = '' then
  begin
    MessageDlg('Link adresi henüz hazýr deðil. Bilgileri kaydettiðinizde baðlantýlar da hazýr olacak.', mtError, [mbOk]);
    Exit;
  end;

  UniSession.BrowserWindow(edVSBFormLink.Text, 0, 0, '_blank');
end;

procedure TfrmkvkkPortal.btnGoToWeb2Click(Sender: TObject);
begin
  if edWeb2.Text = '' then
  begin
    MessageDlg('Link adresi belirtilmemiþ.', mtError, [mbOk]);
    Exit;
  end;

  UniSession.BrowserWindow(edWeb2.Text, 0, 0, '_blank');
end;

//procedure TfrmkvkkPortal.btnGoToWeb2Click(Sender: TObject);
//begin
//  if edWeb2.Text = '' then
//  begin
//    MessageDlg('Link adresi belirtilmemiþ.', mtError, [mbOk]);
//    Exit;
//  end;

//  UniSession.BrowserWindow(edWeb2.Text, 0, 0, '_blank');
//end;

//procedure TfrmkvkkPortal.btnGoToWeb3Click(Sender: TObject);
//begin
//  if edWeb3.Text = '' then
//  begin
//    MessageDlg('Link adresi belirtilmemiþ.', mtError, [mbOk]);
//    Exit;
//  end;
//
//  UniSession.BrowserWindow(edWeb3.Text, 0, 0, '_blank');
//end;

procedure TfrmkvkkPortal.btnKvkkQRCodeClick(Sender: TObject);
var
  aQRCodeFile: String;
  FUrl: String;
begin
  if edKvkkPortalLink.Text = '' then
  begin
    MessageDlg('Link adresi henüz hazýr deðil.', mtError, [mbOk]);
    Exit;
  end;

  aQRCodeFile := ServerMod.NewCacheFileUrl(False, 'png', '', '', FUrl, True);
  imgKvkkQRCode.Picture.SaveToFile(aQRCodeFile);
  if aQRCodeFile <> '' then
    UniSession.SendFile(aQRCodeFile, 'Karekod.png');
end;

procedure TfrmkvkkPortal.btnPostClick(Sender: TObject);
var
  PDFStream : TMemoryStream;
begin

    Data.FieldByName('sdy').AsInteger  := MainMod.LoginInfo.ID;
    Data.FieldByName('sdt').AsDateTime := Now;
    if Data.FieldByName('krm_guid').AsString = '' then Data.FieldByName('krm_guid').AsString   := MainMod.NewGuid;
    Data.Post;
    PrepareVSB;
    ManageSettings;  


end;

procedure TfrmkvkkPortal.btnQRCodeClick(Sender: TObject);
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

procedure TfrmkvkkPortal.FileUpCompleted(Sender: TObject; AStream: TFileStream);
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

procedure TfrmkvkkPortal.ManageSettings;
begin
  btnEdit.Enabled     := MainMod.LoginInfo.Yetkiler[4] and (Data.State = dsBrowse) and (Data.FieldByName('id').AsInteger > 0);
  btnPost.Enabled     := DataEditing(Data);
//  btnEditPic.Enabled  := DataEditing(Data);

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

procedure TfrmkvkkPortal.PrepareVSB;
var
  PDFStream : TMemoryStream;
  DirPath : string; 
begin
    DirPath := ExtractFilePath(Application.ExeName) + 'files\temp_vsb';
    if not DirectoryExists(DirPath) then CreateDir(DirPath);
    
    rptPDF.PrintOptions.ShowDialog := False;
    rptPDF.ShowProgress := false;

    rptPDF.EngineOptions.SilentMode := True;
    rptPDF.EngineOptions.EnableThreadSafe := True;
    rptPDF.EngineOptions.DestroyForms := False;
    rptPDF.EngineOptions.UseGlobalDataSetList := False;

    frxPDFExport.Background := True;
    frxPDFExport.ShowProgress := False;
    frxPDFExport.ShowDialog := False;
    frxPDFExport.DefaultPath := '';
    PDFStream := TMemoryStream.Create;
    try
      rptPDF.PrepareReport;
      frxPDFExport.FileName := DirPath + '\VeriSahibiBasvuruFormu.pdf';
      rptPDF.Export(frxPDFExport);
      PDFStream.LoadFromFile(frxPDFExport.FileName);
      PDFStream.Position := 0;
      Data.Edit;
      TBlobField(Data.FieldByName('vsb_basvuru_form')).LoadFromStream(PDFStream);
      Data.Post;
    finally
      DeleteFile(frxPDFExport.FileName);
      PDFStream.Free;
    end;
end;

procedure TfrmkvkkPortal.UniBitBtn1Click(Sender: TObject);
begin
  frmHelpPage.Exec('FirmaTanim');
end;

procedure TfrmkvkkPortal.UniBitBtn2Click(Sender: TObject);
begin
  if edKvkkPortalLink.Text = '' then
  begin
    MessageDlg('Link adresi henüz hazýr deðil. Bilgileri kaydettiðinizde baðlantýlar da hazýr olacak.', mtError, [mbOk]);
    Exit;
  end;

  UniSession.BrowserWindow(edKvkkPortalLink.Text, 0, 0, '_blank');
end;

procedure TfrmkvkkPortal.UniBitBtn3Click(Sender: TObject);
begin
  if edKvkkPortalDeptLink.Text = '' then
  begin
    MessageDlg('Link adresi henüz hazýr deðil. Bilgileri kaydettiðinizde baðlantýlar da hazýr olacak.', mtError, [mbOk]);
    Exit;
  end;

  UniSession.BrowserWindow(edKvkkPortalDeptLink.Text, 0, 0, '_blank');
end;

procedure TfrmkvkkPortal.UniBitBtn4Click(Sender: TObject);
var
  sqlStr   : String;
  strList  : TStringList;
  strHtml  : TStringList;
  aFileName: String;
  fUrl     : String;
  dosyaAdi : String;
  Setting   : TDynamicProperties;

begin
//  Setting := GetDynamicProperties(mainmod.DBMain,mainmod.MCID);

  strList := TStringList.Create;
  strHtml := TStringList.Create;
  strHtml.LoadFromFile(ServerMod.FilesFolderPath + 'temp_html/kvkkSayfasiTemplate.htm');

  dosyaAdi := ServerMod.NewCacheFileUrl(False, MainMod.qMCDef.FieldByName('krm_logo_type').AsString, '', '', FUrl, True);
  strHtml.Text := StringReplace(strHtml.Text, '%%%KURUMLOGO%%%', Blob2Base64Str(MainMod.qMCDef, 'krm_logo', dosyaAdi), [rfReplaceAll]);
  strHtml.Text := StringReplace(strHtml.Text, '%%%KURUMADI%%%', MainMod.qMCDef.FieldByName('title').AsString, [rfReplaceAll]);
//  strHtml.Text := StringReplace(strHtml.Text, '%%%ANARENK%%%',Setting.PrimaryColorCode,[rfReplaceAll]) ;
//  if Setting.ShowCommissionDecisions = 'E'  then
//     strHtml.Text := StringReplace(strHtml.Text, '%%%COMMISSION%%%',ShowCommissionDecisions_text,[rfReplaceAll])
//     else
//     strHtml.Text := StringReplace(strHtml.Text, '%%%COMMISSION%%%','',[rfReplaceAll]);
//  if Setting.ShowPolicies = 'E'  then
//     strHtml.Text := StringReplace(strHtml.Text, '%%%POLICIES%%%',ShowPolicies_text,[rfReplaceAll])
//     else
//     strHtml.Text := StringReplace(strHtml.Text, '%%%POLICIES%%%','',[rfReplaceAll]);
//  if Setting.ShowInformationTexts = 'E'  then
//     strHtml.Text := StringReplace(strHtml.Text, '%%%INFORMATIONTEXTS%%%',ShowInformationTexts,[rfReplaceAll])
//     else
//     strHtml.Text := StringReplace(strHtml.Text, '%%%INFORMATIONTEXTS%%%','',[rfReplaceAll]);
//  if Setting.ShowExplicitConsentTexts = 'E'  then
//     strHtml.Text := StringReplace(strHtml.Text, '%%%EXPLICITCONSENTTEXT%%%',ShowExplicitConsentTexts,[rfReplaceAll])
//     else
//     strHtml.Text := StringReplace(strHtml.Text, '%%%EXPLICITCONSENTTEXT%%%','',[rfReplaceAll]);
//   if Setting.ShowDataSubjectApplications = 'E'  then
//      strHtml.Text := StringReplace(strHtml.Text, '%%%DATASUBJECTAPPLICATINONSns%%%',ShowDataSubjectApplications,[rfReplaceAll])
//     else
//     strHtml.Text := StringReplace(strHtml.Text, '%%%DATASUBJECTAPPLICATINONSns%%%','',[rfReplaceAll]);
//



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
	SQLStr   := 'SELECT distinct oo.id as ref_no, oo.tanim, ' +
              '(''' + MAinMod.OzelOnayLink + ''' || oo.aguid)::character varying (200) AS web_adresi ' +
              ' FROM def_data_ozelonay oo ' +
              ' WHERE oo.mc_id = ' + IntToStr(MainMod.MCID) +
              ' AND oo.durum = ''YAYINDA'' AND oo.oo_tur like ''%AYDINLATMA%''' +
              ' ORDER BY oo.tanim';
  QueryOpen(qTmp, sqlStr);
  qTmp.First;
  while not qTmp.Eof do
  begin
    strList.Add('<a class="Link" href="' + qTmp.FieldByName('web_adresi').AsString + '" rel="noopener">'
                + tr_regular(qTmp.FieldByName('tanim').AsString) + '</a>');
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
	SQLStr   := 'SELECT distinct oo.id as ref_no, oo.tanim, ' +
              '(''' + MainMod.OzelOnayLink + ''' || oo.aguid)::character varying (200) AS web_adresi ' +
              ' FROM def_data_ozelonay oo ' +
              ' WHERE oo.mc_id = ' + IntToStr(MainMod.MCID) +
              ' AND oo.durum = ''YAYINDA'' AND oo.oo_tur like ''%AÇIK RIZA%''' +
              ' ORDER BY oo.tanim';
  QueryOpen(qTmp, sqlStr);
  qTmp.First;
  while not qTmp.Eof do
  begin
    strList.Add('<a class="Link" href="' + qTmp.FieldByName('web_adresi').AsString + '" rel="noopener">'
                +  tr_regular(qTmp.FieldByName('tanim').AsString) + '</a>');
    qTmp.Next;
  end;
  strHtml.Text := StringReplace(strHtml.Text, '%%%ACIKRIZALINK%%%', strList.Text, [rfReplaceAll]);

	SQLStr   := 'SELECT distinct oo.id as ref_no, oo.tanim, ' +
              '(''' + MainMod.OzelOnayLink + ''' || oo.aguid)::character varying (200) AS web_adresi ' +
              ' FROM def_data_ozelonay oo ' +
              ' WHERE oo.mc_id = ' + IntToStr(MainMod.MCID) +
              ' AND oo.durum = ''YAYINDA'' AND oo.oo_tur like ''%POLÝTÝKA%''' +
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

	SQLStr   := 'SELECT distinct oo.id as ref_no, oo.tanim, ' +
              '(''' + MainMod.OzelOnayLink + ''' || oo.aguid)::character varying (200) AS web_adresi ' +
              ' FROM def_data_ozelonay oo ' +
              ' WHERE oo.mc_id = ' + IntToStr(MainMod.MCID) +
              ' AND oo.durum = ''YAYINDA'' AND oo.oo_tur like ''%KOMÝTE KARARI%''' +
              ' ORDER BY oo.tanim';
  QueryOpen(qTmp, sqlStr);
  strList.Clear;
  qTmp.First;
  while not qTmp.Eof do
  begin
    strList.Add('<a class="Link" href="' + qTmp.FieldByName('web_adresi').AsString + '" rel="noopener">'
                +  tr_regular(qTmp.FieldByName('tanim').AsString) + '</a>');
    qTmp.Next;
  end;
  strHtml.Text := StringReplace(strHtml.Text, '%%%KOMITEKARARILINK%%%', strList.Text, [rfReplaceAll]);

  strHtml.Text := StringReplace(strHtml.Text, '%%%ILGILIKISILINK%%%', edVSBFormLink.Text , [rfReplaceAll]);

  aFileName := ServerMod.NewCacheFileUrl(False, 'html', '', '', FUrl, True);
  strHtml.SaveToFile(aFileName);
  UniSession.SendFile(aFileName, 'kvkkSayfasi.html');

end;

function TfrmkvkkPortal.GetDynamicProperties(AConnection: TUniConnection; AMcID: Integer): TDynamicProperties;
var
  qry: TUniQuery;
begin
  // Önce varsayýlan deðerler atanýyor
  Result.PrimaryColorCode := '#000000'; // Siyah
  Result.SecondaryColorCode := '#FFFFFF'; // Beyaz
  Result.ShowCommissionDecisions := 'E';
  Result.ShowPolicies := 'E';
  Result.ShowInformationTexts := 'E';
  Result.ShowExplicitConsentTexts := 'E';
  Result.ShowDataSubjectApplications := 'E';
  Result.ShowPortalKvknetLogo := 'E';
  Result.ShowApplicationLoginKvknetLogo := 'E';
  Result.DataSubjectApplicationWarningText := '';

  qry := TUniQuery.Create(nil);
  try
    qry.Connection := AConnection;
    qry.SQL.Text := 'SELECT primary_color_code, secondary_color_code, ' +
      'show_commission_decisions, show_policies, show_information_texts, ' +
      'show_explicit_consent_texts, show_data_subject_applications, ' +
      'show_portal_kvknet_logo, show_application_login_kvknet_logo, ' +
      'data_subject_application_warning_text ' +
      'FROM sys_dynamic_properties WHERE mc_id = :mcid';
    qry.ParamByName('mcid').AsInteger := AMcID;
    qry.Open;

    if not qry.IsEmpty then
    begin
      if not qry.FieldByName('primary_color_code').IsNull then
        Result.PrimaryColorCode := qry.FieldByName('primary_color_code').AsString;
      if not qry.FieldByName('secondary_color_code').IsNull then
        Result.SecondaryColorCode := qry.FieldByName('secondary_color_code').AsString;
      if not qry.FieldByName('show_commission_decisions').IsNull then
        Result.ShowCommissionDecisions := qry.FieldByName('show_commission_decisions').AsString;
      if not qry.FieldByName('show_policies').IsNull then
        Result.ShowPolicies := qry.FieldByName('show_policies').AsString;
      if not qry.FieldByName('show_information_texts').IsNull then
        Result.ShowInformationTexts := qry.FieldByName('show_information_texts').AsString;
      if not qry.FieldByName('show_explicit_consent_texts').IsNull then
        Result.ShowExplicitConsentTexts := qry.FieldByName('show_explicit_consent_texts').AsString;
      if not qry.FieldByName('show_data_subject_applications').IsNull then
        Result.ShowDataSubjectApplications := qry.FieldByName('show_data_subject_applications').AsString;
      if not qry.FieldByName('show_portal_kvknet_logo').IsNull then
        Result.ShowPortalKvknetLogo := qry.FieldByName('show_portal_kvknet_logo').AsString;
      if not qry.FieldByName('show_application_login_kvknet_logo').IsNull then
        Result.ShowApplicationLoginKvknetLogo := qry.FieldByName('show_application_login_kvknet_logo').AsString;
      if not qry.FieldByName('data_subject_application_warning_text').IsNull then
        Result.DataSubjectApplicationWarningText := qry.FieldByName('data_subject_application_warning_text').AsString;
    end;

  finally
    qry.Free;
  end;
end;

procedure TfrmkvkkPortal.UniBitBtn5Click(Sender: TObject);
var
  sqlStr   : String;
  strList  : TStringList;
  strHtml  : TStringList;
  aFileName: String;
  fUrl     : String;
  DosyaAdi : string;
  deptListAM : TStringList;
  deptListAR : TStringList;
  i        : integer;
begin
  strList := TStringList.Create;
  strHtml := TStringList.Create;
  strHtml.LoadFromFile(ServerMod.FilesFolderPath + 'temp_html/kvkkSayfasiDeptTemplate.htm');


  DosyaAdi := ServerMod.NewCacheFileUrl(False, MainMod.qMCDef.FieldByName('krm_logo_type').AsString, '', '', FUrl, True);
  strHtml.Text := StringReplace(strHtml.Text, '%%%KURUMLOGO%%%', Blob2Base64Str(MainMod.qMCDef, 'krm_logo', dosyaAdi), [rfReplaceAll]);
  strHtml.Text := StringReplace(strHtml.Text, '%%%KURUMADI%%%', MainMod.qMCDef.FieldByName('title').AsString, [rfReplaceAll]);

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

  strHtml.Text := StringReplace(strHtml.Text, '%%%ILGILIKISILINK%%%', edVSBFormLink.Text, [rfReplaceAll]);

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

function TfrmkvkkPortal.GetHTML(const URL: string): string;
var
  HTTPClient: TNetHTTPClient;
  Response: IHTTPResponse;
begin
  Result := '';
  HTTPClient := TNetHTTPClient.Create(nil);
  try
    try
      Response := HTTPClient.Get(URL);
      if Response.StatusCode = 200 then
      begin
        try
          Result := Response.ContentAsString(TEncoding.UTF8);
        except
          Result := Response.ContentAsString(TEncoding.ANSI);
        end;
      end
      else
        Result := 'HATA: ' + Response.StatusText;
    except
      on E: Exception do
      begin
       Result := 'HATA: ' + E.Message;
      end;
    end;
  finally
    HTTPClient.Free;
  end;
end;

procedure TfrmkvkkPortal.UniFormBeforeShow(Sender: TObject);
begin
  FileUp.MaxAllowedSize := LogoFileSize;
  Data := MainMod.qMCDef;
  ManageSettings;
  if Data.FieldByName('krm_guid').AsString = '' then
  begin
    edVSBFormLink.Text := '';
    edKvkkPortalLink.Text := '';
  end
  else
  begin
    edVSBFormLink.Text := MainMod.VSBFormLink + Data.FieldByName('krm_guid').AsString;
    MainMod.CreateQRCode(edVSBFormLink.Text, imgQRCode);
    edKvkkPortalLink.Text := MainMod.KVKKPortalLink + Data.FieldByName('krm_guid').AsString;
    edKvkkPortalDeptLink.Text := MainMod.KVKKPortalLink + Data.FieldByName('krm_guid').AsString + '&dept=1';
    MainMod.CreateQRCode(edKvkkPortalLink.Text, imgKvkkQRCode);
  end;

  lbIDY.Caption := MainMod.KullaniciGetir(Data.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(Data.FieldByName('sdy').AsString);

  if lbIDY.Text = '' then lbIDY.Text := 'SÝSTEM';
  if lbSDY.Text = '' then lbSDY.Text := 'SÝSTEM';

  if Data.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', Data.FieldByName('idt').AsDateTime);
  if Data.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', Data.FieldByName('sdt').AsDateTime);
end;

procedure TfrmkvkkPortal.UniFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1..VK_F12:
     MessageDlg('F'+IntToStr(Key-VK_F1+1), mtError, [mbOk]);
  end;
end;

end.
