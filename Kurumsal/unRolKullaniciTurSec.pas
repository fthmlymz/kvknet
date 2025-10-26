unit unRolKullaniciTurSec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniRadioGroup, uniLabel, uniGUIBaseClasses, uniPanel;

type
  TfrmRolKullaniciTurSec = class(TUniForm)
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    UniPanel3: TUniPanel;
    UniLabel1: TUniLabel;
    rgSecim: TUniRadioGroup;
    btnSelect: TUniBitBtn;
    btnCancel: TUniBitBtn;
    procedure btnSelectClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
  public
    function Select(AType: Integer): Integer;
  end;

function frmRolKullaniciTurSec: TfrmRolKullaniciTurSec;

implementation

uses uniGUIApplication, MainModule;

{$R *.dfm}

function frmRolKullaniciTurSec: TfrmRolKullaniciTurSec;
begin
  Result := TfrmRolKullaniciTurSec(MainMod.GetFormInstance(TfrmRolKullaniciTurSec));
end;

{ TfrmRolKullaniciTurSec }

procedure TfrmRolKullaniciTurSec.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmRolKullaniciTurSec.btnSelectClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

function TfrmRolKullaniciTurSec.Select(AType: Integer): Integer;
begin
  Result := -1;
  rgSecim.Items.Clear;
  if AType = 0 then // Rol
  begin
    rgSecim.Items.Add('Grup Rollerini Aç');
    rgSecim.Items.Add('Kurum Rollerini Aç');
  end
  else if AType = 1 then // Kullanýcý
  begin
    rgSecim.Items.Add('Grup Kullanýcýlarýný Aç');
    rgSecim.Items.Add('Kurum Kullanýcýlarýný Aç');
  end;
  rgSecim.ItemIndex := MainMod.MCType;
  ShowModal;
  if ModalResult = mrOk then
  begin
    MainMod.MCType := rgSecim.ItemIndex;
    Result         := rgSecim.ItemIndex;
  end;
end;

end.
