unit unFonksiyonSec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Data.DB, MemDS, DBAccess, Uni, uniButton, uniBitBtn, uniPanel, uniGUIBaseClasses,
  uniBasicGrid, uniDBGrid, uniEdit;

type
  TfrmFonksiyonSec = class(TUniForm)
    grdList: TUniDBGrid;
    dsFonksiyon: TUniDataSource;
    qFonksiyon: TUniQuery;
    UniPanel1: TUniPanel;
    btnSelect: TUniBitBtn;
    btnCancel: TUniBitBtn;
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

function frmFonksiyonSec: TfrmFonksiyonSec;

implementation

uses uniGUIApplication, MainModule, McMLib;

{$R *.dfm}

function frmFonksiyonSec: TfrmFonksiyonSec;
begin
  Result := TfrmFonksiyonSec(MainMod.GetFormInstance(TfrmFonksiyonSec));
end;

procedure TfrmFonksiyonSec.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmFonksiyonSec.btnSelectClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmFonksiyonSec.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrmFonksiyonSec.grdListDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmFonksiyonSec.NewSQL;
var
  SQLStr : String;
begin
//  SQLStr := 'SELECT * FROM def_data_amac WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' AND ';
//  if GizliKriter <> '' then SQLStr := SQLStr + GizliKriter + ' AND ';
//  if edSrcText.Text <> '' then SQLStr := SQLStr + 'amac LIKE ''%' + edSrcText.Text + '%'' AND ';
//
//	System.Delete(SQLStr, Length(SQLStr) - 3, 4);
//  SQLStr := SQLStr + ' ORDER BY amac';
//  QueryOpen(qAmac, SQLStr);

  qFonksiyon.Close;
  qFonksiyon.SQL.Text := 'SELECT * FROM sys_funcdef WHERE mc_id in (0,' + IntToStr(MainMod.MCID) + ') and ' +
                         'active=''E'' ORDER BY function';
  qFonksiyon.Open;
end;

function TfrmFonksiyonSec.Select(AMultiSelect: Boolean = False): Integer;
begin
  Result := -1;

  if AMultiSelect then grdList.Options := grdList.Options + [dgMultiSelect, dgCheckSelect,dgDontShowSelected];
  ShowModal;
  if ModalResult = mrOk then Result := grdList.SelectedRows.Count;
  GizliKriter := '';
end;

procedure TfrmFonksiyonSec.UniFormBeforeShow(Sender: TObject);
begin
  NewSQL;
end;

end.
