unit uAydinlatmaSablonOlusturma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Data.DB, MemDS, DBAccess, Uni, frxClass,
  frxExportBaseDialog, frxExportPDF, frxDBSet, VirtualTable,strutils,
  uniProgressBar, uniGUIBaseClasses, uniLabel, uniTimer, uniMemo, uniPanel,
  uniButton, uniBitBtn;
type
  TfrmAydinlatmaSablonOlusturma = class(TUniForm)
    qTmp: TUniQuery;
    qAydinlatma: TUniQuery;
    qAydDocs: TUniQuery;
    qAydDocsid: TIntegerField;
    qAydDocsmc_id: TIntegerField;
    qAydDocsayd_id: TIntegerField;
    qAydDocsdosya: TBlobField;
    qAydDocssdt: TDateTimeField;
    qAydDocsayd_guid: TStringField;
    qTemizle: TUniQuery;
    qPost: TUniQuery;
    qSeq: TUniQuery;
    qSure: TUniQuery;
    tblAktarim: TVirtualTable;
    qAmac: TUniQuery;
    tblKatVeriTipi: TVirtualTable;
    qDayanak: TUniQuery;
    qMetod: TUniQuery;
    frxReportAM: TfrxReport;
    frxReportAMR: TfrxReport;
    frxdsMCDef: TfrxDBDataset;
    frxdsMetod: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxdsAydinlatma: TfrxDBDataset;
    frxdsDayanak: TfrxDBDataset;
    frxdsAktarim: TfrxDBDataset;
    frxdsAmac: TfrxDBDataset;
    frxdsDummy: TfrxDBDataset;
    frxdsSure: TfrxDBDataset;
    frxdsKatVeriTipi: TfrxDBDataset;
    tblDummy: TVirtualTable;
    memLog: TUniMemo;
    UniButton1: TUniButton;
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    btnClose: TUniBitBtn;
    pnlbaslik: TUniPanel;
    procedure btnCloseClick(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
  private
    FKisi_id: integer;
    procedure setter(const Value: integer);
    procedure PrepTbl_AM_KategoriVeriTipi;
    procedure PrepTbl_AM_ToplamaMetodu;
    procedure PrepTbl_AM_HukukiDayanaklar;
    procedure PrepTbl_AM_IslemeAmaci;
    procedure PrepTbl_AM_SaklamaSureleri;
    procedure PrepTbl_AM_VeriAktarimYerleri;
    procedure AydinlatmaOlustur;
    procedure AydinlatmaAcikRizaOlustur;
    function AR_Secenek_getir(AqAydinlatma: TUniQuery; Afield: string;
      var ASecenekMevcut: boolean): string;
    function MakeStr_AR_VeriTipi(LineFeed: Boolean): String;
    function MakeStr_AR_IslemePaylasmaAmaci(LineFeed: Boolean): String;
    function MakeStr_AR_AktarilacakYerler(LineFeed: Boolean): String;
    //Lkisi_id: Integer;
    property Kisi_id: integer read FKisi_id write setter;
    procedure GetSablon;
    function raporOlustur:boolean;
  public
    function AydinlatmaSablonOlustur(Akisi_id : integer): integer;
  end;

const
  ParantezAc    : String = #13'(';
  ParantezKapat : String = ')'#13;

function frmAydinlatmaSablonOlusturma: TfrmAydinlatmaSablonOlusturma;

implementation

{$R *.dfm}


uses uniGUIApplication, MainModule, McMLib, ServerModule;

function frmAydinlatmaSablonOlusturma: TfrmAydinlatmaSablonOlusturma;
begin
  Result := TfrmAydinlatmaSablonOlusturma(mainmod.GetFormInstance(TfrmAydinlatmaSablonOlusturma));
end;

{ TfrmAydinlatmaSablonOlusturma }

function TfrmAydinlatmaSablonOlusturma.AydinlatmaSablonOlustur(Akisi_id : integer): integer;
begin
  kisi_id := Akisi_id;
  result := ShowModal;

end;

procedure TfrmAydinlatmaSablonOlusturma.btnCloseClick(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TfrmAydinlatmaSablonOlusturma.GetSablon;
begin
 memLog.Lines.add('Þablonlar yükleniyor' );
try
 if FileExists(ExtractFilePath(ParamStr(0)) + 'files\temp_fr3\UNIVERSAL_AYDINLATMA_METNI.fr3') then
  begin
    try
      frxReportAM.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'files\temp_fr3\UNIVERSAL_AYDINLATMA_METNI.fr3');
      memLog.Lines.add('Aydýnlatma þablonu yüklendi.');
    except
      memLog.Lines.add('Þablonu yüklenemedi: "files\temp_fr3\UNIVERSAL_AYDINLATMA_METNI.fr3');
    end;
  end
  else
  begin
    memLog.Lines.add('Þablonu deðiþtirmek için dosya yükleyiniz: "files\temp_fr3\UNIVERSAL_AYDINLATMA_METNI.fr3"');
  end;

  if FileExists(ExtractFilePath(ParamStr(0)) + 'files\temp_fr3\UNIVERSAL_AYDINLATMA_ACIK_RIZA_BEYANI.fr3') then
  begin
    try
     frxReportAMR.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'files\temp_fr3\UNIVERSAL_AYDINLATMA_ACIK_RIZA_BEYANI.fr3');
     memLog.Lines.add( 'Açýk rýza þablonu yüklendi.');
    except
     memLog.Lines.add('Þablonu yüklenemedi : "files\temp_fr3\UNIVERSAL_AYDINLATMA_ACIK_RIZA_BEYANI.fr3');
    end;
  end
  else
  begin
    memLog.Lines.add('Þablonu deðiþtirmek için dosya yükleyiniz: "files\temp_fr3\UNIVERSAL_AYDINLATMA_ACIK_RIZA_BEYANI.fr3"');
  end;
