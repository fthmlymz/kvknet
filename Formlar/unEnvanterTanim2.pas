unit unEnvanterTanim2;

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
  TfrmEnvanterTanim2 = class(TUniForm)
    pnlData: TUniPanel;
    pnlButtons: TUniPanel;
    btnCancel: TUniBitBtn;
    btnPost: TUniBitBtn;
    qTmp: TUniQuery;
    PgControl: TUniPageControl;
    pgTemel: TUniTabSheet;
    pgHukuk: TUniTabSheet;
    pgSozlesmePolitika: TUniTabSheet;
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
    chbPaylSozlesme: TUniDBCheckBox;
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
    tblAmacTop: TVirtualTable;
    dsAmacTop: TUniDataSource;
    tblDepts: TVirtualTable;
    dsDepts: TUniDataSource;
    tblMetodSak: TVirtualTable;
    dsMetodSak: TUniDataSource;
    tblDgrDayanak: TVirtualTable;
    dsDgrDayanak: TUniDataSource;
    tblTaraf: TVirtualTable;
    dsTaraf: TUniDataSource;
    tblMetodPay: TVirtualTable;
    dsMetodPay: TUniDataSource;
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
    tblDgrDocs: TVirtualTable;
    dsDgrDocs: TUniDataSource;
    UniLabel38: TUniLabel;
    tblHkkDayanak: TVirtualTable;
    dsHkkDayanak: TUniDataSource;
    tblHkkDocs: TVirtualTable;
    dsHkkDocs: TUniDataSource;
    qCheckList: TUniQuery;
    dsCheckList: TUniDataSource;
    dsAmacSak: TUniDataSource;
    tblAmacSak: TVirtualTable;
    dsAmacPay: TUniDataSource;
    tblAmacPay: TVirtualTable;
    UniLabel18: TUniLabel;
    UniDBMemo6: TUniDBMemo;
    UniLabel22: TUniLabel;
    UniDBMemo8: TUniDBMemo;
    btnDgrDayanakNew: TUniBitBtn;
    btnDgrDocsNew: TUniBitBtn;
    UniLabel12: TUniLabel;
    qKisi: TUniQuery;
    dsKisi: TUniDataSource;
    UniLabel23: TUniLabel;
    edKisi: TUniDBLookupComboBox;
    tblMetodTop: TVirtualTable;
    dsMetodTop: TUniDataSource;
    btnHelp: TUniBitBtn;
    pgDetay: TUniTabSheet;
    qEnvDet: TUniQuery;
    dsEnvDet: TUniDataSource;
    UniPageControl1: TUniPageControl;
    pgTopl_Amac: TUniTabSheet;
    pgTopl_Metod: TUniTabSheet;
    pgTopl_Diger: TUniTabSheet;
    pgPayl_Amac: TUniTabSheet;
    pgPayl_Metod: TUniTabSheet;
    pgSakl_Amac: TUniTabSheet;
    grdAmacTop: TUniDBGrid;
    btnAmacTopAdd: TUniBitBtn;
    btnAmacTopDel: TUniBitBtn;
    btnAmacTopNew: TUniBitBtn;
    grdAmacTopD: TUniDBGrid;
    btnAmacTopDAdd: TUniBitBtn;
    btnAmacTopDDel: TUniBitBtn;
    btnAmacTopDNew: TUniBitBtn;
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
    btnMetodTopDAdd: TUniBitBtn;
    btnMetodTopDDel: TUniBitBtn;
    btnMetodTopDNew: TUniBitBtn;
    UniLabel14: TUniLabel;
    UniDBMemo2: TUniDBMemo;
    UniLabel15: TUniLabel;
    UniDBMemo3: TUniDBMemo;
    UniLabel16: TUniLabel;
    UniDBMemo4: TUniDBMemo;
    UniLabel17: TUniLabel;
    UniDBMemo5: TUniDBMemo;
    grdAmacPay: TUniDBGrid;
    btnAmacPayAdd: TUniBitBtn;
    btnAmacPayDel: TUniBitBtn;
    btnAmacPayNew: TUniBitBtn;
    grdAmacPayD: TUniDBGrid;
    btnAmacPayDAdd: TUniBitBtn;
    btnAmacPayDDel: TUniBitBtn;
    btnAmacPayDNew: TUniBitBtn;
    grdMetodPay: TUniDBGrid;
    btnMetodPayAdd: TUniBitBtn;
    btnMetodPayDel: TUniBitBtn;
    btnMetodPayNew: TUniBitBtn;
    grdMetodPayD: TUniDBGrid;
    btnMetodPayDAdd: TUniBitBtn;
    btnMetodPayDDel: TUniBitBtn;
    btnMetodPayDNew: TUniBitBtn;
    pgSakl_Metod: TUniTabSheet;
    pgSakl_Erisim: TUniTabSheet;
    pgPayl_Taraf: TUniTabSheet;
    grdAmacSak: TUniDBGrid;
    btnAmacSakAdd: TUniBitBtn;
    btnAmacSakDel: TUniBitBtn;
    btnAmacSakNew: TUniBitBtn;
    grdAmacSakD: TUniDBGrid;
    btnAmacSakDAdd: TUniBitBtn;
    btnAmacSakDDel: TUniBitBtn;
    btnAmacSakDNew: TUniBitBtn;
    grdMetodSak: TUniDBGrid;
    btnMetodSakAdd: TUniBitBtn;
    btnMetodSakDel: TUniBitBtn;
    btnMetodSakNew: TUniBitBtn;
    grdMetodSakD: TUniDBGrid;
    btnMetodSakDAdd: TUniBitBtn;
    btnMetodSakDDel: TUniBitBtn;
    btnMetodSakDNew: TUniBitBtn;
    grdDepts: TUniDBGrid;
    btnDeptsAdd: TUniBitBtn;
    btnDeptsDel: TUniBitBtn;
    btnDeptsNew: TUniBitBtn;
    grdDeptsD: TUniDBGrid;
    btnDeptsDAdd: TUniBitBtn;
    btnDeptsDDel: TUniBitBtn;
    btnDeptsDNew: TUniBitBtn;
    grdTaraf: TUniDBGrid;
    btnTarafAdd: TUniBitBtn;
    btnTarafDel: TUniBitBtn;
    btnTarafNew: TUniBitBtn;
    grdTarafD: TUniDBGrid;
    btnTarafDAdd: TUniBitBtn;
    btnTarafDDel: TUniBitBtn;
    btnTarafDNew: TUniBitBtn;
    UniLabel31: TUniLabel;
    edTarafTipi: TUniDBComboBox;
    UniLabel21: TUniLabel;
    UniLabel33: TUniLabel;
    UniLabel43: TUniLabel;
    UniLabel44: TUniLabel;
    UniLabel45: TUniLabel;
    UniLabel46: TUniLabel;
    UniLabel47: TUniLabel;
    UniLabel48: TUniLabel;
    UniLabel49: TUniLabel;
    UniLabel50: TUniLabel;
    UniLabel51: TUniLabel;
    UniLabel52: TUniLabel;
    UniLabel53: TUniLabel;
    UniLabel54: TUniLabel;
    UniLabel55: TUniLabel;
    UniLabel56: TUniLabel;
    chbDgrPol: TUniDBCheckBox;
    UniLabel29: TUniLabel;
    UniDBMemo13: TUniDBMemo;
    UniLabel30: TUniLabel;
    UniDBMemo14: TUniDBMemo;
    chbDgrSoz: TUniDBCheckBox;
    UniLabel28: TUniLabel;
    UniDBMemo15: TUniDBMemo;
    UniLabel32: TUniLabel;
    UniDBMemo19: TUniDBMemo;
    UniLabel57: TUniLabel;
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
    tblDeptsD: TVirtualTable;
    dsDeptsD: TUniDataSource;
    tblTarafD: TVirtualTable;
    dsTarafD: TUniDataSource;
    tblMetodTopD: TVirtualTable;
    dsMetodTopD: TUniDataSource;
    tblMetodSakD: TVirtualTable;
    dsMetodSakD: TUniDataSource;
    tblMetodPayD: TVirtualTable;
    dsMetodPayD: TUniDataSource;
    tblAmacTopD: TVirtualTable;
    dsAmacTopD: TUniDataSource;
    tblAmacSakD: TVirtualTable;
    dsAmacSakD: TUniDataSource;
    tblAmacPayD: TVirtualTable;
    dsAmacPayD: TUniDataSource;
    tblDetail: TVirtualTable;
    dsDetail: TUniDataSource;
    chbKategori: TUniCheckBox;
    vqenvanter: TVirtualTable;
    VqEnvDet: TVirtualTable;
    vtmp1: TVirtualTable;
    vqtmp: TVirtualQuery;
    qdetail: TUniQuery;
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
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edKaynakChange(Sender: TObject);
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
    procedure btnDgrDocsNewClick(Sender: TObject);
    procedure btnDgrDayanakAddClick(Sender: TObject);
    procedure btnDgrDayanakDelClick(Sender: TObject);
    procedure btnDgrDayanakNewClick(Sender: TObject);
    procedure chbKategoriClick(Sender: TObject);
    procedure chbDgrSozClick(Sender: TObject);
    procedure chbDgrPolClick(Sender: TObject);
    procedure chbPaylSozlesmeClick(Sender: TObject);
    procedure edFSureVarChange(Sender: TObject);
    procedure edSSureVarChange(Sender: TObject);
    procedure btnAmacTopDAddClick(Sender: TObject);
    procedure btnAmacTopDDelClick(Sender: TObject);
    procedure btnMetodTopDAddClick(Sender: TObject);
    procedure btnMetodTopDDelClick(Sender: TObject);
    procedure btnAmacSakDAddClick(Sender: TObject);
    procedure btnAmacSakDDelClick(Sender: TObject);
    procedure btnMetodSakDAddClick(Sender: TObject);
    procedure btnMetodSakDDelClick(Sender: TObject);
    procedure btnDeptsDAddClick(Sender: TObject);
    procedure btnDeptsDDelClick(Sender: TObject);
    procedure btnAmacPayDAddClick(Sender: TObject);
    procedure btnAmacPayDDelClick(Sender: TObject);
    procedure btnMetodPayDAddClick(Sender: TObject);
    procedure btnMetodPayDDelClick(Sender: TObject);
    procedure btnTarafDAddClick(Sender: TObject);
    procedure btnTarafDDelClick(Sender: TObject);
    procedure btnEnvDetAddClick(Sender: TObject);
    procedure btnEnvDetDelClick(Sender: TObject);
    procedure tblDetailAfterScroll(DataSet: TDataSet);
    procedure tblDetailBeforeScroll(DataSet: TDataSet);
    procedure grdVeriTipiDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure dsEnvanterStateChange(Sender: TObject);
    procedure dsEnvanterDataChange(Sender: TObject; Field: TField);
    procedure qEnvanterBeforePost(DataSet: TDataSet);
  private
    YardimKw : string;
    DetailLoading : Boolean;
    DetailKilitli : Boolean;
    MultiChange : boolean;
    EnvCopy : boolean;
    Envids : string;
    procedure PrepareTables;
    procedure PrepareDetails;
    procedure StrToListDetails;
    procedure ListToStrDetails;
    procedure CloseTables;
    procedure ManageSettings;

    function CheckID(AID: Integer; ATable: TVirtualTable): Boolean;
    function CheckVTID(AID: Integer): Boolean;
    function ListToStr(ATable: TVirtualTable): String;
    function GetMainNitelik(Adataset: tdataset = nil): String;
    // Veri Tipi için prosedürler
    procedure StrToListDeptD;
    procedure StrToListAmacTopD;
    procedure StrToListAmacSakD;
    procedure StrToListAmacPayD;
    procedure StrToListTarafD;
    procedure StrToListMetodTopD;
    procedure StrToListMetodSakD;
    procedure StrToListMetodPayD;
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
    procedure StrToListDept;
    procedure StrToListAmacTop;
    procedure StrToListAmacSak;
    procedure StrToListAmacPay;
    procedure StrToListTaraf;
    procedure StrToListMetodTop;
    procedure StrToListMetodSak;
    procedure StrToListMetodPay;
    procedure StrToListDgrDayanak;
    procedure StrToListDgrDocs;
    procedure StrToListHkkDayanak;
    procedure StrToListHkkDocs;
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
    function ListeyiGuncelle(const kaynakListe, hedefListe: string;
      Ekle: Boolean): string;
    function ValidateControl: boolean;
    function TimeValidateControl(Aquery: tdataset): boolean;
    procedure SeciliIdsTopla;
  public
    OldKisi_Id : integer;
    oldKaynak_Id : integer;
    changeActive : boolean;
    function Exec(AID, AOp, Kilitli: Integer): Integer;overload;
    function Exec(AIds:string):integer;overload;
    function copy(AId: integer): integer;

  end;

function frmEnvanterTanim2: TfrmEnvanterTanim2;

implementation

uses uniGUIApplication, MainModule, McMLib, unEnvanterListe2, unDepartmanSec, unDepartmanTanim,
  unKVKKVeriDokumanSec, unKVKKMetodSec, unKVKKMetodTanim, unKVKKDayanakSec, unKVKKDayanakTanim,
  unKVKKAmacSec, unKVKKAmacTanim, unKVKKTarafSec, unKVKKVeriTipiSec, unKVKKTarafTanim, unHelpPage;

