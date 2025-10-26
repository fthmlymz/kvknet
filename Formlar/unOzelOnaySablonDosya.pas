unit unOzelOnaySablonDosya;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Clipbrd, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniButton, uniBitBtn, uniMemo, uniDBMemo, uniMultiItem, uniComboBox,
  uniDBComboBox, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses, Data.DB, DBAccess, Uni, uniDBLookupComboBox,
  MemDS, uniCheckBox, uniDBCheckBox, uniFileUpload, uniHTMLMemo, uniGroupBox,
  Vcl.Dialogs;

type
  TfrmOzelOnaySablonDosya = class(TUniForm)
    pnlData: TUniPanel;
    UniLabel3: TUniLabel;
    edTanim: TUniDBEdit;
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
    UniLabel9: TUniLabel;
    dsDosya: TUniDataSource;
    edDosyaTuru: TUniDBComboBox;
    SaveDlg: TSaveDialog;
    FileUp: TUniFileUpload;
    edHtml: TUniHTMLMemo;
    edDosyaAdi: TUniDBEdit;
    UniLabel1: TUniLabel;
    btnUpload: TUniButton;
    btnDownload: TUniButton;
    btnSil: TUniButton;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edDosyaTuruChange(Sender: TObject);
    procedure btnUploadClick(Sender: TObject);
    procedure btnSilClick(Sender: TObject);
    procedure btnDownloadClick(Sender: TObject);
    procedure FileUpCompleted(Sender: TObject; AStream: TFileStream);
  private
    Data : TUniQuery;
    Tur  : Integer;
    procedure LoadHTML;
    procedure SaveHTML;
    procedure DelDocControl(Sender: TComponent; Res: Integer);
  public
    function Edit(ATur:integer): Integer;
  end;

function frmOzelOnaySablonDosya: TfrmOzelOnaySablonDosya;

implementation

uses uniGUIApplication, MainModule, ServerModule, McMLib, unOzelOnaySablonTanim;

{$R *.dfm}

function frmOzelOnaySablonDosya: TfrmOzelOnaySablonDosya;
begin
  Result := TfrmOzelOnaySablonDosya(MainMod.GetFormInstance(TfrmOzelOnaySablonDosya));
end;

procedure TfrmOzelOnaySablonDosya.btnDownloadClick(Sender: TObject);
var
  AStream : TMemoryStream;
