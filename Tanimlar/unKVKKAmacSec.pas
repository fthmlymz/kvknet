unit unKVKKAmacSec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Data.DB, MemDS, DBAccess, Uni, uniButton, uniBitBtn, uniPanel, uniGUIBaseClasses,
  uniBasicGrid, uniDBGrid, uniEdit;

type
  TfrmKVKKAmacSec = class(TUniForm)
    grdList: TUniDBGrid;
    dsAmac: TUniDataSource;
    qAmac: TUniQuery;
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

function frmKVKKAmacSec: TfrmKVKKAmacSec;

implementation

uses uniGUIApplication, MainModule, McMLib;

{$R *.dfm}

function frmKVKKAmacSec: TfrmKVKKAmacSec;
begin
  Result := TfrmKVKKAmacSec(MainMod.GetFormInstance(TfrmKVKKAmacSec));
end;

procedure TfrmKVKKAmacSec.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmKVKKAmacSec.btnSelectClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmKVKKAmacSec.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrmKVKKAmacSec.grdListDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmKVKKAmacSec.NewSQL;
var
  SQLStr : String;
  srctext : string;
begin

  if not GuvenliGirisMi(edSrcText.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;

  SQLStr := 'SELECT * FROM def_data_amac WHERE mc_id =:mc_id AND ';
  if GizliKriter <> '' then SQLStr := SQLStr + GizliKriter + ' AND ';
  if edSrcText.Text <> '' then
  begin
  if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
   SQLStr := SQLStr + 'amac LIKE :srctext AND ';
  end;

	System.Delete(SQLStr, Length(SQLStr) - 3, 4);
  SQLStr := SQLStr + ' ORDER BY amac';
//  QueryOpen(qAmac, SQLStr);
  qAmac.SQL.Text := SQLStr;
  qAmac.ParamByName('mc_id').AsString := inttostr(mainmod.MCID);
  if qAmac.FindParam('srctext') <> nil then
    qAmac.ParamByName('srctext').AsString := srctext;

  qAmac.Open;
end;

function TfrmKVKKAmacSec.Select(AMultiSelect: Boolean = False): Integer;
begin
  Result := -1;
  if AMultiSelect then grdList.Options := grdList.Options + [dgMultiSelect, dgCheckSelect, dgDontShowSelected];
  ShowModal;
  if ModalResult = mrOk then Result := grdList.SelectedRows.Count;
  GizliKriter := '';
end;

procedure TfrmKVKKAmacSec.UniFormBeforeShow(Sender: TObject);
begin
  edSrcText.Text := '';
  NewSQL;
  ActiveControl := edSrcText;
end;

end.
