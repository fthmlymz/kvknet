unit unCheckListTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniButton, uniBitBtn, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox, uniCheckBox, uniDBCheckBox, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses, Data.DB,
  MemDS, DBAccess, Uni, uniDateTimePicker, uniDBDateTimePicker, uniBasicGrid, uniDBGrid, uniMemo, uniDBMemo,
  uniPageControl, VirtualTable, uniRadioGroup, strutils;

type
  TfrmCheckListTanim = class(TUniForm)
    pnlData: TUniPanel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    edActive: TUniDBCheckBox;
    edKaynak: TUniDBLookupComboBox;
    pnlButtons: TUniPanel;
    btnCancel: TUniBitBtn;
    btnPost: TUniBitBtn;
    dsCheckList: TUniDataSource;
    qTmp: TUniQuery;
    edTarih: TUniDBDateTimePicker;
    qCheckList: TUniQuery;
    UniLabel9: TUniLabel;
    edKontrol: TUniDBLookupComboBox;
    PgControl: TUniPageControl;
    pgTedbir: TUniTabSheet;
    pgDiger: TUniTabSheet;
    grdDocs: TUniDBGrid;
    btnDocsAdd: TUniBitBtn;
    btnDocsDel: TUniBitBtn;
    UniLabel8: TUniLabel;
    UniDBMemo1: TUniDBMemo;
    UniLabel10: TUniLabel;
    UniDBMemo2: TUniDBMemo;
    UniLabel11: TUniLabel;
    UniDBMemo3: TUniDBMemo;
    UniLabel12: TUniLabel;
    UniDBMemo4: TUniDBMemo;
    UniLabel13: TUniLabel;
    UniDBMemo5: TUniDBMemo;
    qKaynak: TUniQuery;
    dsKaynak: TUniDataSource;
    dsKontrol: TUniDataSource;
    qKontrol: TUniQuery;
    tblDepts: TVirtualTable;
    dsDepts: TUniDataSource;
    tblEkipman: TVirtualTable;
    dsEkipman: TUniDataSource;
    tblDocs: TVirtualTable;
    dsDocs: TUniDataSource;
    UniLabel4: TUniLabel;
    lbIDY: TUniLabel;
    UniLabel5: TUniLabel;
    lbIDT: TUniLabel;
    UniLabel6: TUniLabel;
    lbSDY: TUniLabel;
    UniLabel7: TUniLabel;
    lbSDT: TUniLabel;
    pgBaglantý: TUniTabSheet;
    grdEkip: TUniDBGrid;
    btnEkipAdd: TUniBitBtn;
    btnEkipDel: TUniBitBtn;
    grdDepts: TUniDBGrid;
    btnDeptsAdd: TUniBitBtn;
    btnDeptsDel: TUniBitBtn;
    grdTedbir: TUniDBGrid;
    btnTedbirAdd: TUniBitBtn;
    btnTedbirDel: TUniBitBtn;
    pgHukuk: TUniTabSheet;
    grdDayanak: TUniDBGrid;
    btnDayanakAdd: TUniBitBtn;
    btnDayanakDel: TUniBitBtn;
    UniLabel14: TUniLabel;
    UniDBMemo6: TUniDBMemo;
    UniLabel15: TUniLabel;
    UniDBMemo7: TUniDBMemo;
    UniLabel16: TUniLabel;
    UniDBMemo8: TUniDBMemo;
    tblDayanak: TVirtualTable;
    dsDayanak: TUniDataSource;
    tblTedbir: TVirtualTable;
    dsTedbir: TUniDataSource;
    pgOnlemler: TUniTabSheet;
    UniLabel37: TUniLabel;
    edOnem: TUniDBLookupComboBox;
    UniLabel34: TUniLabel;
    UniDBMemo16: TUniDBMemo;
    UniLabel35: TUniLabel;
    UniDBMemo17: TUniDBMemo;
    UniLabel36: TUniLabel;
    UniDBMemo18: TUniDBMemo;
    qOnem: TUniQuery;
    dsOnem: TUniDataSource;
    btnDayanakNew: TUniBitBtn;
    btnTedbirNew: TUniBitBtn;
    btnDocsNew: TUniBitBtn;
    btnEkipNew: TUniBitBtn;
    btnDeptsNew: TUniBitBtn;
    UniLabel17: TUniLabel;
    edKisi: TUniDBLookupComboBox;
    qKisi: TUniQuery;
    dsKisi: TUniDataSource;
    btnHelp: TUniBitBtn;
    lbKilitliSDY: TUniLabel;
    lbKilitliSDT: TUniLabel;
    UniLabel21: TUniLabel;
    UniLabel22: TUniLabel;
    btnKilitle: TUniBitBtn;
    UniLabel18: TUniLabel;
    chbKilit: TUniDBCheckBox;
    UniPanel2: TUniPanel;
    UniPanel3: TUniPanel;
    UniPanel4: TUniPanel;
    unipanel1: TUniPanel;
    UniPanel5: TUniPanel;
    vqchecklist: TVirtualTable;
    lbAktifDurum: TUniLabel;
    lbKilitDurum: TUniLabel;
    pnlhkkdayanak: TUniPanel;
    rgHKKdayanak: TUniRadioGroup;
    pnltedbir: TUniPanel;
    rgtedbir: TUniRadioGroup;
    pnlDoc: TUniPanel;
    rgdoc: TUniRadioGroup;
    pnlekipman: TUniPanel;
    rgekipman: TUniRadioGroup;
    pnldep: TUniPanel;
    rgdept: TUniRadioGroup;
    pnlMsg: TUniPanel;
    UniLabel19: TUniLabel;
    UniLabel58: TUniLabel;
    UniPanel6: TUniPanel;
    UniPanel7: TUniPanel;
    UniPanel8: TUniPanel;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnTedbirAddClick(Sender: TObject);
    procedure btnTedbirDelClick(Sender: TObject);
    procedure btnTedbirNewClick(Sender: TObject);
    procedure btnDayanakAddClick(Sender: TObject);
    procedure btnDayanakDelClick(Sender: TObject);
    procedure btnDayanakNewClick(Sender: TObject);
    procedure btnDocsAddClick(Sender: TObject);
    procedure btnDocsDelClick(Sender: TObject);
    procedure btnDocsNewClick(Sender: TObject);
    procedure btnEkipAddClick(Sender: TObject);
    procedure btnEkipDelClick(Sender: TObject);
    procedure btnEkipNewClick(Sender: TObject);
    procedure btnDeptsAddClick(Sender: TObject);
    procedure btnDeptsDelClick(Sender: TObject);
    procedure btnDeptsNewClick(Sender: TObject);
    procedure edKaynakChange(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure btnKilitleClick(Sender: TObject);
    procedure dsCheckListStateChange(Sender: TObject);
    procedure dsKontrolStateChange(Sender: TObject);
    procedure dsCheckListDataChange(Sender: TObject; Field: TField);
    procedure qCheckListBeforePost(DataSet: TDataSet);
  private
    YardimKw : string;
    MultiChange : boolean;
    Kontids : string;
    procedure PrepareTables;
    procedure CloseTables;
    procedure SetControls;

    function CheckID(AID: Integer; ATable: TVirtualTable): Boolean;
    function ListToStr(ATable: TVirtualTable): String;
    procedure StrToListTedbir;
    procedure StrToListDayanak;
    procedure StrToListDept;
    procedure StrToListDokuman;
    procedure StrToListEkipman;
    procedure DelTedbirControl(Sender: TComponent; Res: Integer);
    procedure DelDayanakControl(Sender: TComponent; Res: Integer);
    procedure DelDeptControl(Sender: TComponent; Res: Integer);
    procedure DelDocsControl(Sender: TComponent; Res: Integer);
    procedure DelEkipControl(Sender: TComponent; Res: Integer);
    procedure PostMultiChange;
    function ListeyiGuncelle(const kaynakListe, hedefListe: string;
      Ekle: Boolean): string;
  public
    ChclistCopy : boolean;
    function Exec(AID, AOp: Integer): Integer;overload;
    function Exec(AIds:string):integer;overload;
    function copy(AId: string): integer;
  end;

function frmCheckListTanim: TfrmCheckListTanim;

implementation

uses uniGUIApplication, MainModule, McMLib, unCheckListListe, unDepartmanSec, unDepartmanTanim,
  unKVKKVeriDokumanSec, unKVKKEkipmanTanim, unKVKKEkipmanSec, unKVKKDayanakTanim, unKVKKDayanakSec,
  unKVKKTedbirTanim, unKVKKTedbirSec, unHelpPage, uAydinlatmaSablonOlusturma;

{$R *.dfm}

function frmCheckListTanim: TfrmCheckListTanim;
begin
  Result := TfrmCheckListTanim(MainMod.GetFormInstance(TfrmCheckListTanim));
end;

procedure TfrmCheckListTanim.btnCancelClick(Sender: TObject);
begin
  if qCheckList.State in [dsEdit, dsInsert] then
  begin
    qCheckList.Cancel;
    ModalResult := mrCancel;
  end
  else
    ModalResult := mrOk;
end;

procedure TfrmCheckListTanim.btnDayanakAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID   : Integer;
  AName : String;
  IDList : String;
begin
  IDList := MainMod.MakeIDList(tblDayanak);
  frmKVKKDayanakSec.GizliKriter := 'id NOT IN (' + IDList + ') AND tipi = ''HUKUKSAL'' ';
  ACount := frmKVKKDayanakSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKDayanakSec.qDayanak.GotoBookmark(frmKVKKDayanakSec.grdList.SelectedRows[i]);
    AID   := frmKVKKDayanakSec.qDayanak.FieldByName('id').AsInteger;
    AName := frmKVKKDayanakSec.qDayanak.FieldByName('dayanak').AsString;

    if not CheckID(AID, tblDayanak) then
    begin
      tblDayanak.Insert;
      tblDayanak.FieldByName('id').AsInteger  := AID;
      tblDayanak.FieldByName('name').AsString := AName;
      tblDayanak.Post;
    end;
  end;
end;

procedure TfrmCheckListTanim.btnDayanakDelClick(Sender: TObject);
var
  Msg : String;
begin
  if tblDayanak.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Listeden "' + tblDayanak.FieldByName('name').AsString + '" hukuksal dayanaðýný çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelDayanakControl);
