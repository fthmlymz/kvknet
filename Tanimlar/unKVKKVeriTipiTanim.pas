unit unKVKKVeriTipiTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Data.DB, DBAccess, Uni, MemDS, uniPanel, uniButton, uniBitBtn, uniMemo,
  uniDBMemo, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox,StrUtils;

type
  TfrmKVKKVeriTipiTanim = class(TUniForm)
    dsVeriTipi: TUniDataSource;
    qTmp: TUniQuery;
    pnlData: TUniPanel;
    UniLabel2: TUniLabel;
    UniLabel9: TUniLabel;
    edVeriTipi: TUniDBEdit;
    edDesc: TUniDBMemo;
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
    UniLabel3: TUniLabel;
    edMain: TUniEdit;
    UniLabel1: TUniLabel;
    edNitelik: TUniComboBox;
    edKategoriCombo: TUniComboBox;
    btnHelp: TUniBitBtn;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    YardimKw: string;
    MDID   : Integer;
    nitelik: String;
    MDIDList: TStringList;
    function GetNitelik: String;
    procedure SetNitelik;
    function ControlNitelik: Boolean;
  public
    Data : TUniQuery;
    function Edit(AID: Integer; AText: String): Integer;
    function Insert(AID: Integer; AText: String): Integer;
  end;

function frmKVKKVeriTipiTanim: TfrmKVKKVeriTipiTanim;

implementation

uses uniGUIApplication, MainModule, McMLib, unKVKKVeriTipiListe, unHelpPage;

{$R *.dfm}

function frmKVKKVeriTipiTanim: TfrmKVKKVeriTipiTanim;
begin
  Result := TfrmKVKKVeriTipiTanim(MainMod.GetFormInstance(TfrmKVKKVeriTipiTanim));
end;

{ TfrmKVKKVeriTipiTanim }

procedure TfrmKVKKVeriTipiTanim.btnCancelClick(Sender: TObject);
begin
  Data.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmKVKKVeriTipiTanim.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmKVKKVeriTipiTanim.btnPostClick(Sender: TObject);

var
  sqlStr: string;
