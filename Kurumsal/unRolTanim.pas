unit unRolTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Uni,
  uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniPanel, uniButton, uniBitBtn, uniGUIBaseClasses, uniEdit, uniDBEdit,
  Data.DB, DBAccess, uniBasicGrid, uniDBGrid, uniDBTreeGrid, MemDS, VirtualTable, uniImage,
  System.Actions, Vcl.ActnList;

type
  TfrmRolTanim = class(TUniForm)
    pnlData: TUniPanel;
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
    UniLabel2: TUniLabel;
    edRole: TUniDBEdit;
    dsRole: TUniDataSource;
    grdPerms: TUniDBTreeGrid;
    UniLabel1: TUniLabel;
    qPerms: TUniQuery;
    dsPerms: TUniDataSource;
    qTmp: TUniQuery;
    tblPerms: TVirtualTable;
    qPermsid: TIntegerField;
    qPermsparent_id: TIntegerField;
    qPermsperm_id: TIntegerField;
    qPermsperm_data: TStringField;
    imgGrant: TUniImage;
    imgReject: TUniImage;
    qPermsperm_type: TStringField;
    qPermsperm_def: TStringField;
    qPermsperm_note: TStringField;
    btnHelp: TUniBitBtn;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure qPermsCalcFields(DataSet: TDataSet);
    procedure grdPermsFieldImage(const Column: TUniDBGridColumn; const AField: TField; var OutImage: TGraphic;
      var DoNotDispose: Boolean; var ATransparent: TUniTransparentOption);
    procedure grdPermsAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure grdPermsDblClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    YardimKw : string;
    AllPerms    : String;
    oldPerms : string;
    Data : TUniQuery;
    procedure Grid2Perms;
    procedure Perms2Grid;
    procedure lockUser(AuserId: integer; amsg: string);
  public
    function Edit: Integer;
    function Insert: Integer;
  end;

function frmRolTanim: TfrmRolTanim;

implementation

uses uniGUIApplication,ServerModule, MainModule, McMLib, unRolListe, unHelpPage;

{$R *.dfm}

function frmRolTanim: TfrmRolTanim;
begin
  Result := TfrmRolTanim(MainMod.GetFormInstance(TfrmRolTanim));
end;

procedure TfrmRolTanim.btnCancelClick(Sender: TObject);
begin
  Data.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmRolTanim.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmRolTanim.btnPostClick(Sender: TObject);
var
  i   : Integer;
  Tmp : String;
  Astate : TDataSetState;
