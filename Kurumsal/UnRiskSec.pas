unit UnRiskSec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniBasicGrid, uniDBGrid,
  uniButton, uniBitBtn, uniPanel, Data.DB, DBAccess, Uni, MemDS, uniImage,
  Vcl.Imaging.pngimage, uniEdit, uniMultiItem, uniComboBox;

type
  TfrmRiskSec = class(TUniForm)
    grd: TUniDBGrid;
    UniContainerPanel4: TUniContainerPanel;
    btnSelect: TUniBitBtn;
    btnCancel: TUniBitBtn;
    qdata: TUniQuery;
    dsdata: TUniDataSource;
    UniHiddenPanel1: TUniHiddenPanel;
    fltRisk: TUniEdit;
    fltUyari: TUniComboBox;
    btnNew: TUniBitBtn;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure grdColumnFilter(Sender: TUniDBGrid;
      const Column: TUniDBGridColumn; const Value: Variant);
    procedure grdDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure btnNewClick(Sender: TObject);
  private
    { Private declarations }
  public
    sql : String;
    function Select: Integer;
  end;

function frmRiskSec: TfrmRiskSec;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, McMLib, unRiskSurecMevcutDurum, UnRiskTanim;

function frmRiskSec: TfrmRiskSec;
begin
  Result := TfrmRiskSec(mainmod.GetFormInstance(TfrmRiskSec));
end;

procedure TfrmRiskSec.btnCancelClick(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TfrmRiskSec.btnNewClick(Sender: TObject);
begin
 if not  mainmod.LoginInfo.Yetkiler[195] then
 Begin
    MessageDlg('Rist Tanýmlama yetkiniz bulunmamaktadýr.',mtConfirmation,[mbYes]);
    exit;
 End;

 if frmRiskTanim.Exec(0,Etekleme) = mrOk then RefreshQuery(qdata);
end;

procedure TfrmRiskSec.btnSelectClick(Sender: TObject);
begin
  if  TR_Upper(qdata.FieldByName('uyari').AsString) = TR_Upper( 'Seçilemez') then
    begin
      MessageDlg('Risk tanýmý daha önce risk analiz tanýmlamalarýnda kullanýlmýþtýr.', mtConfirmation,[mbYes]) ;
      exit;
    end;

    ModalResult := mrOk;
end;


procedure TfrmRiskSec.grdColumnFilter(Sender: TUniDBGrid;
  const Column: TUniDBGridColumn; const Value: Variant);
var
  filtrestring : string;
begin
 if not qdata.Active then   exit;

  if (fltRisk.Text <> '') and (Length(fltRisk.Text)>2) then
  begin
    if filtrestring <>'' then
      filtrestring := filtrestring  + ' and ';
    filtrestring := filtrestring + ' risk LIKE ''%' +tr_upper(fltRisk.Text)+ '%''';
  end;

  if  fltUyari.ItemIndex>-1 then
  begin
   if filtrestring <>'' then
      filtrestring := filtrestring + ' and ';
    if fltUyari.ItemIndex = 0 then
       filtrestring := filtrestring + ' uyari =''SEÇÝLEMEZ'' '
    else
       filtrestring := filtrestring + ' uyari =''UYGUN'' ' ;
  end;

  if filtrestring <>'' then
  begin

    qdata.Filtered := False;
    qdata.FilterOptions := [foCaseInsensitive];
    qdata.Filter :=  filtrestring;
    qdata.Filtered := True;
  end else
  qdata.Filtered:= false;


end;

procedure TfrmRiskSec.grdDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
  Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin

   if  grd.DataSource.DataSet.FieldByName('uyari').AsString ='SEÇÝLEMEZ' then
    begin
      Attribs.Color := $002828EC  ;
      Attribs.Font.Style := [fsBold];
    end else
    begin
      Attribs.Color := $007DC486;
      Attribs.Font.Style := [];
    end;

end;

function TfrmRiskSec.Select: Integer;
begin
  result := showmodal;
end;



procedure TfrmRiskSec.UniFormBeforeShow(Sender: TObject);
begin


   QueryOpen(qdata,  ' SELECT detail.* FROM ( SELECT T.risk,case when r.risk is not null then ''SEÇÝLEMEZ'' else ''UYGUN''  end AS uyari ' +
                ' FROM 	def_data_risk_tanim ' +
                ' T LEFT JOIN def_data_risk r ON r.risk = T.risk ' +
                ' WHERE 	T.mc_id = '+ inttostr( MainMod.MCID) +') detail ORDER BY detail.risk ');

  ActiveControl := grd;


end;

end.
