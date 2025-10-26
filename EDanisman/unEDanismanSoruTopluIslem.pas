unit unEDanismanSoruTopluIslem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, DateUtils,
  uniGUIClasses, uniGUIForm, Data.DB, DBAccess, Uni, MemDS, uniPanel, uniButton, uniBitBtn, uniEdit,
  uniMemo, uniDBMemo, uniDBEdit, uniLabel, uniGUIBaseClasses, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniGroupBox, uniRadioGroup, uniDBRadioGroup,
  uniBasicGrid, uniDBGrid, VirtualTable, uniDateTimePicker, uniDBNavigator,
  uniFileUpload, FlexCel.XlsAdapter;

type
  TfrmEDanismanSoruTopluIslem = class(TUniForm)
    pnlButtons: TUniPanel;
    btnCancel: TUniBitBtn;
    qTmp: TUniQuery;
    tblImport: TVirtualTable;
    dsImport: TUniDataSource;
    pnlLog: TUniContainerPanel;
    grd: TUniDBGrid;
    btnSablonIndir: TUniBitBtn;
    btnYukle: TUniBitBtn;
    btnAdd: TUniBitBtn;
    UniPanel1: TUniPanel;
    UniDBNavigator1: TUniDBNavigator;
    FileUp: TUniFileUpload;
    qSoru: TUniQuery;
    qFonk: TUniQuery;
    dsFonk: TUniDataSource;
    lbAydinlatma: TUniLabel;
    edFonk: TUniComboBox;
    UniBitBtn1: TUniBitBtn;
    procedure btnCancelClick(Sender: TObject);
    procedure grdColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure tblImportBeforePost(DataSet: TDataSet);
    procedure btnSablonIndirClick(Sender: TObject);
    procedure btnYukleClick(Sender: TObject);
    procedure FileUpCompleted(Sender: TObject; AStream: TFileStream);
    procedure btnAddClick(Sender: TObject);
    procedure grdDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure UniFormShow(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    AccessID,
    kaynakID,
    kisiID       : Integer;
    KaynakIDlist,
    kisiIdList   : TStringList;
    beforePostCheck: boolean;
    funcIdList: TStringList;
    procedure ProcessExcel(xlsxfile: string);
    function CheckRows: boolean;
  public
    function Exec(islem: String): Integer;
  end;

function frmEDanismanSoruTopluIslem: TfrmEDanismanSoruTopluIslem;

implementation

uses uniGUIApplication, MainModule, McMLib, unErisimYetkiListe, ServerModule,
     unHelpPage;

{$R *.dfm}

function frmEDanismanSoruTopluIslem: TfrmEDanismanSoruTopluIslem;
begin
  Result := TfrmEDanismanSoruTopluIslem(MainMod.GetFormInstance(TfrmEDanismanSoruTopluIslem));
end;


procedure TfrmEDanismanSoruTopluIslem.btnAddClick(Sender: TObject);
var
  sCount : String;
  iCount : Integer;
  MCID   : Integer;
  funcId : Integer;
begin
  if edFonk.itemindex = 0 then
  begin
    MessageDlg('Lütfen fonksiyon seçiniz.', mtError, [mbOk]);
    Exit;
  end;
   funcId := StrToInt(funcIdList[edFonk.ItemIndex]);

  if CheckRows = false then
  begin
    MessageDlg('Bir veya daha fazla veride hata bulunmaktadýr.'#13 +
               'Lütfen uyarý mesajlarýný kontrol ederek hatalý satýrlarý düzeltiniz.', mtError, [mbOk]);
    Exit;
  end;

  queryOpen(qSoru, 'SELECT * FROM edns_soru WHERE mc_id=' + IntToStr(mainmod.MCID));

  beforepostcheck := false;
  // Added by TEVFIK 29.05.2023 14:44:50
  if tblImport.Active = False then tblImport.Active := True;
  tblImport.First;
  while not tblImport.Eof do
  begin
    if tblImport.FieldByName('durum').AsString <> 'I' then
    begin
      tblImport.Next;
      continue;
    end;
    qSoru.Insert;
    qSoru.FieldByName('id').AsInteger                   := MainMod.GetSeq('sq_edns_soru_id');
    qSoru.FieldByName('mc_id').AsInteger                := MainMod.MCID;
    qSoru.FieldByName('func_id').AsInteger              := funcId;
    qSoru.FieldByName('idy').AsInteger                  := MainMod.LoginInfo.ID;
    qSoru.FieldByName('idt').AsDateTime                 := Now;
    qSoru.FieldByName('sdy').AsInteger                  := MainMod.LoginInfo.ID;
    qSoru.FieldByName('sdt').AsDateTime                 := Now;
    qSoru.fieldbyname('active').AsString                := tblImport.fieldbyname('active').AsString              ;
    qSoru.fieldbyname('soru_no').AsString               := tblImport.fieldbyname('soru_no').AsString             ;
    qSoru.fieldbyname('soru_metni').AsString            := tblImport.fieldbyname('soru_metni').AsString          ;
    qSoru.fieldbyname('soru_aciklama').AsString         := tblImport.fieldbyname('soru_aciklama').AsString       ;
    qSoru.fieldbyname('referans').AsString              := tblImport.fieldbyname('referans').AsString            ;
    qSoru.fieldbyname('secenek_sekli').AsString         := tblImport.fieldbyname('secenek_sekli').AsString       ;
    qSoru.fieldbyname('secenek_1').AsString             := tblImport.fieldbyname('secenek_1').AsString           ;
    qSoru.fieldbyname('secenek_1_sonuc').AsString       := tblImport.fieldbyname('secenek_1_sonuc').AsString     ;
    qSoru.fieldbyname('secenek_1_riskseviye').AsString  := tblImport.fieldbyname('secenek_1_riskseviye').AsString;
    qSoru.fieldbyname('secenek_1_risk').AsString        := tblImport.fieldbyname('secenek_1_risk').AsString      ;
    qSoru.fieldbyname('secenek_2').AsString             := tblImport.fieldbyname('secenek_2').AsString           ;
    qSoru.fieldbyname('secenek_2_sonuc').AsString       := tblImport.fieldbyname('secenek_2_sonuc').AsString     ;
    qSoru.fieldbyname('secenek_2_riskseviye').AsString  := tblImport.fieldbyname('secenek_2_riskseviye').AsString;
    qSoru.fieldbyname('secenek_2_risk').AsString        := tblImport.fieldbyname('secenek_2_risk').AsString      ;
    qSoru.fieldbyname('secenek_3').AsString             := tblImport.fieldbyname('secenek_3').AsString           ;
    qSoru.fieldbyname('secenek_3_sonuc').AsString       := tblImport.fieldbyname('secenek_3_sonuc').AsString     ;
    qSoru.fieldbyname('secenek_3_riskseviye').AsString  := tblImport.fieldbyname('secenek_3_riskseviye').AsString;
    qSoru.fieldbyname('secenek_3_risk').AsString        := tblImport.fieldbyname('secenek_3_risk').AsString      ;
    qSoru.fieldbyname('secenek_4').AsString             := tblImport.fieldbyname('secenek_4').AsString           ;
    qSoru.fieldbyname('secenek_4_sonuc').AsString       := tblImport.fieldbyname('secenek_4_sonuc').AsString     ;
    qSoru.fieldbyname('secenek_4_riskseviye').AsString  := tblImport.fieldbyname('secenek_4_riskseviye').AsString;
    qSoru.fieldbyname('secenek_4_risk').AsString        := tblImport.fieldbyname('secenek_4_risk').AsString      ;
    qSoru.fieldbyname('secenek_5').AsString             := tblImport.fieldbyname('secenek_5').AsString           ;
    qSoru.fieldbyname('secenek_5_sonuc').AsString       := tblImport.fieldbyname('secenek_5_sonuc').AsString     ;
    qSoru.fieldbyname('secenek_5_riskseviye').AsString  := tblImport.fieldbyname('secenek_5_riskseviye').AsString;
    qSoru.fieldbyname('secenek_5_risk').AsString        := tblImport.fieldbyname('secenek_5_risk').AsString      ;
    qSoru.Post;
    tblImport.Edit;
    tblImport.FieldByName('durum').AsString := 'E';
    tblImport.FieldByName('mesaj').AsString := 'Soru eklendi.';
    tblImport.Next;
  end;
  beforepostcheck := true;
end;

procedure TfrmEDanismanSoruTopluIslem.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrClose;
end;

procedure TfrmEDanismanSoruTopluIslem.btnSablonIndirClick(Sender: TObject);
begin
    UniSession.SendFile(ServerMod.FilesFolderPath + 'temp_xls\EDanisman_Soru_Toplu_Ekleme_Sablonu.xlsx', 'EDanisman_Soru_Toplu_Ekleme_Sablonu.xlsx');
end;

procedure TfrmEDanismanSoruTopluIslem.btnYukleClick(Sender: TObject);
begin
  if edFonk.itemindex = 0 then
  begin
    MessageDlg('Lütfen fonksiyon seçiniz.', mtError, [mbOk]);
    Exit;
  end;
  FileUp.Execute;
end;

function TfrmEDanismanSoruTopluIslem.CheckRows: boolean;
var
  usernamelist: TStringList;
begin
  result := true;
  beforepostcheck := false;
  usernamelist:= TStringlist.Create;
  // Added by TEVFIK 29.05.2023 14:44:50
  if tblImport.Active = False then tblImport.Active := True;
  tblImport.First;
  while not tblImport.Eof do
  begin
    tblImport.edit;
    tblImport.FieldByName('durum').AsString := 'I';
    tblImport.FieldByName('mesaj').AsString := 'Soru verileri tam ve uygun.';

    if tblImport.FieldByName('soru_no').AsString = '' then
    begin
      tblImport.FieldByName('durum').AsString := 'H';
      tblImport.FieldByName('mesaj').AsString := 'Soru No boþ olamaz.';
    end
    else
    if tblImport.FieldByName('soru_metni').AsString = '' then
    begin
      tblImport.FieldByName('durum').AsString := 'H';
      tblImport.FieldByName('mesaj').AsString := 'Soru Metni boþ olamaz.';
    end
    else
    if   (tblImport.FieldByName('secenek_sekli').AsString <> 'CHECKBOX')
     and (tblImport.FieldByName('secenek_sekli').AsString <> 'RADIOBUTTON') then
    begin
      tblImport.FieldByName('durum').AsString := 'H';
      tblImport.FieldByName('mesaj').AsString := 'Seçenek Þekli CHECKBOX veya RADIOBUTTON olmalýdýr.';
    end
    else
    if tblImport.FieldByName('secenek_1').AsString = '' then
    begin
      tblImport.FieldByName('durum').AsString := 'H';
      tblImport.FieldByName('mesaj').AsString := 'Secenek_1 boþ olamaz.';
    end
    else
    if tblImport.FieldByName('secenek_1_sonuc').AsString = '' then
    begin
      tblImport.FieldByName('durum').AsString := 'H';
      tblImport.FieldByName('mesaj').AsString := 'Secenek_1_sonuc boþ olamaz.';
    end
    else
    if   (tblImport.FieldByName('secenek_1_riskseviye').AsString <> '0 - RÝSK YOK')
     and (tblImport.FieldByName('secenek_1_riskseviye').AsString <> '1 - ÇOK DÜÞÜK')
     and (tblImport.FieldByName('secenek_1_riskseviye').AsString <> '2 - DÜÞÜK')
     and (tblImport.FieldByName('secenek_1_riskseviye').AsString <> '3 - ORTA')
     and (tblImport.FieldByName('secenek_1_riskseviye').AsString <> '4 - YÜKSEK')
     and (tblImport.FieldByName('secenek_1_riskseviye').AsString <> '5 - ÇOK YÜKSEK') then
    begin
      tblImport.FieldByName('durum').AsString := 'H';
      tblImport.FieldByName('mesaj').AsString := 'Secenek_1_riskseviye "0 - RÝSK YOK", "1 - ÇOK DÜÞÜK", "2 - DÜÞÜK",' +
                                                 '"3 - ORTA", "4 - YÜKSEK", "5 - ÇOK YÜKSEK" seçeneklerinden biri olmalýdýr.';
    end
    else
    if tblImport.FieldByName('secenek_1_risk').AsString = '' then
    begin
      tblImport.FieldByName('durum').AsString := 'H';
      tblImport.FieldByName('mesaj').AsString := 'Secenek_2_risk boþ olamaz.';
    end
    else
    if tblImport.FieldByName('secenek_1').AsString = '' then
    begin
      tblImport.FieldByName('durum').AsString := 'H';
      tblImport.FieldByName('mesaj').AsString := 'Secenek_2 boþ olamaz.';
    end
    else
    if tblImport.FieldByName('secenek_1_sonuc').AsString = '' then
    begin
      tblImport.FieldByName('durum').AsString := 'H';
      tblImport.FieldByName('mesaj').AsString := 'Secenek_2_sonuc boþ olamaz.';
    end
    else
    if   (tblImport.FieldByName('secenek_2_riskseviye').AsString <> '0 - RÝSK YOK')
     and (tblImport.FieldByName('secenek_2_riskseviye').AsString <> '1 - ÇOK DÜÞÜK')
     and (tblImport.FieldByName('secenek_2_riskseviye').AsString <> '2 - DÜÞÜK')
     and (tblImport.FieldByName('secenek_2_riskseviye').AsString <> '3 - ORTA')
     and (tblImport.FieldByName('secenek_2_riskseviye').AsString <> '4 - YÜKSEK')
     and (tblImport.FieldByName('secenek_2_riskseviye').AsString <> '5 - ÇOK YÜKSEK') then
    begin
      tblImport.FieldByName('durum').AsString := 'H';
      tblImport.FieldByName('mesaj').AsString := 'Secenek_2_riskseviye "0 - RÝSK YOK", "1 - ÇOK DÜÞÜK", "2 - DÜÞÜK",' +
                                                 '"3 - ORTA", "4 - YÜKSEK", "5 - ÇOK YÜKSEK" seçeneklerinden biri olmalýdýr.';
    end
    else
    if tblImport.FieldByName('secenek_2_risk').AsString = '' then
    begin
      tblImport.FieldByName('durum').AsString := 'H';
      tblImport.FieldByName('mesaj').AsString := 'Secenek_2_risk boþ olamaz.';
    end;

    result := result and (tblImport.FieldByName('durum').AsString <> 'H');
    tblImport.post;

    tblImport.Next;
  end;
  beforepostcheck := true;

end;

function TfrmEDanismanSoruTopluIslem.Exec(islem: String): Integer;
begin
  ShowModal;
end;

procedure TfrmEDanismanSoruTopluIslem.FileUpCompleted(Sender: TObject;
  AStream: TFileStream);
var
  TmpName: String;
  fileExt: String;
  FS     : TFileStream;
  FUrl   : String;
begin
  try
    fileExt := UpperCase(ExtractFileExt(FileUp.FileName));
    if Pos(','+fileExt+',', ',.XLSX,') <= 0 then
    begin
      MessageDlg('Sadece saðlanan Excel þablonunu yükleyebilirsiniz.', mtInformation, [mbOk]);
      exit;
    end;

    TmpName := ServerMod.NewCacheFileUrl(False, 'XLSX', '', '', FUrl, True);
    fs := TFileStream.Create(tmpname, fmCreate);
    fs.CopyFrom(fileup.Stream, fileup.Stream.size);
    fs.Free;
    processExcel(tmpName);
  except
    raise;
  end;
end;

procedure TfrmEDanismanSoruTopluIslem.ProcessExcel(xlsxfile: string);
var
  x,
  y      : integer;
  cIndex       : integer;
  xls          : TXlsFile;
begin
  xls := TXlsFile.Create(false);
  XLS.Open(xlsxfile);
  xls.ActiveSheet := 1;

  if tblImport.State = dsInactive then
    tblImport.Open;

  tblImport.First;
  while not tblImport.EOF do
    tblImport.Delete;

  beforepostcheck := true;
  try
    for y := 2 to xls.RowCount do
    begin
      tblImport.insert;
      tblImport.fieldbyname('active').AsString                := Xls.GetStringFromCell(y, 1);
      tblImport.fieldbyname('soru_no').AsString               := Xls.GetStringFromCell(y, 2);
      tblImport.fieldbyname('soru_metni').AsString            := Xls.GetStringFromCell(y, 3);
      tblImport.fieldbyname('soru_aciklama').AsString         := Xls.GetStringFromCell(y, 4);
      tblImport.fieldbyname('referans').AsString              := Xls.GetStringFromCell(y, 5);
      tblImport.fieldbyname('secenek_sekli').AsString         := Xls.GetStringFromCell(y, 6);
      tblImport.fieldbyname('secenek_1').AsString             := Xls.GetStringFromCell(y, 7);
      tblImport.fieldbyname('secenek_1_sonuc').AsString       := Xls.GetStringFromCell(y, 8);
      tblImport.fieldbyname('secenek_1_riskseviye').AsString  := Xls.GetStringFromCell(y, 9);
      tblImport.fieldbyname('secenek_1_risk').AsString        := Xls.GetStringFromCell(y, 10);
      tblImport.fieldbyname('secenek_2').AsString             := Xls.GetStringFromCell(y, 11);
      tblImport.fieldbyname('secenek_2_sonuc').AsString       := Xls.GetStringFromCell(y, 12);
      tblImport.fieldbyname('secenek_2_riskseviye').AsString  := Xls.GetStringFromCell(y, 13);
      tblImport.fieldbyname('secenek_2_risk').AsString        := Xls.GetStringFromCell(y, 14);
      tblImport.fieldbyname('secenek_3').AsString             := Xls.GetStringFromCell(y, 15);
      tblImport.fieldbyname('secenek_3_sonuc').AsString       := Xls.GetStringFromCell(y, 16);
      tblImport.fieldbyname('secenek_3_riskseviye').AsString  := Xls.GetStringFromCell(y, 17);
      tblImport.fieldbyname('secenek_3_risk').AsString        := Xls.GetStringFromCell(y, 18);
      tblImport.fieldbyname('secenek_4').AsString             := Xls.GetStringFromCell(y, 19);
      tblImport.fieldbyname('secenek_4_sonuc').AsString       := Xls.GetStringFromCell(y, 20);
      tblImport.fieldbyname('secenek_4_riskseviye').AsString  := Xls.GetStringFromCell(y, 21);
      tblImport.fieldbyname('secenek_4_risk').AsString        := Xls.GetStringFromCell(y, 22);
      tblImport.fieldbyname('secenek_5').AsString             := Xls.GetStringFromCell(y, 23);
      tblImport.fieldbyname('secenek_5_sonuc').AsString       := Xls.GetStringFromCell(y, 24);
      tblImport.fieldbyname('secenek_5_riskseviye').AsString  := Xls.GetStringFromCell(y, 25);
      tblImport.fieldbyname('secenek_5_risk').AsString        := Xls.GetStringFromCell(y, 26);
      tblImport.Post;
    end;

    except
    raise;
  end;

  if CheckRows = false then
  begin
    MessageDlg('Bir veya daha fazla soruda hata bulunmaktadýr.'#13 +
               'Lütfen uyarý mesajlarýný kontrol ederek hatalý satýrlarý düzeltiniz.', mtError, [mbOk]);
    Exit;
  end;

end;

procedure TfrmEDanismanSoruTopluIslem.tblImportBeforePost(DataSet: TDataSet);
begin
  if beforepostcheck = false then exit;

    tblImport.edit;
    tblImport.FieldByName('durum').AsString := 'I';
    tblImport.FieldByName('mesaj').AsString := 'Soru verileri tam ve uygun.';

    if tblImport.FieldByName('soru_no').AsString = '' then
    begin
      tblImport.FieldByName('durum').AsString := 'H';
      tblImport.FieldByName('mesaj').AsString := 'Soru No boþ olamaz.';
    end
    else
    if tblImport.FieldByName('soru_metni').AsString = '' then
    begin
      tblImport.FieldByName('durum').AsString := 'H';
      tblImport.FieldByName('mesaj').AsString := 'Soru Metni boþ olamaz.';
    end
    else
    if   (tblImport.FieldByName('secenek_sekli').AsString <> 'CHECKBOX')
     and (tblImport.FieldByName('secenek_sekli').AsString <> 'RADIOBUTTON') then
    begin
      tblImport.FieldByName('durum').AsString := 'H';
      tblImport.FieldByName('mesaj').AsString := 'Seçenek Þekli CHECKBOX veya RADIOBUTTON olmalýdýr.';
    end
    else
    if tblImport.FieldByName('secenek_1').AsString = '' then
    begin
      tblImport.FieldByName('durum').AsString := 'H';
      tblImport.FieldByName('mesaj').AsString := 'Secenek_1 boþ olamaz.';
    end
    else
    if tblImport.FieldByName('secenek_1_sonuc').AsString = '' then
    begin
      tblImport.FieldByName('durum').AsString := 'H';
      tblImport.FieldByName('mesaj').AsString := 'Secenek_1_sonuc boþ olamaz.';
    end
    else
    if   (tblImport.FieldByName('secenek_1_riskseviye').AsString <> '0 - RÝSK YOK')
     and (tblImport.FieldByName('secenek_1_riskseviye').AsString <> '1 - ÇOK DÜÞÜK')
     and (tblImport.FieldByName('secenek_1_riskseviye').AsString <> '2 - DÜÞÜK')
     and (tblImport.FieldByName('secenek_1_riskseviye').AsString <> '3 - ORTA')
     and (tblImport.FieldByName('secenek_1_riskseviye').AsString <> '4 - YÜKSEK')
     and (tblImport.FieldByName('secenek_1_riskseviye').AsString <> '5 - ÇOK YÜKSEK') then
    begin
      tblImport.FieldByName('durum').AsString := 'H';
      tblImport.FieldByName('mesaj').AsString := 'Secenek_1_riskseviye "0 - RÝSK YOK", "1 - ÇOK DÜÞÜK", "2 - DÜÞÜK",' +
                                                 '"3 - ORTA", "4 - YÜKSEK", "5 - ÇOK YÜKSEK" seçeneklerinden biri olmalýdýr.';
    end
    else
    if tblImport.FieldByName('secenek_1_risk').AsString = '' then
    begin
      tblImport.FieldByName('durum').AsString := 'H';
      tblImport.FieldByName('mesaj').AsString := 'Secenek_2_risk boþ olamaz.';
    end
    else
    if tblImport.FieldByName('secenek_1').AsString = '' then
    begin
      tblImport.FieldByName('durum').AsString := 'H';
      tblImport.FieldByName('mesaj').AsString := 'Secenek_2 boþ olamaz.';
    end
    else
    if tblImport.FieldByName('secenek_1_sonuc').AsString = '' then
    begin
      tblImport.FieldByName('durum').AsString := 'H';
      tblImport.FieldByName('mesaj').AsString := 'Secenek_2_sonuc boþ olamaz.';
    end
    else
    if   (tblImport.FieldByName('secenek_2_riskseviye').AsString <> '0 - RÝSK YOK')
     and (tblImport.FieldByName('secenek_2_riskseviye').AsString <> '1 - ÇOK DÜÞÜK')
     and (tblImport.FieldByName('secenek_2_riskseviye').AsString <> '2 - DÜÞÜK')
     and (tblImport.FieldByName('secenek_2_riskseviye').AsString <> '3 - ORTA')
     and (tblImport.FieldByName('secenek_2_riskseviye').AsString <> '4 - YÜKSEK')
     and (tblImport.FieldByName('secenek_2_riskseviye').AsString <> '5 - ÇOK YÜKSEK') then
    begin
      tblImport.FieldByName('durum').AsString := 'H';
      tblImport.FieldByName('mesaj').AsString := 'Secenek_2_riskseviye "0 - RÝSK YOK", "1 - ÇOK DÜÞÜK", "2 - DÜÞÜK",' +
                                                 '"3 - ORTA", "4 - YÜKSEK", "5 - ÇOK YÜKSEK" seçeneklerinden biri olmalýdýr.';
    end
    else
    if tblImport.FieldByName('secenek_2_risk').AsString = '' then
    begin
      tblImport.FieldByName('durum').AsString := 'H';
      tblImport.FieldByName('mesaj').AsString := 'Secenek_2_risk boþ olamaz.';
    end;

  tblImport.FieldByName('durum').AsString := 'I';
  tblImport.FieldByName('mesaj').AsString := 'Soru verileri tam ve uygun.';
end;

procedure TfrmEDanismanSoruTopluIslem.UniBitBtn1Click(Sender: TObject);
begin
  frmHelpPage.Exec('EDanismanTopluEkleme');
end;

procedure TfrmEDanismanSoruTopluIslem.UniFormShow(Sender: TObject);
begin
  edFonk.Items.Clear;
  edFonk.Items.Add('');
  funcIdList := TSTringList.Create;
  funcIdList.Add('0');

  QueryOpen(qtmp, 'SELECT id, function FROM sys_funcdef WHERE active=''E'' AND (mc_id=0 OR mc_id = ' + IntToStr(MainMod.MCID) + ') ORDER BY function');
  qTmp.First;
  while not qTmp.Eof do
  begin
    edFonk.Items.Add(qTmp.FieldByName('function').AsString);
    funcIdList.Add(qTmp.FieldByName('id').AsString);
    qTmp.Next;
  end;
  edFonk.ItemIndex := 0;

end;

procedure TfrmEDanismanSoruTopluIslem.grdColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
begin
  if SameText(Column.FieldName, 'groupstr') then begin end;
end;

procedure TfrmEDanismanSoruTopluIslem.grdDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if column.FieldName = 'mesaj' then
  begin
    if grd.DataSource.DataSet.FieldByName('durum').AsString = 'H' then
    begin
      Attribs.Color := clRed;
      Attribs.Font.Style := [fsBold];
    end
    else
    if grd.DataSource.DataSet.FieldByName('durum').AsString = 'E' then
    begin
      Attribs.Color := clGreen;
      Attribs.Font.Style := [];
    end
    else
    begin
      Attribs.Color := clInfoBk;
      Attribs.Font.Style := [];
    end;
  end;

end;

end.
