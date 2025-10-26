unit unVeriTipiAnalizIslemleri;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPanel, uniLabel, uniEdit,
  uniDBEdit, uniMultiItem, uniComboBox, uniDBComboBox, uniGroupBox,
  uniRadioGroup, uniDBLookupComboBox, uniRadioButton, Data.DB, MemDS, DBAccess,
  Uni, uniBasicGrid, uniDBGrid, VirtualTable, uniButton, uniBitBtn, uniSplitter,
  uniSpeedButton, uniDBRadioGroup,strutils, VirtualQuery,uniPageControl;

type

  TfrmVeriTipiAnalizIslemleri = class(TUniFrame)
    pnl5taraf: TUniPanel;
    edDept: TUniDBLookupComboBox;
    edSurec: TUniDBLookupComboBox;
    edKisi: TUniDBLookupComboBox;
    UniLabel9: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel23: TUniLabel;
    rgfSaklama: TUniRadioGroup;
    rgfSaklamaBaslama: TUniRadioGroup;
    rgfGunAyYil: TUniRadioGroup;
    gbfSure: TUniGroupBox;
    edFSure: TUniDBNumberEdit;
    UniPanel3: TUniPanel;
    rgdGunAyYil: TUniRadioGroup;
    gbdsure: TUniGroupBox;
    eddsure: TUniDBNumberEdit;
    rgdsaklamaBaslama: TUniRadioGroup;
    rgdsaklama: TUniRadioGroup;
    qdept: TUniQuery;
    dsdept: TUniDataSource;
    qsurec: TUniQuery;
    dssurec: TUniDataSource;
    vqenvanter: TVirtualTable;
    dsvqenvanter: TUniDataSource;
    qKisi: TUniQuery;
    dsKisi: TUniDataSource;
    pnl1giris: TUniPanel;
    pnl1kaynak: TUniPanel;
    qKaynak: TUniQuery;
    dsKaynak: TUniDataSource;
    grdkaynak: TUniDBGrid;
    qKaynakid: TIntegerField;
    qKaynakkaynak: TStringField;
    qKaynakisSelected: TBooleanField;
    vqkaynak: TVirtualTable;
    UniHiddenPanel1: TUniHiddenPanel;
    fedkaynak: TUniEdit;
    qveritipi: TUniQuery;
    vqveritipi: TVirtualTable;
    dsveritipi: TUniDataSource;
    grdveritipi: TUniDBGrid;
    pnl2veritipi: TUniPanel;
    UniPanel6: TUniPanel;
    btnaddvertipi: TUniBitBtn;
    UniPanel7: TUniPanel;
    btnaddKaynak: TUniBitBtn;
    qamac: TUniQuery;
    vqamac: TVirtualTable;
    dsamac: TUniDataSource;
    pnlamac: TUniPanel;
    UniPanel9: TUniPanel;
    btaddamac: TUniBitBtn;
    grdamac: TUniDBGrid;
    qmetod: TUniQuery;
    vqmetod: TVirtualTable;
    dsmetod: TUniDataSource;
    pnlmetod: TUniPanel;
    UniPanel4: TUniPanel;
    btnaddmetod: TUniBitBtn;
    grdmetod: TUniDBGrid;
    qtaraf: TUniQuery;
    vqtaraf: TVirtualTable;
    dstaraf: TUniDataSource;
    pnltaraf: TUniPanel;
    UniPanel5: TUniPanel;
    btnaddtaraf: TUniBitBtn;
    grdtaraf: TUniDBGrid;
    fchkaynakselect: TUniComboBox;
    UniContainerPanel1: TUniContainerPanel;
    pnla: TUniPanel;
    pnl2kaynak: TUniPanel;
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    pnl3amac: TUniPanel;
    pnl4metod: TUniPanel;
    btnSurecEkle: TUniSpeedButton;
    btnKisiEkle: TUniSpeedButton;
    fchveritipiselect: TUniComboBox;
    fchamacToplamaselect: TUniComboBox;
    fedveritipi: TUniEdit;
    fedkategori: TUniEdit;
    fedamac: TUniEdit;
    fchamacSaklamaselect: TUniComboBox;
    fchamacPaylasmaselect: TUniComboBox;
    fchMetodPaylasmaSelect: TUniComboBox;
    fchMetodSaklamaSelect: TUniComboBox;
    fchMetodToplamaselect: TUniComboBox;
    fedMetod: TUniEdit;
    fedtaraf: TUniEdit;
    fchTarafSelect: TUniComboBox;
    rgtaraftipi: TUniRadioGroup;
    btnpos: TUniBitBtn;
    vquery: TVirtualQuery;
    dsquery: TUniDataSource;
    qEnvenAdd: TUniQuery;
    vqkaynaksource: TVirtualQuery;
    pnltedbir: TUniPanel;
    UniPanel8: TUniPanel;
    UniPanel11: TUniPanel;
    btnaddDayanak: TUniBitBtn;
    grddayanak: TUniDBGrid;
    UniPanel10: TUniPanel;
    UniPanel12: TUniPanel;
    btnaddtedbir: TUniBitBtn;
    grdtedbir: TUniDBGrid;
    qdayanak: TUniQuery;
    vqdayanak: TVirtualTable;
    dsdayanak: TUniDataSource;
    qtedbir: TUniQuery;
    vqtedbir: TVirtualTable;
    dstedbir: TUniDataSource;
    qTmp: TUniQuery;
    UniLabel1: TUniLabel;
    dsKontrol: TUniDataSource;
    qKontrol: TUniQuery;
    edKontrol: TUniDBLookupComboBox;
    UniLabel3: TUniLabel;
    UniDBLookupComboBox1: TUniDBLookupComboBox;
    UniPanel13: TUniPanel;
    UniPanel14: TUniPanel;
    vqtmp: TVirtualQuery;
    feddayanak: TUniEdit;
    fchdayanakselect: TUniComboBox;
    fedtedbir: TUniEdit;
    fchtedbirselect: TUniComboBox;
    pnlKaydet: TUniPanel;
    pnldayanak: TUniPanel;
    pnlkaydetbutton: TUniPanel;
    btncancel: TUniBitBtn;
    qchecklistadd: TUniQuery;
    lbVeriTipi: TUniLabel;
    procedure rgdsaklamaClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure grdkaynakCellClick(Column: TUniDBGridColumn);
    procedure grdkaynakColumnFilter(Sender: TUniDBGrid;
      const Column: TUniDBGridColumn; const Value: Variant);
    procedure vqkaynakBeforePost(DataSet: TDataSet);
    procedure vqkaynakAfterPost(DataSet: TDataSet);
    procedure grdveritipiColumnSort(Column: TUniDBGridColumn;
      Direction: Boolean);
    procedure vqveritipiBeforePost(DataSet: TDataSet);
    procedure grdkaynakColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure pnlaResize(Sender: TUniControl; OldWidth, OldHeight: Integer);
    procedure OnchangeDepSurKisi(Sender: TObject);
    procedure btnaddKaynakClick(Sender: TObject);
    procedure btnaddvertipiClick(Sender: TObject);
    procedure btnKisiEkleClick(Sender: TObject);
    procedure btnSurecEkleClick(Sender: TObject);
    procedure btaddamacClick(Sender: TObject);
    procedure btnaddmetodClick(Sender: TObject);
    procedure btnaddtarafClick(Sender: TObject);
    procedure grdveritipiColumnFilter(Sender: TUniDBGrid;
      const Column: TUniDBGridColumn; const Value: Variant);
    procedure grdamacColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure grdamacColumnFilter(Sender: TUniDBGrid;
      const Column: TUniDBGridColumn; const Value: Variant);
    procedure grdmetodColumnFilter(Sender: TUniDBGrid;
      const Column: TUniDBGridColumn; const Value: Variant);
    procedure grdmetodColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure grdtarafColumnSort(Column: TUniDBGridColumn;
      Direction: Boolean);
    procedure grdtarafColumnFilter(Sender: TUniDBGrid;
      const Column: TUniDBGridColumn; const Value: Variant);
    procedure rgdsaklamaBaslamaClick(Sender: TObject);
    procedure rgdGunAyYilClick(Sender: TObject);
    procedure pnl2kaynakResize(Sender: TUniControl; OldWidth,
      OldHeight: Integer);
    procedure rgfSaklamaBaslamaChangeValue(Sender: TObject);
    procedure rgfGunAyYilChangeValue(Sender: TObject);
    procedure vqamacBeforePost(DataSet: TDataSet);
    procedure vqamacAfterScroll(DataSet: TDataSet);
    procedure btnposClick(Sender: TObject);
    procedure vqmetodBeforePost(DataSet: TDataSet);
    procedure rgtaraftipiClick(Sender: TObject);
    procedure btnaddDayanakClick(Sender: TObject);
    procedure btnaddtedbirClick(Sender: TObject);
    procedure pnlaAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
    procedure rgfSaklamaClick(Sender: TObject);
    procedure grddayanakColumnFilter(Sender: TUniDBGrid;
      const Column: TUniDBGridColumn; const Value: Variant);
    procedure grddayanakColumnSort(Column: TUniDBGridColumn;
      Direction: Boolean);
    procedure grdtedbirColumnFilter(Sender: TUniDBGrid;
      const Column: TUniDBGridColumn; const Value: Variant);
    procedure grdtedbirColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure btncancelClick(Sender: TObject);
    procedure pnlkaydetbuttonResize(Sender: TUniControl; OldWidth,
      OldHeight: Integer);
    procedure dsKaynakDataChange(Sender: TObject; Field: TField);
  private
    FkaynakSelectoldvalue : string;
    FVeritipiSelectoldvalue : string;
    postKontrol : boolean;
    procedure NewSQL;
    procedure VtTabloDoldur(Avttablo : TVirtualTable; AReferanstablo :TDataSet;
              AEkFild : Array of string ; AEkfieldValue : array of String; Abosalt:boolean= false);
    procedure vttabloKayitSil(AVtTablo: TVirtualTable; Afields: array of string; AFieldsValue: array of string);
    procedure AmaclarReadonlySetting;
    procedure EnvanterDefaulDegerDoldur;
    function VeriKontrol(var Amessage: string): boolean;
    procedure Formclose;
    procedure KayitSonrasiIslem;
    procedure TogglePanel(UniPanel: TUniPanel);
    procedure FilterClear;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses MainModule, McMLib,unKVKKKaynakTanim,unKVKKKategoriTanim,unKVKKVeriTipiTanim,unKVKKSurecTanim,
    unKVKKKisiTanim,unKVKKAmacTanim,unKVKKMetodTanim,unKVKKTarafTanim,
  unKVKKTedbirTanim, unKVKKDayanakTanim, Main;


procedure TfrmVeriTipiAnalizIslemleri.btnaddvertipiClick(Sender: TObject);
var
 KaynakRecNo : integer;
 veritipirecNo: integer;
