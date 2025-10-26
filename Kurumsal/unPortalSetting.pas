unit unPortalSetting;

interface

uses
  Windows, Messages, SysUtils, System.IOUtils,Variants, Classes, Graphics, StdCtrls,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniCheckBox, uniDBCheckBox, uniEdit, uniDBEdit, uniLabel,
  uniGUIBaseClasses, uniPanel, uniBasicGrid, uniDBGrid, uniDBLookupComboBox, uniMultiItem, uniComboBox,
  uniDBComboBox, uniPageControl, Data.DB, DBAccess, Uni, uniImage, uniDBImage, uniFileUpload,
  MemDS, Vcl.Menus, uniMainMenu, uniMenuButton, frxClass, frxExportBaseDialog, frxTableObject,
  frxExportPDF, frxDBSet, uniMemo, uniDBMemo, uniColorButton;

type
  TfrmPortalSetting = class(TUniForm)
    btnEdit: TUniBitBtn;
    btnPost: TUniBitBtn;
    btnCancel: TUniBitBtn;
    pnlLog: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    lbIDY: TUniLabel;
    lbIDT: TUniLabel;
    lbSDY: TUniLabel;
    lbSDT: TUniLabel;
    dssysportalsetting: TUniDataSource;
    pnlButtons: TUniPanel;
    UniBitBtn1: TUniBitBtn;
    qTmp: TUniQuery;
    edanarenk: TUniDBEdit;
    cbxKomisyon: TUniDBCheckBox;
    cbxBasvuru: TUniDBCheckBox;
    edaltrenk: TUniDBEdit;
    cbxAcikriza: TUniDBCheckBox;
    cbxBilgiMetni: TUniDBCheckBox;
    cbxKvkLogo: TUniDBCheckBox;
    cbxUygulamaLogosu: TUniDBCheckBox;
    cbxPolitika: TUniDBCheckBox;
    UniDBMemo1: TUniDBMemo;
    clbAna: TUniColorButton;
    clbalt: TUniColorButton;
    UniDBCheckBox1: TUniDBCheckBox;
    UniDBCheckBox2: TUniDBCheckBox;
    UniPageControl1: TUniPageControl;
    tsportal: TUniTabSheet;
    tsafis: TUniTabSheet;
    UniDBCheckBox3: TUniDBCheckBox;
    UniDBCheckBox4: TUniDBCheckBox;
    UniDBCheckBox5: TUniDBCheckBox;
    UniDBCheckBox6: TUniDBCheckBox;
    procedure btnEditClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure clbAnaSelect(Sender: TObject; Color: TColor);
    procedure clbaltSelect(Sender: TObject; Color: TColor);
  private
    Data : TUniQuery;
    procedure ManageSettings;
    procedure PrepareVSB;
    procedure colorslect(Sender: TObject; Color: TColor);
    function ColorToHex(AColor: TColor): string;
    function HexToColor(const Hex: string): TColor;
  public
  end;

function frmPortalSetting: TfrmPortalSetting;

implementation

uses
  uniGUIApplication, MainModule, McMLib, unHelpPage, ServerModule;

{$R *.dfm}

function frmPortalSetting: TfrmPortalSetting;
begin
  Result := TfrmPortalSetting(MainMod.GetFormInstance(TfrmPortalSetting));
end;

procedure TfrmPortalSetting.btnCancelClick(Sender: TObject);
begin
  if btnCancel.Caption = 'Ýptal' then
  begin
    dssysportalsetting.DataSet.Cancel;
    ManageSettings;
  end
  else
  begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmPortalSetting.btnEditClick(Sender: TObject);
begin
   if not mainmod.LoginInfo.Yetkiler[215] then
   begin
      MessageDlg('Deðiþiklik yetkiniz bulunmamaktadýr.',mtConfirmation,[mbYes]);
    exit;
   end;

  dssysportalsetting.DataSet.Edit;
  ManageSettings;

end;

procedure TfrmPortalSetting.btnPostClick(Sender: TObject);
begin


  dssysportalsetting.DataSet.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  dssysportalsetting.DataSet.FieldByName('sdt').AsDateTime     := Now;

 dssysportalsetting.DataSet.Post;
 ModalResult := mrOk;
end;


function TfrmPortalSetting.ColorToHex(AColor: TColor): string;
var
  rgb: Longint;
begin
  rgb := ColorToRGB(AColor); // Delphi'nin sistem renklerini gerçek RGB yapar
  Result := Format('#%.2x%.2x%.2x', [
    GetRValue(rgb),
    GetGValue(rgb),
    GetBValue(rgb)
  ]).ToUpper;
end;

function TfrmPortalSetting.HexToColor(const Hex: string): TColor;
var
  r, g, b: Byte;
  s: string;
begin
  s := Hex.Trim;
  if (s <> '') and (s[1] = '#') then
    Delete(s, 1, 1);

  if Length(s) <> 6 then
    raise Exception.Create('Geçersiz HEX renk kodu: ' + Hex);

  r := StrToInt('$' + Copy(s, 1, 2));
  g := StrToInt('$' + Copy(s, 3, 2));
  b := StrToInt('$' + Copy(s, 5, 2));

  Result := RGB(r, g, b);
