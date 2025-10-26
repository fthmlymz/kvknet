unit unDepartmanTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniCheckBox, uniDBCheckBox, uniEdit, uniDBEdit, uniLabel, uniPanel, uniButton,
  uniBitBtn, uniGUIBaseClasses, uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox, Data.DB,
  DBAccess, Uni, MemDS, uniDBText, uniBasicGrid, uniDBGrid, uniMemo;

type
  TfrmDepartmanTanim = class(TUniForm)
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
    pnlData: TUniPanel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    edCode: TUniDBEdit;
    edTitle: TUniDBEdit;
    edActive: TUniDBCheckBox;
    UniLabel8: TUniLabel;
    edManager: TUniDBLookupComboBox;
    qUsers: TUniQuery;
    dsDept: TUniDataSource;
    dsUsers: TUniDataSource;
    qTmp: TUniQuery;
    UniLabel9: TUniLabel;
    grdDepts: TUniDBGrid;
    btnFuncEkle: TUniBitBtn;
    BtnFuncSil: TUniBitBtn;
    qFunc: TUniQuery;
    dsFunc: TUniDataSource;
    btnHelp: TUniBitBtn;
    edUbysDept: TUniDBNumberEdit;
    lbUBYS: TUniLabel;
    UniLabel10: TUniLabel;
    UniDBLookupComboBox1: TUniDBLookupComboBox;
    qmainDept: TUniQuery;
    dsmaindept: TUniDataSource;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnFuncEkleClick(Sender: TObject);
    procedure BtnFuncSilClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    YardimKw : string;
    Data : TUniQuery;
    aktifDurum: string;
    procedure DelFuncControl(Sender: TComponent; Res: Integer);
  public
    function Edit: Integer;
    function Insert: Integer;
  end;

function frmDepartmanTanim: TfrmDepartmanTanim;

implementation

uses uniGUIApplication, MainModule, McMLib, unDepartmanListe, unFonksiyonSec,
     unHelpPage,unDepartmanSec;

{$R *.dfm}

function frmDepartmanTanim: TfrmDepartmanTanim;
begin
  Result := TfrmDepartmanTanim(MainMod.GetFormInstance(TfrmDepartmanTanim));
end;

procedure TfrmDepartmanTanim.btnCancelClick(Sender: TObject);
begin
  Data.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmDepartmanTanim.btnFuncEkleClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID   : Integer;
  AName : String;
  IDList : String;
function CheckID(AID: Integer; AQery: TUniQuery): Boolean;
begin
  Result := False;
  AQery.First;
  while not AQery.EOF do
  begin
    if AQery.FieldByName('func_id').AsInteger = AID then
    begin
      Result := True;
      Break;
    end;
    AQery.Next;
  end;
end;
begin
//  IDList := MainMod.MakeIDList(tblAmacTop);
//  frmKVKKAmacSec.GizliKriter := 'id NOT IN (' + IDList + ') AND toplama = ''E''';
  ACount := frmFonksiyonSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmFonksiyonSec.qFonksiyon.GotoBookmark(frmFonksiyonSec.grdList.SelectedRows[i]);
    AID   := frmFonksiyonSec.qFonksiyon.FieldByName('id').AsInteger;
    AName := frmFonksiyonSec.qFonksiyon.FieldByName('function').AsString;

    if AID <= 0 then
      continue;
    if not CheckID(AID, qFunc) then
    begin
      qFunc.Insert;
      qFunc.FieldByName('func_id').AsInteger  := AID;
      qFunc.FieldByName('dept_id').AsInteger := MainMod.qDept.FieldByName('id').AsInteger;
      qFunc.FieldByName('id').AsInteger := MainMod.GetSeq('sq_sys_deptfunc_id');
      qFunc.Post;
    end;
  end;
  RefreshQuery(qFunc);
end;

procedure TfrmDepartmanTanim.BtnFuncSilClick(Sender: TObject);
var
  Msg : String;
begin
  if qfunc.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Seçili fonksiyonu çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelFuncControl);
end;