begin
  if not MainMod.LoginInfo.Yetkiler[77] then
  begin
    MessageDlg('veri Tipi tanýmý eklemeye yetkili deðilsiniz.', mtError, [mbOk]);
    Exit;
  end;
   vqtmp.Close;
 if frmKVKKVeriTipiTanim.Insert(0, '') = mrOk then
 begin
  try
    KaynakRecNo := vqkaynak.RecNo;
     vqkaynak.DisableControls;
     RefreshQuery(qveritipi);
     vqtmp.SourceDataSets.Clear;
     vqtmp.SourceDataSets.Add(vqveritipi);
     vqtmp.SourceDataSets.Add(qveritipi);
     vqtmp.SQL.Text := 'select * from qveritipi where id not in (select id from vqveritipi)';
     vqtmp.Open;

     vqkaynak.First;
     while not vqkaynak.Eof do
       begin
         if  vqkaynak.FieldByName('select').AsString='T' then
         begin
           VtTabloDoldur(vqveritipi,vqtmp,['select'],['F'],false);
         end;
         vqkaynak.Next;
     end;
    vqkaynak.EnableControls;
    vqkaynak.RecNo := KaynakRecNo;
    veritipirecNo := vqveritipi.RecNo;
    vqveritipi.Refresh;
    vqveritipi.RecNo := veritipirecNo;
  except
    ShowMessageN('Veriler Yenilenemedi. Formu Yenileyiniz.') ;
    vqkaynak.EnableControls;
    vqkaynak.RecNo := KaynakRecNo;
  end;
 end;
end;

procedure TfrmVeriTipiAnalizIslemleri.btncancelClick(Sender: TObject);
begin
 KayitSonrasiIslem;
end;

procedure TfrmVeriTipiAnalizIslemleri.btnKisiEkleClick(Sender: TObject);
begin
 if not MainMod.LoginInfo.Yetkiler[33] then
  begin
    MessageDlg('Ýlgili kiþi tanýmý eklemeye yetkili deðilsiniz.', mtError, [mbOk]);
    Exit;
  end;
  if frmKVKKKisiTanim.Exec(0, 0) = mrOk then RefreshQuery(qKisi);
end;

procedure TfrmVeriTipiAnalizIslemleri.btnSurecEkleClick(Sender: TObject);
begin
if not MainMod.LoginInfo.Yetkiler[21] then
  begin
    MessageDlg('Süreç tanýmý eklemeye yetkili deðilsiniz.', mtError, [mbOk]);
    Exit;
  end;
  if frmKVKKSurecTanim.Exec(0, 0) = mrOk then RefreshQuery(qsurec);
end;

procedure TfrmVeriTipiAnalizIslemleri.dsKaynakDataChange(Sender: TObject;
  Field: TField);
begin
  if not vqveritipi.IsEmpty then
    lbVeriTipi.Caption := 'Seçili Kaynak : '+vqkaynak.FieldByName('kaynak').AsString
  else  lbVeriTipi.Caption := '';
end;

procedure TfrmVeriTipiAnalizIslemleri.grdamacColumnFilter(Sender: TUniDBGrid;
  const Column: TUniDBGridColumn; const Value: Variant);
var
  filtrestring : string;
  SecimFiltrestr : string;
begin
 if not vqamac.Active then   exit;
  if (fedamac.Text <> '') and (Length(fedamac.Text)>2) then
  begin
    if filtrestring <>'' then
      filtrestring := filtrestring  + ' and ';
    filtrestring := filtrestring + 'amac LIKE ''%' +TR_Upper(fedamac.Text) + '%''';
  end;

  if fchamacToplamaselect.ItemIndex <> 0 then
  begin
   if SecimFiltrestr <>'' then
      SecimFiltrestr := SecimFiltrestr  +' or ';
    if fchamacToplamaselect.ItemIndex = 1 then
       SecimFiltrestr := SecimFiltrestr + 'selecttoplama =' +QuotedStr('T')
    else
       SecimFiltrestr := SecimFiltrestr + 'selecttoplama =' +QuotedStr('F');
  end;

    if fchamacSaklamaselect.ItemIndex <> 0 then
  begin
   if SecimFiltrestr <>'' then
      SecimFiltrestr := SecimFiltrestr  + ' or ';
    if fchamacSaklamaselect.ItemIndex = 1 then
       SecimFiltrestr := SecimFiltrestr + 'selectSaklama =' +QuotedStr('T')
    else
       SecimFiltrestr := SecimFiltrestr + 'selectSaklama =' +QuotedStr('F');
  end;

  if fchamacPaylasmaselect.ItemIndex <> 0 then
  begin
   if SecimFiltrestr <>'' then
      SecimFiltrestr := SecimFiltrestr  + ' or ';
    if fchamacPaylasmaselect.ItemIndex = 1 then
       SecimFiltrestr := SecimFiltrestr + 'selectPaylasma =' +QuotedStr('T')
    else
       SecimFiltrestr := SecimFiltrestr + 'selectPaylasma =' +QuotedStr('F');
  end;

  if SecimFiltrestr <> '' then
  begin
     if filtrestring <> '' then
      filtrestring := filtrestring + ' and';
    filtrestring := filtrestring + '('+ SecimFiltrestr +')';
  end;


  if filtrestring <>'' then
  begin

    vqamac.Filtered := False;
    vqamac.FilterOptions := [foCaseInsensitive];
    vqamac.Filter :=  filtrestring; //'kaynak LIKE ''%' +fedkaynak.Text+ '%''';
    vqamac.Filtered := True;
  end else
  vqamac.Filtered := false;

end;

procedure TfrmVeriTipiAnalizIslemleri.grdamacColumnSort(
  Column: TUniDBGridColumn; Direction: Boolean);
  var
  dir : string;
begin
  if not Column.Sortable  then exit;
  if Direction then dir := ' ASC ' else dir := 'DESC';
  vqamac.IndexFieldNames := ' "' +Column.FieldName +'" ' +dir;

end;

procedure TfrmVeriTipiAnalizIslemleri.grddayanakColumnFilter(Sender: TUniDBGrid;
  const Column: TUniDBGridColumn; const Value: Variant);
var
  filtrestring : string;
begin
 if not vqdayanak.Active then   exit;
  if (feddayanak.Text <> '') and (Length(feddayanak.Text)>2) then
  begin
    if filtrestring <>'' then
      filtrestring := filtrestring  + ' and ';
    filtrestring := filtrestring + ' dayanak LIKE ''%' +tr_upper( feddayanak.Text)+ '%''';
  end;

  if fchdayanakselect.ItemIndex <> 0 then
  begin
   if filtrestring <>'' then
      filtrestring := filtrestring + ' and ';
    if fchdayanakselect.ItemIndex = 1 then
       filtrestring := filtrestring + 'select =' +QuotedStr('T')
    else
       filtrestring := filtrestring + 'select =' +QuotedStr('F');
  end;

  if filtrestring <>'' then
  begin

    vqdayanak.Filtered := False;
    vqdayanak.FilterOptions := [foCaseInsensitive];
    vqdayanak.Filter :=  filtrestring; //'kaynak LIKE ''%' +fedkaynak.Text+ '%''';
    vqdayanak.Filtered := True;
  end else
  vqdayanak.Filtered := false;

end;

procedure TfrmVeriTipiAnalizIslemleri.grddayanakColumnSort(
  Column: TUniDBGridColumn; Direction: Boolean);
 var
  Dir : string;
begin
  if not Column.Sortable then   exit;
  if Direction then  dir := ' ASC ' else dir := 'DESC' ;
  vqdayanak.IndexFieldNames := ' "' + Column.FieldName +'" ' + dir;
end;

procedure TfrmVeriTipiAnalizIslemleri.grdkaynakCellClick(
  Column: TUniDBGridColumn);
begin
// // Týklanan kolonun 'isSelected' olup olmadýðýný kontrol edin
//  if Column.FieldName = 'isSelected' then
//  begin
//    // CheckBox'ýn durumunu deðiþtir
//    grdkaynak.DataSource.DataSet.Edit; // Veri setini düzenleme moduna alýn
//    grdkaynak.DataSource.DataSet.FieldByName('isSelected').AsBoolean :=
//      not grdkaynak.DataSource.DataSet.FieldByName('isSelected').AsBoolean;
//    grdkaynak.DataSource.DataSet.Post; // Deðiþiklikleri kaydedin
//  end;
end;

procedure TfrmVeriTipiAnalizIslemleri.grdkaynakColumnFilter(Sender: TUniDBGrid;
  const Column: TUniDBGridColumn; const Value: Variant);
  var
  filtrestring : string;
begin
 if not vqkaynak.Active then   exit;
  if (fedkaynak.Text <> '') and (Length(fedkaynak.Text)>2) then
  begin
    if filtrestring <>'' then
      filtrestring := filtrestring  + ' and ';
    filtrestring := filtrestring + 'kaynak LIKE ''%' + tr_upper(fedkaynak.Text)+ '%''';
  end;

  if fchkaynakselect.ItemIndex <> 0 then
  begin
   if filtrestring <>'' then
      filtrestring := filtrestring  + ' and ';
    if fchkaynakselect.ItemIndex = 1 then
       filtrestring := filtrestring + 'select =' +QuotedStr('T')
    else
       filtrestring := filtrestring + 'select =' +QuotedStr('F');
  end;

  if filtrestring <>'' then
  begin

    vqkaynak.Filtered := False;
    vqkaynak.FilterOptions := [foCaseInsensitive];
    vqkaynak.Filter :=  filtrestring; //'kaynak LIKE ''%' +fedkaynak.Text+ '%''';
    vqkaynak.Filtered := True;
  end else
  vqkaynak.Filtered := false;
end;


procedure TfrmVeriTipiAnalizIslemleri.grdkaynakColumnSort(
  Column: TUniDBGridColumn; Direction: Boolean);
var
  Dir : String;
begin
  if not Column.Sortable then Exit;
  if Direction then Dir := 'ASC' else Dir := 'DESC';
  vqkaynak.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
end;

procedure TfrmVeriTipiAnalizIslemleri.grdmetodColumnFilter(Sender: TUniDBGrid;
  const Column: TUniDBGridColumn; const Value: Variant);
var
  filtrestring : string;
  SecimFiltrestr : string;
