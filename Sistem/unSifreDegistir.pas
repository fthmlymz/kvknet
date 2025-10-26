unit unSifreDegistir;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniEdit, uniDBEdit, uniGUIBaseClasses, uniLabel, uniButton, uniBitBtn,
  uniPanel;

type
  TfrmSifreDegistir = class(TUniForm)
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniPanel1: TUniPanel;
    btnChange: TUniBitBtn;
    btnCancel: TUniBitBtn;
    edEski: TUniEdit;
    edYeni1: TUniEdit;
    edYeni2: TUniEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
  private
  public
  function exec: integer;
  end;

function frmSifreDegistir: TfrmSifreDegistir;

implementation

{$R *.dfm}

uses
  McMLib, MainModule, uniGUIApplication;

function frmSifreDegistir: TfrmSifreDegistir;
begin
  Result := TfrmSifreDegistir(MainMod.GetFormInstance(TfrmSifreDegistir));
end;

procedure TfrmSifreDegistir.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSifreDegistir.btnChangeClick(Sender: TObject);
var
  Parola : String;
  ErrMsg : String;
begin
  Parola := MainMod.qUsers.FieldByName('user_pwd').AsString;

  if edEski.Text = '' then
  begin
    MessageDlg('Eski Parola hatalý girilmiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    Exit;
  end;

  if edEski.Text <> DecryptStr(Parola) then
  begin
    MessageDlg('Eski Parola hatalý girilmiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    Exit;
  end;

  if edYeni1.Text = '' then
  begin
    MessageDlg('Yeni Parola boþ olamaz. Lütfen kontrol ediniz.', mtError, [mbOk]);
    Exit;
  end;

  if edYeni1.Text <> edYeni2.Text then
  begin
    MessageDlg('Yeni Parola, Tekrar girilen parola ile uyuþmuyor. Lütfen kontrol ediniz.', mtError, [mbOk]);
    Exit;
  end;

  if not MainMod.ValidatePwd(edYeni1.Text, ErrMsg) then
  begin
    MessageDlg(ErrMsg, mtError, [mbOk]);
    Exit;
  end;

  MainMod.qUsers.Edit;
  MainMod.qUsers.FieldByName('user_pwd').AsString := EncryptStr(edYeni1.Text);
  MainMod.qUsers.Post;
  MessageDlg('Parola baþarý ile deðiþtirildi.', mtInformation, [mbOk]);
  ModalResult := mrOk;
end;

function TfrmSifreDegistir.exec: integer;
begin
  Result := ShowModal;
end;

end.
