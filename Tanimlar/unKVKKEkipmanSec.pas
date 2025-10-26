unit unKVKKEkipmanSec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Data.DB, MemDS, DBAccess, Uni, uniButton, uniBitBtn, uniPanel, uniGUIBaseClasses,
  uniBasicGrid, uniDBGrid, uniEdit;

type
  TfrmKVKKEkipmanSec = class(TUniForm)
    grdList: TUniDBGrid;
    dsEkipman: TUniDataSource;
    qEkipman: TUniQuery;
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

function frmKVKKEkipmanSec: TfrmKVKKEkipmanSec;

implementation

uses uniGUIApplication, MainModule, McMLib;

{$R *.dfm}

function frmKVKKEkipmanSec: TfrmKVKKEkipmanSec;
begin
  Result := TfrmKVKKEkipmanSec(MainMod.GetFormInstance(TfrmKVKKEkipmanSec));
end;

procedure TfrmKVKKEkipmanSec.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmKVKKEkipmanSec.btnSelectClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmKVKKEkipmanSec.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrmKVKKEkipmanSec.grdListDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmKVKKEkipmanSec.NewSQL;
var
  SQLStr : String;
  SrcText : String;
begin
  if not GuvenliGirisMi(edSrcText.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;

  SQLStr := 'SELECT * FROM def_data_ekipman WHERE durumu <> ''KULLANILMIYOR'' AND mc_id =:mc_id AND ';
  if GizliKriter <> '' then SQLStr := SQLStr + GizliKriter + ' AND ';
  if edSrcText.Text <> '' then
  begin
    if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
   SQLStr := SQLStr + 'ekipman LIKE :SrcText AND ';
  end;

	System.Delete(SQLStr, Length(SQLStr) - 3, 4);
  SQLStr := SQLStr + ' ORDER BY ekipman';
//  QueryOpen(qEkipman, SQLStr);
  qEkipman.SQL.Text := SQLStr ;
  qEkipman.ParamByName('mc_id').AsString := inttostr(mainmod.MCID);
  if qEkipman.FindParam('SrcText') <> nil then
    qEkipman.ParamByName('SrcText').AsString := SrcText ;
  qEkipman.Open;
end;

function TfrmKVKKEkipmanSec.Select(AMultiSelect: Boolean = False): Integer;
begin
  Result := -1;
  if AMultiSelect then grdList.Options := grdList.Options + [dgMultiSelect, dgCheckSelect, dgDontShowSelected];
  ShowModal;
  if ModalResult = mrOk then Result := grdList.SelectedRows.Count;
  GizliKriter := '';
end;

procedure TfrmKVKKEkipmanSec.UniFormBeforeShow(Sender: TObject);
begin
  edSrcText.Text := '';
  NewSQL;
  ActiveControl := edSrcText;
end;

end.