{$R *.dfm}

function frmEnvanterTanim2: TfrmEnvanterTanim2;
begin
  Result := TfrmEnvanterTanim2(MainMod.GetFormInstance(TfrmEnvanterTanim2));
end;

procedure TfrmEnvanterTanim2.btnCancelClick(Sender: TObject);
begin
  qEnvanter.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmEnvanterTanim2.btnMetodSakAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID    : Integer;
  AName  : String;
  IDList : String;
begin
  IDList := MainMod.MakeIDList(tblMetodSak);
  frmKVKKMetodSec.GizliKriter := 'id NOT IN (' + IDList + ') AND saklama = ''E''';
  ACount := frmKVKKMetodSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKMetodSec.qMetod.GotoBookmark(frmKVKKMetodSec.grdList.SelectedRows[i]);
    AID   := frmKVKKMetodSec.qMetod.FieldByName('id').AsInteger;
    AName := frmKVKKMetodSec.qMetod.FieldByName('metod').AsString;

    if not CheckID(AID, tblMetodSak) then
    begin
      tblMetodSak.Insert;
      tblMetodSak.FieldByName('id').AsInteger  := AID;
      tblMetodSak.FieldByName('name').AsString := AName;
      tblMetodSak.Post;
    end;
  end;
end;

procedure TfrmEnvanterTanim2.btnMetodPayAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID   : Integer;
  AName : String;
  IDList : String;
begin
  IDList := MainMod.MakeIDList(tblMetodPay);
  frmKVKKMetodSec.GizliKriter := 'id NOT IN (' + IDList + ') AND paylasma = ''E''';
  ACount := frmKVKKMetodSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKMetodSec.qMetod.GotoBookmark(frmKVKKMetodSec.grdList.SelectedRows[i]);
    AID   := frmKVKKMetodSec.qMetod.FieldByName('id').AsInteger;
    AName := frmKVKKMetodSec.qMetod.FieldByName('metod').AsString;

    if not CheckID(AID, tblMetodPay) then
    begin
      tblMetodPay.Insert;
      tblMetodPay.FieldByName('id').AsInteger  := AID;
      tblMetodPay.FieldByName('name').AsString := AName;
      tblMetodPay.Post;
    end;
  end;
end;

procedure TfrmEnvanterTanim2.btnMetodSakDAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID    : Integer;
  AName  : String;
  IDList : String;
begin
  IDList := MainMod.MakeIDList(tblMetodSakD);
  frmKVKKMetodSec.GizliKriter := 'id NOT IN (' + IDList + ') AND saklama = ''E''';
  ACount := frmKVKKMetodSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKMetodSec.qMetod.GotoBookmark(frmKVKKMetodSec.grdList.SelectedRows[i]);
    AID   := frmKVKKMetodSec.qMetod.FieldByName('id').AsInteger;
    AName := frmKVKKMetodSec.qMetod.FieldByName('metod').AsString;

    if CheckID(AID, tblMetodSak) then Continue;

    if not CheckID(AID, tblMetodSakD) then
    begin
      tblMetodSakD.Insert;
      tblMetodSakD.FieldByName('id').AsInteger  := AID;
      tblMetodSakD.FieldByName('name').AsString := AName;
      tblMetodSakD.Post;
    end;
  end;
end;

procedure TfrmEnvanterTanim2.btnMetodSakDDelClick(Sender: TObject);
var
  Msg : String;
begin
  if tblMetodSakD.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Listeden "' + tblMetodSakD.FieldByName('name').AsString + '" metodunu çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelMetodSakDControl);
end;

procedure TfrmEnvanterTanim2.btnMetodSakDelClick(Sender: TObject);
var
  Msg : String;
begin
  if tblMetodSak.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Listeden "' + tblMetodSak.FieldByName('name').AsString + '" metodunu çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelMetodSakControl);
end;

procedure TfrmEnvanterTanim2.btnMetodPayDAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID   : Integer;
  AName : String;
  IDList : String;
begin
  IDList := MainMod.MakeIDList(tblMetodPayD);
  frmKVKKMetodSec.GizliKriter := 'id NOT IN (' + IDList + ') AND paylasma = ''E''';
  ACount := frmKVKKMetodSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKMetodSec.qMetod.GotoBookmark(frmKVKKMetodSec.grdList.SelectedRows[i]);
    AID   := frmKVKKMetodSec.qMetod.FieldByName('id').AsInteger;
    AName := frmKVKKMetodSec.qMetod.FieldByName('metod').AsString;

    if CheckID(AID, tblMetodPay) then Continue;

    if not CheckID(AID, tblMetodPayD) then
    begin
      tblMetodPayD.Insert;
      tblMetodPayD.FieldByName('id').AsInteger  := AID;
      tblMetodPayD.FieldByName('name').AsString := AName;
      tblMetodPayD.Post;
    end;
  end;
end;

procedure TfrmEnvanterTanim2.btnMetodPayDDelClick(Sender: TObject);
var
  Msg : String;
begin
  if tblMetodPayD.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Listeden "' + tblMetodPayD.FieldByName('name').AsString + '" metodunu çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelMetodPayDControl);
end;

procedure TfrmEnvanterTanim2.btnMetodPayDelClick(Sender: TObject);
var
  Msg : String;
begin
  if tblMetodPay.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Listeden "' + tblMetodPay.FieldByName('name').AsString + '" metodunu çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelMetodPayControl);
end;

procedure TfrmEnvanterTanim2.btnMetodSakNewClick(Sender: TObject);
begin
  frmKVKKMetodTanim.Exec(0, 0);
end;

procedure TfrmEnvanterTanim2.btnMetodTopAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID    : Integer;
  AName  : String;
  IDList : String;
begin
  IDList := MainMod.MakeIDList(tblMetodTop);
  frmKVKKMetodSec.GizliKriter := 'id NOT IN (' + IDList + ') AND toplama = ''E''';
  ACount := frmKVKKMetodSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKMetodSec.qMetod.GotoBookmark(frmKVKKMetodSec.grdList.SelectedRows[i]);
    AID   := frmKVKKMetodSec.qMetod.FieldByName('id').AsInteger;
    AName := frmKVKKMetodSec.qMetod.FieldByName('metod').AsString;

    if not CheckID(AID, tblMetodTop) then
    begin
      tblMetodTop.Insert;
      tblMetodTop.FieldByName('id').AsInteger  := AID;
      tblMetodTop.FieldByName('name').AsString := AName;
      tblMetodTop.Post;
    end;
  end;
end;

procedure TfrmEnvanterTanim2.btnMetodTopDAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID    : Integer;
  AName  : String;
  IDList : String;
begin
  IDList := MainMod.MakeIDList(tblMetodTopD);
  frmKVKKMetodSec.GizliKriter := 'id NOT IN (' + IDList + ') AND toplama = ''E''';
  ACount := frmKVKKMetodSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKMetodSec.qMetod.GotoBookmark(frmKVKKMetodSec.grdList.SelectedRows[i]);
    AID   := frmKVKKMetodSec.qMetod.FieldByName('id').AsInteger;
    AName := frmKVKKMetodSec.qMetod.FieldByName('metod').AsString;

    if CheckID(AID, tblMetodTop) then Continue;

    if not CheckID(AID, tblMetodTopD) then
    begin
      tblMetodTopD.Insert;
      tblMetodTopD.FieldByName('id').AsInteger  := AID;
      tblMetodTopD.FieldByName('name').AsString := AName;
      tblMetodTopD.Post;
    end;
  end;
end;

procedure TfrmEnvanterTanim2.btnMetodTopDDelClick(Sender: TObject);
var
  Msg : String;
begin
  if tblMetodTopD.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Listeden "' + tblMetodTopD.FieldByName('name').AsString + '" metodunu çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelMetodTopDControl);
end;

procedure TfrmEnvanterTanim2.btnMetodTopDelClick(Sender: TObject);
var
  Msg : String;
begin
  if tblMetodTop.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Listeden "' + tblMetodTop.FieldByName('name').AsString + '" metodunu çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelMetodTopControl);
end;

procedure TfrmEnvanterTanim2.btnMetodTopNewClick(Sender: TObject);
begin
  frmKVKKMetodTanim.Exec(0, 0);
end;

procedure TfrmEnvanterTanim2.btnMetodPayNewClick(Sender: TObject);
begin
  frmKVKKMetodTanim.Exec(0, 0);
end;

procedure TfrmEnvanterTanim2.btnDgrDayanakAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID   : Integer;
  AName : String;
  IDList : String;
begin
  IDList := MainMod.MakeIDList(tblDgrDayanak);
  frmKVKKDayanakSec.GizliKriter := 'id NOT IN (' + IDList + ') AND tipi <> ''HUKUKSAL''';
  ACount := frmKVKKDayanakSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKDayanakSec.qDayanak.GotoBookmark(frmKVKKDayanakSec.grdList.SelectedRows[i]);
    AID   := frmKVKKDayanakSec.qDayanak.FieldByName('id').AsInteger;
    AName := frmKVKKDayanakSec.qDayanak.FieldByName('dayanak').AsString;

    if not CheckID(AID, tblDgrDayanak) then
    begin
      tblDgrDayanak.Insert;
      tblDgrDayanak.FieldByName('id').AsInteger  := AID;
      tblDgrDayanak.FieldByName('name').AsString := AName;
      tblDgrDayanak.Post;
    end;
  end;
end;

procedure TfrmEnvanterTanim2.btnDgrDayanakDelClick(Sender: TObject);
var
  Msg : String;
begin
  if tblDgrDayanak.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Listeden "' + tblDgrDayanak.FieldByName('name').AsString + '" dayanaðýný çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelDgrDayanakControl);
end;

procedure TfrmEnvanterTanim2.btnDgrDayanakNewClick(Sender: TObject);
begin
  frmKVKKDayanakTanim.Exec(0, 0);
end;

procedure TfrmEnvanterTanim2.btnDgrDocsAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID    : Integer;
  AName  : String;
  IDList : String;
begin
  IDList := MainMod.MakeIDList(tblDgrDocs);
  frmKVKKVeriDokumanSec.GizliKriter := 'doc.id NOT IN (' + IDList + ')';
  ACount := frmKVKKVeriDokumanSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKVeriDokumanSec.qDocs.GotoBookmark(frmKVKKVeriDokumanSec.grdList.SelectedRows[i]);
    AID   := frmKVKKVeriDokumanSec.qDocs.FieldByName('id').AsInteger;
    AName := frmKVKKVeriDokumanSec.qDocs.FieldByName('dokuman').AsString;

    if not CheckID(AID, tblDepts) then
    begin
      tblDgrDocs.Insert;
      tblDgrDocs.FieldByName('id').AsInteger  := AID;
      tblDgrDocs.FieldByName('name').AsString := AName;
      tblDgrDocs.Post;
    end;
  end;
end;

procedure TfrmEnvanterTanim2.btnDgrDocsDelClick(Sender: TObject);
var
  Msg : String;
begin
  if tblDgrDocs.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Listeden "' + tblDgrDocs.FieldByName('name').AsString + '" dokümanýný çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelDgrDocsControl);
end;

procedure TfrmEnvanterTanim2.btnDgrDocsNewClick(Sender: TObject);
begin
// to do : Þimdilik beklemede... Doküman Tipi var ekstra alan
end;

procedure TfrmEnvanterTanim2.btnEnvDetAddClick(Sender: TObject);
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
        qEnvDet.Append;
        qEnvDet.FieldByName('id').AsInteger           := MainMod.GetSeq('sq_data_envanter_id');
        qEnvDet.FieldByName('main_id').AsInteger      := qEnvanter.FieldByName('id').AsInteger;
        qEnvDet.FieldByName('mc_id').AsInteger        := MainMod.MCID;
        qEnvDet.FieldByName('active').AsString        := qEnvanter.FieldByName('active').AsString;
        qEnvDet.FieldByName('idy').AsInteger          := MainMod.LoginInfo.ID;
        qEnvDet.FieldByName('idt').AsDateTime         := Now;
        qEnvDet.FieldByName('sdy').AsInteger          := MainMod.LoginInfo.ID;
        qEnvDet.FieldByName('sdt').AsDateTime         := Now;
        qEnvDet.FieldByName('tarih').AsDateTime       := qEnvanter.FieldByName('tarih').AsDateTime;
        qEnvDet.FieldByName('dept_id').AsInteger      := qEnvanter.FieldByName('dept_id').AsInteger;
        qEnvDet.FieldByName('surec_id').AsInteger     := qEnvanter.FieldByName('surec_id').AsInteger;
        qEnvDet.FieldByName('kaynak_id').AsInteger    := qEnvanter.FieldByName('kaynak_id').AsInteger;
        qEnvDet.FieldByName('kisi_id').AsInteger      := qEnvanter.FieldByName('kisi_id').AsInteger;
        qEnvDet.FieldByName('veritipi_id').AsInteger  := AID;
        qEnvDet.FieldByName('kategori_id').AsInteger  := KID;
        qEnvDet.FieldByName('nitelik').AsString       := Ntlk;
        qEnvDet.Post;

        tblDetail.Append;
        tblDetail.FieldByName('id').AsInteger           := qEnvDet.FieldByName('id').AsInteger;
        tblDetail.FieldByName('veritipi_id').AsInteger  := AID;
        tblDetail.FieldByName('kategori_id').AsInteger  := KID;
        tblDetail.FieldByName('veritipi_str').AsString  := AName;
        tblDetail.FieldByName('kategori_str').AsString  := KName;
        tblDetail.FieldByName('nitelik').AsString       := Ntlk;
        tblDetail.Post;
        DetailLoading := False;
        tblDetailAfterScroll(tblDetail);
      end else
      begin
      if  not VqEnvDet.Active then    VqEnvDet.Open;
        vqEnvDet.Append;
        vqEnvDet.FieldByName('id').AsInteger           := 0; //MainMod.GetSeq('sq_data_envanter_id');
        vqEnvDet.FieldByName('main_id').AsInteger      := qEnvanter.FieldByName('id').AsInteger;
        vqEnvDet.FieldByName('mc_id').AsInteger        := MainMod.MCID;
        vqEnvDet.FieldByName('active').AsString        := qEnvanter.FieldByName('active').AsString;
