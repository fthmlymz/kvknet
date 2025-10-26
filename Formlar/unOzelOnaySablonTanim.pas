unit unOzelOnaySablonTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Clipbrd, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniButton, uniBitBtn, uniMemo, uniDBMemo, uniMultiItem, uniComboBox,
  uniDBComboBox, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses, Data.DB, DBAccess, Uni, uniDBLookupComboBox,
  MemDS, uniCheckBox, uniDBCheckBox, uniGroupBox, uniPageControl, uniBasicGrid,
  uniDBGrid, VirtualTable, uniImage;

type
  TfrmOzelOnaySablonTanim = class(TUniForm)
    dsOzelOnay: TUniDataSource;
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
    qDosyaBilgi: TUniQuery;
    btnEdit: TUniBitBtn;
    qDosyaOnay: TUniQuery;
    qOzelOnay: TUniQuery;
    dsDosyaBilgi: TUniDataSource;
    dsDosyaOnay: TUniDataSource;
    PgControl: TUniPageControl;
    pgGenel: TUniTabSheet;
    pgVeriKaynagi: TUniTabSheet;
    UniLabel1: TUniLabel;
    edDurum: TUniDBComboBox;
    UniLabel3: TUniLabel;
    edTanim: TUniDBEdit;
    UniLabel8: TUniLabel;
    edDesc: TUniDBMemo;
    grBilgilendirme: TUniGroupBox;
    btnBilgiDetail: TUniButton;
    edBilgiTur: TUniDBEdit;
    edBilgiAciklama: TUniDBEdit;
    edAcikRiza: TUniDBCheckBox;
    grRiza: TUniGroupBox;
    btnOnayDetail: TUniButton;
    edOnayTur: TUniDBEdit;
    edOnayAciklama: TUniDBEdit;
    UniLabel2: TUniLabel;
    edWebLink: TUniEdit;
    btnPrepLink: TUniBitBtn;
    btnGoToLink: TUniBitBtn;
    edIYSOnay: TUniDBCheckBox;
    UniLabel11: TUniLabel;
    grdVK: TUniDBGrid;
    btnVKAdd: TUniBitBtn;
    btnVKDel: TUniBitBtn;
    tblOzelVK: TVirtualTable;
    dsOzelVK: TUniDataSource;
    btnQRCode: TUniBitBtn;
    imgQRCode: TUniImage;
    UniDBComboBox1: TUniDBComboBox;
    UniLabel9: TUniLabel;
    btnYardim: TUniBitBtn;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edAcikRizaClick(Sender: TObject);
    procedure btnGoToLinkClick(Sender: TObject);
    procedure btnPrepLinkClick(Sender: TObject);
    procedure btnBilgiDetailClick(Sender: TObject);
    procedure btnOnayDetailClick(Sender: TObject);
    procedure dsOzelOnayStateChange(Sender: TObject);
    procedure btnVKAddClick(Sender: TObject);
    procedure btnVKDelClick(Sender: TObject);
    procedure btnQRCodeClick(Sender: TObject);
    procedure btnYardimClick(Sender: TObject);
  private
    YardimKw : string;
    function CheckID(AID: Integer; ATable: TVirtualTable): Boolean;
    function ListToStr(ATable: TVirtualTable): String;
    procedure ManageSettings;
    procedure PrepareTables;
    procedure CloseTables;
    procedure StrToListVK;
    procedure DelVKControl(Sender: TComponent; Res: Integer);
  public
    function Exec(AID, AOp: Integer): Integer;
  end;

function frmOzelOnaySablonTanim: TfrmOzelOnaySablonTanim;

implementation

uses uniGUIApplication, MainModule, McMLib, unOzelOnaySablonDosya, unKVKKKaynakSec,
  ServerModule, unHelpPage;

{$R *.dfm}

function frmOzelOnaySablonTanim: TfrmOzelOnaySablonTanim;
begin
  Result := TfrmOzelOnaySablonTanim(MainMod.GetFormInstance(TfrmOzelOnaySablonTanim));
end;

procedure TfrmOzelOnaySablonTanim.btnBilgiDetailClick(Sender: TObject);
begin
  if qOzelOnay.FieldByName('id').AsInteger < 1 then qOzelOnay.FieldByName('id').AsInteger := MainMod.GetSeq('sq_def_data_ozelonay_id');

  frmOzelOnaySablonDosya.Edit(1);
end;