begin
 if not vqmetod.Active then   exit;
  if (fedMetod.Text <> '') and (Length(fedMetod.Text)>2) then
  begin
    if filtrestring <>'' then
      filtrestring := filtrestring  + ' and ';
    filtrestring := filtrestring + 'metod LIKE ''%' +TR_UPPER(fedMetod.Text)+ '%''';
  end;

  if fchMetodToplamaSelect.ItemIndex <> 0 then
  begin
   if SecimFiltrestr <>'' then
      SecimFiltrestr := SecimFiltrestr  + ' or ';
    if fchMetodToplamaSelect.ItemIndex = 1 then
       SecimFiltrestr := SecimFiltrestr + 'selecttoplama =' +QuotedStr('T')
    else
       SecimFiltrestr := SecimFiltrestr + 'selecttoplama =' +QuotedStr('F');
  end;

    if fchMetodSaklamaselect.ItemIndex <> 0 then
  begin
   if SecimFiltrestr <>'' then
      SecimFiltrestr := SecimFiltrestr  + ' or ';
    if fchMetodSaklamaselect.ItemIndex = 1 then
       SecimFiltrestr := SecimFiltrestr + 'selectSaklama =' +QuotedStr('T')
    else
       SecimFiltrestr := SecimFiltrestr + 'selectSaklama =' +QuotedStr('F');
  end;

  if fchMetodPaylasmaSelect.ItemIndex <> 0 then
  begin
   if SecimFiltrestr <>'' then
      SecimFiltrestr := SecimFiltrestr  + ' or ';
    if fchMetodPaylasmaSelect.ItemIndex = 1 then
       SecimFiltrestr := SecimFiltrestr + 'selectPaylasma =' +QuotedStr('T')
    else
       SecimFiltrestr := SecimFiltrestr + 'selectPaylasma =' +QuotedStr('F');
  end;

  if SecimFiltrestr <> '' then
  begin
     if filtrestring <> '' then
      filtrestring := filtrestring + ' and';
    filtrestring := filtrestring + '('+ SecimFiltrestr +')';
  end;

  if filtrestring <>'' then
  begin

    vqmetod.Filtered := False;
    vqmetod.FilterOptions := [foCaseInsensitive];
    vqmetod.Filter :=  filtrestring; //'kaynak LIKE ''%' +fedkaynak.Text+ '%''';
    vqmetod.Filtered := True;
  end else
  vqmetod.Filtered := false;

end;

procedure TfrmVeriTipiAnalizIslemleri.grdmetodColumnSort(
  Column: TUniDBGridColumn; Direction: Boolean);
  var
  Dir : String;
begin
  if not Column.Sortable then Exit;
  if Direction then Dir := 'ASC' else Dir := 'DESC';
  vqmetod.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;

end;

procedure TfrmVeriTipiAnalizIslemleri.grdveritipiColumnFilter(
  Sender: TUniDBGrid; const Column: TUniDBGridColumn; const Value: Variant);
var
  filtrestring : string;
begin
 if not vqveritipi.Active then   exit;
  if (fedveritipi.Text <> '') and (Length(fedveritipi.Text)>2) then
  begin
    if filtrestring <>'' then
      filtrestring := filtrestring  + ' and ';
    filtrestring := filtrestring + 'veri_tipi LIKE ''%' +tr_upper(fedveritipi.Text)+ '%''';
  end;

    if (fedkategori.Text <> '') and (Length(fedkategori.Text)>2) then
  begin
    if filtrestring <>'' then
      filtrestring := filtrestring  + ' and ';
    filtrestring := filtrestring + 'kategori LIKE ''%' +tr_upper(fedkategori.Text) + '%''';
  end;

  if fchveritipiselect.ItemIndex <> 0 then
  begin
   if filtrestring <>'' then
      filtrestring := filtrestring  + ' and ';
    if fchveritipiselect.ItemIndex = 1 then
       filtrestring := filtrestring + 'select =' +QuotedStr('T')
    else
       filtrestring := filtrestring + 'select =' +QuotedStr('F');
  end;

  if filtrestring <>'' then
  begin

    vqveritipi.Filtered := False;
    vqveritipi.FilterOptions := [foCaseInsensitive];
    vqveritipi.Filter :=  filtrestring; //'kaynak LIKE ''%' +fedkaynak.Text+ '%''';
    vqveritipi.Filtered := True;
  end else
  vqveritipi.Filtered := false;

end;

procedure TfrmVeriTipiAnalizIslemleri.grdveritipiColumnSort(
  Column: TUniDBGridColumn; Direction: Boolean);
  var
  Dir : String;
begin

  if not Column.Sortable then Exit;
  if Direction then Dir := 'ASC' else Dir := 'DESC';
  vqveritipi.IndexFieldNames := '"' + Column.FieldName + '" ' + Dir;
  //vqveritipi.IndexFieldNames := 'kategori'

end;

procedure TfrmVeriTipiAnalizIslemleri.EnvanterDefaulDegerDoldur;
begin
    vqEnvanter.Insert;
    vqEnvanter.FieldByName('id').AsInteger              := 0;
    vqEnvanter.FieldByName('main_id').AsInteger         := 0;
    vqEnvanter.FieldByName('active').AsString           := 'E';
    vqEnvanter.FieldByName('nitelik').AsString          := 'H';
    vqEnvanter.FieldByName('veritipi_id').AsInteger     := 0;
    vqEnvanter.FieldByName('kategori_id').AsInteger     := 0;

    vqEnvanter.FieldByName('sakl_fsure_var').AsString   := 'SAKLANMIYOR';
    vqEnvanter.FieldByName('sakl_fsure_imha').AsString  := '';
    vqEnvanter.FieldByName('sakl_fsure_sure').AsInteger := 0;
    vqEnvanter.FieldByName('sakl_fsure_tip').AsString   := '';

    vqEnvanter.FieldByName('sakl_ssure_var').AsString   := 'SAKLANMIYOR';
    vqEnvanter.FieldByName('sakl_ssure_imha').AsString  := '';
    vqEnvanter.FieldByName('sakl_ssure_sure').AsInteger := 0;
    vqEnvanter.FieldByName('sakl_ssure_tip').AsString   := '';

    vqEnvanter.FieldByName('dgr_politika').AsString     := 'H';
    vqEnvanter.FieldByName('dgr_sozlesme').AsString     := 'H';
    vqEnvanter.FieldByName('payl_sozlesme').AsString    := 'H';
    vqEnvanter.FieldByName('payl_taraftipi').AsString   := '';

    vqenvanter.FieldByName('payl_taraftipi').AsString := 'YURT ÝÇÝ' ;

    rgfSaklama.ItemIndex := 1 ;
    rgfSaklamaBaslama.Visible := rgfSaklama.ItemIndex = 0;
    rgfGunAyYil.Visible := rgfSaklama.ItemIndex = 0;
    gbfSure.Visible := rgfSaklama.ItemIndex = 0;
    rgfSaklamaBaslama.ItemIndex := -1;
    rgfGunAyYil.ItemIndex:= -1;

    rgdsaklama.ItemIndex := 1;
    rgdSaklamaBaslama.Visible := rgdSaklama.ItemIndex = 0;
    rgdGunAyYil.Visible := rgdSaklama.ItemIndex = 0;
    gbdSure.Visible := rgdSaklama.ItemIndex = 0;
    rgdSaklamaBaslama.ItemIndex := -1;
    rgdGunAyYil.ItemIndex := -1;
    rgtaraftipi.ItemIndex := 0;
end;
procedure TfrmVeriTipiAnalizIslemleri.NewSQL;
begin
  postKontrol := false;
    vqenvanter.Open;
    EnvanterDefaulDegerDoldur ;

     QueryOpen(qDept,' SELECT d.id, ' +
  ' (case when (coalesce(d.main_dept_id,0)=0) then d.title else d.title||'' (''||md.title||'')'' end)::varchar(410) as title ' +
  ' FROM sys_deptdef d ' +
  ' left join sys_deptdef md on md.id=d.main_dept_id ' +
  ' WHERE d.active = ''E'' AND d.mc_id =' + IntToStr(MainMod.MCID) +
  ' AND d.id IN (' + MainMod.LoginInfo.Birimler + ') ORDER BY title');

//  QueryOpen(qdept,' select * from sys_deptdef d where d.id=any(string_to_array('+
//    QuotedStr( MainMod.LoginInfo.Birimler)+
//    ', '','')::int[]); ');

  QueryOpen(qSurec, 'SELECT id, surec FROM def_data_surec WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY surec');
  QueryOpen(qKisi, 'SELECT id, kisi FROM def_data_kisi WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY kisi');
//  QueryOpen(qKaynak, 'SELECT id, kaynak FROM def_data_kaynak WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY kaynak');
//  VtTabloDoldur(vqkaynak,qKaynak,['select'],['F'],true);
//  vqkaynak.First;
  QueryOpen(qveritipi,' SELECT  ktg.kategori ,vt.id,vt.mc_id,vt.md_id,vt.veri_tipi,vt.nitelik,vt.description	 '+
                      ' FROM def_data_veritipi vt '+
                      ' LEFT JOIN def_data_kategori ktg ON ktg.ID = vt.md_id '+
                      ' WHERE vt.mc_id ='+ IntToStr(MainMod.MCID) +
                      ' order by ktg.kategori,vt.veri_tipi ');
  QueryOpen(qamac,' SELECT '+
  ' amac||'' (''|| '+
  ' TRIM(BOTH '','' FROM '+
  ' COALESCE(NULLIF(CASE WHEN toplama = ''E'' THEN ''T'' END, ''''), '''') || '+
  ' COALESCE('','' || NULLIF(CASE WHEN saklama = ''E'' THEN ''S'' END, ''''), '''') || '+
  ' COALESCE('','' || NULLIF(CASE WHEN paylasma = ''E'' THEN ''P'' END, ''''), '''') '+
  ' )||'')'' AS amac, '+
  ' id,mc_id,description,toplama,saklama,paylasma '+
  ' FROM def_data_amac where mc_id=' + IntToStr(MainMod.MCID) +
  ' order by amac'  ) ;

  QueryOpen(qmetod,' SELECT '+
  ' metod|| '' (''|| '+
  ' TRIM(BOTH  '','' FROM '+
  ' COALESCE(NULLIF(CASE WHEN toplama =  ''E'' THEN  ''T'' END,  ''''),  '''') || '+
  ' COALESCE( '','' || NULLIF(CASE WHEN saklama =  ''E'' THEN  ''S'' END,  ''''),  '''') || '+
  ' COALESCE( '','' || NULLIF(CASE WHEN paylasma =  ''E'' THEN  ''P'' END,  ''''),  '''') '+
  ' )|| '')'' AS metod ,id,mc_id,description,toplama,saklama,paylasma '+
  ' FROM def_data_metod where mc_id=' + IntToStr(MainMod.MCID) +
  ' order by metod ') ;

  QueryOpen(qtaraf,' SELECT *   FROM def_data_taraf where mc_id='+ IntToStr(MainMod.MCID) +'  order by taraf ');
  QueryOpen(qdayanak,' SELECT *   FROM def_data_dayanak where  tipi = ''HUKUKSAL'' AND mc_id='+ IntToStr(MainMod.MCID) +'  order by dayanak ');
  QueryOpen(qtedbir,' SELECT *   FROM def_data_tedbir where mc_id='+ IntToStr(MainMod.MCID) +'  order by tedbir ');
  QueryOpen(qKontrol,'SELECT id, kontrolsonuc FROM def_data_kontrolsonuc WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY kontrolsonuc');

 vqkaynak.Open;
 vqveritipi.Open;
 vqamac.Open;
 vqmetod.Open;
 vqtaraf.Open;
 vqdayanak.Open;
 vqtedbir.Open;

 postKontrol := true;

  vqveritipi.MasterSource := dsKaynak;
  vqveritipi.MasterFields :=  'id';
  vqveritipi.DetailFields := 'KaynakId';

  pnldayanak.Visible :=   MainMod.LoginInfo.Yetkiler[96] ;
  pnltedbir.Visible :=    MainMod.LoginInfo.Yetkiler[96] ;

 end;

