unit unAcikRizaVKDurum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniGUIBaseClasses, uniPanel, uniMultiItem,
  uniComboBox, uniDBComboBox, uniLabel, uniDateTimePicker, uniMemo;

type
  TfrmAcikRizaVKDurum = class(TUniForm)
    UniPanel1: TUniPanel;
    pnlButtons: TUniPanel;
    btnCancel: TUniBitBtn;
    btnPost: TUniBitBtn;
    UniLabel2: TUniLabel;
    edDurum: TUniComboBox;
    UniLabel12: TUniLabel;
    edTarih: TUniDateTimePicker;
    UniLabel1: TUniLabel;
    edAciklama: TUniMemo;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edDurumChange(Sender: TObject);
  private
  public
    function Exec(var Durum: String; var Tarih: TDateTime; var Aciklama: String): Integer;
  end;

function frmAcikRizaVKDurum: TfrmAcikRizaVKDurum;

implementation

uses uniGUIApplication, MainModule;

{$R *.dfm}

function frmAcikRizaVKDurum: TfrmAcikRizaVKDurum;
begin
  Result := TfrmAcikRizaVKDurum(MainMod.GetFormInstance(TfrmAcikRizaVKDurum));
end;

{ TfrmAcikRizaVKDurum }

procedure TfrmAcikRizaVKDurum.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAcikRizaVKDurum.btnPostClick(Sender: TObject);
begin
  if edDurum.ItemIndex = 2 then
  begin
    if edTarih.Text = '30.12.1899' then
    begin
      MessageDlg('Ýmha tarihi belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
      Exit;
    end;
  end;

  ModalResult := mrOk;
end;

procedure TfrmAcikRizaVKDurum.edDurumChange(Sender: TObject);
begin
  edTarih.Enabled := edDurum.Text = 'ÝMHA EDÝLDÝ';
end;

function TfrmAcikRizaVKDurum.Exec(var Durum: String; var Tarih: TDateTime; var Aciklama: String): Integer;
begin
  edDurum.Text     := Durum;
  edTarih.DateTime := Tarih;
  edAciklama.Text  := Aciklama;

  Result := ShowModal;

  if Result = mrOk then
  begin
    Durum    := edDurum.Text;
    Tarih    := edTarih.DateTime;
    Aciklama := edAciklama.Text;
  end;
end;

procedure TfrmAcikRizaVKDurum.UniFormBeforeShow(Sender: TObject);
begin
  //
end;

end.
