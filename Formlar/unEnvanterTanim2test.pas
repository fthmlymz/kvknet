unit unEnvanterTanim2test;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniButton, uniBitBtn, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox, uniCheckBox, uniDBCheckBox, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses, Data.DB,
  MemDS, DBAccess, Uni, uniDateTimePicker, uniDBDateTimePicker, uniPageControl, uniBasicGrid, uniDBGrid,
  uniMemo, uniDBMemo, VirtualTable, uniGroupBox, math,strutils, VirtualQuery,
  uniRadioGroup;


type
 TstateType = (stInsert,stedit,stcopy);
  TfrmEnvanterTanim2test = class(TUniForm)
    pnlData: TUniPanel;
    pnlButtons: TUniPanel;
    btnCancel: TUniBitBtn;
    btnPost: TUniBitBtn;
    qTmp: TUniQuery;
    PgControl: TUniPageControl;
    pgTemel: TUniTabSheet;
    pgHukuk: TUniTabSheet;
    UniLabel3: TUniLabel;
    edActive: TUniDBCheckBox;
    UniLabel1: TUniLabel;
    edTarih: TUniDBDateTimePicker;
    UniLabel9: TUniLabel;
    edDept: TUniDBLookupComboBox;
    UniLabel2: TUniLabel;
    edSurec: TUniDBLookupComboBox;
    UniLabel8: TUniLabel;
    edKaynak: TUniDBLookupComboBox;
    edNitelik: TUniDBCheckBox;
    grdHkkDayanak: TUniDBGrid;
    UniLabel25: TUniLabel;
    UniDBMemo10: TUniDBMemo;
    UniLabel26: TUniLabel;
    UniDBMemo11: TUniDBMemo;
    UniLabel27: TUniLabel;
    UniDBMemo12: TUniDBMemo;
    UniLabel4: TUniLabel;
    lbIDY: TUniLabel;
    UniLabel5: TUniLabel;
    lbIDT: TUniLabel;
    UniLabel6: TUniLabel;
    lbSDY: TUniLabel;
    UniLabel7: TUniLabel;
    lbSDT: TUniLabel;
    UniLabel37: TUniLabel;
    edOnem: TUniDBLookupComboBox;
    qSurec: TUniQuery;
    dsSurec: TUniDataSource;
    qDept: TUniQuery;
    dsDept: TUniDataSource;
    qKaynak: TUniQuery;
    dsKaynak: TUniDataSource;
    qOnem: TUniQuery;
    dsOnem: TUniDataSource;
    qEnvanter: TUniQuery;
    dsEnvanter: TUniDataSource;
    pgDDayanak: TUniTabSheet;
    grdDgrDayanak: TUniDBGrid;
    btnDgrDayanakAdd: TUniBitBtn;
    btnDgrDayanakDel: TUniBitBtn;
    grdHkkDocs: TUniDBGrid;
    grdDgrDocs: TUniDBGrid;
    btnDgrDocsAdd: TUniBitBtn;
    btnDgrDocsDel: TUniBitBtn;
    UniLabel38: TUniLabel;
    qCheckList: TUniQuery;
    dsCheckList: TUniDataSource;
    btnDgrDayanakNew: TUniBitBtn;
    btnDgrDocsNew: TUniBitBtn;
    UniLabel12: TUniLabel;
    qKisi: TUniQuery;
    dsKisi: TUniDataSource;
    UniLabel23: TUniLabel;
    edKisi: TUniDBLookupComboBox;
    btnHelp: TUniBitBtn;
    pgDetay: TUniTabSheet;
    qEnvDet: TUniQuery;
    pgdetaycontrol: TUniPageControl;
    pgTopl_Amac: TUniTabSheet;
    pgTopl_Metod: TUniTabSheet;
    pgPayl_Amac: TUniTabSheet;
    pgPayl_Metod: TUniTabSheet;
    pgSakl_Amac: TUniTabSheet;
    grdAmacTop: TUniDBGrid;
    btnAmacTopAdd: TUniBitBtn;
    btnAmacTopDel: TUniBitBtn;
    btnAmacTopNew: TUniBitBtn;
    grdAmacTopD: TUniDBGrid;
    grpFSaklama: TUniGroupBox;
    UniLabel39: TUniLabel;
    edFImha: TUniDBComboBox;
    UniLabel41: TUniLabel;
    edFSure: TUniDBNumberEdit;
    edFSureTip: TUniDBComboBox;
    UniLabel13: TUniLabel;
    edFSureVar: TUniDBComboBox;
    grpSSaklama: TUniGroupBox;
    edSSureTip: TUniDBComboBox;
    edSSure: TUniDBNumberEdit;
    UniLabel40: TUniLabel;
    edSImha: TUniDBComboBox;
    UniLabel42: TUniLabel;
    UniLabel19: TUniLabel;
    edSSureVar: TUniDBComboBox;
    grdMetodTop: TUniDBGrid;
    btnMetodTopAdd: TUniBitBtn;
    btnMetodTopDel: TUniBitBtn;
    btnMetodTopNew: TUniBitBtn;
    grdMetodTopD: TUniDBGrid;
    grdAmacPay: TUniDBGrid;
    btnAmacPayAdd: TUniBitBtn;
    btnAmacPayDel: TUniBitBtn;
    btnAmacPayNew: TUniBitBtn;
    grdAmacPayD: TUniDBGrid;
    grdMetodPay: TUniDBGrid;
    btnMetodPayAdd: TUniBitBtn;
    btnMetodPayDel: TUniBitBtn;
    btnMetodPayNew: TUniBitBtn;
    grdMetodPayD: TUniDBGrid;
    pgSakl_Metod: TUniTabSheet;
    pgSakl_Erisim: TUniTabSheet;
    pgPayl_Taraf: TUniTabSheet;
    grdAmacSak: TUniDBGrid;
    btnAmacSakAdd: TUniBitBtn;
    btnAmacSakDel: TUniBitBtn;
    btnAmacSakNew: TUniBitBtn;
    grdAmacSakD: TUniDBGrid;
    grdMetodSak: TUniDBGrid;
    btnMetodSakAdd: TUniBitBtn;
    btnMetodSakDel: TUniBitBtn;
    btnMetodSakNew: TUniBitBtn;
    grdMetodSakD: TUniDBGrid;
    grdDepts: TUniDBGrid;
    btnDeptsAdd: TUniBitBtn;
    btnDeptsDel: TUniBitBtn;
    btnDeptsNew: TUniBitBtn;
    grdDeptsD: TUniDBGrid;
    grdTaraf: TUniDBGrid;
    btnTarafAdd: TUniBitBtn;
    btnTarafDel: TUniBitBtn;
    btnTarafNew: TUniBitBtn;
    grdTarafD: TUniDBGrid;
    UniLabel31: TUniLabel;
    edTarafTipi: TUniDBComboBox;
    pgOnlemler: TUniTabSheet;
    UniLabel34: TUniLabel;
    UniDBMemo16: TUniDBMemo;
    UniLabel35: TUniLabel;
    UniDBMemo17: TUniDBMemo;
    UniLabel36: TUniLabel;
    UniDBMemo18: TUniDBMemo;
    UniLabel20: TUniLabel;
    UniDBMemo7: TUniDBMemo;
    UniLabel24: TUniLabel;
    UniDBMemo9: TUniDBMemo;
    UniPanel1: TUniPanel;
    grdVeriTipi: TUniDBGrid;
    UniPanel2: TUniPanel;
    btnEnvDetAdd: TUniBitBtn;
    btnEnvDetDel: TUniBitBtn;
    UniLabel10: TUniLabel;
    chbKategori: TUniCheckBox;
    vqenvanter: TVirtualTable;
    VqEnvDet: TVirtualTable;
    vtmp1: TVirtualTable;
    vqtmp: TVirtualQuery;
    qtmp2: TUniQuery;
    lbactive: TUniLabel;
    rgVeritipi: TUniRadioGroup;
    rgmetodvt: TUniRadioGroup;
    pnlmetodvt: TUniPanel;
    pnlamacvs: TUniPanel;
    rgamacvs: TUniRadioGroup;
    pnlmetodvs: TUniPanel;
    rgmetodvs: TUniRadioGroup;
    pnveriErisim: TUniPanel;
    rgveriErisim: TUniRadioGroup;
    pnlamacvp: TUniPanel;
    rgamacvp: TUniRadioGroup;
    pnlmetodvp: TUniPanel;
    rgmetodvp: TUniRadioGroup;
    pnlpaylasilanTaraf: TUniPanel;
    rgPaylasilanTaraf: TUniRadioGroup;
    pnlamacvt: TUniPanel;
    rgamacvt: TUniRadioGroup;
    pnlhkkdayanak: TUniPanel;
    pnlhkkdayanakdoc: TUniPanel;
    pnldgrdayanak: TUniPanel;
    rgdgrDayanak: TUniRadioGroup;
    pnldgrdoc: TUniPanel;
    rgdgrdoc: TUniRadioGroup;
    pnlMsg: TUniPanel;
    UniLabel11: TUniLabel;
    UniLabel58: TUniLabel;
    dstamac: TUniDataSource;
    qtamaclar: TUniQuery;
    qtmetodlar: TUniQuery;
    dstmetod: TUniDataSource;
    dssamac: TUniDataSource;
    dspamac: TUniDataSource;
    dssmetod: TUniDataSource;
    dspmetod: TUniDataSource;
    qdepartmanlar: TUniQuery;
    dserisim: TUniDataSource;
    qtaraflar: TUniQuery;
    dstaraf: TUniDataSource;
    qdgrdayanaklar: TUniQuery;
    dsdgrdayanak: TUniDataSource;
    qdgrdokumanlar: TUniQuery;
    dsdokumanlar: TUniDataSource;
    dshkkdayanak: TUniDataSource;
    dshkkdokuman: TUniDataSource;
    qsamaclar: TUniQuery;
    qpamaclar: TUniQuery;
    qsmetodlar: TUniQuery;
    qpmetodlar: TUniQuery;
    qhkkdokumanlar: TUniQuery;
    qhkkdayanaklar: TUniQuery;
    dsEnvDet: TUniDataSource;
    qdetail: TUniQuery;
    UniPanel3: TUniPanel;
    UniPanel4: TUniPanel;
    UniPanel5: TUniPanel;
    UniPanel6: TUniPanel;
    UniPanel7: TUniPanel;
    UniPanel8: TUniPanel;
    UniPanel9: TUniPanel;
    UniPanel10: TUniPanel;
    UniLabel21: TUniLabel;
    UniLabel43: TUniLabel;
    UniLabel46: TUniLabel;
    UniLabel47: TUniLabel;
    UniLabel49: TUniLabel;
    UniLabel51: TUniLabel;
    UniLabel53: TUniLabel;
    UniLabel55: TUniLabel;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAmacTopAddClick(Sender: TObject);
    procedure btnAmacTopDelClick(Sender: TObject);
    procedure btnAmacTopNewClick(Sender: TObject);
    procedure btnAmacSakAddClick(Sender: TObject);
    procedure btnAmacSakDelClick(Sender: TObject);
    procedure btnAmacSakNewClick(Sender: TObject);
    procedure btnAmacPayAddClick(Sender: TObject);
    procedure btnAmacPayDelClick(Sender: TObject);
    procedure btnAmacPayNewClick(Sender: TObject);
    procedure btnTarafAddClick(Sender: TObject);
    procedure btnTarafDelClick(Sender: TObject);
    procedure btnTarafNewClick(Sender: TObject);
    procedure btnMetodTopAddClick(Sender: TObject);
    procedure btnMetodTopDelClick(Sender: TObject);
    procedure btnMetodTopNewClick(Sender: TObject);
    procedure btnMetodSakAddClick(Sender: TObject);
    procedure btnMetodSakDelClick(Sender: TObject);
    procedure btnMetodSakNewClick(Sender: TObject);
    procedure btnMetodPayAddClick(Sender: TObject);
    procedure btnMetodPayDelClick(Sender: TObject);
    procedure btnMetodPayNewClick(Sender: TObject);
    procedure btnDeptsAddClick(Sender: TObject);
    procedure btnDeptsDelClick(Sender: TObject);
    procedure btnDeptsNewClick(Sender: TObject);
    procedure btnDgrDocsAddClick(Sender: TObject);
    procedure btnDgrDocsDelClick(Sender: TObject);
    procedure btnDgrDayanakAddClick(Sender: TObject);
    procedure btnDgrDayanakDelClick(Sender: TObject);
    procedure btnDgrDayanakNewClick(Sender: TObject);
    procedure chbKategoriClick(Sender: TObject);
    procedure edFSureVarChange(Sender: TObject);
    procedure btnEnvDetAddClick(Sender: TObject);
    procedure btnEnvDetDelClick(Sender: TObject);
    procedure grdVeriTipiDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure dsEnvanterStateChange(Sender: TObject);
    procedure dsEnvanterDataChange(Sender: TObject; Field: TField);
    procedure qEnvanterBeforePost(DataSet: TDataSet);
    procedure edKaynakChange(Sender: TObject);
    procedure PgControlChange(Sender: TObject);
    procedure pgdetaycontrolChange(Sender: TObject);
    procedure edSSureVarChange(Sender: TObject);
  private
    YardimKw : string;
    State : TstateType;
    DetailLoading : Boolean;
    DetailKilitli : Boolean;
    MultiChange : boolean;
    EnvCopy : boolean;
    Envids : string;
    procedure PrepareTables;
    procedure PrepareDetails;
    procedure StrToListDetails;

    procedure CloseTables;
    procedure ManageSettings;

    function CheckID(AID: Integer; ATable: TVirtualTable): Boolean;
    function CheckVTID(AID: Integer): Boolean;
    function ListToStr(ATable: TVirtualTable): String;
    function GetMainNitelik(Adataset: tdataset = nil): String;
    // Veri Tipi için prosedürler

    procedure DelVeriTipiControl(Sender: TComponent; Res: Integer);
    procedure DelDeptDControl(Sender: TComponent; Res: Integer);
    procedure DelAmacTopDControl(Sender: TComponent; Res: Integer);
    procedure DelAmacSakDControl(Sender: TComponent; Res: Integer);
    procedure DelAmacPayDControl(Sender: TComponent; Res: Integer);
    procedure DelTarafDControl(Sender: TComponent; Res: Integer);
    procedure DelMetodTopDControl(Sender: TComponent; Res: Integer);
    procedure DelMetodSakDControl(Sender: TComponent; Res: Integer);
    procedure DelMetodPayDControl(Sender: TComponent; Res: Integer);
    // Genel Kayýt için prosedürler

    procedure DelDeptControl(Sender: TComponent; Res: Integer);
    procedure DelAmacTopControl(Sender: TComponent; Res: Integer);
    procedure DelAmacSakControl(Sender: TComponent; Res: Integer);
    procedure DelAmacPayControl(Sender: TComponent; Res: Integer);
    procedure DelTarafControl(Sender: TComponent; Res: Integer);
    procedure DelMetodTopControl(Sender: TComponent; Res: Integer);
    procedure DelMetodSakControl(Sender: TComponent; Res: Integer);
    procedure DelMetodPayControl(Sender: TComponent; Res: Integer);
    procedure DelDgrDayanakControl(Sender: TComponent; Res: Integer);
    procedure DelDgrDocsControl(Sender: TComponent; Res: Integer);
    function DegerGetir(Aid : integer; Afield: string; Atable : Tdataset) : string;
    procedure PostMultiChange;
    function EnvanterVarmi(var Amsg: string): boolean;
    procedure KayitKopyala(Table: TDataSet; AYeniId: Integer; Afield : array of string; AfieldValue : array of string);
    function ValidateControl: boolean;
    function TimeValidateControl(Aquery: tdataset): boolean;
    procedure toplamaAmacGuncelle;
    procedure saklamaAmacGuncelle;
    procedure paylasmaAmacGuncelle;
    procedure ToplamaMetodGuncelle;
    procedure SaklamaMetodGuncelle;
    procedure PaylasmaMetodGuncelle;
    procedure DepartmanGuncelle;
    procedure PaylasimTarafGuncelle;
    procedure DgrDayanakGuncelle;
    procedure HKKDayanakGuncelle;
    procedure HKKDokumanGuncelle;
    procedure DgrDokumanGuncelle;
    procedure DetayGuncelle;
    function DelList(Aliste, item: string): string;
    function DegisiklikKontrol : boolean;
    procedure postMonoChange;
    procedure postCopy;
  public
    OldKisi_Id : integer;
    oldKaynak_Id : integer;
    changeActive : boolean;
    Kontrol_id : integer;
    envanter_id : integer;

    function Exec(AID, AOp, Kilitli: Integer): Integer;overload;
    function Exec(AIds:string):integer;overload;
    function copy(AId: integer): integer;

  end;

function frmEnvanterTanim2test: TfrmEnvanterTanim2test;

implementation