procedure TfrmVeriTipiAnalizIslemleri.OnchangeDepSurKisi(Sender: TObject);
var
baslik :string;
begin
 if (edDept.Text ='') or (edSurec.Text ='') or (edKisi.Text ='') then  exit;

   if  vqkaynak.IsEmpty  then
   begin
    QueryOpen(qKaynak, 'SELECT id, kaynak FROM def_data_kaynak WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY kaynak');
    VtTabloDoldur(vqkaynak,qKaynak,['select'],['F'],true);
    vqkaynak.First;
   end;

  //amaç
   if  vqamac.IsEmpty then
   begin
    VtTabloDoldur(vqamac,qamac,['selectToplama','selectSaklama','selectPaylasma'],
     ['F','F','F'], true);
    vqamac.first;
   end;
  //metod
  if vqmetod.IsEmpty  then
  begin
    VtTabloDoldur(vqmetod,qmetod,['selectToplama','selectSaklama','selectPaylasma'],
     ['F','F','F'], true);
    vqmetod.First;
  end;
   //taraf
  if vqtaraf.IsEmpty  then
  begin
  VtTabloDoldur(vqtaraf,qtaraf,['select'],   ['F'], true);
  vqtaraf.First;
  end;
  //dayanak
  if vqdayanak.IsEmpty  then
  begin
  VtTabloDoldur(vqdayanak,qdayanak,['select'],['F'],true) ;
  vqdayanak.First;
  end;
  //tedbir
  if vqtedbir.IsEmpty  then
  begin
  VtTabloDoldur(vqtedbir,qtedbir,['select'],['F'],true) ;
  vqtedbir.First;
  end;

   // pnl2kaynak.Title :=  edsurec.Text +' -> '+ edKisi.Text +' ->  için VERÝ KAYNAÐINI belirleyiniz';
    baslik := ' %s için %s belirleyiniz ';


if not vqkaynak.IsEmpty then
  begin
    pnl2kaynak.Title := Format(baslik,[ edsurec.Text +' -> '+ edKisi.Text  ,'KAYNAKLAR']);
    pnl3amac.Title := format(baslik,[ edsurec.Text +' -> '+ edKisi.Text  ,'AMAÇLARI'])   ;
    pnl4metod.Title := format(baslik,[edsurec.Text +' -> '+ edKisi.Text ,'METOTLARI'])   ;
    pnl5taraf.Title := format(baslik,[edsurec.Text +' -> '+ edKisi.Text ,'PAYLAÞILAN TARAFLARI'])   ;
    pnldayanak.Title := format(baslik,[edsurec.Text +' -> '+ edKisi.Text ,'DAYANAKLARI '])   ;
    pnltedbir.Title := format(baslik,[edsurec.Text +' -> '+ edKisi.Text ,'TEDBÝRLERÝ'])   ;
  end
  else
  begin
    pnl2kaynak.Title := 'KAYNAKLAR';
    pnl3amac.Title := 'AMAÇLAR';
    pnl4metod.Title := 'METOTLAR';
    pnl5taraf.Title := 'PAYLAÞILAN TARAFLAR';
    pnldayanak.Title := 'DAYANAKLAR';
    pnltedbir.Title := 'TEDBÝRLER';
  end;

end;

procedure TfrmVeriTipiAnalizIslemleri.pnlaAjaxEvent(Sender: TComponent;
  EventName: string; Params: TUniStrings);
begin
// if EventName = '_expandorcollapse' then
//    ShowMessage(Params.Values['uname'] + ' expanded');
end;

procedure TfrmVeriTipiAnalizIslemleri.pnlaResize(Sender: TUniControl; OldWidth,
  OldHeight: Integer);
begin
 pnl1giris.Width := Screen.Width;// pnla.Width;
 pnl2kaynak.Width := Screen.Width;//pnla.Width;
 pnl3amac.Width := Screen.Width;//pnla.width;
end;

procedure TfrmVeriTipiAnalizIslemleri.pnlkaydetbuttonResize(Sender: TUniControl;
  OldWidth, OldHeight: Integer);
begin
 btncancel.Top := (pnlkaydetbutton.Height div 2) - btncancel.Height;
 btncancel.Left := ( pnlkaydetbutton.Width div 2) - btncancel.width;
 btnpos.Top := (pnlkaydetbutton.Height div 2)-btncancel.Height;
 btnpos.Left := ( pnlkaydetbutton.Width div 2) +10;

end;

procedure TfrmVeriTipiAnalizIslemleri.pnl2kaynakResize(Sender: TUniControl;
  OldWidth, OldHeight: Integer);
begin
 pnl1kaynak.Width := (pnl2kaynak.Width div 10) * 4;
 pnl2veritipi.Width := (pnl2kaynak.Width div 10) * 6;
end;

procedure TfrmVeriTipiAnalizIslemleri.vttabloKayitSil(AVtTablo: TVirtualTable; Afields: array of string; AFieldsValue: array of string);
var
  i :integer;
  kontrol : boolean;
begin
  if length(Afields) <> length(AFieldsValue) then  exit;

  if not AVtTablo.Active then AVtTablo.Open;

  if AVtTablo.IsEmpty then exit;

  AVtTablo.First;
  while not AVtTablo.Eof do
  begin
    kontrol := True;
    for i := Low(Afields) to High(Afields) do
    begin
      if AVtTablo.FieldByName(Afields[i]).AsString <> AFieldsValue[i] then
      begin
        Kontrol := False;
        Break;
      end;
    end;
    if kontrol then
      AVtTablo.Delete
    else
      AVtTablo.Next;
  end;

end;

procedure TfrmVeriTipiAnalizIslemleri.VtTabloDoldur(Avttablo : TVirtualTable; AReferanstablo :TDataSet;
              AEkFild : Array of string ; AEkfieldValue : array of String; Abosalt:boolean= false);
var
  i :integer;
  FieldRef: TField;
begin
  if Length(AEkFild)<> Length(AEkfieldValue) then
    exit;

  Avttablo.Open;
  if Abosalt then
    begin
      Avttablo.First;
      while not Avttablo.EOF do Avttablo.Delete;
    end;
    AReferanstablo.Open;

    AReferanstablo.First;
    while not AReferanstablo.Eof do
    begin
      Avttablo.Append;
      for I := 0 to AReferanstablo.FieldCount -1 do
      begin
        FieldRef := AReferanstablo.Fields[i];


        if Avttablo.FindField(FieldRef.FieldName) <> nil then
         Avttablo.FieldByName(FieldRef.FieldName).Value := FieldRef.Value;
      end;
        if Length(AEkFild) >0 then
        begin
          for i := low(AEkFild) to High(AEkFild) do
          begin
            if Avttablo.FindField(AEkFild[i]) <> nil then
              Avttablo.FieldByName(AEkFild[i]).Value := AEkfieldValue[i];
          end;
        end;
      Avttablo.Post;
      AReferanstablo.Next;
    end;


end;

procedure TfrmVeriTipiAnalizIslemleri.rgdGunAyYilClick(Sender: TObject);
begin
  if vqenvanter.IsEmpty then exit;
  if ( vqenvanter.State in [dsInsert,dsEdit]) then vqenvanter.Edit;
case rgdGunAyYil.ItemIndex of
  0:  vqenvanter.FieldByName('sakl_ssure_tip').AsString :='YIL';
  1:  vqenvanter.FieldByName('sakl_ssure_tip').AsString :='AY';
  2: vqenvanter.FieldByName('sakl_ssure_tip').AsString :='GÜN';
end;
end;

procedure TfrmVeriTipiAnalizIslemleri.rgdsaklamaBaslamaClick(Sender: TObject);
begin
  if vqenvanter.IsEmpty then exit;
  if ( vqenvanter.State in [dsInsert,dsEdit]) then vqenvanter.Edit;
 vqenvanter.FieldByName('sakl_ssure_imha').AsString := IfThen(rgdsaklamaBaslama.ItemIndex = 0,'BAÞLANGIÇ','BÝTÝÞ');
end;

procedure TfrmVeriTipiAnalizIslemleri.rgdsaklamaClick(Sender: TObject);
begin


  rgdSaklamaBaslama.Visible := rgdSaklama.ItemIndex = 0;
  rgdGunAyYil.Visible := rgdSaklama.ItemIndex = 0;
  gbdSure.Visible := rgdSaklama.ItemIndex = 0;
  if  vqenvanter.IsEmpty then exit;
  if ( vqenvanter.State in [dsInsert,dsEdit]) then vqenvanter.Edit;
  vqenvanter.FieldByName('sakl_ssure_var').AsString := IfThen(rgdSaklama.ItemIndex = 0,'SAKLANIYOR','SAKLANMIYOR');
end;

procedure TfrmVeriTipiAnalizIslemleri.rgfGunAyYilChangeValue(Sender: TObject);
begin
if  vqenvanter.IsEmpty then exit;
if not( vqenvanter.State in [dsInsert,dsEdit]) then vqenvanter.Edit;
case rgfGunAyYil.ItemIndex of
  0:  vqenvanter.FieldByName('sakl_fsure_tip').AsString :='YIL';
  1:  vqenvanter.FieldByName('sakl_fsure_tip').AsString :='AY';
  2: vqenvanter.FieldByName('sakl_fsure_tip').AsString :='GÜN';
end;
end;

procedure TfrmVeriTipiAnalizIslemleri.rgfSaklamaBaslamaChangeValue(
  Sender: TObject);
begin
  if  vqenvanter.IsEmpty then exit;
  if not( vqenvanter.State in [dsInsert,dsEdit]) then vqenvanter.Edit;
 vqenvanter.FieldByName('sakl_fsure_imha').AsString := IfThen(rgfSaklamaBaslama.ItemIndex = 0,'BAÞLANGIÇ','BÝTÝÞ');
end;

