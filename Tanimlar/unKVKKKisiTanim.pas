unit unKVKKKisiTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniButton, uniBitBtn, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses,
  uniMemo, uniDBMemo, Data.DB, DBAccess, Uni, MemDS;

type
  TfrmKVKKKisiTanim = class(TUniForm)
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
    qKisi: TUniQuery;
    dsKisi: TUniDataSource;
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

function frmKVKKKisiTanim: TfrmKVKKKisiTanim;

implementation

uses uniGUIApplication, MainModule, McMLib, unHelpPage;

{$R *.dfm}

function frmKVKKKisiTanim: TfrmKVKKKisiTanim;
begin
  Result := TfrmKVKKKisiTanim(MainMod.GetFormInstance(TfrmKVKKKisiTanim));
end;

procedure TfrmKVKKKisiTanim.btnCancelClick(Sender: TObject);
begin
  qKisi.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmKVKKKisiTanim.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmKVKKKisiTanim.btnPostClick(Sender: TObject);
begin
  if qKisi.FieldByName('kisi').AsString = '' then
  begin
    MessageDlg('Kiþi Tanýmý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edTanim.SetFocus;
    Exit;
  end;

  QueryOpen(MainMod.qTmp, 'SELECT COUNT(id) FROM def_data_kisi WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' AND id<>' + IntToStr(qKisi.fieldbyname('id').AsInteger) + ' AND kisi=''' + qKisi.fieldbyname('kisi').AsString + '''');
  if MainMod.qTmp.Fields[0].AsInteger > 0 then
  begin
    MessageDlg('Bu isimde farklý bir kiþi tanýmý bulunmaktadýr.', mtError, [mbOk]);
    Exit;
  end;

  if qKisi.State in [dsInsert] then
  begin
    qKisi.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_def_data_kisi_id');
    qKisi.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    qKisi.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    qKisi.FieldByName('idt').AsDateTime   := Now;
  end;
  qKisi.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  qKisi.FieldByName('sdt').AsDateTime     := Now;
  qKisi.Post;
  ModalResult := mrOk;
end;

function TfrmKVKKKisiTanim.Exec(AID, AOp: Integer): Integer;
begin
  if AOp = 0 then // Insert
  begin
    QueryOpen(qKisi, 'SELECT * FROM def_data_kisi WHERE id = 0');
    qKisi.Insert;
    YardimKw := 'IlgiliKisiYeniKayit';
  end
  else // Edit
  begin
    QueryOpen(qKisi, 'SELECT * FROM def_data_kisi WHERE id = ' + IntToStr(AID));
    qKisi.Edit;
    YardimKw := 'IlgiliKisiDegistirme';
  end;

  ActiveControl := edTanim;
  Result := ShowModal;
end;

procedure TfrmKVKKKisiTanim.UniFormBeforeShow(Sender: TObject);
begin
  lbIDY.Caption := MainMod.KullaniciGetir(qKisi.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(qKisi.FieldByName('sdy').AsString);

  if dsKisi.State = dsEdit then
  begin
    if lbIDY.Text = '' then lbIDY.Text := 'SÝSTEM';
    if lbSDY.Text = '' then lbSDY.Text := 'SÝSTEM';
  end;

  if qKisi.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qKisi.FieldByName('idt').AsDateTime);
  if qKisi.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qKisi.FieldByName('sdt').AsDateTime);
end;

end.
