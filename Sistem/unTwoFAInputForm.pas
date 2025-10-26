unit unTwoFAInputForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, uniGUIBaseClasses, uniGUIClasses, uniButton, uniEdit, uniLabel,
  uniGUIForm, Vcl.Forms, uniImage, uniPanel, uni;

type
  TfrmTwoFAInput = class(TUniForm)
    lblInfo: TUniLabel;
    edtCode: TUniEdit;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    lbExpire: TUniLabel;
    imgQRCode: TUniImage;
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    FEnteredCode: string;
  public
    function Execute(out ACode: string ; const AExpire: TDateTime  ): integer;overload;
    function Execute(out ACode: string ; const AExpire: TDateTime ; secret : string  ): integer;overload;
  end;

  function frmTwoFAInput: TfrmTwoFAInput;

implementation

{$R *.dfm}

uses uniGUIApplication, MainModule, McMLib,unTwoFactorAuth;

{ TfrmTwoFAInput }
function frmTwoFAInput: TfrmTwoFAInput;
begin
  result := TfrmTwoFAInput(mainmod.GetFormInstance(TfrmTwoFAInput));
end;

procedure TfrmTwoFAInput.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmTwoFAInput.btnOKClick(Sender: TObject);
begin
  FEnteredCode := edtCode.Text;
  ModalResult := mrOk;
end;

function TfrmTwoFAInput.Execute(out ACode: string; const AExpire: TDateTime;
  secret: string): integer;
var
  Form: TfrmTwoFAInput;
  uri: string;
begin
  ACode := '';
  uri := BuildQRCodeURI('Aryom KVKnet',mainmod.LoginInfo.EMail,MainMod.TwoFASecret);

  UniPanel1.Visible := true ;
  MainMod.CreateQRCode(uri, imgQRCode);
  frmTwoFAInput.lbExpire.Visible := mainmod.TwoFaMetod <> tfmTOTP ;
  frmTwoFAInput.lbExpire.Caption := 'Kodunuzun geçerlilik süresi : ' + DateTimeToStr(AExpire);
  Result := Showmodal;
  if Result = mrOk then
  begin
    ACode := FEnteredCode;
  end;

end;

function TfrmTwoFAInput.Execute(out ACode: string ; const AExpire: TDateTime  ): integer;
var
  Form: TfrmTwoFAInput;
begin

  ACode := '';

  UniPanel1.Visible := false ;
  frmTwoFAInput.Height := UniPanel1.Height ;
  frmTwoFAInput.lbExpire.Visible := mainmod.TwoFaMetod <> tfmTOTP ;
  frmTwoFAInput.lbExpire.Caption := 'Kodunuzun geçerlilik süresi : ' + DateTimeToStr(AExpire);
  Result := Showmodal;
  if Result = mrOk then
  begin
    ACode := FEnteredCode;
  end;

end;

end.