procedure TfrmVeriTipiAnalizIslemleri.rgfSaklamaClick(Sender: TObject);
begin
  rgfSaklamaBaslama.Visible := rgfSaklama.ItemIndex = 0;
  rgfGunAyYil.Visible := rgfSaklama.ItemIndex = 0;
  gbfSure.Visible := rgfSaklama.ItemIndex = 0;
  if vqenvanter.IsEmpty then exit;
  if not( vqenvanter.State in [dsInsert,dsEdit]) then vqenvanter.Edit;
  vqenvanter.FieldByName('sakl_fsure_var').AsString := IfThen(rgfSaklama.ItemIndex = 0,'SAKLANIYOR','SAKLANMIYOR');
end;

procedure TfrmVeriTipiAnalizIslemleri.btnaddKaynakClick(Sender: TObject);
begin
 if not MainMod.LoginInfo.Yetkiler[25] then
  begin
    MessageDlg('Veri kaynaðý tanýmý eklemeye yetkili deðilsiniz.', mtError, [mbOk]);
    Exit;
  end;
   if (edDept.Text ='') or (edSurec.Text ='') or (edKisi.Text ='') then  exit;
   vqtmp.Close;
  if frmKVKKKaynakTanim.Exec(0, 0) = mrOk then
  begin
  try
    RefreshQuery(qKaynak);
   vqtmp.SourceDataSets.Clear;
   vqtmp.SourceDataSets.Add(vqkaynak);
   vqtmp.SourceDataSets.Add(qKaynak);
   vqtmp.SQL.Text := 'select * from qkaynak where id not in (select id from vqkaynak)';
   vqtmp.Open;
   VtTabloDoldur(vqkaynak,vqtmp,['select'],['F'],false);
  except
    try
      RefreshQuery(qKaynak);
      VtTabloDoldur(vqkaynak,qKaynak,['select'],['F'],true);
    except
      ShowMessageN('Veriler Yenilenemedi. Formu Yenileyiniz.') ;
    end;
  end;
  end;
end;

procedure TfrmVeriTipiAnalizIslemleri.btaddamacClick(Sender: TObject);
begin
if not MainMod.LoginInfo.Yetkiler[37] then
  begin
    MessageDlg('Amaç tanýmý eklemeye yetkili deðilsiniz.', mtError, [mbOk]);
    Exit;
  end;
  vqtmp.Close;
  if frmKVKKAmacTanim.Exec(0, 0) = mrOk then
  begin
  try
    RefreshQuery(qamac);
    vqtmp.SourceDataSets.Clear;
    vqtmp.SourceDataSets.Add(vqamac);
    vqtmp.SourceDataSets.Add(qamac);
    vqtmp.SQL.Text := 'select * from qamac where id not in (select id from vqamac)';
    vqtmp.Open;
    VtTabloDoldur(vqamac,vqtmp,['selectToplama','selectSaklama','selectPaylasma'],   ['F','F','F'], false);
  except
    try
      RefreshQuery(qamac);
      VtTabloDoldur(vqamac,qamac,['selectToplama','selectSaklama','selectPaylasma'],
      ['F','F','F'], true);
    except
      ShowMessageN('Veriler Yenilenemedi. Formu Yenileyiniz.') ;
    end;
  end;
  end;
end;

procedure TfrmVeriTipiAnalizIslemleri.btnaddmetodClick(Sender: TObject);
begin
if not MainMod.LoginInfo.Yetkiler[53] then
  begin
    MessageDlg('Metod tanýmý eklemeye yetkili deðilsiniz.', mtError, [mbOk]);
    Exit;
  end;
     vqtmp.Close;
    if frmKVKKMetodTanim.Exec(0, 0) = mrOk then
    begin
      try
        RefreshQuery(qmetod);
        vqtmp.SourceDataSets.Clear;
        if not vqmetod.Active then
          vqmetod.Open;
        if not qmetod.Active then
          qmetod.Open;
        vqtmp.SourceDataSets.Add(vqmetod);
        vqtmp.SourceDataSets.Add(qmetod);
        vqtmp.SQL.Text := 'select * from qmetod where id not in (select id from vqmetod)';
        vqtmp.Open;
        VtTabloDoldur(vqmetod,vqtmp,['selectToplama','selectSaklama','selectPaylasma'],   ['F','F','F'], false);
      except
        try
          RefreshQuery(qmetod);
          VtTabloDoldur(vqmetod,qmetod,['selectToplama','selectSaklama','selectPaylasma'],
          ['F','F','F'], true);
        except
          ShowMessageN('Veriler Yenilenemedi. Formu Yenileyiniz.') ;
        end;
      end;
    end;


end;

procedure TfrmVeriTipiAnalizIslemleri.btnaddtarafClick(Sender: TObject);
begin
  if not MainMod.LoginInfo.Yetkiler[45] then
  begin
    MessageDlg('Paylaþýlan Taraf tanýmý eklemeye yetkili deðilsiniz.', mtError, [mbOk]);
    Exit;
  end;
   vqtmp.Close;
  if frmKVKKTarafTanim.Exec(0, 0) = mrOk then
  begin
  try
   RefreshQuery(qtaraf);
   vqtmp.SourceDataSets.Clear;
   vqtmp.SourceDataSets.Add(vqtaraf);
   vqtmp.SourceDataSets.Add(qtaraf);
   vqtmp.SQL.Text := 'select * from qtaraf where id not in (select id from vqtaraf)';
   vqtmp.Open;
   VtTabloDoldur(vqtaraf,vqtmp,['select'],['F'],false);
  except
    try
      RefreshQuery(qtaraf);
      VtTabloDoldur(vqtaraf,qtaraf,['select'],   ['F'], true);
    except
      ShowMessageN('Veriler Yenilenemedi. Formu Yenileyiniz.');
    end;
  end;
  end;
end;

procedure TfrmVeriTipiAnalizIslemleri.grdtarafColumnFilter(Sender: TUniDBGrid;
  const Column: TUniDBGridColumn; const Value: Variant);
var
  filtrestring : string;
begin
 if not vqtaraf.Active then   exit;
  if (fedtaraf.Text <> '') and (Length(fedtaraf.Text)>2) then
  begin
    if filtrestring <>'' then
      filtrestring := filtrestring  + ' and ';
    filtrestring := filtrestring + 'taraf LIKE ''%' +tr_upper(fedtaraf.Text)+ '%''';
  end;

  if fchTarafSelect.ItemIndex <> 0 then
  begin
   if filtrestring <>'' then
      filtrestring := filtrestring + ' and ';
    if fchTarafSelect.ItemIndex = 1 then
       filtrestring := filtrestring + 'select =' +QuotedStr('T')
    else
       filtrestring := filtrestring + 'select =' +QuotedStr('F');
  end;

  if filtrestring <>'' then
  begin

    vqtaraf.Filtered := False;
    vqtaraf.FilterOptions := [foCaseInsensitive];
    vqtaraf.Filter :=  filtrestring; //'kaynak LIKE ''%' +fedkaynak.Text+ '%''';
    vqtaraf.Filtered := True;
  end else
  vqtaraf.Filtered := false;
end;

procedure TfrmVeriTipiAnalizIslemleri.grdtarafColumnSort(
  Column: TUniDBGridColumn; Direction: Boolean);
  var
  Dir : string;
begin
  if not Column.Sortable then   exit;
  if Direction then  dir := ' ASC ' else dir := 'DESC' ;
  vqtaraf.IndexFieldNames := ' "' + Column.FieldName +'" ' + dir;
end;

Function TfrmVeriTipiAnalizIslemleri.VeriKontrol(var Amessage: string):boolean;
begin
result := true;
Amessage := '';
if not (vqenvanter.State in [dsEdit,dsInsert]) then  vqenvanter.Edit;

if vquery.FieldByName('veritipiId').AsString ='' then
begin
    Amessage := 'Veritipi seçilmemiþ. Lütfen kontrol ediniz.';
    pnl2veritipi.Collapsed := false;
    Exit(false);
end;
if trim(vquery.FieldByName('AmactoplamaIds').asstring)+
    trim(vquery.FieldByName('AmacSaklamaIds').asstring)+
    trim(vquery.FieldByName('AmacPaylasmaIds').asstring)=''  then
begin
    Amessage := 'Amaç seçilmemiþ. Lütfen kontrol ediniz.';
    pnl3amac.Collapsed := false;
    Exit(false);
end;
if trim(vquery.FieldByName('MetodtoplamaIds').asstring)+
    trim(vquery.FieldByName('MetodSaklamaIds').asstring)+
    trim(vquery.FieldByName('MetodPaylasmaIds').asstring)=''  then
begin
    Amessage := 'Metot  Seçilmemiþ. Lütfen kontrol ediniz.';
    pnl4metod.Collapsed := false;
    Exit(false);
end;
if trim(vquery.FieldByName('taraf').asstring) ='' then
begin
  Amessage:= 'Paylaþýlan taraf seçilmemiþ. lütfen kontrol ediniz';
end;

  if vqenvanter.FieldByName('dept_id').AsInteger < 1 then
  begin
    Amessage := 'Formun departmaný belirtilmemiþ. Lütfen kontrol ediniz.';
    edDept.SetFocus;
    Exit(false);
  end;
  if vqenvanter.FieldByName('surec_id').AsInteger < 1 then
  begin
    Amessage:= 'Süreç belirtilmemiþ. Lütfen kontrol ediniz.';
    edSurec.SetFocus;
    Exit(False);
  end;

if vqenvanter.FieldByName('kisi_id').AsInteger < 1 then
  begin
    Amessage:= 'Veri Konusu Kiþi belirtilmemiþ. Lütfen kontrol ediniz.';
    edKisi.SetFocus;
    Exit(false);
  end;