end;

procedure TfrmPortalSetting.ManageSettings;
begin
  btnPost.Enabled :=
    dssysportalsetting.DataSet.State in [dsInsert,dsEdit] ;
  btnEdit.Enabled := not btnPost.Enabled ;

  clbAna.Enabled := btnPost.Enabled;
  clbalt.Enabled := btnPost.Enabled;

   if btnPost.Enabled then
  begin
    btnCancel.Caption := 'Ýptal';
  end
  else
  begin
    btnCancel.Caption := 'Kapat';
  end;

end;

procedure TfrmPortalSetting.PrepareVSB;
begin

end;
procedure TfrmPortalSetting.UniFormBeforeShow(Sender: TObject);
begin
 UniPageControl1.ActivePage := tsportal;

// QueryOpen(TUniQuery(dssysportalsetting),
//    ' select * from sys_dynamic_properties where mc_id ='+ IntToStr(mainmod.MCID)  );
//
//  if dssysportalsetting.DataSet.IsEmpty then
//  begin
//     dssysportalsetting.DataSet.Insert;
//     dssysportalsetting.DataSet.FieldByName('id').AsInteger := mainmod.GetSeq('sq_sys_dynamic_properties_id');
//     dssysportalsetting.DataSet.FieldByName('mc_id').AsInteger := mainmod.MCID;
//     dssysportalsetting.DataSet.FieldByName('primary_color_code').asstring := '';
//     dssysportalsetting.DataSet.FieldByName('secondary_color_code').asstring := '';
//     dssysportalsetting.DataSet.FieldByName('show_commission_decisions').asstring := 'E' ;
//     dssysportalsetting.DataSet.FieldByName('show_policies').asstring := 'E' ;
//     dssysportalsetting.DataSet.FieldByName('show_information_texts').asstring := 'E' ;
//     dssysportalsetting.DataSet.FieldByName('show_explicit_consent_texts').asstring := 'E' ;
//     dssysportalsetting.DataSet.FieldByName('show_data_subject_applications').asstring := 'E' ;
//     dssysportalsetting.DataSet.FieldByName('show_portal_kvknet_logo').asstring := 'E' ;
//     dssysportalsetting.DataSet.FieldByName('show_application_login_kvknet_logo').asstring := 'E' ;
//     dssysportalsetting.DataSet.FieldByName('show_ip_address').asstring := 'E' ;
//     dssysportalsetting.DataSet.FieldByName('data_subject_application_warning_text').asstring := '' ;
//     dssysportalsetting.DataSet.FieldByName('show_portal_krm_logo').asstring := 'E' ;
//     dssysportalsetting.DataSet.FieldByName('show_afis_web_link').asstring := 'E' ;
//     dssysportalsetting.DataSet.FieldByName('show_afis_portal_link').asstring := 'E' ;
//     dssysportalsetting.DataSet.FieldByName('show_afis_mail').asstring := 'E' ;
//     dssysportalsetting.DataSet.FieldByName('show_afis_gsm_no').asstring := 'E' ;
//     dssysportalsetting.DataSet.FieldByName('idy').AsInteger :=  0;
//     dssysportalsetting.DataSet.FieldByName('idt').AsDateTime :=  now;
//     dssysportalsetting.DataSet.FieldByName('sdy').AsInteger :=  0;
//     dssysportalsetting.DataSet.FieldByName('sdt').AsDateTime :=  now;
//     dssysportalsetting.DataSet.Post;
//  end;

   lbIDY.Caption := MainMod.KullaniciGetir(dssysportalsetting.DataSet.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(dssysportalsetting.DataSet.FieldByName('sdy').AsString);
  if dssysportalsetting.DataSet.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', dssysportalsetting.DataSet.FieldByName('idt').AsDateTime);
  if dssysportalsetting.DataSet.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', dssysportalsetting.DataSet.FieldByName('sdt').AsDateTime);

  ManageSettings;

end;

procedure TfrmPortalSetting.clbaltSelect(Sender: TObject; Color: TColor);
begin
     dssysportalsetting.DataSet.FieldByName('secondary_color_code').AsString :=
      ColorToHex(clbalt.Color);
end;

procedure TfrmPortalSetting.clbAnaSelect(Sender: TObject; Color: TColor);
begin
     dssysportalsetting.DataSet.FieldByName('primary_color_code').AsString :=
      ColorToHex(clbAna.Color);
end;

procedure TfrmPortalSetting.colorslect(Sender: TObject; Color: TColor);
begin
//  UniPanel1.Color := Color;
//  UniStatusBar1.Panels.Items[0].Text := ColorToString(Color);
//  dssysportalsetting.DataSet.FieldByName('primary_color_code').AsString :=
//
//    col
//    UniColorButton1.Color.ToHexString(True); // #RRGGBB formatýnda verir
end;

end.


