unit unVSBasvuruKayit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniButton, uniBitBtn, uniGUIBaseClasses, uniPanel, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniEdit, uniDBEdit, uniPageControl, uniDateTimePicker,
  uniDBDateTimePicker, uniMemo, uniDBMemo, Data.DB, DBAccess, Uni, MemDS, uniBasicGrid, uniDBGrid,
  VirtualTable, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdText, IdGlobal,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdMessage;

type
  TfrmVSBasvuruKayit = class(TUniForm)
    pnlButtons: TUniPanel;
    btnCancel: TUniBitBtn;
    btnPost: TUniBitBtn;
    UniLabel4: TUniLabel;
    lbIDY: TUniLabel;
    UniLabel5: TUniLabel;
    lbIDT: TUniLabel;
    UniLabel6: TUniLabel;
    lbSDY: TUniLabel;
    UniLabel7: TUniLabel;
    lbSDT: TUniLabel;
    PgControl: TUniPageControl;
    pgVeriSahibi: TUniTabSheet;
    pgBasvuru: TUniTabSheet;
    pgDept: TUniTabSheet;
    UniLabel9: TUniLabel;
    edKisiGrubu: TUniDBLookupComboBox;
    UniLabel34: TUniLabel;
    edKimlikNo: TUniDBEdit;
    UniLabel13: TUniLabel;
    edAd: TUniDBEdit;
    UniLabel18: TUniLabel;
    edTel1: TUniDBEdit;
    UniLabel35: TUniLabel;
    edSoyad: TUniDBEdit;
    UniLabel19: TUniLabel;
    edTel2: TUniDBEdit;
    UniLabel21: TUniLabel;
    edAdres1: TUniDBEdit;
    edAdres2: TUniDBEdit;
    UniLabel1: TUniLabel;
    edIlce: TUniDBEdit;
    UniLabel2: TUniLabel;
    edSehir: TUniDBEdit;
    UniLabel14: TUniLabel;
    edEMail: TUniDBEdit;
    UniLabel15: TUniLabel;
    edKEP: TUniDBEdit;
    UniLabel3: TUniLabel;
    UniLabel8: TUniLabel;
    edBsTarih: TUniDBDateTimePicker;
    UniLabel10: TUniLabel;
    edBsSekli: TUniDBComboBox;
    edBsEvrNo: TUniDBEdit;
    UniLabel11: TUniLabel;
    edBsAciklama: TUniDBMemo;
    UniLabel12: TUniLabel;
    UniLabel16: TUniLabel;
    UniLabel17: TUniLabel;
    edCvSekli: TUniDBComboBox;
    edCvEvrNo: TUniDBEdit;
    UniLabel20: TUniLabel;
    edCvAciklama: TUniDBMemo;
    edCvTarih: TUniDBDateTimePicker;
    UniLabel22: TUniLabel;
    edDurumu: TUniDBComboBox;
    dsVSBasvuru: TUniDataSource;
    qGrup: TUniQuery;
    dsGrup: TUniDataSource;
    grdDepts: TUniDBGrid;
    btnDeptsAdd: TUniBitBtn;
    btnDeptsDel: TUniBitBtn;
    UniPanel1: TUniPanel;
    UniLabel23: TUniLabel;
    UniLabel24: TUniLabel;
    edDeptAciklama: TUniDBMemo;
    UniLabel25: TUniLabel;
    UniLabel26: TUniLabel;
    qBsvDept: TUniQuery;
    dsBsvDept: TUniDataSource;
    qTmp: TUniQuery;
    btnDeptsMail: TUniBitBtn;
    edDeptOnayZamani: TUniEdit;
    edDeptOnaylayan: TUniEdit;
    qBsvDeptid: TIntegerField;
    qBsvDeptvsb_id: TIntegerField;
    qBsvDeptmc_id: TIntegerField;
    qBsvDeptdept_id: TIntegerField;
    qBsvDeptidy: TIntegerField;
    qBsvDeptidt: TDateTimeField;
    qBsvDeptsdy: TIntegerField;
    qBsvDeptsdt: TDateTimeField;
    pgEkler: TUniTabSheet;
    grdDocs: TUniDBGrid;
    btnDocsAdd: TUniBitBtn;
    btnDocsDel: TUniBitBtn;
    qBsvDoc: TUniQuery;
    dsBsvDoc: TUniDataSource;
    btnDocsDown: TUniBitBtn;
    edMailMsg: TUniMemo;
    edDeptDurum: TUniDBEdit;
    edKisiDetay: TUniDBMemo;
    UniLabel27: TUniLabel;
    UniLabel28: TUniLabel;
    edBsKonu: TUniDBEdit;
    UniLabel29: TUniLabel;
    edBirim: TUniDBEdit;
    UniLabel30: TUniLabel;
    edCvSekliTalep: TUniDBEdit;
    qBsvDeptonay: TStringField;
    qBsvDeptaciklama: TStringField;
    qBsvDeptdept_name: TStringField;
    qBsvDeptonaylayan: TStringField;
    qBsvDeptlookupdeptname: TStringField;
    qDept: TUniQuery;
    btnHelp: TUniBitBtn;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeptsAddClick(Sender: TObject);
    procedure btnDeptsDelClick(Sender: TObject);
    procedure btnDeptsMailClick(Sender: TObject);
    procedure btnDocsAddClick(Sender: TObject);
    procedure btnDocsDelClick(Sender: TObject);
    procedure btnDocsDownClick(Sender: TObject);
    procedure qBsvDeptAfterScroll(DataSet: TDataSet);
    procedure btnHelpClick(Sender: TObject);
  private
    Data : TUniQuery;
    YardimKw : string;
    function CheckID(AID: Integer; ATable: TUniQuery): Boolean;
    function ParseMsg(AData: TUniMemo): TStringList;
    procedure SendMail(EMailAddr: String);
    procedure PrepareTables;
    procedure CloseTables;
    procedure DelDeptControl(Sender: TComponent; Res: Integer);
    procedure DelDocControl(Sender: TComponent; Res: Integer);
  public
    function Exec(AID, AOp: Integer): Integer;
  end;

