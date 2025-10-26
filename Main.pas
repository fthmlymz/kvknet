unit Main;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIFrame,
  uniImage, uniButton, uniLabel, uniGUIBaseClasses, uniPanel, Vcl.Menus, uniMainMenu, uniImageList,
  uniTimer, uniPageControl, uniBitBtn, uniStatusBar, uniSplitter, uniMultiItem, uniComboBox, uniToolBar,
  uniTreeView, uniMenuButton, uniSpeedButton, uniDBImage, Data.DB, DBAccess, Uni,System.IniFiles,dateutils;
type
  TMainForm = class(TUniForm)
    pnlTop: TUniPanel;
    lbGroupName: TUniLabel;
    lbCompName: TUniLabel;
    mmiGrupFirmaBilgileri: TUniMenuItem;
    mmiVeriSorumlusuBilgileri: TUniMenuItem;
    imgToolbar: TUniNativeImageList;
    UniNativeImageList2: TUniNativeImageList;
    pnlMain: TUniContainerPanel;
    PgControl: TUniPageControl;
    tsHome: TUniTabSheet;
    StatusBar: TUniStatusBar;
    Splitter: TUniSplitter;
    pnlNavTree: TUniPanel;
    NavTree: TUniTreeView;
    ToolBar: TUniToolBar;
    btnExpandAll: TUniToolButton;
    btnCollapseAll: TUniToolButton;
    UniToolButton3: TUniToolButton;
    btnCloseAllTabs: TUniToolButton;
    edSearchMenu: TUniComboBox;
    pnlToolBar: TUniPanel;
    ppmUser: TUniPopupMenu;
    ppmiSelectComp: TUniMenuItem;
    N1: TUniMenuItem;
    ppmiChangePwd: TUniMenuItem;
    N2: TUniMenuItem;
    ppmiUserLogout: TUniMenuItem;
    ppmiChangeTheme: TUniMenuItem;
    btnUserSettings: TUniMenuButton;
    tmrClock: TUniTimer;
    mmiKullaniciTanimlari: TUniMenuItem;
    mmiRolTanimlari: TUniMenuItem;
    mmiDepartmanTanimlari: TUniMenuItem;
    pnlMenu: TUniPanel;
    mmiKVKKSurecler: TUniMenuItem;
    mmiKVKKVeriKaynaklari: TUniMenuItem;
    mmiKVKKVeriKategorisi: TUniMenuItem;
    mmiKVKKVeriKonusuKisi: TUniMenuItem;
    mmiKVKKAmaclar: TUniMenuItem;
    mmiKVKKVeriPaylasimTaraflari: TUniMenuItem;
    mmiKVKKVeriPaylasimMetodlari: TUniMenuItem;
    mmiKVKKHukukiDayanaklar: TUniMenuItem;
    mmiKVKKGuvenlikTedbirleri: TUniMenuItem;
    mmiKVKKDokumanTipleri: TUniMenuItem;
    mmiKVKKVeriTipleri: TUniMenuItem;
    mmiKVKKDokumanSablonlari: TUniMenuItem;
    mmiKVKKEkipman: TUniMenuItem;
    mmiEnvanterFormlari: TUniMenuItem;
    mmiKontrolFormlari: TUniMenuItem;
    imgLogo: TUniDBImage;
    dsMCDef: TUniDataSource;
    mmiVSBasvuruFormlari: TUniMenuItem;
    mmiVSDepartmanFormlari: TUniMenuItem;
    mmiAydinlatmaMetniSablonlari: TUniMenuItem;
    mmiAcikRizaKayitlari: TUniMenuItem;
    ppmiLicenceInfo: TUniMenuItem;
    mmiRptVKImhaRaporu: TUniMenuItem;
    mmiUnvanTanimlari: TUniMenuItem;
    mmiErisimYetkiTanimlari: TUniMenuItem;
    mmiRptYetkiMatrisi: TUniMenuItem;
    mmiDuyurular: TUniMenuItem;
    mmiOzelOnaySablonlari: TUniMenuItem;
    mmiRptVKImhaGecmisi: TUniMenuItem;
    mmKurumParametreleri: TUniMenuItem;
    YardmListesi1: TUniMenuItem;
    mmiVerbisRaporlariToplu: TUniMenuItem;
    mmiVerbisRaporArsivi: TUniMenuItem;
    mmiYetkiMatrisiLoglari: TUniMenuItem;
    mmiEnvanterLoglari: TUniMenuItem;
    mmiSMSLoglari: TUniMenuItem;
    mmiZamanDamgasiLoglari: TUniMenuItem;
    mmiKullaniciGirisLoglari: TUniMenuItem;
    mmiDetayliEnvanterListesi: TUniMenuItem;
    KontrolListesiLoglar1: TUniMenuItem;
    mEdanismanSoru: TUniMenuItem;
    EDanmanSoruSetleri1: TUniMenuItem;
    DepartmanFonksiyonTanmlar1: TUniMenuItem;
    EDanmanSoruSetiCevapla1: TUniMenuItem;
    DepartmanKVKKUygulamaProsedrleri1: TUniMenuItem;
    mmiDestek: TUniMenuItem;
    pnlVersion: TUniPanel;
    MainMenu: TUniMainMenu;
    EnvanterYnetimi1: TUniMenuItem;
    AydnlatmaAkRzaYnetimi1: TUniMenuItem;
    lgiliKiiBavuruYnetimi1: TUniMenuItem;
    YetkiMatrisYnetimi1: TUniMenuItem;
    DkmanablonYnetimi1: TUniMenuItem;
    Verbis1: TUniMenuItem;
    mhaYnetimi1: TUniMenuItem;
    RiskYnetimi1: TUniMenuItem;
    KvkkPortal1: TUniMenuItem;
    Edanmanlk1: TUniMenuItem;
    mmilogKontrol: TUniMenuItem;
    mmiKurumTanimlari: TUniMenuItem;
    Yardm1: TUniMenuItem;
    mmikvkPortal: TUniMenuItem;
    UniPanel1: TUniPanel;
    btnDgrNet: TUniBitBtn;
    mmiVeriTipiAnalizFormu: TUniMenuItem;
    mmiKVKKNETSurecRiskTanim: TUniMenuItem;
    SreRiskMevcudDurum1: TUniMenuItem;
    mmiRiskTanimlari: TUniMenuItem;
    mmIhlalYonetimi: TUniMenuItem;
    mmiIhlalOlaylari: TUniMenuItem;
    mmiIhlalBildirimi: TUniMenuItem;
    PortalSayfaAyar1: TUniMenuItem;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
    procedure btnExpandAllClick(Sender: TObject);
    procedure btnCollapseAllClick(Sender: TObject);
    procedure btnCloseAllTabsClick(Sender: TObject);
    procedure edSearchMenuTriggerEvent(Sender: TUniCustomComboBox; AButtonId: Integer);
    procedure edSearchMenuChange(Sender: TObject);
    procedure tmrClockTimer(Sender: TObject);
    procedure NavTreeClick(Sender: TObject);
    procedure NavTreeLoaded(Sender: TObject);
    procedure PgControlChange(Sender: TObject);
    procedure TabSheetClose(Sender: TObject; var AllowClose: Boolean);
    procedure ppmiSelectCompClick(Sender: TObject);
    procedure ppmiLicenceInfoClick(Sender: TObject);
    procedure ppmiChangePwdClick(Sender: TObject);
    procedure ppmiUserLogoutClick(Sender: TObject);
    // Kurum Tanımları
    procedure mmiGrupFirmaBilgileriClick(Sender: TObject);
    procedure mmiVeriSorumlusuBilgileriClick(Sender: TObject);
    procedure mmiDepartmanTanimlariClick(Sender: TObject);
    procedure mmiUnvanTanimlariClick(Sender: TObject);
    procedure mmiKullaniciTanimlariClick(Sender: TObject);
    procedure mmiRolTanimlariClick(Sender: TObject);
    procedure mmiDuyurularClick(Sender: TObject);
    // Genel Tanımlar
    procedure mmiKVKKSureclerClick(Sender: TObject);
    procedure mmiKVKKVeriKaynaklariClick(Sender: TObject);
    procedure mmiKVKKVeriKategorisiClick(Sender: TObject);
    procedure mmiKVKKVeriTipleriClick(Sender: TObject);
    procedure mmiKVKKVeriKonusuKisiClick(Sender: TObject);
    procedure mmiKVKKVeriPaylasimTaraflariClick(Sender: TObject);
    procedure mmiKVKKGuvenlikTedbirleriClick(Sender: TObject);
   // procedure mmiKVKKVeriOnemDerecesiClick(Sender: TObject);
    procedure mmiKVKKEkipmanClick(Sender: TObject);
    procedure mmiKVKKDokumanSablonlariClick(Sender: TObject);
    // Formlar
    procedure mmiEnvanterFormlariClick(Sender: TObject);
    procedure mmiKontrolFormlariClick(Sender: TObject);
    procedure mmiVSBasvuruFormlariClick(Sender: TObject);
    procedure mmiVSDepartmanFormlariClick(Sender: TObject);
    procedure mmiAydinlatmaMetniSablonlariClick(Sender: TObject);
    procedure mmiAcikRizaKayitlariClick(Sender: TObject);
    procedure mmiErisimYetkiTanimlariClick(Sender: TObject);
    procedure mmiOzelOnaySablonlariClick(Sender: TObject);
    procedure mmiKVKKAmaclarClick(Sender: TObject);
    procedure mmiKVKKVeriPaylasimMetodlariClick(Sender: TObject);
    procedure mmiKVKKHukukiDayanaklarClick(Sender: TObject);
  //  procedure mmiKVKKKontrolSonuclariClick(Sender: TObject);
    procedure mmiKVKKDokumanTipleriClick(Sender: TObject);
    procedure mmiRptVKImhaRaporuClick(Sender: TObject);
    procedure mmiRptVKImhaGecmisiClick(Sender: TObject);
  //  procedure mmiRptRiskAnalizRaporuClick(Sender: TObject);
    procedure mmiRptYetkiMatrisiClick(Sender: TObject);
    procedure mmKurumParametreleriClick(Sender: TObject);
    procedure YardmListesi1Click(Sender: TObject);
    procedure mmiVerbisRaporlariTopluClick(Sender: TObject);
    procedure mmiVerbisRaporArsiviClick(Sender: TObject);
    procedure mmiYetkiMatrisiLoglariClick(Sender: TObject);
    procedure mmiEnvanterLoglariClick(Sender: TObject);
    procedure mmiSMSLoglariClick(Sender: TObject);
    procedure mmiZamanDamgasiLoglariClick(Sender: TObject);
    procedure mmiKullaniciGirisLoglariClick(Sender: TObject);
    procedure mmiDetayliEnvanterListesiClick(Sender: TObject);
    procedure KontrolListesiLoglar1Click(Sender: TObject);
    procedure mEDanismanSoruClick(Sender: TObject);
    procedure EDanmanSoruSetleri1Click(Sender: TObject);
    procedure DepartmanFonksiyonTanmlar1Click(Sender: TObject);
    procedure EDanmanSoruSetiCevapla1Click(Sender: TObject);
    procedure DepartmanKVKKUygulamaProsedrleri1Click(Sender: TObject);
    procedure mmiDestekClick(Sender: TObject);
    procedure pnlVersionClick(Sender: TObject);
    procedure btnDgrNetClick(Sender: TObject);
    procedure mmikvkPortalClick(Sender: TObject);
    procedure mmiVeriTipiAnalizFormuClick(Sender: TObject);
    procedure mmiKVKKNETSurecRiskTanimClick(Sender: TObject);
    procedure SreRiskMevcudDurum1Click(Sender: TObject);
    procedure mmiRiskTanimlariClick(Sender: TObject);
    procedure mmKisiselVerihlalOlaylarClick(Sender: TObject);
    procedure mmKisiselVerihlalBildirimiClick(Sender: TObject);
    procedure mmiIhlalOlaylariClick(Sender: TObject);
    procedure mmiIhlalBildirimiClick(Sender: TObject);
    procedure UniFormAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
    procedure UniFormReady(Sender: TObject);
    procedure toggleSqMonitorchange(Sender: TComponent; AResult:Integer; AText: string);
    procedure PortalSayfaAyar1Click(Sender: TObject);
  private
    PSString  : String;
    IsLoading : Boolean;
    DashBoard : TUniFrame;
    sayac : integer;
    DgrNetLink : string;
    procedure ShowDashboard;
    procedure RefreshTime;
    function FindMenuItem(ACaption: String): TUniMenuItem;
    procedure SetMenuVisible(AItem: TUniMenuItem);
    procedure AddSubTree(AItem: TUniMenuItem; ANode: TUniTreeNode);
    procedure PrepareMainMenu;
    procedure PrepareMenuTree;
    procedure SearchMenuTree(const AText: string);
    procedure LogOutControl(Sender: TComponent; Res: Integer);
    procedure ChangeCompanyControl(Sender: TComponent; Res: Integer);
    procedure PrepareThemes;
    procedure ThemeSubMenu(AText, AName: String);
    procedure ChangeTheme(Sender: TObject);
    procedure ShowSqlLogForm;
    procedure ShowSysParameter(Sender: TComponent; AResult: Integer; AText: string);
    function checkPassword(Atext: string): boolean;
    function GenerateTodayPassword: string;
  public
    VersiyonNo: String;
    procedure DashboardCall(AMenuItem: TUniMenuItem);
    function GetTabSheet(AClassName: String): TUniTabSheet;
    function GetLogoFileName: String;
  end;
