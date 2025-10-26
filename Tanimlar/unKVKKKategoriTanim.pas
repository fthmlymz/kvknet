unit unKVKKKategoriTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uniPanel,
  uniButton, uniBitBtn, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses, uniMemo,
  uniDBMemo, Data.DB, DBAccess, Uni, MemDS;

type
  TfrmKVKKKategoriTanim = class(TUniForm)
    pnlData: TUniPanel;
    UniLabel2: TUniLabel;
    UniLabel9: TUniLabel;
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
    edDesc: TUniDBMemo;
    qKategori: TUniQuery;
    dsKategori: TUniDataSource;
    qTmp: TUniQuery;
    btnHelp: TUniBitBtn;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    YardimKw : string;
  public
    function Exec(AID, AOp: Integer): Integer;
  end;

function frmKVKKKategoriTanim: TfrmKVKKKategoriTanim;

implementation

uses
  uniGUIApplication, MainModule, McMLib, unHelpPage;

{$R *.dfm}

function frmKVKKKategoriTanim: TfrmKVKKKategoriTanim;
begin
  Result := TfrmKVKKKategoriTanim(MainMod.GetFormInstance(TfrmKVKKKategoriTanim));
end;

procedure TfrmKVKKKategoriTanim.btnCancelClick(Sender: TObject);
begin
  qKategori.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmKVKKKategoriTanim.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmKVKKKategoriTanim.btnPostClick(Sender: TObject);
begin
  if qKategori.FieldByName('kategori').AsString = '' then
  begin
    MessageDlg('Veri Kategorisi Tanýmý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edTanim.SetFocus;
    Exit;
  end;

  if qKategori.State in [dsInsert] then
  begin
    qKategori.FieldByName('id').AsInteger := MainMod.GetSeq('sq_def_data_kategori_id');
    qKategori.FieldByName('mc_id').AsInteger := MainMod.MCID;
    qKategori.FieldByName('idy').AsInteger := MainMod.LoginInfo.ID;
    qKategori.FieldByName('idt').AsDateTime := Now;
  end;
  qKategori.FieldByName('sdy').AsInteger := MainMod.LoginInfo.ID;
  qKategori.FieldByName('sdt').AsDateTime := Now;
  qKategori.Post;
  ModalResult := mrOk;
end;

function TfrmKVKKKategoriTanim.Exec(AID, AOp: Integer): Integer;
begin
  if AOp = 0 then // Insert
  begin
    QueryOpen(qKategori, 'SELECT * FROM def_data_kategori WHERE id = 0');
    qKategori.Insert;
    YardimKw := 'VeriKategorisiYeniKayit';
  end
  else // Edit
  begin
    QueryOpen(qKategori, 'SELECT * FROM def_data_kategori WHERE id = ' + IntToStr(AID));
    qKategori.Edit;
    YardimKw := 'VeriKategorisiDegistirme';
  end;

  ActiveControl := edTanim;
  Result := ShowModal;
end;

procedure TfrmKVKKKategoriTanim.UniFormBeforeShow(Sender: TObject);
begin
  lbIDY.Caption := MainMod.KullaniciGetir(qKategori.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(qKategori.FieldByName('sdy').AsString);

  if dsKategori.State = dsEdit then
  begin
    if lbIDY.Text = '' then lbIDY.Text := 'SÝSTEM';
    if lbSDY.Text = '' then lbSDY.Text := 'SÝSTEM';
  end;
  if qKategori.FieldByName('idt').AsString = '' then
    lbIDT.Caption := ''
  else
    lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qKategori.FieldByName('idt').AsDateTime);
  if qKategori.FieldByName('sdt').AsString = '' then
    lbSDT.Caption := ''
  else
    lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qKategori.FieldByName('sdt').AsDateTime);
end;

end.