procedure TfrmDepartmanTanim.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmDepartmanTanim.btnPostClick(Sender: TObject);
begin
  if Data.FieldByName('code').AsString = '' then
  begin
    MessageDlg('Departman Kodu belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edCode.SetFocus;
    Exit;
  end;
  if Data.FieldByName('title').AsString = '' then
  begin
    MessageDlg('Departman Adý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edTitle.SetFocus;
    Exit;
  end;
  if Data.FieldByName('active').AsString = '' then
  begin
    MessageDlg('Departman Durumu belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edActive.SetFocus;
    Exit;
  end;
  if Data.FieldByName('manager').AsInteger < 1 then
  begin
    MessageDlg('Departman Yöneticisi seçilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edManager.SetFocus;
    Exit;
  end;

  if (aktifdurum = 'E') and (data.fieldbyname('active').AsString = 'H') then
  begin
    QueryOpen(MainMod.qTmp, 'SELECT COUNT(id) FROM data_envanter WHERE active=''E'' AND mc_id = ' + IntToStr(MainMod.MCID) + ' AND dept_id=' + data.fieldbyname('id').AsString);
    if MainMod.qTmp.Fields[0].AsInteger > 0 then
    begin
      MessageDlg('Bu departmanda tanýmlý aktif envanter kayýtlarý mevcuttur. Önce aktif envanerleri PASÝF''e çekmelisiniz.', mtError, [mbOk]);
      Exit;
    end;
  end;

  QueryOpen(MainMod.qTmp, 'SELECT COUNT(id) FROM sys_deptdef WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' AND id<>' + IntToStr(data.fieldbyname('id').AsInteger) + ' AND title=''' + data.fieldbyname('title').AsString + '''');
  if data.State in [dsInsert] then   //Doðan akçay Ayni title sahip iki kayýtta hiçbir deðiþiklik yapýlmýyordu. Ýlk kayýtta giriþi enegeli diðer durumlarda engel kaldýrýldý.
  if MainMod.qTmp.Fields[0].AsInteger > 0 then
  begin
    MessageDlg('Bu ad ile farklý bir departman kaydý bulunmaktadýr.', mtError, [mbOk]);
    Exit;
  end;
  QueryOpen(MainMod.qTmp, 'SELECT COUNT(id) FROM sys_deptdef WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' AND id<>' + IntToStr(data.fieldbyname('id').AsInteger) + ' AND code=''' + data.fieldbyname('code').AsString + '''');
  if MainMod.qTmp.Fields[0].AsInteger > 0 then
  begin
    MessageDlg('Bu kod ile farklý bir departman kaydý bulunmaktadýr.', mtError, [mbOk]);
    Exit;
  end;

  if StrToIntDef(data.fieldbyname('main_dept_id').AsString,0) > 0 then
  begin
    QueryOpen(mainmod.qTmp,
    ' SELECT id top FROM sys_deptdef  WHERE main_dept_id =' + data.fieldbyname('id').AsString );
    if  not mainmod.qTmp.IsEmpty then
    begin
      MessageDlg(
        'Departman, zaten bir üst departman olarak tanýmlanmýþ.' + sLineBreak +
        'Bir üst departmana baþka bir üst departman atanamaz.',
        mtError, [mbOk]  );
      Exit;
    end;

  end;


  if Data.State in [dsInsert] then
  begin

    Data.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    Data.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    Data.FieldByName('idt').AsDateTime   := Now;
  end;
//  Data.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
//  Data.FieldByName('sdt').AsDateTime     := Now;
  Data.Post;

  if Data.FieldByName('active').AsString <> 'E' then
  begin
    MessageDlg('DÝKKAT..! Departman bilgisini PASÝF yaptýnýz. Bu departmana baðlý ÜNVANLARI da PASÝF yapmayý unutmayýnýz.', mtWarning, [mbOk]);
  end;

  ModalResult := mrOk;
end;

procedure TfrmDepartmanTanim.DelFuncControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  qFunc.Delete;
end;

function TfrmDepartmanTanim.Edit: Integer;
begin
  QueryOpen(qUsers, 'SELECT * FROM usr_user WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY full_name');

  Data := MainMod.qDept;
  if not Data.Active then Data.Open;
    QueryOpen(qmainDept,
    ' SELECT id, title FROM sys_deptdef WHERE id <> ' + data.FieldByName('id').AsString + ' and ' +
    ' mc_id ='+ inttostr(mainmod.MCID) +
    ' AND   active = ''E'' and coalesce(main_dept_id,0) < 1 ' +
    ' order by title ' );

  Data.Edit;

  ActiveControl := edCode;
  aktifdurum := data.fieldbyname('active').AsString;
  YardimKw := 'DepartmanTanimDegistirme';
  Result := ShowModal;
end;

function TfrmDepartmanTanim.Insert: Integer;
begin
  QueryOpen(qUsers, 'SELECT * FROM usr_user WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY full_name');
  Data := MainMod.qDept;

  QueryOpen(qmainDept,
    ' SELECT id, title FROM sys_deptdef WHERE  ' +
    ' mc_id ='+ inttostr(mainmod.MCID) +
    ' AND   active = ''E'' and coalesce(main_dept_id,0) < 1 ' +
    ' order by title ' );

  if not Data.Active then Data.Open;
  Data.Insert;
  Data.FieldByName('active').AsString := 'E';
  Data.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_sys_deptdef_id');
  ActiveControl := edCode;
  YardimKw := 'DepartmanTanimYeniKayit';
  Result := ShowModal;
end;

procedure TfrmDepartmanTanim.UniFormBeforeShow(Sender: TObject);
begin
  lbUBYS.Visible     := MainMod.UBYSActive;
  edUbysDept.Visible := MainMod.UBYSActive;
  lbIDY.Caption      := MainMod.KullaniciGetir(Data.FieldByName('idy').AsString);
  lbSDY.Caption      := MainMod.KullaniciGetir(Data.FieldByName('sdy').AsString);
  if Data.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', Data.FieldByName('idt').AsDateTime);
  if Data.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', Data.FieldByName('sdt').AsDateTime);

  qFunc.Close;
  qFunc.ParamByName('dept_id').AsInteger := Mainmod.qDept.FieldByName('id').AsInteger;
  qFunc.Open;
end;

end.