uses uniGUIApplication, MainModule, McMLib, unEnvanterListe2, unDepartmanSec, unDepartmanTanim,
  unKVKKVeriDokumanSec, unKVKKMetodSec, unKVKKMetodTanim, unKVKKDayanakSec, unKVKKDayanakTanim,
  unKVKKAmacSec, unKVKKAmacTanim, unKVKKTarafSec, unKVKKVeriTipiSec, unKVKKTarafTanim, unHelpPage;

{$R *.dfm}

function frmEnvanterTanim2test: TfrmEnvanterTanim2test;
begin
  Result := TfrmEnvanterTanim2test(MainMod.GetFormInstance(TfrmEnvanterTanim2test));
end;

procedure TfrmEnvanterTanim2test.btnCancelClick(Sender: TObject);
begin
  qEnvanter.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmEnvanterTanim2test.btnMetodSakAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID    : Integer;
  AName  : String;
  IDList : String;
begin
  IDList := vqenvanter.FieldByName('sakl_metod_ids').AsString ;
  frmKVKKMetodSec.GizliKriter := 'id NOT IN (' + ifthen(IDList<> '', IDList, '0' ) + ') AND saklama = ''E''';
  ACount := frmKVKKMetodSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKMetodSec.qMetod.GotoBookmark(frmKVKKMetodSec.grdList.SelectedRows[i]);
    AID   := frmKVKKMetodSec.qMetod.FieldByName('id').AsInteger;
    AName := frmKVKKMetodSec.qMetod.FieldByName('metod').AsString;
    if trim(IDList) <> '' then
      IDList := trim(IDList) + ',';
    IDList := trim(IDList) + inttostr(AID);
  end;
  vqenvanter.FieldByName('sakl_metod_ids').AsString := IDList;
  SaklamaMetodGuncelle;
end;

procedure TfrmEnvanterTanim2test.btnMetodPayAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID   : Integer;
  AName : String;
  IDList : String;
begin
  IDList := vqenvanter.FieldByName('payl_metod_ids').AsString ;
  frmKVKKMetodSec.GizliKriter := 'id NOT IN (' + ifthen(IDList<> '', IDList, '0' ) + ') AND paylasma = ''E''';
  ACount := frmKVKKMetodSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKMetodSec.qMetod.GotoBookmark(frmKVKKMetodSec.grdList.SelectedRows[i]);
    AID   := frmKVKKMetodSec.qMetod.FieldByName('id').AsInteger;
    AName := frmKVKKMetodSec.qMetod.FieldByName('metod').AsString;
    if trim(IDList) <> '' then
      IDList := Trim(IDList) + ',' ;
    IDList := Trim(IDList) + inttostr(AID);
  end;
   vqenvanter.FieldByName('payl_metod_ids').AsString :=  IDList;
   PaylasmaMetodGuncelle;
end;



procedure TfrmEnvanterTanim2test.btnMetodSakDelClick(Sender: TObject);
var
  NewList : string;
begin
  if qsmetodlar.RecordCount = 0 then exit;

  NewList := DelList(vqenvanter.FieldByName('sakl_metod_ids').AsString,
             qsmetodlar.FieldByName('id').AsString );
  vqenvanter.FieldByName('sakl_metod_ids').AsString := NewList;
  SaklamaMetodGuncelle;
end;



procedure TfrmEnvanterTanim2test.btnMetodPayDelClick(Sender: TObject);
var
  NewList : String;
begin
  if qpmetodlar.RecordCount = 0 then exit;

  NewList := DelList(vqenvanter.FieldByName('payl_metod_ids').AsString,
                  qpmetodlar.FieldByName('id').AsString);

  vqenvanter.FieldByName('payl_metod_ids').AsString  := NewList;
  PaylasmaMetodGuncelle;
end;

procedure TfrmEnvanterTanim2test.btnMetodSakNewClick(Sender: TObject);
begin
  frmKVKKMetodTanim.Exec(0, 0);
end;

procedure TfrmEnvanterTanim2test.btnMetodTopAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID    : Integer;
  AName  : String;
  IDList : String;
begin
  IDList := trim(vqenvanter.FieldByName('topl_metod_ids').AsString);
  frmKVKKMetodSec.GizliKriter := 'id NOT IN (' + ifthen(IDList<> '', IDList, '0' ) + ') AND toplama = ''E''';
  ACount := frmKVKKMetodSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKMetodSec.qMetod.GotoBookmark(frmKVKKMetodSec.grdList.SelectedRows[i]);
    AID   := frmKVKKMetodSec.qMetod.FieldByName('id').AsInteger;
    AName := frmKVKKMetodSec.qMetod.FieldByName('metod').AsString;
    if trim(IDList) <> '' then
      IDList := trim(IDList) + ',' ;
    IDList := IDList + IntToStr(AID);
  end;
  vqenvanter.FieldByName('topl_metod_ids').AsString := IDList;
  ToplamaMetodGuncelle;
end;


procedure TfrmEnvanterTanim2test.btnMetodTopDelClick(Sender: TObject);
var
  newlist : string;
begin
 if qtmetodlar.RecordCount = 0  then exit;

 newlist := DelList(vqenvanter.FieldByName('topl_metod_ids').AsString,
            qtmetodlar.FieldByName('id').AsString);

 vqenvanter.FieldByName('topl_metod_ids').AsString := newlist;
 ToplamaMetodGuncelle;
end;



procedure TfrmEnvanterTanim2test.btnMetodTopNewClick(Sender: TObject);
begin
  frmKVKKMetodTanim.Exec(0, 0);
end;

procedure TfrmEnvanterTanim2test.btnMetodPayNewClick(Sender: TObject);
begin
  frmKVKKMetodTanim.Exec(0, 0);
end;

procedure TfrmEnvanterTanim2test.btnDgrDayanakAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID   : Integer;
  AName : String;
  IDList : String;
begin
  IDList := vqenvanter.FieldByName('dgr_dayanak_ids').AsString;
  frmKVKKDayanakSec.GizliKriter := 'id NOT IN (' + ifthen( IDList <> '', IDList, '0' ) + ') AND tipi <> ''HUKUKSAL''';
  ACount := frmKVKKDayanakSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKDayanakSec.qDayanak.GotoBookmark(frmKVKKDayanakSec.grdList.SelectedRows[i]);
    AID   := frmKVKKDayanakSec.qDayanak.FieldByName('id').AsInteger;
    AName := frmKVKKDayanakSec.qDayanak.FieldByName('dayanak').AsString;
    if trim(IDList) <> '' then
      IDList := Trim(IDList) + ',' ;
    IDList := Trim(IDList) + inttostr(AID);
  end;
  vqenvanter.FieldByName('dgr_dayanak_ids').AsString := IDList;
  DgrDayanakGuncelle;
end;

procedure TfrmEnvanterTanim2test.btnDgrDayanakDelClick(Sender: TObject);
var
  Newlist : String;
begin
  if qdgrdayanaklar.RecordCount = 0 then exit;

  Newlist := DelList(vqenvanter.FieldByName('dgr_dayanak_ids').AsString,
               qdgrdayanaklar.FieldByName('id').AsString );

  vqenvanter.FieldByName('dgr_dayanak_ids').AsString := Newlist ;
  DgrDayanakGuncelle;

end;

procedure TfrmEnvanterTanim2test.btnDgrDayanakNewClick(Sender: TObject);
begin
  frmKVKKDayanakTanim.Exec(0, 0);
end;

procedure TfrmEnvanterTanim2test.btnDgrDocsAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID    : Integer;
  AName  : String;
  IDList : String;
begin

  IDList := vqenvanter.FieldByName('dgr_dokuman_ids').AsString ;
  frmKVKKVeriDokumanSec.GizliKriter := 'doc.id NOT IN (' + ifthen(IDList <> '', IDList, '0' ) + ')';
  ACount := frmKVKKVeriDokumanSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKVeriDokumanSec.qDocs.GotoBookmark(frmKVKKVeriDokumanSec.grdList.SelectedRows[i]);
    AID   := frmKVKKVeriDokumanSec.qDocs.FieldByName('id').AsInteger;
    AName := frmKVKKVeriDokumanSec.qDocs.FieldByName('dokuman').AsString;
    if Trim(IDList) <> '' then
      IDList := Trim(IDList) + ',';
    IDList := Trim(IDList) + IntToStr(AID);
  end;
  vqenvanter.FieldByName('dgr_dokuman_ids').AsString := IDList;
  DgrDokumanGuncelle;
end;

procedure TfrmEnvanterTanim2test.btnDgrDocsDelClick(Sender: TObject);
var
  Newlist : String;
begin
  if qdgrdokumanlar.RecordCount = 0 then exit;

  Newlist := DelList(vqenvanter.FieldByName('dgr_dokuman_ids').AsString,
              qdgrdokumanlar.FieldByName('id').AsString);

  vqenvanter.FieldByName('dgr_dokuman_ids').AsString := Newlist;
  DgrDokumanGuncelle;
end;

procedure TfrmEnvanterTanim2test.btnEnvDetAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID    : Integer;
  AName  : String;
  KID    : Integer;
  KName  : String;
  Ntlk   : String;
  IDList : String;
begin
  frmKVKKVeriTipiSec.GizliKriter := '';
  ACount := frmKVKKVeriTipiSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKVeriTipiSec.qVeriTipi.GotoBookmark(frmKVKKVeriTipiSec.grdList.SelectedRows[i]);
    AID   := frmKVKKVeriTipiSec.qVeriTipi.FieldByName('id').AsInteger;
    AName := frmKVKKVeriTipiSec.qVeriTipi.FieldByName('veri_tipi').AsString;
    KID   := frmKVKKVeriTipiSec.qVeriTipi.FieldByName('md_id').AsInteger;
    KName := frmKVKKVeriTipiSec.qVeriTipi.FieldByName('kategori').AsString;
    if frmKVKKVeriTipiSec.qVeriTipi.FieldByName('nitelik').AsString = 'ON' then Ntlk  := 'E' else Ntlk  := 'H';

    if not CheckVTID(AID) then
    begin
      DetailLoading := True;
      if not MultiChange then
      begin
        VqEnvDet.Append;
        VqEnvDet.FieldByName('id').AsInteger           := 0 ;//MainMod.GetSeq('sq_data_envanter_id');
        VqEnvDet.FieldByName('main_id').AsInteger      := vqEnvanter.FieldByName('id').AsInteger;
        VqEnvDet.FieldByName('mc_id').AsInteger        := MainMod.MCID;
        VqEnvDet.FieldByName('active').AsString        := vqEnvanter.FieldByName('active').AsString;
        VqEnvDet.FieldByName('idy').AsInteger          := MainMod.LoginInfo.ID;
        VqEnvDet.FieldByName('idt').AsDateTime         := Now;
        VqEnvDet.FieldByName('sdy').AsInteger          := MainMod.LoginInfo.ID;
        VqEnvDet.FieldByName('sdt').AsDateTime         := Now;
        VqEnvDet.FieldByName('tarih').AsDateTime       := vqEnvanter.FieldByName('tarih').AsDateTime;
        VqEnvDet.FieldByName('dept_id').AsInteger      := vqEnvanter.FieldByName('dept_id').AsInteger;
        VqEnvDet.FieldByName('surec_id').AsInteger     := vqEnvanter.FieldByName('surec_id').AsInteger;
        VqEnvDet.FieldByName('kaynak_id').AsInteger    := vqEnvanter.FieldByName('kaynak_id').AsInteger;
        VqEnvDet.FieldByName('kisi_id').AsInteger      := vqEnvanter.FieldByName('kisi_id').AsInteger;
        VqEnvDet.FieldByName('veritipi_id').AsInteger  := AID;
        VqEnvDet.FieldByName('veritipi_str').AsString:= AName;
        VqEnvDet.FieldByName('kategori_id').AsInteger  := KID;
        VqEnvDet.FieldByName('kategori_str').asstring  := KName;
        VqEnvDet.FieldByName('nitelik').AsString       := Ntlk;
        VqEnvDet.Post;
        DetailLoading := False;
      end;
    end;
  end;
end;

procedure TfrmEnvanterTanim2test.btnEnvDetDelClick(Sender: TObject);
var
  Msg : String;
begin
  VqEnvDet.Delete;
end;

procedure TfrmEnvanterTanim2test.btnAmacTopAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID   : Integer;
  AName : String;
  IDList : String;
begin
  IDList := trim(vqenvanter.FieldByName('topl_amac_ids').AsString);
  frmKVKKAmacSec.GizliKriter := 'id NOT IN (' + ifthen(IDList<> '', IDList, '0' )  + ') AND toplama = ''E''';
  ACount := frmKVKKAmacSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKAmacSec.qAmac.GotoBookmark(frmKVKKAmacSec.grdList.SelectedRows[i]);
    AID   := frmKVKKAmacSec.qAmac.FieldByName('id').AsInteger;
    AName := frmKVKKAmacSec.qAmac.FieldByName('amac').AsString;
    if trim(IDList) <> '' then
      IDList := trim(IDlist) + ',';
    IDList := IDList + inttostr(AID);
  end;
  vqenvanter.FieldByName('topl_amac_ids').AsString := IDList;
  toplamaAmacGuncelle;
end;



procedure TfrmEnvanterTanim2test.btnAmacTopDelClick(Sender: TObject);
var
  Msg : String;
  newlist : string;
begin
 if qtamaclar.RecordCount = 0 then exit;

 newlist := DelList(vqenvanter.FieldByName('topl_amac_ids').AsString,
  qtamaclar.FieldByName('id').AsString);

 vqenvanter.FieldByName('topl_amac_ids').AsString := newlist;
 toplamaAmacGuncelle;

end;

procedure TfrmEnvanterTanim2test.btnAmacSakAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID   : Integer;
  AName : String;
  IDList : String;
begin
  IDList := vqenvanter.FieldByName('sakl_amac_ids').AsString;
  frmKVKKAmacSec.GizliKriter := 'id NOT IN (' + ifthen(IDList<> '', IDList, '0' ) + ') AND saklama = ''E''';
  ACount := frmKVKKAmacSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKAmacSec.qAmac.GotoBookmark(frmKVKKAmacSec.grdList.SelectedRows[i]);
    AID   := frmKVKKAmacSec.qAmac.FieldByName('id').AsInteger;
    AName := frmKVKKAmacSec.qAmac.FieldByName('amac').AsString;
    if IDList <> '' then
      IDList := trim(IDList) + ',';
    IDList := IDList + inttostr(AID);
  end;
  vqenvanter.FieldByName('sakl_amac_ids').AsString := IDList;
  saklamaAmacGuncelle;
end;


procedure TfrmEnvanterTanim2test.btnAmacSakDelClick(Sender: TObject);
var
 newlist : string;
begin
  if qsamaclar.RecordCount = 0 then  exit;

   newlist := DelList(vqenvanter.FieldByName('sakl_amac_ids').AsString,
            qsamaclar.FieldByName('id').AsString);
 vqenvanter.FieldByName('sakl_amac_ids').AsString := newlist;
 saklamaAmacGuncelle;
end;

procedure TfrmEnvanterTanim2test.btnAmacPayAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID   : Integer;
  AName : String;
  IDList : String;
begin
  IDList := vqenvanter.FieldByName('payl_amac_ids').AsString ;
  frmKVKKAmacSec.GizliKriter := 'id NOT IN (' + ifthen(IDList<> '', IDList, '0' ) + ') AND paylasma = ''E''';
  ACount := frmKVKKAmacSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKAmacSec.qAmac.GotoBookmark(frmKVKKAmacSec.grdList.SelectedRows[i]);
    AID   := frmKVKKAmacSec.qAmac.FieldByName('id').AsInteger;
    AName := frmKVKKAmacSec.qAmac.FieldByName('amac').AsString;
    if Trim(IDList) <> '' then
      IDList := Trim(IDList) + ',';
    IDList := Trim(IDList) + inttostr(AID);
  end;
  vqenvanter.FieldByName('payl_amac_ids').AsString := IDList;
  paylasmaAmacGuncelle;
end;



procedure TfrmEnvanterTanim2test.btnAmacPayDelClick(Sender: TObject);
var
  NewList : String;
begin
  if qpamaclar.RecordCount = 0 then exit;

  NewList := DelList(vqenvanter.FieldByName('payl_amac_ids').AsString,
                  qpamaclar.FieldByName('id').AsString);
  vqenvanter.FieldByName('payl_amac_ids').AsString := NewList;
  paylasmaAmacGuncelle;
end;

procedure TfrmEnvanterTanim2test.btnAmacTopNewClick(Sender: TObject);
begin
  frmKVKKAmacTanim.Exec(0, 0);
end;

procedure TfrmEnvanterTanim2test.btnAmacSakNewClick(Sender: TObject);
begin
  frmKVKKAmacTanim.Exec(0, 0);
end;

procedure TfrmEnvanterTanim2test.btnAmacPayNewClick(Sender: TObject);
begin
  frmKVKKAmacTanim.Exec(0, 0);
end;

