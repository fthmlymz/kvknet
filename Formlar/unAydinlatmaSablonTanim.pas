unit unAydinlatmaSablonTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Clipbrd, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniButton, uniBitBtn, uniMemo, uniDBMemo, uniMultiItem, uniComboBox,
  uniDBComboBox, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses, Data.DB, DBAccess, Uni, uniDBLookupComboBox,
  MemDS, uniCheckBox, uniDBCheckBox, uniImage, uniFieldSet;

type
  TfrmAydinlatmaSablonTanim = class(TUniForm)
    dsAydinlatma: TUniDataSource;
    pnlData: TUniPanel;
    UniLabel1: TUniLabel;
    UniLabel3: TUniLabel;
    edTanim: TUniDBEdit;
    UniLabel8: TUniLabel;
    edDurum: TUniDBComboBox;
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
    UniLabel9: TUniLabel;
    edKisi: TUniDBLookupComboBox;
    qKisi: TUniQuery;
    dsKisi: TUniDataSource;
    qTmp: TUniQuery;
    edAcikRiza: TUniDBCheckBox;
    edWebLink: TUniEdit;
    UniLabel2: TUniLabel;
    btnGoToLink: TUniBitBtn;
    btnPrepLink: TUniBitBtn;
    edIYSOnay: TUniDBCheckBox;
    btnFHelp: TUniBitBtn;
    btnQRCode: TUniBitBtn;
    imgQRCode: TUniImage;
    pnldetayveri: TUniPanel;
    btnAcikrizaSecenek: TUniBitBtn;
    qacikrizasecenek: TUniQuery;
    dsacikrizasecenek: TUniDataSource;
    UniDBMemo1: TUniDBMemo;
    UniDBMemo2: TUniDBMemo;
    UniDBMemo3: TUniDBMemo;
    UniLabel10: TUniLabel;
    UniLabel11: TUniLabel;
    UniLabel12: TUniLabel;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnGoToLinkClick(Sender: TObject);
    procedure btnPrepLinkClick(Sender: TObject);
    procedure btnFHelpClick(Sender: TObject);
    procedure btnQRCodeClick(Sender: TObject);
    procedure btnAcikrizaSecenekClick(Sender: TObject);
    procedure edAcikRizaClick(Sender: TObject);
    procedure edKisiChange(Sender: TObject);
    procedure edKisiChangeValue(Sender: TObject);
  private
    YardimKw : string;
    Data : TUniQuery;
    procedure AcikrizaSecnekOpen;
    procedure EkaranAyarla;
  public
    function Edit: Integer;
    function Insert: Integer;
  end;

function frmAydinlatmaSablonTanim: TfrmAydinlatmaSablonTanim;

implementation

uses uniGUIApplication, MainModule, McMLib, unHelpPage, ServerModule,
  unAydinlatmaSablonAcikRizaGereklilik, uAydinlatmaSablonOlusturma;

{$R *.dfm}

function frmAydinlatmaSablonTanim: TfrmAydinlatmaSablonTanim;
begin
  Result := TfrmAydinlatmaSablonTanim(MainMod.GetFormInstance(TfrmAydinlatmaSablonTanim));
end;

procedure TfrmAydinlatmaSablonTanim.btnCancelClick(Sender: TObject);
begin
  Data.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmAydinlatmaSablonTanim.btnPostClick(Sender: TObject);