except
    memLog.Lines.add('Þabolanlar yüklenemedi');
end;
end;

function TfrmAydinlatmaSablonOlusturma.raporOlustur: boolean;
begin
    qAydinlatma.First;
    while not qAydinlatma.Eof do
    begin
      if qAydinlatma.FieldByName('acik_riza').AsString = 'H' then
        AydinlatmaOlustur
      else
        AydinlatmaAcikRizaOlustur;

      qAydinlatma.Next;
    end;
  qAydDocs.Close;
  qAydinlatma.Close;
end;

procedure TfrmAydinlatmaSablonOlusturma.AydinlatmaAcikRizaOlustur;
var
  ms: TStream;
begin  
try      
  memLog.Lines.add(  qAydinlatma.FieldByName('tanim').AsString );
  PrepTbl_AM_KategoriVeriTipi;
  PrepTbl_AM_ToplamaMetodu;
  PrepTbl_AM_HukukiDayanaklar;
  PrepTbl_AM_IslemeAmaci;
  PrepTbl_AM_SaklamaSureleri;
  PrepTbl_AM_VeriAktarimYerleri; 


  if tblDummy.Active = false then tblDummy.Active := true;
  tblDummy.First;
  while not tblDummy.Eof do
    tblDummy.Delete;
  tblDummy.insert;
  tblDummy.FieldByName('tarih').AsString := '';
  tblDummy.FieldByName('ipadres').AsString := '';
  tblDummy.FieldByName('DATATYPELIST').AsString := MakeStr_AR_VeriTipi(True);                     // Açýk Rýza
  tblDummy.FieldByName('PURPOSELIST').AsString := MakeStr_AR_IslemePaylasmaAmaci(True );           // Açýk Rýza
  tblDummy.FieldByName('TRANSFERLOCATIONLIST').AsString := MakeStr_AR_AktarilacakYerler(True);    // Açýk Rýza
  tblDummy.Post;


  memLog.Lines.add(  'Metin Þablon Oluþturuluyor' );

  frxReportAMR.PrintOptions.ShowDialog := False;
  frxReportAMR.ShowProgress := false;

  frxReportAMR.EngineOptions.SilentMode := True;
  frxReportAMR.EngineOptions.EnableThreadSafe := True;
  frxReportAMR.EngineOptions.DestroyForms := False;
  frxReportAMR.EngineOptions.UseGlobalDataSetList := False;

  frxPDFExport1.Background := True;
  frxPDFExport1.ShowProgress := False;
  frxPDFExport1.ShowDialog := False;
  frxPDFExport1.DefaultPath := '';

  frxReportAMR.PreviewOptions.AllowEdit := False;
  frxReportAMR.PrepareReport;

  if qAydDocs.Active = false then
    qAydDocs.Open;
  qAydDocs.Insert;
  ms := qAydDocs.CreateBlobStream(qAydDocsdosya, bmWrite);
  try
      frxPDFExport1.Stream := ms;
      if frxReportAMR.Export(frxPDFExport1) then
      begin
        qAydDocs.FieldByName('id').AsInteger          := GetSequence(qSeq, 'sq_def_data_aydinlatma_docs_id');
        qAydDocs.FieldByName('mc_id').AsInteger       := qAydinlatma.FieldByName('mc_id').AsInteger;
        qAydDocs.FieldByName('ayd_id').AsInteger      := qAydinlatma.FieldByName('id').AsInteger;
        qAydDocs.FieldByName('ayd_guid').AsWideString := qAydinlatma.FieldByName('aguid').AsWideString;
        qAydDocs.FieldByName('sdt').AsDateTime        := now;
        qAydDocs.Post;
        qTemizle.ParamByName('ayd_id').AsInteger      := qAydDocs.FieldByName('ayd_id').AsInteger;
        qTemizle.ParamByName('doc_id').AsInteger      := qAydDocs.FieldByName('id').AsInteger;
        qTemizle.ExecSQL;

      end
      else
        qAydDocs.Cancel;
  finally
       ms.Free;
  end;
  memLog.Lines.add( '(Açýk Rýza) Ýþlem Tamamlandý');

  except on e:Exception do
  begin
    memLog.Lines.add('(Açýk Rýza) Ýþlem Tamamlanamadý. Hata: ' + e.Message);
    if qAydDocs.State = dsInsert then
      qAydDocs.Cancel;
  end;
  end;  
    

