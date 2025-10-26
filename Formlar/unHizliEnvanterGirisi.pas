unit unHizliEnvanterGirisi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniPageControl, uniGUIBaseClasses,
  uniMultiItem, uniComboBox, uniLabel, Data.DB, MemDS, DBAccess, Uni,
  VirtualTable, uniBasicGrid, uniDBGrid, uniButton, uniEdit, uniGroupBox,
  uniBitBtn, uniSpeedButton, uniMemo, Vcl.ExtCtrls;

type
  TfrmHizliEnvanterGirisi = class(TUniForm)
    pg: TUniPageControl;
    tsTemel: TUniTabSheet;
    tsSaklama: TUniTabSheet;
    tsPaylasma: TUniTabSheet;
    tsVeri: TUniTabSheet;
    UniLabel9: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel8: TUniLabel;
    UniLabel23: TUniLabel;
    cbKisi: TUniComboBox;
    cbDepartman: TUniComboBox;
    cbSurec: TUniComboBox;
    cbKaynak: TUniComboBox;
    qTmp: TUniQuery;
    gridVeriKategorisi: TUniDBGrid;
    tblVeriTipi: TVirtualTable;
    dsVeriTipi: TUniDataSource;
    btnTemelSonraki: TUniButton;
    qVeriTipiTanim: TUniQuery;
    dsVeriTipiTanim: TUniDataSource;
    btnVeriSonraki: TUniButton;
    UniLabel1: TUniLabel;
    qVeriKategorisiTanim: TUniQuery;
    dsVeriKategorisiTanim: TUniDataSource;
    gridVeriTipi: TUniDBGrid;
    tblAmac: TVirtualTable;
    dsAmac: TUniDataSource;
    tsAmac: TUniTabSheet;
    tsMetod: TUniTabSheet;
    gridAmac: TUniDBGrid;
    tblMetod: TVirtualTable;
    dsMetod: TUniDataSource;
    gridMetod: TUniDBGrid;
    grpFSaklama: TUniGroupBox;
    UniLabel39: TUniLabel;
    UniLabel41: TUniLabel;
    UniLabel13: TUniLabel;
    grpSSaklama: TUniGroupBox;
    UniLabel40: TUniLabel;
    UniLabel42: TUniLabel;
    UniLabel19: TUniLabel;
    edFSureVar: TUniComboBox;
    edFImha: TUniComboBox;
    edFSure: TUniNumberEdit;
    edFSureTip: TUniComboBox;
    edSImha: TUniComboBox;
    edSSureVar: TUniComboBox;
    edSSure: TUniNumberEdit;
    edSSureTip: TUniComboBox;
    edTarafTipi: TUniComboBox;
    tblTaraf: TVirtualTable;
    dsTaraf: TUniDataSource;
    gridTaraf: TUniDBGrid;
    btnKisiEkle: TUniSpeedButton;
    btnSurecEkle: TUniSpeedButton;
    btnKaynakEkle: TUniSpeedButton;
    btnKategoriEkle: TUniSpeedButton;
    UniLabel3: TUniLabel;
    btnVeriTipiEkle: TUniSpeedButton;
    btnAmacSonraki: TUniButton;
    btnMetodSonraki: TUniButton;
    btnSaklamaSonraki: TUniButton;
    btnPaylasmaSonraki: TUniButton;
    tsSonuc: TUniTabSheet;
    btnAmacEkle: TUniSpeedButton;
    btnMetodEkle: TUniSpeedButton;
    btnTarafEkle: TUniSpeedButton;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    memoKayit: TUniMemo;
    btnKaydet: TUniButton;
    qEnvM: TUniQuery;
    qEnvD: TUniQuery;
    btnVeriOnceki: TUniButton;
    btnAmacOnceki: TUniButton;
    btnMetodOnceki: TUniButton;
    btnSaklamaOnceki: TUniButton;
    btnPaylasmaOnceki: TUniButton;
    btnKaydetOnceki: TUniButton;
    btnVazgec: TUniButton;
    tblVeriKategorisi: TVirtualTable;
    dsVeriKategorisi: TUniDataSource;
    hpnlVKategori: TUniHiddenPanel;
    fltrKategori: TUniEdit;
    hpnlAmaclar: TUniHiddenPanel;
    fltrAmac: TUniEdit;
    hpnlMetodlar: TUniHiddenPanel;
    fltrMetod: TUniEdit;
    hpnlVPaylasma: TUniHiddenPanel;
    fltrTaraf: TUniEdit;
    hpnlVTip: TUniHiddenPanel;
    fltrVeriTipi: TUniEdit;
    fltrNitelik: TUniEdit;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    UniLabel10: TUniLabel;
    UniLabel11: TUniLabel;
    UniLabel12: TUniLabel;
    UniLabel14: TUniLabel;
    UniLabel15: TUniLabel;
    btnYardim: TUniButton;
    upAmacBaslikAna: TUniPanel;
    UniPanel2: TUniPanel;
    UniPanel3: TUniPanel;
    pnlVerilerBaslik: TUniPanel;
    pnlverilerbaslik2: TUniPanel;
    pnTemelBilgiBaslik: TUniPanel;
    pnlMetodBaslik: TUniPanel;
    pnlsaklamabaslik: TUniPanel;
    pnlpaylasimbaslik: TUniPanel;
    UniPanel4: TUniPanel;
    UniPanel1: TUniPanel;
    pnlkaydetbaslik: TUniPanel;
    UniPanel5: TUniPanel;
    UniPanel6: TUniPanel;
    procedure UniFormCreate(Sender: TObject);
    procedure btnTemelSonrakiClick(Sender: TObject);
    procedure gridVeriKategorisiSelectionChange(Sender: TObject);
    procedure btnVeriSonrakiClick(Sender: TObject);
    procedure tsAmacBeforeActivate(Sender: TObject; var AllowActivate: Boolean);
    procedure tsMetodBeforeActivate(Sender: TObject;
      var AllowActivate: Boolean);
    procedure tsPaylasmaBeforeActivate(Sender: TObject;
      var AllowActivate: Boolean);
    procedure btnKisiEkleClick(Sender: TObject);
    procedure btnSurecEkleClick(Sender: TObject);
    procedure btnKaynakEkleClick(Sender: TObject);
    procedure btnKaydetClick(Sender: TObject);
    procedure btnAmacSonrakiClick(Sender: TObject);
    procedure btnMetodSonrakiClick(Sender: TObject);
    procedure btnToplamaSonrakiClick(Sender: TObject);
    procedure btnSaklamaSonrakiClick(Sender: TObject);
    procedure btnPaylasmaSonrakiClick(Sender: TObject);
    procedure btnKategoriEkleClick(Sender: TObject);
    procedure btnVeriTipiEkleClick(Sender: TObject);
    procedure btnAmacEkleClick(Sender: TObject);
    procedure btnMetodEkleClick(Sender: TObject);
    procedure btnTarafEkleClick(Sender: TObject);
    procedure tsVeriBeforeActivate(Sender: TObject; var AllowActivate: Boolean);
    procedure tsSonucBeforeActivate(Sender: TObject;
      var AllowActivate: Boolean);
    procedure btnVeriOncekiClick(Sender: TObject);
    procedure btnAmacOncekiClick(Sender: TObject);
    procedure btnMetodOncekiClick(Sender: TObject);
    procedure btnSaklamaOncekiClick(Sender: TObject);
    procedure btnPaylasmaOncekiClick(Sender: TObject);
    procedure btnKaydetOncekiClick(Sender: TObject);
    procedure edFSureVarChange(Sender: TObject);
    procedure edSSureVarChange(Sender: TObject);
    procedure btnVazgecClick(Sender: TObject);
    procedure gridVeriKategorisiColumnSort(Column: TUniDBGridColumn;
      Direction: Boolean);
    procedure gridVeriTipiColumnSort(Column: TUniDBGridColumn;
      Direction: Boolean);
    procedure gridAmacColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure gridMetodColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure gridTarafColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure gridVeriKategorisiColumnFilter(Sender: TUniDBGrid;
      const Column: TUniDBGridColumn; const Value: Variant);
    procedure gridVeriTipiColumnFilter(Sender: TUniDBGrid;
      const Column: TUniDBGridColumn; const Value: Variant);
    procedure gridAmacColumnFilter(Sender: TUniDBGrid;
      const Column: TUniDBGridColumn; const Value: Variant);
    procedure gridMetodColumnFilter(Sender: TUniDBGrid;
      const Column: TUniDBGridColumn; const Value: Variant);
    procedure gridTarafColumnFilter(Sender: TUniDBGrid;
      const Column: TUniDBGridColumn; const Value: Variant);
    procedure gridVeriKategorisiCellClick(Column: TUniDBGridColumn);
    procedure gridVeriTipiCellClick(Column: TUniDBGridColumn);
    procedure gridTarafCellClick(Column: TUniDBGridColumn);
    procedure edTarafTipiChange(Sender: TObject);
    procedure btnYardimClick(Sender: TObject);
  private
    YardimKw : string;
    main_id : Integer;
    katIDs   ,
    veriIDs  ,
    TopAIDs  ,
    SakAIDs  ,
    PayAIDs  ,
    TopMIDs  ,
    SakMIDs  ,
    PayMIDs  ,
    PayTIDs  ,
    PayTip   : String;
    vidEkle  ,
    vidSil   : String;
    procedure ComboDoldur(tip:string);
    procedure VeriKategorisiHazirla;
    procedure VeriTipiHazirla;
    procedure AmacHazirla;
    procedure MetodHazirla;
    procedure TarafHazirla;
    procedure KayitHazirla;
    procedure DuzenleControl(Sender: TComponent; Res: Integer);
    procedure KaydetControl(Sender: TComponent; Res: Integer);
    function DataIDBul(aTable, aField, aData: String): Integer;
    function DataDescBul(aTable, aField, aID: String): String;
    { Private declarations }
  public
    function Exec: Integer;
    function Edit(env_main_id: Integer): Integer;
    { Public declarations }
  end;

function frmHizliEnvanterGirisi: TfrmHizliEnvanterGirisi;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, McMLib,
  unKVKKKisiTanim, unDepartmanTanim, unKVKKSurecTanim, unKVKKKaynakTanim,
  unKVKKKategoriTanim, unKVKKVeriTipiTanim, unKVKKAmacTanim, unKVKKMetodTanim,
  unKVKKTarafTanim, unHelpPage;

function frmHizliEnvanterGirisi: TfrmHizliEnvanterGirisi;
begin
  Result := TfrmHizliEnvanterGirisi(MainMod.GetFormInstance(TfrmHizliEnvanterGirisi));
end;

{ TfrmHizliEnvanter }

procedure TfrmHizliEnvanterGirisi.AmacHazirla;
var
  topList,
  sakList,
  payList: TStringList;
  topS,
  sakS,
  payS: String;
