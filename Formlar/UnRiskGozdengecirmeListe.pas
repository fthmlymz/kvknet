unit UnRiskGozdengecirmeListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniGUIBaseClasses, uniPanel,
  uniBasicGrid, uniDBGrid, Data.DB, MemDS, DBAccess, Uni;

type
  TfrmRiskGozdengecirmeListe = class(TUniForm)
    pnlbutton: TUniPanel;
    btnGoster: TUniBitBtn;
    UniDBGrid1: TUniDBGrid;
    pnlliste: TUniPanel;
    UniDBGrid2: TUniDBGrid;
    dsdata: TUniDataSource;
    qdata: TUniQuery;
    Btnexit: TUniBitBtn;
    procedure btnGosterClick(Sender: TObject);
    procedure BtnexitClick(Sender: TObject);
  private
    FRiskId: integer;
    FGozdenGecirme_id : integer;
    procedure setRiskId(const Value: integer);
    { Private declarations }
  public
    property RiskId: integer read FRiskId write setRiskId;
    function Exec(AId: string ; var GdId : integer ): integer ;
  end;

function frmRiskGozdengecirmeListe: TfrmRiskGozdengecirmeListe;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, McMLib;

function frmRiskGozdengecirmeListe: TfrmRiskGozdengecirmeListe;
begin
  Result := TfrmRiskGozdengecirmeListe(mainmod.GetFormInstance(TfrmRiskGozdengecirmeListe));
end;

{ TfrmRiskGozdengecirmeListe }



procedure TfrmRiskGozdengecirmeListe.BtnexitClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmRiskGozdengecirmeListe.btnGosterClick(Sender: TObject);
begin
  if qdata.RecordCount>0 then
    FGozdenGecirme_id := qdata.FieldByName('gozdenGecirme_id').AsInteger
  else
    FGozdenGecirme_id := 0;

  ModalResult := mrOk;

end;

function TfrmRiskGozdengecirmeListe.Exec(AId: string ; var GdId : integer ): integer ;
begin
  GdId := 0;
  RiskId := StrToInt(AId);
  result  := ShowModal;
  GdId := FGozdenGecirme_id;

end;

procedure TfrmRiskGozdengecirmeListe.setRiskId(const Value: integer);
begin
  FRiskId := Value;
    QueryOpen(qdata,' select r.gozdengecirme_id,  r.id risk_id, string_agg(s.surec, '','') surecler  ,r.risk,rt.tedbir,r.gozden_gecirme_tar from ' +
  ' def_data_riskgd r ' +
  ' left join def_data_risk_tedbirgd rt on rt.risk_id= r.id and rt.gozdengecirme_id=r.gozdengecirme_id and rt.mc_id=r.mc_id ' +
  ' left join def_data_risk_surec_eslesmegd re on re.risk_id = r.id and rt.gozdengecirme_id=r.gozdengecirme_id and re.mc_id=r.mc_id ' +
  ' left join def_data_surec s on s.id = re.surec_id and re.mc_id=r.mc_id ' +
  ' where r.mc_id='+ inttostr(mainmod.MCID) + ' and r.id= ' +  IntToStr(value) +
  ' group by r.id ,r.risk,rt.tedbir,r.gozden_gecirme_tar,r.gozdengecirme_id '
  ) ;

end;

end.
