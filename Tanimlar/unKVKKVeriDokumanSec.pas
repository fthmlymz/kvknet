unit unKVKKVeriDokumanSec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Data.DB, MemDS, DBAccess, Uni, uniButton, uniBitBtn, uniPanel, uniGUIBaseClasses,
  uniBasicGrid, uniDBGrid, uniEdit, uniMultiItem, uniComboBox;

type
  TfrmKVKKVeriDokumanSec = class(TUniForm)
    grdList: TUniDBGrid;
    dsDocs: TUniDataSource;
    qDocs: TUniQuery;
    UniPanel1: TUniPanel;
    edSrcType: TUniComboBox;
    edSrcText: TUniEdit;
    btnSelect: TUniBitBtn;
    btnCancel: TUniBitBtn;
    qTmp: TUniQuery;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure grdListDblClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure edSrcTypeChange(Sender: TObject);
  private
    procedure NewSQL;
  public
    GizliKriter : String;
    function Select(AMultiSelect: Boolean = False): Integer;
  end;

function frmKVKKVeriDokumanSec: TfrmKVKKVeriDokumanSec;

implementation

uses uniGUIApplication, MainModule, McMLib;

{$R *.dfm}

function frmKVKKVeriDokumanSec: TfrmKVKKVeriDokumanSec;
begin
  Result := TfrmKVKKVeriDokumanSec(MainMod.GetFormInstance(TfrmKVKKVeriDokumanSec));
end;

procedure TfrmKVKKVeriDokumanSec.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmKVKKVeriDokumanSec.btnSelectClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmKVKKVeriDokumanSec.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrmKVKKVeriDokumanSec.edSrcTypeChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrmKVKKVeriDokumanSec.grdListDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmKVKKVeriDokumanSec.NewSQL;
var
  SQLStr : String;
  SrcText : string;
begin
  if not GuvenliGirisMi(edSrcText.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;

  SQLStr := 'SELECT doc.* FROM def_data_dokuman doc LEFT JOIN def_data_dokumantip dm ON dm.id = doc.md_id ' +
            'WHERE doc.mc_id =:mc_id AND ';
  if GizliKriter <> '' then SQLStr := SQLStr + GizliKriter + ' AND ';
  if edSrcText.Text <> '' then
  begin
    if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
    if edSrcType.ItemIndex > 0 then
      SQLStr := SQLStr + 'dm.dokumantip like :SrcText AND '
    else
      SQLStr := SQLStr + 'doc.dokuman LIKE :SrcText AND ';
  end;

	System.Delete(SQLStr, Length(SQLStr) - 3, 4);
  SQLStr := SQLStr + ' ORDER BY doc.dokuman';
//  QueryOpen(qDocs, SQLStr);

  qDocs.SQL.Text := SQLStr ;
  qDocs.ParamByName('mc_id').AsString := inttostr(mainmod.MCID);
  if qDocs.FindParam('SrcText') <> nil then
    qDocs.ParamByName('SrcText').AsString := SrcText;
  qDocs.Open;
end;

function TfrmKVKKVeriDokumanSec.Select(AMultiSelect: Boolean = False): Integer;
begin
  Result := -1;
  if AMultiSelect then grdList.Options := grdList.Options + [dgMultiSelect, dgCheckSelect];
  ShowModal;
  if ModalResult = mrOk then Result := grdList.SelectedRows.Count;
  GizliKriter := '';
end;

procedure TfrmKVKKVeriDokumanSec.UniFormBeforeShow(Sender: TObject);
begin
  edSrcType.ItemIndex := 0;
  edSrcText.Text := '';
  NewSQL;
  ActiveControl := edSrcText;
end;

procedure TfrmKVKKVeriDokumanSec.UniFormCreate(Sender: TObject);
begin
  QueryOpen(qTmp, 'SELECT dokumantip FROM def_data_dokumantip WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY dokumantip');

  edSrcType.Items.Clear;
  edSrcType.Items.Add('TÜM DOKÜMANLAR');
  while not qTmp.EOF do
  begin
    edSrcType.Items.Add(qTmp.FieldByName('dokumantip').AsString);
    qTmp.Next;
  end;
end;

end.