function MainForm: TMainForm;
implementation
{$R *.dfm}
uses
  uniGUIVars, MainModule, ServerModule, uniGUIApplication, uniGUITheme, uniStrUtils, McMLib,
  unDashboard, unSifreDegistir, unFirmaSec, unFirmaTanim, unKurumGrupTanim, unRolKullaniciTurSec, unLicenceInfo,
  unParametreMCTanim, unHelpPage, unHelpListe, unRptErisimYetkiLog, unRptChecklistLog,
  unRptEnvanterLog, unRptSMSLog, unRptTimeStampLog, unRptLoginLog, unSurumNot,unIKCUSSOLib,unkvkkportal,
  unVeriTipiAnalizIslemleri,unRiskListeSurec, unRiskSurecMevcutDurum,
  UnRiskTanim, UriskListe,UnIhlalOlayiTanim, unIhlalOlayiListe,
  unIhlalOlayiBildirimListe, unMailUtils, unSQLLog, unPortalSetting;
function MainForm: TMainForm;
begin
  Result := TMainForm(MainMod.GetFormInstance(TMainForm));
end;
procedure TMainForm.TabSheetClose(Sender: TObject; var AllowClose: Boolean);
var
  Ts : TUniTabSheet;
  Nd : TUniTreeNode;
begin
  Ts := Sender as TUniTabSheet;
  Nd := Pointer(Ts.Tag);
  if Assigned(Nd) then
  begin
    Nd.Data := nil;
    if NavTree.Selected = Nd then
      NavTree.Selected := nil;
  end;