function frmVSBasvuruKayit: TfrmVSBasvuruKayit;

implementation

uses uniGUIApplication, MainModule, ServerModule, McMLib, unDepartmanSec,
     unVSBasvuruDokumanKayit, unHelpPage, unMailUtils;

{$R *.dfm}

function frmVSBasvuruKayit: TfrmVSBasvuruKayit;
begin
  Result := TfrmVSBasvuruKayit(MainMod.GetFormInstance(TfrmVSBasvuruKayit));
end;

procedure TfrmVSBasvuruKayit.btnCancelClick(Sender: TObject);
begin
  Data.Cancel;
  qBsvDept.CancelUpdates;
  qBsvDoc.CancelUpdates;
  ModalResult := mrCancel;
end;

procedure TfrmVSBasvuruKayit.btnDeptsAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID    : Integer;
  AName  : String;
begin
  if Data.FieldByName('id').AsInteger < 1 then Data.FieldByName('id').AsInteger := MainMod.GetSeq('sq_data_vsbasvuru_id');

  ACount := frmDepartmanSec.Select(True);
  qBsvDept.DisableControls;
  for i := 0 to ACount - 1 do
  begin
    frmDepartmanSec.qDepts.GotoBookmark(frmDepartmanSec.grdList.SelectedRows[i]);
    AID   := frmDepartmanSec.qDepts.FieldByName('id').AsInteger;
    AName := frmDepartmanSec.qDepts.FieldByName('title').AsString;
    if frmDepartmanSec.qDepts.FieldByName('main_dept_str').AsString <> '' then
      AName := AName + ' ('+frmDepartmanSec.qDepts.FieldByName('main_dept_str').AsString +')';

    if not CheckID(AID, qBsvDept) then
    begin
      qBsvDept.Insert;
      qBsvDept.FieldByName('id').AsInteger       := MainMod.GetSeq('sq_data_vsbasvuru_dept_id');
      qBsvDept.FieldByName('vsb_id').AsInteger   := Data.FieldByName('id').AsInteger;
      qBsvDept.FieldByName('mc_id').AsInteger    := MainMod.MCID;
      qBsvDept.FieldByName('dept_id').AsInteger  := AID;
      qBsvDept.FieldByName('lookupdeptname').AsInteger:= AID;
