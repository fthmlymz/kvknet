unit unRptRiskAnalizRaporu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, System.Actions, Vcl.ActnList, uniDateTimePicker, uniLabel, uniButton,
  uniBitBtn, uniGUIBaseClasses, uniPanel, uniMultiItem, uniComboBox, uniBasicGrid, uniDBGrid,
  Data.DB, DBAccess, Uni, MemDS, VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  FlexCel.Render;

type
  TfrRptRiskAnalizRaporu = class(TUniFrame)
    ActList: TActionList;
    actSearch: TAction;
    actClose: TAction;
    pnlTop: TUniPanel;
    btnSearch: TUniBitBtn;
    btnClose: TUniBitBtn;
    UniLabel1: TUniLabel;
    edOrder: TUniComboBox;
    qRisk: TUniQuery;
    dsRisk: TUniDataSource;
    UniDBGrid1: TUniDBGrid;
    actExcel: TAction;
    UniBitBtn1: TUniBitBtn;
    btnHelp: TUniBitBtn;
    procedure UniFrameCreate(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actExcelExecute(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure edOrderChange(Sender: TObject);
  private
    procedure PrepareReport;
  public
  end;

implementation

{$R *.dfm}

uses MainModule, ServerModule, McMLib, Main, unHelpPage;

procedure TfrRptRiskAnalizRaporu.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrRptRiskAnalizRaporu.actExcelExecute(Sender: TObject);
var
  Report  : TFlexCelReport;
  FName   : String;
  TmpName : String;
  FUrl    : String;
begin
  if qRisk.RecordCount = 0 then Exit;

  Report := TFlexCelReport.Create(True);
  try
    Report.AddTable('risk', qRisk);
    FUrl    := '';
    FName   := 'Risk_Analiz_Raporu';
    TmpName := ServerMod.NewCacheFileUrl(False, 'xlsx', FName, '', FUrl, True);
    Report.Run(ServerMod.FilesFolderPath + 'temp_xls\riskanaliz.template.xlsx', TmpName);
  finally
    Report.Free;
  end;

  UniSession.SendFile(TmpName, FName + '.xlsx');
end;

procedure TfrRptRiskAnalizRaporu.actSearchExecute(Sender: TObject);
begin
  PrepareReport;
end;

procedure TfrRptRiskAnalizRaporu.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('RptRiskAnalizRaporu');
end;

procedure TfrRptRiskAnalizRaporu.edOrderChange(Sender: TObject);
begin
  PrepareReport;
end;

procedure TfrRptRiskAnalizRaporu.PrepareReport;
var
  AOrder : String;
begin
  case edOrder.ItemIndex of
    0 : AOrder := ' DESC';
    1 : AOrder := '';
  end;

  ShowMask('Lütfen bekleyiniz...');
  UniSession.Synchronize;
	QueryOpen(qRisk, 'SELECT chl.id, ky.kaynak as kaynak_str, ks.kisi as kisi_str,' +
                   '  kt.kontrolsonuc kontrol_str, onm.onemderece onem_derecesi_str,' +
                   '  chl.koru_idarionlem, chl.koru_teknikonlem, chl.danisman_notu,' +
                   '  fnc_id2str(chl.ekipman_ids, ''def_data_ekipman'', ''ekipman'')::character varying (5000) AS ekipman_str,' +
                   '  fnc_id2str(chl.tedbir_ids, ''def_data_tedbir'', ''tedbir'')::character varying (5000) AS tedbir_str,' +
                   '  fnc_id2str(chl.sorumlu_ids, ''sys_deptdef'', ''title'')::character varying (5000) AS sorumlu_str,' +
                   '  chl.calisma_talimat, chl.oneriler, onm.description as onem_aciklama' +
                   ' FROM data_checklist chl' +
                   '  LEFT JOIN def_data_onemderece onm on chl.onem_derecesi_id = onm.id' +
                   '  LEFT JOIN def_data_kaynak ky on chl.kaynak_id = ky.id' +
                   '  LEFT JOIN def_data_kisi ks on chl.kisi_id = ks.id' +
                   '  LEFT JOIN def_data_kontrolsonuc kt on chl.kontrol_id = kt.id' +
                   ' WHERE chl.active = ''E'' AND chl.mc_id = ' + IntToStr(MainMod.MCID) +
                   ' ORDER BY onm.onemderece' + AOrder + ', ky.kaynak, ks.kisi');
  HideMask;
end;

procedure TfrRptRiskAnalizRaporu.UniFrameCreate(Sender: TObject);
begin
  edOrder.ItemIndex := 0;
end;

initialization
  RegisterClass(TfrRptRiskAnalizRaporu);

end.