//        vqEnvDet.FieldByName('idy').AsInteger          := MainMod.LoginInfo.ID;
//        vqEnvDet.FieldByName('idt').AsDateTime         := Now;
        vqEnvDet.FieldByName('sdy').AsInteger          := MainMod.LoginInfo.ID;
        vqEnvDet.FieldByName('sdt').AsDateTime         := Now;
        vqEnvDet.FieldByName('tarih').AsDateTime       := qEnvanter.FieldByName('tarih').AsDateTime;
        vqEnvDet.FieldByName('dept_id').AsInteger      := qEnvanter.FieldByName('dept_id').AsInteger;
        vqEnvDet.FieldByName('surec_id').AsInteger     := qEnvanter.FieldByName('surec_id').AsInteger;
        vqEnvDet.FieldByName('kaynak_id').AsInteger    := qEnvanter.FieldByName('kaynak_id').AsInteger;
        vqEnvDet.FieldByName('kisi_id').AsInteger      := qEnvanter.FieldByName('kisi_id').AsInteger;
        vqEnvDet.FieldByName('veritipi_id').AsInteger  := AID;
        vqEnvDet.FieldByName('kategori_id').AsInteger  := KID;
        vqEnvDet.FieldByName('nitelik').AsString       := Ntlk;
        vqEnvDet.Post;

        tblDetail.Append;
        tblDetail.FieldByName('id').AsInteger           := 0;//qEnvDet.FieldByName('id').AsInteger;
        tblDetail.FieldByName('veritipi_id').AsInteger  := AID;
        tblDetail.FieldByName('kategori_id').AsInteger  := KID;
        tblDetail.FieldByName('veritipi_str').AsString  := AName;
        tblDetail.FieldByName('kategori_str').AsString  := KName;
        tblDetail.FieldByName('nitelik').AsString       := Ntlk;
        tblDetail.Post;
        DetailLoading := False;
        tblDetailAfterScroll(tblDetail);
      end;
    end;
  end;
end;

procedure TfrmEnvanterTanim2.btnEnvDetDelClick(Sender: TObject);
var
  Msg : String;
begin
  if tblDetail.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Listeden "' + tblDetail.FieldByName('veritipi_str').AsString + '" veri tipini çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelVeriTipiControl);
end;

procedure TfrmEnvanterTanim2.btnAmacTopAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID   : Integer;
  AName : String;
  IDList : String;
begin
  IDList := MainMod.MakeIDList(tblAmacTop);
  frmKVKKAmacSec.GizliKriter := 'id NOT IN (' + IDList + ') AND toplama = ''E''';
  ACount := frmKVKKAmacSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKAmacSec.qAmac.GotoBookmark(frmKVKKAmacSec.grdList.SelectedRows[i]);
    AID   := frmKVKKAmacSec.qAmac.FieldByName('id').AsInteger;
    AName := frmKVKKAmacSec.qAmac.FieldByName('amac').AsString;

    if not CheckID(AID, tblAmacTop) then
    begin
      tblAmacTop.Insert;
      tblAmacTop.FieldByName('id').AsInteger  := AID;
      tblAmacTop.FieldByName('name').AsString := AName;
      tblAmacTop.Post;
    end;
  end;
end;

procedure TfrmEnvanterTanim2.btnAmacTopDAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID   : Integer;
  AName : String;
  IDList : String;
begin
  IDList := MainMod.MakeIDList(tblAmacTopD);
  frmKVKKAmacSec.GizliKriter := 'id NOT IN (' + IDList + ') AND toplama = ''E''';
  ACount := frmKVKKAmacSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKAmacSec.qAmac.GotoBookmark(frmKVKKAmacSec.grdList.SelectedRows[i]);
    AID   := frmKVKKAmacSec.qAmac.FieldByName('id').AsInteger;
    AName := frmKVKKAmacSec.qAmac.FieldByName('amac').AsString;

    if CheckID(AID, tblAmacTop) then Continue;

    if not CheckID(AID, tblAmacTopD) then
    begin
      tblAmacTopD.Insert;
      tblAmacTopD.FieldByName('id').AsInteger  := AID;
      tblAmacTopD.FieldByName('name').AsString := AName;
      tblAmacTopD.Post;
    end;
  end;
end;

procedure TfrmEnvanterTanim2.btnAmacTopDDelClick(Sender: TObject);
var
  Msg : String;
begin
  if tblAmacTopD.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Listeden "' + tblAmacTopD.FieldByName('name').AsString + '" amacýný çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelAmacTopDControl);
end;

procedure TfrmEnvanterTanim2.btnAmacTopDelClick(Sender: TObject);
var
  Msg : String;
begin
  if tblAmacTop.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Listeden "' + tblAmacTop.FieldByName('name').AsString + '" amacýný çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelAmacTopControl);
end;

procedure TfrmEnvanterTanim2.btnAmacSakAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID   : Integer;
  AName : String;
  IDList : String;
begin
  IDList := MainMod.MakeIDList(tblAmacSak);
  frmKVKKAmacSec.GizliKriter := 'id NOT IN (' + IDList + ') AND saklama = ''E''';
  ACount := frmKVKKAmacSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKAmacSec.qAmac.GotoBookmark(frmKVKKAmacSec.grdList.SelectedRows[i]);
    AID   := frmKVKKAmacSec.qAmac.FieldByName('id').AsInteger;
    AName := frmKVKKAmacSec.qAmac.FieldByName('amac').AsString;

    if not CheckID(AID, tblAmacSak) then
    begin
      tblAmacSak.Insert;
      tblAmacSak.FieldByName('id').AsInteger  := AID;
      tblAmacSak.FieldByName('name').AsString := AName;
      tblAmacSak.Post;
    end;
  end;
end;

procedure TfrmEnvanterTanim2.btnAmacSakDAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID   : Integer;
  AName : String;
  IDList : String;
begin
  IDList := MainMod.MakeIDList(tblAmacSakD);
  frmKVKKAmacSec.GizliKriter := 'id NOT IN (' + IDList + ') AND saklama = ''E''';
  ACount := frmKVKKAmacSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKAmacSec.qAmac.GotoBookmark(frmKVKKAmacSec.grdList.SelectedRows[i]);
    AID   := frmKVKKAmacSec.qAmac.FieldByName('id').AsInteger;
    AName := frmKVKKAmacSec.qAmac.FieldByName('amac').AsString;

    if CheckID(AID, tblAmacSak) then Continue;

    if not CheckID(AID, tblAmacSakD) then
    begin
      tblAmacSakD.Insert;
      tblAmacSakD.FieldByName('id').AsInteger  := AID;
      tblAmacSakD.FieldByName('name').AsString := AName;
      tblAmacSakD.Post;
    end;
  end;
end;

procedure TfrmEnvanterTanim2.btnAmacSakDDelClick(Sender: TObject);
var
  Msg : String;
begin
  if tblAmacSakD.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Listeden "' + tblAmacSakD.FieldByName('name').AsString + '" amacýný çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelAmacSakDControl);
end;

procedure TfrmEnvanterTanim2.btnAmacSakDelClick(Sender: TObject);
var
  Msg : String;
begin
  if tblAmacSak.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Listeden "' + tblAmacSak.FieldByName('name').AsString + '" amacýný çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelAmacSakControl);
end;

procedure TfrmEnvanterTanim2.btnAmacPayAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID   : Integer;
  AName : String;
  IDList : String;
begin
  IDList := MainMod.MakeIDList(tblAmacPay);
  frmKVKKAmacSec.GizliKriter := 'id NOT IN (' + IDList + ') AND paylasma = ''E''';
  ACount := frmKVKKAmacSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKAmacSec.qAmac.GotoBookmark(frmKVKKAmacSec.grdList.SelectedRows[i]);
    AID   := frmKVKKAmacSec.qAmac.FieldByName('id').AsInteger;
    AName := frmKVKKAmacSec.qAmac.FieldByName('amac').AsString;

    if not CheckID(AID, tblAmacPay) then
    begin
      tblAmacPay.Insert;
      tblAmacPay.FieldByName('id').AsInteger  := AID;
      tblAmacPay.FieldByName('name').AsString := AName;
      tblAmacPay.Post;
    end;
  end;
end;

procedure TfrmEnvanterTanim2.btnAmacPayDAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID   : Integer;
  AName : String;
  IDList : String;
begin
  IDList := MainMod.MakeIDList(tblAmacPayD);
  frmKVKKAmacSec.GizliKriter := 'id NOT IN (' + IDList + ') AND paylasma = ''E''';
  ACount := frmKVKKAmacSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKAmacSec.qAmac.GotoBookmark(frmKVKKAmacSec.grdList.SelectedRows[i]);
    AID   := frmKVKKAmacSec.qAmac.FieldByName('id').AsInteger;
    AName := frmKVKKAmacSec.qAmac.FieldByName('amac').AsString;

    if CheckID(AID, tblAmacPay) then Continue;

    if not CheckID(AID, tblAmacPayD) then
    begin
      tblAmacPayD.Insert;
      tblAmacPayD.FieldByName('id').AsInteger  := AID;
      tblAmacPayD.FieldByName('name').AsString := AName;
      tblAmacPayD.Post;
    end;
  end;
end;

procedure TfrmEnvanterTanim2.btnAmacPayDDelClick(Sender: TObject);
var
  Msg : String;
begin
  if tblAmacPayD.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Listeden "' + tblAmacPayD.FieldByName('name').AsString + '" amacýný çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelAmacPayDControl);
end;

procedure TfrmEnvanterTanim2.btnAmacPayDelClick(Sender: TObject);
var
  Msg : String;
begin
  if tblAmacPay.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Listeden "' + tblAmacPay.FieldByName('name').AsString + '" amacýný çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelAmacPayControl);
end;

procedure TfrmEnvanterTanim2.btnAmacTopNewClick(Sender: TObject);
begin
  frmKVKKAmacTanim.Exec(0, 0);
end;

procedure TfrmEnvanterTanim2.btnAmacSakNewClick(Sender: TObject);
begin
  frmKVKKAmacTanim.Exec(0, 0);
end;

procedure TfrmEnvanterTanim2.btnAmacPayNewClick(Sender: TObject);
begin
  frmKVKKAmacTanim.Exec(0, 0);
end;

procedure TfrmEnvanterTanim2.btnTarafAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID   : Integer;
  AName : String;
  IDList : String;
begin
  IDList := MainMod.MakeIDList(tblTaraf);
  frmKVKKTarafSec.GizliKriter := 'id NOT IN (' + IDList + ')';
  ACount := frmKVKKTarafSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKTarafSec.qTanim.GotoBookmark(frmKVKKTarafSec.grdList.SelectedRows[i]);
    AID   := frmKVKKTarafSec.qTanim.FieldByName('id').AsInteger;
    AName := frmKVKKTarafSec.qTanim.FieldByName('taraf').AsString;

    if not CheckID(AID, tblTaraf) then
    begin
      tblTaraf.Insert;
      tblTaraf.FieldByName('id').AsInteger  := AID;
      tblTaraf.FieldByName('name').AsString := AName;
      tblTaraf.Post;
    end;
  end;
end;

procedure TfrmEnvanterTanim2.btnTarafDAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID   : Integer;
  AName : String;
  IDList : String;
begin
  IDList := MainMod.MakeIDList(tblTarafD);
  frmKVKKTarafSec.GizliKriter := 'id NOT IN (' + IDList + ')';
  ACount := frmKVKKTarafSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKTarafSec.qTanim.GotoBookmark(frmKVKKTarafSec.grdList.SelectedRows[i]);
    AID   := frmKVKKTarafSec.qTanim.FieldByName('id').AsInteger;
    AName := frmKVKKTarafSec.qTanim.FieldByName('taraf').AsString;

    if CheckID(AID, tblTaraf) then Continue;

    if not CheckID(AID, tblTarafD) then
    begin
      tblTarafD.Insert;
      tblTarafD.FieldByName('id').AsInteger  := AID;
      tblTarafD.FieldByName('name').AsString := AName;
      tblTarafD.Post;
    end;
  end;
end;

procedure TfrmEnvanterTanim2.btnTarafDDelClick(Sender: TObject);
var
  Msg : String;
