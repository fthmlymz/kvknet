unit unDeptUygulamaProseduru;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Data.DB, DBAccess, Uni,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIFrame, uniBasicGrid, uniDBGrid,
  uniMultiItem, uniComboBox, uniButton, uniBitBtn, uniLabel, uniEdit, uniGUIBaseClasses, uniPanel,
  System.Actions, Vcl.ActnList, uniMenuButton, Vcl.Menus, uniMainMenu, MemDS, VirtualTable,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report, FlexCel.Render, rXMLReport,
  uniImage, frxClass, frxDBSet, frxExportBaseDialog, frxExportXLS, frxExportDOCX, frxExportPDF;

type
  TfrDeptUygulamaProseduru = class(TUniFrame)
    ActList: TActionList;
    actSearch: TAction;
    actClose: TAction;
    pnlTop: TUniPanel;
    ppmDownload: TUniPopupMenu;
    ppmiAydinlatmaMetni: TUniMenuItem;
    ppmiAcikRizaBeyani: TUniMenuItem;
    DOCXRpt: TrXMLReport;
    ListeyiExceleKaydet1: TUniMenuItem;
    qTmp: TUniQuery;
    pnlNav: TUniPanel;
    UniLabel3: TUniLabel;
    edSrcDept: TUniComboBox;
    btnSearch: TUniBitBtn;
    btnHelp: TUniBitBtn;
    btnClose: TUniBitBtn;
    procedure UniFrameCreate(Sender: TObject);
    procedure edSrcTipiChange(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure edSrcIysChange(Sender: TObject);
    procedure DOCXRptUserCalc(Sender: TObject; var CalcStr: string; var Replace: Boolean);
    procedure btnHelpClick(Sender: TObject);
    procedure UniFrameDestroy(Sender: TObject);
  private
    DeptIdList: TStringList;
    procedure NewSQL;
    procedure ManageSettings;
    procedure DefVariables(VL: TStrings);
  public
  end;

implementation

{$R *.dfm}

uses MainModule, ServerModule, McMLib, Main, unAydinlatmaSablonTanim, unHelpPage,
  unAydinlatmaSablonTopluIslem;

const
  ParantezAc    : String = #13'(';
  ParantezKapat : String = ')'#13;

procedure TfrDeptUygulamaProseduru.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrDeptUygulamaProseduru.actSearchExecute(Sender: TObject);
var
  TmpName : String;
  FUrl    : String;
begin
  if edSrcDept.ItemIndex <= 0 then
  begin
    MessageDlg('Lütfen departman seçiniz.', mtError, [mbOk]);
    Exit;
  end;

  NewSQL;

  DefVariables(DOCXRpt.Variables);


  try
    DOCXRpt.ReportFile := ServerMod.FilesFolderPath + 'temp\P_52.docx'; // Template file name
    DOCXRpt.OutputFile := ServerMod.NewCacheFileUrl(False, 'docx', '', '', FUrl, True);
    DOCXRpt.Execute([qTmp]);

  except on E: Exception do
    begin
      ShowMessageN('Hata..'#13 + E.Message);
      Exit;
    end;
  end;

  UniSession.SendFile(DOCXRpt.OutputFile, edSrcDept.Text + ' BÝRÝM PROSEDÜRÜ.docx');

end;

procedure TfrDeptUygulamaProseduru.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('DeptUygulamaProseduru');
end;

procedure TfrDeptUygulamaProseduru.DefVariables(VL: TStrings);
begin
  VL.Clear;
  VL.Add('DEPARTMENTNAME'       + '=' + Trim(edSrcDept.Text));
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
  VL.Add('PERSONOFINTEREST'     + '=' + Trim(qTmp.FieldByName('kisi_str').AsString));
//  VL.Add('TXTWEBSITEINFO_EN'       + '=@@'); // Trim(MainMod.qMCDef.FieldByName('krm_').AsString));
//  VL.Add('TXTWEBSITEINFO_TR'       + '=' + Trim(MainMod.qMCDef.FieldByName('krm_web2').AsString));
//  VL.Add('TXTWEBSITEINFOACCEPT_TR' + '=' + Trim(MainMod.qMCDef.FieldByName('krm_web3').AsString));
end;

procedure TfrDeptUygulamaProseduru.DOCXRptUserCalc(Sender: TObject; var CalcStr: string; var Replace: Boolean);
var
  TagValue : String;
begin
  Replace  := True;
  TagValue := AnsiUpperCase(CalcStr);

  if TagValue = 'COMPANYLOGO' then TagValue := MainForm.GetLogoFileName
  else Replace := False;

  if Replace then CalcStr := TagValue;
end;

procedure TfrDeptUygulamaProseduru.edSrcIysChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrDeptUygulamaProseduru.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrDeptUygulamaProseduru.edSrcTipiChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrDeptUygulamaProseduru.ManageSettings;
begin
  actClose.Enabled  := not DataEditing(MainMod.qAydinlatma);
end;

procedure TfrDeptUygulamaProseduru.NewSQL;
var
	SQLStr,
  srcText,
	WhereStr : string;
begin
	SQLStr   := 'SELECT ayd.*, ks.kisi as kisi_str FROM def_data_aydinlatma ayd ' +
              'LEFT JOIN def_data_kisi ks ON ks.id = ayd.kisi_id ';

	WhereStr := 'ayd.mc_id = ' + IntToStr(MainMod.MCID) + ' AND ayd.durum = ''YAYINDA'' AND ';

  if edSrcDept.ItemIndex > 0 then
  begin
    WhereStr := WhereStr + 'ayd.kisi_id in (SELECT env.kisi_id FROM data_envanter env ' +
                'WHERE env.kisi_id=ayd.kisi_id and env.active=''E'' and env.dept_id = ' + deptIdList[edSrcDept.ItemIndex] + ') AND ';
  end;

	if Trim(WhereStr) <> '' then System.Delete(WhereStr, Length(WhereStr) - 3, 4);
	if Trim(WhereStr) <> '' then SQLStr := SQLStr + 'WHERE ' + WhereStr;
	SQLStr := SQLStr + ' ORDER BY ayd.tanim';

  QueryOpen(qtmp, sqlstr);
  ManageSettings;
end;


procedure TfrDeptUygulamaProseduru.UniFrameCreate(Sender: TObject);
begin
  edSrcDept.Items.Clear;
  edSrcDept.Items.Add('-- DEPARTMAN SEÇÝNÝZ --');
  deptIdList := TSTringList.Create;
  deptIdList.Add('0');

  if mainmod.LoginInfo.Birimler <> '' then
    QueryOpen(qTmp, ' SELECT dp.id, ' +
                    ' (case when coalesce(dp.main_dept_id,0) > 0 then dp.title||'' (''||dp_main.title||'') '' ' +
                    ' else dp.title end)::character varying (450) title ' +
                    ' FROM sys_deptdef dp left join sys_deptdef dp_main on dp_main.id = dp.main_dept_id ' +
                    ' WHERE dp.id in ('+ mainmod.LoginInfo.Birimler +  ') ' +
                    ' AND dp.mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY dp.title')

  else
    QueryOpen(qTmp, ' SELECT dp.id, ' +
                    ' (case when coalesce(dp.main_dept_id,0) > 0 then dp.title||'' (''||dp_main.title||'') '' ' +
                    ' else dp.title end)::character varying (450) title ' +
                    ' FROM sys_deptdef dp left join sys_deptdef dp_main on dp_main.id = dp.main_dept_id ' +
                    ' WHERE dp.active =''E'' and dp.id in (0) ' +
                    ' AND dp.mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY dp.title') ;

   qTmp.First;
  while not qTmp.Eof do
  begin
    edSrcDept.Items.Add(qTmp.FieldByName('title').AsString);
    deptIdList.Add(qTmp.FieldByName('id').AsString);
    qTmp.Next;
  end;

  edSrcDept.ItemIndex := 0;

  NewSQL;
  ManageSettings;
end;

procedure TfrDeptUygulamaProseduru.UniFrameDestroy(Sender: TObject);
begin
  DeptIdList.Free;
end;

initialization
  RegisterClass(TfrDeptUygulamaProseduru);

end.