begin
  if edDurum.ItemIndex < 0 then
  begin
    MessageDlg('Form Durumu belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edDurum.SetFocus;
    Exit;
  end;
  if Data.FieldByName('kisi_id').AsInteger < 1 then
  begin
    MessageDlg('Ýlgili Kiþi belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edKisi.SetFocus;
    Exit;
  end;
  if Data.FieldByName('tanim').AsString = '' then
  begin
    MessageDlg('Þablon Tanýmý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edTanim.SetFocus;
    Exit;
  end;

  QueryOpen(MainMod.qTmp, 'SELECT COUNT(id) FROM def_data_aydinlatma '+
                          ' WHERE durum in (''YAYINDA'', ''ÝNCELEMEDE'',''PASÝF'' ) and mc_id = ' +
                          IntToStr(MainMod.MCID) + ' AND id<>' + IntToStr(data.fieldbyname('id').AsInteger) +
                          ' AND kisi_id=' + data.fieldbyname('kisi_id').AsString);
  if MainMod.qTmp.Fields[0].AsInteger > 0 then
  begin
    lbIDY.Text := MainMod.qTmp.Fields[0].AsString;
    MessageDlg('Bu ilgili kiþi farklý bir aydýnlatma metni tanýmýnda kaydedilmiþtir.', mtError, [mbOk]);
    Exit;
  end;



  if Data.State in [dsInsert] then
  begin
    Data.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_def_data_aydinlatma_id');
    Data.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    Data.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    Data.FieldByName('idt').AsDateTime   := Now;
  end;
  Data.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  Data.FieldByName('sdt').AsDateTime     := Now;
  if Data.FieldByName('aguid').AsString = '' then Data.FieldByName('aguid').AsString   := MainMod.NewGuid;
  Data.Post;

  if (StrToIntDef(data.FieldByName('kisi_id').AsString, 0) > 0) or
   (data.FieldByName('durumu').AsString = 'YAYINDA') then
       if MessageDlg('Aydýnlatma / Açýk Rýza raporu oluþturulsun mu ?',mtConfirmation,mbYesNo) = mryes then
          frmAydinlatmaSablonOlusturma.AydinlatmaSablonOlustur(data.FieldByName('kisi_id').AsInteger);

  ModalResult := mrOk;
end;

procedure TfrmAydinlatmaSablonTanim.btnPrepLinkClick(Sender: TObject);
begin
  if Data.FieldByName('aguid').AsString = '' then
  begin
    Data.FieldByName('aguid').AsString   := MainMod.NewGuid;
    edWebLink.Text := MainMod.AydinlatmaLink + Data.FieldByName('aguid').AsString;
    MainMod.CreateQRCode(edWebLink.Text, imgQRCode);
  end;
end;

procedure TfrmAydinlatmaSablonTanim.btnQRCodeClick(Sender: TObject);
var
  aQRCodeFile: String;
  FUrl: String;
begin
  if Data.State in [dsInsert] then
  begin
    MessageDlg('Link adresi henüz hazýr deðil. Bilgileri kaydettiðinizde baðlantýlar da hazýr olacak.', mtError, [mbOk]);
    Exit;
  end;
  if edWebLink.Text = '' then
  begin
    MessageDlg('Link adresi henüz hazýr deðil. Bilgileri kaydettiðinizde baðlantýlar da hazýr olacak.', mtError, [mbOk]);
    Exit;
  end;

//  MainMod.CreateQRCode(edWebLink.Text, imgQRCode);
  aQRCodeFile := ServerMod.NewCacheFileUrl(False, 'png', '', '', FUrl, True);
  imgQRCode.Picture.SaveToFile(aQRCodeFile);
  if aQRCodeFile <> '' then
    UniSession.SendFile(aQRCodeFile, 'Karekod.png');
end;

procedure TfrmAydinlatmaSablonTanim.edAcikRizaClick(Sender: TObject);
begin
  EkaranAyarla;
 if  data.FieldByName('acik_riza').OldValue <> data.FieldByName('acik_riza').NewValue then
  if data.FieldByName('acik_riza').NewValue = 'E' then
    btnAcikrizaSecenek.Click;
end;

procedure TfrmAydinlatmaSablonTanim.EkaranAyarla;
begin
//  if data.FieldByName('acik_riza').AsString = 'E' then
//  begin
//   pnldetayveri.Visible := true ;
//   frmAydinlatmaSablonTanim.Width := 1085;
//  end
//  else
//  begin
//   pnldetayveri.Visible := false;
//   frmAydinlatmaSablonTanim.Width := 520;
//  end;


//frmAydinlatmaSablonTanim.Left := (Screen.Width - frmAydinlatmaSablonTanim.Width) div 2;
end;

procedure TfrmAydinlatmaSablonTanim.btnGoToLinkClick(Sender: TObject);
begin
  if Data.State in [dsInsert] then
  begin
    MessageDlg('Link adresi henüz hazýr deðil. Bilgileri kaydettiðinizde baðlantýlar da hazýr olacak.', mtError, [mbOk]);
    Exit;
  end;
  if edWebLink.Text = '' then
  begin
    MessageDlg('Link adresi henüz hazýr deðil. Bilgileri kaydettiðinizde baðlantýlar da hazýr olacak.', mtError, [mbOk]);
    Exit;
  end;

  UniSession.BrowserWindow(edWebLink.Text, 0, 0, '_blank');
end;

function TfrmAydinlatmaSablonTanim.Edit: Integer;
begin
  Data := MainMod.qAydinlatma;
  if not Data.Active then Data.Open;
  Data.Edit;
  ActiveControl := edDurum;
  YardimKw := 'AydinlatmaSablonDuzenleme';
  Result := ShowModal;
end;

procedure TfrmAydinlatmaSablonTanim.edKisiChange(Sender: TObject);
begin
if StrToIntDef(Data.FieldByName('kisi_id').AsString,0) = 0 then exit;

  AcikrizaSecnekOpen;
  EkaranAyarla;
end;

procedure TfrmAydinlatmaSablonTanim.edKisiChangeValue(Sender: TObject);
begin
AcikrizaSecnekOpen;
end;

function TfrmAydinlatmaSablonTanim.Insert: Integer;
begin
  Data := MainMod.qAydinlatma;
  if not Data.Active then Data.Open;
  Data.Insert;
  Data.FieldByName('durum').AsString     := 'ÝNCELEMEDE';
  Data.FieldByName('acik_riza').AsString := 'H';
  Data.FieldByName('iys_var').AsString   := 'H';
  Data.FieldByName('aguid').AsString     := '';
  ActiveControl := edDurum;
  YardimKw := 'AydinlatmaSablonYeniKayit';
  Result := ShowModal;
end;

procedure TfrmAydinlatmaSablonTanim.btnFHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmAydinlatmaSablonTanim.btnAcikrizaSecenekClick(Sender: TObject);
begin
if (StrToIntDef(data.FieldByName('kisi_id').AsString,0) = 0) or
    (data.fieldbyname('acik_riza').asstring <> 'E' ) then
  begin
    MessageDlg('Ýlgili kiþi alaný dolu ve açýk rýza seçeneði iþaretli olmasý gerekir.',
      mtConfirmation,[mbYes]) ;
   exit;
  end;
  if frmAydinlatmaSablonAcikRizaGereklilik.exec(data.FieldByName('kisi_id').AsInteger) = mrOk then
    RefreshQuery(qacikrizasecenek);
end;



procedure TfrmAydinlatmaSablonTanim.AcikrizaSecnekOpen;
begin

    QueryPrep(qacikrizasecenek, ' SELECT ' +
    ' (WITH veritipi AS ( ' +
    ' SELECT ' +
    ' RTRIM(k.kategori || ''('' || STRING_AGG(DISTINCT a.veri_tipi, '', '') || '')'', '','') AS veritipi_str ' +
    ' FROM def_data_veritipi a ' +
    ' JOIN def_data_kategori k ON a.md_id = k.id ' +
    ' JOIN data_acikriza_detay_secenek s ON a.id = ANY (string_to_array(s.veritipi_ids, '','')::int[]) ' +
    ' WHERE s.kisi_id = :kisi_id ' +
    ' AND s.mc_id = :mc_id ' +
    ' GROUP BY k.kategori ' +
    ' ) ' +
    ' SELECT STRING_AGG(DISTINCT veritipi_str, E''\n'') AS veritipi_str FROM veritipi) AS veritipi_str, ' +
    '  ' +
    ' (SELECT string_agg(''-'' || amac, E'',\n'')::VARCHAR AS amac_str ' +
    ' FROM def_data_amac a ' +
    ' JOIN data_acikriza_detay_secenek s ON a.id = ANY (string_to_array(s.amac_ids, '','')::int[]) ' +
    ' WHERE s.kisi_id =:kisi_id ' +
    ' AND s.mc_id =:mc_id) AS amac_str, ' +
    '  ' +
    ' (SELECT string_agg(''-'' || a.taraf, E'',\n'')::VARCHAR AS taraf_str ' +
    ' FROM def_data_taraf a ' +
    ' JOIN data_acikriza_detay_secenek s ON a.id = ANY (string_to_array(s.taraf_ids, '','')::int[]) ' +
    ' WHERE s.kisi_id =:kisi_id ' +
    ' AND s.mc_id =:mc_id) AS taraf_str '
    );
    qacikrizasecenek.ParamByName('mc_id').AsInteger :=  mainmod.MCID;
    qacikrizasecenek.ParamByName('Kisi_id').AsInteger := StrToIntDef( data.FieldByName('kisi_id').AsString,0);
    qacikrizasecenek.Open;

end;

procedure TfrmAydinlatmaSablonTanim.UniFormBeforeShow(Sender: TObject);
begin
  QueryOpen(qKisi, 'SELECT DISTINCT env.kisi_id, ks.kisi ' +
                   'FROM data_envanter env ' +
                   '  LEFT JOIN def_data_kisi ks ON ks.id = env.kisi_id ' +
                   'WHERE env.active = ''E'' AND env.mc_id = ' +
                   IntToStr(MainMod.MCID) + ' ORDER BY 2');

  if Data.FieldByName('aguid').AsString = '' then edWebLink.Text := ''
  else
  begin
    edWebLink.Text := MainMod.AydinlatmaLink + Data.FieldByName('aguid').AsString;
    MainMod.CreateQRCode(edWebLink.Text, imgQRCode);
  end;

  lbIDY.Caption := MainMod.KullaniciGetir(Data.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(Data.FieldByName('sdy').AsString);

  if dsAydinlatma.State = dsEdit then
  begin
    if lbIDY.Text = '' then lbIDY.Text := 'SÝSTEM';
    if lbSDY.Text = '' then lbSDY.Text := 'SÝSTEM';
  end;

  if Data.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', Data.FieldByName('idt').AsDateTime);
  if Data.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', Data.FieldByName('sdt').AsDateTime);
 EkaranAyarla;
end;

end.
