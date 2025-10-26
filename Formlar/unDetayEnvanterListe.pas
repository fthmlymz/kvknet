unit unDetayEnvanterListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniBasicGrid, uniDBGrid, uniButton, uniBitBtn, uniLabel, uniEdit, uniMultiItem,
  uniComboBox, uniGUIBaseClasses, uniPanel, System.Actions, Vcl.ActnList, Data.DB, DBAccess, Uni,
  uniDateTimePicker, VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report, FlexCel.Render, MemDS,
  uniMenuButton, Vcl.Menus, uniMainMenu, VirtualTable, VirtualQuery, rXMLReport, System.IOUtils;

type
  TfrDetayEnvanterListe = class(TUniFrame)
    dsEnvanter: TUniDataSource;
    ActList: TActionList;
    actSearch: TAction;
    actClose: TAction;
    pnlTop: TUniPanel;
    edSrcType: TUniComboBox;
    edSrcText: TUniEdit;
    edSrcActive: TUniComboBox;
    UniLabel1: TUniLabel;
    btnSearch: TUniBitBtn;
    btnClose: TUniBitBtn;
    UniLabel2: TUniLabel;
    UniDBGrid1: TUniDBGrid;
    edSrcDate: TUniDateTimePicker;
    qTmp: TUniQuery;
    btnDownload: TUniMenuButton;
    ppmDownload: TUniPopupMenu;
    ppmiExcelTablosu: TUniMenuItem;
    ppmiEnvanterRaporu: TUniMenuItem;
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
    btnHelp: TUniBitBtn;
    qEnvanter: TUniQuery;
    qRapor: TUniQuery;
    qRaportopl_amac_str: TStringField;
    qRaportopl_metod_str: TStringField;
    qRaporsakl_amac_str: TStringField;
    qRaporsakl_metod_str: TStringField;
    qRaporsakl_erisim_str: TStringField;
    qRaporpayl_amac_str: TStringField;
    qRaporpayl_metod_str: TStringField;
    qRaporpayl_taraf_str: TStringField;
    tblSure: TVirtualTable;
    qSure: TVirtualQuery;
    DOCXRpt: TrXMLReport;
    qRaporid: TIntegerField;
    qRapormc_id: TIntegerField;
    qRaporactive: TStringField;
    qRaporidy: TIntegerField;
    qRaporidt: TDateTimeField;
    qRaporsdy: TIntegerField;
    qRaporsdt: TDateTimeField;
    qRaportarih: TDateField;
    qRapordept_id: TIntegerField;
    qRaporsurec_id: TIntegerField;
    qRaporkaynak_id: TIntegerField;
    qRaporveritipi_id: TIntegerField;
    qRaporkategori_id: TIntegerField;
    qRaporkisi_id: TIntegerField;
    qRapornitelik: TStringField;
    qRaportopl_amac_ids: TStringField;
    qRaportopl_detay: TStringField;
    qRaportopl_cikti: TStringField;
    qRaportopl_paylasim: TStringField;
    qRaportopl_paylasimtipi: TStringField;
    qRaporsakl_metod_ids: TStringField;
    qRaporsakl_sanalonlem: TStringField;
    qRaporsakl_fizikselonlem: TStringField;
    qRaporsakl_erisim_ids: TStringField;
    qRaporsakl_amac_ids: TStringField;
    qRaporsakl_imha: TStringField;
    qRaporpayl_taraf_ids: TStringField;
    qRaporpayl_amac_ids: TStringField;
    qRaporpayl_metod_ids: TStringField;
    qRaporpayl_sozlesme: TStringField;
    qRaporpayl_sozisim: TStringField;
    qRaporpayl_sozmadde: TStringField;
    qRapordgr_dayanak_ids: TStringField;
    qRapordgr_dokuman_ids: TStringField;
    qRapordgr_politika: TStringField;
    qRapordgr_polisim: TStringField;
    qRapordgr_polmadde: TStringField;
    qRapordgr_sozlesme: TStringField;
    qRapordgr_sozisim: TStringField;
    qRapordgr_sozmadde: TStringField;
    qRaportopl_metod_ids: TStringField;
    qRaporpayl_taraftipi: TStringField;
    qRaporsakl_ssure_tip: TStringField;
    qRaporsakl_fsure_tip: TStringField;
    qRaporsakl_ssure_sure: TIntegerField;
    qRaporsakl_fsure_sure: TIntegerField;
    qRaporsakl_ssure_diger: TStringField;
    qRaporsakl_fsure_diger: TStringField;
    qRaporsakl_ssure_imha: TStringField;
    qRaporsakl_fsure_imha: TStringField;
    qRaporsakl_ssure_var: TStringField;
    qRaporsakl_fsure_var: TStringField;
    qRapormain_id: TIntegerField;
    qRaporsakl_ssure: TStringField;
    qRaporsakl_fsure: TStringField;
    qRaporolusturan: TStringField;
    qRapordegistiren: TStringField;
    qRapordept_str: TStringField;
    qRaporsurec_str: TStringField;
    qRaporkaynak_str: TStringField;
    qRaporkisi_str: TStringField;
    qRaporkategori_str: TStringField;
    qRaporveritipi_str: TStringField;
    qRaportopl_amac_str1: TStringField;
    qRaportopl_metod_str1: TStringField;
    qRaporsakl_amac_str1: TStringField;
    qRaporsakl_metod_str1: TStringField;
    qRaporsakl_erisim_str1: TStringField;
    qRaporpayl_amac_str1: TStringField;
    qRaporpayl_metod_str1: TStringField;
    qRaporpayl_taraf_str1: TStringField;
    qRapordgr_dayanak_str: TStringField;
    qRapordgr_dokuman_str: TStringField;
    qRaporid_1: TIntegerField;
    qRapormc_id_1: TIntegerField;
    qRaporactive_1: TStringField;
    qRaporidy_1: TIntegerField;
    qRaporidt_1: TDateTimeField;
    qRaporsdy_1: TIntegerField;
    qRaporsdt_1: TDateTimeField;
    qRaportarih_1: TDateField;
    qRaporkaynak_id_1: TIntegerField;
    qRaporkontrol_id: TIntegerField;
    qRaportedbir_ids: TStringField;
    qRapordayanak_ids: TStringField;
    qRapordokuman_ids: TStringField;
    qRaporekipman_ids: TStringField;
    qRaporsorumlu_ids: TStringField;
    qRaporhkk_gereksinim: TStringField;
    qRaporhkk_sozlesme: TStringField;
    qRaporhkk_sozmadde: TStringField;
    qRaporcalisma_talimat: TStringField;
    qRaporoneriler: TStringField;
    qRaporguncelleme_araligi: TStringField;
    qRaportetkik_araligi: TStringField;
    qRaportetkik_yonetim: TStringField;
    qRaporonem_derecesi_id: TIntegerField;
    qRaporkoru_idarionlem: TStringField;
    qRaporkoru_teknikonlem: TStringField;
    qRapordanisman_notu: TStringField;
    qRaporkisi_id_1: TIntegerField;
    qRaporkilitli: TStringField;
    qRaporkilitli_sdy: TIntegerField;
    qRaporkilitli_sdt: TDateTimeField;
    qRaporkontrol_str: TStringField;
    qRaportedbir_str: TStringField;
    qRapordayanak_str: TStringField;
    qRapordokuman_str: TStringField;
    qRaporekipman_str: TStringField;
    qRaporsorumlu_str: TStringField;
    qRaporonem_derecesi_str: TStringField;
    qRaportopl_amac_ids_1: TStringField;
    qRaportopl_metod_ids_1: TStringField;
    qRaporsakl_amac_ids_1: TStringField;
    qRaporsakl_metod_ids_1: TStringField;
    qRaporsakl_erisim_ids_1: TStringField;
    qRaporpayl_amac_ids_1: TStringField;
    qRaporpayl_metod_ids_1: TStringField;
    qRaporpayl_taraf_ids_1: TStringField;
    qRaportopl_amac_str2: TStringField;
    qRaportopl_metod_str2: TStringField;
    qRaporsakl_amac_str2: TStringField;
    qRaporsakl_metod_str2: TStringField;
    qRaporsakl_erisim_str2: TStringField;
    qRaporpayl_amac_str2: TStringField;
    qRaporpayl_metod_str2: TStringField;
    qRaporpayl_taraf_str2: TStringField;
    ppmOzelNitelikliVeriPolitikasi: TUniMenuItem;
    lbKayitSayisi: TUniLabel;
    qdayanak: TUniQuery;
    qamac: TUniQuery;
    qilgiliKisiSure: TUniQuery;
    procedure UniFrameCreate(Sender: TObject);
    procedure edSrcTypeChange(Sender: TObject);
    procedure edSrcActiveChange(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure edSrcDateAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure ppmiExcelTablosuClick(Sender: TObject);
    procedure ppmiEnvanterRaporuClick(Sender: TObject);
    procedure ppmiKVKKPolitikasiClick(Sender: TObject);
    procedure ppmiImhaPolitikasiClick(Sender: TObject);
    procedure UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure btnHelpClick(Sender: TObject);
    procedure UniDBGrid1DrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure qRaporCalcFields(DataSet: TDataSet);
    procedure DOCXRptUserCalc(Sender: TObject; var CalcStr: string; var Replace: Boolean);
    procedure ppmOzelNitelikliVeriPolitikasiClick(Sender: TObject);
  private
    // Word Doküman Raporlarý için kullanýlan ve verileri hazýrlayan metodlar
    procedure DefVariables(VL: TStrings);
    procedure PrepKategoriVeriTipi;
    procedure PrepKisiVeriTipi;
    procedure PrepIlgiliKisi;
    procedure PrepTaraflar;
    procedure PrepKategoriSure;

    procedure NewSQL;
    procedure ExcelSQL;
    procedure PrepDayanak;
    procedure prepAmac;
    procedure prepIlgiliKisiSure;
    function NewGUID: string;
    procedure FileDel(AFileName: string);
  public
  procedure DocXreport(AOutputName, AtempFileName, AFileName: string;
  ADatasets: array of TDataSet);
  end;

implementation

{$R *.dfm}

uses MainModule, ServerModule, McMLib, Main, unHelpPage, RosiCompGlobalCfg,unEnvanterListe2;

procedure TfrDetayEnvanterListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrDetayEnvanterListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrDetayEnvanterListe.edSrcActiveChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrDetayEnvanterListe.edSrcDateAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrDetayEnvanterListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrDetayEnvanterListe.edSrcTypeChange(Sender: TObject);
begin
  edSrcText.Visible := edSrcType.ItemIndex <> 8;
  edSrcDate.Visible := edSrcType.ItemIndex = 8;

  NewSQL;
end;

procedure TfrDetayEnvanterListe.ExcelSQL;
var
  SrcText    ,
	SQLStr     ,
	WhereStr   : String;
begin
  SQLStr := 'SELECT env.*,' +
            '  us1.full_name AS olusturan, us2.full_name AS degistiren, ' +
            //' dept.title AS dept_str,' +
            ' (case when coalesce(dept.main_dept_id,0) > 0 then  dept.title||'' (''||dept_main.title||'') '' else dept.title end)::varchar(410) AS dept_str, ' +
            '  src.surec AS surec_str, kyn.kaynak AS kaynak_str, ks.kisi AS kisi_str,' +
            '  cat.kategori AS kategori_str, vt.veri_tipi AS veritipi_str,' +
            '  fnc_id2str(env.topl_amac_ids, ''def_data_amac'', ''amac'')::character varying (5000) AS topl_amac_str1,' +
            '  fnc_id2str(env.topl_metod_ids, ''def_data_metod'', ''metod'')::character varying (5000) AS topl_metod_str1,' +
            '  fnc_id2str(env.sakl_amac_ids, ''def_data_amac'', ''amac'')::character varying (5000) AS sakl_amac_str1,' +
            '  fnc_id2str(env.sakl_metod_ids, ''def_data_metod'', ''metod'')::character varying (5000) AS sakl_metod_str1,' +
            '  fnc_id2str(env.sakl_erisim_ids, ''sys_deptdef'', ''title'')::character varying (5000) AS sakl_erisim_str1,' +
            '  fnc_id2str(env.payl_amac_ids, ''def_data_amac'', ''amac'')::character varying (5000) AS payl_amac_str1,' +
            '  fnc_id2str(env.payl_metod_ids, ''def_data_metod'', ''metod'')::character varying (5000) AS payl_metod_str1,' +
            '  fnc_id2str(env.payl_taraf_ids, ''def_data_taraf'', ''taraf'')::character varying (5000) AS payl_taraf_str1,' +
            '  fnc_id2str(env.dgr_dayanak_ids, ''def_data_dayanak'', ''dayanak'')::character varying (5000) AS dgr_dayanak_str,' +
            '  fnc_id2str(env.dgr_dokuman_ids, ''def_data_dokuman'', ''dokuman'')::character varying (5000) AS dgr_dokuman_str,' +
            '  chl.*,' +
            '  fnc_id2str(chl.kontrol_id::character varying (20), ''def_data_kontrolsonuc'', ''kontrolsonuc'')::character varying (50) AS kontrol_str,' +
            '  fnc_id2str(chl.tedbir_ids, ''def_data_tedbir'', ''tedbir'')::character varying (5000) AS tedbir_str,' +
            '  fnc_id2str(chl.dayanak_ids, ''def_data_dayanak'', ''dayanak'')::character varying (5000) AS dayanak_str,' +
            '  fnc_id2str(chl.dokuman_ids, ''def_data_dokuman'', ''dokuman'')::character varying (5000) AS dokuman_str,' +
            '  fnc_id2str(chl.ekipman_ids, ''def_data_ekipman'', ''ekipman'')::character varying (5000) AS ekipman_str,' +
            '  fnc_id2str(chl.sorumlu_ids, ''sys_deptdef'', ''title'')::character varying (5000) AS sorumlu_str,' +
            '  fnc_id2str(chl.onem_derecesi_id::character varying (20), ''def_data_onemderece'', ''onemderece'')::character varying (50) AS onem_derecesi_str,' +
            '  menv.topl_amac_ids, menv.topl_metod_ids, menv.sakl_amac_ids, menv.sakl_metod_ids,' +
            '  menv.sakl_erisim_ids, menv.payl_amac_ids, menv.payl_metod_ids, menv.payl_taraf_ids,' +
            '  fnc_id2str(menv.topl_amac_ids, ''def_data_amac'', ''amac'')::character varying (5000) AS topl_amac_str2,' +
            '  fnc_id2str(menv.topl_metod_ids, ''def_data_metod'', ''metod'')::character varying (5000) AS topl_metod_str2,' +
            '  fnc_id2str(menv.sakl_amac_ids, ''def_data_amac'', ''amac'')::character varying (5000) AS sakl_amac_str2,' +
            '  fnc_id2str(menv.sakl_metod_ids, ''def_data_metod'', ''metod'')::character varying (5000) AS sakl_metod_str2,' +
            '  fnc_id2str(menv.sakl_erisim_ids, ''sys_deptdef'', ''title'')::character varying (5000) AS sakl_erisim_str2,' +
            '  fnc_id2str(menv.payl_amac_ids, ''def_data_amac'', ''amac'')::character varying (5000) AS payl_amac_str2,' +
            '  fnc_id2str(menv.payl_metod_ids, ''def_data_metod'', ''metod'')::character varying (5000) AS payl_metod_str2,' +
            '  fnc_id2str(menv.payl_taraf_ids, ''def_data_taraf'', ''taraf'')::character varying (5000) AS payl_taraf_str2 ' +
            'FROM data_envanter env' +
            ' JOIN data_envanter mainenv ON mainenv.ID=env.main_id AND mainenv.main_id=0 ' +
            '  LEFT JOIN usr_user us1 ON us1.id = env.idy' +
            '  LEFT JOIN usr_user us2 ON us2.id = env.sdy' +
            '  LEFT JOIN sys_deptdef dept ON dept.id = env.dept_id' +
            '  LEFT JOIN sys_deptdef dept_main on dept_main.id=dept.main_dept_id ' +
            '  LEFT JOIN def_data_surec src ON src.id = env.surec_id' +
            '  LEFT JOIN def_data_kaynak kyn ON kyn.id = env.kaynak_id' +
//            '  LEFT JOIN def_data_kisi ks ON ks.id = env.kisi_id' +
            '  LEFT JOIN def_data_kisi ks ON ks.id = mainenv.kisi_id' +
            '  LEFT JOIN def_data_kategori cat ON cat.id = env.kategori_id' +
            '  LEFT JOIN def_data_veritipi vt ON vt.id = env.veritipi_id' +
            '  LEFT JOIN data_envanter menv ON menv.id = env.main_id ';

	case edSrcActive.ItemIndex of
		0 : SQLStr := SQLStr + '  LEFT JOIN data_checklist chl ON chl.active = ''E'' AND chl.kaynak_id = env.kaynak_id AND chl.kisi_id = env.kisi_id ';
		1 : SQLStr := SQLStr + '  LEFT JOIN data_checklist chl ON chl.active = ''H'' AND chl.kaynak_id = env.kaynak_id AND chl.kisi_id = env.kisi_id ';
		2 : SQLStr := SQLStr + '  LEFT JOIN data_checklist chl ON  chl.kaynak_id = env.kaynak_id AND chl.kisi_id = env.kisi_id ';
	end;

	WhereStr 	:= 'env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) + ' AND ';

	case edSrcActive.ItemIndex of
//		0 : WhereStr := WhereStr + 'env.active = ''E'' AND ';
//		1 : WhereStr := WhereStr + 'env.active = ''H'' AND ';
		0 : WhereStr := WhereStr + ' mainenv.active = ''E'' AND env.active = ''E'' AND ';
		1 : WhereStr := WhereStr + ' mainenv.active = ''H'' AND env.active = ''H'' AND ';
	end;

  if edSrcType.ItemIndex = 8 then
  begin
    WhereStr := WhereStr + 'env.tarih = ''' + FormatDateTime('dd.mm.yyyy', edSrcDate.DateTime) + ''' AND ';
  end
  else
  begin
    if edSrcText.Text <> '' then
    begin
     // SrcText := StringReplace(edSrcText.Text, '*', '%', [rfReplaceAll]);
     if edSrcText.Text[1] = '*' then
        SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
      else
        SrcText := '%' + edSrcText.Text + '%';

      case edSrcType.ItemIndex of
         0 : WhereStr := WhereStr + 'env.main_id = '  + IntToStr(StrToIntDef(SrcText, 0)) + ' AND ';
         1 : WhereStr := WhereStr + 'dept.title LIKE ''%' + SrcText + '%'' AND ';
         2 : WhereStr := WhereStr + 'dept_main.title LIKE ''%' + SrcText + '%'' AND ';
         3 : WhereStr := WhereStr + 'src.surec LIKE ''%' + SrcText + '%'' AND ';
         4 : WhereStr := WhereStr + 'kyn.kaynak LIKE ''%' + SrcText + '%'' AND ';
         5 : WhereStr := WhereStr + 'cat.kategori LIKE ''%' + SrcText + '%'' AND ';
         6 : WhereStr := WhereStr + 'vt.veri_tipi LIKE ''%' + SrcText + '%'' AND ';
         7 : WhereStr := WhereStr + 'ks.kisi LIKE ''%' + SrcText + '%'' AND ';
         9 : WhereStr := WhereStr + 'us1.full_name LIKE ''%' + SrcText + '%'' AND ';
         10 : WhereStr := WhereStr + 'us2.full_name LIKE ''%' + SrcText + '%'' AND ';
      end;
    end;
  end;

	if Trim(WhereStr) <> '' then System.Delete(WhereStr, Length(WhereStr) - 3, 4);
	if Trim(WhereStr) <> '' then SQLStr := SQLStr + 'WHERE ' + WhereStr;
	// SQLStr := SQLStr + ' ORDER BY env.tarih DESC, env.id DESC';
	SQLStr := SQLStr + ' ORDER BY src.surec, kyn.kaynak, ks.kisi, vt.veri_tipi, cat.kategori';

	QueryOpen(qRapor, SQLStr);
end;

procedure TfrDetayEnvanterListe.FileDel(AFileName: string);
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

function TfrDetayEnvanterListe.NewGUID: string;
var
  GUID: TGUID;
begin
  CreateGUID(GUID);
  Result := GUIDToString(GUID).Replace('{', '').Replace('}', '').Replace('-', '');
end;

procedure TfrDetayEnvanterListe.NewSQL;
var
  SrcText    ,
	SQLStr     ,
	WhereStr   : String;
begin
  if MainMod.LoginInfo.Birimler = '' then
  begin
    MessageDlg('Kullanýcýnýza tanýmlý departman yetkisi bulunamamýþtýr. Sistem yöneticisi ile görüþünüz..', mtInformation, [mbOk]);
  end;
//
//  SQLStr := 'SELECT distinct env.*,' +
//            '  us1.full_name AS olusturan, us2.full_name AS degistiren, dept.title AS dept_str,' +
//            '  src.surec AS surec_str, kyn.kaynak AS kaynak_str, ks.kisi AS kisi_str,' +
//            '  cat.kategori AS kategori_str, vt.veri_tipi AS veritipi_str,' +
//            '  COALESCE( cl.kilitli,''H'') AS kilitli  '+
//         //   '  fnc_checklist_kilit_durumu(env.mc_id, env.kaynak_id, env.kisi_id) AS kilitli ' +
//            'FROM data_envanter env' +
//            '  LEFT JOIN usr_user us1 ON us1.id = env.idy' +
//            '  LEFT JOIN usr_user us2 ON us2.id = env.sdy' +
//            '  LEFT JOIN sys_deptdef dept ON dept.id = env.dept_id' +
//            '  LEFT JOIN def_data_surec src ON src.id = env.surec_id' +
//            '  LEFT JOIN def_data_kaynak kyn ON kyn.id = env.kaynak_id' +
//            '  LEFT JOIN def_data_kisi ks ON ks.id = env.kisi_id' +
//            '  LEFT JOIN def_data_kategori cat ON cat.id = env.kategori_id' +
//            '  LEFT JOIN def_data_veritipi vt ON vt.id = env.veritipi_id '+
//            ' LEFT JOIN data_checklist cl on cl.active=''E''  AND CL.mc_id= ENV.mc_id AND CL.kaynak_id=ENV.kaynak_id AND CL.kisi_id= env.kisi_id ';
//  if MainMod.LoginInfo.Birimler <> '' then
//  begin
//	  WhereStr 	:= 'env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) + ' AND ' +
//     'env.dept_id IN (' + MainMod.LoginInfo.Birimler + ') AND ';
//  end
//  else
//  begin
//	  WhereStr 	:= 'env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) + ' AND ' +
//     'env.dept_id IN (0) AND ';
//  end;
//
//
//
//	case edSrcActive.ItemIndex of
//		0 : WhereStr := WhereStr + 'env.active = ''E'' AND ';
//		1 : WhereStr := WhereStr + 'env.active = ''H'' AND ';
//	end;
//
//  if edSrcType.ItemIndex = 7 then
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
//    //  SrcText := StringReplace(edSrcText.Text, '*', '%', [rfReplaceAll]);
//      case edSrcType.ItemIndex of
//         0 : WhereStr := WhereStr + 'env.main_id::varchar LIKE '  + SrcText + ' AND ';
//         1 : WhereStr := WhereStr + 'dept.title LIKE ' + SrcText + ' AND ';
//         2 : WhereStr := WhereStr + 'src.surec LIKE ' + SrcText + ' AND ';
//         3 : WhereStr := WhereStr + 'kyn.kaynak LIKE ' + SrcText + ' AND ';
//         4 : WhereStr := WhereStr + 'cat.kategori LIKE ' + SrcText + ' AND ';
//         5 : WhereStr := WhereStr + 'vt.veri_tipi LIKE ' + SrcText + ' AND ';
//         6 : WhereStr := WhereStr + 'ks.kisi LIKE ' + SrcText + ' AND ';
//         8 : WhereStr := WhereStr + 'us1.full_name LIKE ' + SrcText + ' AND ';
//         9 : WhereStr := WhereStr + 'us2.full_name LIKE ' + SrcText + ' AND ';
//      end;
//    end;
//  end;
//
//	if Trim(WhereStr) <> '' then System.Delete(WhereStr, Length(WhereStr) - 3, 4);
//	if Trim(WhereStr) <> '' then SQLStr := SQLStr + 'WHERE ' + WhereStr;
//	// SQLStr := SQLStr + ' ORDER BY env.tarih DESC, env.id DESC';
//	SQLStr := SQLStr + ' ORDER BY src.surec, kyn.kaynak, ks.kisi, vt.veri_tipi, cat.kategori';
//
//	QueryOpen(qEnvanter, SQLStr);
//  lbKayitSayisi.Text := IntToStr(qEnvanter.RecordCount) + ' Kayýt Listelendi...';

  if not GuvenliGirisMi(edSrcText.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;

SQLStr := 'SELECT DISTINCT env.*, ' +
          '  us1.full_name AS olusturan, us2.full_name AS degistiren, dept.title AS dept_str, ' +
          '  dept_main.title main_dept_str, ' +
          '  src.surec AS surec_str, kyn.kaynak AS kaynak_str, ks.kisi AS kisi_str, ' +
          '  cat.kategori AS kategori_str, vt.veri_tipi AS veritipi_str, ' +
          '  COALESCE(cl.kilitli, ''H'') AS kilitli ' +
          'FROM data_envanter env ' +
          '  LEFT JOIN usr_user us1 ON us1.id = env.idy ' +
          '  LEFT JOIN usr_user us2 ON us2.id = env.sdy ' +
          '  LEFT JOIN sys_deptdef dept ON dept.id = env.dept_id ' +
          '  LEFT join sys_deptdef dept_main on dept_main.id = dept.main_dept_id ' +
          '  LEFT JOIN def_data_surec src ON src.id = env.surec_id ' +
          '  LEFT JOIN def_data_kaynak kyn ON kyn.id = env.kaynak_id ' +
          '  LEFT JOIN def_data_kisi ks ON ks.id = env.kisi_id ' +
          '  LEFT JOIN def_data_kategori cat ON cat.id = env.kategori_id ' +
          '  LEFT JOIN def_data_veritipi vt ON vt.id = env.veritipi_id ' +
          '  LEFT JOIN data_checklist cl ON cl.active = ''E'' ' +
          '    AND CL.mc_id = ENV.mc_id ' +
          '    AND CL.kaynak_id = ENV.kaynak_id ' +
          '    AND CL.kisi_id = env.kisi_id ';
WhereStr := 'env.main_id > 0 AND env.mc_id = :MCID ';
if MainMod.LoginInfo.Birimler <> '' then
  begin
	  WhereStr 	:= WhereStr +  ' AND env.dept_id IN (' + MainMod.LoginInfo.Birimler + ')  ';
  end
  else
  begin
	  WhereStr 	:= WhereStr +  ' AND env.dept_id IN (0)  ';
  end;

case edSrcActive.ItemIndex of
  0: WhereStr := WhereStr + 'AND env.active = ''E'' ';
  1: WhereStr := WhereStr + 'AND env.active = ''H'' ';
end;
if edSrcType.ItemIndex = 8 then
begin
  WhereStr := WhereStr + 'AND env.tarih = :Tarih ';
  edSrcText.Text := ''
end
else
begin
  if edSrcText.Text <> '' then
  begin
    if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
    case edSrcType.ItemIndex of
      0: WhereStr := WhereStr + 'AND env.main_id::varchar LIKE :SrcText ';
      1: WhereStr := WhereStr + 'AND dept.title LIKE :SrcText ';
      2: WhereStr := WhereStr + 'AND dept_main.title LIKE :SrcText ';

      3: WhereStr := WhereStr + 'AND src.surec LIKE :SrcText ';
      4: WhereStr := WhereStr + 'AND kyn.kaynak LIKE :SrcText ';
      5: WhereStr := WhereStr + 'AND cat.kategori LIKE :SrcText ';
      6: WhereStr := WhereStr + 'AND vt.veri_tipi LIKE :SrcText ';
      7: WhereStr := WhereStr + 'AND ks.kisi LIKE :SrcText ';
      9: WhereStr := WhereStr + 'AND us1.full_name LIKE :SrcText ';
      10: WhereStr := WhereStr + 'AND us2.full_name LIKE :SrcText ';
    end;
  end;
end;

if Trim(WhereStr) <> '' then
  SQLStr := SQLStr + 'WHERE ' + WhereStr;
SQLStr := SQLStr + 'ORDER BY src.surec, kyn.kaynak, ks.kisi, vt.veri_tipi, cat.kategori';
qEnvanter.SQL.Text := SQLStr;
qEnvanter.ParamByName('MCID').AsInteger := MainMod.MCID;
if edSrcType.ItemIndex = 8 then
  qEnvanter.ParamByName('Tarih').AsDate := edSrcDate.DateTime;
if edSrcText.Text <> '' then
  qEnvanter.ParamByName('SrcText').AsString := SrcText;
qEnvanter.Open;
lbKayitSayisi.Text := IntToStr(qEnvanter.RecordCount) + ' Kayýt Listelendi...';
end;

procedure TfrDetayEnvanterListe.ppmiEnvanterRaporuClick(Sender: TObject);
var
  Report  : TFlexCelReport;
  FName   : String;
  TmpName : String;
  FUrl    : String;
begin
  if not MainMod.LoginInfo.Yetkiler[128] then
  begin
    MessageDlg('Doküman indirme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  ExcelSQL;

  Report := TFlexCelReport.Create(True);
  try
    Report.AddTable('env', qRapor);
    FUrl    := '';
    FName   := 'Envanter_Raporu';
    TmpName := ServerMod.NewCacheFileUrl(False, 'xlsx', FName, '', FUrl, True);
    Report.Run(ServerMod.FilesFolderPath + 'temp_xls\env_rep.template.xlsx', TmpName);
  finally
    Report.Free;
  end;

  UniSession.SendFile(TmpName, FName + '.xlsx');
end;

procedure TfrDetayEnvanterListe.ppmiExcelTablosuClick(Sender: TObject);
var
  Report  : TFlexCelReport;
  FName   : String;
  TmpName : String;
  FUrl    : String;
begin
  if not MainMod.LoginInfo.Yetkiler[128] then
  begin
    MessageDlg('Doküman indirme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if qEnvanter.RecordCount < 1 then Exit;

  ExcelSQL;

  Report := TFlexCelReport.Create(True);
  try
    Report.AddTable('env', qRapor);
    FUrl    := '';
    FName   := 'Envanter_Listesi';
    TmpName := ServerMod.NewCacheFileUrl(False, 'xlsx', FName, '', FUrl, True);
    Report.Run(ServerMod.FilesFolderPath + 'temp_xls\envanter.template.xlsx', TmpName);
  finally
    Report.Free;
  end;

  UniSession.SendFile(TmpName, FName + '.xlsx');
end;

procedure TfrDetayEnvanterListe.ppmiImhaPolitikasiClick(Sender: TObject);
var
  FUrl    : String;
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
  DocXreport('PL_02.docx' ,'temp\trash\PL_02','temp\PL_02',[MainMod.qMCDef,qdayanak,qamac,qilgiliKisiSure]) ;

//  PrepKategoriVeriTipi;
//  PrepIlgiliKisi;
//  PrepTaraflar;
//  PrepKategoriSure;
//
//  try
//    DOCXRpt.ReportFile := ServerMod.FilesFolderPath + 'temp\PL_02.docx'; //Template file name
//    //DOCXRpt.ReportFile := ServerMod.FilesFolderPath + 'temp\SAKLAMA_VE_IMHA_POLITIKASI_' + copy(MainMod.qMCParam.FieldByName('kurum_turu').AsString, 1, 2) + '.docx'; //Template file name
//    DOCXRpt.OutputFile := ServerMod.NewCacheFileUrl(False, 'docx', '', '', FUrl, True);
////    DOCXRpt.Execute([MainMod.qMCDef, qCatVT, qKisi, qTaraf, qSure]); // tblKisiVT,
//    DOCXRpt.Execute([MainMod.qMCDef,qdayanak,qamac,qilgiliKisiSure]) ;
//  except on E: Exception do
//    begin
//      ShowMessageN('Hata.. Þablon oluþturulamýyor.'#13 + E.Message);
//      Exit;
//    end;
//  end;
//
//  UniSession.SendFile(DOCXRpt.OutputFile, 'PL_02.docx');
end;
procedure TfrDetayEnvanterListe.prepIlgiliKisiSure;
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
 {qilgiliKisiSure.Close;
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
' LEFT JOIN def_data_kisi K ON K."id" = env.kisi_id '+
' WHERE '+
' env.sakl_ssure_var = ''SAKLANIYOR'' '+
' AND env.active = ''E'' '+
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
' LEFT JOIN def_data_kisi K ON K."id" = env.kisi_id '+
' WHERE '+
' env.sakl_fsure_var = ''SAKLANIYOR'' '+
' AND env.active = ''E'' '+
' AND env.main_id > 0 '+
' AND env.mc_id ='+ inttostr(mainmod.MCID) +
' ) veri '+
' GROUP BY '+
' veri.kisi '+
' ORDER BY '+
' 1 ' ) ; }

end;

procedure TfrDetayEnvanterListe.prepAmac;
begin
  QueryOpen(qamac,
    ' SELECT DISTINCT a.amac,a.id  FROM  data_envanter e '+
    ' join data_checklist cl on cl.mc_id=e.mc_id and cl.kisi_id = e.kisi_id and cl.kaynak_id = e.kaynak_id '+
    ' join def_data_amac A  on   a.id = any(string_to_array(e.topl_amac_ids,'','' )::int[] ) ' +
    ' WHERE e.active =''E'' and cl.active=''E'' and e.mc_id ='+IntToStr(MainMod.MCID) + ' order by 1 ');
//  QueryOpen(qamac, ' SELECT DISTINCT a.amac,a.id  FROM  data_envanter e '+
//  ' join def_data_amac A  on   '',''||e.topl_amac_ids||'','' like ''%,''||a.id||'',%'' '+
//  ' WHERE e.active =''E'' and e.mc_id ='+IntToStr(MainMod.MCID) + ' order by 1 ');
end;

procedure TfrDetayEnvanterListe.PrepDayanak;
begin

QueryOpen(qdayanak,
     ' SELECT DISTINCT d.dayanak,d.id '+
     ' FROM  data_envanter e '+
     ' join data_checklist cl on cl.mc_id= e.mc_id and cl.kisi_id= e.kisi_id  and cl.kaynak_id=e.kaynak_id '+
     ' join def_data_dayanak d on d.mc_id= e.mc_id and d."id" = ANY(string_to_array(cl.dayanak_ids, '','')::INT[]) '+
     ' WHERE e.Active=''E'' and cl.active=''E'' and e.mc_id='+IntToStr(MainMod.MCID) +
     ' GROUP BY d.dayanak,d.id ');
{
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
     ' WHERE e.Active=''E'' and e.mc_id='+IntToStr(MainMod.MCID) +
     ' GROUP BY d.dayanak,d.id ');

 }
end;

procedure TfrDetayEnvanterListe.ppmiKVKKPolitikasiClick(Sender: TObject);
var
  FUrl    : String;
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
  PrepKisiVeriTipi;
   DocXreport('PL_01.docx' ,'temp\trash\PL_01','temp\PL_01',[MainMod.qMCDef, qCatVT, tblKisiVT]) ;


//  try
//    DOCXRpt.ReportFile := ServerMod.FilesFolderPath + 'temp\PL_01.docx'; //Template file name
//    //DOCXRpt.ReportFile := ServerMod.FilesFolderPath + 'temp\KVKK_POLITIKASI_' + copy(MainMod.qMCParam.FieldByName('kurum_turu').AsString, 1, 2) + '.docx'; //Template file name
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
end;

procedure TfrDetayEnvanterListe.ppmOzelNitelikliVeriPolitikasiClick(
  Sender: TObject);
  var
  FUrl    : String;
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
//  PrepTaraflar;
//  PrepKategoriSure;
  DocXreport('PL_16.docx' ,'temp\trash\PL_16','temp\PL_16',[MainMod.qMCDef, qCatVT, qKisi]) ;//, qTaraf, qSure

//  try
//    DOCXRpt.ReportFile := ServerMod.FilesFolderPath + 'temp\PL_16' + '.docx'; //Template file name
//    DOCXRpt.OutputFile := ServerMod.NewCacheFileUrl(False, 'docx', '', '', FUrl, True);
//    DOCXRpt.Execute([MainMod.qMCDef, qCatVT, qKisi, qTaraf, qSure]); // tblKisiVT,
//  except on E: Exception do
//    begin
//      ShowMessageN('Hata.. Þablon oluþturulamýyor.'#13 + E.Message);
//      Exit;
//    end;
//  end;
//
//  UniSession.SendFile(DOCXRpt.OutputFile, 'PL_16.docx');
end;

procedure TfrDetayEnvanterListe.PrepIlgiliKisi;
begin
  QueryOpen(qKisi, 'SELECT env.kisi_id, ks.kisi AS kisi_str, ks.description as kisi_info, ' +
                   'string_agg(DISTINCT vt.veri_tipi,'', '' )::varchar as veritipi_str ' +
                   'FROM data_envanter env ' +
                   ' join data_checklist cl on env.mc_id= cl.mc_id and env.kisi_id = cl.kisi_id and cl.kaynak_id= env.kaynak_id '+
                   'LEFT JOIN def_data_kisi ks ON ks.id = env.kisi_id ' +
                   'LEFT JOIN def_data_veritipi vt ON vt.id = env.veritipi_id'+
                   ' WHERE env.active = ''E'' and cl.active=''E'' AND env.mc_id = ' + IntToStr(MainMod.MCID) +
                   ' GROUP by env.kisi_id, ks.kisi, ks.description ORDER BY env.kisi_id');

//  QueryOpen(qKisi, 'SELECT env.kisi_id, ks.kisi AS kisi_str, ks.description as kisi_info, ' +
//                   'string_agg(DISTINCT vt.veri_tipi,'', '' )::varchar as veritipi_str ' +
//                   'FROM data_envanter env ' +
//                   'LEFT JOIN def_data_kisi ks ON ks.id = env.kisi_id ' +
//                   'LEFT JOIN def_data_veritipi vt ON vt.id = env.veritipi_id'+
//                   ' WHERE env.active = ''E'' AND env.mc_id = ' + IntToStr(MainMod.MCID) +
//                   ' GROUP by kisi_id, ks.kisi, ks.description ORDER BY env.kisi_id');
end;

procedure TfrDetayEnvanterListe.PrepKategoriSure;
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
                   'LEFT JOIN def_data_kategori kat ON env.kategori_id = kat.id ' +
                   'WHERE env.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) + ' ' +
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

procedure TfrDetayEnvanterListe.PrepKategoriVeriTipi;
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
//  ////////////////////////////////////
//  tblCatVT.First;
//  while not tblCatVT.EOF do tblCatVT.Delete;
//
//  QueryOpen(qTmp, 'SELECT DISTINCT env.kategori_id, kt.kategori, kt.description ' +
//                  'FROM data_envanter env ' +
//                  'LEFT JOIN def_data_kategori kt ON kt.id = env.kategori_id ' +
//                  'WHERE env.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) +
//                  ' ORDER BY 2');
//
//  while not qTmp.EOF do
//  begin
//    tblCatVT.Append;
//    tblCatVT.FieldByName('cat_id').AsInteger  := qTmp.FieldByName('kategori_id').AsInteger;
//    tblCatVT.FieldByName('cat_str').AsString  := qTmp.FieldByName('kategori').AsString;
//    tblCatVT.FieldByName('cat_info').AsString := qTmp.FieldByName('description').AsString;
//
//    VTStr := '';
//    QueryOpen(qTmp2, 'SELECT DISTINCT vt.veri_tipi ' +
//                     'FROM data_envanter env ' +
//                     'LEFT JOIN def_data_veritipi vt ON vt.id = env.veritipi_id ' +
//                     'WHERE env.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) +
//                     ' AND env.kategori_id = ' + IntToStr(qTmp.FieldByName('kategori_id').AsInteger) +
//                     ' ORDER BY 1');
//    while not qTmp2.EOF do
//    begin
//      VTStr := VTStr + qTmp2.FieldByName('veri_tipi').AsString + ', ';
//      qTmp2.Next;
//    end;
//    if VTStr <> '' then System.Delete(VTStr, Length(VTStr) - 1, 2);
//    tblCatVT.FieldByName('cat_vt').AsString := VTStr;
//
//    tblCatVT.Post;
//
//    qTmp.Next;
//  end;
//
//  qCatVT.Close;
//  qCatVT.SQL.Clear;
//  qCatVT.SQL.Add('SELECT * FROM tblCatVT ORDER BY cat_str');
//  qCatVT.Open;
end;

procedure TfrDetayEnvanterListe.PrepKisiVeriTipi;
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

  {tblKisiVT.First;
  while not tblKisiVT.EOF do tblKisiVT.Delete;

  QueryOpen(qTmp, 'SELECT DISTINCT env.kisi_id, ks.kisi ' +
                  'FROM data_envanter env ' +
                  'LEFT JOIN def_data_kisi ks ON ks.id = env.kisi_id ' +
                  'WHERE env.active = ''E'' AND env.main_id = 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) +
                  ' ORDER BY 2');
  while not qTmp.EOF do
  begin
    tblKisiVT.Append;
    tblKisiVT.FieldByName('kisi_id').AsInteger  := qTmp.FieldByName('kisi_id').AsInteger;
    tblKisiVT.FieldByName('kisi_str').AsString  := qTmp.FieldByName('kisi').AsString;

    VTStr := '';
    QueryOpen(qTmp2, 'SELECT DISTINCT vt.veri_tipi ' +
                     'FROM data_envanter env ' +
                     'LEFT JOIN def_data_veritipi vt ON vt.id = env.veritipi_id ' +
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
  qKisiVT.Open; }
end;

procedure TfrDetayEnvanterListe.PrepTaraflar;
var
  IDList : String;
begin
  tblTaraf.First;
  while not tblTaraf.EOF do tblTaraf.Delete;

  QueryOpen(qTmp, 'SELECT DISTINCT payl_taraf_ids FROM data_envanter ' +
                  'WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID));
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

procedure TfrDetayEnvanterListe.qRaporCalcFields(DataSet: TDataSet);
begin
  if (qRapor.FieldByName('topl_amac_str1').AsString = '') and (qRapor.FieldByName('topl_amac_str2').AsString = '') then
     qRapor.FieldByName('topl_amac_str').AsString   := ''
  else if qRapor.FieldByName('topl_amac_str1').AsString = '' then
     qRapor.FieldByName('topl_amac_str').AsString   := qRapor.FieldByName('topl_amac_str2').AsString
  else if qRapor.FieldByName('topl_amac_str2').AsString = '' then
     qRapor.FieldByName('topl_amac_str').AsString   := qRapor.FieldByName('topl_amac_str1').AsString
  else
    qRapor.FieldByName('topl_amac_str').AsString   := qRapor.FieldByName('topl_amac_str1').AsString + '; ' + qRapor.FieldByName('topl_amac_str2').AsString;

  if (qRapor.FieldByName('topl_metod_str1').AsString = '') and (qRapor.FieldByName('topl_metod_str2').AsString = '') then
     qRapor.FieldByName('topl_metod_str').AsString   := ''
  else if qRapor.FieldByName('topl_metod_str1').AsString = '' then
     qRapor.FieldByName('topl_metod_str').AsString   := qRapor.FieldByName('topl_metod_str2').AsString
  else if qRapor.FieldByName('topl_metod_str2').AsString = '' then
     qRapor.FieldByName('topl_metod_str').AsString   := qRapor.FieldByName('topl_metod_str1').AsString
  else
     qRapor.FieldByName('topl_metod_str').AsString  := qRapor.FieldByName('topl_metod_str1').AsString + '; ' + qRapor.FieldByName('topl_metod_str2').AsString;

  if (qRapor.FieldByName('sakl_amac_str1').AsString = '') and (qRapor.FieldByName('sakl_amac_str2').AsString = '') then
     qRapor.FieldByName('sakl_amac_str').AsString   := ''
  else if qRapor.FieldByName('sakl_amac_str1').AsString = '' then
     qRapor.FieldByName('sakl_amac_str').AsString   := qRapor.FieldByName('sakl_amac_str2').AsString
  else if qRapor.FieldByName('sakl_amac_str2').AsString = '' then
     qRapor.FieldByName('sakl_amac_str').AsString   := qRapor.FieldByName('sakl_amac_str1').AsString
  else
     qRapor.FieldByName('sakl_amac_str').AsString   := qRapor.FieldByName('sakl_amac_str1').AsString + '; ' + qRapor.FieldByName('sakl_amac_str2').AsString;

  if (qRapor.FieldByName('sakl_metod_str1').AsString = '') and (qRapor.FieldByName('sakl_metod_str2').AsString = '') then
     qRapor.FieldByName('sakl_metod_str').AsString   := ''
  else if qRapor.FieldByName('sakl_metod_str1').AsString = '' then
     qRapor.FieldByName('sakl_metod_str').AsString   := qRapor.FieldByName('sakl_metod_str2').AsString
  else if qRapor.FieldByName('sakl_metod_str2').AsString = '' then
     qRapor.FieldByName('sakl_metod_str').AsString   := qRapor.FieldByName('sakl_metod_str1').AsString
  else
     qRapor.FieldByName('sakl_metod_str').AsString  := qRapor.FieldByName('sakl_metod_str1').AsString + '; ' + qRapor.FieldByName('sakl_metod_str2').AsString;

  if (qRapor.FieldByName('sakl_erisim_str1').AsString = '') and (qRapor.FieldByName('sakl_erisim_str2').AsString = '') then
     qRapor.FieldByName('sakl_erisim_str').AsString   := ''
  else if qRapor.FieldByName('sakl_erisim_str1').AsString = '' then
     qRapor.FieldByName('sakl_erisim_str').AsString   := qRapor.FieldByName('sakl_erisim_str2').AsString
  else if qRapor.FieldByName('sakl_erisim_str2').AsString = '' then
     qRapor.FieldByName('sakl_erisim_str').AsString   := qRapor.FieldByName('sakl_erisim_str1').AsString
  else
     qRapor.FieldByName('sakl_erisim_str').AsString := qRapor.FieldByName('sakl_erisim_str1').AsString + '; ' + qRapor.FieldByName('sakl_erisim_str2').AsString;

  if (qRapor.FieldByName('payl_amac_str1').AsString = '') and (qRapor.FieldByName('payl_amac_str2').AsString = '') then
     qRapor.FieldByName('payl_amac_str').AsString   := ''
  else if qRapor.FieldByName('payl_amac_str1').AsString = '' then
     qRapor.FieldByName('payl_amac_str').AsString   := qRapor.FieldByName('payl_amac_str2').AsString
  else if qRapor.FieldByName('payl_amac_str2').AsString = '' then
     qRapor.FieldByName('payl_amac_str').AsString   := qRapor.FieldByName('payl_amac_str1').AsString
  else
     qRapor.FieldByName('payl_amac_str').AsString   := qRapor.FieldByName('payl_amac_str1').AsString + '; ' + qRapor.FieldByName('payl_amac_str2').AsString;

  if (qRapor.FieldByName('payl_metod_str1').AsString = '') and (qRapor.FieldByName('payl_metod_str2').AsString = '') then
     qRapor.FieldByName('payl_metod_str').AsString   := ''
  else if qRapor.FieldByName('payl_metod_str1').AsString = '' then
     qRapor.FieldByName('payl_metod_str').AsString   := qRapor.FieldByName('payl_metod_str2').AsString
  else if qRapor.FieldByName('payl_metod_str2').AsString = '' then
     qRapor.FieldByName('payl_metod_str').AsString   := qRapor.FieldByName('payl_metod_str1').AsString
  else
     qRapor.FieldByName('payl_metod_str').AsString  := qRapor.FieldByName('payl_metod_str1').AsString + '; ' + qRapor.FieldByName('payl_metod_str2').AsString;

  if (qRapor.FieldByName('payl_taraf_str1').AsString = '') and (qRapor.FieldByName('payl_taraf_str2').AsString = '') then
     qRapor.FieldByName('payl_taraf_str').AsString   := ''
  else if qRapor.FieldByName('payl_taraf_str1').AsString = '' then
     qRapor.FieldByName('payl_taraf_str').AsString   := qRapor.FieldByName('payl_taraf_str2').AsString
  else if qRapor.FieldByName('payl_taraf_str2').AsString = '' then
     qRapor.FieldByName('payl_taraf_str').AsString   := qRapor.FieldByName('payl_taraf_str1').AsString
  else
     qRapor.FieldByName('payl_taraf_str').AsString  := qRapor.FieldByName('payl_taraf_str1').AsString + '; ' + qRapor.FieldByName('payl_taraf_str2').AsString;
end;

procedure TfrDetayEnvanterListe.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('DetayliEnvanterListesi');
end;

procedure TfrDetayEnvanterListe.DefVariables(VL: TStrings);
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

procedure TfrDetayEnvanterListe.DocXreport(AOutputName, AtempFileName,
  AFileName: string; ADatasets: array of TDataSet);
var
  FUrl ,TemplateFileName, TempFilename, outputfileName  : String;
  ADOCXRpt : TrXMLReport;
begin
  ADOCXRpt := TrXMLReport.Create(nil);
  TempFilename := ''; // hata durumunda kontrol için boþ baþlat

  try
    // Genel ayarlar
    DefVariables(ADOCXRpt.Variables);
    ADOCXRpt.ActionAfter := aaNone;

    // Klasör kontrol
    if not DirectoryExists(ServerMod.FilesFolderPath + 'temp\trash') then
      ForceDirectories(ServerMod.FilesFolderPath + 'temp\trash');

    // Þablon ve geçici dosya isimlerini ayarla
    TemplateFileName := ServerMod.FilesFolderPath + AFileName + '.docx';
    TempFilename := ServerMod.FilesFolderPath + AtempFileName + '_' + NewGUID + '.docx';

    // Þablon dosyasýný kopyala
    if FileExists(TemplateFileName) then
      TFile.Copy(TemplateFileName, TempFilename)
    else
      raise Exception.Create('Þablon dosyasý bulunamadý: ' + TemplateFileName);

    // Rapor iþlemleri
    ADOCXRpt.ReportFile := TempFilename;
    OutputFileName := ServerMod.NewCacheFileUrl(False, 'docx', '', '', FUrl, True);
    ADOCXRpt.OutputFile := OutputFileName;

    ADOCXRpt.Execute(ADatasets);
    UniSession.SendFile(ADOCXRpt.OutputFile, AOutputName);

  except
    on E: Exception do
    begin
      ShowMessageN('Hata.. Rapor oluþturulamadý veya gönderilemedi.'#13 + E.Message);
    end;
  end;

  // Her durumda geçici þablon dosyasýný sil
  if TempFilename <> '' then
    FileDel(TempFilename);

  // ADOCXRpt nesnesini serbest býrak
  FreeAndNil(ADOCXRpt);



 { ADOCXRpt := TrXMLReport.Create(nil);
  try
    DefVariables(ADOCXRpt.Variables);
    ADOCXRpt.ActionAfter := aaNone;
    try
        if not DirectoryExists(ServerMod.FilesFolderPath + 'temp\trash') then
          ForceDirectories(ServerMod.FilesFolderPath + 'temp\trash') ;

       TemplateFileName := ServerMod.FilesFolderPath + AFileName + '.docx'; //'temp\PL_16' + '.docx';
       TempFilename := ServerMod.FilesFolderPath + AtempFileName + '_'+ NewGUID + '.docx';
       if FileExists(TemplateFileName) then
        TFile.Copy(TemplateFileName,TempFilename);
       ADOCXRpt.ReportFile := TempFilename;
       outputfileName :=  ServerMod.NewCacheFileUrl(False, 'docx', '', '', FUrl, True);
       ADOCXRpt.OutputFile := outputfileName ;

       ADOCXRpt.Execute(ADatasets) ;

    except on E : Exception   do
      begin
        ShowMessageN('Hata.. Þablon oluþturulamýyor.'#13 + E.Message) ;
        FileDel(TempFileName);
        exit;
      end;
    end;

    try
      UniSession.SendFile(ADOCXRpt.OutputFile, AOutputName)  ;
    except on E : exception  do
      begin
        ShowMessageN('Hata.. Dosya gönderilemiyor.'#13 + E.Message);
        FileDel(TempFileName);
        exit;
      end;
    end;
    FileDel(TempFileName);
  finally
   if Assigned(ADOCXRpt) then
    FreeAndNil(ADOCXRpt);
  end;}
end;

procedure TfrDetayEnvanterListe.DOCXRptUserCalc(Sender: TObject; var CalcStr: string; var Replace: Boolean);
var
  TagValue : String;
begin
  Replace  := True;
  TagValue := AnsiUpperCase(CalcStr);

  if TagValue = 'COMPANYLOGO' then TagValue := MainForm.GetLogoFileName
  else Replace := False;

  if Replace then CalcStr := TagValue;
end;

procedure TfrDetayEnvanterListe.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  qEnvanter.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrDetayEnvanterListe.UniDBGrid1DrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if UniDBGrid1.DataSource.DataSet.FieldByName('kilitli').AsString = 'E' then
  begin
    begin
      Attribs.Font.Style := [fsItalic];
      Attribs.Color := clInfoBk;
    end;
  end;
end;

procedure TfrDetayEnvanterListe.UniFrameCreate(Sender: TObject);
begin
  edSrcDate.DateTime := Date;
  NewSQL;
  edSrcText.SetFocus;
  tblCatVT.Open;
  tblKisiVT.Open;
  tblTaraf.Open;
  tblSure.Open;
  DefVariables(DOCXRpt.Variables);
end;

initialization
  RegisterClass(TfrDetayEnvanterListe);
end.

