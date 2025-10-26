unit unRiskSurecAnilizHesapInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniMemo, uniHTMLMemo, uniButton,
  uniBitBtn, uniPanel, uniHTMLFrame;

type
  TFrmRiskHesapInfo = class(TUniForm)
    pnlButtons: TUniPanel;
    btnexit: TUniBitBtn;
    UniHTMLFrame1: TUniHTMLFrame;
    procedure btnexitClick(Sender: TObject);
  private
    { Private declarations }
  public
    function Exec:integer;
  end;

function FrmRiskHesapInfo: TFrmRiskHesapInfo;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function FrmRiskHesapInfo: TFrmRiskHesapInfo;
begin
  Result := TFrmRiskHesapInfo(mainmod.GetFormInstance(TFrmRiskHesapInfo));
end;

procedure TFrmRiskHesapInfo.btnexitClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

function TFrmRiskHesapInfo.Exec: integer;
begin

 result := ShowModal;
end;

end.
