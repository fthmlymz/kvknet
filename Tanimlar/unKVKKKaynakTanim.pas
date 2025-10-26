unit unKVKKKaynakTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uniPanel,
  uniButton, uniBitBtn, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses, uniMemo,
  uniDBMemo, Data.DB, DBAccess, Uni, MemDS;

type
  TfrmKVKKKaynakTanim = class(TUniForm)
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
    qKaynak: TUniQuery;
    dsKaynak: TUniDataSource;
    qTmp: TUniQuery;
    btnHelp: TUniBitBtn;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    YardimKw: string;
  public
    function Exec(AID, AOp: Integer): Integer;
  end;

function frmKVKKKaynakTanim: TfrmKVKKKaynakTanim;

implementation

uses
  uniGUIApplication, MainModule, McMLib, unHelpPage;

{$R *.dfm}

function frmKVKKKaynakTanim: TfrmKVKKKaynakTanim;
begin
  Result := TfrmKVKKKaynakTanim(MainMod.GetFormInstance(TfrmKVKKKaynakTanim));
end;

procedure TfrmKVKKKaynakTanim.btnCancelClick(Sender: TObject);
begin
  qKaynak.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmKVKKKaynakTanim.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmKVKKKaynakTanim.btnPostClick(Sender: TObject);
begin
  if qKaynak.FieldByName('kaynak').AsString = '' then
  begin
    MessageDlg('Veri Kaynaðý Tanýmý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edTanim.SetFocus;
    Exit;
  end;

  QueryOpen(MainMod.qTmp, 'SELECT COUNT(id) FROM def_data_kaynak WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' AND id<>' + IntToStr(qKaynak.fieldbyname('id').AsInteger) + ' AND kaynak=''' + qKaynak.fieldbyname('kaynak').AsString + '''');
  if MainMod.qTmp.Fields[0].AsInteger > 0 then
  begin
    MessageDlg('Bu isimde farklý bir kaynak kaydý bulunmaktadýr.', mtError, [mbOk]);
    Exit;
  end;

  if qKaynak.State in [dsInsert] then
  begin
    qKaynak.FieldByName('id').AsInteger := MainMod.GetSeq('sq_def_data_kaynak_id');
    qKaynak.FieldByName('mc_id').AsInteger := MainMod.MCID;
    qKaynak.FieldByName('idy').AsInteger := MainMod.LoginInfo.ID;
    qKaynak.FieldByName('idt').AsDateTime := Now;
  end;
  qKaynak.FieldByName('sdy').AsInteger := MainMod.LoginInfo.ID;
  qKaynak.FieldByName('sdt').AsDateTime := Now;
  qKaynak.Post;
  ModalResult := mrOk;
end;

function TfrmKVKKKaynakTanim.Exec(AID, AOp: Integer): Integer;
begin
  if AOp = 0 then // Insert
  begin
    QueryOpen(qKaynak, 'SELECT * FROM def_data_kaynak WHERE id = 0');
    qKaynak.Insert;
    YardimKw := 'VeriKaynaklariYeniKayit';
  end
  else // Edit
  begin
    QueryOpen(qKaynak, 'SELECT * FROM def_data_kaynak WHERE id = ' + IntToStr(AID));
    qKaynak.Edit;
    YardimKw := 'VeriKaynaklariDegistirme';
  end;

  ActiveControl := edTanim;
  Result := ShowModal;
end;

procedure TfrmKVKKKaynakTanim.UniFormBeforeShow(Sender: TObject);
begin
  lbIDY.Caption := MainMod.KullaniciGetir(qKaynak.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(qKaynak.FieldByName('sdy').AsString);

  if dsKaynak.State = dsEdit then
  begin
    if lbIDY.Text = '' then lbIDY.Text := 'SÝSTEM';
    if lbSDY.Text = '' then lbSDY.Text := 'SÝSTEM';
  end;

  if qKaynak.FieldByName('idt').AsString = '' then
    lbIDT.Caption := ''
  else
    lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qKaynak.FieldByName('idt').AsDateTime);
  if qKaynak.FieldByName('sdt').AsString = '' then
    lbSDT.Caption := ''
  else
    lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qKaynak.FieldByName('sdt').AsDateTime);
end;

end.

