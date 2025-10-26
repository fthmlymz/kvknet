unit unKVKKVeriDokumanListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, System.Actions, Vcl.ActnList, Data.DB, DBAccess, Uni, uniBasicGrid, uniDBGrid,
  uniButton, uniBitBtn, uniLabel, uniEdit, uniMultiItem, uniComboBox, uniGUIBaseClasses, uniPanel, uniSplitter,
  MemDS, uniMemo, uniMenuButton, Vcl.Menus, uniMainMenu, rXMLReport, System.Zip,RosiCompGlobalCfg;

type
  TfrKVKKVeriDokumanListe = class(TUniFrame)
    dsDoc: TUniDataSource;
    ActList: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actClose: TAction;
    pnlTop: TUniPanel;
    edSrcText: TUniEdit;
    btnSearch: TUniBitBtn;
    btnClose: TUniBitBtn;
    btnAdd: TUniBitBtn;
    btnEdit: TUniBitBtn;
    btnDelete: TUniBitBtn;
    UniLabel2: TUniLabel;
    grdDoc: TUniDBGrid;
    actSearch: TAction;
    UniPanel2: TUniPanel;
    grdMain: TUniDBGrid;
    UniPanel3: TUniPanel;
    UniPanel1: TUniPanel;
    UniSplitter1: TUniSplitter;
    qMain: TUniQuery;
    dsMain: TUniDataSource;
    edLog: TUniMemo;
    actDownload: TAction;
    ppmDownload: TUniPopupMenu;
    ppmiAydinlatmaMetni: TUniMenuItem;
    ppmiAcikRizaBeyani: TUniMenuItem;
    actDownloadUnprocessed: TAction;
    UniBitBtn1: TUniBitBtn;
    btnYardim: TUniBitBtn;
    procedure UniFrameCreate(Sender: TObject);
    procedure edSrcTypeChange(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actDownloadExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure qMainAfterScroll(DataSet: TDataSet);
    procedure edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure grdDocDblClick(Sender: TObject);
    procedure pnlTopAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure grdDocColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure grdMainColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure actDownloadUnprocessedExecute(Sender: TObject);
    procedure bDosyaAktarClick(Sender: TObject);
    procedure DOCXRptUserCalc(Sender: TObject; var CalcStr: string; var Replace: Boolean);
    procedure btnYardimClick(Sender: TObject);
  private
    DataLoading : Boolean;
    function ProcessTemplate(ATmpName: String; ADOCXRpt : TrXMLReport = nil): String;
    procedure DeleteControl(Sender: TComponent; Res: Integer);
    procedure NewSQL;
    procedure ManageSettings;
    procedure DefVariables(VL: TStrings);
  public
  end;

implementation

{$R *.dfm}

uses MainModule, ServerModule, McMLib, Main, unKVKKVeriDokumanTanim,
     unHelpPage;

{ TfrKVKKVeriDokuman }

procedure TfrKVKKVeriDokumanListe.actAddExecute(Sender: TObject);
begin
  if frmKVKKVeriDokumanTanim.Insert(qMain.FieldByName('id').AsInteger, qMain.FieldByName('dokumantip').AsString) = mrOk then
     RefreshQuery(MainMod.qDokuman);
  ManageSettings;
end;

procedure TfrKVKKVeriDokumanListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrKVKKVeriDokumanListe.actDeleteExecute(Sender: TObject);
begin
  MessageDlg('Seçili doküman tanýmýný silmek istediðinizden emin misiniz?'#13, mtConfirmation, mbYesNo, DeleteControl);
end;

procedure TfrKVKKVeriDokumanListe.actDownloadExecute(Sender: TObject);
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
 if MainMod.qDokuman.RecordCount < 1 then Exit;

 DOCXRpt2 := TrXMLReport.Create(nil);
 try
      DOCXRpt2.OnUserCalc := DOCXRptUserCalc;
      DOCXRpt2.ActionAfter := aaNone;

      if MainMod.qDokuman.FieldByName('dosya').IsNull = false then
      begin
        AStream := TMemoryStream.Create;
        try
          NewName := MainMod.qDokuman.FieldByName('dosya_adi').AsString;
          FileExt := ExtractFileExt(NewName);
          TmpName := ServerMod.NewCacheFileUrl(False, Copy(FileExt, 2, Length(FileExt) - 1), '', '', FUrl, True);

          TBlobField(MainMod.qDokuman.FieldByName('dosya')).SaveToStream(AStream);
          AStream.Position := 0; // doðan akçay  bellek baþlangýsýný 0 yapýyorum

            FStream := TFileStream.Create(TmpName, fmCreate);
              try  //doðan akçay
                if AStream.Size > 0 then
                  AStream.SaveToStream(FStream);
              finally   //Doðan akçay
                FStream.Free;
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
          TmpName := ProcessTemplate(MainMod.qDokuman.FieldByName('dosya_adi').AsString,DOCXRpt2)
         else
          TmpName := ServerMod.FilesFolderPath + 'temp\' + NewName;

        if TmpName = '' then Exit;
    //    System.Delete(NewName, 1, 5);
        UniSession.SendFile(TmpName, NewName);
      end;
 finally
  FreeAndNil(DOCXRpt2);
 end;
end;

procedure TfrKVKKVeriDokumanListe.actDownloadUnprocessedExecute(Sender: TObject);
var
  AStream : TMemoryStream;
  TmpName : String;
  NewName : String;
  FileExt : String;
begin
//TODO: doküman indirme yetkisi yapýlacak

  if MainMod.qDokuman.FieldByName('dosya').IsNull = false then
  begin
    AStream := TMemoryStream.Create;
    try
      NewName := MainMod.qDokuman.FieldByName('dosya_adi').AsString;
      FileExt := ExtractFileExt(NewName);

      TBlobField(MainMod.qDokuman.FieldByName('dosya')).SaveToStream(AStream);
      AStream.Position :=0;

      UniSession.SendStream(AStream, MainMod.qDokuman.FieldByName('dosya_adi').AsString);
    finally
      AStream.Free;
    end;
  end
  else
  begin
    //dosya yüklenmemiþ eski templateler eski halinde çalýþmaya devam etsin
//    NewName := MainMod.qDokuman.FieldByName('dokuman').AsString;
    NewName := MainMod.qDokuman.FieldByName('dosya_adi').AsString;
    FileExt := ExtractFileExt(NewName);
    TmpName := ServerMod.FilesFolderPath + 'temp\' + NewName;
    if TmpName = '' then Exit;
    System.Delete(NewName, 1, 5);
    UniSession.SendFile(TmpName, NewName);
  end;
end;

procedure TfrKVKKVeriDokumanListe.actEditExecute(Sender: TObject);
begin
  if frmKVKKVeriDokumanTanim.Edit(qMain.FieldByName('dokumantip').AsString) = mrOk then RefreshQuery(MainMod.qDokuman);
  ManageSettings;
end;

procedure TfrKVKKVeriDokumanListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKVKKVeriDokumanListe.bDosyaAktarClick(Sender: TObject);
var
  fStream : TFileStream;
  TmpName : String;
  NewName : String;
  FileExt : String;
begin
  if MainMod.LoginInfo.UserName <> 'M.EROL' then Exit;

  MainMod.qDokuman.First;
  while not MainMod.qDokuman.Eof do
  begin
    if MainMod.qDokuman.FieldByName('dosya').IsNull = False then
    begin
      MainMod.qDokuman.Next;
      Continue;
    end
    else
    begin
      try
        NewName := MainMod.qDokuman.FieldByName('dosya_adi').AsString;
        FileExt := ExtractFileExt(NewName);
        TmpName := ServerMod.FilesFolderPath + 'temp\' + NewName;
        System.Delete(NewName, 1, 5);

        fileExt := UpperCase(ExtractFileExt(TmpName));
        fStream := TFileStream.Create(TmpName, fmOpenRead);

        mainmod.qDokuman.edit;
        MainMod.qDokuman.FieldByName('dosya_uzantisi').AsString := fileext;
        TBlobField(MainMod.qDokuman.FieldByName('dosya')).LoadFromStream(fStream);
        mainmod.qDokuman.Post;
        fstream.Free;
      except
        //
      end;
    end;
    MainMod.qDokuman.Next;
  end;
end;

procedure TfrKVKKVeriDokumanListe.btnYardimClick(Sender: TObject);
begin
  frmHelpPage.Exec('DokumanSablonListe');
end;

procedure TfrKVKKVeriDokumanListe.DefVariables(VL: TStrings);
begin
  QueryOpen(MainMod.qAydinlatma,'SELECT ayd.*, ks.kisi as kisi_str FROM def_data_aydinlatma ayd LEFT JOIN def_data_kisi ks ON ks.id = ayd.kisi_id where ayd.mc_id='+ IntToStr(MainMod.MCID) +' ORDER BY ayd.id');
  VL.Clear;
  VL.Add('COMPANYADDRESS'       + '=' + Trim(Trim(MainMod.qMCDef.FieldByName('krm_adres1').AsString) + ' ' + Trim(MainMod.qMCDef.FieldByName('krm_adres2').AsString)));
  VL.Add('TAXOFFICE'            + '=' + Trim(MainMod.qMCDef.FieldByName('krm_vdairesi').AsString));
  VL.Add('TAXNO'                + '=' + Trim(MainMod.qMCDef.FieldByName('krm_vkn').AsString));
  VL.Add('COMPANYTITLE'         + '=' + Trim(MainMod.qMCDef.FieldByName('title').AsString));
 // VL.Add('DEPARTMENTNAME'       + '=' + Trim(MainMod.qDept.FieldByName('title').AsString));
   VL.Add('DEPARTMENTNAME'       + '=' + '');
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

procedure TfrKVKKVeriDokumanListe.DeleteControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  if MainMod.CheckUsedIDs('data_envanter', 'dgr_dokuman_ids', MainMod.qDokuman.FieldByName('id').AsString) then
  begin
    MessageDlg('Bu doküman tanýmý envanter kayýtlarýnda kullanýlýyor. Silemezsiniz.', mtError, [mbOk]);
    Exit;
  end;
  if MainMod.CheckUsedIDs('data_checklist', 'dokuman_ids', MainMod.qDokuman.FieldByName('id').AsString) then
  begin
    MessageDlg('Bu doküman tanýmý kontrol listelerinde kullanýlýyor. Silemezsiniz.', mtError, [mbOk]);
    Exit;
  end;

  MainMod.qDokuman.Delete;
  ManageSettings;
end;

procedure TfrKVKKVeriDokumanListe.DOCXRptUserCalc(Sender: TObject; var CalcStr: string; var Replace: Boolean);
var
  TagValue : String;
begin
  Replace  := True;
  TagValue := AnsiUpperCase(CalcStr);

  if TagValue = 'COMPANYLOGO' then TagValue := MainForm.GetLogoFileName else Replace := False;

  if Replace then CalcStr := TagValue;
end;

procedure TfrKVKKVeriDokumanListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrKVKKVeriDokumanListe.edSrcTypeChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrKVKKVeriDokumanListe.grdDocColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  MainMod.qDokuman.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrKVKKVeriDokumanListe.grdDocDblClick(Sender: TObject);
begin
  actDownloadExecute(actDownload);
end;

procedure TfrKVKKVeriDokumanListe.grdMainColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  qMain.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrKVKKVeriDokumanListe.ManageSettings;
var
  IsOther : Boolean;
  sTmp      : String;
begin
  sTmp := Copy(qMain.FieldByName('dokumantip').AsString, 1, 2);
  IsOther := true;
//  IsOther := sTmp = 'Z_';
//  dokümanlar kurumlara özel ayrýldý, yetkililer tüm dokümanlarý deðiþtirebilir 23.08.2021

  actAdd.Enabled      := IsOther and MainMod.LoginInfo.Yetkiler[81] and (MainMod.qDokuman.State = dsBrowse);
  actEdit.Enabled     := IsOther and MainMod.LoginInfo.Yetkiler[82] and (MainMod.qDokuman.State = dsBrowse) and (MainMod.qDokuman.FieldByName('id').AsInteger > 0);
  actDelete.Enabled   := IsOther and MainMod.LoginInfo.Yetkiler[83] and (MainMod.qDokuman.State = dsBrowse) and (MainMod.qDokuman.FieldByName('id').AsInteger > 0);
//  actDownload.Enabled := not IsOther;       TODO:neden other

  actClose.Enabled  := not DataEditing(MainMod.qDokuman);
end;

procedure TfrKVKKVeriDokumanListe.NewSQL;
var
	SQLStr,
  SrcText,
	WhereStr : string;
begin
	SQLStr   := 'SELECT * FROM def_data_dokuman where mc_id =:mc_id AND md_id =:md_id ';
  if edSrcText.Text <> '' then
  begin

     if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';

//    SrcText := StringReplace(edSrcText.Text, '*', '%', [rfReplaceAll]);
    SQLStr := SQLStr + ' and dokuman  LIKE :SrcText ';
  end;

	SQLStr := SQLStr + ' ORDER BY dokuman';

  mainmod.qDokuman.SQL.Text := SQLStr;

  mainmod.qDokuman.ParamByName('mc_id').AsString := inttostr(mainmod.MCID);
  mainmod.qDokuman.ParamByName('md_id').AsString := qMain.FieldByName('id').AsString ;
  if mainmod.qDokuman.FindParam('SrcText') <> nil then
    mainmod.qDokuman.ParamByName('SrcText').AsString := SrcText ;

  mainmod.qDokuman.Open;

//	QueryOpen(MainMod.qDokuman, SQLStr);
  ManageSettings;
end;

procedure TfrKVKKVeriDokumanListe.pnlTopAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
var
  Base : Integer;
  NewW : Integer;
begin
  if EventName = 'doResize' then
  begin
    Base := pnlTop.Width - 25;
    NewW := Trunc(Base * 0.4);
    if NewW < 300 then NewW := 300;
    grdDoc.Columns[0].Width := NewW;
    NewW := Trunc(Base * 0.6);
    if NewW < 400 then NewW := 400;
    grdDoc.Columns[1].Width := NewW;
  end;
end;

function TfrKVKKVeriDokumanListe.ProcessTemplate(ATmpName: String; ADOCXRpt : TrXMLReport = nil): String;
var
  FUrl    : String;
begin
  if ADOCXRpt = nil then
    raise Exception.Create('Dosya indirmede hata oluþtu.');

  QueryOpen(mainmod.qTmp,' select DISTINCT k.kisi kisi_str,t.tanim,t.description '+
    ' from def_data_aydinlatma t,def_data_kisi k  where  k.id=t.kisi_id and t.mc_id='+IntToStr(mainmod.MCID) +
    ' ORDER BY k.kisi ' );
  DefVariables(ADOCXRpt.Variables);
  try
    ADOCXRpt.ReportFile := ServerMod.FilesFolderPath + 'temp\' + ATmpName; // Template file name
    ADOCXRpt.OutputFile := ServerMod.NewCacheFileUrl(False, 'docx', '', '', FUrl, True);
    ADOCXRpt.Execute([mainmod.qTmp]);
  except on E: Exception do
    begin
      ShowMessageN('Hata..'#13 + E.Message);
      Exit;
    end;
  end;
  Result := ADOCXRpt.OutputFile;
end;

procedure TfrKVKKVeriDokumanListe.qMainAfterScroll(DataSet: TDataSet);
begin
  if DataLoading then Exit;

  NewSQL;
  ManageSettings;
end;

procedure TfrKVKKVeriDokumanListe.UniFrameCreate(Sender: TObject);
begin
  DataLoading := True;
  QueryOpen(qMain, 'SELECT * FROM def_data_dokumantip WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY dokumantip');
  DataLoading := False;
  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;

end;

initialization
  RegisterClass(TrXMLReport);
  RegisterClass(TfrKVKKVeriDokumanListe);

end.
