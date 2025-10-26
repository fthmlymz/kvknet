unit unFirmaSec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Data.DB, DBAccess, Uni, uniBasicGrid, uniDBGrid, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniPanel;

type
  TfrmFirmaSec = class(TUniForm)
    UniContainerPanel4: TUniContainerPanel;
    btnSelect: TUniBitBtn;
    grdMCList: TUniDBGrid;
    dsGCDef: TUniDataSource;
    btnCancel: TUniBitBtn;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure grdMCListDblClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
  public
    GizliKriter : String;
    function Select: Integer;
  end;

function frmFirmaSec: TfrmFirmaSec;

implementation

uses uniGUIApplication, MainModule, McMLib;

{$R *.dfm}

function frmFirmaSec: TfrmFirmaSec;
begin
  Result := TfrmFirmaSec(MainMod.GetFormInstance(TfrmFirmaSec));
end;

{ TfrmFirmaSec }

procedure TfrmFirmaSec.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmFirmaSec.btnSelectClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

function TfrmFirmaSec.Select: Integer;
begin
  Result := -1;
  ShowModal;
  if ModalResult = mrOk then
  begin
    MainMod.MCID    := MainMod.qMCDef.FieldByName('id').AsInteger;
    MainMod.MCCode  := MainMod.qMCDef.FieldByName('code').AsString;
    MainMod.MCTitle := MainMod.qMCDef.FieldByName('title').AsString;

    QueryPrep(MainMod.qMCParam,'SELECT * FROM sys_param_mc WHERE mc_id = :mc_id');
    MainMod.qMCParam.ParamByName('mc_id').AsInteger := MainMod.MCID;
    MainMod.qMCParam.Open;
    //-added by tevfik 20230131
    QueryPrep(MainMod.qMCDef,'SELECT * FROM sys_mcdef WHERE id=:mc_id');
    MainMod.qMCDef.ParamByName('mc_id').AsInteger := MainMod.MCID;
    MainMod.qMCDef.Open;

    QueryPrep(MainMod.qDept,'SELECT d.*, m.full_name as man_name, m.email,' +
    'm.phone FROM sys_deptdef d, usr_user m WHERE m.id = d.manager and ' +
    'd.mc_id=:mc_id');
    MainMod.qDept.ParamByName('mc_id').AsInteger := MainMod.MCID;
    MainMod.qDept.Open;
    //-added by tevfik 20230131

    MainMod.IYSVar := (MainMod.qMCParam.FieldByName('iys_aktif').AsString = 'E');
    MainMod.zd_usr := MainMod.qMCParam.FieldByName('zd_username').AsString;
    MainMod.zd_pwd := MainMod.qMCParam.FieldByName('zd_password').AsString;
    if MainMod.zd_pwd <> '' then
      MainMod.zd_pwd := DecryptStr(MainMod.zd_pwd);

    Result := MainMod.MCID;
  end;
  GizliKriter := '';
end;

procedure TfrmFirmaSec.UniFormBeforeShow(Sender: TObject);
var
  SQLStr : String;
begin
  SQLStr := 'SELECT * FROM sys_mcdef WHERE gc_id = ' + IntToStr(MainMod.GCID);
  if GizliKriter <> '' then SQLStr := SQLStr + ' AND ' + GizliKriter;
  SQLStr := SQLStr + ' ORDER BY code';
  QueryOpen(MainMod.qMCDef, SQLStr);
  ActiveControl := grdMCList;
end;

procedure TfrmFirmaSec.grdMCListDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
