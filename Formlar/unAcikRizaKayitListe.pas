unit unAcikRizaKayitListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,system.IOUtils ,StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, DateUtils,
  uniGUIClasses, uniGUIFrame, System.Actions, Vcl.ActnList, Data.DB, DBAccess, Uni, uniBasicGrid, uniDBGrid,
  uniMultiItem, uniComboBox, uniButton, uniBitBtn, uniLabel, uniEdit, uniGUIBaseClasses, uniPanel, MemDS,
  uniMenuButton, Vcl.Menus, uniMainMenu, uniCheckBox, uniDateTimePicker,
  uniDBComboBox, uniDBLookupComboBox;

type
  TfrAcikRizaKayitListe = class(TUniFrame)
    dsRiza: TUniDataSource;
    ActList: TActionList;
    actAddAR: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actSearch: TAction;
    actClose: TAction;
    pnlTop: TUniPanel;
    edSrcText: TUniEdit;
    UniLabel1: TUniLabel;
    btnSearch: TUniBitBtn;
    btnEdit: TUniBitBtn;
    UniLabel2: TUniLabel;
    edSrcDurum: TUniComboBox;
    edSrcType: TUniComboBox;
    UniDBGrid1: TUniDBGrid;
    qRiza: TUniQuery;
    actAddOO: TAction;
    btnUserSettings: TUniMenuButton;
    ppmNew: TUniPopupMenu;
    ppmiNewAR: TUniMenuItem;
    ppmiNewOO: TUniMenuItem;
    UniBitBtn1: TUniBitBtn;
    edSrcDept: TUniComboBox;
    UniLabel3: TUniLabel;
    qTmp: TUniQuery;
    ppmData: TUniPopupMenu;
    ListeyiExceleKaydet1: TUniMenuItem;
    ExceldenieriAl1: TUniMenuItem;
    N1: TUniMenuItem;
    YeniAkRzaKayd1: TUniMenuItem;
    YenizelOnayKayd1: TUniMenuItem;
    Deitir1: TUniMenuItem;
    N2: TUniMenuItem;
    actExportExcel: TAction;
    actImportExcelAR: TAction;
    actHelp: TAction;
    Yardm1: TUniMenuItem;
    UniMenuButton1: TUniMenuButton;
    ppmExcel: TUniPopupMenu;
    UniMenuItem5: TUniMenuItem;
    UniMenuItem6: TUniMenuItem;
    actImportExcelOO: TAction;
    ExceldenzelOnayeriAl1: TUniMenuItem;
    ExceldenzelOnayeriAl2: TUniMenuItem;
    cbOnayTuru: TUniComboBox;
    HepsineSMSEMailGnder1: TUniMenuItem;
    acHepsineMesaj: TAction;
    lbOzel1: TUniLabel;
    lbOzel2: TUniLabel;
    edSrcOzel2: TUniEdit;
    edSrcOzel1: TUniEdit;
    cbBilgileriGizle: TUniCheckBox;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    edSrcTarih2: TUniDateTimePicker;
    edSrcTarih1: TUniDateTimePicker;
    hpnFiltre: TUniHiddenPanel;
    edfId: TUniEdit;
    cbfDurum: TUniComboBox;
    cbfIdTur: TUniComboBox;
    edfKisiStr: TUniEdit;
    edfMAdSoyad: TUniEdit;
    edfMKimlikNo: TUniEdit;
    edfMGsm: TUniEdit;
    edfMEmail: TUniEdit;
    edfAydTanim: TUniEdit;
    btnClose: TUniBitBtn;
    lbKayitSayisi: TUniLabel;
    dsUser: TUniDataSource;
    edKayitKisi: TUniDBLookupComboBox;
    qUser: TUniQuery;
    btnTest: TUniButton;
    popDiger: TUniPopupMenu;
    mnLog: TUniMenuItem;
    btnDiger: TUniMenuButton;
    procedure UniFrameCreate(Sender: TObject);
    procedure edSrcTypeChange(Sender: TObject);
    procedure edSrcDurumChange(Sender: TObject);
    procedure actAddARExecute(Sender: TObject);
    procedure actAddOOExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure UniDBGrid1AjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
    procedure actHelpExecute(Sender: TObject);
    procedure actExportExcelExecute(Sender: TObject);
    procedure actImportExcelARExecute(Sender: TObject);
    procedure actImportExcelOOExecute(Sender: TObject);
    procedure acHepsineMesajExecute(Sender: TObject);
    procedure UniDBGrid1ColumnFilter(Sender: TUniDBGrid;
      const Column: TUniDBGridColumn; const Value: Variant);
    procedure edSrcDeptChange(Sender: TObject);
    procedure edKayitKisiChange(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
    procedure mnLogClick(Sender: TObject);
  private
    deptIdList: TStringList;
    procedure NewSQL(nerden:string);
    procedure ManageSettings;
    procedure AydinlatmaMetniTest(AId:string;ArizaTuru:string);
  public
  end;

implementation

{$R *.dfm}

uses MainModule, McMLib, Main, unAcikRizaKayitTanim, unOzelOnayKayitTanim,
  unHelpPage, unAcikRizaKayitTopluIslem, unAcikRizaKayitTopluMesaj,ServerModule,
  unLogAcikRizaTanim;

procedure TfrAcikRizaKayitListe.acHepsineMesajExecute(Sender: TObject);
var
  ar_ids: string;
begin
  if edSrcDurum.Text <> 'RIZA ALINMADI' then
  begin
    MessageDlg('Sadece durumu "RIZA ALINMADI" olan kayýtlara mesaj gönderilebilir.', mtInformation, [mbok]);
    exit;
  end;

  ar_ids := '';
  qRiza.First;
  while not qRiza.Eof do
  begin
    ar_ids := ar_ids + qRiza.FieldByName('id').AsString + ',';
    qRiza.Next;
  end;
  if ar_ids <> '' then
  begin
    frmAcikRizaKayitTopluMesaj.Exec(copy(ar_ids, 1, length(ar_ids)-1));
  end
  else
  begin
    MessageDlg('Gönderilecek kayýt bulunamadý!', mtInformation, [mbok]);
  end;
end;

procedure TfrAcikRizaKayitListe.actAddARExecute(Sender: TObject);
begin
  if frmAcikRizaKayitTanim.Exec(qRiza.FieldByName('id').AsInteger, 0) = mrOk then RefreshQuery(qRiza);
  ManageSettings;
end;

procedure TfrAcikRizaKayitListe.actAddOOExecute(Sender: TObject);
begin
  if frmOzelOnayKayitTanim.Exec(qRiza.FieldByName('id').AsInteger, 0) = mrOk then RefreshQuery(qRiza);
  ManageSettings;
end;

procedure TfrAcikRizaKayitListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrAcikRizaKayitListe.actDeleteExecute(Sender: TObject);
begin
//
end;

procedure TfrAcikRizaKayitListe.actEditExecute(Sender: TObject);
begin
  if (qRiza.FieldByName('durum').AsString <> 'AKTÝF') and (qRiza.FieldByName('durum').AsString <> 'RIZA ALINMADI') then
  begin
    if not MainMod.LoginInfo.Yetkiler[125] then
    begin
      MessageDlg('Deðiþtirmek istediðiniz kayýt PASÝF yapýlmýþ. Bu kaydý deðiþtirme yetkiniz yok.', mtError, [mbOk]);
      Exit;
    end;
  end;

  if qRiza.FieldByName('id_tur').AsString = 'AR' then
  begin
    if frmAcikRizaKayitTanim.Exec(qRiza.FieldByName('id').AsInteger, 1) = mrOk then RefreshQuery(qRiza);
  end
  else if qRiza.FieldByName('id_tur').AsString = 'OO' then
  begin
    if frmOzelOnayKayitTanim.Exec(qRiza.FieldByName('id').AsInteger, 1) = mrOk then RefreshQuery(qRiza);
  end;
  ManageSettings;
end;

procedure TfrAcikRizaKayitListe.actExportExcelExecute(Sender: TObject);
begin
  if not MainMod.LoginInfo.Yetkiler[184] then
  begin
    MessageDlg('Liste indirme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if qRiza.RecordCount = 0 then Exit;

  newSql('excel');
  MainMod.DownloadDataSetToXls(UniDBGrid1, 'Açýk Rýza Listesi', 'Açýk Rýza Listesi.xlsx');
  newSql('');
end;

procedure TfrAcikRizaKayitListe.actHelpExecute(Sender: TObject);
begin
  frmHelpPage.Exec('AcikRizaKayitListe');
end;

procedure TfrAcikRizaKayitListe.actImportExcelARExecute(Sender: TObject);
begin
  frmAcikRizaKayitTopluIslem.ExecImport('AR');
end;

procedure TfrAcikRizaKayitListe.actImportExcelOOExecute(Sender: TObject);
begin
  frmAcikRizaKayitTopluIslem.ExecImport('OO');
end;

procedure TfrAcikRizaKayitListe.actSearchExecute(Sender: TObject);
begin
  NewSQL('');

end;

procedure TfrAcikRizaKayitListe.btnTestClick(Sender: TObject);

begin
if qRiza.IsEmpty then exit;
if qRiza.FieldByName('id_tur').AsString='AR' then
  AydinlatmaMetniTest( qRiza.FieldByName('id').AsString,qRiza.FieldByName('id_tur').AsString)
 else
 begin
  QueryOpen(qtmp,  'SELECT OO.id FROM  data_acikriza rz ' +
   ' JOIN def_data_ozelonay oo ON oo.id = rz.oo_id  WHERE RZ.ID='+qRiza.FieldByName('id').AsString ) ;
   if qTmp.IsEmpty then
   begin
     MessageDlg('Kayýt bulunamadý ',TMsgDlgType.mtConfirmation,[mbYes]);
     exit;
   end;
    AydinlatmaMetniTest( qTmp.FieldByName('id').AsString,qRiza.FieldByName('id_tur').AsString)
 end;
end;

procedure TfrAcikRizaKayitListe.AydinlatmaMetniTest(AId:string;ArizaTuru:string);
var
  qry: TUniQuery;
  ms: TMemoryStream;
  TempFileName: string;
  FUrl: string;
begin
  qry := TUniQuery.Create(nil);
  try
    qry.Connection := mainmod.DBMain;  // Veritabaný baðlantýnýzý burada belirtin

    if ArizaTuru ='AR' then
    qry.SQL.Text := 'SELECT belge FROM data_acikriza_docs WHERE ar_id = :ar_id'
    else
     qry.SQL.Text := 'SELECT dosya FROM def_data_ozelonay_docs WHERE  dosya_tur=''PDF'' and oo_id = :ar_id';
    qry.ParamByName('ar_id').AsString := AId;

    qry.Open;
    if not qry.IsEmpty then
    begin
      ms := TMemoryStream.Create;
      try
        // BLOB alanýndaki PDF verisini belleðe aktar
      //  qry.CreateBlobStream(qry.FieldByName('dosya'), bmRead).SaveToStream(ms); //asil yazmak istediðim
        TBlobField(qry.FieldByName(ifthen(ArizaTuru='AR', 'belge','dosya'))).SaveToStream(ms);
        ms.Position := 0; // Bellek akýþýnýn baþýna dön
        // PDF dosyasýný geçici bir dosyaya kaydet
         FUrl := '';
        TempFileName := TPath.GetTempPath + TPath.GetGUIDFileName + '.pdf';
        TempFileName := ServerMod.NewCacheFileUrl(False, 'pdf', 'deneme', '', FUrl, True);
        ms.SaveToFile(TempFileName);
        // PDF dosyasýný kullanýcýya sunma
        UniSession.SendFile(TempFileName, 'deneme.pdf');
      finally
        ms.Free;
      end;
    end
    else
    begin
      ShowMessage('Kayýt bulunamadý.');
    end;
  finally
    qry.Free;
  end;

end;

procedure TfrAcikRizaKayitListe.edSrcDeptChange(Sender: TObject);
begin
  NewSQL('');
end;

procedure TfrAcikRizaKayitListe.edSrcDurumChange(Sender: TObject);
begin
  NewSQL('');
end;

procedure TfrAcikRizaKayitListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL('');
end;

procedure TfrAcikRizaKayitListe.edSrcTypeChange(Sender: TObject);
begin
  edSrcText.Visible    := edSrcType.ItemIndex in [0, 1, 2 ,3, 4, 5, 6];
  edKayitKisi.Visible  := edSrcType.ItemIndex in [7];
  NewSQL('');
end;

procedure TfrAcikRizaKayitListe.ManageSettings;
begin
  actAddAR.Enabled    := MainMod.LoginInfo.Yetkiler[123] and (qRiza.State = dsBrowse);
  // to do : Bunun yetkisi ayarlanacak
  actAddOO.Enabled    := MainMod.LoginInfo.Yetkiler[123] and (qRiza.State = dsBrowse);
  actEdit.Enabled   := MainMod.LoginInfo.Yetkiler[124] and (qRiza.State = dsBrowse) and (qRiza.FieldByName('id').AsInteger > 0);
  actImportExcelAR.Enabled    := MainMod.LoginInfo.Yetkiler[123] and (qRiza.State = dsBrowse);
  actImportExcelOO.Enabled    := MainMod.LoginInfo.Yetkiler[123] and (qRiza.State = dsBrowse);
  actClose.Enabled  := not DataEditing(qRiza);
  actExportExcel.Enabled    := MainMod.LoginInfo.Yetkiler[184] and (qRiza.State = dsBrowse);
  actImportExcelAR.Enabled  := MainMod.LoginInfo.Yetkiler[185] and (qRiza.State = dsBrowse);
  actImportExcelOO.Enabled  := MainMod.LoginInfo.Yetkiler[185] and (qRiza.State = dsBrowse);
  acHepsineMesaj.Enabled    := MainMod.LoginInfo.Yetkiler[186] and (qRiza.State = dsBrowse);

  cbBilgileriGizle.Enabled  := MainMod.LoginInfo.Yetkiler[187];
  // create eventinde ayarlanýyor sql sonrasý her seferinde deðiþmemesi için
//  cbBilgileriGizle.Checked  := MainMod.qMCParam.FieldByName('ar_bilgileri_maskele').AsString = 'E';

  {$IFDEF DEBUG}
  btnTest.Visible := true;
  {$ENDIF}
end;

procedure TfrAcikRizaKayitListe.mnLogClick(Sender: TObject);
begin
  frmLogAcikRizaTanim.Exec(dsRiza.DataSet.FieldByName('id').AsInteger);
end;

procedure TfrAcikRizaKayitListe.NewSQL(nerden:string);
var
  SQLStr     ,
  srctext    ,
	SQLStr_1   ,
  SQLStr_2   ,
	WhereStr_1 ,
  WhereStr_2 ,
  deptStr     : string;
  i           : Integer;
begin

  if not GuvenliGirisMi(edSrcText.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;
   if not GuvenliGirisMi(edSrcOzel1.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;
     if not GuvenliGirisMi(edSrcOzel2.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;

SQLStr_1   := '   SELECT rz.*, ks.kisi as kisi_str, ayd.tanim as ayd_tanim, ' +
                '   fnc_maskele(rz.ad_soyad) m_ad_soyad, fnc_maskele(rz.kimlik_no) m_kimlik_no, ' +
                '   fnc_maskele(rz.gsmno) m_gsmno, fnc_maskele(rz.email) m_email ' +
                '   FROM data_acikriza rz ' +
             //   '   LEFT JOIN def_data_aydinlatma ayd ON ayd.durum = ''YAYINDA'' AND ayd.id = rz.ayd_id ' +
                '   LEFT JOIN def_data_aydinlatma ayd ON  ayd.id = rz.ayd_id ' +
                '   LEFT JOIN def_data_kisi ks ON ks.id = rz.kisi_id ';
	SQLStr_2   := '   SELECT rz.*, ks.kisi as kisi_str, oo.tanim as ayd_tanim, ' +
                '   fnc_maskele(rz.ad_soyad) m_ad_soyad, fnc_maskele(rz.kimlik_no) m_kimlik_no, ' +
                '   fnc_maskele(rz.gsmno) m_gsmno, fnc_maskele(rz.email) m_email ' +
                '   FROM data_acikriza rz ' +
          //      '   LEFT JOIN def_data_ozelonay oo ON oo.durum = ''YAYINDA'' AND oo.id = rz.oo_id ' +
                '   LEFT JOIN def_data_ozelonay oo ON  oo.id = rz.oo_id ' +
                '   LEFT JOIN def_data_kisi ks ON ks.id = rz.kisi_id ';

	WhereStr_1 	:= 'rz.id_tur = ''AR'' AND rz.mc_id =:mc_id AND ' +
                  ' (string_to_array(rz.dept_ids, '','')::int[] ' +
                  ' && string_to_array(''' + mainmod.LoginInfo.Birimler + ''', '','')::int[] or coalesce(rz.dept_ids, '''') = '''' )   AND ' ;
	WhereStr_2 	:= 'rz.id_tur = ''OO'' AND rz.mc_id =:mc_id AND ' +
                  ' (string_to_array(rz.dept_ids, '','')::int[] ' +
                  ' && string_to_array(''' + mainmod.LoginInfo.Birimler + ''', '','')::int[] or coalesce(rz.dept_ids, '''') = '''' )  AND ' ;

  if edSrcDurum.ItemIndex > 0 then
  begin
    WhereStr_1 := WhereStr_1 + 'rz.durum = :durum AND ';
    WhereStr_2 := WhereStr_2 + 'rz.durum = :durum AND ';
  end;

  if edSrcText.Text <> '' then
  begin
   if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
    case edSrcType.ItemIndex of
      0 : begin
            WhereStr_1 := WhereStr_1 + 'rz.id::varchar LIKE :srctext AND ';
            WhereStr_2 := WhereStr_2 + 'rz.id::varchar LIKE :srctext AND ';
          end;
      1 : begin
            WhereStr_1 := WhereStr_1 + 'ayd.tanim LIKE :srctext AND ';
            WhereStr_2 := WhereStr_2 + 'oo.tanim LIKE :srctext AND ';
          end;
      2 : begin
            WhereStr_1 := WhereStr_1 + 'ks.kisi LIKE :srctext AND ';
            WhereStr_2 := WhereStr_2 + 'ks.kisi LIKE :srctext AND ';
          end;
      3 : begin
            WhereStr_1 := WhereStr_1 + '(fnc_maskele(rz.ad_soyad) LIKE :srctext OR fnc_maskele(rz.ad_soyad2) LIKE :srctext ) AND ';
            WhereStr_2 := WhereStr_2 + '(fnc_maskele(rz.ad_soyad) LIKE :srctext OR fnc_maskele(rz.ad_soyad2) LIKE :srctext ) AND ';
          end;
      4 : begin
            WhereStr_1 := WhereStr_1 + '(fnc_maskele(rz.gsmno) LIKE :srctext OR fnc_maskele(rz.gsmno2) LIKE :srctext ) AND ';
            WhereStr_2 := WhereStr_2 + '(fnc_maskele(rz.gsmno) LIKE :srctext OR fnc_maskele(rz.gsmno2) LIKE :srctext ) AND ';
          end;
      5 : begin
            srctext := TR_Lower(srctext);
            WhereStr_1 := WhereStr_1 + '(fnc_maskele(rz.email) LIKE :srctext OR fnc_maskele(rz.email2) LIKE :srctext ) AND ';
            WhereStr_2 := WhereStr_2 + '(fnc_maskele(rz.email) LIKE :srctext OR fnc_maskele(rz.email2) LIKE :srctext) AND ';
          end;
      6 : begin
            WhereStr_1 := WhereStr_1 + '(fnc_maskele(rz.kimlik_no) LIKE :srctext OR fnc_maskele(rz.kimlik_no2) LIKE :srctext ) AND ';
            WhereStr_2 := WhereStr_2 + '(fnc_maskele(rz.kimlik_no) LIKE :srctext OR fnc_maskele(rz.kimlik_no2) LIKE :srctext ) AND ';
          end;
		end;
	end;

  if edSrcType.ItemIndex = 7 then
  begin
      WhereStr_1 := WhereStr_1 + 'rz.idy =:idy AND ';
      WhereStr_2 := WhereStr_2 + 'rz.idy =:idy AND ';
  end;


  if edSrcOzel1.Text <> '' then
  begin
    srctext := StringReplace(edSrcOzel1.Text, '*', '%', [rfReplaceAll]);
    WhereStr_1 := WhereStr_1 + 'rz.ozel_1 LIKE :srctext AND ';
    WhereStr_2 := WhereStr_2 + 'rz.ozel_1 LIKE :srctext AND ';
  end;
  if edSrcOzel2.Text <> '' then
  begin
    srctext := StringReplace(edSrcOzel2.Text, '*', '%', [rfReplaceAll]);
    WhereStr_1 := WhereStr_1 + 'rz.ozel_2 LIKE :srctext AND ';
    WhereStr_2 := WhereStr_2 + 'rz.ozel_2 LIKE :srctext AND ';
  end;

  if edSrcDept.ItemIndex > 0 then
  begin
    WhereStr_1 := WhereStr_1 + ':dept_id in ( rz.dept_ids )  and ';
//    WhereStr_1 := WhereStr_1 + 'rz.kisi_id IN (SELECT env.kisi_id FROM data_envanter env WHERE env.kisi_id = rz.kisi_id ' +
//                  'AND env.dept_id =:dept_id) AND ';

  end
  else
  begin

  end;

  if edSrcTarih1.Text <> '' then
  begin
    WhereStr_1 := WhereStr_1 + 'rz.tarih >= to_date(:tar1,''DDMMYYYY'') AND ';
    WhereStr_2 := WhereStr_2 + 'rz.tarih >= to_date(:tar1,''DDMMYYYY'') AND ';
  end;

  if edSrcTarih2.Text <> '' then
  begin
    WhereStr_1 := WhereStr_1 + 'rz.tarih <= to_date(:tar2,''DDMMYYYY'') AND ';
    WhereStr_2 := WhereStr_2 + 'rz.tarih <= to_date(:tar2,''DDMMYYYY'') AND ';
  end;


  if nerden='create' then
  begin
    WhereStr_1 := 'rz.id=0 AND ' + WhereStr_1;
    WhereStr_2 := 'rz.id=0 AND ' + WhereStr_2;
  end;

	if Trim(WhereStr_1) <> '' then System.Delete(WhereStr_1, Length(WhereStr_1) - 3, 4);
	if Trim(WhereStr_1) <> '' then SQLStr_1 := SQLStr_1 + 'WHERE ' + WhereStr_1;

	if Trim(WhereStr_2) <> '' then System.Delete(WhereStr_2, Length(WhereStr_2) - 3, 4);
	if Trim(WhereStr_2) <> '' then SQLStr_2 := SQLStr_2 + 'WHERE ' + WhereStr_2;

  case cbOnayTuru.ItemIndex of
    0: SQLStr := 'SELECT * FROM ( ' + SQLStr_1 + ' UNION ALL ' + SQLStr_2 + ' ) AS tbl_acikriza ORDER BY id';
    1: SQLStr := 'SELECT * FROM ( ' + SQLStr_1 + ' ) AS tbl_acikriza ORDER BY id';
    2: SQLStr := 'SELECT * FROM ( ' + SQLStr_2 + ' ) AS tbl_acikriza ORDER BY id';
  end;

  if (nerden='excel') or (cbBilgileriGizle.Checked = false) then
    SQLStr := StringReplace(sqlstr, 'fnc_maskele', '', [rfReplaceAll]);

try
 qRiza.SQL.Text := SQLStr ;
 qRiza.ParamByName('mc_id').AsString := inttostr(mainmod.MCID);
 if qRiza.FindParam('durum') <> nil then
  qRiza.ParamByName('durum').AsString :=  edSrcDurum.Text;
 if qRiza.FindParam('srctext') <> nil then
  qRiza.ParamByName('srctext').AsString := srctext ;
 if qRiza.FindParam('idy') <> nil then
  qRiza.ParamByName('idy').AsString :=  IntToStr(edKayitKisi.KeyValue);
 if qRiza.FindParam('dept_id') <> nil then
  qRiza.ParamByName('dept_id').AsString :=  deptIdList[edSrcDept.itemindex];
 if qRiza.FindParam('tar1') <> nil then
  qRiza.ParamByName('tar1').AsString :=  FormatDateTime('ddmmyyyy', edSrcTarih1.DateTime);
 if qRiza.FindParam('tar2') <> nil then
  qRiza.ParamByName('tar2').AsString :=  FormatDateTime('ddmmyyyy', edSrcTarih2.DateTime+1) ;

 qRiza.Open;
 	//QueryOpen(qRiza, SQLStr);
except
  ShowMessageN('Arama kriterleri hatalý, lütfen tekrar deneyiniz.');
end;
  ManageSettings;
  lbKayitSayisi.Text := IntToStr(qRiza.RecordCount) + ' Kayýt Listelendi...';

end;

procedure TfrAcikRizaKayitListe.UniDBGrid1AjaxEvent(Sender: TComponent;
  EventName: string; Params: TUniStrings);
begin
  if EventName = 'popup' then
    ppmData.Popup(StrToInt(Params.Values['x']), StrToInt(Params.Values['y']), UniDBGrid1);
end;

procedure TfrAcikRizaKayitListe.UniDBGrid1ColumnFilter(Sender: TUniDBGrid;
  const Column: TUniDBGridColumn; const Value: Variant);
begin
  if edfId.Text <> '' then
  begin
    qRiza.Filtered := False;
    qRiza.FilterOptions := [foCaseInsensitive];
    qRiza.Filter := 'id' + ' LIKE ' +  QuotedStr('%' +(TR_Upper(edfId.Text))+ '%');
    qRiza.Filtered := True;
  end
  else if cbfDurum.Text <> '' then
  begin
    qRiza.Filtered := False;
    qRiza.FilterOptions := [foCaseInsensitive];
    qRiza.Filter := 'durum' + ' = ' +  QuotedStr('' +(TR_Upper(cbfDurum.Text))+ '');
    qRiza.Filtered := True;
  end
  else if cbfIdTur.Text <> '' then
  begin
    qRiza.Filtered := False;
    qRiza.FilterOptions := [foCaseInsensitive];
    qRiza.Filter := 'id_tur' + ' = ' +  QuotedStr('' +(TR_Upper(cbfIdTur.Text))+ '');
    qRiza.Filtered := True;
  end
  else if Length(edfAydTanim.Text) > 2 then
  begin
    qRiza.Filtered := False;
    qRiza.FilterOptions := [foCaseInsensitive];
    qRiza.Filter := 'ayd_tanim' + ' LIKE ' +  QuotedStr('%' +(TR_Upper(edfAydTanim.Text))+ '%');
    qRiza.Filtered := True;
  end
  else if Length(edfKisiStr.Text) > 2 then
  begin
    qRiza.Filtered := False;
    qRiza.FilterOptions := [foCaseInsensitive];
    qRiza.Filter := 'kisi_str' + ' LIKE ' +  QuotedStr('%' +(TR_Upper(edfKisiStr.Text))+ '%');
    qRiza.Filtered := True;
  end
  else if Length(edfMAdSoyad.Text) > 2 then
  begin
    qRiza.Filtered := False;
    qRiza.FilterOptions := [foCaseInsensitive];
    qRiza.Filter := 'm_ad_soyad' + ' LIKE ' +  QuotedStr('%' +(TR_Upper(edfKisiStr.Text))+ '%');
    qRiza.Filtered := True;
  end
  else if Length(edfMKimlikNo.Text) > 2 then
  begin
    qRiza.Filtered := False;
    qRiza.FilterOptions := [foCaseInsensitive];
    qRiza.Filter := 'm_kimlik_no' + ' LIKE ' +  QuotedStr('%' +(TR_Upper(edfKisiStr.Text))+ '%');
    qRiza.Filtered := True;
  end
  else if Length(edfMGsm.Text) > 2 then
  begin
    qRiza.Filtered := False;
    qRiza.FilterOptions := [foCaseInsensitive];
    qRiza.Filter := 'm_gsmno' + ' LIKE ' +  QuotedStr('%' +(TR_Upper(edfMGsm.Text))+ '%');
    qRiza.Filtered := True;
  end
  else if Length(edfMEmail.Text) > 2 then
  begin
    qRiza.Filtered := False;
    qRiza.FilterOptions := [foCaseInsensitive];
    qRiza.Filter := 'm_email' + ' LIKE ' +  QuotedStr('%' +(TR_Upper(edfMEmail.Text))+ '%');
    qRiza.Filtered := True;
  end
  else
  begin
    qRiza.Filtered := False;
  end;
end;

procedure TfrAcikRizaKayitListe.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  qRiza.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrAcikRizaKayitListe.edKayitKisiChange(Sender: TObject);
begin
 NewSQL('');
end;

procedure TfrAcikRizaKayitListe.UniFrameCreate(Sender: TObject);
var
  SqlStr ,
  WhereStr : String;
begin
	SQLStr   := 'SELECT * FROM usr_user ';

  WhereStr 	:= 'gc_id = ' + IntToStr(MainMod.GCID) + ' AND ';
  if MainMod.MCType = 0
     then WhereStr 	:= WhereStr + 'mc_id = 0 AND '
	   else WhereStr 	:= WhereStr + 'mc_id = ' + IntToStr(MainMod.MCID) + ' AND ';

  if Trim(WhereStr) <> '' then System.Delete(WhereStr, Length(WhereStr) - 3, 4);
  if Trim(WhereStr) <> '' then SQLStr := SQLStr + 'WHERE ' + WhereStr;
  SQLStr := SQLStr + ' ORDER BY id';

  QueryOpen(qUser,SqlStr);

  edSrcDept.Items.Clear;
  edSrcDept.Items.Add('-- TÜM DEPARTMANLAR --');
  deptIdList := TSTringList.Create;
  deptIdList.Add('0');


  if mainmod.LoginInfo.Birimler <> '' then
    QueryOpen(qTmp, ' SELECT dp.id, ' +
                  ' (case when coalesce(dp.main_dept_id,0) > 0 then dp.title||'' (''||dp_main.title||'') '' ' +
                  ' else dp.title end)::character varying (450) title ' +
                  ' FROM sys_deptdef dp left join sys_deptdef dp_main on dp_main.id = dp.main_dept_id ' +
                    ' WHERE dp.mc_id = ' + IntToStr(MainMod.MCID) +
                  ' AND dp.id in (' + mainmod.LoginInfo.Birimler + ') ORDER BY dp.title')
  else
  begin
    QueryOpen(qTmp, ' SELECT dp.id, ' +
                    ' (case when coalesce(dp.main_dept_id,0) > 0 then dp.title||'' (''||dp_main.title||'') '' ' +
                    ' else dp.title end)::charcter varying (450) title ' +
                    ' FROM sys_deptdef dp left join sys_deptdef dp_main on dp_main.id = dp.main_dept_id ' +
                    ' WHERE dp.mc_id = ' + IntToStr(MainMod.MCID) +
                    ' AND dp.id in (0) ORDER BY dp.title');
    MessageDlg('Kullanýcýnýza yetkili departman tanýmlanmadýðý için ilgili Açýk Rýzalarý göremezsiniz. Lütfen kurum yetkilisi ile iletiþime geçiniz.', mtError, [mbOk]);
  end;
  qTmp.First;
  while not qTmp.EOF do
  begin
    edSrcDept.Items.Add(qTmp.FieldByName('title').AsString);
    deptIdList.Add(qTmp.FieldByName('id').AsString);
    qTmp.Next;
  end;

  edSrcDept.itemindex := 0;

  edSrcTarih1.DateTime := StartOfTheYear(now);
  edSrcTarih2.DateTime := StartOfTheDay(now);

  NewSQL('create');
  ManageSettings;
  edSrcText.SetFocus;
  UniDBGrid1.Columns[12].Visible := MainMod.IYSVar;
  UniDBGrid1.Columns[13].Visible := MainMod.IYSVar;
  UniDBGrid1.Columns[14].Visible := MainMod.IYSVar;

  UniDBGrid1.Columns[10].Title.Caption := mainMod.qMCParam.fieldByName('ar_ozel_1').AsString;
  UniDBGrid1.Columns[11].Title.Caption := mainMod.qMCParam.fieldByName('ar_ozel_2').AsString;
  lbOzel1.Caption := mainMod.qMCParam.fieldByName('ar_ozel_1').AsString;
  lbOzel2.Caption := mainMod.qMCParam.fieldByName('ar_ozel_2').AsString;

  cbBilgileriGizle.Checked := MainMod.qMCParam.FieldByName('ar_bilgileri_maskele').AsString = 'E';

  edKayitKisi.ItemIndex := 0;
  edKayitKisi.Top := 41;

end;

initialization
  RegisterClass(TfrAcikRizaKayitListe);

end.
