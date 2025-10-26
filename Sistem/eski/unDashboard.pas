unit unDashboard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uniGUITypes,
  uniGUIAbstractClasses, uniGUIClasses, uniGUIFrame, uniLabel, Vcl.Imaging.pngimage, uniImage,
  uniGUIBaseClasses, uniPanel, uniChart, uniScrollBox, uniBasicGrid, uniDBGrid, Data.DB, MemDS,
  DBAccess, Uni, uniThreadTimer, uniTimer, VirtualTable, VirtualQuery,
  uniGridExporters, System.IniFiles;

type
  TfrDashboard = class(TUniFrame)
    UniScrollBox1: TUniScrollBox;
    UniPanel2: TUniPanel;
    lbCnt_Envanter: TUniLabel;
    UniLabel2: TUniLabel;
    UniImage1: TUniImage;
    UniPanel1: TUniPanel;
    UniPanel3: TUniPanel;
    lbCnt_Kontrol: TUniLabel;
    UniLabel4: TUniLabel;
    UniImage2: TUniImage;
    UniPanel6: TUniPanel;
    UniPanel7: TUniPanel;
    lbCnt_AcikRiza: TUniLabel;
    UniLabel6: TUniLabel;
    UniImage3: TUniImage;
    UniPanel10: TUniPanel;
    UniPanel11: TUniPanel;
    lbCnt_Aydinlatma: TUniLabel;
    UniLabel8: TUniLabel;
    UniImage4: TUniImage;
    UniPanel13: TUniPanel;
    UniPanel14: TUniPanel;
    lbCnt_Basvuru: TUniLabel;
    UniLabel10: TUniLabel;
    UniImage5: TUniImage;
    UniPanel16: TUniPanel;
    UniPanel4: TUniPanel;
    UniPanel5: TUniPanel;
    UniPanel8: TUniPanel;
    UniPanel9: TUniPanel;
    UniPanel12: TUniPanel;
    UniImage6: TUniImage;
    UniImage7: TUniImage;
    UniImage8: TUniImage;
    UniImage9: TUniImage;
    UniImage10: TUniImage;
    pnlEnvDetay: TUniPanel;
    grdEnvDetay: TUniDBGrid;
    qTmp: TUniQuery;
    qEnvDetay: TUniQuery;
    dsEnvDetay: TUniDataSource;
    UniPanel17: TUniPanel;
    UniLabel1: TUniLabel;
    imgRefresh0: TUniImage;
    chtEnvDetay: TUniChart;
    serEnvDetay: TUniBarSeries;
    UniPanel15: TUniPanel;
    UniPanel18: TUniPanel;
    UniPanel19: TUniPanel;
    UniPanel20: TUniPanel;
    UniPanel21: TUniPanel;
    UniPanel22: TUniPanel;
    UniPanel23: TUniPanel;
    UniPanel24: TUniPanel;
    UniPanel25: TUniPanel;
    UniLabel3: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel7: TUniLabel;
    UniLabel9: TUniLabel;
    UniLabel11: TUniLabel;
    UniLabel12: TUniLabel;
    UniLabel13: TUniLabel;
    UniPanel26: TUniPanel;
    UniLabel14: TUniLabel;
    lbist_Kaynak: TUniLabel;
    lbist_Kategori: TUniLabel;
    lbist_VTipi: TUniLabel;
    lbist_TopAmac: TUniLabel;
    lbist_Grup: TUniLabel;
    lbist_Kisi: TUniLabel;
    lbist_Yabanci: TUniLabel;
    lbist_Tedbir: TUniLabel;
    UniPanel27: TUniPanel;
    UniLabel15: TUniLabel;
    lbist_SakAmac: TUniLabel;
    UniPanel28: TUniPanel;
    UniLabel17: TUniLabel;
    lbist_PayAmac: TUniLabel;
    hdrEnvDetay: TUniPanel;
    pnlKontrol: TUniPanel;
    grdKontrol: TUniDBGrid;
    UniPanel30: TUniPanel;
    tblKontrol: TVirtualTable;
    qKontrol: TVirtualQuery;
    dsKontrol: TUniDataSource;
    UniPanel29: TUniPanel;
    UniPanel31: TUniPanel;
    UniPanel32: TUniPanel;
    UniPanel33: TUniPanel;
    UniPanel34: TUniPanel;
    UniPanel35: TUniPanel;
    chtKontrol: TUniChart;
    serKontrol: TUniPieSeries;
    UniPanel36: TUniPanel;
    UniPanel37: TUniPanel;
    UniPanel38: TUniPanel;
    UniPanel39: TUniPanel;
    UniLabel16: TUniLabel;
    UniPanel40: TUniPanel;
    UniPanel41: TUniPanel;
    UniLabel18: TUniLabel;
    UniLabel19: TUniLabel;
    UniPanel42: TUniPanel;
    UniPanel43: TUniPanel;
    UniPanel45: TUniPanel;
    chtBasvuru: TUniChart;
    UniPanel46: TUniPanel;
    UniPanel47: TUniPanel;
    UniLabel22: TUniLabel;
    lbBsvCevapli: TUniLabel;
    UniPanel44: TUniPanel;
    UniPanel48: TUniPanel;
    lbBsvCevapsiz: TUniLabel;
    UniPanel49: TUniPanel;
    UniLabel21: TUniLabel;
    serBasvuru: TUniPieSeries;
    UniPanel50: TUniPanel;
    UniPanel51: TUniPanel;
    UniPanel52: TUniPanel;
    UniLabel20: TUniLabel;
    lbBsvBekleme: TUniLabel;
    UniPanel53: TUniPanel;
    UniLabel24: TUniLabel;
    lbBsvInceleme: TUniLabel;
    UniPanel54: TUniPanel;
    UniPanel55: TUniPanel;
    UniLabel26: TUniLabel;
    lbBsv15Gun: TUniLabel;
    UniPanel56: TUniPanel;
    UniLabel28: TUniLabel;
    lbBsv10Gun: TUniLabel;
    UniPanel57: TUniPanel;
    UniLabel30: TUniLabel;
    lbBsv05Gun: TUniLabel;
    UniImage13: TUniImage;
    UniImage14: TUniImage;
    imgRefresh1: TUniImage;
    imgRefresh5: TUniImage;
    imgRefresh2: TUniImage;
    imgRefresh3: TUniImage;
    imgRefresh4: TUniImage;
    UniPanel58: TUniPanel;
    UniLabel23: TUniLabel;
    lbBsv30Gun: TUniLabel;
    serBsvGray: TUniPieSeries;
    UniImage20: TUniImage;
    UniPanel59: TUniPanel;
    UniPanel60: TUniPanel;
    imgRefresh6: TUniImage;
    grdDuyuru: TUniDBGrid;
    dsDuyuru: TUniDataSource;
    DshTimer: TUniTimer;
    qDuyuru: TUniQuery;
    imgDuyuruListesi: TUniImage;
    imgGridToXls: TUniImage;
    lblVersiyon: TUniLabel;
    qedanismaSoruSeti: TUniQuery;
    dsedanismaSoruSeti: TUniDataSource;
    UniPanel61: TUniPanel;
    UniPanel62: TUniPanel;
    UniPanel63: TUniPanel;
    procedure UniFrameCreate(Sender: TObject);
    procedure DshTimerTimer(Sender: TObject);
    procedure EnvDetayRefresh(Sender: TObject);
    procedure grdKontrolDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn;
      Attribs: TUniCellAttribs);
    procedure UniPanel4Click(Sender: TObject);
    procedure UniPanel5Click(Sender: TObject);
    procedure UniPanel8Click(Sender: TObject);
    procedure UniPanel9Click(Sender: TObject);
    procedure UniPanel12Click(Sender: TObject);
    procedure imgRefresh0Click(Sender: TObject);
    procedure imgDuyuruListesiClick(Sender: TObject);
    procedure grdDuyuruDblClick(Sender: TObject);
    procedure imgGridToXlsClick(Sender: TObject);
  private
    LoadingData : Boolean;
    procedure PrepHeaderReport;
    procedure PrepEnvanterIstatistik;
    procedure PrepEnvanterDetay(Index: Integer);
    procedure PrepKontrolKaynakKisiDetay;
    procedure PrepBasvuruDetay;
    procedure PrepDuyuru;
    procedure PrepSoruSeti;
  public
    procedure PrepareReport;
  end;

