unit unVSDepartmanListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, Data.DB, DBAccess, Uni, System.Actions, Vcl.ActnList, uniBasicGrid, uniDBGrid,
  uniEdit, uniButton, uniBitBtn, uniLabel, uniMultiItem, uniComboBox, uniGUIBaseClasses, uniPanel, MemDS,
  uniDateTimePicker;

type
  TfrVSDepartmanListe = class(TUniFrame)
    ActList: TActionList;
    actEdit: TAction;
    actCopy: TAction;
    actSearch: TAction;
    actClose: TAction;
    dsVSDept: TUniDataSource;
    pnlTop: TUniPanel;
    edSrcType: TUniComboBox;
    edSrcDurum: TUniComboBox;
    UniLabel1: TUniLabel;
    btnSearch: TUniBitBtn;
    btnEdit: TUniBitBtn;
    UniLabel2: TUniLabel;
    edSrcBvSekil: TUniComboBox;
    edSrcOnay: TUniComboBox;
    edSrcText: TUniEdit;
    UniDBGrid1: TUniDBGrid;
    qVSDept: TUniQuery;
    qVSDeptadisoyadi: TStringField;
    edSrcDate: TUniDateTimePicker;
    qVSDeptson_tarih: TDateField;
    qVSDeptkalan_sure: TIntegerField;
    qVSDeptid: TIntegerField;
    qVSDeptvsb_id: TIntegerField;
    qVSDeptmc_id: TIntegerField;
    qVSDeptdept_id: TIntegerField;
    qVSDeptonay: TStringField;
    qVSDeptidy: TIntegerField;
    qVSDeptidt: TDateTimeField;
    qVSDeptsdy: TIntegerField;
    qVSDeptsdt: TDateTimeField;
    qVSDeptaciklama: TStringField;
    qVSDeptid_1: TIntegerField;
    qVSDeptmc_id_1: TIntegerField;
    qVSDeptdurum: TStringField;
    qVSDeptidy_1: TIntegerField;
    qVSDeptidt_1: TDateTimeField;
    qVSDeptsdy_1: TIntegerField;
    qVSDeptsdt_1: TDateTimeField;
    qVSDeptkg_id: TIntegerField;
    qVSDeptadi: TStringField;
    qVSDeptsoyadi: TStringField;
    qVSDeptkimlik_no: TStringField;
    qVSDepttel1: TStringField;
    qVSDepttel2: TStringField;
    qVSDeptadres1: TStringField;
    qVSDeptadres2: TStringField;
    qVSDeptilce: TStringField;
    qVSDeptsehir: TStringField;
    qVSDeptemail: TStringField;
    qVSDeptkep: TStringField;
    qVSDeptbasvuru_tarihi: TDateField;
    qVSDeptbasvuru_sekli: TStringField;
    qVSDeptbasvuru_evrakno: TStringField;
    qVSDeptbasvuru_aciklama: TStringField;
    qVSDeptcevap_tarihi: TDateField;
    qVSDeptcevap_sekli: TStringField;
    qVSDeptcevap_aciklama: TStringField;
    qVSDeptcevap_evrakno: TStringField;
    qVSDeptkg_detay: TStringField;
    qVSDeptbasvuru_konu: TStringField;
    qVSDeptbasvuru_dept_id: TIntegerField;
    qVSDeptcevap_sekli_talep: TStringField;
    qVSDeptdept_name: TStringField;
    qVSDeptvsgrup: TStringField;
    btnClose: TUniBitBtn;
    btnHelp: TUniBitBtn;
    lbKayitSayisi: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure qVSDeptCalcFields(DataSet: TDataSet);
    procedure edSrcTypeChange(Sender: TObject);
    procedure edSrcDurumChange(Sender: TObject);
    procedure edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure actEditExecute(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure btnHelpClick(Sender: TObject);
    procedure edSrcDateChange(Sender: TObject);
  private
    procedure NewSQL;
    procedure ManageSettings;
  public
  end;

implementation

{$R *.dfm}

uses MainModule, McMLib, Main, unVSDepartmanKayit, unHelpPage;

procedure TfrVSDepartmanListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrVSDepartmanListe.actEditExecute(Sender: TObject);
begin
  if qVSDept.FieldByName('durum').AsString = 'CEVAPLANDI' then
  begin
    MessageDlg('Bu baþvuru cevaplanmýþ. Deðiþiklik yapýlamaz.', mtError, [mbOk]);
    Exit;
  end;
  if qVSDept.FieldByName('durum').AsString = 'ÝNCELENÝYOR' then
  begin
    MessageDlg('Bu baþvuru deðerlendirmeye alýnmýþ. Deðiþiklik yapýlamaz.', mtError, [mbOk]);
    Exit;
  end;
  if qVSDept.FieldByName('onay').AsString = 'ONAYLANDI' then
  begin
    if not MainMod.LoginInfo.Yetkiler[114] then
    begin
      MessageDlg('Deðiþtirmek istediðiniz bilgiler ONAYLANMIÞ. Bu kaydý deðiþtirme yetkiniz yok.', mtError, [mbOk]);
      Exit;
    end;
  end;

  if frmVSDepartmanKayit.Edit(qVSDept.FieldByName('id').AsInteger) = mrOk then RefreshQuery(qVSDept);
  ManageSettings;
end;

procedure TfrVSDepartmanListe.actSearchExecute(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrVSDepartmanListe.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('VSDepartmanListe');
end;

procedure TfrVSDepartmanListe.edSrcDateChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrVSDepartmanListe.edSrcDurumChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrVSDepartmanListe.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrVSDepartmanListe.edSrcTypeChange(Sender: TObject);
begin  //[0, 1,  4, 5, 6, 9];
  edSrcText.Visible    := edSrcType.ItemIndex in [0, 1, 2, 5, 6, 7, 10];
  edSrcOnay.Visible    := edSrcType.ItemIndex = 3;
  edSrcDurum.Visible   := edSrcType.ItemIndex = 4;
  edSrcBvSekil.Visible := edSrcType.ItemIndex = 9;
  edSrcDate.Visible    := edSrcType.ItemIndex = 8;

  NewSQL;
end;

procedure TfrVSDepartmanListe.ManageSettings;
begin
  actEdit.Enabled   := MainMod.LoginInfo.Yetkiler[113] and (qVSDept.State = dsBrowse) and (qVSDept.FieldByName('id').AsInteger > 0);

  actClose.Enabled  := not DataEditing(qVSDept);
end;

procedure TfrVSDepartmanListe.NewSQL;
var
	SQLStr,
  SrcText :string;
 //	WhereStr : string;
begin
  if not GuvenliGirisMi(edSrcText.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;

  SQLStr := 'SELECT aa.*, bb.*, cc.title as dept_name,cc_main.title as main_dept_name, dd.kisi as vsgrup ' +
            'FROM data_vsbasvuru_dept aa ' +
            '  LEFT JOIN data_vsbasvuru bb ON bb.id = aa.vsb_id ' +
            '  LEFT JOIN sys_deptdef cc ON cc.id = aa.dept_id ' +
            '  LEFT JOIN sys_deptdef cc_main on cc_main.id = cc.main_dept_id ' +
            '  LEFT JOIN def_data_kisi dd ON dd.id = bb.kg_id where aa.mc_id =:mc_id';

  if MainMod.LoginInfo.Birimler = '' then SQLStr  := SQLStr + ' and aa.dept_id IN (0)  '
   else SQLStr  := SQLStr + ' and aa.dept_id IN (' + MainMod.LoginInfo.Birimler + ')  ';

  //SrcText := StringReplace(edSrcText.Text, '*', '%', [rfReplaceAll]);
    if edSrcText.Text <> '' then
  begin
    if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
  end;
  case edSrcType.ItemIndex of
    0 : if edSrcText.Text <> '' then SQLStr := SQLStr + ' and bb.id::varchar like :SrcText ';
    1 : if edSrcText.Text <> '' then SQLStr := SQLStr + ' and cc.title LIKE :SrcText  ';
    2 : if edSrcText.Text <> '' then SQLStr := SQLStr + ' and cc_main.title LIKE :SrcText  ';
    3 : if edSrcOnay.ItemIndex > 0 then SQLStr := SQLStr + ' and aa.onay =:onay  ';
    4 : if edSrcDurum.ItemIndex > 0 then SQLStr := SQLStr + ' and bb.durum =:durum  ';
    5 : if edSrcText.Text <> '' then SQLStr := SQLStr + ' and (bb.adi LIKE :SrcText  OR bb.soyadi LIKE :SrcText )  ';
    6 : if edSrcText.Text <> '' then SQLStr := SQLStr + ' and bb.tel1 LIKE :SrcText ';
    7 : if edSrcText.Text <> '' then SQLStr := SQLStr + 'and lower(bb.email) LIKE :email  ';
    8 : SQLStr := SQLStr + ' and bb.basvuru_tarihi =:basvuru_tarihi  ';
    9 : if edSrcBvSekil.ItemIndex > 0 then SQLStr := SQLStr + ' and bb.basvuru_sekli =:basvuru_sekli  ';
    10 : if edSrcText.Text <> '' then SQLStr := SQLStr + ' and bb.basvuru_evrakno LIKE :SrcText  ';
  end;

//	if Trim(WhereStr) <> '' then System.Delete(WhereStr, Length(WhereStr) - 3, 4);
//	if Trim(WhereStr) <> '' then SQLStr := SQLStr + 'WHERE ' + WhereStr;
	SQLStr := SQLStr + ' ORDER BY bb.basvuru_tarihi, aa.vsb_id, aa.id';

  qVSDept.SQL.Text := SQLStr ;

  qVSDept.ParamByName('mc_id').AsString := inttostr(mainmod.MCID);
  if qVSDept.FindParam('SrcText') <>  nil then
    qVSDept.ParamByName('SrcText').AsString := SrcText;
  if qVSDept.FindParam('onay') <>  nil then
    qVSDept.ParamByName('onay').AsString := edSrcOnay.Text;
  if qVSDept.FindParam('durum') <>  nil then
    qVSDept.ParamByName('durum').AsString := edSrcDurum.Text ;
  if qVSDept.FindParam('email') <>  nil then
    qVSDept.ParamByName('email').AsString := TR_Lower(SrcText) ;
  if qVSDept.FindParam('basvuru_tarihi') <>  nil then
    qVSDept.ParamByName('basvuru_tarihi').AsString :=  FormatDateTime('dd.mm.yyyy', edSrcDate.DateTime) ;
  if qVSDept.FindParam('basvuru_sekli') <>  nil then
    qVSDept.ParamByName('basvuru_sekli').AsString :=  edSrcBvSekil.Text ;

   qVSDept.Open;
  ManageSettings;
  lbKayitSayisi.Text := IntToStr(qVSDept.RecordCount) + ' Kayýt Listelendi...';
end;

procedure TfrVSDepartmanListe.qVSDeptCalcFields(DataSet: TDataSet);
begin
  qVSDept.FieldByName('adisoyadi').AsString := qVSDept.FieldByName('adi').AsString + ' ' + qVSDept.FieldByName('soyadi').AsString;
  qVSDept.FieldByName('son_tarih').AsDateTime := Trunc(qVSDept.FieldByName('basvuru_tarihi').AsDateTime) + 30;
  qVSDept.FieldByName('kalan_sure').AsInteger := Trunc(qVSDept.FieldByName('son_tarih').AsDateTime - Date);
end;

procedure TfrVSDepartmanListe.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;

  if Direction then Dir := 'ASC' else Dir := 'DESC';
  qVSDept.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrVSDepartmanListe.UniFrameCreate(Sender: TObject);
begin
  edSrcBvSekil.Top   := 48;
  edSrcOnay.Top      := 48;
  edSrcText.Top      := 48;
  edSrcDate.Top      := 48;
  UniLabel2.Top      := 51;
  pnlTop.Height      := 145;
  edSrcDate.DateTime := Date;
  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;
end;

initialization
  RegisterClass(TfrVSDepartmanListe);

end.
