unit unEDanismanCevapTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Clipbrd, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniButton, uniBitBtn, uniMemo, uniDBMemo, uniMultiItem, uniComboBox,
  uniDBComboBox, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses, Data.DB, DBAccess, Uni, uniDBLookupComboBox,
  MemDS, uniCheckBox, uniDBCheckBox, uniScrollBox, uniRadioButton, uniBasicGrid,
  uniDBGrid, VirtualTable, Datasnap.DBClient, uniPageControl;

type
  TfrmEDanismanCevapTanim = class(TUniForm)
    dsSoru: TUniDataSource;
    pnlData: TUniPanel;
    UniLabel8: TUniLabel;
    edDesc: TUniDBMemo;
    pnlButtons: TUniPanel;
    btnCancel: TUniBitBtn;
    btnPost: TUniBitBtn;
    pnlLog: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    lbIDY: TUniLabel;
    lbIDT: TUniLabel;
    lbSDY: TUniLabel;
    lbSDT: TUniLabel;
    qTmp: TUniQuery;
    UniBitBtn1: TUniBitBtn;
    qSoru: TUniQuery;
    edsoru: TUniDBMemo;
    qCevap: TUniQuery;
    dsCevap: TUniDataSource;
    UniLabel1: TUniLabel;
    edSoruNo: TUniDBEdit;
    UniLabel2: TUniLabel;
    btnBos: TUniBitBtn;
    UniScrollBox1: TUniScrollBox;
    pc5: TUniPanel;
    pc4: TUniPanel;
    pc3: TUniPanel;
    pc2: TUniPanel;
    pc1: TUniPanel;
    cb1: TUniDBCheckBox;
    mc1: TUniDBMemo;
    cb2: TUniDBCheckBox;
    mc2: TUniDBMemo;
    cb3: TUniDBCheckBox;
    mc3: TUniDBMemo;
    cb4: TUniDBCheckBox;
    mc4: TUniDBMemo;
    cb5: TUniDBCheckBox;
    mc5: TUniDBMemo;
    qSoruSeti: TUniQuery;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure CevabiKaydetControl(Sender: TComponent; Res: Integer);
    procedure CevabiDegistirControl(Sender: TComponent; Res: Integer);
    procedure CevabiKaydetmedenCikisControl(Sender: TComponent; Res: Integer);
    procedure CevabiBosGecControl(Sender: TComponent; Res: Integer);
    procedure cb1Click(Sender: TObject);
    procedure pgSecenekChange(Sender: TObject);
    procedure btnBosClick(Sender: TObject);
    private
    secenekSekli : string;
    soruId       : Integer;
    cevaplandi   : boolean;
    procedure SecenekleriGoster;
    procedure ManageSettings;
  public
    function Exec(aSoruID: Integer): Integer;
  end;

function frmEDanismanCevapTanim: TfrmEDanismanCevapTanim;

implementation

uses uniGUIApplication, MainModule, McMLib, unHelpPage;

{$R *.dfm}

function frmEDanismanCevapTanim: TfrmEDanismanCevapTanim;
begin
  Result := TfrmEDanismanCevapTanim(MainMod.GetFormInstance(TfrmEDanismanCevapTanim));
end;

procedure TfrmEDanismanCevapTanim.btnBosClick(Sender: TObject);
begin
  MessageDlg('Bu soruyu cevaplamadan geçmek istediðinizden emin misiniz?', mtConfirmation, mbYesNo, CevabiBosGecControl);

end;

procedure TfrmEDanismanCevapTanim.btnCancelClick(Sender: TObject);
begin
  if cevaplandi = false then
  begin
    MessageDlg('Bu soruyu cevaplamadan çýkmak istediðinizden emin misiniz?', mtConfirmation, mbYesNo, CevabiKaydetmedenCikisControl);
  end
  else
    ModalResult := mrCancel;
end;