begin
  Data.FieldByName('nitelik').AsString := GetNitelik;
  if Data.FieldByName('veri_tipi').AsString = '' then
  begin
    MessageDlg('Veri Tipi belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edVeriTipi.SetFocus;
    Exit;
  end;

  if Data.FieldByName('nitelik').AsString = '' then
  begin
    MessageDlg('Veri Niteliði belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edNitelik.SetFocus;
    Exit;
  end;

  if (Data.State = dsEdit) and (Data.FieldByName('nitelik').AsString <> nitelik) then
  begin
    if ControlNitelik = false then
    begin
      MessageDlg('Kontrol listesinde kilitlenmiþ bir veri tipinin niteliði deðiþtirilemez, öncelikle kilidi kaldýrýnýz.', mtError, [mbOk]);
      edNitelik.SetFocus;
      Exit;
    end;

  end;

  if (MDID = 0) then
  begin
    if (edKategoriCombo.ItemIndex < 0) then
    begin
      MessageDlg('Kategori seçiniz.', mtError, [mbOk]);
      edKategoriCombo.SetFocus;
      Exit;
    end;

    MDID := StrToInt(MDIDList[edKategoriCombo.ItemIndex]);
  end;
 // Doðan Akçay    Takip Numarasý (ID):	PYW-QUY-MS6X (Talep numarasý: 579)
sqlStr := 'SELECT count(*) rec FROM def_data_veritipi where mc_id=%d and md_id=%d and  veri_tipi =%s ' +
  IfThen(Data.State = dsEdit, ' and id<>'+Data.FieldByName('id').AsString);
   sqlStr := Format(sqlStr,[MainMod.MCID,MDID, QuotedStr(Data.FieldByName('veri_tipi').AsString)] ) ;
 QueryOpen(MainMod.qTmp,sqlStr );
 if  (MainMod.qTmp.FieldByName('rec').AsInteger>0) then
  begin
    MessageDlg('Daha Önce Ayný isimde Veri Tipi Tanýmlanmýþtýr. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edVeriTipi.SetFocus;
    Exit;
  end;

  if Data.State in [dsInsert] then
  begin
    Data.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_def_data_veritipi_id');
    Data.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    Data.FieldByName('md_id').AsInteger  := MDID;
    Data.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    Data.FieldByName('idt').AsDateTime   := Now;
  end;
  Data.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  Data.FieldByName('sdt').AsDateTime     := Now;
  Data.Post;
  ModalResult := mrOk;
end;

function TfrmKVKKVeriTipiTanim.ControlNitelik: Boolean;
var
  sqlStr: String;
  mainIds: TStringList;
  ntlk: string;
  i: Integer;
begin
  result := true;
  sqlstr := 'SELECT count(*) ' +
            'FROM ( ' +
            'SELECT chk.id ' +
            'FROM data_envanter env, data_checklist chk ' +
            'WHERE chk.active = ''E'' AND chk.kilitli=''E'' ' +
            'AND chk.mc_id = env.mc_id AND chk.kaynak_id = env.kaynak_id AND chk.kisi_id = env.kisi_id ' +
            'AND env.mc_id=' + IntToStr(MainMod.MCID) + ' ' +
            'AND env.veritipi_id=' + Data.FieldByName('id').AsString + ' ' +
            'UNION ALL ' +
            'select chk.id ' +
            'FROM data_envanter env, data_checklist chk ' +
            'WHERE chk.active = ''E'' AND chk.kilitli=''E'' ' +
            'AND chk.mc_id = env.mc_id AND chk.kaynak_id = env.kaynak_id AND chk.kisi_id = env.kisi_id ' +
            'AND env.id in (' +
            'SELECT env0.main_id ' +
            'FROM data_envanter env0 ' +
            'WHERE env0.mc_id=' + IntToStr(MainMod.MCID) + ' ' +
            'AND env0.veritipi_id=' + Data.FieldByName('id').AsString + ' ) ) t ';

  queryOpen(qtmp, sqlstr);
  if qtmp.fields[0].AsInteger > 0 then
  begin
    qTmp.Close;
    result := false;
    Exit;
  end;

  if Data.FieldByName('nitelik').AsString = 'ON' then
    ntlk := 'E'
  else
    ntlk := 'H';
  mainIds := TStringList.Create;

  sqlstr := 'SELECT id, main_id, nitelik ' +
            'FROM data_envanter env ' +
            'WHERE env.mc_id=' + IntToStr(MainMod.MCID) + ' ' +
            'AND env.veritipi_id=' + Data.FieldByName('id').AsString;

  queryOpen(qtmp, sqlstr);
  while not qTmp.Eof do
  begin
    if qTmp.FieldByName('nitelik').AsString <> ntlk then
    begin
      qTmp.Edit;
      qTmp.FieldByName('nitelik').AsString := ntlk;
      qTmp.Post;
      mainIds.Add(qTmp.FieldByName('main_id').AsString);
    end;
    qTmp.Next;
  end;

  for i := 0 to mainIds.Count-1 do
  begin
    sqlstr := 'SELECT id, main_id, nitelik ' +
              'FROM data_envanter env ' +
              'WHERE env.mc_id=' + IntToStr(MainMod.MCID) + ' ' +
              'AND env.main_id=' + mainIds[i];
    ntlk := 'H';
    queryOpen(qtmp, sqlstr);
    while not qTmp.Eof do
    begin
      if qTmp.FieldByName('nitelik').AsString = 'E' then
      begin
        ntlk := 'E';
      end;
      qTmp.Next;
    end;

    sqlstr := 'SELECT id, main_id, nitelik ' +
              'FROM data_envanter env ' +
              'WHERE env.id=' + mainIds[i];
    queryOpen(qtmp, sqlstr);
    if qTmp.FieldByName('nitelik').AsString <> ntlk then
    begin
      qTmp.Edit;
      qTmp.FieldByName('nitelik').AsString := ntlk;
      qTmp.Post;
    end;
  end;

end;

function TfrmKVKKVeriTipiTanim.Edit(AID: Integer; AText: String): Integer;
begin
  MDID := AID;
  edMain.Text := AText;
  Data := MainMod.qVeriTipi;
  if not Data.Active then Data.Open;
  Data.Edit;
  SetNitelik;
  ActiveControl := edVeriTipi;
  YardimKw := 'VeriTipiDegistirme';
  Result := ShowModal;
end;

function TfrmKVKKVeriTipiTanim.GetNitelik: String;
begin
  case edNitelik.ItemIndex of
    0 : Result := '';
    1 : Result := 'KV';
    2 : Result := 'ON';
  end;
end;

function TfrmKVKKVeriTipiTanim.Insert(AID: Integer; AText: String): Integer;
begin
  MDID := AID;
  if MDID <= 0 then
  begin
    edMain.Visible := false;
    edKategoriCombo.Visible := true;
    MDIDList := TStringList.Create;
    edKategoriCombo.Items.Clear;
    QueryOpen(qTmp, 'SELECT id, kategori FROM def_data_kategori WHERE mc_id=' + IntToStr(MainMod.MCID) + ' ORDER BY kategori');
    qTmp.First;
    while not qTmp.Eof do
    begin
      edKategoriCombo.Items.Add(qTmp.FieldByName('kategori').AsString);
      MDIDList.Add(qTmp.FieldByName('id').AsString);
      qTmp.Next;
    end;
  end
  else
  begin
    edMain.Visible := true;
    edMain.Text := AText;
    edKategoriCombo.Visible := false;
  end;

  Data := MainMod.qVeriTipi;
  if not Data.Active then Data.Open;
  Data.Insert;
  SetNitelik;
  ActiveControl := edVeriTipi;
  YardimKw := 'VeriTipiYeniKayit';
  Result := ShowModal;
end;

procedure TfrmKVKKVeriTipiTanim.SetNitelik;
var
  sTmp : String;
begin
  sTmp := MainMod.qVeriTipi.FieldByName('nitelik').AsString;
  if sTmp = 'KV' then edNitelik.ItemIndex := 1
  else if sTmp = 'ON' then edNitelik.ItemIndex := 2
  else edNitelik.ItemIndex := 0;
  nitelik := stmp;
end;

procedure TfrmKVKKVeriTipiTanim.UniFormBeforeShow(Sender: TObject);
begin
  lbIDY.Caption := MainMod.KullaniciGetir(Data.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(Data.FieldByName('sdy').AsString);

  if dsVeriTipi.State = dsEdit then
  begin
    if lbIDY.Text = '' then lbIDY.Text := 'SÝSTEM';
    if lbSDY.Text = '' then lbSDY.Text := 'SÝSTEM';
  end;

  if Data.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', Data.FieldByName('idt').AsDateTime);
  if Data.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', Data.FieldByName('sdt').AsDateTime);
end;

end.
