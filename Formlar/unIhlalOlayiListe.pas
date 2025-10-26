unit unIhlalOlayiListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, Data.DB, DBAccess, Uni, MemDS, uniEdit, uniLabel,
  uniMultiItem, uniComboBox, uniGUIBaseClasses, uniPanel, uniButton, uniBitBtn,
  uniBasicGrid, uniDBGrid, uniDBListBox, uniListBox, uniDateTimePicker,strutils;

type
  TfrmIhlalOlayiListe = class(TUniFrame)
    qdata: TUniQuery;
    dsdata: TUniDataSource;
    UniDBGrid1: TUniDBGrid;
    pnlbaslik: TUniPanel;
    pnledit: TUniPanel;
    UniLabel6: TUniLabel;
    edSrcText: TUniEdit;
    cbSrcType: TUniComboBox;
    UniLabel4: TUniLabel;
    pnlbutton: TUniPanel;
    btnSearch: TUniBitBtn;
    btnAdd: TUniBitBtn;
    btnEdit: TUniBitBtn;
    eddate: TUniDateTimePicker;
    UniPanel1: TUniPanel;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure UniDBGrid1RowExpand(Sender: TUniCustomDBGrid;
      const RowId: Integer; var RowControl: TControl; Container: TUniContainer);
    procedure UniDBGrid1RowCollapse(Sender: TUniCustomDBGrid;
      const RowId: Integer; Container: TUniContainer);
    procedure cbSrcTypeChange(Sender: TObject);
    procedure edSrcTextAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
  private
    acikWigetId  :integer;
    procedure NewSQL;
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}
 uses MainModule, ServerModule, McMLib, UnIhlalOlayiTanim,unIhlalOlayDetayListe;



procedure TfrmIhlalOlayiListe.btnAddClick(Sender: TObject);
begin
  if not MainMod.LoginInfo.Yetkiler[209] then
  begin
    MessageDlg('Ekleme yetkiniz bulunmamaktadýr. Yönetincinize baþvurunuz', mtConfirmation,[mbYes]) ;
    exit;
  end;

    if   frmIhlalOlayi.Exec() = mrOk then
      NewSQL;
end;

procedure TfrmIhlalOlayiListe.btnEditClick(Sender: TObject);
begin
  if qdata.IsEmpty then exit;
  if not MainMod.LoginInfo.Yetkiler[210] then
  begin
    MessageDlg('Deðiþtirme yetkiniz bulunmamaktadýr. Yönetincinize baþvurunuz', mtConfirmation,[mbYes]) ;
    exit;
  end;

    if frmIhlalOlayi.Exec(qdata.FieldByName('id').AsString,EtTekDegistirme) = mrOk then
    NewSQL;
end;

procedure TfrmIhlalOlayiListe.btnSearchClick(Sender: TObject);
begin
NewSQL;
end;

procedure TfrmIhlalOlayiListe.cbSrcTypeChange(Sender: TObject);
begin
if cbSrcType.ItemIndex in [1,2,3] then
begin
  eddate.Visible := true;
  eddate.Left := edSrcText.Left;
  eddate.Top := edSrcText.Top;
  eddate.Width := edSrcText.Width;
  edSrcText.Visible := false;
end else
begin
  eddate.Visible := false;
  edSrcText.Visible := true;
end;


end;

procedure TfrmIhlalOlayiListe.edSrcTextAjaxEvent(Sender: TComponent;
  EventName: string; Params: TUniStrings);
begin
 if EventName= 'doSearch' then
  NewSQL ;

end;

procedure TfrmIhlalOlayiListe.NewSQL;
var
	SQLStr :string  ;
  WhereStr : string;
  DetayList : TfrmIhlalOlayDetayListe;
  intveri :string;
  SrcText : string;