procedure TfrmEDanismanCevapTanim.btnPostClick(Sender: TObject);
begin
  if cevaplandi then
  begin
    MessageDlg('Bu cevabý silip soruyu yeniden cevaplamak istediðinizden emin misiniz?', mtConfirmation, mbYesNo, CevabiDegistirControl);
  end
  else
  begin
//    MessageDlg('Bu cevabý kaydetmek istediðinizden emin misiniz?', mtConfirmation, mbYesNo, CevabiKaydetControl);
  CevabiKaydetControl(frmEdanismanCevapTanim, 6);
  end;
end;

procedure TfrmEDanismanCevapTanim.cb1Click(Sender: TObject);
var
  i: integer;
begin
  if (secenekSekli = 'RADIOBUTTON') and (TunidbCheckBox(sender).Checked) and (qCevap.State in [dsInsert, dsEdit]) then
  begin
    if (TunidbCheckBox(sender) <> cb1) and (cb1.Checked) then
    begin
      cb1.Checked := false;
      qCevap.FieldByName('secenek_1_secildi').AsString := 'H';
    end;
    if (TunidbCheckBox(sender) <> cb2) and (cb2.Checked) then
    begin
      cb2.Checked := false;
      qCevap.FieldByName('secenek_2_secildi').AsString := 'H';
    end;
    if (TunidbCheckBox(sender) <> cb3) and (cb3.Checked) then
    begin
      cb3.Checked := false;
      qCevap.FieldByName('secenek_3_secildi').AsString := 'H';
    end;
    if (TunidbCheckBox(sender) <> cb4) and (cb4.Checked) then
    begin
      cb4.Checked := false;
      qCevap.FieldByName('secenek_4_secildi').AsString := 'H';
    end;
    if (TunidbCheckBox(sender) <> cb5) and (cb5.Checked) then
    begin
      cb5.Checked := false;
      qCevap.FieldByName('secenek_5_secildi').AsString := 'H';
    end;
  end;
end;

procedure TfrmEDanismanCevapTanim.CevabiBosGecControl(Sender: TComponent;
  Res: Integer);
begin
  if Res <> mrYes then Exit;
  case qCevap.State of
    dsEdit    : qCevap.Delete;
    dsInsert  : qCevap.Cancel;
    dsBrowse  : qCevap.Delete;
  end;
  Self.ModalResult := mrIgnore;
end;

procedure TfrmEDanismanCevapTanim.CevabiDegistirControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;
  cevaplandi := false;
  ManageSettings;
  qCevap.Edit;
  SecenekleriGoster;
end;

procedure TfrmEDanismanCevapTanim.CevabiKaydetControl(Sender: TComponent; Res: Integer);
var
  i, j: integer;
  seciliSayisi: Integer;
  sonuc: string;
