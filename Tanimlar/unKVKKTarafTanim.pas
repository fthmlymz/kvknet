unit unKVKKTarafTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniButton, uniBitBtn, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses,
  uniMemo, uniDBMemo, Data.DB, DBAccess, Uni, MemDS;

type
  TfrmKVKKTarafTanim = class(TUniForm)
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
    qTaraf: TUniQuery;
    dsTaraf: TUniDataSource;
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

function frmKVKKTarafTanim: TfrmKVKKTarafTanim;

implementation

uses uniGUIApplication, MainModule, McMLib, unHelpPage;

{$R *.dfm}

function frmKVKKTarafTanim: TfrmKVKKTarafTanim;
begin
  Result := TfrmKVKKTarafTanim(MainMod.GetFormInstance(TfrmKVKKTarafTanim));
end;

procedure TfrmKVKKTarafTanim.btnCancelClick(Sender: TObject);
begin
  qTaraf.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmKVKKTarafTanim.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmKVKKTarafTanim.btnPostClick(Sender: TObject);
begin
  if qTaraf.FieldByName('taraf').AsString = '' then
  begin
    MessageDlg('Paylaþým Tarafý Tanýmý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edTanim.SetFocus;
    Exit;
  end;

  QueryOpen(MainMod.qTmp, 'SELECT COUNT(id) FROM def_data_taraf WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' AND id<>' + IntToStr(qTaraf.fieldbyname('id').AsInteger) + ' AND taraf=''' + qTaraf.fieldbyname('taraf').AsString + '''');
  if MainMod.qTmp.Fields[0].AsInteger > 0 then
  begin
    MessageDlg('Bu isimde farklý bir taraf tanýmý bulunmaktadýr.', mtError, [mbOk]);
    Exit;
  end;

  if qTaraf.State in [dsInsert] then
  begin
    qTaraf.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_def_data_taraf_id');
    qTaraf.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    qTaraf.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    qTaraf.FieldByName('idt').AsDateTime   := Now;
  end;
  qTaraf.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  qTaraf.FieldByName('sdt').AsDateTime     := Now;
  qTaraf.Post;
  ModalResult := mrOk;
end;

function TfrmKVKKTarafTanim.Exec(AID, AOp: Integer): Integer;
begin
  if AOp = 0 then // Insert
  begin
    QueryOpen(qTaraf, 'SELECT * FROM def_data_taraf WHERE id = 0');
    qTaraf.Insert;
    YardimKw := 'TarafYeniKayit';
  end
  else // Edit
  begin
    QueryOpen(qTaraf, 'SELECT * FROM def_data_taraf WHERE id = ' + IntToStr(AID));
    qTaraf.Edit;
    YardimKw := 'TarafDegistirme';
  end;

  ActiveControl := edTanim;
  Result := ShowModal;
end;

procedure TfrmKVKKTarafTanim.UniFormBeforeShow(Sender: TObject);
begin
  lbIDY.Caption := MainMod.KullaniciGetir(qTaraf.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(qTaraf.FieldByName('sdy').AsString);
  if qTaraf.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qTaraf.FieldByName('idt').AsDateTime);
  if qTaraf.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qTaraf.FieldByName('sdt').AsDateTime);
end;

end.