begin

  if not GuvenliGirisMi(edSrcText.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;

  if edSrcText.Text <> '' then
  begin
    if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
  end;

	SQLStr   := ' SELECT ' +
  ' id, ' +
  ' mc_id, ' +
  ' baslangic_tarihi, ' +
  ' bitis_tarihi, ' +
  ' tespit_tarihi, ' +
  ' veri_isleyen, ' +
  ' veri_isleyen_adresi, ' +
  ' ihlal_kaynagi_genel, ' +
  ' ihlal_kaynagi_siber_saldiri, ' +
  ' ihlal_etkisi, ' +
  ' ihlal_tespiti, ' +
  ' etkilenen_kisi_sayisi, ' +
  ' etkilenen_kayit_sayisi, ' +
  ' ihlal_icerigi, ' +
  ' ''ÝHLAL KAYNAÐI : ''||string_agg(case ' +
  ' when trim(val_genel) = ''1'' THEN ' +
  ' ''BELGE/CÝHAZ HIRSIZLIÐI VEYA KAYBOLMASI'' ' +
  ' when trim(val_genel) = ''2'' THEN ' +
  ' ''VERÝLERÝN GÜVENSÝZ ORTAMDA DEPOLANMASI'' ' +
  ' when trim(val_genel) = ''3'' THEN ' +
  ' ''SABOTAJ'' ' +
  ' when trim(val_genel) = ''4'' THEN ' +
  ' ''KAZA/ÝHMAL'' ' +
  ' when trim(val_genel) = ''5'' THEN ' +
  ' ''DÝÐER'' ' +
  ' end, ' +
  ' '','' || E''\n'') ||E''\n''|| ' +
  ' ''SÝBER SALDIRI : ''||string_agg(case ' +
  ' when trim(val_siber) = ''1'' THEN ' +
  ' ''ZARARLI YAZILIMLAR'' ' +
  ' when trim(val_siber) = ''2'' THEN ' +
  ' ''SOSYAL MÜHENDÝSLÝK'' ' +
  ' when trim(val_siber) = ''3'' THEN ' +
  ' ''HÝZMET DIÞI BIRAKMA (DOS-DDOS)'' ' +
  ' when trim(val_siber) = ''4'' THEN ' +
  ' ''FÝDYE YAZILIMI (RANSOMWARE)'' ' +
  ' when trim(val_siber) = ''5'' THEN ' +
  ' ''PAROLA SALDIRISI (BRUTE-FORCE ATTACK)'' ' +
  ' end, ' +
  ' '','' || E''\n'') as ihlal_kaynagi, ' +
  ' string_agg(case ' +
  ' when trim(val_etki) = ''1'' THEN ' +
  ' ''VERÝ GÝZLÝLÝÐÝ'' ' +
  ' when trim(val_etki) = ''2'' THEN ' +
  ' ''VERÝ BÜTÜNLÜÐÜ'' ' +
  ' when trim(val_etki) = ''3'' THEN ' +
  ' ''VERÝYE ERÝÞÝM/ULAÞILABÝLÝRLÝK'' ' +
  ' END, ' +
  ' '','' || E''\n'') AS ihlal_etki_aciklama ' +

  ' FROM ( ' +
  ' SELECT ' +
  ' *, ' +
  ' unnest(string_to_array(ihlal_kaynagi_genel, '','')) AS val_genel, ' +
  ' unnest(string_to_array(ihlal_kaynagi_siber_saldiri, '','')) AS val_siber, ' +
  ' unnest(string_to_array(ihlal_etkisi,'','')) as val_etki ' +
  ' FROM def_data_ihlal ' +
  '  %s '  +     //paremetre alacak
  ' ) AS subquery ' +
  ' GROUP BY ' +
  ' id, ' +
  ' mc_id, ' +
  ' baslangic_tarihi, ' +
  ' bitis_tarihi, ' +
  ' tespit_tarihi, ' +
  ' veri_isleyen, ' +
  ' veri_isleyen_adresi, ' +
  ' ihlal_kaynagi_genel, ' +
  ' ihlal_kaynagi_siber_saldiri, ' +
  ' ihlal_etkisi, ' +
  ' ihlal_tespiti, ' +
  ' etkilenen_kisi_sayisi, ' +
  ' etkilenen_kayit_sayisi, ' +
  ' ihlal_icerigi; '   ;

  WhereStr := 'mc_id=:mc_id ' ;
  if (cbSrcType.ItemIndex=0) and (edSrcText.Text <> '') then
    wherestr := WhereStr + ' and ihlal_icerigi like :srctext ';
  if (cbSrcType.ItemIndex=1) and (eddate.DateTime>0 ) then
    WhereStr := wherestr + ' and baslangic_tarihi=:baslangis_tarihi ';
  if (cbSrcType.ItemIndex=2) and (eddate.DateTime>0 ) then
    WhereStr := wherestr + ' and bitis_tarihi=:bitis_tarihi ';
  if (cbSrcType.ItemIndex=3) and (eddate.DateTime>0 ) then
    WhereStr := wherestr + ' and tespit_tarihi=:tespit_tarihi ';
  if (cbSrcType.ItemIndex =4) then
  begin
    DetayList := TfrmIhlalOlayDetayListe.Create(self);
    try
     intveri :=DetayList.EtkilenenKayit(edSrcText.Text,stetkilenenSurec) ;
     WhereStr := wherestr +' and id in ('+ ifthen( intveri='','0',intveri)+')';
    finally
      if assigned(DetayList) then
        FreeAndNil(DetayList);
    end;
  end;
  if (cbSrcType.ItemIndex =5) then
  begin
    DetayList := TfrmIhlalOlayDetayListe.Create(self);
    try
     intveri :=DetayList.EtkilenenKayit(edSrcText.Text,stEtkilenenKisi) ;
     WhereStr := wherestr +' and id in ('+ ifthen( intveri='','0',intveri)+')';
    finally
      if assigned(DetayList) then
        FreeAndNil(DetayList);
    end;
  end;
  if (cbSrcType.ItemIndex =6) then
  begin
    DetayList := TfrmIhlalOlayDetayListe.Create(self);
    try
     intveri :=DetayList.EtkilenenKayit(edSrcText.Text,stEtkilenenKaynak) ;
     WhereStr := wherestr +' and id in ('+ ifthen( intveri='','0',intveri)+')';
    finally
      if assigned(DetayList) then
        FreeAndNil(DetayList);
    end;
  end;
  qdata.SQL.Text := Format(sqlstr,[ 'where '+WhereStr])  ;

  qdata.ParamByName('mc_id').AsString := inttostr(mainmod.MCID);
  if qdata.FindParam('srctext') <> nil then
    qdata.ParamByName('srctext').AsString := SrcText ;
  if qdata.FindParam('baslangis_tarihi') <> nil then
    qdata.ParamByName('baslangis_tarihi').AsDate :=  eddate.DateTime;
  if qdata.FindParam('bitis_tarihi') <> nil then
    qdata.ParamByName('bitis_tarihi').AsDate :=   eddate.DateTime ;
  if qdata.FindParam('tespit_tarihi') <> nil then
    qdata.ParamByName('tespit_tarihi').AsDate :=   eddate.DateTime ;


  qdata.Open;
end;

procedure TfrmIhlalOlayiListe.UniDBGrid1RowCollapse(Sender: TUniCustomDBGrid;
  const RowId: Integer; Container: TUniContainer);
begin
if acikwigetId=RowId then
    acikwigetId := -1;
end;

procedure TfrmIhlalOlayiListe.UniDBGrid1RowExpand(Sender: TUniCustomDBGrid;
  const RowId: Integer; var RowControl: TControl; Container: TUniContainer);
begin
   if acikWigetId=-1 then
     acikwigetId := rowId
   else
    begin
      UniDBGrid1.JSInterface.JSCall('view.rowExpander.collapseRow', [acikwigetId]);

     acikwigetId := rowId
    end;

  RowControl := TfrmIhlalOlayDetayListe.Create(Container);
   TfrmIhlalOlayDetayListe(RowControl).newsql(qdata.FieldByName('id').AsInteger);
   TfrmIhlalOlayDetayListe(RowControl).Align := alnone;
   TfrmIhlalOlayDetayListe(RowControl).Width := UniDBGrid1.Width-50;
   TfrmIhlalOlayDetayListe(RowControl).Parent := Container;
////  TDetailFrame(RowControl).ApplyRange(ClientDataSet1CustNo.AsInteger, ClientDataSet1CustNo.AsInteger);


end;

procedure TfrmIhlalOlayiListe.UniFrameCreate(Sender: TObject);
begin

    acikwigetId := -1;
    NewSQL;
end;
initialization
 RegisterClass(TfrmIhlalOlayiListe);
end.
