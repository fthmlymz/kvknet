unit unKVKKVeriDokumanTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniButton, uniBitBtn, uniMemo, uniDBMemo, uniEdit, uniDBEdit, uniLabel,
  uniGUIBaseClasses, Data.DB, MemDS, DBAccess, Uni, uniMultiItem, uniComboBox,
  uniDBComboBox, Vcl.Dialogs, uniFileUpload, rXMLReport,RosiCompGlobalCfg;

type
  TfrmKVKKVeriDokumanTanim = class(TUniForm)
    pnlData: TUniPanel;
    UniLabel2: TUniLabel;
    UniLabel9: TUniLabel;
    edDoc: TUniDBEdit;
    edDesc: TUniDBMemo;
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
    dsDokuman: TUniDataSource;
    qTmp: TUniQuery;
    UniLabel3: TUniLabel;
    edMain: TUniEdit;
    FileUp: TUniFileUpload;
    SaveDlg: TSaveDialog;
    UniLabel1: TUniLabel;
    edDosyaTuru: TUniDBComboBox;
    btnDownload: TUniButton;
    btnUpload: TUniButton;
    DOCXRpt: TrXMLReport;
    btnHelp: TUniBitBtn;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnUploadClick(Sender: TObject);
    procedure FileUpCompleted(Sender: TObject; AStream: TFileStream);
    procedure btnDownloadClick(Sender: TObject);
    procedure DOCXRptUserCalc(Sender: TObject; var CalcStr: string; var Replace: Boolean);
    procedure btnHelpClick(Sender: TObject);
  private
    YardimKw : string;
    MDID   : Integer;
    function ProcessTemplate(ATmpName: String; ADOCXRpt : TrXMLReport = nil ): String;
    procedure DefVariables(VL: TStrings);
    procedure OverWriteControl(Sender: TComponent; Res: Integer);
  public
    Data : TUniQuery;
    function Edit(AText: String): Integer;
    function Insert(AID: Integer; AText: String): Integer;
  end;

function frmKVKKVeriDokumanTanim: TfrmKVKKVeriDokumanTanim;

implementation

uses uniGUIApplication, MainModule, McMLib, unKVKKVeriDokumanListe,
  ServerModule, Main, unHelpPage;

{$R *.dfm}

function frmKVKKVeriDokumanTanim: TfrmKVKKVeriDokumanTanim;
begin
  Result := TfrmKVKKVeriDokumanTanim(MainMod.GetFormInstance(TfrmKVKKVeriDokumanTanim));
end;

procedure TfrmKVKKVeriDokumanTanim.btnCancelClick(Sender: TObject);
begin
  Data.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmKVKKVeriDokumanTanim.btnDownloadClick(Sender: TObject);
var
  AStream : TMemoryStream;
  FStream : TStream;
  TmpName : String;
  NewName : String;
  FileExt : String;
  FUrl    : String;
  DOCXRpt2 : TrXMLReport;