procedure TfrmEnvanterTanim2test.btnTarafAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID   : Integer;
  AName : String;
  IDList : String;
begin
  IDList := vqenvanter.FieldByName('payl_taraf_ids').AsString ;
  frmKVKKTarafSec.GizliKriter := 'id NOT IN (' + ifthen(IDList<> '', IDList, '0' ) + ')';
  ACount := frmKVKKTarafSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKTarafSec.qTanim.GotoBookmark(frmKVKKTarafSec.grdList.SelectedRows[i]);
    AID   := frmKVKKTarafSec.qTanim.FieldByName('id').AsInteger;
    AName := frmKVKKTarafSec.qTanim.FieldByName('taraf').AsString;
    if trim(IDList) <> '' then
      IDList := trim(IDList) + ',' ;
    IDList := Trim(IDList) + inttostr(AID);
  end;
  vqenvanter.FieldByName('payl_taraf_ids').AsString := IDList;
  PaylasimTarafGuncelle;
end;


procedure TfrmEnvanterTanim2test.btnTarafDelClick(Sender: TObject);
var
  Newlist : String;
begin
  if qtaraflar.RecordCount = 0 then exit;

  Newlist := DelList(vqenvanter.FieldByName('payl_taraf_ids').AsString,
              qtaraflar.FieldByName('id').AsString );

  vqenvanter.FieldByName('payl_taraf_ids').AsString := Newlist;
  PaylasimTarafGuncelle;

end;

procedure TfrmEnvanterTanim2test.btnTarafNewClick(Sender: TObject);
begin
  frmKVKKTarafTanim.Exec(0, 0);
end;

procedure TfrmEnvanterTanim2test.chbKategoriClick(Sender: TObject);
begin
  grdVeriTipi.Columns[1].Visible := chbKategori.Checked;
end;

procedure TfrmEnvanterTanim2test.btnDeptsAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID    : Integer;
  AName  : String;
  IDList : String;
begin
  IDList := vqenvanter.FieldByName('sakl_erisim_ids').AsString;
  frmDepartmanSec.GizliKriter := ' d.active=''E'' AND d.id NOT IN (' + ifthen(IDList<> '', IDList,'0') + ') ';
  ACount := frmDepartmanSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmDepartmanSec.qDepts.GotoBookmark(frmDepartmanSec.grdList.SelectedRows[i]);
    AID   := frmDepartmanSec.qDepts.FieldByName('id').AsInteger;
    AName := frmDepartmanSec.qDepts.FieldByName('title').AsString;
    if frmDepartmanSec.qDepts.FieldByName('main_dept_str').AsString <> '' then
      AName := AName + ' ('+frmDepartmanSec.qDepts.FieldByName('main_dept_str').AsString +')';

    if trim(IDList) <> '' then
      IDList := Trim(IDList) + ',';
    IDList := trim(IDList) + IntToStr(AID);
  end;
  vqenvanter.FieldByName('sakl_erisim_ids').AsString := IDList;
  DepartmanGuncelle;
end;

procedure TfrmEnvanterTanim2test.btnDeptsDelClick(Sender: TObject);
var
  newlist : String;
begin
  if qdepartmanlar.RecordCount = 0 then exit;

  newlist := DelList(VqEnvanter.FieldByName('sakl_erisim_ids').AsString,
                  qdepartmanlar.FieldByName('id').AsString );
  VqEnvanter.FieldByName('sakl_erisim_ids').AsString := newlist;
  DepartmanGuncelle;
end;

function TfrmEnvanterTanim2test.DelList(Aliste,item : string): string;
var
 liste : TStringList;
 indx : integer;
begin
result := Aliste;
 liste := TStringList.Create;
 try
  liste.CommaText := Aliste;
  liste.Sorted := true;
  liste.Duplicates := dupIgnore;
  indx := liste.IndexOf(item);
  if indx <> -1 then
    liste.Delete(indx);
  result := liste.CommaText;
 finally
   FreeAndNil(liste);
 end;
end;

procedure TfrmEnvanterTanim2test.btnDeptsNewClick(Sender: TObject);
begin
  frmDepartmanTanim.Insert;
end;


procedure TfrmEnvanterTanim2test.PostMultiChange;
var
  I: Integer;
  Amessage:string;
  OldKisiId : integer;
  OldKaynakId :integer;
  kontrolId : integer;
  DetailVar : boolean;
  DetalNewId : integer;
  tempIds : string;
  NewenvanterRecCount : integer;
  oldenvanterRecCount : integer;