end;

procedure TfrmCheckListTanim.btnDayanakNewClick(Sender: TObject);
begin
  frmKVKKDayanakTanim.Exec(0, 0);
end;

procedure TfrmCheckListTanim.btnDeptsAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID   : Integer;
  AName : String;
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

procedure TfrmCheckListTanim.btnDeptsDelClick(Sender: TObject);
var
  Msg : String;
begin
  if tblDepts.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Listeden "' + tblDepts.FieldByName('name').AsString + '" departmanýný çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelDeptControl);
end;

procedure TfrmCheckListTanim.btnDeptsNewClick(Sender: TObject);
begin
  frmDepartmanTanim.Insert;
end;

procedure TfrmCheckListTanim.btnDocsAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID    : Integer;
  AName  : String;
  IDList : String;
begin
  IDList := MainMod.MakeIDList(tblDocs);
  frmKVKKVeriDokumanSec.GizliKriter := 'doc.id NOT IN (' + IDList + ')';
  ACount := frmKVKKVeriDokumanSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKVeriDokumanSec.qDocs.GotoBookmark(frmKVKKVeriDokumanSec.grdList.SelectedRows[i]);
    AID   := frmKVKKVeriDokumanSec.qDocs.FieldByName('id').AsInteger;
    AName := frmKVKKVeriDokumanSec.qDocs.FieldByName('dokuman').AsString;

    if not CheckID(AID, tblDocs) then
    begin
      tblDocs.Insert;
      tblDocs.FieldByName('id').AsInteger  := AID;
      tblDocs.FieldByName('name').AsString := AName;
      tblDocs.Post;
    end;
  end;
