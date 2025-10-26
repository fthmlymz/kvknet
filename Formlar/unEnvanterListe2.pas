unit unEnvanterListe2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniBasicGrid, uniDBGrid, uniButton, uniBitBtn, uniLabel, uniEdit, uniMultiItem,
  uniComboBox, uniGUIBaseClasses, uniPanel, System.Actions, Vcl.ActnList, Data.DB, DBAccess, Uni,
  uniDateTimePicker, VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report, FlexCel.Render, MemDS,
  uniMenuButton, Vcl.Menus, uniMainMenu, VirtualTable, VirtualQuery, rXMLReport,System.IOUtils,
  frxClass, frxDBSet, frxExportBaseDialog, frxExportDOCX, frxDesgn;

type
  TfrEnvanterListe2 = class(TUniFrame)
    dsEnvanter: TUniDataSource;
    ActList: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actCopy: TAction;
    actSearch: TAction;
    actClose: TAction;
    pnlTop: TUniPanel;
    edSrcType: TUniComboBox;
    edSrcText: TUniEdit;
    edSrcActive: TUniComboBox;
    UniLabel1: TUniLabel;
    btnSearch: TUniBitBtn;
    btnClose: TUniBitBtn;
    btnAdd: TUniBitBtn;
    btnEdit: TUniBitBtn;
    btnDelete: TUniBitBtn;
    UniLabel2: TUniLabel;
    UniDBGrid1: TUniDBGrid;
    edSrcDate: TUniDateTimePicker;
    qTmp: TUniQuery;
    btnDownload: TUniMenuButton;
    ppmDownload: TUniPopupMenu;
    tblCatVT: TVirtualTable;
    qCatVT: TVirtualQuery;
    qTmp2: TUniQuery;
    tblKisiVT: TVirtualTable;
    qKisiVT: TVirtualQuery;
    ppmiKVKKPolitikasi: TUniMenuItem;
    tblTaraf: TVirtualTable;
    qTaraf: TVirtualQuery;
    ppmiImhaPolitikasi: TUniMenuItem;
    qKisi: TUniQuery;
    UniBitBtn1: TUniBitBtn;
    qEnvanter: TUniQuery;
    ppmiEnvanterListesi: TUniMenuItem;
    tblSure: TVirtualTable;
    qSure: TVirtualQuery;
    DOCXRpt: TrXMLReport;
    actHizliAdd: TAction;
    UniMenuButton1: TUniMenuButton;
    ppmHizli: TUniPopupMenu;
    HzlGiri1: TUniMenuItem;
    actHizliEdit: TAction;
    HzlDzenle1: TUniMenuItem;
    ppmOzelNitelikliVeriPolitikasi: TUniMenuItem;
    lbKayitSayisi: TUniLabel;
    qdayanak: TUniQuery;
    qamac: TUniQuery;
    qilgiliKisiSure: TUniQuery;
    frKVKKPolitika: TfrxReport;
    qmcdef: TfrxDBDataset;
    qkategori: TfrxDBDataset;
    tblVtKisi: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    frxDOCXExport1: TfrxDOCXExport;
    UniBitBtn2: TUniBitBtn;
    ActNewCopy: TAction;
    pnlpagingBarcrt: TUniPanel;
    UniPanel37: TUniPanel;
    UniLabel3: TUniLabel;
    UniPanel1: TUniPanel;
    UniLabel4: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure edSrcTypeChange(Sender: TObject);
    procedure edSrcActiveChange(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actCopyExecute(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure edSrcDateAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure ppmiKVKKPolitikasiClick(Sender: TObject);
    procedure ppmiImhaPolitikasiClick(Sender: TObject);
    procedure UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniDBGrid1DrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure ppmiEnvanterListesiClick(Sender: TObject);
    procedure DOCXRptUserCalc(Sender: TObject; var CalcStr: string; var Replace: Boolean);
    procedure actHizliAddExecute(Sender: TObject);
    procedure actHizliEditExecute(Sender: TObject);
    procedure ppmOzelNitelikliVeriPolitikasiClick(Sender: TObject);
    procedure UniDBGrid1AfterLoad(Sender: TUniCustomDBGrid);
    procedure UniDBGrid1SelectionChange(Sender: TObject);
    procedure ActNewCopyExecute(Sender: TObject);
  private
    // Word Doküman Raporlarý için kullanýlan ve verileri hazýrlayan metodlar


    procedure NewSQL;
    procedure ManageSettings;
    procedure CopyRecordControl(Sender: TComponent; Res: Integer);
    procedure PrepDayanak;
    procedure prepAmac;
    procedure prepIlgiliKisiSure;
    function NewGUID: string;
    procedure FileDel(AFileName: string);
    procedure KilitliKayitSeciminiKaldir(AGrid: TUniDBGrid);
  public
    procedure DefVariables(VL: TStrings);
    procedure FrxAddVariables(FrxRep : TfrxReport);
    procedure PrepKategoriVeriTipi;
    procedure PrepKisiVeriTipi;
    procedure PrepIlgiliKisi;
    procedure PrepTaraflar;
    procedure PrepKategoriSure;
    procedure FrxDocXreport(AOutputName, AtempFileName, AFileName: string);
    procedure DocXreport(AOutputName, AtempFileName, AFileName: string;
  ADatasets: array of TDataSet);
  end;

implementation

{$R *.dfm}

uses MainModule, ServerModule, McMLib, Main, unHelpPage,
  unHizliEnvanterGirisi,RosiCompGlobalCfg, unEnvanterTanim2
  , unEnvanterTanim2test
  ;

procedure TfrEnvanterListe2.actAddExecute(Sender: TObject);
begin
//  if frmEnvanterTanim2.Exec(0, 0, 0) = mrOk then RefreshQuery(qEnvanter);
 if frmEnvanterTanim2test.Exec(0, 0, 0) = mrOk then RefreshQuery(qEnvanter);
  ManageSettings;
end;

procedure TfrEnvanterListe2.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrEnvanterListe2.actCopyExecute(Sender: TObject);
begin
 MessageDlg('Seçili envanter kaydýnýn kopyasýný oluþturmak istediðinizden emin misiniz?', mtConfirmation, mbYesNo, CopyRecordControl);
end;

procedure TfrEnvanterListe2.ActNewCopyExecute(Sender: TObject);
begin
//    if frmEnvanterTanim2.copy(qEnvanter.FieldByName('id').AsInteger) = mrOk then RefreshQuery(qEnvanter);
      if frmEnvanterTanim2test.copy(qEnvanter.FieldByName('id').AsInteger) = mrOk then RefreshQuery(qEnvanter);
          ManageSettings;
end;

procedure TfrEnvanterListe2.actEditExecute(Sender: TObject);
var
  Dept : String;
  kilitli: integer;
  I : integer;
  AEnvIds : string;
begin
  if qEnvanter.FieldByName('active').AsString <> 'E' then
  begin
    if not MainMod.LoginInfo.Yetkiler[92] then
    begin
      MessageDlg('Deðiþtirmek istediðiniz kayýt PASÝF yapýlmýþ. Bu kaydý deðiþtirme yetkiniz yok.', mtError, [mbOk]);
      Exit;
    end;
  end;

  Dept := qEnvanter.FieldByName('dept_id').AsString;
  if Pos(Dept, MainMod.LoginInfo.Birimler) < 1 then
  begin
    MessageDlg('Bu envanter kaydý yetkili olduðunuz bir departmana ait deðil. Ýþlem yapamazsýnýz.', mtError, [mbOk]);
    Exit;
  end;

  if qEnvanter.FieldByName('kilitli').AsString = 'E' then
  begin
    kilitli := 1;
    MessageDlg('Kontrol formu kilitlenmiþtir. Ýþlem yapamazsýnýz.', mtError, [mbOk]);
  end
  else
    kilitli := 0;

  ShowMask('Lütfen bekleyiniz...');
  UniSession.Synchronize;
  if UniDBGrid1.SelectedRows.Count>1 then // Çoklu deðiþtrime için
  begin
    for I := 0 to UniDBGrid1.SelectedRows.count-1 do
        begin
          qEnvanter.GotoBookmark(UniDBGrid1.SelectedRows[i]);
          if ( AEnvIds <> '') then
            AEnvIds := AEnvIds+',';
          AEnvIds := AEnvIds + qEnvanter.FieldByName('id').AsString;
        end;
    if frmEnvanterTanim2.Exec(AEnvIds) = mrOk then
      RefreshQuery(qEnvanter);
  end
  else
  begin

//    if frmEnvanterTanim2.Exec(qEnvanter.FieldByName('id').AsInteger, 1, kilitli) = mrOk then
    if frmEnvanterTanim2test.Exec(qEnvanter.FieldByName('id').AsInteger, 1, kilitli) = mrOk then
      RefreshQuery(qEnvanter) ;
  end;

  ManageSettings;
  HideMask;
end;

procedure TfrEnvanterListe2.actHizliAddExecute(Sender: TObject);
begin
  if frmHizliEnvanterGirisi.Exec = mrOk then RefreshQuery(qEnvanter);
  ManageSettings;
end;

procedure TfrEnvanterListe2.actHizliEditExecute(Sender: TObject);
var
  Dept : String;
begin
  if qEnvanter.FieldByName('active').AsString <> 'E' then
  begin
    if not MainMod.LoginInfo.Yetkiler[92] then
    begin
      MessageDlg('Deðiþtirmek istediðiniz kayýt PASÝF yapýlmýþ. Bu kaydý deðiþtirme yetkiniz yok.', mtError, [mbOk]);
      Exit;
    end;
  end;

  Dept := qEnvanter.FieldByName('dept_id').AsString;
  if Pos(Dept, MainMod.LoginInfo.Birimler) < 1 then
  begin
    MessageDlg('Bu envanter kaydý yetkili olduðunuz bir departmana ait deðil. Ýþlem yapamazsýnýz.', mtError, [mbOk]);
    Exit;
  end;

  if qEnvanter.FieldByName('kilitli').AsString = 'E' then
  begin
    MessageDlg('Kontrol formu kilitlenmiþtir. Ýþlem yapamazsýnýz.', mtError, [mbOk]);
    Exit;
  end;

  if frmHizliEnvanterGirisi.Edit(qEnvanter.FieldByName('id').AsInteger) = mrOk then RefreshQuery(qEnvanter);
  ManageSettings;

end;



procedure TfrEnvanterListe2.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrEnvanterListe2.CopyRecordControl(Sender: TComponent; Res: Integer);
var
  MainId    : String;
  NewId, i  ,
  NewMainID : Integer;
  NewSDT    : Double;
begin
  if Res <> mrYes then Exit;

  MainId := qEnvanter.FieldByName('id').AsString;
  NewSDT := Now;
  QueryOpen(MainMod.qCTo,   'SELECT * FROM data_envanter WHERE id = 0');

  // Copy Main Record
  QueryOpen(MainMod.qCFrom, 'SELECT * FROM data_envanter WHERE id = ' + MainId);
  MainMod.qCTo.Insert;
  for i := 0 to MainMod.qCFrom.FieldCount - 1 do MainMod.qCTo.Fields[i].Value := MainMod.qCFrom.Fields[i].Value;
  NewId     := MainMod.GetSeq('sq_data_envanter_id');
  NewMainId := NewID;

  MainMod.qCTo.FieldByName('id').AsInteger      := NewId;
  MainMod.qCTo.FieldByName('main_id').AsInteger := 0;
  MainMod.qCTo.FieldByName('active').AsString   := 'E';
  MainMod.qCTo.FieldByName('mc_id').AsInteger   := MainMod.MCID;
  MainMod.qCTo.FieldByName('tarih').AsDateTime  := Date;
  MainMod.qCTo.FieldByName('idy').AsInteger     := MainMod.LoginInfo.ID;
  MainMod.qCTo.FieldByName('idt').AsDateTime    := NewSDT;
  MainMod.qCTo.FieldByName('sdy').AsInteger     := MainMod.LoginInfo.ID;
  MainMod.qCTo.FieldByName('sdt').AsDateTime    := NewSDT;
  MainMod.qCTo.Post;

  MessageDlg('Kaydýnýzýn kopyasý "' + IntToStr(NewId) + '" referans numarasý ile oluþturuldu.', mtInformation, [mbOk]);
  RefreshQuery(qEnvanter);
  ManageSettings;

  // Copy Detail Records
  QueryOpen(MainMod.qCFrom, 'SELECT * FROM data_envanter WHERE main_id = ' + MainId + ' ORDER BY id');
  while not MainMod.qCFrom.EOF do
  begin
    MainMod.qCTo.Insert;
    for i := 0 to MainMod.qCFrom.FieldCount - 1 do MainMod.qCTo.Fields[i].Value := MainMod.qCFrom.Fields[i].Value;
    NewId := MainMod.GetSeq('sq_data_envanter_id');

    MainMod.qCTo.FieldByName('id').AsInteger     := NewId;
    MainMod.qCTo.FieldByName('main_id').AsInteger     := NewMainId;
    MainMod.qCTo.FieldByName('active').AsString  := 'E';
    MainMod.qCTo.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    MainMod.qCTo.FieldByName('tarih').AsDateTime := Date;
    MainMod.qCTo.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    MainMod.qCTo.FieldByName('idt').AsDateTime   := NewSDT;
    MainMod.qCTo.FieldByName('sdy').AsInteger    := MainMod.LoginInfo.ID;
    MainMod.qCTo.FieldByName('sdt').AsDateTime   := NewSDT;
    MainMod.qCTo.Post;

    MainMod.qCFrom.Next;
  end;

  MainMod.qCFrom.Close;
  MainMod.qCTo.Close;
end;

procedure TfrEnvanterListe2.FrxAddVariables(FrxRep : TfrxReport);

begin
  FrxRep.Variables.Clear;

  FrxRep.Variables.Variables['COMPANYADDRESS']:= QuotedStr( Trim(Trim(MainMod.qMCDef.FieldByName('krm_adres1').AsString) + ' ' + Trim(MainMod.qMCDef.FieldByName('krm_adres2').AsString  ))) ;
  FrxRep.Variables.Variables['TAXOFFICE']:=QuotedStr( Trim(MainMod.qMCDef.FieldByName('krm_vdairesi').AsString)  );;
  FrxRep.Variables.Variables['TAXNO' ]:=  QuotedStr(Trim(MainMod.qMCDef.FieldByName('krm_vkn').AsString) );;
  FrxRep.Variables.Variables['COMPANYTITLE']:=QuotedStr( Trim(MainMod.qMCDef.FieldByName('title').AsString) ); ;
  FrxRep.Variables.Variables['COMPANYFULLNAME']:= QuotedStr( Trim(MainMod.qMCDef.FieldByName('krm_unvan').AsString) );;
  FrxRep.Variables.Variables['COMPANYKEPMAIL']:= QuotedStr(  Trim(MainMod.qMCDef.FieldByName('krm_kep').AsString) );;
  FrxRep.Variables.Variables['COMPANYEMAIL']:= QuotedStr( Trim(MainMod.qMCDef.FieldByName('krm_email').AsString)); ;
  FrxRep.Variables.Variables['COMPANYWEBPAGE']:= QuotedStr( Trim(MainMod.qMCDef.FieldByName('krm_web1').AsString) );;
  FrxRep.Variables.Variables['COMPANYCITY']:= QuotedStr( Trim(MainMod.qMCDef.FieldByName('krm_sehir').AsString) );;
  FrxRep.Variables.Variables['COMPANYTELNO' ]:=QuotedStr(  Trim(MainMod.qMCDef.FieldByName('krm_telefon1').AsString)); ;
  FrxRep.Variables.Variables['CONFIRMDATE' ]:= QuotedStr( '' );;
  FrxRep.Variables.Variables['CONFIRMPERSON' ]:=  QuotedStr(''); ;
  FrxRep.Variables.Variables['CONFIRMTEL']:=  QuotedStr('');
  FrxRep.Variables.Variables['CONFIRMEMAIL' ]:= QuotedStr('') ;
  FrxRep.Variables.Variables['CONFIRMIPADDRESS' ]:=QuotedStr( ''); ;
end;

procedure TfrEnvanterListe2.DefVariables(VL: TStrings);
begin
  VL.Clear;
  VL.Add('COMPANYADDRESS'       + '=' + Trim(Trim(MainMod.qMCDef.FieldByName('krm_adres1').AsString) + ' ' + Trim(MainMod.qMCDef.FieldByName('krm_adres2').AsString)));
  VL.Add('TAXOFFICE'            + '=' + Trim(MainMod.qMCDef.FieldByName('krm_vdairesi').AsString));
  VL.Add('TAXNO'                + '=' + Trim(MainMod.qMCDef.FieldByName('krm_vkn').AsString));
  VL.Add('COMPANYTITLE'         + '=' + Trim(MainMod.qMCDef.FieldByName('title').AsString));
  VL.Add('COMPANYFULLNAME'      + '=' + Trim(MainMod.qMCDef.FieldByName('krm_unvan').AsString));
  VL.Add('COMPANYKEPMAIL'       + '=' + Trim(MainMod.qMCDef.FieldByName('krm_kep').AsString));
  VL.Add('COMPANYEMAIL'         + '=' + Trim(MainMod.qMCDef.FieldByName('krm_email').AsString));
  VL.Add('COMPANYWEBPAGE'       + '=' + Trim(MainMod.qMCDef.FieldByName('krm_web1').AsString));
  VL.Add('COMPANYCITY'          + '=' + Trim(MainMod.qMCDef.FieldByName('krm_sehir').AsString));
  VL.Add('COMPANYTELNO'         + '=' + Trim(MainMod.qMCDef.FieldByName('krm_telefon1').AsString));
  VL.Add('CONFIRMDATE'          + '=' + ''); // FormatDateTime('dd.mm.yyyy', Date));
  VL.Add('CONFIRMPERSON'        + '=' + '');
  VL.Add('CONFIRMTEL'           + '=' + '');
  VL.Add('CONFIRMEMAIL'         + '=' + '');
  VL.Add('CONFIRMIPADDRESS'     + '=' + ''); //'(IP Adresi: ' + Trim(lbIPAdres.Caption) + ')'
//  VL.Add('PERSONOFINTEREST'     + '=' + Trim(MainMod.qAydinlatma.FieldByName('kisi_str').AsString));
//  VL.Add('TXTWEBSITEINFO_EN'       + '=@@'); // Trim(MainMod.qMCDef.FieldByName('krm_').AsString));
//  VL.Add('TXTWEBSITEINFO_TR'       + '=' + Trim(MainMod.qMCDef.FieldByName('krm_web2').AsString));
//  VL.Add('TXTWEBSITEINFOACCEPT_TR' + '=' + Trim(MainMod.qMCDef.FieldByName('krm_web3').AsString));
end;

 procedure TfrEnvanterListe2.FrxDocXreport(AOutputName, AtempFileName, AFileName: string);
 var
   FUrl, OutputFileName: String;
  LogMessage: string;
begin
//
    try
     //  Raporu oluþturun
        frKVKKPolitika.PrintOptions.ShowDialog := False;
        frKVKKPolitika.ShowProgress := false;
        frKVKKPolitika.EngineOptions.SilentMode := True;
        frKVKKPolitika.EngineOptions.EnableThreadSafe := True;
        frKVKKPolitika.EngineOptions.DestroyForms := False;
        frKVKKPolitika.EngineOptions.UseGlobalDataSetList := False;
       // FrxAddVariables(frKVKKPolitika);
        frxDOCXExport1.ShowProgress := False;
        frxDOCXExport1.ShowDialog := False;

        OutputFileName := ServerMod.NewCacheFileUrl(False, 'docx', '', '', FUrl, True);
        frxDOCXExport1.FileName := OutputFileName;
        frxDOCXExport1.DefaultPath := '';

        frKVKKPolitika.PreviewOptions.AllowEdit := False;
        frKVKKPolitika.PrepareReport;
       // frKVKKPolitika.DesignReport();
      // Raporu .docx formatýnda dýþa aktarýn
        if frKVKKPolitika.Export(frxDOCXExport1) then
        begin
          UniSession.SendFile(OutputFileName, 'PL_01.docx');
       end;
      ServerMod.Logger.AddLog(Format(LogMessage, ['frxReport oluþturuldu']));
    except
      on E: Exception do
      begin
        ShowMessageN('Hata.. Þablon oluþturulamýyor.'#13 + E.Message);
        ServerMod.Logger.AddLog(Format(LogMessage, ['Þablon oluþturulamadý: ' + E.Message]));
        exit;
      end;
    end;
    try
      // Oluþturulan dosyayý gönderin
      ServerMod.Logger.AddLog(Format(LogMessage, ['Dosya gönderilecek']));
      UniSession.SendFile(OutputFileName, AOutputName);
      ServerMod.Logger.AddLog(Format(LogMessage, ['Dosya gönderildi']));
    except
      on E: Exception do
      begin
        ShowMessageN('Hata.. Dosya gönderilemiyor.'#13 + E.Message);
        ServerMod.Logger.AddLog(Format(LogMessage, ['Dosya gönderilemedi: ' + E.Message]));
        exit;
      end;
    end;

end;

procedure TfrEnvanterListe2.DocXreport(AOutputName, AtempFileName, AFileName: string;
  ADatasets: array of TDataSet);
var
  FUrl ,TemplateFileName, TempFilename, outputfileName  : String;
  ADOCXRpt : TrXMLReport;
  LogMessage, DatabaseName : string;
  I : integer;
  x : TDataSet;
begin
  LogMessage := 'TfrEnvanterListe2.DocXreport - %s ';
  ADOCXRpt := TrXMLReport.Create(nil);
  try
    // rapor için gerekli deðiþkenler
    DefVariables(ADOCXRpt.Variables);
    ADOCXRpt.ActionAfter := aaNone;
    try
      // Doðan Akçay Geçersiz dizin olup olmadýðýný kontrol et
        if not DirectoryExists(ServerMod.FilesFolderPath + 'temp\trash') then
          ForceDirectories(ServerMod.FilesFolderPath + 'temp\trash') ;

       ServerMod.Logger.AddLog(Format(LogMessage,['DirectoryExists Çýkýldý'])) ;
       // Doðan Akçay Dosya yollarýnýn tanýmý
       TemplateFileName := ServerMod.FilesFolderPath + AFileName + '.docx';
       TempFilename := ServerMod.FilesFolderPath + AtempFileName + '_'+ NewGUID + '.docx';
       ServerMod.Logger.AddLog(Format(LogMessage,[' NewGuid çýkýldý'])) ;

       if FileExists(TemplateFileName) then
        TFile.Copy(TemplateFileName,TempFilename)
       else
        raise Exception.Create('Þablon dosyasý mevcut deðil');

       ServerMod.Logger.AddLog(Format(LogMessage,['FileExists çýkýldý'])) ;
       ADOCXRpt.ReportFile := TempFilename;
       outputfileName :=  ServerMod.NewCacheFileUrl(False, 'docx', '', '', FUrl, True);
       ADOCXRpt.OutputFile := outputfileName ;

       ServerMod.Logger.AddLog(Format(LogMessage,['ADocxrpt oluþturulacak'])) ;

      // Doðan Akçay  zaman zaman olan hata ADOCXRpt.Execute(ADatasets) ; satýrýnda  oluþmaktadýr.
      //Doðan Akçay Datasetlerin kontrolü  yapýlýyor
       ServerMod.Logger.AddLog(Format(LogMessage, ['ADatasets Kontrolü Baþlýyor']));
      for I := Low(ADatasets) to High(ADatasets) do
      begin
        if ADatasets[I] = nil then
          raise Exception.Create('ADatasets[' + IntToStr(I) + '] nil');
          //ServerMod.Logger.AddLog(Format(LogMessage, ['ADatasets[' + IntToStr(I) + '] Oluþmamýþ']));
          if not ADatasets[i].Active then
            ADatasets[i].Open;

      end;

      ServerMod.Logger.AddLog(Format(LogMessage, ['ADatasets Kontrolü Tamamlandý']));
      ServerMod.Logger.AddLog(Format(LogMessage, ['TempFilename: ' + TempFilename]));
      ServerMod.Logger.AddLog(Format(LogMessage, ['OutputFile: ' + outputfileName]));

       //Doðan Akçay Rapor oluþturuluyor.

      if  Assigned(ADOCXRpt) then
        ADOCXRpt.Execute(ADatasets) ;

       ServerMod.Logger.AddLog(Format(LogMessage,['Adocxrpt oluþturuldu'])) ;
    except on E : Exception   do
      begin
        ShowMessageN('Hata.. Þablon oluþturulamýyor.'#13 + E.Message) ;
        ServerMod.Logger.AddLog(Format(LogMessage,['Þablon oluþturulamadý'])) ;
        FileDel(TempFileName);
        exit;
      end;
    end;

    try
      // Doðan Akçay oluþturulan Dosya Gönedilecek
      ServerMod.Logger.AddLog(Format(LogMessage,['Dosya Gönderilecek'])) ;
      UniSession.SendFile(ADOCXRpt.OutputFile, AOutputName )  ;
      ServerMod.Logger.AddLog(Format(LogMessage,['Dosya Gönderildi'])) ;
    except on E : exception  do
      begin
        ShowMessageN('Hata.. Dosya gönderilemiyor.'#13 + E.Message);
        ServerMod.Logger.AddLog(Format(LogMessage,['Dosya Gönderilemedi'])) ;
        FileDel(TempFileName);
        exit;
      end;
    end;

  finally
    FileDel(TempFileName);
   if Assigned(ADOCXRpt) then
    FreeAndNil(ADOCXRpt);

  end;

end;

procedure TfrEnvanterListe2.DOCXRptUserCalc(Sender: TObject; var CalcStr: string; var Replace: Boolean);
var
  TagValue : String;
begin
  Replace  := True;
  TagValue := AnsiUpperCase(CalcStr);

  if TagValue = 'COMPANYLOGO' then TagValue := MainForm.GetLogoFileName
  else Replace := False;

  if Replace then CalcStr := TagValue;
end;

procedure TfrEnvanterListe2.edSrcActiveChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrEnvanterListe2.edSrcDateAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrEnvanterListe2.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrEnvanterListe2.edSrcTypeChange(Sender: TObject);
begin
  edSrcText.Visible := edSrcType.ItemIndex <> 6;
  edSrcDate.Visible := edSrcType.ItemIndex = 6;

  NewSQL;
end;

procedure TfrEnvanterListe2.ManageSettings;
begin
  actAdd.Enabled        := MainMod.LoginInfo.Yetkiler[90] and (qEnvanter.State = dsBrowse);
  actEdit.Enabled       := MainMod.LoginInfo.Yetkiler[91] and (qEnvanter.State = dsBrowse) and (qEnvanter.FieldByName('id').AsInteger > 0);
  actCopy.Enabled       := MainMod.LoginInfo.Yetkiler[90] and (qEnvanter.State = dsBrowse) and (qEnvanter.FieldByName('id').AsInteger > 0);
  actHizliAdd.Enabled   := MainMod.LoginInfo.Yetkiler[181] and (qEnvanter.State = dsBrowse);
  actHizliEdit.Enabled  := MainMod.LoginInfo.Yetkiler[182] and (qEnvanter.State = dsBrowse) and (qEnvanter.FieldByName('id').AsInteger > 0);

  actClose.Enabled  := not DataEditing(qEnvanter);
end;

procedure TfrEnvanterListe2.NewSQL;
var
  SrcText    ,
	SQLStr     ,
	WhereStr   : String;
begin
//  if MainMod.LoginInfo.Birimler = '' then
//  begin
//    MessageDlg('Kullanýcýnýza tanýmlý departman yetkisi bulunamamýþtýr. Sistem yöneticisi ile görüþünüz..', mtInformation, [mbOk]);
//  end;
//  SQLStr := 'SELECT distinct env.*,' +
//            '  us1.full_name AS olusturan, us2.full_name AS degistiren, dept.title AS dept_str,' +
//            '  src.surec AS surec_str, kyn.kaynak AS kaynak_str, ks.kisi AS kisi_str,' +
//       //     '  fnc_checklist_kilit_durumu(env.mc_id, env.kaynak_id, env.kisi_id) AS kilitli ' +  // sorgu subselecttten kurtarýldý
//            '  COALESCE( cl.kilitli,''H'') AS kilitli , '+
//            ' coalesce(cl.id,0) checlistId '+
//            ' FROM data_envanter env' +
//            '  LEFT JOIN usr_user us1 ON us1.id = env.idy' +
//            '  LEFT JOIN usr_user us2 ON us2.id = env.sdy' +
//            '  LEFT JOIN sys_deptdef dept ON dept.id = env.dept_id' +
//            '  LEFT JOIN def_data_surec src ON src.id = env.surec_id' +
//            '  LEFT JOIN def_data_kaynak kyn ON kyn.id = env.kaynak_id' +
//            '  LEFT JOIN def_data_kisi ks ON ks.id = env.kisi_id '+
//            '  LEFT JOIN data_checklist cl on cl.active=''E''  AND CL.mc_id= ENV.mc_id AND CL.kaynak_id=ENV.kaynak_id AND CL.kisi_id= env.kisi_id ' ;
//  if MainMod.LoginInfo.Birimler <> '' then
//  begin
//	  WhereStr 	:= 'env.main_id = 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) + ' AND ' +
//     'env.dept_id IN (' + MainMod.LoginInfo.Birimler + ') AND ';
//  end
//  else
//  begin
//	  WhereStr 	:= 'env.main_id = 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) + ' AND ' +
//     'env.dept_id IN (0) AND ';
//    //WhereStr 	:= 'env.main_id = 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) + ' AND ';
//  end;
//
//	case edSrcActive.ItemIndex of
//		0 : WhereStr := WhereStr + 'env.active = ''E'' AND ';
//		1 : WhereStr := WhereStr + 'env.active = ''H'' AND ';
//	end;
//
//  if edSrcType.ItemIndex = 5 then
//  begin
//    WhereStr := WhereStr + 'env.tarih = ''' + FormatDateTime('dd.mm.yyyy', edSrcDate.DateTime) + ''' AND ';
//  end
//  else
//  begin
//    if edSrcText.Text <> '' then
//    begin
//      if edSrcText.Text[1]='*' then
//        SrcText := QuotedStr( StringReplace(copy( edSrcText.Text,2,Length(edSrcText.Text)), '*', '%', [rfReplaceAll]))
//      else
//        SrcText := QuotedStr( '%'+  edSrcText.Text +'%');
//
////      SrcText := StringReplace(edSrcText.Text, '*', '%', [rfReplaceAll]);
//      case edSrcType.ItemIndex of
//         0 : WhereStr := WhereStr + 'env.id::varchar LIKE ' + SrcText + '  AND ';
//         1 : WhereStr := WhereStr + 'dept.title LIKE ' + SrcText + ' AND ';
//         2 : WhereStr := WhereStr + 'src.surec LIKE ' + SrcText + ' AND ';
//         3 : WhereStr := WhereStr + 'kyn.kaynak LIKE ' + SrcText + ' AND ';
//         4 : WhereStr := WhereStr + 'ks.kisi LIKE ' + SrcText + ' AND ';
//         6 : WhereStr := WhereStr + 'us1.full_name LIKE ' + SrcText + ' AND ';
//         7 : WhereStr := WhereStr + 'us2.full_name LIKE ' + SrcText + ' AND ';
//      end;
//    end;
//  end;
//
//	if Trim(WhereStr) <> '' then System.Delete(WhereStr, Length(WhereStr) - 3, 4);
//	if Trim(WhereStr) <> '' then SQLStr := SQLStr + 'WHERE ' + WhereStr;
//	SQLStr := SQLStr + ' ORDER BY src.surec, kyn.kaynak, ks.kisi';
//	QueryOpen(qEnvanter, SQLStr);
//  ManageSettings;
//  lbKayitSayisi.Text := IntToStr(qEnvanter.RecordCount) + ' Kayýt Listelendi...';
  //////////
  if not GuvenliGirisMi(edSrcText.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;

  if MainMod.LoginInfo.Birimler = '' then
  begin
    MessageDlg('Kullanýcýnýza tanýmlý departman yetkisi bulunamamýþtýr. Sistem yöneticisi ile görüþünüz..', mtInformation, [mbOk]);
    Exit;
  end;
  SQLStr := 'SELECT DISTINCT env.*, ' +
            'us1.full_name AS olusturan, us2.full_name AS degistiren, dept.title AS dept_str, '  +
            'dept_main.title as main_dept_str, ' +
            'src.surec AS surec_str, kyn.kaynak AS kaynak_str, ks.kisi AS kisi_str, ' +
            'COALESCE(cl.kilitli, ''H'') AS kilitli, ' +
            'COALESCE(cl.id, 0) AS checlistId ' +
            'FROM data_envanter env ' +
            'LEFT JOIN usr_user us1 ON us1.id = env.idy ' +
            'LEFT JOIN usr_user us2 ON us2.id = env.sdy ' +
            'LEFT JOIN sys_deptdef dept ON dept.id = env.dept_id ' +
            ' LEFT JOIN sys_deptdef dept_main ON dept_main.ID = dept.main_dept_id ' +
            'LEFT JOIN def_data_surec src ON src.id = env.surec_id ' +
            'LEFT JOIN def_data_kaynak kyn ON kyn.id = env.kaynak_id ' +
            'LEFT JOIN def_data_kisi ks ON ks.id = env.kisi_id ' +
            'LEFT JOIN data_checklist cl ON cl.active = ''E'' AND cl.mc_id = env.mc_id AND cl.kaynak_id = env.kaynak_id AND cl.kisi_id = env.kisi_id ';
  WhereStr := 'WHERE env.main_id = 0 AND env.mc_id = :mcid';
  if MainMod.LoginInfo.Birimler <> '' then
    WhereStr := WhereStr + ' AND env.dept_id IN (' + MainMod.LoginInfo.Birimler + ')'
  else
    WhereStr := WhereStr + ' AND env.dept_id IN (0)';
  case edSrcActive.ItemIndex of
    0: WhereStr := WhereStr + ' AND env.active = ''E''';
    1: WhereStr := WhereStr + ' AND env.active = ''H''';
  end;
  if edSrcType.ItemIndex = 6 then
  begin
    WhereStr := WhereStr + ' AND env.tarih = :tarih';
    edSrcText.Text := '';
  end
  else if (edSrcType.ItemIndex <> 6) and (edSrcText.Text <> '') then
  begin
    if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
    case edSrcType.ItemIndex of
      0: WhereStr := WhereStr + ' AND env.id::varchar LIKE :SrcText';
      1: WhereStr := WhereStr + ' AND dept.title LIKE :SrcText' ;
      2: WhereStr := WhereStr + ' AND dept_main.title LIKE :SrcText';
      3: WhereStr := WhereStr + ' AND src.surec LIKE :SrcText';
      4: WhereStr := WhereStr + ' AND kyn.kaynak LIKE :SrcText';
      5: WhereStr := WhereStr + ' AND ks.kisi LIKE :SrcText';
      7: WhereStr := WhereStr + ' AND us1.full_name LIKE :SrcText';
      8: WhereStr := WhereStr + ' AND us2.full_name LIKE :SrcText';
    end;
  end;
  SQLStr := SQLStr + ' ' + WhereStr + ' ORDER BY src.surec, kyn.kaynak, ks.kisi';
  qEnvanter.SQL.Text := SQLStr;
  qEnvanter.ParamByName('mcid').AsInteger := MainMod.MCID;
  if edSrcType.ItemIndex = 6 then
    qEnvanter.ParamByName('tarih').AsDate := edSrcDate.DateTime;
  if edSrcText.Text <> '' then
    qEnvanter.ParamByName('SrcText').AsString := SrcText;
  qEnvanter.Open;
  ManageSettings;
  lbKayitSayisi.Text := IntToStr(qEnvanter.RecordCount) + ' Kayýt Listelendi...';
  /////////
end;

procedure TfrEnvanterListe2.ppmiEnvanterListesiClick(Sender: TObject);
begin
  MainForm.DashboardCall(MainForm.mmiDetayliEnvanterListesi);
end;

procedure TfrEnvanterListe2.ppmiImhaPolitikasiClick(Sender: TObject);
var
  FUrl    : String;
  TemplateFileName,TempFileName, OutputFileName : string;
  ADOCXRpt : TrXMLReport  ;
begin
  if not MainMod.LoginInfo.Yetkiler[121] then
  begin
    MessageDlg('Doküman indirme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if (MainMod.qMCParam.FieldByName('kurum_turu').AsString = '') or (MainMod.qMCParam.FieldByName('kurum_turu').AsString = '00_BELÝRTÝLMEDÝ') then
  begin
    MessageDlg('Kurum türü belirtilmemiþ. Lütfen Kurum Parametreleri ekranýndan kurum türünü seçiniz.', mtError, [mbOk]);
    Exit;
  end;

  PrepDayanak;
  prepAmac;
  prepIlgiliKisiSure ;
////  PrepKategoriVeriTipi;
////  PrepIlgiliKisi;
////  PrepTaraflar;
////  PrepKategoriSure;
//
//
//  try
//    DOCXRpt.ReportFile := ServerMod.FilesFolderPath + 'temp\PL_02.docx'; //Template file name
////    DOCXRpt.ReportFile := ServerMod.FilesFolderPath + 'temp\SAKLAMA_VE_IMHA_POLITIKASI_' + copy(MainMod.qMCParam.FieldByName('kurum_turu').AsString, 1, 2) + '.docx'; //Template file name
//    DOCXRpt.OutputFile := ServerMod.NewCacheFileUrl(False, 'docx', '', '', FUrl, True);
//    //DOCXRpt.Execute([MainMod.qMCDef, qCatVT, qKisi, qTaraf, qSure]); // tblKisiVT,
//    DOCXRpt.Execute([MainMod.qMCDef,qdayanak,qamac,qilgiliKisiSure]) ;
//  except on E: Exception do
//    begin
//      ShowMessageN('Hata.. Þablon oluþturulamýyor.'#13 + E.Message);
//      Exit;
//    end;
//  end;
//
//  UniSession.SendFile(DOCXRpt.OutputFile, 'PL_02.docx');

// Doðan Akçay sürekli anlamsýz accesviolatin hatasý veriyor Þablon dosyasýný geçici dosyaya kopyalama

 DocXreport('PL_02.docx' ,'temp\trash\PL_02','temp\PL_02',[MainMod.qMCDef,qdayanak,qamac,qilgiliKisiSure]) ;
end;

procedure TfrEnvanterListe2.ppmiKVKKPolitikasiClick(Sender: TObject);
var
  FUrl, TempFileName, OutputFileName,TemplateFileName   : String;
  ADOCXRpt : TrXMLReport ;

begin
//  FrxDocXreport('PL_01.docx' ,'temp\trash\PL_01','temp\PL_01');
//  exit;
  if not MainMod.LoginInfo.Yetkiler[121] then
  begin
    MessageDlg('Doküman indirme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if (MainMod.qMCParam.FieldByName('kurum_turu').AsString = '') or (MainMod.qMCParam.FieldByName('kurum_turu').AsString = '00_BELÝRTÝLMEDÝ') then
  begin
    MessageDlg('Kurum türü belirtilmemiþ. Lütfen Kurum Parametreleri ekranýndan kurum türünü seçiniz.', mtError, [mbOk]);
    Exit;
  end;

  PrepKategoriVeriTipi;
  PrepKisiVeriTipi;
//
//  try
//    DOCXRpt.ReportFile := ServerMod.FilesFolderPath + 'temp\PL_01.docx'; //Template file name
//    DOCXRpt.OutputFile := ServerMod.NewCacheFileUrl(False, 'docx', '', '', FUrl, True);
//    DOCXRpt.Execute([MainMod.qMCDef, qCatVT, tblKisiVT]);
//  except on E: Exception do
//    begin
//      ShowMessageN('Hata.. Þablon oluþturulamýyor.'#13 + E.Message);
//      Exit;
//    end;
//  end;
//
//  UniSession.SendFile(DOCXRpt.OutputFile, 'PL_01.docx');

//   Sürekli Program Kilitlenmesi yaþanýyordu bunun için temp dosyasýndan alacaðým
//  dosyayý önce ayný dizee guid id ekleyerek dosya kopyasý oluþturuldu
//   iþlemi bunun üzerinden yapýp iþlem bitince
//   eklediðimiz

  DocXreport('PL_01.docx' ,'temp\trash\PL_01','temp\PL_01',[MainMod.qMCDef, qCatVT, tblKisiVT]) ;

end;

procedure TfrEnvanterListe2.FileDel(AFileName: string);
begin
  try
    if FileExists(AFileName) then
          DeleteFile(AFileName);
  except on E: Exception do
    begin
      ;
      //      ShowMessageN('Hata.. Geçici dosya silinemiyor.'#13 + E.Message);
    end;
  end;
end;



function TfrEnvanterListe2.NewGUID: string;
var
  GUID: TGUID;
begin
  CreateGUID(GUID);
  Result := GUIDToString(GUID).Replace('{', '').Replace('}', '').Replace('-', '');
end;

procedure TfrEnvanterListe2.ppmOzelNitelikliVeriPolitikasiClick(
  Sender: TObject);
var
  FUrl ,TemplateFileName, TempFilename, outputfileName  : String;
  ADOCXRpt : TrXMLReport;
begin
  if not MainMod.LoginInfo.Yetkiler[121] then
  begin
    MessageDlg('Doküman indirme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if (MainMod.qMCParam.FieldByName('kurum_turu').AsString = '') or (MainMod.qMCParam.FieldByName('kurum_turu').AsString = '00_BELÝRTÝLMEDÝ') then
  begin
    MessageDlg('Kurum türü belirtilmemiþ. Lütfen Kurum Parametreleri ekranýndan kurum türünü seçiniz.', mtError, [mbOk]);
    Exit;
  end;

  PrepKategoriVeriTipi;
  PrepIlgiliKisi;
 // PrepTaraflar;
 // PrepKategoriSure;

//  try
//    DOCXRpt.ReportFile := ServerMod.FilesFolderPath + 'temp\PL_16' + '.docx'; //Template file name
//    DOCXRpt.OutputFile := ServerMod.NewCacheFileUrl(False, 'docx', '', '', FUrl, True);
//    DOCXRpt.Execute([MainMod.qMCDef, qCatVT, qKisi, qTaraf, qSure]); // tblKisiVT,
////    DOCXRpt.Execute([MainMod.qMCDef, qCatVT, tblKisiVT, qTaraf, qSure]); // qKisi,
//  except on E: Exception do
//    begin
//      ShowMessageN('Hata.. Þablon oluþturulamýyor.'#13 + E.Message);
//      Exit;
//    end;
//  end;
//  UniSession.SendFile(DOCXRpt.OutputFile, 'PL_16.docx');

 DocXreport('PL_16.docx' ,'temp\trash\PL_16','temp\PL_16',[MainMod.qMCDef, qCatVT, qKisi]) ;  //, qTaraf, qSure
end;

procedure TfrEnvanterListe2.PrepIlgiliKisi;
begin
  QueryOpen(qKisi, 'SELECT env.kisi_id, ks.kisi AS kisi_str, ks.description as kisi_info, ' +
                   'string_agg(DISTINCT vt.veri_tipi,'', '' )::varchar as veritipi_str ' +
                   'FROM data_envanter env ' +
                   ' join data_checklist cl on env.mc_id= cl.mc_id and env.kisi_id = cl.kisi_id and cl.kaynak_id= env.kaynak_id '+
                   'LEFT JOIN def_data_kisi ks ON ks.id = env.kisi_id ' +
                   'LEFT JOIN def_data_veritipi vt ON vt.id = env.veritipi_id'+
                   ' WHERE env.active = ''E'' and cl.active=''E'' AND env.mc_id = ' + IntToStr(MainMod.MCID) +
                   ' GROUP by env.kisi_id, ks.kisi, ks.description ORDER BY env.kisi_id');


end;

procedure TfrEnvanterListe2.prepIlgiliKisiSure;
begin
 qilgiliKisiSure.Close;
 QueryOpen(qilgiliKisiSure,
    ' SELECT '+
    ' veri.kisi, '+
    ' MAX ( veri.surestr ) AS sakl_sure, '+
    ' MAX ( '+
    ' CASE '+
    '  '+
    ' WHEN veri.sure_tipi = ''YIL'' THEN '+
    ' ( CASE WHEN ( veri.sure IS NULL OR veri.sure = 0 ) THEN 1 ELSE veri.sure :: INT END ) * 365 '+
    ' WHEN veri.sure_tipi = ''AY'' THEN '+
    ' ( CASE WHEN ( veri.sure IS NULL OR veri.sure = 0 ) THEN 1 ELSE veri.sure :: INT END ) * 30 ELSE ( CASE WHEN ( veri.sure IS NULL OR veri.sure = 0 ) THEN 1 ELSE veri.sure :: INT END ) '+
    ' END '+
    ' ) SURE '+
    ' FROM '+
    ' ( '+
    ' SELECT K '+
    ' .kisi, '+
    ' env.sakl_ssure surestr, '+
    ' env.sakl_ssure_sure sure, '+
    ' env.sakl_ssure_tip sure_tipi '+
    ' FROM '+
    ' data_envanter env '+
    ' join data_checklist cl on cl.mc_id = env.mc_id and cl.kisi_id=env.kisi_id and cl.kaynak_id=env.kaynak_id '+
    ' LEFT JOIN def_data_kisi K ON K.id = env.kisi_id and env.mc_id=k.mc_id '+
    ' WHERE '+
    ' env.sakl_ssure_var = ''SAKLANIYOR'' '+
    ' AND env.active = ''E'' '+
    ' AND cl.active =''E'' '+
    ' AND env.main_id > 0 '+
    ' AND env.mc_id ='+ inttostr(mainmod.MCID) +
    ' UNION ALL '+
    ' SELECT K '+
    ' .kisi, '+
    ' env.sakl_fsure, '+
    ' env.sakl_fsure_sure, '+
    ' env.sakl_fsure_tip '+
    ' FROM '+
    ' data_envanter env '+
    ' join data_checklist cl on cl.mc_id = env.mc_id and cl.kisi_id=env.kisi_id and cl.kaynak_id=env.kaynak_id '+
    ' LEFT JOIN def_data_kisi K ON K.id = env.kisi_id and k.mc_id= env.mc_id '+
    ' WHERE '+
    ' env.sakl_fsure_var = ''SAKLANIYOR'' '+
    ' AND env.active = ''E'' '+
    ' AND cl.active =''E'' '+
    ' AND env.main_id > 0 '+
    ' AND env.mc_id ='+ inttostr(mainmod.MCID) +
    ' ) veri '+
    ' GROUP BY '+
    ' veri.kisi '+
    ' ORDER BY '+
    ' 1 ' ) ;

end;

procedure TfrEnvanterListe2.PrepKategoriSure;
begin
  (*
  QueryOpen(qSure, 'SELECT DISTINCT env.kategori_id, kt.kategori AS kategori_str, env.sakl_ssure, env.sakl_fsure ' +
                   'FROM data_envanter env ' +
                   'LEFT JOIN def_data_kategori kt ON kt.id = env.kategori_id ' +
                   'WHERE env.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) +
                   ' ORDER BY 2');
  *)
  tblSure.First;
  while not tblSure.EOF do tblSure.Delete;

  QueryOpen(qTmp2, 'SELECT kategori_id, kat.kategori AS kategori_str, count(env.id) ' +
                   'FROM data_envanter env ' +
                   ' join data_checklist cl on cl.mc_id = env.mc_id and cl.kisi_id=env.kisi_id and cl.kaynak_id=env.kaynak_id '+
                   'LEFT JOIN def_data_kategori kat ON env.kategori_id = kat.id ' +
                   'WHERE env.active = ''E'' AND cl.active =''E'' AND env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) + ' ' +
                   'GROUP BY kategori_id, kategori_str ' +
                   'ORDER BY 1');

  while not qTmp2.EOF do
  begin
    QueryOpen(qTmp, 'SELECT sakl_ssure AS sstr FROM data_envanter env WHERE active= ''E'' AND mc_id = ' +
                    IntToStr(MainMod.MCID) + ' AND kategori_id = ' + qTmp2.FieldByName('kategori_id').AsString +
                    ' UNION ' +
                    'SELECT sakl_fsure AS sstr FROM data_envanter env WHERE active= ''E'' AND mc_id = ' +
                    IntToStr(MainMod.MCID) + ' AND kategori_id = ' + qTmp2.FieldByName('kategori_id').AsString);
    while not qTmp.Eof do
    begin
      if qTmp.FieldByName('sstr').AsString <> '' then
      begin
        tblSure.Insert;
        tblSure.FieldByName('cat_id').AsInteger  := qTmp2.FieldByName('kategori_id').AsInteger;
        tblSure.FieldByName('cat_str').AsString  := qTmp2.FieldByName('kategori_str').AsString;
        tblSure.FieldByName('data_str').AsString := qTmp.FieldByName('sstr').AsString;
        tblSure.Post;
      end;

      qTmp.Next;
    end;
    qTmp2.Next;
  end;

  qSure.Close;
  qSure.SQL.Clear;
  qSure.SQL.Add('SELECT cat_str AS kategori_str, data_str AS sakl_sure FROM tblSure ORDER BY cat_id, data_str');
  qSure.Open;
end;

procedure TfrEnvanterListe2.prepAmac;
begin
  QueryOpen(qamac,
    ' SELECT DISTINCT a.amac,a.id  FROM  data_envanter e '+
    ' join data_checklist cl on cl.mc_id=e.mc_id and cl.kisi_id = e.kisi_id and cl.kaynak_id = e.kaynak_id '+
    ' join def_data_amac A  on   a.id = any(string_to_array(e.topl_amac_ids,'','' )::int[] ) ' +
    ' WHERE e.active =''E'' and cl.active=''E'' and e.mc_id ='+IntToStr(MainMod.MCID) + ' order by 1 ');
end;

procedure TfrEnvanterListe2.PrepDayanak;
begin
// QueryOpen(qdayanak, ' SELECT DISTINCT d.dayanak,d.id  FROM  data_envanter e '+
//                     ' join data_checklist cl on cl.kisi_id= e.kisi_id  and cl.kaynak_id=e.kaynak_id '+
//                     ' join def_data_dayanak d on  '',''||cl.dayanak_ids||'','' like ''%,''||d.id||'',%'' '+
//                     ' WHERE e.Active=''E'' and e.mc_id ='+IntToStr(MainMod.MCID) + ' order by 1 ' );
QueryOpen(qdayanak,
     ' SELECT DISTINCT d.dayanak,d.id '+
//     ' ,string_agg(distinct kt.kategori,'','') Kategori , '+
//     ' string_agg(distinct kt.description,'','') kategori_desc , '+
//     ' string_agg(distinct vt.veri_tipi ,'','') veri_tipi, '+
//     ' string_agg(distinct vt.description,'','') veri_tipi_desc '+
     ' FROM  data_envanter e '+
     ' join data_checklist cl on cl.mc_id= e.mc_id and cl.kisi_id= e.kisi_id  and cl.kaynak_id=e.kaynak_id '+
     ' join def_data_dayanak d on d.mc_id= e.mc_id and d."id" = ANY(string_to_array(cl.dayanak_ids, '','')::INT[]) '+
//     ' join def_data_kategori kt on kt.mc_id= e.mc_id and kt.id=e.kategori_id '+
//     ' join def_data_veritipi vt on vt.mc_id= e.mc_id and vt."id"= e.veritipi_id and vt.mc_id=e.mc_id '+
     ' WHERE e.Active=''E'' and cl.active=''E'' and e.mc_id='+IntToStr(MainMod.MCID) +
     ' GROUP BY d.dayanak,d.id ');


end;

procedure TfrEnvanterListe2.PrepKategoriVeriTipi;
var
  VTStr : String;
begin
  tblCatVT.First;
  while not tblCatVT.EOF do tblCatVT.Delete;

  QueryOpen(qTmp, 'SELECT DISTINCT env.kategori_id, kt.kategori, kt.description ' +
                  'FROM data_envanter env ' +
                  ' join data_checklist cl on cl.mc_id= env.mc_id and cl.kisi_id= env.kisi_id  and cl.kaynak_id = env.kaynak_id '+
                  'JOIN def_data_kategori kt ON kt.id = env.kategori_id and env.mc_id = kt.mc_id  ' +
                //  'LEFT JOIN def_data_kategori kt ON kt.id = env.kategori_id ' +
                  'WHERE env.active = ''E'' AND cl.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) +
                  ' ORDER BY 2');

  while not qTmp.EOF do
  begin
    tblCatVT.Append;
    tblCatVT.FieldByName('cat_id').AsInteger  := qTmp.FieldByName('kategori_id').AsInteger;
    tblCatVT.FieldByName('cat_str').AsString  := qTmp.FieldByName('kategori').AsString;
    tblCatVT.FieldByName('cat_info').AsString := qTmp.FieldByName('description').AsString;

    VTStr := '';
    QueryOpen(qTmp2, 'SELECT DISTINCT vt.veri_tipi ' +
                     'FROM data_envanter env ' +
                     ' join data_checklist cl on cl.mc_id= env.mc_id and cl.kisi_id= env.kisi_id  and cl.kaynak_id=env.kaynak_id '+
                     'JOIN def_data_veritipi vt ON vt.id = env.veritipi_id  and vt.mc_id = env.mc_id ' +
              //       'LEFT JOIN def_data_veritipi vt ON vt.id = env.veritipi_id ' +
                     'WHERE env.active = ''E'' AND cl.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) +
                     ' AND env.kategori_id = ' + IntToStr(qTmp.FieldByName('kategori_id').AsInteger) +
                     ' ORDER BY 1');
    while not qTmp2.EOF do
    begin
      VTStr := VTStr + qTmp2.FieldByName('veri_tipi').AsString + ', ';
      qTmp2.Next;
    end;
    if VTStr <> '' then System.Delete(VTStr, Length(VTStr) - 1, 2);
    tblCatVT.FieldByName('cat_vt').AsString := VTStr;

    tblCatVT.Post;

    qTmp.Next;
  end;

  qCatVT.Close;
  qCatVT.SQL.Clear;
  qCatVT.SQL.Add('SELECT * FROM tblCatVT ORDER BY cat_str');
  qCatVT.Open;
end;

procedure TfrEnvanterListe2.PrepKisiVeriTipi;
var
  VTStr : String;
begin
  tblKisiVT.First;
  while not tblKisiVT.EOF do tblKisiVT.Delete;

  QueryOpen(qTmp, 'SELECT DISTINCT env.kisi_id, ks.kisi ' +
                  'FROM data_envanter env ' +
                  ' JOIN data_checklist cl on cl.mc_id=env.mc_id and cl.kisi_id=env.kisi_id and cl.kaynak_id=env.kaynak_id '+
               //   'LEFT JOIN def_data_kisi ks ON ks.id = env.kisi_id ' +
                  'JOIN def_data_kisi ks ON ks.id = env.kisi_id and ks.mc_id= env.mc_id ' +
                  'WHERE env.active = ''E'' AND cl.active = ''E'' AND env.main_id = 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) +
                  ' ORDER BY 2');
  while not qTmp.EOF do
  begin
    tblKisiVT.Append;
    tblKisiVT.FieldByName('kisi_id').AsInteger  := qTmp.FieldByName('kisi_id').AsInteger;
    tblKisiVT.FieldByName('kisi_str').AsString  := qTmp.FieldByName('kisi').AsString;

    VTStr := '';
    QueryOpen(qTmp2, 'SELECT DISTINCT vt.veri_tipi ' +
                     'FROM data_envanter env ' +
                     ' JOIN data_checklist cl on cl.mc_id=env.mc_id and cl.kisi_id=env.kisi_id and cl.kaynak_id=env.kaynak_id '+
                    // 'LEFT JOIN def_data_veritipi vt ON vt.id = env.veritipi_id ' +
                     'JOIN def_data_veritipi vt ON vt.id = env.veritipi_id and vt.mc_id= env.mc_id  ' +
                     'WHERE env.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) +
                     ' AND env.kisi_id = ' + IntToStr(qTmp.FieldByName('kisi_id').AsInteger) +
                     ' ORDER BY 1');
    while not qTmp2.EOF do
    begin
      VTStr := VTStr + qTmp2.FieldByName('veri_tipi').AsString + ', ';
      qTmp2.Next;
    end;
    if VTStr <> '' then System.Delete(VTStr, Length(VTStr) - 1, 2);
    tblKisiVT.FieldByName('kisi_vt').AsString := VTStr;

    tblKisiVT.Post;

    qTmp.Next;
  end;

  qKisiVT.Close;
  qKisiVT.SQL.Clear;
  qKisiVT.SQL.Add('SELECT * FROM tblKisiVT ORDER BY kisi_str');
  qKisiVT.Open;
end;

procedure TfrEnvanterListe2.PrepTaraflar;
var
  IDList : String;
begin
{ direk tablodan çekmek için alternatif yol
 SELECT DISTINCT  trf.id, trf.taraf ,trf.description FROM data_envanter env
join data_checklist cl on cl.mc_id = env.mc_id and cl.kisi_id = env.kisi_id and cl.kaynak_id = env.kaynak_id
 join def_data_taraf trf on  trf.id= any(string_to_array(env.payl_taraf_ids,',')::int[])
WHERE env.active = 'E' and cl.active='E' AND COALESCE(ENV.payl_taraf_ids,'')<>''  AND env.mc_id = 2
ORDER BY trf.taraf,trf.description
}
  tblTaraf.First;
  while not tblTaraf.EOF do tblTaraf.Delete;

  QueryOpen(qTmp, ' SELECT DISTINCT env.payl_taraf_ids FROM data_envanter  env ' +
                  ' join data_checklist cl on cl.mc_id = env.mc_id and cl.kisi_id = env.kisi_id and cl.kaynak_id = env.kaynak_id '+
                  ' WHERE env.active = ''E'' AND cl.active =''E'' AND env.mc_id = ' + IntToStr(MainMod.MCID));
  IDList := '';
  while not qTmp.EOF do
  begin
    if qTmp.FieldByName('payl_taraf_ids').AsString <> '' then
       IDList := IDList + qTmp.FieldByName('payl_taraf_ids').AsString + ', ';

    qTmp.Next;
  end;
  if IDList <> '' then System.Delete(IDList, Length(IDList) - 1, 2);

  QueryOpen(qTmp, 'SELECT * FROM def_data_taraf WHERE id IN (' + IDList + ') ORDER BY id');
  while not qTmp.EOF do
  begin
    tblTaraf.Append;
    tblTaraf.FieldByName('taraf_id').AsInteger    := qTmp.FieldByName('id').AsInteger;
    tblTaraf.FieldByName('taraf_str').AsString    := qTmp.FieldByName('taraf').AsString;
    tblTaraf.FieldByName('taraf_info').AsString   := qTmp.FieldByName('description').AsString;
    tblTaraf.Post;

    qTmp.Next;
  end;

  qTaraf.Close;
  qTaraf.SQL.Clear;
  qTaraf.SQL.Add('SELECT * FROM tblTaraf ORDER BY taraf_str');
  qTaraf.Open;
end;

procedure TfrEnvanterListe2.UniBitBtn1Click(Sender: TObject);
begin
  frmHelpPage.Exec('EnvanterFormlariListe');
end;

procedure TfrEnvanterListe2.UniDBGrid1AfterLoad(Sender: TUniCustomDBGrid);
begin
 UniDBGrid1.JSInterface.JSCallDefer('getSelectionModel().deselectAll', [5, false, false], 1);
end;

procedure TfrEnvanterListe2.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  qEnvanter.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrEnvanterListe2.UniDBGrid1DrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if UniDBGrid1.DataSource.DataSet.FieldByName('kilitli').AsString = 'E' then
  begin
    Attribs.Font.Style := [fsItalic];
    Attribs.Color := clInfoBk;
  end;
  if UniDBGrid1.DataSource.DataSet.FieldByName('nitelik').AsString = 'E' then
  begin
    Attribs.Font.Style := Attribs.Font.Style + [fsBold];
    Attribs.Font.Color := clMaroon;
  end;
  if UniDBGrid1.DataSource.DataSet.FieldByName('checlistId').AsInteger = 0 then
  begin
    Attribs.Color := $00E1E1FF;
  end;

end;


procedure TfrEnvanterListe2.UniDBGrid1SelectionChange(Sender: TObject);
begin
  KilitliKayitSeciminiKaldir(UniDBGrid1);
end;

procedure TfrEnvanterListe2.KilitliKayitSeciminiKaldir(AGrid: TUniDBGrid);
var
  i, CurrentRecNo: Integer;
  DBGridJSName: string;
  DataSet: TDataSet;
  SelectionModel: string;
begin
  DBGridJSName := AGrid.JSName;
  DataSet := AGrid.DataSource.DataSet;
  // Mevcut kayýt pozisyonunu sakla
  CurrentRecNo := DataSet.RecNo;
  // JavaScript seçim modelini al
  SelectionModel := DBGridJSName + '.getSelectionModel()';
  // Tüm kayýtlarý kontrol et
  for i := 0 to DataSet.RecordCount - 1 do
  begin
    DataSet.RecNo := i + 1; // RecNo 1 bazlýdýr
    // Eðer kayýt kilitli ise, JavaScript seçimden kaldýr
    if DataSet.FieldByName('Kilitli').AsString = 'E' then
    begin
      UniSession.AddJS(
        'if (' + SelectionModel + '.isSelected(' + IntToStr(i) + ')) { ' +
        SelectionModel + '.deselect(' + IntToStr(i) + '); }'
      );
    end;
  end;
  // Mevcut kayýt pozisyonunu geri yükle
  DataSet.RecNo := CurrentRecNo;
end;

procedure TfrEnvanterListe2.UniFrameCreate(Sender: TObject);
begin

    edSrcDate.DateTime := Date;
    NewSQL;
    ManageSettings;
    edSrcText.SetFocus;
    tblCatVT.Open;
    tblKisiVT.Open;
    tblTaraf.Open;
    tblSure.Open;
    DefVariables(DOCXRpt.Variables);
end;

initialization
  RegisterClass(TfrEnvanterListe2);

end.
{
DS1 : qCatVT
DS2 : tblKisiVT
DS3 : qKisi
DS4 : qTaraf
DS5 : qSure
}