begin
//TODO: doküman indirme yetkisi yapýlacak
//  if not MainMod.LoginInfo.Yetkiler[152] then
//  begin
//    MessageDlg('Doküman indirme yetkiniz yok.', mtError, [mbOk]);
//    Exit;
//  end;
 DOCXRpt2 := TrXMLReport.Create(nil);
 try

  DOCXRpt2.OnUserCalc := DOCXRptUserCalc;
  DOCXRpt2.ActionAfter := aaNone;
    if Data.FieldByName('dosya').IsNull = false then
    begin
      AStream := TMemoryStream.Create;
      try
        NewName := MainMod.qDokuman.FieldByName('dosya_adi').AsString;
        FileExt := ExtractFileExt(NewName);
        //her seferine temp adresi mi alalým yoksa bir kere firma_temp klasörüne kaydedip hep ordan mý kullanalým
        TmpName := ServerMod.NewCacheFileUrl(False, Copy(FileExt, 2, Length(FileExt) - 1), '', '', FUrl, True);

        TBlobField(Data.FieldByName('dosya')).SaveToStream(AStream);
        FStream := TFileStream.Create(TmpName, fmCreate);
         try
          AStream.Position := 0;
          AStream.SaveToStream(FStream);
        finally
          FStream.Free;
        end;

        if FileExt = '.docx' then
        begin
          DOCXRpt2.Variables.Clear;
          DefVariables(DOCXRpt2.Variables);
          try
            DOCXRpt2.ReportFile := TmpName; // Template file name
            DOCXRpt2.OutputFile := ServerMod.NewCacheFileUrl(False, Copy(Fileext, 2, Length(FileExt)-1), '', '', FUrl, True);
            TmpName := DOCXRpt2.OutputFile;
            DOCXRpt2.Execute([mainmod.qTmp]);
          except on E: Exception do
            begin
              MessageDlg('Hata..'#13 + E.Message, mtError, [mbOk]);
              Exit;
            end;
          end;
        end;

        UniSession.SendFile(TmpName, NewName);
        // UniSession.SendStream(AStream, MainMod.qDokuman.FieldByName('dosya_adi').AsString);
      finally
        AStream.Free;
      end;
    end
    else
    begin
      // dosya yüklenmemiþ eski templateler eski halinde çalýþmaya devam etsin
      // NewName := MainMod.qDokuman.FieldByName('dokuman').AsString;
      NewName := MainMod.qDokuman.FieldByName('dosya_adi').AsString;
      if NewName = '' then
      begin
        MessageDlg('Dosya eklenmemiþ...', mtError, [mbOk]);
        Exit;
      end;
      FileExt := ExtractFileExt(NewName);

      DOCXRpt2.Variables.Clear;
      DefVariables(DOCXRpt2.Variables);

      if FileExt = '.docx' then
        TmpName := ProcessTemplate(Data.FieldByName('dosya_adi').AsString,DOCXRpt2)
       else
        TmpName := ServerMod.FilesFolderPath + 'temp\' + NewName;

      if TmpName = '' then Exit;
  //    System.Delete(NewName, 1, 5);
      UniSession.SendFile(TmpName, NewName);
    end;
 finally
  if Assigned(DOCXRpt2) then
   FreeAndNil(DOCXRpt2);
 end;
end;

procedure TfrmKVKKVeriDokumanTanim.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmKVKKVeriDokumanTanim.btnPostClick(Sender: TObject);
begin
  if Data.FieldByName('dokuman').AsString = '' then
  begin
    MessageDlg('Doküman belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edDoc.SetFocus;
    Exit;
  end;

  if Data.State in [dsInsert] then
  begin
    Data.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_def_data_dokuman_id');
    Data.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    Data.FieldByName('md_id').AsInteger  := MDID;
    Data.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    Data.FieldByName('idt').AsDateTime   := Now;
  end;
  Data.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  Data.FieldByName('sdt').AsDateTime     := Now;
  Data.Post;
  ModalResult := mrOk;
end;

procedure TfrmKVKKVeriDokumanTanim.btnUploadClick(Sender: TObject);
begin
  if Data.FieldByName('dosya').AsString = '' then FileUp.Execute
   else MessageDlg('Daha önce yüklenmiþ dosyanýn üzerine yazýlacaktýr, devam etmek istiyor musunuz?', mtConfirmation, [mbYes, mbNo], OverWriteControl);
end;

procedure TfrmKVKKVeriDokumanTanim.DefVariables(VL: TStrings);
begin
  VL.Clear;
  VL.Add('DEPARTMENTNAME'       + '=' + '');
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

  if MainMod.qMCParam.FieldByName('kurum_turu').AsString = '00_BELÝRTÝLMEDÝ' then
    VL.Add('COMPANYTYPE'          + '=' + ' ')
  else if MainMod.qMCParam.FieldByName('kurum_turu').AsString = '01_BELEDÝYE' then
    VL.Add('COMPANYTYPE'          + '=' + 'Belediye')
  else if MainMod.qMCParam.FieldByName('kurum_turu').AsString = '02_ÜNÝVERSÝTE' then
    VL.Add('COMPANYTYPE'          + '=' + 'Üniversite')
  else if MainMod.qMCParam.FieldByName('kurum_turu').AsString = '03_ÖZEL SEKTÖR' then
    VL.Add('COMPANYTYPE'          + '=' + 'Þirket')
  else if mainmod.qMCParam.FieldByName('kurum_turu').AsString ='04-KAMU' then
    VL.Add('COMPANYTYPE'          + '=' + 'Kamu');
end;

procedure TfrmKVKKVeriDokumanTanim.DOCXRptUserCalc(Sender: TObject; var CalcStr: string; var Replace: Boolean);
var
  TagValue : String;
begin
  Replace  := True;
  TagValue := AnsiUpperCase(CalcStr);

  if TagValue = 'COMPANYLOGO' then TagValue := MainForm.GetLogoFileName else Replace := False;

  if Replace then CalcStr := TagValue;
end;

function TfrmKVKKVeriDokumanTanim.Edit(AText: String): Integer;
begin
  edMain.Text := AText;
  Data := MainMod.qDokuman;
  if not Data.Active then Data.Open;
  Data.Edit;
  ActiveControl := edDoc;
  YardimKw := 'DokumanSablonDegistirme';
  Result := ShowModal;
end;

procedure TfrmKVKKVeriDokumanTanim.FileUpCompleted(Sender: TObject; AStream: TFileStream);
var
  FileExt: String;
begin
  try
    FileExt := UpperCase(ExtractFileExt(FileUp.FileName));
    if Pos(',' + FileExt + ',', ',.PDF,.DOCX,.XLSX,.PPTX,.PPSX,') <= 0 then
    begin
      MessageDlg('Sadece Word, Excel, Powerpoint ve PDF (.DOCX, .XLSX, .PPTX, .PPSX, .PDF) dosyalarýný yükleyebilirsiniz.', mtInformation, [mbOk]);
      Exit;
    end;

    if Data.FieldByName('dokuman').AsString = '' then
       Data.FieldByName('dokuman').AsString     := FileUp.FileName;
    Data.FieldByName('dosya_adi').AsString      := FileUp.FileName;
    Data.FieldByName('dosya_uzantisi').AsString := ExtractFileExt(FileUp.FileName);
    TBlobField(Data.FieldByName('dosya')).LoadFromStream(AStream);
    MessageDlg('Dosya yüklendi : ' + FileUp.FileName, mtInformation, [mbOk]);
  except
    raise;
  end;
end;

function TfrmKVKKVeriDokumanTanim.Insert(AID: Integer; AText: String): Integer;
begin
  MDID := AID;
  edMain.Text := AText;
  Data := MainMod.qDokuman;
  if not Data.Active then Data.Open;
  Data.Insert;
  ActiveControl := edDoc;
  YardimKw := 'DokumanSablonYeniKayit';
  Result := ShowModal;
end;

procedure TfrmKVKKVeriDokumanTanim.OverWriteControl(Sender: TComponent; Res: Integer);
begin
  if Res = mrNo then Exit;

  FileUp.Execute;
end;

function TfrmKVKKVeriDokumanTanim.ProcessTemplate(ATmpName: String; ADOCXRpt : TrXMLReport = nil ): String;
var
  FUrl    : String;
  lDOCXRpt : TrXMLReport;
begin
  if ADOCXRpt <> nil then
    lDOCXRpt := ADOCXRpt
  else
    lDOCXRpt := DOCXRpt;

  QueryOpen(mainmod.qTmp,' select DISTINCT k.kisi kisi_str,t.tanim,t.description '+
    ' from def_data_aydinlatma t,def_data_kisi k  where  k.id=t.kisi_id and t.mc_id='+IntToStr(mainmod.MCID) +
    ' ORDER BY k.kisi ' );
  DefVariables(DOCXRpt.Variables);
  try
    LDOCXRpt.ReportFile := ServerMod.FilesFolderPath + 'temp\' + ATmpName; // Template file name
    LDOCXRpt.OutputFile := ServerMod.NewCacheFileUrl(False, 'docx', '', '', FUrl, True);
    LDOCXRpt.Execute([mainmod.qTmp]);
  except on E: Exception do
    begin
      ShowMessageN('Hata..'#13 + E.Message);
      Exit;
    end;
  end;
  Result := LDOCXRpt.OutputFile;
end;

procedure TfrmKVKKVeriDokumanTanim.UniFormBeforeShow(Sender: TObject);
begin
  lbIDY.Caption := MainMod.KullaniciGetir(Data.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(Data.FieldByName('sdy').AsString);

  if dsDokuman.State = dsEdit then
  begin
    if lbIDY.Text = '' then lbIDY.Text := 'SÝSTEM';
    if lbSDY.Text = '' then lbSDY.Text := 'SÝSTEM';
  end;

  if Data.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', Data.FieldByName('idt').AsDateTime);
  if Data.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', Data.FieldByName('sdt').AsDateTime);
end;

end.