end;

procedure TfrmCheckListTanim.btnDocsDelClick(Sender: TObject);
var
  Msg : String;
begin
  if tblDocs.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Listeden "' + tblDocs.FieldByName('name').AsString + '" dokümanýný çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelDocsControl);
end;

procedure TfrmCheckListTanim.btnDocsNewClick(Sender: TObject);
begin
// to do : Þimdilik beklemede... Doküman Tipi var ekstra alan
end;

procedure TfrmCheckListTanim.btnEkipAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID    : Integer;
  AName  : String;
  IDList : String;
begin
  IDList := MainMod.MakeIDList(tblEkipman);
  frmKVKKEkipmanSec.GizliKriter := 'id NOT IN (' + IDList + ')';
  ACount := frmKVKKEkipmanSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKEkipmanSec.qEkipman.GotoBookmark(frmKVKKEkipmanSec.grdList.SelectedRows[i]);
    AID   := frmKVKKEkipmanSec.qEkipman.FieldByName('id').AsInteger;
    AName := frmKVKKEkipmanSec.qEkipman.FieldByName('ekipman').AsString;

    if not CheckID(AID, tblEkipman) then
    begin
      tblEkipman.Insert;
      tblEkipman.FieldByName('id').AsInteger  := AID;
      tblEkipman.FieldByName('name').AsString := AName;
      tblEkipman.Post;
    end;
  end;
end;

procedure TfrmCheckListTanim.btnEkipDelClick(Sender: TObject);
var
  Msg : String;
begin
  if tblEkipman.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Listeden "' + tblEkipman.FieldByName('name').AsString + '" ekipmanýný çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelEkipControl);
end;

procedure TfrmCheckListTanim.btnEkipNewClick(Sender: TObject);
begin
  frmKVKKEkipmanTanim.Insert;
end;

procedure TfrmCheckListTanim.btnKilitleClick(Sender: TObject);
begin
  if (MainMod.LoginInfo.Rol <> 'SÝSTEM YÖNETÝCÝSÝ') then
  begin
    MessageDlg('Kontrol formu kilidi açma yetkiniz yoktur!', mtError, [mbOK]);
    Exit;
  end;

  if not (qCheckList.State in [dsEdit, dsInsert]) then qCheckList.Edit;

  if btnKilitle.Caption = 'Kilitle' then
  begin
    qCheckList.FieldByName('kilitli').AsString := 'E';
    btnKilitle.Caption := 'Kilidi Aç';
  end
  else
  begin
    qCheckList.FieldByName('kilitli').AsString := 'H';
    btnKilitle.Caption := 'Kilitle';
  end;

  qCheckList.FieldByName('kilitli_sdy').AsInteger  := MainMod.LoginInfo.ID;
  qCheckList.FieldByName('kilitli_sdt').AsDateTime := Now;

  if btnPost.Enabled = False then
    btnPost.Enabled := True;
  btnPost.Click;
end;
procedure TfrmCheckListTanim.PostMultiChange;
var
  i: integer;
begin
  if NOT (vqCheckList.State in [dsEdit,dsInsert]) then
    vqCheckList.Edit;

  vqCheckList.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  vqCheckList.FieldByName('sdt').AsDateTime     := Now;


  if  not vqchecklist.FieldByName('kilitli').IsNull then
  begin
    vqCheckList.FieldByName('kilitli_sdy').AsInteger  := MainMod.LoginInfo.ID;
    vqCheckList.FieldByName('kilitli_sdt').AsDateTime := Now;
  end;
  vqCheckList.Post;
  QueryOpen(qCheckList, 'SELECT * FROM data_checklist WHERE id in (' + Kontids+ ' )');
  qCheckList.First;
  while NOT qCheckList.Eof do
  begin
   if not (qCheckList.State in [dsInsert,dsEdit]) then
   qCheckList.Edit;
     for I := 1 to qCheckList.Fields.Count -1 do
       if not vqCheckList.Fields[I].IsNull then
        begin
          qCheckList.Fields[I].Value :=  vqCheckList.Fields[I].Value ;
        end;
   qCheckList.FieldByName('sdy').AsInteger := mainmod.LoginInfo.ID;
   qCheckList.FieldByName('sdt').AsDateTime := now;

   if tblTedbir.RecordCount>0 then
      case rgtedbir.ItemIndex of
        0: qCheckList.FieldByName('tedbir_ids').AsString := ListeyiGuncelle(qCheckList.FieldByName('tedbir_ids').AsString, ListToStr(tblTedbir),true);
        1: qCheckList.FieldByName('tedbir_ids').AsString := ListeyiGuncelle(qCheckList.FieldByName('tedbir_ids').AsString, ListToStr(tblTedbir),false);
        2: qCheckList.FieldByName('tedbir_ids').AsString := ListToStr(tblTedbir);
      end;
    if tblDayanak.RecordCount>0 then
      case rgHKKdayanak.ItemIndex of
        0: qCheckList.FieldByName('dayanak_ids').AsString := ListeyiGuncelle(qCheckList.FieldByName('dayanak_ids').AsString, ListToStr(tblDayanak),true);
        1: qCheckList.FieldByName('dayanak_ids').AsString := ListeyiGuncelle(qCheckList.FieldByName('dayanak_ids').AsString, ListToStr(tblDayanak),false);
        2: qCheckList.FieldByName('dayanak_ids').AsString := ListToStr(tblDayanak);
      end;
    if tblDocs.RecordCount>0 then
      case rgdoc.ItemIndex of
        0: qCheckList.FieldByName('dokuman_ids').AsString := ListeyiGuncelle(qCheckList.FieldByName('dokuman_ids').AsString, ListToStr(tblDocs),true);
        1: qCheckList.FieldByName('dokuman_ids').AsString := ListeyiGuncelle(qCheckList.FieldByName('dokuman_ids').AsString, ListToStr(tblDocs),false);
        2: qCheckList.FieldByName('dokuman_ids').AsString := ListToStr(tblDocs);
      end;
    if tblEkipman.RecordCount>0 then
      case rgekipman.ItemIndex of
        0: qCheckList.FieldByName('ekipman_ids').AsString := ListeyiGuncelle(qCheckList.FieldByName('ekipman_ids').AsString, ListToStr(tblEkipman),true);
        1: qCheckList.FieldByName('ekipman_ids').AsString := ListeyiGuncelle(qCheckList.FieldByName('ekipman_ids').AsString, ListToStr(tblEkipman),false);
        2: qCheckList.FieldByName('ekipman_ids').AsString := ListToStr(tblEkipman);
      end;
    if tblDepts.RecordCount>0 then
      case rgdept.ItemIndex of
        0: qCheckList.FieldByName('sorumlu_ids').AsString := ListeyiGuncelle(qCheckList.FieldByName('sorumlu_ids').AsString, ListToStr(tblDepts),true);
        1: qCheckList.FieldByName('sorumlu_ids').AsString := ListeyiGuncelle(qCheckList.FieldByName('sorumlu_ids').AsString, ListToStr(tblDepts),false);
        2: qCheckList.FieldByName('sorumlu_ids').AsString := ListToStr(tblDepts);
      end;

    qCheckList.Post;
    QueryOpen(mainmod.qTmp,'select COUNT(*) as totalRecord '+
            ' from def_data_aydinlatma where durum in (''ÝNCELEMEDE'',''YAYINDA'') and '+
            ' mc_id=' + inttostr(mainmod.MCID) +
            ' and kisi_id=' + qCheckList.FieldByName('kisi_id').AsString ) ;
    if not mainmod.qTmp.IsEmpty then
    if StrToIntdef( mainmod.qTmp.FieldByName('totalRecord').AsString,0)=1 then
      frmAydinlatmaSablonOlusturma.AydinlatmaSablonOlustur(qCheckList.FieldByName('kisi_id').AsInteger );

    qCheckList.Next;
  end;

  SetControls;
  ModalResult := mrOk;
