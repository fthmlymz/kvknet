unit unKullaniciTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniButton, uniBitBtn, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox, uniCheckBox, uniDBCheckBox, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses,
  uniListBox, uniDBListBox, Data.DB, DBAccess, Uni, MemDS, VirtualTable, uniBasicGrid, uniDBGrid, uniMemo;

type
  TfrmKullaniciTanim = class(TUniForm)
    pnlData: TUniPanel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    edUName: TUniDBEdit;
    edFName: TUniDBEdit;
    edActive: TUniDBCheckBox;
    UniLabel8: TUniLabel;
    edRole: TUniDBLookupComboBox;
    pnlButtons: TUniPanel;
    btnCancel: TUniBitBtn;
    btnPost: TUniBitBtn;
    pnlLog: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    lbIDY: TUniLabel;
    lbIDT: TUniLabel;
    lbSDY: TUniLabel;
    lbSDT: TUniLabel;
    qRole: TUniQuery;
    dsRole: TUniDataSource;
    dsUser: TUniDataSource;
    tblDepts: TVirtualTable;
    btnDeptAdd: TUniBitBtn;
    btnDeptDel: TUniBitBtn;
    dsDepts: TUniDataSource;
    UniLabel9: TUniLabel;
    edPhone: TUniDBEdit;
    edMail: TUniDBEdit;
    UniLabel11: TUniLabel;
    qTmp: TUniQuery;
    UniDBGrid1: TUniDBGrid;
    btnHelp: TUniBitBtn;
    UniLabel10: TUniLabel;
    edUNameLDAP: TUniDBEdit;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeptDelClick(Sender: TObject);
    procedure btnDeptAddClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    YardimKw : string;
    DataDB : TUniQuery;
    LDAP_Aktif: boolean;
    OldRol : string;
    function CheckDept(AID: Integer): Boolean;
    function ListToStr: String;
    procedure StrToList;
    procedure GetRoleList;
    procedure DelDeptControl(Sender: TComponent; Res: Integer);
    procedure ManageSettings;
  /// <summary>
  /// boþ lisan varmý boþ lisans var ise true yok ise false
  /// </summary>
    function checkNulLisans: boolean;
    procedure lockUser(amsg: string);
  public
    function Edit: Integer;
    function Insert: Integer;
  end;

function frmKullaniciTanim: TfrmKullaniciTanim;

implementation

uses uniGUIApplication, ServerModule, MainModule, McMLib, unKullaniciListe, unDepartmanSec,
     unHelpPage;

{$R *.dfm}

function frmKullaniciTanim: TfrmKullaniciTanim;
begin
  Result := TfrmKullaniciTanim(MainMod.GetFormInstance(TfrmKullaniciTanim));
end;

procedure TfrmKullaniciTanim.btnCancelClick(Sender: TObject);
begin
  DataDB.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmKullaniciTanim.lockUser(amsg:string);
var
  TargetUser: string;
begin
  TargetUser := dsUser.DataSet.FieldByName('id').AsString;// edtTargetUser.Text;
  if TargetUser <> '' then
  begin
    ServerMod.exitUser(TargetUser, amsg);
  end;
end;

procedure TfrmKullaniciTanim.btnDeptAddClick(Sender: TObject);
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

    if not CheckDept(AID) then
    begin
      tblDepts.Insert;
      tblDepts.FieldByName('id').AsInteger  := AID;
      tblDepts.FieldByName('name').AsString := AName;
      tblDepts.Post;
    end;
  end;
end;

procedure TfrmKullaniciTanim.btnDeptDelClick(Sender: TObject);
var
  Msg : String;
begin
  if tblDepts.FieldByName('id').AsInteger < 1 then Exit;
  Msg := 'Bu personelin "' + tblDepts.FieldByName('name').AsString + '" departmanýndaki yetkisini kaldýrmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelDeptControl);
end;

procedure TfrmKullaniciTanim.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

function TfrmKullaniciTanim.checkNulLisans:boolean;
var
  sCount,
  SQLStr : String;
  iCount : Integer;
  MCID   : Integer;
begin
  result := true;
  if MainMod.MCType = 0 then MCID := 0 else MCID := MainMod.MCID;

  sCount := MainMod.GetParameter2(MainMod.qTmp, MainMod.GCID, MCID, 'DB SERVER'); // Kullanýcý Sayýsý
  iCount := StrToIntDef(sCount, 0);

  QueryOpen(MainMod.qTmp, 'SELECT * FROM usr_user WHERE gc_id = ' + IntToStr(MainMod.GCID) + ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' AND active = ''E''');

  if MainMod.qTmp.RecordCount >= iCount  then
  begin
    MessageDlg('Lisansýnýzýn izin verdiði kullanýcý sayýsýna ulaþtýnýz. (Max. ' + IntToStr(iCount) + ' kullanýcý)'#13 +
               'Yeni kullanýcý oluþturamazsýnýz.', mtError, [mbOk]);
    result := false;
  end;
