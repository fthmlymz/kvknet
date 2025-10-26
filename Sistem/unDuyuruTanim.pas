unit unDuyuruTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniButton, uniBitBtn, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses,
  uniMemo, uniDBMemo, Data.DB, DBAccess, Uni, MemDS, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDateTimePicker, uniDBDateTimePicker, uniHTMLMemo,
  uniDBLookupComboBox;

type
  TfrmDuyuruTanim = class(TUniForm)
    pnlData: TUniPanel;
    UniLabel9: TUniLabel;
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
    qDuyuru: TUniQuery;
    dsDuyuru: TUniDataSource;
    qTmp: TUniQuery;
    edBody: TUniHTMLMemo;
    UniLabel2: TUniLabel;
    UniLabel1: TUniLabel;
    edTarih: TUniDBDateTimePicker;
    edKurum: TUniComboBox;
    UniLabel3: TUniLabel;
    edTitle: TUniDBMemo;
    btnHelp: TUniBitBtn;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    YardimKw : string;
    procedure LoadKurumlar;
    function GetKurumID: Integer;
    function GetKurumIndex: Integer;

  public
    function Exec(AID, AOp: Integer): Integer;
  end;

function frmDuyuruTanim: TfrmDuyuruTanim;

implementation

uses uniGUIApplication, MainModule, McMLib, unHelpPage;

{$R *.dfm}

function frmDuyuruTanim: TfrmDuyuruTanim;
begin
  Result := TfrmDuyuruTanim(MainMod.GetFormInstance(TfrmDuyuruTanim));
end;

procedure TfrmDuyuruTanim.btnCancelClick(Sender: TObject);
begin
  qDuyuru.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmDuyuruTanim.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmDuyuruTanim.btnPostClick(Sender: TObject);
var
  sTmp : String;
begin
  if qDuyuru.FieldByName('title').AsString = '' then
  begin
    MessageDlg('Duyuru baþlýðý girilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edTitle.SetFocus;
    Exit;
  end;
  if edBody.Text = '' then
  begin
    MessageDlg('Duyuru detayý (metni) girilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edBody.SetFocus;
    Exit;
  end;
  if edKurum.ItemIndex < 0 then
  begin
    MessageDlg('Duyurunun hangi kurum(lar)da yayýnlanacaðý belirtilmemiþ. Lütfen Kurum seçiniz.', mtError, [mbOk]);
    edKurum.SetFocus;
    Exit;
  end;

  if edKurum.Text = 'TÜM KURUMLAR' then qDuyuru.FieldByName('mc_id').AsInteger := 0
   else qDuyuru.FieldByName('mc_id').AsInteger := GetKurumID;

  sTmp := edBody.Text;
  sTmp := StringReplace(sTmp, '<a href="', '<a target="_blank" rel="noopener noreferrer" href="', [rfReplaceAll]);
  qDuyuru.FieldByName('description').AsString := sTmp;

  if qDuyuru.State in [dsInsert] then
  begin
    qDuyuru.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_sys_news_id');
    qDuyuru.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    qDuyuru.FieldByName('idt').AsDateTime   := Now;
  end;
  qDuyuru.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  qDuyuru.FieldByName('sdt').AsDateTime     := Now;
  qDuyuru.Post;
  ModalResult := mrOk;
end;

function TfrmDuyuruTanim.Exec(AID, AOp: Integer): Integer;
begin
  if AOp = 0 then // Insert
  begin
    QueryOpen(qDuyuru, 'SELECT * FROM sys_news WHERE id = 0');
    qDuyuru.Insert;
    edBody.Text := '';
    qDuyuru.fieldbyname('news_date').AsDateTime := Now;
    qDuyuru.FieldByName('gc_id').AsInteger      := MainMod.GCID;
    YardimKw := 'DuyuruListeYeniKayit';
    if MainMod.LoginInfo.Yetkiler[143] = False then
    begin
      qDuyuru.FieldByName('mc_id').AsInteger := MainMod.MCID;
    end;
  end
  else // Edit
  begin
    QueryOpen(qDuyuru, 'SELECT * FROM sys_news WHERE id = ' + IntToStr(AID));
    edBody.Text := qDuyuru.FieldByName('description').AsString;
    qDuyuru.Edit;
    YardimKw := 'DuyuruDegistirmeSilme';
  end;

  edKurum.Items.Clear;
  if MainMod.LoginInfo.Yetkiler[143] then
  begin
    edKurum.Items.Add('TÜM KURUMLAR');
    LoadKurumlar;
  end
  else
  begin
    edKurum.Items.Add(MainMod.MCTitle);
  end;

  edKurum.ItemIndex := GetKurumIndex;
  ActiveControl := edKurum;
  Result := ShowModal;
end;

function TfrmDuyuruTanim.GetKurumID: Integer;
var
  Krm : String;
begin
  Result := 0;
  Krm := edKurum.Text;
  QueryOpen(qTmp, 'SELECT * FROM sys_mcdef WHERE title = ''' + Krm + ''' AND gc_id = ' + IntToSTr(MainMod.GCID));
  if qTmp.FieldByName('title').AsString = Krm then Result := qTmp.FieldByName('id').AsInteger;
end;

function TfrmDuyuruTanim.GetKurumIndex: Integer;
var
  KID : Integer;
begin
  Result := 0;
  if qDuyuru.FieldByName('mc_id').AsInteger < 1 then Exit;
  KID := qDuyuru.FieldByName('mc_id').AsInteger;
  QueryOpen(qTmp, 'SELECT * FROM sys_mcdef WHERE id = ' + IntToStr(KID));
  if qTmp.FieldByName('id').AsInteger <> KID then Exit;

  Result := edKurum.Items.IndexOf(qTmp.FieldByName('title').AsString);
end;

procedure TfrmDuyuruTanim.LoadKurumlar;
begin
  QueryOpen(qTmp, 'SELECT * FROM sys_mcdef WHERE active = ''E'' AND gc_id = ' + IntToStr(MainMod.GCID) + ' ORDER BY title');
  while not qTmp.EOF do
  begin
    edKurum.Items.Add(qTmp.FieldByName('title').AsString);
    qTmp.Next;
  end;
end;

procedure TfrmDuyuruTanim.UniFormBeforeShow(Sender: TObject);
begin
  lbIDY.Caption := MainMod.KullaniciGetir(qDuyuru.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(qDuyuru.FieldByName('sdy').AsString);
  if qDuyuru.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qDuyuru.FieldByName('idt').AsDateTime);
  if qDuyuru.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qDuyuru.FieldByName('sdt').AsDateTime);

  edKurum.Visible := mainmod.LoginInfo.MCID = 0;
end;

end.
