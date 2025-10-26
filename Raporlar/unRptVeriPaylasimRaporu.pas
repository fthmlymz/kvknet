unit unRptVeriPaylasimRaporu;

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
  TfrRptVeriPaylasimRaporu = class(TUniFrame)
    pnlTop: TUniPanel;
    btnSearch: TUniBitBtn;
    btnClose: TUniBitBtn;
    ActList: TActionList;
    actSearch: TAction;
    actClose: TAction;
    qTmp: TUniQuery;
    qPaylas: TUniQuery;
    dsPaylas: TUniDataSource;
    UniDBGrid1: TUniDBGrid;
    actExcel: TAction;
    btnExcel: TUniBitBtn;
    UniLabel5: TUniLabel;
    edVeriKaynagi: TUniEdit;
    UniLabel6: TUniLabel;
    edDept: TUniComboBox;
    tblRapor: TVirtualTable;
    dsRapor: TUniDataSource;
    actDurumDegistir: TAction;
    actDurumDegistirHepsini: TAction;
    UniPopupMenu1: TUniPopupMenu;
    DurumunuDeitirmhaEt1: TUniMenuItem;
    HepsininDurumunuDeitirmhaEt1: TUniMenuItem;
    procedure UniFrameCreate(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure actExcelExecute(Sender: TObject);
    procedure actDurumDegistirExecute(Sender: TObject);
  private
    lstDeptId: TStringList;
    procedure PrepareReport;
    // Yazdýrma Yetkisi : 98 olarbiler
  public
  end;

implementation

{$R *.dfm}

uses MainModule, McMLib, Main, ServerModule;

procedure TfrRptVeriPaylasimRaporu.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrRptVeriPaylasimRaporu.actDurumDegistirExecute(Sender: TObject);
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

procedure TfrRptVeriPaylasimRaporu.actExcelExecute(Sender: TObject);
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

  if not qPaylas.Active then Exit;
  if tblRapor.FieldByName('ref_no').AsInteger < 1 then Exit;
  if tblRapor.FieldByName('onem').AsString = '' then Exit;

  Report := TFlexCelReport.Create(True);
  try
    Report.AddTable('tbllist', tblRapor);
    FUrl    := '';
    FName   := 'Veri_Paylaþým_Raporu';
    TmpName := ServerMod.NewCacheFileUrl(False, 'xlsx', FName, '', FUrl, True);
    Report.Run(ServerMod.FilesFolderPath + 'temp_xls\rpt_veripaylasimraporu.template.xlsx', TmpName);
  finally
    Report.Free;
  end;

  UniSession.SendFile(TmpName, FName + '.xlsx');
end;

procedure TfrRptVeriPaylasimRaporu.actSearchExecute(Sender: TObject);
var
  Trh1, Trh2 : TDate;
begin
  PrepareReport;
end;

procedure TfrRptVeriPaylasimRaporu.PrepareReport;
var
  Trh1, Trh2 : String;
  fltr: String;
  onemstr: String;
  deptstr: String;
  refno: integer;
begin
  tblRapor.First;
  while not tblRapor.EOF do
    tblRapor.Delete;
  fltr := ' ';
//  if edVeriKaynagi.Text <> '' then
//    fltr := fltr + ' and vk.kaynak_str like ''%' + edVeriKaynagi.Text + '%'' ';

  QueryOpen(qPaylas, 'SELECT ar.id AS ref_no, ayd.tanim AS aydinlatma, kisi.kisi, ar.durum AS ar_durum, ' +
                   'ar.ad_soyad, ar.gsmno, ar.tarih, ar.faal_bitis AS bit_tarih, vk.kaynak_str, vk.sakl_tip, vk.sakl_str, vk.bitis_tarihi, dep.dept_title, dep.payl_taraf_str ' +
                   '  FROM data_acikriza_vk vk ' +
                   '    LEFT JOIN data_acikriza ar ON ar.id = vk.ar_id ' +
                   '    LEFT JOIN def_data_aydinlatma ayd ON ayd.id = vk.ayd_id ' +
                   '    LEFT JOIN def_data_kisi kisi ON kisi.id = ar.kisi_id ' +
                   '    LEFT JOIN ( ' +
                   '    SELECT dp.id dep_id, dp.title dept_title, env.kaynak_id, env.kisi_id, ' +
                   '    fnc_id2str(env.payl_taraf_ids, ''def_data_taraf''::character varying, ''taraf''::character varying)::character varying (5000) AS payl_taraf_str ' +
                   '    FROM data_envanter env, sys_deptdef dp ' +
                   '    WHERE env.dept_id = dp.id ' +
                   '  ) dep ON dep.kaynak_id=vk.kaynak_id and dep.kisi_id = kisi.id' +
                   '  WHERE vk.durum = ''ALINDI'' AND ' + //ar.durum = ''AKTÝF'' AND ' +
                   '    vk.bitis_tarihi < ''' + Trh2 + ''' AND vk.mc_id = ' + IntToStr(MainMod.MCID) + fltr +
                   '  ORDER BY ar.id');

  qPaylas.First;
  refno := 0;
  onemStr := '';
  deptstr := '';
  while not qPaylas.EOF do
  begin

    if refno <> qPaylas.FieldByName('ref_no').AsInteger then
    begin
      refno := qPaylas.FieldByName('ref_no').AsInteger;
      deptstr := qPaylas.FieldByName('dept_title').AsString + ';';
      tblRapor.Append;
      tblRapor.FieldByName('ref_no'      ).AsInteger  := qPaylas.FieldByName('ref_no'      ).AsInteger;
      tblRapor.FieldByName('aydinlatma'  ).AsString   := qPaylas.FieldByName('aydinlatma'  ).AsString;
      tblRapor.FieldByName('kisi'        ).AsString   := qPaylas.FieldByName('kisi'        ).AsString;
      tblRapor.FieldByName('ar_durum'    ).AsString   := qPaylas.FieldByName('ar_durum'    ).AsString;
      tblRapor.FieldByName('ad_soyad'    ).AsString   := qPaylas.FieldByName('ad_soyad'    ).AsString;
      tblRapor.FieldByName('gsmno'       ).AsString   := qPaylas.FieldByName('gsmno'       ).AsString;
      tblRapor.FieldByName('tarih'       ).AsDateTime := qPaylas.FieldByName('tarih'       ).AsDateTime;
      if qPaylas.FieldByName('ar_durum').AsString <> 'AKTÝF' then
        tblRapor.FieldByName('bit_tarih'   ).AsDateTime := qPaylas.FieldByName('bit_tarih'   ).AsDateTime;
      tblRapor.FieldByName('kaynak_str'  ).AsString   := qPaylas.FieldByName('kaynak_str'  ).AsString;
      tblRapor.FieldByName('sakl_tip'    ).AsString   := qPaylas.FieldByName('sakl_tip'    ).AsString;
      tblRapor.FieldByName('sakl_str'    ).AsString   := qPaylas.FieldByName('sakl_str'    ).AsString;
      tblRapor.FieldByName('bitis_tarihi').AsDateTime := qPaylas.FieldByName('bitis_tarihi').AsDateTime;
      tblRapor.FieldByName('onem'        ).AsString   := onemstr;
      tblRapor.FieldByName('deptstr'     ).AsString   := copy(deptstr, 1, length(deptstr)-1);
      tblRapor.FieldByName('payl_taraf_str').AsString   := qPaylas.FieldByName('payl_taraf_str').AsString;
      tblRapor.Post;
    end
    else
    begin
      if pos(qPaylas.FieldByName('dept_title').AsString+';', deptstr) <= 0 then
      begin
        deptstr := deptstr + qPaylas.FieldByName('dept_title').AsString+';';
        tblRapor.Edit;
        tblRapor.FieldByName('deptstr').AsString   := copy(deptstr, 1, length(deptstr)-1);
        tblRapor.Post;
      end;
    end;

    if (eddept.Text <> '') and (tblRapor.FieldByName('ref_no').AsInteger > 0) then
    begin
      if pos(eddept.Text, tblRapor.FieldByName('deptstr').AsString) <= 0 then
        tblRapor.Delete;
    end;

    qPaylas.Next;
  end;
end;

procedure TfrRptVeriPaylasimRaporu.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
begin
  if SameText(Column.FieldName, 'ref_no') then begin end;
end;

procedure TfrRptVeriPaylasimRaporu.UniFrameCreate(Sender: TObject);
begin
//  tblAmac.Open;
//  PrepareReport;

  QueryOpen(qTmp, ' SELECT dp.id, ' +
                  ' (case when coalesce(dp.main_dept_id,0) > 0 then dp.title||'' (''||dp_main.title||'') '' ' +
                  ' else dp.title end) title ' +
                  ' FROM sys_deptdef dp left join sys_deptdef dp_main on dp_main.id = dp.main_dept_id ' +
                  ' WHERE  ' +
                  '  dp.mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY dp.title');

//  QueryOpen(qTmp, 'SELECT id, title FROM sys_deptdef WHERE mc_id = ' + IntToStr(MainMod.MCID) + 'ORDER BY id');
    //active=''E''
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
  RegisterClass(TfrRptVeriPaylasimRaporu);

end.