end;

procedure TfrmKullaniciTanim.btnPostClick(Sender: TObject);
var
  msg : string;
begin
 // Doðan Akçay edit modda kullanýcý lisans kontrolu
  if DataDB.State = dsEdit then
    if DataDB.FieldByName('active').OldValue <> DataDB.FieldByName('active').NewValue then
      if  DataDB.FieldByName('active').NewValue ='E' then
          if not checkNulLisans then
           exit;


  if DataDB.FieldByName('user_name').AsString = '' then
  begin
    MessageDlg('Kullanýcý Adý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edUName.SetFocus;
    Exit;
  end;
  // Doðan Akçay 1261 Mail Adresinin uniq olmasý saðlandý.
  QueryOpen(qTmp,'SELECT full_name FROM usr_user WHERE mc_id='+inttostr(mainmod.MCID) +' and  email ='+QuotedStr(edMail.Text)+
   'and id <> ' + FloatToStr(MainMod.qUser.FieldByName('id').AsFloat) )  ;
  if not qTmp.IsEmpty then
    begin
      MessageDlg( 'Ayný mail  adresi ile daha önce eklenmiþ kullanýcý bulunmakta, kayýtlý kullanýcý: ' + qtmp.FieldByName('full_name').AsString,TMsgDlgType.mtError,[mbOK]);
      edMail.SetFocus;
      exit;
    end;

  // Added by TEVFIK 22.02.2023 15:07:44
  if DataDB.FieldByName('user_name').AsString <> '' then
  begin
    DataDB.FieldByName('user_name').AsString :=
      Trim(DataDB.FieldByName('user_name').AsString);
  end;
  // Added by TEVFIK 22.02.2023 15:07:44

  if DataDB.FieldByName('full_name').AsString = '' then
  begin
    MessageDlg('Personel Adý Soyadý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edFName.SetFocus;
    Exit;
  end;
  if DataDB.FieldByName('active').AsString = '' then
  begin
    MessageDlg('Kullanýcý Durumu belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edActive.SetFocus;
    Exit;
  end;
  if DataDB.FieldByName('rol').AsString = '' then
  begin
    MessageDlg('Kullanýcý Rolü seçilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edRole.SetFocus;
    Exit;
  end;

  // Added by TEVFIK 6.06.2023 17:17:17
  QueryOpen(qTmp, 'SELECT user_name FROM usr_user WHERE active=''E'' ' +
    'AND user_name=''' + edUName.Text + ''' ' +
    'AND id <> ' + FloatToStr(MainMod.qUser.FieldByName('id').AsFloat) + ' ' +
    'AND mc_id = ' + IntToStr(MainMod.MCID));
  if qTmp.FieldByName('user_name').AsString = edUName.Text then
  begin
    MessageDlg('Bu kullanýcý adý ile aktif bir kullanýcý tanýmlýdýr. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edUName.SetFocus;
    Exit;
  end;

  if DataDB.FieldByName('ldap_user_name').AsString <> '' then
  begin
    QueryOpen(MainMod.qTmp, 'SELECT COUNT(id) FROM usr_user WHERE active=''E'' AND ' +
      'mc_id = ' + IntToStr(MainMod.MCID) + ' AND ' +
      'ldap_user_name=''' + DataDB.FieldByName('ldap_user_name').AsString+''' ' +
      ' AND id <> ' + FloatToStr(MainMod.qUser.FieldByName('id').AsFloat) + '');
    if MainMod.qTmp.Fields[0].AsInteger > 0 then
    begin
      MessageDlg('Bu LDAP kullanýcý adý ile aktif bir kullanýcý tanýmlýdýr. Lütfen kontrol ediniz.', mtError, [mbOk]);
      Exit;
    end;
  end;
  //

  DataDB.FieldByName('list_dept').AsString := ListToStr;

  if DataDB.State in [dsInsert] then
  begin
    DataDB.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_usr_user_id');
    DataDB.FieldByName('gc_id').AsInteger  := MainMod.GCID;
    if MainMod.MCType = 0
       then DataDB.FieldByName('mc_id').AsInteger  := 0
       else DataDB.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    DataDB.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    DataDB.FieldByName('idt').AsDateTime   := Now;
  end;
  DataDB.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  DataDB.FieldByName('sdt').AsDateTime     := Now;

  msg := 'Yaptýðýnýz deðiþiklikler kullanýcýnýn bir sonraki sisteme giriþinde geçerli olacaktýr.';
  try
     if DataDB.State in [dsEdit] then
     begin
      if dsUser.DataSet.FieldByName('active').AsString <> 'E' then
      begin
         msg := 'Ýþlem baþarý ile tamamlandý.';
         lockUser('Yetkiniz Pasife alýnmýþtýr. Yöneticinize baþvurunuz.')
      end
       else if OldRol <> dsUser.DataSet.FieldByName('rol').AsString then
       begin
         msg := 'Ýþlem baþarý ile tamamlandý.';
         lockUser('Yetkiniz deðiþtirilmiþtir. Sisteme yeniden girmeniz gerekmektedir.');
       end;
     end;

    DataDB.Post;
    MessageDlg(msg, mtInformation, [mbOk]);
  except
    on E: Exception do
      ShowMessageN('Post iþlemi sýrasýnda bir hata oluþtu: ' + E.Message);
      //MessageDlg('Post iþlemi sýrasýnda bir hata oluþtu: ' + E.Message, mtError, [mbOk]);
  end;
  ModalResult := mrOk;
end;

function TfrmKullaniciTanim.CheckDept(AID: Integer): Boolean;
begin
  Result := False;
  tblDepts.First;
  while not tblDepts.EOF do
  begin
    if tblDepts.FieldByName('id').AsInteger = AID then
    begin
      Result := True;
      Break;
    end;
    tblDepts.Next;
  end;
end;

procedure TfrmKullaniciTanim.DelDeptControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  tblDepts.Delete;
end;

function TfrmKullaniciTanim.Edit: Integer;
begin
  DataDB := MainMod.qUser;
  GetRoleList;
  tblDepts.Open;
  StrToList;
  if dsUser.DataSet.RecordCount >0 then
    OldRol := dsUser.DataSet.FieldByName('rol').AsString;
  DataDB.Edit;
  ActiveControl := edUName;
  YardimKw := 'KullaniciDegistirme';
  Result := ShowModal;
  tblDepts.Close;
end;

procedure TfrmKullaniciTanim.GetRoleList;
var
  WStr : String;
begin
  if MainMod.MCType = 0
     then WStr 	:= WStr + 'mc_id = 0'
	   else WStr 	:= WStr + 'mc_id = ' + IntToStr(MainMod.MCID);
  QueryOpen(qRole, 'SELECT * FROM usr_role WHERE ' + WStr + ' AND gc_id = ' + IntToStr(MainMod.GCID));
end;

function TfrmKullaniciTanim.Insert: Integer;
begin
  DataDB := MainMod.qUser;
  GetRoleList;
  tblDepts.Open;
  DataDB.Insert;
  StrToList;
  DataDB.FieldByName('active').AsString := 'E';
  ActiveControl := edUName;
  YardimKw := 'KullaniciYeniKayit';
  Result := ShowModal;
  tblDepts.Close;
end;

function TfrmKullaniciTanim.ListToStr: String;
var
  sTmp : String;
begin
  sTmp := '';
  tblDepts.First;
  while not tblDepts.EOF do
  begin
    sTmp := sTmp + tblDepts.FieldByName('id').AsString + ',';
    tblDepts.Next;
  end;

  if Length(sTmp) > 0 then System.Delete(sTmp, Length(sTmp), 1);
  Result := sTmp;
end;

procedure TfrmKullaniciTanim.ManageSettings;
begin
//  btnDeptAdd.Visible := (MainMod.qUsers.FieldByName('ubys_id').AsString <> '');
//  btnDeptDel.Visible := (MainMod.qUsers.FieldByName('ubys_id').AsString <> '');
//  edRole.Visible     := (MainMod.qUsers.FieldByName('ubys_id').AsString <> '');
//  btnDeptAdd.Visible := (MainMod.qUsers.FieldByName('ubys_id').AsString <> '');
end;

procedure TfrmKullaniciTanim.StrToList;
begin
  tblDepts.First;
  while not tblDepts.EOF do tblDepts.Delete;

  if DataDB.FieldByName('list_dept').AsString = '' then Exit;

  QueryOpen(qTmp, ' SELECT dp.id, ' +
  ' (case when coalesce(dp.main_dept_id,0) > 0 then dp.title||'' (''||dp_main.title||'') ''  else dp.title end) title ' +
  ' FROM sys_deptdef dp left join sys_deptdef dp_main on dp_main.id = dp.main_dept_id  ' +
  ' WHERE dp.id in (' + DataDB.FieldByName('list_dept').AsString + ') ' +
                  ' AND dp.mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY dp.id' );

  qTmp.First;
  while not qTmp.EOF do
  begin
    tblDepts.Insert;
    tblDepts.FieldByName('id').AsInteger   := qTmp.FieldByName('id').AsInteger;
    tblDepts.FieldByName('name').AsString  := qTmp.FieldByName('title').AsString;
    tblDepts.Post;

    qTmp.Next;
  end;
end;

procedure TfrmKullaniciTanim.UniFormBeforeShow(Sender: TObject);
begin
  lbIDY.Caption := MainMod.KullaniciGetir(DataDB.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(DataDB.FieldByName('sdy').AsString);
  if DataDB.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', DataDB.FieldByName('idt').AsDateTime);
  if DataDB.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', DataDB.FieldByName('sdt').AsDateTime);

    ldap_aktif := MainMod.GetSysParam(qTmp, 'LDAP AKTÝF') = 'E';
end;

end.
