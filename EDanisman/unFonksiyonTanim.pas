unit unFonksiyonTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniCheckBox, uniDBCheckBox, uniEdit, uniDBEdit, uniLabel, uniPanel, uniButton,
  uniBitBtn, uniGUIBaseClasses, uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox, Data.DB,
  DBAccess, Uni, MemDS, uniDBText, uniBasicGrid, uniDBGrid;

type
  TfrmFonksiyonTanim = class(TUniForm)
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
    edCode: TUniDBEdit;
    edTitle: TUniDBEdit;
    qFonks: TUniQuery;
    dsFonks: TUniDataSource;
    qTmp: TUniQuery;
    UniLabel9: TUniLabel;
    grdDepts: TUniDBGrid;
    btnFuncEkle: TUniBitBtn;
    BtnFuncSil: TUniBitBtn;
    qDeptFunc: TUniQuery;
    dsDeptFunc: TUniDataSource;
    edActive: TUniDBCheckBox;
    UniLabel3: TUniLabel;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnFuncEkleClick(Sender: TObject);
    procedure BtnFuncSilClick(Sender: TObject);
    procedure qDeptFuncAfterScroll(DataSet: TDataSet);
  private
    Data : TUniQuery;
    depId :integer;
    procedure DelFuncDeptControl(Sender: TComponent; Res: Integer);
  public
    function Edit(aId: Integer): Integer;
    function Insert: Integer;
  end;

function frmFonksiyonTanim: TfrmFonksiyonTanim;

implementation

uses uniGUIApplication, MainModule, McMLib, unDepartmanListe, unFonksiyonSec,
  unDepartmanSec;

{$R *.dfm}

function frmFonksiyonTanim: TfrmFonksiyonTanim;
begin
  Result := TfrmFonksiyonTanim(MainMod.GetFormInstance(TfrmFonksiyonTanim));
end;

procedure TfrmFonksiyonTanim.btnCancelClick(Sender: TObject);
begin
  Data.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmFonksiyonTanim.btnFuncEkleClick(Sender: TObject);
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
    if AQery.FieldByName('dept_id').AsInteger = AID then
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
  ACount := frmDepartmanSec.Select(True);
  if aCount > 0 then
  begin

    for i := 0 to ACount - 1 do
    begin
      frmDepartmanSec.qDepts.GotoBookmark(frmDepartmanSec.grdList.SelectedRows[i]);
      AID   := frmDepartmanSec.qDepts.FieldByName('id').AsInteger;
      AName := frmDepartmanSec.qDepts.FieldByName('title').AsString;
      if frmDepartmanSec.qDepts.FieldByName('main_dept_str').AsString <> '' then
        AName := AName + ' ('+frmDepartmanSec.qDepts.FieldByName('main_dept_str').AsString +')';

      if AID <= 0 then
        continue;
      if not CheckID(AID, qDeptFunc) then
      begin
        qDeptFunc.Insert;
        qDeptFunc.FieldByName('dept_id').AsInteger := aid;
        qDeptFunc.FieldByName('func_id').AsInteger  := Data.FieldByName('id').AsInteger;
        qDeptFunc.FieldByName('id').AsInteger := MainMod.GetSeq('sq_sys_deptfunc_id');
        qDeptFunc.Post;
      end;
    end;
     qDeptFunc.ParamByName('func_id').AsInteger := data.FieldByName('id').asinteger;
    RefreshQuery(qDeptFunc);
  end;


end;

procedure TfrmFonksiyonTanim.BtnFuncSilClick(Sender: TObject);
var
  Msg : String;
begin
  if qdeptfunc.FieldByName('id').AsInteger < 1 then Exit;

  Msg := 'Seçili departmaný çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelFuncDeptControl);
end;