begin
  Astate := data.State;
  if Data.FieldByName('rol').AsString = '' then
  begin
    MessageDlg('Rol Adý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edRole.SetFocus;
    Exit;
  end;

  AllPerms := '';
  for i := 1 to 10000 do AllPerms := AllPerms + '0';

  Grid2Perms;
  Tmp := Copy(AllPerms, 1, 1000);
  MainMod.qRole.FieldByName('perms_01').AsString := EncryptStr(Tmp);
  Tmp := Copy(AllPerms, 1001, 1000);
  MainMod.qRole.FieldByName('perms_02').AsString := EncryptStr(Tmp);
  Tmp := Copy(AllPerms, 2001, 1000);
  MainMod.qRole.FieldByName('perms_03').AsString := EncryptStr(Tmp);
  Tmp := Copy(AllPerms, 3001, 1000);
  MainMod.qRole.FieldByName('perms_04').AsString := EncryptStr(Tmp);
  Tmp := Copy(AllPerms, 4001, 1000);
  MainMod.qRole.FieldByName('perms_05').AsString := EncryptStr(Tmp);
  Tmp := Copy(AllPerms, 5001, 1000);
  MainMod.qRole.FieldByName('perms_06').AsString := EncryptStr(Tmp);
  Tmp := Copy(AllPerms, 6001, 1000);
  MainMod.qRole.FieldByName('perms_07').AsString := EncryptStr(Tmp);
  Tmp := Copy(AllPerms, 7001, 1000);
  MainMod.qRole.FieldByName('perms_08').AsString := EncryptStr(Tmp);
  Tmp := Copy(AllPerms, 8001, 1000);
  MainMod.qRole.FieldByName('perms_09').AsString := EncryptStr(Tmp);
  Tmp := Copy(AllPerms, 9001, 1000);
  MainMod.qRole.FieldByName('perms_10').AsString := EncryptStr(Tmp);

  if Data.State in [dsInsert] then
  begin
    Data.FieldByName('gc_id').AsInteger  := MainMod.GCID;
    if MainMod.MCType = 0
       then Data.FieldByName('mc_id').AsInteger  := 0
       else Data.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    Data.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    Data.FieldByName('idt').AsDateTime   := Now;
  end;
  Data.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  Data.FieldByName('sdt').AsDateTime     := Now;

  if Astate in [dsEdit]  then
  begin

    if oldPerms <> Data2Perm(MainMod.qRole)   then
    begin
      QueryOpen(qTmp,' select id from usr_user where mc_id=4 and rol ='+
        QuotedStr(Data.FieldByName('rol').AsString) +' and active = ''E'' ' );
        qTmp.First;
      while not qTmp.Eof do
      begin
      lockUser(qTmp.FieldByName('id').AsInteger, 'Rol yetkileri deðiþmiþtir. Sisteme tekrar giriþ yapýnýz.');
      qTmp.Next;
      end;
    end;

  end;

  Data.Post;
  ModalResult := mrOk;
end;

function TfrmRolTanim.Edit: Integer;
begin
  Data := MainMod.qRole;
  Data.Edit;
  ActiveControl := edRole;
  AllPerms := Data2Perm(MainMod.qRole);
  oldPerms := AllPerms;
  Perms2Grid;
  YardimKw := 'RolTanimDegistirme';
  Result := ShowModal;
end;

procedure TfrmRolTanim.lockUser(AuserId:integer; amsg:string);
var
  TargetUser: string;
begin
  TargetUser := inttostr(AuserId);// edtTargetUser.Text;
  if TargetUser <> '' then
  begin
    ServerMod.exitUser(TargetUser, amsg);
  end;
end;


procedure TfrmRolTanim.grdPermsAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
var
  PrmStr : String;
begin
  inherited;
  if SameText(EventName, '_myKeyEvent') then
  begin
    if tblPerms.FieldByName('perm_id').AsInteger = 0 then Exit;

    PrmStr := tblPerms.FieldByName('perm_data').AsString;
    if PrmStr = '0' then PrmStr := '1'
     else if PrmStr = '1' then PrmStr := '0';

    tblPerms.Edit;
    tblPerms.FieldByName('perm_data').AsString := PrmStr;
    tblPerms.Post;
  end;
end;

procedure TfrmRolTanim.grdPermsDblClick(Sender: TObject);
var
  PrmStr : String;
begin
  if tblPerms.FieldByName('perm_id').AsInteger < 0 then Exit;

  PrmStr := tblPerms.FieldByName('perm_data').AsString;
  if PrmStr = '0' then PrmStr := '1'
    else if PrmStr = '1' then PrmStr := '0';

  tblPerms.Edit;
  tblPerms.FieldByName('perm_data').AsString := PrmStr;
  tblPerms.Post;
end;

procedure TfrmRolTanim.grdPermsFieldImage(const Column: TUniDBGridColumn; const AField: TField;
  var OutImage: TGraphic; var DoNotDispose: Boolean; var ATransparent: TUniTransparentOption);
begin
  if SameText(AField.FieldName, 'perm_data') then
  begin
    DoNotDispose := True; // we provide an static image so do not free it.
    if AField.AsString = '0' then OutImage := imgReject.Picture.Graphic
    else if AField.AsString = '1' then OutImage := imgGrant.Picture.Graphic;
  end;
end;

procedure TfrmRolTanim.Grid2Perms;
var
  MyBook : TBookmark;
  PrmPos : Integer;
begin
  MyBook := tblPerms.GetBookmark;
  tblPerms.DisableControls;
  tblPerms.First;
  while not tblPerms.EOF do
  begin
    PrmPos := tblPerms.FieldByName('perm_id').AsInteger;
    if PrmPos > 0 then AllPerms[PrmPos] := tblPerms.FieldByName('perm_data').AsString[1];
    tblPerms.Next;
  end;

  tblPerms.GotoBookmark(MyBook);
  tblPerms.FreeBookmark(MyBook);
  tblPerms.EnableControls;
end;

function TfrmRolTanim.Insert: Integer;
begin
  Data := MainMod.qRole;
  Data.Insert;
  ActiveControl := edRole;
  AllPerms := Data2Perm(MainMod.qRole);
  Perms2Grid;
  YardimKw := 'RolTanimYeniKayit';
  Result := ShowModal;
end;

procedure TfrmRolTanim.Perms2Grid;
var
  MyBook : TBookmark;
  i      : Integer;
begin
  MyBook := tblPerms.GetBookmark;
  tblPerms.DisableControls;
  tblPerms.First;

  AllPerms := Data2Perm(MainMod.qRole);
  if AllPerms = '' then
     for i := 1 to 10000 do AllPerms := AllPerms + '0';

  while not tblPerms.EOF do
  begin
    if tblPerms.FieldByName('perm_id').AsInteger > 0 then
    begin
      tblPerms.Edit;
      tblPerms.FieldByName('perm_data').AsString := AllPerms[tblPerms.FieldByName('perm_id').AsInteger];
      tblPerms.Post;
    end;
    tblPerms.Next;
  end;

  tblPerms.GotoBookmark(MyBook);
  tblPerms.FreeBookmark(MyBook);
  tblPerms.EnableControls;
end;

procedure TfrmRolTanim.qPermsCalcFields(DataSet: TDataSet);
begin
  qPerms.FieldByName('perm_data').AsString := '';
end;

procedure TfrmRolTanim.UniFormBeforeShow(Sender: TObject);
begin
  grdPerms.FullExpand;
  lbIDY.Caption := MainMod.KullaniciGetir(Data.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(Data.FieldByName('sdy').AsString);
  if Data.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', Data.FieldByName('idt').AsDateTime);
  if Data.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', Data.FieldByName('sdt').AsDateTime);
end;

procedure TfrmRolTanim.UniFormCreate(Sender: TObject);
begin
  qPerms.Open;
  tblPerms.Assign(qPerms);
  tblPerms.Open;
  dsPerms.DataSet := tblPerms;
end;

end.
