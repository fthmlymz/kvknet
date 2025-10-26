unit unKVKKSurecTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniButton, uniBitBtn, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses,
  uniMemo, uniDBMemo, Data.DB, DBAccess, Uni, MemDS;

type
  TfrmKVKKSurecTanim = class(TUniForm)
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
    qSurec: TUniQuery;
    dsSurec: TUniDataSource;
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

function frmKVKKSurecTanim: TfrmKVKKSurecTanim;

implementation

uses uniGUIApplication, MainModule, McMLib, unHelpPage;

{$R *.dfm}

function frmKVKKSurecTanim: TfrmKVKKSurecTanim;
begin
  Result := TfrmKVKKSurecTanim(MainMod.GetFormInstance(TfrmKVKKSurecTanim));
end;

procedure TfrmKVKKSurecTanim.btnCancelClick(Sender: TObject);
begin
  qSurec.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmKVKKSurecTanim.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmKVKKSurecTanim.btnPostClick(Sender: TObject);
begin
  if qSurec.FieldByName('surec').AsString = '' then
  begin
    MessageDlg('Süreç Tanýmý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edTanim.SetFocus;
    Exit;
  end;

  QueryOpen(MainMod.qTmp, 'SELECT COUNT(id) FROM def_data_surec WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' AND id<>' + IntToStr(qSurec.fieldbyname('id').AsInteger) + ' AND surec=''' + qSurec.fieldbyname('surec').AsString + '''');
  if MainMod.qTmp.Fields[0].AsInteger > 0 then
  begin
    MessageDlg('Bu isimde farklý bir süreç tanýmý bulunmaktadýr.', mtError, [mbOk]);
    Exit;
  end;

  if qSurec.State in [dsInsert] then
  begin
    qSurec.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_def_data_surec_id');
    qSurec.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    qSurec.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    qSurec.FieldByName('idt').AsDateTime   := Now;
  end;
  qSurec.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  qSurec.FieldByName('sdt').AsDateTime     := Now;
  qSurec.Post;
  ModalResult := mrOk;
end;

function TfrmKVKKSurecTanim.Exec(AID, AOp: Integer): Integer;
begin
  if AOp = 0 then // Insert
  begin
    QueryOpen(qSurec, 'SELECT * FROM def_data_surec WHERE id = 0');
    qSurec.Insert;
    YardimKw := 'SureclerYeniKayit';
  end
  else // Edit
  begin
    QueryOpen(qSurec, 'SELECT * FROM def_data_surec WHERE id = ' + IntToStr(AID));
    qSurec.Edit;
    YardimKw := 'SureclerDegistirme';
  end;

  ActiveControl := edTanim;
  Result := ShowModal;
end;

procedure TfrmKVKKSurecTanim.UniFormBeforeShow(Sender: TObject);
begin
  lbIDY.Caption := MainMod.KullaniciGetir(qSurec.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(qSurec.FieldByName('sdy').AsString);

  if dsSurec.State = dsEdit then
  begin
    if lbIDY.Text = '' then lbIDY.Text := 'SÝSTEM';
    if lbSDY.Text = '' then lbSDY.Text := 'SÝSTEM';
  end;

  if qSurec.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qSurec.FieldByName('idt').AsDateTime);
  if qSurec.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qSurec.FieldByName('sdt').AsDateTime);
end;

end.
