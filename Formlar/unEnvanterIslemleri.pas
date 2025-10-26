unit unEnvanterIslemleri;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Data.DB, Uni, DBAccess, VirtualQuery, MemDS,
  VirtualTable, rXMLReport,System.IOUtils;

type
  TfrEnvanterIslemleri = class(TUniForm)
    tblCatVT: TVirtualTable;
    qCatVT: TVirtualQuery;
    qKisi: TUniQuery;
    tblSure: TVirtualTable;
    qSure: TVirtualQuery;
    qdayanak: TUniQuery;
    qamac: TUniQuery;
    qTmp: TUniQuery;
    qTmp2: TUniQuery;
    tblKisiVT: TVirtualTable;
    qKisiVT: TVirtualQuery;
    tblTaraf: TVirtualTable;
    qTaraf: TVirtualQuery;
  private

    procedure PrepDayanak;
    procedure prepAmac;
    procedure prepIlgiliKisiSure;
    function NewGUID: string;
    procedure FileDel(AFileName: string);
    procedure DefVariables(VL: TStrings);
    procedure PrepKategoriVeriTipi;
    procedure PrepKisiVeriTipi;
    procedure PrepIlgiliKisi;
    procedure PrepTaraflar;
    procedure PrepKategoriSure;
    procedure DocXreport(AOutputName, AtempFileName, AFileName: string;
      ADatasets: array of TDataSet);
  public
    procedure KVKKPolitikasi;

  end;

function frEnvanterIslemleri: TfrEnvanterIslemleri;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication,ServerModule, McMLib, Main,  unHelpPage,
  unHizliEnvanterGirisi,RosiCompGlobalCfg;

function frEnvanterIslemleri: TfrEnvanterIslemleri;
begin
  Result := TfrEnvanterIslemleri(mainmod.GetFormInstance(TfrEnvanterIslemleri));
end;

{ TfrEnvanterIslemleri }

procedure TfrEnvanterIslemleri.DefVariables(VL: TStrings);
begin

end;

procedure TfrEnvanterIslemleri.FileDel(AFileName: string);
begin

end;

procedure TfrEnvanterIslemleri.KVKKPolitikasi;
var
  FUrl, TempFileName, OutputFileName,TemplateFileName   : String;
  ADOCXRpt : TrXMLReport ;