//  if vqkaynak.FieldByName('kaynak_id').AsInteger < 1 then
//  begin
//    MessageDlg('Veri Kaynaðý / Süreç / Sistem belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
//    edKaynak.SetFocus;
//    Exit;
//  end;

  if vqenvanter.FieldByName('payl_taraftipi').AsString = '' then
  begin
    Amessage:= 'Paylaþýlan Taraf Tipi belirtilmemiþ. Lütfen kontrol ediniz.';
    Exit(false);
  end;
  // Süre ile ilgili kontroller : Baþlangýç
  if vqenvanter.FieldByName('sakl_fsure_var').AsString = '' then
    vqenvanter.FieldByName('sakl_fsure_var').AsString := 'SAKLANMIYOR';
  if vqenvanter.FieldByName('sakl_fsure_var').AsString = 'SAKLANMIYOR' then
  begin
    vqEnvanter.FieldByName('sakl_fsure_imha').AsString  := '';
    vqenvanter.FieldByName('sakl_fsure_tip').AsString   := '';
    vqenvanter.FieldByName('sakl_fsure_sure').AsInteger := 0;
  end
  else
  begin
    if vqenvanter.FieldByName('sakl_fsure_imha').AsString = '' then
    begin
      Amessage := 'Faaliyetin Fiziksel Saklama Ýmha Zamaný belirtilmemiþ. Lütfen kontrol ediniz.';
      Exit(false);
    end;
    if vqenvanter.FieldByName('sakl_fsure_tip').AsString = '' then
    begin
      Amessage:= 'Faaliyetin Fiziksel Saklama Süresi belirtilmemiþ. Lütfen kontrol ediniz.';
      Exit(False);
    end;
    if vqenvanter.FieldByName('sakl_fsure_sure').AsInteger < 1 then
    begin
      Amessage := 'Faaliyetin Fiziksel Saklama Süresi "0" dan büyük olmalýdýr. Lütfen kontrol ediniz.';
      Exit(false);
    end;
  end;

  if vqenvanter.FieldByName('sakl_fsure_var').AsString = 'SAKLANMIYOR' then
  begin
    vqenvanter.FieldByName('sakl_fsure').AsString := '';
  end
  else
  begin
    if vqenvanter.FieldByName('sakl_fsure_imha').AsString = 'BAÞLANGIÇ' then
      vqenvanter.FieldByName('sakl_fsure').AsString := vqenvanter.FieldByName('sakl_fsure_sure').AsString + ' ' + vqenvanter.FieldByName('sakl_fsure_tip').AsString
    else
      vqenvanter.FieldByName('sakl_fsure').AsString := 'DÝÐER (FAALÝYET SÜRESÝ + ' + vqenvanter.FieldByName('sakl_fsure_sure').AsString + ' ' + vqenvanter.FieldByName('sakl_fsure_tip').AsString + ')';
  end;

  if vqenvanter.FieldByName('sakl_ssure_var').AsString = '' then vqenvanter.FieldByName('sakl_ssure_var').AsString := 'SAKLANMIYOR';
  if vqenvanter.FieldByName('sakl_ssure_var').AsString = 'SAKLANMIYOR' then
  begin
    vqenvanter.FieldByName('sakl_ssure_imha').AsString  := '';
    vqenvanter.FieldByName('sakl_ssure_tip').AsString   := '';
    vqenvanter.FieldByName('sakl_ssure_sure').AsInteger := 0;
  end
  else
  begin
    if vqenvanter.FieldByName('sakl_ssure_imha').AsString = '' then
    begin
      Amessage := 'Faaliyetin Dijital Saklama Ýmha Zamaný belirtilmemiþ. Lütfen kontrol ediniz.';
      Exit(false);
    end;
    if vqenvanter.FieldByName('sakl_ssure_tip').AsString = '' then
    begin
      Amessage := 'Faaliyetin Dijital Saklama Süresi belirtilmemiþ. Lütfen kontrol ediniz.';
      Exit(false);
    end;
    if vqenvanter.FieldByName('sakl_ssure_sure').AsInteger < 1 then
    begin
      Amessage := 'Faaliyetin Dijital Saklama Süresi "0" dan büyük olmalýdýr. Lütfen kontrol ediniz.';
      Exit;
    end;
  end;

  if vqenvanter.FieldByName('sakl_ssure_var').AsString = 'SAKLANMIYOR' then
  begin
    vqenvanter.FieldByName('sakl_ssure').AsString := '';
  end
  else
  begin
    if vqenvanter.FieldByName('sakl_ssure_imha').AsString = 'BAÞLANGIÇ' then
      vqenvanter.FieldByName('sakl_ssure').AsString := vqenvanter.FieldByName('sakl_ssure_sure').AsString + ' ' + vqenvanter.FieldByName('sakl_ssure_tip').AsString
    else
      vqenvanter.FieldByName('sakl_ssure').AsString := 'DÝÐER (FAALÝYET SÜRESÝ + ' + vqenvanter.FieldByName('sakl_ssure_sure').AsString + ' ' + vqenvanter.FieldByName('sakl_ssure_tip').AsString + ')';
  end;
end;

procedure TfrmVeriTipiAnalizIslemleri.btnposClick(Sender: TObject);
var
 oldVeriTipiMasterSource,
 oldamacMasterSource ,
 oldmetodMasterSource ,
 oldtaraMasterSource  : TDataSource;
 oldVeriTipiID, oldAmacID, oldMetodID, oldTarafID: Variant;
 lmessage : string;
 main_id : integer;
begin
// Doðan virtial query eklemek için mastersource kaldýrýlacak
  if edDept.Text = '' then
  begin
    MessageDlg('Departman Seçilmemiþ Lütfen Kontrol ediniz.',mtConfirmation,[mbOK]);
    pnl1giris.Collapsed := false;
    edDept.SetFocus;
    exit;
  end;
    if edSurec.Text = '' then
  begin
    MessageDlg('Süreç Seçilmemiþ Lütfen Kontrol ediniz.',mtConfirmation,[mbOK]);
    pnl1giris.Collapsed := false;
    edSurec.SetFocus;
    exit;
  end;
  if edKisi.Text ='' then
  begin
    MessageDlg('Ýlgili Kiþi Seçilmemiþ Lütfen Kontrol ediniz.',mtConfirmation,[mbOK]);
    pnl1giris.Collapsed := false;
    edKisi.SetFocus;
    exit;
  end;


  oldVeriTipiMasterSource := vqveritipi.MasterSource;
  oldVeriTipiID := vqveritipi.FieldByName('ID').AsVariant;
  vqveritipi.MasterSource := nil;

  vqkaynaksource.Close;
  vqkaynaksource.Open;


  if vqkaynaksource.IsEmpty then
  begin
    MessageDlg('Kaynak Seçilmemiþ Lütfen Kaynak Seçiniz',mtConfirmation,[mbOK]);
    pnl2kaynak.Collapsed := false;
    vqveritipi.MasterSource := oldVeriTipiMasterSource ;
    vqveritipi.Locate('ID', oldVeriTipiID, []);
    exit;
  end;
//   vqtmp.SourceDataSets.Clear;
//   vqtmp.SourceDataSets.Add(vqenvanter);
//   vqtmp.SQL.Text := 'select * from vqenvanter where "select"=''T'' ';
//   vqtmp.Open;
//   if vqtmp.IsEmpty then
//   begin
//    MessageDlg('Kaynak Seçilmemiþ Lütfen Kaynak Seçiniz',mtConfirmation,[mbOK]);
//    exit;
//   end;




  vqamac.Filtered := false;
  vqmetod.Filtered := false;
  vqtaraf.Filtered := false;


  if not qEnvenAdd.Active then qEnvenAdd.Open;
  vqkaynaksource.First;
  QueryOpen(qchecklistadd, 'SELECT * FROM data_checklist WHERE id = 0');
