unit UnIhlalOlayiTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniButton, uniBitBtn,
  uniLabel, VirtualTable, Data.DB, DBAccess, Uni, MemDS,McMLib,
  uniDateTimePicker, uniDBDateTimePicker, uniEdit, uniDBEdit, uniMultiItem,
  uniComboBox, uniDBComboBox, uniMemo, uniDBMemo, uniListBox,strutils,math,
  uniBasicGrid, uniDBGrid, VirtualQuery, uniPageControl, uniRadioGroup,
  uniDBRadioGroup, uniScrollBox, uniSpeedButton, uniFileUpload, uniCheckBox,
  uniDBCheckBox;

type
  TfrmIhlalOlayi = class(TUniForm)
    UniPanel1: TUniPanel;
    qdata: TUniQuery;
    dsdata: TUniDataSource;
    vqdata: TVirtualTable;
    pnlButtons: TUniPanel;
    pnllog: TUniPanel;
    UniLabel10: TUniLabel;
    UniLabel11: TUniLabel;
    UniLabel12: TUniLabel;
    UniLabel9: TUniLabel;
    lbIDT: TUniLabel;
    lbIDY: TUniLabel;
    lbSDT: TUniLabel;
    lbSDY: TUniLabel;
    pnlbutton: TUniPanel;
    btnCancel: TUniBitBtn;
    btnHelp: TUniBitBtn;
    btnPost: TUniBitBtn;
    pnlsurec: TUniPanel;
    UniPanel5: TUniPanel;
    UniPanel3: TUniPanel;
    btnSurecAdd: TUniBitBtn;
    btnsurecdelete: TUniBitBtn;
    UniDBGrid2: TUniDBGrid;
    pnlkaynak: TUniPanel;
    UniDBGrid3: TUniDBGrid;
    vqsurec: TVirtualTable;
    dsvqsurec: TUniDataSource;
    qTmp: TUniQuery;
    qtmp2: TUniQuery;
    vqkaynak: TVirtualTable;
    dsvqkaynak: TUniDataSource;
    vtmq: TVirtualQuery;
    vtmq2: TVirtualQuery;
    pgControl: TUniPageControl;
    tsihlalgenel: TUniTabSheet;
    edtarih: TUniLabel;
    edveriisleyen: TUniDBEdit;
    mmAciklama: TUniDBMemo;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    UniDBDateTimePicker3: TUniDBDateTimePicker;
    UniDBMemo1: TUniDBMemo;
    UniDBMemo2: TUniDBMemo;
    UniDBMemo5: TUniDBMemo;
    UniDBNumberEdit1: TUniDBNumberEdit;
    UniDBNumberEdit2: TUniDBNumberEdit;
    UniLabel1: TUniLabel;
    UniLabel13: TUniLabel;
    UniLabel14: TUniLabel;
    UniLabel17: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel29: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel7: TUniLabel;
    UniLabel8: TUniLabel;
    tsetki: TUniTabSheet;
    UniDBMemo3: TUniDBMemo;
    UniDBMemo4: TUniDBMemo;
    UniDBMemo6: TUniDBMemo;
    UniDBMemo7: TUniDBMemo;
    UniLabel15: TUniLabel;
    UniLabel16: TUniLabel;
    UniLabel18: TUniLabel;
    UniLabel19: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel6: TUniLabel;
    tsolasisonuc: TUniTabSheet;
    UniLabel20: TUniLabel;
    dskisiseletki: TUniDataSource;
    grdilgilikisietki: TUniDBGrid;
    vtkisiseletki: TVirtualTable;
    grdverietki: TUniDBGrid;
    vtverietki: TVirtualTable;
    dsverietki: TUniDataSource;
    vtihlalkaynagi: TVirtualTable;
    dsihlalkaynagi: TUniDataSource;
    grdihlalkaynagi: TUniDBGrid;
    vtsibersaldiri: TVirtualTable;
    dssibersaldiri: TUniDataSource;
    grdsibersaldiri: TUniDBGrid;
    rgRiskSeviyekisi: TUniRadioGroup;
    rgRiskSeviyeKurum: TUniRadioGroup;
    UniDBMemo8: TUniDBMemo;
    UniDBMemo9: TUniDBMemo;
    lbaciklama: TUniLabel;
    UniLabel22: TUniLabel;
    UniLabel23: TUniLabel;
    UniLabel24: TUniLabel;
    tsonlem: TUniTabSheet;
    UniLabel25: TUniLabel;
    UniDBMemo10: TUniDBMemo;
    UniDBMemo11: TUniDBMemo;
    UniLabel26: TUniLabel;
    UniDBMemo12: TUniDBMemo;
    UniLabel27: TUniLabel;
    UniLabel28: TUniLabel;
    UniLabel30: TUniLabel;
    UniLabel31: TUniLabel;
    UniDBMemo13: TUniDBMemo;
    UniDBMemo14: TUniDBMemo;
    UniLabel32: TUniLabel;
    UniLabel33: TUniLabel;
    UniLabel34: TUniLabel;
    edkullanici: TUniEdit;
    edkulGorUnvan: TUniDBEdit;
    scroll: TUniScrollBox;
    vqVsBilDosya: TVirtualTable;
    dsVsBilDosya: TUniDataSource;
    UniLabel35: TUniLabel;
    UniDBDateTimePicker4: TUniDBDateTimePicker;
    UniLabel36: TUniLabel;
    edfileName: TUniDBEdit;
    UniSpeedButton1: TUniSpeedButton;
    UniSpeedButton2: TUniSpeedButton;
    FileUp: TUniFileUpload;
    UniLabel37: TUniLabel;
    UniLabel38: TUniLabel;
    edtespitevrak: TUniDBEdit;
    UniSpeedButton3: TUniSpeedButton;
    btbildirimevrak: TUniSpeedButton;
    vqTesbitEvrak: TVirtualTable;
    dsTesbitEvrak: TUniDataSource;
    UniDBCheckBox1: TUniDBCheckBox;
    UniLabel39: TUniLabel;
    scrollOnlem: TUniScrollBox;
    UniLabel40: TUniLabel;
    edpersonelegitim: TUniDBEdit;
    UniSpeedButton5: TUniSpeedButton;
    UniSpeedButton6: TUniSpeedButton;
    vqpersonelEgitim: TVirtualTable;
    dspersonelEgitim: TUniDataSource;
    UniLabel41: TUniLabel;
    edihlalOncesiTedbir: TUniDBEdit;
    UniSpeedButton7: TUniSpeedButton;
    UniSpeedButton8: TUniSpeedButton;
    UniLabel42: TUniLabel;
    edihlalSonrasýTedbir: TUniDBEdit;
    UniSpeedButton9: TUniSpeedButton;
    UniSpeedButton10: TUniSpeedButton;
    vqIhlOncesiTetbir: TVirtualTable;
    dsIhlOncesiTetbir: TUniDataSource;
    vqIhlSonrasiTedbir: TVirtualTable;
    dsIhlSonrasiTedbir: TUniDataSource;
    vqilgilikisi: TVirtualTable;
    dsilgilikisi: TUniDataSource;
    UniDBGrid1: TUniDBGrid;
    pnlilgilikisi: TUniPanel;
    procedure btnPostClick(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnSurecAddClick(Sender: TObject);
    procedure vqsurecAfterScroll(DataSet: TDataSet);
    procedure btnsurecdeleteClick(Sender: TObject);
    function verikontrol(var Msg:string):boolean;
    procedure btnHelpClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure UniSpeedButton1Click(Sender: TObject);
    procedure FileUpCompleted(Sender: TObject; AStream: TFileStream);
    procedure UniSpeedButton3Click(Sender: TObject);
    procedure UniSpeedButton2Click(Sender: TObject);
    procedure btbildirimevrakClick(Sender: TObject);
    procedure dsdataDataChange(Sender: TObject; Field: TField);
    procedure UniSpeedButton5Click(Sender: TObject);
    procedure UniSpeedButton6Click(Sender: TObject);
    procedure UniSpeedButton7Click(Sender: TObject);
    procedure UniSpeedButton9Click(Sender: TObject);
    procedure UniSpeedButton8Click(Sender: TObject);
    procedure UniSpeedButton10Click(Sender: TObject);
  private

    YardimKw : string;
    EylemTipi :  TEylemTipi;
    MultiChange : boolean;
    Ihlal_Id : integer;
    scrolKapali :boolean;
    konu : string;
    procedure tablesOpen(AIhlal_id: string);
    function listeEsitmi(const str1, str2: string): boolean;
    procedure ParametreDoldur(Areferansfield,Amainparametre: string;AvtTablo:Tvirtualtable);
  public
     function Exec(AIds: string='0'; AeylemTipi : TEylemTipi=Etekleme  ): integer;overload;
     procedure show(AIds:string);
  end;

function frmIhlalOlayi: TfrmIhlalOlayi;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, unKVKKSurecSec,unHelpPage, unPDFForm;

function frmIhlalOlayi: TfrmIhlalOlayi;
begin
  Result := TfrmIhlalOlayi(mainmod.GetFormInstance(TfrmIhlalOlayi));
end;

{ TfrmIhlalOlayi }

procedure TfrmIhlalOlayi.btnCancelClick(Sender: TObject);
begin
  qdata.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmIhlalOlayi.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmIhlalOlayi.btnPostClick(Sender: TObject);
var
  I: Integer;
  msg : string;
  NotDelSurecID : string;
begin

  if not verikontrol(msg) then
  begin
    MessageDlg(msg,mtConfirmation,[mbYes]);
    exit;
  end;

  if EylemTipi=Etekleme then
    qdata.Append
  else if EylemTipi = EtTekDegistirme then
    qdata.Edit;

    for I := 0 to qdata.Fields.Count -1 do
    begin
         if qdata.Fields[i].FieldName= 'id' then
            qdata.Fields[i].Value := ifthen(EylemTipi=Etekleme , MainMod.GetSeq('sq_def_data_ihlal_id'),vqdata.Fields[i].AsInteger )
          else if qdata.Fields[i].FieldName = 'mc_id' then
            qdata.Fields[i].Value := MainMod.MCID
          else if qdata.Fields[i].FieldName= 'sdy' then
            qdata.Fields[i].Value := mainmod.LoginInfo.ID
          else if qdata.Fields[i].FieldName= 'sdt' then
             qdata.Fields[i].Value := now
          else if (EylemTipi=Etekleme) and (  qdata.Fields[i].FieldName= 'idy') then
            qdata.Fields[i].Value := mainmod.LoginInfo.ID
          else if (EylemTipi=Etekleme) and ( qdata.Fields[i].FieldName = 'idt') then
             qdata.Fields[i].Value := now
          else
            qdata.Fields[i].Value := vqdata.Fields[i].Value;
    end;
    qdata.Post;

    if vqVsBilDosya.RecordCount > 0 then
    begin
     QueryOpen(qtmp,'select * from data_ihlal_dokuman where mc_id='+
     inttostr(mainmod.MCID)+' and ihlal_id='+ qdata.FieldByName('id').AsString +
      ' and konu='+QuotedStr('BÝLDÝRÝM EVRAK'));
      if not qTmp.IsEmpty then
      begin
       qTmp.Edit;
       qTmp.FieldByName('dosya_adi').AsString := vqVsBilDosya.FieldByName('dosya_adi').AsString;
       qTmp.FieldByName('file').Value :=  vqVsBilDosya.FieldByName('file').value;
       qTmp.Post;
      end else
      begin
       qTmp.Append;
       qTmp.FieldByName('id').AsInteger :=  MainMod.GetSeq('sq_data_ihlal_dokuman_id');
       qTmp.FieldByName('mc_id').AsInteger := mainmod.MCID;
       qTmp.FieldByName('konu').AsString := 'BÝLDÝRÝM EVRAK';
       qTmp.FieldByName('ihlal_id').AsInteger := qdata.FieldByName('id').AsInteger;
       qTmp.FieldByName('dosya_adi').AsString := vqVsBilDosya.FieldByName('dosya_adi').AsString;
       qTmp.FieldByName('file').Value :=  vqVsBilDosya.FieldByName('file').value;
       qTmp.Post;


      end;
    end;

    if vqTesbitEvrak.RecordCount > 0 then
    begin
      QueryOpen(qtmp,'select * from data_ihlal_dokuman where mc_id='+
     inttostr(mainmod.MCID)+' and ihlal_id='+ qdata.FieldByName('id').AsString +
      ' and konu='+QuotedStr('TESPÝT EVRAK'));
      if not qTmp.IsEmpty then
      begin
       qTmp.Edit;
       qTmp.FieldByName('dosya_adi').AsString := vqTesbitEvrak.FieldByName('dosya_adi').AsString;
       qTmp.FieldByName('file').Value :=  vqTesbitEvrak.FieldByName('file').value;
       qTmp.Post;
      end else
      begin
       qTmp.Append;
       qTmp.FieldByName('id').AsInteger :=  MainMod.GetSeq('sq_data_ihlal_dokuman_id');
       qTmp.FieldByName('mc_id').AsInteger := mainmod.MCID;
       qTmp.FieldByName('konu').AsString := 'TESPÝT EVRAK';
       qTmp.FieldByName('ihlal_id').AsInteger := qdata.FieldByName('id').AsInteger;
       qTmp.FieldByName('dosya_adi').AsString := vqTesbitEvrak.FieldByName('dosya_adi').AsString;
       qTmp.FieldByName('file').Value :=  vqTesbitEvrak.FieldByName('file').value;
       qTmp.Post;

      end;
    end;

    if vqpersonelEgitim.RecordCount > 0 then
    begin
      QueryOpen(qtmp,'select * from data_ihlal_dokuman where mc_id='+
     inttostr(mainmod.MCID)+' and ihlal_id='+ qdata.FieldByName('id').AsString +
      ' and konu='+QuotedStr('PERSONEL EÐÝTÝM EVRAK'));
      if not qTmp.IsEmpty then
      begin
       qTmp.Edit;
       qTmp.FieldByName('dosya_adi').AsString := vqpersonelEgitim.FieldByName('dosya_adi').AsString;
       qTmp.FieldByName('file').Value :=  vqpersonelEgitim.FieldByName('file').value;
       qTmp.Post;
      end else
      begin
       qTmp.Append;
       qTmp.FieldByName('id').AsInteger :=  MainMod.GetSeq('sq_data_ihlal_dokuman_id');
       qTmp.FieldByName('mc_id').AsInteger := mainmod.MCID;
       qTmp.FieldByName('konu').AsString := 'PERSONEL EÐÝTÝM EVRAK';
       qTmp.FieldByName('ihlal_id').AsInteger := qdata.FieldByName('id').AsInteger;
       qTmp.FieldByName('dosya_adi').AsString := vqpersonelEgitim.FieldByName('dosya_adi').AsString;
       qTmp.FieldByName('file').Value :=  vqpersonelEgitim.FieldByName('file').value;
       qTmp.Post;

      end;
    end;

    if vqIhlOncesiTetbir.RecordCount > 0 then
    begin
      QueryOpen(qtmp,'select * from data_ihlal_dokuman where mc_id='+
     inttostr(mainmod.MCID)+' and ihlal_id='+ qdata.FieldByName('id').AsString +
      ' and konu='+QuotedStr('ÝHLAL ÖNCESÝ TEDBÝR EVRAK'));
      if not qTmp.IsEmpty then
      begin
       qTmp.Edit;
       qTmp.FieldByName('dosya_adi').AsString := vqIhlOncesiTetbir.FieldByName('dosya_adi').AsString;
       qTmp.FieldByName('file').Value :=  vqIhlOncesiTetbir.FieldByName('file').value;
       qTmp.Post;
      end else
      begin
       qTmp.Append;
       qTmp.FieldByName('id').AsInteger :=  MainMod.GetSeq('sq_data_ihlal_dokuman_id');
       qTmp.FieldByName('mc_id').AsInteger := mainmod.MCID;
       qTmp.FieldByName('konu').AsString := 'ÝHLAL ÖNCESÝ TEDBÝR EVRAK';
       qTmp.FieldByName('ihlal_id').AsInteger := qdata.FieldByName('id').AsInteger;
       qTmp.FieldByName('dosya_adi').AsString := vqIhlOncesiTetbir.FieldByName('dosya_adi').AsString;
       qTmp.FieldByName('file').Value :=  vqIhlOncesiTetbir.FieldByName('file').value;
       qTmp.Post;

      end;
    end;

    if vqIhlSonrasiTedbir.RecordCount > 0 then
    begin
      QueryOpen(qtmp,'select * from data_ihlal_dokuman where mc_id='+
     inttostr(mainmod.MCID)+' and ihlal_id='+ qdata.FieldByName('id').AsString +
      ' and konu='+QuotedStr('ÝHLAL SONRASI TEDBÝR EVRAK'));
      if not qTmp.IsEmpty then
      begin
       qTmp.Edit;
       qTmp.FieldByName('dosya_adi').AsString := vqIhlSonrasiTedbir.FieldByName('dosya_adi').AsString;
       qTmp.FieldByName('file').Value :=  vqIhlSonrasiTedbir.FieldByName('file').value;
       qTmp.Post;
      end else
      begin
       qTmp.Append;
       qTmp.FieldByName('id').AsInteger :=  MainMod.GetSeq('sq_data_ihlal_dokuman_id');
       qTmp.FieldByName('mc_id').AsInteger := mainmod.MCID;
       qTmp.FieldByName('konu').AsString := 'ÝHLAL SONRASI TEDBÝR EVRAK';
       qTmp.FieldByName('ihlal_id').AsInteger := qdata.FieldByName('id').AsInteger;
       qTmp.FieldByName('dosya_adi').AsString := vqIhlSonrasiTedbir.FieldByName('dosya_adi').AsString;
       qTmp.FieldByName('file').Value :=  vqIhlSonrasiTedbir.FieldByName('file').value;
       qTmp.Post;

      end;
    end;


    vqsurec.First;
    while not vqsurec.Eof do
    begin
      vtmq.Close ;
      vtmq.SQL.Text := 'select GROUP_CONCAT(kaynak_id, '','') idlist from vqkaynak where sec=TRUE AND surec_id='+
        vqsurec.FieldByName('surec_id').AsString;
      vtmq.Open;


      vtmq2.Close ;
      vtmq2.SQL.Text := 'select GROUP_CONCAT(kisi_id, '','') idlist from vqilgilikisi where sec=TRUE AND surec_id='+
        vqsurec.FieldByName('surec_id').AsString;
      vtmq2.Open;

      QueryOpen(qTmp,'select * from def_data_ihlal_surec_eslesme  where mc_id='+inttostr(mainmod.MCID)+
                   ' and ihlal_id='+ qdata.fieldbyname('id').AsString +' and surec_id='+vqsurec.FieldByName('surec_id').AsString );
      if  qTmp.IsEmpty then
      begin
        qTmp.Append;
        qTmp.FieldByName('id').AsInteger := mainmod.GetSeq('sq_def_data_ihlal_surec_eslesme_id');
        qTmp.fieldbyname('mc_id').AsInteger := MainMod.MCID;
        qTmp.fieldbyname('ihlal_id').AsInteger := qdata.fieldbyname('id').AsInteger;
        qTmp.fieldbyname('surec_id').AsInteger := vqsurec.FieldByName('surec_id').AsInteger;
        qTmp.fieldbyname('kaynak_ids').AsString := vtmq.FieldByName('idlist').AsString;
        qTmp.fieldbyname('ilgili_kisi_ids').AsString := vtmq2.FieldByName('idlist').AsString;
        qTmp.fieldbyname('idy').AsInteger := MainMod.LoginInfo.ID;
        qTmp.fieldbyname('idt').AsDateTime :=  now;
        qTmp.fieldbyname('sdy').AsInteger := MainMod.LoginInfo.ID;
        qTmp.fieldbyname('sdt').AsDateTime := now;
        qTmp.Post;
      end else
      begin
        if not listeEsitmi(qTmp.FieldByName('kaynak_ids').AsString,vtmq.FieldByName('idlist').AsString) then
        begin
          qTmp.Edit;
          qTmp.FieldByName('kaynak_ids').AsString := vtmq.FieldByName('idlist').AsString;
          qTmp.fieldbyname('sdy').AsInteger := MainMod.LoginInfo.ID;
          qTmp.fieldbyname('sdt').AsDateTime := now;
          qTmp.Post;
        end;

        if not listeEsitmi(qTmp.FieldByName('ilgili_kisi_ids').AsString,vtmq2.FieldByName('idlist').AsString) then
        begin
          qTmp.Edit;
          qTmp.FieldByName('ilgili_kisi_ids').AsString := vtmq2.FieldByName('idlist').AsString;
          qTmp.fieldbyname('sdy').AsInteger := MainMod.LoginInfo.ID;
          qTmp.fieldbyname('sdt').AsDateTime := now;
          qTmp.Post;
        end;
      end;

      if NotDelSurecID <> '' then
        NotDelSurecID := NotDelSurecID + ',';
      NotDelSurecID := NotDelSurecID + vqsurec.FieldByName('surec_id').asstring;

      vqsurec.Next;
    end;

    QueryExec(qTmp,'delete from def_data_ihlal_surec_eslesme where mc_id=' + inttostr(MainMod.MCID) +
                   ' and ihlal_id='+qdata.FieldByName('id').AsString+ ' and surec_id not in ('+ NotDelSurecID+') ' );
    ModalResult := mrOk;

end;

function TfrmIhlalOlayi.listeEsitmi(const str1,str2 :string):boolean;
var
  List1, List2: TStringList;
begin
  List1 := TStringList.Create;
  List2 := TStringList.Create;
  try
    List1.Delimiter := ',';
    List1.DelimitedText := Str1;
    List2.Delimiter := ',';
    List2.DelimitedText := Str2;
    List1.Sort;
    List2.Sort;
    Result := List1.CommaText = List2.CommaText;
  finally
    List1.Free;
    List2.Free;
  end;

end;


procedure TfrmIhlalOlayi.show(AIds: string);
begin

  QueryOpen(qdata, 'select * from def_data_ihlal where mc_id='+inttostr(MainMod.MCID)+' and id in ('+AIds+')');
  CopyFieldsFromQueryToVirtualTable(qdata,vqdata,not MultiChange);

  vqsurec.Open;
  vqkaynak.Open;
  tablesOpen( ifthen(vqdata.FieldByName('id').asstring<>'',vqdata.FieldByName('id').asstring,'0'));

end;

procedure TfrmIhlalOlayi.ParametreDoldur(Areferansfield,Amainparametre: string;AvtTablo:Tvirtualtable);
var
list : TStringList;
begin
  AvtTablo.Open;
  while not AvtTablo.Eof do
    AvtTablo.Delete;
  QueryOpen(qTmp, ' select * from sys_modul_parameter where module=''ÝHLAL OLAY'' AND main_parameter='''+Amainparametre+''' ORDER BY SUBID ');
  list := TStringList.Create;
  try
    list.CommaText := vqdata.FieldByName(Areferansfield).AsString;
    qTmp.First;
    while not qTmp.Eof do
    begin
      AvtTablo.Append;
      AvtTablo.FieldByName('subid').AsString := qTmp.FieldByName('subid').AsString;
      AvtTablo.FieldByName('parameter').AsString := qTmp.FieldByName('parameter').AsString;
      AvtTablo.FieldByName('sec').AsBoolean := list.IndexOf(qTmp.FieldByName('subid').AsString) > -1;
      AvtTablo.Post;
      qtmp.Next;
    end;
  finally
    if assigned(list) then
      list.Free;
  end;
end;

procedure TfrmIhlalOlayi.btnSurecAddClick(Sender: TObject);
var
i : integer;
Acount : integer;
AsurecIds : TStringList;

begin

  AsurecIds := TStringList.Create;
  scrolKapali := true;
  try
    vqsurec.DisableControls;
      vqsurec.First;
      while not vqsurec.Eof do
      begin
        AsurecIds.Add(vqsurec.FieldByName('surec_id').AsString);
        vqsurec.Next;
      end;
    vqsurec.EnableControls;

      frmKVKKSurecSec.GizliKriter := 'id IN (SELECT DISTINCT surec_id FROM data_envanter WHERE active = ''E'' '+
      ' and dept_id=any(string_to_array('+QuotedStr(mainmod.LoginInfo.Birimler)+', '','')::int[]) ' +
      ' AND mc_id = ' + IntToStr(MainMod.MCID) + ') '+
       ifthen( AsurecIds.Count > 0 ,' and id not in ('+AsurecIds.DelimitedText+')','') ;
      ACount := frmKVKKSurecSec.Select(True);
      for i := 0 to ACount - 1 do
      begin
        frmKVKKSurecSec.qTanim.GotoBookmark(frmKVKKSurecSec.grdList.SelectedRows[i]);

        vqsurec.Append;
        vqsurec.FieldByName('ihlalSurec_Id').AsInteger := 0;
        vqsurec.FieldByName('ihlal_id').AsInteger := IfThen( not qdata.IsEmpty, qdata.FieldByName('id').AsInteger,0);
        vqsurec.FieldByName('Surec_Id').AsInteger := frmKVKKSurecSec.qTanim.FieldByName('id').AsInteger;
        vqsurec.FieldByName('surec').AsString := frmKVKKSurecSec.qTanim.FieldByName('surec').AsString;
        vqsurec.Post;

        QueryOpen(qtmp2,' select * from def_data_kaynak k ' +
       ' where exists ' +
       ' (select 1 from data_envanter e where e.active=''E'' '+
       ' AND mc_id='+inttostr(mainmod.MCID)+ ' AND e.kaynak_id=k.id and e.surec_id='+
        vqsurec.FieldByName('Surec_Id').AsString+ ' ) ' );
       qtmp2.first;
         while not qtmp2.Eof do
         begin
          vqkaynak.Append;
          vqkaynak.FieldByName('ihlalSurec_id').AsInteger :=  vqsurec.FieldByName('ihlalSurec_Id').AsInteger;
          vqkaynak.FieldByName('ihlal_id').AsInteger :=  vqsurec.FieldByName('ihlal_id').AsInteger;
          vqkaynak.FieldByName('surec_id').AsInteger := vqsurec.FieldByName('Surec_Id').AsInteger;
          vqkaynak.FieldByName('kaynak_id').AsInteger :=  qTmp2.FieldByName('id').AsInteger;
          vqkaynak.FieldByName('kaynak').asstring := qTmp2.FieldByName('kaynak').asstring;
          vqkaynak.FieldByName('sec').AsBoolean := false;
          vqkaynak.Post;
         qtmp2.Next;
         end;

          /// ilgili kiþi
         QueryOpen(qtmp2,' select * from def_data_kisi k ' +
       ' where exists ' +
       ' (select 1 from data_envanter e where e.active=''E'' '+
       ' AND mc_id='+inttostr(mainmod.MCID)+ ' AND e.kisi_id=k.id and e.surec_id='+
        vqsurec.FieldByName('Surec_Id').AsString+ ' ) ' );
       qtmp2.first;
         while not qtmp2.Eof do
         begin
          vqilgilikisi.Append;
          vqilgilikisi.FieldByName('ihlalSurec_id').AsInteger :=  vqsurec.FieldByName('ihlalSurec_Id').AsInteger;
          vqilgilikisi.FieldByName('ihlal_id').AsInteger :=  vqsurec.FieldByName('ihlal_id').AsInteger;
          vqilgilikisi.FieldByName('surec_id').AsInteger := vqsurec.FieldByName('Surec_Id').AsInteger;
          vqilgilikisi.FieldByName('kisi_id').AsInteger :=  qTmp2.FieldByName('id').AsInteger;
          vqilgilikisi.FieldByName('kisi').asstring := qTmp2.FieldByName('kisi').asstring;
          vqilgilikisi.FieldByName('sec').AsBoolean := false;
          vqilgilikisi.Post;
         qtmp2.Next;
         end;
      end;

  finally
    if Assigned(AsurecIds) then
      FreeAndNil(AsurecIds);
    scrolKapali := false;
  end;
end;

procedure TfrmIhlalOlayi.btnsurecdeleteClick(Sender: TObject);
begin
if vqsurec.IsEmpty then  exit;

  if not vqkaynak.IsEmpty then
  begin
    while not vqkaynak.Eof do
    begin
      vqkaynak.Delete;
      vqkaynak.Next;
    end;
  end;

  if not vqilgilikisi.IsEmpty then
  begin
    while not vqilgilikisi.Eof do
    begin
    vqilgilikisi.Delete;
    vqilgilikisi.Next;
    end;
  end;

vqsurec.Delete;

end;

procedure TfrmIhlalOlayi.dsdataDataChange(Sender: TObject; Field: TField);
  var
  kisiseVeriIhlali: Boolean;
begin
  kisiseVeriIhlali := dsdata.DataSet.FieldByName('kisisel_veri_ihlali').AsString = 'E';
  if not kisiseVeriIhlali  then
  begin
    pgControl.ActivePage := tsihlalgenel;
  end;

  UniPanel1.Visible :=  kisiseVeriIhlali;
  tsetki.TabVisible := kisiseVeriIhlali;
  tsolasisonuc.TabVisible := kisiseVeriIhlali;
  tsonlem.TabVisible := kisiseVeriIhlali;

  if not pgControl.ActivePage.Visible then
    pgControl.ActivePage := tsihlalgenel;
end;

function TfrmIhlalOlayi.Exec(AIds: string; AeylemTipi: TEylemTipi): integer;
begin
  YardimKw := 'ÝhlalOlayiTanimlama';
  EylemTipi := AeylemTipi;
  MultiChange := pos(',',AIds)>0;
  QueryOpen(qdata, 'select * from def_data_ihlal where mc_id='+inttostr(MainMod.MCID)+' and id in ('+AIds+')');
  CopyFieldsFromQueryToVirtualTable(qdata,vqdata,not MultiChange);
  pgControl.ActivePage := tsihlalgenel;
  dsdata.DataSet := vqdata;
  if (EylemTipi = Etekleme ) or (MultiChange) then
    vqdata.Insert
  else
    vqdata.Edit;

  if qdata.RecordCount>0 then
    begin
      QueryOpen(qTmp,'select * from data_ihlal_dokuman where konu= ''BÝLDÝRÝM EVRAK'' and mc_id=' +
      inttostr(MainMod.MCID) + ' and ihlal_id=' + qdata.FieldByName('id').AsString);
      CopyFieldsFromQueryToVirtualTable(qTmp,vqVsBilDosya,(not MultiChange) and (qTmp.RecordCount>0));

      QueryOpen(qTmp,'select * from data_ihlal_dokuman where konu= ''TESPÝT EVRAK'' and mc_id=' +
      inttostr(MainMod.MCID) + ' and ihlal_id=' + qdata.FieldByName('id').AsString);
      CopyFieldsFromQueryToVirtualTable(qTmp,vqTesbitEvrak,(not MultiChange) and (qTmp.RecordCount>0));

      QueryOpen(qTmp,'select * from data_ihlal_dokuman where konu= ''PERSONEL EÐÝTÝM EVRAK'' and mc_id=' +
      inttostr(MainMod.MCID) + ' and ihlal_id=' + qdata.FieldByName('id').AsString);
      CopyFieldsFromQueryToVirtualTable(qTmp,vqpersonelEgitim,(not MultiChange) and (qTmp.RecordCount>0));

      QueryOpen(qTmp,'select * from data_ihlal_dokuman where konu= ''ÝHLAL ÖNCESÝ TEDBÝR EVRAK'' and mc_id=' +
      inttostr(MainMod.MCID) + ' and ihlal_id=' + qdata.FieldByName('id').AsString);
      CopyFieldsFromQueryToVirtualTable(qTmp,vqIhlOncesiTetbir,(not MultiChange) and (qTmp.RecordCount>0));

      QueryOpen(qTmp,'select * from data_ihlal_dokuman where konu= ''ÝHLAL SONRASI TEDBÝR EVRAK'' and mc_id=' +
      inttostr(MainMod.MCID) + ' and ihlal_id=' + qdata.FieldByName('id').AsString);
      CopyFieldsFromQueryToVirtualTable(qTmp,vqIhlSonrasiTedbir,(not MultiChange) and (qTmp.RecordCount>0));

    end;


  vqsurec.Open;
  vqkaynak.Open;
  vqilgilikisi.Open;
  vqVsBilDosya.Open;
  vqTesbitEvrak.Open;
  vqpersonelEgitim.Open;
  vqIhlOncesiTetbir.Open;
  vqIhlSonrasiTedbir.Open;
  tablesOpen( ifthen(vqdata.FieldByName('id').asstring<>'',vqdata.FieldByName('id').asstring,'0'));

  edkullanici.Text := MainMod.LoginInfo.FullName;

  result := ShowModal;

end;

procedure TfrmIhlalOlayi.FileUpCompleted(Sender: TObject; AStream: TFileStream);
var
  ms : TMemoryStream;
   Ext: string;
begin
 if konu = 'BÝLDÝRÝM EVRAK' then
 begin
  if not (dsVsBilDosya.DataSet.State in [dsEdit,dsInsert])  then
    if dsVsBilDosya.DataSet.RecordCount = 0 then
      dsVsBilDosya.DataSet.Insert
      else
      dsVsBilDosya.DataSet.Edit;

  Ext := LowerCase(ExtractFileExt(AStream.FileName)); // Dosya uzantýsýný al

  if not (Ext = '.pdf') then
  begin
    ShowMessage('Geçersiz dosya türü! Sadece PDF yükleyebilirsiniz.');
    Exit;
  end;

  ms := TMemoryStream.Create;
   try

      ms.LoadFromFile(AStream.FileName);
      ms.Position := 0;
      TBlobField( dsVsBilDosya.DataSet.FieldByName('file')).LoadFromStream(ms);
      dsVsBilDosya.DataSet.FieldByName('id').AsInteger := 0;
      dsVsBilDosya.DataSet.FieldByName('dosya_adi').AsString := FileUp.FileName;//ExtractFileName(AStream.FileName);
      dsVsBilDosya.DataSet.FieldByName('konu').AsString := 'BÝLDÝRÝM EVRAK';
      dsVsBilDosya.DataSet.FieldByName('mc_id').AsInteger := mainmod.MCID;
      dsVsBilDosya.DataSet.Post;

   finally
     ms.Free;
   end;
 end else
 if konu = 'TESPÝT EVRAK'  then
 begin

  if not (dsTesbitEvrak.DataSet.State in [dsEdit,dsInsert])  then
    if dsTesbitEvrak.DataSet.RecordCount = 0 then
      dsTesbitEvrak.DataSet.Insert
      else
      dsTesbitEvrak.DataSet.Edit;

  Ext := LowerCase(ExtractFileExt(AStream.FileName)); // Dosya uzantýsýný al

  if not (Ext = '.pdf') then
  begin
    ShowMessage('Geçersiz dosya türü! Sadece PDF yükleyebilirsiniz.');
    Exit;
  end;

  ms := TMemoryStream.Create;
   try
      ms.LoadFromFile(AStream.FileName);
      ms.Position := 0;
      TBlobField(dsTesbitEvrak.DataSet.FieldByName('file')).LoadFromStream(ms);
      dsTesbitEvrak.DataSet.FieldByName('id').AsInteger := 0;
      dsTesbitEvrak.DataSet.FieldByName('dosya_adi').AsString := FileUp.FileName;//ExtractFileName(AStream.FileName);
      dsTesbitEvrak.DataSet.FieldByName('konu').AsString := 'TESPÝT EVRAK';
      dsTesbitEvrak.DataSet.FieldByName('mc_id').AsInteger := mainmod.MCID;
      dsTesbitEvrak.DataSet.Post;
   finally
     ms.Free;
   end;
 end else
 if konu = 'PERSONEL EÐÝTÝM EVRAK'  then
 begin

  if not (dspersonelEgitim.DataSet.State in [dsEdit,dsInsert])  then
    if dspersonelEgitim.DataSet.RecordCount = 0 then
      dspersonelEgitim.DataSet.Insert
      else
      dspersonelEgitim.DataSet.Edit;
  Ext := LowerCase(ExtractFileExt(AStream.FileName)); // Dosya uzantýsýný al
  if not (Ext = '.pdf') then
  begin
    ShowMessage('Geçersiz dosya türü! Sadece PDF yükleyebilirsiniz.');
    Exit;
  end;

  ms := TMemoryStream.Create;
   try
      ms.LoadFromFile(AStream.FileName);
      ms.Position := 0;
      TBlobField(dspersonelEgitim.DataSet.FieldByName('file')).LoadFromStream(ms);
      dspersonelEgitim.DataSet.FieldByName('id').AsInteger := 0;
      dspersonelEgitim.DataSet.FieldByName('dosya_adi').AsString := FileUp.FileName;//ExtractFileName(AStream.FileName);
      dspersonelEgitim.DataSet.FieldByName('konu').AsString := 'PERSONEL EÐÝTÝM EVRAK';
      dspersonelEgitim.DataSet.FieldByName('mc_id').AsInteger := mainmod.MCID;
      dspersonelEgitim.DataSet.Post;
   finally
     ms.Free;
   end;
 end  else
 if konu = 'ÝHLAL ÖNCESÝ TEDBÝR EVRAK'  then
 begin

  if not (dsIhlOncesiTetbir.DataSet.State in [dsEdit,dsInsert])  then
    if dsIhlOncesiTetbir.DataSet.RecordCount = 0 then
      dsIhlOncesiTetbir.DataSet.Insert
      else
      dsIhlOncesiTetbir.DataSet.Edit;
  Ext := LowerCase(ExtractFileExt(AStream.FileName)); // Dosya uzantýsýný al
  if not (Ext = '.pdf') then
  begin
    ShowMessage('Geçersiz dosya türü! Sadece PDF yükleyebilirsiniz.');
    Exit;
  end;

  ms := TMemoryStream.Create;
   try
      ms.LoadFromFile(AStream.FileName);
      ms.Position := 0;
      TBlobField(dsIhlOncesiTetbir.DataSet.FieldByName('file')).LoadFromStream(ms);
      dsIhlOncesiTetbir.DataSet.FieldByName('id').AsInteger := 0;
      dsIhlOncesiTetbir.DataSet.FieldByName('dosya_adi').AsString := FileUp.FileName;//ExtractFileName(AStream.FileName);
      dsIhlOncesiTetbir.DataSet.FieldByName('konu').AsString := 'ÝHLAL ÖNCESÝ TEDBÝR EVRAK';
      dsIhlOncesiTetbir.DataSet.FieldByName('mc_id').AsInteger := mainmod.MCID;
      dsIhlOncesiTetbir.DataSet.Post;
   finally
     ms.Free;
   end;
 end  else
 if konu = 'ÝHLAL SONRASI TEDBÝR EVRAK'  then
 begin

  if not (dsIhlSonrasiTedbir.DataSet.State in [dsEdit,dsInsert])  then
    if dsIhlSonrasiTedbir.DataSet.RecordCount = 0 then
      dsIhlSonrasiTedbir.DataSet.Insert
      else
      dsIhlSonrasiTedbir.DataSet.Edit;
  Ext := LowerCase(ExtractFileExt(AStream.FileName)); // Dosya uzantýsýný al
  if not (Ext = '.pdf') then
  begin
    ShowMessage('Geçersiz dosya türü! Sadece PDF yükleyebilirsiniz.');
    Exit;
  end;

  ms := TMemoryStream.Create;
   try
      ms.LoadFromFile(AStream.FileName);
      ms.Position := 0;
      TBlobField(dsIhlSonrasiTedbir.DataSet.FieldByName('file')).LoadFromStream(ms);
      dsIhlSonrasiTedbir.DataSet.FieldByName('id').AsInteger := 0;
      dsIhlSonrasiTedbir.DataSet.FieldByName('dosya_adi').AsString := FileUp.FileName;//ExtractFileName(AStream.FileName);
      dsIhlSonrasiTedbir.DataSet.FieldByName('konu').AsString := 'ÝHLAL SONRASI TEDBÝR EVRAK';
      dsIhlSonrasiTedbir.DataSet.FieldByName('mc_id').AsInteger := mainmod.MCID;
      dsIhlSonrasiTedbir.DataSet.Post;
   finally
     ms.Free;
   end;
 end;


end;

procedure TfrmIhlalOlayi.tablesOpen(AIhlal_id: string);
var
sqltext : string;
list : TStringList;
index : integer;
begin

  scrolKapali := true;
  try

      sqltext := ' select * from  def_data_ihlal_surec_eslesme es ' +
      ' join  def_data_ihlal i on i.mc_id=es.mc_id and es.ihlal_id=i.id ' +
      ' join def_data_surec s on s.mc_id=es.mc_id and s.id=es.surec_id ' +
    //  ' join def_data_kaynak k on k.mc_id=es.mc_id and k.id=any(string_to_array(es.kaynak_ids, '','')::int[]) ' +
      ' where es.mc_id= '+inttostr(MainMod.MCID)+' and es.ihlal_id='+AIhlal_id+'  order by surec ' ;             ;
      QueryOpen(qTmp,sqltext);
   while not vqsurec.Eof do
    vqsurec.Delete;

   if not qTmp.IsEmpty then
   begin
    qTmp.First;
     while not qTmp.Eof do
     begin
       vqsurec.Append;
       vqsurec.FieldByName('ihlalSurec_id').AsInteger := qTmp.FieldByName('id').AsInteger;
       vqsurec.FieldByName('ihlal_id').AsInteger := qTmp.FieldByName('ihlal_id').AsInteger;
       vqsurec.FieldByName('surec_id').AsInteger := qTmp.FieldByName('surec_id').AsInteger;
       vqsurec.FieldByName('surec').AsString := qTmp.FieldByName('surec').AsString;
       vqsurec.FieldByName('kaynak_ids').AsString := qTmp.FieldByName('kaynak_ids').AsString;
       vqsurec.Post;
       QueryOpen(qtmp2,' select * from def_data_kaynak k ' +
       ' where exists ' +
       ' (select 1 from data_envanter e where e.active=''E'' '+
       ' AND mc_id='+inttostr(mainmod.MCID)+ ' AND e.kaynak_id=k.id and e.surec_id='+qTmp.FieldByName('surec_id').AsString+ ' ) ' );
       qtmp2.first;
       // kaynak bilgileri toplanýyor
       list := TStringList.Create;

       try
         while not qtmp2.Eof do
         begin
          list.CommaText :=qTmp.FieldByName('kaynak_ids').AsString;
          vqkaynak.Append;
          vqkaynak.FieldByName('ihlalSurec_id').AsInteger :=  qTmp.FieldByName('id').AsInteger;
          vqkaynak.FieldByName('ihlal_id').AsInteger :=  qTmp.FieldByName('ihlal_id').AsInteger;
          vqkaynak.FieldByName('surec_id').AsInteger := qTmp.FieldByName('surec_id').AsInteger;
          vqkaynak.FieldByName('kaynak_id').AsInteger :=  qTmp2.FieldByName('id').AsInteger;
          vqkaynak.FieldByName('kaynak').asstring := qTmp2.FieldByName('kaynak').asstring;
          index := list.IndexOf(qtmp2.FieldByName('id').AsString) ;
          vqkaynak.FieldByName('sec').AsBoolean :=  index>-1;
          vqkaynak.Post;
         qtmp2.Next;
         end;
       finally
        list.Free;
       end;

       // kisi bilgileri toplanýyor
       QueryOpen(qtmp2,' select k.id,k.kisi from def_data_kisi k '+
              ' where exists ' +
              ' (select 1 from data_envanter e where e.active=''E'' '+
              ' AND mc_id='+inttostr(mainmod.MCID)+' AND e.kisi_id=k.id and e.surec_id='+
              qTmp.FieldByName('surec_id').AsString+ ')'  );

              qtmp2.first;
       list := TStringList.Create;
       try
         while not qtmp2.Eof do
         begin
          list.CommaText :=qTmp.FieldByName('ilgili_kisi_ids').AsString;
          vqilgilikisi.Append;
          vqilgilikisi.FieldByName('ihlalSurec_id').AsInteger :=  qTmp.FieldByName('id').AsInteger;
          vqilgilikisi.FieldByName('ihlal_id').AsInteger :=  qTmp.FieldByName('ihlal_id').AsInteger;
          vqilgilikisi.FieldByName('surec_id').AsInteger := qTmp.FieldByName('surec_id').AsInteger;
          vqilgilikisi.FieldByName('kisi_id').AsInteger :=  qTmp2.FieldByName('id').AsInteger;
          vqilgilikisi.FieldByName('kisi').asstring := qTmp2.FieldByName('kisi').asstring;
          index := list.IndexOf(qtmp2.FieldByName('id').AsString) ;
          vqilgilikisi.FieldByName('sec').AsBoolean := index>-1;
          vqilgilikisi.Post;
         qtmp2.Next;
         end;
       finally
        list.Free;
       end;

      qTmp.Next;
     end;
   end;

  ParametreDoldur('ihlal_etki_ilgili_kisi','KÝÞÝSEL ETKÝ',vtkisiseletki);
  ParametreDoldur('ihlal_etkisi','VERÝ ETKÝ',vtverietki);
  ParametreDoldur('ihlal_kaynagi_genel','ÝHLAL KAYNAÐI',vtihlalkaynagi) ;
  ParametreDoldur('ihlal_kaynagi_siber_saldiri','SÝBER SALDIRI',vtsibersaldiri) ;

  rgRiskSeviyekisi.ItemIndex  := vqdata.FieldByName('olasi_kisisel_sonuc').AsInteger;
  rgRiskSeviyeKurum.ItemIndex :=  vqdata.FieldByName('olasi_kurumsal_sonuc').AsInteger;

  finally
  scrolKapali := false;
  end;
end;

procedure TfrmIhlalOlayi.UniFormBeforeShow(Sender: TObject);
begin
  scroll.Top := 0;
  scroll.left := 0;
  scrollOnlem.Top := 0;
  scrollOnlem.left := 0;
  lbIDY.Caption := MainMod.KullaniciGetir(qdata.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(qdata.FieldByName('sdy').AsString);

  if (EylemTipi = EtTekDegistirme ) or ( EylemTipi =EtTopluDegistirme ) then
  begin
    if lbIDY.Text = '' then lbIDY.Text := 'SÝSTEM';
    if lbSDY.Text = '' then lbSDY.Text := 'SÝSTEM';
  end;

  if qdata.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qdata.FieldByName('idt').AsDateTime);
  if qdata.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qdata.FieldByName('sdt').AsDateTime);

   rgRiskSeviyekisi.Hint := ' Çok Yüksek : Ýlgili kiþiler üstesinden gelemeyecekleri zorluklar ve '+
   ' geri döndürülemez sonuçlar ile karþýlaþabilir (Ýþin durmasý, uzun süreli psikolojik veya fiziksel '+
   ' rahatsýzlýk, ölüm vb.) ' + sLineBreak   +
   ' Yüksek : Ýlgili kiþiler zorluklara raðmen üstesinden gelmeleri gereken ciddi sonuçlarla karþýlaþabilirler.'+
   ' (Maddi zarar, iþ kaybý, adli soruþturma, saðlýðýn kötüleþmesi vb.) ' + sLineBreak +
   ' Orta : Ýlgili kiþiler zorluklara raðmen üstesinden gelebilecekleri ' + sLineBreak +
   ' olumsuzluklarla karþýlaþabilirler (Fazla efor, ek maliyet, stres, küçük fiziksel rahatsýzlýklar vb.) ' + sLineBreak +
   ' Düþük : Ýlgili kiþiler üstesinden gelebilecekleri küçük olumsuzluklarla karþýlaþabilirler '+
   '(fazla zaman harcama, sýkýntý vb.) ' ;
   rgRiskSeviyekisi.ShowHint;

   rgRiskSeviyeKurum.Hint := ' Çok Yüksek :Her türlü hizmet sunma yetisinin kaybedilmesi. ' + sLineBreak +
   ' Yüksek : Önemli hizmetleri sunma yetisinin kaybedilmesi. ' + sLineBreak  +
   ' Orta : Bazý hizmetlerin sunumunda kontrol kaybý ve eksikliðinin oluþmasý. ' + sLineBreak  +
   ' Düþük : Herhangi bir etkinlik ve kontrol kaybýnýn olmamasý ' ;
   rgRiskSeviyeKurum.ShowHint;


end;

procedure TfrmIhlalOlayi.UniSpeedButton10Click(Sender: TObject);
begin
if vqIhlSonrasiTedbir.RecordCount>0 then
  //frmPDFForm.showpdf(vqIhlSonrasiTedbir.FieldByName('id').AsString);
  frmPDFForm.showpdf(vqIhlSonrasiTedbir);
end;

procedure TfrmIhlalOlayi.UniSpeedButton1Click(Sender: TObject);
begin

 konu := 'BÝLDÝRÝM EVRAK' ;
 if  dsdata.DataSet.State in [dsEdit,dsInsert] then
  FileUp.Execute;
end;

procedure TfrmIhlalOlayi.UniSpeedButton2Click(Sender: TObject);
begin
if vqVsBilDosya.RecordCount>0 then
  //frmPDFForm.showpdf(vqVsBilDosya.FieldByName('id').AsString);
  frmPDFForm.showpdf(vqVsBilDosya);
end;

procedure TfrmIhlalOlayi.UniSpeedButton3Click(Sender: TObject);
begin
 konu := 'TESPÝT EVRAK' ;
 if  dsdata.DataSet.State in [dsEdit,dsInsert] then
  FileUp.Execute;
end;

procedure TfrmIhlalOlayi.btbildirimevrakClick(Sender: TObject);
begin
if vqTesbitEvrak.RecordCount>0 then
//  frmPDFForm.showpdf(vqTesbitEvrak.FieldByName('id').AsString);
  frmPDFForm.showpdf(vqTesbitEvrak);
end;

procedure TfrmIhlalOlayi.UniSpeedButton5Click(Sender: TObject);
begin
 konu := 'PERSONEL EÐÝTÝM EVRAK' ;
 if  dsdata.DataSet.State in [dsEdit,dsInsert] then
  FileUp.Execute;
end;

procedure TfrmIhlalOlayi.UniSpeedButton6Click(Sender: TObject);
begin
if vqVsBilDosya.RecordCount>0 then
  //frmPDFForm.showpdf(vqpersonelEgitim.FieldByName('id').AsString);
  frmPDFForm.showpdf(vqpersonelEgitim);
end;

procedure TfrmIhlalOlayi.UniSpeedButton7Click(Sender: TObject);
begin
 konu := 'ÝHLAL ÖNCESÝ TEDBÝR EVRAK' ;
 if  dsdata.DataSet.State in [dsEdit,dsInsert] then
  FileUp.Execute;
end;

procedure TfrmIhlalOlayi.UniSpeedButton8Click(Sender: TObject);
begin
if vqIhlOncesiTetbir.RecordCount>0 then
  //frmPDFForm.showpdf(vqIhlOncesiTetbir.FieldByName('id').AsString);
  frmPDFForm.showpdf(vqIhlOncesiTetbir);
end;

procedure TfrmIhlalOlayi.UniSpeedButton9Click(Sender: TObject);
begin
 konu := 'ÝHLAL SONRASI TEDBÝR EVRAK' ;
 if  dsdata.DataSet.State in [dsEdit,dsInsert] then
  FileUp.Execute;
end;

function TfrmIhlalOlayi.verikontrol(var Msg: string): boolean;
begin
  Msg :='';
  vqdata.FieldByName('ihlal_kaynagi_genel').AsString := mainmod.MakeSelectIDList(vtihlalkaynagi,'sec','subid');
  vqdata.FieldByName('ihlal_kaynagi_siber_saldiri').AsString := mainmod.MakeSelectIDList(vtsibersaldiri,'sec','subid');
  vqdata.FieldByName('ihlal_etkisi').AsString := mainmod.MakeSelectIDList(vtverietki,'sec','subid');
  vqdata.FieldByName('ihlal_etki_ilgili_kisi').AsString := mainmod.MakeSelectIDList(vtkisiseletki,'sec','subid');

  vqdata.FieldByName('olasi_kisisel_sonuc').AsInteger := rgRiskSeviyekisi.ItemIndex;
  vqdata.FieldByName('olasi_kurumsal_sonuc').AsInteger := rgRiskSeviyeKurum.ItemIndex;

  result := true;
  if  not((vqdata.FieldByName('ihlal_kaynagi_genel').AsString<>'') or (vqdata.FieldByName('ihlal_kaynagi_siber_saldiri').AsString<>''))  then
    msg := 'Genel ihlal kaynaðý veya siber saldýrý kaynaklarýnýdan en az bir tane seçmelisiniz'
  else if  vqdata.FieldByName('ihlal_etkisi').AsString ='' then
    msg := 'Ýhlal etki seçeneklerinden en az bir tane seçmelisiniz'
  else if  vqdata.FieldByName('ihlal_etki_ilgili_kisi').AsString='' then
    msg := 'Ýhlalin kiþiler üzerindeki etkilerden bir tane seçmelisiniz'
  else   if Vqdata.FieldByName('ihlal_icerigi').AsString='' then
    msg := 'Ýhlal içeriði girmelisiniz'


  else   if Vqdata.FieldByName('olasi_kisisel_sonuc').AsString='' then
    msg := 'Olasý kiþisel sonuç girmelisiniz'
  else   if Vqdata.FieldByName('olasi_kurumsal_sonuc').AsString='' then
    msg := 'Olasý kurumsal sonuç girmelisiniz'
  else   if Vqdata.FieldByName('personel_egitimi').AsString='' then
    msg := 'Personel eðitim bilgilerini girmelisiniz'
  else   if Vqdata.FieldByName('teknik_tedbir_ihlal_oncesi').AsString='' then
    msg := 'Ýhlal öncesi teknik tedbir girmelisiniz'
  else   if Vqdata.FieldByName('idari_tedbir_ihlal_oncesi').AsString='' then
    msg := 'Ýhlal öncesi idari tedbir girmelisiniz'

  else   if Vqdata.FieldByName('teknik_tedbir_ihlal_sonrasi').AsString='' then
    msg := 'Ýhlal sonrasý teknik tedbir girmelisiniz'
  else   if Vqdata.FieldByName('idari_tedbir_ihlal_sonrasi').AsString='' then
    msg := 'Ýhlal sonrasý idari tedbir girmelisiniz'

  else if Vqdata.FieldByName('baslangic_tarihi').AsDateTime=0 then
    msg := 'Ýhlal baþlangýç tarihi seçmelisiniz'
  else if Vqdata.FieldByName('bitis_tarihi').AsDateTime=0 then
    msg := 'Ýhlal bitiþ tarihi seçmelisiniz'
  else if Vqdata.FieldByName('tespit_tarihi').AsDateTime=0 then
    msg := 'Ýhlal tespit tarihi seçmelisiniz'
  else if  Vqdata.FieldByName('veri_isleyen').AsString='' then
    msg := 'Veri iþleyen personeli belirtmelisiniz'
  else if  Vqdata.FieldByName('veri_isleyen_adresi').AsString='' then
    msg := 'Veri iþleyen personel adresini girmelisiniz'
  else if  Vqdata.FieldByName('ihlal_tespiti').AsString='' then
    msg := 'Ýhlal tespit açýklamasýný girmelisiniz'
  else if  Vqdata.FieldByName('etkilenen_kisi_sayisi').AsString='' then
    msg := 'Etkilenen kiþi sayýsýný girmelisiniz'
  else if  Vqdata.FieldByName('etkilenen_kayit_sayisi').AsString='' then
    msg := 'Etkilenen kayýt sayýsýný girmelisiniz'
  else if vqsurec.RecordCount<1 then
    msg := 'Ýhlalden etkilenen sureçleri girmelisiniz';



   vqsurec.First;
   while not vqsurec.Eof do
   begin
    vtmq2.Close ;
    vtmq2.SQL.Text := 'select * from vqkaynak where sec=TRUE and surec_id='+vqsurec.FieldByName('surec_id').AsString;
    vtmq2.Open;
    if vtmq2.IsEmpty then
      Msg := vqsurec.FieldByName('surec').AsString+' süreç için etkilenen kaynak seçmelisiniz' ;
    vqsurec.Next;
   end;

   vqsurec.First;
   while not vqsurec.Eof do
   begin
    vtmq2.Close ;
    vtmq2.SQL.Text := 'select * from vqilgilikisi where sec=TRUE and surec_id='+vqsurec.FieldByName('surec_id').AsString;
    vtmq2.Open;
    if vtmq2.IsEmpty then
      Msg := vqsurec.FieldByName('surec').AsString+' süreç için etkilenen ilgili kiþi seçmelisiniz' ;
    vqsurec.Next;
   end;


    result := Msg='';
end;

procedure TfrmIhlalOlayi.vqsurecAfterScroll(DataSet: TDataSet);
begin
 if scrolKapali then  exit;

//  vqueryKaynak.Close;
//  vqueryKaynak.ParamByName('IhlalSurec_Id').AsInteger := vqsurec.FieldByName('IhlalSurec_Id').AsInteger;
//  vqueryKaynak.ParamByName('ihlal_id').AsInteger := vqsurec.FieldByName('ihlal_id').AsInteger;
//  vqueryKaynak.ParamByName('surec_Id').AsInteger := vqsurec.FieldByName('surec_Id').AsInteger;
//  vqueryKaynak.Open;

end;

end.