begin

  if not MainMod.LoginInfo.Yetkiler[121] then
  begin
    MessageDlg('Doküman indirme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if (MainMod.qMCParam.FieldByName('kurum_turu').AsString = '') or (MainMod.qMCParam.FieldByName('kurum_turu').AsString = '00_BELÝRTÝLMEDÝ') then
  begin
    MessageDlg('Kurum türü belirtilmemiþ. Lütfen Kurum Parametreleri ekranýndan kurum türünü seçiniz.', mtError, [mbOk]);
    Exit;
  end;


  PrepKategoriVeriTipi;
  PrepKisiVeriTipi;
  DocXreport('PL_01.docx' ,'temp\trash\PL_01','temp\PL_01',[MainMod.qMCDef, qCatVT, tblKisiVT]) ;


end;

function TfrEnvanterIslemleri.NewGUID: string;
begin

end;

procedure TfrEnvanterIslemleri.prepAmac;
begin

end;

procedure TfrEnvanterIslemleri.PrepDayanak;
begin

end;

procedure TfrEnvanterIslemleri.PrepIlgiliKisi;
begin

end;

procedure TfrEnvanterIslemleri.prepIlgiliKisiSure;
begin

end;

procedure TfrEnvanterIslemleri.PrepKategoriSure;
begin

end;

procedure TfrEnvanterIslemleri.PrepKategoriVeriTipi;
var
  VTStr : String;
begin
  if not tblCatVT.Active then
    tblCatVT.Open;
  tblCatVT.First;
  while not tblCatVT.EOF do tblCatVT.Delete;

  QueryOpen(qTmp, 'SELECT DISTINCT env.kategori_id, kt.kategori, kt.description ' +
                  'FROM data_envanter env ' +
                  ' join data_checklist cl on cl.mc_id= env.mc_id and cl.kisi_id= env.kisi_id  and cl.kaynak_id = env.kaynak_id '+
                  'JOIN def_data_kategori kt ON kt.id = env.kategori_id and env.mc_id = kt.mc_id  ' +
                //  'LEFT JOIN def_data_kategori kt ON kt.id = env.kategori_id ' +
                  'WHERE env.active = ''E'' AND cl.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) +
                  ' ORDER BY 2');

  while not qTmp.EOF do
  begin
    tblCatVT.Append;
    tblCatVT.FieldByName('cat_id').AsInteger  := qTmp.FieldByName('kategori_id').AsInteger;
    tblCatVT.FieldByName('cat_str').AsString  := qTmp.FieldByName('kategori').AsString;
    tblCatVT.FieldByName('cat_info').AsString := qTmp.FieldByName('description').AsString;

    VTStr := '';
    QueryOpen(qTmp2, 'SELECT DISTINCT vt.veri_tipi ' +
                     'FROM data_envanter env ' +
                     ' join data_checklist cl on cl.mc_id= env.mc_id and cl.kisi_id= env.kisi_id  and cl.kaynak_id=env.kaynak_id '+
                     'JOIN def_data_veritipi vt ON vt.id = env.veritipi_id  and vt.mc_id = env.mc_id ' +
              //       'LEFT JOIN def_data_veritipi vt ON vt.id = env.veritipi_id ' +
                     'WHERE env.active = ''E'' AND cl.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) +
                     ' AND env.kategori_id = ' + IntToStr(qTmp.FieldByName('kategori_id').AsInteger) +
                     ' ORDER BY 1');
    while not qTmp2.EOF do
    begin
      VTStr := VTStr + qTmp2.FieldByName('veri_tipi').AsString + ', ';
      qTmp2.Next;
    end;
    if VTStr <> '' then System.Delete(VTStr, Length(VTStr) - 1, 2);
    tblCatVT.FieldByName('cat_vt').AsString := VTStr;

    tblCatVT.Post;

    qTmp.Next;
  end;

  qCatVT.Close;
  qCatVT.SQL.Clear;
  qCatVT.SQL.Add('SELECT * FROM tblCatVT ORDER BY cat_str');
  qCatVT.Open;

end;

procedure TfrEnvanterIslemleri.PrepKisiVeriTipi;
var
  VTStr : String;
begin
  tblKisiVT.First;
  while not tblKisiVT.EOF do tblKisiVT.Delete;

  QueryOpen(qTmp, 'SELECT DISTINCT env.kisi_id, ks.kisi ' +
                  'FROM data_envanter env ' +
                  ' JOIN data_checklist cl on cl.mc_id=env.mc_id and cl.kisi_id=env.kisi_id and cl.kaynak_id=env.kaynak_id '+
               //   'LEFT JOIN def_data_kisi ks ON ks.id = env.kisi_id ' +
                  'JOIN def_data_kisi ks ON ks.id = env.kisi_id and ks.mc_id= env.mc_id ' +
                  'WHERE env.active = ''E'' AND cl.active = ''E'' AND env.main_id = 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) +
                  ' ORDER BY 2');
  while not qTmp.EOF do
  begin
    tblKisiVT.Append;
    tblKisiVT.FieldByName('kisi_id').AsInteger  := qTmp.FieldByName('kisi_id').AsInteger;
    tblKisiVT.FieldByName('kisi_str').AsString  := qTmp.FieldByName('kisi').AsString;

    VTStr := '';
    QueryOpen(qTmp2, 'SELECT DISTINCT vt.veri_tipi ' +
                     'FROM data_envanter env ' +
                     ' JOIN data_checklist cl on cl.mc_id=env.mc_id and cl.kisi_id=env.kisi_id and cl.kaynak_id=env.kaynak_id '+
                    // 'LEFT JOIN def_data_veritipi vt ON vt.id = env.veritipi_id ' +
                     'JOIN def_data_veritipi vt ON vt.id = env.veritipi_id and vt.mc_id= env.mc_id  ' +
                     'WHERE env.active = ''E'' AND env.main_id > 0 AND env.mc_id = ' + IntToStr(MainMod.MCID) +
                     ' AND env.kisi_id = ' + IntToStr(qTmp.FieldByName('kisi_id').AsInteger) +
                     ' ORDER BY 1');
    while not qTmp2.EOF do
    begin
      VTStr := VTStr + qTmp2.FieldByName('veri_tipi').AsString + ', ';
      qTmp2.Next;
    end;
    if VTStr <> '' then System.Delete(VTStr, Length(VTStr) - 1, 2);
    tblKisiVT.FieldByName('kisi_vt').AsString := VTStr;

    tblKisiVT.Post;

    qTmp.Next;
  end;

  qKisiVT.Close;
  qKisiVT.SQL.Clear;
  qKisiVT.SQL.Add('SELECT * FROM tblKisiVT ORDER BY kisi_str');
  qKisiVT.Open;

end;

procedure TfrEnvanterIslemleri.PrepTaraflar;
begin

end;

procedure TfrEnvanterIslemleri.DocXreport(AOutputName, AtempFileName, AFileName: string;
  ADatasets: array of TDataSet);
var
  FUrl ,TemplateFileName, TempFilename, outputfileName  : String;
  ADOCXRpt : TrXMLReport;
  LogMessage : string;
begin
  LogMessage := 'TfrEnvanterListe2.DocXreport - %s ';
  ADOCXRpt := TrXMLReport.Create(nil);
  try
    DefVariables(ADOCXRpt.Variables);
    ADOCXRpt.ActionAfter := aaNone;
    try
        if not DirectoryExists(ServerMod.FilesFolderPath + 'temp\trash') then
          ForceDirectories(ServerMod.FilesFolderPath + 'temp\trash') ;

       ServerMod.Logger.AddLog(Format(LogMessage,['DirectoryExists Çýkýldý'])) ;
       TemplateFileName := ServerMod.FilesFolderPath + AFileName + '.docx';
       TempFilename := ServerMod.FilesFolderPath + AtempFileName + '_'+ NewGUID + '.docx';
       ServerMod.Logger.AddLog(Format(LogMessage,[' NewGuid çýkýldý'])) ;

       if FileExists(TemplateFileName) then
        TFile.Copy(TemplateFileName,TempFilename);

       ServerMod.Logger.AddLog(Format(LogMessage,['FileExists çýkýldý'])) ;
       ADOCXRpt.ReportFile := TempFilename;
       outputfileName :=  ServerMod.NewCacheFileUrl(False, 'docx', '', '', FUrl, True);
       ADOCXRpt.OutputFile := outputfileName ;
       ServerMod.Logger.AddLog(Format(LogMessage,['ADocxrpt oluþturulacak'])) ;
       ADOCXRpt.Execute(ADatasets) ;
       ServerMod.Logger.AddLog(Format(LogMessage,['Adocxrpt oluþturuldu'])) ;
    except on E : Exception   do
      begin
        ShowMessageN('Hata.. Þablon oluþturulamýyor.'#13 + E.Message) ;
        ServerMod.Logger.AddLog(Format(LogMessage,['Þablon oluþturulamadý'])) ;
        FileDel(TempFileName);
        exit;
      end;
    end;

    try
      ServerMod.Logger.AddLog(Format(LogMessage,['Sendfile gerçekleþecek'])) ;
      UniSession.SendFile(ADOCXRpt.OutputFile, AOutputName )  ;
      ServerMod.Logger.AddLog(Format(LogMessage,['Sendfile gerçekleþti'])) ;
    except on E : exception  do
      begin
        ShowMessageN('Hata.. Dosya gönderilemiyor.'#13 + E.Message);
        ServerMod.Logger.AddLog(Format(LogMessage,['Dosya Gönderilemedi'])) ;
        FileDel(TempFileName);
        exit;
      end;
    end;

  finally
    FileDel(TempFileName);
   if Assigned(ADOCXRpt) then
    FreeAndNil(ADOCXRpt);

  end;

end;

end.
