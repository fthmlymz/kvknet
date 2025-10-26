unit McMLib;

interface

uses Windows, Forms, Classes, SysUtils, Dialogs, Variants, TlHelp32, Winsock, DB, Uni, MSHTML,
  ShellApi, System.IOUtils, System.NetEncoding, StrUtils, DateUtils,Generics.Collections,
  UniDBGrid,  VCL.FlexCel.Core,  FlexCel.XlsAdapter,  UniGUIApplication,UITypes,virtualtable,
  uniComboBox,uniPanel,Vcl.Controls,TypInfo,uniGroupBox,uniGUIClasses,unilistbox;
type
  TEylemTipi = (Etekleme,EtTekDegistirme,EtTopluDegistirme);
type
  ArrayOfStr = Array Of String;

  TParameter = record
    Modul     : String;
    Alt_Modul : String;
    Parametre : String;
    Aciklama  : String;
    Deger1    : String;
    Deger2    : String;
    Deger3    : String;
  end;

type
  TLoginInfo = record
    ID                : Integer;
    GCID              : Integer;
    MCID              : Integer;
    UserName          : String[20];
    Password          : String;
    FullName          : String[30];
    Rol               : String[30];
    Firmalar          : String;
    Birimler          : String;
    Yetkiler          : Array [1..9999] of Boolean;
    mc_detail         : String;
    apiToken          : String;
    EMail             : String;
    Password_change_tar : TDateTime ;
//    Yil               : String[4];
//    Ay                : String[4];
//    Gun               : String[4];
//    fmtMiktar         : String[30];
//    fmtTutar          : String[30];
//    fmtOran           : String[30];
//    fmtYTL            : String[30];
//    fmtKDV            : String[10];
//    Basamak           : Char;
//    Ondalik           : Char;
//    TarihAyrac        : Char;
//    SistemTarihi      : TDateTime;
//    // ftp_adres : String[20];
    MAC_IPNo          : String;
//    MAC_Address       : String;
//    Computer_Name     : String;
//    Computer_User     : String;
//    Computer_Domain   : String;
//    Aktif_BOF         : Integer;
//    Aktif_IK_Firmalar : String;
  end;

var
  Param     : TParameter;
  // LoginInfo : TLoginInfo;

// Control Functions
function MsgBox(Text: WideString; Caption: WideString; Flags: Integer): Integer;
// General and Convertion Functions
function NewGuid: String;
function CreateOTC(ALength: Integer = 5; ALetter: Boolean = False): String;
function ProcessCount(ExeName: String): Integer;
function ExecAndWait(FileName: String; Params: String): Bool;
function ParseString(var AStr: String; ASep: String): String;
function NVL(VarList: Array Of Variant): Variant;
function Decode(TestValue: Variant; Values :Array of Variant):Variant;
function VarToFloat(Value: Variant): Double;
function VarToInt(Value: Variant): Integer;
function TR2EN_Lower(AStr: String): String;
function TR2EN_Upper(AStr: String): String;
function TR_Lower(AStr: String): String;
function TR_Upper(AStr: String): String;
function TR_Regular(AStr: String): String;
function TR_Correct(AStr: String): String;
function MaskStr(AStr: String; AFormat: String):String;
function Name2User(Ad, Soyad: String): String;
function CalcNewDate(OldDate: TDateTime; Period: Integer; PType: String): TDateTime;
function OccurrencesOfChar(const S: string; const C: char): integer;
// function DecimalToText(Num: Extended): String;  // to convert Integer   Part of Money
// function PrecisionToText(AStr: String) : String; // to convert Precision Part of Money
function MoneyToText(Num: Extended): String;
function NumToText(Num: Extended): String;
function Str2Date(AStr: String): TDate;
function Str2DateTime(AStr: String): TDateTime;
function Date2Str(ADate: TDateTime): String;
function DateTime2Str(ATime: TDateTime): String;
function CheckGSMNo(Num: String): String;
function CheckEMail(eMail: String): Boolean;
// Encrypt - Decrypt Functions
function EncryptStr(AStr: String): String;
function DecryptStr(AStr: String): String;
function EncryptSys(InFile, OutFile: String): Boolean;
function DecryptSys(InFile, OutFile: String): Boolean;
function Data2Perm(AData: TUniQuery): String;
function GetCipherList(AStrength: Integer): WideString;
// Data Functions
// function GetParameter(AData: TUniQuery; Modul, AltModul, Parametre: String): TParameter;
function GetSequence(AData: TUniQuery; SeqName: String): Integer;
procedure QueryPrep(AData: TUniQuery; ASQL: String);
procedure QueryOpen(AData: TUniQuery; ASQL: String);
procedure QueryExec(AData: TUniQuery; ASQL: String);
//procedure QueryCreate(var AData: TUniQuery; ASQL: String; aConn:TUniConnection; AActive: boolean);
function DataEditing(ADataSet: TCustomUniDataSet): Boolean;
function DataEmpty(ADataSet: TCustomUniDataSet): Boolean;
procedure RefreshQuery(AQuery: TUniQuery);
procedure DataRefresh(ADataSet: TCustomUniDataSet);
procedure File2Blob(AData: TDataSet; AFieldName, AFileName: String);
procedure Blob2File(AData: TDataSet; AFieldName, AFileName: String);
function File2Base64Str(FN: String): String;
function Blob2Base64Str(AData: TDataSet; AFieldName, AFileName: String): String;
function FileSize(fileName : WideString) : Int64;
// Browser Functions
function Str2HTMLStr(AStr: String): String;
function HTML_GetFormByName(ADoc: IHTMLDocument2; const FormName: String): IHTMLFormElement;
function HTML_GetItemByName(AForm: IHTMLFormElement; const ItemName: String): IHTMLElement;
function HTML_GetImage(ADoc: IHTMLDocument2; const SrcName: String): IHTMLImgElement;
function HTML_GetButtonByName(AForm: IHTMLFormElement; const ButtonName: String): IHTMLButtonElement;
procedure HTML_SetFieldValue(AForm: IHTMLFormElement; const FieldName: String; const NewValue: String; const Instance: Integer = 0);
procedure PreviewDocument(AData: TUniQuery; DocID: Integer);
// File Functions
function SupportedFiles: String;
function SupportedImages: String;
function IsBrowserFile(AExt: String): Boolean;
function IsImageFile(AExt: String): Boolean;
function IsTextFile(AExt: String): Boolean;
function IsPDFFile(AExt: String): Boolean;
function IsOfficeFile(AExt: String): Boolean;
function IsMailFile(AExt: String): Boolean;
/// <summary>Doðan akçay Projenin Versiyon No döndürür </summary>
Function Projeversiyon(const AppName: string; var V1, V2, V3, V4: Word):string;
procedure ExportQueryToExcel(Query: TDataSet; Grid: TUniDBGrid; const FileName: string);
/// <summary>Doðan Akçay query colums larýný virtual tableye ekler/// </summary>
procedure CopyFieldsFromQueryToVirtualTable(Query: TuniQuery; VirtualTable: TVirtualTable; RecordAdd :boolean=false);
/// <summary>  Doðan Akçay enum ve string listeden sql case yapýsý dönüþtürür  </summary>
function EnumDegeriIcinCaseIfadesiOlustur(FieldName: string; EnumStrings: array of string): string;
/// <summary>  Doðan Akçay enum ve string listeden sql iç içe case yapýsý dönüþtürür  </summary>
function EnumDegeriIcinIcIceCaseIfadesiOlustur (DisField: string; IcField: string; DisEnumDegerleri, IcEnumDegerleri: array of string): string;

/// <summary> Doðan akçay combobox tan enum deðer alýr /// </summary>
function ComboboxEnumDegerAl(ComboBox: TUniComboBox; EnumArray: array of string): Integer;
/// <summary> Doðan Akçay panel içindeki tüm nesneleri readonl yapar ve ya kaldýrýr </summary>
  procedure PaneldeOkunurYap(AParent: TWinControl; Durum: Boolean);
/// <summary> Doðan Akçay : Dosya yolundaki geçirsiz karakterleri "_" ile deðiþtirir </summary>
function DosyaAdiTemizle(const FileName: string): string;
/// <summary> Doðan Akçay : checbox seçili kayýtlarýn sýra no verir</summary>
function GetCheckBox(Acombox: TUniCheckComboBox): string;
/// <summary> Doðan Akçay : checbox iþaretler</summary>
procedure setCheckBox(Acombobox :TUniCheckComboBox;Avalue:string);
/// <summary> Doðan Akçay : listbox seçili kayýtlarýn sýra no verir</summary>
function GetlistBox(Alistbox: TUniListBox): string;
/// <summary> Doðan Akçay : listboxý iþaretler</summary>
procedure setlistBox(Alistbox :TUniListBox;Avalue:string);
/// <summary> Doðan Akçay : Dinamik parametrik sql çalýþtýrmak için kullanýlýr /// </summary>
procedure ExecuteDynamicQuery(Query: TUniQuery; BaseSQL: string; Params: array of TPair<string, Variant> ; OrderBy:string='');
/// <summary> Doðan Akçay :   SQL Injection a sebep olabilecek ifadelerin kontrolünü yapar /// </summary>
function GuvenliGirisMi(const Giris: string): Boolean;
/// <sumary> Doðan Akçay :  url sonunda / iþaretini kontrol eder yoksa ekler /// </summary>
function Slashcontrol(Astring  : string) :string;
implementation

