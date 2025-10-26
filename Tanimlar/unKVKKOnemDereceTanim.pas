unit unKVKKOnemDereceTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniButton, uniBitBtn, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses,
  uniMemo, uniDBMemo, Data.DB, DBAccess, Uni, MemDS;

type
  TfrmKVKKOnemDereceTanim = class(TUniForm)
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
    qOnemDerece: TUniQuery;
    dsOnemDerece: TUniDataSource;
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

function frmKVKKOnemDereceTanim: TfrmKVKKOnemDereceTanim;

implementation

uses uniGUIApplication, MainModule, McMLib, unHelpPage;

{$R *.dfm}

function frmKVKKOnemDereceTanim: TfrmKVKKOnemDereceTanim;
begin
  Result := TfrmKVKKOnemDereceTanim(MainMod.GetFormInstance(TfrmKVKKOnemDereceTanim));
end;

procedure TfrmKVKKOnemDereceTanim.btnCancelClick(Sender: TObject);
begin
  qOnemDerece.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmKVKKOnemDereceTanim.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmKVKKOnemDereceTanim.btnPostClick(Sender: TObject);
begin
  if qOnemDerece.FieldByName('onemderece').AsString = '' then
  begin
    MessageDlg('Önem Derecesi belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edTanim.SetFocus;
    Exit;
  end;

  if qOnemDerece.State in [dsInsert] then
  begin
    qOnemDerece.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_def_data_onemderece_id');
    qOnemDerece.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    qOnemDerece.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    qOnemDerece.FieldByName('idt').AsDateTime   := Now;
  end;
  qOnemDerece.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  qOnemDerece.FieldByName('sdt').AsDateTime     := Now;
  qOnemDerece.Post;
  ModalResult := mrOk;
end;

function TfrmKVKKOnemDereceTanim.Exec(AID, AOp: Integer): Integer;
begin
  if AOp = 0 then // Insert
  begin
    QueryOpen(qOnemDerece, 'SELECT * FROM def_data_onemderece WHERE id = 0');
    qOnemDerece.Insert;
    YardimKw := 'OnemDereceYeniKayit';
  end
  else // Edit
  begin
    QueryOpen(qOnemDerece, 'SELECT * FROM def_data_onemderece WHERE id = ' + IntToStr(AID));
    qOnemDerece.Edit;
    YardimKw := 'OnemDereceDegistirme';
  end;

  ActiveControl := edTanim;
  Result := ShowModal;
end;

procedure TfrmKVKKOnemDereceTanim.UniFormBeforeShow(Sender: TObject);
begin
  lbIDY.Caption := MainMod.KullaniciGetir(qOnemDerece.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(qOnemDerece.FieldByName('sdy').AsString);
  if qOnemDerece.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qOnemDerece.FieldByName('idt').AsDateTime);
  if qOnemDerece.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qOnemDerece.FieldByName('sdt').AsDateTime);
end;

end.