begin
  if Data.FieldByName('id').AsInteger < 1 then Exit;

  if not MainMod.LoginInfo.Yetkiler[152] then
  begin
    MessageDlg('Özel Onay Formlarýndan, Doküman indirme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if Data.FieldByName('dosya').AsString = '' then
  begin
    MessageDlg('Dosya yüklenmemiþ!', mtError, [mbOk]);
    Exit;
  end;

  AStream := TMemoryStream.Create;
  try
    TBlobField(Data.FieldByName('dosya')).SaveToStream(AStream);
    UniSession.SendStream(AStream, Data.FieldByName('dosya_adi').AsString);
  finally
    AStream.Free;
  end;
end;

procedure TfrmOzelOnaySablonDosya.btnUploadClick(Sender: TObject);
begin
  if edDosyaTuru.Text = 'HTML' then
  begin
    MessageDlg('HTML türünde dosya eklenemez, metni aþaðýdaki aracý kullanarak oluþturabilirsiniz.', mtError, [mbOk]);
    edDosyaturu.SetFocus;
    Exit;
  end;

  FileUp.Execute;
end;

procedure TfrmOzelOnaySablonDosya.DelDocControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  Data.Delete;
  ModalResult := mrOk;
end;

procedure TfrmOzelOnaySablonDosya.btnCancelClick(Sender: TObject);
begin
  Data.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmOzelOnaySablonDosya.btnPostClick(Sender: TObject);
begin
  if edDosyaTuru.ItemIndex < 0 then
  begin
    MessageDlg('Dosya Türü belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edDosyaturu.SetFocus;
    Exit;
  end;
  if Data.FieldByName('dosya_aciklama').AsString = '' then
  begin
    MessageDlg('Belge Tanýmý (Açýklamasý) belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edTanim.SetFocus;
    Exit;
  end;

  if edDosyaTuru.Text = 'HTML' then
  begin
    if edHtml.Text = '' then
    begin
      MessageDlg('HTML içeriði yazýlmamýþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
      edHtml.SetFocus;
      Exit;
    end;

    Data.FieldByName('dosya_adi').AsString := '';
    Data.FieldByName('dosya_uzantisi').AsString := 'html';
    SaveHTML;
  end
  else if edDosyaTuru.Text = 'PDF' then
  begin
    if Data.FieldByName('dosya').AsString = '' then
    begin
      MessageDlg('Dosya yüklenmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
      Exit;
    end;
  end;

  if Data.State in [dsInsert] then
  begin
    Data.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_def_data_ozelonay_docs_id');
    Data.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    Data.FieldByName('idt').AsDateTime   := Now;
  end;
  Data.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  Data.FieldByName('sdt').AsDateTime     := Now;
  Data.Post;
  ModalResult := mrOk;
end;

procedure TfrmOzelOnaySablonDosya.btnSilClick(Sender: TObject);
begin
  if not MainMod.LoginInfo.Yetkiler[151] then
  begin
    MessageDlg('Doküman silme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if Data.FieldByName('id').AsInteger < 1 then Exit;

  MessageDlg('Belgeyi silmek istediðinizden emin misiniz?', mtConfirmation, mbYesNo, DelDocControl);
end;

function TfrmOzelOnaySablonDosya.Edit(ATur:integer): Integer;
begin
  Tur := ATur;
  if Tur = 1 then
  begin
    Data    := frmOzelOnaySablonTanim.qDosyaBilgi;
    Caption := 'Özel Onay - Bilgilendirme Belgesi';
  end
  else if Tur = 2 then
  begin
    Data    := frmOzelOnaySablonTanim.qDosyaOnay;
    Caption := 'Özel Onay - Rýza/Onay Belgesi';
  end;

  edHTML.Text     := '';
  dsDosya.DataSet := Data;
  if Data.FieldByName('id').AsFloat = 0 then
  begin
    Data.Append;
    Data.FieldByName('tur').AsInteger      := Tur;
    Data.FieldByName('oo_id').AsInteger    := frmOzelOnaySablonTanim.qOzelOnay.FieldByName('id').AsInteger;
    Data.FieldByName('mc_id').AsInteger    := MainMod.MCID;
    Data.FieldByName('dosya_tur').AsString := 'PDF';
  end
  else
  begin
    Data.Edit;
    LoadHTML;
  end;
  ActiveControl := edDosyaTuru;

  edDosyaTuruChange(edDosyaTuru);
  Result := ShowModal;
end;

procedure TfrmOzelOnaySablonDosya.edDosyaTuruChange(Sender: TObject);
begin
  if edDosyaTuru.Text = 'HTML' then
  begin
    Width   := 720;
    Height  := 540;
    edHTML.Height := pnlData.Height - 80;
    edHtml.Visible        := True;
    btnUpload.Visible     := False;
    btnDownload.Visible   := False;
    edDosyaAdi.Visible    := False;
    UniLabel1.Visible     := False;
  end
  else if edDosyaTuru.Text = 'PDF' then
  begin
    Width   := 490;
    Height  := 300;
    edHTML.Height := pnlData.Height - 80;
    edHTML.Visible        := False;
    btnUpload.Visible     := True;
    btnDownload.Visible   := True;
    edDosyaAdi.Visible    := True;
    UniLabel1.Visible     := True;
  end;
end;

procedure TfrmOzelOnaySablonDosya.FileUpCompleted(Sender: TObject; AStream: TFileStream);
var
  fileExt: String;
begin
  try
    fileExt := UpperCase(ExtractFileExt(FileUp.FileName));
    if Pos(','+fileExt+',', ',.PDF,') <= 0 then
    begin
      MessageDlg('Sadece PDF dosyalarýný yükleyebilirsiniz.', mtInformation, [mbOk]);
      exit;
    end;

    Data.FieldByName('dosya_adi').AsString      := FileUp.FileName;
    Data.FieldByName('dosya_uzantisi').AsString := ExtractFileExt(FileUp.FileName);
    TBlobField(Data.FieldByName('dosya')).LoadFromStream(AStream);
    MessageDlg('Dosya yüklendi : ' + FileUp.FileName, mtInformation, [mbOk]);
  except
    raise;
  end;
end;

procedure TfrmOzelOnaySablonDosya.LoadHTML;
var
  TmpName : String;
  FUrl    : String;
begin
  if Data.FieldByName('dosya_tur').AsString <> 'HTML' then Exit;

  TmpName := ServerMod.NewCacheFileUrl(False, 'html', '', '', FUrl, True);
  TBlobField(Data.FieldByName('dosya')).SaveToFile(TmpName);
  edHTML.Lines.LoadFromFile(TmpName);
end;

procedure TfrmOzelOnaySablonDosya.SaveHTML;
var
  TmpName : String;
  FUrl    : String;
begin
  if Data.FieldByName('dosya_tur').AsString <> 'HTML' then Exit;

  TmpName := ServerMod.NewCacheFileUrl(False, 'html', '', '', FUrl, True);
  edHTML.Lines.SaveToFile(TmpName);
  TBlobField(Data.FieldByName('dosya')).LoadFromFile(TmpName);
end;

procedure TfrmOzelOnaySablonDosya.UniFormBeforeShow(Sender: TObject);
begin
  FileUp.MaxAllowedSize := KVKFileSize;
  lbIDY.Caption := MainMod.KullaniciGetir(Data.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(Data.FieldByName('sdy').AsString);
  if Data.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', Data.FieldByName('idt').AsDateTime);
  if Data.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', Data.FieldByName('sdt').AsDateTime);
end;

end.