uses DCPcrypt2, DCPRijndael, DCPSha512, unPwdUtilities;

const
  PassPhrase = 'vQ^Bj6M<%mc{T:H&dT)~Yn3-';
  SupportedFileCount = 10;
  SupportedImgCount  = 6;

const
  Rakam: Array[1..4, 0..9] of String[10] =
         (('','Yüz', 'ÝkiYüz', 'ÜçYüz', 'DörtYüz', 'BeþYüz', 'AltýYüz', 'YediYüz', 'SekizYüz', 'DokuzYüz'),
          ('','On', 'Yirmi', 'Otuz', 'Kýrk', 'Elli', 'Altmýþ', 'Yetmiþ', 'Seksen', 'Doksan'),
          ('','Bir', 'Ýki', 'Üç', 'Dört', 'Beþ', 'Altý', 'Yedi', 'Sekiz', 'Dokuz'),
          ('','Bir', 'Ýki', 'Üç', 'Dört', 'Beþ', 'Altý', 'Yedi', 'Sekiz', 'Dokuz'));

var
  SupportedFileTypes : Array [1..SupportedFileCount, 1..2] of String;
  SupportedImgTypes  : Array [1..SupportedImgCount,  1..2] of String;
  Rijndael : TDCP_Rijndael;
  Sha512   : TDCP_Sha512;
  Hash     : TDCP_Hash;           // the hash to use
  Cipher   : TDCP_Cipher;         // the cipher to use

function Min(a, b: integer): Integer;
begin
  if (a < b) then Result := a else Result := b;
end;

function MsgBox(Text: WideString; Caption: WideString; Flags: Integer): Integer;
begin
  Result := Application.MessageBox(PWideChar(Text), PWideChar(Caption), Flags);
end;

function NewGuid: String;
begin
  Result := TGUID.NewGuid.ToString;
  System.Delete(Result, 1, 1);
  System.Delete(Result, Length(Result), 1);
end;

function CreateOTC(ALength: Integer; ALetter: Boolean): String;
var
  OTCChars   : String;  {possible characters}
  OTCString  : String;  {OTC string}
  FirstDigit : Integer; {position of first digit}
  i          : Integer;
begin
  if ALength < 4 then ALength := 4;

  OTCChars  := '0123456789';
  if ALetter then OTCChars  := OTCChars + 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  OTCString := '';
  for i := 1 to ALength do OTCString := OTCString + ' ';

  Randomize;
  OTCString[1] := OTCChars[1 + Random(9)]; {always digit number in first position}

  if ALetter then {if user wants Letter in password}
  begin
    FirstDigit := 2 + Random(ALength - 1); {position of first letter}
    OTCString[FirstDigit] := OTCChars[11 + Random(26)];
  end;

  for i := 2 to ALength do {Now fill up the rest of the string with digits}
  begin
    if i = ALength then   {if it is last character}
    begin
      if (OTCString[i] = ' ') then
      begin
        repeat
           if ALetter then OTCString[i] := OTCChars[11 + Random(26)]
            else OTCString[i] := OTCChars[1 + Random(9)]
        until OTCString[i] <> OTCString[i - 1]
      end;
    end
    else   {if not last character}
    begin
      if (OTCString[i] = ' ') then
      begin
        repeat
           if ALetter then OTCString[i] := OTCChars[11 + Random(26)]
            else OTCString[i] := OTCChars[1 + Random(9)]
        until (OTCString[i] <> OTCString[i - 1]) and (OTCString[i] <> OTCString[i + 1]);
      end;
    end;
  end;
	Result := Copy(OTCString, 1, ALength);
end;

function ProcessCount(ExeName: String): Integer;
var
  ContinueLoop    : BOOL;
  FSnapshotHandle : THandle;
  FProcessEntry32 : TProcessEntry32;
begin
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  Result := 0;
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(ExeName)) or
        (UpperCase(FProcessEntry32.szExeFile) = UpperCase(ExeName))) then Inc(Result);
    ContinueLoop:= Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

function NVL(VarList: Array Of Variant): Variant;
var
  i : Integer;
begin
  Result := '';
  for i := Low(VarList) to High(VarList) do
      begin
        if VarIsNull(VarList[i]) then Continue;
        Result := VarList[i];
        Break;
      end;
end;

function Decode(TestValue: Variant; Values :Array of Variant):Variant;
var
  i :Integer;
begin
  Result := '';
  for i := 0 to High(Values) div 2 do
      if NVL([TestValue, '-*0*']) =  NVL([Values[i * 2], '59*032']) then
      begin
        Result := Values[i * 2 + 1];
        Break;
      end;
end;

function VarToFloat(Value: Variant): Double;
var
  TempStr: String;
  TempVal: Double;
begin
  TempStr := VarToStr(Value);
  if TempStr = '' then TempStr := '0';
  try
    TempVal := StrToFloat(TempStr);
  except on EConvertError do
      TempVal := 0;
  end;
  Result := TempVal;
end;

function VarToInt(Value: Variant): Integer;
var
  TempStr: String;
  TempVal: Integer;
begin
  TempStr := VarToStr(Value);
  if TempStr = '' then TempStr := '0';
  try
    TempVal := StrToInt(TempStr);
  except on EConvertError do
      TempVal := 0;
  end;
  Result := TempVal;
end;

function TR2EN_Lower(AStr: String): String;
var
  i   : Integer;
  Str : String;
begin
  Str := '';
  for i := 1 to Length(AStr) do
    case AStr[i] of
      'þ', 'Þ' : Str := Str + 's';
      'ç', 'Ç' : Str := Str + 'c';
      'ö', 'Ö' : Str := Str + 'o';
      'ð', 'Ð' : Str := Str + 'g';
      'ü', 'Ü' : Str := Str + 'u';
      'ý', 'Ý' : Str := Str + 'i';
    else Str := Str + LowerCase(AStr[i]);
    end;
  Result := Str;
end;

function TR2EN_Upper(AStr: String): String;
var
  i   : Integer;
  Str : String;
begin
  Str := '';
  for i := 1 to Length(AStr) do
    case AStr[i] of
      'þ', 'Þ' : Str := Str + 'S';
      'ç', 'Ç' : Str := Str + 'C';
      'ö', 'Ö' : Str := Str + 'O';
      'ð', 'Ð' : Str := Str + 'G';
      'ü', 'Ü' : Str := Str + 'U';
      'ý', 'Ý' : Str := Str + 'I';
    else Str := Str + UpperCase(AStr[i]);
    end;
  Result := Str;
end;

function TR_Lower(AStr: String): String;
var
  i   : Integer;
  Str : String;
begin
  Str := '';
  for i := 1 to Length(AStr) do
  begin
    case AStr[i] of
      'Ý' : Str := Str + 'i';
      'I' : Str := Str + 'ý';
      'Ü' : Str := Str + 'ü';
      'Ö' : Str := Str + 'ö';
      'Þ' : Str := Str + 'þ';
      'Ç' : Str := Str + 'ç';
      'Ð' : Str := Str + 'ð';
    else Str := Str + LowerCase(AStr[i]);
    end;
  end;
  Result := Str;
end;

function TR_Upper(AStr: String): String;
var
  i   : Integer;
  Str : String;
begin
  Str := '';
  for i := 1 to Length(AStr) do
  begin
    case AStr[i] of
      'i' : Str := Str + 'Ý';
      'ý' : Str := Str + 'I';
      'ü' : Str := Str + 'Ü';
      'ö' : Str := Str + 'Ö';
      'þ' : Str := Str + 'Þ';
      'ç' : Str := Str + 'Ç';
      'ð' : Str := Str + 'Ð';
    else Str := Str + UpperCase(AStr[i]);
    end;
  end;
  Result := Str;
end;

function TR_Regular(AStr: String): String;
var
  i   : Integer;
  Str : String;
  up  : Boolean;