end;

function TfrmCheckListTanim.ListeyiGuncelle(const kaynakListe: string; const hedefListe: string; Ekle: Boolean): string;
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


procedure TfrmCheckListTanim.btnPostClick(Sender: TObject);
var
 AQcheckList : TUniQuery;
 I : integer;
begin

 if not MultiChange then
 begin
    if edKaynak.Text = '' then
    begin
      MessageDlg('Veri Kaynaðý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
      edKaynak.SetFocus;
      Exit;
    end;
    if edKisi.Text = '' then
    begin
      MessageDlg('Veri Konusu Kiþi belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
      edKisi.SetFocus;
      Exit;
    end;
 end;


if MultiChange then
begin
  PostMultiChange;
  exit;
end;
  if qCheckList.FieldByName('active').AsString = '' then
  begin
    MessageDlg('Form Durumu belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edActive.SetFocus;
    Exit;
  end;
  if qCheckList.FieldByName('tarih').AsString = '' then
  begin
    MessageDlg('Form Tarihi belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edTarih.SetFocus;
    Exit;
  end;
// Doðan AKÇAY  1123 Bildirim_no ya istinaden zorunluluk kaldýrýldý.
//  if qCheckList.FieldByName('kontrol_id').AsInteger < 1 then
//  begin
//    MessageDlg('Formun Kontrol Durumu belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
//    edKontrol.SetFocus;
//    Exit;
//  end;
  if (qCheckList.FieldByName('kaynak_id').AsInteger < 1 ) or (qCheckList.FieldByName('kaynak_id').IsNull) then
  begin
    MessageDlg('Veri Kaynaðý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edKaynak.SetFocus;
    Exit;
  end;
  if (qCheckList.FieldByName('kisi_id').AsInteger < 1) or (qCheckList.FieldByName('kisi_id').IsNull) then
  begin
    MessageDlg('Veri Konusu Kiþi belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edKisi.SetFocus;
    Exit;
  end;

  if (qCheckList.State = dsInsert) or (ChclistCopy) then
  begin
    QueryOpen(qTmp, 'SELECT COUNT(id) FROM data_checklist WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) +
                    ' AND kaynak_id = ' + qCheckList.FieldByName('kaynak_id').AsString +
                    ' AND kisi_id = ' + qCheckList.FieldByName('kisi_id').AsString);
    if qTmp.Fields[0].AsInteger > 0 then
    begin
      MessageDlg('Seçmiþ olduðunuz "Veri Kaynaðý-Veri Sorumlusu Kiþi" bilgileri için mevcut bir kontrol kaydý var. ' +
                 'Her veri ikilisi için sadece 1 tane kontrol kaydý oluþturabilirsiniz. Lütfen verilerinizi kontrol ediniz.', mtError, [mbOk]);
      Exit;
    end;
  end;

  qCheckList.FieldByName('tedbir_ids').AsString  := ListToStr(tblTedbir);
  qCheckList.FieldByName('dayanak_ids').AsString := ListToStr(tblDayanak);
  qCheckList.FieldByName('dokuman_ids').AsString := ListToStr(tblDocs);
  qCheckList.FieldByName('ekipman_ids').AsString := ListToStr(tblEkipman);
  qCheckList.FieldByName('sorumlu_ids').AsString := ListToStr(tblDepts);

  if qCheckList.State in [dsInsert] then  // coðaltmada zaten edit olarak geliyor
  begin
    qCheckList.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_data_checklist_id');
    qCheckList.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    qCheckList.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    qCheckList.FieldByName('idt').AsDateTime   := Now;
  end;
  qCheckList.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  qCheckList.FieldByName('sdt').AsDateTime     := Now;
  if not ChclistCopy then
  begin
    qCheckList.Post;

    QueryOpen(mainmod.qTmp,'select COUNT(*) as totalRecord '+
      ' from def_data_aydinlatma where durum in (''YAYINDA'') and '+
      ' mc_id=' + inttostr(mainmod.MCID) +
      ' and kisi_id=' + qCheckList.FieldByName('kisi_id').AsString ) ;

    if not mainmod.qTmp.IsEmpty then
      if StrToIntdef( mainmod.qTmp.FieldByName('totalRecord').AsString,0)=1 then
         if MessageDlg('Aydýnlatma / Açýk Rýza raporu oluþturulsun mu ?',mtConfirmation,mbYesNo) = mryes then
            frmAydinlatmaSablonOlusturma.AydinlatmaSablonOlustur(qCheckList.FieldByName('kisi_id').AsInteger );

  end;

  if ChclistCopy then
  begin

    AQcheckList := TUniQuery.Create(nil);
    try
      AQcheckList.Connection := mainmod.DBMain;
      AQcheckList.CachedUpdates := true;
      QueryOpen(AQcheckList,'Select * from data_checklist where id = 0 ') ;
      AQcheckList.Append;
        for I := 0 to qCheckList.Fields.Count -1 do
        begin
          if qCheckList.Fields[i].FieldName= 'id' then
            AQcheckList.Fields[i].Value := MainMod.GetSeq('sq_data_checklist_id')
          else if qCheckList.Fields[i].FieldName= 'idy' then
            AQcheckList.Fields[i].Value := mainmod.LoginInfo.ID
          else if qCheckList.Fields[i].FieldName= 'sdy' then
            AQcheckList.Fields[i].Value := mainmod.LoginInfo.ID
          else if qCheckList.Fields[i].FieldName= 'sdt' then
             AQcheckList.Fields[i].Value := now
          else if qCheckList.Fields[i].FieldName = 'idt' then
             AQcheckList.Fields[i].Value := now
          else
            AQcheckList.Fields[i].Value := qCheckList.Fields[i].Value;
        end;
          AQcheckList.Post;

         try
          MainMod.DBMain.StartTransaction;
          qCheckList.CancelUpdates;
          AQcheckList.CommitUpdates;
          MainMod.DBMain.Commit;
        except
          qCheckList.CancelUpdates;
          AQcheckList.CancelUpdates;
          MainMod.DBMain.Rollback;
        end;



    finally
      if Assigned(AQcheckList) then
        FreeAndNil(AQcheckList);
    end;

  end;

  SetControls;
  ModalResult := mrOk;
end;

procedure TfrmCheckListTanim.btnTedbirAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID   : Integer;
  AName : String;
  IDList : String;
begin
  IDList := MainMod.MakeIDList(tblTedbir);
  frmKVKKTedbirSec.GizliKriter := 'id NOT IN (' + IDList + ')';
  ACount := frmKVKKTedbirSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKTedbirSec.qTanim.GotoBookmark(frmKVKKTedbirSec.grdList.SelectedRows[i]);
    AID   := frmKVKKTedbirSec.qTanim.FieldByName('id').AsInteger;
    AName := frmKVKKTedbirSec.qTanim.FieldByName('tedbir').AsString;

    if not CheckID(AID, tblTedbir) then
    begin
      tblTedbir.Insert;
      tblTedbir.FieldByName('id').AsInteger  := AID;
      tblTedbir.FieldByName('name').AsString := AName;
      tblTedbir.Post;
    end;
  end;
end;

procedure TfrmCheckListTanim.btnTedbirDelClick(Sender: TObject);
var
  Msg : String;
begin
  if tblTedbir.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Listeden "' + tblTedbir.FieldByName('name').AsString + '" tedbirini çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelTedbirControl);
end;

procedure TfrmCheckListTanim.btnTedbirNewClick(Sender: TObject);
begin
  frmKVKKTedbirTanim.Exec(0, 0);
end;

function TfrmCheckListTanim.CheckID(AID: Integer; ATable: TVirtualTable): Boolean;
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

procedure TfrmCheckListTanim.CloseTables;
begin
  qKaynak.Close;
  qKisi.Close;
  qKontrol.Close;
  qOnem.Close;

  tblDepts.Close;
  tblDocs.Close;
  tblEkipman.Close;
end;



procedure TfrmCheckListTanim.DelDayanakControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  tblDayanak.Delete;
end;

procedure TfrmCheckListTanim.DelDeptControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  tblDepts.Delete;
end;

procedure TfrmCheckListTanim.DelDocsControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  tblDocs.Delete;
end;

procedure TfrmCheckListTanim.DelEkipControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  tblEkipman.Delete;
end;

procedure TfrmCheckListTanim.DelTedbirControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  tblTedbir.Delete;
end;

procedure TfrmCheckListTanim.dsCheckListDataChange(Sender: TObject;
  Field: TField);
begin

  if dsCheckList.DataSet.FieldByName('active').isnull then
    lbAktifDurum.Caption := 'Seçim Yapýlmamýþ'
  else if   dsCheckList.DataSet.FieldByName('active').AsString ='H' then
    lbAktifDurum.Caption := 'Hayýr'
  else if   dsCheckList.DataSet.FieldByName('active').AsString ='E' then
    lbAktifDurum.Caption := 'Evet' ;

  if dsCheckList.DataSet.FieldByName('kilitli').IsNull then
    lbKilitDurum.Caption := 'Seçim Yapýlmamýþ'
  else if   dsCheckList.DataSet.FieldByName('kilitli').AsString ='H' then
    lbKilitDurum.Caption := 'Hayýr'
  else if   dsCheckList.DataSet.FieldByName('kilitli').AsString ='E' then
    lbKilitDurum.Caption := 'Evet' ;
 {
  if (MultiChange) and (dsCheckList.DataSet = vqchecklist) then
  begin
  if not vqchecklist.FieldByName('kilitli').IsNull then
    if (MainMod.LoginInfo.Rol <> 'SÝSTEM YÖNETÝCÝSÝ') then
    begin
      showmessagen('Kontrol formu kilidi açma yetkiniz yoktur!');
      if not (vqchecklist.State in [dsEdit,dsInsert]) then
         vqchecklist.Edit;
      vqchecklist.FieldByName('kilitli').Clear;

    end;
  end;

  if (not MultiChange) and (dsCheckList.DataSet = qchecklist) then
  begin
    if qchecklist.FieldByName('kilitli').NewValue <> qchecklist.FieldByName('kilitli').OldValue then

    if (MainMod.LoginInfo.Rol <> 'SÝSTEM YÖNETÝCÝSÝ') then
    begin
      showmessagen('Kontrol formu kilidi açma yetkiniz yoktur!');
      if not (qchecklist.State in [dsEdit,dsInsert]) then
         qchecklist.Edit;
      qchecklist.FieldByName('kilitli').Value :=  qchecklist.FieldByName('kilitli').OldValue;

    end;
  end; }

end;

procedure TfrmCheckListTanim.dsCheckListStateChange(Sender: TObject);
begin
  SetControls;
end;

procedure TfrmCheckListTanim.dsKontrolStateChange(Sender: TObject);
begin
  SetControls;
end;

procedure TfrmCheckListTanim.edKaynakChange(Sender: TObject);
begin
  if qCheckList.FieldByName('kaynak_id').AsString <> '' then
    QueryOpen(qKisi, 'SELECT DISTINCT env.kisi_id, ks.kisi ' +
                     'FROM data_envanter env ' +
                     '  LEFT JOIN def_data_kisi ks ON ks.id = env.kisi_id ' +
                     'WHERE env.active = ''E'' AND env.mc_id = ' + IntToStr(MainMod.MCID) +
                     ' AND env.kaynak_id = ' + qCheckList.FieldByName('kaynak_id').AsString +
                     ' ORDER BY 2');
end;


function TfrmCheckListTanim.Exec(AIds:string):integer;
begin
 Kontids := AIds;
 MultiChange := true;
  ChclistCopy := false;

   QueryOpen(qCheckList, 'SELECT * FROM data_checklist WHERE id = 0');

   CopyFieldsFromQueryToVirtualTable(qCheckList,vqchecklist);
   vqchecklist.Open;
   vqchecklist.Insert;
   vqchecklist.FieldByName('id').AsInteger := 0;
   dsCheckList.DataSet := vqchecklist;

   PrepareTables;
   SetControls;
   Result := ShowModal;

end;

function TfrmCheckListTanim.Exec(AID, AOp: Integer): Integer;
begin
  MultiChange := false;
  ChclistCopy := false;
  if AOp = 0 then // Insert
  begin
    QueryOpen(qCheckList, 'SELECT * FROM data_checklist WHERE id = 0');
    qCheckList.Insert;
    qCheckList.FieldByName('active').AsString     := 'E';
    qCheckList.FieldByName('kaynak_id').AsInteger := 0;
    qCheckList.FieldByName('kisi_id').AsInteger   := 0;
    qCheckList.FieldByName('kilitli').AsString    := 'H';
    btnKilitle.Caption := 'Kilitle';
    YardimKw := 'CheckListYeniKayit';
  end
  else // Edit
  begin
    QueryOpen(qCheckList, 'SELECT * FROM data_checklist WHERE id = ' + IntToStr(AID));
//    if (qCheckList.FieldByName('kilitli').AsString = 'E') then // and (mainMod.LoginInfo.Rol <> 'SÝSTEM YÖNETÝCÝSÝ') açýk gelmesin yetkiliyse kilidi açýp girsin
//    begin
//      MessageDlg('Kontrol formu kilitli olduðu için deðiþiklik yapamazsýnýz.', mtInformation, [mbOK]);
//    end
//    else
//    begin
      qCheckList.Edit;
//    end;
    if qCheckList.FieldByName('kilitli').AsString = '' then
      qCheckList.FieldByName('kilitli').AsString := 'H';
    if qCheckList.FieldByName('kilitli').AsString = 'E' then
      btnKilitle.Caption := 'Kilidi Aç'
    else
      btnKilitle.Caption := 'Kilitle';
    YardimKw := 'CheckListDegistirme';
  end;
  PrepareTables;

  ActiveControl := edTarih;
  SetControls;
  Result := ShowModal;
  CloseTables;

end;

function TfrmCheckListTanim.copy(AId: string): integer;
begin
  ChclistCopy := true;
  qCheckList.CachedUpdates := true;

   QueryOpen(qCheckList, 'SELECT * FROM data_checklist WHERE id = ' + AID);
//    if (qCheckList.FieldByName('kilitli').AsString = 'E') then // and (mainMod.LoginInfo.Rol <> 'SÝSTEM YÖNETÝCÝSÝ') açýk gelmesin yetkiliyse kilidi açýp girsin
//    begin
//      MessageDlg('Kontrol formu kilitli olduðu için deðiþiklik yapamazsýnýz.', mtInformation, [mbOK]);
//    end
//    else
//    begin
      qCheckList.Edit;
//    end;
    if qCheckList.FieldByName('kilitli').AsString = '' then
      qCheckList.FieldByName('kilitli').AsString := 'H';
    if qCheckList.FieldByName('kilitli').AsString = 'E' then
      btnKilitle.Caption := 'Kilidi Aç'
    else
      btnKilitle.Caption := 'Kilitle';
    YardimKw := 'CheckListDegistirme';

  PrepareTables;

  ActiveControl := edTarih;
  SetControls;
  qCheckList.FieldByName('tarih').AsDateTime := now;
  Result := ShowModal;
  CloseTables;

end;

function TfrmCheckListTanim.ListToStr(ATable: TVirtualTable): String;
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

procedure TfrmCheckListTanim.PrepareTables;
begin
 if not MultiChange then
  begin
  QueryOpen(qKaynak, 'SELECT DISTINCT env.kaynak_id, kyn.kaynak ' +
                     'FROM data_envanter env ' +
                     '  LEFT JOIN def_data_kaynak kyn ON kyn.id = env.kaynak_id ' +
                     'WHERE env.active = ''E'' AND env.mc_id = ' +
                     IntToStr(MainMod.MCID) + ' ORDER BY 2');
  QueryOpen(qKisi, 'SELECT DISTINCT env.kisi_id, ks.kisi ' +
                     'FROM data_envanter env ' +
                     '  LEFT JOIN def_data_kisi ks ON ks.id = env.kisi_id ' +
                     'WHERE env.active = ''E'' AND env.mc_id = ' + IntToStr(MainMod.MCID) +
                     ' AND env.kaynak_id = ' +  IfThen(not qCheckList.FieldByName('kaynak_id').IsNull, qCheckList.FieldByName('kaynak_id').AsString,'0')+
                     ' ORDER BY 2');
  end;

  QueryOpen(qKontrol, 'SELECT id, kontrolsonuc FROM def_data_kontrolsonuc WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY kontrolsonuc');
  QueryOpen(qOnem, 'SELECT id, onemderece FROM def_data_onemderece WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY id');

  tblTedbir.Open;
  tblDayanak.Open;
  tblDepts.Open;
  tblDocs.Open;
  tblEkipman.Open;
  if not MultiChange then
  begin
    StrToListTedbir;
    StrToListDayanak;
    StrToListDept;
    StrToListDokuman;
    StrToListEkipman;
  end;
end;

procedure TfrmCheckListTanim.qCheckListBeforePost(DataSet: TDataSet);
begin
 if qCheckList.FieldByName('active').OldValue <> qCheckList.FieldByName('active').NewValue then
  if qCheckList.FieldByName('active').NewValue <> 'E' then
    exit;



 QueryOpen(mainmod.qTmp,' select * from data_checklist  where ' +
     ifthen(not MultiChange,' id <> '+qCheckList.FieldByName('id').AsString +' and ') +
      ' mc_id ='+ inttostr(mainmod.MCID) +
      ' and kaynak_id =' + VarToStr(qCheckList.FieldByName('kaynak_id').NewValue ) +
      ' and kisi_id =' + VarToStr(qCheckList.FieldByName('kisi_id').NewValue ) );
 if qCheckList.FieldByName('kisi_id').OldValue <> qCheckList.FieldByName('kisi_id').NewValue then
  if mainmod.qTmp.RecordCount > 0 then
   begin
     ShowMessageN('Ayný departman, kaynak, sureç ve kiþiye ait  kayýt var. '+ #13#10+ ' iþleminiz iptal ediliyor ') ;
     abort;
   end;
end;

procedure TfrmCheckListTanim.SetControls;
begin
  pnlMsg.Visible := ChclistCopy ;
 if not  MultiChange then
 begin
      btnPost.Enabled := qCheckList.State in [dsEdit, dsInsert];
      btnKilitle.Visible := (MainMod.LoginInfo.Rol = 'SÝSTEM YÖNETÝCÝSÝ');
      if qCheckList.State in [dsEdit, dsInsert] then
        btnCancel.caption := 'Ýptal'
      else
        btnCancel.caption := 'Kapat';

      btnDayanakAdd.Enabled := qCheckList.State in [dsEdit, dsInsert];
      btnDayanakDel.Enabled := qCheckList.State in [dsEdit, dsInsert];
      btnDayanakNew.Enabled := qCheckList.State in [dsEdit, dsInsert];
      btnTedbirAdd.Enabled := qCheckList.State in [dsEdit, dsInsert];
      btnTedbirDel.Enabled := qCheckList.State in [dsEdit, dsInsert];
      btnTedbirNew.Enabled := qCheckList.State in [dsEdit, dsInsert];
      btnDocsAdd.Enabled := qCheckList.State in [dsEdit, dsInsert];
      btnDocsDel.Enabled := qCheckList.State in [dsEdit, dsInsert];
      btnDocsNew.Enabled := qCheckList.State in [dsEdit, dsInsert];
      btnDeptsAdd.Enabled := qCheckList.State in [dsEdit, dsInsert];
      btnDeptsDel.Enabled := qCheckList.State in [dsEdit, dsInsert];
      btnDeptsNew.Enabled := qCheckList.State in [dsEdit, dsInsert];
      btnEkipAdd.Enabled := qCheckList.State in [dsEdit, dsInsert];
      btnEkipDel.Enabled := qCheckList.State in [dsEdit, dsInsert];
      btnEkipNew.Enabled := qCheckList.State in [dsEdit, dsInsert];

      edTarih.Enabled := qCheckList.State in [dsEdit, dsInsert];
      edKaynak.Enabled := qCheckList.State in [dsEdit, dsInsert];
      edKisi.Enabled := qCheckList.State in [dsEdit, dsInsert];
      edOnem.Enabled := qCheckList.State in [dsEdit, dsInsert];
      edKontrol.Enabled := qCheckList.State in [dsEdit, dsInsert];
      //Readonly dahi olsa deðiþtirilebiliyor onun için enabled yapýldý

      rgHKKdayanak.Visible := MultiChange;
      rgtedbir.Visible := MultiChange;
      rgdoc.Visible := MultiChange;
      rgekipman.Visible := MultiChange ;
      rgdept.Visible := MultiChange ;

    btnKilitle.Visible := true;
    chbKilit.Visible := false;
    UniLabel18.Visible := false;
//    chbKilit.ReadOnly := true;
   end
   else
   begin
    btnKilitle.visible := false;
    chbKilit.Visible := true;
    UniLabel18.Visible := true;
    if (MainMod.LoginInfo.Rol = 'SÝSTEM YÖNETÝCÝSÝ') and (MultiChange) then
      chbKilit.ReadOnly := false ;
   end;
end;

procedure TfrmCheckListTanim.StrToListDayanak;
begin
  tblDayanak.First;
  while not tblDayanak.EOF do tblDayanak.Delete;
  if qCheckList.FieldByName('dayanak_ids').AsString = '' then Exit;

  QueryOpen(qTmp, 'SELECT id, dayanak FROM def_data_dayanak WHERE id in (' + qCheckList.FieldByName('dayanak_ids').AsString + ') ' +
                  ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' AND tipi = ''HUKUKSAL'' ORDER BY dayanak');

  qTmp.First;
  while not qTmp.EOF do
  begin
    tblDayanak.Append;
    tblDayanak.FieldByName('id').AsInteger   := qTmp.FieldByName('id').AsInteger;
    tblDayanak.FieldByName('name').AsString  := qTmp.FieldByName('dayanak').AsString;
    tblDayanak.Post;

    qTmp.Next;
  end;
end;

procedure TfrmCheckListTanim.StrToListDept;
begin
  tblDepts.First;
  while not tblDepts.EOF do tblDepts.Delete;
  if qCheckList.FieldByName('sorumlu_ids').AsString = '' then Exit;

  QueryOpen(qTmp, ' SELECT dp.id, ' +
                  ' (case when coalesce(dp.main_dept_id,0) > 0 then dp.title||'' (''||dp_main.title||'') '' ' +
                  ' else dp.title end) title ' +
                  ' FROM sys_deptdef dp left join sys_deptdef dp_main on dp_main.id = dp.main_dept_id ' +
                  ' WHERE dp.id in (' + qCheckList.FieldByName('sorumlu_ids').AsString + ') ' +
                  ' AND dp.mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY dp.title');

//  QueryOpen(qTmp, 'SELECT id, title FROM sys_deptdef WHERE id in (' + qCheckList.FieldByName('sorumlu_ids').AsString + ') ' +
//                  ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY title');

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

procedure TfrmCheckListTanim.StrToListDokuman;
begin
  tblDocs.First;
  while not tblDocs.EOF do tblDocs.Delete;
  if qCheckList.FieldByName('dokuman_ids').AsString = '' then Exit;

  QueryOpen(qTmp, 'SELECT id, dokuman FROM def_data_dokuman WHERE id in (' + qCheckList.FieldByName('dokuman_ids').AsString + ') ' +
                  ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY dokuman');

  qTmp.First;
  while not qTmp.EOF do
  begin
    tblDocs.Append;
    tblDocs.FieldByName('id').AsInteger   := qTmp.FieldByName('id').AsInteger;
    tblDocs.FieldByName('name').AsString  := qTmp.FieldByName('dokuman').AsString;
    tblDocs.Post;

    qTmp.Next;
  end;
end;

procedure TfrmCheckListTanim.StrToListEkipman;
begin
  tblEkipman.First;
  while not tblEkipman.EOF do tblEkipman.Delete;
  if qCheckList.FieldByName('ekipman_ids').AsString = '' then Exit;

  QueryOpen(qTmp, 'SELECT id, ekipman FROM def_data_ekipman WHERE id in (' + qCheckList.FieldByName('ekipman_ids').AsString + ') ' +
                  ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY ekipman');

  qTmp.First;
  while not qTmp.EOF do
  begin
    tblEkipman.Append;
    tblEkipman.FieldByName('id').AsInteger   := qTmp.FieldByName('id').AsInteger;
    tblEkipman.FieldByName('name').AsString  := qTmp.FieldByName('ekipman').AsString;
    tblEkipman.Post;

    qTmp.Next;
  end;
end;

procedure TfrmCheckListTanim.StrToListTedbir;
begin
  tblTedbir.First;
  while not tblTedbir.EOF do tblTedbir.Delete;
  if qCheckList.FieldByName('tedbir_ids').AsString = '' then Exit;

  QueryOpen(qTmp, 'SELECT id, tedbir FROM def_data_tedbir WHERE id in (' + qCheckList.FieldByName('tedbir_ids').AsString + ') ' +
                  ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY tedbir');

  qTmp.First;
  while not qTmp.EOF do
  begin
    tblTedbir.Append;
    tblTedbir.FieldByName('id').AsInteger   := qTmp.FieldByName('id').AsInteger;
    tblTedbir.FieldByName('name').AsString  := qTmp.FieldByName('tedbir').AsString;
    tblTedbir.Post;

    qTmp.Next;
  end;
end;

procedure TfrmCheckListTanim.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmCheckListTanim.UniFormBeforeShow(Sender: TObject);
begin
  PgControl.ActivePage := pgHukuk;
  lbIDY.Caption := MainMod.KullaniciGetir(qCheckList.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(qCheckList.FieldByName('sdy').AsString);

  if dsCheckList.State = dsEdit then
  begin
    if lbIDY.Text = '' then lbIDY.Text := 'SÝSTEM';
    if lbSDY.Text = '' then lbSDY.Text := 'SÝSTEM';
  end;


  if qCheckList.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qCheckList.FieldByName('idt').AsDateTime);
  if qCheckList.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qCheckList.FieldByName('sdt').AsDateTime);
  lbKilitliSDY.Caption := MainMod.KullaniciGetir(qCheckList.FieldByName('kilitli_sdy').AsString);
  if qCheckList.FieldByName('kilitli_sdt').AsString = '' then lbKilitliSDT.Caption := ''
   else lbKilitliSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qCheckList.FieldByName('kilitli_sdt').AsDateTime);
end;

end.