end;
procedure TMainForm.ThemeSubMenu(AText, AName: String);
var
  M : TUniMenuItem;
begin
  M := TUniMenuItem.Create(Self);
  M.Caption    := AText;
  M.Hint       := AName;
  M.OnClick    := ChangeTheme;
  ppmiChangeTheme.Add(M);
  // M.Tag        := UniInteger(ANode);
  // M.ImageIndex := ANode.ImageIndex;
end;
procedure TMainForm.AddSubTree(AItem: TUniMenuItem; ANode: TUniTreeNode);
var
  i  : Integer;
  Nd : TUniTreeNode;
begin
  if AItem.Visible then
  begin
    Nd := NavTree.Items.Add(ANode, AItem.Caption);
    if AItem.Count > 0 then
    begin
      for i := 0 to AItem.Count - 1 do AddSubTree(AItem.Items[i], Nd);
    end;
  end;
end;
procedure TMainForm.btnCloseAllTabsClick(Sender: TObject);
var
  I: Integer;
  Ts : TUniTabSheet;
begin
  for I := PgControl.PageCount - 1 downto 0 do
  begin
    Ts := PgControl.Pages[I];
    if Ts.Closable then Ts.Close;
  end;
end;
procedure TMainForm.btnCollapseAllClick(Sender: TObject);
begin
  NavTree.FullCollapse;
end;
procedure TMainForm.btnExpandAllClick(Sender: TObject);
begin
  NavTree.FullExpand;
end;
procedure TMainForm.ChangeCompanyControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;
  btnCloseAllTabsClick(btnCloseAllTabs);
  if frmFirmaSec.Select > 0 then
  begin
    lbGroupName.Caption := MainMod.GCTitle;
    lbCompName.Caption  := MainMod.MCTitle;
    TfrDashBoard(DashBoard).DshTimer.Enabled := True;
  end;
end;
procedure TMainForm.ChangeTheme(Sender: TObject);
begin
  MainMod.Theme := TMenuItem(Sender).Hint;
end;
procedure TMainForm.DashboardCall(AMenuItem: TUniMenuItem);
var
  Nd : TUniTreeNode;
begin
  Nd := NavTree.Items.FindNodeByCaption(AMenuItem.Caption);
  if Assigned(Nd) then
  begin
    NavTree.Selected := Nd;
    NavTreeClick(NavTree);
  end;