begin
  Str := '';
  up := true;
  for i := 1 to Length(AStr) do
  begin
    if up then
    begin
      str := Str + tr_upper(AStr[i]);
    end
    else Str := Str + tr_lower(AStr[i]);
    up := AStr[i] in [' ', '.', ',', ';', '(', ')', '/', '\', '?', '!', '_', '-'];
  end;
  Result := Str;
end;

function TR_Correct(AStr: String): String;
var
  i   : Integer;
  Str : String;
begin
  Str := '';
  for i := 1 to Length(AStr) do
  begin
    case AStr[i] of
      'ý' : Str := Str + 'i';
      'ü' : Str := Str + 'u';
      'ö' : Str := Str + 'o';
      'þ' : Str := Str + 's';
      'ç' : Str := Str + 'c';
      'ð' : Str := Str + 'g';
      'Ý' : Str := Str + 'I';
      'Ü' : Str := Str + 'U';
      'Ö' : Str := Str + 'O';
      'Þ' : Str := Str + 'S';
      'Ç' : Str := Str + 'C';
      'Ð' : Str := Str + 'G';
    else Str := Str + AStr[i];
    end;
  end;
  Result := Str;
end;


function MaskStr(AStr: String; AFormat: String):String;
var
  i   : Integer;
  Str : String;
  up  : Boolean;
begin
  Str := '';
  if ((aFormat = 'TEL') or ((length(AStr)=12) and (copy(AStr, 1,2)='(5'))) then
  begin
    result := copy(AStr, 1, 5) + '***' + copy(AStr, 9, 4);
    exit;
  end
  else
//    if ((AFormat = 'ADSOYAD') or (AFormat = '')) then
  begin
    str := copy(AStr, 1,2);
    for i := 3 to length(AStr)-2 do
    begin
      if (AStr[i] = ' ') or
         (AStr[i-1] = ' ') or
         (AStr[i-2] = ' ') then
        str := str + AStr[i]
      else
        str := str + '*';
    end;
    result := str + '**';
    exit;
  end;
  Result := Str;
end;

function Name2User(Ad, Soyad: String): String;
var
  MyPos : Integer;
begin
  Ad     := Trim(Ad);
  Soyad  := Trim(Soyad);
  MyPos  := Pos(' ', Ad);
  if MyPos > 0 then Ad := Trim(Copy(Ad, 1, MyPos - 1));
  MyPos  := Pos(' ', Soyad);
  if MyPos > 0 then Soyad := Trim(Copy(Soyad, 1, MyPos - 1));
  Result := TR2EN_Lower(Ad) + '.' + TR2EN_Lower(Soyad);
end;

function CalcNewDate(OldDate: TDateTime; Period: Integer; PType: String): TDateTime;
begin
  if PType = 'GÜN' then Result := IncDay(OldDate, Period)
    else if PType = 'AY' then Result := IncMonth(OldDate, Period)
      else if PType = 'YIL' then Result := IncYear(OldDate, Period)
        else Result := OldDate;
end;

function OccurrencesOfChar(const S: string; const C: char): integer;
var
  i: Integer;
begin
  result := 0;
  for i := 1 to Length(S) do
    if S[i] = C then
      inc(result);
end;

function DecimalToText(Num: Extended): String;
var
  Y : Array[1..6] of String[40];
  S : Integer;
  B : Integer;
  I : Integer;
  R : String[18];
  X : String[3];
  AStr : String;
begin
  for S := 1 to 6 do Y[S] := '';
  R := FormatFloat('##############', Num);
  B := 1;
  I := 0;
  X := '';
  for S := Length(R) downto 1 do
  begin
    I := I + 1;
    X := R[S] + X;
    if (I = 3) or (S = 1) then
    begin
      while Length(X) < 3 do X := '0' + X;
      Y[B] := Rakam[1, StrToInt(Copy(X, 1, 1))];
      Y[B] := Y[B] + Rakam[2, StrToInt(Copy(X, 2, 1))];
      Y[B] := Y[B] + Rakam[3, StrToInt(Copy(X, 3, 1))];
      if B > 1 then
         case B of
           2: if StrToInt(X) > 0 then Y[B] := Y[B] + 'Bin';
           3: if StrToInt(X) > 0 then Y[B] := Y[B] + 'Milyon';
           4: if StrToInt(X) > 0 then Y[B] := Y[B] + 'Milyar';
           5: if StrToInt(X) > 0 then Y[B] := Y[B] + 'Trilyon';
           6: if StrToInt(X) > 0 then Y[B] := Y[B] + 'Trilyar';
         end;
      B := B + 1;
      I := 0;
      X := '';
    end;
  end;

  if (Y[6] + Y[5] + Y[4] + Y[3] + Y[2] + Y[1]) = '' then Result := ''
  else
    begin
      AStr := Y[6] + Y[5] + Y[4] + Y[3] + Y[2] + Y[1];
      if (Num > 999) and (Num < 2000) then
        if Pos('Bir', AStr) = 1 then Delete(AStr, 1, 3);
      Result := AStr + ' TL ';
    end;
end;

function PrecisionToText(AStr:String) : String;
begin
  if (AStr = '0') or (AStr = '00') then
  begin
    Result := '';
    Exit;
  end;

  if Length(AStr) = 1 then Result := Rakam[3, StrToInt(AStr)] + ' KR.'
   else Result := Rakam[2, StrToInt(AStr[1])] + Rakam[4, StrToInt(AStr[2])] + ' KR.';
end;

function MoneyToText(Num:Extended): String;
begin
  Result := NumToText(Trunc(Num))+ PrecisionToText(Copy(FormatFloat('.00', Num - Trunc(Num)), 2, 2));
end;

function NumToText(Num: Extended): String;
var
  Y : Array[1..6] of String[40];
  S : Integer;
  B : Integer;
  I : Integer;
  R : String[18];
  X : String[3];
  AStr : String;
begin
  for S := 1 to 6 do Y[S] := '';
  R := FormatFloat('##############', Num);
  B := 1;
  I := 0;
  X := '';
  for S := Length(R) downto 1 do
  begin
    I := I + 1;
    X := R[S] + X;
    if (I = 3) or (S = 1) then
    begin
      while Length(X) < 3 do X := '0' + X;
      Y[B] := Rakam[1, StrToInt(Copy(X, 1, 1))];
      Y[B] := Y[B] + Rakam[2, StrToInt(Copy(X, 2, 1))];
      Y[B] := Y[B] + Rakam[3, StrToInt(Copy(X, 3, 1))];
      if B > 1 then
         case B of
           2: if StrToInt(X) > 0 then Y[B] := Y[B] + 'Bin';
           3: if StrToInt(X) > 0 then Y[B] := Y[B] + 'Milyon';
           4: if StrToInt(X) > 0 then Y[B] := Y[B] + 'Milyar';
           5: if StrToInt(X) > 0 then Y[B] := Y[B] + 'Trilyon';
           6: if StrToInt(X) > 0 then Y[B] := Y[B] + 'Trilyar';
         end;
      B := B + 1;
      I := 0;
      X := '';
    end;
  end;

  if (Y[6] + Y[5] + Y[4] + Y[3] + Y[2] + Y[1]) = '' then Result := ''
  else
    begin
      AStr := Y[6] + Y[5] + Y[4] + Y[3] + Y[2] + Y[1];
      if (Num > 999) and (Num < 2000) then
        if Pos('Bir', AStr) = 1 then Delete(AStr, 1, 3);
      Result := AStr;
    end;
end;

function Date2Str(ADate: TDateTime): String;
begin
  Result := FormatDateTime('dd.mm.yyyy', ADate);
end;

function DateTime2Str(ATime: TDateTime): String;
begin
  Result := FormatDateTime('dd.mm.yyyy hh:nn:ss', ATime);
end;

function Str2Date(AStr: String): TDate;
begin
  if Length(AStr) < 10 then
  begin
    Result := 0;
    Exit;
  end;
  try
    result := EncodeDate(StrToInt(copy(astr, 7, 4)), StrToInt(copy(astr, 4, 2)), StrToInt(copy(astr, 1, 2)));
  except
    result := 0;
  end;
end;

function Str2DateTime(AStr: String): TDateTime;
begin
  if Length(AStr) < 10 then
  begin
    Result := 0;
    Exit;
  end;
  try
    result := EncodeDate(StrToInt(copy(astr, 7, 4)), StrToInt(copy(astr, 4, 2)), StrToInt(copy(astr, 1, 2)))
            + EnCodeTime(StrToInt(copy(astr, 12, 2)), StrToInt(copy(astr, 15, 2)) , StrToInt(copy(astr, 18, 2)), 0);
  except
    result := 0;
  end;
end;

function CheckGSMNo(Num: String): String;
var
  Tmp : String;
begin
  Tmp := StringReplace(Num, ' ', '', [rfReplaceAll]);
  Tmp := StringReplace(Tmp, '(', '', [rfReplaceAll]);
  Tmp := StringReplace(Tmp, ')', '', [rfReplaceAll]);
  Result := Tmp;
end;

function CheckEMail(eMail: String): Boolean;
  function CheckAllowed(const s: string): boolean;
  var
    i: integer;
  begin
    Result:= False;
    for i:= 1 to Length(s) do
    begin
      // illegal char - no valid address
      if not (s[i] in ['a'..'z','A'..'Z','0'..'9','_','-','.','+']) then
        Exit;
    end;
    Result:= True;
  end;
var
  i: integer;
  namePart, serverPart: string;
begin
  Result:= False;

  i:= Pos('@', eMail);
  if (i = 0) then
    Exit;

  if(pos('..', eMail) > 0) or (pos('@@', eMail) > 0) or (pos('.@', eMail) > 0)then
    Exit;

  if(pos('.', eMail) = 1) or (pos('@', eMail) = 1) then
    Exit;

  namePart:= Copy(eMail, 1, i - 1);
  serverPart:= Copy(eMail, i + 1, Length(eMail));
  if (Length(namePart) = 0)  or (Length(serverPart) < 5)    then
    Exit;                      // too short

  i:= Pos('.', serverPart);
  // must have dot and at least 3 places from end
  if (i=0) or (i>(Length(serverPart)-2)) then
    Exit;

  Result:= CheckAllowed(namePart) and CheckAllowed(serverPart);
end;

function EncryptStr(AStr: String): String;
var
  i          : integer;
  CipherIV   : Array of Byte;         // the initialisation vector (for chaining modes)
  HashDigest : Array of Byte;         // the result of hashing the passphrase with the salt
  Salt       : Array[0..7] of Byte;   // a random salt to help prevent precomputated attacks
  strmInput, strmOutput: TStringStream;
begin
  Result     := '';
  Rijndael   := TDCP_Rijndael.Create(Application);
  Cipher     := TDCP_Cipher(Rijndael);
  Sha512     := TDCP_Sha512.Create(Application);
  Hash       := TDCP_Hash(Sha512);

  strmInput := nil;
  strmOutput := nil;
  try
    strmInput := TStringStream.Create(AStr, TEncoding.Unicode);
    strmOutput := TStringStream.Create('', TEncoding.Unicode);

    SetLength(HashDigest, Hash.HashSize div 8);
    for i := 0 to 7 do Salt[i] := Random(256);   // just fill the salt with random values (crypto secure PRNG would be better but not _really_ necessary)
    strmOutput.WriteBuffer(Salt, SizeOf(Salt));  // write out the salt so we can decrypt!
    Hash.Init;
    Hash.Update(Salt[0], SizeOf(Salt));   // hash the salt
    Hash.UpdateStr(PassPhrase);           // and the passphrase
    Hash.Final(HashDigest[0]);            // store the output in HashDigest

    if (Cipher is TDCP_BlockCipher) then  // if the cipher is a block cipher we need an initialisation vector
    begin
      SetLength(CipherIV, TDCP_BlockCipher(Cipher).BlockSize div 8);
      for i := 0 to (Length(CipherIV) - 1) do CipherIV[i] := Random(256);           // again just random values for the IV
      strmOutput.WriteBuffer(CipherIV[0], Length(CipherIV));                        // write out the IV so we can decrypt!
      Cipher.Init(HashDigest[0], Min(Cipher.MaxKeySize, Hash.HashSize), CipherIV);  // initialise the cipher with the hash as key
      TDCP_BlockCipher(Cipher).CipherMode := cmCBC;                                 // use CBC chaining when encrypting
    end
    else
      Cipher.Init(HashDigest[0], Min(Cipher.MaxKeySize, Hash.HashSize), nil);       // initialise the cipher with the hash as key

    Cipher.EncryptStream(strmInput, strmOutput, strmInput.Size); // encrypt the entire file
    Cipher.Burn;   // important! get rid of keying information
    Result := StringToHex16(strmOutput.DataString);
    strmInput.Free;
    strmOutput.Free;
    Cipher.Free;
    Hash.Free;
  except
    strmInput.Free;
    strmOutput.Free;
    Cipher.Free;
    Hash.Free;
    Result := '';
  end;
end;

function DecryptStr(AStr: String): String;
var
  CipherIV   : Array of Byte;         // the initialisation vector (for chaining modes)
  HashDigest : Array of Byte;         // the result of hashing the passphrase with the salt
  Salt       : Array[0..7] of Byte;   // a random salt to help prevent precomputated attacks
  strmInput  ,
  strmOutput : TStringStream;
begin
  Result     := '';
  if AStr = '' then Exit;
  
  Rijndael   := TDCP_Rijndael.Create(Application);
  Cipher     := TDCP_Cipher(Rijndael);
  Sha512     := TDCP_Sha512.Create(Application);
  Hash       := TDCP_Hash(Sha512);

  strmInput  := nil;
  strmOutput := nil;
  try
    strmInput  := TStringStream.Create(HexToString16(AStr), TEncoding.Unicode);
    strmOutput := TStringStream.Create('', TEncoding.Unicode);

    SetLength(HashDigest, Hash.HashSize div 8);
    strmInput.ReadBuffer(Salt[0], SizeOf(Salt));  // read the salt in from the file
    Hash.Init;
    Hash.Update(Salt[0], SizeOf(Salt));   // hash the salt
    Hash.UpdateStr(PassPhrase);           // and the passphrase
    Hash.Final(HashDigest[0]);            // store the hash in HashDigest

    if (Cipher is TDCP_BlockCipher) then  // if it is a block cipher we need the IV
    begin
      SetLength(CipherIV, TDCP_BlockCipher(Cipher).BlockSize div 8);
      strmInput.ReadBuffer(CipherIV[0], Length(CipherIV));                          // read the initialisation vector from the file
      Cipher.Init(HashDigest[0], Min(Cipher.MaxKeySize, Hash.HashSize), CipherIV);  // initialise the cipher
      TDCP_BlockCipher(Cipher).CipherMode := cmCBC;
    end
    else
      Cipher.Init(HashDigest[0], Min(Cipher.MaxKeySize, Hash.HashSize), nil);       // initialise the cipher

    Cipher.DecryptStream(strmInput, strmOutput, strmInput.Size - strmInput.Position); // decrypt!
    Cipher.Burn;
    Result := strmOutput.DataString;
    strmInput.Free;
    strmOutput.Free;
    Cipher.Free;
    Hash.Free;
  except
    strmInput.Free;
    strmOutput.Free;
    Cipher.Free;
    Hash.Free;
    Result := '';
  end;
end;

function EncryptSys(InFile, OutFile: String): Boolean;
var
  i          : integer;
  CipherIV   : Array of Byte;         // the initialisation vector (for chaining modes)
  HashDigest : Array of Byte;         // the result of hashing the passphrase with the salt
  Salt       : Array[0..7] of Byte;   // a random salt to help prevent precomputated attacks
  strmInput  ,
  strmOutput : TFileStream;
begin
  Result     := True;
  Rijndael   := TDCP_Rijndael.Create(Application);
  Cipher     := TDCP_Cipher(Rijndael);
  Sha512     := TDCP_Sha512.Create(Application);
  Hash       := TDCP_Hash(Sha512);

  strmInput  := nil;
  strmOutput := nil;
  try
    strmInput  := TFileStream.Create(Infile, fmOpenRead);
    strmOutput := TFileStream.Create(Outfile, fmCreate);

    SetLength(HashDigest, Hash.HashSize div 8);
    for i := 0 to 7 do Salt[i] := Random(256);   // just fill the salt with random values (crypto secure PRNG would be better but not _really_ necessary)
    strmOutput.WriteBuffer(Salt, SizeOf(Salt));  // write out the salt so we can decrypt!
    Hash.Init;
    Hash.Update(Salt[0], SizeOf(Salt));   // hash the salt
    Hash.UpdateStr(PassPhrase);           // and the passphrase
    Hash.Final(HashDigest[0]);            // store the output in HashDigest

    if (Cipher is TDCP_BlockCipher) then  // if the cipher is a block cipher we need an initialisation vector
    begin
      SetLength(CipherIV, TDCP_BlockCipher(Cipher).BlockSize div 8);
      for i := 0 to (Length(CipherIV) - 1) do CipherIV[i] := Random(256);           // again just random values for the IV
      strmOutput.WriteBuffer(CipherIV[0], Length(CipherIV));                        // write out the IV so we can decrypt!
      Cipher.Init(HashDigest[0], Min(Cipher.MaxKeySize, Hash.HashSize), CipherIV);  // initialise the cipher with the hash as key
      TDCP_BlockCipher(Cipher).CipherMode := cmCBC;                                 // use CBC chaining when encrypting
    end
    else
      Cipher.Init(HashDigest[0], Min(Cipher.MaxKeySize, Hash.HashSize), nil);       // initialise the cipher with the hash as key

    Cipher.EncryptStream(strmInput, strmOutput, strmInput.Size); // encrypt the entire file
    Cipher.Burn;   // important! get rid of keying information
    strmInput.Free;
    strmOutput.Free;
    Cipher.Free;
    Hash.Free;
  except
    strmInput.Free;
    strmOutput.Free;
    Cipher.Free;
    Hash.Free;
    Result := False;
  end;
end;

function DecryptSys(InFile, OutFile: String): Boolean;
var
  CipherIV   : Array of Byte;         // the initialisation vector (for chaining modes)
  HashDigest : Array of Byte;         // the result of hashing the passphrase with the salt
  Salt       : Array[0..7] of Byte;   // a random salt to help prevent precomputated attacks
  strmInput  ,
  strmOutput : TFileStream;
begin
  Result     := True;
  Rijndael   := TDCP_Rijndael.Create(Application);
  Cipher     := TDCP_Cipher(Rijndael);
  Sha512     := TDCP_Sha512.Create(Application);
  Hash       := TDCP_Hash(Sha512);

  strmInput  := nil;
  strmOutput := nil;
  try
    strmInput  := TFileStream.Create(InFile, fmOpenRead);
    strmOutput := TFileStream.Create(OutFile, fmCreate);

    SetLength(HashDigest, Hash.HashSize div 8);
    strmInput.ReadBuffer(Salt[0], SizeOf(Salt));  // read the salt in from the file
    Hash.Init;
    Hash.Update(Salt[0], SizeOf(Salt));   // hash the salt
    Hash.UpdateStr(PassPhrase);           // and the passphrase
    Hash.Final(HashDigest[0]);            // store the hash in HashDigest

    if (Cipher is TDCP_BlockCipher) then  // if it is a block cipher we need the IV
    begin
      SetLength(CipherIV, TDCP_BlockCipher(Cipher).BlockSize div 8);
      strmInput.ReadBuffer(CipherIV[0], Length(CipherIV));                          // read the initialisation vector from the file
      Cipher.Init(HashDigest[0], Min(Cipher.MaxKeySize, Hash.HashSize), CipherIV);  // initialise the cipher
      TDCP_BlockCipher(Cipher).CipherMode := cmCBC;
    end
    else
      Cipher.Init(HashDigest[0], Min(Cipher.MaxKeySize, Hash.HashSize), nil);       // initialise the cipher

    Cipher.DecryptStream(strmInput, strmOutput, strmInput.Size - strmInput.Position); // decrypt!
    Cipher.Burn;
    strmInput.Free;
    strmOutput.Free;
    Cipher.Free;
    Hash.Free;
  except on e: exception do
    begin
      strmInput.Free;
      strmOutput.Free;
      Cipher.Free;
      Hash.Free;
      Result := False;
//      Servermod.Logger.AddLog('HATA!', 'DecryptSys ' + e.Message);
    end;
  end;
end;

function Data2Perm(AData: TUniQuery): String;
var
  Tmp : String;
  i   : Integer;
begin
  Result := '';
  if AData.FieldByName('perms_01').AsString = '' then
  begin
    for i := 1 to 10000 do Result := Result + '0';
    Exit;
  end;
  Tmp := DecryptStr(AData.FieldByName('perms_01').AsString);
  Result := Result + Tmp;
  Tmp := DecryptStr(AData.FieldByName('perms_02').AsString);
  Result := Result + Tmp;
  Tmp := DecryptStr(AData.FieldByName('perms_03').AsString);
  Result := Result + Tmp;
  Tmp := DecryptStr(AData.FieldByName('perms_04').AsString);
  Result := Result + Tmp;
  Tmp := DecryptStr(AData.FieldByName('perms_05').AsString);
  Result := Result + Tmp;
  Tmp := DecryptStr(AData.FieldByName('perms_06').AsString);
  Result := Result + Tmp;
  Tmp := DecryptStr(AData.FieldByName('perms_07').AsString);
  Result := Result + Tmp;
  Tmp := DecryptStr(AData.FieldByName('perms_08').AsString);
  Result := Result + Tmp;
  Tmp := DecryptStr(AData.FieldByName('perms_09').AsString);
  Result := Result + Tmp;
  Tmp := DecryptStr(AData.FieldByName('perms_10').AsString);
  Result := Result + Tmp;
end;

function GetCipherList(AStrength: Integer): WideString;
const
//DHE-RSA-CHACHA20-POLY1305
//DHE-RSA-AES256-GCM-SHA384
//DHE-RSA-AES128-GCM-SHA256
//DHE-RSA-AES256-SHA256
//DHE-RSA-AES128-SHA256
//DHE-RSA-AES256-SHA
//DHE-RSA-AES128-SHA
//DHE-RSA-CAMELLIA256-SHA
//DHE-RSA-CAMELLIA128-SHA256
//ECDHE-ECDSA-AES256-SHA384
  cCIPHER_LIST_1: WideString = 'DHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-GCM-SHA256:' +
                               'ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256';
  cCIPHER_LIST_2: WideString = 'DHE-RSA-AES256-SHA256:DHE-RSA-AES128-SHA256:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA256';
  cCIPHER_LIST_3: WideString = 'ECDHE-RSA-AES256-SHA:ECDHE-RSA-AES128-SHA:DHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA';
  cCIPHER_LIST_4: WideString = 'AES256-GCM-SHA384:AES128-GCM-SHA256:AES256-SHA256:AES128-SHA256:AES256-SHA:AES128-SHA';
  cCIPHER_LIST_5: WideString = 'DES-CBC3-SHA';
  // cCIPHER_DEF   : WideString = '!ADH:!EXP:!RC4:!eNULL@STRENGTH';
  cCIPHER_DEF   : WideString = 'HIGH:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!3DES:!PSK:!SRP:!CAMELLIA';
begin
  case AStrength of
    // Advanced Plus (A+)
      1: Result := cCIPHER_LIST_1 + ':' + cCIPHER_DEF;
    // Advanced (A)
      2: Result := cCIPHER_LIST_1 + ':' + cCIPHER_LIST_2 + ':' + cCIPHER_DEF;
    // Broad Compatibility (
      3: Result := cCIPHER_LIST_1 + ':' + cCIPHER_LIST_2 + ':' + cCIPHER_LIST_3 + ':' + cCIPHER_DEF;
    // Widest Compatibility (C)
      4: Result := cCIPHER_LIST_1 + ':' + cCIPHER_LIST_2 + ':' + cCIPHER_LIST_3 + ':' + cCIPHER_LIST_4 + ':' + cCIPHER_DEF;
    // Legacy (C-)
      5: Result := cCIPHER_LIST_1 + ':' + cCIPHER_LIST_2 + ':' + cCIPHER_LIST_3 + ':' + cCIPHER_LIST_4 + ':' + cCIPHER_LIST_5 + ':' + cCIPHER_DEF;
    else
      Result := EmptyStr;
  end;
end;

function GetSequence(AData: TUniQuery; SeqName: String): Integer;
begin
  QueryOpen(AData, 'SELECT NEXTVAL(''"' + SeqName + '"'')');
  Result := AData.Fields[0].AsInteger;
end;

procedure QueryPrep(AData: TUniQuery; ASQL: String);
begin
  if AData.Active then AData.Close;
  if ASQL <> '' then
  begin
    AData.SQL.Clear;
    AData.SQL.Add(ASQL);
  end;
end;

procedure QueryOpen(AData: TUniQuery; ASQL: String);
begin
  if AData.Active then AData.Close;
  if ASQL <> '' then
  begin
    AData.SQL.Clear;
    AData.SQL.Add(ASQL);
    // If LoginInfo.KullaniciAdi = 'erolmuh'  Then AData.SQL.SaveToFile('C:\Temp\SQLList.Txt');
    AData.Open;
  end;
end;

procedure QueryExec(AData: TUniQuery; ASQL: String);
begin
  if AData.Active then AData.Close;
  if ASQL <> '' then
  begin
    AData.SQL.Clear;
    AData.SQL.Add(ASQL);
    // If LoginInfo.KullaniciAdi = 'erolmuh'  Then AData.SQL.SaveToFile('C:\Temp\SQLList.Txt');
    AData.ExecSQL;
  end;
end;

//procedure QueryCreate(var AData: TUniQuery; ASQL: String; aConn:TUniConnection; AActive: boolean);
//begin
//  AData := TUniQuery.Create(nil);
//  AData.Connection := aConn;
//  if ASQL <> '' then
//  begin
//    AData.SQL.Clear;
//    AData.SQL.Add(ASQL);
//    if AActive then AData.Open;
//  end;
//end;

function DataEditing(ADataSet: TCustomUniDataSet): Boolean;
begin
  Result := ADataSet.State in [dsEdit, dsInsert];
end;

function DataEmpty(ADataSet: TCustomUniDataSet): Boolean;
begin
  Result := ADataSet.EOF and ADataSet.BOF;
end;

procedure RefreshQuery(AQuery: TUniQuery);
var
  MyBook : TBookMark;
begin
  try
    try
      MyBook := AQuery.GetBookmark;
      AQuery.Refresh;
      AQuery.GotoBookmark(MyBook);
    except
    end;
  finally
    AQuery.FreeBookmark(MyBook);
  end;
end;

procedure DataRefresh(ADataSet: TCustomUniDataSet);
begin
  ADataSet.Close;
  ADataSet.Open;
end;



function Str2HTMLStr(AStr: String): String;
begin
  Result := AStr;
  Result := StringReplace(Result, 'ý', '&#305;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ý', '&#304;', [rfReplaceAll]);
  Result := StringReplace(Result, 'þ', '&#351;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Þ', '&#350;', [rfReplaceAll]);
  Result := StringReplace(Result, 'ç', '&#231;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ç', '&#199;', [rfReplaceAll]);
  Result := StringReplace(Result, 'ð', '&#287;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ð', '&#286;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ö', '&#214;', [rfReplaceAll]);
  Result := StringReplace(Result, 'ö', '&#246;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ü', '&#220;', [rfReplaceAll]);
  Result := StringReplace(Result, 'ü', '&#252;', [rfReplaceAll]);
end;

function HTML_GetFormByName(ADoc: IHTMLDocument2; const FormName: String): IHTMLFormElement;
var
  Forms: IHTMLElementCollection;
begin
  Forms := ADoc.Forms as IHTMLElementCollection;
  Result := Forms.Item(FormName,'') as IHTMLFormElement
end;

function HTML_GetItemByName(AForm: IHTMLFormElement; const ItemName: String): IHTMLElement;
begin
  Result := AForm.Item(ItemName, 0) as IHTMLElement;
end;

function HTML_GetImage(ADoc: IHTMLDocument2; const SrcName: String): IHTMLImgElement;
var
  ImgTags : IHTMLElementCollection;
  Tag     : IHTMLImgElement;
  i       : Integer;
begin
  Result := nil;
  ImgTags := (ADoc.body as IHTMLElement2).getElementsByTagName('img');

  for i := 0 to Pred(ImgTags.Length) do
  begin
    Tag := ImgTags.item(I, EmptyParam) as IHTMLImgElement;
    if AnsiSameText(Tag.src, SrcName) then Result := Tag;
  end;
end;

function HTML_GetButtonByName(AForm: IHTMLFormElement; const ButtonName: String): IHTMLButtonElement;
begin
  // Result := AForm.Item(ItemName, 0) as IHTMLButtonElement;
end;

procedure HTML_SetFieldValue(AForm: IHTMLFormElement; const FieldName: String; const NewValue: String; const Instance: Integer = 0);
var
  Field       : IHTMLElement;
  InputField  : IHTMLInputElement;
  SelectField : IHTMLSelectElement;
  TextField   : IHTMLTextAreaElement;
begin
  Field := AForm.Item(FieldName, Instance) as IHTMLElement;
  if Assigned(Field) then
  begin
    if Field.TagName = 'INPUT' then
    begin
      InputField := Field as IHTMLInputElement;
      if (InputField.type_ <> 'radio') and (InputField.type_ <> 'checkbox') then
        InputField.value := NewValue
      else
        InputField.checked := (NewValue = 'checked');
    end
    else if Field.TagName = 'SELECT' then
    begin
      SelectField := Field as IHTMLSelectElement;
      SelectField.value := NewValue;
    end
    else if Field.TagName = 'TEXTAREA' then
    begin
      TextField := Field as IHTMLTextAreaElement;
      TextField.value := NewValue;
    end;
  end;
end;

procedure File2Blob(AData: TDataSet; AFieldName, AFileName: String);
var
  ABlob    : TStream;
  FileStr  : TFileStream;
begin
  try
    ABlob := AData.CreateBlobStream(AData.FieldByName(AFieldName), bmWrite);
    ABlob.Seek(0, soFromBeginning);
    FileStr := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyWrite);
    try
      ABlob.CopyFrom(FileStr, FileStr.Size);
    finally
      FileStr.Free;
    end;
  finally
    ABlob.Free;
  end;
