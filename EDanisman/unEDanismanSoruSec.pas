unit unEDanismanSoruSec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Clipbrd, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniButton, uniBitBtn, uniMemo, uniDBMemo, uniMultiItem, uniComboBox,
  uniDBComboBox, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses, Data.DB, DBAccess, Uni, uniDBLookupComboBox,
  MemDS, uniCheckBox, uniDBCheckBox, uniScrollBox, VirtualTable, uniBasicGrid,
  uniDBGrid;

type
  TfrmEDanismanSoruSec = class(TUniForm)
    pnlData: TUniPanel;
    pnlButtons: TUniPanel;
    btnCancel: TUniBitBtn;
    btnOk: TUniBitBtn;
    UniDBGrid1: TUniDBGrid;
    qSoru: TUniQuery;
    dsSoru: TUniDataSource;
    hpnFiltre: TUniHiddenPanel;
    edfId: TUniNumberEdit;
    cbfAktif: TUniComboBox;
    edfSoruNo: TUniEdit;
    edfSoruMetin: TUniEdit;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure UniDBGrid1ColumnFilter(Sender: TUniDBGrid;
      const Column: TUniDBGridColumn; const Value: Variant);
  private
    secenekNo: Integer;
  public
    function Exec(aSoruSetiId: Integer; aDeptIds: String; var aSoruSablonId: Integer): Integer;
  end;

function frmEDanismanSoruSec: TfrmEDanismanSoruSec;

implementation

uses uniGUIApplication, MainModule, McMLib, unHelpPage;

{$R *.dfm}

function frmEDanismanSoruSec: TfrmEDanismanSoruSec;
begin
  Result := TfrmEDanismanSoruSec(MainMod.GetFormInstance(TfrmEDanismanSoruSec));
end;

procedure TfrmEDanismanSoruSec.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmEDanismanSoruSec.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

function TfrmEDanismanSoruSec.Exec(aSoruSetiId: Integer; aDeptIds: String; var aSoruSablonId: Integer): Integer;
var
  stmp: String;
  ssql: String;
begin
  qSoru.Close;
  ssql := 'SELECT * FROM edns_soru WHERE mc_id=' + IntToStr(MainMod.MCID) + ' and active=''E'' ' +
                    'AND id not in (SELECT soru_id FROM edns_soruseti_soru WHERE ss_id=' + IntToStr(aSoruSetiId) + ') ';
  if aDeptIds <> '' then
  begin

    if aDeptIds[length(aDeptIds)] <> ',' then
      aDeptIds := aDeptIds + ',';
    ssql := ssql + ' AND func_id in (SELECT func_id FROM sys_deptfunc WHERE ';
    while aDeptIds <> '' do
    begin
      stmp := copy(aDeptIds, 1, pos(',', aDeptIds, 1)-1);
      Delete(aDeptIds, 1, pos(',', aDeptIds, 1));
      ssql := ssql + 'dept_id = ' + stmp + ' OR ';
    end;
    ssql := copy(ssql, 1, Length(ssql)-3) + ') ';
  end;

  qSoru.SQL.Text := ssql + 'ORDER BY soru_no';
  qSoru.Open;
  Result := ShowModal;
  if qSoru.FieldByName('id').AsInteger > 0 then
    aSoruSablonId := qSoru.FieldByName('id').AsInteger;
end;

procedure TfrmEDanismanSoruSec.UniDBGrid1ColumnFilter(Sender: TUniDBGrid;
  const Column: TUniDBGridColumn; const Value: Variant);
begin
  if (edfId.Value > 0) then
  begin
    qSoru.Filtered      := False;
    qSoru.FilterOptions := [foCaseInsensitive];
    qSoru.Filter        := 'id' + ' LIKE ' + QuotedStr('%' +(TR_Upper(edfId.Text))+ '%');
    qSoru.Filtered := True;
  end
  else if Length(cbfAktif.Text) > 0 then
  begin
    qSoru.Filtered      := False;
    qSoru.FilterOptions := [foCaseInsensitive];
    qSoru.Filter        := 'active' + ' LIKE ' + QuotedStr('%' +(TR_Upper(cbfAktif.Text))+ '%');
    qSoru.Filtered := True;
  end
  else if Length(edfSoruNo.Text) > 0 then
  begin
    qSoru.Filtered      := False;
    qSoru.FilterOptions := [foCaseInsensitive];
    qSoru.Filter        := 'soru_no' + ' LIKE ' + QuotedStr('%' +(TR_Upper(edfSoruNo.Text))+ '%');
    qSoru.Filtered := True;
  end
  else if Length(edfSoruMetin.Text) > 2 then
  begin
    qSoru.Filtered      := False;
    qSoru.FilterOptions := [foCaseInsensitive];
    qSoru.Filter        := 'soru_metni' + ' LIKE ' + QuotedStr('%' +(TR_Upper(edfSoruMetin.Text))+ '%');
    qSoru.Filtered := True;
  end
  else
  begin
    qSoru.Filtered := False;
  end;
end;

end.