procedure TfrmOzelOnaySablonTanim.btnCancelClick(Sender: TObject);
begin
  if btnCancel.Caption = 'Ýptal' then
  begin
    qOzelOnay.Cancel;
    qDosyaBilgi.CancelUpdates;
    qDosyaOnay.CancelUpdates;
    ManageSettings;
  end
  else
  begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmOzelOnaySablonTanim.btnEditClick(Sender: TObject);
begin
  qOzelOnay.Edit;
  ManageSettings;
end;

procedure TfrmOzelOnaySablonTanim.btnPostClick(Sender: TObject);
begin
  if edDurum.ItemIndex < 0 then
  begin
    MessageDlg('Belge Durumu belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edDurum.SetFocus;
    Exit;
  end;
  if qOzelOnay.FieldByName('tanim').AsString = '' then
  begin
    MessageDlg('Belge Tanýmý (Konusu) belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edTanim.SetFocus;
    Exit;
  end;

  if qDosyaBilgi.RecordCount < 1 then
  begin
    MessageDlg('Bilgilendirme dosyasý kaydedilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    Exit;
  end;

  if qOzelOnay.FieldByName('onay_var').AsString = 'E' then
  begin
    if qDosyaOnay.RecordCount < 1 then
    begin
      MessageDlg('Onay dosyasý kaydedilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
      Exit;
    end;
  end
  else
  begin
    qDosyaOnay.First;
    while not qDosyaOnay.EOF do qDosyaOnay.Delete;
  end;

  qOzelOnay.FieldByName('vk_ids').AsString := ListToStr(tblOzelVK);

  if qOzelOnay.State in [dsInsert] then
  begin
    if qOzelOnay.FieldByName('id').AsInteger< 1 then qOzelOnay.FieldByName('id').AsInteger := MainMod.GetSeq('sq_def_data_ozelonay_id');
    qOzelOnay.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    qOzelOnay.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    qOzelOnay.FieldByName('idt').AsDateTime   := Now;
  end;
  qOzelOnay.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  qOzelOnay.FieldByName('sdt').AsDateTime     := Now;
  if qOzelOnay.FieldByName('aguid').AsString = '' then qOzelOnay.FieldByName('aguid').AsString   := MainMod.NewGuid;
  qOzelOnay.Post;

  try
    MainMod.DBMain.StartTransaction;
    qDosyaBilgi.ApplyUpdates();
    qDosyaBilgi.CommitUpdates;
    qDosyaOnay.ApplyUpdates();
    qDosyaOnay.CommitUpdates;
    MainMod.DBMain.Commit;
  except
    qDosyaBilgi.CancelUpdates;
    qDosyaOnay.CancelUpdates;
    MainMod.DBMain.Rollback;
  end;

  ManageSettings;
end;

procedure TfrmOzelOnaySablonTanim.btnPrepLinkClick(Sender: TObject);
begin
  if qOzelOnay.FieldByName('aguid').AsString = '' then
  begin
    qOzelOnay.FieldByName('aguid').AsString   := MainMod.NewGuid;
    edWebLink.Text := MainMod.OzelOnayLink + qOzelOnay.FieldByName('aguid').AsString;
    MainMod.CreateQRCode(edWebLink.Text, imgQRCode);
  end;
end;

procedure TfrmOzelOnaySablonTanim.btnQRCodeClick(Sender: TObject);
var
  aQRCodeFile: String;
  FUrl: String;
begin
  if qOzelOnay.State in [dsInsert] then
  begin
    MessageDlg('Link adresi henüz hazýr deðil. Bilgileri kaydettiðinizde baðlantýlar da hazýr olacak.', mtError, [mbOk]);
    Exit;
  end;
  if edWebLink.Text = '' then
  begin
    MessageDlg('Link adresi henüz hazýr deðil. Bilgileri kaydettiðinizde baðlantýlar da hazýr olacak.', mtError, [mbOk]);
    Exit;
  end;

//  MainMod.CreateQRCode(edWebLink.Text, imgQRCode);
  aQRCodeFile := ServerMod.NewCacheFileUrl(False, 'png', '', '', FUrl, True);
  imgQRCode.Picture.SaveToFile(aQRCodeFile);
  if aQRCodeFile <> '' then
    UniSession.SendFile(aQRCodeFile, 'Karekod.png');
end;

procedure TfrmOzelOnaySablonTanim.btnVKAddClick(Sender: TObject);
var
  i      : Integer;
  ACount : Integer;
  AID    : Integer;
  AName  : String;
  IDList : String;
begin
  IDList := MainMod.MakeIDList(tblOzelVK);
  frmKVKKKaynakSec.GizliKriter := 'id IN (SELECT DISTINCT kaynak_id FROM data_envanter WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) + ') ';
  ACount := frmKVKKKaynakSec.Select(True);
  for i := 0 to ACount - 1 do
  begin
    frmKVKKKaynakSec.qTanim.GotoBookmark(frmKVKKKaynakSec.grdList.SelectedRows[i]);
    AID   := frmKVKKKaynakSec.qTanim.FieldByName('id').AsInteger;
    AName := frmKVKKKaynakSec.qTanim.FieldByName('kaynak').AsString;

    if not CheckID(AID, tblOzelVK) then
    begin
      tblOzelVK.Insert;
      tblOzelVK.FieldByName('id').AsInteger  := AID;
      tblOzelVK.FieldByName('name').AsString := AName;
//      tblOzelVK.FieldByName('onay_var').AsString := 'H';
//      tblOzelVK.FieldByName('iys_var').AsString := 'H';
      tblOzelVK.Post;
    end;
  end;
end;

procedure TfrmOzelOnaySablonTanim.btnVKDelClick(Sender: TObject);
var
  Msg : String;
begin
  if tblOzelVK.FieldByName('id').AsInteger < 1 then Exit;

  if not MainMod.LoginInfo.Yetkiler[153] then
  begin
    MessageDlg('Tanýmlar içerisinden veri kaynaðý silme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  Msg := 'Listeden "' + tblOzelVK.FieldByName('name').AsString + '" veri kaynaðýný çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelVKControl);
end;

procedure TfrmOzelOnaySablonTanim.btnYardimClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

function TfrmOzelOnaySablonTanim.CheckID(AID: Integer; ATable: TVirtualTable): Boolean;
begin
  Result := False;
  ATable.First;
  while not ATable.EOF do
  begin
    if ATable.FieldByName('id').AsInteger = AID then
    begin
      Result := True;
      Break;
    end;
    ATable.Next;
  end;
end;

procedure TfrmOzelOnaySablonTanim.CloseTables;
begin
  qDosyaBilgi.Close;
  qDosyaOnay.Close;
  qOzelOnay.Close;
end;

procedure TfrmOzelOnaySablonTanim.DelVKControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  tblOzelVK.Delete;
end;

procedure TfrmOzelOnaySablonTanim.dsOzelOnayStateChange(Sender: TObject);
begin
  ManageSettings;
end;

procedure TfrmOzelOnaySablonTanim.edAcikRizaClick(Sender: TObject);
begin
  grRiza.Enabled := edAcikRiza.Checked;

  if not edAcikRiza.Checked then
  begin
    if qDosyaOnay.RecordCount > 0 then
    begin
      MessageDlg('Onay / Açýk Rýza için sisteme dosya eklenmiþ. Bu þekli ile bilgileri kaydederseniz eklenen dosya iptal edilecek.', mtWarning, [mbOk]);
    end;
  end ;
  edIYSOnay.Enabled :=  edAcikRiza.Checked;


end;

procedure TfrmOzelOnaySablonTanim.btnGoToLinkClick(Sender: TObject);
begin
  if qOzelOnay.State in [dsInsert] then
  begin
    MessageDlg('Link adresi henüz hazýr deðil. Bilgileri kaydettiðinizde baðlantýlar da hazýr olacak.', mtError, [mbOk]);
    Exit;
  end;
  if edWebLink.Text = '' then
  begin
    MessageDlg('Link adresi henüz hazýr deðil. Bilgileri kaydettiðinizde baðlantýlar da hazýr olacak.', mtError, [mbOk]);
    Exit;
  end;

  UniSession.BrowserWindow(edWebLink.Text, 0, 0, '_blank');
end;

procedure TfrmOzelOnaySablonTanim.btnOnayDetailClick(Sender: TObject);
begin
  if qOzelOnay.FieldByName('id').AsInteger < 1 then qOzelOnay.FieldByName('id').AsInteger := MainMod.GetSeq('sq_def_data_ozelonay_id');

  frmOzelOnaySablonDosya.Edit(2);
end;

function TfrmOzelOnaySablonTanim.Exec(AID, AOp: Integer): Integer;
begin
  if AOp = 0 then // Insert
  begin
    QueryOpen(qOzelOnay, 'SELECT * FROM def_data_ozelonay WHERE id = 0');
    qOzelOnay.Insert;
    qOzelOnay.FieldByName('durum').AsString     := 'ÝNCELEMEDE';
    qOzelOnay.FieldByName('onay_var').AsString  := 'H';
    qOzelOnay.FieldByName('iys_var').AsString   := 'H';
    qOzelOnay.FieldByName('aguid').AsString     := '';
    YardimKw := 'OzelOnaySablonYeniKayit'
  end
  else // Edit
  begin
    QueryOpen(qOzelOnay, 'SELECT * FROM def_data_ozelonay WHERE id = ' + IntToStr(AID));
    qOzelOnay.Edit;
    YardimKw := 'OzelOnaySablonDegistirme'
  end;

  edAcikRizaClick(edAcikRiza);
  PrepareTables;
  ActiveControl := edDurum;
  Result := ShowModal;
  CloseTables;
end;

function TfrmOzelOnaySablonTanim.ListToStr(ATable: TVirtualTable): String;
var
  sTmp : String;
begin
  sTmp := '';
  ATable.First;
  while not ATable.EOF do
  begin
    sTmp := sTmp + ATable.FieldByName('id').AsString + ',';
    ATable.Next;
  end;

  if Length(sTmp) > 0 then System.Delete(sTmp, Length(sTmp), 1);
  Result := sTmp;
end;

procedure TfrmOzelOnaySablonTanim.ManageSettings;
begin
  btnEdit.Enabled      := MainMod.LoginInfo.Yetkiler[149] and (qOzelOnay.State = dsBrowse) and (qOzelOnay.FieldByName('id').AsInteger > 0);
  btnPost.Enabled      := DataEditing(qOzelOnay);

  btnBilgiDetail.Enabled := btnPost.Enabled;
  btnOnayDetail.Enabled  := btnPost.Enabled;
  btnPrepLink.Enabled    := btnPost.Enabled;
  btnGoToLink.Enabled    := not btnPost.Enabled;
  btnQRCode.Enabled      := not btnPost.Enabled;

  if btnPost.Enabled then
  begin
    btnCancel.Caption := 'Ýptal';
//    btnCancel.ImageIndex := 2;
  end
  else
  begin
    btnCancel.Caption := 'Kapat';
//    btnCancel.ImageIndex := 3;
  end;
end;

procedure TfrmOzelOnaySablonTanim.PrepareTables;
begin
  if qOzelOnay.FieldByName('id').AsInteger < 1 then qOzelOnay.FieldByName('id').AsInteger := MainMod.GetSeq('sq_def_data_ozelonay_id');

  tblOzelVK.Open;
  StrToListVK;

  qDosyaBilgi.Close;
  qDosyaBilgi.Params[0].AsInteger := qOzelOnay.FieldByName('id').AsInteger;
  qDosyaBilgi.Open;

  qDosyaOnay.Close;
  qDosyaOnay.Params[0].AsInteger := qOzelOnay.FieldByName('id').AsInteger;
  qDosyaOnay.Open;
end;

procedure TfrmOzelOnaySablonTanim.StrToListVK;
begin
  if qOzelOnay.FieldByName('vk_ids').AsString = '' then Exit;

  QueryOpen(qTmp, 'SELECT id, kaynak FROM def_data_kaynak WHERE id in (' + qOzelOnay.FieldByName('vk_ids').AsString + ') ' +
                  ' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY id');

  tblOzelVK.First;
  while not tblOzelVK.EOF do tblOzelVK.Delete;

  qTmp.First;
  while not qTmp.EOF do
  begin
    tblOzelVK.Append;
    tblOzelVK.FieldByName('id').AsInteger   := qTmp.FieldByName('id').AsInteger;
    tblOzelVK.FieldByName('name').AsString  := qTmp.FieldByName('kaynak').AsString;
    tblOzelVK.Post;

    qTmp.Next;
  end;
end;

procedure TfrmOzelOnaySablonTanim.UniFormBeforeShow(Sender: TObject);
begin
  PgControl.ActivePage := pgGenel;
  edIYSOnay.Visible := MainMod.IYSVar;

  if qOzelOnay.FieldByName('aguid').AsString = '' then edWebLink.Text := ''
  else
  begin
    edWebLink.Text := MainMod.OzelOnayLink + qOzelOnay.FieldByName('aguid').AsString;
    MainMod.CreateQRCode(edWebLink.Text, imgQRCode);
  end;

  ManageSettings;
  lbIDY.Caption := MainMod.KullaniciGetir(qOzelOnay.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(qOzelOnay.FieldByName('sdy').AsString);

  if dsOzelOnay.State = dsEdit then
  begin
    if lbIDY.Text = '' then lbIDY.Text := 'SÝSTEM';
    if lbSDY.Text = '' then lbSDY.Text := 'SÝSTEM';
  end;

  if qOzelOnay.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qOzelOnay.FieldByName('idt').AsDateTime);
  if qOzelOnay.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qOzelOnay.FieldByName('sdt').AsDateTime);
end;

end.
