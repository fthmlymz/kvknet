unit unLicenceInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniButton, uniLabel;

type
  TfrmLicenceInfo = class(TUniForm)
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    UniButton1: TUniButton;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    lbPaket: TUniLabel;
    lbKullanici: TUniLabel;
    lbTarih: TUniLabel;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
  private
    function GetPacketName(ACode: String): String;
  public
    procedure ShowLicenceInfo;
  end;

function frmLicenceInfo: TfrmLicenceInfo;

implementation

uses uniGUIApplication, MainModule, ServerModule, IniFiles;

{$R *.dfm}

function frmLicenceInfo: TfrmLicenceInfo;
begin
  Result := TfrmLicenceInfo(MainMod.GetFormInstance(TfrmLicenceInfo));
end;

function TfrmLicenceInfo.GetPacketName(ACode: String): String;
var
  MyIni : TIniFile;
begin
  Result := 'YÖNETÝCÝ PAKET';
  try
    MyIni  := TIniFile.Create(ServerMod.StartPath + 'package.ini');
    Result := MyIni.ReadString('Package', ACode, '');
  finally
    if Assigned(MyIni) then MyIni.Free;
  end;
end;

procedure TfrmLicenceInfo.ShowLicenceInfo;
begin
  ShowModal;
end;

procedure TfrmLicenceInfo.UniButton1Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmLicenceInfo.UniFormBeforeShow(Sender: TObject);
var
  sPaket  ,
  sUsers  ,
  sFinish : String;
begin
  sPaket  := MainMod.GetParameter2(MainMod.qTmp, MainMod.GCID, MainMod.MCID, 'VERSION');
  sUsers  := MainMod.GetParameter2(MainMod.qTmp, MainMod.GCID, MainMod.MCID, 'DB SERVER');
  sFinish := MainMod.GetParameter2(MainMod.qTmp, MainMod.GCID, MainMod.MCID, 'DATE FORMAT');

  lbPaket.Caption     := GetPacketName(sPaket);
  lbKullanici.Caption := sUsers;
  lbTarih.Caption     := sFinish;
end;

end.