begin
  if Res = mrNo then Exit;

  sonuc := '';
  seciliSayisi := 0;

  for i := 1 to 5 do
  begin
    if qCevap.fieldByName('secenek_' + IntToStr(i) + '_secildi').AsString = 'E' then
    begin
      seciliSayisi := seciliSayisi +1;
      sonuc := sonuc + 'Sonuç ' + IntToStr(i) + ': ' + qCevap.fieldByName('secenek_' + IntToStr(i) + '_sonuc').AsString + '<br/><br/>';
    end;
  end;

  if (secenekSekli = 'RADIOBUTTON') and (seciliSayisi > 1) then
  begin
    MessageDlg('Bu soru için sadece bir seçenek iþaretlenebilir. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edSoru.SetFocus;
    Exit;
  end;

  if seciliSayisi = 0 then
  begin
    MessageDlg('En az bir seçeneði iþaretlemelisiniz. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edSoru.SetFocus;
    Exit;
  end;

  if qCevap.State in [dsInsert] then
  begin
    qCevap.FieldByName('id').AsInteger       := MainMod.GetSeq('sq_edns_soruseti_cevap_id');
    qCevap.FieldByName('soru_id').AsInteger  := soruId;
    qCevap.FieldByName('ss_id').AsInteger    := qSoru.FieldByName('ss_id').AsInteger;
    qCevap.FieldByName('mc_id').AsInteger    := MainMod.MCID;
    qCevap.FieldByName('idy').AsInteger      := MainMod.LoginInfo.ID;
    qCevap.FieldByName('idt').AsDateTime     := Now;
  end;
  qCevap.FieldByName('sdy').AsInteger        := MainMod.LoginInfo.ID;
  qCevap.FieldByName('sdt').AsDateTime       := Now;
  qCevap.Post;

//  if sonuc <> '' then
//    MessageDlg(sonuc, mtInformation, [mbOk]);

  ModalResult := mrOk;
end;

procedure TfrmEDanismanCevapTanim.CevabiKaydetmedenCikisControl(
  Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;
  qCevap.Cancel;
  self.ModalResult := mrCancel;
end;

function TfrmEDanismanCevapTanim.Exec(aSoruID: Integer): Integer;
begin
  soruId := aSoruId;
  qSoru.Close;
  qSoru.SQL.Text := 'SELECT * FROM edns_soruseti_soru WHERE id=' + IntToStr(asoruId);
  qSoru.Open;
  if qSoru.FieldByName('id').AsInteger <> asoruId then
    exit;
  secenekSekli := qSoru.FieldByName('secenek_sekli').AsString;

  if qSoru.FieldByName('ss_id').AsString = '' then
    exit;

  qSoruSeti.Close;
  qSoruSeti.SQL.Text := 'SELECT * FROM edns_soruseti WHERE id=' + IntToStr(qSoru.FieldByName('ss_id').AsInteger);
  qSoruSeti.Open;
  if qSoruSeti.FieldByName('bitis_tarihi').AsDateTime < now then
  begin
    btnBos.Enabled := false;
    btnPost.Enabled := false;
//    MessageDlg('Bitiþ Tarihi geçmiþ soru setinde deðiþiklik yapamazsýnýz.', mtWarning, [mbOk]);
//    exit;
  end;


  qCevap.Close;
  qCevap.SQL.Text := 'SELECT * FROM edns_soruseti_cevap WHERE soru_id=' + IntToStr(asoruId);
  qCevap.Open;
  cevaplandi := qCevap.FieldByName('soru_id').AsInteger = asoruId;
  if not cevaplandi then
    qCevap.Insert;

  SecenekleriGoster;
  ManageSettings;
  result := ShowModal;
  free;
end;

procedure TfrmEDanismanCevapTanim.ManageSettings;
begin
  if cevaplandi then
  begin
    btnCancel.Caption := 'Kapat';
    btnpost.Caption := 'Deðiþtir';
    cb1.Enabled := false;
    cb2.Enabled := false;
    cb3.Enabled := false;
    cb4.Enabled := false;
    cb5.Enabled := false;
  end
  else
  begin
    btnCancel.Caption := 'Ýptal';
    btnpost.Caption := 'Kaydet';
    cb1.Enabled := true;
    cb2.Enabled := true;
    cb3.Enabled := true;
    cb4.Enabled := true;
    cb5.Enabled := true;
  end;
end;



procedure TfrmEDanismanCevapTanim.pgSecenekChange(Sender: TObject);
begin
//  cb1.Caption := '';
end;

procedure TfrmEDanismanCevapTanim.SecenekleriGoster;
var
  i: integer;
begin
  if not cevaplandi then
  begin
//    dsCevap.AutoEdit := true;
    qCevap.fieldByName('secenek_1').AsString            := qSoru.fieldByName('secenek_1').AsString;
    qCevap.fieldByName('secenek_1_sonuc').AsString      := qSoru.fieldByName('secenek_1_sonuc').AsString;
    qCevap.FieldByName('secenek_1_riskseviye').AsString := qSoru.FieldByName('secenek_1_riskseviye').AsString;
    qCevap.FieldByName('secenek_1_risk').AsString       := qSoru.FieldByName('secenek_1_risk').AsString;
    pc1.Visible                                        := (qSoru.fieldByName('secenek_1').AsString <> '');
    qCevap.fieldByName('secenek_2').AsString            := qSoru.fieldByName('secenek_2').AsString;
    qCevap.fieldByName('secenek_2_sonuc').AsString      := qSoru.fieldByName('secenek_2_sonuc').AsString;
    qCevap.FieldByName('secenek_2_riskseviye').AsString := qSoru.FieldByName('secenek_2_riskseviye').AsString;
    qCevap.FieldByName('secenek_2_risk').AsString       := qSoru.FieldByName('secenek_2_risk').AsString;
    pc2.Visible                                        := (qSoru.fieldByName('secenek_2').AsString <> '');
    qCevap.fieldByName('secenek_3').AsString            := qSoru.fieldByName('secenek_3').AsString;
    qCevap.fieldByName('secenek_3_sonuc').AsString      := qSoru.fieldByName('secenek_3_sonuc').AsString;
    qCevap.FieldByName('secenek_3_riskseviye').AsString := qSoru.FieldByName('secenek_3_riskseviye').AsString;
    qCevap.FieldByName('secenek_3_risk').AsString       := qSoru.FieldByName('secenek_3_risk').AsString;
    pc3.Visible                                        := (qSoru.fieldByName('secenek_3').AsString <> '');
    qCevap.fieldByName('secenek_4').AsString            := qSoru.fieldByName('secenek_4').AsString;
    qCevap.fieldByName('secenek_4_sonuc').AsString      := qSoru.fieldByName('secenek_4_sonuc').AsString;
    qCevap.FieldByName('secenek_4_riskseviye').AsString := qSoru.FieldByName('secenek_4_riskseviye').AsString;
    qCevap.FieldByName('secenek_4_risk').AsString       := qSoru.FieldByName('secenek_4_risk').AsString;
    pc4.Visible                                        := (qSoru.fieldByName('secenek_4').AsString <> '');
    qCevap.fieldByName('secenek_5').AsString            := qSoru.fieldByName('secenek_5').AsString;
    qCevap.fieldByName('secenek_5_sonuc').AsString      := qSoru.fieldByName('secenek_5_sonuc').AsString;
    qCevap.FieldByName('secenek_5_riskseviye').AsString := qSoru.FieldByName('secenek_5_riskseviye').AsString;
    qCevap.FieldByName('secenek_5_risk').AsString       := qSoru.FieldByName('secenek_5_risk').AsString;
    pc5.Visible                                        := (qSoru.fieldByName('secenek_5').AsString <> '');

    qCevap.fieldByName('soru_no').AsString              := qSoru.fieldByName('soru_no').AsString;
    qCevap.fieldByName('soru_metni').AsString           := qSoru.fieldByName('soru_metni').AsString;
    qCevap.fieldByName('referans').AsString             := qSoru.fieldByName('referans').AsString;
  end
  else
  begin
//    dsCevap.AutoEdit := false;
    pc1.Visible                                         := (qSoru.fieldByName('secenek_1').AsString <> '');
    pc2.Visible                                         := (qSoru.fieldByName('secenek_2').AsString <> '');
    pc3.Visible                                         := (qSoru.fieldByName('secenek_3').AsString <> '');
    pc4.Visible                                         := (qSoru.fieldByName('secenek_4').AsString <> '');
    pc5.Visible                                         := (qSoru.fieldByName('secenek_5').AsString <> '');
  end;
end;

procedure TfrmEDanismanCevapTanim.UniBitBtn1Click(Sender: TObject);
begin
  frmHelpPage.Exec('EDanismanCevapTanim');
end;

procedure TfrmEDanismanCevapTanim.UniFormBeforeShow(Sender: TObject);
begin
  lbIDY.Caption := MainMod.KullaniciGetir(qCevap.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(qCevap.FieldByName('sdy').AsString);
  if qCevap.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qCevap.FieldByName('idt').AsDateTime);
  if qCevap.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qCevap.FieldByName('sdt').AsDateTime);
end;


end.