//      qBsvDept.FieldByName('dept_name').AsString := AName;
      qBsvDept.FieldByName('onay').AsString      := 'BEKLÝYOR';
      qBsvDept.FieldByName('aciklama').AsString  := '';
      qBsvDept.FieldByName('idy').AsInteger      := MainMod.LoginInfo.ID;
      qBsvDept.FieldByName('idt').AsDateTime     := Now;
      qBsvDept.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
      qBsvDept.FieldByName('sdt').AsDateTime     := Now;
      qBsvDept.Post;
    end;
  end;
  qBsvDept.EnableControls;
end;

procedure TfrmVSBasvuruKayit.btnDeptsDelClick(Sender: TObject);
var
  Msg : String;
begin
  if not MainMod.LoginInfo.Yetkiler[107] then
  begin
    MessageDlg('Departman silme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if qBsvDept.FieldByName('id').AsInteger < 1 then Exit;
  if qBsvDept.FieldByName('onay').AsString = 'ONAYLANDI' then
  begin
    MessageDlg('Bu departman, baþvuru için bilgi girerek onaylamýþ. Silemezsiniz.', mtWarning, [mbOk]);
    Exit;
  end;

  Msg := 'Listeden "' + qBsvDept.FieldByName('lookupdeptname').AsString + '" departmanýný çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelDeptControl);
end;

procedure TfrmVSBasvuruKayit.btnDeptsMailClick(Sender: TObject);
var
  PersId  : Integer;
  MailAdr : String;
begin
  if not MainMod.LoginInfo.Yetkiler[108] then
  begin
    MessageDlg('Mail gönderme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if qBsvDept.FieldByName('id').AsInteger < 1 then Exit;
  if qBsvDept.FieldByName('dept_id').AsInteger < 1 then
  begin
    MessageDlg('Departman tanýmý bulunamadý.', mtError, [mbOk]);
    Exit;
  end;
  QueryOpen(qTmp, 'SELECT * FROM sys_deptdef WHERE id = ' + qBsvDept.FieldByName('dept_id').AsString);
  if qTmp.FieldByName('id').AsInteger < 1 then
  begin
    MessageDlg('Departman tanýmý bulunamadý.', mtError, [mbOk]);
    Exit;
  end;
  if qTmp.FieldByName('manager').AsInteger < 1 then
  begin
    MessageDlg('Bu departman için yönetici tanýmý yapýlmamýþ. Mail gönderilemiyor.', mtError, [mbOk]);
    Exit;
  end;
  PersId := qTmp.FieldByName('manager').AsInteger;
  QueryOpen(qTmp, 'SELECT * FROM usr_user WHERE active = ''E'' AND id = ' + IntToStr(PersId));
  if qTmp.FieldByName('id').AsInteger < 1 then
  begin
    MessageDlg('Bu departmanýn yönetici bilgilerine ulaþýlamýyor.', mtError, [mbOk]);
    Exit;
  end;
  if qTmp.FieldByName('email').AsString = '' then
  begin
    MessageDlg('Bu departmanýn yöneticisine ait mail bilgisi tanýmlanmamýþ. Mail gönderilemiyor.', mtError, [mbOk]);
    Exit;
  end;
  MailAdr := qTmp.FieldByName('email').AsString;

  edMailMsg.Lines.LoadFromFile(ServerMod.FilesFolderPath + 'temp_mail/vsbvtmail.htm');

  //SendMail(MailAdr); unmailutils kullanýldý
  try
       GenelSendEmail(MailAdr,'Ýlgili Kiþi Baþvurusu Hk. - KVKNET',
       ParseMsg(edMailMsg).Text) ;
  except
  on E: Exception do
            ShowMessageN(E.Message);
  end;



  MessageDlg('Ýlgili birime bilgilendirme mail gönderildi.', mtInformation, [mbOk]);
  edMailMsg.Lines.Clear;
end;

procedure TfrmVSBasvuruKayit.btnDocsAddClick(Sender: TObject);
begin
  if Data.FieldByName('id').AsInteger < 1 then Data.FieldByName('id').AsInteger := MainMod.GetSeq('sq_data_vsbasvuru_id');

  frmVSBasvuruDokumanKayit.Exec(qBsvDoc, 0, Data.FieldByName('id').AsInteger, 0);
end;

procedure TfrmVSBasvuruKayit.btnDocsDelClick(Sender: TObject);
var
  Msg : String;
begin
  if not MainMod.LoginInfo.Yetkiler[109] then
  begin
    MessageDlg('Doküman silme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if qBsvDoc.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Listeden seçili dokümaný çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelDocControl);
end;

procedure TfrmVSBasvuruKayit.btnDocsDownClick(Sender: TObject);
var
  AStream : TMemoryStream;
begin
  if not MainMod.LoginInfo.Yetkiler[110] then
  begin
    MessageDlg('Ýlgili Kiþi Baþvuru Formlarýndan, Doküman indirme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if qBsvDoc.FieldByName('id').AsInteger < 1 then Exit;

  AStream := TMemoryStream.Create;
  try
    TBlobField(qBsvDoc.FieldByName('belge')).SaveToStream(AStream);
    UniSession.SendStream(AStream, qBsvDoc.FieldByName('belge_adi').AsString);
  finally
    AStream.Free;
  end;
end;

procedure TfrmVSBasvuruKayit.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmVSBasvuruKayit.btnPostClick(Sender: TObject);
begin
  if Data.FieldByName('kg_id').AsInteger < 1 then
  begin
    MessageDlg('Veri Sorumlusu Kiþi Grubu belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    PgControl.ActivePage := pgVeriSahibi;
    edKisiGrubu.SetFocus;
    Exit;
  end;
  if Data.FieldByName('durum').AsString = '' then
  begin
    MessageDlg('Baþvuru Durumu belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    PgControl.ActivePage := pgVeriSahibi;
    edDurumu.SetFocus;
    Exit;
  end;
  if Data.FieldByName('kimlik_no').AsString = '' then
  begin
    MessageDlg('Kimlik No belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    PgControl.ActivePage := pgVeriSahibi;
    edKimlikNo.SetFocus;
    Exit;
  end;
  if Data.FieldByName('adi').AsString = '' then
  begin
    MessageDlg('Adý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    PgControl.ActivePage := pgVeriSahibi;
    edAd.SetFocus;
    Exit;
  end;
  if Data.FieldByName('soyadi').AsString = '' then
  begin
    MessageDlg('Soyadý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    PgControl.ActivePage := pgVeriSahibi;
    edSoyad.SetFocus;
    Exit;
  end;
  if Data.FieldByName('basvuru_sekli').AsString = '' then
  begin
    MessageDlg('Baþvuru Biçimi belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    PgControl.ActivePage := pgBasvuru;
    edBsSekli.SetFocus;
    Exit;
  end;
  if Data.FieldByName('durum').AsString = 'CEVAPLANDI' then
  begin
    if Data.FieldByName('cevap_tarihi').AsString = '' then
    begin
      MessageDlg('Cevap Tarihi belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
      PgControl.ActivePage := pgBasvuru;
      edCvTarih.SetFocus;
      Exit;
    end;
    if Data.FieldByName('cevap_tarihi').AsDateTime < Data.FieldByName('basvuru_tarihi').AsDateTime then
    begin
      MessageDlg('Cevap Tarihi, Baþvuru Tarihinden önce olamaz. Lütfen kontrol ediniz.', mtError, [mbOk]);
      PgControl.ActivePage := pgBasvuru;
      edCvTarih.SetFocus;
      Exit;
    end;
    if Data.FieldByName('cevap_sekli').AsString = '' then
    begin
      MessageDlg('Baþvuru Biçimi belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
      PgControl.ActivePage := pgBasvuru;
      edCvSekli.SetFocus;
      Exit;
    end;
  end;

  if Data.State in [dsInsert] then
  begin
    if Data.FieldByName('id').AsInteger < 1 then Data.FieldByName('id').AsInteger := MainMod.GetSeq('sq_data_vsbasvuru_id');
    Data.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    Data.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    Data.FieldByName('idt').AsDateTime   := Now;
  end;
  Data.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  Data.FieldByName('sdt').AsDateTime     := Now;
  Data.Post;

  try
    MainMod.DBMain.StartTransaction;
    qBsvDept.ApplyUpdates();
    qBsvDept.CommitUpdates;
    qBsvDoc.ApplyUpdates();
    qBsvDoc.CommitUpdates;
    MainMod.DBMain.Commit;
  except
    qBsvDept.CancelUpdates;
    qBsvDoc.CancelUpdates;
    MainMod.DBMain.Rollback;
  end;

  ModalResult := mrOk;
end;

function TfrmVSBasvuruKayit.CheckID(AID: Integer; ATable: TUniQuery): Boolean;
begin
  Result := False;
  ATable.First;
  while not ATable.EOF do
  begin
    if ATable.FieldByName('dept_id').AsInteger = AID then
    begin
      Result := True;
      Break;
    end;
    ATable.Next;
  end;
end;

procedure TfrmVSBasvuruKayit.CloseTables;
begin
  qTmp.Close;
  qGrup.Close;
  qBsvDept.Close;
  qBsvDoc.Close;
end;

procedure TfrmVSBasvuruKayit.DelDeptControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  qBsvDept.Delete;
end;

procedure TfrmVSBasvuruKayit.DelDocControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  qBsvDoc.Delete;
end;

function TfrmVSBasvuruKayit.Exec(AID, AOp: Integer): Integer;
begin
  Data := MainMod.qVSBasvuru;

  if AOp = 0 then // Insert
  begin
    Data.Insert;
    Data.FieldByName('durum').AsString            := 'BEKLEMEDE';
    Data.FieldByName('basvuru_tarihi').AsDateTime := Date;
    YardimKw := 'VSBasvuruYeniKayit';
  end
  else // Edit
  begin
    Data.Edit;
    YardimKw := 'VSBasvuruDegistirme';
  end;
  PrepareTables;
  ActiveControl := edKisiGrubu;
  Result := ShowModal;

  CloseTables;
end;

function TfrmVSBasvuruKayit.ParseMsg(AData: TUniMemo): TStringList;
var
  i   : Integer;
  Tmp      : String;
  LastDate ,
  BsvDate  ,
  RefNo    ,
  DocNo    ,
  VsAdi    : String;
begin
  Result   := TStringList.Create;
  LastDate := FormatDateTime('dd.mm.yyyy', Data.FieldByName('basvuru_tarihi').AsDateTime + 15);
  BsvDate  := FormatDateTime('dd.mm.yyyy', Data.FieldByName('basvuru_tarihi').AsDateTime);
  RefNo    := Data.FieldByName('id').AsString;
  DocNo    := Data.FieldByName('basvuru_evrakno').AsString;
  VsAdi    := Data.FieldByName('adi').AsString + ' ' + Data.FieldByName('soyadi').AsString;

  for i := 0 to AData.Lines.Count - 1 do
  begin
    Tmp := AData.Lines[i];
    Tmp := Str2HTMLStr(StringReplace(Tmp, '%%%LASTDATE%%%',   LastDate, [rfReplaceAll]));
    Tmp := Str2HTMLStr(StringReplace(Tmp, '%%%BSVREFNO%%%',   RefNo,    [rfReplaceAll]));
    Tmp := Str2HTMLStr(StringReplace(Tmp, '%%%BSVDATE%%%',    BsvDate,  [rfReplaceAll]));
    Tmp := Str2HTMLStr(StringReplace(Tmp, '%%%BSVDOCNO%%%',   DocNo,    [rfReplaceAll]));
    Tmp := Str2HTMLStr(StringReplace(Tmp, '%%%BSVNAME%%%',    VsAdi,    [rfReplaceAll]));
    Result.Add(Tmp);
  end;
end;

procedure TfrmVSBasvuruKayit.PrepareTables;
begin
  if Data.FieldByName('id').AsInteger < 1 then Data.FieldByName('id').AsInteger := MainMod.GetSeq('sq_data_vsbasvuru_id');

  QueryOpen(qGrup, 'SELECT id, kisi FROM def_data_kisi WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY id');

  QueryOpen(qBsvDept,
    'SELECT bsd.*, ' +
    ' dp.title as dept_name,' +
    ' (case when coalesce(dp.main_dept_id,0) > 0 then dp.title||'' (''||dept_main.title||'') '' else dp.title end) AS dept_name, ' +
    ' us.full_name as onaylayan ' +
    'FROM data_vsbasvuru_dept bsd ' +
    '  LEFT JOIN sys_deptdef dp ON dp.id = bsd.dept_id ' +
    ' LEFT JOIN sys_deptdef dept_main on dept_main.id = dp.main_dept_id ' +
    '  LEFT JOIN usr_user us ON us.id = bsd.sdy ' +
    'WHERE bsd.mc_id = ' + IntToStr(MainMod.MCID) + ' AND bsd.vsb_id = ' +
    Data.FieldByName('id').AsString + ' ORDER BY bsd.id');
//  QueryOpen(qBsvDoc,  'SELECT bsd.*, bsd.dept_id as dept_name, bsd.idy as ekleyen ' +
//                      'FROM data_vsbasvuru_docs bsd ' +
//                      'WHERE bsd.mc_id = ' + IntToStr(MainMod.MCID) + ' AND bsd.vsb_id = ' +
//                      Data.FieldByName('id').AsString + ' ORDER BY bsd.id');
  QueryOpen(qBsvDoc,  'SELECT bsd.*, dp.title as dept_name, us.full_name as ekleyen ' +
                      'FROM data_vsbasvuru_docs bsd ' +
                      '  LEFT JOIN sys_deptdef dp ON dp.id = bsd.dept_id ' +
                      '  LEFT JOIN usr_user us ON us.id = bsd.idy ' +
                      'WHERE bsd.mc_id = ' + IntToStr(MainMod.MCID) + ' AND bsd.vsb_id = ' +
                      Data.FieldByName('id').AsString + ' ORDER BY bsd.id');
//  QueryOpen(qDept,    'SELECT id, title ' +
//                      'FROM sys_deptdef dp ' +
//                      'WHERE dp.mc_id = ' + IntToStr(MainMod.MCID) +
//                      ' ORDER BY title');
   QueryOpen(qdept,
    ' SELECT dp.id, ' +
    ' (case when COALESCE(dp.main_dept_id,0) > 0 THEN  dp.title||'' (''||dp_main.title||'') '' else dp.title end) as title ' +
    ' FROM sys_deptdef dp ' +
    ' LEFT JOIN sys_deptdef dp_main on dp_main.id = dp.main_dept_id ' +
    ' WHERE dp.mc_id =' + IntToStr(MainMod.MCID) +
    ' ORDER BY title ' ) ;
end;

procedure TfrmVSBasvuruKayit.qBsvDeptAfterScroll(DataSet: TDataSet);
begin
  if qBsvDept.FieldByName('onay').AsString = 'ONAYLANDI' then
  begin
    edDeptOnaylayan.Text  := qBsvDept.FieldByName('onaylayan').AsString;
    edDeptOnayZamani.Text := FormatDateTime('dd.mm.yyyy hh:nn:ss', qBsvDept.FieldByName('idt').AsDateTime)
  end
  else
  begin
    edDeptOnaylayan.Text  := '';
    edDeptOnayZamani.Text := '';
  end;
end;

procedure TfrmVSBasvuruKayit.SendMail(EMailAddr: String);
var
  AParam     : TParameter;
  SenderAcc  ,
  SenderPwd  ,
  SenderHost ,
  SenderPort : String;
  senderSSL  : boolean;
  senderTLS  : Integer;
  Error      : Boolean;
  SMTP       : TIdSMTP;
  Msg        : TIdMessage;
  SSLHandler : TIdSSLIOHandlerSocketOpenSSL;
  HTMLMsg    : TStringList;
begin
{  AParam     := MainMod.GetParameter(MainMod.qTmp, 'KVKK', 'GENEL', 'MAIL ACCOUNT');
  SenderAcc  := AParam.Deger1;
  SenderPwd  := AParam.Deger2;
  AParam     := MainMod.GetParameter(MainMod.qTmp, 'KVKK', 'GENEL', 'MAIL SERVER');
  SenderHost := AParam.Deger1;
  SenderPort := AParam.Deger2;}

  QueryOpen(mainmod.qTmp, 'select * from sys_param_mc where mc_id=' + IntToStr(mainmod.MCID));
  senderAcc := mainmod.qTmp.fieldByName('smtp_username').AsString;
  senderPwd := mainMod.qTmp.FieldByName('smtp_password').AsString;
  senderHost := mainmod.qTmp.fieldByName('smtp_host').AsString;
  senderPort := mainMod.qTmp.FieldByName('smtp_port').AsString;
  senderSSL  := (mainMod.qTmp.FieldByName('smtp_ssl').AsString = 'E');
  senderTLS  := mainMod.qTmp.FieldByName('smtp_usetls').AsInteger;


  if (SenderAcc = '') or (SenderPwd = '') then
  begin
    MessageDlg('Firma Mail Hesabý tanýmlanmamýþ. Lütfen firma parametrelerini kontrol ediniz.', mtError, [mbOk]);
    Exit;
  end;
  if (SenderHost = '') or (SenderPort = '') then
  begin
    MessageDlg('Firma Mail Sunucu ayarlarý yapýlmamýþ. Lütfen firma parametrelerini kontrol ediniz.', mtError, [mbOk]);
    Exit;
  end;

  senderPwd := DecryptStr(senderPwd);

  Error := True;
  Msg := TIdMessage.Create(nil);
  try
    Msg.From.Address := SenderAcc;
    Msg.Recipients.EMailAddresses := EMailAddr;
    Msg.Subject      := 'Ýlgili Kiþi Baþvurusu Hk. - KVKNET';
    Msg.ContentType  := 'multipart/mixed';
    with TIdText.Create(Msg.MessageParts, nil) do begin
      // Body.Text := 'HTML goes here';
      HTMLMsg := ParseMsg(edMailMsg);
      Body.Assign(HTMLMsg);
      // Body.LoadFromFile('index.html');
      ContentType := 'text/html';
    end;

    SSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    SMTP := TIdSMTP.Create(nil);
    try
      SSLHandler.MaxLineAction := maException;
      SSLHandler.SSLOptions.Method := sslvTLSv1_2; // sslvTLSv1; // sslvSSLv23;
      SSLHandler.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
      SSLHandler.SSLOptions.Mode := sslmClient; // sslmUnassigned;
      SSLHandler.SSLOptions.VerifyMode := [];
      SSLHandler.SSLOptions.VerifyDepth := 0;

      if senderSSl then
      begin
        SMTP.IOHandler := SSLHandler;
        SMTP.UseTLS := TIdUseTLS(senderTLS);
      end;
      SMTP.AuthType  := satDefault;
      SMTP.Host      := SenderHost;
      SMTP.Port      := StrToIntDef(SenderPort, 0);
      SMTP.UseTLS    := utUseExplicitTLS;
      SMTP.Username  := SenderAcc;
      SMTP.Password  := SenderPwd;
      SMTP.ConnectTimeout := 10000;
      SMTP.Connect;
      if SMTP.Connected then
      begin
        SMTP.Authenticate;
        SMTP.Send(Msg);
        SMTP.Disconnect;
        Error := False;
      end;
    finally
      SMTP.Free;
      SSLHandler.Free;
    end;
  finally
    Msg.Free;
  end;
  if Error then
  begin
    MessageDlg('Mail gönderilirken hata oluþtu. Ýþlem baþarýsýz.', mtError, [mbOk]);
    Exit;
  end;
end;

procedure TfrmVSBasvuruKayit.UniFormBeforeShow(Sender: TObject);
begin
  PgControl.ActivePage := pgVeriSahibi;
  lbIDY.Caption := MainMod.KullaniciGetir(Data.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(Data.FieldByName('sdy').AsString);

  if dsVSBasvuru.State = dsEdit then
  begin
    if lbIDY.Text = '' then lbIDY.Text := 'SÝSTEM';
    if lbSDY.Text = '' then lbSDY.Text := 'SÝSTEM';
  end;

  if Data.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', Data.FieldByName('idt').AsDateTime);
  if Data.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', Data.FieldByName('sdt').AsDateTime);
end;

end.
