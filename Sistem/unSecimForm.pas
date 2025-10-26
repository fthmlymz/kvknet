unit unSecimForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, MemDS, Uni, uniButton, uniBitBtn, uniPanel, uniGUIBaseClasses,
  uniBasicGrid, uniDBGrid, uniEdit, uniMultiItem, uniComboBox, VirtualTable,
  uniLabel, Data.DB, DBAccess;

type
  TfrmSecimForm = class(TUniForm)
    grdList: TUniDBGrid;
    UniPanel1: TUniPanel;
    btnSelect: TUniBitBtn;
    btnCancel: TUniBitBtn;
    hpnlFiltre: TUniHiddenPanel;
    fltrId: TUniEdit;
    fltrValue: TUniEdit;
    vtList: TVirtualTable;
    lbMesaj: TUniLabel;
    dsList: TUniDataSource;
    qList: TUniQuery;
    procedure grdListDblClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure grdListColumnFilter(Sender: TUniDBGrid;
      const Column: TUniDBGridColumn; const Value: Variant);
    procedure grdListColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure grdListMultiColumnSort(Columns: TUniDBGridColumnArr;
      Directions: TUniSortDirections);
    procedure grdListAfterLoad(Sender: TUniCustomDBGrid);
  private
  public
    GizliKriter : String;
    function Select(aMesaj, aBaslik, aKeyField, aKeyTitle, aValueField, aValueTitle, aSql: String; AMultiSelect: Boolean = False): Integer; overload;
  end;

function frmSecimForm: TfrmSecimForm;

implementation

uses uniGUIApplication, MainModule, McMLib, unHelpPage,Main;

{$R *.dfm}

function frmSecimForm: TfrmSecimForm;
begin
  Result := TfrmSecimForm(MainMod.GetFormInstance(TfrmSecimForm));
end;

procedure TfrmSecimForm.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSecimForm.btnSelectClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSecimForm.grdListAfterLoad(Sender: TUniCustomDBGrid);
begin
  grdlist.JSInterface.JSCallDefer('getSelectionModel().deselectAll', [5, false, false], 1);
end;

procedure TfrmSecimForm.grdListColumnFilter(Sender: TUniDBGrid;
  const Column: TUniDBGridColumn; const Value: Variant);
var
  fltrstr: string;
begin
  fltrstr := '';

  if length(fltrId.Text) > 1 then
    fltrStr := fltrstr + grdList.Columns[0].FieldName + ' LIKE ' + QuotedStr('%' +(TR_Upper(fltrId.Text))+ '%') + ' AND ';

  if length(fltrValue.Text) > 3 then
    fltrStr := fltrstr + grdList.Columns[1].FieldName + ' LIKE ' + QuotedStr('%' +(TR_Upper(fltrValue.Text))+ '%') + ' AND ';

  grdList.DataSource.DataSet.Filtered := false;
  if fltrstr <> '' then
  begin
    grdList.DataSource.DataSet.Filter := copy(fltrstr, 1, length(fltrstr)-4);
    grdList.DataSource.DataSet.Filtered := True;
  end
  else
    grdList.DataSource.DataSet.Filtered := false;
end;

procedure TfrmSecimForm.grdListColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
begin
  if not Column.Sortable then Exit;

  if Direction then
    qList.IndexFieldNames := '"' + Column.FieldName + '" ASC'
  else
    qList.IndexFieldNames := '"' + Column.FieldName + '" DESC';
end;

procedure TfrmSecimForm.grdListDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSecimForm.grdListMultiColumnSort(Columns: TUniDBGridColumnArr;
  Directions: TUniSortDirections);
begin
//
end;

//function Select(aMesaj, aBaslik: string; aKeyField, aKeyTitle, aValueField, aValueTitle, aSql: String; AMultiSelect: Boolean = False): Integer; overload;

function TfrmSecimForm.Select(aMesaj, aBaslik,  aKeyField, aKeyTitle, aValueField, aValueTitle, aSql: String; AMultiSelect: Boolean = False): Integer;
var
  i: Integer;
begin
  Result := -1;

  Caption := aBaslik;
  lbMesaj.Caption := aMesaj;

  dsList.DataSet := qList;
  grdList.Columns[0].FieldName := aKeyField;
  grdList.Columns[0].Title.Caption := aKeyTitle;
  grdList.Columns[1].FieldName := aValueField;
  grdList.Columns[1].Title.Caption := aValueTitle;
  QueryOpen(qList, aSql);

  if AMultiSelect then grdList.Options := grdList.Options + [dgMultiSelect, dgCheckSelect];
  ShowModal;
  if ModalResult = mrOk then Result := grdList.SelectedRows.Count;
  GizliKriter := '';
end;
end.