begin
  if tblTarafD.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Listeden "' + tblTarafD.FieldByName('name').AsString + '" paylaþým tarafýný çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelTarafDControl);
end;

procedure TfrmEnvanterTanim2.btnTarafDelClick(Sender: TObject);
var
  Msg : String;
begin
  if tblTaraf.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Listeden "' + tblTaraf.FieldByName('name').AsString + '" paylaþým tarafýný çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelTarafControl);
end;

procedure TfrmEnvanterTanim2.btnTarafNewClick(Sender: TObject);
begin
  frmKVKKTarafTanim.Exec(0, 0);
end;

procedure TfrmEnvanterTanim2.chbKategoriClick(Sender: TObject);
begin
  grdVeriTipi.Columns[1].Visible := chbKategori.Checked;
end;

procedure TfrmEnvanterTanim2.btnDeptsAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID    : Integer;
  AName  : String;
  IDList : String;
begin
  IDList := MainMod.MakeIDList(tblDepts);
  frmDepartmanSec.GizliKriter := 'd.id NOT IN (' + IDList + ') AND d.active = ''E''';
  ACount := frmDepartmanSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmDepartmanSec.qDepts.GotoBookmark(frmDepartmanSec.grdList.SelectedRows[i]);
    AID   := frmDepartmanSec.qDepts.FieldByName('id').AsInteger;
    AName := frmDepartmanSec.qDepts.FieldByName('title').AsString;
    if frmDepartmanSec.qDepts.FieldByName('main_dept_str').AsString <> '' then
      AName := AName + ' ('+frmDepartmanSec.qDepts.FieldByName('main_dept_str').AsString +')';

    if not CheckID(AID, tblDepts) then
    begin
      tblDepts.Insert;
      tblDepts.FieldByName('id').AsInteger  := AID;
      tblDepts.FieldByName('name').AsString := AName;
      tblDepts.Post;
    end;
  end;
end;

procedure TfrmEnvanterTanim2.btnDeptsDAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID    : Integer;
  AName  : String;
  IDList : String;
begin
  IDList := MainMod.MakeIDList(tblDeptsD);
  frmDepartmanSec.GizliKriter := 'd.id NOT IN (' + IDList + ') AND d.active = ''E''';
  ACount := frmDepartmanSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmDepartmanSec.qDepts.GotoBookmark(frmDepartmanSec.grdList.SelectedRows[i]);
    AID   := frmDepartmanSec.qDepts.FieldByName('id').AsInteger;
    AName := frmDepartmanSec.qDepts.FieldByName('title').AsString;

    if frmDepartmanSec.qDepts.FieldByName('main_dept_str').AsString <> '' then
      AName := AName + ' ('+frmDepartmanSec.qDepts.FieldByName('main_dept_str').AsString +')';

    if CheckID(AID, tblDepts) then Continue;

    if not CheckID(AID, tblDeptsD) then
    begin
      tblDeptsD.Insert;
      tblDeptsD.FieldByName('id').AsInteger  := AID;
      tblDeptsD.FieldByName('name').AsString := AName;
      tblDeptsD.Post;
    end;
  end;
end;

procedure TfrmEnvanterTanim2.btnDeptsDDelClick(Sender: TObject);
var
  Msg : String;
begin
  if tblDeptsD.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Listeden "' + tblDeptsD.FieldByName('name').AsString + '" departmanýný çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelDeptDControl);
end;

procedure TfrmEnvanterTanim2.btnDeptsDelClick(Sender: TObject);
var
  Msg : String;
begin
  if tblDepts.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Listeden "' + tblDepts.FieldByName('name').AsString + '" departmanýný çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelDeptControl);
end;

procedure TfrmEnvanterTanim2.btnDeptsNewClick(Sender: TObject);
begin
  frmDepartmanTanim.Insert;
end;

procedure TfrmEnvanterTanim2.SeciliIdsTopla;
begin
  if MultiChange then
  begin
   if tblDepts.RecordCount>0 then
     begin
         case rgveriErisim.ItemIndex of
         0: qEnvDet.FieldByName('sakl_erisim_ids').AsString := ListeyiGuncelle( qEnvDet.FieldByName('sakl_erisim_ids').AsString,  ListToStr(tblDepts),true);
         1: qEnvDet.FieldByName('sakl_erisim_ids').AsString := ListeyiGuncelle(qEnvDet.FieldByName('sakl_erisim_ids').AsString ,  ListToStr(tblDepts),false);
         2: qEnvDet.FieldByName('sakl_erisim_ids').AsString :=  ListToStr(tblDepts);
         end;
     end;
     if tblAmacTop.RecordCount>0 then
     begin
        case rgamacvt.ItemIndex	 of
          0: qEnvDet.FieldByName('topl_amac_ids').AsString   := ListeyiGuncelle(qEnvDet.FieldByName('topl_amac_ids').AsString, ListToStr(tblAmacTop),true);
          1: qEnvDet.FieldByName('topl_amac_ids').AsString   := ListeyiGuncelle(qEnvDet.FieldByName('topl_amac_ids').AsString, ListToStr(tblAmacTop),false);
          2: qEnvDet.FieldByName('topl_amac_ids').AsString   := ListToStr(tblAmacTop);
        end;
     end;
     if tblAmacSak.RecordCount>0 then
     begin
        case rgamacvs.ItemIndex	 of
         0: qEnvDet.FieldByName('sakl_amac_ids').AsString   := ListeyiGuncelle(qEnvDet.FieldByName('sakl_amac_ids').AsString ,ListToStr(tblAmacSak),true);
         1: qEnvDet.FieldByName('sakl_amac_ids').AsString   := ListeyiGuncelle(qEnvDet.FieldByName('sakl_amac_ids').AsString ,ListToStr(tblAmacSak),false);
         2: qEnvDet.FieldByName('sakl_amac_ids').AsString   := ListToStr(tblAmacSak);
         end;
     end;
     if tblAmacPay.RecordCount>0 then
     begin
        case rgamacvp.ItemIndex of
          0: qEnvDet.FieldByName('payl_amac_ids').AsString   := ListeyiGuncelle(qEnvDet.FieldByName('payl_amac_ids').AsString, ListToStr(tblAmacPay),true);
          1: qEnvDet.FieldByName('payl_amac_ids').AsString   := ListeyiGuncelle(qEnvDet.FieldByName('payl_amac_ids').AsString, ListToStr(tblAmacPay),false);
          2: qEnvDet.FieldByName('payl_amac_ids').AsString   := ListToStr(tblAmacPay);
        end;
     end;
     if tblTaraf.RecordCount>0 then
     begin
        case rgPaylasilanTaraf.ItemIndex of
          0: qEnvDet.FieldByName('payl_taraf_ids').AsString  :=  ListeyiGuncelle(qEnvDet.FieldByName('payl_taraf_ids').AsString, ListToStr(tblTaraf),true);
          1: qEnvDet.FieldByName('payl_taraf_ids').AsString  :=  ListeyiGuncelle(qEnvDet.FieldByName('payl_taraf_ids').AsString, ListToStr(tblTaraf),false);
          2: qEnvDet.FieldByName('payl_taraf_ids').AsString  := ListToStr(tblTaraf);
        end;
     end;
     if tblDgrDayanak.RecordCount>0 then
        case rgdgrDayanak.ItemIndex of
          0: qEnvDet.FieldByName('dgr_dayanak_ids').AsString := ListeyiGuncelle(qEnvDet.FieldByName('dgr_dayanak_ids').AsString, ListToStr(tblDgrDayanak),true);
          1: qEnvDet.FieldByName('dgr_dayanak_ids').AsString := ListeyiGuncelle(qEnvDet.FieldByName('dgr_dayanak_ids').AsString, ListToStr(tblDgrDayanak),false);
          2: qEnvDet.FieldByName('dgr_dayanak_ids').AsString := ListToStr(tblDgrDayanak);
        end;
     if tblDgrDocs.RecordCount>0 then
        case rgdgrDayanak.ItemIndex of
          0:  qEnvDet.FieldByName('dgr_dokuman_ids').AsString := ListeyiGuncelle(qEnvDet.FieldByName('dgr_dokuman_ids').AsString,ListToStr(tblDgrDocs),true);
          1:  qEnvDet.FieldByName('dgr_dokuman_ids').AsString := ListeyiGuncelle(qEnvDet.FieldByName('dgr_dokuman_ids').AsString,ListToStr(tblDgrDocs),false);
          2:  qEnvDet.FieldByName('dgr_dokuman_ids').AsString := ListToStr(tblDgrDocs);
        end;
     if tblMetodTop.RecordCount>0 then
      case rgmetodvt.ItemIndex of
        0: qEnvDet.FieldByName('topl_metod_ids').AsString  := listeyiguncelle(qEnvDet.FieldByName('topl_metod_ids').AsString, ListToStr(tblMetodTop),true);
        1: qEnvDet.FieldByName('topl_metod_ids').AsString  := listeyiguncelle(qEnvDet.FieldByName('topl_metod_ids').AsString, ListToStr(tblMetodTop),false);
        2: qEnvDet.FieldByName('topl_metod_ids').AsString  := ListToStr(tblMetodTop);
      end;

     if tblMetodSak.RecordCount>0 then
        case rgmetodvs.ItemIndex of
        0: qEnvDet.FieldByName('sakl_metod_ids').AsString  := listeyiguncelle(qEnvDet.FieldByName('sakl_metod_ids').AsString,ListToStr(tblMetodSak),true);
        1: qEnvDet.FieldByName('sakl_metod_ids').AsString  := listeyiguncelle(qEnvDet.FieldByName('sakl_metod_ids').AsString,ListToStr(tblMetodSak),false);
        2: qEnvDet.FieldByName('sakl_metod_ids').AsString  := ListToStr(tblMetodSak);
        end;
     if tblMetodPay.RecordCount>0 then
        case rgmetodvp.ItemIndex of
        0: qEnvDet.FieldByName('payl_metod_ids').AsString  := listeyiguncelle(qEnvDet.FieldByName('payl_metod_ids').AsString,ListToStr(tblMetodSak),true);
        1: qEnvDet.FieldByName('payl_metod_ids').AsString  := listeyiguncelle(qEnvDet.FieldByName('payl_metod_ids').AsString,ListToStr(tblMetodSak),false);
        2: qEnvDet.FieldByName('payl_metod_ids').AsString  := ListToStr(tblMetodPay);
        end;
  end else
  if not MultiChange then
  begin
     qEnvanter.FieldByName('sakl_erisim_ids').AsString := ListToStr(tblDepts);
    qEnvanter.FieldByName('topl_amac_ids').AsString   := ListToStr(tblAmacTop);
    qEnvanter.FieldByName('sakl_amac_ids').AsString   := ListToStr(tblAmacSak);
    qEnvanter.FieldByName('payl_amac_ids').AsString   := ListToStr(tblAmacPay);
    qEnvanter.FieldByName('payl_taraf_ids').AsString  := ListToStr(tblTaraf);
    qEnvanter.FieldByName('dgr_dayanak_ids').AsString := ListToStr(tblDgrDayanak);
    qEnvanter.FieldByName('dgr_dokuman_ids').AsString := ListToStr(tblDgrDocs);
    qEnvanter.FieldByName('topl_metod_ids').AsString  := ListToStr(tblMetodTop);
    qEnvanter.FieldByName('sakl_metod_ids').AsString  := ListToStr(tblMetodSak);
    qEnvanter.FieldByName('payl_metod_ids').AsString  := ListToStr(tblMetodPay);
  end;

end;


procedure TfrmEnvanterTanim2.PostMultiChange;
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
  //çoklu deðiþim
  if (VqEnvDet.RecordCount > 0) and (rgVeritipi.ItemIndex=-1) then
  begin
    MessageDlg('Eklenen veri tipi için eylem seçiniz',mtConfirmation,[mbYes]);
    rgVeritipi.SetFocus;
    exit;
  end;
      if not (vqenvanter.State in [dsInsert,dsEdit]) then
        vqenvanter.Edit;

      // süre kontrolleri
//      if not TimeValidateControl(vqenvanter) then
//        exit;
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


//        if vqenvanter.FieldByName('sakl_ssure_var').AsString = '' then vqenvanter.FieldByName('sakl_ssure_var').AsString := 'SAKLANMIYOR';
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

      /////// süre  kontrol son

    if  not VqEnvDet.IsEmpty then
    begin
      VqEnvDet.First;
      while not VqEnvDet.Eof do
      begin
        vqEnvDet.Edit;
        if not tblDgrDayanak.IsEmpty then  vqEnvDet.FieldByName('dgr_dayanak_ids').AsString := ListToStr(tblDgrDayanak);
        if not tblDgrDocs.IsEmpty then  vqEnvDet.FieldByName('dgr_dokuman_ids').AsString := ListToStr(tblDgrDocs);
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

          SeciliIdsTopla;

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
   //         qdetail.FieldByName('nitelik').AsString := qdetail.FieldByName('nitelik').AsString;
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
      //        qdetail.FieldByName('id').AsInteger := MainMod.GetSeq('sq_data_envanter_id');
    //          qdetail.FieldByName('main_id').AsInteger := qEnvDet.FieldByName('id').AsInteger;
    //          qdetail.FieldByName('mc_id').AsInteger := qEnvDet.FieldByName('mc_id').AsInteger;
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