end;

procedure Blob2File(AData: TDataSet; AFieldName, AFileName: String);
var
  ABlob    : TStream;
  FileStr  : TFileStream;
begin
  try
    ABlob := AData.CreateBlobStream(AData.FieldByName(AFieldName), bmRead);
    ABlob.Seek(0, soFromBeginning);
    FileStr := TFileStream.Create(AFileName, fmCreate);
    try
      FileStr.CopyFrom(ABlob, ABlob.Size);
    finally
      FileStr.Free;
    end;
  finally
    ABlob.Free;
  end;
end;

function File2Base64Str(FN: String): String;
var
  ABytes : TBytes;
begin
  Result := '';
  ABytes := TFile.ReadAllBytes(FN);
  Result := TNetEncoding.Base64.EncodeBytesToString(ABytes);
end;

function Blob2Base64Str(AData: TDataSet; AFieldName, AFileName: String): String;
begin
  Blob2File(AData, AFieldName, AFileName);
  Result := File2Base64Str(AFileName);
end;

function FileSize(fileName : WideString) : Int64;
var
sr : TSearchRec;
begin
if FindFirst(fileName, faAnyFile, sr ) = 0 then
result := Int64(sr.FindData.nFileSizeHigh) shl Int64(32) + Int64(sr.FindData.nFileSizeLow)
else
result := -1;
FindClose(sr);
end;

