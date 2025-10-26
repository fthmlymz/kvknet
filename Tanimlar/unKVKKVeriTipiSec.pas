unit unKVKKVeriTipiSec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Data.DB, MemDS, DBAccess, Uni, uniButton, uniBitBtn, uniPanel, uniGUIBaseClasses,
  uniBasicGrid, uniDBGrid, uniEdit, uniMultiItem, uniComboBox;

type
  TfrmKVKKVeriTipiSec = class(TUniForm)
    grdList: TUniDBGrid;
    dsVeriTipi: TUniDataSource;
    qVeriTipi: TUniQuery;
    UniPanel1: TUniPanel;
    btnSelect: TUniBitBtn;
    btnCancel: TUniBitBtn;
    edSrcText: TUniEdit;
    edSrcType: TUniComboBox;
    qTmp: TUniQuery;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure grdListDblClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure edSrcTypeChange(Sender: TObject);
    procedure grdListDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn;
      Attribs: TUniCellAttribs);
  private
    procedure NewSQL;
  public
    GizliKriter : String;
    function Select(AMultiSelect: Boolean = False): Integer;
  end;

function frmKVKKVeriTipiSec: TfrmKVKKVeriTipiSec;

implementation

uses uniGUIApplication, MainModule, McMLib;

{$R *.dfm}

function frmKVKKVeriTipiSec: TfrmKVKKVeriTipiSec;
begin
  Result := TfrmKVKKVeriTipiSec(MainMod.GetFormInstance(TfrmKVKKVeriTipiSec));
end;

procedure TfrmKVKKVeriTipiSec.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmKVKKVeriTipiSec.btnSelectClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmKVKKVeriTipiSec.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrmKVKKVeriTipiSec.edSrcTypeChange(Sender: TObject);
begin
  NewSQL;
end;

procedure TfrmKVKKVeriTipiSec.grdListDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmKVKKVeriTipiSec.grdListDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
  Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if grdList.DataSource.DataSet.FieldByName('nitelik').AsString = 'ON' then
  begin
    Attribs.Font.Style := [fsBold];
    Attribs.Font.Color := clMaroon;
  end;
end;

procedure TfrmKVKKVeriTipiSec.NewSQL;
var
  SQLStr : String;
  SrcText : string;
begin
  if not GuvenliGirisMi(edSrcText.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;

  SQLStr := 'SELECT vt.*, ktg.kategori FROM def_data_veritipi vt LEFT JOIN def_data_kategori ktg ON ktg.id = vt.md_id ' +
            'WHERE vt.mc_id = :mc_id AND ';
  if GizliKriter <> '' then SQLStr := SQLStr + GizliKriter + ' AND ';

  if edSrcType.ItemIndex > 0 then SQLStr := SQLStr + ' ktg.kategori= '+QuotedStr( edSrcType.Text)+ ' AND ' ;

  if edSrcText.Text <> '' then
  begin
    if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
    SQLStr := SQLStr + 'vt.veri_tipi LIKE :SrcText AND '
  end;

	System.Delete(SQLStr, Length(SQLStr) - 3, 4);
  SQLStr := SQLStr + ' ORDER BY vt.veri_tipi';
//  QueryOpen(qVeriTipi, SQLStr);

  qVeriTipi.SQL.Text := SQLStr ;
  qVeriTipi.ParamByName('mc_id').AsString := inttostr(mainmod.MCID);
  if qVeriTipi.FindParam('SrcText') <> nil then
    qVeriTipi.ParamByName('SrcText').AsString := SrcText;
  qVeriTipi.Open;
end;

function TfrmKVKKVeriTipiSec.Select(AMultiSelect: Boolean = False): Integer;
begin
  Result := -1;
  if AMultiSelect then grdList.Options := grdList.Options + [dgMultiSelect, dgCheckSelect, dgDontShowSelected];
  ShowModal;
  if ModalResult = mrOk then Result := grdList.SelectedRows.Count;
  GizliKriter := '';
end;

procedure TfrmKVKKVeriTipiSec.UniFormBeforeShow(Sender: TObject);
begin
  edSrcType.ItemIndex := 0;
  edSrcText.Text := '';
  NewSQL;
  ActiveControl := edSrcText;
end;

procedure TfrmKVKKVeriTipiSec.UniFormCreate(Sender: TObject);
begin
  qTmp.Close;
  qTmp.SQL.Clear;
  qTmp.SQL.Add('SELECT kategori FROM def_data_kategori WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY kategori');
  qTmp.Open;

  edSrcType.Items.Clear;
  edSrcType.Items.Add('TÜM KATEGORÝLER');
  while not qTmp.EOF do
  begin
    edSrcType.Items.Add(qTmp.FieldByName('kategori').AsString);
    qTmp.Next;
  end;
end;

end.