begin
  topList := TStringList.Create;
  sakList := TStringList.Create;
  payList := TStringList.Create;

  TopS := topAIds;
  while tops <> '' do
  begin
    topList.Add(ParseString(tops, ','));
  end;
  saks := sakAIDs;
  while saks <> '' do
  begin
    sakList.Add(ParseString(saks, ','));
  end;
  pays := payAIDs;
  while pays <> '' do
  begin
    payList.Add(ParseString(pays, ','));
  end;

  if tblAmac.Active = false then
    tblamac.Active := true;
  tblAmac.First;
  while not tblAmac.Eof do
  begin
    if tblAmac.FieldByName('toplama').AsString = 'E' then
      topList.Add(tblAmac.FieldByName('amac_id').AsString);
    if tblAmac.FieldByName('saklama').AsString = 'E' then
      sakList.Add(tblAmac.FieldByName('amac_id').AsString);
    if tblAmac.FieldByName('paylasma').AsString = 'E' then
      payList.Add(tblAmac.FieldByName('amac_id').AsString);
    tblAmac.Delete;
  end;

  queryOpen(qTmp, 'SELECT id, amac, toplama, saklama, paylasma FROM def_data_amac WHERE mc_id=' + IntToStr(mainMod.MCID) + ' ORDER BY amac');
  qTmp.First;
  while not qTmp.Eof do
  begin
    tblAmac.Append;
    tblAmac.FieldByName('amac_id').AsInteger        := qTmp.FieldByName('id').AsInteger;
    tblAmac.FieldByName('amac').AsString            := qTmp.FieldByName('amac').AsString;
    tblAmac.FieldByName('toplamasecilir').AsString  := qTmp.FieldByName('toplama').AsString;
    tblAmac.FieldByName('saklamasecilir').AsString  := qTmp.FieldByName('saklama').AsString;
    tblAmac.FieldByName('paylasmasecilir').AsString := qTmp.FieldByName('paylasma').AsString;

    if topList.IndexOf(tblAmac.FieldByName('amac_id').AsString) > -1 then
      tblAmac.FieldByName('toplama').AsString := 'E'
    else
      tblAmac.FieldByName('toplama').AsString := 'H';
    if sakList.IndexOf(tblAmac.FieldByName('amac_id').AsString) > -1 then
      tblAmac.FieldByName('saklama').AsString := 'E'
    else
      tblAmac.FieldByName('saklama').AsString := 'H';
    if payList.IndexOf(tblAmac.FieldByName('amac_id').AsString) > -1 then
      tblAmac.FieldByName('paylasma').AsString := 'E'
    else
      tblAmac.FieldByName('paylasma').AsString := 'H';

    tblamac.Post;
    qTmp.Next;
  end;
end;

procedure TfrmHizliEnvanterGirisi.btnAmacEkleClick(Sender: TObject);
begin
  if not MainMod.LoginInfo.Yetkiler[37] then
  begin
    MessageDlg('Amaç tanýmý eklemeye yetkili deðilsiniz.', mtError, [mbOk]);
    Exit;
  end;
  if frmKVKKAmacTanim.Exec(0, 0) = mrOk then AmacHazirla;
end;

procedure TfrmHizliEnvanterGirisi.btnAmacOncekiClick(Sender: TObject);
begin
  pg.ActivePage := tsVeri;
end;

procedure TfrmHizliEnvanterGirisi.btnAmacSonrakiClick(Sender: TObject);
begin
  pg.ActivePage := tsMetod;
end;

procedure TfrmHizliEnvanterGirisi.btnKategoriEkleClick(Sender: TObject);
begin
  if not MainMod.LoginInfo.Yetkiler[29] then
  begin
    MessageDlg('Kategori tanýmý eklemeye yetkili deðilsiniz.', mtError, [mbOk]);
    Exit;
  end;
  if frmKVKKKategoriTanim.Exec(0, 0) = mrOk then   VeriKategorisiHazirla;
end;

procedure TfrmHizliEnvanterGirisi.btnKaydetClick(Sender: TObject);
var
  departman_id : Integer;