begin

  if (VqEnvDet.RecordCount > 0) and (rgVeritipi.ItemIndex=-1) then
  begin
    MessageDlg('Eklenen veri tipi için eylem seçiniz',mtConfirmation,[mbYes]);
    rgVeritipi.SetFocus;
    exit;
  end;

  if not (vqenvanter.State in [dsInsert,dsEdit]) then
    vqenvanter.Edit;

  if (not vqenvanter.FieldByName('sakl_fsure_var').IsNull)
      or (not vqenvanter.FieldByName('sakl_fsure_imha').IsNull)
      or (not vqenvanter.FieldByName('sakl_fsure_tip').IsNull)
      or (not vqenvanter.FieldByName('sakl_fsure_sure').IsNull) then
  begin
     if vqenvanter.FieldByName('sakl_fsure_var').AsString = '' then
    begin
      MessageDlg('Faaliyet fiziksel olarak saklanýyor mu? Belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
      edfSureVar.SetFocus;
      Exit;
    end;
    if vqenvanter.FieldByName('sakl_fsure_var').AsString = 'SAKLANMIYOR' then
    begin
      vqenvanter.FieldByName('sakl_fsure_imha').AsString  := '';
      vqenvanter.FieldByName('sakl_fsure_tip').AsString   := '';
      vqenvanter.FieldByName('sakl_fsure_sure').AsInteger := 0;
    end else
    begin
      if vqenvanter.FieldByName('sakl_fsure_imha').AsString = '' then
      begin
        MessageDlg('Faaliyetin Fiziksel Saklama Ýmha Zamaný belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
        edFImha.SetFocus;
        Exit;
      end;
      if vqenvanter.FieldByName('sakl_fsure_tip').AsString = '' then
      begin
        MessageDlg('Faaliyetin Fiziksel Saklama Süresi belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
        edFSureTip.SetFocus;
        Exit;
      end;
      if vqenvanter.FieldByName('sakl_fsure_sure').AsInteger < 1 then
      begin
        MessageDlg('Faaliyetin Fiziksel Saklama Süresi "0" dan büyük olmalýdýr. Lütfen kontrol ediniz.', mtError, [mbOk]);
        edFSureTip.SetFocus;
        Exit;
      end;
    end;

    if not vqenvanter.FieldByName('sakl_fsure_var').IsNull then
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
  end;

  if (not  vqenvanter.FieldByName('sakl_ssure_var').IsNull)
      or (not  vqenvanter.FieldByName('sakl_ssure_imha').IsNull)
      or (not  vqenvanter.FieldByName('sakl_ssure_tip').IsNull)
      or (not  vqenvanter.FieldByName('sakl_ssure_sure').IsNull)  then
  begin
    if vqenvanter.FieldByName('sakl_ssure_var').AsString = '' then
    begin
      MessageDlg('Faaliyet dijital olarak saklanýyor mu? Belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
      edsSureVar.SetFocus;
      Exit;
    end;
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
        MessageDlg('Faaliyetin Dijital Saklama Ýmha Zamaný belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
        edFImha.SetFocus;
        Exit;
      end;
      if vqenvanter.FieldByName('sakl_ssure_tip').AsString = '' then
      begin
        MessageDlg('Faaliyetin Dijital Saklama Süresi belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
        edFSureTip.SetFocus;
        Exit;
      end;
      if vqenvanter.FieldByName('sakl_ssure_sure').AsInteger < 1 then
      begin
        MessageDlg('Faaliyetin Dijital Saklama Süresi "0" dan büyük olmalýdýr. Lütfen kontrol ediniz.', mtError, [mbOk]);
        edFSureTip.SetFocus;
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


  if  not VqEnvDet.IsEmpty then
  begin
    VqEnvDet.First;
    while not VqEnvDet.Eof do
    begin
      vqEnvDet.Edit;
       if not vqenvanter.FieldByName('dgr_dayanak_ids').IsNull then
        VqEnvDet.FieldByName('dgr_dayanak_ids').AsString := vqenvanter.FieldByName('dgr_dayanak_ids').AsString;
       if not vqenvanter.FieldByName('dgr_dayanak_ids').IsNull then
        VqEnvDet.FieldByName('dgr_dayanak_ids').AsString := vqenvanter.FieldByName('dgr_dayanak_ids').AsString;
      vqEnvDet.Post;
      VqEnvDet.Next;
    end;
  end;

  if (not vqenvanter.FieldByName('dept_id').IsNull) or
    (not vqenvanter.FieldByName('surec_id').IsNull) or
    (not vqenvanter.FieldByName('kaynak_id').IsNull) or
    (not vqenvanter.FieldByName('kisi_id').IsNull)  then
  begin
    if EnvanterVarmi(Amessage) then
    begin
       MessageDlg(Amessage,  mtConfirmation,[mbYes]) ;
       exit;
    end;
  end;

  if VqEnvDet.RecordCount >0 then
    vqEnvanter.FieldByName('nitelik').AsString := GetMainNitelik(VqEnvDet);

  //kayýt baþlatýlýyor
  try
  if not MainMod.DBMain.InTransaction then
    MainMod.DBMain.StartTransaction;

         QueryOpen(qTmp2,' SELECT id FROM def_data_kontrolsonuc  WHERE kontrolsonuc=''ÇALIÞMA MEVCUT'' and mc_id = ' +IntToStr(MainMod.MCID));

        kontrolId := qtmp2.Fields[0].AsInteger;
        QueryOpen(qEnvDet,'select * from data_envanter e where mc_id='+inttostr(mainmod.MCID) + ' and main_id= 0 and id in ('+Envids+')');
        qEnvDet.First;
        while not qEnvDet.Eof do
        begin
          qEnvDet.Edit;
          OldKisiId := qEnvDet.FieldByName('kisi_id').AsInteger;
          OldKaynakId := qEnvDet.FieldByName('Kaynak_id').AsInteger;

         for I := 1 to vqenvanter.Fields.Count -1 do
           if not vqenvanter.Fields[I].IsNull then
            begin
              qEnvDet.Fields[I].Value :=  vqenvanter.Fields[I].Value ;
            end;

          qEnvDet.FieldByName('sdy').AsInteger := mainmod.LoginInfo.ID;
          qEnvDet.FieldByName('sdt').AsDateTime := now;


           DegisiklikKontrol;


          if (not vqenvanter.FieldByName('kisi_id').IsNull)  or (not vqenvanter.FieldByName('active').IsNull )  then
            begin
             // deðiþim sonrasý  kaynak ve ilgili kiþi ye ait kontrol formu var ise pasife alýnýyor

             QueryOpen(mainmod.qTmp,'select * from data_envanter where id not in ('+Envids+') and  main_id=0 and active =''E'' AND mc_id= '+ IntToStr(MainMod.MCID) +
              ' AND kaynak_id = ' + qEnvDet.FieldByName('kaynak_Id').AsString+
              ' AND kisi_id = ' +  inttostr(OldKisiId )) ;
             oldenvanterRecCount := mainmod.qTmp.RecordCount;


              QueryOpen(qTmp2, 'SELECT * FROM data_checklist WHERE  active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) +
                            ' AND kaynak_id = ' + qEnvDet.FieldByName('kaynak_Id').AsString +
                            ' AND kisi_id = ' +  ifthen( not vqEnvanter.FieldByName('kisi_id').IsNull,
                                                        vqEnvanter.FieldByName('kisi_id').AsString,
                                                        qEnvDet.FieldByName('kisi_id').AsString ));
              if (not (oldenvanterRecCount > 0)) and ((not vqenvanter.FieldByName('kisi_id').IsNull) or ( vqenvanter.FieldByName('active').AsString ='H')) then
              if qTmp2.RecordCount > 0 then
              begin
                qtmp2.Edit;
                qtmp2.FieldByName('active').AsString := 'H';
                qtmp2.Post;
                qtmp2.ApplyUpdates();
                qtmp2.CommitUpdates;
              end;

             // eski   kaynak ve ilgili kiþi ye ait kontrol formu var ise kisi_id yenisi ile deðiþtiriliyor
              QueryOpen(qTmp2, 'SELECT * FROM data_checklist WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) +
                            ' AND kaynak_id = ' + IntToStr(OldKaynakId)+
                            ' AND kisi_id = ' + inttostr(OldKisiId));
             if not (oldenvanterRecCount > 0) then
             if (qtmp2.RecordCount>0 ) and (not vqenvanter.FieldByName('kisi_id').IsNull) then
             begin
                qtmp2.Edit;
                qtmp2.FieldByName('kisi_id').AsInteger := vqEnvanter.FieldByName('kisi_id').AsInteger;
                qtmp2.post;
                qtmp2.ApplyUpdates();
                qtmp2.CommitUpdates;
             end;
              // sonkez kaynak ve ilgili kisi ye ait kontrol formu oluþmamýþ ise yeni oluþturulyor
              QueryOpen(qTmp2, 'SELECT * FROM data_checklist WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) +
                            ' AND kaynak_id = ' + qEnvDet.FieldByName('kaynak_Id').AsString +
                            ' AND kisi_id = ' + ifthen( not vqEnvanter.FieldByName('kisi_id').IsNull,
                                                        vqEnvanter.FieldByName('kisi_id').AsString,
                                                        qEnvDet.FieldByName('kisi_id').AsString ));
              if (qTmp2.RecordCount = 0) and (vqEnvanter.FieldByName('active').AsString ='E') then
              begin
                    qTmp2.Insert;
                    qTmp2.FieldByName('active').AsString     := 'E';
                    qTmp2.FieldByName('tarih').AsDateTime := now;
                    qTmp2.FieldByName('kaynak_id').AsInteger := qEnvDet.FieldByName('kaynak_Id').AsInteger;
                    qTmp2.FieldByName('kisi_id').AsInteger   := vqEnvanter.FieldByName('kisi_id').AsInteger;
                    qTmp2.FieldByName('kilitli').AsString    := 'H';
                    qTmp2.FieldByName('kontrol_id').AsInteger := kontrolId;
                    qTmp2.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_data_checklist_id');
                    qTmp2.FieldByName('mc_id').AsInteger  := MainMod.MCID;
                    qTmp2.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
                    qTmp2.FieldByName('idt').AsDateTime   := Now;
                qtmp2.Post;
                qtmp2.ApplyUpdates();
                qtmp2.CommitUpdates;
              end;
            end ;

         // detay tablo deðiþtirilecek
         QueryOpen(qdetail,'select * from data_envanter e where mc_id='+inttostr(mainmod.MCID) + ' and main_id<> 0 and main_id ='+qEnvDet.FieldByName('id').AsString) ;
         if  VqEnvDet.RecordCount = 0 then     // detay eklenmedi ise mevcut
         begin
          qdetail.First;
          while not qdetail.Eof do
          begin
            qdetail.Edit;
            if not vqEnvanter.FieldByName('active').IsNull then
              qdetail.FieldByName('active').AsString := vqEnvanter.FieldByName('active').AsString;
            if not vqEnvanter.FieldByName('tarih').IsNull then
              qdetail.FieldByName('tarih').AsDateTime := vqenvanter.FieldByName('tarih').AsDateTime;
              qdetail.FieldByName('sdy').AsInteger := MainMod.LoginInfo.ID;
              qdetail.FieldByName('sdt').AsDateTime := now;
            if not vqEnvanter.FieldByName('dept_id').IsNull then
              qdetail.FieldByName('dept_id').AsInteger := vqenvanter.FieldByName('dept_id').AsInteger;
            if not vqEnvanter.FieldByName('surec_id').IsNull then
              qdetail.FieldByName('surec_id').AsInteger := vqenvanter.FieldByName('surec_id').AsInteger;
            if not vqEnvanter.FieldByName('kaynak_id').IsNull then
              qdetail.FieldByName('kaynak_id').AsInteger := vqenvanter.FieldByName('Kaynak_id').AsInteger;
            if not vqEnvanter.FieldByName('kisi_id').IsNull then
              qdetail.FieldByName('kisi_id').AsInteger := vqenvanter.FieldByName('kisi_id').AsInteger;
            if not vqEnvanter.FieldByName('payl_sozlesme').IsNull then
              qdetail.FieldByName('payl_sozlesme').AsString := vqenvanter.FieldByName('payl_sozlesme').AsString;
            if not vqEnvanter.FieldByName('dgr_politika').IsNull then
              qdetail.FieldByName('dgr_politika').AsString := vqenvanter.FieldByName('dgr_politika').AsString;
            if not vqEnvanter.FieldByName('dgr_sozlesme').IsNull then
              qdetail.FieldByName('dgr_sozlesme').AsString := vqenvanter.FieldByName('dgr_sozlesme').AsString;
            if not vqEnvanter.FieldByName('payl_taraftipi').IsNull then
              qdetail.FieldByName('payl_taraftipi').AsString := vqenvanter.FieldByName('payl_taraftipi').AsString;
            if not vqEnvanter.FieldByName('sakl_ssure_tip').IsNull then
              qdetail.FieldByName('sakl_ssure_tip').AsString := vqenvanter.FieldByName('sakl_ssure_tip').AsString;
            if not vqEnvanter.FieldByName('sakl_fsure_tip').IsNull then
              qdetail.FieldByName('sakl_fsure_tip').AsString := vqenvanter.FieldByName('sakl_fsure_tip').AsString;
            if not vqEnvanter.FieldByName('sakl_ssure_sure').IsNull then
              qdetail.FieldByName('sakl_ssure_sure').AsString := vqenvanter.FieldByName('sakl_ssure_sure').AsString;
            if not vqEnvanter.FieldByName('sakl_fsure_sure').IsNull then
              qdetail.FieldByName('sakl_fsure_sure').AsString := vqenvanter.FieldByName('sakl_fsure_sure').AsString;
            if not vqEnvanter.FieldByName('sakl_ssure_diger').IsNull then
              qdetail.FieldByName('sakl_ssure_diger').AsString := vqenvanter.FieldByName('sakl_ssure_diger').AsString;
            if not vqEnvanter.FieldByName('sakl_fsure_diger').IsNull then
              qdetail.FieldByName('sakl_fsure_diger').AsString := vqenvanter.FieldByName('sakl_fsure_diger').AsString;
            if not vqEnvanter.FieldByName('sakl_ssure_imha').IsNull then
              qdetail.FieldByName('sakl_ssure_imha').AsString := vqenvanter.FieldByName('sakl_ssure_imha').AsString;
            if not vqEnvanter.FieldByName('sakl_fsure_imha').IsNull then
              qdetail.FieldByName('sakl_fsure_imha').AsString := vqenvanter.FieldByName('sakl_fsure_imha').AsString;
            if not vqEnvanter.FieldByName('sakl_ssure_var').IsNull then
              qdetail.FieldByName('sakl_ssure_var').AsString := vqenvanter.FieldByName('sakl_ssure_var').AsString;
            if not vqEnvanter.FieldByName('sakl_fsure_var').IsNull then
              qdetail.FieldByName('sakl_fsure_var').AsString := vqenvanter.FieldByName('sakl_fsure_var').AsString;
            if not vqEnvanter.FieldByName('sakl_ssure').IsNull then
              qdetail.FieldByName('sakl_ssure').AsString := vqenvanter.FieldByName('sakl_ssure').AsString;
            if not vqEnvanter.FieldByName('sakl_fsure').IsNull then
            qdetail.FieldByName('sakl_fsure').AsString := vqenvanter.FieldByName('sakl_fsure').AsString;
            qdetail.Post;
            qdetail.ApplyUpdates();
            qdetail.CommitUpdates;
            qdetail.Next;
          end;
         end else
         begin
           if rgVeritipi.ItemIndex=0 then  //ekleme
           begin
              DetailVar := false;
             VqEnvDet.First;
             while not VqEnvDet.Eof do
             begin
              qdetail.First;
                while not qdetail.eof do
                begin
                     if  qdetail.FieldByName('veritipi_id').AsInteger  = VqEnvDet.FieldByName('veritipi_id').AsInteger then
                     begin
                       DetailVar := true;
                       break;
                     end ;
                   qdetail.Next;
                end;

                if not DetailVar then
                    begin
                      DetalNewId :=   mainmod.GetSeq('sq_data_envanter_id');
                      KayitKopyala(qdetail,DetalNewId,[],[]);

                      qdetail.Locate('id',DetalNewId,[]);
                      qdetail.edit;

                      if not vqEnvanter.FieldByName('active').IsNull then
                        qdetail.FieldByName('active').AsString := vqEnvanter.FieldByName('active').AsString;
                      qdetail.FieldByName('sdy').AsInteger := MainMod.LoginInfo.ID;
                      qdetail.FieldByName('sdt').AsDateTime := now;
                      if not vqEnvanter.FieldByName('tarih').IsNull then
                        qdetail.FieldByName('tarih').AsDateTime := vqenvanter.FieldByName('tarih').AsDateTime;
                      if not vqEnvanter.FieldByName('dept_id').IsNull then
                        qdetail.FieldByName('dept_id').AsInteger := vqenvanter.FieldByName('dept_id').AsInteger;
                      if not vqEnvanter.FieldByName('surec_id').IsNull then
                        qdetail.FieldByName('surec_id').AsInteger := vqEnvanter.FieldByName('surec_id').AsInteger;
                      if not vqEnvanter.FieldByName('Kaynak_id').IsNull then
                      qdetail.FieldByName('kaynak_id').AsInteger := vqenvanter.FieldByName('Kaynak_id').AsInteger;
                      if not vqEnvanter.FieldByName('dept_id').IsNull then
                        qdetail.FieldByName('kisi_id').AsInteger := vqenvanter.FieldByName('kisi_id').AsInteger;

                      qdetail.FieldByName('veritipi_id').AsInteger := VqEnvDet.FieldByName('veritipi_id').AsInteger ;
                      qdetail.FieldByName('kategori_id').AsInteger := VqEnvDet.FieldByName('kategori_id').AsInteger;
                      qdetail.FieldByName('nitelik').AsString := VqEnvDet.FieldByName('nitelik').AsString;


                      if not vqEnvanter.FieldByName('payl_sozlesme').IsNull then
                      qdetail.FieldByName('payl_sozlesme').AsString := vqenvanter.FieldByName('payl_sozlesme').AsString;
                      if not vqEnvanter.FieldByName('dgr_politika').IsNull then
                      qdetail.FieldByName('dgr_politika').AsString := vqenvanter.FieldByName('dgr_politika').AsString;
                      if not vqEnvanter.FieldByName('dgr_sozlesme').IsNull then
                      qdetail.FieldByName('dgr_sozlesme').AsString := vqenvanter.FieldByName('dgr_sozlesme').AsString;

                      if not vqEnvanter.FieldByName('payl_taraftipi').IsNull then
                      qdetail.FieldByName('payl_taraftipi').AsString := vqenvanter.FieldByName('payl_taraftipi').AsString;
                      if not vqEnvanter.FieldByName('sakl_ssure_tip').IsNull then
                      qdetail.FieldByName('sakl_ssure_tip').AsString := vqenvanter.FieldByName('sakl_ssure_tip').AsString;
                      if not vqEnvanter.FieldByName('sakl_fsure_tip').IsNull then
                      qdetail.FieldByName('sakl_fsure_tip').AsString := vqenvanter.FieldByName('sakl_fsure_tip').AsString;
                      if not vqEnvanter.FieldByName('sakl_ssure_sure').IsNull then
                      qdetail.FieldByName('sakl_ssure_sure').AsString := vqenvanter.FieldByName('sakl_ssure_sure').AsString;
                      if not vqEnvanter.FieldByName('sakl_fsure_sure').IsNull then
                      qdetail.FieldByName('sakl_fsure_sure').AsString := vqenvanter.FieldByName('sakl_fsure_sure').AsString;
                      if not vqEnvanter.FieldByName('sakl_ssure_diger').IsNull then
                      qdetail.FieldByName('sakl_ssure_diger').AsString := vqenvanter.FieldByName('sakl_ssure_diger').AsString;
                      if not vqEnvanter.FieldByName('sakl_fsure_diger').IsNull then
                      qdetail.FieldByName('sakl_fsure_diger').AsString := vqenvanter.FieldByName('sakl_fsure_diger').AsString;
                      if not vqEnvanter.FieldByName('sakl_ssure_imha').IsNull then
                      qdetail.FieldByName('sakl_ssure_imha').AsString := vqenvanter.FieldByName('sakl_ssure_imha').AsString;
                      if not vqEnvanter.FieldByName('sakl_fsure_imha').IsNull then
                      qdetail.FieldByName('sakl_fsure_imha').AsString := vqenvanter.FieldByName('sakl_fsure_imha').AsString;
                      if not vqEnvanter.FieldByName('sakl_ssure_var').IsNull then
                      qdetail.FieldByName('sakl_ssure_var').AsString := vqenvanter.FieldByName('sakl_ssure_var').AsString;
                      if not vqEnvanter.FieldByName('sakl_fsure_var').IsNull then
                      qdetail.FieldByName('sakl_fsure_var').AsString := vqenvanter.FieldByName('sakl_fsure_var').AsString;
                      if not vqEnvanter.FieldByName('sakl_ssure').IsNull then
                      qdetail.FieldByName('sakl_ssure').AsString := vqenvanter.FieldByName('sakl_ssure').AsString;
                      if not vqEnvanter.FieldByName('sakl_fsure').IsNull then
                      qdetail.FieldByName('sakl_fsure').AsString := vqenvanter.FieldByName('sakl_fsure').AsString;
                      qdetail.Post;
                      qdetail.ApplyUpdates();
                      qdetail.CommitUpdates;
                   end;
              VqEnvDet.Next;
             end;

           end
           else
           if rgVeritipi.ItemIndex=1  then  //silme
           begin
            VqEnvDet.First;
              while not VqEnvDet.Eof do
              begin
                qdetail.First;
                while not qdetail.eof do
                begin
                   if  qdetail.FieldByName('veritipi_id').AsInteger  = VqEnvDet.FieldByName('veritipi_id').AsInteger then
                    qdetail.Delete;
                   qdetail.Next;
                end;
                qdetail.ApplyUpdates();
                qdetail.CommitUpdates;
              VqEnvDet.Next;
            end;
           end
           else
           if rgVeritipi.ItemIndex=2 then  //deðiþtirme
           begin
             if  VqEnvDet.RecordCount < qdetail.RecordCount  then
              begin
                  while not ( VqEnvDet.RecordCount = qdetail.RecordCount) do
                  begin
                    qdetail.Last;
                    qdetail.Delete;
                  end;
              end else
              if VqEnvDet.RecordCount > qdetail.RecordCount  then
              begin
                while not (VqEnvDet.RecordCount = qdetail.RecordCount) do
                begin
                  DetalNewId :=   mainmod.GetSeq('sq_data_envanter_id');
                  KayitKopyala(qdetail,DetalNewId,[],[]);
                end;
              end;

             qdetail.First;
             VqEnvDet.First;
             while not qdetail.Eof do
             begin
              qdetail.edit;
              if not vqEnvanter.FieldByName('active').IsNull then
                qdetail.FieldByName('active').AsString := vqEnvanter.FieldByName('active').AsString;
              qdetail.FieldByName('sdy').AsInteger := MainMod.LoginInfo.ID;
              qdetail.FieldByName('sdt').AsDateTime := now;
              if not vqEnvanter.FieldByName('tarih').IsNull then
                qdetail.FieldByName('tarih').AsDateTime := vqenvanter.FieldByName('tarih').AsDateTime;
              if not vqEnvanter.FieldByName('dept_id').IsNull then
                qdetail.FieldByName('dept_id').AsInteger := vqenvanter.FieldByName('dept_id').AsInteger;
              if not vqEnvanter.FieldByName('surec_id').IsNull then
                qdetail.FieldByName('surec_id').AsInteger := vqEnvanter.FieldByName('surec_id').AsInteger;
              if not vqEnvanter.FieldByName('Kaynak_id').IsNull then
              qdetail.FieldByName('kaynak_id').AsInteger := vqenvanter.FieldByName('Kaynak_id').AsInteger;
              if not vqEnvanter.FieldByName('dept_id').IsNull then
                qdetail.FieldByName('kisi_id').AsInteger := vqenvanter.FieldByName('kisi_id').AsInteger;

              qdetail.FieldByName('veritipi_id').AsInteger := VqEnvDet.FieldByName('veritipi_id').AsInteger ;
              qdetail.FieldByName('kategori_id').AsInteger := VqEnvDet.FieldByName('kategori_id').AsInteger;
              qdetail.FieldByName('nitelik').AsString := VqEnvDet.FieldByName('nitelik').AsString;


              if not vqEnvanter.FieldByName('payl_sozlesme').IsNull then
              qdetail.FieldByName('payl_sozlesme').AsString := vqenvanter.FieldByName('payl_sozlesme').AsString;
              if not vqEnvanter.FieldByName('dgr_politika').IsNull then
              qdetail.FieldByName('dgr_politika').AsString := vqenvanter.FieldByName('dgr_politika').AsString;
              if not vqEnvanter.FieldByName('dgr_sozlesme').IsNull then
              qdetail.FieldByName('dgr_sozlesme').AsString := vqenvanter.FieldByName('dgr_sozlesme').AsString;

              if not vqEnvanter.FieldByName('payl_taraftipi').IsNull then
              qdetail.FieldByName('payl_taraftipi').AsString := vqenvanter.FieldByName('payl_taraftipi').AsString;
              if not vqEnvanter.FieldByName('sakl_ssure_tip').IsNull then
              qdetail.FieldByName('sakl_ssure_tip').AsString := vqenvanter.FieldByName('sakl_ssure_tip').AsString;
              if not vqEnvanter.FieldByName('sakl_fsure_tip').IsNull then
              qdetail.FieldByName('sakl_fsure_tip').AsString := vqenvanter.FieldByName('sakl_fsure_tip').AsString;
              if not vqEnvanter.FieldByName('sakl_ssure_sure').IsNull then
              qdetail.FieldByName('sakl_ssure_sure').AsString := vqenvanter.FieldByName('sakl_ssure_sure').AsString;
              if not vqEnvanter.FieldByName('sakl_fsure_sure').IsNull then
              qdetail.FieldByName('sakl_fsure_sure').AsString := vqenvanter.FieldByName('sakl_fsure_sure').AsString;
              if not vqEnvanter.FieldByName('sakl_ssure_diger').IsNull then
              qdetail.FieldByName('sakl_ssure_diger').AsString := vqenvanter.FieldByName('sakl_ssure_diger').AsString;
              if not vqEnvanter.FieldByName('sakl_fsure_diger').IsNull then
              qdetail.FieldByName('sakl_fsure_diger').AsString := vqenvanter.FieldByName('sakl_fsure_diger').AsString;
              if not vqEnvanter.FieldByName('sakl_ssure_imha').IsNull then
              qdetail.FieldByName('sakl_ssure_imha').AsString := vqenvanter.FieldByName('sakl_ssure_imha').AsString;
              if not vqEnvanter.FieldByName('sakl_fsure_imha').IsNull then
              qdetail.FieldByName('sakl_fsure_imha').AsString := vqenvanter.FieldByName('sakl_fsure_imha').AsString;
              if not vqEnvanter.FieldByName('sakl_ssure_var').IsNull then
              qdetail.FieldByName('sakl_ssure_var').AsString := vqenvanter.FieldByName('sakl_ssure_var').AsString;
              if not vqEnvanter.FieldByName('sakl_fsure_var').IsNull then
              qdetail.FieldByName('sakl_fsure_var').AsString := vqenvanter.FieldByName('sakl_fsure_var').AsString;
              if not vqEnvanter.FieldByName('sakl_ssure').IsNull then
              qdetail.FieldByName('sakl_ssure').AsString := vqenvanter.FieldByName('sakl_ssure').AsString;
              if not vqEnvanter.FieldByName('sakl_fsure').IsNull then
              qdetail.FieldByName('sakl_fsure').AsString := vqenvanter.FieldByName('sakl_fsure').AsString;
              qdetail.Post;

               qdetail.Next;
               VqEnvDet.Next;
             end;
              qdetail.ApplyUpdates();
              qdetail.CommitUpdates;
           end;
         end;
            qEnvDet.FieldByName('nitelik').AsString := GetMainNitelik(qdetail);
        qEnvDet.Post;

        qEnvDet.Next;
        end;

    qEnvDet.ApplyUpdates();
    qEnvDet.CommitUpdates;
    if  MainMod.DBMain.InTransaction then
      MainMod.DBMain.Commit;
  except
    qEnvDet.CancelUpdates;
    qdetail.CancelUpdates;
    qtmp2.CancelUpdates;
    if  MainMod.DBMain.InTransaction then
      MainMod.DBMain.Rollback;
  end;
    ModalResult := mrOk;

end;


procedure TfrmEnvanterTanim2test.KayitKopyala(Table: TDataSet; AYeniId: Integer; Afield : array of string; AfieldValue : array of string);
var
  FieldValues: array of Variant;
  i: Integer;
  j: Integer;
  FieldName: string;
  ValueAssigned: Boolean;
begin


    SetLength(FieldValues, Table.FieldCount);

  // Tüm alanlarý kopyala
  for i := 0 to Table.FieldCount - 1 do
  begin
    FieldName := Table.Fields[i].FieldName;
    ValueAssigned := False;
    // 'id' alaný için yeni deðeri atama
    if FieldName = 'id' then
    begin
      FieldValues[i] := AYeniId;
      Continue;
    end;
    for j := Low(Afield) to High(Afield) do
    begin
      if FieldName = Afield[j] then
      begin
        FieldValues[i] := AfieldValue[j];
        ValueAssigned := True;
        Break;
      end;
    end;
    if not ValueAssigned then
    begin
      if not Table.Fields[i].IsNull then
        FieldValues[i] := Table.Fields[i].Value
      else
        FieldValues[i] := Null;
    end;
  end;
  // Yeni kayýt ekle
  Table.Append;
  try
    for i := 0 to Table.FieldCount - 1 do
    begin
      Table.Fields[i].Value := FieldValues[i];
    end;
    Table.Post;
  except
    Table.Cancel;
    raise;
  end;
  //
end;

function TfrmEnvanterTanim2test.EnvanterVarmi(var Amsg:string): boolean;
var
 departmanstr,surecstr,kisistr,kaynakstr : string;
begin
 result := false;
 Amsg := '';
         // kayýtlarýn konrolü departman,sürec,kiþi , kaynak birdin fazla oluþacakmý kayýt öncesi kontrol ediliyor
        QueryOpen(mainmod.qTmp, 'SELECT * FROM data_envanter WHERE main_id=0 and mc_id='+inttostr(MainMod.MCID)+' and id in ('+ Envids + ')');
        QueryOpen(qTmp,'select * from data_envanter where  main_id=0 and mc_id='+inttostr(MainMod.MCID)+' and active=''E'' and id not in ('+Envids +')');

        CopyFieldsFromQueryToVirtualTable(mainmod.qTmp,vtmp1,true);
        vtmp1.Open;

        vqtmp.Close;
        vqtmp.SourceDataSets.Clear;
        vqtmp.SourceDataSets.Add(vtmp1);
        vqtmp.SourceDataSets.Add(qTmp);

        vtmp1.first;
        while not vtmp1.Eof do
        begin
           vtmp1.Edit;
          if vqenvanter.FieldByName('active').AsString <>''  then
             vtmp1.FieldByName('active').AsString := vqenvanter.FieldByName('active').AsString;
          if vqenvanter.FieldByName('dept_id').AsString<>'' then
            vtmp1.FieldByName('dept_id').AsInteger := vqenvanter.FieldByName('dept_id').Asinteger;
          if vqenvanter.FieldByName('surec_id').AsString <> '' then
            vtmp1.FieldByName('surec_id').AsInteger := vqenvanter.FieldByName('surec_id').AsInteger;
          if vqenvanter.FieldByName('kisi_id').AsString <> '' then
            vtmp1.FieldByName('kisi_id').AsInteger := vqenvanter.FieldByName('kisi_id').AsInteger;
          vtmp1.Post;

              vqtmp.SQL.Text := 'Select * from ( select * from qtmp g where id <>  '+ vtmp1.FieldByName('id').AsString ;
              vqtmp.SQL.Add( ' UNION ALL  select * from vtmp1 where active=''E'' ) t   '  ) ;
              vqtmp.SQL.Add( ' where t.dept_id=:dept_id and t.surec_id=:surec_id and '+
                            ' t.kisi_id =:kisi_id and t.kaynak_id=:kaynak_id '  );
              vqtmp.ParamByName('dept_id').AsInteger := vtmp1.FieldByName('dept_id').AsInteger;
              vqtmp.ParamByName('surec_id').AsInteger := vtmp1.FieldByName('surec_id').AsInteger;
              vqtmp.ParamByName('kisi_id').AsInteger :=  vtmp1.FieldByName('kisi_id').AsInteger  ;
              vqtmp.ParamByName('kaynak_id').AsInteger := vtmp1.FieldByName('kaynak_id').AsInteger ;
              vqtmp.Open;
              if vqtmp.RecordCount >1 then
               begin
                 departmanstr := DegerGetir(vqtmp.ParamByName('dept_id').AsInteger,'title',qDept);
                 surecstr := DegerGetir(vqtmp.ParamByName('surec_id').AsInteger,'surec',qSurec);
                 kisistr := DegerGetir(vqtmp.ParamByName('kisi_id').AsInteger,'kisi',qKisi);
                 kaynakstr := DegerGetir(vqtmp.ParamByName('kaynak_id').AsInteger,'kaynak',qKaynak);
                 Amsg := departmanstr+' -> '+surecstr +' -> '+ kaynakstr +' -> '+ kisistr + #13#10 +
                    ' Deðiþtirmek istediðiniz veriler için zaten bir kayýt var. Ýþlemin Ýptal ediliyor. ' ;
                result := true;
                break;
               end;

          vtmp1.Next;
        end;


end;
function TfrmEnvanterTanim2test.ValidateControl:boolean;
begin

    result := true;
      if VqEnvDet.RecordCount < 1 then
      begin
        MessageDlg('Envanter Formunu kaydedebilmek için Veri Kaynaðý içerisinde en az 1 tane Veri Tipi olmalýdýr. Lütfen kontrol ediniz.', mtError, [mbOk]);
        PgControl.ActivePage := pgDetay;
        btnEnvDetAdd.SetFocus;
        result := false;
        Exit;
      end;
      if vqEnvanter.FieldByName('active').AsString = '' then
        begin
          MessageDlg('Form Durumu belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
          edActive.SetFocus;
          result := false;
          Exit;
        end;
        if vqEnvanter.FieldByName('tarih').AsString = '' then
        begin
          MessageDlg('Form Tarihi belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
          edTarih.SetFocus;
          result := false;
          Exit;
        end;
        if vqEnvanter.FieldByName('dept_id').AsInteger < 1 then
        begin
          MessageDlg('Formun Departmaný belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
          edDept.SetFocus;
          result := false;
          Exit;
        end;
        if Pos(vqEnvanter.FieldByName('dept_id').AsString, MainMod.LoginInfo.Birimler) < 1 then
        begin
          MessageDlg('Bu envanter kaydý yetkili olduðunuz bir departmana ait deðil. Ýþlem yapamazsýnýz.', mtError, [mbOk]);
          edDept.SetFocus;
          result := false;
          Exit;
        end;
        if vqEnvanter.FieldByName('surec_id').AsInteger < 1 then
        begin
          MessageDlg('Süreç belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
          edSurec.SetFocus;
          result := false;
          Exit;
        end;
        if vqEnvanter.FieldByName('kaynak_id').AsInteger < 1 then
        begin
          MessageDlg('Veri Kaynaðý / Süreç / Sistem belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
          edKaynak.SetFocus;
          result := false;
          Exit;
        end;
        if vqEnvanter.FieldByName('kisi_id').AsInteger < 1 then
        begin
          MessageDlg('Veri Konusu Kiþi belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
          edKisi.SetFocus;
          result := false;
          Exit;
        end;
        if vqEnvanter.FieldByName('payl_taraftipi').AsString = '' then
        begin
          MessageDlg('Paylaþýlan Taraf Tipi belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
          pgdetaycontrol.ActivePage := pgPayl_Taraf ;
          edTarafTipi.SetFocus;
          result := false;
          Exit;
        end;
        if vqenvanter.FieldByName('topl_amac_ids').AsString = '' then
        begin
          MessageDlg('Toplama Amacý  belirtilmemiþ. Lütfen kontrol ediniz.',mtError,[mbOk]);
          result := false;
          PgControl.ActivePage := pgDetay;
          pgdetaycontrol.ActivePage := pgTopl_Amac;
          exit;
        end;
        if vqenvanter.FieldByName('topl_metod_ids').AsString = '' then
        begin
          MessageDlg('Toplama metodu  belirtilmemiþ. Lütfen kontrol ediniz.',mtError,[mbOk]);
          result := false;
          PgControl.ActivePage := pgDetay;
          pgdetaycontrol.ActivePage := pgTopl_Metod;
          exit;
        end;

        if edTarafTipi.ItemIndex in [0,1,2] then //paylalýþmýyor hariciseçim
        begin
          if vqenvanter.FieldByName('payl_amac_ids').AsString = '' then
          begin
            MessageDlg('Paylaþýlan Amaç  belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
            result := false;
            PgControl.ActivePage := pgDetay;
            pgdetaycontrol.ActivePage := pgPayl_Amac;
            exit;
          end;
          if vqenvanter.FieldByName('payl_metod_ids').AsString = '' then
          begin
            MessageDlg('Paylaþýlan metot  belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
            result := false;
            PgControl.ActivePage := pgDetay;
            pgdetaycontrol.ActivePage := pgPayl_Metod;
            exit;
          end;
          if vqenvanter.FieldByName('payl_taraf_ids').AsString = '' then
          begin
            MessageDlg('Paylaþýlan medot  belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
            result := false;
            PgControl.ActivePage := pgDetay;
            pgdetaycontrol.ActivePage := pgPayl_Taraf;
            exit;
          end;
        end;
  result := true;
end;

function TfrmEnvanterTanim2test.TimeValidateControl(Aquery : tdataset): boolean;
begin
    result := true;
    if not (Aquery.State in [dsInsert, dsEdit]) then Aquery.Edit;

        if Aquery.FieldByName('sakl_fsure_var').AsString = '' then Aquery.FieldByName('sakl_fsure_var').AsString := 'SAKLANMIYOR';
        if Aquery.FieldByName('sakl_fsure_var').AsString = 'SAKLANMIYOR' then
        begin
          Aquery.FieldByName('sakl_fsure_imha').AsString  := '';
          Aquery.FieldByName('sakl_fsure_tip').AsString   := '';
          Aquery.FieldByName('sakl_fsure_sure').AsInteger := 0;
        end
        else
        begin
          if Aquery.FieldByName('sakl_fsure_imha').AsString = '' then
          begin
            MessageDlg('Faaliyetin Fiziksel Saklama Ýmha Zamaný belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
            edFImha.SetFocus;
            result := false;
            Exit;
          end;
          if Aquery.FieldByName('sakl_fsure_tip').AsString = '' then
          begin
            MessageDlg('Faaliyetin Fiziksel Saklama Süresi belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
            edFSureTip.SetFocus;
            result := false;
            Exit;
          end;
          if Aquery.FieldByName('sakl_fsure_sure').AsInteger < 1 then
          begin
            MessageDlg('Faaliyetin Fiziksel Saklama Süresi "0" dan büyük olmalýdýr. Lütfen kontrol ediniz.', mtError, [mbOk]);
            edFSureTip.SetFocus;
            result := false;
            Exit;
          end;
        end;

        if Aquery.FieldByName('sakl_fsure_var').AsString = 'SAKLANMIYOR' then
        begin
          Aquery.FieldByName('sakl_fsure').AsString := '';
        end
        else
        begin
          if Aquery.FieldByName('sakl_fsure_imha').AsString = 'BAÞLANGIÇ' then
            Aquery.FieldByName('sakl_fsure').AsString := Aquery.FieldByName('sakl_fsure_sure').AsString + ' ' + Aquery.FieldByName('sakl_fsure_tip').AsString
          else
            Aquery.FieldByName('sakl_fsure').AsString := 'DÝÐER (FAALÝYET SÜRESÝ + ' + Aquery.FieldByName('sakl_fsure_sure').AsString + ' ' + Aquery.FieldByName('sakl_fsure_tip').AsString + ')';
        end;

        if Aquery.FieldByName('sakl_ssure_var').AsString = '' then Aquery.FieldByName('sakl_ssure_var').AsString := 'SAKLANMIYOR';
        if Aquery.FieldByName('sakl_ssure_var').AsString = 'SAKLANMIYOR' then
        begin
          Aquery.FieldByName('sakl_ssure_imha').AsString  := '';
          Aquery.FieldByName('sakl_ssure_tip').AsString   := '';
          Aquery.FieldByName('sakl_ssure_sure').AsInteger := 0;
        end
        else
        begin
          if Aquery.FieldByName('sakl_ssure_imha').AsString = '' then
          begin
            MessageDlg('Faaliyetin Dijital Saklama Ýmha Zamaný belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
            edFImha.SetFocus;
            result := false;
            Exit;
          end;
          if Aquery.FieldByName('sakl_ssure_tip').AsString = '' then
          begin
            MessageDlg('Faaliyetin Dijital Saklama Süresi belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
            edFSureTip.SetFocus;
            result := false;
            Exit;
          end;
          if Aquery.FieldByName('sakl_ssure_sure').AsInteger < 1 then
          begin
            MessageDlg('Faaliyetin Dijital Saklama Süresi "0" dan büyük olmalýdýr. Lütfen kontrol ediniz.', mtError, [mbOk]);
            edFSureTip.SetFocus;
            result := false;
            Exit;
          end;
        end;

        if Aquery.FieldByName('sakl_ssure_var').AsString = 'SAKLANMIYOR' then
        begin
          Aquery.FieldByName('sakl_ssure').AsString := '';
        end
        else
        begin
          if Aquery.FieldByName('sakl_ssure_imha').AsString = 'BAÞLANGIÇ' then
            Aquery.FieldByName('sakl_ssure').AsString := Aquery.FieldByName('sakl_ssure_sure').AsString + ' ' + Aquery.FieldByName('sakl_ssure_tip').AsString
          else
            Aquery.FieldByName('sakl_ssure').AsString := 'DÝÐER (FAALÝYET SÜRESÝ + ' + Aquery.FieldByName('sakl_ssure_sure').AsString + ' ' + Aquery.FieldByName('sakl_ssure_tip').AsString + ')';
        end;

    result := true;
end;

function  TfrmEnvanterTanim2test.DegisiklikKontrol: boolean;
begin
 result := true;
 oldKaynak_Id := 0;
 OldKisi_Id := 0;

 if qEnvanter.State in [dsEdit] then
  begin
   if vqEnvanter.FieldByName('kaynak_id').asinteger <> qEnvanter.FieldByName('kaynak_id').asinteger  then
     oldKaynak_Id := qEnvanter.FieldByName('kaynak_id').asinteger;
   if vqEnvanter.FieldByName('kisi_id').asinteger <> qEnvanter.FieldByName('kisi_id').asinteger then
     OldKisi_Id :=  qEnvanter.FieldByName('kisi_id').asinteger;
   changeActive := vqEnvanter.FieldByName('active').AsString <> qEnvanter.FieldByName('active').asstring;

   if ( vqEnvanter.FieldByName('dept_id').asinteger <> qEnvanter.FieldByName('dept_id').asinteger ) or
       ( vqEnvanter.FieldByName('surec_id').asinteger <> qEnvanter.FieldByName('surec_id').asinteger ) or
       ( vqEnvanter.FieldByName('kaynak_id').asinteger <> qEnvanter.FieldByName('kaynak_id').asinteger ) or
       ( vqEnvanter.FieldByName('kisi_id').asinteger <> qEnvanter.FieldByName('kisi_id').asinteger ) or
       ( ( vqEnvanter.FieldByName('active').NewValue <> qEnvanter.FieldByName('active').OldValue) and
       (qEnvanter.FieldByName('active').NewValue ='E')  )      then
       begin
        QueryOpen(qTmp,' select * from data_envanter where '+
                 IfThen(not MultiChange,'id <> '+ vqEnvanter.FieldByName('id').AsString + ' and ','')+
               ' mc_id = '+IntToStr(mainmod.MCID)+' and main_id=0 '+
               ' and dept_id=' + vqEnvanter.FieldByName('dept_id').asstring +
               ' and surec_id=' + vqEnvanter.FieldByName('surec_id').asstring  +
               ' and kaynak_id =' + vqEnvanter.FieldByName('kaynak_id').asstring  +
               ' and kisi_id =' + vqEnvanter.FieldByName('kisi_id').asstring  );
           if qTmp.RecordCount > 0 then
            begin
              ShowMessageN('Ayný departman, kaynak, sureç ve kiþiye ait  kayýt var. '+ #13#10+ ' iþleminiz iptal ediliyor ') ;
              result := false ;
            end;
       end;

  end;

  if qEnvanter.State = dsInsert then
  begin
    QueryOpen(qTmp,' select * from data_envanter where '+
               ' mc_id = '+IntToStr(mainmod.MCID)+' and main_id=0 '+
               ' and dept_id=' + vqEnvanter.FieldByName('dept_id').asstring +
               ' and surec_id=' + vqEnvanter.FieldByName('surec_id').asstring  +
               ' and kaynak_id =' + vqEnvanter.FieldByName('kaynak_id').asstring  +
               ' and kisi_id =' + vqEnvanter.FieldByName('kisi_id').asstring  );
           if qTmp.RecordCount > 0 then
            begin
              ShowMessageN('Ayný departman, kaynak, sureç ve kiþiye ait  kayýt var. '+ #13#10+ ' iþleminiz iptal ediliyor ') ;
              result := false ;
            end;
  end;


end;

procedure TfrmEnvanterTanim2test.postMonoChange;
var
kontrolId : integer;
oldenvanterRecCount : integer;
I: Integer;
begin

 if detailkilitli then
        begin
          MessageDlg('Kontrol Listeli kilitlenmiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
          Exit;
        end;

        if not ValidateControl then
          exit;

        if  not TimeValidateControl(vqEnvanter) then
          exit;

        vqEnvanter.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
        vqEnvanter.FieldByName('sdt').AsDateTime     := Now;

        vqEnvanter.FieldByName('nitelik').AsString := GetMainNitelik(VqEnvDet);
        vqEnvanter.Post;

        if not DegisiklikKontrol then
          exit;

        if qenvanter.State = dsBrowse then
          qenvanter.Edit;
        for I := 0 to vqenvanter.FieldCount-1 do
        begin
           if (vqenvanter.Fields[i].FieldName = 'veritipi_id' ) or (vqenvanter.Fields[i].FieldName = 'kategori_id' )  then
           begin
              qenvanter.Fields[i].Clear;
              Continue;
           end;
          qEnvanter.Fields[i].Value := vqenvanter.Fields[i].Value;
        end;
        qEnvanter.Post;


          // Doðan Akçay kontrol formunun veri bütünlüðü bozulmamasý için eklendi
          if ( OldKisi_Id>0 ) or ( oldKaynak_Id >0 ) or (changeActive) then
          begin
           QueryOpen(qTmp2,' SELECT id FROM def_data_kontrolsonuc  WHERE kontrolsonuc=''ÇALIÞMA MEVCUT'' and mc_id = ' +IntToStr(MainMod.MCID));
           kontrolId := qtmp2.Fields[0].AsInteger;

           QueryOpen(mainmod.qTmp,'select * from data_envanter where main_id=0 and active =''E'' AND mc_id= '+ IntToStr(MainMod.MCID) +
            ' AND kaynak_id = ' + IfThen(oldKaynak_Id > 0, inttostr(oldKaynak_Id), qEnvanter.FieldByName('kaynak_id').AsString) +
            ' AND kisi_id = ' + IfThen(OldKisi_Id >0 , inttostr(OldKisi_Id), qEnvanter.FieldByName('kisi_id').AsString ) );
           oldenvanterRecCount := mainmod.qTmp.RecordCount;

           // deðiþim sonrasý  kaynak ve ilgili kiþi ye ait kontrol formu var ise pasife alýnýyor
            QueryOpen(qTmp2, 'SELECT * FROM data_checklist WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) +
                          ' AND kaynak_id = ' + qEnvanter.FieldByName('kaynak_id').AsString +
                          ' AND kisi_id = ' + qEnvanter.FieldByName('kisi_id').AsString );
            if not (oldenvanterRecCount > 0) then
            if qTmp2.RecordCount > 0 then
            begin
              qtmp2.Edit;
              qtmp2.FieldByName('active').AsString := 'H';
              qtmp2.Post;
              qtmp2.ApplyUpdates();
              qtmp2.CommitUpdates;
            end;

           // eski   kaynak ve ilgili kiþi ye ait kontrol formu var ise kisi_id yenisi ile deðiþtiriliyor
            QueryOpen(qTmp2, 'SELECT * FROM data_checklist WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) +
                          ' AND kaynak_id = ' + IfThen(oldKaynak_Id >0 , IntToStr(OldKaynak_Id),qEnvanter.FieldByName('kaynak_id').AsString) +
                          ' AND kisi_id = ' + IfThen(OldKisi_Id > 0 , inttostr(OldKisi_Id),qEnvanter.FieldByName('kisi_id').AsString ) );
           if not (oldenvanterRecCount > 0) then
           if qtmp2.RecordCount>0 then
           begin
              qtmp2.Edit;
              qtmp2.FieldByName('kisi_id').AsInteger := qEnvanter.FieldByName('kisi_id').AsInteger;
              qtmp2.FieldByName('kaynak_id').AsInteger := qEnvanter.FieldByName('kaynak_id').AsInteger;
              qtmp2.post;
              qtmp2.ApplyUpdates();
              qtmp2.CommitUpdates;
           end;
            // sonkez kaynak ve ilgili kisi ye ait kontrol formu oluþmamýþ ise yeni oluþturulyor
            QueryOpen(qTmp2, 'SELECT * FROM data_checklist WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) +
                          ' AND kaynak_id = ' + qEnvanter.FieldByName('kaynak_id').AsString +
                          ' AND kisi_id = ' + qEnvanter.FieldByName('kisi_id').AsString );
            if (qTmp2.RecordCount = 0 ) and (qEnvanter.FieldByName('active').AsString ='E') then
            begin
                  qTmp2.Insert;
                  qTmp2.FieldByName('active').AsString     := 'E';
                  qTmp2.FieldByName('tarih').AsDateTime := now;
                  qTmp2.FieldByName('kaynak_id').AsInteger := qEnvanter.FieldByName('kaynak_Id').AsInteger;
                  qTmp2.FieldByName('kisi_id').AsInteger   := qEnvanter.FieldByName('kisi_id').AsInteger;
                  qTmp2.FieldByName('kilitli').AsString    := 'H';
                  qTmp2.FieldByName('kontrol_id').AsInteger := kontrolId;
                  qTmp2.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_data_checklist_id');
                  qTmp2.FieldByName('mc_id').AsInteger  := MainMod.MCID;
                  qTmp2.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
                  qTmp2.FieldByName('idt').AsDateTime   := Now;
              qtmp2.Post;
              qtmp2.ApplyUpdates();
              qtmp2.CommitUpdates;
            end ;
        end;

//        qEnvDet.First;
//        if not qEnvDet.Eof then
//        begin
//         if not VqEnvDet.Locate('id',qEnvDet.FieldByName('id').AsInteger,[loCaseInsensitive]) then
//         begin
//          qEnvDet.Delete;
//         end;
//          qEnvDet.Next;
//        end;

        qEnvDet.First;
        while not qEnvDet.Eof do
        begin
          if not VqEnvDet.Locate('id', qEnvDet.FieldByName('id').AsInteger, [loCaseInsensitive]) then
          begin
            qEnvDet.Delete;
          end
          else
            qEnvDet.Next;
        end;

        vqEnvDet.First;
        while not vqEnvDet.EOF do
        begin
          if VqEnvDet.FieldByName('id').AsInteger = 0 then
          begin
            qEnvDet.Insert;
            qEnvDet.FieldByName('id').AsInteger := MainMod.GetSeq('sq_data_envanter_id');
          end else
          begin
            if not qEnvDet.Locate('id', vqEnvDet.FieldByName('id').AsInteger, [loCaseInsensitive]) then
            begin
              Continue;
              VqEnvDet.Next;
            end;
            qEnvDet.Edit;
          end;



          qEnvDet.FieldByName('active').AsString              := qEnvanter.FieldByName('active').AsString;
          qEnvDet.FieldByName('idy').AsInteger                := qEnvanter.FieldByName('idy').AsInteger;
          qEnvDet.FieldByName('idt').AsDateTime               := qEnvanter.FieldByName('idt').AsDateTime;
          qEnvDet.FieldByName('sdy').AsInteger                := qEnvanter.FieldByName('sdy').AsInteger;
          qEnvDet.FieldByName('sdt').AsDateTime               := qEnvanter.FieldByName('sdt').AsDateTime;
          qEnvDet.FieldByName('tarih').AsDateTime             := qEnvanter.FieldByName('tarih').AsDateTime;
          qEnvDet.FieldByName('dept_id').AsInteger            := qEnvanter.FieldByName('dept_id').AsInteger;
          qEnvDet.FieldByName('surec_id').AsInteger           := qEnvanter.FieldByName('surec_id').AsInteger;
          qEnvDet.FieldByName('kaynak_id').AsInteger          := qEnvanter.FieldByName('kaynak_id').AsInteger;
          qEnvDet.FieldByName('kisi_id').AsInteger            := qEnvanter.FieldByName('kisi_id').AsInteger;
          qEnvDet.FieldByName('sakl_sanalonlem').AsString     := qEnvanter.FieldByName('sakl_sanalonlem').AsString;
          qEnvDet.FieldByName('sakl_fizikselonlem').AsString  := qEnvanter.FieldByName('sakl_fizikselonlem').AsString;
          qEnvDet.FieldByName('payl_sozlesme').AsString       := qEnvanter.FieldByName('payl_sozlesme').AsString;
          qEnvDet.FieldByName('payl_sozisim').AsString        := qEnvanter.FieldByName('payl_sozisim').AsString;
          qEnvDet.FieldByName('payl_sozmadde').AsString       := qEnvanter.FieldByName('payl_sozmadde').AsString;
          qEnvDet.FieldByName('dgr_politika').AsString        := qEnvanter.FieldByName('dgr_politika').AsString;
          qEnvDet.FieldByName('dgr_polisim').AsString         := qEnvanter.FieldByName('dgr_polisim').AsString;
          qEnvDet.FieldByName('dgr_polmadde').AsString        := qEnvanter.FieldByName('dgr_polmadde').AsString;
          qEnvDet.FieldByName('dgr_sozlesme').AsString        := qEnvanter.FieldByName('dgr_sozlesme').AsString;
          qEnvDet.FieldByName('dgr_sozisim').AsString         := qEnvanter.FieldByName('dgr_sozisim').AsString;
          qEnvDet.FieldByName('dgr_sozmadde').AsString        := qEnvanter.FieldByName('dgr_sozmadde').AsString;
          qEnvDet.FieldByName('dgr_dayanak_ids').AsString     := qEnvanter.FieldByName('dgr_dayanak_ids').AsString;
          qEnvDet.FieldByName('dgr_dokuman_ids').AsString     := qEnvanter.FieldByName('dgr_dokuman_ids').AsString;
          qEnvDet.FieldByName('payl_taraftipi').AsString      := qEnvanter.FieldByName('payl_taraftipi').AsString;
          qEnvDet.FieldByName('sakl_ssure_tip').AsString      := qEnvanter.FieldByName('sakl_ssure_tip').AsString;
          qEnvDet.FieldByName('sakl_fsure_tip').AsString      := qEnvanter.FieldByName('sakl_fsure_tip').AsString;
          qEnvDet.FieldByName('sakl_ssure_sure').AsInteger    := qEnvanter.FieldByName('sakl_ssure_sure').AsInteger;
          qEnvDet.FieldByName('sakl_fsure_sure').AsInteger    := qEnvanter.FieldByName('sakl_fsure_sure').AsInteger;
          qEnvDet.FieldByName('sakl_ssure_diger').AsString    := qEnvanter.FieldByName('sakl_ssure_diger').AsString;
          qEnvDet.FieldByName('sakl_fsure_diger').AsString    := qEnvanter.FieldByName('sakl_fsure_diger').AsString;
          qEnvDet.FieldByName('sakl_ssure_imha').AsString     := qEnvanter.FieldByName('sakl_ssure_imha').AsString;
          qEnvDet.FieldByName('sakl_fsure_imha').AsString     := qEnvanter.FieldByName('sakl_fsure_imha').AsString;
          qEnvDet.FieldByName('sakl_ssure_var').AsString      := qEnvanter.FieldByName('sakl_ssure_var').AsString;
          qEnvDet.FieldByName('sakl_fsure_var').AsString      := qEnvanter.FieldByName('sakl_fsure_var').AsString;
          qEnvDet.FieldByName('sakl_ssure').AsString          := qEnvanter.FieldByName('sakl_ssure').AsString;
          qEnvDet.FieldByName('sakl_fsure').AsString          := qEnvanter.FieldByName('sakl_fsure').AsString;

          qEnvDet.FieldByName('main_id').AsInteger      := vqEnvDet.FieldByName('main_id').AsInteger ;
          qEnvDet.FieldByName('mc_id').AsInteger        := vqEnvDet.FieldByName('mc_id').AsInteger ;
          qEnvDet.FieldByName('veritipi_id').AsInteger  := vqEnvDet.FieldByName('veritipi_id').AsInteger ;
          qEnvDet.FieldByName('kategori_id').AsInteger  := vqEnvDet.FieldByName('kategori_id').AsInteger ;
          qEnvDet.FieldByName('nitelik').AsString       := vqEnvDet.FieldByName('nitelik').AsString   ;

          qEnvDet.Post;
          vqEnvDet.Next;
        end;


             try
              MainMod.DBMain.StartTransaction;
              qEnvDet.ApplyUpdates();
              qEnvDet.CommitUpdates;
              MainMod.DBMain.Commit;
            except
              qEnvDet.CancelUpdates;
              MainMod.DBMain.Rollback;
            end;
            ModalResult := mrOk;

end;

procedure TfrmEnvanterTanim2test.postCopy ;
var
  kontrolId : integer;
  oldenvanterRecCount : integer;
  I: Integer;
begin
        if not (vqenvanter.State in [dsEdit, dsInsert]) then
           vqenvanter.Edit;

        vqEnvanter.FieldByName('idy').AsInteger      := MainMod.LoginInfo.ID;
        vqEnvanter.FieldByName('idt').AsDateTime     := Now;
        vqEnvanter.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
        vqEnvanter.FieldByName('sdt').AsDateTime     := Now;

        vqEnvanter.FieldByName('nitelik').AsString := GetMainNitelik(VqEnvDet);
        vqEnvanter.Post;



        if not (qEnvanter.State in [dsInsert, dsEdit]) then
          qEnvanter.Edit;
        for I := 0 to vqenvanter.FieldCount-1 do
        begin
           if (vqenvanter.Fields[i].FieldName = 'veritipi_id' ) or (vqenvanter.Fields[i].FieldName = 'kategori_id' )  then
           begin
              qenvanter.Fields[i].Clear;
              Continue;
           end;
//           if vqenvanter.Fields[i].FieldName = 'id' then
//            begin
//               qEnvanter.FieldByName('id').AsInteger :=  MainMod.GetSeq('sq_data_envanter_id');
//               Continue;
//            end;
          qEnvanter.Fields[i].Value := vqenvanter.Fields[i].Value;
        end;
        qEnvanter.Post;

        vqEnvDet.First;
        while not vqEnvDet.EOF do
        begin

          vqEnvDet.Edit;
          VqEnvDet.FieldByName('id').AsInteger                 := MainMod.GetSeq('sq_data_envanter_id');
          vqEnvDet.FieldByName('active').AsString              := qEnvanter.FieldByName('active').AsString;
          vqEnvDet.FieldByName('idy').AsInteger                := qEnvanter.FieldByName('idy').AsInteger;
          vqEnvDet.FieldByName('idt').AsDateTime               := qEnvanter.FieldByName('idt').AsDateTime;
          vqEnvDet.FieldByName('sdy').AsInteger                := qEnvanter.FieldByName('sdy').AsInteger;
          vqEnvDet.FieldByName('sdt').AsDateTime               := qEnvanter.FieldByName('sdt').AsDateTime;
          vqEnvDet.FieldByName('tarih').AsDateTime             := qEnvanter.FieldByName('tarih').AsDateTime;
          vqEnvDet.FieldByName('dept_id').AsInteger            := qEnvanter.FieldByName('dept_id').AsInteger;
          vqEnvDet.FieldByName('surec_id').AsInteger           := qEnvanter.FieldByName('surec_id').AsInteger;
          vqEnvDet.FieldByName('kaynak_id').AsInteger          := qEnvanter.FieldByName('kaynak_id').AsInteger;
          vqEnvDet.FieldByName('kisi_id').AsInteger            := qEnvanter.FieldByName('kisi_id').AsInteger;
          vqEnvDet.FieldByName('sakl_sanalonlem').AsString     := qEnvanter.FieldByName('sakl_sanalonlem').AsString;
          vqEnvDet.FieldByName('sakl_fizikselonlem').AsString  := qEnvanter.FieldByName('sakl_fizikselonlem').AsString;
          vqEnvDet.FieldByName('payl_sozlesme').AsString       := qEnvanter.FieldByName('payl_sozlesme').AsString;
          vqEnvDet.FieldByName('payl_sozisim').AsString        := qEnvanter.FieldByName('payl_sozisim').AsString;
          vqEnvDet.FieldByName('payl_sozmadde').AsString       := qEnvanter.FieldByName('payl_sozmadde').AsString;
          vqEnvDet.FieldByName('dgr_politika').AsString        := qEnvanter.FieldByName('dgr_politika').AsString;
          vqEnvDet.FieldByName('dgr_polisim').AsString         := qEnvanter.FieldByName('dgr_polisim').AsString;
          vqEnvDet.FieldByName('dgr_polmadde').AsString        := qEnvanter.FieldByName('dgr_polmadde').AsString;
          vqEnvDet.FieldByName('dgr_sozlesme').AsString        := qEnvanter.FieldByName('dgr_sozlesme').AsString;
          vqEnvDet.FieldByName('dgr_sozisim').AsString         := qEnvanter.FieldByName('dgr_sozisim').AsString;
          vqEnvDet.FieldByName('dgr_sozmadde').AsString        := qEnvanter.FieldByName('dgr_sozmadde').AsString;
          vqEnvDet.FieldByName('dgr_dayanak_ids').AsString     := qEnvanter.FieldByName('dgr_dayanak_ids').AsString;
          vqEnvDet.FieldByName('dgr_dokuman_ids').AsString     := qEnvanter.FieldByName('dgr_dokuman_ids').AsString;
          vqEnvDet.FieldByName('payl_taraftipi').AsString      := qEnvanter.FieldByName('payl_taraftipi').AsString;
          vqEnvDet.FieldByName('sakl_ssure_tip').AsString      := qEnvanter.FieldByName('sakl_ssure_tip').AsString;
          vqEnvDet.FieldByName('sakl_fsure_tip').AsString      := qEnvanter.FieldByName('sakl_fsure_tip').AsString;
          vqEnvDet.FieldByName('sakl_ssure_sure').AsInteger    := qEnvanter.FieldByName('sakl_ssure_sure').AsInteger;
          vqEnvDet.FieldByName('sakl_fsure_sure').AsInteger    := qEnvanter.FieldByName('sakl_fsure_sure').AsInteger;
          vqEnvDet.FieldByName('sakl_ssure_diger').AsString    := qEnvanter.FieldByName('sakl_ssure_diger').AsString;
          vqEnvDet.FieldByName('sakl_fsure_diger').AsString    := qEnvanter.FieldByName('sakl_fsure_diger').AsString;
          vqEnvDet.FieldByName('sakl_ssure_imha').AsString     := qEnvanter.FieldByName('sakl_ssure_imha').AsString;
          vqEnvDet.FieldByName('sakl_fsure_imha').AsString     := qEnvanter.FieldByName('sakl_fsure_imha').AsString;
          vqEnvDet.FieldByName('sakl_ssure_var').AsString      := qEnvanter.FieldByName('sakl_ssure_var').AsString;
          vqEnvDet.FieldByName('sakl_fsure_var').AsString      := qEnvanter.FieldByName('sakl_fsure_var').AsString;
          vqEnvDet.FieldByName('sakl_ssure').AsString          := qEnvanter.FieldByName('sakl_ssure').AsString;
          vqEnvDet.FieldByName('sakl_fsure').AsString          := qEnvanter.FieldByName('sakl_fsure').AsString;

          vqEnvDet.FieldByName('main_id').AsInteger      := qEnvanter.FieldByName('id').AsInteger ;
          vqEnvDet.FieldByName('mc_id').AsInteger        := vqEnvDet.FieldByName('mc_id').AsInteger ;
          vqEnvDet.FieldByName('veritipi_id').AsInteger  := vqEnvDet.FieldByName('veritipi_id').AsInteger ;
          vqEnvDet.FieldByName('kategori_id').AsInteger  := vqEnvDet.FieldByName('kategori_id').AsInteger ;
          vqEnvDet.FieldByName('nitelik').AsString       := vqEnvDet.FieldByName('nitelik').AsString   ;

          vqEnvDet.Post;
          vqEnvDet.Next;
        end;



              QueryOpen(qEnvDet,'select * from data_envanter where id= 0');
              qEnvDet.CachedUpdates := true;

               vqEnvDet.First;
               while not vqEnvDet.Eof do
               begin
                qEnvDet.Append;
                 for I := 0 to qEnvDet.Fields.Count - 1 do
                   begin
//                     qEnvDet.Fields[i].Value := vqEnvDet.Fields[i].Value;
                    if vqEnvDet.FindField(qEnvDet.Fields[I].FieldName) <> nil then
                      qEnvDet.Fields[I].Value := vqEnvDet.FieldByName(qEnvDet.Fields[I].FieldName).Value;
                   end;
                qEnvDet.Post;
                qEnvDet.ApplyUpdates;
                vqEnvDet.Next;
               end;

              try
                MainMod.DBMain.StartTransaction;
                qEnvDet.CancelUpdates;
//                qEnvanter.CancelUpdates;
                MainMod.DBMain.Commit;
              except
                qEnvDet.CancelUpdates;
//                qEnvanter.CancelUpdates;
                MainMod.DBMain.Rollback;
              end;

  ModalResult := mrOk;
end;

procedure TfrmEnvanterTanim2test.btnPostClick(Sender: TObject);
var
kontrolId : integer;
NewenvanterRecCount : integer;
oldenvanterRecCount : integer;
//AQenvanter,Aqdetail : TUniQuery;
NewEnvId : integer;
  I: Integer;
begin
if EnvCopy then
begin
  postCopy;
  exit;
end;
if (NOT multichange) or (EnvCopy) then
begin
  postMonoChange;
  exit;
end;
if MultiChange then
begin
  PostMultiChange;
  exit;
end;
end;

function TfrmEnvanterTanim2test.DegerGetir(Aid : integer; Afield: string; Atable : Tdataset) : string;
begin
  result := '';
  if Atable.Locate('id',Aid,[]) then
    result := Atable.FieldByName(afield).AsString;

end;

function TfrmEnvanterTanim2test.CheckID(AID: Integer; ATable: TVirtualTable): Boolean;
begin
  Result := False;
  ATable.First;
  while not ATable.EOF do
  begin
    if ATable.FieldByName('id').AsInteger = AID then
    begin
      Result := True;
      Break;
    end;
    ATable.Next;
  end;
end;

function TfrmEnvanterTanim2test.CheckVTID(AID: Integer): Boolean;
var
  OldID : Integer;
begin
  Result := False;
  DetailLoading := True;
  VqEnvDet.DisableControls;
  OldID := VqEnvDet.FieldByName('id').AsInteger;
  VqEnvDet.First;
  while not VqEnvDet.EOF do
  begin
    if VqEnvDet.FieldByName('veritipi_id').AsInteger = AID then
    begin
      Result := True;
      Break;
    end;
    VqEnvDet.Next;
  end;

  VqEnvDet.Locate('id', OldID, []);
  VqEnvDet.EnableControls;
  DetailLoading := False;

end;

procedure TfrmEnvanterTanim2test.CloseTables;
begin
  qDept.Close;
  qSurec.Close;
  qKaynak.Close;
  qKisi.Close;
  qOnem.Close;
  qEnvDet.Close;

end;



procedure TfrmEnvanterTanim2test.DelMetodSakControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;


end;

procedure TfrmEnvanterTanim2test.DelMetodSakDControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

end;

procedure TfrmEnvanterTanim2test.DelMetodTopControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;


end;

procedure TfrmEnvanterTanim2test.DelMetodTopDControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;


end;

procedure TfrmEnvanterTanim2test.DelMetodPayControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;


end;

procedure TfrmEnvanterTanim2test.DelMetodPayDControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;


end;

procedure TfrmEnvanterTanim2test.DelAmacTopControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;


end;

procedure TfrmEnvanterTanim2test.DelAmacTopDControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;


end;

procedure TfrmEnvanterTanim2test.DelAmacSakControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;


end;

procedure TfrmEnvanterTanim2test.DelAmacSakDControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;


end;

procedure TfrmEnvanterTanim2test.DelAmacPayControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;


end;

procedure TfrmEnvanterTanim2test.DelAmacPayDControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;


end;

procedure TfrmEnvanterTanim2test.DelTarafControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;


end;

procedure TfrmEnvanterTanim2test.DelTarafDControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;


end;

procedure TfrmEnvanterTanim2test.DelVeriTipiControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

end;

procedure TfrmEnvanterTanim2test.dsEnvanterDataChange(Sender: TObject;
  Field: TField);
begin
  if dsEnvanter.DataSet.FieldByName('active').isnull then
    lbactive.Caption := 'Seçim Yapýlmamýþ'
  else if   dsEnvanter.DataSet.FieldByName('active').AsString ='H' then
    lbactive.Caption := 'Hayýr'
  else if   dsEnvanter.DataSet.FieldByName('active').AsString ='E' then
    lbactive.Caption := 'Evet' ;
end;

procedure TfrmEnvanterTanim2test.dsEnvanterStateChange(Sender: TObject);
begin
  ManageSettings;
end;

procedure TfrmEnvanterTanim2test.DelDeptControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

end;

procedure TfrmEnvanterTanim2test.DelDeptDControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;


end;

procedure TfrmEnvanterTanim2test.DelDgrDayanakControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;


end;

procedure TfrmEnvanterTanim2test.DelDgrDocsControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;


end;

procedure TfrmEnvanterTanim2test.edFSureVarChange(Sender: TObject);
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

procedure TfrmEnvanterTanim2test.edKaynakChange(Sender: TObject);

var
  KaynakId ,
  KisiId   : String;
begin
  KaynakId := qEnvanter.FieldByName('kaynak_id').AsString;
  KisiId   := qEnvanter.FieldByName('kisi_id').AsString;
  if KaynakId = '' then KaynakId := '0';
  if KisiId = '' then KisiId := '0';

  QueryOpen(qCheckList, 'SELECT * FROM data_checklist ' +
                        'WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) +
                        ' AND kaynak_id = ' + KaynakId + ' AND kisi_id = ' + KisiId);
  if not qCheckList.IsEmpty then
    Kontrol_id := StrToIntDef(qCheckList.FieldByName('id').AsString,0);

end;

procedure TfrmEnvanterTanim2test.edSSureVarChange(Sender: TObject);
begin
 if edSSureVar.Text = 'SAKLANIYOR' then
  begin
    edSImha.Enabled := True;
    edsSure.Enabled := True;
    edsSureTip.Enabled := True;
  end
  else
  begin
    edsImha.Enabled := False;
    edsSure.Enabled := False;
    edsSureTip.Enabled := False;
  end;

end;

function TfrmEnvanterTanim2test.Exec(AIds: string): integer;
begin
  MultiChange := true;
  EnvCopy := false;
  Envids := AIds;

  QueryOpen(qEnvanter, 'SELECT * FROM data_envanter WHERE id =0 ');
   CopyFieldsFromQueryToVirtualTable(qEnvanter,vqenvanter);

   vqenvanter.Open;
   vqenvanter.Insert;
   vqEnvanter.FieldByName('id').AsInteger := 0;
   dsEnvanter.DataSet := vqenvanter;


   CopyFieldsFromQueryToVirtualTable(qEnvanter,VqEnvDet);
   dsEnvDet.DataSet := VqEnvDet;
   VqEnvDet.Open;

    dsEnvanter.AutoEdit := true;
    YardimKw := 'EnvanterFormlariDegistir';

  PrepareTables;
  HideMask;
  Result := ShowModal;
  CloseTables;
end;

function TfrmEnvanterTanim2test.copy(AId: integer): integer;
VAR
NewEnvId : integer;
begin
  EnvCopy := true;
  MultiChange := false;

    QueryOpen(qEnvanter, 'SELECT * FROM data_envanter WHERE id = ' + IntToStr(AID));
    CopyFieldsFromQueryToVirtualTable(qEnvanter,vqenvanter,true);

    QueryOpen(qEnvDet,' SELECT k.kategori kategori_str ,v.veri_tipi veritipi_str, ' +
    ' e.* FROM data_envanter e ' +
    ' join def_data_kategori k on k.id=e.kategori_id ' +
    ' join def_data_veritipi v on v.id = e.veritipi_id ' +
    ' WHERE e.main_id = '  + IntToStr(AID)) ;
    CopyFieldsFromQueryToVirtualTable(qEnvDet,VqEnvDet,true);


    QueryOpen(qEnvanter, 'SELECT * FROM data_envanter WHERE id =  0 ');

    AID := MainMod.GetSeq('sq_data_envanter_id');
    vqenvanter.Edit;
    vqenvanter.FieldByName('id').asinteger := aid;
    vqenvanter.Post;

    VqEnvDet.First;
    while not VqEnvDet.Eof do
    begin
      VqEnvDet.Edit;
      VqEnvDet.FieldByName('main_id').AsInteger := AId;
      VqEnvDet.Post;
      VqEnvDet.Next;
    end;

    dsEnvanter.DataSet := vqenvanter;
    dsEnvDet.DataSet := VqEnvDet ;
    qEnvanter.Insert;


  PrepareTables;

  edFSureVarChange(edFSureVar);
  edSSureVarChange(edSSureVar) ;
  ActiveControl := edTarih;
  HideMask;
  Result := ShowModal;
  CloseTables;

end;

function TfrmEnvanterTanim2test.Exec(AID, AOp, kilitli: Integer): Integer;
begin
  detailKilitli := ( kilitli = 1 );
  MultiChange := false;
  EnvCopy := false;
  envanter_id := 0;
  Kontrol_id := 0;
  if AOp = 0 then State := stInsert;
  if AOp = 1 then State := stedit;



  if State = stedit then
  begin
    QueryOpen(qEnvanter, 'SELECT * FROM data_envanter WHERE main_id = 0 and id = ' + IntToStr(AID));
    CopyFieldsFromQueryToVirtualTable( qEnvanter,vqenvanter, true ) ;
    QueryOpen(qEnvDet,' SELECT k.kategori kategori_str ,v.veri_tipi veritipi_str, ' +
    ' e.* FROM data_envanter e ' +
    ' join def_data_kategori k on k.id=e.kategori_id ' +
    ' join def_data_veritipi v on v.id = e.veritipi_id ' +
    ' WHERE e.main_id = '  + IntToStr(AID)) ;
    CopyFieldsFromQueryToVirtualTable(qEnvDet,VqEnvDet, true);
    dsEnvanter.DataSet := vqenvanter;
    dsEnvDet.DataSet := VqEnvDet ;

    if not qEnvanter.IsEmpty then
      envanter_id := StrToIntDef( vqenvanter.FieldByName('id').AsString , 0);

    edKaynakChange(edKaynak);
    PrepareTables;

    if  detailkilitli then
    begin
      vqEnvanter.ReadOnly := true;
      VqEnvDet.ReadOnly := true;
    end else
    begin
      vqEnvanter.ReadOnly := false;
      VqEnvDet.ReadOnly := false;
      vqEnvanter.edit ;
      VqEnvDet.edit;
    end;

  end
  else if State = stInsert then
  begin
    AID := MainMod.GetSeq('sq_data_envanter_id');
    QueryOpen(qEnvanter, 'SELECT * FROM data_envanter WHERE id = 0 ');
    CopyFieldsFromQueryToVirtualTable( qEnvanter,vqenvanter, false ) ;
    QueryOpen(qEnvDet,' SELECT k.kategori kategori_str ,v.veri_tipi veritipi_str, ' +
    ' e.* FROM data_envanter e ' +
    ' join def_data_kategori k on k.id=e.kategori_id ' +
    ' join def_data_veritipi v on v.id = e.veritipi_id ' +
    ' WHERE e.id = 0 '  ) ;
    CopyFieldsFromQueryToVirtualTable(qEnvDet,VqEnvDet, false);

    vqEnvanter.Insert;
    vqEnvanter.FieldByName('id').AsInteger              := AID;
    vqEnvanter.FieldByName('mc_id').AsInteger           := MainMod.MCID;
    vqEnvanter.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    vqEnvanter.FieldByName('idt').AsDateTime   := Now;
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
    YardimKw := 'EnvanterFormlariYeniKayit';

    dsEnvanter.DataSet := vqenvanter;
    dsEnvDet.DataSet := VqEnvDet ;
    qEnvanter.Insert;

  end ;
  PrepareTables;

  edFSureVarChange(edFSureVar);
  edSSureVarChange(edSSureVar) ;
  ActiveControl := edTarih;
  PrepareDetails;
  HideMask;
  Result := ShowModal;

  CloseTables;
end;

function TfrmEnvanterTanim2test.GetMainNitelik(Adataset: tdataset = nil): String;
begin
  Result := 'H';
  if Adataset = nil then
  Adataset := qenvDet;

    Adataset.First;
    while not Adataset.EOF do
    begin
      if Adataset.FieldByName('nitelik').AsString = 'E' then
      begin
        Result := 'E';
        Break;
      end;
      Adataset.Next;
    end;

end;

procedure TfrmEnvanterTanim2test.grdVeriTipiDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
  Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if grdVeriTipi.DataSource.DataSet.FieldByName('nitelik').AsString = 'E' then
  begin
    Attribs.Font.Style := [fsBold];
    Attribs.Font.Color := clMaroon;
  end;
end;

function TfrmEnvanterTanim2test.ListToStr(ATable: TVirtualTable): String;
var
  sTmp : String;
begin
  sTmp := '';
  ATable.First;
  while not ATable.EOF do
  begin
    sTmp := sTmp + ATable.FieldByName('id').AsString + ',';
    ATable.Next;
  end;

  if Length(sTmp) > 0 then System.Delete(sTmp, Length(sTmp), 1);
  Result := sTmp;
end;



procedure TfrmEnvanterTanim2test.ManageSettings;
begin

  pnlMsg.Visible := EnvCopy;

  grdAmacTopD.Visible := false;
  grdMetodTopD.Visible := false;
  grdAmacSakD.Visible := false;
  grdMetodSakD.Visible := false;
  grdDeptsD.Visible := false;
  grdAmacPayD.Visible := false;
  grdMetodPayD.Visible := false;
  grdTarafD.Visible := false;


 if (not MultiChange) and ( dsEnvanter.DataSet <> nil) then
 begin
  btnpost.Enabled := not detailkilitli ; //dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  btnEnvDetAdd.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  btnEnvDetDel.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  btnAmacTopAdd.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  btnAmacTopDel.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  btnAmacTopNew.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];

  btnAmacPayAdd.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  btnAmacPayDel.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  btnAmacPayNew.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];

  btnAmacSakAdd.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  btnAmacSakDel.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  btnAmacSakNew.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];

  btnMetodTopAdd.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  btnMetodTopDel.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  btnMetodTopNew.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];

  btnMetodPayAdd.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  btnMetodPayDel.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  btnMetodPayNew.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];

  btnMetodSakAdd.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  btnMetodSakDel.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  btnMetodSakNew.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];

  btnTarafAdd.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  btnTarafDel.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  btnTarafNew.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];

  btnDgrDayanakAdd.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  btnDgrDayanakDel.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  btnDgrDayanakNew.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  btnDgrDocsAdd.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  btnDgrDocsDel.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  btnDgrDocsNew.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  edActive.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  btnDeptsAdd.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  btnDeptsDel.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  btnDeptsNew.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];


  edSSureVar.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  edFSureVar.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  edFImha.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  edSImha.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  edFSureTip.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  edSSureTip.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];
  chbKategori.Enabled := dsEnvanter.DataSet.State in [dsEdit, dsInsert];

  rgVeritipi.Visible := MultiChange;
  rgmetodvt.Visible := MultiChange;
  rgamacvs.Visible := MultiChange;
  rgmetodvs.Visible := MultiChange;
  rgveriErisim.Visible := MultiChange;
  rgamacvp.Visible := MultiChange;
  rgmetodvp.Visible := MultiChange;
  rgPaylasilanTaraf.Visible := MultiChange;
  rgamacvt.Visible := MultiChange;
  rgdgrDayanak.Visible := MultiChange;
  rgdgrdoc.Visible := MultiChange;
 end
 else
 begin
  edKaynak.ReadOnly := MultiChange;
  pgHukuk.Visible := false;
 end;


end;

procedure TfrmEnvanterTanim2test.PrepareDetails;
begin

end;

procedure TfrmEnvanterTanim2test.StrToListDetails;
begin


end;

procedure TfrmEnvanterTanim2test.PrepareTables;
var
  Birimler : String;
begin
  Birimler := MainMod.LoginInfo.Birimler;
  if Birimler = '' then Birimler := '0';

  QueryOpen(qDept,' SELECT d.id, ' +
  ' (case when (coalesce(d.main_dept_id,0)=0) then d.title else d.title||'' (''||md.title||'')'' end)::varchar(410) as title ' +
  ' FROM sys_deptdef d ' +
  ' left join sys_deptdef md on md.id=d.main_dept_id ' +
  ' WHERE d.active = ''E'' AND d.mc_id =' + IntToStr(MainMod.MCID) +
  ' AND d.id IN (' + Birimler + ') ORDER BY title');


//  QueryOpen(qDept, 'SELECT id, title FROM sys_deptdef WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) +
//                   ' AND id IN (' + Birimler + ') ORDER BY title');
  QueryOpen(qSurec, 'SELECT id, surec FROM def_data_surec WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY surec');
  QueryOpen(qKaynak, 'SELECT id, kaynak FROM def_data_kaynak WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY kaynak');
  QueryOpen(qKisi, 'SELECT id, kisi FROM def_data_kisi WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY kisi');
  QueryOpen(qOnem, 'SELECT id, onemderece FROM def_data_onemderece WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY onemderece');

  DetayGuncelle;

end;

procedure TfrmEnvanterTanim2test.DetayGuncelle;
begin
  if not vqenvanter.IsEmpty then
  begin
    if PgControl.ActivePage =  pgDDayanak then
    begin
      if not qdgrdayanaklar.Active then
        DgrDayanakGuncelle;
      if not qdgrdokumanlar.Active then
        DgrDokumanGuncelle;
    end;
    if not qCheckList.IsEmpty then
     begin
      if PgControl.ActivePage = pgHukuk then
      begin
        if not qhkkdokumanlar.Active then
          HKKDokumanGuncelle;
        if not qhkkdayanaklar.Active then
          HKKDayanakGuncelle;
      end;
    end;
    if PgControl.ActivePage = pgDetay  then
    begin
      if ( pgdetaycontrol.ActivePage = pgTopl_Amac ) and ( not qtamaclar.Active  ) then
        toplamaAmacGuncelle;
      if ( pgdetaycontrol.ActivePage = pgSakl_Amac ) and (not qsamaclar.Active )  then
        saklamaAmacGuncelle;
      if ( pgdetaycontrol.ActivePage = pgPayl_Amac ) and ( not qpamaclar.Active ) then
        paylasmaAmacGuncelle;
      if ( pgdetaycontrol.ActivePage = pgTopl_Metod ) and ( not qtmetodlar.Active )  then
        ToplamaMetodGuncelle;
      if ( pgdetaycontrol.ActivePage = pgSakl_Metod ) and ( not qsmetodlar.Active )  then
        SaklamaMetodGuncelle;
      if ( pgdetaycontrol.ActivePage = pgPayl_Metod ) and ( not qpmetodlar.Active )  then
        PaylasmaMetodGuncelle;
      if ( pgdetaycontrol.ActivePage = pgSakl_Erisim ) and ( not qdepartmanlar.Active )  then
        DepartmanGuncelle;
      if ( pgdetaycontrol.ActivePage = pgPayl_Taraf ) and ( not qtaraflar.Active )  then
        PaylasimTarafGuncelle;
    end;
  end;

end;

procedure TfrmEnvanterTanim2test.HKKDokumanGuncelle;
begin
// if qchecklist.FieldByName('dokuman_ids').AsString = '' then
//  exit;

 queryopen(qhkkdokumanlar, ' SELECT a.id, a.dokuman name  FROM def_data_dokuman a ' +
  ' WHERE  mc_id=' +   inttostr(mainmod.MCID) +
  ' and id= any(string_to_array('+ quotedstr(qchecklist.FieldByName('dokuman_ids').AsString) +
  ', '','')::int[]) ') ;
end;

procedure TfrmEnvanterTanim2test.DgrDokumanGuncelle;
begin
// if vqenvanter.FieldByName('dgr_dokuman_ids').AsString = '' then
//  exit;

 queryopen(qdgrdokumanlar, ' SELECT a.id, a.dokuman name  FROM def_data_dokuman a ' +
  ' WHERE  mc_id=' +   inttostr(mainmod.MCID) +
  ' and id= any(string_to_array('+ quotedstr(vqenvanter.FieldByName('dgr_dokuman_ids').AsString) +
  ', '','')::int[]) ') ;
end;

procedure TfrmEnvanterTanim2test.HKKDayanakGuncelle;
begin
// if qchecklist.FieldByName('dayanak_ids').AsString = '' then
//  exit;
 queryopen(qhkkdayanaklar, ' SELECT a.id, a.dayanak name  FROM def_data_dayanak a ' +
  ' WHERE  mc_id=' +   inttostr(mainmod.MCID) +
  ' and id= any(string_to_array('+ quotedstr(qchecklist.FieldByName('dayanak_ids').AsString) +
  ', '','')::int[]) ') ;
end;

procedure TfrmEnvanterTanim2test.DgrDayanakGuncelle;
begin
// if vqenvanter.FieldByName('dgr_dayanak_ids').AsString = '' then
//  exit;

 queryopen(qdgrdayanaklar, ' SELECT a.id, a.dayanak name  FROM def_data_dayanak a ' +
  ' WHERE  mc_id=' +   inttostr(mainmod.MCID) +
  ' and id= any(string_to_array('+ quotedstr(vqenvanter.FieldByName('dgr_dayanak_ids').AsString) +
  ', '','')::int[]) ') ;
end;

procedure TfrmEnvanterTanim2test.PaylasimTarafGuncelle;
begin
// if vqenvanter.FieldByName('payl_taraf_ids').AsString = '' then
// exit;

 queryopen(qtaraflar, ' SELECT a.id, a.taraf name  FROM def_data_taraf a ' +
  ' WHERE  mc_id=' +   inttostr(mainmod.MCID) +
  ' and id= any(string_to_array('+ quotedstr(vqenvanter.FieldByName('payl_taraf_ids').AsString) +
  ', '','')::int[]) ') ;
end;

procedure TfrmEnvanterTanim2test.DepartmanGuncelle;
begin
// if vqenvanter.FieldByName('sakl_erisim_ids').AsString = '' then
//  exit;
 queryopen(qdepartmanlar,
  ' SELECT A.ID, ' +
  ' ( ' +
  ' CASE ' +
  ' WHEN COALESCE ( A.main_dept_id, 0 ) > 0 THEN ' +
  ' A.title || '' ('' || md.title || '') '' ELSE A.title ' +
  ' END ' +
  ' ) :: VARCHAR ( 410 ) NAME ' +
  ' FROM ' +
  ' sys_deptdef ' +
  ' A LEFT JOIN sys_deptdef md ON md.ID = A.main_dept_id ' +
  ' WHERE ' +
  ' A.active = ''E'' ' +
  ' AND A.mc_id =' +   inttostr(mainmod.MCID) +
  ' AND A.ID = ANY ( string_to_array(' + quotedstr(vqenvanter.FieldByName('sakl_erisim_ids').AsString) +
  ', '','' ):: INT [] ) ' );

// queryopen(qdepartmanlar, ' SELECT a.id, a.title name  FROM sys_deptdef a ' +
//  ' WHERE a.active = ''E''  and mc_id=' +   inttostr(mainmod.MCID) +
//  ' and id= any(string_to_array('+ quotedstr(vqenvanter.FieldByName('sakl_erisim_ids').AsString) +
//  ', '','')::int[]) ') ;
end;

procedure TfrmEnvanterTanim2test.toplamaAmacGuncelle;
begin
//  if vqenvanter.FieldByName('topl_amac_ids').AsString = '' then
//    exit;

 queryopen(qtamaclar, ' SELECT a.id, a.amac name  FROM def_data_amac a ' +
  ' WHERE a.toplama = ''E''  and mc_id=' +   inttostr(mainmod.MCID) +
  ' and id= any(string_to_array('+ quotedstr(vqenvanter.FieldByName('topl_amac_ids').AsString) +
  ', '','')::int[]) ') ;
end;

procedure TfrmEnvanterTanim2test.saklamaAmacGuncelle;
begin
//  if vqenvanter.FieldByName('sakl_amac_ids').AsString = '' then
//    exit;

 queryopen(qsamaclar, ' SELECT a.id, a.amac name  FROM def_data_amac a ' +
  ' WHERE a.saklama = ''E''  and mc_id=' + inttostr(mainmod.MCID) +
  ' and id= any(string_to_array('+ quotedstr(vqenvanter.FieldByName('sakl_amac_ids').AsString) +
  ', '','')::int[]) ') ;
end;

procedure TfrmEnvanterTanim2test.paylasmaAmacGuncelle;
begin
//  if vqenvanter.FieldByName('payl_amac_ids').AsString = '' then
//    exit;

 queryopen(qpamaclar, ' SELECT a.id, a.amac name  FROM def_data_amac a ' +
  ' WHERE a.paylasma = ''E''  and mc_id=' +  inttostr(mainmod.MCID) +
  ' and id= any(string_to_array('+ quotedstr(vqenvanter.FieldByName('payl_amac_ids').AsString) +
  ', '','')::int[]) ') ;
end;

procedure TfrmEnvanterTanim2test.ToplamaMetodGuncelle;
begin
//  if vqenvanter.FieldByName('topl_metod_ids').AsString = '' then
//    exit;

 queryopen(qtmetodlar, ' SELECT a.id, a.metod name  FROM def_data_metod a '+
  ' WHERE a.toplama = ''E''  and mc_id=' +  inttostr(mainmod.MCID) +
  ' and id= any(string_to_array('+ quotedstr(vqenvanter.FieldByName('topl_metod_ids').AsString) +
  ', '','')::int[]) ') ;
end;

procedure TfrmEnvanterTanim2test.SaklamaMetodGuncelle;
begin
//  if vqenvanter.FieldByName('sakl_metod_ids').AsString = '' then
//    exit;

 queryopen(qsmetodlar, ' SELECT a.id, a.metod name  FROM def_data_metod a '+
  ' WHERE a.saklama = ''E''  and mc_id=' +  inttostr(mainmod.MCID) +
  ' and id= any(string_to_array('+ quotedstr(vqenvanter.FieldByName('sakl_metod_ids').AsString) +
  ', '','')::int[]) ') ;
end;

procedure TfrmEnvanterTanim2test.PaylasmaMetodGuncelle;
begin
//  if vqenvanter.FieldByName('payl_metod_ids').AsString = '' then
//    exit;

 queryopen(qpmetodlar, ' SELECT a.id, a.metod name  FROM def_data_metod a '+
  ' WHERE a.paylasma = ''E''  and mc_id=' +  inttostr(mainmod.MCID) +
  ' and id= any(string_to_array('+ quotedstr(vqenvanter.FieldByName('payl_metod_ids').AsString) +
  ', '','')::int[]) ') ;
end;

procedure TfrmEnvanterTanim2test.PgControlChange(Sender: TObject);
begin
  DetayGuncelle;
end;

procedure TfrmEnvanterTanim2test.pgdetaycontrolChange(Sender: TObject);
begin
  DetayGuncelle;
end;

procedure TfrmEnvanterTanim2test.qEnvanterBeforePost(DataSet: TDataSet);
begin
//  oldKaynak_Id := 0;
//  OldKisi_Id := 0;
//
//
//  if qEnvanter.State in [dsEdit] then
//   begin
//    if vqEnvanter.FieldByName('kaynak_id').OldValue <> qEnvanter.FieldByName('kaynak_id').NewValue  then
//      oldKaynak_Id := vqEnvanter.FieldByName('kaynak_id').OldValue;
//    if qEnvanter.FieldByName('kisi_id').OldValue <> qEnvanter.FieldByName('kisi_id').NewValue then
//      OldKisi_Id :=  qEnvanter.FieldByName('kisi_id').OldValue;
//    changeActive := qEnvanter.FieldByName('active').OldValue <> qEnvanter.FieldByName('active').NewValue;
//
//    if NOT ((qEnvanter.FieldByName('dept_id').NewValue<>qEnvanter.FieldByName('dept_id').OldValue ) or
//        (qEnvanter.FieldByName('surec_id').NewValue<>qEnvanter.FieldByName('surec_id').OldValue ) or
//        (qEnvanter.FieldByName('kaynak_id').NewValue<>qEnvanter.FieldByName('kaynak_id').OldValue ) or
//        (qEnvanter.FieldByName('kisi_id').NewValue<>qEnvanter.FieldByName('kisi_id').OldValue ) or
//        ( (qEnvanter.FieldByName('active').NewValue<>qEnvanter.FieldByName('active').OldValue) and
//        (qEnvanter.FieldByName('active').NewValue ='E')  ) )     then
//        exit;
//   end;
//
//  QueryOpen(qTmp,' select * from data_envanter where '+
//        IfThen(not MultiChange,'id <> '+qEnvanter.FieldByName('id').AsString+' and ','')+
//      ' mc_id = '+IntToStr(mainmod.MCID)+' and main_id=0 '+
//      ' and dept_id=' + VarToStr(qEnvanter.FieldByName('dept_id').NewValue ) +
//      ' and surec_id=' + VarToStr(qEnvanter.FieldByName('surec_id').NewValue ) +
//      ' and kaynak_id =' + VarToStr(qEnvanter.FieldByName('kaynak_id').NewValue ) +
//      ' and kisi_id =' + VarToStr(qEnvanter.FieldByName('kisi_id').NewValue ) );
//  if qTmp.RecordCount > 0 then
//   begin
//     ShowMessageN('Ayný departman, kaynak, sureç ve kiþiye ait  kayýt var. '+ #13#10+ ' iþleminiz iptal ediliyor ') ;
//     abort;
//   end;


end;



procedure TfrmEnvanterTanim2test.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmEnvanterTanim2test.UniFormBeforeShow(Sender: TObject);
begin
  Width := 945; Height := 550;
  PgControl.ActivePage := pgTemel;
  // Added by TEVFIK 31.05.2023 16:46:15
  pgdetaycontrol.ActivePageIndex := 0;
  DetailLoading := False;

    if EnvCopy then  exit;

  lbIDY.Caption := MainMod.KullaniciGetir(qEnvanter.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(qEnvanter.FieldByName('sdy').AsString);

  if dsEnvanter.State = dsEdit then
  begin
    if lbIDY.Text = '' then lbIDY.Text := 'SÝSTEM';
    if lbSDY.Text = '' then lbSDY.Text := 'SÝSTEM';
  end;

  if qEnvanter.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qEnvanter.FieldByName('idt').AsDateTime);
  if qEnvanter.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qEnvanter.FieldByName('sdt').AsDateTime);

end;

end.