function TfrmEnvanterTanim2.ListeyiGuncelle(const kaynakListe: string; const hedefListe: string; Ekle: Boolean): string;
var
  Kaynak, Hedef: TStringList;
  i: Integer;
begin
  Kaynak := TStringList.Create;
  Hedef := TStringList.Create;
  try
    Kaynak.Delimiter := ',';
    Kaynak.DelimitedText := kaynakListe;
    Hedef.Delimiter := ',';
    Hedef.DelimitedText := hedefListe;
    for i := 0 to Hedef.Count - 1 do
    begin
      if Ekle then
      begin
        if Kaynak.IndexOf(Hedef[i]) = -1 then
          Kaynak.Add(Hedef[i]);
      end
      else
      begin
        if Kaynak.IndexOf(Hedef[i]) <> -1 then
          Kaynak.Delete(Kaynak.IndexOf(Hedef[i]));
      end;
    end;
    // Kaynaðý sýralýyoruz (isteðe baðlý)
    Kaynak.Sort;
    // Güncellenmiþ listeyi fonksiyon sonucu olarak döndürüyoruz
    Result := Kaynak.DelimitedText;
  finally
    Kaynak.Free;
    Hedef.Free;
  end;
end;

procedure TfrmEnvanterTanim2.KayitKopyala(Table: TDataSet; AYeniId: Integer; Afield : array of string; AfieldValue : array of string);
var
  FieldValues: array of Variant;
  i: Integer;
  j: Integer;
  FieldName: string;
  ValueAssigned: Boolean;
begin
 { SetLength(FieldValues, Table.FieldCount);
  for i := 0 to Table.FieldCount - 1 do
  begin
    if Table.Fields[i].FieldName = 'id' then
      FieldValues[i] := AYeniId
    else
    if not Table.Fields[i].IsNull then
      FieldValues[i] := Table.Fields[i].Value
    else
      FieldValues[i] := Null;
  end;
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
  end;  }

  //
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