procedure TfrmFonksiyonTanim.btnPostClick(Sender: TObject);
begin
  if Data.FieldByName('function').AsString = '' then
  begin
    MessageDlg('Fonksiyon Adý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edTitle.SetFocus;
    Exit;
  end;

  if data.state in [dsEdit, dsInsert] then
  begin
    if Data.State in [dsInsert] then
    begin
      Data.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_sys_funcdef_id');
      Data.FieldByName('mc_id').AsInteger  := MainMod.MCID;
      Data.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
      Data.FieldByName('idt').AsDateTime   := Now;
      depid :=  Data.FieldByName('id').AsInteger;
      btnFuncEkleClick(btnFuncEkle);
    end;
    Data.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
    Data.FieldByName('sdt').AsDateTime     := Now;
    Data.Post;
  end;

  ModalResult := mrOk;
end;

procedure TfrmFonksiyonTanim.DelFuncDeptControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  qDeptFunc.Delete;
end;

function TfrmFonksiyonTanim.Edit(aId: Integer): Integer;
begin
  Data := qFonks;
  data.Close;
  data.SQL.Text :=  'SELECT d.* '+
							'FROM sys_funcdef d ' +
              'WHERE d.id = ' + IntToStr(aId);
  data.Open;
  if data.fieldbyname('id').AsInteger <> aid then
    exit;

//  if qFonks.FieldByName('id').AsInteger < 10000 then
  if data.fieldbyname('id').AsInteger < 1000 then  
  begin
    MessageDlg('Deðiþtirmek istediðiniz fonksiyon bir sistem fonksiyonu. Bu fonksiyonun adý ve aktifliði deðiþtirilemez, sadece departman atamasý yapýlabilir.', mtError, [mbOk]);
    qFonks.ReadOnly := true;
    dsfonks.AutoEdit := false;
    edActive.ReadOnly := true;
    edTitle.ReadOnly := true;
  end
  else
  begin
    qFonks.ReadOnly := false;
    dsfonks.AutoEdit := true;
    edActive.ReadOnly := false;
    edTitle.ReadOnly := false;
    Data.Edit;
  end;


  ActiveControl := edCode;
  Result := ShowModal;
end;

function TfrmFonksiyonTanim.Insert: Integer;
begin
  Data := qFonks;
  if not Data.Active then Data.Open;
  Data.Insert;
  Data.FieldByName('active').AsString := 'E';
  ActiveControl := edCode;
  Result := ShowModal;
end;

procedure TfrmFonksiyonTanim.qDeptFuncAfterScroll(DataSet: TDataSet);
begin
 btnFuncEkle.Enabled := Data.FieldByName('id').AsInteger>0;
 BtnFuncSil.Enabled := qDeptFunc.RecordCount>0;
end;

procedure TfrmFonksiyonTanim.UniFormBeforeShow(Sender: TObject);
begin
  lbIDY.Caption := MainMod.KullaniciGetir(Data.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(Data.FieldByName('sdy').AsString);
  if Data.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', Data.FieldByName('idt').AsDateTime);
  if Data.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', Data.FieldByName('sdt').AsDateTime);

  qDeptFunc.Close;
  qDeptFunc.SQL.Text := ' SELECT ' +
  ' df.*, ' +
  ' (case when coalesce(dp.main_dept_id,0) > 0 then dp.title||'' (''||dp_main.title||'') '' ' +
  ' else dp.title end)::varchar(450) title ' +
  ' FROM sys_deptfunc df ' +
  ' join	sys_deptdef dp on dp.id = df.dept_id ' +
  ' left join sys_deptdef dp_main on dp_main.id =dp.id ' +
  ' WHERE  df.func_id=:func_id AND dp.mc_id=:mc_id ';


//  qDeptFunc.SQL.Text := 'SELECT df.*, dd.title ' +
//    ' FROM sys_deptfunc df, sys_deptdef dd ' +
//    ' WHERE df.dept_id=dd.id AND df.func_id=:func_id AND dd.mc_id=:mc_id';

  qDeptFunc.ParamByName('func_id').AsInteger := Data.fieldbyname('id').AsInteger;
  qDeptFunc.ParamByName('mc_id').AsInteger := mainmod.mcid;
  qDeptFunc.Open;



  btnFuncEkle.Enabled := MainMod.LoginInfo.Yetkiler[178];
  BtnFuncSil.Enabled  := MainMod.LoginInfo.Yetkiler[178];
end;

end.
