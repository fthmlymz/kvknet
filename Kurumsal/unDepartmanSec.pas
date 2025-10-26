unit unDepartmanSec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Data.DB, MemDS, DBAccess, Uni, uniButton, uniBitBtn, uniPanel, uniGUIBaseClasses,
  uniBasicGrid, uniDBGrid, uniEdit;

type
  TfrmDepartmanSec = class(TUniForm)
    grdList: TUniDBGrid;
    dsDepts: TUniDataSource;
    qDepts: TUniQuery;
    UniPanel1: TUniPanel;
    btnSelect: TUniBitBtn;
    btnCancel: TUniBitBtn;
    edSrcText: TUniEdit;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure grdListDblClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
  private
    procedure NewSQL;
  public
    GizliKriter : String;
    function Select(AMultiSelect: Boolean = False): Integer;
  end;

function frmDepartmanSec: TfrmDepartmanSec;

implementation

uses uniGUIApplication, MainModule, McMLib;

{$R *.dfm}

function frmDepartmanSec: TfrmDepartmanSec;
begin
  Result := TfrmDepartmanSec(MainMod.GetFormInstance(TfrmDepartmanSec));
end;

procedure TfrmDepartmanSec.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmDepartmanSec.btnSelectClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmDepartmanSec.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrmDepartmanSec.grdListDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmDepartmanSec.NewSQL;
var
  SQLStr : String;
  srctext : string;
begin
 // SQLStr := 'SELECT * FROM sys_deptdef WHERE mc_id =:mc_id AND ';
  sqlstr := ' SELECT ' +
  ' d.*,maind.title as main_dept_str ' +
  ' FROM sys_deptdef d ' +
  ' left join sys_deptdef maind on maind.id=d.main_dept_id ' +
  ' WHERE d.mc_id =:mc_id and ' ;


  if GizliKriter <> '' then SQLStr := SQLStr + GizliKriter + ' AND ';
  if edSrcText.Text <> '' then
  begin
    if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
    SQLStr := SQLStr + 'd.title LIKE :srctext AND ';
  end;

	System.Delete(SQLStr, Length(SQLStr) - 3, 4);
  SQLStr := SQLStr + ' ORDER BY code';
//  QueryOpen(qDepts, SQLStr);
  qDepts.SQL.Text := SQLStr ;
  qDepts.ParamByName('mc_id').AsString := inttostr(MainMod.MCID);
  if qDepts.FindParam('srctext') <> nil then
    qDepts.ParamByName('srctext').AsString := srctext ;
  qDepts.Open;
end;

function TfrmDepartmanSec.Select(AMultiSelect: Boolean = False): Integer;
begin
  Result := -1;
  if AMultiSelect then grdList.Options := grdList.Options + [dgMultiSelect, dgCheckSelect,dgDontShowSelected];
  ShowModal;
  if ModalResult = mrOk then Result := grdList.SelectedRows.Count;
  GizliKriter := '';
end;

procedure TfrmDepartmanSec.UniFormBeforeShow(Sender: TObject);
begin
  edSrcText.Text := '';
  NewSQL;
  ActiveControl := edSrcText;
end;

end.