function ExecAndWait(FileName: String; Params: String): Bool;
var
  exInfo: TShellExecuteInfo;
  Ph: DWORD;
begin
  FillChar(exInfo, SizeOf(exInfo), 0);
  with exInfo do
  begin
    cbSize := SizeOf(exInfo);
    fMask := SEE_MASK_NOCLOSEPROCESS or SEE_MASK_FLAG_DDEWAIT;
    Wnd := GetActiveWindow();
    exInfo.lpVerb := 'open';
    exInfo.lpParameters := PChar(Params);
    lpFile := PChar(FileName);
    nShow := SW_SHOWNORMAL;
  end;
  if ShellExecuteEx(@exInfo) then Ph := exInfo.hProcess
  else
  begin
//    ShowMessage(SysErrorMessage(GetLastError));
    Result := true;
    exit;
  end;
  while WaitForSingleObject(exInfo.hProcess, 50) <> WAIT_OBJECT_0 do Application.ProcessMessages;
  CloseHandle(Ph);

  Result := True;
end;

function ParseString(var AStr: String; ASep: String): String;
var
  MyPos : Integer;
begin
  if AStr = '' then
  begin
    Result := '';
    Exit;
  end;

  MyPos := Pos(ASep, AStr);
  if MyPos < 1 then
  begin
    Result := AStr;
    AStr := '';
    Exit;
  end;

  Result := Copy(AStr, 1, MyPos - 1);
  System.Delete(AStr, 1, (MyPos - 1) + Length(ASep));
