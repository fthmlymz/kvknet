unit UnRiskOlasilikHesaplamaAnketi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniLabel, uniRadioGroup,
  uniGUIBaseClasses, uniPanel, unRiskUtls,math;

type
  TfrmRiskOlasilikHesaplamaAnketi = class(TUniForm)
    UniPanel1: TUniPanel;
    rgbDeneyim: TUniRadioGroup;
    rgbsiklik: TUniRadioGroup;
    rgbkullanici: TUniRadioGroup;
    UniLabel29: TUniLabel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    rgbdisetmen: TUniRadioGroup;
    UniLabel8: TUniLabel;
    UniLabel9: TUniLabel;
    rgbteknoloji: TUniRadioGroup;
    UniPanel2: TUniPanel;
    btnPost: TUniBitBtn;
    btnCancel: TUniBitBtn;
    procedure btnCancelClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure secimChange(Sender: TObject);
  private
    puan : integer;
    SecimSayisi: Integer;
    carpan : Double;
    function yuvarla(sayi: real): integer;
  public
    function Exec(Var Apuan : Integer ;  ariskHesapMetod: TriskHesapMetod): integer;
  end;

function frmRiskOlasilikHesaplamaAnketi: TfrmRiskOlasilikHesaplamaAnketi;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmRiskOlasilikHesaplamaAnketi: TfrmRiskOlasilikHesaplamaAnketi;
begin
  Result := TfrmRiskOlasilikHesaplamaAnketi(mainmod.GetFormInstance(TfrmRiskOlasilikHesaplamaAnketi));
end;

{ TfrmRiskOlasilikHesaplamaAnketi }

procedure TfrmRiskOlasilikHesaplamaAnketi.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmRiskOlasilikHesaplamaAnketi.btnPostClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

function TfrmRiskOlasilikHesaplamaAnketi.Exec(Var Apuan : Integer ;  ariskHesapMetod: TriskHesapMetod): integer;
begin
  SecimSayisi := ifthen(ariskHesapMetod = RhmLTipiMatris,5 ,6);
  carpan := SecimSayisi/5;
  result := ShowModal;
  Apuan := puan;
end;

procedure TfrmRiskOlasilikHesaplamaAnketi.secimChange(Sender: TObject);
begin
  if (rgbDeneyim.ItemIndex > -1) and
      (rgbsiklik.ItemIndex > -1) and
      (rgbdisetmen.ItemIndex > -1) and
      (rgbteknoloji.ItemIndex > -1) and
      (rgbkullanici.ItemIndex > -1)    then
   begin
    puan := yuvarla( ((rgbDeneyim.ItemIndex +1 +
                      rgbsiklik.ItemIndex +1 +
                      rgbdisetmen.ItemIndex +1 +
                      rgbteknoloji.ItemIndex +1 +
                      rgbkullanici.ItemIndex +1)/5)*carpan);
   end;
   UniPanel2.Caption := IntToStr(puan);
end;

function TfrmRiskOlasilikHesaplamaAnketi.yuvarla(sayi: real): integer;
var
  tam, ondalik: integer;
begin
  tam:=trunc(sayi);
  ondalik:=trunc(frac(sayi)*10);
  if ondalik>=5 then
    result:=tam+1
  else
    result:=tam;
end;

end.
