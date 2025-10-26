unit unCheckListListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIFrame, uniBasicGrid, uniDBGrid, uniButton,
  uniBitBtn, uniLabel, uniEdit, uniMultiItem, uniComboBox, uniGUIBaseClasses, uniPanel, uniDateTimePicker,
  Data.DB, DBAccess, Uni, System.Actions, Vcl.ActnList, VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  FlexCel.Render, MemDS, uniMenuButton, Vcl.Menus, uniMainMenu, uniCheckBox,strutils;

type
  TfrCheckListListe = class(TUniFrame)
    ActList: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actCopy: TAction;
    actSearch: TAction;
    actClose: TAction;
    dsCheckList: TUniDataSource;
    v: TUniPanel;
    edSrcType: TUniComboBox;
    edSrcText: TUniEdit;
    edSrcActive: TUniComboBox;
    UniLabel1: TUniLabel;
    btnSearch: TUniBitBtn;
    btnClose: TUniBitBtn;
    btnAdd: TUniBitBtn;
    btnEdit: TUniBitBtn;
    btnDelete: TUniBitBtn;
    UniLabel2: TUniLabel;
    grdCheckList: TUniDBGrid;
    edSrcDate: TUniDateTimePicker;
    btnExcel: TUniBitBtn;
    actExcel: TAction;
    UniBitBtn1: TUniBitBtn;
    edSrcKilitli: TUniComboBox;
    qCheckList: TUniQuery;
    qTmp: TUniQuery;
    btnLock: TUniMenuButton;
    ppmLock: TUniPopupMenu;
    ppmiLock: TUniMenuItem;
    N1: TUniMenuItem;
    ppmiUnlock: TUniMenuItem;
    chbDepYetki: TUniCheckBox;
    UniBitBtn2: TUniBitBtn;
    chbBosDayanak: TUniCheckBox;
    chbbosTedbir: TUniCheckBox;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    pnlpagingBarcrt: TUniPanel;
    lbKayitSayisi: TUniLabel;
    UniPanel37: TUniPanel;
    UniLabel6: TUniLabel;
    UniPanel1: TUniPanel;
    UniLabel7: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure edSrcTypeChange(Sender: TObject);
    procedure edSrcActiveChange(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actCopyExecute(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure edSrcDateAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure actExcelExecute(Sender: TObject);
    procedure grdCheckListColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure grdCheckListDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure ppmiLockClick(Sender: TObject);
    procedure ppmiUnlockClick(Sender: TObject);
    procedure UniBitBtn2Click(Sender: TObject);
  private
    procedure NewSQL;
    procedure ManageSettings;
    procedure CopyRecordControl(Sender: TComponent; Res: Integer);
  public
  end;

implementation

{$R *.dfm}

uses MainModule, ServerModule, McMLib, Main, unCheckListTanim, unHelpPage;


procedure TfrCheckListListe.actAddExecute(Sender: TObject);
begin
  if frmCheckListTanim.Exec(0, 0) = mrOk then RefreshQuery(qCheckList);
  ManageSettings;
end;

procedure TfrCheckListListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrCheckListListe.actCopyExecute(Sender: TObject);
begin
  if grdCheckList.SelectedRows.Count>1 then
  begin
    MessageDlg('Kopya oluþturmak için birden fazla kayýt seçemezsiniz!',mtConfirmation,[mbYes]);
    exit;
  end;
  MessageDlg('Seçili kontrol kaydýnýn kopyasýný oluþturmak istediðinizden emin misiniz?', mtConfirmation, mbYesNo, CopyRecordControl);
end;

procedure TfrCheckListListe.actEditExecute(Sender: TObject);
var
  AKontIds : string;
  I : integer;
begin
  if qCheckList.FieldByName('active').AsString <> 'E' then
  begin
    if not MainMod.LoginInfo.Yetkiler[96] then
    begin
      MessageDlg('Deðiþtirmek istediðiniz kayýt PASÝF yapýlmýþ. Bu kaydý deðiþtirme yetkiniz yok.', mtError, [mbOk]);
      Exit;
    end;
  end;
  if grdCheckList.SelectedRows.Count > 1 then
  begin
    for I := 0 to grdCheckList.SelectedRows.count-1 do
        begin
          qCheckList.GotoBookmark(grdCheckList.SelectedRows[i]);
          if ( AKontIds <> '') then
            AKontIds := AKontIds+',';
          AKontIds := AKontIds + qCheckList.FieldByName('id').AsString;
        end;
    if frmCheckListTanim.Exec(AKontIds) = mrOk then RefreshQuery(qCheckList);
  end
  else
    if frmCheckListTanim.Exec(qCheckList.FieldByName('id').AsInteger, 1) = mrOk then RefreshQuery(qCheckList);

  ManageSettings;
end;

procedure TfrCheckListListe.actExcelExecute(Sender: TObject);
var
  Report   : TFlexCelReport;
  FName    : String;
  TmpName  : String;
  FUrl     : String;
	SQLStr   ,
  SrcText  ,
	WhereStr : String;
begin
  if not MainMod.LoginInfo.Yetkiler[129] then
  begin
    MessageDlg('Doküman indirme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if qCheckList.FieldByName('id').AsInteger < 1 then Exit;

  sqlstr := 'SELECT chl.*,  us1.full_name AS olusturan, us2.full_name AS degistiren, ' +
            'kyn.kaynak AS kaynak_str, ks.kisi AS kisi_str, ' +
            'knt.kontrolsonuc AS kontrol_str, onm.onemderece AS onem_derecesi_str, ' +
            'fnc_id2str(chl.tedbir_ids, ''def_data_tedbir''::character varying, ''tedbir''::character varying)::character varying (5000) AS tedbir_str, ' +
            'fnc_id2str(chl.dayanak_ids, ''def_data_dayanak''::character varying, ''dayanak''::character varying)::character varying (5000) AS dayanak_str, ' +
            'fnc_id2str(chl.dokuman_ids, ''def_data_dokuman''::character varying, ''dokuman''::character varying)::character varying (5000) AS dokuman_str, ' +
            'fnc_id2str(chl.ekipman_ids, ''def_data_ekipman''::character varying, ''ekipman''::character varying)::character varying (5000) AS ekipman_str, ' +
            'fnc_id2str(chl.sorumlu_ids, ''sys_deptdef''::character varying, ''title''::character varying)::character varying (5000) AS sorumlu_str,' +
            'fnc_id2str(chl.onem_derecesi_id::character varying (50), ''def_data_onemderece''::character varying, ''onemderece''::character varying)::character varying (50) AS onem_derecesi_str ' +
            'FROM data_checklist chl ' +
            'LEFT JOIN usr_user us1 ON us1.id = chl.idy ' +
            'LEFT JOIN usr_user us2 ON us2.id = chl.sdy ' +
            'LEFT JOIN def_data_kaynak kyn ON kyn.id = chl.kaynak_id ' +
            'LEFT JOIN def_data_kisi ks ON ks.id = chl.kisi_id  ' +
            'LEFT JOIN def_data_kontrolsonuc knt ON knt.id = chl.kontrol_id ' +
            'LEFT JOIN def_data_onemderece onm ON onm.id = chl.onem_derecesi_id ';

            WhereStr 	:= 'chl.mc_id = ' + IntToStr(MainMod.MCID) + ' AND ';
            case edSrcActive.ItemIndex of
              0 : WhereStr := WhereStr + 'chl.active = ''E'' AND ';
              1 : WhereStr := WhereStr + 'chl.active = ''H'' AND ';
            end;

            case edSrcKilitli.ItemIndex of
              0 : WhereStr := WhereStr + 'chl.kilitli = ''E'' AND ';
              1 : WhereStr := WhereStr + 'chl.kilitli = ''H'' AND ';
            end;

            if edSrcType.ItemIndex = 4 then
            begin
              WhereStr := WhereStr + 'chl.tarih = ''' + FormatDateTime('dd.mm.yyyy', edSrcDate.DateTime) + ''' AND ';
            end
            else
            begin
              if edSrcText.Text <> '' then
              begin
                SrcText := StringReplace(edSrcText.Text, '*', '%', [rfReplaceAll]);
                case edSrcType.ItemIndex of
                   0 : WhereStr := WhereStr + 'chl.id::varchar LIKE ''%' + SrcText  + '%'' AND ';
                   1 : WhereStr := WhereStr + 'knt.kontrolsonuc LIKE ''%' + SrcText  + '%'' AND ';
                   2 : WhereStr := WhereStr + 'kyn.kaynak LIKE ''%' + SrcText + '%'' AND ';
                   3 : WhereStr := WhereStr + 'ks.kisi LIKE ''%' + SrcText + '%'' AND ';
                   5 : WhereStr := WhereStr + 'us1.full_name LIKE ''%' + SrcText + '%'' AND ';
                   6 : WhereStr := WhereStr + 'us2.full_name LIKE ''%' + SrcText + '%'' AND ';
                end;
              end;
            end;

            if Trim(WhereStr) <> '' then System.Delete(WhereStr, Length(WhereStr) - 3, 4);
            if Trim(WhereStr) <> '' then SQLStr := SQLStr + 'WHERE ' + WhereStr;
            SQLStr := SQLStr + ' ORDER BY kyn.kaynak, ks.kisi';

//            'WHERE chl.mc_id = ' + IntToStr(MainMod.MCID) + ' AND chl.active = ''E'' ' +
//            'ORDER BY kyn.kaynak, ks.kisi';
  QueryOpen(qtmp, SQLStr);

  Report := TFlexCelReport.Create(True);
  try
    Report.AddTable('chlist', qtmp);
    FUrl    := '';
    FName   := 'Kontrol_Listesi';
    TmpName := ServerMod.NewCacheFileUrl(False, 'xlsx', FName, '', FUrl, True);
    Report.Run(ServerMod.FilesFolderPath + 'temp_xls\checklist.template.xlsx', TmpName);
  finally
    Report.Free;
    qTmp.Close;
  end;

  UniSession.SendFile(TmpName, FName + '.xlsx');
end;

procedure TfrCheckListListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrCheckListListe.CopyRecordControl(Sender: TComponent; Res: Integer);
var
  i : Integer;
  NewId : Integer;
begin
  if Res <> mrYes then Exit;

  QueryOpen(MainMod.qCFrom, 'SELECT * FROM data_checklist WHERE id = ' + qCheckList.FieldByName('id').AsString);
  QueryOpen(MainMod.qCTo,   'SELECT * FROM data_checklist WHERE id = 0');

  MainMod.qCTo.Insert;
  for i := 0 to MainMod.qCFrom.FieldCount - 1 do
  begin
    MainMod.qCTo.Fields[i].Value := MainMod.qCFrom.Fields[i].Value;
  end;

  NewId := MainMod.GetSeq('sq_data_checklist_id');
  MainMod.qCTo.FieldByName('id').AsInteger        := NewId;
  MainMod.qCTo.FieldByName('active').AsString     := 'E';
  MainMod.qCTo.FieldByName('mc_id').AsInteger     := MainMod.MCID;
  MainMod.qCTo.FieldByName('tarih').AsDateTime    := Date;
  MainMod.qCTo.FieldByName('idy').AsInteger       := MainMod.LoginInfo.ID;
  MainMod.qCTo.FieldByName('idt').AsDateTime      := Now;
  MainMod.qCTo.FieldByName('sdy').AsInteger       := MainMod.LoginInfo.ID;
  MainMod.qCTo.FieldByName('sdt').AsDateTime      := Now;
  MainMod.qCTo.FieldByName('kaynak_id').AsInteger := 0;
  MainMod.qCTo.Post;
  RefreshQuery(qCheckList);
  ManageSettings;
  MessageDlg('Kaydýnýzýn kopyasý "' + IntToStr(NewId) + '" referans numarasý ile oluþturuldu. Lütfen ' +
             'oluþturulan kayýt için "Veri Kaynaðý"ný belirtmeyi unutmayýnýz.', mtInformation, [mbOk]);
end;

procedure TfrCheckListListe.edSrcActiveChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrCheckListListe.edSrcDateAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrCheckListListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrCheckListListe.edSrcTypeChange(Sender: TObject);
begin
  edSrcText.Visible := edSrcType.ItemIndex <> 4;
  edSrcDate.Visible := edSrcType.ItemIndex = 4;

  NewSQL;
end;

procedure TfrCheckListListe.ManageSettings;
begin
  actAdd.Enabled    := MainMod.LoginInfo.Yetkiler[94] and (qCheckList.State = dsBrowse);
  actEdit.Enabled   := MainMod.LoginInfo.Yetkiler[95] and (qCheckList.State = dsBrowse) and (qCheckList.FieldByName('id').AsInteger > 0);
  actCopy.Enabled   := MainMod.LoginInfo.Yetkiler[94] and (qCheckList.State = dsBrowse) and (qCheckList.FieldByName('id').AsInteger > 0);

  actClose.Enabled  := not DataEditing(qCheckList);
end;

procedure TfrCheckListListe.NewSQL;
var
	SQLStr     ,
  SrcText    ,
	WhereStr   : String;
begin
//         fnc_id2str(chl.tedbir_ids, 'def_data_tedbir'::character varying, 'tedbir'::character varying)::character varying (5000) AS tedbir_str,
//         fnc_id2str(chl.dayanak_ids, 'def_data_dayanak'::character varying, 'dayanak'::character varying)::character varying (5000) AS dayanak_str,
//         fnc_id2str(chl.dokuman_ids, 'def_data_dokuman'::character varying, 'dokuman'::character varying)::character varying (5000) AS dokuman_str,
//         fnc_id2str(chl.ekipman_ids, 'def_data_ekipman'::character varying, 'ekipman'::character varying)::character varying (5000) AS ekipman_str,
//         fnc_id2str(chl.sorumlu_ids, 'sys_deptdef'::character varying, 'title'::character varying)::character varying (5000) AS sorumlu_str,

//  SQLStr := 'SELECT chl.*,' +
//            '  us1.full_name AS olusturan, us2.full_name AS degistiren,' +
//            '  kyn.kaynak AS kaynak_str, ks.kisi AS kisi_str,' +
//            '  knt.kontrolsonuc AS kontrol_str, onm.onemderece AS onem_derecesi_str, ' +
//            '  coalesce(tenv.toplam_envanter,0) toplam_envanter '+
//            ' FROM data_checklist chl' +
//            '  LEFT JOIN usr_user us1 ON us1.id = chl.idy' +
//            '  LEFT JOIN usr_user us2 ON us2.id = chl.sdy' +
//            '  LEFT JOIN def_data_kaynak kyn ON kyn.id = chl.kaynak_id' +
//            '  LEFT JOIN def_data_kisi ks ON ks.id = chl.kisi_id' +
//            '  LEFT JOIN def_data_kontrolsonuc knt ON knt.id = chl.kontrol_id' +
//            '  LEFT JOIN def_data_onemderece onm ON onm.id = chl.onem_derecesi_id ' +
//            ' left join ( select env.mc_id ,env.kaynak_id,env.kisi_id ,  count(*) toplam_envanter from data_envanter env '+
//            ' where env.active=''E'' group by env.mc_id ,env.kaynak_id,env.kisi_id   ) tenv on tenv.kaynak_id=chl.kaynak_id and tenv.kisi_id=chl.kisi_id ' +
//           IfThen( not chbDepYetki.Checked , ' join (select distinct kisi_id from data_envanter en where active =''E'' and dept_id in ('+
//            mainmod.LoginInfo.Birimler + ')) env on env.kisi_id = chl.kisi_id ' ) +
//           IfThen( not chbDepYetki.Checked ,' join (select ens.kaynak_id from ( select 0 kaynak_id union select distinct kaynak_id from data_envanter en where active =''E'' and dept_id in ('+
//            MainMod.LoginInfo.Birimler +'))ens ) envk on envk.kaynak_id = chl.kaynak_id ' );
//
//	WhereStr 	:= 'chl.mc_id = ' + IntToStr(MainMod.MCID) + ' AND ';
//	case edSrcActive.ItemIndex of
//		0 : WhereStr := WhereStr + 'chl.active = ''E'' AND ';
//		1 : WhereStr := WhereStr + 'chl.active = ''H'' AND ';
//	end;
//  if chbBosDayanak.Checked then
//    wherestr := WhereStr + 'coalesce(chl.dayanak_ids,'''')='''' and ' ;
//  if chbbosTedbir.Checked  then
//    wherestr := WhereStr + ' coalesce(chl.tedbir_ids,'''')='''' and ' ;
//
//	case edSrcKilitli.ItemIndex of
//		0 : WhereStr := WhereStr + 'coalesce(chl.kilitli,''H'') = ''E'' AND ';
//		1 : WhereStr := WhereStr + 'coalesce(chl.kilitli,''H'') = ''H'' AND ';
//	end;
//
//  if edSrcType.ItemIndex = 4 then
//  begin
//    WhereStr := WhereStr + 'chl.tarih = ''' + FormatDateTime('dd.mm.yyyy', edSrcDate.DateTime) + ''' AND ';
//  end
//  else
//  begin
//    if edSrcText.Text <> '' then
//    begin
//      SrcText := StringReplace(edSrcText.Text, '*', '%', [rfReplaceAll]);
//      case edSrcType.ItemIndex of
//         0 : WhereStr := WhereStr + 'chl.id::varchar LIKE ''%' + SrcText  + '%'' AND ';
//         1 : WhereStr := WhereStr + 'knt.kontrolsonuc LIKE ''%' + SrcText  + '%'' AND ';
//         2 : WhereStr := WhereStr + 'kyn.kaynak LIKE ''%' + SrcText + '%'' AND ';
//         3 : WhereStr := WhereStr + 'ks.kisi LIKE ''%' + SrcText + '%'' AND ';
//         5 : WhereStr := WhereStr + 'us1.full_name LIKE ''%' + SrcText + '%'' AND ';
//         6 : WhereStr := WhereStr + 'us2.full_name LIKE ''%' + SrcText + '%'' AND ';
//      end;
//    end;
//  end;
//
//	if Trim(WhereStr) <> '' then System.Delete(WhereStr, Length(WhereStr) - 3, 4);
//	if Trim(WhereStr) <> '' then SQLStr := SQLStr + 'WHERE ' + WhereStr;
//	// SQLStr := SQLStr + ' ORDER BY tarih DESC, id DESC';
//	SQLStr := SQLStr + ' ORDER BY kyn.kaynak, ks.kisi';
//
//	QueryOpen(qCheckList, SQLStr);
//  ManageSettings;
//  lbKayitSayisi.Text := IntToStr(qCheckList.RecordCount) + ' Kayýt Listelendi...';

  if not GuvenliGirisMi(edSrcText.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;

  SQLStr := 'SELECT chl.*,' +
            '  us1.full_name AS olusturan, us2.full_name AS degistiren,' +
            '  kyn.kaynak AS kaynak_str, ks.kisi AS kisi_str,' +
            '  knt.kontrolsonuc AS kontrol_str, onm.onemderece AS onem_derecesi_str, ' +
            '  coalesce(tenv.toplam_envanter,0) toplam_envanter ' +
            ' FROM data_checklist chl' +
            '  LEFT JOIN usr_user us1 ON us1.id = chl.idy' +
            '  LEFT JOIN usr_user us2 ON us2.id = chl.sdy' +
            '  LEFT JOIN def_data_kaynak kyn ON kyn.id = chl.kaynak_id' +
            '  LEFT JOIN def_data_kisi ks ON ks.id = chl.kisi_id' +
            '  LEFT JOIN def_data_kontrolsonuc knt ON knt.id = chl.kontrol_id' +
            '  LEFT JOIN def_data_onemderece onm ON onm.id = chl.onem_derecesi_id ' +
            ' left join ( select env.mc_id ,env.kaynak_id,env.kisi_id ,  count(*) toplam_envanter from data_envanter env ' +
            ' where env.active=''E'' group by env.mc_id ,env.kaynak_id,env.kisi_id   ) tenv on tenv.kaynak_id=chl.kaynak_id and tenv.kisi_id=chl.kisi_id ' +
//            IfThen( not chbDepYetki.Checked , ' join (select distinct kisi_id from data_envanter en where active =''E'' and dept_id in (:Birimler)) env on env.kisi_id = chl.kisi_id ' ) +
//            IfThen( not chbDepYetki.Checked ,' join (select ens.kaynak_id from ( select 0 kaynak_id union select distinct kaynak_id from data_envanter en where active =''E'' and dept_id in (:Birimler))ens ) envk on envk.kaynak_id = chl.kaynak_id ' );

           IfThen( not chbDepYetki.Checked , ' join (select distinct kisi_id from data_envanter en where active =''E'' and dept_id in ('+
            mainmod.LoginInfo.Birimler + ')) env on env.kisi_id = chl.kisi_id ' ) ;
//           IfThen( not chbDepYetki.Checked ,' join (select ens.kaynak_id from ( select 0 kaynak_id union select distinct kaynak_id from data_envanter en where active =''E'' and dept_id in ('+
//            MainMod.LoginInfo.Birimler +'))ens ) envk on envk.kaynak_id = chl.kaynak_id ' );

  WhereStr := 'chl.mc_id = :MCID AND ';
  case edSrcActive.ItemIndex of
    0 : WhereStr := WhereStr + 'chl.active = ''E'' AND ';
    1 : WhereStr := WhereStr + 'chl.active = ''H'' AND ';
  end;
  if chbBosDayanak.Checked then
    WhereStr := WhereStr + 'coalesce(chl.dayanak_ids,'''')='''' and ' ;
  if chbbosTedbir.Checked then
    WhereStr := WhereStr + ' coalesce(chl.tedbir_ids,'''')='''' and ' ;
  case edSrcKilitli.ItemIndex of
    0 : WhereStr := WhereStr + 'coalesce(chl.kilitli,''H'') = ''E'' AND ';
    1 : WhereStr := WhereStr + 'coalesce(chl.kilitli,''H'') = ''H'' AND ';
  end;
  if edSrcType.ItemIndex = 4 then
  begin
    WhereStr := WhereStr + 'chl.tarih = :Tarih AND ';
    edSrcText.Text := '';
  end
  else
  begin
    if edSrcText.Text <> '' then
    begin
      SrcText := StringReplace(edSrcText.Text, '*', '%', [rfReplaceAll]);
      case edSrcType.ItemIndex of
         0 : WhereStr := WhereStr + 'chl.id::varchar LIKE :SrcText AND ';
         1 : WhereStr := WhereStr + 'knt.kontrolsonuc LIKE :SrcText AND ';
         2 : WhereStr := WhereStr + 'kyn.kaynak LIKE :SrcText AND ';
         3 : WhereStr := WhereStr + 'ks.kisi LIKE :SrcText AND ';
         5 : WhereStr := WhereStr + 'us1.full_name LIKE :SrcText AND ';
         6 : WhereStr := WhereStr + 'us2.full_name LIKE :SrcText AND ';
      end;
    end;
  end;
  if Trim(WhereStr) <> '' then System.Delete(WhereStr, Length(WhereStr) - 3, 4);
  if Trim(WhereStr) <> '' then SQLStr := SQLStr + 'WHERE ' + WhereStr;
  SQLStr := SQLStr + ' ORDER BY kyn.kaynak, ks.kisi';
  // Parametreleri ayarla
  qCheckList.SQL.Text := SQLStr;
  qCheckList.ParamByName('MCID').AsInteger := MainMod.MCID;
  if edSrcType.ItemIndex = 4 then
    qCheckList.ParamByName('Tarih').AsDate := edSrcDate.DateTime;
  if edSrcText.Text <> '' then
    qCheckList.ParamByName('SrcText').AsString := '%' + StringReplace(edSrcText.Text, '*', '%', [rfReplaceAll]) + '%';
  qCheckList.Open;
  ManageSettings;
  lbKayitSayisi.Text := IntToStr(qCheckList.RecordCount) + ' Kayýt Listelendi...';
end;

procedure TfrCheckListListe.ppmiLockClick(Sender: TObject);
var
  i: Integer;
begin
  if (grdCheckList.SelectedRows.Count > 0) and
    (qCheckList.FieldByName('kilitli').AsString = 'H') then
  begin
    for i := 0 to grdCheckList.SelectedRows.Count -1 do
    begin
      qCheckList.GotoBookmark(grdCheckList.SelectedRows[i]);
      qCheckList.Edit;
      qCheckList.FieldByName('sdy').AsInteger           := MainMod.LoginInfo.ID;
      qCheckList.FieldByName('sdt').AsDateTime          := Now;
      qCheckList.FieldByName('kilitli').AsString        := 'E';
      qCheckList.FieldByName('kilitli_sdy').AsInteger   := MainMod.LoginInfo.ID;
      qCheckList.FieldByName('kilitli_sdt').AsDateTime  := Now;
      qCheckList.Post;
    end;
  end;
  RefreshQuery(qCheckList);
end;

procedure TfrCheckListListe.ppmiUnlockClick(Sender: TObject);
var
  i: Integer;
begin
  if (grdCheckList.SelectedRows.Count > 0) and
    (qCheckList.FieldByName('kilitli').AsString = 'E') then
  begin
    for i := 0 to grdCheckList.SelectedRows.Count -1 do
    begin
      qCheckList.GotoBookmark(grdCheckList.SelectedRows[i]);
      qCheckList.Edit;
      qCheckList.FieldByName('sdy').AsInteger           := MainMod.LoginInfo.ID;
      qCheckList.FieldByName('sdt').AsDateTime          := Now;
      qCheckList.FieldByName('kilitli').AsString        := 'H';
      qCheckList.FieldByName('kilitli_sdy').AsInteger   := MainMod.LoginInfo.ID;
      qCheckList.FieldByName('kilitli_sdt').AsDateTime  := Now;
      qCheckList.Post;
    end;
  end;
  RefreshQuery(qCheckList);
end;

procedure TfrCheckListListe.UniBitBtn1Click(Sender: TObject);
begin
  frmHelpPage.Exec('CheckListListe');
end;

procedure TfrCheckListListe.UniBitBtn2Click(Sender: TObject);
begin

   if frmCheckListTanim.copy( qCheckList.FieldByName('id').AsString) = mrOk then
      RefreshQuery(qCheckList);
end;

procedure TfrCheckListListe.grdCheckListColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  qCheckList.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrCheckListListe.grdCheckListDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if grdCheckList.DataSource.DataSet.FieldByName('kilitli').AsString = 'E' then
  begin
    begin
      Attribs.Font.Style := [fsItalic];
      Attribs.Color := clInfoBk;
    end;
  end;
   if grdCheckList.DataSource.DataSet.FieldByName('toplam_envanter').AsInteger = 0 then
  begin
    begin
      Attribs.Color := $00E1E1FF;
    end;
  end;
end;

procedure TfrCheckListListe.UniFrameCreate(Sender: TObject);
begin
  edSrcDate.DateTime := Date;
  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;
end;

initialization
  RegisterClass(TfrCheckListListe);

end.
