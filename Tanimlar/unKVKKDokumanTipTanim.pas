unit unKVKKDokumanTipTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniButton, uniBitBtn, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses,
  uniMemo, uniDBMemo, Data.DB, DBAccess, Uni, MemDS;

type
  TfrmKVKKDokumanTipTanim = class(TUniForm)
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
    qDokumanTip: TUniQuery;
    dsDokumanTip: TUniDataSource;
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

function frmKVKKDokumanTipTanim: TfrmKVKKDokumanTipTanim;

implementation

uses uniGUIApplication, MainModule, McMLib, unHelpPage;

{$R *.dfm}

function frmKVKKDokumanTipTanim: TfrmKVKKDokumanTipTanim;
begin
  Result := TfrmKVKKDokumanTipTanim(MainMod.GetFormInstance(TfrmKVKKDokumanTipTanim));
end;

procedure TfrmKVKKDokumanTipTanim.btnCancelClick(Sender: TObject);
begin
  qDokumanTip.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmKVKKDokumanTipTanim.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmKVKKDokumanTipTanim.btnPostClick(Sender: TObject);
begin
  if qDokumanTip.FieldByName('dokumantip').AsString = '' then
  begin
    MessageDlg('Doküman Tipi belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edTanim.SetFocus;
    Exit;
  end;

  if qDokumanTip.State in [dsInsert] then
  begin
    qDokumanTip.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_def_data_dokumantip_id');
    qDokumanTip.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    qDokumanTip.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    qDokumanTip.FieldByName('idt').AsDateTime   := Now;
  end;
  qDokumanTip.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  qDokumanTip.FieldByName('sdt').AsDateTime     := Now;
  qDokumanTip.Post;
  ModalResult := mrOk;
end;

function TfrmKVKKDokumanTipTanim.Exec(AID, AOp: Integer): Integer;
begin
  if AOp = 0 then // Insert
  begin
    QueryOpen(qDokumanTip, 'SELECT * FROM def_data_dokumantip WHERE id = 0');
    qDokumanTip.Insert;
    YardimKw := 'DokumanTipYeniKayit';
  end
  else // Edit
  begin
    QueryOpen(qDokumanTip, 'SELECT * FROM def_data_dokumantip WHERE id = ' + IntToStr(AID));
    qDokumanTip.Edit;
    YardimKw := 'DokumanTipDegistirme';
  end;

  ActiveControl := edTanim;
  Result := ShowModal;
end;

procedure TfrmKVKKDokumanTipTanim.UniFormBeforeShow(Sender: TObject);
begin
  lbIDY.Caption := MainMod.KullaniciGetir(qDokumanTip.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(qDokumanTip.FieldByName('sdy').AsString);
  if qDokumanTip.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qDokumanTip.FieldByName('idt').AsDateTime);
  if qDokumanTip.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qDokumanTip.FieldByName('sdt').AsDateTime);
end;

end.
