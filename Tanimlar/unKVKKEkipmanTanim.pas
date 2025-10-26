unit unKVKKEkipmanTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Data.DB, MemDS, DBAccess, Uni, uniPanel, uniButton, uniBitBtn, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniCheckBox, uniDBCheckBox, uniEdit, uniDBEdit, uniLabel,
  uniGUIBaseClasses, uniMemo, uniDBMemo,StrUtils;

type
  TfrmKVKKEkipmanTanim = class(TUniForm)
    dsEkipman: TUniDataSource;
    qTmp: TUniQuery;
    pnlData: TUniPanel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    edEkipman: TUniDBEdit;
    UniLabel8: TUniLabel;
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
    edTipi: TUniDBComboBox;
    edDurumu: TUniDBComboBox;
    edDesc: TUniDBMemo;
    btnHelp: TUniBitBtn;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    YardimKw : string;
    Data : TUniQuery;
  public
    function Edit: Integer;
    function Insert: Integer;
  end;

function frmKVKKEkipmanTanim: TfrmKVKKEkipmanTanim;

implementation

uses uniGUIApplication, MainModule, McMLib, unDepartmanListe, unHelpPage;

{$R *.dfm}

function frmKVKKEkipmanTanim: TfrmKVKKEkipmanTanim;
begin
  Result := TfrmKVKKEkipmanTanim(MainMod.GetFormInstance(TfrmKVKKEkipmanTanim));
end;

procedure TfrmKVKKEkipmanTanim.btnCancelClick(Sender: TObject);
begin
  Data.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmKVKKEkipmanTanim.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmKVKKEkipmanTanim.btnPostClick(Sender: TObject);
var
sqlstr : string;
begin
  if edTipi.ItemIndex < 1 then
  begin
    MessageDlg('Ekipman Tipi belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edTipi.SetFocus;
    Exit;
  end;
  if edDurumu.ItemIndex < 1 then
  begin
    MessageDlg('Ekipman Durumu belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edDurumu.SetFocus;
    Exit;
  end;
  if Data.FieldByName('ekipman').AsString = '' then
  begin
    MessageDlg('Ekipman Adý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edEkipman.SetFocus;
    Exit;
  end;
    // Doðan Akçay Takip Numarasý (ID):	PYW-QUY-MS6X (Talep numarasý: 579)
  sqlstr := 'SELECT count(*) rec FROM def_data_ekipman where mc_id=%d and tipi=%s and ekipman=%s'+
  IfThen(Data.State = dsEdit, ' and id<>'+Data.FieldByName('id').AsString);
  sqlstr := format(sqlstr, [mainmod.MCID,QuotedStr(Data.FieldByName('tipi').AsString ),QuotedStr(Data.FieldByName('ekipman').AsString) ]);
  QueryOpen(mainmod.qTmp,sqlstr);
  if  (MainMod.qTmp.FieldByName('rec').AsInteger>0) then
  begin
    MessageDlg('Daha Önce Ayni Ýsimde ve Ayný Tipte Ekipman Tanýmlanmýþtýr. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edEkipman.SetFocus;
    Exit;
  end;

  if Data.State in [dsInsert] then
  begin
    Data.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_def_data_ekipman_id');
    Data.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    Data.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    Data.FieldByName('idt').AsDateTime   := Now;
  end;
  Data.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  Data.FieldByName('sdt').AsDateTime     := Now;
  Data.Post;
  ModalResult := mrOk;
end;

function TfrmKVKKEkipmanTanim.Edit: Integer;
begin
  Data := MainMod.qEkipman;
  if not Data.Active then Data.Open;
  Data.Edit;
  ActiveControl := edTipi;
  YardimKw := 'EkipmanDegistirme';
  Result := ShowModal;
end;

function TfrmKVKKEkipmanTanim.Insert: Integer;
begin
  Data := MainMod.qEkipman;
  if not Data.Active then Data.Open;
  Data.Insert;
  ActiveControl := edTipi;
  YardimKw := 'EkipmanYeniKayit';
  Result := ShowModal;
end;

procedure TfrmKVKKEkipmanTanim.UniFormBeforeShow(Sender: TObject);
begin
  lbIDY.Caption := MainMod.KullaniciGetir(Data.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(Data.FieldByName('sdy').AsString);
  if Data.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', Data.FieldByName('idt').AsDateTime);
  if Data.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', Data.FieldByName('sdt').AsDateTime);
end;

end.