end;

procedure PreviewDocument(AData: TUniQuery; DocID: Integer);
var
  APath       : String;
  AFile       : String;
  AExt        : String;
  FileName    : String;
begin
  QueryOpen(AData, 'SELECT * FROM "KART_DOKUMAN" WHERE "ID" = ' + IntToStr(DocID));
  if AData.FieldByName('ID').AsInteger < 1 then Exit;
  if AData.FieldByName('DOC_NAME').AsString = '' then Exit;

  APath := TPath.GetTempPath;
  AFile := TPath.GetTempFileName;
  System.Delete(AFile, Length(AFile) - 3, 4);
  AExt    := APath + AData.FieldByName('DOC_NAME').AsString;
  AExt    := ExtractFileExt(AExt);
  FileName := AFile + AExt;

  Blob2File(AData, 'BELGE', FileName);
  // ShowOSBDoc(FileName);
end;

function SupportedFiles: String;
var
  i : Integer;
  Tmp1 : String;
  Tmp2 : String;
begin
  Tmp1 := '';
  Tmp2 := '';
  for i := 1 to SupportedFileCount do
  begin
    Tmp1 := Tmp1 + '|' + SupportedFileTypes[i, 1] + '|' + SupportedFileTypes[i, 2];
    Tmp2 := Tmp2 + SupportedFileTypes[i, 2] + ';';
  end;
  if Length(Tmp2) > 2 then System.Delete(Tmp2, Length(Tmp2), 1);
  Tmp1 := 'Desteklenen Belgeler|' + Tmp2 + Tmp1;
  Result := Tmp1;
end;

function SupportedImages: String;
var
  i : Integer;
  Tmp1 : String;
  Tmp2 : String;
begin
  Tmp1 := '';
  Tmp2 := '';
  for i := 1 to SupportedImgCount do
  begin
    Tmp1 := Tmp1 + '|' + SupportedImgTypes[i, 1] + '|' + SupportedImgTypes[i, 2];
    Tmp2 := Tmp2 + SupportedImgTypes[i, 2] + ';';
  end;
  if Length(Tmp2) > 2 then System.Delete(Tmp2, Length(Tmp2), 1);
  Tmp1 := 'Desteklenen Resimler|' + Tmp2 + Tmp1;
  Result := Tmp1;
end;

function IsBrowserFile(AExt: String): Boolean;
begin
  Result := MatchText(AExt, ['htm', 'html', 'mht', 'mhtml', 'xml']);
