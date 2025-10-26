unit unAydinlatmaSablonAcikRizaGereklilik;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniBasicGrid,
  uniDBGrid, Data.DB, MemDS, DBAccess, Uni, VirtualTable, uniLabel, uniButton,
  uniBitBtn, uniSpeedButton, uniMultiItem, uniComboBox;

type
  TfrmAydinlatmaSablonAcikRizaGereklilik = class(TUniForm)
    grdtaraf: TUniDBGrid;
    qTmp: TUniQuery;
    vtveritipi: TVirtualTable;
    dsveritipi: TUniDataSource;
    pnltaraf: TUniPanel;
    UniPanel1: TUniPanel;
    vtamac: TVirtualTable;
    dsamac: TUniDataSource;
    pnlmain: TUniPanel;
    pnlamac: TUniPanel;
    grdamac: TUniDBGrid;
    UniPanel4: TUniPanel;
    vttaraf: TVirtualTable;
    dstaraf: TUniDataSource;
    btnselectAmac: TUniSpeedButton;
    btnNoselectAmac: TUniSpeedButton;
    btnselectTaraf: TUniSpeedButton;
    btnNoSelectTaraf: TUniSpeedButton;
    qAcikrizaSecenek: TUniQuery;
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
    btnHelp: TUniBitBtn;
    pnlVeritipi: TUniPanel;
    grdveritipi: TUniDBGrid;
    UniPanel3: TUniPanel;
    btnSelectVtipi: TUniSpeedButton;
    btnNoSelectvtipi: TUniSpeedButton;
    pnlKategori: TUniPanel;
    chlKategori: TUniCheckComboBox;
    procedure UniFormDestroy(Sender: TObject);
    procedure grdCellClick( Column: TUniDBGridColumn);
    procedure grdveritipiColumnSort(Column: TUniDBGridColumn;
      Direction: Boolean);
    procedure selectall(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure chlKategoriChange(Sender: TObject);
  private
   kisi_id : integer;
   Secenek_var : Boolean;
   Kaynak_ids : TStringList;
   Kategori_ids : TStringList;
   Veritipi_ids : TStringList;
   Amac_ids : TStringList;
   Taraf_ids : TStringList;
   kategoriFilter : string;
   YardimKw : string;
   procedure tablesOpen;
  public
   function Exec(Akisi_Id: integer): Integer;
  end;

function frmAydinlatmaSablonAcikRizaGereklilik: TfrmAydinlatmaSablonAcikRizaGereklilik;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication,  McMLib, unHelpPage, ServerModule;

function frmAydinlatmaSablonAcikRizaGereklilik: TfrmAydinlatmaSablonAcikRizaGereklilik;
begin
  Result := TfrmAydinlatmaSablonAcikRizaGereklilik(mainmod.GetFormInstance(TfrmAydinlatmaSablonAcikRizaGereklilik));
end;

{ TfrmAydinlatmaSablonAcikRizaGereklilik }

procedure TfrmAydinlatmaSablonAcikRizaGereklilik.btnCancelClick(
  Sender: TObject);
begin
  qAcikrizaSecenek.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmAydinlatmaSablonAcikRizaGereklilik.btnPostClick(Sender: TObject);
begin
  Veritipi_ids.DelimitedText := '';
  vtveritipi.First;
  while not vtveritipi.Eof do
  begin
    if vtveritipi.FieldByName('sec').AsBoolean then
      Veritipi_ids.Add(vtveritipi.FieldByName('veritipi_id').AsString);
    vtveritipi.Next ;
  end;

  Amac_ids.DelimitedText := '';
  vtamac.First;
  while not vtamac.Eof do
  begin
    if vtamac.FieldByName('sec').AsBoolean then
      Amac_ids.Add(vtamac.FieldByName('amac_id').AsString);
    vtamac.Next ;
  end;

  Taraf_ids.DelimitedText := '';
  vttaraf.First;
  while not vttaraf.Eof do
  begin
    if vttaraf.FieldByName('sec').AsBoolean then
      Taraf_ids.Add(vttaraf.FieldByName('taraf_id').AsString);
    vttaraf.Next ;
  end;


  if not ((Veritipi_ids.Count > 0) or
          (amac_ids.Count > 0) or (Taraf_ids.Count > 0)) then
  begin
    MessageDlg('Açýk rýzaya konu enaz bir veri seçmelisiniz',mtConfirmation,[mbYes]) ;
    exit;
  end;
 if not qAcikrizaSecenek.Active then qAcikrizaSecenek.open;

 if Secenek_var then
 begin
  qAcikrizaSecenek.Edit;
  qAcikrizaSecenek.FieldByName('veritipi_ids').AsString := Veritipi_ids.DelimitedText;
  qAcikrizaSecenek.FieldByName('amac_ids').AsString := amac_ids.DelimitedText;
  qAcikrizaSecenek.FieldByName('taraf_ids').AsString := taraf_ids.DelimitedText;
  qAcikrizaSecenek.FieldByName('sdy').AsInteger := mainmod.LoginInfo.ID;
  qAcikrizaSecenek.FieldByName('sdt').AsDateTime := now;
  qAcikrizaSecenek.Post;
 end else
 begin
   qAcikrizaSecenek.Append;
  qAcikrizaSecenek.FieldByName('id').AsInteger:= MainMod.GetSeq('sq_data_acikriza_detay_secenek_id');
  qAcikrizaSecenek.FieldByName('mc_id').AsInteger := mainmod.MCID;
  qAcikrizaSecenek.FieldByName('kisi_id').AsInteger := kisi_id;
  qAcikrizaSecenek.FieldByName('veritipi_ids').AsString := Veritipi_ids.DelimitedText;
  qAcikrizaSecenek.FieldByName('amac_ids').AsString := amac_ids.DelimitedText;
  qAcikrizaSecenek.FieldByName('taraf_ids').AsString := taraf_ids.DelimitedText;
  qAcikrizaSecenek.FieldByName('idy').AsInteger := mainmod.LoginInfo.ID;
  qAcikrizaSecenek.FieldByName('idt').AsDateTime := now;
  qAcikrizaSecenek.FieldByName('sdy').AsInteger := mainmod.LoginInfo.ID;
  qAcikrizaSecenek.FieldByName('sdt').AsDateTime := now;
  qAcikrizaSecenek.Post;
 end;
 ModalResult := mrOk;
end;

procedure TfrmAydinlatmaSablonAcikRizaGereklilik.chlKategoriChange(
  Sender: TObject);
var
  i: Integer;
  FilterStr: string;
begin
  FilterStr := '';
  for i := 0 to chlkategori.Items.Count - 1 do
  begin
    if chlkategori.Selected[i] then
    begin
      if FilterStr <> '' then
        FilterStr := FilterStr + ' OR ';
      FilterStr := FilterStr + Format('kategori_str = ''%s''', [chlkategori.Items[i]]);
    end;
  end;
  if FilterStr = '' then
    vtveritipi.Filtered := False // Hiçbir þey seçili deðilse tüm kayýtlarý göster
  else
  begin
    vtveritipi.Filtered := False;
    vtveritipi.FilterOptions := [foCaseInsensitive];
    vtveritipi.Filter :=  FilterStr;
    vtveritipi.Filtered := True;
  end;

end;

function TfrmAydinlatmaSablonAcikRizaGereklilik.Exec(Akisi_Id: integer): Integer;
begin

  YardimKw := 'AydinlatmaSablonDuzenleme';

 kisi_id := Akisi_id; //20260;
// MainMod.MCID:= 20;
 TablesOpen;
  Result := ShowModal;
end;

procedure TfrmAydinlatmaSablonAcikRizaGereklilik.tablesOpen;
begin

  Veritipi_ids := TStringList.Create;
  Veritipi_ids.Delimiter := ',';
  Amac_ids := TStringList.Create;
  Amac_ids.Delimiter := ',';
  Taraf_ids := TStringList.Create;
  Taraf_ids.Delimiter := ',';
  chlKategori.Items.Clear;


  QueryPrep(qAcikrizaSecenek,'select * from data_acikriza_detay_secenek s where kisi_id=:kisi_id and mc_id=:mc_id') ;
  qAcikrizaSecenek.ParamByName('mc_id').AsInteger := mainmod.MCID;
  qAcikrizaSecenek.ParamByName('kisi_id').AsInteger := kisi_id;
  qAcikrizaSecenek.Open;
  Secenek_var := not qAcikrizaSecenek.IsEmpty;
  // seçili listeyi oluþturma
  if Secenek_var then
  begin
   Veritipi_ids.DelimitedText := qAcikrizaSecenek.FieldByName('Veritipi_ids').AsString;
   Amac_ids.DelimitedText := qAcikrizaSecenek.FieldByName('Amac_ids').AsString;
   Taraf_ids.DelimitedText := qAcikrizaSecenek.FieldByName('Taraf_ids').AsString;
  end else
  begin
   QueryOpen(qTmp , ' select string_agg( detail.veritipi_id::varchar,'','') as veritipi_ids from ' +
   ' (SELECT DISTINCT  env.veritipi_id, vt.veri_tipi AS veritipi_str,  ktg.kategori' +
   ' FROM data_envanter env ' +
   ' LEFT JOIN def_data_veritipi vt on vt.id = env.veritipi_id ' +
   ' LEFT JOIN def_data_kategori ktg on ktg.id = vt.md_id ' +
   ' WHERE env.main_id > 0 AND env.active = ''E'' ' +
   ' AND env.mc_id =' + inttostr(mainmod.MCID) +
   ' AND env.kisi_id =' + inttostr(kisi_id) +
   ' ORDER BY 2, 1) as detail ');
   if not qTmp.IsEmpty then
    Veritipi_ids.DelimitedText := qTmp.FieldByName('veritipi_ids').AsString;

   QueryOpen(qTmp,' SELECT string_agg( distinct a.id::VARCHAR ,'','') amac_ids ' +
   ' FROM def_data_amac a ' +
   ' WHERE a.id = ANY( ' +
   ' SELECT distinct unnest(string_to_array(env.topl_amac_ids, '','')::int[]) ' +
   ' FROM data_envanter env ' +
   ' WHERE env.active = ''E'' ' +
   ' AND env.mc_id =' + inttostr(mainmod.MCID) +
   ' AND env.kisi_id = ' + IntToStr(kisi_id) +
   ' UNION ' +
   ' SELECT distinct unnest(string_to_array(env.payl_amac_ids, '','')::int[]) ' +
   ' FROM data_envanter env ' +
   ' WHERE env.active = ''E'' ' +
   ' AND env.mc_id =' + inttostr(mainmod.MCID) +
   ' AND env.kisi_id = ' + IntToStr(kisi_id) +
   ' ) order by 1 ' ) ;
   if not qTmp.IsEmpty then
    Amac_ids.DelimitedText := qtmp.FieldByName('amac_ids').AsString;

    QueryOpen(qTmp, ' select string_agg(detail.taraf::VARCHAR,'','') taraf_ids from ' +
    ' (SELECT  DISTINCT payl_taraf_ids as taraf from data_envanter ' +
    ' WHERE active = ''E'' AND mc_id =' + inttostr(mainmod.MCID) +
    ' AND kisi_id = ' + inttostr(kisi_id) +
    ' and payl_taraf_ids is not null) as detail ') ;

    if not qTmp.IsEmpty then
      Taraf_ids.DelimitedText := qTmp.FieldByName('taraf_ids').AsString;

  end;
  // tablolarý doldur
   vtveritipi.Open;
  while not vtveritipi.Eof do
    vtveritipi.Delete;

  QueryOpen(qTmp,' SELECT DISTINCT env.veritipi_id, vt.veri_tipi AS veritipi_str,  ktg.kategori as kategori_str ' +
  ' FROM data_envanter env ' +
  ' LEFT JOIN def_data_veritipi vt on vt.id = env.veritipi_id ' +
  ' LEFT JOIN def_data_kategori ktg on ktg.id = vt.md_id ' +
  ' WHERE env.main_id > 0 AND env.active = ''E'' ' +
  ' AND env.mc_id = ' + inttostr(mainmod.MCID) +
  ' AND env.kisi_id =' + inttostr(kisi_id) +
  ' ORDER BY 3, 2 '  );

  qTmp.First ;
  while not qTmp.Eof do
  begin
    vtveritipi.Append;
    vtveritipi.FieldByName('veritipi_id').AsInteger := qTmp.FieldByName('veritipi_id').AsInteger;
    vtveritipi.FieldByName('veritipi_str').AsString := qTmp.FieldByName('veritipi_str').AsString;
    vtveritipi.FieldByName('kategori_str').AsString := qTmp.FieldByName('kategori_str').AsString;
    if Veritipi_ids.IndexOf(qTmp.FieldByName('veritipi_id').AsString) <> -1 then
      vtveritipi.FieldByName('sec').AsBoolean := true
    else
      vtveritipi.FieldByName('sec').AsBoolean := false;

    if chlKategori.Items.IndexOf(qTmp.FieldByName('Kategori_str').AsString)= -1 then
      chlKategori.Items.Add(qTmp.FieldByName('Kategori_str').AsString) ;

    qTmp.Next;
  end;

  vtamac.Open;
  while not vtamac.Eof do
    vtamac.Delete;

  QueryOpen(qTmp,' SELECT a.id amac_id,a.amac amac_str ' +
  ' FROM def_data_amac a ' +
  ' WHERE a.id = ANY( ' +
  ' SELECT unnest(string_to_array(env.topl_amac_ids, '','')::int[]) ' +
  ' FROM data_envanter env ' +
  ' WHERE env.active = ''E'' ' +
  ' AND env.mc_id = ' +   inttostr(mainmod.MCID) +
  ' AND env.kisi_id = ' +  IntToStr(kisi_id) +
  ' UNION ' +
  ' SELECT unnest(string_to_array(env.payl_amac_ids, '','')::int[]) ' +
  ' FROM data_envanter env ' +
  ' WHERE env.active = ''E'' ' +
  ' AND env.mc_id = ' +   inttostr(mainmod.MCID) +
  ' AND env.kisi_id =' +  inttostr(kisi_id) +
  ' ) order by 2,1 ' ) ;

  qTmp.First;
  while not qTmp.Eof do
  begin
    vtamac.Append;
    vtamac.FieldByName('amac_id').AsInteger := qTmp.FieldByName('amac_id').AsInteger;
    vtamac.FieldByName('amac_str').AsString := qTmp.FieldByName('amac_str').AsString;
    if Amac_ids.IndexOf(IntToStr(qTmp.FieldByName('amac_id').AsInteger)) <> -1 then
      vtamac.FieldByName('sec').AsBoolean := true
    else
      vtamac.FieldByName('sec').AsBoolean := false;
   qTmp.Next;
  end;


    queryopen(qTmp, ' SELECT t.id as taraf_id,t.taraf taraf_str ' +
    ' FROM def_data_taraf t ' +
    ' WHERE t.id IN ( ' +
    ' SELECT DISTINCT  unnest(string_to_array(string_agg(e.payl_taraf_ids, '',''), '','')::int[]) ' +
    ' FROM data_envanter e ' +
    ' WHERE e.mc_id =' + inttostr(mainmod.MCID) +
    ' AND e.kisi_id =' + inttostr(kisi_id) +
    ' and COALESCE(payl_taraf_ids,'''')<>'''' ' +
    ' ) order by t.taraf ' );

  qTmp.First;
  while not qTmp.Eof do
  begin
   vttaraf.Append;
   vttaraf.FieldByName('taraf_id').AsInteger := qTmp.FieldByName('taraf_id').AsInteger;
   vttaraf.FieldByName('taraf_str').AsString := qTmp.FieldByName('taraf_str').AsString ;
   if Taraf_ids.IndexOf(qTmp.FieldByName('taraf_id').AsString) <> -1 then
    vttaraf.FieldByName('sec').AsBoolean := true
   else
    vttaraf.FieldByName('sec').AsBoolean := false;
   qTmp.Next;
  end;




end;



procedure TfrmAydinlatmaSablonAcikRizaGereklilik.grdCellClick( Column: TUniDBGridColumn);
var
  vtTable: TVirtualTable;
begin

  if column.Grid = grdveritipi then
  vtTable := vtveritipi
  else if column.Grid = grdamac then
   vtTable := vtamac
  else if column.Grid = grdtaraf then
   vtTable := vttaraf;


 if column.FieldName = 'sec' then
 begin
  if not (vtTable.State in [dsEdit,dsInsert]) then
    vtTable.Edit;

   if vtTable.FieldByName('sec').AsBoolean  then
    vtTable.FieldByName('sec').AsBoolean := false
   else
    vtTable.FieldByName('sec').AsBoolean := true;
 end;
end;

procedure TfrmAydinlatmaSablonAcikRizaGereklilik.grdveritipiColumnSort(
  Column: TUniDBGridColumn; Direction: Boolean);
begin
// grouping yaptýðým için bu satýr boþ ta olsa olmalý
end;

procedure TfrmAydinlatmaSablonAcikRizaGereklilik.selectall(Sender: TObject);
var
vtTable : TVirtualTable;
begin
 if (sender = btnSelectVtipi) or (sender = btnNoSelectvtipi) then
  vtTable := vtveritipi
 else if (sender = btnselectAmac) or (sender = btnNoselectAmac) then
  vtTable := vtamac
 else if (sender = btnselectTaraf) or (sender = btnNoSelectTaraf)  then
  vtTable := vttaraf;


 vtTable.First ;
 while not vtTable.Eof do
 begin
  if not (vtTable.State in [dsEdit,dsInsert]) then
     vtTable.Edit ;
  vtTable.FieldByName('sec').AsBoolean := (sender as TUniSpeedButton).Tag= 10;
  vtTable.Post;
  vtTable.Next;
 end;
 vtTable.First;
end;

procedure TfrmAydinlatmaSablonAcikRizaGereklilik.UniFormBeforeShow(
  Sender: TObject);
begin
 lbIDY.Caption := MainMod.KullaniciGetir(qAcikrizaSecenek.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(qAcikrizaSecenek.FieldByName('sdy').AsString);

  if qAcikrizaSecenek.State = dsEdit then
  begin
    if lbIDY.Text = '' then lbIDY.Text := 'SÝSTEM';
    if lbSDY.Text = '' then lbSDY.Text := 'SÝSTEM';
  end;

  if qAcikrizaSecenek.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qAcikrizaSecenek.FieldByName('idt').AsDateTime);
  if qAcikrizaSecenek.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qAcikrizaSecenek.FieldByName('sdt').AsDateTime);

end;

procedure TfrmAydinlatmaSablonAcikRizaGereklilik.UniFormDestroy(
  Sender: TObject);
begin
  if Assigned(Kaynak_ids) then
    Kaynak_ids.Free;
  if Assigned(Veritipi_ids) then
    Veritipi_ids.Free;
  if Assigned(Amac_ids) then
    Amac_ids.Free;
  if Assigned(Taraf_ids) then
    Taraf_ids.Free;
end;

end.

