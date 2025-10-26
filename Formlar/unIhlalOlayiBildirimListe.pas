unit unIhlalOlayiBildirimListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, Data.DB, DBAccess, Uni, MemDS, uniGUIBaseClasses,
  uniBasicGrid, uniDBGrid, uniButton, uniBitBtn, uniLabel, uniEdit,
  uniDateTimePicker, uniMultiItem, uniComboBox, uniPanel,strutils, frxClass,
  frxDBSet, frxHTML, frxExportBaseDialog, frxExportPDF;

type
  TfrmIhlalOlayiBildirimListe = class(TUniFrame)
    qdata: TUniQuery;
    dsdata: TUniDataSource;
    UniDBGrid1: TUniDBGrid;
    pnlbaslik: TUniPanel;
    pnledit: TUniPanel;
    UniPanel1: TUniPanel;
    cbSrcType: TUniComboBox;
    eddate: TUniDateTimePicker;
    edSrcText: TUniEdit;
    UniLabel4: TUniLabel;
    UniLabel6: TUniLabel;
    pnlbutton: TUniPanel;
    btnSearch: TUniBitBtn;
    btnAdd: TUniBitBtn;
    btnEdit: TUniBitBtn;
    UniBitBtn1: TUniBitBtn;
    rpt: TfrxReport;
    dbformDolduran: TfrxDBDataset;
    qFormDolduran: TUniQuery;
    dbihlal: TfrxDBDataset;
    qihlal: TUniQuery;
    qozelnitelikliveri: TUniQuery;
    qkisiselveri: TUniQuery;
    DBozelveri: TfrxDBDataset;
    dbkisiselveri: TfrxDBDataset;
    dbbildirim: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    dbilgilikisi: TfrxDBDataset;
    qilgilikisi: TUniQuery;
    dbihlal_etki_ilgili_kisi: TfrxDBDataset;
    qihlal_etki_ilgili_kisi: TUniQuery;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure UniDBGrid1DrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure cbSrcTypeChange(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure edSrcTextAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
  private
    procedure newsql;
  public
    { Public declarations }
  end;
  const
  ihlalRptSql :string =
  ' SELECT id, '+
  ' mc_id, '+
  ' baslangic_tarihi, '+
  ' bitis_tarihi, '+
  ' tespit_tarihi, '+
  ' veri_isleyen, '+
  ' veri_isleyen_adresi, '+
  ' ihlal_kaynagi_genel, '+
  ' ihlal_kaynagi_siber_saldiri, '+
  ' ihlal_etkisi, '+
  ' ihlal_tespiti, '+
  ' etkilenen_kisi_sayisi, '+
  ' etkilenen_kayit_sayisi, '+
  ' ihlal_icerigi, '+
  ' ihlal_kaynagi_aciklama , '+
  ' ihlal_etki_aciklama , '+
  ' ihlal_etki_kisigrup_aciklama , '+
  ' ihlal_etki_ilgili_kisi_aciklama , '+
  ' ihlal_etki_ilgili_kisi , '+
  ' olasi_kisisel_sonuc_aciklama, '+
  ' olasi_kurumsal_sonuc_aciklama , '+
  ' personel_egitimi , '+
  ' teknik_tedbir_ihlal_oncesi , '+
  ' idari_tedbir_ihlal_oncesi , '+
  ' teknik_tedbir_ihlal_sonrasi , '+
  ' idari_tedbir_ihlal_sonrasi , '+
  '	kullanici_gorev_unvan, '+
  '	vs_bildirim_tarihi, ' +
  '	kisisel_veri_ihlali, ' +
  ' case when olasi_kisisel_sonuc=1 then ''DÜÞÜK'' '+
  ' when olasi_kisisel_sonuc=3 then ''ORTA'' '+
  ' when olasi_kisisel_sonuc=4 then ''YÜKSEK'' '+
  ' when olasi_kisisel_sonuc=5 then ''ÇOK YÜKSEK'' '+
  ' else  ''HENÜZ BÝLÝNMÝYOR'' end olasi_kisisel_sonuc, '+
  '  '+
  ' case when olasi_kurumsal_sonuc=1 then ''DÜÞÜK'' '+
  ' when olasi_kurumsal_sonuc=2 then ''ORTA'' '+
  ' when olasi_kurumsal_sonuc=3 then ''YÜKSEK'' '+
  ' when olasi_kurumsal_sonuc=4 then ''ÇOK YÜKSEK'' '+
  ' else  ''HENÜZ BÝLÝNMÝYOR'' end olasi_kurumsal_sonuc, '+
  ' idt, '+
  ' ''ÝHLAL KAYNAÐI : <br> ''||string_agg(case '+
  ' when trim(val_genel) = ''1'' THEN '+
  ' ''BELGE/CÝHAZ HIRSIZLIÐI VEYA KAYBOLMASI'' '+
  ' when trim(val_genel) = ''2'' THEN '+
  ' ''VERÝLERÝN GÜVENSÝZ ORTAMDA DEPOLANMASI'' '+
  ' when trim(val_genel) = ''3'' THEN '+
  ' ''SABOTAJ'' '+
  ' when trim(val_genel) = ''4'' THEN '+
  ' ''KAZA/ÝHMAL'' '+
  ' when trim(val_genel) = ''5'' THEN '+
  ' ''DÝÐER'' '+
  ' end, '+
  ' '','' ||''<br>'')  as ihlal_kaynagi_gen, '+
  ' ''SÝBER SALDIRI : <br>''||string_agg(case '+
  ' when trim(val_siber) = ''1'' THEN '+
  ' ''ZARARLI YAZILIMLAR'' '+
  ' when trim(val_siber) = ''2'' THEN '+
  ' ''SOSYAL MÜHENDÝSLÝK'' '+
  ' when trim(val_siber) = ''3'' THEN '+
  ' ''HÝZMET DIÞI BIRAKMA (DOS-DDOS)'' '+
  ' when trim(val_siber) = ''4'' THEN '+
  ' ''FÝDYE YAZILIMI (RANSOMWARE)'' '+
  ' when trim(val_siber) = ''5'' THEN '+
  ' ''PAROLA SALDIRISI (BRUTE-FORCE ATTACK)'' '+
  ' end, '+
  ' '','' || ''<br>'') as ihlal_kaynagi_siber, '+
  ' string_agg(case '+
  ' when trim(val_etki) = ''1'' THEN '+
  ' ''VERÝ GÝZLÝLÝÐÝ'' '+
  ' when trim(val_etki) = ''2'' THEN '+
  ' ''VERÝ BÜTÜNLÜÐÜ'' '+
  ' when trim(val_etki) = ''3'' THEN '+
  ' ''VERÝYE ERÝÞÝM/ULAÞILABÝLÝRLÝK'' '+
  ' END, '+
  ' '','' || ''<br>'') AS ihlal_etki_s '+
  ' FROM (SELECT *, '+
  ' unnest(string_to_array(ihlal_kaynagi_genel, '','')) AS val_genel, '+
  ' unnest(string_to_array(ihlal_kaynagi_siber_saldiri, '','')) AS val_siber, '+
  ' unnest(string_to_array(ihlal_etkisi, '','')) as val_etki '+
  ' FROM def_data_ihlal '+
  ' where mc_id = :mc_id and id=:ihlal_id) AS subquery '+
  ' GROUP BY id, '+
  ' mc_id, '+
  ' baslangic_tarihi, '+
  ' bitis_tarihi, '+
  ' tespit_tarihi, '+
  ' veri_isleyen, '+
  ' veri_isleyen_adresi, '+
  ' ihlal_kaynagi_genel, '+
  ' ihlal_kaynagi_siber_saldiri, '+
  ' ihlal_etkisi, '+
  ' ihlal_tespiti, '+
  ' etkilenen_kisi_sayisi, '+
  ' etkilenen_kayit_sayisi, '+
  ' ihlal_icerigi, '+
  ' olasi_kisisel_sonuc, '+
  ' olasi_kurumsal_sonuc, '+
  ' ihlal_kaynagi_aciklama, '+
  ' ihlal_etki_aciklama , '+
  ' ihlal_etki_kisigrup_aciklama , '+
  ' ihlal_etki_ilgili_kisi_aciklama , '+
  ' ihlal_etki_ilgili_kisi , '+
  ' olasi_kisisel_sonuc_aciklama, '+
  ' olasi_kurumsal_sonuc_aciklama , '+
  ' personel_egitimi , '+
  ' teknik_tedbir_ihlal_oncesi , '+
  ' idari_tedbir_ihlal_oncesi , '+
  ' teknik_tedbir_ihlal_sonrasi , '+
  ' idari_tedbir_ihlal_sonrasi , '+
  '	kullanici_gorev_unvan, '+
  '	vs_bildirim_tarihi, ' +
  '	kisisel_veri_ihlali, ' +
  ' idt ';
  oznitelikliverisql : string =
  ' select string_agg(distinct kategori, '',<br>'') kategori,string_agg(distinct veri_tipi, '',<br>'') veri_tipi '+
  ' from '+
  ' (select   kg.kategori,vt.veri_tipi  from def_data_ihlal_surec_eslesme es '+
  ' join data_envanter en	on en.active=''E'' and en.main_id>0 AND EN.surec_id=es.surec_id '+
  ' join def_data_veritipi vt on vt.id = en.veritipi_id '+
  ' join def_data_kategori kg on kg.id= vt.md_id and vt.nitelik=''ON'' '+
  ' where es.mc_id=:mc_id and es.ihlal_id=:ihlal_id '+
  ' GROUP BY kg.kategori,vt.veri_tipi) as alt_sorgu ';
  kisiselverisql : string =
  ' select distinct  kg.kategori,vt.veri_tipi,vt.nitelik from def_data_ihlal_surec_eslesme es '+
  ' join data_envanter en	on en.active=''E'' and en.main_id>0 AND EN.surec_id=es.surec_id '+
  ' join def_data_veritipi vt on vt.id = en.veritipi_id '+
  ' join def_data_kategori kg on kg.id= vt.md_id and vt.nitelik=''KV'' '+
  ' where es.mc_id=:mc_id and es.ihlal_id=:ihlal_id ';

  ilgilikisisql : string =
   ' select string_agg(k.kisi, '','' ||''<br>'') kisi from def_data_ihlal_surec_eslesme es ' +
   ' join def_data_kisi  k on k.id=any(string_to_array(es.ilgili_kisi_ids, '','')::int[]) ' +
   ' where es.mc_id=:mc_id and es.ihlal_id=:ihlal_id ' ;

   ihlal_etki_ilgili_kisisql : string =
   ' select string_agg(parameter, '',''||''<br>'') ihlal_etki_ilgili_kisi from  def_data_ihlal i ' +
   ' join sys_modul_parameter p on p."module"=''ÝHLAL OLAY'' AND p.main_parameter=''KÝÞÝSEL ETKÝ'' ' +
   ' and p.subid=any(string_to_array(i.ihlal_etki_ilgili_kisi, '','')::int[]) ' +
   ' where mc_id=:mc_id AND  id=:ihlal_id '  ;


implementation

{$R *.dfm}

uses MainModule, ServerModule, McMLib, UnIhlalOlayiBildirimTanim,
  unIhlalOlayDetayListe;


{ TfrmIhlalOlayiBildirimListe }

procedure TfrmIhlalOlayiBildirimListe.btnAddClick(Sender: TObject);
begin
if not MainMod.LoginInfo.Yetkiler[212] then
  begin
    MessageDlg('Ekleme yetkiniz bulunmamaktadýr. Yönetincinize baþvurunuz', mtConfirmation,[mbYes]) ;
    exit;
  end;
 frmIhlalOlayiBildirimTanim.Exec();
end;

procedure TfrmIhlalOlayiBildirimListe.btnEditClick(Sender: TObject);
begin
if not MainMod.LoginInfo.Yetkiler[213] then
  begin
    MessageDlg('Deðiþtirme yetkiniz bulunmamaktadýr. Yönetincinize baþvurunuz', mtConfirmation,[mbYes]) ;
    exit;
  end;

 if frmIhlalOlayiBildirimTanim.Exec(qdata.FieldByName('id').AsString,EtTekDegistirme) = mrok then
  RefreshQuery(qdata);
end;

procedure TfrmIhlalOlayiBildirimListe.btnSearchClick(Sender: TObject);
begin
  newsql;
end;

procedure TfrmIhlalOlayiBildirimListe.cbSrcTypeChange(Sender: TObject);
begin
 if cbSrcType.ItemIndex in [1,2,3,4] then
  begin
    eddate.Visible := true;
    eddate.Left := edSrcText.Left;
    eddate.Top := edSrcText.Top;
    eddate.Width := edSrcText.Width;
    edSrcText.Visible := false;
  end else
  begin
    eddate.Visible := false;
    edSrcText.Visible := true;
  end;
end;

procedure TfrmIhlalOlayiBildirimListe.edSrcTextAjaxEvent(Sender: TComponent;
  EventName: string; Params: TUniStrings);
begin
 if EventName='doSearch' then
  newsql;
end;

procedure TfrmIhlalOlayiBildirimListe.newsql;
var
	SQLStr :string  ;
  WhereStr : string;
  DetayList : TfrmIhlalOlayDetayListe;
  intveri :string;
  SrcText : string;
begin

    if not GuvenliGirisMi(edSrcText.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;

  if edSrcText.Text <> '' then
  begin
    if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
  end;

	SQLStr   := ' select i.baslangic_tarihi,i.bitis_tarihi,i.tespit_tarihi,i.ihlal_icerigi,ib.* '+
              ' from def_data_ihlal_bildirim ib ' +
              ' left join def_data_ihlal i on i.id=ib.ihlal_id  ' ;
  WhereStr := 'ib.mc_id=:mc_id ' ;

    if (cbSrcType.ItemIndex=0) and (edSrcText.Text <> '') then
    wherestr := WhereStr + ' and ihlal_icerigi like :srctext ';
  if (cbSrcType.ItemIndex=1) and (eddate.DateTime>0 ) then
    WhereStr := wherestr + ' and baslangic_tarihi=:baslangis_tarihi ';
  if (cbSrcType.ItemIndex=2) and (eddate.DateTime>0 ) then
    WhereStr := wherestr + ' and bitis_tarihi=:bitis_tarihi ';
  if (cbSrcType.ItemIndex=3) and (eddate.DateTime>0 ) then
    WhereStr := wherestr + ' and tespit_tarihi=:tespit_tarihi ';
  if (cbSrcType.ItemIndex=4) and (eddate.DateTime>0 ) then
    WhereStr := wherestr + ' and bildirim_tarihi=:bildirim_tarihi ';
  if (cbSrcType.ItemIndex =5) then
  begin
    DetayList := TfrmIhlalOlayDetayListe.Create(self);
    try
     intveri :=DetayList.EtkilenenKayit(edSrcText.Text,stetkilenenSurec) ;
     WhereStr := wherestr +' and ihlal_id in ('+ ifthen( intveri='','0',intveri)+')';
    finally
      if assigned(DetayList) then
        FreeAndNil(DetayList);
    end;
  end;
  if (cbSrcType.ItemIndex =6) then
  begin
    DetayList := TfrmIhlalOlayDetayListe.Create(self);
    try
     intveri :=DetayList.EtkilenenKayit(edSrcText.Text,stEtkilenenKisi) ;
     WhereStr := wherestr +' and ihlal_id in ('+ ifthen( intveri='','0',intveri)+')';
    finally
      if assigned(DetayList) then
        FreeAndNil(DetayList);
    end;
  end;
  if (cbSrcType.ItemIndex =7) then
  begin
    DetayList := TfrmIhlalOlayDetayListe.Create(self);
    try
     intveri :=DetayList.EtkilenenKayit(edSrcText.Text,stEtkilenenKaynak) ;
     WhereStr := wherestr +' and ihlal_id in ('+ ifthen( intveri='','0',intveri)+')';
    finally
      if assigned(DetayList) then
        FreeAndNil(DetayList);
    end;
  end;
//  qdata.SQL.Text := Format(sqlstr,[ 'where '+WhereStr])  ;
//  qdata.Open;

  qdata.SQL.Text :=  sqlstr + ' where '+ WhereStr  ;
  qdata.ParamByName('mc_id').AsString := inttostr(mainmod.MCID);
  if qdata.FindParam('srctext') <> nil then
    qdata.ParamByName('srctext').AsString := SrcText;
  if qdata.FindParam('baslangis_tarihi') <> nil then
    qdata.ParamByName('baslangis_tarihi').AsDate := eddate.DateTime;
  if qdata.FindParam('bitis_tarihi') <> nil then
    qdata.ParamByName('bitis_tarihi').AsDate := eddate.DateTime;
  if qdata.FindParam('tespit_tarihi') <> nil then
    qdata.ParamByName('tespit_tarihi').AsDate := eddate.DateTime;
  if qdata.FindParam('bildirim_tarihi') <> nil then
    qdata.ParamByName('bildirim_tarihi').AsDate := eddate.DateTime;

  qdata.Open;
end;

procedure TfrmIhlalOlayiBildirimListe.UniBitBtn1Click(Sender: TObject);
var
  FName   : String;
  TmpName : String;
  FUrl    : String;
begin
if qdata.RecordCount<0 then exit;
  QueryPrep(qihlal,ihlalRptSql);
  qihlal.ParamByName('mc_id').AsInteger := MainMod.MCID;
  qihlal.ParamByName('ihlal_id').AsInteger := qdata.FieldByName('ihlal_id').AsInteger;
//  qihlal.Open;
//
  QueryOpen(qFormDolduran,'select * from usr_user  where id='+qdata.FieldByName('idy').AsString);
//
  QueryPrep(qozelnitelikliveri,oznitelikliverisql);
  qozelnitelikliveri.ParamByName('mc_id').AsInteger := MainMod.MCID;
  qozelnitelikliveri.ParamByName('ihlal_id').AsInteger := qdata.FieldByName('ihlal_id').AsInteger;
//  qozelnitelikliveri.Open;
//
  QueryPrep(qkisiselveri,kisiselverisql);
  qkisiselveri.ParamByName('mc_id').AsInteger := MainMod.MCID;
  qkisiselveri.ParamByName('ihlal_id').AsInteger := qdata.FieldByName('ihlal_id').AsInteger;
//  qkisiselveri.Open;

  QueryPrep(qilgilikisi,ilgilikisisql);
  qilgilikisi.ParamByName('mc_id').AsInteger := MainMod.MCID;
  qilgilikisi.ParamByName('ihlal_id').AsInteger := qdata.FieldByName('ihlal_id').AsInteger;

  QueryPrep(qihlal_etki_ilgili_kisi,ihlal_etki_ilgili_kisisql);
  qihlal_etki_ilgili_kisi.ParamByName('mc_id').AsInteger := MainMod.MCID;
  qihlal_etki_ilgili_kisi.ParamByName('ihlal_id').AsInteger := qdata.FieldByName('ihlal_id').AsInteger;

    qihlal_etki_ilgili_kisi.Open;
    qilgilikisi.Open;
    qozelnitelikliveri.Open ;
    qFormDolduran.Open;
    qkisiselveri.Open;
    qihlal.Open;

  rpt.PrintOptions.ShowDialog := False;
  rpt.ShowProgress := false;

  rpt.EngineOptions.SilentMode := True;
  rpt.EngineOptions.EnableThreadSafe := True;
  rpt.EngineOptions.DestroyForms := False;
  rpt.EngineOptions.UseGlobalDataSetList := False;

  rpt.PreviewOptions.AllowEdit := False;
  rpt.PrepareReport;
  frxPDFExport1.Background := True;
  frxPDFExport1.ShowProgress := False;
  frxPDFExport1.ShowDialog := False;
  frxPDFExport1.FileName := ServerMod.NewCacheFileUrl(False, 'pdf', '', '', FUrl, True);
  frxPDFExport1.DefaultPath := '';

    FName   := 'Ihlal_Olay_Bildirim_formu.pdf';
    if rpt.Export(frxPDFExport1) then
      UniSession.SendFile(frxPDFExport1.FileName, fname);
end;

procedure TfrmIhlalOlayiBildirimListe.UniDBGrid1DrawColumnCell(Sender: TObject;
  ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
 if (Column.FieldName = 'bildirim_yapildimi') or (Column.FieldName = 'yurtdisi_kurum_bildirim')
        or (Column.FieldName = 'yurtici_kurum_bildirim') then
  begin
    if Column.Field.Value='E' then
      Attribs.Font.Color := clGreen
    else
      Attribs.Font.Color := clRed;
  end;
end;

procedure TfrmIhlalOlayiBildirimListe.UniFrameCreate(Sender: TObject);
begin
  newsql;
end;

initialization

RegisterClass(TfrmIhlalOlayiBildirimListe) ;
end.