end;


function TfrmAydinlatmaSablonOlusturma.MakeStr_AR_AktarilacakYerler(LineFeed: Boolean  ): String;
var
  sTmp   : String;
  sTaraf : String;
  AR_SecenekMevcut : boolean;
  taraf_ids : string;
begin

 taraf_ids := AR_Secenek_getir(qAydinlatma,'taraf_ids',AR_SecenekMevcut);

  QueryOpen(qTmp, 'SELECT DISTINCT payl_taraf_ids as taraf from data_envanter ' +
                  'WHERE active = ''E'' AND mc_id = ' + qAydinlatma.FieldByName('mc_id').AsString + ' AND kisi_id = ' +
                  IntToStr(kisi_id));

  sTmp := '';
  while not qTmp.EOF do
  begin
    if qTmp.FieldByName('taraf').AsString <> '' then
       sTmp := sTmp + qTmp.FieldByName('taraf').AsString + ',';
    qTmp.Next;
  end;
  if sTmp <> '' then
    System.Delete(sTmp, Length(sTmp), 1);

  sTaraf := '';
  Result := '';
  if sTmp = '' then
    Exit;

  QueryOpen(qTmp, 'SELECT taraf FROM def_data_taraf WHERE id IN (' +  IfThen(AR_SecenekMevcut,ifthen(taraf_ids<>'',taraf_ids,'0'),sTmp) +  ') ORDER BY id');

  while not qTmp.EOF do
  begin
    if qTmp.FieldByName('taraf').AsString <> '' then
       sTaraf := sTaraf + '- ' + Trim(qTmp.FieldByName('taraf').AsString) + ','#13;
    qTmp.Next;
  end;
  if sTaraf <> '' then
    System.Delete(sTaraf, Length(sTaraf) - 1, 2);

  if not LineFeed then
    sTaraf := StringReplace(sTaraf, #13, ' ', [rfReplaceAll]);

  Result := sTaraf;

end;


function TfrmAydinlatmaSablonOlusturma.MakeStr_AR_IslemePaylasmaAmaci(LineFeed: Boolean ): String;
var
  sTmp   : String;
  sAmac  : String;
  AR_SecenekMevcut : boolean;
  amac_ids : string;
begin

  amac_ids := AR_Secenek_getir(qAydinlatma,'amac_ids',AR_SecenekMevcut);


    QueryOpen(qTmp, 'SELECT topl_amac_ids as amac from data_envanter ' +
                    'WHERE active = ''E'' AND mc_id = ' + qAydinlatma.FieldByName('mc_id').AsString + ' AND kisi_id = ' +
                    IntToStr(kisi_id) +
                    ' UNION ' +
                    'SELECT payl_amac_ids as amac from data_envanter ' +
                    'WHERE active = ''E'' AND mc_id = ' + qAydinlatma.FieldByName('mc_id').AsString + ' AND kisi_id = ' +
                    inttostr(kisi_id));

    sTmp := '';
    while not qTmp.EOF do
    begin
      if qTmp.FieldByName('amac').AsString <> '' then
         sTmp := sTmp + qTmp.FieldByName('amac').AsString + ',';
      qTmp.Next;
    end;
    if sTmp <> '' then System.Delete(sTmp, Length(sTmp), 1);
    sAmac := '';
    Result := '';
    if sTmp = '' then Exit;


  QueryOpen(qTmp, 'SELECT amac FROM def_data_amac WHERE id IN (' + IfThen(AR_SecenekMevcut,ifthen(amac_ids<>'',amac_ids,'0'),sTmp) + ') ORDER BY id');

  while not qTmp.EOF do
  begin
    if qTmp.FieldByName('amac').AsString <> '' then
       sAmac := sAmac + '- ' + Trim(qTmp.FieldByName('amac').AsString) + ','#13;
    qTmp.Next;
  end;
  if sAmac <> '' then
    System.Delete(sAmac, Length(sAmac) - 1, 2);

  if not LineFeed then
    sAmac := StringReplace(sAmac, #13, ' ', [rfReplaceAll]);

  Result := sAmac;
end;



function TfrmAydinlatmaSablonOlusturma.MakeStr_AR_VeriTipi(LineFeed: Boolean  ): String;
var
  sTmp     : String;
  Kategori : String;
  AR_SecenekMevcut : boolean;
  veritipi_ids : string;
  str : string;
begin
  sTmp     := '';
  Kategori := '';
  veritipi_ids := AR_Secenek_getir(qAydinlatma,'veritipi_ids',AR_SecenekMevcut);

  str :=  'SELECT DISTINCT env.veritipi_id, vt.veri_tipi AS veritipi_str, vt.md_id, ktg.kategori ' +
                  'FROM data_envanter env ' +
                  '   LEFT JOIN def_data_veritipi vt on vt.id = env.veritipi_id ' +
                  '   LEFT JOIN def_data_kategori ktg on ktg.id = vt.md_id ' +
                  'WHERE env.main_id > 0 AND env.active = ''E'' AND env.mc_id = ' + qAydinlatma.FieldByName('mc_id').AsString +
                  ' AND env.kisi_id = ' +  inttostr(Kisi_id);
  if AR_SecenekMevcut then
     str := str + ' and veritipi_id in ('+
     ifthen(veritipi_ids='','0',veritipi_ids)+
     ')'  ;

  str := str + ' ORDER BY 4, 1';
  QueryOpen(qTmp,str);


  while not qTmp.EOF do
  begin
    if Kategori <> qTmp.FieldByName('kategori').AsString then
    begin
      Kategori := Trim(qTmp.FieldByName('kategori').AsString);
      if sTmp = '' then
      begin
        sTmp := sTmp + Kategori + ParantezAc;
      end
      else
      begin
        System.Delete(sTmp, Length(sTmp) - 1, 2);
        sTmp := sTmp + ParantezKapat + Kategori + ParantezAc;
      end;
    end;

    sTmp := sTmp + Trim(qTmp.FieldByName('veritipi_str').AsString) + ', ';
    qTmp.Next;
  end;

  if sTmp <> '' then
  begin
    System.Delete(sTmp, Length(sTmp) - 1, 2);
    sTmp := sTmp + ParantezKapat;
  end;
  if not LineFeed then
    sTmp := StringReplace(sTmp, #13, ' ', [rfReplaceAll]);

  Result := sTmp;

end;

procedure TfrmAydinlatmaSablonOlusturma.AydinlatmaOlustur;
var
  ms: TStream;
  tempFileName: string;
begin

    try
      memLog.Lines.add( qAydinlatma.FieldByName('tanim').AsString );
      PrepTbl_AM_KategoriVeriTipi;
      PrepTbl_AM_ToplamaMetodu;
      PrepTbl_AM_HukukiDayanaklar;
      PrepTbl_AM_IslemeAmaci;
      PrepTbl_AM_SaklamaSureleri;
      PrepTbl_AM_VeriAktarimYerleri;


      if tblDummy.Active = false then tblDummy.Active := true;
      tblDummy.First;
      while not tblDummy.Eof do
        tblDummy.Delete;
      tblDummy.insert;
      tblDummy.FieldByName('tarih').AsString := '';
      tblDummy.FieldByName('ipadres').AsString := '';
      tblDummy.Post;


      memLog.Lines.add( 'Metin Þablon Oluþturuluyor');


      frxReportAM.PrintOptions.ShowDialog := False;
      frxReportAM.ShowProgress := false;

      frxReportAM.EngineOptions.SilentMode := True;
      frxReportAM.EngineOptions.EnableThreadSafe := True;
      frxReportAM.EngineOptions.DestroyForms := False;
      frxReportAM.EngineOptions.UseGlobalDataSetList := False;

      frxPDFExport1.Background := True;
      frxPDFExport1.ShowProgress := False;
      frxPDFExport1.ShowDialog := False;
      frxPDFExport1.DefaultPath := '';

      frxReportAM.PreviewOptions.AllowEdit := False;

      if qAydDocs.Active = false then
        qAydDocs.Open;
      qAydDocs.Insert;
      ms := qAydDocs.CreateBlobStream(qAydDocsdosya, bmWrite);
        try
          frxPDFExport1.Stream := ms;

          frxReportAM.PrepareReport;

          if frxReportAM.Export(frxPDFExport1) then
          begin
            qAydDocs.FieldByName('id').AsInteger          := GetSequence(qSeq, 'sq_def_data_aydinlatma_docs_id');
            qAydDocs.FieldByName('mc_id').AsInteger       := qAydinlatma.FieldByName('mc_id').AsInteger;
            qAydDocs.FieldByName('ayd_id').AsInteger      := qAydinlatma.FieldByName('id').AsInteger;
            qAydDocs.FieldByName('ayd_guid').AsWideString := qAydinlatma.FieldByName('aguid').AsWideString;
            qAydDocs.FieldByName('sdt').AsDateTime        := now;
            qAydDocs.Post;

            qTemizle.ParamByName('ayd_id').AsInteger      := qAydDocs.FieldByName('ayd_id').AsInteger;
            qTemizle.ParamByName('doc_id').AsInteger      := qAydDocs.FieldByName('id').AsInteger;
            qTemizle.ExecSQL;

          end
          else
          begin
             qAydDocs.Cancel;
             memLog.Lines.add( 'PDF Dosya oluþturulamadý!');
             exit;
          end;
        finally
           ms.Free;
        end;
         memLog.Lines.add( '(Aydýnlatma) Ýþlem Tamamlandý');
      except on e:Exception do
      begin
        memLog.Lines.add('(Açýk Rýza) Ýþlem Tamamlanamadý. Hata: ' + e.Message);
        if qAydDocs.State = dsInsert then
          qAydDocs.Cancel;
      end;
    end;

end;


procedure TfrmAydinlatmaSablonOlusturma.PrepTbl_AM_VeriAktarimYerleri;
var
  sPayStr  ,
  sPayID   : String;
begin
  if not tblAktarim.Active then tblAktarim.Open;
  tblAktarim.First;
  while not tblAktarim.EOF do tblAktarim.Delete;

  QueryOpen(qTmp, 'SELECT DISTINCT kaynak_id, ky.kaynak as kaynak_str ' +
                  'FROM data_envanter env LEFT JOIN def_data_kaynak ky ON env.kaynak_id=ky.id ' +
                  'WHERE env.active = ''E'' AND env.mc_id = ' + qAydinlatma.FieldByName('mc_id').AsString + ' AND env.kisi_id = ' +
                  inttostr(kisi_id) + ' ORDER BY 1');
  while not qTmp.EOF do
  begin
    tblAktarim.Append;
    tblAktarim.FieldByName('kaynak_id').AsInteger := qTmp.FieldByName('kaynak_id').AsInteger;
    tblAktarim.FieldByName('kaynak_str').AsString := qTmp.FieldByName('kaynak_str').AsString;
    tblAktarim.Post;

    qTmp.Next;
  end;

  tblAktarim.First;
  while not tblAktarim.EOF do
  begin
    // Paylaþým Amaçlarý Listesi
    begin
      QueryOpen(qTmp, 'SELECT DISTINCT payl_amac_ids from data_envanter ' +
                      'WHERE active = ''E'' AND mc_id = ' + qAydinlatma.FieldByName('mc_id').AsString + ' AND kisi_id = ' +
                      inttostr(kisi_id) + ' AND kaynak_id = ' +
                      tblAktarim.FieldByName('kaynak_id').AsString + ' ORDER BY 1');
      sPayStr := '';
      sPayID  := '';
      while not qTmp.EOF do
      begin
        if qTmp.FieldByName('payl_amac_ids').AsString <> '' then
           sPayID  := sPayID + qTmp.FieldByName('payl_amac_ids').AsString + ',';

        qTmp.Next;
      end;
      if sPayID <> '' then
      begin
        System.Delete(sPayID, Length(sPayID), 1);
        QueryOpen(qTmp, 'SELECT id, amac FROM def_data_amac WHERE id IN (' + sPayID + ')');

        sPayStr := '';
        sPayID  := '';
        while not qTmp.EOF do
        begin
          sPayID  := sPayID + qTmp.FieldByName('id').AsString + ',';
          sPayStr := sPayStr + qTmp.FieldByName('amac').AsString + ', ';

          qTmp.Next;
        end;
        if sPayID <> '' then
        begin
          System.Delete(sPayID, Length(sPayID), 1);
          System.Delete(sPayStr, Length(sPayStr) - 1, 2);
        end;
        tblAktarim.Edit;
        tblAktarim.FieldByName('payl_amac_ids').AsString := sPayID;
        tblAktarim.FieldByName('payl_amac_str').AsString := sPayStr;
        tblAktarim.Post;
      end;
    end;

    // Paylaþým Taraflarý Listesi
    begin
      QueryOpen(qTmp, 'SELECT DISTINCT payl_taraf_ids from data_envanter ' +
                      'WHERE active = ''E'' AND mc_id = ' + qAydinlatma.FieldByName('mc_id').AsString + ' AND kisi_id = ' +
                      IntToStr(kisi_id) + ' AND kaynak_id = ' +
                      tblAktarim.FieldByName('kaynak_id').AsString + ' ORDER BY 1');
      sPayStr := '';
      sPayID  := '';
      while not qTmp.EOF do
      begin
        if qTmp.FieldByName('payl_taraf_ids').AsString <> '' then
           sPayID  := sPayID + qTmp.FieldByName('payl_taraf_ids').AsString + ',';
        qTmp.Next;
      end;
      if sPayID <> '' then
      begin
        System.Delete(sPayID, Length(sPayID), 1);
        QueryOpen(qTmp, 'SELECT id, taraf FROM def_data_taraf WHERE id IN (' + sPayID + ')');

        sPayStr := '';
        sPayID  := '';
        while not qTmp.EOF do
        begin
          if qTmp.FieldByName('taraf').AsString = 'VERÝ AKTARILMAMAKTADIR' then
          begin
            qTmp.Next;
            Continue;
          end;

          sPayID  := sPayID + qTmp.FieldByName('id').AsString + ',';
          sPayStr := sPayStr + qTmp.FieldByName('taraf').AsString + ', ';

          qTmp.Next;
        end;
        if sPayID <> '' then
        begin
          System.Delete(sPayID, Length(sPayID), 1);
          System.Delete(sPayStr, Length(sPayStr) - 1, 2);
        end;

        if sPayStr = '' then sPayStr := 'VERÝ AKTARILMAMAKTADIR';
        tblAktarim.Edit;
        tblAktarim.FieldByName('payl_taraf_ids').AsString := sPayID;
        tblAktarim.FieldByName('payl_taraf_str').AsString := sPayStr;
        tblAktarim.Post;
      end;
    end;
    // Paylaþým Metodlarý Listesi
    begin
      QueryOpen(qTmp, 'SELECT DISTINCT payl_metod_ids from data_envanter ' +
                      'WHERE active = ''E'' AND mc_id = ' + qAydinlatma.FieldByName('mc_id').AsString + ' AND kisi_id = ' +
                      inttostr(kisi_id) + ' AND kaynak_id = ' +
                      tblAktarim.FieldByName('kaynak_id').AsString + ' ORDER BY 1');
      sPayStr := '';
      sPayID  := '';
      while not qTmp.EOF do
      begin
        if qTmp.FieldByName('payl_metod_ids').AsString <> '' then
           sPayID  := sPayID + qTmp.FieldByName('payl_metod_ids').AsString + ',';

        qTmp.Next;
      end;
      if sPayID <> '' then
      begin
        System.Delete(sPayID, Length(sPayID), 1);
        QueryOpen(qTmp, 'SELECT id, metod FROM def_data_metod WHERE id IN (' + sPayID + ')');

        sPayStr := '';
        sPayID  := '';
        while not qTmp.EOF do
        begin
          sPayID  := sPayID + qTmp.FieldByName('id').AsString + ',';
          sPayStr := sPayStr + qTmp.FieldByName('metod').AsString + ', ';

          qTmp.Next;
        end;
        if sPayID <> '' then
        begin
          System.Delete(sPayID, Length(sPayID), 1);
          System.Delete(sPayStr, Length(sPayStr) - 1, 2);
        end;
        tblAktarim.Edit;
        tblAktarim.FieldByName('payl_metod_ids').AsString := sPayID;
        tblAktarim.FieldByName('payl_metod_str').AsString := sPayStr;
        tblAktarim.Post;
      end;

      tblAktarim.Next;
    end;
  end;
  tblAktarim.First;
end;



procedure TfrmAydinlatmaSablonOlusturma.PrepTbl_AM_SaklamaSureleri;
begin
  QueryOpen(qSure, 'SELECT DISTINCT ky.kaynak AS kaynak_str, sakl_ssure, sakl_fsure ' +
                   'FROM data_envanter env LEFT JOIN def_data_kaynak ky ON env.kaynak_id=ky.id ' +
                   'WHERE env.active = ''E'' AND main_id = 0 AND env.mc_id = ' + qAydinlatma.FieldByName('mc_id').AsString +
                   ' AND env.kisi_id = ' + inttostr(kisi_id));
end;


procedure TfrmAydinlatmaSablonOlusturma.PrepTbl_AM_IslemeAmaci;
var
  sTmp : String;
begin
  QueryOpen(qTmp, 'SELECT DISTINCT topl_amac_ids as amac from data_envanter ' +
                  'WHERE active = ''E'' AND mc_id = ' + qAydinlatma.FieldByName('mc_id').AsString +
                  ' AND kisi_id = ' + IntToStr(Kisi_id));
  sTmp := '';
  while not qTmp.EOF do
  begin
    if qTmp.FieldByName('amac').AsString <> '' then sTmp := sTmp + qTmp.FieldByName('amac').AsString + ',';
    qTmp.Next;
  end;

  if sTmp = '' then
  begin
    QueryOpen(qAmac, 'SELECT amac FROM def_data_amac WHERE id = 0');
    Exit;
  end;
  System.Delete(sTmp, Length(sTmp), 1);

  QueryOpen(qAmac, 'SELECT amac FROM def_data_amac WHERE id IN (' + sTmp + ') ORDER BY id');

end;


procedure TfrmAydinlatmaSablonOlusturma.PrepTbl_AM_HukukiDayanaklar;
var
  sTmp : String;
begin
  QueryOpen(qTmp, 'SELECT DISTINCT chl.dayanak_ids FROM data_checklist chl ' +
                  'WHERE chl.active = ''E'' AND chl.mc_id = ' + qAydinlatma.FieldByName('mc_id').AsString + ' AND chl.kisi_id = ' +
                  inttostr(kisi_id )+ ' AND chl.kaynak_id IN (' +
                  ' SELECT DISTINCT env.kaynak_id FROM data_envanter env WHERE env.active = ''E'' AND env.mc_id = ' +
                  qAydinlatma.FieldByName('mc_id').AsString + ' AND env.kisi_id = ' + inttostr(kisi_id) + ')');

  sTmp := '';
  while not qTmp.EOF do
  begin
    if qTmp.FieldByName('dayanak_ids').AsString <> '' then
       sTmp := sTmp + qTmp.FieldByName('dayanak_ids').AsString + ',';
    qTmp.Next;
  end;

  if sTmp = '' then
  begin
    QueryOpen(qDayanak, 'SELECT dayanak FROM def_data_dayanak WHERE id = 0');
    Exit;
  end;
  System.Delete(sTmp, Length(sTmp), 1);

  QueryOpen(qDayanak, 'SELECT dayanak FROM def_data_dayanak WHERE id IN (' + sTmp + ') ORDER BY id');

end;


procedure TfrmAydinlatmaSablonOlusturma.PrepTbl_AM_ToplamaMetodu;
var
  sTmp : String;
begin
  QueryOpen(qTmp, 'SELECT DISTINCT topl_metod_ids from data_envanter ' +
                  'WHERE active = ''E'' AND mc_id = ' + qAydinlatma.FieldByName('mc_id').AsString + ' AND kisi_id = ' +
                  IntToStr(kisi_id));

  sTmp := '';
  while not qTmp.EOF do
  begin
    if qTmp.FieldByName('topl_metod_ids').AsString <> '' then sTmp := sTmp + qTmp.FieldByName('topl_metod_ids').AsString + ',';
    qTmp.Next;
  end;

  if sTmp = '' then
  begin
    QueryOpen(qMetod, 'SELECT metod FROM def_data_metod WHERE id = 0');
    Exit;
  end;
  if sTmp <> '' then System.Delete(sTmp, Length(sTmp), 1);
  QueryOpen(qMetod, 'SELECT metod FROM def_data_metod WHERE id IN (' + sTmp + ') ORDER BY id');
end;


procedure TfrmAydinlatmaSablonOlusturma.PrepTbl_AM_KategoriVeriTipi;
var
  sKat  : String;
  sVT   : String;
begin
 
  if not tblKatVeriTipi.Active then tblKatVeriTipi.Open;
  tblKatVeriTipi.First;
  while not tblKatVeriTipi.EOF do tblKatVeriTipi.Delete;

  QueryOpen(qTmp, 'SELECT DISTINCT env.veritipi_id, vt.veri_tipi AS veritipi_str, vt.md_id, ktg.kategori ' +
                  'FROM data_envanter env ' +
                  '   LEFT JOIN def_data_veritipi vt on vt.id = env.veritipi_id ' +
                  '   LEFT JOIN def_data_kategori ktg on ktg.id = vt.md_id ' +
                  'WHERE env.main_id > 0 AND env.active = ''E'' AND env.mc_id = ' + qAydinlatma.FieldByName('mc_id').AsString +
                  ' AND env.kisi_id = ' + inttostr(kisi_id) +
                  ' ORDER BY 4, 1');

  if qTmp.FieldByName('md_id').AsInteger < 1 then Exit;
  sKat := qTmp.FieldByName('kategori').AsString;
  sVT  := '';

  while not qTmp.EOF do
  begin
    if sKat = qTmp.FieldByName('kategori').AsString then
    begin
      sVT := sVT + qTmp.FieldByName('veritipi_str').AsString + ', ';
    end
    else
    begin
      if sVT <> '' then System.Delete(sVT, Length(sVT) - 1, 2); // Delete the last ", " character from string
      tblKatVeriTipi.Append;
      tblKatVeriTipi.FieldByName('kategori').AsString := sKat;
      tblKatVeriTipi.FieldByName('veritipi').AsString := sVT;
      tblKatVeriTipi.Post;

      sKat := qTmp.FieldByName('kategori').AsString;
      sVT  := qTmp.FieldByName('veritipi_str').AsString + ', ';
    end;
    qTmp.Next;
  end;

  if sVT <> '' then
  begin
    System.Delete(sVT, Length(sVT) - 1, 2); // Delete the last ", " character from string
    tblKatVeriTipi.Append;
    tblKatVeriTipi.FieldByName('kategori').AsString := sKat;
    tblKatVeriTipi.FieldByName('veritipi').AsString := sVT;
    tblKatVeriTipi.Post;
  end;

  tblKatVeriTipi.First;

end;

procedure TfrmAydinlatmaSablonOlusturma.setter(const Value: integer);
begin
  FKisi_id := Value;

    queryOpen(qAydDocs, 'SELECT * FROM def_data_aydinlatma_docs WHERE id=0 ');
    queryOpen(qAydinlatma, ' SELECT ayd.*, ks.kisi as kisi_str ' +
                           ' FROM def_data_aydinlatma ayd ' +
                           ' LEFT JOIN def_data_kisi ks ON ks.id = ayd.kisi_id ' +
                           ' WHERE ayd.kisi_id ='+ inttostr(kisi_id)+
                           ' and ayd.durum in (''YAYINDA'') and ayd.mc_id=' +  IntToStr(mainmod.MCID) );


  memLog.Lines.Clear;
end;

procedure TfrmAydinlatmaSablonOlusturma.UniFormAfterShow(Sender: TObject);
begin
  if not qAydinlatma.IsEmpty then
  begin
    pnlbaslik.Caption :='ÝLGÝLÝ KÝÞÝ :  (' + qAydinlatma.FieldByName('kisi_str').AsString + ')';
  end;
  GetSablon;
  tblAktarim.Open;
  tblKatVeriTipi.Open;
  tblDummy.Open;
  raporOlustur;
end;

function TfrmAydinlatmaSablonOlusturma.AR_Secenek_getir(AqAydinlatma : TUniQuery; Afield : string ;var ASecenekMevcut : boolean):string;
begin
 Result := '0';
 ASecenekMevcut := false;
 try
  QueryOpen(qTmp,' SELECT * FROM data_acikriza_detay_secenek where mc_id='+
    AqAydinlatma.FieldByName('mc_id').AsString +
    ' and  kisi_id =' + inttostr(Kisi_id)  );

  ASecenekMevcut := not qTmp.IsEmpty;
  if ASecenekMevcut then
    result := qTmp.FieldByName(Afield).AsString;
 except
  result := '0' ;
 end;
end;

end.