implementation

{$R *.dfm}

uses MainModule, McMLib, Main, unAyarlarTanim, unDuyuruListe, unDuyuruTanim, unDuyuruDetay;

procedure TfrDashboard.PrepEnvanterDetay(Index: Integer);
var
  IDList : String;
begin
  case Index of
    1 : // Veri Kaynaklarý
        begin
          QueryOpen(qEnvDetay, 'SELECT ky.kaynak AS alanadi, COUNT(env.id) AS adet ' +
                               'FROM data_envanter env LEFT JOIN def_data_kaynak ky ON env.kaynak_id = ky.id WHERE env.active = ''E'' AND env.main_id = 0 AND env.mc_id = ' +
                               IntToStr(MainMod.MCID) + ' GROUP BY ky.kaynak ORDER BY 2 DESC');
          hdrEnvDetay.Caption  := 'Envanter Kayýtlarýnda Kullanýlan Veri Kaynaklarý   : ' + IntToStr(qEnvDetay.RecordCount) + ' ADET';
        end;
    2 : // Veri Kategorileri
        begin
          QueryOpen(qEnvDetay, 'SELECT k.kategori as alanadi, COUNT(env.id) AS adet ' +
                               'FROM data_envanter env LEFT JOIN def_data_kategori k ON env.kategori_id = k.id WHERE env.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' +
                               IntToStr(MainMod.MCID) + ' GROUP BY k.kategori ORDER BY 2 DESC');
          hdrEnvDetay.Caption  := 'Envanter Kayýtlarýnda Toplanan Veri Kategorileri   : ' + IntToStr(qEnvDetay.RecordCount) + ' ADET';
        end;
    3 : // Veri Tipleri
        begin
          QueryOpen(qEnvDetay, 'SELECT veri_tipi as alanadi, COUNT(env.id) AS adet ' +
                               'FROM data_envanter env LEFT JOIN def_data_veritipi vt ON env.veritipi_id = vt.id WHERE env.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' +
                               IntToStr(MainMod.MCID) + ' GROUP BY veri_tipi ORDER BY 2 DESC');
          hdrEnvDetay.Caption  := 'Envanter Kayýtlarýnda Toplanan Veri Tipleri   : ' + IntToStr(qEnvDetay.RecordCount) + ' ADET';
        end;
    4 : // Veri Konusu Kiþi Gruplarý
        begin
          QueryOpen(qEnvDetay, 'SELECT kisi as alanadi, COUNT(env.id) AS adet ' +
                               'FROM data_envanter env LEFT JOIN def_data_kisi ks ON env.kisi_id = ks.id WHERE env.active = ''E'' AND env.main_id = 0 AND env.mc_id = ' +
                               IntToStr(MainMod.MCID) + ' GROUP BY kisi ORDER BY 2 DESC');
          hdrEnvDetay.Caption  := 'Veri Toplanan Kiþi Gruplarý   : ' + IntToStr(qEnvDetay.RecordCount) + ' ADET';
        end;
    5 : // Veri Toplama Amaçlarý
        begin
          (*
          IDList := '';
          QueryOpen(qTmp, 'SELECT topl_amac_ids FROM data_envanter WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID));
          while not qTmp.EOF do
          begin
            if qTmp.FieldByName('topl_amac_ids').AsString <> '' then IDList := IDList + qTmp.FieldByName('topl_amac_ids').AsString + ',';
            qTmp.Next;
          end;
          if IDList <> '' then System.Delete(IDList, Length(IDList), 1);

          if IDList <> '' then
          begin
            QueryOpen(qTmp, 'SELECT DISTINCT id, amac FROM def_data_amac WHERE id IN (' + IDList + ') ORDER BY id');
            while not qTmp.EOF do
            begin
              tblAmac.Insert;
              tblAmac.FieldByName('cat_id').AsInteger  := qKategori.FieldByName('kategori_id').AsInteger;
              tblAmac.FieldByName('cat_str').AsString  := qKategori.FieldByName('kategori_str').AsString;
              tblAmac.FieldByName('data_id').AsInteger := qTmp.FieldByName('id').AsInteger;
              tblAmac.FieldByName('data_str').AsString := qTmp.FieldByName('amac').AsString;
              tblAmac.Post;

              qTmp.Next;
            end;
          end;

            qKategori.Next;
          end;
            *)
        end;
    6 : // Veri Saklama Amaçlarý
        begin

        end;
    7 : // Veri Paylaþma Amaçlarý
        begin

        end;
    8 : // Veri Aktarýlan Alýcý Gruplarý
        begin

        end;
    9 : // Yabancý Ülkelere Aktarýlacak Bilgiler
        begin

        end;
    10 : // Veri Güvenliði Tedbirleri
        begin

        end;
  end;
  chtEnvDetay.RefreshData;
  qEnvDetay.First;
end;

procedure TfrDashboard.PrepEnvanterIstatistik;
var
  IDList : String;
begin
  // Veri Kaynaklarý
  QueryOpen(qTmp, 'SELECT DISTINCT kaynak_id FROM data_envanter WHERE kaynak_id is not null and active = ''E'' AND main_id = 0 AND mc_id = ' + IntToStr(MainMod.MCID));
  lbist_Kaynak.Caption := FormatFloat('#,##0', qTmp.RecordCount);
  // Veri Kategorileri
  QueryOpen(qTmp, 'SELECT DISTINCT kategori_id FROM data_envanter WHERE kategori_id is not null and active = ''E'' AND main_id > 0 AND mc_id = ' + IntToStr(MainMod.MCID));
  lbist_Kategori.Caption := FormatFloat('#,##0', qTmp.RecordCount);
  // Veri Tipleri
  QueryOpen(qTmp, 'SELECT DISTINCT vt.veri_tipi FROM data_envanter env LEFT JOIN def_data_veritipi vt ON vt.id = env.veritipi_id WHERE env.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID));
  lbist_VTipi.Caption := FormatFloat('#,##0', qTmp.RecordCount);
  // Veri Konusu Kiþi Gruplarý
  QueryOpen(qTmp, 'SELECT DISTINCT kisi_id FROM data_envanter WHERE kisi_id is not null and active = ''E'' AND main_id = 0 AND mc_id = ' + IntToStr(MainMod.MCID));
  lbist_Kisi.Caption := FormatFloat('#,##0', qTmp.RecordCount);
  // Veri Toplama Amaçlarý
  IDList := '';
  QueryOpen(qTmp, 'SELECT DISTINCT topl_amac_ids FROM data_envanter WHERE active= ''E'' AND mc_id = ' + IntToStr(MainMod.MCID));
  while not qTmp.EOF do
  begin
    if qTmp.FieldByName('topl_amac_ids').AsString <> '' then IDList := IDList + qTmp.FieldByName('topl_amac_ids').AsString + ',';
    qTmp.Next;
  end;
  if IDList <> '' then System.Delete(IDList, Length(IDList), 1);

  if IDList <> '' then
  begin
    QueryOpen(qTmp, 'SELECT DISTINCT id FROM def_data_amac WHERE id IN (' + IDList + ') ORDER BY id');
    lbist_TopAmac.Caption := FormatFloat('#,##0', qTmp.RecordCount);
  end
  else
  begin
    lbist_TopAmac.Caption := '0';
  end;
  // Veri Saklama Amaçlarý
  IDList := '';
  QueryOpen(qTmp, 'SELECT DISTINCT sakl_amac_ids FROM data_envanter WHERE active= ''E'' AND mc_id = ' + IntToStr(MainMod.MCID));
  while not qTmp.EOF do
  begin
    if qTmp.FieldByName('sakl_amac_ids').AsString <> '' then IDList := IDList + qTmp.FieldByName('sakl_amac_ids').AsString + ',';
    qTmp.Next;
  end;
  if IDList <> '' then System.Delete(IDList, Length(IDList), 1);

  if IDList <> '' then
  begin
    QueryOpen(qTmp, 'SELECT DISTINCT id FROM def_data_amac WHERE id IN (' + IDList + ') ORDER BY id');
    lbist_SakAmac.Caption := FormatFloat('#,##0', qTmp.RecordCount);
  end
  else
  begin
    lbist_SakAmac.Caption := '0';
  end;
  // Veri Paylaþma Amaçlarý
  IDList := '';
  QueryOpen(qTmp, 'SELECT DISTINCT payl_amac_ids FROM data_envanter WHERE active= ''E'' AND mc_id = ' + IntToStr(MainMod.MCID));
  while not qTmp.EOF do
  begin
    if qTmp.FieldByName('payl_amac_ids').AsString <> '' then IDList := IDList + qTmp.FieldByName('payl_amac_ids').AsString + ',';
    qTmp.Next;
  end;
  if IDList <> '' then System.Delete(IDList, Length(IDList), 1);

  if IDList <> '' then
  begin
    QueryOpen(qTmp, 'SELECT DISTINCT id FROM def_data_amac WHERE id IN (' + IDList + ') ORDER BY id');
    lbist_PayAmac.Caption := FormatFloat('#,##0', qTmp.RecordCount);
  end
  else
  begin
    lbist_PayAmac.Caption := '0';
  end;
  // Veri Aktarým Alýcý Gruplarý
  IDList := '';
  QueryOpen(qTmp, 'SELECT DISTINCT payl_taraf_ids FROM data_envanter WHERE active= ''E'' AND mc_id = ' + IntToStr(MainMod.MCID));
  while not qTmp.EOF do
  begin
    if qTmp.FieldByName('payl_taraf_ids').AsString <> '' then IDList := IDList + qTmp.FieldByName('payl_taraf_ids').AsString + ',';
    qTmp.Next;
  end;
  if IDList <> '' then System.Delete(IDList, Length(IDList), 1);

  if IDList <> '' then
  begin
    QueryOpen(qTmp, 'SELECT DISTINCT id FROM def_data_taraf WHERE id IN (' + IDList + ') ORDER BY id');
    lbist_Grup.Caption := FormatFloat('#,##0', qTmp.RecordCount);
  end
  else
  begin
    lbist_Grup.Caption := '0';
  end;
  // Yabancý Ülkelere Aktarýlacak Bilgiler
  QueryOpen(qTmp, 'SELECT DISTINCT kaynak_id FROM data_envanter WHERE active = ''E'' AND main_id > 0 AND mc_id = ' + IntToStr(MainMod.MCID) +
                  ' AND (payl_taraftipi IN (''YURT DIÞI'', ''Y.ÝÇÝ/Y.DIÞI''))');
  lbist_Yabanci.Caption := FormatFloat('#,##0', qTmp.RecordCount);
  // Veri Güvenliði Tedbirleri
  IDList := '';
  QueryOpen(qTmp, 'SELECT DISTINCT tedbir_ids FROM data_checklist WHERE active= ''E'' AND mc_id = ' + IntToStr(MainMod.MCID));
  while not qTmp.EOF do
  begin
    if qTmp.FieldByName('tedbir_ids').AsString <> '' then IDList := IDList + qTmp.FieldByName('tedbir_ids').AsString + ',';
    qTmp.Next;
  end;
  if IDList <> '' then System.Delete(IDList, Length(IDList), 1);

  if IDList <> '' then
  begin
    QueryOpen(qTmp, 'SELECT DISTINCT id FROM def_data_tedbir WHERE id IN (' + IDList + ') ORDER BY id');
    lbist_Tedbir.Caption := FormatFloat('#,##0', qTmp.RecordCount);
  end
  else
  begin
    lbist_Tedbir.Caption := '0';
  end;
end;

procedure TfrDashboard.PrepHeaderReport;
begin
  // Üstteki Karelerin Verileri
  QueryOpen(qTmp, 'SELECT COUNT(id) FROM data_envanter WHERE active = ''E'' AND main_id > 0 AND mc_id = ' + IntToStr(MainMod.MCID));
  lbCnt_Envanter.Caption := FormatFloat('#,##0', qTmp.Fields[0].AsInteger);

  QueryOpen(qTmp, 'SELECT COUNT(id) FROM data_envanter WHERE active = ''E'' AND main_id = 0 AND mc_id = ' + IntToStr(MainMod.MCID));
  UniLabel2.Caption := FormatFloat('#,##0', qTmp.Fields[0].AsInteger) + ' Envanter Formu';

  QueryOpen(qTmp, 'SELECT COUNT(id) FROM data_checklist WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID));
  lbCnt_Kontrol.Caption := FormatFloat('#,##0', qTmp.Fields[0].AsInteger);

  QueryOpen(qTmp, 'SELECT COUNT(id) FROM data_vsbasvuru WHERE mc_id = ' + IntToStr(MainMod.MCID));
  lbCnt_Basvuru.Caption := FormatFloat('#,##0', qTmp.Fields[0].AsInteger);

  QueryOpen(qTmp, 'SELECT COUNT(id) FROM data_acikriza WHERE durum = ''AKTÝF'' AND mc_id = ' + IntToStr(MainMod.MCID));
  lbCnt_AcikRiza.Caption := FormatFloat('#,##0', qTmp.Fields[0].AsInteger);

  QueryOpen(qTmp, 'SELECT COUNT(id) FROM def_data_aydinlatma WHERE durum = ''YAYINDA'' AND mc_id = ' + IntToStr(MainMod.MCID));
  lbCnt_Aydinlatma.Caption := FormatFloat('#,##0', qTmp.Fields[0].AsInteger);
end;

procedure TfrDashboard.PrepKontrolKaynakKisiDetay;
var
  Found : Boolean;
  SayEnv ,
  SayKnt ,
  SayHep : Integer;
begin
  SayEnv := 0;
  SayKnt := 0;
  SayHep := 0;
  tblKontrol.DisableControls;
  tblKontrol.First;
  while not tblKontrol.EOF do tblKontrol.Delete;

  QueryOpen(qTmp, 'SELECT DISTINCT kaynak as kaynak_str, kisi as kisi_str ' +
                  'FROM data_envanter env LEFT JOIN def_data_kaynak ky ON env.kaynak_id=ky.id LEFT JOIN def_data_kisi ks on env.kisi_id=ks.id ' +
                  'WHERE env.active = ''E'' AND env.main_id = 0 AND env.mc_id = ' +
                  IntToStr(MainMod.MCID) + ' ORDER BY 2, 1');
  while not qTmp.EOF do
  begin
    tblKontrol.Append;
    tblKontrol.FieldByName('kaynak_str').AsString := qTmp.FieldByName('kaynak_str').AsString;
    tblKontrol.FieldByName('kisi_str').AsString   := qTmp.FieldByName('kisi_str').AsString;
    tblKontrol.FieldByName('env_var').AsString    := 'E';
    tblKontrol.FieldByName('chl_var').AsString    := 'H';
    tblKontrol.FieldByName('durum').AsInteger     := 1;
    tblKontrol.FieldByName('mesaj_str').AsString  := 'Envanter Formu Var-Kontrol Formu Yok';
    tblKontrol.Post;
    SayEnv := SayEnv + 1;

    qTmp.Next;
  end;
  QueryOpen(qTmp, 'SELECT DISTINCT ky.kaynak as kaynak_str, ks.kisi as kisi_str ' +
                  'FROM data_checklist cl LEFT JOIN def_data_kaynak ky ON cl.kaynak_id=ky.id LEFT JOIN def_data_kisi ks on cl.kisi_id=ks.id ' +
                  'WHERE cl.dayanak_ids<>'''' and cl.active = ''E'' AND cl.mc_id = ' +
                  IntToStr(MainMod.MCID) + ' ORDER BY 1, 2');
  while not qTmp.EOF do
  begin
    Found := False;
    tblKontrol.First;
    while not tblKontrol.EOF do
    begin
      if (qTmp.FieldByName('kaynak_str').AsString = tblKontrol.FieldByName('kaynak_str').AsString) and
         (qTmp.FieldByName('kisi_str').AsString = tblKontrol.FieldByName('kisi_str').AsString) then
      begin
        tblKontrol.Edit;
        tblKontrol.FieldByName('chl_var').AsString := 'E';
        tblKontrol.FieldByName('durum').AsInteger  := 3;
        tblKontrol.FieldByName('mesaj_str').AsString  := 'Envanter ve Kontrol Formlarý Mevcut';
        tblKontrol.Post;
        SayHep := SayHep + 1;
        SayEnv := SayEnv - 1;
        Found := True;
        Break;
      end;

      tblKontrol.Next;
    end;

    if not Found then
    begin
      tblKontrol.Append;
      tblKontrol.FieldByName('kaynak_str').AsString := qTmp.FieldByName('kaynak_str').AsString;
      tblKontrol.FieldByName('kisi_str').AsString   := qTmp.FieldByName('kisi_str').AsString;
      tblKontrol.FieldByName('env_var').AsString    := 'H';
      tblKontrol.FieldByName('chl_var').AsString    := 'E';
      tblKontrol.FieldByName('durum').AsInteger     := 2;
      tblKontrol.FieldByName('mesaj_str').AsString  := 'Envanter Formu Yok-Kontrol Formu Var';
      tblKontrol.Post;
      SayKnt := SayKnt + 1;
    end;

    qTmp.Next;
  end;

  tblKontrol.EnableControls;
  qKontrol.Close;
  qKontrol.Open;

  serKontrol.Clear;
  serKontrol.Add(SayEnv, IntToStr(SayEnv));
  serKontrol.Add(SayKnt, IntToStr(SayKnt));
  serKontrol.Add(SayHep, IntToStr(SayHep));
end;

procedure TfrDashboard.imgDuyuruListesiClick(Sender: TObject);
begin
  MainForm.DashboardCall(MainForm.mmiDuyurular);
end;

procedure TfrDashboard.DshTimerTimer(Sender: TObject);
begin
  LoadingData := True;
  DshTimer.Enabled := False;
  PrepHeaderReport;
  PrepEnvanterIstatistik;
  PrepEnvanterDetay(1);
  chtEnvDetay.Visible := True;
  chtKontrol.Visible  := True;
  chtBasvuru.Visible  := True;
  PrepKontrolKaynakKisiDetay;
  PrepBasvuruDetay;
//  PrepDuyuru;
  PrepSoruSeti  ;
  LoadingData := False;
end;

procedure TfrDashboard.EnvDetayRefresh(Sender: TObject);
var
  ATag : Integer;
begin
  ATag := TUniLabel(Sender).Tag;
  PrepEnvanterDetay(ATag);
  chtEnvDetay.RefreshData;
end;

procedure TfrDashboard.grdKontrolDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
  Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if (ACol = 0) or (ACol = 1) then
  begin
    //if qKontrol.FieldByName('durum').AsInteger = 1 then Attribs.Color := $00E1E1FF; // Sadece Envanter
    //if qKontrol.FieldByName('durum').AsInteger = 2 then Attribs.Color := clInfoBk;  // Sadece Kontrol
    //if qKontrol.FieldByName('durum').AsInteger = 3 then Attribs.Color := $E0E0C0;   // Hepsi

    // Added by TEVFIK 24.11.2022 14:13:57
    case qKontrol.FieldByName('durum').AsInteger of
      1: Attribs.Color := $00E1E1FF; // Sadece Envanter
      2: Attribs.Color := clInfoBk;  // Sadece Kontrol
      3: Attribs.Color := $E0E0C0;   // Hepsi
    end;
  end;
end;

procedure TfrDashboard.imgRefresh0Click(Sender: TObject);
begin
  PrepareReport;
end;

procedure TfrDashboard.PrepareReport;
begin
  if LoadingData then Exit;
  
  DshTimer.Enabled := True;

  //UniSession.AddJS('Ext.getCmp('+UniChart1.JSName+'.items.getAt(0).id).store.getAt(0).set(''value'', Math.round(Math.random()*100));');
  //UniSession.AddJS('Ext.getCmp('+UniChart1.JSName+'.items.getAt(0).id).store.getAt(0).set(''value'', 90);');
end;

procedure TfrDashboard.PrepBasvuruDetay;
begin
  serBasvuru.Clear;
  serBsvGray.Clear;
  QueryOpen(qTmp, 'SELECT COUNT(id) AS adet FROM data_vsbasvuru WHERE durum = ''CEVAPLANDI'' AND mc_id = ' + IntToStr(MainMod.MCID));
  lbBsvCevapli.Caption := FormatFloat('#,##0', qTmp.FieldByName('adet').AsInteger);
  serBasvuru.Add(qTmp.FieldByName('adet').AsInteger, qTmp.FieldByName('adet').AsString);

  QueryOpen(qTmp, 'SELECT COUNT(id) AS adet FROM data_vsbasvuru WHERE durum <> ''CEVAPLANDI'' AND mc_id = ' + IntToStr(MainMod.MCID));
  lbBsvCevapsiz.Caption := FormatFloat('#,##0', qTmp.FieldByName('adet').AsInteger);
  serBasvuru.Add(qTmp.FieldByName('adet').AsInteger, qTmp.FieldByName('adet').AsString);

  QueryOpen(qTmp, 'SELECT COUNT(id) AS adet FROM data_vsbasvuru WHERE durum = ''BEKLEMEDE'' AND mc_id = ' + IntToStr(MainMod.MCID));
  lbBsvBekleme.Caption := FormatFloat('#,##0', qTmp.FieldByName('adet').AsInteger);

  QueryOpen(qTmp, 'SELECT COUNT(id) AS adet FROM data_vsbasvuru WHERE durum = ''ÝNCELENÝYOR'' AND mc_id = ' + IntToStr(MainMod.MCID));
  lbBsvInceleme.Caption := FormatFloat('#,##0', qTmp.FieldByName('adet').AsInteger);

  QueryOpen(qTmp, 'SELECT COUNT(id) AS adet FROM data_vsbasvuru WHERE durum <> ''CEVAPLANDI'' AND mc_id = ' + IntToStr(MainMod.MCID) +
                  ' AND ((current_date - basvuru_tarihi) BETWEEN 16 AND 20)');
  lbBsv15Gun.Caption := FormatFloat('#,##0', qTmp.FieldByName('adet').AsInteger);

  QueryOpen(qTmp, 'SELECT COUNT(id) AS adet FROM data_vsbasvuru WHERE durum <> ''CEVAPLANDI'' AND mc_id = ' + IntToStr(MainMod.MCID) +
                  ' AND ((current_date - basvuru_tarihi) BETWEEN 21 AND 25)');
  lbBsv10Gun.Caption := FormatFloat('#,##0', qTmp.FieldByName('adet').AsInteger);
  if qTmp.FieldByName('adet').AsInteger > 0 then UniImage13.URL := 'files/images/warning.png' else UniImage13.URL := '';


  QueryOpen(qTmp, 'SELECT COUNT(id) AS adet FROM data_vsbasvuru WHERE durum <> ''CEVAPLANDI'' AND mc_id = ' + IntToStr(MainMod.MCID) +
                  ' AND ((current_date - basvuru_tarihi) BETWEEN 26 AND 30)');
  lbBsv05Gun.Caption := FormatFloat('#,##0', qTmp.FieldByName('adet').AsInteger);
  if qTmp.FieldByName('adet').AsInteger > 0 then UniImage14.URL := 'files/images/alert.png' else UniImage14.URL := '';

  QueryOpen(qTmp, 'SELECT COUNT(id) AS adet FROM data_vsbasvuru WHERE durum <> ''CEVAPLANDI'' AND mc_id = ' + IntToStr(MainMod.MCID) +
                  ' AND ((current_date - basvuru_tarihi) > 30)');
  lbBsv30Gun.Caption := FormatFloat('#,##0', qTmp.FieldByName('adet').AsInteger);
  if qTmp.FieldByName('adet').AsInteger > 0 then UniImage20.URL := 'files/images/alert.png' else UniImage20.URL := '';
end;

procedure TfrDashboard.PrepDuyuru;
begin
	QueryOpen(qDuyuru, 'SELECT id, gc_id, mc_id, news_date, title FROM sys_news WHERE news_date <= NOW() AND ((mc_id = ' +
            IntToStr(MainMod.MCID) + ') OR (mc_id = 0 AND gc_id = ' + IntToStr(MainMod.GCID) + ')) ORDER BY news_date DESC LIMIT 10');
end;

procedure TfrDashboard.PrepSoruSeti;
begin

	QueryOpen(qedanismaSoruSeti,  ' SELECT  * FROM (SELECT sr.*, fnc_id2str(sr.dept_ids, ''sys_deptdef'', ''title'') departman, '+
                                ' (SELECT count(*) FROM edns_soruseti_soru WHERE ss_id=sr.id) sorusayisi, '+
                                ' (SELECT count(*) FROM edns_soruseti_cevap WHERE ss_id=sr.id) cevaplandi '+
                                ' FROM edns_soruseti sr where sr.mc_id='+IntToStr(MainMod.MCID) +' and sr.active=''E'') ed '+
                                ' WHERE sorusayisi>cevaplandi and coalesce(departman,'''')<>'''' ') ;
end;

procedure TfrDashboard.grdDuyuruDblClick(Sender: TObject);
begin
  frmDuyuruDetay.Exec(qDuyuru.FieldByName('id').AsInteger);
end;

procedure TfrDashboard.UniFrameCreate(Sender: TObject);
var
  Ini: TIniFile;
  Version : string;
  v1,v2,v3,v4: word;
begin
  lbCnt_Envanter.Caption   := '0';
  lbCnt_Kontrol.Caption    := '0';
  lbCnt_Basvuru.Caption    := '0';
  lbCnt_AcikRiza.Caption   := '0';
  lbCnt_Aydinlatma.Caption := '0';

  chtEnvDetay.Visible := False;
  chtKontrol.Visible  := False;
  chtBasvuru.Visible  := False;

  LoadingData := False;
  tblKontrol.Open;
  PrepareReport;

  // Added by TEVFIK 30.11.2022 13:33:52 KVKNet Versiyon
//  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'KVKNet.ini');
//  try

    lblVersiyon.Caption := MainForm.VersiyonNo; //'V_'+Projeversiyon(Application.ExeName,v1,v2,v3,v4); //MainModule.Versiyon;
//  finally
//    Ini.Free;
//  end;
end;

procedure TfrDashboard.imgGridToXlsClick(Sender: TObject);
begin
  if grdKontrol.Columns[4].Visible = False then
    grdKontrol.Columns[4].Visible := True;
  MainMod.DownloadDataSetToXls(grdKontrol, 'Envanter - Kontrol Formlarý Karþýlaþtýrmasý', 'Envanter - Kontrol Formlarý Karþýlaþtýrmasý.xlsx');
  grdKontrol.Columns[4].Visible := False;
end;

procedure TfrDashboard.UniPanel12Click(Sender: TObject);
begin
  MainForm.DashboardCall(MainForm.mmiVSBasvuruFormlari);
end;

procedure TfrDashboard.UniPanel4Click(Sender: TObject);
begin
  MainForm.DashboardCall(MainForm.mmiEnvanterFormlari);
end;

procedure TfrDashboard.UniPanel5Click(Sender: TObject);
begin
  MainForm.DashboardCall(MainForm.mmiKontrolFormlari);
end;

procedure TfrDashboard.UniPanel8Click(Sender: TObject);
begin
  MainForm.DashboardCall(MainForm.mmiAcikRizaKayitlari);
end;

procedure TfrDashboard.UniPanel9Click(Sender: TObject);
begin
  MainForm.DashboardCall(MainForm.mmiAydinlatmaMetniSablonlari);
end;

initialization
  RegisterClass(TfrDashboard);

end.