try

    while not vqkaynaksource.Eof do
    begin
      vquery.Close;
      vquery.ParamByName('kaynakId').AsInteger := vqkaynaksource.FieldByName('id').AsInteger;
      vquery.Open;
      if vquery.RecordCount = 0 then
          begin
            MessageDlg('Envanter Formunu kaydedebilmek için Veri Kaynaðý içerisinde en az 1 tane Veri Tipi olmalýdýr. Lütfen kontrol ediniz.', mtError, [mbOk]);
            vqveritipi.MasterSource := oldVeriTipiMasterSource ;
            vqveritipi.Locate('ID', oldVeriTipiID, []);
            Exit;
          end;

          QueryOpen(qTmp,' select * from data_envanter where '+
              ' mc_id = '+IntToStr(mainmod.MCID)+' and main_id=0 '+
              ' and dept_id=' + vqEnvanter.FieldByName('dept_id').AsString  +
              ' and surec_id=' + vqEnvanter.FieldByName('surec_id').AsString  +
              ' and kaynak_id =' + vqkaynaksource.FieldByName('id').AsString +
              ' and kisi_id =' + vqEnvanter.FieldByName('kisi_id').AsString  );
          if qTmp.RecordCount > 0 then
           begin
             ShowMessageN('Ayný departman, kaynak, sureç ve kiþiye ait  kayýt var. '+ #13#10+ ' iþleminiz iptal ediliyor ') ;
              vqveritipi.MasterSource := oldVeriTipiMasterSource ;
              vqveritipi.Locate('ID', oldVeriTipiID, []);
             exit;
           end;

           if not VeriKontrol(lmessage) then
            begin
              MessageDlg(lmessage, mtError, [mbOk]);
              vqveritipi.MasterSource := oldVeriTipiMasterSource ;
              vqveritipi.Locate('ID', oldVeriTipiID, []);
              Exit;
           end;

         vquery.First;
         // Doðan Akçay
         // ilk kayýt main olacak ve main_id 0 veri tipi ve kategori boþ olcak
         // diðer kayýtlar toplama,saklama ve paylasma ids ler boþ olacak main_id ilk kayýt olacak
          main_id := 0; // ilk eðer için atama yapýyorum
         while not vquery.Eof do
         begin

            qEnvenAdd.Append;

            qEnvenAdd.FieldByName('id').AsInteger           := MainMod.GetSeq('sq_data_envanter_id');
            qEnvenAdd.FieldByName('main_id').AsInteger      :=  main_id;  //qEnvanter.FieldByName('id').AsInteger;  kontrol et
            qEnvenAdd.FieldByName('mc_id').AsInteger        := MainMod.MCID;

            qEnvenAdd.FieldByName('active').AsString        := vqEnvanter.FieldByName('active').AsString;
            qEnvenAdd.FieldByName('idy').AsInteger          := MainMod.LoginInfo.ID;
            qEnvenAdd.FieldByName('idt').AsDateTime         := Now;
            qEnvenAdd.FieldByName('sdy').AsInteger          := MainMod.LoginInfo.ID;
            qEnvenAdd.FieldByName('sdt').AsDateTime         := Now;
            qEnvenAdd.FieldByName('tarih').AsDateTime       := now;//Default deðer
            qEnvenAdd.FieldByName('dept_id').AsInteger      := vqEnvanter.FieldByName('dept_id').AsInteger;
            qEnvenAdd.FieldByName('surec_id').AsInteger     := vqEnvanter.FieldByName('surec_id').AsInteger;
            qEnvenAdd.FieldByName('kisi_id').AsInteger      := vqEnvanter.FieldByName('kisi_id').AsInteger;

            qEnvenAdd.FieldByName('kaynak_id').AsInteger    := vquery.FieldByName('kaynakId').AsInteger;
            if main_id = 0 then
            begin
            qEnvenAdd.FieldByName('veritipi_id').Clear;;
            qEnvenAdd.FieldByName('kategori_id').Clear;
             if (vquery.FieldByName('dayanak').AsString <>'') or (vquery.FieldByName('tedbir').AsString <> '') then
             begin
                QueryOpen(qTmp, 'SELECT COUNT(id) FROM data_checklist WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) +
                          ' AND kaynak_id = ' + vquery.FieldByName('kaynakId').AsString +
                          ' AND kisi_id = ' + vqEnvanter.FieldByName('kisi_id').AsString);
                if qTmp.Fields[0].AsInteger > 0 then
                  begin
                    MessageDlg('Seçmiþ olduðunuz "Veri Kaynaðý-Veri Sorumlusu Kiþi" bilgileri için mevcut bir kontrol kaydý var. ' +
                               'Her veri ikilisi için sadece 1 tane kontrol kaydý oluþturabilirsiniz. Kontrol Formu Oluþturulmayacaktýr.', mtError, [mbOk]);
                  end else
                  begin

                    qchecklistadd.Insert;
                    qchecklistadd.FieldByName('active').AsString     := 'E';
                    qchecklistadd.FieldByName('tarih').AsDateTime := now;
                    qchecklistadd.FieldByName('kaynak_id').AsInteger := vquery.FieldByName('kaynakId').AsInteger;
                    qchecklistadd.FieldByName('kisi_id').AsInteger   := vqEnvanter.FieldByName('kisi_id').AsInteger;
                    qchecklistadd.FieldByName('kilitli').AsString    := 'H';
                    qchecklistadd.FieldByName('kontrol_id').AsInteger := qKontrol.FieldByName('id').AsInteger;
                    qchecklistadd.FieldByName('tedbir_ids').AsString  := vquery.FieldByName('tedbir').AsString;
                    qchecklistadd.FieldByName('dayanak_ids').AsString := vquery.FieldByName('dayanak').AsString;
      //              qchecklistadd.FieldByName('dokuman_ids').AsString := ListToStr(tblDocs);
      //              qchecklistadd.FieldByName('ekipman_ids').AsString := ListToStr(tblEkipman);
      //              qchecklistadd.FieldByName('sorumlu_ids').AsString := ListToStr(tblDepts);
                    qchecklistadd.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_data_checklist_id');
                    qchecklistadd.FieldByName('mc_id').AsInteger  := MainMod.MCID;
                    qchecklistadd.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
                    qchecklistadd.FieldByName('idt').AsDateTime   := Now;
                    qchecklistadd.Post;
                  end;
             end;

            end else
            begin
            qEnvenAdd.FieldByName('veritipi_id').AsInteger  := vquery.FieldByName('veritipiId').AsInteger;
            qEnvenAdd.FieldByName('kategori_id').AsInteger  := vquery.FieldByName('kategoriId').AsInteger;
            end;
            qEnvenAdd.FieldByName('nitelik').AsString       := vquery.FieldByName('nitelik').AsString;


        //    qEnvenAdd.FieldByName('sakl_sanalonlem').AsString     := vqEnvanter.FieldByName('sakl_sanalonlem').AsString;
        //    qEnvenAdd.FieldByName('sakl_fizikselonlem').AsString  := vqEnvanter.FieldByName('sakl_fizikselonlem').AsString;
            qEnvenAdd.FieldByName('payl_sozlesme').AsString       := vqEnvanter.FieldByName('payl_sozlesme').AsString;
        //    qEnvenAdd.FieldByName('payl_sozisim').AsString        := vqEnvanter.FieldByName('payl_sozisim').AsString;
        //    qEnvenAdd.FieldByName('payl_sozmadde').AsString       := vqEnvanter.FieldByName('payl_sozmadde').AsString;
            qEnvenAdd.FieldByName('dgr_politika').AsString        := vqEnvanter.FieldByName('dgr_politika').AsString;
        //    qEnvenAdd.FieldByName('dgr_polisim').AsString         := vqEnvanter.FieldByName('dgr_polisim').AsString;
        //    qEnvenAdd.FieldByName('dgr_polmadde').AsString        := vqEnvanter.FieldByName('dgr_polmadde').AsString;
            qEnvenAdd.FieldByName('dgr_sozlesme').AsString        := vqEnvanter.FieldByName('dgr_sozlesme').AsString;
        //    qEnvenAdd.FieldByName('dgr_sozisim').AsString         := vqEnvanter.FieldByName('dgr_sozisim').AsString;
        //    qEnvenAdd.FieldByName('dgr_sozmadde').AsString        := vqEnvanter.FieldByName('dgr_sozmadde').AsString;
        //    qEnvenAdd.FieldByName('dgr_dayanak_ids').AsString     := vqEnvanter.FieldByName('dgr_dayanak_ids').AsString;
        //    qEnvenAdd.FieldByName('dgr_dokuman_ids').AsString     := vqEnvanter.FieldByName('dgr_dokuman_ids').AsString;
        // topl_amac_ids,sakl_metod_ids,sakl_amac_ids,payl_amac_ids,payl_metod_ids,topl_metod_ids

              qEnvenAdd.FieldByName('payl_taraftipi').AsString      := vqEnvanter.FieldByName('payl_taraftipi').AsString;
              qEnvenAdd.FieldByName('sakl_ssure_tip').AsString      := vqEnvanter.FieldByName('sakl_ssure_tip').AsString;
              qEnvenAdd.FieldByName('sakl_fsure_tip').AsString      := vqEnvanter.FieldByName('sakl_fsure_tip').AsString;
              qEnvenAdd.FieldByName('sakl_ssure_sure').AsInteger    := vqEnvanter.FieldByName('sakl_ssure_sure').AsInteger;
              qEnvenAdd.FieldByName('sakl_fsure_sure').AsInteger    := vqEnvanter.FieldByName('sakl_fsure_sure').AsInteger;
              qEnvenAdd.FieldByName('sakl_ssure_diger').AsString    := vqEnvanter.FieldByName('sakl_ssure_diger').AsString;
              qEnvenAdd.FieldByName('sakl_fsure_diger').AsString    := vqEnvanter.FieldByName('sakl_fsure_diger').AsString;
              qEnvenAdd.FieldByName('sakl_ssure_imha').AsString     := vqEnvanter.FieldByName('sakl_ssure_imha').AsString;
              qEnvenAdd.FieldByName('sakl_fsure_imha').AsString     := vqEnvanter.FieldByName('sakl_fsure_imha').AsString;
              qEnvenAdd.FieldByName('sakl_ssure_var').AsString      := vqEnvanter.FieldByName('sakl_ssure_var').AsString;
              qEnvenAdd.FieldByName('sakl_fsure_var').AsString      := vqEnvanter.FieldByName('sakl_fsure_var').AsString;
              qEnvenAdd.FieldByName('sakl_ssure').AsString          := vqEnvanter.FieldByName('sakl_ssure').AsString;
              qEnvenAdd.FieldByName('sakl_fsure').AsString          := vqEnvanter.FieldByName('sakl_fsure').AsString;
              if main_id=0 then
              begin
              //  qEnvenAdd.FieldByName('sakl_erisim_ids').AsString := vquery.FieldByName('').AsInteger;
                qEnvenAdd.FieldByName('topl_amac_ids').AsString   := vquery.FieldByName('AmactoplamaIds').asstring;
                qEnvenAdd.FieldByName('sakl_amac_ids').AsString   := vquery.FieldByName('AmacSaklamaIds').asstring;
                qEnvenAdd.FieldByName('payl_amac_ids').AsString   := vquery.FieldByName('AmacPaylasmaIds').asstring;
               // qEnvenAdd.FieldByName('dgr_dayanak_ids').AsString := vquery.FieldByName('').asstring;
               // qEnvenAdd.FieldByName('dgr_dokuman_ids').AsString := vquery.FieldByName('').asstring;
                qEnvenAdd.FieldByName('topl_metod_ids').AsString  := vquery.FieldByName('MetodtoplamaIds').asstring;
                qEnvenAdd.FieldByName('sakl_metod_ids').AsString  := vquery.FieldByName('MetodSaklamaIds').asstring;
                qEnvenAdd.FieldByName('payl_metod_ids').AsString  := vquery.FieldByName('MetodPaylasmaIds').asstring;

                qEnvenAdd.FieldByName('payl_taraf_ids').AsString  := vquery.FieldByName('taraf').asstring;
              end else
              begin
              //  qEnvenAdd.FieldByName('sakl_erisim_ids').Clear;
                qEnvenAdd.FieldByName('topl_amac_ids').Clear;
                qEnvenAdd.FieldByName('sakl_amac_ids').Clear;
                qEnvenAdd.FieldByName('payl_amac_ids').Clear;
               // qEnvenAdd.FieldByName('dgr_dayanak_ids').Clear;
               // qEnvenAdd.FieldByName('dgr_dokuman_ids').AsString := vquery.FieldByName('').asstring;
                qEnvenAdd.FieldByName('topl_metod_ids').Clear;
                qEnvenAdd.FieldByName('sakl_metod_ids').Clear;
                qEnvenAdd.FieldByName('payl_metod_ids').Clear;
                qEnvenAdd.FieldByName('payl_taraf_ids').Clear;
              end;
            qEnvenAdd.Post;
            if main_id=0 then // ilk kayýt iki kere kaydedilecek  biri main için diðeri alta veriler için
            begin
              main_id := qEnvenAdd.FieldByName('id').AsInteger;
              Continue;
            end;
          vquery.Next;
         end;

     vqkaynaksource.Next;
    end;


      try
        if not MainMod.DBMain.InTransaction then
            MainMod.DBMain.StartTransaction;
        qEnvenAdd.ApplyUpdates();
        qEnvenAdd.CommitUpdates;
        qchecklistadd.ApplyUpdates();
        qchecklistadd.CommitUpdates;
        MainMod.DBMain.Commit;
        MessageDlg('Envanter Kaydýnýz Oluþturuldu.',mtConfirmation,[mbOK]) ;
        vqveritipi.MasterSource := oldVeriTipiMasterSource ;
        vqveritipi.Locate('ID', oldVeriTipiID, []);
        KayitSonrasiIslem;
      except

        qEnvenAdd.CancelUpdates;
        qchecklistadd.CancelUpdates;
        if mainmod.DBMain.InTransaction then
          MainMod.DBMain.Rollback;
          MessageDlgn('Envanter Kaydýnýz Oluþturulurken bir hata oluþtu.',mtConfirmation,[mbOK]) ;
          vqveritipi.MasterSource := oldVeriTipiMasterSource ;
          vqveritipi.Locate('ID', oldVeriTipiID, []);
      //  MessageDlg('Envanter Kaydýnýz Oluþturulurken bir hata oluþtu.',mtConfirmation,[mbOK]) ;
      end;
    // doðan akçay mastersource tekrar baðlanýp son seçili kayýtlar seçiliyor

finally
    vqveritipi.MasterSource := oldVeriTipiMasterSource ;
    vqveritipi.Locate('ID', oldVeriTipiID, []);
end;


  //Formclose;
end;

procedure TfrmVeriTipiAnalizIslemleri.TogglePanel(UniPanel: TUniPanel);
begin
 if UniPanel.Collapsed then
    UniSession.AddJS(UniPanel.JSName + '.expand();')
  else
    UniSession.AddJS(UniPanel.JSName + '.collapse();');
end;

procedure TfrmVeriTipiAnalizIslemleri.grdtedbirColumnFilter(Sender: TUniDBGrid;
  const Column: TUniDBGridColumn; const Value: Variant);
var
  filtrestring : string;
begin
 if not vqtedbir.Active then   exit;
  if (fedtedbir.Text <> '') and (Length(fedtedbir.Text)>2) then
  begin
    if filtrestring <>'' then
      filtrestring := filtrestring  + ' and ';
    filtrestring := filtrestring + ' tedbir LIKE ''%' +tr_upper(fedtedbir.Text)+ '%''';
  end;

  if fchtedbirselect.ItemIndex <> 0 then
  begin
   if filtrestring <>'' then
      filtrestring := filtrestring + ' and ';
    if fchtedbirselect.ItemIndex = 1 then
       filtrestring := filtrestring + 'select =' +QuotedStr('T')
    else
       filtrestring := filtrestring + 'select =' +QuotedStr('F');
  end;

  if filtrestring <>'' then
  begin

    vqtedbir.Filtered := False;
    vqtedbir.FilterOptions := [foCaseInsensitive];
    vqtedbir.Filter :=  filtrestring; //'kaynak LIKE ''%' +fedkaynak.Text+ '%''';
    vqtedbir.Filtered := True;
  end else
  vqtedbir.Filtered := false;
end;

procedure TfrmVeriTipiAnalizIslemleri.grdtedbirColumnSort(
  Column: TUniDBGridColumn; Direction: Boolean);
 var
  Dir : string;
begin
  if not Column.Sortable then   exit;
  if Direction then  dir := ' ASC ' else dir := 'DESC' ;
  vqtedbir.IndexFieldNames := ' "' + Column.FieldName +'" ' + dir;
end;

procedure TfrmVeriTipiAnalizIslemleri.KayitSonrasiIslem;
begin

  vqenvanter.Clear;
  vqkaynak.Clear;
  vqveritipi.Clear;
  vqamac.Clear;
  vqmetod.Clear;
  vqtaraf.clear;
  vqdayanak.Clear;
  vqtedbir.Clear;
  NewSQL;
  EnvanterDefaulDegerDoldur;
  pnl1giris.Collapsed := false;
  FilterClear;
  pnl2kaynak.Title := 'KAYNAKLAR';
  pnl3amac.Title := 'AMAÇLAR';
  pnl4metod.Title := 'METOTLAR';
  pnl5taraf.Title := 'PAYLAÞILAN TARAFLAR';
  pnldayanak.Title := 'DAYANAKLAR';
  pnltedbir.Title := 'TEDBÝRLER';

end;

procedure TfrmVeriTipiAnalizIslemleri.FilterClear;
var
i :integer;
component : TComponent;
begin
for i := 0 to UniHiddenPanel1.ControlCount - 1 do
  begin
    Component := UniHiddenPanel1.Controls[i];
    // Eðer bileþen TUniEdit ise Text özelliðini boþalt
    if Component is TUniEdit then
      (Component as TUniEdit).Text := '';
    // Eðer bileþen TUniComboBox ise ItemIndex özelliðini -1 yap
    if Component is TUniComboBox then
      (Component as TUniComboBox).ItemIndex := -1;
  end;
  // kaynak
  vqkaynak.Filter := '';
  vqkaynak.Filtered := false;
  // veritipi
  vqveritipi.Filter := '';
  vqveritipi.Filtered := false;
  //amaç
  vqamac.Filter := '' ;
  vqamac.Filtered := false;

  //metod
  vqmetod.Filter := '' ;
  vqmetod.Filtered := false;
  //paylasýlan taraf
  vqtaraf.Filter := '';
  vqtaraf.Filtered := false;
  // dayanak
  vqdayanak.Filter := '';
  vqdayanak.Filtered := false;
  // tedbir
  vqtedbir.Filter := '';
  vqtedbir.Filtered := false;


end;

procedure TfrmVeriTipiAnalizIslemleri.Formclose;
begin
  if Assigned(Parent) and (Parent is TUniTabSheet) then
    (Parent as TUniTabSheet).Close;
end;
procedure TfrmVeriTipiAnalizIslemleri.btnaddDayanakClick(Sender: TObject);
begin
  if not MainMod.LoginInfo.Yetkiler[61] then
  begin
    MessageDlg('Dayanak tanýmý eklemeye yetkili deðilsiniz.', mtError, [mbOk]);
    Exit;
  end;
   vqtmp.Close;
  if frmKVKKDayanakTanim.Exec(0, 0) = mrOk then
  begin
  try
    RefreshQuery(qDayanak);
    vqtmp.SourceDataSets.Clear;
    vqtmp.SourceDataSets.Add(vqdayanak);
    vqtmp.SourceDataSets.Add(qdayanak);
    vqtmp.SQL.Text := 'select * from qdayanak where id not in (select id from vqdayanak)';
    vqtmp.Open;
    VtTabloDoldur(vqdayanak,vqtmp,['select'],['F'],false);
  except
    try
     RefreshQuery(qdayanak) ;
     VtTabloDoldur(vqdayanak,qdayanak,['select'],['F'],true) ;
    except
     ShowMessageN('Veriler Yenilenemedi. Formu Yenileyiniz.');
    end;
  end;
  end;
end;

procedure TfrmVeriTipiAnalizIslemleri.btnaddtedbirClick(Sender: TObject);
begin
//  if mainmod.LoginInfo.Yetkiler[65] then
//  begin
//    MessageDlg('Tedbir tanýmý eklemeye yetkili deðilsiniz.', mtError, [mbOk]);
//    Exit;
//  end;
   vqtmp.Close;
  if frmKVKKTedbirTanim.Exec(0, 0) = mrOk then
  begin
   try
    RefreshQuery(qTedbir);
    vqtmp.SourceDataSets.Clear;
    vqtmp.SourceDataSets.Add(vqTedbir);
    vqtmp.SourceDataSets.Add(qTedbir);
    vqtmp.SQL.Text := 'select * from qTedbir where id not in (select id from vqTedbir)';
    vqtmp.Open;
    VtTabloDoldur(vqTedbir,vqtmp,['select'],['F'],false);
   except
    try
     RefreshQuery(qTedbir) ;
     VtTabloDoldur(vqTedbir,qTedbir,['select'],['F'],true) ;
    except
     ShowMessageN('Veriler Yenilenemedi. Formu Yenileyiniz.');
    end;
   end;
  end;
end;

procedure TfrmVeriTipiAnalizIslemleri.UniFrameCreate(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrmVeriTipiAnalizIslemleri.rgtaraftipiClick(Sender: TObject);
begin
if vqenvanter.IsEmpty then exit;

if not ( vqenvanter.State in [dsEdit,dsInsert]) then vqenvanter.Edit;

if rgtaraftipi.ItemIndex > -1 then
  case rgtaraftipi.ItemIndex of
    0: vqenvanter.FieldByName('payl_taraftipi').AsString := 'YURT ÝÇÝ' ;
    1: vqenvanter.FieldByName('payl_taraftipi').AsString := 'YURT DIÞI' ;
    2: vqenvanter.FieldByName('payl_taraftipi').AsString := 'Y.ÝÇÝ/Y.DIÞI' ;
    3: vqenvanter.FieldByName('payl_taraftipi').AsString := 'PAYLAÞILMIYOR' ;
  end;
end;

procedure TfrmVeriTipiAnalizIslemleri.AmaclarReadonlySetting;
begin
   grdamac.ColumnByName('selectToplama').ReadOnly := vqamac.FieldByName('Toplama').AsString <>'E' ;
   grdamac.ColumnByName('selectSaklama').ReadOnly := vqamac.FieldByName('Saklama').AsString <>'E' ;
   grdamac.ColumnByName('selectpaylasma').ReadOnly := vqamac.FieldByName('Paylasma').AsString <>'E' ;
end;

procedure TfrmVeriTipiAnalizIslemleri.vqamacAfterScroll(DataSet: TDataSet);
begin
//AmaclarReadonlySetting ;
end;

procedure TfrmVeriTipiAnalizIslemleri.vqamacBeforePost(DataSet: TDataSet);
begin

   if (vqamac.FieldByName('Toplama').AsString <>'E') and (vqamac.FieldByName('SelectToplama').AsString = 'T') then
    vqamac.FieldByName('SelectToplama').AsString := 'F';
   if (vqamac.FieldByName('Saklama').AsString <>'E') and (vqamac.FieldByName('SelectSaklama').AsString = 'T') then
     vqamac.FieldByName('SelectSaklama').AsString := 'F';
   if (vqamac.FieldByName('Paylasma').AsString <>'E') and (vqamac.FieldByName('SelectPaylasma').AsString = 'T') then
   vqamac.FieldByName('SelectPaylasma').AsString := 'F'   ;

end;

procedure TfrmVeriTipiAnalizIslemleri.vqkaynakAfterPost(DataSet: TDataSet);
var
  NewValue: string;
begin
  if not postKontrol then  exit;
//
  NewValue := DataSet.FieldByName('select').AsString;
  if FkaynakSelectoldvalue <> NewValue then
  begin
    if NewValue = 'T' then
    begin
    //veritipi
      VtTabloDoldur(vqveritipi,qveritipi,['kaynakId','select'],[vqkaynak.FieldByName('id').AsString,'F'],false) ;
      vqveritipi.First;

    end
    else if NewValue = 'F' then
    begin
    //veritipi
      vttabloKayitSil(vqveritipi,['kaynakId'],[vqkaynak.FieldByName('id').AsString]);

    end;
  end;
end;

procedure TfrmVeriTipiAnalizIslemleri.vqkaynakBeforePost(DataSet: TDataSet);
begin
  if not postKontrol then  exit;
  fkaynakSelectoldvalue := DataSet.FieldByName('select').OldValue;
end;

procedure TfrmVeriTipiAnalizIslemleri.vqmetodBeforePost(DataSet: TDataSet);
begin
   if (vqmetod.FieldByName('Toplama').AsString <>'E') and (vqmetod.FieldByName('SelectToplama').AsString = 'T') then
    vqmetod.FieldByName('SelectToplama').AsString := 'F';
   if (vqmetod.FieldByName('Saklama').AsString <>'E') and (vqmetod.FieldByName('SelectSaklama').AsString = 'T') then
     vqmetod.FieldByName('SelectSaklama').AsString := 'F';
   if (vqmetod.FieldByName('Paylasma').AsString <>'E') and (vqmetod.FieldByName('SelectPaylasma').AsString = 'T') then
   vqmetod.FieldByName('SelectPaylasma').AsString := 'F'   ;
end;

procedure TfrmVeriTipiAnalizIslemleri.vqveritipiBeforePost(DataSet: TDataSet);
begin
 // FVeritipiSelectoldvalue := DataSet.FieldByName('select').OldValue;
end;

initialization
  RegisterClass(TfrmVeriTipiAnalizIslemleri);
end.
