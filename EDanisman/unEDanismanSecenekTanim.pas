unit unEDanismanSecenekTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Clipbrd, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniButton, uniBitBtn, uniMemo, uniDBMemo, uniMultiItem, uniComboBox,
  uniDBComboBox, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses, Data.DB, DBAccess, Uni, uniDBLookupComboBox,
  MemDS, uniCheckBox, uniDBCheckBox, uniScrollBox, VirtualTable, uniBasicGrid,
  uniDBGrid;

type
  TfrmEDanismanSecenekTanim = class(TUniForm)
    pnlData: TUniPanel;
    UniLabel3: TUniLabel;
    UniLabel8: TUniLabel;
    pnlButtons: TUniPanel;
    btnCancel: TUniBitBtn;
    btnOk: TUniBitBtn;
    edSecenek: TUniMemo;
    edSonuc: TUniMemo;
    UniLabel2: TUniLabel;
    edRiskSeviye: TUniComboBox;
    edRisk: TUniMemo;
    UniLabel4: TUniLabel;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    secenekNo: Integer;
    qSoru    : TUniQuery;
  public
    function Exec(aQuery: TUniQuery; aSecenekNo: Integer; aOp: Integer): Integer;
  end;

function frmEDanismanSecenekTanim: TfrmEDanismanSecenekTanim;

implementation

uses uniGUIApplication, MainModule, McMLib, unHelpPage;

{$R *.dfm}

function frmEDanismanSecenekTanim: TfrmEDanismanSecenekTanim;
begin
  Result := TfrmEDanismanSecenekTanim(MainMod.GetFormInstance(TfrmEDanismanSecenekTanim));
end;

procedure TfrmEDanismanSecenekTanim.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmEDanismanSecenekTanim.btnOkClick(Sender: TObject);
begin
  qSoru.FieldByName('secenek_' + IntToStr(secenekNo)).AsString                 := edSecenek.Text;
  qSoru.FieldByName('secenek_' + IntToStr(secenekNo) + '_sonuc').AsString      := edSonuc.Text;
  qSoru.FieldByName('secenek_' + IntToStr(secenekNo) + '_riskseviye').AsString := edRiskSeviye.Text;
  qSoru.FieldByName('secenek_' + IntToStr(secenekNo) + '_risk').AsString       := edRisk.Text;
  ModalResult := mrOk;
end;

function TfrmEDanismanSecenekTanim.Exec(aQuery: TUniQuery; aSecenekNo: Integer; aOp: Integer): Integer;
begin
  qSoru := aQuery;
  secenekNo := aSecenekNo;

  if aOp = 0 then //insert
  begin
    edSecenek.Text := '';
    edSonuc.Text   := '';
  end
  else
  if aOp = 1 then //update
  begin
    edSecenek.Text    := qSoru.FieldByName('secenek_' + IntToStr(secenekNo)).AsString;
    edSonuc.Text      := qSoru.FieldByName('secenek_' + IntToStr(secenekNo) + '_sonuc').AsString;
    edRiskSeviye.Text := qSoru.FieldByName('secenek_' + IntToStr(secenekNo) + '_riskseviye').AsString;
    edRisk.Text       := qSoru.FieldByName('secenek_' + IntToStr(secenekNo) + '_risk').AsString;
  end;
  ActiveControl := edSecenek;
  Result := ShowModal;
end;

end.