function TfrmEnvanterTanim2.EnvanterVarmi(var Amsg:string): boolean;
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
function TfrmEnvanterTanim2.ValidateControl:boolean;
begin
  result := true;
  if qEnvanter.FieldByName('active').AsString = '' then
        begin
          MessageDlg('Form Durumu belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
          edActive.SetFocus;
          result := false;
          Exit;
        end;
        if qEnvanter.FieldByName('tarih').AsString = '' then
        begin
          MessageDlg('Form Tarihi belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
          edTarih.SetFocus;
          result := false;
          Exit;
        end;
        if qEnvanter.FieldByName('dept_id').AsInteger < 1 then
        begin
          MessageDlg('Formun Departmaný belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
          edDept.SetFocus;
          result := false;
          Exit;
        end;
        if Pos(qEnvanter.FieldByName('dept_id').AsString, MainMod.LoginInfo.Birimler) < 1 then
        begin
          MessageDlg('Bu envanter kaydý yetkili olduðunuz bir departmana ait deðil. Ýþlem yapamazsýnýz.', mtError, [mbOk]);
          edDept.SetFocus;
          result := false;
          Exit;
        end;
        if qEnvanter.FieldByName('surec_id').AsInteger < 1 then
        begin
          MessageDlg('Süreç belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
          edSurec.SetFocus;
          result := false;
          Exit;
        end;
        if qEnvanter.FieldByName('kaynak_id').AsInteger < 1 then
        begin
          MessageDlg('Veri Kaynaðý / Süreç / Sistem belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
          edKaynak.SetFocus;
          result := false;
          Exit;
        end;
        if qEnvanter.FieldByName('kisi_id').AsInteger < 1 then
        begin
          MessageDlg('Veri Konusu Kiþi belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
          edKisi.SetFocus;
          result := false;
          Exit;
        end;
        if qEnvanter.FieldByName('payl_taraftipi').AsString = '' then
        begin
          MessageDlg('Paylaþýlan Taraf Tipi belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
          edTarafTipi.SetFocus;
          result := false;
          Exit;
        end;

        if edTarafTipi.ItemIndex in [0,1,2] then //paylalýþmýyor hariciseçim
        begin
          if dsAmacPay.DataSet.RecordCount <1 then
          begin
            MessageDlg('Paylaþýlan Amaç  belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
            result := false;
            UniPageControl1.ActivePage := pgPayl_Amac;
            exit;
          end;
          if dsMetodPay.DataSet.RecordCount <1 then
          begin
            MessageDlg('Paylaþýlan metot  belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
            result := false;
            UniPageControl1.ActivePage := pgPayl_Metod;
            exit;
          end;
          if dsTaraf.DataSet.RecordCount <1 then
          begin
            MessageDlg('Paylaþýlan medot  belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
            result := false;
            UniPageControl1.ActivePage := pgPayl_Taraf;
            exit;
          end;
        end;


  result := true;
end;

function TfrmEnvanterTanim2.TimeValidateControl(Aquery : tdataset): boolean;
begin
    result := true;
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
procedure TfrmEnvanterTanim2.btnPostClick(Sender: TObject);
var
kontrolId : integer;
NewenvanterRecCount : integer;
oldenvanterRecCount : integer;
AQenvanter,Aqdetail : TUniQuery;
NewEnvId : integer;
  I: Integer;
begin

     if not MultiChange then
      begin

        if detailkilitli then
        begin
          MessageDlg('Kontrol Listeli kilitlenmiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
          Exit;
        end;

         if EnvCopy then
            begin
               QueryOpen(qTmp,' select * from data_envanter where '+
              ' mc_id = '+IntToStr(mainmod.MCID)+' and main_id=0 '+
              ' and dept_id=' + qEnvanter.FieldByName('dept_id').asstring +
              ' and surec_id=' + qEnvanter.FieldByName('surec_id').asstring +
              ' and kaynak_id =' + qEnvanter.FieldByName('kaynak_id').asstring +
              ' and kisi_id =' + qEnvanter.FieldByName('kisi_id').asstring );
              if qTmp.RecordCount > 0 then
               begin
                 ShowMessageN('Ayný departman, kaynak, sureç ve kiþiye ait  kayýt var. '+ #13#10+ ' iþleminiz iptal ediliyor ') ;
                 exit;
               end;
            end;

        if not ValidateControl then
          exit;
        // Süre ile ilgili kontroller
        if  not TimeValidateControl(qEnvanter) then
          exit;

       SeciliIdsTopla;

        if qEnvanter.State in [dsInsert] then
        begin
          if qEnvanter.FieldByName('id').AsInteger < 1 then
             qEnvanter.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_data_envanter_id');
          qEnvanter.FieldByName('mc_id').AsInteger  := MainMod.MCID;
          qEnvanter.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
          qEnvanter.FieldByName('idt').AsDateTime   := Now;
        end ;

        qEnvanter.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
        qEnvanter.FieldByName('sdt').AsDateTime     := Now;

        tblDetailBeforeScroll(tblDetail);
        if tblDetail.RecordCount < 1 then
        begin
          MessageDlg('Envanter Formunu kaydedebilmek için Veri Kaynaðý içerisinde en az 1 tane Veri Tipi olmalýdýr. Lütfen kontrol ediniz.', mtError, [mbOk]);
          Exit;
        end;

        qEnvanter.FieldByName('nitelik').AsString := GetMainNitelik;
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
          // Doðan Akçay Kontrol formu veri bütünlüðü bozulmamasý için eklenen kod sonu
        end;

        qEnvDet.First;
        while not qEnvDet.EOF do
        begin
          qEnvDet.Edit;
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
          qEnvDet.Post;
          qEnvDet.Next;
        end;

            if EnvCopy then
            begin

            AQenvanter := TUniQuery.Create(nil);
            Aqdetail  := TUniQuery.Create( nil) ;
            try
              AQenvanter.Connection := MainMod.DBMain;
              AQenvanter.CachedUpdates := true;
              QueryOpen(AQenvanter,'Select * from data_envanter where id=0');
              NewEnvId := MainMod.GetSeq('sq_data_envanter_id');
              AQenvanter.Append;
              for I := 0 to qEnvanter.Fields.Count - 1  do
              begin
                if qEnvanter.Fields[i].FieldName = 'id' then
                  AQenvanter.Fields[i].AsInteger :=  NewEnvId
                else if (qEnvanter.Fields[i].FieldName = 'idt') or (qEnvanter.Fields[i].FieldName = 'sdt')   then
                  AQenvanter.Fields[i].AsDateTime := now
                else if (qEnvanter.Fields[i].FieldName = 'idy') or (qEnvanter.Fields[i].FieldName = 'sdy') then
                  AQenvanter.Fields[i].AsInteger := MainMod.LoginInfo.ID
                else
                  AQenvanter.Fields[i].Value := qEnvanter.Fields[i].Value;
              end;
               AQenvanter.Post;
               AQenvanter.ApplyUpdates;

               qEnvDet.First;
               while not qEnvDet.Eof do
               begin
                AQenvanter.Append;
                 for I := 0 to qEnvDet.Fields.Count - 1 do
                   begin
                     if qEnvDet.Fields[i].FieldName = 'id' then
                        AQenvanter.Fields[i].AsInteger := MainMod.GetSeq('sq_data_envanter_id')
                      else if qEnvDet.Fields[i].Fieldname = 'main_id' then
                        AQenvanter.Fields[i].AsInteger := NewEnvId
                      else if (qEnvDet.Fields[i].FieldName = 'idt') or (qEnvDet.Fields[i].FieldName = 'sdt')   then
                        AQenvanter.Fields[i].AsDateTime := now
                      else if (qEnvDet.Fields[i].FieldName = 'idy') or (qEnvDet.Fields[i].FieldName = 'sdy') then
                        AQenvanter.Fields[i].AsInteger := MainMod.LoginInfo.ID
                      else AQenvanter.Fields[i].Value := qEnvDet.Fields[i].Value;
                   end;
                  AQenvanter.Post;
                  AQenvanter.ApplyUpdates;
                 qEnvDet.Next;
               end;

              try
                MainMod.DBMain.StartTransaction;
                qEnvDet.CancelUpdates;
                qEnvanter.CancelUpdates;
                AQenvanter.CommitUpdates;
                MainMod.DBMain.Commit;
              except
                qEnvDet.CancelUpdates;
                qEnvanter.CancelUpdates;
                AQenvanter.CancelUpdates;
                MainMod.DBMain.Rollback;
              end;
            finally
              if Assigned(AQenvanter)  then
                FreeAndNil( AQenvanter);
              if Assigned(Aqdetail)  then
                FreeAndNil( Aqdetail);
            end;
            ModalResult := mrOk;
        end else
        begin
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
      end else
      begin
        PostMultiChange;
        exit;
      end;
end;

function TfrmEnvanterTanim2.DegerGetir(Aid : integer; Afield: string; Atable : Tdataset) : string;
begin
  result := '';
  if Atable.Locate('id',Aid,[]) then
    result := Atable.FieldByName(afield).AsString;

end;

function TfrmEnvanterTanim2.CheckID(AID: Integer; ATable: TVirtualTable): Boolean;
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

function TfrmEnvanterTanim2.CheckVTID(AID: Integer): Boolean;
var
  OldID : Integer;
begin
  Result := False;
  DetailLoading := True;
  tblDetail.DisableControls;
  OldID := tblDetail.FieldByName('id').AsInteger;
  tblDetail.First;
  while not tblDetail.EOF do
  begin
    if tblDetail.FieldByName('veritipi_id').AsInteger = AID then
    begin
      Result := True;
      Break;
    end;
    tblDetail.Next;
  end;

  tblDetail.Locate('id', OldID, []);
  tblDetail.EnableControls;
  DetailLoading := False;
end;

procedure TfrmEnvanterTanim2.CloseTables;
begin
  qDept.Close;
  qSurec.Close;
  qKaynak.Close;
  qKisi.Close;
  qOnem.Close;
  qEnvDet.Close;

  tblDepts.Close;
  tblAmacTop.Close;
  tblAmacSak.Close;
  tblAmacPay.Close;
  tblTaraf.Close;
  tblDgrDayanak.Close;
  tblDgrDocs.Close;
  tblMetodTop.Close;
  tblMetodSak.Close;
  tblMetodPay.Close;
  tblHkkDayanak.Close;
  tblHkkDocs.Close;
  tblDetail.Close;
end;



procedure TfrmEnvanterTanim2.DelMetodSakControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  tblMetodSak.Delete;
end;

procedure TfrmEnvanterTanim2.DelMetodSakDControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  tblMetodSakD.Delete;
end;

procedure TfrmEnvanterTanim2.DelMetodTopControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  tblMetodTop.Delete;
end;

procedure TfrmEnvanterTanim2.DelMetodTopDControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  tblMetodTopD.Delete;
end;

procedure TfrmEnvanterTanim2.DelMetodPayControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  tblMetodPay.Delete;
end;

procedure TfrmEnvanterTanim2.DelMetodPayDControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  tblMetodPayD.Delete;
end;

procedure TfrmEnvanterTanim2.DelAmacTopControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  tblAmacTop.Delete;
end;

procedure TfrmEnvanterTanim2.DelAmacTopDControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  tblAmacTopD.Delete;
end;

procedure TfrmEnvanterTanim2.DelAmacSakControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  tblAmacSak.Delete;
end;

procedure TfrmEnvanterTanim2.DelAmacSakDControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  tblAmacSakD.Delete;
end;

procedure TfrmEnvanterTanim2.DelAmacPayControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  tblAmacPay.Delete;
end;

procedure TfrmEnvanterTanim2.DelAmacPayDControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  tblAmacPayD.Delete;
end;

procedure TfrmEnvanterTanim2.DelTarafControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  tblTaraf.Delete;
end;

procedure TfrmEnvanterTanim2.DelTarafDControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  tblTarafD.Delete;
end;

procedure TfrmEnvanterTanim2.DelVeriTipiControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  qEnvDet.Delete;
  tblDetail.Delete;
end;

procedure TfrmEnvanterTanim2.dsEnvanterDataChange(Sender: TObject;
  Field: TField);
begin
  if dsEnvanter.DataSet.FieldByName('active').isnull then
    lbactive.Caption := 'Seçim Yapýlmamýþ'
  else if   dsEnvanter.DataSet.FieldByName('active').AsString ='H' then
    lbactive.Caption := 'Hayýr'
  else if   dsEnvanter.DataSet.FieldByName('active').AsString ='E' then
    lbactive.Caption := 'Evet' ;
end;

procedure TfrmEnvanterTanim2.dsEnvanterStateChange(Sender: TObject);
begin
  ManageSettings;
end;

procedure TfrmEnvanterTanim2.DelDeptControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  tblDepts.Delete;
end;

procedure TfrmEnvanterTanim2.DelDeptDControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  tblDeptsD.Delete;
end;

procedure TfrmEnvanterTanim2.DelDgrDayanakControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  tblDgrDayanak.Delete;
end;

procedure TfrmEnvanterTanim2.DelDgrDocsControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  tblDgrDocs.Delete;
end;

procedure TfrmEnvanterTanim2.edFSureVarChange(Sender: TObject);
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

procedure TfrmEnvanterTanim2.edKaynakChange(Sender: TObject);
var
  KaynakId ,
  KisiId   : String;
begin
  KaynakId := qEnvanter.FieldByName('kaynak_id').AsString;
  KisiId   := qEnvanter.FieldByName('kisi_id').AsString;
//  KaynakId := dsEnvanter.DataSet.FieldByName('kaynak_id').AsString;
//  KisiId   := dsEnvanter.DataSet.FieldByName('kisi_id').AsString;
  if KaynakId = '' then KaynakId := '0';
  if KisiId = '' then KisiId := '0';

  QueryOpen(qCheckList, 'SELECT * FROM data_checklist ' +
                        'WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) +
                        ' AND kaynak_id = ' + KaynakId + ' AND kisi_id = ' + KisiId);
  StrToListHkkDayanak;
  StrToListHkkDocs;
end;

procedure TfrmEnvanterTanim2.edSSureVarChange(Sender: TObject);
begin
  if edSSureVar.Text = 'SAKLANIYOR' then
  begin
    edSImha.Enabled := True;
    edSSure.Enabled := True;
    edSSureTip.Enabled := True;
  end
  else
  begin
    edSImha.Enabled := False;
    edSSure.Enabled := False;
    edSSureTip.Enabled := False;
  end;
end;

function TfrmEnvanterTanim2.Exec(AIds: string): integer;
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
   //VqEnvDet.Append;


    dsEnvanter.AutoEdit := true;
    YardimKw := 'EnvanterFormlariDegistir';

  PrepareTables;
//  edKaynakChange(edKaynak);
//  chbDgrSozClick(chbDgrSoz);
//  chbDgrPolClick(chbDgrPol);
//  chbPaylSozlesmeClick(chbPaylSozlesme);
//  edSSureVarChange(edSSureVar);
//  edFSureVarChange(edFSureVar);
//  ActiveControl := edTarih;
//  PrepareDetails;
  tblDetail.Open;
  HideMask;
  Result := ShowModal;
  CloseTables;
end;

function TfrmEnvanterTanim2.copy(AId: integer): integer;
begin
  EnvCopy := true;
  MultiChange := false;
  qEnvanter.CachedUpdates := true;
    QueryOpen(qEnvanter, 'SELECT * FROM data_envanter WHERE id = ' + IntToStr(AID));
    if not detailkilitli then
      qEnvanter.Edit;
//    YardimKw := 'EnvanterFormlariDegistir';

  PrepareTables;
  edKaynakChange(edKaynak);
  chbDgrSozClick(chbDgrSoz);
  chbDgrPolClick(chbDgrPol);
  chbPaylSozlesmeClick(chbPaylSozlesme);
  edSSureVarChange(edSSureVar);
  edFSureVarChange(edFSureVar);
  ActiveControl := edTarih;
  PrepareDetails;
  HideMask;
  Result := ShowModal;

  CloseTables;
end;

function TfrmEnvanterTanim2.Exec(AID, AOp, kilitli: Integer): Integer;
begin
  detailKilitli := (kilitli=1);
  MultiChange := false;
  EnvCopy := false;
  if AOp = 0 then // Insert
  begin
    AID := MainMod.GetSeq('sq_data_envanter_id');
    QueryOpen(qEnvanter, 'SELECT * FROM data_envanter WHERE id = ' + IntToStr(AID));
    qEnvanter.Insert;
    qEnvanter.FieldByName('id').AsInteger              := AID;
    qEnvanter.FieldByName('main_id').AsInteger         := 0;
    qEnvanter.FieldByName('active').AsString           := 'E';
    qEnvanter.FieldByName('nitelik').AsString          := 'H';
    qEnvanter.FieldByName('veritipi_id').AsInteger     := 0;
    qEnvanter.FieldByName('kategori_id').AsInteger     := 0;

    qEnvanter.FieldByName('sakl_fsure_var').AsString   := 'SAKLANMIYOR';
    qEnvanter.FieldByName('sakl_fsure_imha').AsString  := '';
    qEnvanter.FieldByName('sakl_fsure_sure').AsInteger := 0;
    qEnvanter.FieldByName('sakl_fsure_tip').AsString   := '';

    qEnvanter.FieldByName('sakl_ssure_var').AsString   := 'SAKLANMIYOR';
    qEnvanter.FieldByName('sakl_ssure_imha').AsString  := '';
    qEnvanter.FieldByName('sakl_ssure_sure').AsInteger := 0;
    qEnvanter.FieldByName('sakl_ssure_tip').AsString   := '';

    qEnvanter.FieldByName('dgr_politika').AsString     := 'H';
    qEnvanter.FieldByName('dgr_sozlesme').AsString     := 'H';
    qEnvanter.FieldByName('payl_sozlesme').AsString    := 'H';
    qEnvanter.FieldByName('payl_taraftipi').AsString   := '';
    YardimKw := 'EnvanterFormlariYeniKayit';
  end
  else // Edit
  begin
    QueryOpen(qEnvanter, 'SELECT * FROM data_envanter WHERE id = ' + IntToStr(AID));

    if not detailkilitli then
      qEnvanter.Edit;
    dsEnvanter.AutoEdit := not detailkilitli;
    YardimKw := 'EnvanterFormlariDegistir';
  end;

  PrepareTables;
  edKaynakChange(edKaynak);
  chbDgrSozClick(chbDgrSoz);
  chbDgrPolClick(chbDgrPol);
  chbPaylSozlesmeClick(chbPaylSozlesme);
  edSSureVarChange(edSSureVar);
  edFSureVarChange(edFSureVar);
  ActiveControl := edTarih;
  PrepareDetails;
  HideMask;
  Result := ShowModal;

  CloseTables;
end;

function TfrmEnvanterTanim2.GetMainNitelik(Adataset: tdataset = nil): String;
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

procedure TfrmEnvanterTanim2.grdVeriTipiDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
  Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if grdVeriTipi.DataSource.DataSet.FieldByName('nitelik').AsString = 'E' then
  begin
    Attribs.Font.Style := [fsBold];
    Attribs.Font.Color := clMaroon;
  end;
end;

function TfrmEnvanterTanim2.ListToStr(ATable: TVirtualTable): String;
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

procedure TfrmEnvanterTanim2.ListToStrDetails;
begin
  qEnvDet.FieldByName('sakl_erisim_ids').AsString := ListToStr(tblDeptsD);
  qEnvDet.FieldByName('topl_amac_ids').AsString   := ListToStr(tblAmacTopD);
  qEnvDet.FieldByName('sakl_amac_ids').AsString   := ListToStr(tblAmacSakD);
  qEnvDet.FieldByName('payl_amac_ids').AsString   := ListToStr(tblAmacPayD);
  qEnvDet.FieldByName('payl_taraf_ids').AsString  := ListToStr(tblTarafD);
  qEnvDet.FieldByName('dgr_dayanak_ids').AsString := ListToStr(tblDgrDayanak);
  qEnvDet.FieldByName('dgr_dokuman_ids').AsString := ListToStr(tblDgrDocs);
  qEnvDet.FieldByName('topl_metod_ids').AsString  := ListToStr(tblMetodTopD);
  qEnvDet.FieldByName('sakl_metod_ids').AsString  := ListToStr(tblMetodSakD);
  qEnvDet.FieldByName('payl_metod_ids').AsString  := ListToStr(tblMetodPayD);
end;

procedure TfrmEnvanterTanim2.ManageSettings;
begin

  pnlMsg.Visible := EnvCopy;

  grdAmacTopD.Visible := false;
//  grdAmacTop.Height := 350;
//  btnAmacTopDAdd.Visible := false;
//  btnAmacTopDDel.Visible := false;
//  btnAmacTopDNew.Visible := false;
//  UniLabel33.Visible := false;

  grdMetodTopD.Visible := false;
//  grdMetodTop.Height := 350;
//  btnMetodTopDAdd.Visible := false;
//  btnMetodTopDDel.Visible := false;
//  btnMetodTopDAdd.Visible := false;
//  btnMetodTopDNew.Visible := false;
//  UniLabel44.Visible := false;

  grdAmacSakD.Visible := false;
//  grdAmacSak.Height := 350;
//  btnAmacSakDAdd.Visible := not multichange;
//  btnAmacSakDDel.Visible := not multichange;
//  btnAmacSakDAdd.Visible := not multichange;
//  btnAmacSakDNew.Visible := not multichange;
//  UniLabel45.Visible := not multichange;

  grdMetodSakD.Visible := false;
//  grdMetodSak.Height := 350;
//  btnMetodSakDAdd.Visible := false;
//  btnMetodSakDDel.Visible := false;
//  btnMetodSakDAdd.Visible := false;
//  btnMetodSakDNew.Visible := false;
//  UniLabel48.Visible := false;

  grdDeptsD.Visible := false;
//  grdDepts.Height := 350;
//  btnDeptsDAdd.Visible := false;
//  btnDeptsDDel.Visible := false;
//  btnDeptsDAdd.Visible := false;
//  btnDeptsDNew.Visible := false;
//  UniLabel50.Visible := false;

  grdAmacPayD.Visible := false;
//  grdAmacPay.Height := 350;
//  btnAmacPayDAdd.Visible := false;
//  btnAmacPayDDel.Visible := false;
//  btnAmacPayDAdd.Visible := false;
//  btnAmacPayDNew.Visible := false;
//  UniLabel52.Visible := false;

  grdMetodPayD.Visible := false;
//  grdMetodPay.Height := 350;
//  btnMetodPayDAdd.Visible := false;
//  btnMetodPayDDel.Visible := false;
//  btnMetodPayDAdd.Visible := false;
//  btnMetodPayDNew.Visible := false;
//  UniLabel54.Visible := false;

  grdTarafD.Visible := false;
//  grdTaraf.Height := 350;
//  btnTarafDAdd.Visible := false;
//  btnTarafDDel.Visible := false;
//  btnTarafDAdd.Visible := false;
//  btnTarafDNew.Visible := false;
//  UniLabel56.Visible := false;


 if not MultiChange then
 begin
  btnpost.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnEnvDetAdd.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnEnvDetDel.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnAmacTopAdd.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnAmacTopDel.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnAmacTopNew.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnAmacTopDAdd.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnAmacTopDDel.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnAmacTopDNew.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnAmacPayAdd.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnAmacPayDel.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnAmacPayNew.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnAmacPayDAdd.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnAmacPayDDel.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnAmacPayDNew.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnAmacSakAdd.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnAmacSakDel.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnAmacSakNew.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnAmacSakDAdd.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnAmacSakDDel.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnAmacSakDNew.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnMetodTopAdd.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnMetodTopDel.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnMetodTopNew.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnMetodTopDAdd.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnMetodTopDDel.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnMetodTopDNew.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnMetodPayAdd.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnMetodPayDel.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnMetodPayNew.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnMetodPayDAdd.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnMetodPayDDel.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnMetodPayDNew.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnMetodSakAdd.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnMetodSakDel.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnMetodSakNew.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnMetodSakDAdd.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnMetodSakDDel.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnMetodSakDNew.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnTarafAdd.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnTarafDel.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnTarafNew.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnTarafDAdd.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnTarafDDel.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnTarafDNew.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnDgrDayanakAdd.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnDgrDayanakDel.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnDgrDayanakNew.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnDgrDocsAdd.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnDgrDocsDel.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnDgrDocsNew.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  edActive.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnDeptsAdd.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnDeptsDel.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnDeptsNew.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnDeptsDAdd.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnDeptsDDel.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  btnDeptsDNew.Enabled := qEnvanter.State in [dsEdit, dsInsert];

  edSSureVar.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  edFSureVar.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  edFImha.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  edSImha.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  edFSureTip.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  edSSureTip.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  chbPaylSozlesme.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  chbDgrPol.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  chbDgrSoz.Enabled := qEnvanter.State in [dsEdit, dsInsert];
  chbKategori.Enabled := qEnvanter.State in [dsEdit, dsInsert];

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

procedure TfrmEnvanterTanim2.PrepareDetails;
begin
  DetailLoading := True;
  QueryOpen(qEnvDet, 'SELECT * FROM data_envanter WHERE main_id = ' + IntToStr(qEnvanter.FieldByName('id').AsInteger) + ' ORDER BY id');
  QueryOpen(qTmp, 'SELECT env.id, env.nitelik, env.veritipi_id, env.kategori_id, vt.veri_tipi AS veritipi_str, kt.kategori AS kategori_str ' +
                  'FROM data_envanter env, def_data_veritipi vt, def_data_kategori kt ' +
                  'WHERE vt.id = env.veritipi_id AND kt.id = env.kategori_id AND env.main_id = ' +
                  IntToStr(qEnvanter.FieldByName('id').AsInteger) + ' ORDER BY vt.veri_tipi');
  qTmp.First;
  tblDetail.Open;
  while not qTmp.EOF do
  begin
    tblDetail.Append;
    tblDetail.FieldByName('id').AsInteger          := qTmp.FieldByName('id').AsInteger;
    tblDetail.FieldByName('kategori_id').AsInteger := qTmp.FieldByName('kategori_id').AsInteger;
    tblDetail.FieldByName('veritipi_id').AsInteger := qTmp.FieldByName('veritipi_id').AsInteger;
    tblDetail.FieldByName('kategori_str').AsString := qTmp.FieldByName('kategori_str').AsString;
    tblDetail.FieldByName('veritipi_str').AsString := qTmp.FieldByName('veritipi_str').AsString;
    tblDetail.FieldByName('nitelik').AsString      := qTmp.FieldByName('nitelik').AsString;
    tblDetail.Post;
    qTmp.Next;
  end;
  tblDetail.First;
  DetailLoading := False;
  tblDeptsD.Open;
  tblAmacTopD.Open;
  tblAmacSakD.Open;
  tblAmacPayD.Open;
  tblTarafD.Open;
  tblMetodTopD.Open;
  tblMetodSakD.Open;
  tblMetodPayD.Open;
  tblDetailAfterScroll(tblDetail);
end;

procedure TfrmEnvanterTanim2.StrToListDetails;
begin

  StrToListDeptD;
  StrToListAmacTopD;
  StrToListAmacSakD;
  StrToListAmacPayD;
  StrToListTarafD;
  StrToListMetodTopD;
  StrToListMetodSakD;
  StrToListMetodPayD;
end;

procedure TfrmEnvanterTanim2.PrepareTables;
var
  Birimler : String;
begin
  Birimler := MainMod.LoginInfo.Birimler;
  if Birimler = '' then Birimler := '0';

  QueryOpen(qDept, 'SELECT id, title FROM sys_deptdef WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) +
                   ' AND id IN (' + Birimler + ') ORDER BY title');
  QueryOpen(qSurec, 'SELECT id, surec FROM def_data_surec WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY surec');
  QueryOpen(qKaynak, 'SELECT id, kaynak FROM def_data_kaynak WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY kaynak');
  QueryOpen(qKisi, 'SELECT id, kisi FROM def_data_kisi WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY kisi');
  QueryOpen(qOnem, 'SELECT id, onemderece FROM def_data_onemderece WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY onemderece');

  tblDepts.Open;
  tblAmacTop.Open;
  tblAmacSak.Open;
  tblAmacPay.Open;
  tblTaraf.Open;
  tblDgrDayanak.Open;
  tblDgrDocs.Open;
  tblMetodTop.Open;
  tblMetodSak.Open;
  tblMetodPay.Open;
  tblHkkDayanak.Open;
  tblHkkDocs.Open;

  StrToListDept;
  StrToListAmacTop;
  StrToListAmacSak;
  StrToListAmacPay;
  StrToListTaraf;
  StrToListDgrDocs;
  StrToListDgrDayanak;
  StrToListMetodTop;
  StrToListMetodSak;
  StrToListMetodPay;
end;

procedure TfrmEnvanterTanim2.qEnvanterBeforePost(DataSet: TDataSet);
begin
  oldKaynak_Id := 0;
  OldKisi_Id := 0;

  if qEnvanter.State in [dsEdit] then
  begin

  end;

  if qEnvanter.State in [dsEdit] then
   begin
    if qEnvanter.FieldByName('kaynak_id').OldValue <> qEnvanter.FieldByName('kaynak_id').NewValue  then
      oldKaynak_Id := qEnvanter.FieldByName('kaynak_id').OldValue;
    if qEnvanter.FieldByName('kisi_id').OldValue <> qEnvanter.FieldByName('kisi_id').NewValue then
      OldKisi_Id :=  qEnvanter.FieldByName('kisi_id').OldValue;
    changeActive := qEnvanter.FieldByName('active').OldValue <> qEnvanter.FieldByName('active').NewValue;

    if NOT ((qEnvanter.FieldByName('dept_id').NewValue<>qEnvanter.FieldByName('dept_id').OldValue ) or
        (qEnvanter.FieldByName('surec_id').NewValue<>qEnvanter.FieldByName('surec_id').OldValue ) or
        (qEnvanter.FieldByName('kaynak_id').NewValue<>qEnvanter.FieldByName('kaynak_id').OldValue ) or
        (qEnvanter.FieldByName('kisi_id').NewValue<>qEnvanter.FieldByName('kisi_id').OldValue ) or
        ( (qEnvanter.FieldByName('active').NewValue<>qEnvanter.FieldByName('active').OldValue) and
        (qEnvanter.FieldByName('active').NewValue ='E')  ) )     then
        exit;
   end;

  QueryOpen(qTmp,' select * from data_envanter where '+
        IfThen(not MultiChange,'id <> '+qEnvanter.FieldByName('id').AsString+' and ','')+
      ' mc_id = '+IntToStr(mainmod.MCID)+' and main_id=0 '+
      ' and dept_id=' + VarToStr(qEnvanter.FieldByName('dept_id').NewValue ) +
      ' and surec_id=' + VarToStr(qEnvanter.FieldByName('surec_id').NewValue ) +
      ' and kaynak_id =' + VarToStr(qEnvanter.FieldByName('kaynak_id').NewValue ) +
      ' and kisi_id =' + VarToStr(qEnvanter.FieldByName('kisi_id').NewValue ) );
  if qTmp.RecordCount > 0 then
   begin
     ShowMessageN('Ayný departman, kaynak, sureç ve kiþiye ait  kayýt var. '+ #13#10+ ' iþleminiz iptal ediliyor ') ;
     abort;
   end;


end;

procedure TfrmEnvanterTanim2.StrToListMetodSak;
begin
  tblMetodSak.First;
  while not tblMetodSak.EOF do tblMetodSak.Delete;
  if qEnvanter.FieldByName('sakl_metod_ids').AsString = '' then Exit;

  QueryOpen(qTmp, 'SELECT id, metod FROM def_data_metod WHERE id in (' + qEnvanter.FieldByName('sakl_metod_ids').AsString + ') ' +
                  ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY metod');

  qTmp.First;
  while not qTmp.EOF do
  begin
    tblMetodSak.Append;
    tblMetodSak.FieldByName('id').AsInteger   := qTmp.FieldByName('id').AsInteger;
    tblMetodSak.FieldByName('name').AsString  := qTmp.FieldByName('metod').AsString;
    tblMetodSak.Post;

    qTmp.Next;
  end;
end;

procedure TfrmEnvanterTanim2.StrToListMetodSakD;
begin
  tblMetodSakD.First;
  while not tblMetodSakD.EOF do tblMetodSakD.Delete;
  if qEnvDet.FieldByName('sakl_metod_ids').AsString = '' then Exit;

  QueryOpen(qTmp, 'SELECT id, metod FROM def_data_metod WHERE id in (' + qEnvDet.FieldByName('sakl_metod_ids').AsString + ') ' +
                  ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY metod');
  qTmp.First;
  while not qTmp.EOF do
  begin
    tblMetodSakD.Append;
    tblMetodSakD.FieldByName('id').AsInteger   := qTmp.FieldByName('id').AsInteger;
    tblMetodSakD.FieldByName('name').AsString  := qTmp.FieldByName('metod').AsString;
    tblMetodSakD.Post;

    qTmp.Next;
  end;
end;

procedure TfrmEnvanterTanim2.StrToListMetodTop;
begin
  tblMetodTop.First;
  while not tblMetodTop.EOF do tblMetodTop.Delete;
  if qEnvanter.FieldByName('topl_metod_ids').AsString = '' then Exit;

  QueryOpen(qTmp, 'SELECT id, metod FROM def_data_metod WHERE id in (' + qEnvanter.FieldByName('topl_metod_ids').AsString + ') ' +
                  ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY metod');

  qTmp.First;
  while not qTmp.EOF do
  begin
    tblMetodTop.Append;
    tblMetodTop.FieldByName('id').AsInteger   := qTmp.FieldByName('id').AsInteger;
    tblMetodTop.FieldByName('name').AsString  := qTmp.FieldByName('metod').AsString;
    tblMetodTop.Post;

    qTmp.Next;
  end;
end;

procedure TfrmEnvanterTanim2.StrToListMetodTopD;
begin
  tblMetodTopD.First;
  while not tblMetodTopD.EOF do tblMetodTopD.Delete;
  if qEnvDet.FieldByName('topl_metod_ids').AsString = '' then Exit;

  QueryOpen(qTmp, 'SELECT id, metod FROM def_data_metod WHERE id in (' + qEnvDet.FieldByName('topl_metod_ids').AsString + ') ' +
                  ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY metod');
  qTmp.First;
  while not qTmp.EOF do
  begin
    tblMetodTopD.Append;
    tblMetodTopD.FieldByName('id').AsInteger   := qTmp.FieldByName('id').AsInteger;
    tblMetodTopD.FieldByName('name').AsString  := qTmp.FieldByName('metod').AsString;
    tblMetodTopD.Post;

    qTmp.Next;
  end;
end;

procedure TfrmEnvanterTanim2.StrToListMetodPay;
begin
  tblMetodPay.First;
  while not tblMetodPay.EOF do tblMetodPay.Delete;
  if qEnvanter.FieldByName('payl_metod_ids').AsString = '' then Exit;

  QueryOpen(qTmp, 'SELECT id, metod FROM def_data_metod WHERE id in (' + qEnvanter.FieldByName('payl_metod_ids').AsString + ') ' +
                  ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY metod');

  qTmp.First;
  while not qTmp.EOF do
  begin
    tblMetodPay.Append;
    tblMetodPay.FieldByName('id').AsInteger   := qTmp.FieldByName('id').AsInteger;
    tblMetodPay.FieldByName('name').AsString  := qTmp.FieldByName('metod').AsString;
    tblMetodPay.Post;

    qTmp.Next;
  end;
end;

procedure TfrmEnvanterTanim2.StrToListMetodPayD;
begin
  tblMetodPayD.First;
  while not tblMetodPayD.EOF do tblMetodPayD.Delete;
  if qEnvDet.FieldByName('payl_metod_ids').AsString = '' then Exit;

  QueryOpen(qTmp, 'SELECT id, metod FROM def_data_metod WHERE id in (' + qEnvDet.FieldByName('payl_metod_ids').AsString + ') ' +
                  ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY metod');
  qTmp.First;
  while not qTmp.EOF do
  begin
    tblMetodPayD.Append;
    tblMetodPayD.FieldByName('id').AsInteger   := qTmp.FieldByName('id').AsInteger;
    tblMetodPayD.FieldByName('name').AsString  := qTmp.FieldByName('metod').AsString;
    tblMetodPayD.Post;

    qTmp.Next;
  end;
end;

procedure TfrmEnvanterTanim2.StrToListDgrDayanak;
begin
  tblDgrDayanak.First;
  while not tblDgrDayanak.EOF do tblDgrDayanak.Delete;
  if qEnvanter.FieldByName('dgr_dayanak_ids').AsString = '' then Exit;

  QueryOpen(qTmp, 'SELECT id, dayanak FROM def_data_dayanak WHERE id in (' + qEnvanter.FieldByName('dgr_dayanak_ids').AsString + ') ' +
                  ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY dayanak');

  qTmp.First;
  while not qTmp.EOF do
  begin
    tblDgrDayanak.Append;
    tblDgrDayanak.FieldByName('id').AsInteger   := qTmp.FieldByName('id').AsInteger;
    tblDgrDayanak.FieldByName('name').AsString  := qTmp.FieldByName('dayanak').AsString;
    tblDgrDayanak.Post;

    qTmp.Next;
  end;
end;

procedure TfrmEnvanterTanim2.StrToListDgrDocs;
begin
  tblDgrDocs.First;
  while not tblDgrDocs.EOF do tblDgrDocs.Delete;
  if qEnvanter.FieldByName('dgr_dokuman_ids').AsString = '' then Exit;

  QueryOpen(qTmp, 'SELECT id, dokuman FROM def_data_dokuman WHERE id in (' + qEnvanter.FieldByName('dgr_dokuman_ids').AsString + ') ' +
                  ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY dokuman');

  qTmp.First;
  while not qTmp.EOF do
  begin
    tblDgrDocs.Append;
    tblDgrDocs.FieldByName('id').AsInteger   := qTmp.FieldByName('id').AsInteger;
    tblDgrDocs.FieldByName('name').AsString  := qTmp.FieldByName('dokuman').AsString;
    tblDgrDocs.Post;

    qTmp.Next;
  end;
end;

procedure TfrmEnvanterTanim2.StrToListHkkDayanak;
begin
  tblHkkDayanak.First;
  while not tblHkkDayanak.EOF do tblHkkDayanak.Delete;
  if qCheckList.FieldByName('dayanak_ids').AsString = '' then Exit;

  QueryOpen(qTmp, 'SELECT id, dayanak FROM def_data_dayanak WHERE id in (' + qCheckList.FieldByName('dayanak_ids').AsString + ') ' +
                  ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY dayanak');

  qTmp.First;
  while not qTmp.EOF do
  begin
    tblHkkDayanak.Append;
    tblHkkDayanak.FieldByName('id').AsInteger   := qTmp.FieldByName('id').AsInteger;
    tblHkkDayanak.FieldByName('name').AsString  := qTmp.FieldByName('dayanak').AsString;
    tblHkkDayanak.Post;

    qTmp.Next;
  end;
end;

procedure TfrmEnvanterTanim2.StrToListHkkDocs;
begin
  tblHkkDocs.First;
  while not tblHkkDocs.EOF do tblHkkDocs.Delete;
  if qCheckList.FieldByName('dokuman_ids').AsString = '' then Exit;

  QueryOpen(qTmp, 'SELECT id, dokuman FROM def_data_dokuman WHERE id in (' + qCheckList.FieldByName('dokuman_ids').AsString + ') ' +
                  ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY dokuman');

  qTmp.First;
  while not qTmp.EOF do
  begin
    tblHkkDocs.Append;
    tblHkkDocs.FieldByName('id').AsInteger   := qTmp.FieldByName('id').AsInteger;
    tblHkkDocs.FieldByName('name').AsString  := qTmp.FieldByName('dokuman').AsString;
    tblHkkDocs.Post;

    qTmp.Next;
  end;
end;

procedure TfrmEnvanterTanim2.StrToListAmacTop;
begin
  tblAmacTop.First;
  while not tblAmacTop.EOF do tblAmacTop.Delete;
  if qEnvanter.FieldByName('topl_amac_ids').AsString = '' then Exit;

  QueryOpen(qTmp, 'SELECT id, amac FROM def_data_amac WHERE id in (' + qEnvanter.FieldByName('topl_amac_ids').AsString + ') ' +
                  ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY amac');

  qTmp.First;
  while not qTmp.EOF do
  begin
    tblAmacTop.Append;
    tblAmacTop.FieldByName('id').AsInteger   := qTmp.FieldByName('id').AsInteger;
    tblAmacTop.FieldByName('name').AsString  := qTmp.FieldByName('amac').AsString;
    tblAmacTop.Post;

    qTmp.Next;
  end;
end;

procedure TfrmEnvanterTanim2.StrToListAmacTopD;
begin
  tblAmacTopD.First;
  while not tblAmacTopD.EOF do tblAmacTopD.Delete;
  if qEnvDet.FieldByName('topl_amac_ids').AsString = '' then Exit;

  QueryOpen(qTmp, 'SELECT id, amac FROM def_data_amac WHERE id in (' + qEnvDet.FieldByName('topl_amac_ids').AsString + ') ' +
                  ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY amac');
  qTmp.First;
  while not qTmp.EOF do
  begin
    tblAmacTopD.Append;
    tblAmacTopD.FieldByName('id').AsInteger   := qTmp.FieldByName('id').AsInteger;
    tblAmacTopD.FieldByName('name').AsString  := qTmp.FieldByName('amac').AsString;
    tblAmacTopD.Post;

    qTmp.Next;
  end;
end;

procedure TfrmEnvanterTanim2.StrToListAmacSak;
begin
  tblAmacSak.First;
  while not tblAmacSak.EOF do tblAmacSak.Delete;
  if qEnvanter.FieldByName('sakl_amac_ids').AsString = '' then Exit;

  QueryOpen(qTmp, 'SELECT id, amac FROM def_data_amac WHERE id in (' + qEnvanter.FieldByName('sakl_amac_ids').AsString + ') ' +
                  ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY amac');

  qTmp.First;
  while not qTmp.EOF do
  begin
    tblAmacSak.Append;
    tblAmacSak.FieldByName('id').AsInteger   := qTmp.FieldByName('id').AsInteger;
    tblAmacSak.FieldByName('name').AsString  := qTmp.FieldByName('amac').AsString;
    tblAmacSak.Post;

    qTmp.Next;
  end;
end;

procedure TfrmEnvanterTanim2.StrToListAmacSakD;
begin
  tblAmacSakD.First;
  while not tblAmacSakD.EOF do tblAmacSakD.Delete;
  if qEnvDet.FieldByName('sakl_amac_ids').AsString = '' then Exit;

  QueryOpen(qTmp, 'SELECT id, amac FROM def_data_amac WHERE id in (' + qEnvDet.FieldByName('sakl_amac_ids').AsString + ') ' +
                  ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY amac');
  qTmp.First;
  while not qTmp.EOF do
  begin
    tblAmacSakD.Append;
    tblAmacSakD.FieldByName('id').AsInteger   := qTmp.FieldByName('id').AsInteger;
    tblAmacSakD.FieldByName('name').AsString  := qTmp.FieldByName('amac').AsString;
    tblAmacSakD.Post;

    qTmp.Next;
  end;
end;

procedure TfrmEnvanterTanim2.StrToListAmacPay;
begin
  tblAmacPay.First;
  while not tblAmacPay.EOF do tblAmacPay.Delete;
  if qEnvanter.FieldByName('payl_amac_ids').AsString = '' then Exit;

  QueryOpen(qTmp, 'SELECT id, amac FROM def_data_amac WHERE id in (' + qEnvanter.FieldByName('payl_amac_ids').AsString + ') ' +
                  ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY amac');

  qTmp.First;
  while not qTmp.EOF do
  begin
    tblAmacPay.Append;
    tblAmacPay.FieldByName('id').AsInteger   := qTmp.FieldByName('id').AsInteger;
    tblAmacPay.FieldByName('name').AsString  := qTmp.FieldByName('amac').AsString;
    tblAmacPay.Post;

    qTmp.Next;
  end;
end;

procedure TfrmEnvanterTanim2.StrToListAmacPayD;
begin
  tblAmacPayD.First;
  while not tblAmacPayD.EOF do tblAmacPayD.Delete;
  if qEnvDet.FieldByName('payl_amac_ids').AsString = '' then Exit;

  QueryOpen(qTmp, 'SELECT id, amac FROM def_data_amac WHERE id in (' + qEnvDet.FieldByName('payl_amac_ids').AsString + ') ' +
                  ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY amac');
  qTmp.First;
  while not qTmp.EOF do
  begin
    tblAmacPayD.Append;
    tblAmacPayD.FieldByName('id').AsInteger   := qTmp.FieldByName('id').AsInteger;
    tblAmacPayD.FieldByName('name').AsString  := qTmp.FieldByName('amac').AsString;
    tblAmacPayD.Post;

    qTmp.Next;
  end;
end;

procedure TfrmEnvanterTanim2.StrToListTaraf;
begin
  tblTaraf.First;
  while not tblTaraf.EOF do tblTaraf.Delete;
  if qEnvanter.FieldByName('payl_taraf_ids').AsString = '' then Exit;

  QueryOpen(qTmp, 'SELECT id, taraf FROM def_data_taraf WHERE id in (' + qEnvanter.FieldByName('payl_taraf_ids').AsString + ') ' +
                  ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY taraf');

  qTmp.First;
  while not qTmp.EOF do
  begin
    tblTaraf.Append;
    tblTaraf.FieldByName('id').AsInteger   := qTmp.FieldByName('id').AsInteger;
    tblTaraf.FieldByName('name').AsString  := qTmp.FieldByName('taraf').AsString;
    tblTaraf.Post;

    qTmp.Next;
  end;
end;

procedure TfrmEnvanterTanim2.StrToListTarafD;
begin
  tblTarafD.First;
  while not tblTarafD.EOF do tblTarafD.Delete;
  if qEnvDet.FieldByName('payl_taraf_ids').AsString = '' then Exit;

  QueryOpen(qTmp, 'SELECT id, taraf FROM def_data_taraf WHERE id in (' + qEnvDet.FieldByName('payl_taraf_ids').AsString + ') ' +
                  ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY taraf');
  qTmp.First;
  while not qTmp.EOF do
  begin
    tblTarafD.Append;
    tblTarafD.FieldByName('id').AsInteger   := qTmp.FieldByName('id').AsInteger;
    tblTarafD.FieldByName('name').AsString  := qTmp.FieldByName('taraf').AsString;
    tblTarafD.Post;

    qTmp.Next;
  end;
end;

procedure TfrmEnvanterTanim2.tblDetailAfterScroll(DataSet: TDataSet);
begin

  if MultiChange then exit;
  if DetailLoading then Exit;
  qEnvDet.Locate('id', tblDetail.FieldByName('id').AsInteger, []);
  if tblDetail.FieldByName('id').AsInteger = qEnvDet.FieldByName('id').AsInteger then StrToListDetails;
end;

procedure TfrmEnvanterTanim2.tblDetailBeforeScroll(DataSet: TDataSet);
begin

  if MultiChange then exit;

  if DetailLoading then Exit;
  if tblDetail.FieldByName('id').AsInteger = 0 then Exit;

  qEnvDet.Locate('id', tblDetail.FieldByName('id').AsInteger, []);
  if tblDetail.FieldByName('id').AsInteger = qEnvDet.FieldByName('id').AsInteger then
  begin
    qEnvDet.Edit;
    ListToStrDetails;
    qEnvDet.Post;
  end;
end;

procedure TfrmEnvanterTanim2.StrToListDept;
begin
  tblDepts.First;
  while not tblDepts.EOF do tblDepts.Delete;
  if qEnvanter.FieldByName('sakl_erisim_ids').AsString = '' then Exit;

  QueryOpen(qTmp, 'SELECT id, title FROM sys_deptdef WHERE id in (' + qEnvanter.FieldByName('sakl_erisim_ids').AsString + ') ' +
                  ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY title');

  qTmp.First;
  while not qTmp.EOF do
  begin
    tblDepts.Append;
    tblDepts.FieldByName('id').AsInteger   := qTmp.FieldByName('id').AsInteger;
    tblDepts.FieldByName('name').AsString  := qTmp.FieldByName('title').AsString;
    tblDepts.Post;

    qTmp.Next;
  end;
end;

procedure TfrmEnvanterTanim2.StrToListDeptD;
begin
  tblDeptsD.First;
  while not tblDeptsD.EOF do tblDeptsD.Delete;
  if qEnvDet.FieldByName('sakl_erisim_ids').AsString = '' then Exit;

  QueryOpen(qTmp, 'SELECT id, title FROM sys_deptdef WHERE id in (' + qEnvDet.FieldByName('sakl_erisim_ids').AsString + ') ' +
                  ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY title');
  qTmp.First;
  while not qTmp.EOF do
  begin
    tblDeptsD.Append;
    tblDeptsD.FieldByName('id').AsInteger   := qTmp.FieldByName('id').AsInteger;
    tblDeptsD.FieldByName('name').AsString  := qTmp.FieldByName('title').AsString;
    tblDeptsD.Post;

    qTmp.Next;
  end;
end;

procedure TfrmEnvanterTanim2.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmEnvanterTanim2.chbDgrSozClick(Sender: TObject);
begin
  UniDBMemo15.Enabled := chbDgrSoz.Checked;
  UniDBMemo19.Enabled := chbDgrSoz.Checked;
end;

procedure TfrmEnvanterTanim2.chbDgrPolClick(Sender: TObject);
begin
  UniDBMemo13.Enabled := chbDgrPol.Checked;
  UniDBMemo14.Enabled := chbDgrPol.Checked;
end;

procedure TfrmEnvanterTanim2.chbPaylSozlesmeClick(Sender: TObject);
begin
  UniDBMemo6.Enabled := chbPaylSozlesme.Checked;
  UniDBMemo8.Enabled := chbPaylSozlesme.Checked;
end;

procedure TfrmEnvanterTanim2.UniFormBeforeShow(Sender: TObject);
begin
  Width := 945; Height := 550;
  PgControl.ActivePage := pgTemel;
  // Added by TEVFIK 31.05.2023 16:46:15
  UniPageControl1.ActivePageIndex := 0;
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

// to do : Deðiþiklikler butonu eklenip loglar gösterilecek
// to do : Niye eskisinde FormClose ??
