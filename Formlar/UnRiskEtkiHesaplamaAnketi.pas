unit UnRiskEtkiHesaplamaAnketi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniRadioGroup, uniGUIBaseClasses, uniPanel,
  uniLabel, uniButton, uniBitBtn, unRiskUtls,math;

type
  TfrmRiskEtkiHesaplamaAnketi = class(TUniForm)
    UniPanel1: TUniPanel;
    rgbOperasyonel: TUniRadioGroup;
    rgbFinansal: TUniRadioGroup;
    rgbkaynak: TUniRadioGroup;
    UniLabel29: TUniLabel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    rgbhukuki: TUniRadioGroup;
    UniLabel8: TUniLabel;
    UniLabel9: TUniLabel;
    rgbitibar: TUniRadioGroup;
    btnPost: TUniBitBtn;
    UniPanel2: TUniPanel;
    btnCancel: TUniBitBtn;
    procedure secimChange(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    puan : integer;
    SecimSayisi: Integer;
    carpan : Double;
    function yuvarla(sayi: real): integer;
  public
    function Exec(Var Apuan : Integer; ariskHesapMetod: TriskHesapMetod ): integer;
  end;

function frmRiskEtkiHesaplamaAnketi: TfrmRiskEtkiHesaplamaAnketi;

implementation

{$R *.dfm}

uses    MainModule, uniGUIApplication;

function frmRiskEtkiHesaplamaAnketi: TfrmRiskEtkiHesaplamaAnketi;
begin
  Result := TfrmRiskEtkiHesaplamaAnketi(mainmod.GetFormInstance(TfrmRiskEtkiHesaplamaAnketi));
end;

procedure TfrmRiskEtkiHesaplamaAnketi.btnCancelClick(Sender: TObject);
begin
ModalResult := mrCancel;
end;

procedure TfrmRiskEtkiHesaplamaAnketi.btnPostClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

function TfrmRiskEtkiHesaplamaAnketi.Exec (Var Apuan : Integer; ariskHesapMetod: TriskHesapMetod): integer;
begin
  SecimSayisi := ifthen(ariskHesapMetod = RhmLTipiMatris,5 ,6);
  carpan := SecimSayisi/5;
 result := ShowModal;
 Apuan := puan;
end;

procedure TfrmRiskEtkiHesaplamaAnketi.secimChange(Sender: TObject);
begin
  if (rgbOperasyonel.ItemIndex > -1) and
      (rgbFinansal.ItemIndex > -1) and
      (rgbkaynak.ItemIndex > -1) and
      (rgbhukuki.ItemIndex > -1) and
      (rgbitibar.ItemIndex > -1)    then
   begin
    puan := yuvarla(( (rgbOperasyonel.ItemIndex +1 +
                      rgbFinansal.ItemIndex +1 +
                      rgbkaynak.ItemIndex +1 +
                      rgbhukuki.ItemIndex +1 +
                      rgbitibar.ItemIndex +1)/5)*carpan);
   end;
   UniPanel2.Caption := IntToStr(puan);
end;

function TfrmRiskEtkiHesaplamaAnketi.yuvarla(sayi: real):integer;
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