begin
  if cbKisi.Text = '' then
  begin
    MessageDlg('Kiþi Grubu belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOK]);
    exit;
  end;
  if cbDepartman.Text = '' then
  begin
    MessageDlg('Departman belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOK]);
    exit;
  end;
  if cbSurec.Text = '' then
  begin
    MessageDlg('Süreç belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOK]);
    exit;
  end;
  if cbKaynak.Text = '' then
  begin
    MessageDlg('Veri Kaynaðý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOK]);
    exit;
  end;
  if edTarafTipi.Text = '' then
  begin
    MessageDlg('Paylaþýlan Taraf Tipi belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    Exit;
  end;

  departman_id := dataIDBul('sys_deptdef', 'title', cbDepartman.Text);
  if Pos(IntToStr(departman_id), MainMod.LoginInfo.Birimler) < 1 then
  begin
    MessageDlg('Seçili departmanda yetkili deðilsiniz. Ýþlem yapamazsýnýz.', mtError, [mbOk]);
    cbDepartman.SetFocus;
    Exit;
  end;

    MessageDlg('Envanter formunu sisteme kaydetmek istiyor musunuz?', mtWarning, mbYesNo, KaydetControl);
end;

procedure TfrmHizliEnvanterGirisi.btnKaydetOncekiClick(Sender: TObject);
begin
  pg.ActivePage := tsPaylasma;
end;

procedure TfrmHizliEnvanterGirisi.btnKaynakEkleClick(Sender: TObject);
begin
  if not MainMod.LoginInfo.Yetkiler[25] then
  begin
    MessageDlg('Veri kaynaðý tanýmý eklemeye yetkili deðilsiniz.', mtError, [mbOk]);
    Exit;
  end;
  if frmKVKKKaynakTanim.Exec(0, 0) = mrOk then ComboDoldur('kaynak');
end;

procedure TfrmHizliEnvanterGirisi.btnKisiEkleClick(Sender: TObject);
begin
  if not MainMod.LoginInfo.Yetkiler[33] then
  begin
    MessageDlg('Ýlgili kiþi tanýmý eklemeye yetkili deðilsiniz.', mtError, [mbOk]);
    Exit;
  end;
  if frmKVKKKisiTanim.Exec(0, 0) = mrOk then ComboDoldur('kisi');
end;

procedure TfrmHizliEnvanterGirisi.btnMetodEkleClick(Sender: TObject);
begin
  if not MainMod.LoginInfo.Yetkiler[53] then
  begin
    MessageDlg('Metod tanýmý eklemeye yetkili deðilsiniz.', mtError, [mbOk]);
    Exit;
  end;
  if frmKVKKMetodTanim.Exec(0, 0) = mrOk then MetodHazirla;
end;

procedure TfrmHizliEnvanterGirisi.btnMetodOncekiClick(Sender: TObject);
begin
  pg.ActivePage := tsAmac;
end;

procedure TfrmHizliEnvanterGirisi.btnMetodSonrakiClick(Sender: TObject);
begin
  pg.ActivePage := tsSaklama;
end;

procedure TfrmHizliEnvanterGirisi.btnPaylasmaOncekiClick(Sender: TObject);
begin
  pg.ActivePage := tsSaklama;
end;

procedure TfrmHizliEnvanterGirisi.btnPaylasmaSonrakiClick(Sender: TObject);
begin
  pg.ActivePage := tsSonuc;
end;

procedure TfrmHizliEnvanterGirisi.btnSaklamaOncekiClick(Sender: TObject);
begin
  pg.ActivePage := tsMetod;
end;

procedure TfrmHizliEnvanterGirisi.btnSaklamaSonrakiClick(Sender: TObject);
begin
  pg.ActivePage := tsPaylasma;
end;

procedure TfrmHizliEnvanterGirisi.btnSurecEkleClick(Sender: TObject);
begin
  if not MainMod.LoginInfo.Yetkiler[21] then
  begin
    MessageDlg('Süreç tanýmý eklemeye yetkili deðilsiniz.', mtError, [mbOk]);
    Exit;
  end;
  if frmKVKKSurecTanim.Exec(0, 0) = mrOk then ComboDoldur('surec');
end;

procedure TfrmHizliEnvanterGirisi.btnTarafEkleClick(Sender: TObject);
begin
  if not MainMod.LoginInfo.Yetkiler[45] then
  begin
    MessageDlg('Metod tanýmý eklemeye yetkili deðilsiniz.', mtError, [mbOk]);
    Exit;
  end;
  if frmKVKKTarafTanim.Exec(0, 0) = mrOk then TarafHazirla;
end;

procedure TfrmHizliEnvanterGirisi.btnTemelSonrakiClick(Sender: TObject);
var
  det_id       : Integer;
  kisi_id      : Integer;
  departman_id : Integer;
  surec_id     : Integer;
  kaynak_id    : Integer;
begin
  if cbKisi.Text = '' then
  begin
    MessageDlg('Kiþi Grubu seçmelisiniz!', mtError, [mbOK]);
    exit;
  end;
  if cbDepartman.Text = '' then
  begin
    MessageDlg('Departman seçmelisiniz!', mtError, [mbOK]);
    exit;
  end;
  if cbSurec.Text = '' then
  begin
    MessageDlg('Süreç seçmelisiniz!', mtError, [mbOK]);
    exit;
  end;
  if cbKaynak.Text = '' then
  begin
    MessageDlg('Veri Kaynaðý seçmelisiniz!', mtError, [mbOK]);
    exit;
  end;

  kisi_id      := dataIDBul('def_data_kisi', 'kisi', cbKisi.Text);
  departman_id := dataIDBul('sys_deptdef', 'title', cbDepartman.Text);
  surec_id     := dataIDBul('def_data_surec', 'surec', cbSurec.Text);
  kaynak_id    := dataIDBul('def_data_kaynak', 'kaynak', cbKaynak.Text);

  QueryOpen(qEnvM, 'select * from data_envanter where main_id=0 and active=''E'' and mc_id=' + IntToStr(MainMod.MCID) + ' and kisi_id=' + IntToStr(kisi_id) +
  ' and kaynak_id=' + IntToStr(kaynak_id) + ' and dept_id=' + IntToStr(departman_id) + ' and surec_id=' + IntToStr(surec_id));
  if qEnvM.FieldByName('id').AsString <> '' then
  begin
    main_id := qEnvM.Fields[0].AsInteger;

    if qEnvM.FieldByName('active').AsString <> 'E' then
    begin
      if not MainMod.LoginInfo.Yetkiler[92] then
      begin
        MessageDlg('Ayný temel bilgiler ile kayýt mevcut, Ref.No: ' + IntToStr(main_id) +
                   '<br/>Deðiþtirmek istediðiniz kayýt PASÝF yapýlmýþ. Bu kaydý deðiþtirme yetkiniz yok.', mtError, [mbOk]);
        Exit;
      end;
    end;

    QueryOpen(qTmp, 'SELECT fnc_checklist_kilit_durumu(' +
                    qEnvM.FieldByName('mc_id').AsString + ', ' + qEnvM.FieldByName('kaynak_id').AsString + ', ' +
                    qEnvM.FieldByName('kisi_id').AsString + ') AS kilitli');

    if qTmp.FieldByName('kilitli').AsString = 'E' then
    begin
      MessageDlg('Ayný temel bilgiler ile kayýt mevcut, Ref.No: ' + IntToStr(main_id) +
                 '<br/>Kontrol formu kilitlenmiþtir. Ýþlem yapamazsýnýz.', mtError, [mbOk]);
      exit;
    end;

    MessageDlg('Ayný temel bilgiler ile kayýt mevcut, Ref.No: ' + IntToStr(main_id) +
               '<br/>Envanter kaydýný açýp düzenlemek istiyor musunuz?', mtWarning, mbYesNo, DuzenleControl);
    exit;
  end;
  VeriKategorisiHazirla;
  pg.ActivePage := tsVeri;
end;

procedure TfrmHizliEnvanterGirisi.btnToplamaSonrakiClick(Sender: TObject);
begin
  pg.ActivePage := tsSaklama;
end;

procedure TfrmHizliEnvanterGirisi.btnVazgecClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmHizliEnvanterGirisi.btnVeriOncekiClick(Sender: TObject);
begin
  pg.ActivePage := tsTemel;
end;

procedure TfrmHizliEnvanterGirisi.btnVeriSonrakiClick(Sender: TObject);
begin
//  if tblVeriTipi.Active = false then
//    tblVeriTipi.Active := true;
//
//  tblVeriTipi.First;
//  while not tblVeriTipi.Eof do
//  begin
//    if tblVeriTipi.FieldByName('sec').AsString <> 'E' then
//      tblVeritipi.Delete;
//  end;
  pg.ActivePage := tsAmac;
end;

procedure TfrmHizliEnvanterGirisi.btnVeriTipiEkleClick(Sender: TObject);
begin
  if not MainMod.LoginInfo.Yetkiler[77] then
  begin
    MessageDlg('veri Tipi tanýmý eklemeye yetkili deðilsiniz.', mtError, [mbOk]);
    Exit;
  end;
//  if frmKVKKVeriTipiTanim.Insert(tblVeriKategorisi.FieldByName('kategori_id').AsInteger, tblVeriTipi.FieldByName('kategori').AsString) = mrOk then
  if frmKVKKVeriTipiTanim.Insert(0, '') = mrOk then
    gridVeriKategorisiSelectionChange(gridVeriKategorisi);
end;

procedure TfrmHizliEnvanterGirisi.btnYardimClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmHizliEnvanterGirisi.ComboDoldur(tip: string);
begin
  if tip='kisi' then
  begin
    QueryOpen(qTmp, 'select id, kisi from def_data_kisi where mc_id=' + IntToStr(MainMod.MCID) + ' order by kisi');
    cbKisi.Items.Clear;
    qTmp.First;
    while not qTmp.Eof do
    begin
      cbKisi.Items.Add(qTmp.FieldByName('kisi').AsString);
      qTmp.Next;
    end;
  end;
  if tip='departman' then
  begin
    if MainMod.LoginInfo.Birimler <> '' then
      QueryOpen(qTmp, 'select id, title from sys_deptdef where active=''E'' and mc_id=' + IntToStr(MainMod.MCID) + ' and id in (' + MainMod.LoginInfo.Birimler + ') order by title')
    else
      QueryOpen(qTmp, 'select id, title from sys_deptdef where active=''E'' and mc_id=' + IntToStr(MainMod.MCID) + ' and id in (0) order by title');
    cbDepartman.Items.Clear;
    qTmp.First;
    while not qTmp.Eof do
    begin
      cbDepartman.Items.Add(qTmp.FieldByName('title').AsString);
      qTmp.Next;
    end;
  end;
  if tip='surec' then
  begin
    QueryOpen(qTmp, 'select id, surec from def_data_surec where mc_id=' + IntToStr(MainMod.MCID) + ' order by surec');
    cbSurec.Items.Clear;
    qTmp.First;
    while not qTmp.Eof do
    begin
      cbSurec.Items.Add(qTmp.FieldByName('surec').AsString);
      qTmp.Next;
    end;
  end;
  if tip='kaynak' then
  begin
    QueryOpen(qTmp, 'select id, kaynak from def_data_kaynak where mc_id=' + IntToStr(MainMod.MCID) + ' order by kaynak');
    cbKaynak.Items.Clear;
    qTmp.First;
    while not qTmp.Eof do
    begin
      cbKaynak.Items.Add(qTmp.FieldByName('kaynak').AsString);
      qTmp.Next;
    end;
  end;
end;

function TfrmHizliEnvanterGirisi.Exec: Integer;
begin
  YardimKw := 'HizliEnvanterFormuEkleme';
  result := ShowModal;

end;

procedure TfrmHizliEnvanterGirisi.gridAmacColumnFilter(Sender: TUniDBGrid;
  const Column: TUniDBGridColumn; const Value: Variant);
begin
  if length(fltrAmac.Text) > 2 then
  begin
    tblAmac.Filtered := False;
    tblAmac.FilterOptions := [foCaseInsensitive];
    tblAmac.Filter := 'amac' + ' LIKE ' + QuotedStr('%' +(TR_Upper(fltrAmac.Text))+ '%');
    tblAmac.Filtered := True;
  end
  else if tblAmac.Filtered then
    tblAmac.Filtered := False;
end;

procedure TfrmHizliEnvanterGirisi.gridAmacColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  tblAmac.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrmHizliEnvanterGirisi.gridMetodColumnFilter(Sender: TUniDBGrid;
  const Column: TUniDBGridColumn; const Value: Variant);
begin
  if length(fltrMetod.Text) > 2 then
  begin
    tblMetod.Filtered := False;
    tblMetod.FilterOptions := [foCaseInsensitive];
    tblMetod.Filter := 'metod' + ' LIKE ' + QuotedStr('%' +(TR_Upper(fltrMetod.Text))+ '%');
    tblMetod.Filtered := True;
  end
  else if tblMetod.Filtered then
    tblMetod.Filtered := False;
end;

procedure TfrmHizliEnvanterGirisi.gridMetodColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  tblMetod.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrmHizliEnvanterGirisi.gridTarafCellClick(Column: TUniDBGridColumn);
begin
  if tblTaraf.State = dsBrowse then
    tblTaraf.Edit;
  if tblTaraf.FieldByName('sec').AsString = 'E' then
    tblTaraf.FieldByName('sec').AsString := 'H'
  else
    tblTaraf.FieldByName('sec').AsString := 'E';
  tblTaraf.Post;
end;

procedure TfrmHizliEnvanterGirisi.gridTarafColumnFilter(Sender: TUniDBGrid;
  const Column: TUniDBGridColumn; const Value: Variant);
begin
  if length(fltrTaraf.Text) > 2 then
  begin
    tblTaraf.Filtered := False;
    tblTaraf.FilterOptions := [foCaseInsensitive];
    tblTaraf.Filter := 'taraf' + ' LIKE ' + QuotedStr('%' +(TR_Upper(fltrTaraf.Text))+ '%');
    tblTaraf.Filtered := True;
  end
  else if tblTaraf.Filtered then
    tblTaraf.Filtered := False;
end;

procedure TfrmHizliEnvanterGirisi.gridTarafColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  tblTaraf.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrmHizliEnvanterGirisi.gridVeriKategorisiCellClick(
  Column: TUniDBGridColumn);
begin
// Doðan AKÇAY Takip Numarasý (ID):	2QR-ABZ-R5X2 (Talep numarasý: 575)
  if Column.FieldName ='sec' then
    begin
        if tblVeriKategorisi.State = dsBrowse then
          tblVeriKategorisi.Edit;
        if tblVeriKategorisi.FieldByName('sec').AsString = 'E' then
          tblVeriKategorisi.FieldByName('sec').AsString := 'H'
        else
          tblVeriKategorisi.FieldByName('sec').AsString := 'E';
        tblVeriKategorisi.Post;
        VeriTipiHazirla;
    end;
end;

procedure TfrmHizliEnvanterGirisi.gridVeriKategorisiColumnFilter(
  Sender: TUniDBGrid; const Column: TUniDBGridColumn; const Value: Variant);
begin
  if length(fltrKategori.Text) > 2 then
  begin
    tblVeriKategorisi.Filtered := False;
    tblVeriKategorisi.FilterOptions := [foCaseInsensitive];
    tblVeriKategorisi.Filter := 'kategori' + ' LIKE ' + QuotedStr('%' +(TR_Upper(fltrKategori.Text))+ '%');
    tblVeriKategorisi.Filtered := True;
  end
  else if tblVeriKategorisi.Filtered then
    tblVeriKategorisi.Filtered := False;
end;

procedure TfrmHizliEnvanterGirisi.gridVeriKategorisiColumnSort(
  Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  tblVeriKategorisi.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrmHizliEnvanterGirisi.gridVeriKategorisiSelectionChange(Sender: TObject);
//var
//  SQLStr : String;
//  ktgIds : String;
//  aCount : Integer;
//  i      : Integer;
//  SecList: TStringList;
begin
//  VeriTipiHazirla;
{
  if tblVeriTipi.Active = false then
    tblVeriTipi.Active := true;

  SecList := TStringList.Create;

  tblVeriTipi.First;
  while not tblVeriTipi.Eof do
  begin
    if tblVeriTipi.FieldByName('sec').AsString = 'E' then
    begin
      secList.Add(tblVeriTipi.FieldByName('veritipi_id').AsString);
    end;
    tblVeritipi.Delete;
  end;

  ktgIds := '';
  ACount := gridVeriKategorisi.SelectedRows.Count;
  for i := 0 to ACount - 1 do
  begin
    qVeriKategorisiTanim.GotoBookmark(gridVeriKategorisi.SelectedRows[i]);
    ktgIds := ktgIds + qVeriKategorisiTanim.FieldByName('id').AsString + ',';
  end;
  if ktgIds.Length > 0 then
  begin
    ktgIds := copy(ktgIds, 1, ktgIds.Length-1);
    SQLStr := 'SELECT vt.*, ktg.id ktg_id, ktg.kategori FROM def_data_veritipi vt LEFT JOIN def_data_kategori ktg ON ktg.id = vt.md_id ' +
              'WHERE vt.mc_id = ' + IntToStr(MainMod.MCID) + ' and ktg.id in ( ' + ktgIds + ') ' +
              'ORDER BY ktg.kategori, vt.veri_tipi';
    QueryOpen(qTmp, SQLStr);
    qTmp.First;
    while not qTmp.Eof do
    begin
      tblVeriTipi.Insert;
      tblVeriTipi.FieldByName('veritipi_id').AsInteger := qTmp.FieldByName('id').AsInteger;
      tblVeriTipi.FieldByName('kategori_id').AsInteger := qTmp.FieldByName('ktg_id').AsInteger;
      tblVeriTipi.FieldByName('veri_tipi').AsString    := qTmp.FieldByName('veri_tipi').AsString;
      tblVeriTipi.FieldByName('nitelik').AsString      := qTmp.FieldByName('nitelik').AsString;
      if seclist.IndexOf(tblVeriTipi.FieldByName('veritipi_id').AsString) > -1 then
        tblVeriTipi.FieldByName('sec').AsString := 'E'
      else
        tblVeriTipi.FieldByName('sec').AsString := 'H';

      tblVeriTipi.Post;
      qTmp.Next;
    end;
  end;   }
end;

procedure TfrmHizliEnvanterGirisi.gridVeriTipiCellClick(
  Column: TUniDBGridColumn);
begin
// Doðan AKÇAY Takip Numarasý (ID):	2QR-ABZ-R5X2 (Talep numarasý: 575)
if Column.FieldName='sec' then
  begin
      if tblVeriTipi.State = dsBrowse then
        tblVeriTipi.Edit;
      if tblVeriTipi.FieldByName('sec').AsString = 'E' then
        tblVeriTipi.FieldByName('sec').AsString := 'H'
      else
        tblVeriTipi.FieldByName('sec').AsString := 'E';
      tblVeriTipi.Post;
  end;
end;

procedure TfrmHizliEnvanterGirisi.gridVeriTipiColumnFilter(Sender: TUniDBGrid;
  const Column: TUniDBGridColumn; const Value: Variant);
var
  fltrstr: string;
begin
  tblVeriTipi.Filtered := False;
  if length(fltrVeriTipi.Text) > 2 then
    fltrStr := 'veri_tipi LIKE ' + QuotedStr('%' +(TR_Upper(fltrVeriTipi.Text))+ '%') + ' AND ';

  if length(fltrNitelik.Text) > 1 then
    fltrStr := fltrstr + 'nitelik LIKE ' + QuotedStr('%' +(TR_Upper(fltrNitelik.Text))+ '%') + ' AND ';

  if fltrstr <> '' then
  begin
    fltrstr := copy(fltrstr, 1, length(fltrstr)-4);
    tblVeriTipi.Filtered := False;
    tblVeriTipi.FilterOptions := [foCaseInsensitive];
    tblVeriTipi.Filter := fltrstr;
    tblVeriTipi.Filtered := True;
  end
  else if tblVeriTipi.Filtered then
    tblVeriTipi.Filtered := false;
end;

procedure TfrmHizliEnvanterGirisi.gridVeriTipiColumnSort(
  Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  tblVeriTipi.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrmHizliEnvanterGirisi.KaydetControl(Sender: TComponent;
  Res: Integer);
var
  det_id       : Integer;
  kisi_id      : Integer;
  departman_id : Integer;
  surec_id     : Integer;
  kaynak_id    : Integer;

  Nitelik  ,
  TopAmac  ,
  TopMetod ,
  SakAmac  ,
  SakMetod ,
  PayAmac  ,
  PayMetod ,
  PayTaraf : String;

  kategori_id     ,
  veritipi_id     ,
  payl_taraftipi  ,
  sakl_ssure_tip  ,
  sakl_fsure_tip  ,
  sakl_ssure_sure ,
  sakl_fsure_sure ,
  sakl_ssure_imha ,
  sakl_fsure_imha ,
  sakl_ssure_var  ,
  sakl_fsure_var  ,
  sakl_ssure      ,
  sakl_fsure      : String;

  ACount   : Integer;
  i        : Integer;
begin
  if Res <> mrYes then Exit;

  if cbKisi.Text = '' then
  begin
    MessageDlg('Kiþi Grubu seçmelisiniz!', mtError, [mbOK]);
    exit;
  end;
  if cbDepartman.Text = '' then
  begin
    MessageDlg('Departman seçmelisiniz!', mtError, [mbOK]);
    exit;
  end;
  if cbSurec.Text = '' then
  begin
    MessageDlg('Süreç seçmelisiniz!', mtError, [mbOK]);
    exit;
  end;
  if cbKaynak.Text = '' then
  begin
    MessageDlg('Veri Kaynaðý seçmelisiniz!', mtError, [mbOK]);
    exit;
  end;
  if edTarafTipi.Text = '' then
  begin
    MessageDlg('Paylaþýlan Taraf Tipi seçmelisiniz!', mtError, [mbOk]);
    Exit;
  end;

  kisi_id      := dataIDBul('def_data_kisi', 'kisi', cbKisi.Text);
  departman_id := dataIDBul('sys_deptdef', 'title', cbDepartman.Text);
  surec_id     := dataIDBul('def_data_surec', 'surec', cbSurec.Text);
  kaynak_id    := dataIDBul('def_data_kaynak', 'kaynak', cbKaynak.Text);


  if Pos(IntToStr(departman_id), MainMod.LoginInfo.Birimler) < 1 then
  begin
    MessageDlg('Seçili departmanda yetkili deðilsiniz. Ýþlem yapamazsýnýz.', mtError, [mbOk]);
    cbDepartman.SetFocus;
    Exit;
  end;

  Nitelik  := 'H';
  TopAmac  := '';
  TopMetod := '';
  SakAmac  := '';
  SakMetod := '';
  PayAmac  := '';
  PayMetod := '';
  PayTaraf := '';

  tblAmac.First;
  while not tblAmac.Eof do
  begin
    if tblAmac.FieldByName('toplama').AsString  = 'E' then
      TopAmac := TopAmac + tblAmac.FieldByName('amac_id').AsString + ',';
    if tblAmac.FieldByName('saklama').AsString  = 'E' then
      SakAmac := SakAmac + tblAmac.FieldByName('amac_id').AsString + ',';
    if tblAmac.FieldByName('paylasma').AsString = 'E' then
      PayAmac := PayAmac + tblAmac.FieldByName('amac_id').AsString + ',';
    tblAmac.Next;
  end;

  tblMetod.First;
  while not tblMetod.Eof do
  begin
    if tblMetod.FieldByName('toplama').AsString  = 'E' then
      TopMetod := TopMetod + tblMetod.FieldByName('metod_id').AsString + ',';
    if tblMetod.FieldByName('saklama').AsString  = 'E' then
      SakMetod := SakMetod + tblMetod.FieldByName('metod_id').AsString + ',';
    if tblMetod.FieldByName('paylasma').AsString = 'E' then
      PayMetod := PayMetod + tblMetod.FieldByName('metod_id').AsString + ',';
    tblMetod.Next;
  end;

  tblTaraf.First;
  while not tblTaraf.Eof do
  begin
    if tblTaraf.FieldByName('sec').AsString = 'E' then
      PayTaraf := payTaraf + tblTaraf.FieldByName('taraf_id').AsString + ',';
    tblTaraf.Next;
  end;

  if TopAmac  <> '' then System.Delete(TopAmac,  Length(TopAmac),  1);
  if TopMetod <> '' then System.Delete(TopMetod, Length(TopMetod), 1);
  if SakAmac  <> '' then System.Delete(SakAmac,  Length(SakAmac),  1);
  if SakMetod <> '' then System.Delete(SakMetod, Length(SakMetod), 1);
  if PayAmac  <> '' then System.Delete(PayAmac,  Length(PayAmac),  1);
  if PayMetod <> '' then System.Delete(PayMetod, Length(PayMetod), 1);
  if PayTaraf <> '' then System.Delete(PayTaraf, Length(PayTaraf), 1);

  if edFSureVar.Text = '' then edFSureVar.Text := 'SAKLANMIYOR';
  if edFSureVar.Text = 'SAKLANMIYOR' then
  begin
    edFImha.Text    := '';
    edFSureTip.Text := '';
    edFSure.Value   := 0;
  end
  else
  begin
    if edFImha.Text = '' then
    begin
      MessageDlg('Faaliyetin Fiziksel Saklama Ýmha Zamaný belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOK]);
      exit;
    end;
    if edFSureTip.Text = '' then
    begin
      MessageDlg('Faaliyetin Fiziksel Saklama Süresi belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOK]);
      exit;
    end;
    if edFSure.Value < 1 then
    begin
      MessageDlg('Faaliyetin Fiziksel Saklama Süresi "0" dan büyük olmalýdýr. Lütfen kontrol ediniz.', mtError, [mbOK]);
      exit;
    end;
  end;

  if edSSureVar.Text = '' then edSSureVar.Text := 'SAKLANMIYOR';
  if edSSureVar.Text = 'SAKLANMIYOR' then
  begin
    edSImha.Text    := '';
    edSSureTip.Text := '';
    edSSure.Value   := 0;
  end
  else
  begin
    if edSImha.Text = '' then
    begin
      MessageDlg('Faaliyetin Dijital Saklama Ýmha Zamaný belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOK]);
      exit;
    end;
    if edSSureTip.Text = '' then
    begin
      MessageDlg('Faaliyetin Dijital Saklama Süresi belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOK]);
      exit;
    end;
    if edSSure.Value < 1 then
    begin
      MessageDlg('Faaliyetin Dijital Saklama Süresi "0" dan büyük olmalýdýr. Lütfen kontrol ediniz.', mtError, [mbOK]);
      exit;
    end;
  end;


  payl_taraftipi  := edTarafTipi.Text;
  sakl_ssure_tip  := edSSureTip.Text;
  sakl_fsure_tip  := edFSureTip.Text;
  sakl_ssure_sure := edSSure.Text;
  sakl_fsure_sure := edFSure.Text;
  sakl_ssure_imha := edSImha.Text;
  sakl_fsure_imha := edFImha.Text;
  sakl_ssure_var  := edSSureVar.Text;
  sakl_fsure_var  := edFSureVar.Text;

  if sakl_ssure_var = 'SAKLANMIYOR' then
  begin
    sakl_ssure := '';
  end
  else
  begin
    if sakl_ssure_imha = 'BAÞLANGIÇ' then
      sakl_ssure := sakl_ssure_sure + ' ' + sakl_ssure_tip
    else
      sakl_ssure := 'DÝÐER (FAALÝYET SÜRESÝ + ' + sakl_ssure_sure + ' ' + sakl_ssure_tip + ')';
  end;

  if sakl_fsure_var = 'SAKLANMIYOR' then
  begin
    sakl_fsure := '';
  end
  else
  begin
    if sakl_fsure_imha = 'BAÞLANGIÇ' then
      sakl_fsure := sakl_fsure_sure + ' ' + sakl_fsure_tip
    else
      sakl_fsure := 'DÝÐER (FAALÝYET SÜRESÝ + ' + sakl_fsure_sure + ' ' + sakl_fsure_tip + ')';
  end;

  QueryOpen(qEnvM, 'select * from data_envanter where main_id=0 and active=''E'' and mc_id=' + IntToStr(MainMod.MCID) + ' and kisi_id=' + IntToStr(kisi_id) +
  ' and kaynak_id=' + IntToStr(kaynak_id) + ' and dept_id=' + IntToStr(departman_id) + ' and surec_id=' + IntToStr(surec_id));
  if qEnvM.FieldByName('id').AsString <> '' then
  begin
    main_id := qEnvM.Fields[0].AsInteger;
    qEnvM.Edit;
  end
  else
  begin
    main_id := GetSequence(MainMod.qSeq, 'sq_data_envanter_id');
    qEnvM.Insert;
    qEnvM.FieldByName('id').AsInteger                 := main_id;
    qEnvM.FieldByName('main_id').AsInteger            := 0;
    qEnvM.FieldByName('tarih').AsDateTime             := Date;
    qEnvM.FieldByName('idy').AsInteger                := MainMod.LoginInfo.ID;
    qEnvM.FieldByName('idt').AsDateTime               := Now;
  end;
  qEnvM.FieldByName('sdy').AsInteger                := MainMod.LoginInfo.ID;
  qEnvM.FieldByName('sdt').AsDateTime               := Now;
  qEnvM.FieldByName('mc_id').AsInteger              := MainMod.MCID;
  qEnvM.FieldByName('active').AsString              := 'E';
  qEnvM.FieldByName('dept_id').AsInteger            := departman_id;
  qEnvM.FieldByName('surec_id').AsInteger           := surec_id;
  qEnvM.FieldByName('kaynak_id').AsInteger          := kaynak_id;
  qEnvM.FieldByName('kisi_id').AsInteger            := kisi_id;
  qEnvM.FieldByName('payl_sozlesme').AsString       := 'H';
  qEnvM.FieldByName('dgr_politika').AsString        := 'H';
  qEnvM.FieldByName('dgr_sozlesme').AsString        := 'H';
  qEnvM.FieldByName('payl_taraftipi').AsString      := payl_taraftipi;
  qEnvM.FieldByName('sakl_ssure_tip').AsString      := sakl_ssure_tip;
  qEnvM.FieldByName('sakl_fsure_tip').AsString      := sakl_fsure_tip;
  qEnvM.FieldByName('sakl_ssure_sure').AsString     := sakl_ssure_sure;
  qEnvM.FieldByName('sakl_fsure_sure').AsString     := sakl_fsure_sure;
  qEnvM.FieldByName('sakl_ssure_imha').AsString     := sakl_ssure_imha;
  qEnvM.FieldByName('sakl_fsure_imha').AsString     := sakl_fsure_imha;
  qEnvM.FieldByName('sakl_ssure_var').AsString      := sakl_ssure_var;
  qEnvM.FieldByName('sakl_fsure_var').AsString      := sakl_fsure_var;
  qEnvM.FieldByName('sakl_ssure').AsString          := sakl_ssure;
  qEnvM.FieldByName('sakl_fsure').AsString          := sakl_fsure;

  qEnvM.FieldByName('nitelik').AsString        := 'H';
  qEnvM.FieldByName('topl_amac_ids').AsString  := TopAmac;
  qEnvM.FieldByName('topl_metod_ids').AsString := TopMetod;
  qEnvM.FieldByName('sakl_amac_ids').AsString  := SakAmac;
  qEnvM.FieldByName('sakl_metod_ids').AsString := SakMetod;
  qEnvM.FieldByName('payl_amac_ids').AsString  := PayAmac;
  qEnvM.FieldByName('payl_metod_ids').AsString := PayMetod;
  qEnvM.FieldByName('payl_taraf_ids').AsString := PayTaraf;


  QueryOpen(qEnvD, 'SELECT * FROM data_envanter WHERE main_id = ' + IntToStr(main_id));
  tblVeriTipi.First;
  while not tblVeriTipi.Eof do
  begin
    if tblVeriTipi.FieldByName('sec').AsString <> 'E' then
    begin
      tblVeriTipi.Next;
      continue;
    end;

    kategori_id := tblVeriTipi.FieldByName('kategori_id').AsString;
    veritipi_id := tblVeriTipi.FieldByName('veritipi_id').AsString;

    QueryOpen(qtmp, 'select * from data_envanter where main_id=' + IntToStr(main_id) + ' and veritipi_id=' + veritipi_id);
    if qtmp.RecordCount > 0 then
    begin
      tblVeriTipi.Next;
      continue;
    end;

    det_id  := GetSequence(MainMod.qSeq, 'sq_data_envanter_id');

    qEnvD.Append;
    qEnvD.FieldByName('id').AsInteger                 := GetSequence(MainMod.qSeq, 'sq_data_envanter_id');
    qEnvD.FieldByName('mc_id').AsInteger              := mainmod.MCID;
    qEnvD.FieldByName('main_id').AsInteger            := main_id;
    qEnvD.FieldByName('active').AsString              := 'E';
    qEnvD.FieldByName('idy').AsInteger                := MainMod.LoginInfo.ID;
    qEnvD.FieldByName('idt').AsDateTime               := Now;
    qEnvD.FieldByName('sdy').AsInteger                := MainMod.LoginInfo.ID;
    qEnvD.FieldByName('sdt').AsDateTime               := Now;
    qEnvD.FieldByName('tarih').AsDateTime             := Date;
    qEnvD.FieldByName('dept_id').AsInteger            := departman_id;
    qEnvD.FieldByName('surec_id').AsInteger           := surec_id;
    qEnvD.FieldByName('kaynak_id').AsInteger          := kaynak_id;
    qEnvD.FieldByName('kisi_id').AsInteger            := kisi_id;
    qEnvD.FieldByName('kategori_id').AsString         := kategori_id;
    qEnvD.FieldByName('veritipi_id').AsString         := veritipi_id;
    if tblVeriTipi.FieldByName('Nitelik').AsString = 'ON' then
      qEnvD.FieldByName('nitelik').AsString        := 'E';
    qEnvD.FieldByName('sakl_sanalonlem').AsInteger    := qEnvD.RecordCount;

    qEnvD.FieldByName('payl_sozlesme').AsString       := 'H';
    qEnvD.FieldByName('dgr_politika').AsString        := 'H';
    qEnvD.FieldByName('dgr_sozlesme').AsString        := 'H';
    qEnvD.FieldByName('payl_taraftipi').AsString      := payl_taraftipi;
    qEnvD.FieldByName('sakl_ssure_tip').AsString      := sakl_ssure_tip;
    qEnvD.FieldByName('sakl_fsure_tip').AsString      := sakl_fsure_tip;
    qEnvD.FieldByName('sakl_ssure_sure').AsString     := sakl_ssure_sure;
    qEnvD.FieldByName('sakl_fsure_sure').AsString     := sakl_fsure_sure;
    qEnvD.FieldByName('sakl_ssure_imha').AsString     := sakl_ssure_imha;
    qEnvD.FieldByName('sakl_fsure_imha').AsString     := sakl_fsure_imha;
    qEnvD.FieldByName('sakl_ssure_var').AsString      := sakl_ssure_var;
    qEnvD.FieldByName('sakl_fsure_var').AsString      := sakl_fsure_var;
    qEnvD.FieldByName('sakl_ssure').AsString          := sakl_ssure;
    qEnvD.FieldByName('sakl_fsure').AsString          := sakl_fsure;
    qEnvD.Post;

    memoKayit.Lines.Add('Detay Referans No: ' + IntToStr(det_id));

    tblVeriTipi.Next;
  end;

  qEnvM.FieldByName('nitelik').AsString := 'H';
  if vidSil <> '' then
  begin
    qEnvD.First;
    while not qEnvD.Eof do
    begin
      if pos(','+qEnvD.FieldByName('veritipi_id').AsString+',', ','+vidSil+',')>0 then
        qEnvD.Delete
      else
        qEnvD.Next;
    end;
  end;
  qEnvD.First;
  while not qEnvD.Eof do
  begin
    if qEnvD.FieldByName('nitelik').AsString = 'E' then
      qEnvM.FieldByName('nitelik').AsString := 'E';
    qEnvD.Next;
  end;
  qEnvM.Post;
  memoKayit.Lines.Add('Envanter Referans No: ' + IntToStr(main_id));

  ModalResult := mrOk;
end;

procedure TfrmHizliEnvanterGirisi.KayitHazirla;
var
  det_id       : Integer;
  kisi_id      : Integer;
  departman_id : Integer;
  surec_id     : Integer;
  kaynak_id    : Integer;

  Nitelik  ,
  TopAmac  ,
  TopMetod ,
  SakAmac  ,
  SakMetod ,
  PayAmac  ,
  PayMetod ,
  PayTaraf : String;

  NitelikStr  ,
  TopAmacStr  ,
  TopMetodStr ,
  SakAmacStr  ,
  SakMetodStr ,
  PayAmacStr  ,
  PayMetodStr ,
  PayTarafStr : String;

  kategori_id     ,
  veritipi_id     ,
  payl_taraftipi  ,
  sakl_ssure_tip  ,
  sakl_fsure_tip  ,
  sakl_ssure_sure ,
  sakl_fsure_sure ,
  sakl_ssure_imha ,
  sakl_fsure_imha ,
  sakl_ssure_var  ,
  sakl_fsure_var  ,
  sakl_ssure      ,
  sakl_fsure      : String;

  ACount   : Integer;
  i        : Integer;

  Kaydedilecek    : boolean;
  KaydedilecekSay : integer;
  HataList        : TStringList;
begin
  kaydedilecek := true;
  KaydedilecekSay := 0;
  HataList := TSTringlist.Create;

  memoKayit.Lines.Clear;
  memoKayit.Lines.Add('Veriler kontrol ediliyor...');
  if cbKisi.Text = '' then
  begin
    HataList.Add('Kiþi Grubu belirtilmemiþ.');
    kaydedilecek := false;
  end;
  if cbDepartman.Text = '' then
  begin
    HataList.Add('Departman belirtilmemiþ.');
    kaydedilecek := false;
  end;
  if cbSurec.Text = '' then
  begin
    HataList.Add('Süreç belirtilmemiþ.');
    kaydedilecek := false;
  end;
  if cbKaynak.Text = '' then
  begin
    HataList.Add('Veri Kaynaðý belirtilmemiþ.');
    kaydedilecek := false;
  end;
  if edTarafTipi.Text = '' then
  begin
    HataList.Add('Paylaþýlan Taraf belirtilmemiþ.');
    kaydedilecek := false;
  end;

  kisi_id      := dataIDBul('def_data_kisi', 'kisi', cbKisi.Text);
  departman_id := dataIDBul('sys_deptdef', 'title', cbDepartman.Text);
  surec_id     := dataIDBul('def_data_surec', 'surec', cbSurec.Text);
  kaynak_id    := dataIDBul('def_data_kaynak', 'kaynak', cbKaynak.Text);


  if Pos(IntToStr(departman_id), MainMod.LoginInfo.Birimler) < 1 then
  begin
    HataList.Add('Seçili departmanda yetkili deðilsiniz.');
    kaydedilecek := false;
  end;

  Nitelik  := 'H';
  TopAmac  := '';
  TopMetod := '';
  SakAmac  := '';
  SakMetod := '';
  PayAmac  := '';
  PayMetod := '';
  PayTaraf := '';

  tblVeriKategorisi.Filtered := False;
  tblVeriTipi.Filtered       := False;
  tblAmac.Filtered           := False;
  tblMetod.Filtered          := False;
  tblTaraf.Filtered          := False;

  tblAmac.First;
  while not tblAmac.Eof do
  begin
    if tblAmac.FieldByName('toplama').AsString  = 'E' then
    begin
      TopAmac := TopAmac + tblAmac.FieldByName('amac_id').AsString + ',';
      TopAmacStr := TopAmacStr + tblAmac.FieldByName('amac').AsString + ',';
      if pos(','+tblAmac.FieldByName('amac_id').AsString+',', ','+TopAIDs+',')<1 then
        KaydedilecekSay := KaydedilecekSay+1;
    end;
    if tblAmac.FieldByName('saklama').AsString  = 'E' then
    begin
      SakAmac := SakAmac + tblAmac.FieldByName('amac_id').AsString + ',';
      SakAmacStr := SakAmacStr + tblAmac.FieldByName('amac').AsString + ',';
      if pos(','+tblAmac.FieldByName('amac_id').AsString+',', ','+SakAIDs+',')<1 then
        KaydedilecekSay := KaydedilecekSay+1;
    end;
    if tblAmac.FieldByName('paylasma').AsString = 'E' then
    begin
      PayAmac := PayAmac + tblAmac.FieldByName('amac_id').AsString + ',';
      PayAmacStr := PayAmacStr + tblAmac.FieldByName('amac').AsString + ',';
      if pos(','+tblAmac.FieldByName('amac_id').AsString+',', ','+PayAIDs+',')<1 then
        KaydedilecekSay := KaydedilecekSay+1;
    end;
    tblAmac.Next;
  end;

  tblMetod.First;
  while not tblMetod.Eof do
  begin
    if tblMetod.FieldByName('toplama').AsString  = 'E' then
    begin
      TopMetod := TopMetod + tblMetod.FieldByName('metod_id').AsString + ',';
      TopMetodStr := TopMetodStr + tblMetod.FieldByName('metod').AsString + ',';
      if pos(','+tblMetod.FieldByName('metod_id').AsString+',', ','+TopMIDs+',')<1 then
        KaydedilecekSay := KaydedilecekSay+1;
    end;
    if tblMetod.FieldByName('saklama').AsString  = 'E' then
    begin
      SakMetod := SakMetod + tblMetod.FieldByName('metod_id').AsString + ',';
      SakMetodStr := SakMetodStr + tblMetod.FieldByName('metod').AsString + ',';
      if pos(','+tblMetod.FieldByName('metod_id').AsString+',', ','+SakMIDs+',')<1 then
        KaydedilecekSay := KaydedilecekSay+1;
    end;
    if tblMetod.FieldByName('paylasma').AsString = 'E' then
    begin
      PayMetod := PayMetod + tblMetod.FieldByName('metod_id').AsString + ',';
      PayMetodStr := PayMetodStr + tblMetod.FieldByName('metod').AsString + ',';
      if pos(','+tblMetod.FieldByName('metod_id').AsString+',', ','+PayMIDs+',')<1 then
        KaydedilecekSay := KaydedilecekSay+1;
    end;
    tblMetod.Next;
  end;

  tblTaraf.First;
  while not tblTaraf.Eof do
  begin
    if tblTaraf.FieldByName('sec').AsString = 'E' then
    begin
      PayTaraf := payTaraf + tblTaraf.FieldByName('taraf_id').AsString + ',';
      PayTarafStr := payTarafStr + tblTaraf.FieldByName('taraf').AsString + ',';
      if pos(','+tblTaraf.FieldByName('taraf_id').AsString+',', ','+PayTIDs+',')<1 then
        KaydedilecekSay := KaydedilecekSay+1;
    end;
    tblTaraf.Next;
  end;

//  if ((PayTaraf <> '') and (edTarafTipi.Text = 'PAYLAÞILMIYOR'))
//  or ((PayTaraf = '') and (edTarafTipi.Text <> 'PAYLAÞILMIYOR')) then
//  begin
//    HataList.Add('Paylaþýlan taraf bilgisi ile paylaþýlan taraf tipi uyumsuz.');
//    kaydedilecek := false;
//  end;
//  taraf tipinde paylaþýlmýyor seçilebilecek

  if ((PayAmac <> '') and (edTarafTipi.Text = 'PAYLAÞILMIYOR'))
  or ((PayAmac = '') and (edTarafTipi.Text <> 'PAYLAÞILMIYOR')) then
  begin
    HataList.Add('Paylaþým amaç bilgisi ile paylaþýlan taraf tipi uyumsuz.');
    kaydedilecek := false;
  end;

  if ((PayMetod <> '') and (edTarafTipi.Text = 'PAYLAÞILMIYOR'))
  or ((PayMetod = '') and (edTarafTipi.Text <> 'PAYLAÞILMIYOR')) then
  begin
    HataList.Add('Paylaþým metod bilgisi ile paylaþýlan taraf tipi uyumsuz.');
    kaydedilecek := false;
  end;


  if ((SakAmac <> '') and ((edFSureVar.Text = 'SAKLANMIYOR') and (edSSureVar.Text = 'SAKLANMIYOR')))
  or ((SakAmac = '')  and ((edFSureVar.Text = 'SAKLANIYOR') or  (edSSureVar.Text = 'SAKLANIYOR'))) then
  begin
    HataList.Add('Saklama amaç bilgisi ile saklanma bilgisi uyumsuz.');
    kaydedilecek := false;
  end;

  if ((SakMetod <> '') and ((edFSureVar.Text = 'SAKLANMIYOR') and (edSSureVar.Text = 'SAKLANMIYOR')))
  or ((SakMetod = '')  and ((edFSureVar.Text = 'SAKLANIYOR') or  (edSSureVar.Text = 'SAKLANIYOR'))) then
  begin
    HataList.Add('Saklama metod bilgisi ile saklama bilgisi uyumsuz.');
    kaydedilecek := false;
  end;


  if TopAmac  <> '' then System.Delete(TopAmac,  Length(TopAmac),  1);
  if TopMetod <> '' then System.Delete(TopMetod, Length(TopMetod), 1);
  if SakAmac  <> '' then System.Delete(SakAmac,  Length(SakAmac),  1);
  if SakMetod <> '' then System.Delete(SakMetod, Length(SakMetod), 1);
  if PayAmac  <> '' then System.Delete(PayAmac,  Length(PayAmac),  1);
  if PayMetod <> '' then System.Delete(PayMetod, Length(PayMetod), 1);
  if PayTaraf <> '' then System.Delete(PayTaraf, Length(PayTaraf), 1);

  if TopAmacStr  <> '' then System.Delete(TopAmacStr,  Length(TopAmacStr),  1);
  if TopMetodStr <> '' then System.Delete(TopMetodStr, Length(TopMetodStr), 1);
  if SakAmacStr  <> '' then System.Delete(SakAmacStr,  Length(SakAmacStr),  1);
  if SakMetodStr <> '' then System.Delete(SakMetodStr, Length(SakMetodStr), 1);
  if PayAmacStr  <> '' then System.Delete(PayAmacStr,  Length(PayAmacStr),  1);
  if PayMetodStr <> '' then System.Delete(PayMetodStr, Length(PayMetodStr), 1);
  if PayTarafStr <> '' then System.Delete(PayTarafStr, Length(PayTarafStr), 1);

  memoKayit.lines.add('Toplama amaçlarý: ' + TopAmacStr);
  memoKayit.lines.add('Toplama metodlarý: ' + TopMetodStr);

  if edFSureVar.Text = '' then edFSureVar.Text := 'SAKLANMIYOR';
  if edFSureVar.Text = 'SAKLANMIYOR' then
  begin
    edFImha.Text    := '';
    edFSureTip.Text := '';
    edFSure.Value   := 0;
  end
  else
  begin
    if edFImha.Text = '' then
    begin
      HataList.add('Faaliyetin Fiziksel Saklama Ýmha Zamaný belirtilmemiþ.');
      kaydedilecek := false;
     end;
    if edFSureTip.Text = '' then
    begin
      HataList.add('Faaliyetin Fiziksel Saklama Süresi belirtilmemiþ.');
      kaydedilecek := false;
    end;
    if edFSure.Value < 1 then
    begin
      HataList.add('Faaliyetin Fiziksel Saklama Süresi "0" dan büyük olmalýdýr.');
      kaydedilecek := false;
    end;
  end;

  if edSSureVar.Text = '' then edSSureVar.Text := 'SAKLANMIYOR';
  if edSSureVar.Text = 'SAKLANMIYOR' then
  begin
    edSImha.Text    := '';
    edSSureTip.Text := '';
    edSSure.Value   := 0;
  end
  else
  begin
    if edSImha.Text = '' then
    begin
      HataList.add('Faaliyetin Dijital Saklama Ýmha Zamaný belirtilmemiþ.');
      kaydedilecek := false;
    end;
    if edSSureTip.Text = '' then
    begin
      HataList.add('Faaliyetin Dijital Saklama Süresi belirtilmemiþ.');
      kaydedilecek := false;
    end;
    if edSSure.Value < 1 then
    begin
      HataList.add('Faaliyetin Dijital Saklama Süresi "0" dan büyük olmalýdýr.');
      kaydedilecek := false;
    end;
  end;

  payl_taraftipi  := edTarafTipi.Text;
  sakl_ssure_tip  := edSSureTip.Text;
  sakl_fsure_tip  := edFSureTip.Text;
  sakl_ssure_sure := edSSure.Text;
  sakl_fsure_sure := edFSure.Text;
  sakl_ssure_imha := edSImha.Text;
  sakl_fsure_imha := edFImha.Text;
  sakl_ssure_var  := edSSureVar.Text;
  sakl_fsure_var  := edFSureVar.Text;

  if sakl_fsure_var = 'SAKLANMIYOR' then
  begin
    sakl_fsure := '';
    memoKayit.lines.add('Fiziksel saklanma: saklanmýyor');
  end
  else
  begin
    if sakl_fsure_imha = 'BAÞLANGIÇ' then
      sakl_fsure := sakl_fsure_sure + ' ' + sakl_fsure_tip
    else
      sakl_fsure := 'DÝÐER (FAALÝYET SÜRESÝ + ' + sakl_fsure_sure + ' ' + sakl_fsure_tip + ')';
    memoKayit.lines.add('Fiziksel saklanma: ' + sakl_fsure);
  end;

  if sakl_ssure_var = 'SAKLANMIYOR' then
  begin
    sakl_ssure := '';
    memoKayit.lines.add('Dijital saklanma: saklanmýyor');
  end
  else
  begin
    if sakl_ssure_imha = 'BAÞLANGIÇ' then
      sakl_ssure := sakl_ssure_sure + ' ' + sakl_ssure_tip
    else
      sakl_ssure := 'DÝÐER (FAALÝYET SÜRESÝ + ' + sakl_ssure_sure + ' ' + sakl_ssure_tip + ')';
    memoKayit.lines.add('Dijital saklanma: ' + sakl_ssure);
  end;

  memoKayit.lines.add('Saklama amaçlarý: ' + SakAmacStr);
  memoKayit.lines.add('Saklama metodlarý: ' + SakMetodStr);

  if (sakl_ssure_var = 'SAKLANIYOR') and (sakl_fsure_var = 'SAKLANIYOR') and (SakAmac = '') then
  begin
    HataList.Add('Saklama amacý belirtilmemiþ.');
    kaydedilecek := false;
  end;
  if (sakl_ssure_var = 'SAKLANIYOR') and (sakl_fsure_var = 'SAKLANIYOR') and (SakMetod = '') then
  begin
    HataList.Add('Saklama metodu belirtilmemiþ.');
    kaydedilecek := false;
  end;

  memoKayit.lines.add('Paylaþma: ' + payl_taraftipi);
  memoKayit.lines.add('Paylaþýlan taraflar: ' + PayTarafStr);
  memoKayit.lines.add('Paylaþma amaçlarý: ' + PayAmacStr);
  memoKayit.lines.add('Paylaþma metodlarý: ' + PayMetodStr);

  if (payl_taraftipi <> 'PAYLAÞILMIYOR') and (PayMetod = '') then
  begin
    HataList.Add('Paylaþma metodu belirtilmemiþ.');
    kaydedilecek := false;
  end;
  if (payl_taraftipi <> 'PAYLAÞILMIYOR') and (PayAmac = '') then
  begin
    HataList.Add('Paylaþma amacý belirtilmemiþ.');
    kaydedilecek := false;
  end;
//  if (payl_taraftipi <> 'PAYLAÞILMIYOR') and (PayTaraf = '') then
//  begin
//    HataList.Add('Paylaþýlan taraflar belirtilmemiþ.');
//    kaydedilecek := false;
//  end;
  if payl_taraftipi <> PayTip then
    kaydedilecekSay := kaydedilecekSay+1;


  if Kaydedilecek = false then
  begin
    memoKayit.Lines.Add('********************************************************************************************************************************');
    memoKayit.Lines.Add('Kayýt iþlemine devam edilemez, lütfen eksik veya hatalý bilgileri kontrol ediniz:');
    for i := 0 to hataList.Count-1 do
      memoKayit.Lines.Add(HataList[i]);
    btnKaydet.Enabled := false;
    HataList.Free;
    exit;
  end;

  QueryOpen(qEnvM, 'select * from data_envanter where main_id=0 and mc_id=' + IntToStr(MainMod.MCID) + ' and kisi_id=' + IntToStr(kisi_id) +
  ' and kaynak_id=' + IntToStr(kaynak_id) + ' and dept_id=' + IntToStr(departman_id) + ' and surec_id=' + IntToStr(surec_id));
  if qEnvM.FieldByName('id').AsString <> '' then
  begin
    main_id := qEnvM.Fields[0].AsInteger;
    memoKayit.Lines.Add('Ref. No: ' + IntToStr(main_id));
    memoKayit.Lines.Add('Ayný temel bilgiler ile kayýt mevcut, detaylar kontrol ediliyor.');
  end
  else
  begin
    memoKayit.Lines.Add('Yeni envanter kaydý eklenecek, detaylar kontrol ediliyor.');
  end;

  vidEkle := '';
  vidSil  := '';
  QueryOpen(qEnvD, 'SELECT * FROM data_envanter WHERE main_id = ' + IntToStr(main_id));
  tblVeriTipi.First;
  while not tblVeriTipi.Eof do
  begin
    if tblVeriTipi.FieldByName('sec').AsString <> 'E' then
    begin
      tblVeriTipi.Next;
      continue;
    end;

    kategori_id := tblVeriTipi.FieldByName('kategori_id').AsString;
    veritipi_id := tblVeriTipi.FieldByName('veritipi_id').AsString;
    videkle := vidEkle + veritipi_id + ',';

    QueryOpen(qtmp, 'select * from data_envanter where main_id=' + IntToStr(main_id) + ' and veritipi_id=' + veritipi_id);
    if qtmp.RecordCount > 0 then
    begin
      memoKayit.Lines.Add('Veri tipi MEVCUT: ' + tblVeriTipi.FieldByName('veri_tipi').AsString);
      tblVeriTipi.Next;
      continue;
    end;

    memoKayit.Lines.Add('Veri tipi EKLENECEK: ' + tblVeriTipi.FieldByName('veri_tipi').AsString);
    kaydedilecekSay := kaydedilecekSay+1;
    tblVeriTipi.Next;
  end;

  if vidEkle <> '' then
  begin
    vidEkle := copy(vidEkle, 1, Length(vidEkle)-1);
    QueryOpen(qtmp, 'select env.veritipi_id, vt.veri_tipi from data_envanter env, def_data_veritipi vt where env.veritipi_id=vt.id and env.main_id=' +
                    IntToStr(main_id) + ' and not env.veritipi_id in (' + vidEkle + ')');
    while not qTmp.Eof do
    begin
      vidSil := vidSil + qTmp.FieldByName('veritipi_id').AsString + ',';
      memoKayit.Lines.Add('Veri tipi SÝLÝNECEK: ' + qTmp.FieldByName('veri_tipi').AsString);
      kaydedilecekSay := kaydedilecekSay+1;
      qTmp.Next;
    end;

  end;

  if Kaydedilecek = false then
  begin
    memoKayit.Lines.Add('********************************************************************************************************************************');
    memoKayit.Lines.Add('Kayýt iþlemine devam edilemez, lütfen eksik veya hatalý bilgileri kontrol ediniz.');
    btnKaydet.Enabled := false;
  end
  else
  begin
    if kaydedilecekSay > 0 then
    begin
      memoKayit.Lines.Add(IntToStr(kaydedilecekSay) + ' satýr sisteme kaydedilecek, iþleme devam etmek için "Kaydet" butonuna týklayýn.');
      btnKaydet.Enabled := true;
    end
    else
    begin
      memoKayit.Lines.Add('********************************************************************************************************************************');
      memoKayit.Lines.Add('Kaydedilecek yeni veri bulunmamaktadýr.');
      btnKaydet.Enabled := false;
    end;
  end;

end;

procedure TfrmHizliEnvanterGirisi.MetodHazirla;
var
  topList,
  sakList,
  payList: TStringList;
  topS,
  sakS,
  payS: String;
begin
  topList := TStringList.Create;
  sakList := TStringList.Create;
  payList := TStringList.Create;

  TopS := topMIds;
  while tops <> '' do
  begin
    topList.Add(ParseString(tops, ','));
  end;
  saks := sakMIDs;
  while saks <> '' do
  begin
    sakList.Add(ParseString(saks, ','));
  end;
  pays := payMIDs;
  while pays <> '' do
  begin
    payList.Add(ParseString(pays, ','));
  end;

  if tblMetod.Active = false then
    tblMetod.Active := true;
  tblMetod.First;
  while not tblMetod.Eof do
  begin
    if tblMetod.FieldByName('toplama').AsString = 'E' then
      topList.Add(tblMetod.FieldByName('metod_id').AsString);
    if tblMetod.FieldByName('saklama').AsString = 'E' then
      sakList.Add(tblMetod.FieldByName('metod_id').AsString);
    if tblMetod.FieldByName('paylasma').AsString = 'E' then
      payList.Add(tblMetod.FieldByName('metod_id').AsString);
    tblMetod.Delete;
  end;

  queryOpen(qTmp, 'SELECT id, metod, toplama, saklama, paylasma FROM def_data_metod WHERE mc_id=' + IntToStr(mainMod.MCID) + ' ORDER BY metod');
  qTmp.First;
  while not qTmp.Eof do
  begin
    tblMetod.Append;
    tblMetod.FieldByName('metod_id').AsInteger       := qTmp.FieldByName('id').AsInteger;
    tblMetod.FieldByName('metod').AsString           := qTmp.FieldByName('metod').AsString;
    tblMetod.FieldByName('toplamasecilir').AsString  := qTmp.FieldByName('toplama').AsString;
    tblMetod.FieldByName('saklamasecilir').AsString  := qTmp.FieldByName('saklama').AsString;
    tblMetod.FieldByName('paylasmasecilir').AsString := qTmp.FieldByName('paylasma').AsString;

    if topList.IndexOf(tblMetod.FieldByName('metod_id').AsString) > -1 then
      tblMetod.FieldByName('toplama').AsString := 'E'
    else
      tblMetod.FieldByName('toplama').AsString := 'H';
    if sakList.IndexOf(tblMetod.FieldByName('metod_id').AsString) > -1 then
      tblMetod.FieldByName('saklama').AsString := 'E'
    else
      tblMetod.FieldByName('saklama').AsString := 'H';
    if payList.IndexOf(tblMetod.FieldByName('metod_id').AsString) > -1 then
      tblMetod.FieldByName('paylasma').AsString := 'E'
    else
      tblMetod.FieldByName('paylasma').AsString := 'H';

    tblMetod.Post;
    qTmp.Next;
  end;
end;

procedure TfrmHizliEnvanterGirisi.TarafHazirla;
var
  secList: TStringList;
  pays   : String;
begin
  secList := TStringList.Create;
  pays := payTIDs;
  while pays <> '' do
  begin
    secList.Add(ParseString(pays, ','));
  end;

  if tblTaraf.Active = false then
    tblTaraf.Active := true;
  tblTaraf.First;
  while not tblTaraf.Eof do
  begin
    if tblTaraf.FieldByName('sec').AsString = 'E' then
      secList.Add(tblTaraf.FieldByName('taraf_id').AsString);
    tblTaraf.Delete;
  end;

  queryOpen(qTmp, 'SELECT id, taraf FROM def_data_taraf WHERE mc_id=' + IntToStr(mainMod.MCID) + ' ORDER BY taraf');
  qTmp.First;
  while not qTmp.Eof do
  begin
    tblTaraf.Append;
    tblTaraf.FieldByName('taraf_id').AsInteger       := qTmp.FieldByName('id').AsInteger;
    tblTaraf.FieldByName('taraf').AsString           := qTmp.FieldByName('taraf').AsString;
    if secList.IndexOf(tblTaraf.FieldByName('taraf_id').AsString) > -1 then
      tblTaraf.FieldByName('sec').AsString := 'E'
    else
      tblTaraf.FieldByName('sec').AsString := 'H';
    tblTaraf.Post;
    qTmp.Next;
  end;

end;

function TfrmHizliEnvanterGirisi.DataDescBul(aTable, aField, aID: String): String;
begin
  QueryOpen(qTmp, 'SELECT id, ' + afield + ' FROM ' + aTable + ' WHERE id = ''' + aID + ''' and mc_id=' + IntToStr(MainMod.MCID) );
  if qTmp.FieldByName('id').AsString = aID then
    result := qTmp.FieldByName(aField).AsString
  else
    result := '';
end;

function TfrmHizliEnvanterGirisi.DataIDBul(aTable, aField, aData: String): Integer;
begin
  QueryOpen(qTmp, 'SELECT id, ' + afield + ' FROM ' + aTable + ' WHERE ' + aField + ' = ''' + aData + ''' and mc_id=' + IntToStr(MainMod.MCID) );
  if qTmp.FieldByName(aField).AsString = aData then
    result := qTmp.FieldByName('id').AsInteger
  else
    result := 0;
end;

procedure TfrmHizliEnvanterGirisi.DuzenleControl(Sender: TComponent;
  Res: Integer);
var
  Nitelik  ,
  TopAmac  ,
  TopMetod ,
  SakAmac  ,
  SakMetod ,
  PayAmac  ,
  PayMetod ,
  PayTaraf : String;

begin
  if Res <> mrYes then Exit;

  edSSureVar.Text := qEnvM.FieldByName('sakl_ssure_var').AsString;
  edSSure.Text    := qEnvM.FieldByName('sakl_ssure_sure').AsString;
  edSSureTip.Text := qEnvM.FieldByName('sakl_ssure_tip').AsString;
  edSImha.Text    := qEnvM.FieldByName('sakl_ssure_imha').AsString;
  edFSureVar.Text := qEnvM.FieldByName('sakl_fsure_var').AsString;
  edFSure.Text    := qEnvM.FieldByName('sakl_fsure_sure').AsString;
  edFSureTip.Text := qEnvM.FieldByName('sakl_fsure_tip').AsString;
  edFImha.Text    := qEnvM.FieldByName('sakl_fsure_imha').AsString;

  edTarafTipi.Text := qEnvM.FieldByName('payl_taraftipi').AsString;

  TopAIDs := qEnvM.FieldByName('topl_amac_ids').AsString;
  TopMIDs := qEnvM.FieldByName('topl_metod_ids').AsString;
  SakAIDs := qEnvM.FieldByName('sakl_amac_ids').AsString;
  SakMIDs := qEnvM.FieldByName('sakl_metod_ids').AsString;
  PayAIDs := qEnvM.FieldByName('payl_amac_ids').AsString;
  PayMIDs := qEnvM.FieldByName('payl_metod_ids').AsString;
  PayTIDs := qEnvM.FieldByName('payl_taraf_ids').AsString;
  PayTip  := qEnvM.FieldByName('payl_taraftipi').AsString;

  QueryOpen(qTmp, 'select env.veritipi_id, vt.md_id ' +
                  'from data_envanter env ' +
                  'left join def_data_veritipi vt on env.veritipi_id=vt.id ' +
                  'where env.main_id=' + IntToStr(main_id));
  qTmp.First;
  while not qtmp.Eof do
  begin
    veriIDs := veriIDs + qTmp.FieldByName('veritipi_id').AsString + ',';
    if pos(','+qTmp.FieldByName('md_id').AsString+',', ','+katIDs+',')<1 then
      katIDs := katIDs + qTmp.FieldByName('md_id').AsString + ',';
    qTmp.Next;
  end;
  if veriIDs <> '' then
    veriIDs := copy(veriIDs, 1, Length(veriIDs)-1);
  if katIDs <> '' then
    katIDs := copy(katIDs, 1, Length(katIDs)-1);

  VeriKategorisiHazirla;
  pg.ActivePage := tsVeri;
end;

procedure TfrmHizliEnvanterGirisi.edFSureVarChange(Sender: TObject);
begin
  if edFSureVar.Text = 'SAKLANIYOR' then
  begin
    edFImha.Enabled := True;
    edFSure.Enabled := True;
    edFSureTip.Enabled := True;
  end
  else
  begin
    edFImha.Enabled := False;
    edFSure.Enabled := False;
    edFSureTip.Enabled := False;
  end;
end;

function TfrmHizliEnvanterGirisi.Edit(env_main_id: Integer): Integer;
begin
  QueryOpen(qEnvM, 'select * from data_envanter where main_id=0 and active=''E'' and id=' + IntToStr(env_main_id));
  if qEnvM.FieldByName('id').AsString <> '' then
  begin
    main_id := qEnvM.Fields[0].AsInteger;

    cbKisi.Text      := DataDescBul('def_data_kisi', 'kisi', qEnvM.FieldByName('kisi_id').AsString);
    cbDepartman.Text := DataDescBul('sys_deptdef', 'title', qEnvM.FieldByName('dept_id').AsString);
    cbSurec.Text     := DataDescBul('def_data_surec', 'surec', qEnvM.FieldByName('surec_id').AsString);
    cbKaynak.Text    := DataDescBul('def_data_kaynak', 'kaynak', qEnvM.FieldByName('kaynak_id').AsString);

    MessageDlg('Mevcut envanter kaydýný açýp düzenlemek istiyor musunuz?', mtWarning, mbYesNo, DuzenleControl);
    YardimKw := 'HizliEnvanterFormuDuzenleme';
    result := ShowModal;
  end
  else
  begin
    MessageDlg('Envanter kaydý bulunamadý. Lütfen Envanter Formlarý ekranýndan deneyiniz.', mtWarning, [mbok]);
    result := mrCancel;
  end;

end;

procedure TfrmHizliEnvanterGirisi.edSSureVarChange(Sender: TObject);
begin
  if edSSureVar.Text = 'SAKLANIYOR' then
  begin
    edSImha.Enabled := True;
    edSSure.Enabled := True;
    edSSureTip.Enabled := True;
  end
  else
  begin
    edSImha.Enabled := False;
    edSSure.Enabled := False;
    edSSureTip.Enabled := False;
  end;
end;

procedure TfrmHizliEnvanterGirisi.edTarafTipiChange(Sender: TObject);
begin
//  if edTarafTipi.Text = 'PAYLAÞILMIYOR' then
//  begin
//    gridTaraf.Enabled := false;
//  end
//  else
//  begin
//    gridTaraf.Enabled := True;
//  end;
end;

procedure TfrmHizliEnvanterGirisi.tsAmacBeforeActivate(Sender: TObject;
  var AllowActivate: Boolean);
begin
  AmacHazirla;
end;

procedure TfrmHizliEnvanterGirisi.tsMetodBeforeActivate(Sender: TObject;
  var AllowActivate: Boolean);
begin
  MetodHazirla;
end;

procedure TfrmHizliEnvanterGirisi.tsPaylasmaBeforeActivate(Sender: TObject;
  var AllowActivate: Boolean);
begin
  TarafHazirla;
end;

procedure TfrmHizliEnvanterGirisi.tsSonucBeforeActivate(Sender: TObject;
  var AllowActivate: Boolean);
begin
  KayitHazirla;
end;

procedure TfrmHizliEnvanterGirisi.tsVeriBeforeActivate(Sender: TObject;
  var AllowActivate: Boolean);
begin
//  VeriKategorisiHazirla;
end;

procedure TfrmHizliEnvanterGirisi.UniFormCreate(Sender: TObject);
begin
  pg.ActivePage := tsTemel;
  ComboDoldur('kisi');
  ComboDoldur('departman');
  ComboDoldur('surec');
  ComboDoldur('kaynak');
  VeriKategorisiHazirla;
  AmacHazirla;
  MetodHazirla;
  TarafHazirla;
end;

procedure TfrmHizliEnvanterGirisi.VeriKategorisiHazirla;
var
  SQLStr : String;
  ktgIds : String;
  aCount : Integer;
  i      : Integer;
  SecList: TStringList;
  ids    : String;
begin
  gridVeriKategorisi.BeginUpdate;
  SecList := TStringList.Create;
  ids := katIDs;
  while ids <> '' do
  begin
    secList.Add(ParseString(ids, ','));
  end;

  if tblVeriKategorisi.Active = false then
    tblVeriKategorisi.Active := true;

  gridVeriKategorisi.ClearFilters;
  tblVeriKategorisi.First;
  while not tblVeriKategorisi.Eof do
  begin
    if tblVeriKategorisi.FieldByName('sec').AsString = 'E' then
    begin
      secList.Add(tblVeriKategorisi.FieldByName('kategori_id').AsString);
    end;
    tblVeriKategorisi.Delete;
  end;

  SQLStr := 'SELECT ktg.id, ktg.kategori FROM def_data_kategori ktg WHERE ktg.mc_id = ' +
            IntToStr(MainMod.MCID) + ' ORDER BY ktg.kategori';
  QueryOpen(qTmp, SQLStr);
  qTmp.First;
  while not qTmp.Eof do
  begin
    tblVeriKategorisi.Append;
    tblVeriKategorisi.FieldByName('kategori_id').AsInteger := qTmp.FieldByName('id').AsInteger;
    tblVeriKategorisi.FieldByName('kategori').AsString    := qTmp.FieldByName('kategori').AsString;
    if seclist.IndexOf(tblVeriKategorisi.FieldByName('kategori_id').AsString) > -1 then
      tblVeriKategorisi.FieldByName('sec').AsString := 'E'
    else
      tblVeriKategorisi.FieldByName('sec').AsString := 'H';

    tblVeriKategorisi.Post;
    qTmp.Next;
  end;
  gridVeriKategorisi.EndUpdate;
  VeriTipiHazirla;
end;


procedure TfrmHizliEnvanterGirisi.VeriTipiHazirla;
var
  SQLStr : String;
  ktgIds : String;
  aCount : Integer;
  i      : Integer;
  SecList: TStringList;
  MyBook : TBookmark;
  ids    : String;
begin
  gridVeriTipi.BeginUpdate;
  SecList := TStringList.Create;
  ids := veriIDs;
  while ids <> '' do
  begin
    secList.Add(ParseString(ids, ','));
  end;

  if tblVeriTipi.Active = false then
    tblVeriTipi.Active := true;

  gridVeriTipi.ClearFilters;
  tblVeriTipi.First;
  while not tblVeriTipi.Eof do
  begin
    if tblVeriTipi.FieldByName('sec').AsString = 'E' then
    begin
      secList.Add(tblVeriTipi.FieldByName('veritipi_id').AsString);
    end;
    tblVeritipi.Delete;
  end;

  MyBook := tblVeriKategorisi.GetBookmark;
  ktgIds := '';
  tblVeriKategorisi.First;
  while not tblVeriKategorisi.Eof do
  begin
    if tblVeriKategorisi.FieldByName('sec').AsString = 'E' then
    begin
      ktgIds := ktgIds + tblVeriKategorisi.FieldByName('kategori_id').AsString + ',';
    end;
    tblVeriKategorisi.Next;
  end;
  tblVeriKategorisi.GotoBookmark(MyBook);
  tblVeriKategorisi.FreeBookmark(MyBook);

  if ktgIds.Length > 0 then
  begin
    ktgIds := copy(ktgIds, 1, ktgIds.Length-1);
    SQLStr := 'SELECT vt.*, ktg.id ktg_id, ktg.kategori FROM def_data_veritipi vt LEFT JOIN def_data_kategori ktg ON ktg.id = vt.md_id ' +
              'WHERE vt.mc_id = ' + IntToStr(MainMod.MCID) + ' and ktg.id in ( ' + ktgIds + ') ' +
              'ORDER BY vt.veri_tipi';
    QueryOpen(qTmp, SQLStr);
    qTmp.First;
    while not qTmp.Eof do
    begin
      tblVeriTipi.Append;
      tblVeriTipi.FieldByName('veritipi_id').AsInteger := qTmp.FieldByName('id').AsInteger;
      tblVeriTipi.FieldByName('kategori_id').AsInteger := qTmp.FieldByName('ktg_id').AsInteger;
      tblVeriTipi.FieldByName('kategori').AsString     := qTmp.FieldByName('kategori').AsString;
      tblVeriTipi.FieldByName('veri_tipi').AsString    := qTmp.FieldByName('veri_tipi').AsString;
      tblVeriTipi.FieldByName('nitelik').AsString      := qTmp.FieldByName('nitelik').AsString;
      if seclist.IndexOf(tblVeriTipi.FieldByName('veritipi_id').AsString) > -1 then
        tblVeriTipi.FieldByName('sec').AsString := 'E'
      else
        tblVeriTipi.FieldByName('sec').AsString := 'H';

      tblVeriTipi.Post;
      qTmp.Next;
    end;
  end;
  gridVeriTipi.EndUpdate;
end;

end.