end;

function IsImageFile(AExt: String): Boolean;
begin
  Result := MatchText(AExt, ['jpg', 'jpeg', 'jpe', 'jfif', 'gif', 'tif', 'tiff', 'png', 'ico', 'wmf']);
end;

function IsTextFile(AExt: String): Boolean;
begin
  Result := MatchText(AExt, ['txt', 'prn']);
end;

function IsPDFFile(AExt: String): Boolean;
begin
  Result := MatchText(AExt, ['pdf']);
end;

function IsOfficeFile(AExt: String): Boolean;
begin
  Result := MatchText(AExt, ['doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'pps', 'ppsx', 'rtf', 'csv']);
end;

function IsMailFile(AExt: String): Boolean;
begin
  Result := MatchText(AExt, ['msg', 'oft', 'eml']);
end;

Function Projeversiyon(const AppName: string; var V1, V2, V3, V4: Word):string;
var
 VerInfoSize, VerValueSize, Dummy: DWORD;
 VerInfo: Pointer;
 VerValue: PVSFixedFileInfo;
begin
  result := '';
 VerInfoSize := GetFileVersionInfoSize(PChar(AppName), Dummy);
 GetMem(VerInfo, VerInfoSize);
 GetFileVersionInfo(PChar(AppName), 0, VerInfoSize, VerInfo);
 VerQueryValue(VerInfo, '', Pointer(VerValue), VerValueSize);

 with VerValue^ do
 begin
   V1 := dwFileVersionMS shr 16;
   V2 := dwFileVersionMS and $FFFF;
   V3 := dwFileVersionLS shr 16;
   V4 := dwFileVersionLS and $FFFF;
 end;
   FreeMem(VerInfo, VerInfoSize);
   result := Format('%d.%d.%d', [V1, V2, V3]);
end;

procedure ExportQueryToExcel(Query: TDataSet; Grid: TUniDBGrid; const FileName: string);
var
  Xls: TXlsFile;
  Row, Col, FieldIndex : Integer;
  TempFileName: string;
  FieldName: string;
  Format: TFlxFormat;
  lfileName : string;
begin
  lfileName := StringReplace(fileName,' ','_',[rfReplaceAll]) ;

  // Geçici dosya adý oluþtur
  TempFileName := ExtractFilePath(lfileName) + ChangeFileExt(lfileName, '.xls');
  // FlexCel Excel dosyasýný oluþtur
  Xls := TXlsFile.Create(true);
  try
    Xls.NewFile(1, TExcelFileFormat.v2021); // 1 yapraklý yeni dosya oluþtur
    Xls.ActiveSheet := 1;
    xls.SheetName := FileName;

    // UniDBGrid baþlýklarýný Excel'e yaz
    for Col := 0 to Grid.Columns.Count - 1 do
    begin
        Format := Xls.GetDefaultFormat;
        Format.FillPattern.Pattern := TFlxPatternStyle.Solid;
        Format.FillPattern.FgColor :=  TColorRec.Navy; // Baþlýk satýrý için arka plan rengi


        xls.SetColWidth(1, col+1, 5000); //kolon geniþliði

        //baþlýk fontlarý
        Format := xls.GetCellVisibleFormatDef(1, col+1);
        Format.Font.Style := [TFlxFontStyles.Bold];
        Format.Font.CharSet := 162;
        Format.FillPattern.Pattern := TFlxPatternStyle.Solid;
        Format.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Accent5, 0.39997558519242);
        Format.FillPattern.BgColor := TExcelColor.Automatic;
        xls.SetCellFormat(1, col+1, xls.AddFormat(Format));



      Xls.SetCellValue(1, Col + 1, Grid.Columns[Col].Title.Caption);
    end;
    // Query'den satýrlarý Excel'e yaz
    Query.First;
    Row := 2; // Baþlýklar 1. satýrda, veriler 2. satýrdan baþlar
    while not Query.Eof do
    begin
      for Col := 0 to Grid.Columns.Count - 1 do
      begin
        FieldName := Grid.Columns[Col].FieldName; // Grid'deki kolonun FieldName özelliði
        FieldIndex := Query.FieldByName(FieldName).Index; // Query'deki Field indexi
        if FieldIndex >= 0 then
          Xls.SetCellValue(Row, Col + 1, Query.Fields[FieldIndex].AsString);
      end;
      Inc(Row);
      Query.Next;
    end;
    // Excel dosyasýný geçici dosya olarak kaydet
    Xls.Save(TempFileName);
    // Kullanýcýya dosyayý indir
    UniSession.SendFile(TempFileName, ExtractFileName(FileName));
  finally
    Xls.Free;
    // Geçici dosyayý sil
    DeleteFile(TempFileName);
  end;
end;



procedure CopyFieldsFromQueryToVirtualTable(Query: TuniQuery; VirtualTable: TVirtualTable; RecordAdd :boolean=false);
var
  i: Integer;
begin
  // VirtualTable alanlarýný temizle
  VirtualTable.Close;
  VirtualTable.FieldDefs.Clear;
  VirtualTable.Fields.Clear;

  // Query alanlarýný VirtualTable'a kopyala
  for i := 0 to Query.FieldDefs.Count - 1 do
  begin
    VirtualTable.FieldDefs.Add(Query.FieldDefs[i].Name, Query.FieldDefs[i].DataType, Query.FieldDefs[i].Size, Query.FieldDefs[i].Required);
  end;
  VirtualTable.Open;

  if RecordAdd then
  begin
  VirtualTable.Clear;
  // Query'yi aç ve VirtualTable'a veri kopyala
  Query.Open;
  Query.First;
  while not Query.Eof do
  begin
    VirtualTable.Append;
    for i := 0 to Query.FieldCount - 1 do
    begin
      VirtualTable.Fields[i].Value := Query.Fields[i].Value;
    end;
    VirtualTable.Post;
    Query.Next;
  end;
  end
end;

function EnumDegeriIcinCaseIfadesiOlustur(FieldName: string; EnumStrings: array of string): string;
var
  I: Integer;
  CaseParcalari: TStringList;
begin
  CaseParcalari := TStringList.Create;
  try
    // Her enum deðeri için CASE THEN ekle
    for I := Low(EnumStrings) to High(EnumStrings) do
    begin
      CaseParcalari.Add(Format('WHEN %s = %d THEN ''%s''', [FieldName, I + 1, EnumStrings[I]]));
    end;
    // CASE yapýsýný birleþtir
    Result := Format('(CASE  %s ELSE '''' END)', [CaseParcalari.Text.Replace(sLineBreak, ' ')]);
  finally
    CaseParcalari.Free;
  end;
end;

function EnumDegeriIcinIcIceCaseIfadesiOlustur (DisField: string; IcField: string; DisEnumDegerleri, IcEnumDegerleri: array of string): string;
var
  I, J: Integer;
  CaseParcalari: TStringList;
  IcCase: string;
begin
  CaseParcalari := TStringList.Create;
  try
    // Her dýþ enum deðeri için CASE THEN ekle
    for I := Low(DisEnumDegerleri) to High(DisEnumDegerleri) do
    begin
      // Ýç CASE yapýsýný oluþtur
      IcCase := 'CASE ';
      for J := Low(IcEnumDegerleri) to High(IcEnumDegerleri) do
      begin
        IcCase := IcCase + Format('WHEN %s = %d THEN ''%s'' ', [IcField, J + 1, IcEnumDegerleri[J]]);
      end;
      IcCase := IcCase + 'ELSE '''' END';

      // Dýþ CASE'e bu iç CASE'i ekle
      CaseParcalari.Add(Format('WHEN %s = %d THEN (%s)', [DisField, I + 1, IcCase]));
    end;

    // CASE yapýsýný birleþtir
    Result := Format('(CASE %s ELSE '''' END)', [CaseParcalari.Text.Replace(sLineBreak, ' ')]);
  finally
    CaseParcalari.Free;
  end;
end;


function ComboboxEnumDegerAl(ComboBox: TUniComboBox; EnumArray: array of string): Integer;
var
  i: Integer;
begin
  // Seçilen metni ComboBox'tan al ve enum deðerini bul
  for i := Low(EnumArray) to High(EnumArray) do
  begin
    if EnumArray[i] = ComboBox.Text then
    begin
      Result := i + 1;  // Enum deðerini döndür (index 0'dan baþladýðý için +1 eklenir)
      Exit;
    end;
  end;
  // Geçerli bir seçim yapýlmadýysa hata mesajý
  raise Exception.Create('Geçerli bir seçim yapýlmadý');
end;

procedure PaneldeOkunurYap(AParent: TWinControl; Durum: Boolean);
var
  I: Integer;
  Kontrol: TControl;
  OzellikBilgisi: PPropInfo;
begin
  for I := 0 to AParent.ControlCount - 1 do
  begin
    Kontrol := AParent.Controls[I];
    // "ReadOnly" özelliði olup olmadýðýný kontrol et
    OzellikBilgisi := GetPropInfo(Kontrol.ClassInfo, 'ReadOnly');
    if OzellikBilgisi <> nil then
    begin
      // ReadOnly özelliðini verilen duruma göre ayarla
      SetPropValue(Kontrol, 'ReadOnly', Durum);
    end;
    // Eðer Kontrol bir container ise, içindeki nesneleri de kontrol et
    if (Kontrol is TUniContainerPanel) or (Kontrol is TUniPanel) or (Kontrol is TUniGroupBox) then
    begin
      if Kontrol is TUniContainerPanel then
        PaneldeOkunurYap(TUniContainerPanel(Kontrol), Durum)
      else if Kontrol is TUniPanel then
        PaneldeOkunurYap(TUniPanel(Kontrol), Durum)
      else if Kontrol is TUniGroupBox then
        PaneldeOkunurYap(TUniGroupBox(Kontrol), Durum);
    end;
  end;
end;

function DosyaAdiTemizle(const FileName: string): string;
begin
  Result := StringReplace(FileName, ' ', '_', [rfReplaceAll]);
  Result := StringReplace(Result, '/', '_', [rfReplaceAll]);
  Result := StringReplace(Result, '\', '_', [rfReplaceAll]);
  Result := StringReplace(Result, ':', '_', [rfReplaceAll]);
  Result := StringReplace(Result, '?', '_', [rfReplaceAll]);
end;


function GetCheckBox(Acombox: TUniCheckComboBox): string;
var
i : integer;
begin
  result := '';
  for I := 0 to Acombox.Items.Count-1 do
  if Acombox.Selected[i] then
    begin
      if result <> '' then
        result := result + ',';
      result := result +  inttostr(i+1);
    end;
end;


procedure setCheckBox(Acombobox :TUniCheckComboBox;Avalue:string);
var
i:integer;
Avalues : TStringList;
begin
  avalues := TStringList.Create;
  try
    Avalues.Delimiter := ',';
    Avalues.DelimitedText := Avalue;

  for I := 0 to Acombobox.Count - 1 do
    Acombobox.Selected[I] := False;

   for i := 0 to Acombobox.Items.Count - 1 do
    begin
      if Avalues.IndexOf(IntToStr(i + 1)) <> -1 then
        Acombobox.Selected[i] := True
      else
        Acombobox.Selected[i] := False;
    end;
  finally
   Avalues.Free;
  end;

end;


function GetlistBox(Alistbox: TUniListBox): string;
var
i : integer;
begin
  result := '';
  for I := 0 to Alistbox.Items.Count-1 do
  if Alistbox.Selected[i] then
    begin
      if result <> '' then
        result := result + ',';
      result := result +  inttostr(i+1);
    end;

end;


procedure setlistBox(Alistbox: TUniListBox; Avalue: string);
var
  i: Integer;
  Avalues: TStringList;
begin
  // JSId kontrolü
  if Alistbox.JSId = '' then
    Exit; // Nesne oluþturulmamýþsa çýk

  // Deðer boþsa iþlem yapma
  if Avalue = '' then
    Exit;

  // Eleman yoksa çýk
  if Alistbox.Items.Count = 0 then
    Exit;

  // Deðerleri ayýr
  Avalues := TStringList.Create;
  try
    Avalues.Delimiter := ',';
    Avalues.DelimitedText := Avalue;

    // Seçimleri temizle
    for i := 0 to Alistbox.Items.Count - 1 do
      Alistbox.Selected[i] := False;

    // Yeni seçimleri uygula
    for i := 0 to Alistbox.Items.Count - 1 do
    begin
      if Avalues.IndexOf(IntToStr(i + 1)) <> -1 then
        Alistbox.Selected[i] := True;
    end;

    // JS tarafýnda listenin güncellenmesi için gönderme
    Alistbox.JSInterface.JSCall('setValue', [Avalue]);

  finally
    Avalues.Free;
  end;
end;

procedure ExecuteDynamicQuery(Query: TUniQuery; BaseSQL: string; Params: array of TPair<string, Variant> ; OrderBy:string='');
var
  i: Integer;
  DynamicSQL: string;
begin
  DynamicSQL := BaseSQL;

  for i := 0 to High(Params) do
  begin
      DynamicSQL := DynamicSQL + ' AND ' + Params[i].Key + ' = :' + Params[i].Key;
  end;
  if OrderBy <> '' then
  begin
    DynamicSQL := DynamicSQL + ' ORDER BY ' + OrderBy;
  end;
  Query.SQL.Text := DynamicSQL;
  for i := 0 to High(Params) do
  begin
    Query.ParamByName(Params[i].Key).Value := Params[i].Value;
  end;
  Query.Open;
end;

function GuvenliGirisMi(const Giris: string): Boolean;
const
  TehlikeliIfadeler: array[0..12] of string = (
    'SELECT', 'INSERT', 'UPDATE', 'DELETE', 'DROP', 'EXEC',
    'UNION', '--', ';--', ';', '/*', '*/', '@@'
  );
var
  i: Integer;
  BuyukHarfGiris: string;
begin
  Result := True;
  BuyukHarfGiris := UpperCase(Giris); // Büyük/küçük harf duyarlýlýðýný kaldýr
  for i := Low(TehlikeliIfadeler) to High(TehlikeliIfadeler) do
  begin
    if Pos(TehlikeliIfadeler[i], BuyukHarfGiris) > 0 then
      Exit(False);
  end;
end;

function Slashcontrol(Astring  : string) :string;
begin
  if  (Length(Astring) > 0) and (Astring[Length(Astring)] <> '/') then
    result := Astring+'/'
    else
    result := Astring;
end;


//procedure setlistBox(Alistbox :TUniListBox;Avalue:string);
//var
//i:integer;
//Avalues : TStringList;
//JSId: string;
//begin
//  JSId := Alistbox.JSId;
//  if JSId = '' then
//    Exit;      // nesne oluþmamýþ ise çýk
//
//  avalues := TStringList.Create;
//  try
//    Avalues.Delimiter := ',';
//    Avalues.DelimitedText := Avalue;
//
//  for I := 0 to Alistbox.Count - 1 do
//    Alistbox.Selected[I] := False;
//
//   for i := 0 to Alistbox.Items.Count - 1 do
//    begin
//      if Avalues.IndexOf(IntToStr(i + 1)) <> -1 then
//        Alistbox.Selected[i] := True
//      else
//        Alistbox.Selected[i] := False;
//    end;
//  finally
//   Avalues.Free;
//  end;
//
//end;

initialization
  SupportedFileTypes[ 1, 1] := 'PDF Belgesi';             SupportedFileTypes[ 1, 2] := '*.pdf';
  SupportedFileTypes[ 2, 1] := 'Word Belgesi';            SupportedFileTypes[ 2, 2] := '*.doc;*.docx';
  SupportedFileTypes[ 3, 1] := 'Excel Belgesi';           SupportedFileTypes[ 3, 2] := '*.xls;*.xlsx;*.csv';
  SupportedFileTypes[ 4, 1] := 'Mail Dosyasý';            SupportedFileTypes[ 4, 2] := '*.msg;*.oft;*.eml';
  SupportedFileTypes[ 5, 1] := 'PowerPoint Belgesi';      SupportedFileTypes[ 5, 2] := '*.ppt;*.pptx';
  SupportedFileTypes[ 6, 1] := 'PowerPoint Gösterisi';    SupportedFileTypes[ 6, 2] := '*.pps;*.ppsx';
  SupportedFileTypes[ 7, 1] := 'Metin Belgesi';           SupportedFileTypes[ 7, 2] := '*.txt;*.prn';
  SupportedFileTypes[ 8, 1] := 'Web Belgesi';             SupportedFileTypes[ 8, 2] := '*.htm;*.html;*.mht;*.mhtml';
  SupportedFileTypes[ 9, 1] := 'XML Verisi';              SupportedFileTypes[ 9, 2] := '*.xml';
  SupportedFileTypes[10, 1] := 'Zengin Metin';            SupportedFileTypes[10, 2] := '*.rtf';


  SupportedImgTypes[1, 1] := 'JPEG';                     SupportedImgTypes[1, 2] := '*.jpg;*.jpeg;*.jpe;*.jfif';
  SupportedImgTypes[2, 1] := 'GIF';                      SupportedImgTypes[2, 2] := '*.gif';
  SupportedImgTypes[3, 1] := 'TIFF';                     SupportedImgTypes[3, 2] := '*.tif;*.tiff';
  SupportedImgTypes[4, 1] := 'PNG';                      SupportedImgTypes[4, 2] := '*.png';
  SupportedImgTypes[5, 1] := 'ICO';                      SupportedImgTypes[5, 2] := '*.ico';
  SupportedImgTypes[6, 1] := 'WMF';                      SupportedImgTypes[6, 2] := '*.wmf';

end.