end;
procedure TMainForm.DepartmanFonksiyonTanmlar1Click(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  Ts  := GetTabSheet('TfrmFonksiyonListe');
  //todo: yetkilendirme
end;
procedure TMainForm.DepartmanKVKKUygulamaProsedrleri1Click(Sender: TObject);
var
  Ts  : TUniTabSheet;
  FrC : TUniFrameClass;
begin
  Ts  := GetTabSheet('TfrDeptUygulamaProseduru');
  //todo: yetkilendirme
end;
procedure TMainForm.EDanmanSoruSetiCevapla1Click(Sender: TObject);
var
  Ts  : TUniTabSheet;
  FrC : TUniFrameClass;
begin
  Ts  := GetTabSheet('TfrmEDanismanSoruSetiCevaplaListe');
  //todo: yetkilendirme
end;
procedure TMainForm.EDanmanSoruSetleri1Click(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  Ts  := GetTabSheet('TfrmEDanismanSoruSetiListe');
  //todo: yetkilendirme
end;
procedure TMainForm.SetMenuVisible(AItem: TUniMenuItem);
var
  i : Integer;
  VC : Integer;
  function VisibleItemCount(AItem: TUniMenuItem): Integer;
  var
    j, Tmp : Integer;
  begin
    Tmp := 0;
    for j := 0 to AItem.Count - 1 do
    begin
      if AItem.Items[j].Visible then Inc(Tmp);
    end;
    Result := Tmp;
  end;
begin
  if AItem.Count <= 0 then
  begin
    AItem.Visible := MainMod.LoginInfo.Yetkiler[AItem.HelpContext];
  end
  else
  begin
    for i := 0 to AItem.Count - 1 do
    begin
      SetMenuVisible(AItem.Items[i]);
    end;
    VC := VisibleItemCount(AItem);
    AItem.Visible := VC > 0;
  end;
end;
procedure TMainForm.ShowDashboard;
var
  DBC : TUniFrameClass;
begin
  if Assigned(DashBoard) then Exit;
  DBC := TUniFrameClass(FindClass('TfrDashboard'));
  DashBoard  := DBC.Create(Self);
  DashBoard.Align := alClient;
  DashBoard.Parent := tsHome;
end;
procedure TMainForm.SreRiskMevcudDurum1Click(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  Ts  := GetTabSheet('TfrRiskSurecMevcutDurum');
end;
procedure TMainForm.mmiSMSLoglariClick(Sender: TObject);
begin
  RptSMSLog.Exec(0);
end;
procedure TMainForm.tmrClockTimer(Sender: TObject);
begin
  RefreshTime;
//  inc(sayac);
//  if sayac = 8 then
//  begin
//    mainmod.NoActiveSessionDel;
//    mainmod.HeartBeat;
//    sayac := 0;
//  end;
end;
function TMainForm.FindMenuItem(ACaption: String): TUniMenuItem;
var
  i : Integer;
begin
  Result := nil;
  for i := 0 to MainForm.ComponentCount - 1 do
  begin
    if MainForm.Components[i] is TUniMenuItem then
    begin
      if TUniMenuItem(MainForm.Components[i]).Caption = ACaption then
      begin
        Result := TUniMenuItem(MainForm.Components[i]);
        Break;
      end;
    end;
  end;
end;
function TMainForm.GetLogoFileName: String;
var
  TmpName ,
  FUrl    ,
  FExt    : String;
begin
  FExt := MainMod.qMCDef.FieldByName('krm_logo_type').AsString;
  if MainMod.qMCDef.FieldByName('krm_logo').IsNull or (MainMod.qMCDef.FieldByName('krm_logo_type').AsString = '') then
  begin
    result := ServerMod.FilesFolderPath + 'images\bos.png';
    exit;
  end;
  try
    TmpName := ServerMod.NewCacheFileUrl(False, FExt, '', '', FUrl, True);
    MainForm.imgLogo.Picture.Graphic.SaveToFile(TmpName);
    Result := TmpName;
  except
//    Result := '';  //word hata veriyor
    result := ServerMod.FilesFolderPath + 'images\bos.png';
  end;
end;
function TMainForm.GetTabSheet(AClassName: String): TUniTabSheet;
var
  Nd  : TUniTreeNode;
  Ts  : TUniTabSheet;
  FrC : TUniFrameClass;
  Fr  : TUniFrame;
begin
  Nd := NavTree.Selected;
  Ts := Nd.Data;
  if not Assigned(Ts) then
  begin
    Ts := TUniTabSheet.Create(Self);
    Ts.PageControl := PgControl;
    Ts.Closable := True;
    Ts.OnClose := TabSheetClose;
    Ts.Tag := NativeInt(Nd);
    Ts.Caption := Nd.Text;
    Ts.ImageIndex := Nd.ImageIndex;
    FrC := TUniFrameClass(FindClass(AClassName));
    Fr  := FrC.Create(Self);
    Fr.Align := alClient;
    Fr.Parent := Ts;
    Nd.Data := Ts;
  end;
  PgControl.ActivePage := Ts;
  Result := Ts;
end;

procedure TMainForm.mmKisiselVerihlalBildirimiClick(Sender: TObject);
var
  ts : TUniTabSheet;
begin
  ts := GetTabSheet('TfrmIhlalOlayiBildirimListe');
end;
procedure TMainForm.mmKisiselVerihlalOlaylarClick(Sender: TObject);
var
  Ts : TUniTabSheet;
begin
  Ts  := GetTabSheet('TfrmIhlalOlayiListe');
end;
procedure TMainForm.KontrolListesiLoglar1Click(Sender: TObject);
begin
  RptChecklistLog.Exec(0);
end;
procedure TMainForm.mmiKullaniciGirisLoglariClick(Sender: TObject);
begin
  RptLoginLog.Exec(0);
end;
procedure TMainForm.LogOutControl(Sender: TComponent; Res: Integer);
begin
  if Res = mrYes then
  begin
  try
   MainMod.DeleteUserSession(MainMod.LoginInfo.ID);
    ServerMod.RemoveUserSession( UniSession.SessionID);
  except
    ;
  end;
  Close;
  end;
end;
procedure TMainForm.mmiRptVKImhaRaporuClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  Ts  := GetTabSheet('TfrRptVKImhaRaporu');
end;
procedure TMainForm.mmiRptVKImhaGecmisiClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  Ts  := GetTabSheet('TfrRptVKImhaGecmisi');
end;
procedure TMainForm.mEDanismanSoruClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
//  if not MainMod.CheckPacket(TControl(Sender).Tag) then
//  begin
//    MessageDlg('Erişmeye çalıştığınız modüller, sahip olduğunuz PAKET LİSANSI''na dahil değil.'#13 +
//               'Bu modülleri kullanmak için paketinizi yükseltmeniz gerekir.'#13 +
//               'Lütfen sistem yöneticiniz ile irtibata geçiniz.', mtInformation, [mbOk]);
//    Exit;
//  end;
//
  Ts  := GetTabSheet('TfrmEDanismanSoruListe');
  //todo: yetkilendirme
end;
procedure TMainForm.mmiAcikRizaKayitlariClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  if not MainMod.CheckPacket(TControl(Sender).Tag) then
  begin
    MessageDlg('Erişmeye çalıştığınız modüller, sahip olduğunuz PAKET LİSANSI''na dahil değil.'#13 +
               'Bu modülleri kullanmak için paketinizi yükseltmeniz gerekir.'#13 +
               'Lütfen sistem yöneticiniz ile irtibata geçiniz.', mtInformation, [mbOk]);
    Exit;
  end;
    if  mainmod.LoginInfo.Birimler = '' then
  begin
    MessageDlg('Kullanıcınıza yetkili departman tanımlanmadığı için ilgili Açık Rızaları göremezsiniz. Lütfen kurum yetkilisi ile iletişime geçiniz.', mtError, [mbOk]);
    exit;
  end;
  Ts  := GetTabSheet('TfrAcikRizaKayitListe');
end;
procedure TMainForm.mmiAydinlatmaMetniSablonlariClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  if not MainMod.CheckPacket(TControl(Sender).Tag) then
  begin
    MessageDlg('Erişmeye çalıştığınız modüller, sahip olduğunuz PAKET LİSANSI''na dahil değil.'#13 +
               'Bu modülleri kullanmak için paketinizi yükseltmeniz gerekir.'#13 +
               'Lütfen sistem yöneticiniz ile irtibata geçiniz.', mtInformation, [mbOk]);
    Exit;
  end;
  Ts  := GetTabSheet('TfrAydinlatmaSablonListe');
end;
procedure TMainForm.mmiDepartmanTanimlariClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  Ts  := GetTabSheet('TfrDepartmanListe');
end;
procedure TMainForm.mmiDestekClick(Sender: TObject);
begin
  UniSession.BrowserWindow('https://destek.aryomyazilim.com', 0, 0, '_blank');
end;
procedure TMainForm.mmiDetayliEnvanterListesiClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  if not MainMod.CheckPacket(TControl(Sender).Tag) then
  begin
    MessageDlg('Erişmeye çalıştığınız modüller, sahip olduğunuz PAKET LİSANSI''na dahil değil.'#13 +
               'Bu modülleri kullanmak için paketinizi yükseltmeniz gerekir.'#13 +
               'Lütfen sistem yöneticiniz ile irtibata geçiniz.', mtInformation, [mbOk]);
    Exit;
  end;
  Ts  := GetTabSheet('TfrDetayEnvanterListe');
end;
procedure TMainForm.mmiDuyurularClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  Ts  := GetTabSheet('TfrDuyuruListe');
end;
procedure TMainForm.mmiEnvanterFormlariClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  if not MainMod.CheckPacket(TControl(Sender).Tag) then
  begin
    MessageDlg('Erişmeye çalıştığınız modüller, sahip olduğunuz PAKET LİSANSI''na dahil değil.'#13 +
               'Bu modülleri kullanmak için paketinizi yükseltmeniz gerekir.'#13 +
               'Lütfen sistem yöneticiniz ile irtibata geçiniz.', mtInformation, [mbOk]);
    Exit;
  end;
  Ts  := GetTabSheet('TfrEnvanterListe2');
end;
procedure TMainForm.mmiErisimYetkiTanimlariClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
//  if not MainMod.CheckPacket(TControl(Sender).Tag) then
//  begin
//    MessageDlg('Erişmeye çalıştığınız modüller, sahip olduğunuz PAKET LİSANSI''na dahil değil.'#13 +
//               'Bu modülleri kullanmak için paketinizi yükseltmeniz gerekir.'#13 +
//               'Lütfen sistem yöneticiniz ile irtibata geçiniz.', mtInformation, [mbOk]);
//    Exit;
//  end;
  Ts  := GetTabSheet('TfrErisimYetkiListe');
end;
procedure TMainForm.mmiVerbisRaporlariTopluClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  Ts  := GetTabSheet('TfrRptVerbisListeler');
end;
procedure TMainForm.mmikvkPortalClick(Sender: TObject);
begin
 frmkvkkPortal.ShowModal;
  //frmFirmaTanim.ShowModal;
end;
procedure TMainForm.mmiVeriSorumlusuBilgileriClick(Sender: TObject);
begin
frmFirmaTanim.ShowModal;
end;
procedure TMainForm.mmiVeriTipiAnalizFormuClick(Sender: TObject);
var
  Ts   : TUniTabSheet;
begin
  Ts  := GetTabSheet('TfrmVeriTipiAnalizIslemleri');
end;
procedure TMainForm.mmiVSBasvuruFormlariClick(Sender: TObject);
var
  Ts   : TUniTabSheet;
begin
  if not MainMod.CheckPacket(TControl(Sender).Tag) then
  begin
    MessageDlg('Erişmeye çalıştığınız modüller, sahip olduğunuz PAKET LİSANSI''na dahil değil.'#13 +
               'Bu modülleri kullanmak için paketinizi yükseltmeniz gerekir.'#13 +
               'Lütfen sistem yöneticiniz ile irtibata geçiniz.', mtInformation, [mbOk]);
    Exit;
  end;
  Ts  := GetTabSheet('TfrVSBasvuruListe');
end;
procedure TMainForm.mmiVSDepartmanFormlariClick(Sender: TObject);
var
  Ts   : TUniTabSheet;
begin
  if not MainMod.CheckPacket(TControl(Sender).Tag) then
  begin
    MessageDlg('Erişmeye çalıştığınız modüller, sahip olduğunuz PAKET LİSANSI''na dahil değil.'#13 +
               'Bu modülleri kullanmak için paketinizi yükseltmeniz gerekir.'#13 +
               'Lütfen sistem yöneticiniz ile irtibata geçiniz.', mtInformation, [mbOk]);
    Exit;
  end;
  Ts  := GetTabSheet('TfrVSDepartmanListe');
end;
procedure TMainForm.mmKurumParametreleriClick(Sender: TObject);
begin
  frmParametreMCTanim.ShowModal;
end;
procedure TMainForm.mmiYetkiMatrisiLoglariClick(Sender: TObject);
begin
  RptErisimYetkiLog.Exec(0, 0, 0);
end;
procedure TMainForm.mmiGrupFirmaBilgileriClick(Sender: TObject);
begin
  frmKurumGrupTanim.ShowModal;
end;
procedure TMainForm.mmiIhlalBildirimiClick(Sender: TObject);
var
  ts : TUniTabSheet;
begin
  ts := GetTabSheet('TfrmIhlalOlayiBildirimListe');
end;
procedure TMainForm.mmiIhlalOlaylariClick(Sender: TObject);
var
  Ts : TUniTabSheet;
begin
  Ts  := GetTabSheet('TfrmIhlalOlayiListe');
end;
procedure TMainForm.mmiRptYetkiMatrisiClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  Ts  := GetTabSheet('TfrRptYetkiMatrisi');
end;
procedure TMainForm.mmiUnvanTanimlariClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  Ts  := GetTabSheet('TfrUnvanListe');
end;
procedure TMainForm.mmiKontrolFormlariClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  if not MainMod.CheckPacket(TControl(Sender).Tag) then
  begin
    MessageDlg('Erişmeye çalıştığınız modüller, sahip olduğunuz PAKET LİSANSI''na dahil değil.'#13 +
               'Bu modülleri kullanmak için paketinizi yükseltmeniz gerekir.'#13 +
               'Lütfen sistem yöneticiniz ile irtibata geçiniz.', mtInformation, [mbOk]);
    Exit;
  end;
  Ts  := GetTabSheet('TfrCheckListListe');
end;
procedure TMainForm.mmiKullaniciTanimlariClick(Sender: TObject);
var
  Ts : TUniTabSheet;
begin
  if MainMod.LoginInfo.MCID = 0 then
  begin
    if frmRolKullaniciTurSec.Select(1) < 0 then Exit;
  end;
  Ts  := GetTabSheet('TfrKullaniciListe');
end;
procedure TMainForm.mmiRiskTanimlariClick(Sender: TObject);
var
  Ts : TUniTabSheet;
begin
  Ts  := GetTabSheet('TfrmRistListe');
end;
procedure TMainForm.mmiRolTanimlariClick(Sender: TObject);
var
  Ts : TUniTabSheet;
begin
  if MainMod.LoginInfo.MCID = 0 then
  begin
    if frmRolKullaniciTurSec.Select(0) < 0 then Exit;
  end;
  Ts  := GetTabSheet('TfrRolListe');
end;
//procedure TMainForm.mmiRptRiskAnalizRaporuClick(Sender: TObject);
//var
//  Ts  : TUniTabSheet;
//begin
//  Ts  := GetTabSheet('TfrRptRiskAnalizRaporu');
//end;
procedure TMainForm.NavTreeClick(Sender: TObject);
var
  Nd : TUniTreeNode;
  MI : TUniMenuItem;
begin
  Nd := NavTree.Selected;
  if Nd.Count = 0 then
  begin
    MI := FindMenuItem(Nd.Text);
    if Assigned(MI) then MI.OnClick(MI);
  end;
end;
procedure TMainForm.NavTreeLoaded(Sender: TObject);
begin
  edSearchMenu.SetFocus;
end;
procedure TMainForm.PgControlChange(Sender: TObject);
var
  Ts : TUniTabSheet;
  Nd : TUniTreeNode;
begin
  Ts := PgControl.ActivePage;
//  if Ts = tsHome then TfrDashBoard(DashBoard).DshTimer.Enabled := True;
//  Tahir 07.01.2022 dashboard kasıyor, optimize edilinceye kadar kapalı kalsın
  Nd := Pointer(Ts.Tag);
  NavTree.Selected := Nd;
end;
procedure TMainForm.pnlVersionClick(Sender: TObject);
begin
  frmSurumNot.Exec(VersiyonNo);
end;
procedure TMainForm.PortalSayfaAyar1Click(Sender: TObject);
begin
  frmPortalSetting.showmodal;
end;

procedure TMainForm.ppmiChangePwdClick(Sender: TObject);
begin
  frmSifreDegistir.ShowModal;
end;
procedure TMainForm.ppmiLicenceInfoClick(Sender: TObject);
begin
  frmLicenceInfo.ShowLicenceInfo;
end;
procedure TMainForm.ppmiSelectCompClick(Sender: TObject);
begin
  if PgControl.PageCount > 1 then
  begin
    MessageDlg('Birden fazla açık ekran tespit edildi.'#13'Kurum değiştirirseniz bütün pencereler kapatılacak.'#13 +
               'Devam etmek istediğinizden emin misiniz?', mtConfirmation, mbYesNo, ChangeCompanyControl);
  end
  else
  begin
    frmFirmaSec.GizliKriter := 'active = ''E''';
    frmFirmaSec.btnCancel.Enabled := True;
    if frmFirmaSec.Select > 0 then
    begin
      lbGroupName.Caption := MainMod.GCTitle;
      lbCompName.Caption  := MainMod.MCTitle;
      TfrDashBoard(DashBoard).DshTimer.Enabled := True;
    end;
  end;
end;
procedure TMainForm.ppmiUserLogoutClick(Sender: TObject);
begin
  MessageDlg('Çıkış Yapmak istediğinizden emin misiniz?', mtConfirmation, mbYesNo, LogOutControl);
end;
procedure TMainForm.PrepareMainMenu;
var
  i : Integer;
begin
  for i := 0 to MainMenu.Items.Count - 1 do SetMenuVisible(MainMenu.Items[i]);
  mmiGrupFirmaBilgileri.Visible := MainMod.GCID <> 1;
end;
procedure TMainForm.PrepareMenuTree;
var
  i : Integer;
  Nd : TUniTreeNode;
begin
  Nd := NavTree.Items.Add(nil, 'Giriş (Ana Sayfa)');
  Nd.Data := tsHome;
  tsHome.Caption := 'Ana Sayfa';
  tsHome.Tag := NativeInt(Nd);
  tsHome.ImageIndex := -1;
  NavTree.Selected := Nd;
  for i := 0 to MainMenu.Items.Count - 1 do
  begin
    AddSubTree(MainMenu.Items[i], nil);
  end;
end;
procedure TMainForm.PrepareThemes;
var
  S : TUniStringArray;
  I : Integer;
begin
  S := ServerMod.ThemeManager.AllThemes;
  ppmiChangeTheme.Clear;
  for I := Low(S) to High(S) do ThemeSubMenu(ThemeTexts[I], S[I]);
  // ('aria', 'classic', 'colors', 'crisp', 'graphite', 'gray', 'material', 'neptune', 'triton', 'triton.modified', 'uni_aqua', 'uni_aqua_triton', 'uni_carbon', 'uni_carbon_triton', 'uni_classic', 'uni_emerald', 'uni_flat_black', 'uni_flat_black_triton', 'uni_kde', 'uni_kde_neptune', 'uni_kde_triton', 'uni_lavender', 'uni_lavender_triton', 'uni_mac', 'uni_mac_neptune', 'uni_mac_triton', 'uni_mac_yosemite', 'uni_sencha', 'uni_sencha2', 'uni_sencha2_mono', 'uni_sencha2_mono_triton', 'uni_sencha2_triton', 'uni_sencha_classic', 'uni_sencha_flat', 'uni_sencha_triton', 'uni_ubuntu', 'uni_ubuntu_neptune', 'uni_ubuntu_triton', 'uni_win10', 'uni_win7', 'uni_win8', 'uni_windows11', 'uni_winxp_blue', 'uni_winxp_silver')
end;
procedure TMainForm.RefreshTime;
begin
  StatusBar.Panels[0].Text := FormatDateTime('dd/mm/yyyy hh:nn', Now);
end;
procedure TMainForm.edSearchMenuChange(Sender: TObject);
begin
  SearchMenuTree(edSearchMenu.Text);
end;
procedure TMainForm.edSearchMenuTriggerEvent(Sender: TUniCustomComboBox; AButtonId: Integer);
begin
  case AButtonId of
    0 : SearchMenuTree(Sender.Text);
  end;
end;
procedure TMainForm.mmiEnvanterLoglariClick(Sender: TObject);
begin
  RptEnvanterLog.Exec(0);
end;
procedure TMainForm.SearchMenuTree(const AText: string);
var
  S, SString : string;
  I : Integer;
  aExpand : Boolean;
begin
  SString := Trim(AText);
  if SString<>PSString then
  begin
    PSString := TR_Lower(SString);
    if (Length(PSString) > 1) or (PSString = '') then
    begin
      aExpand := PSString<>'';
      NavTree.BeginUpdate;
      try
        NavTree.ResetData;
        for I := 0 to NavTree.Items.Count - 1 do
        begin
          S := TR_Lower(NavTree.Items[I].Text);
          NavTree.Items[I].Visible := (Length(PSString) = 0) or (Pos(PSString, S)>0);
          NavTree.Items[I].Expanded := aExpand;
        end;
      finally
        NavTree.EndUpdate;
      end;
    end;
  end;
end;
procedure TMainForm.btnDgrNetClick(Sender: TObject);
var
Token :string;
begin
 if DgrNetLink = '' then
  begin
    MessageDlg('DGRNET için tanımlanmış URL parametresi bulunamadı',mterror,[mbOk]);
  end;
  //dgrnet ile kullanıcı adı yumusuzluğundan dgrnet kullanici adi ile kvkknet mail adresi eşleştirildi.
 token :=  ubysEncode(jwtKey, MainMod.LoginInfo.EMail,TaHS256) ;
 UniSession.UrlRedirect(DgrNetLink+'?token=' + token);
end;


procedure TMainForm.UniFormAfterShow(Sender: TObject);
var
 MailGonderme : boolean;
 SifreGecerlilikSure : integer;
begin
  if IsLoading then Exit;
  NavTree.FullExpand;
   MailGonderme := MainMod.GetSysParam(mainmod.qTmp, 'KULLANICI MAİL GÖNDERME') = 'E';
  if {not MailGonderme} mainmod.LoginType = ltyBos  then
  begin
    if Length(MainMod.LoginInfo.Password) > 15 then
    begin
      IsLoading := True;
      MessageDlg('Sisteme otomatik parola ile giriş yaptınız. Lütfen güvenliğiniz için şifrenizi değiştiriniz.', mtInformation, [mbOk]);
      //frmSifreDegistir.ShowModal;
      if frmSifreDegistir.exec <> mrOk then
      begin
        close;
        exit;
      end;
      IsLoading := False;
    end;
    SifreGecerlilikSure := StrToIntDef(mainmod.GetSysParam(mainmod.qTmp,'PAROLA GEÇERLİLİK SÜRESİ'),0) ;
    if  (SifreGecerlilikSure > 0) and (mainmod.LoginInfo.UserName <> 'YÖNETİCİ') then
      if DaysBetween(MainMod.LoginInfo.Password_change_tar, now) >= SifreGecerlilikSure then
      begin
       IsLoading := True;
        MessageDlg('Parola geçerlilik süreniz doldu. Lütfen güvenliğiniz için şifrenizi değiştiriniz.', mtInformation, [mbOk]);
        //frmSifreDegistir.ShowModal;
        if frmSifreDegistir.exec <> mrOk then
        begin
          close;
          exit;
        end;
        IsLoading := False;
      end;

  end;
  if MainMod.MCID = 0 then
  begin
    IsLoading := True;
    MessageDlg('Sisteme "Grup Kullanıcısı" ile giriş yaptınız. Çalışacağınız grup firmalardan birisini seçmelisiniz.', mtInformation, [mbOk]);
    frmFirmaSec.GizliKriter := 'active = ''E''';
    frmFirmaSec.btnCancel.Enabled := False;
    frmFirmaSec.Select;
  end;
  lbGroupName.Caption := MainMod.GCTitle;
  lbCompName.Caption  := MainMod.MCTitle;
  if not MainMod.CheckLicence then
  begin
    MessageDlg('Lisansınızın kullanım süresi dolmuş. KVKNET sistemini kullanmaya devam etmek için sistem yöneticiniz ile görüşünüz.', mtInformation, [mbOk]);
    ModalResult := mrCancel;
  end;
  if ServerMod.VersionDegisti then
   begin
    //Doğan Akçay Versiyon değişikliğinde yapılacak işlemler yazılacak
    {TODO -oDoğan AKÇAY -cMain : ActionItem}
  //  GuncellemeMail;
     ServerMod.VersionDegisti := false;
   end;

  NavTree.FullCollapse;
  ShowDashboard;
  if MainMod.MCID > 0 then
    mainmod.PortalAfisSetting;
end;

procedure TMainForm.UniFormAjaxEvent(Sender: TComponent; EventName: string;
  Params: TUniStrings);
begin
  if EventName = 'CheckPermission' then
  begin
    if not MainMod.IsUserAuthorized(MainMod.LoginInfo.ID) then
    begin
     showmessagen('Yöneticiniz tarafından yetkiniz pasife alınmıştır.');
     LogOutControl(ppmiUserLogout, mrYes);
    end;
  end;

  if EventName = 'ToggleSQLMonitor' then  // sql monitori başlatır , bitirir , sqlmonitor log sayfası açar
  begin
    Prompt('@*Lüfen Şifre Giriniz', '', mtInformation, mbOKCancel, toggleSqMonitorchange, False);
  end;

  if EventName = 'sysParameterList' then //Doğan Akçay parametre ekranını açar
   begin
    Prompt('@*Lüfen Şifre Giriniz', '', mtInformation, mbOKCancel, ShowSysParameter, False);
   end;


end;

function TMainForm.GenerateTodayPassword: string;
const
  DaysTR: array[1..7] of string =  ('P', 'P', 'S', 'Ç', 'P', 'C', 'C');

  // Pazartesi=1, Pazar=7
var
  yy, mmddhh: string;
  gunHarf: string;
begin
  yy := FormatDateTime('yy', Now);           // Yılın son iki hanesi
  mmddhh := FormatDateTime('hhdd', Now);   // Ay + Gün + Saat
  gunHarf := DaysTR[DayOfWeek(Now)];         // Günün ilk harfi (TR)

  Result := Format('KVK%s%s%s%s', [mmddhh,'42', yy, gunHarf]);
end;

function TMainForm.checkPassword(Atext: string):boolean;
var
  TodayPassword: string;
begin
  result := false;
  TodayPassword :=  GenerateTodayPassword;// Format('KVK%s', [FormatDateTime('yyyymmddhh', NOW)]);
  result := AText = TodayPassword ;

end;

procedure TMainForm.toggleSqMonitorchange(Sender: TComponent; AResult: Integer; AText: string);
var

  f, LogFile: TextFile;
  BasePath, LogDir, LogPath: string;
begin
  if AResult <> mrOk then
    Exit;


  if not checkPassword(atext) then exit;

    BasePath := ExtractFilePath(Application.ExeName);
    LogDir := BasePath + 'log\kvknet_sql_log\';
    ForceDirectories(LogDir);
    LogPath := LogDir + 'SQL_Log.txt';

    // SQL Monitor Aktif Değilse Log Dosyasını Temizle
    if not MainMod.sqlMonitor.Active then
    begin
      AssignFile(f, LogPath);
      Rewrite(f);
      CloseFile(f);
    end;

    // SQL Monitor Durumu Değiştiriliyor
    MainMod.sqlMonitor.Active := not MainMod.sqlMonitor.Active;

    if MainMod.sqlMonitor.Active then
      ShowMessage('SQL Monitor: AKTİF')
    else
    begin
      ShowMessage('SQL Monitor: PASİF');
      ShowSqlLogForm;
    end;

end;

procedure TMainForm.ShowSqlLogForm;
var
  frm: TfrmSQLLog;
  LogFilePath: string;
begin
  frm := TfrmSQLLog.Create(UniApplication);
  try
    LogFilePath := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'log\kvknet_sql_log\SQL_Log.txt';
    frm.LoadLogFile(LogFilePath);
    frm.Show;
  except
    frm.Free;
    raise;
  end;
end;

procedure TMainForm.ShowSysParameter(Sender: TComponent; AResult: Integer; AText: string);
var
  Ts  : TUniTabSheet;
  FrC : TUniFrameClass;
  Fr  : TUniFrame;

begin
  if AResult <> mrOk then
    Exit;

  if not checkPassword(AText) then  exit;

  Ts := nil;
  if not Assigned(Ts) then
  begin
    Ts := TUniTabSheet.Create(Self);
    Ts.PageControl := PgControl;
    Ts.Closable := True;
    Ts.OnClose := TabSheetClose;
    Ts.Caption := 'Sistem Ayarları';
    FrC := TUniFrameClass(FindClass('TfrsysAyarlarListe'));
    Fr  := FrC.Create(Self);
    Fr.Align := alClient;
    Fr.Parent := Ts;
  end;
  PgControl.ActivePage := Ts;


end;

procedure TMainForm.UniFormBeforeShow(Sender: TObject);
begin
  btnUserSettings.Caption := MainMod.LoginInfo.FullName;
  ppmiSelectComp.Visible  := MainMod.MCID = 0; // if Logged with Group Code then user can select company
  DgrNetLink := MainMod.GetSysParam(MainMod.qTmp,'DGRNET GİRİŞ LINK');
  btnDgrNet.Visible := DgrNetLink <> '';

end;
procedure TMainForm.UniFormCreate(Sender: TObject);
var
  Ini: TIniFile;
  v1,v2,v3,v4: word;
begin
  DashBoard      := nil;
  pnlMenu.Height := 0;
  IsLoading      := False;
  //PrepareThemes;
  PrepareMainMenu;
  PrepareMenuTree;
  edSearchMenu.Text   := '';
  lbGroupName.Caption := '';
  lbCompName.Caption  := '';
  VersiyonNo := 'V_'+Projeversiyon(Application.ExeName,v1,v2,v3,v4);
  pnlVersion.Caption := VersiyonNo;
  sayac := 0;
  //pnlVersion.Caption := 'Ver: ' + MainModule.Versiyon;
  // Added by TEVFIK 1.06.2023 13:38:32 KVKNET Versiyon
//  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'KVKNet.ini');
//  try
//    pnlVersion.Caption := 'Ver: ' + Ini.ReadString('Settings', 'Version','');
//  finally
//    Ini.Free;
//  end;
end;
procedure TMainForm.UniFormReady(Sender: TObject);
begin
 UniSession.AddJS('setInterval(function(){ ajaxRequest(MainForm.window, "CheckPermission", []); }, 120000);');

  UniSession.AddJS(
    'document.addEventListener("keydown", function(e) {' +
    '  if (e.ctrlKey && e.altKey && e.key.toLowerCase() === "l") {' +
    '    console.log("Shortcut triggered");' +
    '    ajaxRequest(MainForm.window, "ToggleSQLMonitor", []);' +
    '    e.preventDefault();' +
    '  }' +
    '});'
  );
  UniSession.AddJS(
    'document.addEventListener("keydown", function(e) {' +
    '  if (e.ctrlKey && e.altKey && e.key.toLowerCase() === "m") {' +
    '    console.log("Shortcut triggered");' +
    '    ajaxRequest(MainForm.window, "sysParameterList", []);' +
    '    e.preventDefault();' +
    '  }' +
    '});'
  );

  UniSession.AddJS(
    'setTimeout(function () {' +
    '  window.history.replaceState({}, document.title, window.location.pathname);' +
    '}, 50);'
  );


end;

procedure TMainForm.mmiVerbisRaporArsiviClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  Ts  := MainForm.GetTabSheet('TfrRptVerbisListelerDegisiklikler');
end;
procedure TMainForm.YardmListesi1Click(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  Ts  := GetTabSheet('TfrHelpListe');
end;
procedure TMainForm.mmiZamanDamgasiLoglariClick(Sender: TObject);
begin
  RptTimeStampLog.Exec(0);
end;
procedure TMainForm.mmiKVKKEkipmanClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  Ts  := GetTabSheet('TfrKVKKEkipmanListe');
end;
procedure TMainForm.mmiKVKKGuvenlikTedbirleriClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  Ts  := GetTabSheet('TfrKVKKTedbirListe');
end;
procedure TMainForm.mmiKVKKHukukiDayanaklarClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  Ts  := GetTabSheet('TfrKVKKDayanakListe');
end;
//procedure TMainForm.mmiKVKKKontrolSonuclariClick(Sender: TObject);
//var
//  Ts  : TUniTabSheet;
//begin
//  Ts  := GetTabSheet('TfrKVKKKontrolSonucListe');
//end;
procedure TMainForm.mmiKVKKNETSurecRiskTanimClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  Ts  := GetTabSheet('TfrRiskLiseSurec');
end;
procedure TMainForm.mmiKVKKSureclerClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
  // DataTypeId : Integer;
begin
  // DataTypeId := StrToInt(TUniMenuItem(Sender).Hint);
  // Ts  := GetTabSheet('TfrKVKKTanimListe' + IntToStr(DataTypeId));
  Ts  := GetTabSheet('TfrKVKKSurecListe');
end;
procedure TMainForm.mmiKVKKAmaclarClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  Ts  := GetTabSheet('TfrKVKKAmacListe');
end;
procedure TMainForm.mmiKVKKDokumanSablonlariClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  if not MainMod.CheckPacket(TControl(Sender).Tag) then
  begin
    MessageDlg('Erişmeye çalıştığınız modüller, sahip olduğunuz PAKET LİSANSI''na dahil değil.'#13 +
               'Bu modülleri kullanmak için paketinizi yükseltmeniz gerekir.'#13 +
               'Lütfen sistem yöneticiniz ile irtibata geçiniz.', mtInformation, [mbOk]);
    Exit;
  end;
  Ts  := GetTabSheet('TfrKVKKVeriDokumanListe');
end;
procedure TMainForm.mmiKVKKDokumanTipleriClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  Ts  := GetTabSheet('TfrKVKKDokumanTipListe');
end;
procedure TMainForm.mmiKVKKVeriKategorisiClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  Ts  := GetTabSheet('TfrKVKKKategoriListe');
end;
procedure TMainForm.mmiKVKKVeriKaynaklariClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  Ts  := GetTabSheet('TfrKVKKKaynakListe');
end;
procedure TMainForm.mmiKVKKVeriKonusuKisiClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  Ts  := GetTabSheet('TfrKVKKKisiListe');
end;
//procedure TMainForm.mmiKVKKVeriOnemDerecesiClick(Sender: TObject);
//var
//  Ts  : TUniTabSheet;
//begin
//  Ts  := GetTabSheet('TfrKVKKOnemDereceListe');
//end;
procedure TMainForm.mmiKVKKVeriPaylasimMetodlariClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  Ts  := GetTabSheet('TfrKVKKMetodListe');
end;
procedure TMainForm.mmiKVKKVeriPaylasimTaraflariClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  Ts  := GetTabSheet('TfrKVKKTarafListe');
end;
procedure TMainForm.mmiKVKKVeriTipleriClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  Ts  := GetTabSheet('TfrKVKKVeriTipiListe');
end;
procedure TMainForm.mmiOzelOnaySablonlariClick(Sender: TObject);
var
  Ts  : TUniTabSheet;
begin
  if not MainMod.CheckPacket(TControl(Sender).Tag) then
  begin
    MessageDlg('Erişmeye çalıştığınız modüller, sahip olduğunuz PAKET LİSANSI''na dahil değil.'#13 +
               'Bu modülleri kullanmak için paketinizi yükseltmeniz gerekir.'#13 +
               'Lütfen sistem yöneticiniz ile irtibata geçiniz.', mtInformation, [mbOk]);
    Exit;
  end;
  Ts  := GetTabSheet('TfrOzelOnaySablonListe');
end;

initialization
  RegisterAppFormClass(TMainForm);
end.

// to do list :
// - Veri Güvenliği Tedbirler (Klavuz Sf. 52) raporunun Veri Kaynağına göre gruplu raporu yapılabilir
// - Yetkilere göre Envanter ve Kontrol Listesi ekranlarında sınırlı ve yetkili kayıtlar listelenmeli... Bununla ilgili çalışma yapılacak.
// Tüm formların sağ üstteki close, resize düğmeleri kontrol edilecek. Bazıları kapatılmamlı.
(*
Kullanılmıyor
- unAyarlarListe
- unAyarlarTanim
- unRptVeriPaylasimRaporu
- unKVKKDokumanTipSec // Kalabilir
- unKVKKKategoriSec // Kalabilir
- unKVKKKontrolSonucSec // Kalabilir
- unKVKKKisiSec // Kalabilir
- unKVKKOnemDereceSec // Kalabilir
- unKVKKSurecSec // Kalabilir
*)
