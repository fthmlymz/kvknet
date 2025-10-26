unit unRptVKImhaRaporu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, System.Actions, Vcl.ActnList, uniButton, uniBitBtn, uniGUIBaseClasses,
  uniPanel, Data.DB, MemDS, DBAccess, Uni, uniDateTimePicker, uniLabel, uniBasicGrid, uniDBGrid,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report, FlexCel.Render,
  uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniEdit,
  VirtualTable, Vcl.Menus, uniMainMenu;

type
  TfrRptVKImhaRaporu = class(TUniFrame)
    pnlTop: TUniPanel;
    btnSearch: TUniBitBtn;
    btnClose: TUniBitBtn;
    ActList: TActionList;
    actSearch: TAction;
    actClose: TAction;
    qTmp: TUniQuery;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    edBasTarih: TUniDateTimePicker;
    edBitTarih: TUniDateTimePicker;
    qImha: TUniQuery;
    dsImha: TUniDataSource;
    UniDBGrid1: TUniDBGrid;
    actExcel: TAction;
    btnExcel: TUniBitBtn;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    edVeriKaynagi: TUniEdit;
    edCepTel: TUniEdit;
    edAdiSoyadi: TUniEdit;
    UniLabel6: TUniLabel;
    edDept: TUniComboBox;
    tblRapor: TVirtualTable;
    dsRapor: TUniDataSource;
    actDurumDegistir: TAction;
    actDurumDegistirHepsini: TAction;
    UniPopupMenu1: TUniPopupMenu;
    DurumunuDeitirmhaEt1: TUniMenuItem;
    HepsininDurumunuDeitirmhaEt1: TUniMenuItem;
    btnHelp: TUniBitBtn;
    procedure UniFrameCreate(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure actExcelExecute(Sender: TObject);
    procedure actDurumDegistirExecute(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure edAdiSoyadiAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
    procedure edVeriKaynagiAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
    procedure edCepTelAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
    procedure edDeptChange(Sender: TObject);
  private
    lstDeptId: TStringList;
    procedure PrepareReport(Date1, Date2: TDate);
    // Yazdýrma Yetkisi : 98 olarbiler
  public
  end;

implementation

{$R *.dfm}

uses MainModule, McMLib, Main, ServerModule, unHelpPage;

procedure TfrRptVKImhaRaporu.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrRptVKImhaRaporu.actDurumDegistirExecute(Sender: TObject);
//var
//  Durum    ,
//  Aciklama : String;
//  Tarih    : TDateTime;
begin
//  Durum    := qARVK.FieldByName('durum').AsString;
//  Tarih    := qARVK.FieldByName('imha_tarihi').AsDateTime;
//  Aciklama := qARVK.FieldByName('imha_aciklama').AsString;
//
//  if Durum = 'ÝMHA EDÝLDÝ' then
//  begin
//    if not MainMod.LoginInfo.Yetkiler[133] then
//    begin
//      MessageDlg('Ýmha edilmiþ bir veri kaynaðý üzerinde deðiþiklik yapma yetkiniz yok.', mtError, [mbOk]);
//      Exit;
//    end;
//  end;
//
//  if frmAcikRizaVKDurum.Exec(Durum, Tarih, Aciklama) = mrOk then
//  begin
//    qARVK.Edit;
//    qARVK.FieldByName('durum').AsString := Durum;
//    qARVK.FieldByName('imha_tarihi').AsDateTime := Tarih;
//    if qARVK.FieldByName('durum').AsString <> 'ÝMHA EDÝLDÝ' then qARVK.FieldByName('imha_tarihi').Clear;
//    qARVK.FieldByName('imha_aciklama').AsString := Aciklama;
//    qARVK.Post;
//  end;
end;

procedure TfrRptVKImhaRaporu.actExcelExecute(Sender: TObject);
var
  Report  : TFlexCelReport;
  FName   : String;
  TmpName : String;
  FUrl    : String;
begin
  if not MainMod.LoginInfo.Yetkiler[129] then  {TODO: Excel yetki no Veri Ýmha}
  begin
    MessageDlg('Doküman indirme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if not qImha.Active then Exit;
  if tblRapor.FieldByName('ref_no').AsInteger < 1 then Exit;
  if tblRapor.FieldByName('onem').AsString = '' then Exit;

  Report := TFlexCelReport.Create(True);
  try
    Report.AddTable('tbllist', tblRapor);
    FUrl    := '';
    FName   := 'Veri_Imha_Raporu';
    TmpName := ServerMod.NewCacheFileUrl(False, 'xlsx', FName, '', FUrl, True);
    Report.Run(ServerMod.FilesFolderPath + 'temp_xls\rpt_veriimharaporu.template.xlsx', TmpName);
  finally
    Report.Free;
  end;

  UniSession.SendFile(TmpName, FName + '.xlsx');
end;

procedure TfrRptVKImhaRaporu.actSearchExecute(Sender: TObject);
var
  Trh1, Trh2 : TDate;
begin
  Trh1 := Trunc(edBasTarih.DateTime);
  Trh2 := Trunc(edBitTarih.DateTime);

  if Trh1 > Trh2 then
  begin
    MessageDlg('Baþlangýç Tarihi, Bitiþ Tarihinden büyük olamaz. Lütfen kontrol ediniz.', mtError, [mbOk]);
    Exit;
  end;

  PrepareReport(Trh1, Trh2);
end;

procedure TfrRptVKImhaRaporu.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('RptVKImhaRaporu');
end;

procedure TfrRptVKImhaRaporu.edAdiSoyadiAjaxEvent(Sender: TComponent;
  EventName: string; Params: TUniStrings);
var
  Trh1, Trh2 : TDate;
begin
  Trh1 := Trunc(edBasTarih.DateTime);
  Trh2 := Trunc(edBitTarih.DateTime);
  if EventName = 'doSearch' then PrepareReport(Trh1, Trh2);
end;


procedure TfrRptVKImhaRaporu.edCepTelAjaxEvent(Sender: TComponent;
  EventName: string; Params: TUniStrings);
var
  Trh1, Trh2 : TDate;
begin
  Trh1 := Trunc(edBasTarih.DateTime);
  Trh2 := Trunc(edBitTarih.DateTime);
  if EventName = 'doSearch' then PrepareReport(Trh1, Trh2);
end;

procedure TfrRptVKImhaRaporu.edDeptChange(Sender: TObject);
var
  Trh1, Trh2 : TDate;
begin
  Trh1 := Trunc(edBasTarih.DateTime);
  Trh2 := Trunc(edBitTarih.DateTime);
  PrepareReport(Trh1, Trh2);
end;

procedure TfrRptVKImhaRaporu.edVeriKaynagiAjaxEvent(Sender: TComponent;
  EventName: string; Params: TUniStrings);
var
  Trh1, Trh2 : TDate;
begin
  Trh1 := Trunc(edBasTarih.DateTime);
  Trh2 := Trunc(edBitTarih.DateTime);
  if EventName = 'doSearch' then PrepareReport(Trh1, Trh2);
end;

procedure TfrRptVKImhaRaporu.PrepareReport(Date1, Date2: TDate);
var
  sqlstr : string;
  Trh1, Trh2 : String;
  fltr: String;
  onemstr: String;
  deptstr: String;
  kaynakstr: String;
  refno: integer;
begin

   if not GuvenliGirisMi(edVeriKaynagi.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;
    if not GuvenliGirisMi(edAdiSoyadi.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;
    if not GuvenliGirisMi(edCepTel.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;

  tblRapor.First;
  while not tblRapor.EOF do
    tblRapor.Delete;

  Trh1 := FormatDateTime('dd.mm.yyyy', Date1);
  Trh2 := FormatDateTime('dd.mm.yyyy', Date2);
  fltr := ' ';
  if edAdiSoyadi.Text <> '' then
    fltr := fltr + ' and ar.ad_soyad like :ad_soyad ';
  if edCepTel.Text <> '' then
    fltr := fltr + ' and ar.gsmno like :ceptel ';
  if edVeriKaynagi.Text <> '' then
    fltr := fltr + ' and vk.kaynak_str like :kaynak_str ';
  if edDept.Text <> '' then
    fltr := fltr + ' AND dep.dept_title =:dept_title ';

  UniSession.Synchronize();
  sqlstr := 'SELECT ar.id AS ref_no, ayd.tanim AS aydinlatma, kisi.kisi, ar.durum AS ar_durum, ' +
                   'ar.ad_soyad, ar.gsmno, ar.tarih, ar.faal_bitis AS bit_tarih, vk.kaynak_str, vk.sakl_tip, vk.sakl_str, vk.bitis_tarihi, dep.dept_title, dep.payl_taraf_str ' +
                   '  FROM data_acikriza_vk vk ' +
                   '    LEFT JOIN data_acikriza ar ON ar.id = vk.ar_id ' +
                   '    LEFT JOIN def_data_aydinlatma ayd ON ayd.id = vk.ayd_id ' +
                   '    LEFT JOIN def_data_kisi kisi ON kisi.id = ar.kisi_id ' +
                   '    LEFT JOIN ( ' +
                   ' SELECT ' +
                   ' distinct	dp.ID dep_id, ' +
                   ' (CASE WHEN COALESCE ( dp.main_dept_id, 0 ) > 0 THEN 	dp.title || '' ('' || dp_main.title || '') '' ELSE dp.title END ) ' +
                   ' as dept_title, dp_main.title main_dept_title, ' +
                   ' env.kaynak_id, ' +
                   ' env.kisi_id, ' +
                   ' ( ' +
                   ' SELECT ' +
                   ' string_agg ( T.taraf, '';'' ) ' +
                   ' FROM ' +
                   ' def_data_taraf T ' +
                   ' WHERE ' +
                   ' T.ID = ANY ( string_to_array( env.payl_taraf_ids, '','' ) :: INT [] ) ' +
                   ' ) AS payl_taraf_str ' +
                   ' FROM ' +
                   ' data_envanter env ' +
                   ' left join 	sys_deptdef dp on env.dept_id = dp.ID ' +
                   ' left join sys_deptdef dp_main on dp_main.id = dp.main_dept_id ' +

//                   '    SELECT dp.id dep_id, dp.title dept_title, env.kaynak_id, env.kisi_id, ' +
//                   ' (SELECT string_agg(t.taraf , '';'') FROM   def_data_taraf t  WHERE t.id = any(string_to_array( env.payl_taraf_ids, '','')::int[]))  AS payl_taraf_str ' +
//                //   '    fnc_id2str(env.payl_taraf_ids, ''def_data_taraf''::character varying, ''taraf''::character varying)::character varying (5000) AS payl_taraf_str ' +
//                   '    FROM data_envanter env, sys_deptdef dp ' +
//                   '    WHERE env.dept_id = dp.id ' +
                   '  ) dep ON dep.kaynak_id=vk.kaynak_id and dep.kisi_id = kisi.id' +
                   '  WHERE vk.durum = ''ALINDI'' AND ' + //ar.durum = ''AKTÝF'' AND ' +
                   '  vk.bitis_tarihi BETWEEN ''' + Trh1 + ''' AND ''' + Trh2 + ''' AND vk.mc_id =:mc_id '  + fltr +
                   '  ORDER BY ar.id, dep.dept_title, vk.kaynak_str' ;


   qImha.sql.Text := sqlstr ;
  qImha.ParamByName('mc_id').AsString := inttostr(mainmod.MCID) ;
  if qImha.FindParam('ad_soyad') <> nil then
    qImha.ParamByName('ad_soyad').AsString := '%' + edadisoyadi.Text+ '%';
  if qImha.FindParam('ceptel') <> nil then
    qImha.ParamByName('ceptel').AsString := '%' + edCepTel.Text + '%' ;
  if qImha.FindParam('kaynak_str') <> nil then
    qImha.ParamByName('kaynak_str').AsString := '%' + edVeriKaynagi.Text + '%';
  if qImha.FindParam('dept_title') <> nil then
    qImha.ParamByName('dept_title').AsString :=  edDept.Text ;
  qImha.Open;

  qImha.First;
  refno := 0;
  onemStr := '';
  deptstr := '';
  kaynakstr := '';
  while not qImha.EOF do
  begin
    if (qImha.FieldByName('bitis_tarihi').AsDateTime < date1) and (qImha.FieldByName('ar_durum').AsString <> 'AKTÝF') then
      onemStr := 'KRÝTÝK'
    else if (qImha.FieldByName('bitis_tarihi').AsDateTime < date1) and (qImha.FieldByName('ar_durum').AsString = 'AKTÝF') then
      onemStr := 'ACÝL'
    else
      onemStr := 'NORMAL';

    if refno <> qImha.FieldByName('ref_no').AsInteger then
    begin
      refno := qImha.FieldByName('ref_no').AsInteger;
      deptstr := qImha.FieldByName('dept_title').AsString + ';';
      tblRapor.Append;
      tblRapor.FieldByName('ref_no'      ).AsInteger  := qImha.FieldByName('ref_no'      ).AsInteger;
      tblRapor.FieldByName('aydinlatma'  ).AsString   := qImha.FieldByName('aydinlatma'  ).AsString;
      tblRapor.FieldByName('kisi'        ).AsString   := qImha.FieldByName('kisi'        ).AsString;
      tblRapor.FieldByName('ar_durum'    ).AsString   := qImha.FieldByName('ar_durum'    ).AsString;
      tblRapor.FieldByName('ad_soyad'    ).AsString   := qImha.FieldByName('ad_soyad'    ).AsString;
      tblRapor.FieldByName('gsmno'       ).AsString   := qImha.FieldByName('gsmno'       ).AsString;
      tblRapor.FieldByName('tarih'       ).AsDateTime := qImha.FieldByName('tarih'       ).AsDateTime;
      if qImha.FieldByName('ar_durum').AsString <> 'AKTÝF' then
        tblRapor.FieldByName('bit_tarih'   ).AsDateTime := qImha.FieldByName('bit_tarih'   ).AsDateTime;
      tblRapor.FieldByName('kaynak_str'  ).AsString   := qImha.FieldByName('kaynak_str'  ).AsString;
      tblRapor.FieldByName('sakl_tip'    ).AsString   := qImha.FieldByName('sakl_tip'    ).AsString;
      tblRapor.FieldByName('sakl_str'    ).AsString   := qImha.FieldByName('sakl_str'    ).AsString;
      tblRapor.FieldByName('bitis_tarihi').AsDateTime := qImha.FieldByName('bitis_tarihi').AsDateTime;
      tblRapor.FieldByName('onem'        ).AsString   := onemstr;
      tblRapor.FieldByName('deptstr'     ).AsString   := copy(deptstr, 1, length(deptstr)-1);
      tblRapor.FieldByName('payl_taraf_str').AsString   := qImha.FieldByName('payl_taraf_str').AsString;
      tblRapor.Post;
    end
    else
    begin
      if pos(qImha.FieldByName('dept_title').AsString+';', deptstr) <= 0 then
      begin
        deptstr := deptstr + qImha.FieldByName('dept_title').AsString+';';
        tblRapor.Edit;
        tblRapor.FieldByName('deptstr').AsString   := copy(deptstr, 1, length(deptstr)-1);
        tblRapor.Post;
      end;
    //06.04.2022 tüm veri kaynaklarýnýn görülmesi gerekir //Yýldýrým Tüysüz
      if pos(qImha.FieldByName('kaynak_str').AsString+';', kaynakstr) <= 0 then
      begin
        kaynakstr := kaynakstr + qImha.FieldByName('kaynak_str').AsString+';';
        tblRapor.Edit;
        tblRapor.FieldByName('kaynak_str').AsString   := copy(kaynakstr, 1, length(kaynakstr)-1);
        tblRapor.Post;
      end;
    end;

    if (eddept.Text <> '') and (tblRapor.FieldByName('ref_no').AsInteger > 0) then
    begin
      if pos(eddept.Text, tblRapor.FieldByName('deptstr').AsString) <= 0 then
        tblRapor.Delete;
    end;

    qImha.Next;
  end;
end;

procedure TfrRptVKImhaRaporu.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
begin
  if SameText(Column.FieldName, 'ref_no') then begin end;
end;

procedure TfrRptVKImhaRaporu.UniFrameCreate(Sender: TObject);
begin
  edBasTarih.DateTime := Date - 90;
  edBitTarih.DateTime := Date;
//  tblAmac.Open;
//  PrepareReport;

  QueryOpen(qTmp, 'SELECT dp.id, ' +
                  ' (case when coalesce(dp.main_dept_id,0) > 0 then dp.title||'' (''||dp_main.title||'') '' ' +
                  ' else dp.title end) title ' +
                  ' FROM sys_deptdef dp left join sys_deptdef dp_main on dp_main.id = dp.main_dept_id ' +
                  'WHERE dp.mc_id = ' + IntToStr(MainMod.MCID) +
                  ' ORDER BY dp.id');    //active=''E''

  lstDeptId := TStringList.Create;
  edDept.Items.Clear;
  qTmp.First;
  while not qTmp.EOF do
  begin
    edDept.Items.Add(qTmp.FieldByName('title').AsString);
    lstDeptId.Add(qTmp.FieldByName('id').AsString);
    qTmp.Next;
  end;
  qTmp.Close;
  tblRapor.Open;
end;

initialization
  RegisterClass(TfrRptVKImhaRaporu);

end.
