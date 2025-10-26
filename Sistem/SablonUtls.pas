unit SablonUtls;

interface

uses  Winapi.Windows, System.Classes, System.SysUtils, System.Variants, System.StrUtils,
  System.DateUtils, System.IOUtils, System.NetEncoding, System.Hash, Vcl.Forms, Vcl.Dialogs,
  Winapi.Winsock, Winapi.ShellApi, Data.DB, Uni, MSHTML, TlHelp32, uniGUIDialogs,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report, FlexCel.Render;

type
TSablonTipi =(stbos,StDenetimEkibi,StfaaliyetListesi,StDonanimBilgileriTopluEklemeSablonu,
StYazilimBilgileriTopluEklemeSablonu,StPersonelBilgileriTopluEklemeSablonu,StSistemBilgileriTopluEklemeSablonu,
StFMekanBilgileriTopluEklemeSablonu,StfaaliyetListesi2);

Function SablonOlusturKaydet(AsablonTip : TSablonTipi;Apaht :string):boolean;
procedure EK_A_Denetim_Ekibi_Toplu_EklemeSablonu(const xls: TExcelFile);
procedure DonanimBilgileriTopluEklemeSablonu(const xls:TExcelFile) ;
procedure DonanimBilgileriTopluEklemeSablonuValid(const xls:TExcelFile) ;
procedure YazilimBilgileriTopluEklemeSablonu(const xls:TExcelFile) ;
procedure YazilimBilgileriTopluEklemeSablonuValid(const xls:TExcelFile) ;
procedure PersonelBilgileriTopluEklemeSablonu(const xls:TExcelFile) ;
procedure PersonelBilgileriTopluEklemeSablonuValid(const xls:TExcelFile) ;
procedure SistemBilgileriTopluEklemeSablonu(const xls:TExcelFile) ;
procedure SistemBilgileriTopluEklemeSablonuValid(const xls:TExcelFile) ;
procedure FmekanBilgileriTopluEklemeSablonu(const xls:TExcelFile) ;
procedure FmekanBilgileriTopluEklemeSablonuValid(const xls:TExcelFile) ;
procedure EK_C_4_listeSablonu(const xls: TExcelFile);
procedure EK_C_4_listeSablonu2(const xls : TExcelFile);

implementation
uses McMLib,MainModule;

procedure EK_A_Denetim_Ekibi_Toplu_EklemeSablonu(const xls: TExcelFile);
var
  StyleFmt: TFlxFormat;
  fmt: TFlxFormat;
  Validation: TDataValidationInfo;
  Runs: TArray<TRTFRun>;
  fnt: TFlxFont;
  CommentProps: ICommentProperties;
begin
 xls.NewFile(2, TExcelFileFormat.v2021);  //Create a new Excel file with 2 sheets.

  //Set the names of the sheets
  xls.ActiveSheet := 1;
  xls.SheetName := 'Denetci_listesi';
  xls.ActiveSheet := 2;
  xls.SheetName := 'utils';
  xls.SheetVisible := TXlsSheetVisible.Hidden;

  xls.ActiveSheet := 1;  //Set the sheet we are working in.

  //Global Workbook Options
  //Note that in xlsx files this option is ignored by FlexCel unless you also set OptionsForceUseCheckCompatibility to true. This is because Excel disables Autosave in files which have this option.
  xls.OptionsCheckCompatibility := false;

  //Sheet Options
  xls.SheetName := 'Denetci_listesi';

  //Styles.
  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.CharSet := 162;
  xls.SetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0), StyleFmt);

  //Theme - You might use GetTheme/SetTheme methods here instead.
  xls.SetColorTheme(TPrimaryThemeColor.Light2, TDrawingColor.FromRgb($E8, $E8, $E8));
  xls.SetColorTheme(TPrimaryThemeColor.Dark2, TDrawingColor.FromRgb($0E, $28, $41));
  xls.SetColorTheme(TPrimaryThemeColor.Accent1, TDrawingColor.FromRgb($15, $60, $82));
  xls.SetColorTheme(TPrimaryThemeColor.Accent2, TDrawingColor.FromRgb($E9, $71, $32));
  xls.SetColorTheme(TPrimaryThemeColor.Accent3, TDrawingColor.FromRgb($19, $6B, $24));
  xls.SetColorTheme(TPrimaryThemeColor.Accent4, TDrawingColor.FromRgb($0F, $9E, $D5));
  xls.SetColorTheme(TPrimaryThemeColor.Accent5, TDrawingColor.FromRgb($A0, $2B, $93));
  xls.SetColorTheme(TPrimaryThemeColor.Accent6, TDrawingColor.FromRgb($4E, $A7, $2E));
  xls.SetColorTheme(TPrimaryThemeColor.HyperLink, TDrawingColor.FromRgb($46, $78, $86));
  xls.SetColorTheme(TPrimaryThemeColor.FollowedHyperLink, TDrawingColor.FromRgb($96, $60, $7D));

  //Set up rows and columns
  xls.DefaultColWidth := 2304;

  xls.SetColWidth(1, 1, 4644);  //(17.39 + 0.75) * 256

  xls.SetColWidth(2, 2, 8850);  //(33.82 + 0.75) * 256

  xls.SetColWidth(3, 3, 8301);  //(31.68 + 0.75) * 256

  xls.SetColWidth(4, 4, 8923);  //(34.11 + 0.75) * 256
  xls.DefaultRowHeight := 300;

  xls.SetRowHeight(1, 578);  //28.90 * 20

  //Set the cell values
  fmt := xls.GetCellVisibleFormatDef(1, 1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 0;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(1, 1, xls.AddFormat(fmt));
  xls.SetCellValue(1, 1, 'DENETÇİ ' + #10 + 'ADI SOYADI');

  fmt := xls.GetCellVisibleFormatDef(1, 2);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 0;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(1, 2, xls.AddFormat(fmt));
  xls.SetCellValue(1, 2, 'DENETİM' + #10 + 'ROLÜ');

  fmt := xls.GetCellVisibleFormatDef(1, 3);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 0;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(1, 3, xls.AddFormat(fmt));
  xls.SetCellValue(1, 3, 'GÖREVLENDİRME' + #10 + 'TÜRÜ');

  fmt := xls.GetCellVisibleFormatDef(1, 4);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 0;
  fmt.HAlignment := THFlxAlignment.center;
  xls.SetCellFormat(1, 4, xls.AddFormat(fmt));
  xls.SetCellValue(1, 4, 'SERTİFİKA / UZMANLIK ALANI');

  //Data Validation

  Validation := TDataValidationInfo.Empty;
    Validation.ValidationType := TDataValidationDataType.List;
    Validation.FirstFormula := '=utils!$B$2:$B$4';
    Validation.IgnoreEmptyCells := true;
    Validation.InCellDropDown := true;
    Validation.ShowErrorBox := true;
    Validation.ShowInputBox := true;
  xls.AddDataValidation(TXlsCellRange.Create(2, 3, 1048576, 3), Validation);

  Validation := TDataValidationInfo.Empty;
    Validation.ValidationType := TDataValidationDataType.List;
    Validation.FirstFormula := '=utils!$A$2:$A$5';
    Validation.IgnoreEmptyCells := true;
    Validation.InCellDropDown := true;
    Validation.ShowErrorBox := true;
    Validation.ShowInputBox := true;
  xls.AddDataValidation(TXlsCellRange.Create(2, 2, 1048576, 2), Validation);

  //Comments

  Runs := nil;  //SetLength will resize the array in place. We set it to nil first to create a new array.
  SetLength(Runs, 1);
  Runs[0].FirstChar := 0;
  fnt := xls.GetDefaultFont;
  fnt.Name := 'Tahoma';
  fnt.Size20 := 180;
  fnt.Color := TExcelColor.Automatic;
  fnt.Style := [TFlxFontStyles.Bold];
  fnt.Scheme := TFontScheme.None;
  Runs[0].Font := fnt;
  xls.SetComment(1, 1, TRichString.Create('Denetçinin Adını Soyadını Giriniz', Runs));

  //You probably don't need to call the lines below. This code is needed only if you want to change the comment box properties like color or default location
  CommentProps := TCommentProperties_CreateStandard(1, 1, xls);
  CommentProps.Anchor := TClientAnchor.Create(TFlxAnchorType.DontMoveAndDontResize, 1, 0, 2, 0, 4, 0, 2, 220);
  CommentProps.ShapeFill := TShapeFill_Create(TSolidFill_Create(TDrawingColor.FromSystem(TSystemColor.InfoBk)), true, TFormattingType.Subtle, nil, false);
  CommentProps.ShapeBorder := TShapeLine_Create(true, TLineStyle_Create(nil, nil), nil, TFormattingType.Subtle);

  //Excel by doesn't autofit the comment box so it can hold all text.
  //There is an option in TCommentProperties, but if you use it Excel will show the text in a single line.
  //To have FlexCel autofit the comment for you, you can do it with the following code:
  //You will need to add FlexCel.Render to the used units.

  //  CommentProps.Anchor := xls.AutofitComment(TRichString.Create('Denetçinin Adını Soyadını Giriniz', Runs), 1.5, true, 1.1, 0, CommentProps.Anchor);

  xls.SetCommentProperties(1, 1, CommentProps);

  Runs := nil;  //SetLength will resize the array in place. We set it to nil first to create a new array.
  SetLength(Runs, 2);
  Runs[0].FirstChar := 0;
  fnt := xls.GetDefaultFont;
  fnt.Name := 'Tahoma';
  fnt.Size20 := 180;
  fnt.Color := TExcelColor.Automatic;
  fnt.Style := [TFlxFontStyles.Bold];
  fnt.Scheme := TFontScheme.None;
  Runs[0].Font := fnt;
  Runs[1].FirstChar := 96;
  fnt := xls.GetDefaultFont;
  fnt.Name := 'Tahoma';
  fnt.Size20 := 180;
  fnt.Color := TExcelColor.Automatic;
  fnt.Scheme := TFontScheme.None;
  Runs[1].Font := fnt;
  xls.SetComment(1, 2, TRichString.Create('Denetçinin Denetim rolünü Giriniz. ' + #10 + 'D- DENETÇİ' + #10 + 'BD- BAŞDENETÇİ' + #10 + 'U-'
  + ' UZMAN' + #10 + 'DK- DENETİM KOORDİNATÖRÜ' + #10 + #10, Runs));

  //You probably don't need to call the lines below. This code is needed only if you want to change the comment box properties like color or default location
  CommentProps := TCommentProperties_CreateStandard(1, 2, xls);
  CommentProps.Anchor := TClientAnchor.Create(TFlxAnchorType.DontMoveAndDontResize, 1, 0, 2, 643, 4, 0, 3, 704);
  CommentProps.ShapeFill := TShapeFill_Create(TSolidFill_Create(TDrawingColor.FromSystem(TSystemColor.InfoBk)), true, TFormattingType.Subtle, nil, false);
  CommentProps.ShapeBorder := TShapeLine_Create(true, TLineStyle_Create(nil, nil), nil, TFormattingType.Subtle);

  //Excel by doesn't autofit the comment box so it can hold all text.
  //There is an option in TCommentProperties, but if you use it Excel will show the text in a single line.
  //To have FlexCel autofit the comment for you, you can do it with the following code:
  //You will need to add FlexCel.Render to the used units.

  //  CommentProps.Anchor := xls.AutofitComment(TRichString.Create('Denetçinin Denetim rolünü Giriniz. ' + #10 + 'D- DENETÇİ' + #10 + 'BD- BAŞDENETÇİ' + #10 + 'U-'
  //  + ' UZMAN' + #10 + 'DK- DENETİM KOORDİNATÖRÜ' + #10 + #10, Runs), 1.5, true, 1.1, 0, CommentProps.Anchor);

  xls.SetCommentProperties(1, 2, CommentProps);

  Runs := nil;  //SetLength will resize the array in place. We set it to nil first to create a new array.
  SetLength(Runs, 1);
  Runs[0].FirstChar := 0;
  fnt := xls.GetDefaultFont;
  fnt.Name := 'Tahoma';
  fnt.Size20 := 180;
  fnt.Color := TExcelColor.Automatic;
  fnt.Style := [TFlxFontStyles.Bold];
  fnt.Scheme := TFontScheme.None;
  Runs[0].Font := fnt;
  xls.SetComment(1, 4, TRichString.Create('Denetçinin Uzmanlık alanını ve (veya) Almış olduğu sertifikayı giriniz', Runs));

  //You probably don't need to call the lines below. This code is needed only if you want to change the comment box properties like color or default location
  CommentProps := TCommentProperties_CreateStandard(1, 4, xls);
  CommentProps.Anchor := TClientAnchor.Create(TFlxAnchorType.DontMoveAndDontResize, 1, 0, 8, 130, 4, 0, 10, 390);
  CommentProps.ShapeFill := TShapeFill_Create(TSolidFill_Create(TDrawingColor.FromSystem(TSystemColor.InfoBk)), true, TFormattingType.Subtle, nil, false);
  CommentProps.ShapeBorder := TShapeLine_Create(true, TLineStyle_Create(nil, nil), nil, TFormattingType.Subtle);

  //Excel by doesn't autofit the comment box so it can hold all text.
  //There is an option in TCommentProperties, but if you use it Excel will show the text in a single line.
  //To have FlexCel autofit the comment for you, you can do it with the following code:
  //You will need to add FlexCel.Render to the used units.

  //  CommentProps.Anchor := xls.AutofitComment(TRichString.Create('Denetçinin Uzmanlık alanını ve (veya) Almış olduğu sertifikayı giriniz', Runs), 1.5, true, 1.1, 0, CommentProps.Anchor);

  xls.SetCommentProperties(1, 4, CommentProps);

  //Cell selection and scroll position.
  xls.SelectCell(2, 1, false);


  xls.ActiveSheet := 2;  //Set the sheet we are working in.

  //Sheet Options
  xls.SheetName := 'utils';

  //Set up rows and columns
  xls.DefaultColWidth := 2340;

  xls.SetColWidth(1, 1, 7131);  //(27.11 + 0.75) * 256

  xls.SetColWidth(2, 2, 10861);  //(41.68 + 0.75) * 256

  //Set the cell values
  fmt := xls.GetCellVisibleFormatDef(1, 1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 0;
  xls.SetCellFormat(1, 1, xls.AddFormat(fmt));
  xls.SetCellValue(1, 1, 'Rol');

  fmt := xls.GetCellVisibleFormatDef(1, 2);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 0;
  xls.SetCellFormat(1, 2, xls.AddFormat(fmt));
  xls.SetCellValue(1, 2, 'Görevlendirme Türü');
  xls.SetCellValue(2, 1, 'D- DENETÇİ');
  xls.SetCellValue(2, 2, 'KP- KURUM PERSONELİ');
  xls.SetCellValue(3, 1, 'BD- BAŞDENETÇİ');
  xls.SetCellValue(3, 2, 'GG- GEÇİCİ GÖREVLENDİRME');
  xls.SetCellValue(4, 1, 'U- UZMAN');
  xls.SetCellValue(4, 2, 'HA- HİZMET ALIMI');
  xls.SetCellValue(5, 1, 'DK- DENETİM KOORDİNATÖRÜ');

  //Cell selection and scroll position.
//  xls.SelectCell(5, 2, false);

    xls.ActiveSheet := 1;  //Set the sheet we are working in.
    xls.SelectCell(2, 1, false);
  xls.DocumentProperties.SetStandardProperty(TPropertyId.Author, 'Doğan Akçay');



end;

procedure EK_C_4_listeSablonu(const xls: TExcelFile);
var
  StyleFmt: TFlxFormat;
  Range: TXlsNamedRange;
  MajorLatin: TThemeTextFont;
  MajorEastAsian: TThemeTextFont;
  MajorComplexScript: TThemeTextFont;
  MajorFont: TThemeFont;
  MinorLatin: TThemeTextFont;
  MinorEastAsian: TThemeTextFont;
  MinorComplexScript: TThemeTextFont;
  MinorFont: TThemeFont;
  ColFmt: TFlxFormat;
  RowFmt: TFlxFormat;
  fmt: TFlxFormat;

begin
  xls.NewFile(2, TExcelFileFormat.v2021);  //Create a new Excel file with 2 sheets.

  //Set the names of the sheets
  xls.ActiveSheet := 1;
  xls.SheetName := 'Görev Listesi';
  xls.ActiveSheet := 2;
  xls.SheetName := '<#Config>';
  xls.SheetVisible := TXlsSheetVisible.Hidden;

  xls.ActiveSheet := 1;  //Set the sheet we are working in.

  //Global Workbook Options
  //Note that in xlsx files this option is ignored by FlexCel unless you also set OptionsForceUseCheckCompatibility to true. This is because Excel disables Autosave in files which have this option.
  xls.OptionsCheckCompatibility := false;

  //Sheet Options
  xls.SheetName := 'Görev Listesi';
  xls.SheetView := TSheetView.Create(TSheetViewType.Normal, true, true, 100, 0, 0);

  //Styles.
  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.CharSet := 1;
  xls.SetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0), StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Note, 0));
  StyleFmt.Font.CharSet := 1;
  xls.SetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Note, 0), StyleFmt);

  //Named Ranges
  Range := TXlsNamedRange.Create('__tbllist__', 0, 0, '=''Görev Listesi''!$A$2:$J$2');
  //You could also use: Range := TXlsNamedRange.Create('__tbllist__', 0, 1, 2, 1, 2, 10, 0);
  xls.SetNamedRange(Range);


  //Printer Settings
  xls.PrintXResolution := 120;
  xls.PrintYResolution := 72;
  xls.PrintOptions := [TPrintOptions.Orientation];
  xls.PrintPaperSize := TPaperSize.A4;

  xls.SetColorTheme(TPrimaryThemeColor.Light2, TDrawingColor.FromRgb($EE, $EC, $E1));
  xls.SetColorTheme(TPrimaryThemeColor.Dark2, TDrawingColor.FromRgb($1F, $49, $7D));
  xls.SetColorTheme(TPrimaryThemeColor.Accent1, TDrawingColor.FromRgb($4F, $81, $BD));
  xls.SetColorTheme(TPrimaryThemeColor.Accent2, TDrawingColor.FromRgb($C0, $50, $4D));
  xls.SetColorTheme(TPrimaryThemeColor.Accent3, TDrawingColor.FromRgb($9B, $BB, $59));
  xls.SetColorTheme(TPrimaryThemeColor.Accent4, TDrawingColor.FromRgb($80, $64, $A2));
  xls.SetColorTheme(TPrimaryThemeColor.Accent5, TDrawingColor.FromRgb($4B, $AC, $C6));
  xls.SetColorTheme(TPrimaryThemeColor.Accent6, TDrawingColor.FromRgb($F7, $96, $46));
  xls.SetColorTheme(TPrimaryThemeColor.HyperLink, TDrawingColor.FromRgb($00, $00, $FF));
  xls.SetColorTheme(TPrimaryThemeColor.FollowedHyperLink, TDrawingColor.FromRgb($80, $00, $80));

  //Major font
  MajorLatin := TThemeTextFont.Create('Cambria', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorEastAsian := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorComplexScript := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorFont := TThemeFont.Create(MajorLatin, MajorEastAsian, MajorComplexScript);
  MajorFont.AddFont('Jpan', '?? ?????');
  MajorFont.AddFont('Hang', '?? ??');
  MajorFont.AddFont('Hans', '??');
  MajorFont.AddFont('Hant', '????');
  MajorFont.AddFont('Arab', 'Times New Roman');
  MajorFont.AddFont('Hebr', 'Times New Roman');
  MajorFont.AddFont('Thai', 'Tahoma');
  MajorFont.AddFont('Ethi', 'Nyala');
  MajorFont.AddFont('Beng', 'Vrinda');
  MajorFont.AddFont('Gujr', 'Shruti');
  MajorFont.AddFont('Khmr', 'MoolBoran');
  MajorFont.AddFont('Knda', 'Tunga');
  MajorFont.AddFont('Guru', 'Raavi');
  MajorFont.AddFont('Cans', 'Euphemia');
  MajorFont.AddFont('Cher', 'Plantagenet Cherokee');
  MajorFont.AddFont('Yiii', 'Microsoft Yi Baiti');
  MajorFont.AddFont('Tibt', 'Microsoft Himalaya');
  MajorFont.AddFont('Thaa', 'MV Boli');
  MajorFont.AddFont('Deva', 'Mangal');
  MajorFont.AddFont('Telu', 'Gautami');
  MajorFont.AddFont('Taml', 'Latha');
  MajorFont.AddFont('Syrc', 'Estrangelo Edessa');
  MajorFont.AddFont('Orya', 'Kalinga');
  MajorFont.AddFont('Mlym', 'Kartika');
  MajorFont.AddFont('Laoo', 'DokChampa');
  MajorFont.AddFont('Sinh', 'Iskoola Pota');
  MajorFont.AddFont('Mong', 'Mongolian Baiti');
  MajorFont.AddFont('Viet', 'Times New Roman');
  MajorFont.AddFont('Uigh', 'Microsoft Uighur');
  MajorFont.AddFont('Geor', 'Sylfaen');
  xls.SetThemeFont(TFontScheme.Major, MajorFont);

  //Minor font
  MinorLatin := TThemeTextFont.Create('Calibri', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorEastAsian := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorComplexScript := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorFont := TThemeFont.Create(MinorLatin, MinorEastAsian, MinorComplexScript);
  MinorFont.AddFont('Jpan', '?? ?????');
  MinorFont.AddFont('Hang', '?? ??');
  MinorFont.AddFont('Hans', '??');
  MinorFont.AddFont('Hant', '????');
  MinorFont.AddFont('Arab', 'Arial');
  MinorFont.AddFont('Hebr', 'Arial');
  MinorFont.AddFont('Thai', 'Tahoma');
  MinorFont.AddFont('Ethi', 'Nyala');
  MinorFont.AddFont('Beng', 'Vrinda');
  MinorFont.AddFont('Gujr', 'Shruti');
  MinorFont.AddFont('Khmr', 'DaunPenh');
  MinorFont.AddFont('Knda', 'Tunga');
  MinorFont.AddFont('Guru', 'Raavi');
  MinorFont.AddFont('Cans', 'Euphemia');
  MinorFont.AddFont('Cher', 'Plantagenet Cherokee');
  MinorFont.AddFont('Yiii', 'Microsoft Yi Baiti');
  MinorFont.AddFont('Tibt', 'Microsoft Himalaya');
  MinorFont.AddFont('Thaa', 'MV Boli');
  MinorFont.AddFont('Deva', 'Mangal');
  MinorFont.AddFont('Telu', 'Gautami');
  MinorFont.AddFont('Taml', 'Latha');
  MinorFont.AddFont('Syrc', 'Estrangelo Edessa');
  MinorFont.AddFont('Orya', 'Kalinga');
  MinorFont.AddFont('Mlym', 'Kartika');
  MinorFont.AddFont('Laoo', 'DokChampa');
  MinorFont.AddFont('Sinh', 'Iskoola Pota');
  MinorFont.AddFont('Mong', 'Mongolian Baiti');
  MinorFont.AddFont('Viet', 'Arial');
  MinorFont.AddFont('Uigh', 'Microsoft Uighur');
  MinorFont.AddFont('Geor', 'Sylfaen');
  xls.SetThemeFont(TFontScheme.Minor, MinorFont);

  //Set up rows and columns
  xls.SetColWidth(1, 1, 1905);  //(6.69 + 0.75) * 256

  ColFmt := xls.GetFormat(xls.GetColFormat(1));
  ColFmt.Font.Style := [TFlxFontStyles.Bold];
  ColFmt.Font.CharSet := 162;
  xls.SetColFormat(1, 1, xls.AddFormat(ColFmt));

  xls.SetColWidth(2, 2, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(3, 3, 8590);  //(32.80 + 0.75) * 256

  xls.SetColWidth(4, 4, 8561);  //(32.69 + 0.75) * 256

  xls.SetColWidth(5, 7, 4010);  //(14.91 + 0.75) * 256

  xls.SetColWidth(8, 9, 4010);  //(14.91 + 0.75) * 256

  ColFmt := xls.GetFormat(xls.GetColFormat(8));
  ColFmt.Format := TFlxNumberFormat.RegionalDateString;
  xls.SetColFormat(8, 9, xls.AddFormat(ColFmt));

  xls.SetColWidth(10, 10, 4010);  //(14.91 + 0.75) * 256
  xls.DefaultRowHeight := 288;

  xls.SetRowHeight(1, 1020);  //51.00 * 20

  RowFmt := xls.GetFormat(xls.GetRowFormat(1));
  RowFmt.HAlignment := THFlxAlignment.center;
  RowFmt.VAlignment := TVFlxAlignment.center;
  RowFmt.WrapText := true;
  xls.SetRowFormat(1, xls.AddFormat(RowFmt));
  xls.SetRowHeight(2, 576);  //28.80 * 20

  //Set the cell values
  fmt := xls.GetCellVisibleFormatDef(1, 1);
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39997558519242);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(1, 1, xls.AddFormat(fmt));
  xls.SetCellValue(1, 1, 'Ref. No');

  fmt := xls.GetCellVisibleFormatDef(1, 2);
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39997558519242);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(1, 2, xls.AddFormat(fmt));
  xls.SetCellValue(1, 2, 'Faal. No');

  fmt := xls.GetCellVisibleFormatDef(1, 3);
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39997558519242);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(1, 3, xls.AddFormat(fmt));
  xls.SetCellValue(1, 3, 'Faaliyet');

  fmt := xls.GetCellVisibleFormatDef(1, 4);
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39997558519242);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(1, 4, xls.AddFormat(fmt));
  xls.SetCellValue(1, 4, 'Faaliyet Grubu');

  fmt := xls.GetCellVisibleFormatDef(1, 5);
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39997558519242);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(1, 5, xls.AddFormat(fmt));
  xls.SetCellValue(1, 5, 'Tedbir Kodu');

  fmt := xls.GetCellVisibleFormatDef(1, 6);
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39997558519242);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(1, 6, xls.AddFormat(fmt));
  xls.SetCellValue(1, 6, 'Tedbir');

  fmt := xls.GetCellVisibleFormatDef(1, 7);
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39997558519242);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(1, 7, xls.AddFormat(fmt));
  xls.SetCellValue(1, 7, 'Tedbir Grubu');

  fmt := xls.GetCellVisibleFormatDef(1, 8);
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39997558519242);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.Format := TFlxNumberFormat.RegionalDateString;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(1, 8, xls.AddFormat(fmt));
  xls.SetCellValue(1, 8, 'Baş. Tarihi');

  fmt := xls.GetCellVisibleFormatDef(1, 9);
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39997558519242);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.Format := TFlxNumberFormat.RegionalDateString;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(1, 9, xls.AddFormat(fmt));
  xls.SetCellValue(1, 9, 'Son. Tarihi');

  fmt := xls.GetCellVisibleFormatDef(1, 10);
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39997558519242);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(1, 10, xls.AddFormat(fmt));
  xls.SetCellValue(1, 10, 'Durum');

  fmt := xls.GetCellVisibleFormatDef(2, 1);
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.Format := '@';
  fmt.HAlignment := THFlxAlignment.left;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(2, 1, xls.AddFormat(fmt));
  xls.SetCellValue(2, 1, '<#tbllist.id>');

  fmt := xls.GetCellVisibleFormatDef(2, 2);
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.Format := '@';
  fmt.HAlignment := THFlxAlignment.left;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(2, 2, xls.AddFormat(fmt));
  xls.SetCellValue(2, 2, '<#tbllist.act_no>');

  fmt := xls.GetCellVisibleFormatDef(2, 3);
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.Format := '@';
  fmt.HAlignment := THFlxAlignment.left;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(2, 3, xls.AddFormat(fmt));
  xls.SetCellValue(2, 3, '<#tbllist.act_name>');

  fmt := xls.GetCellVisibleFormatDef(2, 4);
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.Format := '@';
  fmt.HAlignment := THFlxAlignment.left;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(2, 4, xls.AddFormat(fmt));
  xls.SetCellValue(2, 4, '<#tbllist.gr_name>');

  fmt := xls.GetCellVisibleFormatDef(2, 5);
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.Format := '@';
  fmt.HAlignment := THFlxAlignment.center;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(2, 5, xls.AddFormat(fmt));
  xls.SetCellValue(2, 5, '<#tbllist.prec_code>');

  fmt := xls.GetCellVisibleFormatDef(2, 6);
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.Format := '@';
  fmt.HAlignment := THFlxAlignment.left;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(2, 6, xls.AddFormat(fmt));
  xls.SetCellValue(2, 6, '<#tbllist.prec_name>');

  fmt := xls.GetCellVisibleFormatDef(2, 7);
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.Format := '@';
  fmt.HAlignment := THFlxAlignment.left;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(2, 7, xls.AddFormat(fmt));
  xls.SetCellValue(2, 7, '<#tbllist.prec_gr_name>');

  fmt := xls.GetCellVisibleFormatDef(2, 8);
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.Format := TFlxNumberFormat.RegionalDateString;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(2, 8, xls.AddFormat(fmt));
  xls.SetCellValue(2, 8, '<#tbllist.start_date>');

  fmt := xls.GetCellVisibleFormatDef(2, 9);
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.Format := TFlxNumberFormat.RegionalDateString;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(2, 9, xls.AddFormat(fmt));
  xls.SetCellValue(2, 9, '<#tbllist.exp_date>');

  fmt := xls.GetCellVisibleFormatDef(2, 10);
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.Format := '@';
  fmt.HAlignment := THFlxAlignment.left;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(2, 10, xls.AddFormat(fmt));
  xls.SetCellValue(2, 10, '<#tbllist.status>');

  //Cell selection and scroll position.
  xls.SelectCell(9, 6, false);


  xls.ActiveSheet := 2;  //Set the sheet we are working in.

  //Sheet Options
  xls.SheetName := '<#Config>';

  //Set up rows and columns
  xls.SetColWidth(1, 1, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(2, 2, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(3, 3, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(4, 4, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(5, 7, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(8, 8, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(9, 9, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(10, 12, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(13, 13, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(14, 14, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(257, 257, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(258, 258, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(259, 259, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(260, 260, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(261, 263, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(264, 264, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(265, 265, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(266, 268, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(269, 269, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(270, 270, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(513, 513, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(514, 514, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(515, 515, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(516, 516, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(517, 519, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(520, 520, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(521, 521, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(522, 524, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(525, 525, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(526, 526, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(769, 769, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(770, 770, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(771, 771, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(772, 772, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(773, 775, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(776, 776, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(777, 777, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(778, 780, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(781, 781, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(782, 782, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(1025, 1025, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(1026, 1026, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(1027, 1027, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(1028, 1028, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(1029, 1031, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(1032, 1032, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(1033, 1033, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(1034, 1036, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(1037, 1037, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(1038, 1038, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(1281, 1281, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(1282, 1282, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(1283, 1283, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(1284, 1284, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(1285, 1287, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(1288, 1288, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(1289, 1289, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(1290, 1292, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(1293, 1293, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(1294, 1294, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(1537, 1537, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(1538, 1538, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(1539, 1539, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(1540, 1540, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(1541, 1543, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(1544, 1544, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(1545, 1545, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(1546, 1548, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(1549, 1549, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(1550, 1550, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(1793, 1793, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(1794, 1794, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(1795, 1795, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(1796, 1796, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(1797, 1799, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(1800, 1800, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(1801, 1801, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(1802, 1804, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(1805, 1805, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(1806, 1806, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(2049, 2049, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(2050, 2050, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(2051, 2051, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(2052, 2052, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(2053, 2055, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(2056, 2056, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(2057, 2057, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(2058, 2060, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(2061, 2061, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(2062, 2062, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(2305, 2305, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(2306, 2306, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(2307, 2307, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(2308, 2308, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(2309, 2311, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(2312, 2312, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(2313, 2313, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(2314, 2316, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(2317, 2317, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(2318, 2318, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(2561, 2561, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(2562, 2562, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(2563, 2563, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(2564, 2564, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(2565, 2567, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(2568, 2568, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(2569, 2569, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(2570, 2572, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(2573, 2573, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(2574, 2574, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(2817, 2817, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(2818, 2818, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(2819, 2819, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(2820, 2820, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(2821, 2823, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(2824, 2824, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(2825, 2825, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(2826, 2828, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(2829, 2829, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(2830, 2830, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(3073, 3073, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(3074, 3074, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(3075, 3075, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(3076, 3076, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(3077, 3079, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(3080, 3080, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(3081, 3081, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(3082, 3084, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(3085, 3085, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(3086, 3086, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(3329, 3329, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(3330, 3330, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(3331, 3331, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(3332, 3332, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(3333, 3335, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(3336, 3336, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(3337, 3337, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(3338, 3340, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(3341, 3341, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(3342, 3342, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(3585, 3585, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(3586, 3586, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(3587, 3587, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(3588, 3588, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(3589, 3591, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(3592, 3592, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(3593, 3593, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(3594, 3596, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(3597, 3597, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(3598, 3598, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(3841, 3841, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(3842, 3842, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(3843, 3843, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(3844, 3844, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(3845, 3847, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(3848, 3848, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(3849, 3849, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(3850, 3852, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(3853, 3853, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(3854, 3854, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(4097, 4097, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(4098, 4098, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(4099, 4099, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(4100, 4100, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(4101, 4103, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(4104, 4104, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(4105, 4105, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(4106, 4108, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(4109, 4109, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(4110, 4110, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(4353, 4353, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(4354, 4354, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(4355, 4355, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(4356, 4356, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(4357, 4359, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(4360, 4360, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(4361, 4361, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(4362, 4364, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(4365, 4365, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(4366, 4366, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(4609, 4609, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(4610, 4610, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(4611, 4611, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(4612, 4612, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(4613, 4615, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(4616, 4616, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(4617, 4617, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(4618, 4620, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(4621, 4621, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(4622, 4622, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(4865, 4865, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(4866, 4866, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(4867, 4867, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(4868, 4868, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(4869, 4871, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(4872, 4872, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(4873, 4873, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(4874, 4876, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(4877, 4877, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(4878, 4878, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(5121, 5121, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(5122, 5122, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(5123, 5123, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(5124, 5124, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(5125, 5127, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(5128, 5128, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(5129, 5129, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(5130, 5132, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(5133, 5133, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(5134, 5134, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(5377, 5377, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(5378, 5378, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(5379, 5379, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(5380, 5380, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(5381, 5383, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(5384, 5384, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(5385, 5385, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(5386, 5388, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(5389, 5389, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(5390, 5390, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(5633, 5633, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(5634, 5634, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(5635, 5635, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(5636, 5636, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(5637, 5639, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(5640, 5640, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(5641, 5641, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(5642, 5644, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(5645, 5645, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(5646, 5646, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(5889, 5889, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(5890, 5890, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(5891, 5891, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(5892, 5892, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(5893, 5895, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(5896, 5896, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(5897, 5897, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(5898, 5900, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(5901, 5901, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(5902, 5902, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(6145, 6145, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(6146, 6146, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(6147, 6147, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(6148, 6148, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(6149, 6151, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(6152, 6152, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(6153, 6153, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(6154, 6156, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(6157, 6157, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(6158, 6158, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(6401, 6401, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(6402, 6402, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(6403, 6403, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(6404, 6404, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(6405, 6407, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(6408, 6408, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(6409, 6409, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(6410, 6412, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(6413, 6413, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(6414, 6414, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(6657, 6657, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(6658, 6658, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(6659, 6659, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(6660, 6660, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(6661, 6663, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(6664, 6664, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(6665, 6665, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(6666, 6668, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(6669, 6669, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(6670, 6670, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(6913, 6913, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(6914, 6914, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(6915, 6915, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(6916, 6916, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(6917, 6919, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(6920, 6920, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(6921, 6921, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(6922, 6924, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(6925, 6925, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(6926, 6926, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(7169, 7169, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(7170, 7170, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(7171, 7171, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(7172, 7172, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(7173, 7175, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(7176, 7176, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(7177, 7177, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(7178, 7180, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(7181, 7181, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(7182, 7182, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(7425, 7425, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(7426, 7426, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(7427, 7427, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(7428, 7428, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(7429, 7431, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(7432, 7432, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(7433, 7433, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(7434, 7436, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(7437, 7437, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(7438, 7438, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(7681, 7681, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(7682, 7682, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(7683, 7683, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(7684, 7684, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(7685, 7687, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(7688, 7688, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(7689, 7689, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(7690, 7692, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(7693, 7693, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(7694, 7694, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(7937, 7937, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(7938, 7938, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(7939, 7939, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(7940, 7940, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(7941, 7943, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(7944, 7944, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(7945, 7945, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(7946, 7948, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(7949, 7949, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(7950, 7950, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(8193, 8193, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(8194, 8194, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(8195, 8195, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(8196, 8196, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(8197, 8199, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(8200, 8200, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(8201, 8201, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(8202, 8204, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(8205, 8205, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(8206, 8206, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(8449, 8449, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(8450, 8450, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(8451, 8451, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(8452, 8452, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(8453, 8455, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(8456, 8456, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(8457, 8457, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(8458, 8460, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(8461, 8461, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(8462, 8462, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(8705, 8705, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(8706, 8706, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(8707, 8707, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(8708, 8708, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(8709, 8711, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(8712, 8712, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(8713, 8713, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(8714, 8716, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(8717, 8717, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(8718, 8718, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(8961, 8961, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(8962, 8962, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(8963, 8963, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(8964, 8964, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(8965, 8967, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(8968, 8968, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(8969, 8969, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(8970, 8972, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(8973, 8973, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(8974, 8974, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(9217, 9217, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(9218, 9218, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(9219, 9219, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(9220, 9220, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(9221, 9223, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(9224, 9224, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(9225, 9225, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(9226, 9228, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(9229, 9229, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(9230, 9230, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(9473, 9473, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(9474, 9474, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(9475, 9475, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(9476, 9476, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(9477, 9479, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(9480, 9480, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(9481, 9481, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(9482, 9484, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(9485, 9485, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(9486, 9486, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(9729, 9729, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(9730, 9730, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(9731, 9731, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(9732, 9732, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(9733, 9735, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(9736, 9736, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(9737, 9737, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(9738, 9740, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(9741, 9741, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(9742, 9742, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(9985, 9985, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(9986, 9986, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(9987, 9987, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(9988, 9988, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(9989, 9991, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(9992, 9992, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(9993, 9993, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(9994, 9996, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(9997, 9997, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(9998, 9998, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(10241, 10241, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(10242, 10242, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(10243, 10243, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(10244, 10244, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(10245, 10247, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(10248, 10248, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(10249, 10249, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(10250, 10252, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(10253, 10253, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(10254, 10254, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(10497, 10497, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(10498, 10498, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(10499, 10499, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(10500, 10500, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(10501, 10503, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(10504, 10504, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(10505, 10505, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(10506, 10508, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(10509, 10509, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(10510, 10510, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(10753, 10753, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(10754, 10754, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(10755, 10755, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(10756, 10756, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(10757, 10759, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(10760, 10760, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(10761, 10761, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(10762, 10764, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(10765, 10765, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(10766, 10766, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(11009, 11009, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(11010, 11010, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(11011, 11011, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(11012, 11012, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(11013, 11015, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(11016, 11016, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(11017, 11017, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(11018, 11020, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(11021, 11021, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(11022, 11022, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(11265, 11265, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(11266, 11266, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(11267, 11267, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(11268, 11268, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(11269, 11271, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(11272, 11272, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(11273, 11273, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(11274, 11276, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(11277, 11277, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(11278, 11278, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(11521, 11521, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(11522, 11522, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(11523, 11523, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(11524, 11524, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(11525, 11527, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(11528, 11528, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(11529, 11529, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(11530, 11532, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(11533, 11533, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(11534, 11534, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(11777, 11777, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(11778, 11778, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(11779, 11779, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(11780, 11780, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(11781, 11783, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(11784, 11784, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(11785, 11785, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(11786, 11788, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(11789, 11789, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(11790, 11790, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(12033, 12033, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(12034, 12034, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(12035, 12035, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(12036, 12036, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(12037, 12039, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(12040, 12040, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(12041, 12041, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(12042, 12044, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(12045, 12045, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(12046, 12046, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(12289, 12289, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(12290, 12290, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(12291, 12291, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(12292, 12292, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(12293, 12295, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(12296, 12296, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(12297, 12297, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(12298, 12300, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(12301, 12301, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(12302, 12302, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(12545, 12545, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(12546, 12546, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(12547, 12547, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(12548, 12548, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(12549, 12551, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(12552, 12552, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(12553, 12553, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(12554, 12556, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(12557, 12557, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(12558, 12558, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(12801, 12801, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(12802, 12802, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(12803, 12803, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(12804, 12804, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(12805, 12807, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(12808, 12808, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(12809, 12809, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(12810, 12812, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(12813, 12813, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(12814, 12814, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(13057, 13057, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(13058, 13058, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(13059, 13059, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(13060, 13060, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(13061, 13063, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(13064, 13064, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(13065, 13065, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(13066, 13068, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(13069, 13069, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(13070, 13070, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(13313, 13313, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(13314, 13314, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(13315, 13315, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(13316, 13316, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(13317, 13319, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(13320, 13320, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(13321, 13321, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(13322, 13324, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(13325, 13325, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(13326, 13326, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(13569, 13569, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(13570, 13570, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(13571, 13571, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(13572, 13572, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(13573, 13575, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(13576, 13576, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(13577, 13577, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(13578, 13580, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(13581, 13581, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(13582, 13582, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(13825, 13825, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(13826, 13826, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(13827, 13827, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(13828, 13828, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(13829, 13831, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(13832, 13832, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(13833, 13833, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(13834, 13836, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(13837, 13837, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(13838, 13838, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(14081, 14081, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(14082, 14082, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(14083, 14083, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(14084, 14084, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(14085, 14087, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(14088, 14088, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(14089, 14089, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(14090, 14092, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(14093, 14093, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(14094, 14094, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(14337, 14337, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(14338, 14338, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(14339, 14339, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(14340, 14340, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(14341, 14343, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(14344, 14344, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(14345, 14345, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(14346, 14348, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(14349, 14349, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(14350, 14350, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(14593, 14593, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(14594, 14594, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(14595, 14595, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(14596, 14596, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(14597, 14599, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(14600, 14600, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(14601, 14601, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(14602, 14604, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(14605, 14605, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(14606, 14606, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(14849, 14849, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(14850, 14850, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(14851, 14851, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(14852, 14852, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(14853, 14855, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(14856, 14856, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(14857, 14857, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(14858, 14860, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(14861, 14861, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(14862, 14862, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(15105, 15105, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(15106, 15106, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(15107, 15107, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(15108, 15108, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(15109, 15111, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(15112, 15112, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(15113, 15113, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(15114, 15116, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(15117, 15117, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(15118, 15118, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(15361, 15361, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(15362, 15362, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(15363, 15363, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(15364, 15364, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(15365, 15367, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(15368, 15368, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(15369, 15369, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(15370, 15372, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(15373, 15373, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(15374, 15374, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(15617, 15617, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(15618, 15618, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(15619, 15619, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(15620, 15620, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(15621, 15623, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(15624, 15624, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(15625, 15625, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(15626, 15628, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(15629, 15629, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(15630, 15630, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(15873, 15873, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(15874, 15874, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(15875, 15875, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(15876, 15876, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(15877, 15879, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(15880, 15880, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(15881, 15881, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(15882, 15884, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(15885, 15885, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(15886, 15886, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(16129, 16129, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(16130, 16130, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(16131, 16131, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(16132, 16132, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(16133, 16135, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(16136, 16136, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(16137, 16137, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(16138, 16140, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(16141, 16141, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(16142, 16142, 5290);  //(19.91 + 0.75) * 256

  xls.SetRowHeight(1, 348);  //17.40 * 20

  RowFmt := xls.GetFormat(xls.GetRowFormat(1));
  RowFmt.Font.Name := 'Cambria';
  RowFmt.Font.Size20 := 280;
  RowFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  RowFmt.Font.Family := 1;
  RowFmt.Font.CharSet := 0;
  RowFmt.Font.Scheme := TFontScheme.Major;
  RowFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  RowFmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark1, 0.49998474074526);
  RowFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetRowFormat(1, xls.AddFormat(RowFmt));
  xls.SetRowHeight(9, 540);  //27.00 * 20

  //Set the cell values
  fmt := xls.GetCellVisibleFormatDef(1, 1);
  fmt.Font.Name := 'Cambria';
  fmt.Font.Size20 := 280;
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.Family := 1;
  fmt.Font.CharSet := 0;
  fmt.Font.Scheme := TFontScheme.Major;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark1, 0.49998474074526);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(1, 1, xls.AddFormat(fmt));
  xls.SetCellValue(1, 1, 'Configuration Sheet');

  fmt := xls.GetCellVisibleFormatDef(3, 1);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79995117038484);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(3, 1, xls.AddFormat(fmt));
  xls.SetCellValue(3, 1, 'Included Configs:');

  fmt := xls.GetCellVisibleFormatDef(4, 1);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79995117038484);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(4, 1, xls.AddFormat(fmt));
  xls.SetCellValue(4, 1, 'Data Sources:');

  fmt := xls.GetCellVisibleFormatDef(5, 1);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79995117038484);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(5, 1, xls.AddFormat(fmt));
  xls.SetCellValue(5, 1, 'Application to run:');

  fmt := xls.GetCellVisibleFormatDef(8, 1);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79995117038484);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(8, 1, xls.AddFormat(fmt));
  xls.SetCellValue(8, 1, 'Data');

  fmt := xls.GetCellVisibleFormatDef(8, 2);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79995117038484);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(8, 2, xls.AddFormat(fmt));

  fmt := xls.GetCellVisibleFormatDef(8, 3);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79995117038484);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(8, 3, xls.AddFormat(fmt));

  fmt := xls.GetCellVisibleFormatDef(8, 4);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79995117038484);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(8, 4, xls.AddFormat(fmt));

  fmt := xls.GetCellVisibleFormatDef(8, 8);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79995117038484);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(8, 8, xls.AddFormat(fmt));
  xls.SetCellValue(8, 8, 'Format');

  fmt := xls.GetCellVisibleFormatDef(8, 9);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79995117038484);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(8, 9, xls.AddFormat(fmt));

  fmt := xls.GetCellVisibleFormatDef(8, 13);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79995117038484);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(8, 13, xls.AddFormat(fmt));
  xls.SetCellValue(8, 13, 'Expressions');

  fmt := xls.GetCellVisibleFormatDef(8, 14);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79995117038484);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(8, 14, xls.AddFormat(fmt));

  fmt := xls.GetCellVisibleFormatDef(9, 1);
  fmt.Font.Name := 'Arial';
  fmt.Font.Size20 := 200;
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.CharSet := 0;
  fmt.Font.Scheme := TFontScheme.None;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.WrapText := true;
  xls.SetCellFormat(9, 1, xls.AddFormat(fmt));
  xls.SetCellValue(9, 1, 'Table Name');

  fmt := xls.GetCellVisibleFormatDef(9, 2);
  fmt.Font.Name := 'Arial';
  fmt.Font.Size20 := 200;
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.CharSet := 0;
  fmt.Font.Scheme := TFontScheme.None;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.WrapText := true;
  xls.SetCellFormat(9, 2, xls.AddFormat(fmt));
  xls.SetCellValue(9, 2, 'Source Name');

  fmt := xls.GetCellVisibleFormatDef(9, 3);
  fmt.Font.Name := 'Arial';
  fmt.Font.Size20 := 200;
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.CharSet := 0;
  fmt.Font.Scheme := TFontScheme.None;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.WrapText := true;
  xls.SetCellFormat(9, 3, xls.AddFormat(fmt));
  xls.SetCellValue(9, 3, 'Filter');

  fmt := xls.GetCellVisibleFormatDef(9, 4);
  fmt.Font.Name := 'Arial';
  fmt.Font.Size20 := 200;
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.CharSet := 0;
  fmt.Font.Scheme := TFontScheme.None;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.WrapText := true;
  xls.SetCellFormat(9, 4, xls.AddFormat(fmt));
  xls.SetCellValue(9, 4, 'Sort Fields ("," Separated), ASC or DESC');

  fmt := xls.GetCellVisibleFormatDef(9, 8);
  fmt.Font.Name := 'Arial';
  fmt.Font.Size20 := 200;
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.CharSet := 0;
  fmt.Font.Scheme := TFontScheme.None;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.WrapText := true;
  xls.SetCellFormat(9, 8, xls.AddFormat(fmt));
  xls.SetCellValue(9, 8, 'Format Name');

  fmt := xls.GetCellVisibleFormatDef(9, 9);
  fmt.Font.Name := 'Arial';
  fmt.Font.Size20 := 200;
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.CharSet := 0;
  fmt.Font.Scheme := TFontScheme.None;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.WrapText := true;
  xls.SetCellFormat(9, 9, xls.AddFormat(fmt));
  xls.SetCellValue(9, 9, 'Format Def');

  fmt := xls.GetCellVisibleFormatDef(9, 13);
  fmt.Font.Name := 'Arial';
  fmt.Font.Size20 := 200;
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.CharSet := 0;
  fmt.Font.Scheme := TFontScheme.None;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.WrapText := true;
  xls.SetCellFormat(9, 13, xls.AddFormat(fmt));
  xls.SetCellValue(9, 13, 'Name');

  fmt := xls.GetCellVisibleFormatDef(9, 14);
  fmt.Font.Name := 'Arial';
  fmt.Font.Size20 := 200;
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.CharSet := 0;
  fmt.Font.Scheme := TFontScheme.None;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.WrapText := true;
  xls.SetCellFormat(9, 14, xls.AddFormat(fmt));
  xls.SetCellValue(9, 14, 'Expression');

  fmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Note, 0), true);
  fmt.Font.Name := 'Arial';
  fmt.Font.Size20 := 200;
  fmt.Font.Color := TExcelColor.FromArgb($00, $00, $FF);
  fmt.Font.CharSet := 0;
  fmt.Font.Scheme := TFontScheme.None;
  fmt.Format := '#,##0.00\ "€"';
  xls.SetCellFormat(10, 9, xls.AddFormat(fmt));

  fmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Note, 0), true);
  fmt.Font.Name := 'Arial';
  fmt.Font.Size20 := 200;
  fmt.Font.Color := TExcelColor.FromArgb($00, $00, $FF);
  fmt.Font.CharSet := 0;
  fmt.Font.Scheme := TFontScheme.None;
  xls.SetCellFormat(11, 9, xls.AddFormat(fmt));

  fmt := xls.GetCellVisibleFormatDef(11, 14);
  fmt.Format := '#,##0.00\ "€"';
  xls.SetCellFormat(11, 14, xls.AddFormat(fmt));

  //Standard Document Properties - Most are only for xlsx files. In xls files FlexCel will only change the Creation Date and Modified Date.
  xls.DocumentProperties.SetStandardProperty(TPropertyId.Author, 'Doğan Akçay');

    xls.ActiveSheet := 1;  //Set the sheet we are working in.
    xls.SelectCell(1, 1, false);
  xls.DocumentProperties.SetStandardProperty(TPropertyId.Author, 'Doğan Akçay');
end;

procedure DonanimBilgileriTopluEklemeSablonuValid(const xls:TExcelFile) ;
var
  MajorLatin: TThemeTextFont;
  MajorEastAsian: TThemeTextFont;
  MajorComplexScript: TThemeTextFont;
  MajorFont: TThemeFont;
  MinorLatin: TThemeTextFont;
  MinorEastAsian: TThemeTextFont;
  MinorComplexScript: TThemeTextFont;
  MinorFont: TThemeFont;
  ColFmt: TFlxFormat;
  fmt: TFlxFormat;
  Validation: TDataValidationInfo;

begin
  xls.NewFile(2, TExcelFileFormat.v2016);  //Create a new Excel file with 2 sheets.

  //Set the names of the sheets
  xls.ActiveSheet := 1;
  xls.SheetName := 'Toplu Donanım ekleme Şablonu';
  xls.ActiveSheet := 2;
  xls.SheetName := 'Ayarlar';
  xls.SheetVisible := TXlsSheetVisible.Hidden;

  xls.ActiveSheet := 1;  //Set the sheet we are working in.

  //Global Workbook Options
  //Note that in xlsx files this option is ignored by FlexCel unless you also set OptionsForceUseCheckCompatibility to true. This is because Excel disables Autosave in files which have this option.
  xls.OptionsCheckCompatibility := false;

  //Sheet Options
  xls.SheetName := 'Toplu Donanım ekleme Şablonu';

  //Printer Settings
  xls.PrintXResolution := 600;
  xls.PrintYResolution := 600;
  xls.PrintOptions := [TPrintOptions.Orientation];
  xls.PrintPaperSize := TPaperSize.A4;

  //Major font
  MajorLatin := TThemeTextFont.Create('Calibri Light', '020F0302020204030204', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorEastAsian := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorComplexScript := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorFont := TThemeFont.Create(MajorLatin, MajorEastAsian, MajorComplexScript);
  MajorFont.AddFont('Jpan', 'Yu Gothic Light');
  MajorFont.AddFont('Hang', '맑은 고딕');
  MajorFont.AddFont('Hans', '等线 Light');
  MajorFont.AddFont('Hant', '新細明體');
  MajorFont.AddFont('Arab', 'Times New Roman');
  MajorFont.AddFont('Hebr', 'Times New Roman');
  MajorFont.AddFont('Thai', 'Tahoma');
  MajorFont.AddFont('Ethi', 'Nyala');
  MajorFont.AddFont('Beng', 'Vrinda');
  MajorFont.AddFont('Gujr', 'Shruti');
  MajorFont.AddFont('Khmr', 'MoolBoran');
  MajorFont.AddFont('Knda', 'Tunga');
  MajorFont.AddFont('Guru', 'Raavi');
  MajorFont.AddFont('Cans', 'Euphemia');
  MajorFont.AddFont('Cher', 'Plantagenet Cherokee');
  MajorFont.AddFont('Yiii', 'Microsoft Yi Baiti');
  MajorFont.AddFont('Tibt', 'Microsoft Himalaya');
  MajorFont.AddFont('Thaa', 'MV Boli');
  MajorFont.AddFont('Deva', 'Mangal');
  MajorFont.AddFont('Telu', 'Gautami');
  MajorFont.AddFont('Taml', 'Latha');
  MajorFont.AddFont('Syrc', 'Estrangelo Edessa');
  MajorFont.AddFont('Orya', 'Kalinga');
  MajorFont.AddFont('Mlym', 'Kartika');
  MajorFont.AddFont('Laoo', 'DokChampa');
  MajorFont.AddFont('Sinh', 'Iskoola Pota');
  MajorFont.AddFont('Mong', 'Mongolian Baiti');
  MajorFont.AddFont('Viet', 'Times New Roman');
  MajorFont.AddFont('Uigh', 'Microsoft Uighur');
  MajorFont.AddFont('Geor', 'Sylfaen');
  xls.SetThemeFont(TFontScheme.Major, MajorFont);

  //Minor font
  MinorLatin := TThemeTextFont.Create('Calibri', '020F0502020204030204', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorEastAsian := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorComplexScript := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorFont := TThemeFont.Create(MinorLatin, MinorEastAsian, MinorComplexScript);
  MinorFont.AddFont('Jpan', 'Yu Gothic');
  MinorFont.AddFont('Hang', '맑은 고딕');
  MinorFont.AddFont('Hans', '等线');
  MinorFont.AddFont('Hant', '新細明體');
  MinorFont.AddFont('Arab', 'Arial');
  MinorFont.AddFont('Hebr', 'Arial');
  MinorFont.AddFont('Thai', 'Tahoma');
  MinorFont.AddFont('Ethi', 'Nyala');
  MinorFont.AddFont('Beng', 'Vrinda');
  MinorFont.AddFont('Gujr', 'Shruti');
  MinorFont.AddFont('Khmr', 'DaunPenh');
  MinorFont.AddFont('Knda', 'Tunga');
  MinorFont.AddFont('Guru', 'Raavi');
  MinorFont.AddFont('Cans', 'Euphemia');
  MinorFont.AddFont('Cher', 'Plantagenet Cherokee');
  MinorFont.AddFont('Yiii', 'Microsoft Yi Baiti');
  MinorFont.AddFont('Tibt', 'Microsoft Himalaya');
  MinorFont.AddFont('Thaa', 'MV Boli');
  MinorFont.AddFont('Deva', 'Mangal');
  MinorFont.AddFont('Telu', 'Gautami');
  MinorFont.AddFont('Taml', 'Latha');
  MinorFont.AddFont('Syrc', 'Estrangelo Edessa');
  MinorFont.AddFont('Orya', 'Kalinga');
  MinorFont.AddFont('Mlym', 'Kartika');
  MinorFont.AddFont('Laoo', 'DokChampa');
  MinorFont.AddFont('Sinh', 'Iskoola Pota');
  MinorFont.AddFont('Mong', 'Mongolian Baiti');
  MinorFont.AddFont('Viet', 'Arial');
  MinorFont.AddFont('Uigh', 'Microsoft Uighur');
  MinorFont.AddFont('Geor', 'Sylfaen');
  xls.SetThemeFont(TFontScheme.Minor, MinorFont);

  //Set up rows and columns
  xls.SetColWidth(1, 1, 8155);  //(31.11 + 0.75) * 256

  xls.SetColWidth(2, 2, 8009);  //(30.54 + 0.75) * 256

  xls.SetColWidth(3, 3, 9142);  //(34.96 + 0.75) * 256

  xls.SetColWidth(4, 4, 5046);  //(18.96 + 0.75) * 256

  ColFmt := xls.GetFormat(xls.GetColFormat(4));
  ColFmt.Format := '@';
  xls.SetColFormat(4, 4, xls.AddFormat(ColFmt));

  xls.SetColWidth(5, 5, 7936);  //(30.25 + 0.75) * 256

  xls.SetColWidth(6, 6, 4059);  //(15.11 + 0.75) * 256

  xls.SetColWidth(7, 7, 7643);  //(29.11 + 0.75) * 256

  xls.SetColWidth(8, 8, 12580);  //(48.39 + 0.75) * 256

  xls.SetColWidth(9, 9, 3766);  //(13.96 + 0.75) * 256

  xls.SetColWidth(10, 10, 1974);  //(6.96 + 0.75) * 256

  xls.SetColWidth(11, 11, 1938);  //(6.82 + 0.75) * 256

  xls.SetColWidth(12, 12, 1865);  //(6.54 + 0.75) * 256

  xls.SetColWidth(13, 13, 3218);  //(11.82 + 0.75) * 256

  xls.SetColWidth(14, 14, 2377);  //(8.54 + 0.75) * 256

  xls.SetColWidth(15, 15, 8301);  //(31.68 + 0.75) * 256

  xls.SetColWidth(16, 16, 4608);  //(17.25 + 0.75) * 256

  xls.SetColWidth(17, 17, 4498);  //(16.82 + 0.75) * 256

  xls.SetColWidth(18, 18, 5193);  //(19.54 + 0.75) * 256

  xls.SetColWidth(19, 19, 2633);  //(9.54 + 0.75) * 256

  xls.SetColWidth(20, 20, 4644);  //(17.39 + 0.75) * 256

  xls.SetColWidth(21, 21, 2633);  //(9.54 + 0.75) * 256

  xls.SetColWidth(22, 22, 7460);  //(28.39 + 0.75) * 256

  xls.SetColWidth(23, 23, 3401);  //(12.54 + 0.75) * 256

  xls.SetColWidth(24, 24, 4900);  //(18.39 + 0.75) * 256

  xls.SetColWidth(25, 25, 4790);  //(17.96 + 0.75) * 256

  xls.SetColWidth(26, 26, 7314);  //(27.82 + 0.75) * 256

  xls.SetColWidth(27, 27, 5485);  //(20.68 + 0.75) * 256

  xls.SetColWidth(28, 28, 5120);  //(19.25 + 0.75) * 256

  xls.SetColWidth(29, 29, 4790);  //(17.96 + 0.75) * 256

  xls.SetColWidth(30, 30, 3876);  //(14.39 + 0.75) * 256

  xls.SetRowHeight(1, 525);  //26.25 * 20

  //Set the cell values
  fmt := xls.GetCellVisibleFormatDef(1, 1);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 1, xls.AddFormat(fmt));
  xls.SetCellValue(1, 1, 'VARLIK KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 2);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 2, xls.AddFormat(fmt));
  xls.SetCellValue(1, 2, 'VARLIK TANIMI');

  fmt := xls.GetCellVisibleFormatDef(1, 3);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 3, xls.AddFormat(fmt));
  xls.SetCellValue(1, 3, 'TAM VARLIK ADI');

  fmt := xls.GetCellVisibleFormatDef(1, 4);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.Format := '@';
  xls.SetCellFormat(1, 4, xls.AddFormat(fmt));
  xls.SetCellValue(1, 4, 'VARLIK GRUBU KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 5);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 5, xls.AddFormat(fmt));
  xls.SetCellValue(1, 5, 'DEMİRBAŞ ENV. NO');

  fmt := xls.GetCellVisibleFormatDef(1, 6);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 6, xls.AddFormat(fmt));
  xls.SetCellValue(1, 6, 'DONANIM KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 7);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 7, xls.AddFormat(fmt));
  xls.SetCellValue(1, 7, 'DONANIM ADI');

  fmt := xls.GetCellVisibleFormatDef(1, 8);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 8, xls.AddFormat(fmt));
  xls.SetCellValue(1, 8, 'DONANIM TİPİ');

  fmt := xls.GetCellVisibleFormatDef(1, 9);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 9, xls.AddFormat(fmt));
  xls.SetCellValue(1, 9, 'SERİ NO');

  fmt := xls.GetCellVisibleFormatDef(1, 10);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 10, xls.AddFormat(fmt));
  xls.SetCellValue(1, 10, 'ÜRETİCİ');

  fmt := xls.GetCellVisibleFormatDef(1, 11);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 11, xls.AddFormat(fmt));
  xls.SetCellValue(1, 11, 'MARKA');

  fmt := xls.GetCellVisibleFormatDef(1, 12);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 12, xls.AddFormat(fmt));
  xls.SetCellValue(1, 12, 'MODEL');

  fmt := xls.GetCellVisibleFormatDef(1, 13);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 13, xls.AddFormat(fmt));
  xls.SetCellValue(1, 13, 'SATICI(BAYİİ)');

  fmt := xls.GetCellVisibleFormatDef(1, 14);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 14, xls.AddFormat(fmt));
  xls.SetCellValue(1, 14, 'KONUMU');

  fmt := xls.GetCellVisibleFormatDef(1, 15);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 15, xls.AddFormat(fmt));
  xls.SetCellValue(1, 15, 'STOK DURUMU');

  fmt := xls.GetCellVisibleFormatDef(1, 16);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 16, xls.AddFormat(fmt));
  xls.SetCellValue(1, 16, 'SATINALMA TARİHİ');

  fmt := xls.GetCellVisibleFormatDef(1, 17);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 17, xls.AddFormat(fmt));
  xls.SetCellValue(1, 17, 'SATINALMA FİYATI');

  fmt := xls.GetCellVisibleFormatDef(1, 18);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 18, xls.AddFormat(fmt));
  xls.SetCellValue(1, 18, 'GARANTİ BİTİŞ TARİHİ');

  fmt := xls.GetCellVisibleFormatDef(1, 19);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 19, xls.AddFormat(fmt));
  xls.SetCellValue(1, 19, 'AĞ ADRESİ');

  fmt := xls.GetCellVisibleFormatDef(1, 20);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 20, xls.AddFormat(fmt));
  xls.SetCellValue(1, 20, 'AĞ FİZİKSEL ADRESİ');

  fmt := xls.GetCellVisibleFormatDef(1, 21);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 21, xls.AddFormat(fmt));
  xls.SetCellValue(1, 21, 'AÇIKLAMA');

  fmt := xls.GetCellVisibleFormatDef(1, 22);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 22, xls.AddFormat(fmt));
  xls.SetCellValue(1, 22, 'DEPARTMAN');

  fmt := xls.GetCellVisibleFormatDef(1, 23);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 23, xls.AddFormat(fmt));
  xls.SetCellValue(1, 23, 'VARLIK SAHİBİ');

  fmt := xls.GetCellVisibleFormatDef(1, 24);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 24, xls.AddFormat(fmt));
  xls.SetCellValue(1, 24, 'VARLIK SAHİBİ VEKİLİ');

  fmt := xls.GetCellVisibleFormatDef(1, 25);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 25, xls.AddFormat(fmt));
  xls.SetCellValue(1, 25, 'KULLANILDIĞI SÜREÇ');

  fmt := xls.GetCellVisibleFormatDef(1, 26);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 26, xls.AddFormat(fmt));
  xls.SetCellValue(1, 26, 'BAKIM YÜKLENİCİ');

  fmt := xls.GetCellVisibleFormatDef(1, 27);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 27, xls.AddFormat(fmt));
  xls.SetCellValue(1, 27, 'BAKIM SÖZ. BAŞ. TAR.');

  fmt := xls.GetCellVisibleFormatDef(1, 28);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 28, xls.AddFormat(fmt));
  xls.SetCellValue(1, 28, 'BAKIM SÖZ. BİT. TAR');

  fmt := xls.GetCellVisibleFormatDef(1, 29);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 29, xls.AddFormat(fmt));
  xls.SetCellValue(1, 29, 'BAKIM KAPSAM');

  fmt := xls.GetCellVisibleFormatDef(1, 30);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 30, xls.AddFormat(fmt));
  xls.SetCellValue(1, 30, 'BAKIM PERİYODU');


  fmt := xls.GetCellVisibleFormatDef(2, 4);
  fmt.Format := '@';
  xls.SetCellFormat(2, 4, xls.AddFormat(fmt));
  xls.SetCellValue(2, 4, '1.1 - ANA MERKEZ SUNUCU ODASI NETWORK');
  xls.SetCellValue(2, 5, 'MKYS-20210004587');
  xls.SetCellValue(2, 6, 'DK-0254');
  xls.SetCellValue(2, 7, 'HEWLETT PACKARD NOTEBOOK');
  xls.SetCellValue(2, 8, 'SWITCH');
  xls.SetCellValue(2, 9, 'SN.862745001');
  xls.SetCellValue(2, 15, 'KULLANIMDA');

  fmt := xls.GetCellVisibleFormatDef(2, 16);
  fmt.Format := TFlxNumberFormat.RegionalDateString;
  xls.SetCellFormat(2, 16, xls.AddFormat(fmt));
  xls.SetCellValue(2, 22, 'YAZILIM YÖNETİMİ BİRİMİ');

  //Data Validation

  Validation := TDataValidationInfo.Empty;
    Validation.ValidationType := TDataValidationDataType.List;
    Validation.FirstFormula := '=Ayarlar!$C$2:$C$1000';
    Validation.IgnoreEmptyCells := true;
    Validation.InCellDropDown := true;
    Validation.ShowErrorBox := true;
    Validation.ShowInputBox := true;
  xls.AddDataValidation(TXlsCellRange.Create(1, 15, 1048576, 15), Validation);

  Validation := TDataValidationInfo.Empty;
    Validation.ValidationType := TDataValidationDataType.List;
    Validation.FirstFormula := '=Ayarlar!$D$2:$D$1000';
    Validation.IgnoreEmptyCells := true;
    Validation.InCellDropDown := true;
    Validation.ShowErrorBox := true;
    Validation.ShowInputBox := true;
  xls.AddDataValidation(TXlsCellRange.Create(2, 22, 1048576, 22), Validation);

  Validation := TDataValidationInfo.Empty;
    Validation.ValidationType := TDataValidationDataType.List;
    Validation.FirstFormula := '=Ayarlar!$A$2:$A$1000';
    Validation.IgnoreEmptyCells := true;
    Validation.InCellDropDown := true;
    Validation.ShowErrorBox := true;
    Validation.ShowInputBox := true;
  xls.AddDataValidation(TXlsCellRange.Create(2, 4, 1048576, 4), Validation);

  Validation := TDataValidationInfo.Empty;
    Validation.ValidationType := TDataValidationDataType.List;
    Validation.FirstFormula := '=Ayarlar!$B$2:$B$1000';
    Validation.IgnoreEmptyCells := true;
    Validation.InCellDropDown := true;
    Validation.ShowErrorBox := true;
    Validation.ShowInputBox := true;
  xls.AddDataValidation(TXlsCellRange.Create(2, 8, 1048576, 8), Validation);

  //Cell selection and scroll position.
  xls.SelectCell(17, 4, false);
  xls.ScrollWindow(2, 2);


  xls.ActiveSheet := 2;  //Set the sheet we are working in.

  //Sheet Options
  xls.SheetName := 'Ayarlar';

  //Set up rows and columns
  xls.SetColWidth(1, 1, 16054);  //(61.96 + 0.75) * 256

  xls.SetColWidth(2, 2, 9728);  //(37.25 + 0.75) * 256

  xls.SetColWidth(3, 3, 9545);  //(36.54 + 0.75) * 256

  xls.SetColWidth(4, 4, 11300);  //(43.39 + 0.75) * 256

  //Set the cell values
  fmt := xls.GetCellVisibleFormatDef(1, 1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 162;
  xls.SetCellFormat(1, 1, xls.AddFormat(fmt));
  xls.SetCellValue(1, 1, 'VARLIK GRUP KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 2);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 162;
  xls.SetCellFormat(1, 2, xls.AddFormat(fmt));
  xls.SetCellValue(1, 2, 'DONANIM TİPİ');

  fmt := xls.GetCellVisibleFormatDef(1, 3);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 162;
  xls.SetCellFormat(1, 3, xls.AddFormat(fmt));
  xls.SetCellValue(1, 3, 'STOK DURUMU');

  fmt := xls.GetCellVisibleFormatDef(1, 4);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 162;
  xls.SetCellFormat(1, 4, xls.AddFormat(fmt));
  xls.SetCellValue(1, 4, 'DEPARTMAN');

 var  Query : TUniQuery;
 var  I : INTEGER;
  query := TUniQuery.Create(nil);
  try
  Query.Connection := MainMod.DBMain;
  QueryOpen(Query,'SELECT    gr_code||'' - ''|| gr_name code 	FROM  def_data_assetgroup where main_id>0 and mc_id = ' + inttostr(mainmod.mcid) +
  '  and id= any(string_to_array('+ QuotedStr(mainmod.LoginInfo.AssetGroups) + ', '','')::int[]) order by code') ;
  if  not Query.IsEmpty then
    begin
      I := 1;
      Query.First;
      while not query.Eof do
      begin
        xls.SetCellValue(I+1, 1, Query.FieldByName('code').AsString);
        inc(I);
        Query.Next;
      end;

    end;

    QueryOpen(Query,
     ' SELECT hw_typename code FROM def_data_hardware_type WHERE hw_typename<>'''' and mc_id = '+ inttostr(mainmod.mcid) +
     ' order by hw_typename ');
  if  not Query.IsEmpty then
    begin
      I := 1;
      Query.First;
      while not query.Eof do
      begin
        xls.SetCellValue(I+1, 2, Query.FieldByName('code').AsString);
        inc(I);
        Query.Next;
      end;

    end;

     QueryOpen(Query,
     ' SELECT distinct title code FROM sys_deptdef where mc_id = ' + inttostr(mainmod.mcid) +
     '  and id= any(string_to_array('+ QuotedStr(mainmod.LoginInfo.Departments) + ', '','')::int[]) ' +
     ' order by 1 '  );
    if  not Query.IsEmpty then
    begin
      I := 1;
      Query.First;
      while not query.Eof do
      begin
        xls.SetCellValue(I+1, 4, Query.FieldByName('code').AsString);
        inc(I);
        Query.Next;
      end;

    end ;

    xls.SetCellValue(2, 3, 'DEPODA');
    xls.SetCellValue(3, 3, 'KULLANIMDA');
    xls.SetCellValue(4, 3, 'SATILDI');
    xls.SetCellValue(5, 3, 'EOL');

  finally
    if assigned(query) then
      FreeAndNil(query);
  end;

  //Cell selection and scroll position.
  xls.ActiveSheet := 1;  //Set the sheet we are working in.
  xls.SelectCell(1, 1, false);
  xls.DocumentProperties.SetStandardProperty(TPropertyId.Author, 'Doğan Akçay');

end;


procedure DonanimBilgileriTopluEklemeSablonu(const xls:TExcelFile) ;
var
  MajorLatin: TThemeTextFont;
  MajorEastAsian: TThemeTextFont;
  MajorComplexScript: TThemeTextFont;
  MajorFont: TThemeFont;
  MinorLatin: TThemeTextFont;
  MinorEastAsian: TThemeTextFont;
  MinorComplexScript: TThemeTextFont;
  MinorFont: TThemeFont;
  ColFmt: TFlxFormat;
  fmt: TFlxFormat;

begin
  xls.NewFile(2, TExcelFileFormat.v2016);  //Create a new Excel file with 2 sheets.

  //Set the names of the sheets
  xls.ActiveSheet := 1;
  xls.SheetName := 'Toplu Donanım ekleme Şablonu';
  xls.ActiveSheet := 2;
  xls.SheetName := 'Ayarlar';
  xls.SheetVisible := TXlsSheetVisible.Hidden;

  xls.ActiveSheet := 1;  //Set the sheet we are working in.

  //Global Workbook Options
  //Note that in xlsx files this option is ignored by FlexCel unless you also set OptionsForceUseCheckCompatibility to true. This is because Excel disables Autosave in files which have this option.
  xls.OptionsCheckCompatibility := false;

  //Sheet Options
  xls.SheetName := 'Toplu Donanım ekleme Şablonu';

  //Printer Settings
  xls.PrintXResolution := 600;
  xls.PrintYResolution := 600;
  xls.PrintOptions := [TPrintOptions.Orientation];
  xls.PrintPaperSize := TPaperSize.A4;

  //Major font
  MajorLatin := TThemeTextFont.Create('Calibri Light', '020F0302020204030204', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorEastAsian := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorComplexScript := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorFont := TThemeFont.Create(MajorLatin, MajorEastAsian, MajorComplexScript);
  MajorFont.AddFont('Jpan', 'Yu Gothic Light');
  MajorFont.AddFont('Hang', '맑은 고딕');
  MajorFont.AddFont('Hans', '等线 Light');
  MajorFont.AddFont('Hant', '新細明體');
  MajorFont.AddFont('Arab', 'Times New Roman');
  MajorFont.AddFont('Hebr', 'Times New Roman');
  MajorFont.AddFont('Thai', 'Tahoma');
  MajorFont.AddFont('Ethi', 'Nyala');
  MajorFont.AddFont('Beng', 'Vrinda');
  MajorFont.AddFont('Gujr', 'Shruti');
  MajorFont.AddFont('Khmr', 'MoolBoran');
  MajorFont.AddFont('Knda', 'Tunga');
  MajorFont.AddFont('Guru', 'Raavi');
  MajorFont.AddFont('Cans', 'Euphemia');
  MajorFont.AddFont('Cher', 'Plantagenet Cherokee');
  MajorFont.AddFont('Yiii', 'Microsoft Yi Baiti');
  MajorFont.AddFont('Tibt', 'Microsoft Himalaya');
  MajorFont.AddFont('Thaa', 'MV Boli');
  MajorFont.AddFont('Deva', 'Mangal');
  MajorFont.AddFont('Telu', 'Gautami');
  MajorFont.AddFont('Taml', 'Latha');
  MajorFont.AddFont('Syrc', 'Estrangelo Edessa');
  MajorFont.AddFont('Orya', 'Kalinga');
  MajorFont.AddFont('Mlym', 'Kartika');
  MajorFont.AddFont('Laoo', 'DokChampa');
  MajorFont.AddFont('Sinh', 'Iskoola Pota');
  MajorFont.AddFont('Mong', 'Mongolian Baiti');
  MajorFont.AddFont('Viet', 'Times New Roman');
  MajorFont.AddFont('Uigh', 'Microsoft Uighur');
  MajorFont.AddFont('Geor', 'Sylfaen');
  xls.SetThemeFont(TFontScheme.Major, MajorFont);

  //Minor font
  MinorLatin := TThemeTextFont.Create('Calibri', '020F0502020204030204', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorEastAsian := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorComplexScript := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorFont := TThemeFont.Create(MinorLatin, MinorEastAsian, MinorComplexScript);
  MinorFont.AddFont('Jpan', 'Yu Gothic');
  MinorFont.AddFont('Hang', '맑은 고딕');
  MinorFont.AddFont('Hans', '等线');
  MinorFont.AddFont('Hant', '新細明體');
  MinorFont.AddFont('Arab', 'Arial');
  MinorFont.AddFont('Hebr', 'Arial');
  MinorFont.AddFont('Thai', 'Tahoma');
  MinorFont.AddFont('Ethi', 'Nyala');
  MinorFont.AddFont('Beng', 'Vrinda');
  MinorFont.AddFont('Gujr', 'Shruti');
  MinorFont.AddFont('Khmr', 'DaunPenh');
  MinorFont.AddFont('Knda', 'Tunga');
  MinorFont.AddFont('Guru', 'Raavi');
  MinorFont.AddFont('Cans', 'Euphemia');
  MinorFont.AddFont('Cher', 'Plantagenet Cherokee');
  MinorFont.AddFont('Yiii', 'Microsoft Yi Baiti');
  MinorFont.AddFont('Tibt', 'Microsoft Himalaya');
  MinorFont.AddFont('Thaa', 'MV Boli');
  MinorFont.AddFont('Deva', 'Mangal');
  MinorFont.AddFont('Telu', 'Gautami');
  MinorFont.AddFont('Taml', 'Latha');
  MinorFont.AddFont('Syrc', 'Estrangelo Edessa');
  MinorFont.AddFont('Orya', 'Kalinga');
  MinorFont.AddFont('Mlym', 'Kartika');
  MinorFont.AddFont('Laoo', 'DokChampa');
  MinorFont.AddFont('Sinh', 'Iskoola Pota');
  MinorFont.AddFont('Mong', 'Mongolian Baiti');
  MinorFont.AddFont('Viet', 'Arial');
  MinorFont.AddFont('Uigh', 'Microsoft Uighur');
  MinorFont.AddFont('Geor', 'Sylfaen');
  xls.SetThemeFont(TFontScheme.Minor, MinorFont);

  //Set up rows and columns
  xls.SetColWidth(1, 1, 8163);  //(31.14 + 0.75) * 256

  xls.SetColWidth(2, 2, 8021);  //(30.58 + 0.75) * 256

  xls.SetColWidth(3, 3, 9130);  //(34.91 + 0.75) * 256

  xls.SetColWidth(4, 4, 5034);  //(18.91 + 0.75) * 256

  ColFmt := xls.GetFormat(xls.GetColFormat(4));
  ColFmt.Format := '@';
  xls.SetColFormat(4, 4, xls.AddFormat(ColFmt));

  xls.SetColWidth(5, 5, 7936);  //(30.25 + 0.75) * 256

  xls.SetColWidth(6, 6, 4067);  //(15.14 + 0.75) * 256

  xls.SetColWidth(7, 7, 7651);  //(29.14 + 0.75) * 256

  xls.SetColWidth(8, 8, 12572);  //(48.36 + 0.75) * 256

  xls.SetColWidth(9, 9, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(10, 10, 1962);  //(6.91 + 0.75) * 256

  xls.SetColWidth(11, 11, 1934);  //(6.80 + 0.75) * 256

  xls.SetColWidth(12, 12, 1877);  //(6.58 + 0.75) * 256

  xls.SetColWidth(13, 13, 3214);  //(11.80 + 0.75) * 256

  xls.SetColWidth(14, 14, 2389);  //(8.58 + 0.75) * 256

  xls.SetColWidth(15, 15, 8305);  //(31.69 + 0.75) * 256

  xls.SetColWidth(16, 16, 4608);  //(17.25 + 0.75) * 256

  xls.SetColWidth(17, 17, 4494);  //(16.80 + 0.75) * 256

  xls.SetColWidth(18, 18, 5205);  //(19.58 + 0.75) * 256

  xls.SetColWidth(19, 19, 2645);  //(9.58 + 0.75) * 256

  xls.SetColWidth(20, 20, 4636);  //(17.36 + 0.75) * 256

  xls.SetColWidth(21, 21, 2645);  //(9.58 + 0.75) * 256

  xls.SetColWidth(22, 22, 3043);  //(11.14 + 0.75) * 256

  xls.SetColWidth(23, 23, 3413);  //(12.58 + 0.75) * 256

  xls.SetColWidth(24, 24, 4892);  //(18.36 + 0.75) * 256

  xls.SetColWidth(25, 25, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(26, 26, 7310);  //(27.80 + 0.75) * 256

  xls.SetColWidth(27, 27, 5489);  //(20.69 + 0.75) * 256

  xls.SetColWidth(28, 28, 5120);  //(19.25 + 0.75) * 256

  xls.SetColWidth(29, 29, 4778);  //(17.91 + 0.75) * 256
  xls.DefaultRowHeight := 288;

  xls.SetRowHeight(1, 525);  //26.25 * 20

  //Set the cell values
  fmt := xls.GetCellVisibleFormatDef(1, 1);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 1, xls.AddFormat(fmt));
  xls.SetCellValue(1, 1, 'VARLIK KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 2);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 2, xls.AddFormat(fmt));
  xls.SetCellValue(1, 2, 'VARLIK TANIMI');

  fmt := xls.GetCellVisibleFormatDef(1, 3);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 3, xls.AddFormat(fmt));
  xls.SetCellValue(1, 3, 'TAM VARLIK ADI');

  fmt := xls.GetCellVisibleFormatDef(1, 4);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.Format := '@';
  xls.SetCellFormat(1, 4, xls.AddFormat(fmt));
  xls.SetCellValue(1, 4, 'VARLIK GRUBU KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 5);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 5, xls.AddFormat(fmt));
  xls.SetCellValue(1, 5, 'DEMİRBAŞ ENV. NO');

  fmt := xls.GetCellVisibleFormatDef(1, 6);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 6, xls.AddFormat(fmt));
  xls.SetCellValue(1, 6, 'DONANIM KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 7);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 7, xls.AddFormat(fmt));
  xls.SetCellValue(1, 7, 'DONANIM ADI');

  fmt := xls.GetCellVisibleFormatDef(1, 8);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 8, xls.AddFormat(fmt));
  xls.SetCellValue(1, 8, 'DONANIM TİPİ');

  fmt := xls.GetCellVisibleFormatDef(1, 9);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 9, xls.AddFormat(fmt));
  xls.SetCellValue(1, 9, 'SERİ NO');

  fmt := xls.GetCellVisibleFormatDef(1, 10);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 10, xls.AddFormat(fmt));
  xls.SetCellValue(1, 10, 'ÜRETİCİ');

  fmt := xls.GetCellVisibleFormatDef(1, 11);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 11, xls.AddFormat(fmt));
  xls.SetCellValue(1, 11, 'MARKA');

  fmt := xls.GetCellVisibleFormatDef(1, 12);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 12, xls.AddFormat(fmt));
  xls.SetCellValue(1, 12, 'MODEL');

  fmt := xls.GetCellVisibleFormatDef(1, 13);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 13, xls.AddFormat(fmt));
  xls.SetCellValue(1, 13, 'SATICI(BAYİİ)');

  fmt := xls.GetCellVisibleFormatDef(1, 14);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 14, xls.AddFormat(fmt));
  xls.SetCellValue(1, 14, 'KONUMU');

  fmt := xls.GetCellVisibleFormatDef(1, 15);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 15, xls.AddFormat(fmt));
  xls.SetCellValue(1, 15, 'STOK DURUMU');

  fmt := xls.GetCellVisibleFormatDef(1, 16);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 16, xls.AddFormat(fmt));
  xls.SetCellValue(1, 16, 'SATINALMA TARİHİ');

  fmt := xls.GetCellVisibleFormatDef(1, 17);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 17, xls.AddFormat(fmt));
  xls.SetCellValue(1, 17, 'SATINALMA FİYATI');

  fmt := xls.GetCellVisibleFormatDef(1, 18);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 18, xls.AddFormat(fmt));
  xls.SetCellValue(1, 18, 'GARANTİ BİTİŞ TARİHİ');

  fmt := xls.GetCellVisibleFormatDef(1, 19);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 19, xls.AddFormat(fmt));
  xls.SetCellValue(1, 19, 'AĞ ADRESİ');

  fmt := xls.GetCellVisibleFormatDef(1, 20);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 20, xls.AddFormat(fmt));
  xls.SetCellValue(1, 20, 'AĞ FİZİKSEL ADRESİ');

  fmt := xls.GetCellVisibleFormatDef(1, 21);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 21, xls.AddFormat(fmt));
  xls.SetCellValue(1, 21, 'AÇIKLAMA');

  fmt := xls.GetCellVisibleFormatDef(1, 22);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 22, xls.AddFormat(fmt));
  xls.SetCellValue(1, 22, 'DEPARTMAN');

  fmt := xls.GetCellVisibleFormatDef(1, 23);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 23, xls.AddFormat(fmt));
  xls.SetCellValue(1, 23, 'VARLIK SAHİBİ');

  fmt := xls.GetCellVisibleFormatDef(1, 24);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 24, xls.AddFormat(fmt));
  xls.SetCellValue(1, 24, 'VARLIK SAHİBİ VEKİLİ');

  fmt := xls.GetCellVisibleFormatDef(1, 25);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 25, xls.AddFormat(fmt));
  xls.SetCellValue(1, 25, 'KULLANILDIĞI SÜREÇ');

  fmt := xls.GetCellVisibleFormatDef(1, 26);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 26, xls.AddFormat(fmt));
  xls.SetCellValue(1, 26, 'BAKIM YÜKLENİCİ');

  fmt := xls.GetCellVisibleFormatDef(1, 27);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 27, xls.AddFormat(fmt));
  xls.SetCellValue(1, 27, 'BAKIM SÖZ. BAŞ. TAR.');

  fmt := xls.GetCellVisibleFormatDef(1, 28);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 28, xls.AddFormat(fmt));
  xls.SetCellValue(1, 28, 'BAKIM SÖZ. BİT. TAR');

  fmt := xls.GetCellVisibleFormatDef(1, 29);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 29, xls.AddFormat(fmt));
  xls.SetCellValue(1, 29, 'BAKIM KAPSAM');
  xls.SetCellValue(2, 1, 'DENVAR-1000');
  xls.SetCellValue(2, 2, 'HEWLETT PACKARD NOTEBOOK');
  xls.SetCellValue(2, 3, 'HEWLETT PACKARD ELITEBOOK 840 G1 CNU436BSXV NOTEBOOK');

  fmt := xls.GetCellVisibleFormatDef(2, 4);
  fmt.Format := '@';
  xls.SetCellFormat(2, 4, xls.AddFormat(fmt));
  xls.SetCellValue(2, 4, 'AA');
  xls.SetCellValue(2, 5, 'MKYS-20210004587');
  xls.SetCellValue(2, 6, 'DK-0254');
  xls.SetCellValue(2, 7, 'HEWLETT PACKARD NOTEBOOK');
  xls.SetCellValue(2, 8, 'NOTEBOOK');
  xls.SetCellValue(2, 9, 'SN.862745001');
  xls.SetCellValue(2, 15, 'DEPODA');

  fmt := xls.GetCellVisibleFormatDef(2, 16);
  fmt.Format := TFlxNumberFormat.RegionalDateString;
  xls.SetCellFormat(2, 16, xls.AddFormat(fmt));
  xls.SetCellValue(2, 22, 'REKTÖRLÜKK');

  //Cell selection and scroll position.
  xls.SelectCell(1, 1, false);

  //Standard Document Properties - Most are only for xlsx files. In xls files FlexCel will only change the Creation Date and Modified Date.
  xls.DocumentProperties.SetStandardProperty(TPropertyId.Author, 'Doğan Akçay');

end;

procedure YazilimBilgileriTopluEklemeSablonuValid(const xls:TExcelFile) ;
var
  MajorLatin: TThemeTextFont;
  MajorEastAsian: TThemeTextFont;
  MajorComplexScript: TThemeTextFont;
  MajorFont: TThemeFont;
  MinorLatin: TThemeTextFont;
  MinorEastAsian: TThemeTextFont;
  MinorComplexScript: TThemeTextFont;
  MinorFont: TThemeFont;
  ColFmt: TFlxFormat;
  fmt: TFlxFormat;
  Validation: TDataValidationInfo;

begin
  xls.NewFile(2, TExcelFileFormat.v2016);  //Create a new Excel file with 2 sheets.

  //Set the names of the sheets
  xls.ActiveSheet := 1;
  xls.SheetName := 'Toplu Yazılım Ekleme Şablonu';
  xls.ActiveSheet := 2;
  xls.SheetName := 'Ayarlar';
  xls.SheetVisible := TXlsSheetVisible.Hidden;

  xls.ActiveSheet := 1;  //Set the sheet we are working in.

  //Global Workbook Options
  //Note that in xlsx files this option is ignored by FlexCel unless you also set OptionsForceUseCheckCompatibility to true. This is because Excel disables Autosave in files which have this option.
  xls.OptionsCheckCompatibility := false;

  //This setting is only needed if you have names that refer to other names in the wrong order.
  xls.AllowEnteringUnknownFunctionsAndNames := true;

  //Sheet Options
  xls.SheetName := 'Toplu Yazılım Ekleme Şablonu';

  //Printer Settings
  xls.PrintXResolution := 600;
  xls.PrintYResolution := 600;
  xls.PrintOptions := [TPrintOptions.Orientation];
  xls.PrintPaperSize := TPaperSize.A4;

  //Major font
  MajorLatin := TThemeTextFont.Create('Calibri Light', '020F0302020204030204', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorEastAsian := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorComplexScript := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorFont := TThemeFont.Create(MajorLatin, MajorEastAsian, MajorComplexScript);
  MajorFont.AddFont('Jpan', 'Yu Gothic Light');
  MajorFont.AddFont('Hang', '맑은 고딕');
  MajorFont.AddFont('Hans', '等线 Light');
  MajorFont.AddFont('Hant', '新細明體');
  MajorFont.AddFont('Arab', 'Times New Roman');
  MajorFont.AddFont('Hebr', 'Times New Roman');
  MajorFont.AddFont('Thai', 'Tahoma');
  MajorFont.AddFont('Ethi', 'Nyala');
  MajorFont.AddFont('Beng', 'Vrinda');
  MajorFont.AddFont('Gujr', 'Shruti');
  MajorFont.AddFont('Khmr', 'MoolBoran');
  MajorFont.AddFont('Knda', 'Tunga');
  MajorFont.AddFont('Guru', 'Raavi');
  MajorFont.AddFont('Cans', 'Euphemia');
  MajorFont.AddFont('Cher', 'Plantagenet Cherokee');
  MajorFont.AddFont('Yiii', 'Microsoft Yi Baiti');
  MajorFont.AddFont('Tibt', 'Microsoft Himalaya');
  MajorFont.AddFont('Thaa', 'MV Boli');
  MajorFont.AddFont('Deva', 'Mangal');
  MajorFont.AddFont('Telu', 'Gautami');
  MajorFont.AddFont('Taml', 'Latha');
  MajorFont.AddFont('Syrc', 'Estrangelo Edessa');
  MajorFont.AddFont('Orya', 'Kalinga');
  MajorFont.AddFont('Mlym', 'Kartika');
  MajorFont.AddFont('Laoo', 'DokChampa');
  MajorFont.AddFont('Sinh', 'Iskoola Pota');
  MajorFont.AddFont('Mong', 'Mongolian Baiti');
  MajorFont.AddFont('Viet', 'Times New Roman');
  MajorFont.AddFont('Uigh', 'Microsoft Uighur');
  MajorFont.AddFont('Geor', 'Sylfaen');
  xls.SetThemeFont(TFontScheme.Major, MajorFont);

  //Minor font
  MinorLatin := TThemeTextFont.Create('Calibri', '020F0502020204030204', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorEastAsian := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorComplexScript := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorFont := TThemeFont.Create(MinorLatin, MinorEastAsian, MinorComplexScript);
  MinorFont.AddFont('Jpan', 'Yu Gothic');
  MinorFont.AddFont('Hang', '맑은 고딕');
  MinorFont.AddFont('Hans', '等线');
  MinorFont.AddFont('Hant', '新細明體');
  MinorFont.AddFont('Arab', 'Arial');
  MinorFont.AddFont('Hebr', 'Arial');
  MinorFont.AddFont('Thai', 'Tahoma');
  MinorFont.AddFont('Ethi', 'Nyala');
  MinorFont.AddFont('Beng', 'Vrinda');
  MinorFont.AddFont('Gujr', 'Shruti');
  MinorFont.AddFont('Khmr', 'DaunPenh');
  MinorFont.AddFont('Knda', 'Tunga');
  MinorFont.AddFont('Guru', 'Raavi');
  MinorFont.AddFont('Cans', 'Euphemia');
  MinorFont.AddFont('Cher', 'Plantagenet Cherokee');
  MinorFont.AddFont('Yiii', 'Microsoft Yi Baiti');
  MinorFont.AddFont('Tibt', 'Microsoft Himalaya');
  MinorFont.AddFont('Thaa', 'MV Boli');
  MinorFont.AddFont('Deva', 'Mangal');
  MinorFont.AddFont('Telu', 'Gautami');
  MinorFont.AddFont('Taml', 'Latha');
  MinorFont.AddFont('Syrc', 'Estrangelo Edessa');
  MinorFont.AddFont('Orya', 'Kalinga');
  MinorFont.AddFont('Mlym', 'Kartika');
  MinorFont.AddFont('Laoo', 'DokChampa');
  MinorFont.AddFont('Sinh', 'Iskoola Pota');
  MinorFont.AddFont('Mong', 'Mongolian Baiti');
  MinorFont.AddFont('Viet', 'Arial');
  MinorFont.AddFont('Uigh', 'Microsoft Uighur');
  MinorFont.AddFont('Geor', 'Sylfaen');
  xls.SetThemeFont(TFontScheme.Minor, MinorFont);

  //Set up rows and columns
  xls.SetColWidth(1, 1, 3291);  //(12.11 + 0.75) * 256

  xls.SetColWidth(2, 2, 3693);  //(13.68 + 0.75) * 256

  xls.SetColWidth(3, 3, 3949);  //(14.68 + 0.75) * 256

  xls.SetColWidth(4, 4, 5046);  //(18.96 + 0.75) * 256

  ColFmt := xls.GetFormat(xls.GetColFormat(4));
  ColFmt.Format := '@';
  xls.SetColFormat(4, 4, xls.AddFormat(ColFmt));

  xls.SetColWidth(5, 5, 7972);  //(30.39 + 0.75) * 256

  xls.SetColWidth(6, 6, 3510);  //(12.96 + 0.75) * 256

  xls.SetColWidth(7, 7, 2962);  //(10.82 + 0.75) * 256

  xls.SetColWidth(8, 8, 12580);  //(48.39 + 0.75) * 256

  xls.SetColWidth(9, 9, 1974);  //(6.96 + 0.75) * 256

  xls.SetColWidth(10, 10, 1938);  //(6.82 + 0.75) * 256

  xls.SetColWidth(11, 11, 1865);  //(6.54 + 0.75) * 256

  xls.SetColWidth(12, 12, 3218);  //(11.82 + 0.75) * 256

  xls.SetColWidth(13, 13, 4608);  //(17.25 + 0.75) * 256

  xls.SetColWidth(14, 14, 4498);  //(16.82 + 0.75) * 256

  xls.SetColWidth(15, 15, 5851);  //(22.11 + 0.75) * 256

  xls.SetColWidth(16, 16, 6363);  //(24.11 + 0.75) * 256

  xls.SetColWidth(17, 17, 6692);  //(25.39 + 0.75) * 256

  xls.SetColWidth(18, 18, 3364);  //(12.39 + 0.75) * 256

  xls.SetColWidth(19, 19, 6948);  //(26.39 + 0.75) * 256

  xls.SetColWidth(20, 20, 2633);  //(9.54 + 0.75) * 256

  xls.SetColWidth(21, 21, 3876);  //(14.39 + 0.75) * 256

  xls.SetColWidth(22, 22, 3035);  //(11.11 + 0.75) * 256

  xls.SetColWidth(23, 23, 3401);  //(12.54 + 0.75) * 256

  xls.SetColWidth(24, 24, 4900);  //(18.39 + 0.75) * 256

  xls.SetColWidth(25, 25, 4790);  //(17.96 + 0.75) * 256

  xls.SetColWidth(26, 26, 4644);  //(17.39 + 0.75) * 256

  xls.SetColWidth(27, 27, 4937);  //(18.54 + 0.75) * 256

  xls.SetColWidth(28, 28, 5814);  //(21.96 + 0.75) * 256

  xls.SetColWidth(29, 29, 4534);  //(16.96 + 0.75) * 256

  //Set the cell values
  fmt := xls.GetCellVisibleFormatDef(1, 1);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 1, xls.AddFormat(fmt));
  xls.SetCellValue(1, 1, 'VARLIK KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 2);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 2, xls.AddFormat(fmt));
  xls.SetCellValue(1, 2, 'VARLIK TANIMI');

  fmt := xls.GetCellVisibleFormatDef(1, 3);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 3, xls.AddFormat(fmt));
  xls.SetCellValue(1, 3, 'TAM VARLIK ADI');

  fmt := xls.GetCellVisibleFormatDef(1, 4);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.Format := '@';
  xls.SetCellFormat(1, 4, xls.AddFormat(fmt));
  xls.SetCellValue(1, 4, 'VARLIK GRUBU KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 5);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 5, xls.AddFormat(fmt));
  xls.SetCellValue(1, 5, 'DEMİRBAŞ ENV. NO.');


  fmt := xls.GetCellVisibleFormatDef(1, 6);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 6, xls.AddFormat(fmt));
  xls.SetCellValue(1, 6, 'YAZILIM KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 7);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 7, xls.AddFormat(fmt));
  xls.SetCellValue(1, 7, 'YAZILIM ADI');

  fmt := xls.GetCellVisibleFormatDef(1, 8);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 8, xls.AddFormat(fmt));
  xls.SetCellValue(1, 8, 'YAZILIM VERSİYONU');

  fmt := xls.GetCellVisibleFormatDef(1, 9);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 9, xls.AddFormat(fmt));
  xls.SetCellValue(1, 9, 'ÜRETİCİ');

  fmt := xls.GetCellVisibleFormatDef(1, 10);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 10, xls.AddFormat(fmt));
  xls.SetCellValue(1, 10, 'MARKA');

  fmt := xls.GetCellVisibleFormatDef(1, 11);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 11, xls.AddFormat(fmt));
  xls.SetCellValue(1, 11, 'MODEL');

  fmt := xls.GetCellVisibleFormatDef(1, 12);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 12, xls.AddFormat(fmt));
  xls.SetCellValue(1, 12, 'SATICI(BAYİİ)');

  fmt := xls.GetCellVisibleFormatDef(1, 13);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 13, xls.AddFormat(fmt));
  xls.SetCellValue(1, 13, 'SATINALMA TARİHİ');

  fmt := xls.GetCellVisibleFormatDef(1, 14);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 14, xls.AddFormat(fmt));
  xls.SetCellValue(1, 14, 'SATINALMA FİYATI');

  fmt := xls.GetCellVisibleFormatDef(1, 15);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 15, xls.AddFormat(fmt));
  xls.SetCellValue(1, 15, 'LİSANS BAŞLAMA TARİHİ');

  fmt := xls.GetCellVisibleFormatDef(1, 16);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 16, xls.AddFormat(fmt));
  xls.SetCellValue(1, 16, 'LİSANS BİTİŞ TARİHİ');

  fmt := xls.GetCellVisibleFormatDef(1, 17);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 17, xls.AddFormat(fmt));
  xls.SetCellValue(1, 17, 'LİSANS TİPİ');

  fmt := xls.GetCellVisibleFormatDef(1, 18);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 18, xls.AddFormat(fmt));
  xls.SetCellValue(1, 18, 'LİSANS SAYISI');

  fmt := xls.GetCellVisibleFormatDef(1, 19);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 19, xls.AddFormat(fmt));
  xls.SetCellValue(1, 19, 'LİSANS DURUMU');

  fmt := xls.GetCellVisibleFormatDef(1, 20);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 20, xls.AddFormat(fmt));
  xls.SetCellValue(1, 20, 'AÇIKLAMA');

  fmt := xls.GetCellVisibleFormatDef(1, 21);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 21, xls.AddFormat(fmt));
  xls.SetCellValue(1, 21, 'ÜRÜN KİMLİĞİ');

  fmt := xls.GetCellVisibleFormatDef(1, 22);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 22, xls.AddFormat(fmt));
  xls.SetCellValue(1, 22, 'DEPARTMAN');
  xls.SetCellValue(1, 23, 'VARLIK SAHİBİ');
  xls.SetCellValue(1, 24, 'VARLIK SAHİBİ VEKİLİ');
  xls.SetCellValue(1, 25, 'KULLANILDIĞI SÜREÇ');
  xls.SetCellValue(1, 26, 'BAKIM YÜKLENİCİ');
  xls.SetCellValue(1, 27, 'BAKIM SÖZ. BAŞ. TAR.');
  xls.SetCellValue(1, 28, 'BAKIM SÖZ. BİT. TAR');
  xls.SetCellValue(1, 29, 'BAKIM KAPSAM');
  xls.SetCellValue(1, 30, 'BAKIM PERİYODU');
  xls.SetCellValue(2, 1, 5142);
  xls.SetCellValue(2, 2, 'AA');

  fmt := xls.GetCellVisibleFormatDef(2, 4);
  fmt.Format := '@';
  xls.SetCellFormat(2, 4, xls.AddFormat(fmt));
  xls.SetCellValue(2, 4, '1.5');

  fmt := xls.GetCellVisibleFormatDef(2, 13);
  fmt.Format := TFlxNumberFormat.RegionalDateString;
  xls.SetCellFormat(2, 13, xls.AddFormat(fmt));

  fmt := xls.GetCellVisibleFormatDef(2, 15);
  fmt.Format := TFlxNumberFormat.RegionalDateString;
  xls.SetCellFormat(2, 15, xls.AddFormat(fmt));
  xls.SetCellValue(2, 17, 'ÜCRETSİZ');
  xls.SetCellValue(2, 19, 'LİSANSLI');
  xls.SetCellValue(3, 1, 4236);
  xls.SetCellValue(3, 2, 'EE');

  fmt := xls.GetCellVisibleFormatDef(3, 4);
  fmt.Format := '@';
  xls.SetCellFormat(3, 4, xls.AddFormat(fmt));
  xls.SetCellValue(3, 4, '2.6');

  fmt := xls.GetCellVisibleFormatDef(3, 13);
  fmt.Format := TFlxNumberFormat.RegionalDateString;
  xls.SetCellFormat(3, 13, xls.AddFormat(fmt));
  xls.SetCellValue(3, 17, 'ÜCRETLİ');
  xls.SetCellValue(3, 19, 'LİSANSSIZ');
  xls.SetCellValue(4, 1, 6362);
  xls.SetCellValue(4, 2, 'UU');

  fmt := xls.GetCellVisibleFormatDef(4, 4);
  fmt.Format := '@';
  xls.SetCellFormat(4, 4, xls.AddFormat(fmt));
  xls.SetCellValue(4, 4, '2.5');

  fmt := xls.GetCellVisibleFormatDef(4, 13);
  fmt.Format := TFlxNumberFormat.RegionalDateString;
  xls.SetCellFormat(4, 13, xls.AddFormat(fmt));
  xls.SetCellValue(4, 17, 'DEMO');
  xls.SetCellValue(4, 19, 'LİSANSSIZ');

  //Data Validation

  Validation := TDataValidationInfo.Empty;
    Validation.ValidationType := TDataValidationDataType.List;
    Validation.FirstFormula := '=Ayarlar!$A$2:$A$1048576';
    Validation.IgnoreEmptyCells := true;
    Validation.InCellDropDown := true;
    Validation.ShowErrorBox := true;
    Validation.ShowInputBox := true;
  xls.AddDataValidation(TXlsCellRange.Create(2, 4, 1048576, 4), Validation);

  Validation := TDataValidationInfo.Empty;
    Validation.ValidationType := TDataValidationDataType.List;
    Validation.FirstFormula := '=Ayarlar!$B$2:$B$1048576';
    Validation.IgnoreEmptyCells := true;
    Validation.InCellDropDown := true;
    Validation.ShowErrorBox := true;
    Validation.ShowInputBox := true;
  xls.AddDataValidation(TXlsCellRange.Create(2, 17, 1048576, 17), Validation);

  Validation := TDataValidationInfo.Empty;
    Validation.ValidationType := TDataValidationDataType.List;
    Validation.FirstFormula := '=Ayarlar!$C$2:$C$1048576';
    Validation.IgnoreEmptyCells := true;
    Validation.InCellDropDown := true;
    Validation.ShowErrorBox := true;
    Validation.ShowInputBox := true;
  xls.AddDataValidation(TXlsCellRange.Create(2, 19, 1048576, 19), Validation);

  Validation := TDataValidationInfo.Empty;
    Validation.ValidationType := TDataValidationDataType.List;
    Validation.FirstFormula := '=Ayarlar!$D$2:$D$1048576';
    Validation.IgnoreEmptyCells := true;
    Validation.InCellDropDown := true;
    Validation.ShowErrorBox := true;
    Validation.ShowInputBox := true;
  xls.AddDataValidation(TXlsCellRange.Create(2, 22, 1048576, 22), Validation);

  //Freeze Panes
  xls.FreezePanes(TCellAddress.Create('A2'));

  //Cell selection and scroll position.
  xls.SelectCell(2, 1, false);


  xls.ActiveSheet := 2;  //Set the sheet we are working in.

  //Sheet Options
  xls.SheetName := 'Ayarlar';

  //Set up rows and columns
  xls.SetColWidth(1, 1, 9472);  //(36.25 + 0.75) * 256

  xls.SetColWidth(2, 3, 8484);  //(32.39 + 0.75) * 256

  xls.SetColWidth(4, 4, 8630);  //(32.96 + 0.75) * 256

  //Set the cell values
  fmt := xls.GetCellVisibleFormatDef(1, 1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 162;
  xls.SetCellFormat(1, 1, xls.AddFormat(fmt));
  xls.SetCellValue(1, 1, 'VARLIK GRUP KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 2);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 162;
  xls.SetCellFormat(1, 2, xls.AddFormat(fmt));
  xls.SetCellValue(1, 2, 'LİSANS TİPİ');

  fmt := xls.GetCellVisibleFormatDef(1, 3);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 162;
  xls.SetCellFormat(1, 3, xls.AddFormat(fmt));
  xls.SetCellValue(1, 3, 'LİSANS DURUMU');



  fmt := xls.GetCellVisibleFormatDef(1, 4);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 162;
  xls.SetCellFormat(1, 4, xls.AddFormat(fmt));
  xls.SetCellValue(1, 4, 'DEPARTMAN');



 var  Query : TUniQuery;
 var  I : INTEGER;
  query := TUniQuery.Create(nil);
  try
    Query.Connection := MainMod.DBMain;
    QueryOpen(Query,'SELECT    gr_code||'' - ''|| gr_name code 	FROM  def_data_assetgroup where main_id>0 and mc_id = ' + inttostr(mainmod.mcid) +
    '  and id= any(string_to_array('+ QuotedStr(mainmod.LoginInfo.AssetGroups) + ', '','')::int[]) order by code') ;
    if  not Query.IsEmpty then
      begin
        I := 1;
        Query.First;
        while not query.Eof do
        begin
          xls.SetCellValue(I+1, 1, Query.FieldByName('code').AsString);
          inc(I);
          Query.Next;
        end;
      end;

      QueryOpen(Query,
       ' SELECT distinct title code FROM sys_deptdef where mc_id = ' + inttostr(mainmod.mcid) +
       '  and id= any(string_to_array('+ QuotedStr(mainmod.LoginInfo.Departments) + ', '','')::int[]) ' +
       ' order by 1 '  );
     if  not Query.IsEmpty then
      begin
        I := 1;
        Query.First;
        while not query.Eof do
        begin
          xls.SetCellValue(I+1, 4, Query.FieldByName('code').AsString);
          inc(I);
          Query.Next;
        end;
      end;
      xls.SetCellValue(2, 2, 'ÜCRETSİZ');
      xls.SetCellValue(3, 2, 'ÜCRETLİ');
      xls.SetCellValue(4, 2, 'DEMO');

      xls.SetCellValue(2, 3, 'LİSANSLI');
      xls.SetCellValue(3, 3, 'LİSANSSIZ');

  finally
    if assigned(Query) then
      FreeAndNil(Query);
  end;

  //Cell selection and scroll position.
  xls.ActiveSheet := 1;  //Set the sheet we are working in.
  xls.SelectCell(1, 1, false);

  //Standard Document Properties - Most are only for xlsx files. In xls files FlexCel will only change the Creation Date and Modified Date.
  xls.DocumentProperties.SetStandardProperty(TPropertyId.Author, 'DOGAN');

end;

procedure YazilimBilgileriTopluEklemeSablonu(const xls:TExcelFile) ;
var
  MajorLatin: TThemeTextFont;
  MajorEastAsian: TThemeTextFont;
  MajorComplexScript: TThemeTextFont;
  MajorFont: TThemeFont;
  MinorLatin: TThemeTextFont;
  MinorEastAsian: TThemeTextFont;
  MinorComplexScript: TThemeTextFont;
  MinorFont: TThemeFont;
  ColFmt: TFlxFormat;
  fmt: TFlxFormat;

begin
  xls.NewFile(1, TExcelFileFormat.v2016);  //Create a new Excel file with 1 sheet.

  //Set the names of the sheets
  xls.ActiveSheet := 1;
  xls.SheetName := 'Sayfa1';

  xls.ActiveSheet := 1;  //Set the sheet we are working in.

  //Global Workbook Options
  //Note that in xlsx files this option is ignored by FlexCel unless you also set OptionsForceUseCheckCompatibility to true. This is because Excel disables Autosave in files which have this option.
  xls.OptionsCheckCompatibility := false;

  //Sheet Options
  xls.SheetName := 'Sayfa1';

  //Printer Settings
  xls.PrintXResolution := 600;
  xls.PrintYResolution := 600;
  xls.PrintOptions := [TPrintOptions.Orientation];
  xls.PrintPaperSize := TPaperSize.A4;

  //Major font
  MajorLatin := TThemeTextFont.Create('Calibri Light', '020F0302020204030204', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorEastAsian := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorComplexScript := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorFont := TThemeFont.Create(MajorLatin, MajorEastAsian, MajorComplexScript);
  MajorFont.AddFont('Jpan', 'Yu Gothic Light');
  MajorFont.AddFont('Hang', '맑은 고딕');
  MajorFont.AddFont('Hans', '等线 Light');
  MajorFont.AddFont('Hant', '新細明體');
  MajorFont.AddFont('Arab', 'Times New Roman');
  MajorFont.AddFont('Hebr', 'Times New Roman');
  MajorFont.AddFont('Thai', 'Tahoma');
  MajorFont.AddFont('Ethi', 'Nyala');
  MajorFont.AddFont('Beng', 'Vrinda');
  MajorFont.AddFont('Gujr', 'Shruti');
  MajorFont.AddFont('Khmr', 'MoolBoran');
  MajorFont.AddFont('Knda', 'Tunga');
  MajorFont.AddFont('Guru', 'Raavi');
  MajorFont.AddFont('Cans', 'Euphemia');
  MajorFont.AddFont('Cher', 'Plantagenet Cherokee');
  MajorFont.AddFont('Yiii', 'Microsoft Yi Baiti');
  MajorFont.AddFont('Tibt', 'Microsoft Himalaya');
  MajorFont.AddFont('Thaa', 'MV Boli');
  MajorFont.AddFont('Deva', 'Mangal');
  MajorFont.AddFont('Telu', 'Gautami');
  MajorFont.AddFont('Taml', 'Latha');
  MajorFont.AddFont('Syrc', 'Estrangelo Edessa');
  MajorFont.AddFont('Orya', 'Kalinga');
  MajorFont.AddFont('Mlym', 'Kartika');
  MajorFont.AddFont('Laoo', 'DokChampa');
  MajorFont.AddFont('Sinh', 'Iskoola Pota');
  MajorFont.AddFont('Mong', 'Mongolian Baiti');
  MajorFont.AddFont('Viet', 'Times New Roman');
  MajorFont.AddFont('Uigh', 'Microsoft Uighur');
  MajorFont.AddFont('Geor', 'Sylfaen');
  xls.SetThemeFont(TFontScheme.Major, MajorFont);

  //Minor font
  MinorLatin := TThemeTextFont.Create('Calibri', '020F0502020204030204', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorEastAsian := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorComplexScript := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorFont := TThemeFont.Create(MinorLatin, MinorEastAsian, MinorComplexScript);
  MinorFont.AddFont('Jpan', 'Yu Gothic');
  MinorFont.AddFont('Hang', '맑은 고딕');
  MinorFont.AddFont('Hans', '等线');
  MinorFont.AddFont('Hant', '新細明體');
  MinorFont.AddFont('Arab', 'Arial');
  MinorFont.AddFont('Hebr', 'Arial');
  MinorFont.AddFont('Thai', 'Tahoma');
  MinorFont.AddFont('Ethi', 'Nyala');
  MinorFont.AddFont('Beng', 'Vrinda');
  MinorFont.AddFont('Gujr', 'Shruti');
  MinorFont.AddFont('Khmr', 'DaunPenh');
  MinorFont.AddFont('Knda', 'Tunga');
  MinorFont.AddFont('Guru', 'Raavi');
  MinorFont.AddFont('Cans', 'Euphemia');
  MinorFont.AddFont('Cher', 'Plantagenet Cherokee');
  MinorFont.AddFont('Yiii', 'Microsoft Yi Baiti');
  MinorFont.AddFont('Tibt', 'Microsoft Himalaya');
  MinorFont.AddFont('Thaa', 'MV Boli');
  MinorFont.AddFont('Deva', 'Mangal');
  MinorFont.AddFont('Telu', 'Gautami');
  MinorFont.AddFont('Taml', 'Latha');
  MinorFont.AddFont('Syrc', 'Estrangelo Edessa');
  MinorFont.AddFont('Orya', 'Kalinga');
  MinorFont.AddFont('Mlym', 'Kartika');
  MinorFont.AddFont('Laoo', 'DokChampa');
  MinorFont.AddFont('Sinh', 'Iskoola Pota');
  MinorFont.AddFont('Mong', 'Mongolian Baiti');
  MinorFont.AddFont('Viet', 'Arial');
  MinorFont.AddFont('Uigh', 'Microsoft Uighur');
  MinorFont.AddFont('Geor', 'Sylfaen');
  xls.SetThemeFont(TFontScheme.Minor, MinorFont);

  //Set up rows and columns
  xls.SetColWidth(1, 1, 3299);  //(12.14 + 0.75) * 256

  xls.SetColWidth(2, 2, 3697);  //(13.69 + 0.75) * 256

  xls.SetColWidth(3, 3, 3953);  //(14.69 + 0.75) * 256

  xls.SetColWidth(4, 4, 5034);  //(18.91 + 0.75) * 256

  ColFmt := xls.GetFormat(xls.GetColFormat(4));
  ColFmt.Format := '@';
  xls.SetColFormat(4, 4, xls.AddFormat(ColFmt));

  xls.SetColWidth(5, 5, 3470);  //(12.80 + 0.75) * 256

  xls.SetColWidth(6, 6, 3498);  //(12.91 + 0.75) * 256

  xls.SetColWidth(7, 7, 2958);  //(10.80 + 0.75) * 256

  xls.SetColWidth(8, 8, 12572);  //(48.36 + 0.75) * 256

  xls.SetColWidth(9, 9, 1962);  //(6.91 + 0.75) * 256

  xls.SetColWidth(10, 10, 1934);  //(6.80 + 0.75) * 256

  xls.SetColWidth(11, 11, 1877);  //(6.58 + 0.75) * 256

  xls.SetColWidth(12, 12, 3214);  //(11.80 + 0.75) * 256

  xls.SetColWidth(13, 13, 4608);  //(17.25 + 0.75) * 256

  xls.SetColWidth(14, 14, 4494);  //(16.80 + 0.75) * 256

  xls.SetColWidth(15, 15, 5859);  //(22.14 + 0.75) * 256

  xls.SetColWidth(16, 16, 4721);  //(17.69 + 0.75) * 256

  xls.SetColWidth(17, 17, 3100);  //(11.36 + 0.75) * 256

  xls.SetColWidth(18, 18, 3356);  //(12.36 + 0.75) * 256

  xls.SetColWidth(19, 19, 6940);  //(26.36 + 0.75) * 256

  xls.SetColWidth(20, 20, 2645);  //(9.58 + 0.75) * 256

  xls.SetColWidth(21, 21, 3868);  //(14.36 + 0.75) * 256

  xls.SetColWidth(22, 22, 3043);  //(11.14 + 0.75) * 256

  xls.SetColWidth(23, 23, 3413);  //(12.58 + 0.75) * 256

  xls.SetColWidth(24, 24, 4892);  //(18.36 + 0.75) * 256

  xls.SetColWidth(25, 25, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(26, 26, 4636);  //(17.36 + 0.75) * 256

  xls.SetColWidth(27, 27, 4949);  //(18.58 + 0.75) * 256

  xls.SetColWidth(28, 28, 5802);  //(21.91 + 0.75) * 256

  xls.SetColWidth(29, 29, 4522);  //(16.91 + 0.75) * 256
  xls.DefaultRowHeight := 288;

  //Set the cell values
  fmt := xls.GetCellVisibleFormatDef(1, 1);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 1, xls.AddFormat(fmt));
  xls.SetCellValue(1, 1, 'VARLIK KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 2);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 2, xls.AddFormat(fmt));
  xls.SetCellValue(1, 2, 'VARLIK TANIMI');

  fmt := xls.GetCellVisibleFormatDef(1, 3);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 3, xls.AddFormat(fmt));
  xls.SetCellValue(1, 3, 'TAM VARLIK ADI');

  fmt := xls.GetCellVisibleFormatDef(1, 4);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.Format := '@';
  xls.SetCellFormat(1, 4, xls.AddFormat(fmt));
  xls.SetCellValue(1, 4, 'VARLIK GRUBU KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 5);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 5, xls.AddFormat(fmt));
  xls.SetCellValue(1, 5, 'DEMİRBAŞ ENV. NO.');

  fmt := xls.GetCellVisibleFormatDef(1, 6);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 6, xls.AddFormat(fmt));
  xls.SetCellValue(1, 6, 'YAZILIM KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 7);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 7, xls.AddFormat(fmt));
  xls.SetCellValue(1, 7, 'YAZILIM ADI');

  fmt := xls.GetCellVisibleFormatDef(1, 8);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 8, xls.AddFormat(fmt));
  xls.SetCellValue(1, 8, 'YAZILIM VERSİYONU');

  fmt := xls.GetCellVisibleFormatDef(1, 9);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 9, xls.AddFormat(fmt));
  xls.SetCellValue(1, 9, 'ÜRETİCİ');

  fmt := xls.GetCellVisibleFormatDef(1, 10);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 10, xls.AddFormat(fmt));
  xls.SetCellValue(1, 10, 'MARKA');

  fmt := xls.GetCellVisibleFormatDef(1, 11);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 11, xls.AddFormat(fmt));
  xls.SetCellValue(1, 11, 'MODEL');

  fmt := xls.GetCellVisibleFormatDef(1, 12);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 12, xls.AddFormat(fmt));
  xls.SetCellValue(1, 12, 'SATICI(BAYİİ)');

  fmt := xls.GetCellVisibleFormatDef(1, 13);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 13, xls.AddFormat(fmt));
  xls.SetCellValue(1, 13, 'SATINALMA TARİHİ');

  fmt := xls.GetCellVisibleFormatDef(1, 14);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 14, xls.AddFormat(fmt));
  xls.SetCellValue(1, 14, 'SATINALMA FİYATI');

  fmt := xls.GetCellVisibleFormatDef(1, 15);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 15, xls.AddFormat(fmt));
  xls.SetCellValue(1, 15, 'LİSANS BAŞLAMA TARİHİ');

  fmt := xls.GetCellVisibleFormatDef(1, 16);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 16, xls.AddFormat(fmt));
  xls.SetCellValue(1, 16, 'LİSANS BİTİŞ TARİHİ');

  fmt := xls.GetCellVisibleFormatDef(1, 17);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 17, xls.AddFormat(fmt));
  xls.SetCellValue(1, 17, 'LİSANS TİPİ');

  fmt := xls.GetCellVisibleFormatDef(1, 18);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 18, xls.AddFormat(fmt));
  xls.SetCellValue(1, 18, 'LİSANS SAYISI');

  fmt := xls.GetCellVisibleFormatDef(1, 19);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 19, xls.AddFormat(fmt));
  xls.SetCellValue(1, 19, 'LİSANS DURUMU');

  fmt := xls.GetCellVisibleFormatDef(1, 20);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 20, xls.AddFormat(fmt));
  xls.SetCellValue(1, 20, 'AÇIKLAMA');

  fmt := xls.GetCellVisibleFormatDef(1, 21);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 21, xls.AddFormat(fmt));
  xls.SetCellValue(1, 21, 'ÜRÜN KİMLİĞİ');

  fmt := xls.GetCellVisibleFormatDef(1, 22);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 22, xls.AddFormat(fmt));
  xls.SetCellValue(1, 22, 'DEPARTMAN');
  xls.SetCellValue(1, 23, 'VARLIK SAHİBİ');
  xls.SetCellValue(1, 24, 'VARLIK SAHİBİ VEKİLİ');
  xls.SetCellValue(1, 25, 'KULLANILDIĞI SÜREÇ');
  xls.SetCellValue(1, 26, 'BAKIM YÜKLENİCİ');
  xls.SetCellValue(1, 27, 'BAKIM SÖZ. BAŞ. TAR.');
  xls.SetCellValue(1, 28, 'BAKIM SÖZ. BİT. TAR');
  xls.SetCellValue(1, 29, 'BAKIM KAPSAM');
  xls.SetCellValue(2, 1, 5142);
  xls.SetCellValue(2, 2, 'AA');

  fmt := xls.GetCellVisibleFormatDef(2, 4);
  fmt.Format := '@';
  xls.SetCellFormat(2, 4, xls.AddFormat(fmt));
  xls.SetCellValue(2, 4, '1.5');

  fmt := xls.GetCellVisibleFormatDef(2, 13);
  fmt.Format := TFlxNumberFormat.RegionalDateString;
  xls.SetCellFormat(2, 13, xls.AddFormat(fmt));

  fmt := xls.GetCellVisibleFormatDef(2, 15);
  fmt.Format := TFlxNumberFormat.RegionalDateString;
  xls.SetCellFormat(2, 15, xls.AddFormat(fmt));
  xls.SetCellValue(2, 17, 'ÜCRETSİZ');
  xls.SetCellValue(2, 19, 'LİSANSLI');
  xls.SetCellValue(3, 1, 4236);
  xls.SetCellValue(3, 2, 'EE');

  fmt := xls.GetCellVisibleFormatDef(3, 4);
  fmt.Format := '@';
  xls.SetCellFormat(3, 4, xls.AddFormat(fmt));
  xls.SetCellValue(3, 4, '2.6');

  fmt := xls.GetCellVisibleFormatDef(3, 13);
  fmt.Format := TFlxNumberFormat.RegionalDateString;
  xls.SetCellFormat(3, 13, xls.AddFormat(fmt));
  xls.SetCellValue(3, 17, 'ÜCRETLİ');
  xls.SetCellValue(3, 19, 'LİSANSSIZ');
  xls.SetCellValue(4, 1, 6362);
  xls.SetCellValue(4, 2, 'UU');

  fmt := xls.GetCellVisibleFormatDef(4, 4);
  fmt.Format := '@';
  xls.SetCellFormat(4, 4, xls.AddFormat(fmt));
  xls.SetCellValue(4, 4, '2.5');

  fmt := xls.GetCellVisibleFormatDef(4, 13);
  fmt.Format := TFlxNumberFormat.RegionalDateString;
  xls.SetCellFormat(4, 13, xls.AddFormat(fmt));
  xls.SetCellValue(4, 17, 'DEMO');
  xls.SetCellValue(4, 19, 'LİSANSSIZ');

  //Freeze Panes
  xls.FreezePanes(TCellAddress.Create('A2'));

  //Cell selection and scroll position.
  xls.SelectCell(1, 1, false);
  //Standard Document Properties - Most are only for xlsx files. In xls files FlexCel will only change the Creation Date and Modified Date.
  xls.DocumentProperties.SetStandardProperty(TPropertyId.Author, 'DOGAN');


end;

procedure PersonelBilgileriTopluEklemeSablonuValid(const xls:TExcelFile) ;
var
  MajorLatin: TThemeTextFont;
  MajorEastAsian: TThemeTextFont;
  MajorComplexScript: TThemeTextFont;
  MajorFont: TThemeFont;
  MinorLatin: TThemeTextFont;
  MinorEastAsian: TThemeTextFont;
  MinorComplexScript: TThemeTextFont;
  MinorFont: TThemeFont;
  ColFmt: TFlxFormat;
  fmt: TFlxFormat;
  Validation: TDataValidationInfo;

begin
  xls.NewFile(2, TExcelFileFormat.v2016);  //Create a new Excel file with 2 sheets.

  //Set the names of the sheets
  xls.ActiveSheet := 1;
  xls.SheetName := 'Toplu Personel Ekleme Şablonu';
  xls.ActiveSheet := 2;
  xls.SheetName := 'Ayarlar';
  xls.SheetVisible := TXlsSheetVisible.Hidden;

  xls.ActiveSheet := 1;  //Set the sheet we are working in.

  //Global Workbook Options
  //Note that in xlsx files this option is ignored by FlexCel unless you also set OptionsForceUseCheckCompatibility to true. This is because Excel disables Autosave in files which have this option.
  xls.OptionsCheckCompatibility := false;

  //Sheet Options
  xls.SheetName := 'Toplu Personel Ekleme Şablonu';

  //Printer Settings
  xls.PrintXResolution := 600;
  xls.PrintYResolution := 600;
  xls.PrintOptions := [TPrintOptions.Orientation];
  xls.PrintPaperSize := TPaperSize.A4;

  //Major font
  MajorLatin := TThemeTextFont.Create('Calibri Light', '020F0302020204030204', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorEastAsian := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorComplexScript := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorFont := TThemeFont.Create(MajorLatin, MajorEastAsian, MajorComplexScript);
  MajorFont.AddFont('Jpan', 'Yu Gothic Light');
  MajorFont.AddFont('Hang', '맑은 고딕');
  MajorFont.AddFont('Hans', '等线 Light');
  MajorFont.AddFont('Hant', '新細明體');
  MajorFont.AddFont('Arab', 'Times New Roman');
  MajorFont.AddFont('Hebr', 'Times New Roman');
  MajorFont.AddFont('Thai', 'Tahoma');
  MajorFont.AddFont('Ethi', 'Nyala');
  MajorFont.AddFont('Beng', 'Vrinda');
  MajorFont.AddFont('Gujr', 'Shruti');
  MajorFont.AddFont('Khmr', 'MoolBoran');
  MajorFont.AddFont('Knda', 'Tunga');
  MajorFont.AddFont('Guru', 'Raavi');
  MajorFont.AddFont('Cans', 'Euphemia');
  MajorFont.AddFont('Cher', 'Plantagenet Cherokee');
  MajorFont.AddFont('Yiii', 'Microsoft Yi Baiti');
  MajorFont.AddFont('Tibt', 'Microsoft Himalaya');
  MajorFont.AddFont('Thaa', 'MV Boli');
  MajorFont.AddFont('Deva', 'Mangal');
  MajorFont.AddFont('Telu', 'Gautami');
  MajorFont.AddFont('Taml', 'Latha');
  MajorFont.AddFont('Syrc', 'Estrangelo Edessa');
  MajorFont.AddFont('Orya', 'Kalinga');
  MajorFont.AddFont('Mlym', 'Kartika');
  MajorFont.AddFont('Laoo', 'DokChampa');
  MajorFont.AddFont('Sinh', 'Iskoola Pota');
  MajorFont.AddFont('Mong', 'Mongolian Baiti');
  MajorFont.AddFont('Viet', 'Times New Roman');
  MajorFont.AddFont('Uigh', 'Microsoft Uighur');
  MajorFont.AddFont('Geor', 'Sylfaen');
  xls.SetThemeFont(TFontScheme.Major, MajorFont);

  //Minor font
  MinorLatin := TThemeTextFont.Create('Calibri', '020F0502020204030204', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorEastAsian := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorComplexScript := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorFont := TThemeFont.Create(MinorLatin, MinorEastAsian, MinorComplexScript);
  MinorFont.AddFont('Jpan', 'Yu Gothic');
  MinorFont.AddFont('Hang', '맑은 고딕');
  MinorFont.AddFont('Hans', '等线');
  MinorFont.AddFont('Hant', '新細明體');
  MinorFont.AddFont('Arab', 'Arial');
  MinorFont.AddFont('Hebr', 'Arial');
  MinorFont.AddFont('Thai', 'Tahoma');
  MinorFont.AddFont('Ethi', 'Nyala');
  MinorFont.AddFont('Beng', 'Vrinda');
  MinorFont.AddFont('Gujr', 'Shruti');
  MinorFont.AddFont('Khmr', 'DaunPenh');
  MinorFont.AddFont('Knda', 'Tunga');
  MinorFont.AddFont('Guru', 'Raavi');
  MinorFont.AddFont('Cans', 'Euphemia');
  MinorFont.AddFont('Cher', 'Plantagenet Cherokee');
  MinorFont.AddFont('Yiii', 'Microsoft Yi Baiti');
  MinorFont.AddFont('Tibt', 'Microsoft Himalaya');
  MinorFont.AddFont('Thaa', 'MV Boli');
  MinorFont.AddFont('Deva', 'Mangal');
  MinorFont.AddFont('Telu', 'Gautami');
  MinorFont.AddFont('Taml', 'Latha');
  MinorFont.AddFont('Syrc', 'Estrangelo Edessa');
  MinorFont.AddFont('Orya', 'Kalinga');
  MinorFont.AddFont('Mlym', 'Kartika');
  MinorFont.AddFont('Laoo', 'DokChampa');
  MinorFont.AddFont('Sinh', 'Iskoola Pota');
  MinorFont.AddFont('Mong', 'Mongolian Baiti');
  MinorFont.AddFont('Viet', 'Arial');
  MinorFont.AddFont('Uigh', 'Microsoft Uighur');
  MinorFont.AddFont('Geor', 'Sylfaen');
  xls.SetThemeFont(TFontScheme.Minor, MinorFont);

  //Set up rows and columns
  xls.SetColWidth(1, 1, 3291);  //(12.11 + 0.75) * 256

  xls.SetColWidth(2, 2, 3693);  //(13.68 + 0.75) * 256

  xls.SetColWidth(3, 3, 3949);  //(14.68 + 0.75) * 256

  xls.SetColWidth(4, 4, 5046);  //(18.96 + 0.75) * 256

  ColFmt := xls.GetFormat(xls.GetColFormat(4));
  ColFmt.Format := '@';
  xls.SetColFormat(4, 4, xls.AddFormat(ColFmt));

  xls.SetColWidth(5, 5, 5229);  //(19.68 + 0.75) * 256

  xls.SetColWidth(6, 6, 4022);  //(14.96 + 0.75) * 256

  xls.SetColWidth(7, 7, 3510);  //(12.96 + 0.75) * 256

  xls.SetColWidth(8, 8, 4425);  //(16.54 + 0.75) * 256

  xls.SetColWidth(9, 9, 2377);  //(8.54 + 0.75) * 256

  xls.SetColWidth(10, 10, 3840);  //(14.25 + 0.75) * 256

  xls.SetColWidth(11, 11, 4461);  //(16.68 + 0.75) * 256

  xls.SetColWidth(12, 12, 2633);  //(9.54 + 0.75) * 256

  xls.SetColWidth(13, 13, 3547);  //(13.11 + 0.75) * 256

  xls.SetColWidth(14, 14, 3035);  //(11.11 + 0.75) * 256

  xls.SetColWidth(15, 15, 3401);  //(12.54 + 0.75) * 256

  xls.SetColWidth(16, 16, 4900);  //(18.39 + 0.75) * 256

  xls.SetColWidth(17, 17, 4790);  //(17.96 + 0.75) * 256

  //Set the cell values
  fmt := xls.GetCellVisibleFormatDef(1, 1);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 1, xls.AddFormat(fmt));
  xls.SetCellValue(1, 1, 'VARLIK KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 2);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 2, xls.AddFormat(fmt));
  xls.SetCellValue(1, 2, 'VARLIK TANIMI');

  fmt := xls.GetCellVisibleFormatDef(1, 3);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 3, xls.AddFormat(fmt));
  xls.SetCellValue(1, 3, 'TAM VARLIK ADI');

  fmt := xls.GetCellVisibleFormatDef(1, 4);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.Format := '@';
  xls.SetCellFormat(1, 4, xls.AddFormat(fmt));
  xls.SetCellValue(1, 4, 'VARLIK GRUBU KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 5);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 5, xls.AddFormat(fmt));
  xls.SetCellValue(1, 5, 'KİMLİK NO / SİCİL NO');

  fmt := xls.GetCellVisibleFormatDef(1, 6);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 6, xls.AddFormat(fmt));
  xls.SetCellValue(1, 6, 'PERSONEL KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 7);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 7, xls.AddFormat(fmt));
  xls.SetCellValue(1, 7, 'PERSONEL ADI');

  fmt := xls.GetCellVisibleFormatDef(1, 8);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 8, xls.AddFormat(fmt));
  xls.SetCellValue(1, 8, 'PERSONEL SOYADI');

  fmt := xls.GetCellVisibleFormatDef(1, 9);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 9, xls.AddFormat(fmt));
  xls.SetCellValue(1, 9, 'KONUMU');

  fmt := xls.GetCellVisibleFormatDef(1, 10);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 10, xls.AddFormat(fmt));
  xls.SetCellValue(1, 10, 'İŞE GİRİŞ TARİHİ');

  fmt := xls.GetCellVisibleFormatDef(1, 11);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 11, xls.AddFormat(fmt));
  xls.SetCellValue(1, 11, 'İŞTEN ÇIKIŞ TARİHİ');

  fmt := xls.GetCellVisibleFormatDef(1, 12);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 12, xls.AddFormat(fmt));
  xls.SetCellValue(1, 12, 'AÇIKLAMA');

  fmt := xls.GetCellVisibleFormatDef(1, 13);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 13, xls.AddFormat(fmt));
  xls.SetCellValue(1, 13, 'PERSONEL TİPİ');

  fmt := xls.GetCellVisibleFormatDef(1, 14);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 14, xls.AddFormat(fmt));
  xls.SetCellValue(1, 14, 'DEPARTMAN');

  fmt := xls.GetCellVisibleFormatDef(1, 15);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 15, xls.AddFormat(fmt));
  xls.SetCellValue(1, 15, 'VARLIK SAHİBİ');

  fmt := xls.GetCellVisibleFormatDef(1, 16);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 16, xls.AddFormat(fmt));
  xls.SetCellValue(1, 16, 'VARLIK SAHİBİ VEKİLİ');

  fmt := xls.GetCellVisibleFormatDef(1, 17);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 17, xls.AddFormat(fmt));
  xls.SetCellValue(1, 17, 'KULLANILDIĞI SÜREÇ');

  fmt := xls.GetCellVisibleFormatDef(2, 4);
  fmt.Format := '@';
  xls.SetCellFormat(2, 4, xls.AddFormat(fmt));
  xls.SetCellValue(2, 4, '1.2');

  fmt := xls.GetCellVisibleFormatDef(2, 10);
  fmt.Format := TFlxNumberFormat.RegionalDateString;
  xls.SetCellFormat(2, 10, xls.AddFormat(fmt));
  xls.SetCellValue(2, 10, TFlxDateTime.ToOADate(EncodeDate(2022, 1, 1), xls.OptionsDates1904));

  fmt := xls.GetCellVisibleFormatDef(2, 11);
  fmt.Format := TFlxNumberFormat.RegionalDateString;
  xls.SetCellFormat(2, 11, xls.AddFormat(fmt));
  xls.SetCellValue(2, 11, TFlxDateTime.ToOADate(EncodeDate(2022, 1, 1), xls.OptionsDates1904));

  //Data Validation

  Validation := TDataValidationInfo.Empty;
    Validation.ValidationType := TDataValidationDataType.List;
    Validation.FirstFormula := '=Ayarlar!$A$2:$A$1048576';
    Validation.IgnoreEmptyCells := true;
    Validation.InCellDropDown := true;
    Validation.ShowErrorBox := true;
    Validation.ShowInputBox := true;
  xls.AddDataValidation(TXlsCellRange.Create(2, 4, 1048576, 4), Validation);

  Validation := TDataValidationInfo.Empty;
    Validation.ValidationType := TDataValidationDataType.List;
    Validation.FirstFormula := '=Ayarlar!$B$2:$B$1048576';
    Validation.IgnoreEmptyCells := true;
    Validation.InCellDropDown := true;
    Validation.ShowErrorBox := true;
    Validation.ShowInputBox := true;
  xls.AddDataValidation(TXlsCellRange.Create(2, 13, 1048576, 13), Validation);

  Validation := TDataValidationInfo.Empty;
    Validation.ValidationType := TDataValidationDataType.List;
    Validation.FirstFormula := '=Ayarlar!$C$2:$C$1048576';
    Validation.IgnoreEmptyCells := true;
    Validation.InCellDropDown := true;
    Validation.ShowErrorBox := true;
    Validation.ShowInputBox := true;
  xls.AddDataValidation(TXlsCellRange.Create(2, 14, 1048576, 14), Validation);

  //Freeze Panes
  xls.FreezePanes(TCellAddress.Create('A2'));

  //Cell selection and scroll position.
  xls.SelectCell(2, 1, false);


  xls.ActiveSheet := 2;  //Set the sheet we are working in.

  //Sheet Options
  xls.SheetName := 'Ayarlar';

  //Set up rows and columns
  xls.SetColWidth(1, 1, 7460);  //(28.39 + 0.75) * 256

  xls.SetColWidth(2, 2, 5485);  //(20.68 + 0.75) * 256

  xls.SetColWidth(3, 3, 8923);  //(34.11 + 0.75) * 256

  //Set the cell values
  fmt := xls.GetCellVisibleFormatDef(1, 1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 162;
  xls.SetCellFormat(1, 1, xls.AddFormat(fmt));
  xls.SetCellValue(1, 1, 'VARLIK GRUP KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 2);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 162;
  xls.SetCellFormat(1, 2, xls.AddFormat(fmt));
  xls.SetCellValue(1, 2, 'PERSONEL TİPİ');

  fmt := xls.GetCellVisibleFormatDef(1, 3);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 162;
  xls.SetCellFormat(1, 3, xls.AddFormat(fmt));
  xls.SetCellValue(1, 3, 'DEPARTMAN');


 var  Query : TUniQuery;
 var  I : INTEGER;
  query := TUniQuery.Create(nil);
  try
  Query.Connection := MainMod.DBMain;
  QueryOpen(Query,'SELECT    gr_code||'' - ''|| gr_name code 	FROM  def_data_assetgroup where main_id>0 and mc_id = ' + inttostr(mainmod.mcid) +
  '  and id= any(string_to_array('+ QuotedStr(mainmod.LoginInfo.AssetGroups) + ', '','')::int[]) order by code') ;
  if  not Query.IsEmpty then
    begin
      I := 1;
      Query.First;
      while not query.Eof do
      begin
        xls.SetCellValue(I+1, 1, Query.FieldByName('code').AsString);
        inc(I);
        Query.Next;
      end;

    end;

    QueryOpen(Query,
     ' SELECT staff_typename code FROM def_data_staff_type WHERE staff_typename<>'''' and mc_id = '+ inttostr(mainmod.mcid) +
     ' order by staff_typename ');
  if  not Query.IsEmpty then
    begin
      I := 1;
      Query.First;
      while not query.Eof do
      begin
        xls.SetCellValue(I+1, 2, Query.FieldByName('code').AsString);
        inc(I);
        Query.Next;
      end;

    end;

     QueryOpen(Query,
     ' SELECT distinct title code FROM sys_deptdef where mc_id = ' + inttostr(mainmod.mcid) +
     '  and id= any(string_to_array('+ QuotedStr(mainmod.LoginInfo.Departments) + ', '','')::int[]) ' +
     ' order by 1 '  );
    if  not Query.IsEmpty then
    begin
      I := 1;
      Query.First;
      while not query.Eof do
      begin
        xls.SetCellValue(I+1, 3, Query.FieldByName('code').AsString);
        inc(I);
        Query.Next;
      end;
    end ;

  finally
    if assigned(query) then
      FreeAndNil(query);
  end;

  //Cell selection and scroll position.
  xls.ActiveSheet := 1;  //Set the sheet we are working in.
  xls.SelectCell(1, 1, false);


  //Standard Document Properties - Most are only for xlsx files. In xls files FlexCel will only change the Creation Date and Modified Date.
  xls.DocumentProperties.SetStandardProperty(TPropertyId.Author, 'Doğan');


end;

procedure PersonelBilgileriTopluEklemeSablonu(const xls:TExcelFile) ;
var
  MajorLatin: TThemeTextFont;
  MajorEastAsian: TThemeTextFont;
  MajorComplexScript: TThemeTextFont;
  MajorFont: TThemeFont;
  MinorLatin: TThemeTextFont;
  MinorEastAsian: TThemeTextFont;
  MinorComplexScript: TThemeTextFont;
  MinorFont: TThemeFont;
  ColFmt: TFlxFormat;
  fmt: TFlxFormat;

begin
  xls.NewFile(1, TExcelFileFormat.v2016);  //Create a new Excel file with 1 sheet.

  //Set the names of the sheets
  xls.ActiveSheet := 1;
  xls.SheetName := 'Sayfa1';

  xls.ActiveSheet := 1;  //Set the sheet we are working in.

  //Global Workbook Options
  //Note that in xlsx files this option is ignored by FlexCel unless you also set OptionsForceUseCheckCompatibility to true. This is because Excel disables Autosave in files which have this option.
  xls.OptionsCheckCompatibility := false;

  //Sheet Options
  xls.SheetName := 'Sayfa1';

  //Printer Settings
  xls.PrintXResolution := 600;
  xls.PrintYResolution := 600;
  xls.PrintOptions := [TPrintOptions.Orientation];
  xls.PrintPaperSize := TPaperSize.A4;

  //Printer Driver Settings are a blob of data specific to a printer
  //This code is commented by default because normally you do not want to hard code the printer settings of a specific printer.
  //var PrinterData: TArray<byte>;
  //  PrinterData := TArray<byte>.Create(
  //    $00, $00, $46, $00, $53, $00, $2D, $00, $43, $00, $38, $00, $35, $00, $32, $00, $30, $00, $4D, $00, $46, $00, $50, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $04, $03, $06, $DC, $00, $C0, $04, $03, $BF, $00, $02, $01, $00, $09, $00, $9A, $0B, $34, $08, $64, $00, $01, $00, $0F, $00, $58, $02, $02, $00, $01, $00, $58, $02,
  //    $03, $00, $01, $00, $41, $00, $34, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $02, $00, $00, $00, $01, $00,
  //    $00, $00, $FF, $FF, $FF, $FF, $47, $49, $53, $34, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $44, $49, $4E, $55, $22, $00, $48, $02, $A4, $04, $1C, $00, $5F, $A0, $63, $E0, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $14, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $01, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $48, $02, $00, $00, $53, $4D, $54, $4A, $00, $00, $00, $00, $10, $00, $38, $02, $7B, $00, $32, $00, $37, $00, $32, $00,
  //    $30, $00, $37, $00, $32, $00, $38, $00, $32, $00, $2D, $00, $37, $00, $64, $00, $39, $00, $61, $00, $2D, $00, $34, $00, $64, $00, $66, $00, $64, $00, $2D, $00, $39, $00, $38, $00, $35, $00, $30, $00, $2D, $00, $38, $00, $31, $00, $66, $00, $34, $00,
  //    $37, $00, $39, $00, $65, $00, $31, $00, $64, $00, $63, $00, $66, $00, $33, $00, $7D, $00, $00, $00, $49, $6E, $70, $75, $74, $42, $69, $6E, $00, $46, $4F, $52, $4D, $53, $4F, $55, $52, $43, $45, $00, $52, $45, $53, $44, $4C, $4C, $00, $55, $6E, $69,
  //    $72, $65, $73, $44, $4C, $4C, $00, $4A, $6F, $62, $45, $63, $6F, $50, $72, $69, $6E, $74, $00, $4F, $66, $66, $00, $4A, $6F, $62, $47, $6C, $6F, $73, $73, $4D, $6F, $64, $65, $00, $4F, $66, $66, $00, $4A, $6F, $62, $43, $6F, $6C, $6F, $72, $43, $6F,
  //    $72, $72, $65, $63, $74, $69, $6F, $6E, $00, $50, $72, $69, $6E, $74, $65, $72, $53, $65, $74, $74, $69, $6E, $67, $73, $00, $4F, $75, $74, $70, $75, $74, $42, $69, $6E, $00, $44, $65, $73, $74, $50, $72, $69, $6E, $74, $65, $72, $44, $65, $66, $61,
  //    $75, $6C, $74, $00, $4A, $6F, $62, $48, $6F, $6C, $65, $50, $75, $6E, $63, $68, $00, $4E, $6F, $6E, $65, $00, $4A, $6F, $62, $53, $74, $61, $70, $6C, $65, $41, $6C, $6C, $44, $6F, $63, $75, $6D, $65, $6E, $74, $73, $00, $4E, $6F, $6E, $65, $00, $4A,
  //    $6F, $62, $53, $74, $61, $70, $6C, $65, $43, $6F, $75, $6E, $74, $00, $4E, $6F, $6E, $65, $00, $4A, $6F, $62, $53, $74, $6F, $72, $61, $67, $65, $00, $4E, $6F, $6E, $65, $00, $4A, $6F, $62, $53, $74, $6F, $72, $61, $67, $65, $55, $73, $65, $72, $49,
  //    $44, $00, $55, $73, $65, $72, $49, $44, $5F, $31, $00, $4A, $6F, $62, $41, $63, $63, $6F, $75, $6E, $74, $69, $6E, $67, $00, $4E, $6F, $6E, $65, $00, $4F, $72, $69, $65, $6E, $74, $61, $74, $69, $6F, $6E, $00, $50, $4F, $52, $54, $52, $41, $49, $54,
  //    $00, $44, $75, $70, $6C, $65, $78, $00, $4E, $4F, $4E, $45, $00, $4D, $65, $64, $69, $61, $54, $79, $70, $65, $00, $55, $6E, $73, $70, $65, $63, $69, $66, $69, $65, $64, $00, $52, $65, $73, $6F, $6C, $75, $74, $69, $6F, $6E, $00, $52, $65, $73, $6F,
  //    $6C, $75, $74, $69, $6F, $6E, $36, $30, $30, $00, $48, $61, $6C, $66, $74, $6F, $6E, $65, $00, $48, $54, $5F, $50, $41, $54, $53, $49, $5A, $45, $5F, $41, $55, $54, $4F, $00, $43, $6F, $6C, $6F, $72, $4D, $6F, $64, $65, $00, $43, $6F, $6C, $6F, $72,
  //    $00, $50, $61, $70, $65, $72, $53, $69, $7A, $65, $00, $45, $4E, $56, $5F, $4D, $4F, $4E, $41, $52, $43, $48, $00, $43, $6F, $6C, $6C, $61, $74, $65, $00, $4F, $46, $46, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $1C, $00, $00, $00, $56, $34, $44, $4D, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
  //  );
  //var PrinterDriverSettings: TPrinterDriverSettings;
  //  PrinterDriverSettings := TPrinterDriverSettings.Create(PrinterData);
  //  xls.SetPrinterDriverSettings(PrinterDriverSettings);

  //Major font
  MajorLatin := TThemeTextFont.Create('Calibri Light', '020F0302020204030204', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorEastAsian := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorComplexScript := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorFont := TThemeFont.Create(MajorLatin, MajorEastAsian, MajorComplexScript);
  MajorFont.AddFont('Jpan', 'Yu Gothic Light');
  MajorFont.AddFont('Hang', '맑은 고딕');
  MajorFont.AddFont('Hans', '等线 Light');
  MajorFont.AddFont('Hant', '新細明體');
  MajorFont.AddFont('Arab', 'Times New Roman');
  MajorFont.AddFont('Hebr', 'Times New Roman');
  MajorFont.AddFont('Thai', 'Tahoma');
  MajorFont.AddFont('Ethi', 'Nyala');
  MajorFont.AddFont('Beng', 'Vrinda');
  MajorFont.AddFont('Gujr', 'Shruti');
  MajorFont.AddFont('Khmr', 'MoolBoran');
  MajorFont.AddFont('Knda', 'Tunga');
  MajorFont.AddFont('Guru', 'Raavi');
  MajorFont.AddFont('Cans', 'Euphemia');
  MajorFont.AddFont('Cher', 'Plantagenet Cherokee');
  MajorFont.AddFont('Yiii', 'Microsoft Yi Baiti');
  MajorFont.AddFont('Tibt', 'Microsoft Himalaya');
  MajorFont.AddFont('Thaa', 'MV Boli');
  MajorFont.AddFont('Deva', 'Mangal');
  MajorFont.AddFont('Telu', 'Gautami');
  MajorFont.AddFont('Taml', 'Latha');
  MajorFont.AddFont('Syrc', 'Estrangelo Edessa');
  MajorFont.AddFont('Orya', 'Kalinga');
  MajorFont.AddFont('Mlym', 'Kartika');
  MajorFont.AddFont('Laoo', 'DokChampa');
  MajorFont.AddFont('Sinh', 'Iskoola Pota');
  MajorFont.AddFont('Mong', 'Mongolian Baiti');
  MajorFont.AddFont('Viet', 'Times New Roman');
  MajorFont.AddFont('Uigh', 'Microsoft Uighur');
  MajorFont.AddFont('Geor', 'Sylfaen');
  xls.SetThemeFont(TFontScheme.Major, MajorFont);

  //Minor font
  MinorLatin := TThemeTextFont.Create('Calibri', '020F0502020204030204', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorEastAsian := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorComplexScript := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorFont := TThemeFont.Create(MinorLatin, MinorEastAsian, MinorComplexScript);
  MinorFont.AddFont('Jpan', 'Yu Gothic');
  MinorFont.AddFont('Hang', '맑은 고딕');
  MinorFont.AddFont('Hans', '等线');
  MinorFont.AddFont('Hant', '新細明體');
  MinorFont.AddFont('Arab', 'Arial');
  MinorFont.AddFont('Hebr', 'Arial');
  MinorFont.AddFont('Thai', 'Tahoma');
  MinorFont.AddFont('Ethi', 'Nyala');
  MinorFont.AddFont('Beng', 'Vrinda');
  MinorFont.AddFont('Gujr', 'Shruti');
  MinorFont.AddFont('Khmr', 'DaunPenh');
  MinorFont.AddFont('Knda', 'Tunga');
  MinorFont.AddFont('Guru', 'Raavi');
  MinorFont.AddFont('Cans', 'Euphemia');
  MinorFont.AddFont('Cher', 'Plantagenet Cherokee');
  MinorFont.AddFont('Yiii', 'Microsoft Yi Baiti');
  MinorFont.AddFont('Tibt', 'Microsoft Himalaya');
  MinorFont.AddFont('Thaa', 'MV Boli');
  MinorFont.AddFont('Deva', 'Mangal');
  MinorFont.AddFont('Telu', 'Gautami');
  MinorFont.AddFont('Taml', 'Latha');
  MinorFont.AddFont('Syrc', 'Estrangelo Edessa');
  MinorFont.AddFont('Orya', 'Kalinga');
  MinorFont.AddFont('Mlym', 'Kartika');
  MinorFont.AddFont('Laoo', 'DokChampa');
  MinorFont.AddFont('Sinh', 'Iskoola Pota');
  MinorFont.AddFont('Mong', 'Mongolian Baiti');
  MinorFont.AddFont('Viet', 'Arial');
  MinorFont.AddFont('Uigh', 'Microsoft Uighur');
  MinorFont.AddFont('Geor', 'Sylfaen');
  xls.SetThemeFont(TFontScheme.Minor, MinorFont);

  //Set up rows and columns
  xls.SetColWidth(1, 1, 3291);  //(12.11 + 0.75) * 256

  xls.SetColWidth(2, 2, 3693);  //(13.68 + 0.75) * 256

  xls.SetColWidth(3, 3, 3949);  //(14.68 + 0.75) * 256

  xls.SetColWidth(4, 4, 5046);  //(18.96 + 0.75) * 256

  ColFmt := xls.GetFormat(xls.GetColFormat(4));
  ColFmt.Format := '@';
  xls.SetColFormat(4, 4, xls.AddFormat(ColFmt));

  xls.SetColWidth(5, 5, 3474);  //(12.82 + 0.75) * 256

  xls.SetColWidth(6, 6, 4022);  //(14.96 + 0.75) * 256

  xls.SetColWidth(7, 7, 3510);  //(12.96 + 0.75) * 256

  xls.SetColWidth(8, 8, 4425);  //(16.54 + 0.75) * 256

  xls.SetColWidth(9, 9, 2377);  //(8.54 + 0.75) * 256

  xls.SetColWidth(10, 10, 3840);  //(14.25 + 0.75) * 256

  xls.SetColWidth(11, 11, 4461);  //(16.68 + 0.75) * 256

  xls.SetColWidth(12, 12, 2633);  //(9.54 + 0.75) * 256

  xls.SetColWidth(13, 13, 3547);  //(13.11 + 0.75) * 256

  xls.SetColWidth(14, 14, 3035);  //(11.11 + 0.75) * 256

  xls.SetColWidth(15, 15, 3401);  //(12.54 + 0.75) * 256

  xls.SetColWidth(16, 16, 4900);  //(18.39 + 0.75) * 256

  xls.SetColWidth(17, 17, 4790);  //(17.96 + 0.75) * 256

  //Set the cell values
  fmt := xls.GetCellVisibleFormatDef(1, 1);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 1, xls.AddFormat(fmt));
  xls.SetCellValue(1, 1, 'VARLIK KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 2);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 2, xls.AddFormat(fmt));
  xls.SetCellValue(1, 2, 'VARLIK TANIMI');

  fmt := xls.GetCellVisibleFormatDef(1, 3);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 3, xls.AddFormat(fmt));
  xls.SetCellValue(1, 3, 'TAM VARLIK ADI');

  fmt := xls.GetCellVisibleFormatDef(1, 4);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.Format := '@';
  xls.SetCellFormat(1, 4, xls.AddFormat(fmt));
  xls.SetCellValue(1, 4, 'VARLIK GRUBU KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 5);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 5, xls.AddFormat(fmt));
  xls.SetCellValue(1, 5, 'KİMLİK/PASAPORT NO');

  fmt := xls.GetCellVisibleFormatDef(1, 6);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 6, xls.AddFormat(fmt));
  xls.SetCellValue(1, 6, 'PERSONEL KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 7);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 7, xls.AddFormat(fmt));
  xls.SetCellValue(1, 7, 'PERSONEL ADI');

  fmt := xls.GetCellVisibleFormatDef(1, 8);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 8, xls.AddFormat(fmt));
  xls.SetCellValue(1, 8, 'PERSONEL SOYADI');

  fmt := xls.GetCellVisibleFormatDef(1, 9);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 9, xls.AddFormat(fmt));
  xls.SetCellValue(1, 9, 'KONUMU');

  fmt := xls.GetCellVisibleFormatDef(1, 10);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 10, xls.AddFormat(fmt));
  xls.SetCellValue(1, 10, 'İŞE GİRİŞ TARİHİ');

  fmt := xls.GetCellVisibleFormatDef(1, 11);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 11, xls.AddFormat(fmt));
  xls.SetCellValue(1, 11, 'İŞTEN ÇIKIŞ TARİHİ');

  fmt := xls.GetCellVisibleFormatDef(1, 12);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 12, xls.AddFormat(fmt));
  xls.SetCellValue(1, 12, 'AÇIKLAMA');

  fmt := xls.GetCellVisibleFormatDef(1, 13);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 13, xls.AddFormat(fmt));
  xls.SetCellValue(1, 13, 'PERSONEL TİPİ');

  fmt := xls.GetCellVisibleFormatDef(1, 14);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 14, xls.AddFormat(fmt));
  xls.SetCellValue(1, 14, 'DEPARTMAN');

  fmt := xls.GetCellVisibleFormatDef(1, 15);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 15, xls.AddFormat(fmt));
  xls.SetCellValue(1, 15, 'VARLIK SAHİBİ');

  fmt := xls.GetCellVisibleFormatDef(1, 16);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 16, xls.AddFormat(fmt));
  xls.SetCellValue(1, 16, 'VARLIK SAHİBİ VEKİLİ');

  fmt := xls.GetCellVisibleFormatDef(1, 17);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 17, xls.AddFormat(fmt));
  xls.SetCellValue(1, 17, 'KULLANILDIĞI SÜREÇ');

  fmt := xls.GetCellVisibleFormatDef(2, 4);
  fmt.Format := '@';
  xls.SetCellFormat(2, 4, xls.AddFormat(fmt));
  xls.SetCellValue(2, 4, '1.2');

  fmt := xls.GetCellVisibleFormatDef(2, 10);
  fmt.Format := TFlxNumberFormat.RegionalDateString;
  xls.SetCellFormat(2, 10, xls.AddFormat(fmt));
  xls.SetCellValue(2, 10, TFlxDateTime.ToOADate(EncodeDate(2022, 1, 1), xls.OptionsDates1904));

  fmt := xls.GetCellVisibleFormatDef(2, 11);
  fmt.Format := TFlxNumberFormat.RegionalDateString;
  xls.SetCellFormat(2, 11, xls.AddFormat(fmt));
  xls.SetCellValue(2, 11, TFlxDateTime.ToOADate(EncodeDate(2022, 1, 1), xls.OptionsDates1904));

  //Freeze Panes
  xls.FreezePanes(TCellAddress.Create('A2'));

  //Cell selection and scroll position.
  xls.SelectCell(1, 1, false);

  //Standard Document Properties - Most are only for xlsx files. In xls files FlexCel will only change the Creation Date and Modified Date.
  xls.DocumentProperties.SetStandardProperty(TPropertyId.Author, 'Doğan');

end;

procedure SistemBilgileriTopluEklemeSablonuValid(const xls:TExcelFile) ;
var
  MajorLatin: TThemeTextFont;
  MajorEastAsian: TThemeTextFont;
  MajorComplexScript: TThemeTextFont;
  MajorFont: TThemeFont;
  MinorLatin: TThemeTextFont;
  MinorEastAsian: TThemeTextFont;
  MinorComplexScript: TThemeTextFont;
  MinorFont: TThemeFont;
  fmt: TFlxFormat;
  Validation: TDataValidationInfo;

begin
  xls.NewFile(2, TExcelFileFormat.v2016);  //Create a new Excel file with 2 sheets.

  //Set the names of the sheets
  xls.ActiveSheet := 1;
  xls.SheetName := 'Toplu Sistem Ekleme Şablonu ';
  xls.ActiveSheet := 2;
  xls.SheetName := 'Ayarlar';
  xls.SheetVisible := TXlsSheetVisible.Hidden;

  xls.ActiveSheet := 1;  //Set the sheet we are working in.

  //Global Workbook Options
  //Note that in xlsx files this option is ignored by FlexCel unless you also set OptionsForceUseCheckCompatibility to true. This is because Excel disables Autosave in files which have this option.
  xls.OptionsCheckCompatibility := false;

  //This setting is only needed if you have names that refer to other names in the wrong order.
  xls.AllowEnteringUnknownFunctionsAndNames := true;

  //Sheet Options
  xls.SheetName := 'Toplu Sistem Ekleme Şablonu ';

  //Major font
  MajorLatin := TThemeTextFont.Create('Calibri Light', '020F0302020204030204', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorEastAsian := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorComplexScript := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorFont := TThemeFont.Create(MajorLatin, MajorEastAsian, MajorComplexScript);
  MajorFont.AddFont('Jpan', 'Yu Gothic Light');
  MajorFont.AddFont('Hang', '맑은 고딕');
  MajorFont.AddFont('Hans', '等线 Light');
  MajorFont.AddFont('Hant', '新細明體');
  MajorFont.AddFont('Arab', 'Times New Roman');
  MajorFont.AddFont('Hebr', 'Times New Roman');
  MajorFont.AddFont('Thai', 'Tahoma');
  MajorFont.AddFont('Ethi', 'Nyala');
  MajorFont.AddFont('Beng', 'Vrinda');
  MajorFont.AddFont('Gujr', 'Shruti');
  MajorFont.AddFont('Khmr', 'MoolBoran');
  MajorFont.AddFont('Knda', 'Tunga');
  MajorFont.AddFont('Guru', 'Raavi');
  MajorFont.AddFont('Cans', 'Euphemia');
  MajorFont.AddFont('Cher', 'Plantagenet Cherokee');
  MajorFont.AddFont('Yiii', 'Microsoft Yi Baiti');
  MajorFont.AddFont('Tibt', 'Microsoft Himalaya');
  MajorFont.AddFont('Thaa', 'MV Boli');
  MajorFont.AddFont('Deva', 'Mangal');
  MajorFont.AddFont('Telu', 'Gautami');
  MajorFont.AddFont('Taml', 'Latha');
  MajorFont.AddFont('Syrc', 'Estrangelo Edessa');
  MajorFont.AddFont('Orya', 'Kalinga');
  MajorFont.AddFont('Mlym', 'Kartika');
  MajorFont.AddFont('Laoo', 'DokChampa');
  MajorFont.AddFont('Sinh', 'Iskoola Pota');
  MajorFont.AddFont('Mong', 'Mongolian Baiti');
  MajorFont.AddFont('Viet', 'Times New Roman');
  MajorFont.AddFont('Uigh', 'Microsoft Uighur');
  MajorFont.AddFont('Geor', 'Sylfaen');
  xls.SetThemeFont(TFontScheme.Major, MajorFont);

  //Minor font
  MinorLatin := TThemeTextFont.Create('Calibri', '020F0502020204030204', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorEastAsian := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorComplexScript := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorFont := TThemeFont.Create(MinorLatin, MinorEastAsian, MinorComplexScript);
  MinorFont.AddFont('Jpan', 'Yu Gothic');
  MinorFont.AddFont('Hang', '맑은 고딕');
  MinorFont.AddFont('Hans', '等线');
  MinorFont.AddFont('Hant', '新細明體');
  MinorFont.AddFont('Arab', 'Arial');
  MinorFont.AddFont('Hebr', 'Arial');
  MinorFont.AddFont('Thai', 'Tahoma');
  MinorFont.AddFont('Ethi', 'Nyala');
  MinorFont.AddFont('Beng', 'Vrinda');
  MinorFont.AddFont('Gujr', 'Shruti');
  MinorFont.AddFont('Khmr', 'DaunPenh');
  MinorFont.AddFont('Knda', 'Tunga');
  MinorFont.AddFont('Guru', 'Raavi');
  MinorFont.AddFont('Cans', 'Euphemia');
  MinorFont.AddFont('Cher', 'Plantagenet Cherokee');
  MinorFont.AddFont('Yiii', 'Microsoft Yi Baiti');
  MinorFont.AddFont('Tibt', 'Microsoft Himalaya');
  MinorFont.AddFont('Thaa', 'MV Boli');
  MinorFont.AddFont('Deva', 'Mangal');
  MinorFont.AddFont('Telu', 'Gautami');
  MinorFont.AddFont('Taml', 'Latha');
  MinorFont.AddFont('Syrc', 'Estrangelo Edessa');
  MinorFont.AddFont('Orya', 'Kalinga');
  MinorFont.AddFont('Mlym', 'Kartika');
  MinorFont.AddFont('Laoo', 'DokChampa');
  MinorFont.AddFont('Sinh', 'Iskoola Pota');
  MinorFont.AddFont('Mong', 'Mongolian Baiti');
  MinorFont.AddFont('Viet', 'Arial');
  MinorFont.AddFont('Uigh', 'Microsoft Uighur');
  MinorFont.AddFont('Geor', 'Sylfaen');
  xls.SetThemeFont(TFontScheme.Minor, MinorFont);

  //Set up rows and columns
  xls.DefaultColWidth := 2332;

  xls.SetColWidth(1, 1, 3299);  //(12.14 + 0.75) * 256

  xls.SetColWidth(2, 2, 3697);  //(13.69 + 0.75) * 256

  xls.SetColWidth(3, 3, 3953);  //(14.69 + 0.75) * 256

  xls.SetColWidth(4, 4, 6229);  //(23.58 + 0.75) * 256

  xls.SetColWidth(5, 5, 5205);  //(19.58 + 0.75) * 256

  xls.SetColWidth(6, 6, 3413);  //(12.58 + 0.75) * 256

  xls.SetColWidth(7, 7, 4892);  //(18.36 + 0.75) * 256

  xls.SetColWidth(8, 8, 4778);  //(17.91 + 0.75) * 256
  xls.DefaultRowHeight := 288;

  //Set the cell values
  fmt := xls.GetCellVisibleFormatDef(1, 1);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 1, xls.AddFormat(fmt));
  xls.SetCellValue(1, 1, 'VARLIK KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 2);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 2, xls.AddFormat(fmt));
  xls.SetCellValue(1, 2, 'VARLIK TANIMI');

  fmt := xls.GetCellVisibleFormatDef(1, 3);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 3, xls.AddFormat(fmt));
  xls.SetCellValue(1, 3, 'TAM VARLIK ADI');

  fmt := xls.GetCellVisibleFormatDef(1, 4);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 4, xls.AddFormat(fmt));
  xls.SetCellValue(1, 4, 'VARLIK GRUBU KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 5);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 5, xls.AddFormat(fmt));
  xls.SetCellValue(1, 5, 'DEPARTMAN');

  fmt := xls.GetCellVisibleFormatDef(1, 6);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 6, xls.AddFormat(fmt));
  xls.SetCellValue(1, 6, 'VARLIK SAHİBİ');

  fmt := xls.GetCellVisibleFormatDef(1, 7);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 7, xls.AddFormat(fmt));
  xls.SetCellValue(1, 7, 'VARLIK SAHİBİ VEKİLİ');

  fmt := xls.GetCellVisibleFormatDef(1, 8);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 8, xls.AddFormat(fmt));
  xls.SetCellValue(1, 8, 'KULLANILDIĞI SÜREÇ');
  xls.SetCellValue(2, 1, 11);
  xls.SetCellValue(2, 2, 'aaa');
  xls.SetCellValue(2, 3, 'aa');

  //Data Validation

  Validation := TDataValidationInfo.Empty;
    Validation.ValidationType := TDataValidationDataType.List;
    Validation.FirstFormula := '=Ayarlar!$A$2:$A$1048576';
    Validation.IgnoreEmptyCells := true;
    Validation.InCellDropDown := true;
    Validation.ShowErrorBox := true;
    Validation.ShowInputBox := true;
  xls.AddDataValidation(TXlsCellRange.Create(2, 4, 1048576, 4), Validation);

  Validation := TDataValidationInfo.Empty;
    Validation.ValidationType := TDataValidationDataType.List;
    Validation.FirstFormula := '=Ayarlar!$B$2:$B$1048576';
    Validation.IgnoreEmptyCells := true;
    Validation.InCellDropDown := true;
    Validation.ShowErrorBox := true;
    Validation.ShowInputBox := true;
  xls.AddDataValidation(TXlsCellRange.Create(2, 5, 1048576, 5), Validation);

  //Freeze Panes
  xls.FreezePanes(TCellAddress.Create('A2'));

  //Cell selection and scroll position.
  xls.SelectCell(2, 3, false);


  xls.ActiveSheet := 2;  //Set the sheet we are working in.

  //Sheet Options
  xls.SheetName := 'Ayarlar';

  //Set up rows and columns
  xls.DefaultColWidth := 2340;

  xls.SetColWidth(1, 1, 6058);  //(22.91 + 0.75) * 256

  xls.SetColWidth(2, 2, 7111);  //(27.03 + 0.75) * 256

    //Set the cell values
  fmt := xls.GetCellVisibleFormatDef(1, 1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 162;
  xls.SetCellFormat(1, 1, xls.AddFormat(fmt));
  xls.SetCellValue(1, 1, 'VARLIK GRUP KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 2);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 162;
  xls.SetCellFormat(1, 2, xls.AddFormat(fmt));
  xls.SetCellValue(1, 2, 'DEPARTMAN');

 var  Query : TUniQuery;
 var  I : INTEGER;
  query := TUniQuery.Create(nil);
  try
  Query.Connection := MainMod.DBMain;
  QueryOpen(Query,'SELECT    gr_code||'' - ''|| gr_name code 	FROM  def_data_assetgroup where main_id>0 and mc_id = ' + inttostr(mainmod.mcid) +
  '  and id= any(string_to_array('+ QuotedStr(mainmod.LoginInfo.AssetGroups) + ', '','')::int[]) order by code') ;
  if  not Query.IsEmpty then
    begin
      I := 1;
      Query.First;
      while not query.Eof do
      begin
        xls.SetCellValue(I+1, 1, Query.FieldByName('code').AsString);
        inc(I);
        Query.Next;
      end;

    end;

     QueryOpen(Query,
     ' SELECT distinct title code FROM sys_deptdef where mc_id = ' + inttostr(mainmod.mcid) +
     '  and id= any(string_to_array('+ QuotedStr(mainmod.LoginInfo.Departments) + ', '','')::int[]) ' +
     ' order by 1 '  );
    if  not Query.IsEmpty then
    begin
      I := 1;
      Query.First;
      while not query.Eof do
      begin
        xls.SetCellValue(I+1, 2, Query.FieldByName('code').AsString);
        inc(I);
        Query.Next;
      end;

    end ;
  finally
    if assigned(query) then
      FreeAndNil(query);
  end;

  //Cell selection and scroll position.
  xls.ActiveSheet := 1;  //Set the sheet we are working in.
  xls.SelectCell(1, 1, false);
  //Standard Document Properties - Most are only for xlsx files. In xls files FlexCel will only change the Creation Date and Modified Date.
  xls.DocumentProperties.SetStandardProperty(TPropertyId.Author, 'Doğan');

end;

procedure SistemBilgileriTopluEklemeSablonu(const xls:TExcelFile) ;
var
  MajorLatin: TThemeTextFont;
  MajorEastAsian: TThemeTextFont;
  MajorComplexScript: TThemeTextFont;
  MajorFont: TThemeFont;
  MinorLatin: TThemeTextFont;
  MinorEastAsian: TThemeTextFont;
  MinorComplexScript: TThemeTextFont;
  MinorFont: TThemeFont;
  fmt: TFlxFormat;

begin
  xls.NewFile(1, TExcelFileFormat.v2016);  //Create a new Excel file with 1 sheet.

  //Set the names of the sheets
  xls.ActiveSheet := 1;
  xls.SheetName := 'Sayfa1';

  xls.ActiveSheet := 1;  //Set the sheet we are working in.

  //Global Workbook Options
  //Note that in xlsx files this option is ignored by FlexCel unless you also set OptionsForceUseCheckCompatibility to true. This is because Excel disables Autosave in files which have this option.
  xls.OptionsCheckCompatibility := false;

  //Sheet Options
  xls.SheetName := 'Sayfa1';

  //Major font
  MajorLatin := TThemeTextFont.Create('Calibri Light', '020F0302020204030204', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorEastAsian := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorComplexScript := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorFont := TThemeFont.Create(MajorLatin, MajorEastAsian, MajorComplexScript);
  MajorFont.AddFont('Jpan', 'Yu Gothic Light');
  MajorFont.AddFont('Hang', '맑은 고딕');
  MajorFont.AddFont('Hans', '等线 Light');
  MajorFont.AddFont('Hant', '新細明體');
  MajorFont.AddFont('Arab', 'Times New Roman');
  MajorFont.AddFont('Hebr', 'Times New Roman');
  MajorFont.AddFont('Thai', 'Tahoma');
  MajorFont.AddFont('Ethi', 'Nyala');
  MajorFont.AddFont('Beng', 'Vrinda');
  MajorFont.AddFont('Gujr', 'Shruti');
  MajorFont.AddFont('Khmr', 'MoolBoran');
  MajorFont.AddFont('Knda', 'Tunga');
  MajorFont.AddFont('Guru', 'Raavi');
  MajorFont.AddFont('Cans', 'Euphemia');
  MajorFont.AddFont('Cher', 'Plantagenet Cherokee');
  MajorFont.AddFont('Yiii', 'Microsoft Yi Baiti');
  MajorFont.AddFont('Tibt', 'Microsoft Himalaya');
  MajorFont.AddFont('Thaa', 'MV Boli');
  MajorFont.AddFont('Deva', 'Mangal');
  MajorFont.AddFont('Telu', 'Gautami');
  MajorFont.AddFont('Taml', 'Latha');
  MajorFont.AddFont('Syrc', 'Estrangelo Edessa');
  MajorFont.AddFont('Orya', 'Kalinga');
  MajorFont.AddFont('Mlym', 'Kartika');
  MajorFont.AddFont('Laoo', 'DokChampa');
  MajorFont.AddFont('Sinh', 'Iskoola Pota');
  MajorFont.AddFont('Mong', 'Mongolian Baiti');
  MajorFont.AddFont('Viet', 'Times New Roman');
  MajorFont.AddFont('Uigh', 'Microsoft Uighur');
  MajorFont.AddFont('Geor', 'Sylfaen');
  xls.SetThemeFont(TFontScheme.Major, MajorFont);

  //Minor font
  MinorLatin := TThemeTextFont.Create('Calibri', '020F0502020204030204', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorEastAsian := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorComplexScript := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorFont := TThemeFont.Create(MinorLatin, MinorEastAsian, MinorComplexScript);
  MinorFont.AddFont('Jpan', 'Yu Gothic');
  MinorFont.AddFont('Hang', '맑은 고딕');
  MinorFont.AddFont('Hans', '等线');
  MinorFont.AddFont('Hant', '新細明體');
  MinorFont.AddFont('Arab', 'Arial');
  MinorFont.AddFont('Hebr', 'Arial');
  MinorFont.AddFont('Thai', 'Tahoma');
  MinorFont.AddFont('Ethi', 'Nyala');
  MinorFont.AddFont('Beng', 'Vrinda');
  MinorFont.AddFont('Gujr', 'Shruti');
  MinorFont.AddFont('Khmr', 'DaunPenh');
  MinorFont.AddFont('Knda', 'Tunga');
  MinorFont.AddFont('Guru', 'Raavi');
  MinorFont.AddFont('Cans', 'Euphemia');
  MinorFont.AddFont('Cher', 'Plantagenet Cherokee');
  MinorFont.AddFont('Yiii', 'Microsoft Yi Baiti');
  MinorFont.AddFont('Tibt', 'Microsoft Himalaya');
  MinorFont.AddFont('Thaa', 'MV Boli');
  MinorFont.AddFont('Deva', 'Mangal');
  MinorFont.AddFont('Telu', 'Gautami');
  MinorFont.AddFont('Taml', 'Latha');
  MinorFont.AddFont('Syrc', 'Estrangelo Edessa');
  MinorFont.AddFont('Orya', 'Kalinga');
  MinorFont.AddFont('Mlym', 'Kartika');
  MinorFont.AddFont('Laoo', 'DokChampa');
  MinorFont.AddFont('Sinh', 'Iskoola Pota');
  MinorFont.AddFont('Mong', 'Mongolian Baiti');
  MinorFont.AddFont('Viet', 'Arial');
  MinorFont.AddFont('Uigh', 'Microsoft Uighur');
  MinorFont.AddFont('Geor', 'Sylfaen');
  xls.SetThemeFont(TFontScheme.Minor, MinorFont);

  //Set up rows and columns
  xls.SetColWidth(1, 1, 3291);  //(12.11 + 0.75) * 256

  xls.SetColWidth(2, 2, 3693);  //(13.68 + 0.75) * 256

  xls.SetColWidth(3, 3, 3949);  //(14.68 + 0.75) * 256

  xls.SetColWidth(4, 4, 5046);  //(18.96 + 0.75) * 256

  xls.SetColWidth(5, 5, 3035);  //(11.11 + 0.75) * 256

  xls.SetColWidth(6, 6, 3401);  //(12.54 + 0.75) * 256

  xls.SetColWidth(7, 7, 4900);  //(18.39 + 0.75) * 256

  xls.SetColWidth(8, 8, 4790);  //(17.96 + 0.75) * 256

  //Set the cell values
  fmt := xls.GetCellVisibleFormatDef(1, 1);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 1, xls.AddFormat(fmt));
  xls.SetCellValue(1, 1, 'VARLIK KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 2);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 2, xls.AddFormat(fmt));
  xls.SetCellValue(1, 2, 'VARLIK TANIMI');

  fmt := xls.GetCellVisibleFormatDef(1, 3);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 3, xls.AddFormat(fmt));
  xls.SetCellValue(1, 3, 'TAM VARLIK ADI');

  fmt := xls.GetCellVisibleFormatDef(1, 4);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 4, xls.AddFormat(fmt));
  xls.SetCellValue(1, 4, 'VARLIK GRUBU KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 5);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 5, xls.AddFormat(fmt));
  xls.SetCellValue(1, 5, 'DEPARTMAN');

  fmt := xls.GetCellVisibleFormatDef(1, 6);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 6, xls.AddFormat(fmt));
  xls.SetCellValue(1, 6, 'VARLIK SAHİBİ');

  fmt := xls.GetCellVisibleFormatDef(1, 7);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 7, xls.AddFormat(fmt));
  xls.SetCellValue(1, 7, 'VARLIK SAHİBİ VEKİLİ');

  fmt := xls.GetCellVisibleFormatDef(1, 8);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 8, xls.AddFormat(fmt));
  xls.SetCellValue(1, 8, 'KULLANILDIĞI SÜREÇ');
  xls.SetCellValue(2, 1, 11);
  xls.SetCellValue(2, 2, 'aaa');
  xls.SetCellValue(2, 3, 'aa');

  //Freeze Panes
  xls.FreezePanes(TCellAddress.Create('A2'));

  //Cell selection and scroll position.
  xls.SelectCell(2, 4, false);

  //Standard Document Properties - Most are only for xlsx files. In xls files FlexCel will only change the Creation Date and Modified Date.
  xls.DocumentProperties.SetStandardProperty(TPropertyId.Author, 'Doğan');

end;

procedure FmekanBilgileriTopluEklemeSablonuValid(const xls:TExcelFile) ;
var
  MajorLatin: TThemeTextFont;
  MajorEastAsian: TThemeTextFont;
  MajorComplexScript: TThemeTextFont;
  MajorFont: TThemeFont;
  MinorLatin: TThemeTextFont;
  MinorEastAsian: TThemeTextFont;
  MinorComplexScript: TThemeTextFont;
  MinorFont: TThemeFont;
  fmt: TFlxFormat;
  Validation: TDataValidationInfo;

begin
  xls.NewFile(2, TExcelFileFormat.v2016);  //Create a new Excel file with 2 sheets.

  //Set the names of the sheets
  xls.ActiveSheet := 1;
  xls.SheetName := 'Toplu F.Mekan Ekleme Şablonu';
  xls.ActiveSheet := 2;
  xls.SheetName := 'Ayarlar';
  xls.SheetVisible := TXlsSheetVisible.Hidden;

  xls.ActiveSheet := 1;  //Set the sheet we are working in.

  //Global Workbook Options
  //Note that in xlsx files this option is ignored by FlexCel unless you also set OptionsForceUseCheckCompatibility to true. This is because Excel disables Autosave in files which have this option.
  xls.OptionsCheckCompatibility := false;

  //Sheet Options
  xls.SheetName := 'Toplu F.Mekan Ekleme Şablonu';

  //Major font
  MajorLatin := TThemeTextFont.Create('Calibri Light', '020F0302020204030204', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorEastAsian := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorComplexScript := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorFont := TThemeFont.Create(MajorLatin, MajorEastAsian, MajorComplexScript);
  MajorFont.AddFont('Jpan', 'Yu Gothic Light');
  MajorFont.AddFont('Hang', '맑은 고딕');
  MajorFont.AddFont('Hans', '等线 Light');
  MajorFont.AddFont('Hant', '新細明體');
  MajorFont.AddFont('Arab', 'Times New Roman');
  MajorFont.AddFont('Hebr', 'Times New Roman');
  MajorFont.AddFont('Thai', 'Tahoma');
  MajorFont.AddFont('Ethi', 'Nyala');
  MajorFont.AddFont('Beng', 'Vrinda');
  MajorFont.AddFont('Gujr', 'Shruti');
  MajorFont.AddFont('Khmr', 'MoolBoran');
  MajorFont.AddFont('Knda', 'Tunga');
  MajorFont.AddFont('Guru', 'Raavi');
  MajorFont.AddFont('Cans', 'Euphemia');
  MajorFont.AddFont('Cher', 'Plantagenet Cherokee');
  MajorFont.AddFont('Yiii', 'Microsoft Yi Baiti');
  MajorFont.AddFont('Tibt', 'Microsoft Himalaya');
  MajorFont.AddFont('Thaa', 'MV Boli');
  MajorFont.AddFont('Deva', 'Mangal');
  MajorFont.AddFont('Telu', 'Gautami');
  MajorFont.AddFont('Taml', 'Latha');
  MajorFont.AddFont('Syrc', 'Estrangelo Edessa');
  MajorFont.AddFont('Orya', 'Kalinga');
  MajorFont.AddFont('Mlym', 'Kartika');
  MajorFont.AddFont('Laoo', 'DokChampa');
  MajorFont.AddFont('Sinh', 'Iskoola Pota');
  MajorFont.AddFont('Mong', 'Mongolian Baiti');
  MajorFont.AddFont('Viet', 'Times New Roman');
  MajorFont.AddFont('Uigh', 'Microsoft Uighur');
  MajorFont.AddFont('Geor', 'Sylfaen');
  xls.SetThemeFont(TFontScheme.Major, MajorFont);

  //Minor font
  MinorLatin := TThemeTextFont.Create('Calibri', '020F0502020204030204', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorEastAsian := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorComplexScript := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorFont := TThemeFont.Create(MinorLatin, MinorEastAsian, MinorComplexScript);
  MinorFont.AddFont('Jpan', 'Yu Gothic');
  MinorFont.AddFont('Hang', '맑은 고딕');
  MinorFont.AddFont('Hans', '等线');
  MinorFont.AddFont('Hant', '新細明體');
  MinorFont.AddFont('Arab', 'Arial');
  MinorFont.AddFont('Hebr', 'Arial');
  MinorFont.AddFont('Thai', 'Tahoma');
  MinorFont.AddFont('Ethi', 'Nyala');
  MinorFont.AddFont('Beng', 'Vrinda');
  MinorFont.AddFont('Gujr', 'Shruti');
  MinorFont.AddFont('Khmr', 'DaunPenh');
  MinorFont.AddFont('Knda', 'Tunga');
  MinorFont.AddFont('Guru', 'Raavi');
  MinorFont.AddFont('Cans', 'Euphemia');
  MinorFont.AddFont('Cher', 'Plantagenet Cherokee');
  MinorFont.AddFont('Yiii', 'Microsoft Yi Baiti');
  MinorFont.AddFont('Tibt', 'Microsoft Himalaya');
  MinorFont.AddFont('Thaa', 'MV Boli');
  MinorFont.AddFont('Deva', 'Mangal');
  MinorFont.AddFont('Telu', 'Gautami');
  MinorFont.AddFont('Taml', 'Latha');
  MinorFont.AddFont('Syrc', 'Estrangelo Edessa');
  MinorFont.AddFont('Orya', 'Kalinga');
  MinorFont.AddFont('Mlym', 'Kartika');
  MinorFont.AddFont('Laoo', 'DokChampa');
  MinorFont.AddFont('Sinh', 'Iskoola Pota');
  MinorFont.AddFont('Mong', 'Mongolian Baiti');
  MinorFont.AddFont('Viet', 'Arial');
  MinorFont.AddFont('Uigh', 'Microsoft Uighur');
  MinorFont.AddFont('Geor', 'Sylfaen');
  xls.SetThemeFont(TFontScheme.Minor, MinorFont);

  //Set up rows and columns
  xls.DefaultColWidth := 2332;

  xls.SetColWidth(1, 1, 3299);  //(12.14 + 0.75) * 256

  xls.SetColWidth(2, 2, 3697);  //(13.69 + 0.75) * 256

  xls.SetColWidth(3, 3, 3953);  //(14.69 + 0.75) * 256

  xls.SetColWidth(4, 4, 5034);  //(18.91 + 0.75) * 256

  xls.SetColWidth(5, 5, 3043);  //(11.14 + 0.75) * 256

  xls.SetColWidth(6, 6, 3413);  //(12.58 + 0.75) * 256

  xls.SetColWidth(7, 7, 4892);  //(18.36 + 0.75) * 256

  xls.SetColWidth(8, 8, 4778);  //(17.91 + 0.75) * 256
  xls.DefaultRowHeight := 288;

  //Set the cell values
  fmt := xls.GetCellVisibleFormatDef(1, 1);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 1, xls.AddFormat(fmt));
  xls.SetCellValue(1, 1, 'VARLIK KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 2);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 2, xls.AddFormat(fmt));
  xls.SetCellValue(1, 2, 'VARLIK TANIMI');

  fmt := xls.GetCellVisibleFormatDef(1, 3);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 3, xls.AddFormat(fmt));
  xls.SetCellValue(1, 3, 'TAM VARLIK ADI');

  fmt := xls.GetCellVisibleFormatDef(1, 4);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 4, xls.AddFormat(fmt));
  xls.SetCellValue(1, 4, 'VARLIK GRUBU KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 5);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 5, xls.AddFormat(fmt));
  xls.SetCellValue(1, 5, 'DEPARTMAN');

  fmt := xls.GetCellVisibleFormatDef(1, 6);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 6, xls.AddFormat(fmt));
  xls.SetCellValue(1, 6, 'VARLIK SAHİBİ');

  fmt := xls.GetCellVisibleFormatDef(1, 7);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 7, xls.AddFormat(fmt));
  xls.SetCellValue(1, 7, 'VARLIK SAHİBİ VEKİLİ');

  fmt := xls.GetCellVisibleFormatDef(1, 8);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 8, xls.AddFormat(fmt));
  xls.SetCellValue(1, 8, 'KULLANILDIĞI SÜREÇ');

  //Data Validation

  Validation := TDataValidationInfo.Empty;
    Validation.ValidationType := TDataValidationDataType.List;
    Validation.FirstFormula := '=Ayarlar!$A$2:$A$1048576';
    Validation.IgnoreEmptyCells := true;
    Validation.InCellDropDown := true;
    Validation.ShowErrorBox := true;
    Validation.ShowInputBox := true;
  xls.AddDataValidation(TXlsCellRange.Create(2, 4, 1048576, 4), Validation);

  Validation := TDataValidationInfo.Empty;
    Validation.ValidationType := TDataValidationDataType.List;
    Validation.FirstFormula := '=Ayarlar!$B$2:$B$1048576';
    Validation.IgnoreEmptyCells := true;
    Validation.InCellDropDown := true;
    Validation.ShowErrorBox := true;
    Validation.ShowInputBox := true;
  xls.AddDataValidation(TXlsCellRange.Create(2, 5, 1048576, 5), Validation);

  //Freeze Panes
  xls.FreezePanes(TCellAddress.Create('A2'));

  //Cell selection and scroll position.
  xls.SelectCell(1048553, 5, false);


  xls.ActiveSheet := 2;  //Set the sheet we are working in.

  //Sheet Options
  xls.SheetName := 'Ayarlar';

  //Set up rows and columns
  xls.DefaultColWidth := 2340;

  xls.SetColWidth(1, 1, 5006);  //(18.80 + 0.75) * 256

  xls.SetColWidth(2, 2, 6456);  //(24.47 + 0.75) * 256

  //Set the cell values
  fmt := xls.GetCellVisibleFormatDef(1, 1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 162;
  xls.SetCellFormat(1, 1, xls.AddFormat(fmt));
  xls.SetCellValue(1, 1, 'VARLIK GRUP KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 2);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.CharSet := 162;
  xls.SetCellFormat(1, 2, xls.AddFormat(fmt));
  xls.SetCellValue(1, 2, 'DEPARTMAN');

     var  Query : TUniQuery;
 var  I : INTEGER;
  query := TUniQuery.Create(nil);
  try
  Query.Connection := MainMod.DBMain;
  QueryOpen(Query,'SELECT    gr_code||'' - ''|| gr_name code 	FROM  def_data_assetgroup where main_id>0 and mc_id = ' + inttostr(mainmod.mcid) +
  '  and id= any(string_to_array('+ QuotedStr(mainmod.LoginInfo.AssetGroups) + ', '','')::int[]) order by code') ;
  if  not Query.IsEmpty then
    begin
      I := 1;
      Query.First;
      while not query.Eof do
      begin
        xls.SetCellValue(I+1, 1, Query.FieldByName('code').AsString);
        inc(I);
        Query.Next;
      end;

    end;

     QueryOpen(Query,
     ' SELECT distinct title code FROM sys_deptdef where mc_id = ' + inttostr(mainmod.mcid) +
     '  and id= any(string_to_array('+ QuotedStr(mainmod.LoginInfo.Departments) + ', '','')::int[]) ' +
     ' order by 1 '  );
    if  not Query.IsEmpty then
    begin
      I := 1;
      Query.First;
      while not query.Eof do
      begin
        xls.SetCellValue(I+1, 2, Query.FieldByName('code').AsString);
        inc(I);
        Query.Next;
      end;

    end ;
  finally
    if assigned(query) then
      FreeAndNil(query);
  end;


  //Cell selection and scroll position.
  xls.ActiveSheet := 1;  //Set the sheet we are working in.
  xls.SelectCell(1, 1, false);


  //Standard Document Properties - Most are only for xlsx files. In xls files FlexCel will only change the Creation Date and Modified Date.
  xls.DocumentProperties.SetStandardProperty(TPropertyId.Author, 'Doğan');

end;

procedure FmekanBilgileriTopluEklemeSablonu(const xls:TExcelFile) ;
var
  MajorLatin: TThemeTextFont;
  MajorEastAsian: TThemeTextFont;
  MajorComplexScript: TThemeTextFont;
  MajorFont: TThemeFont;
  MinorLatin: TThemeTextFont;
  MinorEastAsian: TThemeTextFont;
  MinorComplexScript: TThemeTextFont;
  MinorFont: TThemeFont;
  fmt: TFlxFormat;

begin
  xls.NewFile(1, TExcelFileFormat.v2016);  //Create a new Excel file with 1 sheet.

  //Set the names of the sheets
  xls.ActiveSheet := 1;
  xls.SheetName := 'Sayfa1';

  xls.ActiveSheet := 1;  //Set the sheet we are working in.

  //Global Workbook Options
  //Note that in xlsx files this option is ignored by FlexCel unless you also set OptionsForceUseCheckCompatibility to true. This is because Excel disables Autosave in files which have this option.
  xls.OptionsCheckCompatibility := false;

  //Sheet Options
  xls.SheetName := 'Sayfa1';

  //Major font
  MajorLatin := TThemeTextFont.Create('Calibri Light', '020F0302020204030204', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorEastAsian := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorComplexScript := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorFont := TThemeFont.Create(MajorLatin, MajorEastAsian, MajorComplexScript);
  MajorFont.AddFont('Jpan', 'Yu Gothic Light');
  MajorFont.AddFont('Hang', '맑은 고딕');
  MajorFont.AddFont('Hans', '等线 Light');
  MajorFont.AddFont('Hant', '新細明體');
  MajorFont.AddFont('Arab', 'Times New Roman');
  MajorFont.AddFont('Hebr', 'Times New Roman');
  MajorFont.AddFont('Thai', 'Tahoma');
  MajorFont.AddFont('Ethi', 'Nyala');
  MajorFont.AddFont('Beng', 'Vrinda');
  MajorFont.AddFont('Gujr', 'Shruti');
  MajorFont.AddFont('Khmr', 'MoolBoran');
  MajorFont.AddFont('Knda', 'Tunga');
  MajorFont.AddFont('Guru', 'Raavi');
  MajorFont.AddFont('Cans', 'Euphemia');
  MajorFont.AddFont('Cher', 'Plantagenet Cherokee');
  MajorFont.AddFont('Yiii', 'Microsoft Yi Baiti');
  MajorFont.AddFont('Tibt', 'Microsoft Himalaya');
  MajorFont.AddFont('Thaa', 'MV Boli');
  MajorFont.AddFont('Deva', 'Mangal');
  MajorFont.AddFont('Telu', 'Gautami');
  MajorFont.AddFont('Taml', 'Latha');
  MajorFont.AddFont('Syrc', 'Estrangelo Edessa');
  MajorFont.AddFont('Orya', 'Kalinga');
  MajorFont.AddFont('Mlym', 'Kartika');
  MajorFont.AddFont('Laoo', 'DokChampa');
  MajorFont.AddFont('Sinh', 'Iskoola Pota');
  MajorFont.AddFont('Mong', 'Mongolian Baiti');
  MajorFont.AddFont('Viet', 'Times New Roman');
  MajorFont.AddFont('Uigh', 'Microsoft Uighur');
  MajorFont.AddFont('Geor', 'Sylfaen');
  xls.SetThemeFont(TFontScheme.Major, MajorFont);

  //Minor font
  MinorLatin := TThemeTextFont.Create('Calibri', '020F0502020204030204', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorEastAsian := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorComplexScript := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MinorFont := TThemeFont.Create(MinorLatin, MinorEastAsian, MinorComplexScript);
  MinorFont.AddFont('Jpan', 'Yu Gothic');
  MinorFont.AddFont('Hang', '맑은 고딕');
  MinorFont.AddFont('Hans', '等线');
  MinorFont.AddFont('Hant', '新細明體');
  MinorFont.AddFont('Arab', 'Arial');
  MinorFont.AddFont('Hebr', 'Arial');
  MinorFont.AddFont('Thai', 'Tahoma');
  MinorFont.AddFont('Ethi', 'Nyala');
  MinorFont.AddFont('Beng', 'Vrinda');
  MinorFont.AddFont('Gujr', 'Shruti');
  MinorFont.AddFont('Khmr', 'DaunPenh');
  MinorFont.AddFont('Knda', 'Tunga');
  MinorFont.AddFont('Guru', 'Raavi');
  MinorFont.AddFont('Cans', 'Euphemia');
  MinorFont.AddFont('Cher', 'Plantagenet Cherokee');
  MinorFont.AddFont('Yiii', 'Microsoft Yi Baiti');
  MinorFont.AddFont('Tibt', 'Microsoft Himalaya');
  MinorFont.AddFont('Thaa', 'MV Boli');
  MinorFont.AddFont('Deva', 'Mangal');
  MinorFont.AddFont('Telu', 'Gautami');
  MinorFont.AddFont('Taml', 'Latha');
  MinorFont.AddFont('Syrc', 'Estrangelo Edessa');
  MinorFont.AddFont('Orya', 'Kalinga');
  MinorFont.AddFont('Mlym', 'Kartika');
  MinorFont.AddFont('Laoo', 'DokChampa');
  MinorFont.AddFont('Sinh', 'Iskoola Pota');
  MinorFont.AddFont('Mong', 'Mongolian Baiti');
  MinorFont.AddFont('Viet', 'Arial');
  MinorFont.AddFont('Uigh', 'Microsoft Uighur');
  MinorFont.AddFont('Geor', 'Sylfaen');
  xls.SetThemeFont(TFontScheme.Minor, MinorFont);

  //Set up rows and columns
  xls.SetColWidth(1, 1, 3291);  //(12.11 + 0.75) * 256

  xls.SetColWidth(2, 2, 3693);  //(13.68 + 0.75) * 256

  xls.SetColWidth(3, 3, 3949);  //(14.68 + 0.75) * 256

  xls.SetColWidth(4, 4, 5046);  //(18.96 + 0.75) * 256

  xls.SetColWidth(5, 5, 3035);  //(11.11 + 0.75) * 256

  xls.SetColWidth(6, 6, 3401);  //(12.54 + 0.75) * 256

  xls.SetColWidth(7, 7, 4900);  //(18.39 + 0.75) * 256

  xls.SetColWidth(8, 8, 4790);  //(17.96 + 0.75) * 256

  //Set the cell values
  fmt := xls.GetCellVisibleFormatDef(1, 1);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 1, xls.AddFormat(fmt));
  xls.SetCellValue(1, 1, 'VARLIK KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 2);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 2, xls.AddFormat(fmt));
  xls.SetCellValue(1, 2, 'VARLIK TANIMI');

  fmt := xls.GetCellVisibleFormatDef(1, 3);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 3, xls.AddFormat(fmt));
  xls.SetCellValue(1, 3, 'TAM VARLIK ADI');

  fmt := xls.GetCellVisibleFormatDef(1, 4);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 4, xls.AddFormat(fmt));
  xls.SetCellValue(1, 4, 'VARLIK GRUBU KODU');

  fmt := xls.GetCellVisibleFormatDef(1, 5);
  fmt.Font.Color := TExcelColor.FromArgb($CC, $00, $00);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 5, xls.AddFormat(fmt));
  xls.SetCellValue(1, 5, 'DEPARTMAN');

  fmt := xls.GetCellVisibleFormatDef(1, 6);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 6, xls.AddFormat(fmt));
  xls.SetCellValue(1, 6, 'VARLIK SAHİBİ');

  fmt := xls.GetCellVisibleFormatDef(1, 7);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 7, xls.AddFormat(fmt));
  xls.SetCellValue(1, 7, 'VARLIK SAHİBİ VEKİLİ');

  fmt := xls.GetCellVisibleFormatDef(1, 8);
  fmt.Font.Color := TExcelColor.Automatic;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  xls.SetCellFormat(1, 8, xls.AddFormat(fmt));
  xls.SetCellValue(1, 8, 'KULLANILDIĞI SÜREÇ');
  xls.SetCellValue(2, 1, 11);

  //Freeze Panes
  xls.FreezePanes(TCellAddress.Create('A2'));

  //Cell selection and scroll position.
  xls.SelectCell(1, 1, false);

  //Standard Document Properties - Most are only for xlsx files. In xls files FlexCel will only change the Creation Date and Modified Date.
  xls.DocumentProperties.SetStandardProperty(TPropertyId.Author, 'Doğan');

end;

procedure EK_C_4_listeSablonu2(const xls : TExcelFile) ;
var
  StyleFmt: TFlxFormat;
  Range: TXlsNamedRange;
  HeadersAndFooters: THeaderAndFooter;
  MajorLatin: TThemeTextFont;
  MajorEastAsian: TThemeTextFont;
  MajorComplexScript: TThemeTextFont;
  MajorFont: TThemeFont;
  RowFmt: TFlxFormat;
  fmt: TFlxFormat;

begin
  xls.NewFile(2, TExcelFileFormat.v2013);  //Create a new Excel file with 2 sheets.

  //Set the names of the sheets
  xls.ActiveSheet := 1;
  xls.SheetName := 'Yol Haritası Faaliyetleri';
  xls.ActiveSheet := 2;
  xls.SheetName := '<#Config>';

  xls.ActiveSheet := 1;  //Set the sheet we are working in.

  //Global Workbook Options
  //Note that in xlsx files this option is ignored by FlexCel unless you also set OptionsForceUseCheckCompatibility to true. This is because Excel disables Autosave in files which have this option.
  xls.OptionsCheckCompatibility := false;

  //Sheet Options
  xls.SheetName := 'Yol Haritası Faaliyetleri';

  //Styles.
  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Arial';
  StyleFmt.Font.Size20 := 200;
  StyleFmt.Font.Color := TExcelColor.Automatic;
  StyleFmt.Font.Family := 0;
  StyleFmt.Font.Scheme := TFontScheme.None;
  xls.SetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0), StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark1);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Accent1, 0.79998168889431);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('%20 - Vurgu1', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark1);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Accent2, 0.79998168889431);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('%20 - Vurgu2', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark1);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Accent3, 0.79998168889431);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('%20 - Vurgu3', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark1);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Accent4, 0.79998168889431);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('%20 - Vurgu4', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark1);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Accent5, 0.79998168889431);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('%20 - Vurgu5', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark1);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Accent6, 0.79998168889431);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('%20 - Vurgu6', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark1);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Accent1, 0.5999938962981);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('%40 - Vurgu1', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark1);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Accent2, 0.5999938962981);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('%40 - Vurgu2', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark1);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Accent3, 0.5999938962981);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('%40 - Vurgu3', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark1);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Accent4, 0.5999938962981);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('%40 - Vurgu4', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark1);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Accent5, 0.5999938962981);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('%40 - Vurgu5', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark1);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Accent6, 0.5999938962981);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('%40 - Vurgu6', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Accent1, 0.39997558519242);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('%60 - Vurgu1', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Accent2, 0.39997558519242);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('%60 - Vurgu2', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Accent3, 0.39997558519242);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('%60 - Vurgu3', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Accent4, 0.39997558519242);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('%60 - Vurgu4', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Accent5, 0.39997558519242);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('%60 - Vurgu5', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Accent6, 0.39997558519242);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('%60 - Vurgu6', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Cambria';
  StyleFmt.Font.Size20 := 360;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark2);
  StyleFmt.Font.Style := [TFlxFontStyles.Bold];
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Major;
  xls.SetStyle('Ana Başlık', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromArgb($7F, $7F, $7F);
  StyleFmt.Font.Style := [TFlxFontStyles.Italic];
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  xls.SetStyle('Açıklama Metni', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromArgb($FA, $7D, $00);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.Borders.Bottom.Style := TFlxBorderStyle.Double;
  StyleFmt.Borders.Bottom.Color := TExcelColor.FromArgb($FF, $80, $01);
  xls.SetStyle('Bağlı Hücre', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 300;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark2);
  StyleFmt.Font.Style := [TFlxFontStyles.Bold];
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.Borders.Bottom.Style := TFlxBorderStyle.Thick;
  StyleFmt.Borders.Bottom.Color := TExcelColor.FromTheme(TThemeColor.Accent1);
  xls.SetStyle('Başlık 1', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 260;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark2);
  StyleFmt.Font.Style := [TFlxFontStyles.Bold];
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.Borders.Bottom.Style := TFlxBorderStyle.Thick;
  StyleFmt.Borders.Bottom.Color := TExcelColor.FromTheme(TThemeColor.Accent1, 0.49998474074526);
  xls.SetStyle('Başlık 2', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark2);
  StyleFmt.Font.Style := [TFlxFontStyles.Bold];
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.Borders.Bottom.Style := TFlxBorderStyle.Medium;
  StyleFmt.Borders.Bottom.Color := TExcelColor.FromTheme(TThemeColor.Accent1, 0.39997558519242);
  xls.SetStyle('Başlık 3', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark2);
  StyleFmt.Font.Style := [TFlxFontStyles.Bold];
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  xls.SetStyle('Başlık 4', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.ColLevel, 1));
  StyleFmt.Font.Name := 'Arial';
  StyleFmt.Font.Size20 := 200;
  StyleFmt.Font.Color := TExcelColor.Automatic;
  StyleFmt.Font.Family := 0;
  StyleFmt.Font.Scheme := TFontScheme.None;
  xls.SetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.ColLevel, 1), StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.ColLevel, 2));
  StyleFmt.Font.Name := 'Arial';
  StyleFmt.Font.Size20 := 200;
  StyleFmt.Font.Color := TExcelColor.Automatic;
  StyleFmt.Font.Family := 0;
  StyleFmt.Font.Scheme := TFontScheme.None;
  xls.SetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.ColLevel, 2), StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Comma, 0));
  StyleFmt.Font.Name := 'Arial';
  StyleFmt.Font.Size20 := 200;
  StyleFmt.Font.Color := TExcelColor.Automatic;
  StyleFmt.Font.Scheme := TFontScheme.None;
  StyleFmt.Format := '_-* #,##0.00\ _€_-;\-* #,##0.00\ _€_-;_-* "-"??\ _€_-;_-@_-';
  xls.SetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Comma, 0), StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Comma0, 0));
  StyleFmt.Font.Name := 'Arial';
  StyleFmt.Font.Size20 := 200;
  StyleFmt.Font.Color := TExcelColor.Automatic;
  StyleFmt.Font.Scheme := TFontScheme.None;
  StyleFmt.Format := '_-* #,##0\ _€_-;\-* #,##0\ _€_-;_-* "-"\ _€_-;_-@_-';
  xls.SetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Comma0, 0), StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Currency, 0));
  StyleFmt.Font.Name := 'Arial';
  StyleFmt.Font.Size20 := 200;
  StyleFmt.Font.Color := TExcelColor.Automatic;
  StyleFmt.Font.Scheme := TFontScheme.None;
  StyleFmt.Format := '_-* #,##0.00\ "€"_-;\-* #,##0.00\ "€"_-;_-* "-"??\ "€"_-;_-@_-';
  xls.SetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Currency, 0), StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Currency0, 0));
  StyleFmt.Font.Name := 'Arial';
  StyleFmt.Font.Size20 := 200;
  StyleFmt.Font.Color := TExcelColor.Automatic;
  StyleFmt.Font.Scheme := TFontScheme.None;
  StyleFmt.Format := '_-* #,##0\ "€"_-;\-* #,##0\ "€"_-;_-* "-"\ "€"_-;_-@_-';
  xls.SetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Currency0, 0), StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Followed_Hyperlink, 0));
  StyleFmt.Font.Name := 'Arial';
  StyleFmt.Font.Size20 := 200;
  StyleFmt.Font.Color := TExcelColor.FromArgb($80, $00, $80);
  StyleFmt.Font.Scheme := TFontScheme.None;
  xls.SetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Followed_Hyperlink, 0), StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromArgb($3F, $3F, $76);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  StyleFmt.Borders.Left.Color := TExcelColor.FromArgb($7F, $7F, $7F);
  StyleFmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  StyleFmt.Borders.Right.Color := TExcelColor.FromArgb($7F, $7F, $7F);
  StyleFmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  StyleFmt.Borders.Top.Color := TExcelColor.FromArgb($7F, $7F, $7F);
  StyleFmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  StyleFmt.Borders.Bottom.Color := TExcelColor.FromArgb($7F, $7F, $7F);
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromArgb($FF, $CC, $99);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('Giriş', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromArgb($FA, $7D, $00);
  StyleFmt.Font.Style := [TFlxFontStyles.Bold];
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  StyleFmt.Borders.Left.Color := TExcelColor.FromArgb($7F, $7F, $7F);
  StyleFmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  StyleFmt.Borders.Right.Color := TExcelColor.FromArgb($7F, $7F, $7F);
  StyleFmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  StyleFmt.Borders.Top.Color := TExcelColor.FromArgb($7F, $7F, $7F);
  StyleFmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  StyleFmt.Borders.Bottom.Color := TExcelColor.FromArgb($7F, $7F, $7F);
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromArgb($F2, $F2, $F2);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('Hesaplama', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Hyperlink, 0));
  StyleFmt.Font.Name := 'Arial';
  StyleFmt.Font.Size20 := 200;
  StyleFmt.Font.Color := TExcelColor.FromArgb($00, $00, $FF);
  StyleFmt.Font.Scheme := TFontScheme.None;
  xls.SetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Hyperlink, 0), StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromArgb($9C, $00, $06);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromArgb($FF, $C7, $CE);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('Kötü', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Family := 2;
  StyleFmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  StyleFmt.Borders.Left.Color := TExcelColor.FromArgb($B2, $B2, $B2);
  StyleFmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  StyleFmt.Borders.Right.Color := TExcelColor.FromArgb($B2, $B2, $B2);
  StyleFmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  StyleFmt.Borders.Top.Color := TExcelColor.FromArgb($B2, $B2, $B2);
  StyleFmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  StyleFmt.Borders.Bottom.Color := TExcelColor.FromArgb($B2, $B2, $B2);
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromArgb($FF, $FF, $CC);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('Not', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromArgb($9C, $65, $00);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromArgb($FF, $EB, $9C);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('Nötr', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Percent, 0));
  StyleFmt.Font.Name := 'Arial';
  StyleFmt.Font.Size20 := 200;
  StyleFmt.Font.Color := TExcelColor.Automatic;
  StyleFmt.Font.Scheme := TFontScheme.None;
  xls.SetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Percent, 0), StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.RowLevel, 1));
  StyleFmt.Font.Name := 'Arial';
  StyleFmt.Font.Size20 := 200;
  StyleFmt.Font.Color := TExcelColor.Automatic;
  StyleFmt.Font.Family := 0;
  StyleFmt.Font.Scheme := TFontScheme.None;
  xls.SetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.RowLevel, 1), StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.RowLevel, 2));
  StyleFmt.Font.Name := 'Arial';
  StyleFmt.Font.Size20 := 200;
  StyleFmt.Font.Color := TExcelColor.Automatic;
  StyleFmt.Font.Family := 0;
  StyleFmt.Font.Scheme := TFontScheme.None;
  xls.SetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.RowLevel, 2), StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Title, 0));
  StyleFmt.Font.Name := 'Cambria';
  xls.SetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Title, 0), StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark1);
  StyleFmt.Font.Style := [TFlxFontStyles.Bold];
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  StyleFmt.Borders.Top.Color := TExcelColor.FromTheme(TThemeColor.Accent1);
  StyleFmt.Borders.Bottom.Style := TFlxBorderStyle.Double;
  StyleFmt.Borders.Bottom.Color := TExcelColor.FromTheme(TThemeColor.Accent1);
  xls.SetStyle('Toplam', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromArgb($FF, $00, $00);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  xls.SetStyle('Uyarı Metni', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Accent1);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('Vurgu1', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Accent2);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('Vurgu2', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Accent3);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('Vurgu3', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Accent4);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('Vurgu4', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Accent5);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('Vurgu5', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Accent6);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('Vurgu6', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromArgb($3F, $3F, $3F);
  StyleFmt.Font.Style := [TFlxFontStyles.Bold];
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  StyleFmt.Borders.Left.Color := TExcelColor.FromArgb($3F, $3F, $3F);
  StyleFmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  StyleFmt.Borders.Right.Color := TExcelColor.FromArgb($3F, $3F, $3F);
  StyleFmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  StyleFmt.Borders.Top.Color := TExcelColor.FromArgb($3F, $3F, $3F);
  StyleFmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  StyleFmt.Borders.Bottom.Color := TExcelColor.FromArgb($3F, $3F, $3F);
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromArgb($F2, $F2, $F2);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('Çıkış', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromArgb($00, $61, $00);
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromArgb($C6, $EF, $CE);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('İyi', StyleFmt);

  StyleFmt := xls.GetStyle(xls.GetBuiltInStyleName(TBuiltInStyle.Normal, 0));
  StyleFmt.Font.Name := 'Calibri';
  StyleFmt.Font.Size20 := 220;
  StyleFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  StyleFmt.Font.Style := [TFlxFontStyles.Bold];
  StyleFmt.Font.Family := 2;
  StyleFmt.Font.Scheme := TFontScheme.Minor;
  StyleFmt.Borders.Left.Style := TFlxBorderStyle.Double;
  StyleFmt.Borders.Left.Color := TExcelColor.FromArgb($3F, $3F, $3F);
  StyleFmt.Borders.Right.Style := TFlxBorderStyle.Double;
  StyleFmt.Borders.Right.Color := TExcelColor.FromArgb($3F, $3F, $3F);
  StyleFmt.Borders.Top.Style := TFlxBorderStyle.Double;
  StyleFmt.Borders.Top.Color := TExcelColor.FromArgb($3F, $3F, $3F);
  StyleFmt.Borders.Bottom.Style := TFlxBorderStyle.Double;
  StyleFmt.Borders.Bottom.Color := TExcelColor.FromArgb($3F, $3F, $3F);
  StyleFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  StyleFmt.FillPattern.FgColor := TExcelColor.FromArgb($A5, $A5, $A5);
  StyleFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetStyle('İşaretli Hücre', StyleFmt);

  //Named Ranges
  Range := TXlsNamedRange.Create('__faaliyet__', 0, 0, '=''Yol Haritası Faaliyetleri''!$A$2:$H$4');
  //You could also use: Range := TXlsNamedRange.Create('__faaliyet__', 0, 1, 2, 1, 4, 8, 0);
  xls.SetNamedRange(Range);

  Range := TXlsNamedRange.Create('__tedbir__', 0, 0, '=''Yol Haritası Faaliyetleri''!$B$4:$H$4');
  //You could also use: Range := TXlsNamedRange.Create('__tedbir__', 0, 1, 4, 2, 4, 8, 0);
  xls.SetNamedRange(Range);


  //Printer Settings
  HeadersAndFooters := THeaderAndFooter.Create();
  HeadersAndFooters.AlignMargins := false;
  HeadersAndFooters.ScaleWithDoc := true;
  HeadersAndFooters.DiffFirstPage := false;
  HeadersAndFooters.DiffEvenPages := false;
  HeadersAndFooters.DefaultHeader := '';
  HeadersAndFooters.DefaultFooter := '';
  HeadersAndFooters.FirstHeader := '';
  HeadersAndFooters.FirstFooter := '';
  HeadersAndFooters.EvenHeader := '';
  HeadersAndFooters.EvenFooter := '';
  xls.SetPageHeaderAndFooter(HeadersAndFooters);

  //You can set the margins in 2 ways, the one commented here or the one below:
  //var PrintMargins: TXlsMargins;
  //  PrintMargins := xls.GetPrintMargins();
  //  PrintMargins.Left := 0.75;
  //  PrintMargins.Top := 1;
  //  PrintMargins.Right := 0.75;
  //  PrintMargins.Bottom := 1;
  //  PrintMargins.Header := 0;
  //  PrintMargins.Footer := 0;
  //  xls.SetPrintMargins(PrintMargins);
  xls.SetPrintMargins(TXlsMargins.Create(0.75, 1, 0.75, 1, 0, 0));
  xls.PrintXResolution := 600;
  xls.PrintYResolution := 600;
  xls.PrintOptions := [TPrintOptions.Orientation];
  xls.PrintPaperSize := TPaperSize.A4;

  //Printer Driver Settings are a blob of data specific to a printer
  //This code is commented by default because normally you do not want to hard code the printer settings of a specific printer.
  //var PrinterData: TArray<byte>;
  //  PrinterData := TArray<byte>.Create(
  //    $00, $00, $46, $00, $53, $00, $2D, $00, $43, $00, $38, $00, $35, $00, $32, $00, $30, $00, $4D, $00, $46, $00, $50, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $04, $03, $06, $DC, $00, $C0, $04, $03, $BF, $00, $02, $01, $00, $09, $00, $9A, $0B, $34, $08, $64, $00, $01, $00, $0F, $00, $58, $02, $02, $00, $01, $00, $58, $02,
  //    $03, $00, $01, $00, $41, $00, $34, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $02, $00, $00, $00, $01, $00,
  //    $00, $00, $FF, $FF, $FF, $FF, $47, $49, $53, $34, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $44, $49, $4E, $55, $22, $00, $48, $02, $A4, $04, $1C, $00, $5F, $A0, $63, $E0, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $14, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $01, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $48, $02, $00, $00, $53, $4D, $54, $4A, $00, $00, $00, $00, $10, $00, $38, $02, $7B, $00, $32, $00, $37, $00, $32, $00,
  //    $30, $00, $37, $00, $32, $00, $38, $00, $32, $00, $2D, $00, $37, $00, $64, $00, $39, $00, $61, $00, $2D, $00, $34, $00, $64, $00, $66, $00, $64, $00, $2D, $00, $39, $00, $38, $00, $35, $00, $30, $00, $2D, $00, $38, $00, $31, $00, $66, $00, $34, $00,
  //    $37, $00, $39, $00, $65, $00, $31, $00, $64, $00, $63, $00, $66, $00, $33, $00, $7D, $00, $00, $00, $49, $6E, $70, $75, $74, $42, $69, $6E, $00, $46, $4F, $52, $4D, $53, $4F, $55, $52, $43, $45, $00, $52, $45, $53, $44, $4C, $4C, $00, $55, $6E, $69,
  //    $72, $65, $73, $44, $4C, $4C, $00, $4A, $6F, $62, $45, $63, $6F, $50, $72, $69, $6E, $74, $00, $4F, $66, $66, $00, $4A, $6F, $62, $47, $6C, $6F, $73, $73, $4D, $6F, $64, $65, $00, $4F, $66, $66, $00, $4A, $6F, $62, $43, $6F, $6C, $6F, $72, $43, $6F,
  //    $72, $72, $65, $63, $74, $69, $6F, $6E, $00, $50, $72, $69, $6E, $74, $65, $72, $53, $65, $74, $74, $69, $6E, $67, $73, $00, $4F, $75, $74, $70, $75, $74, $42, $69, $6E, $00, $44, $65, $73, $74, $50, $72, $69, $6E, $74, $65, $72, $44, $65, $66, $61,
  //    $75, $6C, $74, $00, $4A, $6F, $62, $48, $6F, $6C, $65, $50, $75, $6E, $63, $68, $00, $4E, $6F, $6E, $65, $00, $4A, $6F, $62, $53, $74, $61, $70, $6C, $65, $41, $6C, $6C, $44, $6F, $63, $75, $6D, $65, $6E, $74, $73, $00, $4E, $6F, $6E, $65, $00, $4A,
  //    $6F, $62, $53, $74, $61, $70, $6C, $65, $43, $6F, $75, $6E, $74, $00, $4E, $6F, $6E, $65, $00, $4A, $6F, $62, $53, $74, $6F, $72, $61, $67, $65, $00, $4E, $6F, $6E, $65, $00, $4A, $6F, $62, $53, $74, $6F, $72, $61, $67, $65, $55, $73, $65, $72, $49,
  //    $44, $00, $55, $73, $65, $72, $49, $44, $5F, $31, $00, $4A, $6F, $62, $41, $63, $63, $6F, $75, $6E, $74, $69, $6E, $67, $00, $4E, $6F, $6E, $65, $00, $4F, $72, $69, $65, $6E, $74, $61, $74, $69, $6F, $6E, $00, $50, $4F, $52, $54, $52, $41, $49, $54,
  //    $00, $44, $75, $70, $6C, $65, $78, $00, $4E, $4F, $4E, $45, $00, $4D, $65, $64, $69, $61, $54, $79, $70, $65, $00, $55, $6E, $73, $70, $65, $63, $69, $66, $69, $65, $64, $00, $52, $65, $73, $6F, $6C, $75, $74, $69, $6F, $6E, $00, $52, $65, $73, $6F,
  //    $6C, $75, $74, $69, $6F, $6E, $36, $30, $30, $00, $48, $61, $6C, $66, $74, $6F, $6E, $65, $00, $48, $54, $5F, $50, $41, $54, $53, $49, $5A, $45, $5F, $41, $55, $54, $4F, $00, $43, $6F, $6C, $6F, $72, $4D, $6F, $64, $65, $00, $43, $6F, $6C, $6F, $72,
  //    $00, $50, $61, $70, $65, $72, $53, $69, $7A, $65, $00, $45, $4E, $56, $5F, $4D, $4F, $4E, $41, $52, $43, $48, $00, $43, $6F, $6C, $6C, $61, $74, $65, $00, $4F, $46, $46, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
  //    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $1C, $00, $00, $00, $56, $34, $44, $4D, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
  //  );
  //var PrinterDriverSettings: TPrinterDriverSettings;
  //  PrinterDriverSettings := TPrinterDriverSettings.Create(PrinterData);
  //  xls.SetPrinterDriverSettings(PrinterDriverSettings);

  //Theme - You might use GetTheme/SetTheme methods here instead.
  xls.SetColorTheme(TPrimaryThemeColor.Light2, TDrawingColor.FromRgb($EE, $EC, $E1));
  xls.SetColorTheme(TPrimaryThemeColor.Dark2, TDrawingColor.FromRgb($1F, $49, $7D));
  xls.SetColorTheme(TPrimaryThemeColor.Accent1, TDrawingColor.FromRgb($4F, $81, $BD));
  xls.SetColorTheme(TPrimaryThemeColor.Accent2, TDrawingColor.FromRgb($C0, $50, $4D));
  xls.SetColorTheme(TPrimaryThemeColor.Accent3, TDrawingColor.FromRgb($9B, $BB, $59));
  xls.SetColorTheme(TPrimaryThemeColor.Accent4, TDrawingColor.FromRgb($80, $64, $A2));
  xls.SetColorTheme(TPrimaryThemeColor.Accent5, TDrawingColor.FromRgb($4B, $AC, $C6));
  xls.SetColorTheme(TPrimaryThemeColor.Accent6, TDrawingColor.FromRgb($F7, $96, $46));
  xls.SetColorTheme(TPrimaryThemeColor.HyperLink, TDrawingColor.FromRgb($00, $00, $FF));
  xls.SetColorTheme(TPrimaryThemeColor.FollowedHyperLink, TDrawingColor.FromRgb($80, $00, $80));

  //Major font
  MajorLatin := TThemeTextFont.Create('Cambria', '020F0302020204030204', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorEastAsian := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorComplexScript := TThemeTextFont.Create('', '', TPitchFamily.DEFAULT_PITCH__UNKNOWN_FONT_FAMILY, TDrawingFontCharSet.Default);
  MajorFont := TThemeFont.Create(MajorLatin, MajorEastAsian, MajorComplexScript);
  MajorFont.AddFont('Jpan', 'ＭＳ Ｐゴシック');
  MajorFont.AddFont('Hang', '맑은 고딕');
  MajorFont.AddFont('Hans', '宋体');
  MajorFont.AddFont('Hant', '新細明體');
  MajorFont.AddFont('Arab', 'Times New Roman');
  MajorFont.AddFont('Hebr', 'Times New Roman');
  MajorFont.AddFont('Thai', 'Tahoma');
  MajorFont.AddFont('Ethi', 'Nyala');
  MajorFont.AddFont('Beng', 'Vrinda');
  MajorFont.AddFont('Gujr', 'Shruti');
  MajorFont.AddFont('Khmr', 'MoolBoran');
  MajorFont.AddFont('Knda', 'Tunga');
  MajorFont.AddFont('Guru', 'Raavi');
  MajorFont.AddFont('Cans', 'Euphemia');
  MajorFont.AddFont('Cher', 'Plantagenet Cherokee');
  MajorFont.AddFont('Yiii', 'Microsoft Yi Baiti');
  MajorFont.AddFont('Tibt', 'Microsoft Himalaya');
  MajorFont.AddFont('Thaa', 'MV Boli');
  MajorFont.AddFont('Deva', 'Mangal');
  MajorFont.AddFont('Telu', 'Gautami');
  MajorFont.AddFont('Taml', 'Latha');
  MajorFont.AddFont('Syrc', 'Estrangelo Edessa');
  MajorFont.AddFont('Orya', 'Kalinga');
  MajorFont.AddFont('Mlym', 'Kartika');
  MajorFont.AddFont('Laoo', 'DokChampa');
  MajorFont.AddFont('Sinh', 'Iskoola Pota');
  MajorFont.AddFont('Mong', 'Mongolian Baiti');
  MajorFont.AddFont('Viet', 'Times New Roman');
  MajorFont.AddFont('Uigh', 'Microsoft Uighur');
  MajorFont.AddFont('Geor', 'Sylfaen');
  MajorFont.AddFont('Armn', 'Arial');
  MajorFont.AddFont('Bugi', 'Leelawadee UI');
  MajorFont.AddFont('Bopo', 'Microsoft JhengHei');
  MajorFont.AddFont('Java', 'Javanese Text');
  MajorFont.AddFont('Lisu', 'Segoe UI');
  MajorFont.AddFont('Mymr', 'Myanmar Text');
  MajorFont.AddFont('Nkoo', 'Ebrima');
  MajorFont.AddFont('Olck', 'Nirmala UI');
  MajorFont.AddFont('Osma', 'Ebrima');
  MajorFont.AddFont('Phag', 'Phagspa');
  MajorFont.AddFont('Syrn', 'Estrangelo Edessa');
  MajorFont.AddFont('Syrj', 'Estrangelo Edessa');
  MajorFont.AddFont('Syre', 'Estrangelo Edessa');
  MajorFont.AddFont('Sora', 'Nirmala UI');
  MajorFont.AddFont('Tale', 'Microsoft Tai Le');
  MajorFont.AddFont('Talu', 'Microsoft New Tai Lue');
  MajorFont.AddFont('Tfng', 'Ebrima');
  xls.SetThemeFont(TFontScheme.Major, MajorFont);

  //Set up rows and columns
  xls.DefaultColWidth := 2929;

  xls.SetColWidth(1, 1, 2929);  //(10.69 + 0.75) * 256

  xls.SetColWidth(2, 2, 4636);  //(17.36 + 0.75) * 256

  xls.SetColWidth(3, 3, 9500);  //(36.36 + 0.75) * 256

  xls.SetColWidth(4, 4, 4636);  //(17.36 + 0.75) * 256

  xls.SetColWidth(5, 5, 3896);  //(14.47 + 0.75) * 256

  xls.SetColWidth(6, 6, 4067);  //(15.14 + 0.75) * 256

  xls.SetColWidth(7, 7, 4238);  //(15.80 + 0.75) * 256

  xls.SetColWidth(8, 8, 6428);  //(24.36 + 0.75) * 256

  xls.SetColWidth(9, 9, 3697);  //(13.69 + 0.75) * 256

  xls.SetColWidth(10, 10, 6115);  //(23.14 + 0.75) * 256

  xls.SetColWidth(11, 11, 4465);  //(16.69 + 0.75) * 256

  xls.SetColWidth(12, 16384, 2929);  //(10.69 + 0.75) * 256
  xls.DefaultRowHeight := 264;

  xls.SetRowHeight(1, 312);  //15.60 * 20

  RowFmt := xls.GetFormat(xls.GetRowFormat(3));
  RowFmt.VAlignment := TVFlxAlignment.center;
  xls.SetRowFormat(3, xls.AddFormat(RowFmt));

  //Merged Cells
  xls.MergeCells(3, 5, 3, 11);
  xls.MergeCells(4, 5, 4, 11);

  //Set the cell values
  fmt := xls.GetCellVisibleFormatDef(1, 1);
  fmt.Font.Size20 := 240;
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(1, 1, xls.AddFormat(fmt));
  xls.SetCellValue(1, 1, 'Ref.No.');

  fmt := xls.GetCellVisibleFormatDef(1, 2);
  fmt.Font.Size20 := 240;
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(1, 2, xls.AddFormat(fmt));
  xls.SetCellValue(1, 2, 'Faaliyet No.');

  fmt := xls.GetCellVisibleFormatDef(1, 3);
  fmt.Font.Size20 := 240;
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(1, 3, xls.AddFormat(fmt));
  xls.SetCellValue(1, 3, 'Faaliyet');

  fmt := xls.GetCellVisibleFormatDef(1, 4);
  fmt.Font.Size20 := 240;
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(1, 4, xls.AddFormat(fmt));
  xls.SetCellValue(1, 4, 'Faaliyeta Grubu');

  fmt := xls.GetCellVisibleFormatDef(1, 5);
  fmt.Font.Size20 := 240;
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(1, 5, xls.AddFormat(fmt));
  xls.SetCellValue(1, 5, 'Baş. Tarih');

  fmt := xls.GetCellVisibleFormatDef(1, 6);
  fmt.Font.Size20 := 240;
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(1, 6, xls.AddFormat(fmt));
  xls.SetCellValue(1, 6, 'Son. Tarih');

  fmt := xls.GetCellVisibleFormatDef(1, 7);
  fmt.Font.Size20 := 240;
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(1, 7, xls.AddFormat(fmt));
  xls.SetCellValue(1, 7, 'Durum');

  fmt := xls.GetCellVisibleFormatDef(1, 8);
  fmt.Font.Size20 := 240;
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(1, 8, xls.AddFormat(fmt));
  xls.SetCellValue(1, 8, 'Ekleyen Kul.');

  fmt := xls.GetCellVisibleFormatDef(1, 9);
  fmt.Font.Size20 := 240;
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(1, 9, xls.AddFormat(fmt));
  xls.SetCellValue(1, 9, 'Ekleme Tar.');

  fmt := xls.GetCellVisibleFormatDef(1, 10);
  fmt.Font.Size20 := 240;
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(1, 10, xls.AddFormat(fmt));
  xls.SetCellValue(1, 10, 'Değiştiren Kul.');

  fmt := xls.GetCellVisibleFormatDef(1, 11);
  fmt.Font.Size20 := 240;
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(1, 11, xls.AddFormat(fmt));
  xls.SetCellValue(1, 11, 'Değiştirme Tar.');

  fmt := xls.GetCellVisibleFormatDef(2, 1);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.left;
  fmt.VAlignment := TVFlxAlignment.center;
  xls.SetCellFormat(2, 1, xls.AddFormat(fmt));
  xls.SetCellValue(2, 1, '<#faaliyet.id>');

  fmt := xls.GetCellVisibleFormatDef(2, 2);
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.left;
  fmt.VAlignment := TVFlxAlignment.center;
  xls.SetCellFormat(2, 2, xls.AddFormat(fmt));
  xls.SetCellValue(2, 2, '<#faaliyet.act_no>');

  fmt := xls.GetCellVisibleFormatDef(2, 3);
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.left;
  fmt.VAlignment := TVFlxAlignment.center;
  xls.SetCellFormat(2, 3, xls.AddFormat(fmt));
  xls.SetCellValue(2, 3, '<#faaliyet.act_name>');

  fmt := xls.GetCellVisibleFormatDef(2, 4);
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.left;
  fmt.VAlignment := TVFlxAlignment.center;
  xls.SetCellFormat(2, 4, xls.AddFormat(fmt));
  xls.SetCellValue(2, 4, '<#faaliyet.gr_name>');

  fmt := xls.GetCellVisibleFormatDef(2, 5);
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.Format := TFlxNumberFormat.RegionalDateString;
  fmt.HAlignment := THFlxAlignment.left;
  fmt.VAlignment := TVFlxAlignment.center;
  xls.SetCellFormat(2, 5, xls.AddFormat(fmt));
  xls.SetCellValue(2, 5, '<#faaliyet.start_date>');

  fmt := xls.GetCellVisibleFormatDef(2, 6);
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.Format := TFlxNumberFormat.RegionalDateString;
  fmt.HAlignment := THFlxAlignment.left;
  fmt.VAlignment := TVFlxAlignment.center;
  xls.SetCellFormat(2, 6, xls.AddFormat(fmt));
  xls.SetCellValue(2, 6, '<#faaliyet.exp_date>');

  fmt := xls.GetCellVisibleFormatDef(2, 7);
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.left;
  fmt.VAlignment := TVFlxAlignment.center;
  xls.SetCellFormat(2, 7, xls.AddFormat(fmt));
  xls.SetCellValue(2, 7, '<#faaliyet.status>');

  fmt := xls.GetCellVisibleFormatDef(2, 8);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.left;
  fmt.VAlignment := TVFlxAlignment.center;
  xls.SetCellFormat(2, 8, xls.AddFormat(fmt));
  xls.SetCellValue(2, 8, '<#faaliyet.insert_user>');

  fmt := xls.GetCellVisibleFormatDef(2, 9);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.Format := TFlxNumberFormat.RegionalDateString;
  fmt.HAlignment := THFlxAlignment.left;
  fmt.VAlignment := TVFlxAlignment.center;
  xls.SetCellFormat(2, 9, xls.AddFormat(fmt));
  xls.SetCellValue(2, 9, '<#faaliyet.idt>');

  fmt := xls.GetCellVisibleFormatDef(2, 10);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.left;
  fmt.VAlignment := TVFlxAlignment.center;
  xls.SetCellFormat(2, 10, xls.AddFormat(fmt));
  xls.SetCellValue(2, 10, '<#faaliyet.change_user>');

  fmt := xls.GetCellVisibleFormatDef(2, 11);
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.Format := TFlxNumberFormat.RegionalDateString;
  fmt.HAlignment := THFlxAlignment.left;
  fmt.VAlignment := TVFlxAlignment.center;
  xls.SetCellFormat(2, 11, xls.AddFormat(fmt));
  xls.SetCellValue(2, 11, '<#faaliyet.sdt>');

  fmt := xls.GetCellVisibleFormatDef(3, 1);
  fmt.Font.Size20 := 160;
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(3, 1, xls.AddFormat(fmt));

  fmt := xls.GetCellVisibleFormatDef(3, 2);
  fmt.Font.Size20 := 160;
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79998168889431);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(3, 2, xls.AddFormat(fmt));
  xls.SetCellValue(3, 2, 'Varlık Grubu Kodu');

  fmt := xls.GetCellVisibleFormatDef(3, 3);
  fmt.Font.Size20 := 160;
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79998168889431);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(3, 3, xls.AddFormat(fmt));
  xls.SetCellValue(3, 3, 'Varlık Grubu');

  fmt := xls.GetCellVisibleFormatDef(3, 4);
  fmt.Font.Size20 := 160;
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79998168889431);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(3, 4, xls.AddFormat(fmt));
  xls.SetCellValue(3, 4, 'Tebbir Kodu');

  fmt := xls.GetCellVisibleFormatDef(3, 5);
  fmt.Font.Size20 := 160;
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79998168889431);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(3, 5, xls.AddFormat(fmt));
  xls.SetCellValue(3, 5, 'Tedbir');

  fmt := xls.GetCellVisibleFormatDef(3, 6);
  fmt.Font.Size20 := 160;
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79998168889431);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(3, 6, xls.AddFormat(fmt));

  fmt := xls.GetCellVisibleFormatDef(3, 7);
  fmt.Font.Size20 := 160;
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79998168889431);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(3, 7, xls.AddFormat(fmt));

  fmt := xls.GetCellVisibleFormatDef(3, 8);
  fmt.Font.Size20 := 160;
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79998168889431);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(3, 8, xls.AddFormat(fmt));

  fmt := xls.GetCellVisibleFormatDef(3, 9);
  fmt.Font.Size20 := 160;
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79998168889431);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(3, 9, xls.AddFormat(fmt));

  fmt := xls.GetCellVisibleFormatDef(3, 10);
  fmt.Font.Size20 := 160;
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79998168889431);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(3, 10, xls.AddFormat(fmt));

  fmt := xls.GetCellVisibleFormatDef(3, 11);
  fmt.Font.Size20 := 160;
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Dark1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79998168889431);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(3, 11, xls.AddFormat(fmt));

  fmt := xls.GetCellVisibleFormatDef(4, 1);
  fmt.Font.Size20 := 160;
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.Style := [TFlxFontStyles.Bold];
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.left;
  fmt.VAlignment := TVFlxAlignment.center;
  fmt.WrapText := true;
  xls.SetCellFormat(4, 1, xls.AddFormat(fmt));

  fmt := xls.GetCellVisibleFormatDef(4, 2);
  fmt.Font.Size20 := 160;
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.left;
  fmt.VAlignment := TVFlxAlignment.center;
  xls.SetCellFormat(4, 2, xls.AddFormat(fmt));
  xls.SetCellValue(4, 2, '<#tedbir.agr_code>');

  fmt := xls.GetCellVisibleFormatDef(4, 3);
  fmt.Font.Size20 := 160;
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.left;
  fmt.VAlignment := TVFlxAlignment.center;
  xls.SetCellFormat(4, 3, xls.AddFormat(fmt));
  xls.SetCellValue(4, 3, '<#tedbir.agr_name>');

  fmt := xls.GetCellVisibleFormatDef(4, 4);
  fmt.Font.Size20 := 160;
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.left;
  fmt.VAlignment := TVFlxAlignment.center;
  xls.SetCellFormat(4, 4, xls.AddFormat(fmt));
  xls.SetCellValue(4, 4, '<#tedbir.prec_code>');

  fmt := xls.GetCellVisibleFormatDef(4, 5);
  fmt.Font.Size20 := 160;
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.VAlignment := TVFlxAlignment.center;
  xls.SetCellFormat(4, 5, xls.AddFormat(fmt));
  xls.SetCellValue(4, 5, '<#tedbir.prec_name>');

  fmt := xls.GetCellVisibleFormatDef(4, 6);
  fmt.Font.Size20 := 160;
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.VAlignment := TVFlxAlignment.center;
  xls.SetCellFormat(4, 6, xls.AddFormat(fmt));

  fmt := xls.GetCellVisibleFormatDef(4, 7);
  fmt.Font.Size20 := 160;
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.VAlignment := TVFlxAlignment.center;
  xls.SetCellFormat(4, 7, xls.AddFormat(fmt));

  fmt := xls.GetCellVisibleFormatDef(4, 8);
  fmt.Font.Size20 := 160;
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.VAlignment := TVFlxAlignment.center;
  xls.SetCellFormat(4, 8, xls.AddFormat(fmt));

  fmt := xls.GetCellVisibleFormatDef(4, 9);
  fmt.Font.Size20 := 160;
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.VAlignment := TVFlxAlignment.center;
  xls.SetCellFormat(4, 9, xls.AddFormat(fmt));

  fmt := xls.GetCellVisibleFormatDef(4, 10);
  fmt.Font.Size20 := 160;
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.VAlignment := TVFlxAlignment.center;
  xls.SetCellFormat(4, 10, xls.AddFormat(fmt));

  fmt := xls.GetCellVisibleFormatDef(4, 11);
  fmt.Font.Size20 := 160;
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.Automatic;
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.Automatic;
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.Automatic;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.Automatic;
  fmt.HAlignment := THFlxAlignment.center;
  fmt.VAlignment := TVFlxAlignment.center;
  xls.SetCellFormat(4, 11, xls.AddFormat(fmt));

  //Cell selection and scroll position.
  xls.SelectCell(2, 11, false);
  xls.ScrollWindow(1, 2);


  xls.ActiveSheet := 2;  //Set the sheet we are working in.

  //Sheet Options
  xls.SheetName := '<#Config>';

  //Set up rows and columns
  xls.DefaultColWidth := 2332;

  xls.SetColWidth(1, 1, 4522);  //(16.91 + 0.75) * 256

  xls.SetColWidth(2, 2, 4778);  //(17.91 + 0.75) * 256

  xls.SetColWidth(3, 3, 8362);  //(31.91 + 0.75) * 256

  xls.SetColWidth(4, 4, 6314);  //(23.91 + 0.75) * 256

  xls.SetColWidth(5, 7, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(8, 8, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(9, 9, 2986);  //(10.91 + 0.75) * 256

  xls.SetColWidth(10, 12, 426);  //(0.91 + 0.75) * 256

  xls.SetColWidth(13, 13, 3754);  //(13.91 + 0.75) * 256

  xls.SetColWidth(14, 14, 5290);  //(19.91 + 0.75) * 256

  xls.SetColWidth(15, 16384, 2332);  //(8.36 + 0.75) * 256

  xls.SetRowHeight(1, 348);  //17.40 * 20

  RowFmt := xls.GetFormat(xls.GetRowFormat(1));
  RowFmt.Font.Name := 'Cambria';
  RowFmt.Font.Size20 := 280;
  RowFmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  RowFmt.Font.Family := 1;
  RowFmt.Font.Scheme := TFontScheme.Major;
  RowFmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  RowFmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark1, 0.49998474074526);
  RowFmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetRowFormat(1, xls.AddFormat(RowFmt));
  xls.SetRowHeight(9, 528);  //26.40 * 20

  //Set the cell values
  fmt := xls.GetCellVisibleFormatDef(1, 1);
  fmt.Font.Name := 'Cambria';
  fmt.Font.Size20 := 280;
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.Family := 1;
  fmt.Font.Scheme := TFontScheme.Major;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark1, 0.49998474074526);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(1, 1, xls.AddFormat(fmt));
  xls.SetCellValue(1, 1, 'Configuration Sheet');

  fmt := xls.GetCellVisibleFormatDef(3, 1);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79995117038484);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(3, 1, xls.AddFormat(fmt));
  xls.SetCellValue(3, 1, 'Included Configs:');

  fmt := xls.GetCellVisibleFormatDef(4, 1);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79995117038484);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(4, 1, xls.AddFormat(fmt));
  xls.SetCellValue(4, 1, 'Data Sources:');

  fmt := xls.GetCellVisibleFormatDef(5, 1);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79995117038484);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(5, 1, xls.AddFormat(fmt));
  xls.SetCellValue(5, 1, 'Application to run:');

  fmt := xls.GetCellVisibleFormatDef(8, 1);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79995117038484);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(8, 1, xls.AddFormat(fmt));
  xls.SetCellValue(8, 1, 'Data');

  fmt := xls.GetCellVisibleFormatDef(8, 2);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79995117038484);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(8, 2, xls.AddFormat(fmt));

  fmt := xls.GetCellVisibleFormatDef(8, 3);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79995117038484);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(8, 3, xls.AddFormat(fmt));

  fmt := xls.GetCellVisibleFormatDef(8, 4);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79995117038484);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(8, 4, xls.AddFormat(fmt));

  fmt := xls.GetCellVisibleFormatDef(8, 8);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79995117038484);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(8, 8, xls.AddFormat(fmt));
  xls.SetCellValue(8, 8, 'Format');

  fmt := xls.GetCellVisibleFormatDef(8, 9);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79995117038484);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(8, 9, xls.AddFormat(fmt));

  fmt := xls.GetCellVisibleFormatDef(8, 13);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79995117038484);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(8, 13, xls.AddFormat(fmt));
  xls.SetCellValue(8, 13, 'Expressions');

  fmt := xls.GetCellVisibleFormatDef(8, 14);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.79995117038484);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  xls.SetCellFormat(8, 14, xls.AddFormat(fmt));

  fmt := xls.GetCellVisibleFormatDef(9, 1);
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.Family := 2;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.WrapText := true;
  xls.SetCellFormat(9, 1, xls.AddFormat(fmt));
  xls.SetCellValue(9, 1, 'Table Name');

  fmt := xls.GetCellVisibleFormatDef(9, 2);
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.Family := 2;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.WrapText := true;
  xls.SetCellFormat(9, 2, xls.AddFormat(fmt));
  xls.SetCellValue(9, 2, 'Source Name');

  fmt := xls.GetCellVisibleFormatDef(9, 3);
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.Family := 2;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.WrapText := true;
  xls.SetCellFormat(9, 3, xls.AddFormat(fmt));
  xls.SetCellValue(9, 3, 'Filter');

  fmt := xls.GetCellVisibleFormatDef(9, 4);
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.Family := 2;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.WrapText := true;
  xls.SetCellFormat(9, 4, xls.AddFormat(fmt));
  xls.SetCellValue(9, 4, 'Sort Fields ("," Separated), ASC or DESC');

  fmt := xls.GetCellVisibleFormatDef(9, 8);
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.Family := 2;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.WrapText := true;
  xls.SetCellFormat(9, 8, xls.AddFormat(fmt));
  xls.SetCellValue(9, 8, 'Format Name');

  fmt := xls.GetCellVisibleFormatDef(9, 9);
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.Family := 2;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.WrapText := true;
  xls.SetCellFormat(9, 9, xls.AddFormat(fmt));
  xls.SetCellValue(9, 9, 'Format Def');

  fmt := xls.GetCellVisibleFormatDef(9, 13);
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.Family := 2;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.WrapText := true;
  xls.SetCellFormat(9, 13, xls.AddFormat(fmt));
  xls.SetCellValue(9, 13, 'Name');

  fmt := xls.GetCellVisibleFormatDef(9, 14);
  fmt.Font.Color := TExcelColor.FromTheme(TThemeColor.Light1);
  fmt.Font.Family := 2;
  fmt.Borders.Left.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Left.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Right.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Right.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Top.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Top.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
  fmt.Borders.Bottom.Color := TExcelColor.FromTheme(TThemeColor.Light1, -0.14996795556505);
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromTheme(TThemeColor.Dark2, 0.39994506668294);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.WrapText := true;
  xls.SetCellFormat(9, 14, xls.AddFormat(fmt));
  xls.SetCellValue(9, 14, 'Expression');

  fmt := xls.GetCellVisibleFormatDef(10, 1);
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  xls.SetCellFormat(10, 1, xls.AddFormat(fmt));
  xls.SetCellValue(10, 1, 'faaliyet');
  xls.SetCellValue(10, 2, 'tbllist');
  xls.SetCellValue(10, 4, 'id ASC');

  fmt := xls.GetCellVisibleFormatDef(11, 1);
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  xls.SetCellFormat(11, 1, xls.AddFormat(fmt));
  xls.SetCellValue(11, 1, 'tedbir');
  xls.SetCellValue(11, 2, 'tbltedbir');
  xls.SetCellValue(11, 4, 'tedbir_id ASC');
  xls.SetCellValue(12, 1, 'RELATIONSHIP');

  fmt := xls.GetCellVisibleFormatDef(12, 2);
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  xls.SetCellFormat(12, 2, xls.AddFormat(fmt));
  xls.SetCellValue(12, 2, 'faaliyet->tedbir');

  fmt := xls.GetCellVisibleFormatDef(12, 3);
  fmt.Font.Family := 2;
  fmt.Font.CharSet := 162;
  xls.SetCellFormat(12, 3, xls.AddFormat(fmt));
  xls.SetCellValue(12, 3, 'id->tedbir_id');

  //Cell selection and scroll position.
  xls.SelectCell(1, 1, false);

end;

Function SablonOlusturKaydet(AsablonTip : TSablonTipi;Apaht :string):boolean;
var
  xls: TXlsFile;
begin
result := true;
try
    xls := TXlsFile.Create(true);
    try
      case AsablonTip of
        stbos: ;
        StDenetimEkibi:
        begin
          EK_A_Denetim_Ekibi_Toplu_EklemeSablonu(xls);
          xls.Save(Apaht);
        end ;
        StfaaliyetListesi :
        begin
          EK_C_4_listeSablonu(xls);
          xls.Save(Apaht);
        end;
        StDonanimBilgileriTopluEklemeSablonu:
        begin
         // DonanimBilgileriTopluEklemeSablonu(xls);
          DonanimBilgileriTopluEklemeSablonuValid(xls) ;
          xls.save(Apaht);
        end;
        StYazilimBilgileriTopluEklemeSablonu:
        begin
         // YazilimBilgileriTopluEklemeSablonu(xls);
         YazilimBilgileriTopluEklemeSablonuValid(xls) ;
         xls.save(Apaht);
        end;
        StPersonelBilgileriTopluEklemeSablonu:
        begin
          //PersonelBilgileriTopluEklemeSablonu(xls);
          PersonelBilgileriTopluEklemeSablonuValid(xls);
          xls.save(Apaht);
        end;
        StSistemBilgileriTopluEklemeSablonu:
        begin
          //SistemBilgileriTopluEklemeSablonu(xls);
          SistemBilgileriTopluEklemeSablonuValid(xls);
          xls.save(Apaht);
        end;
        StFMekanBilgileriTopluEklemeSablonu:
        begin
//          FmekanBilgileriTopluEklemeSablonu(xls);
          FmekanBilgileriTopluEklemeSablonuValid(xls);
          xls.save(Apaht);
        end;
        StfaaliyetListesi2:
        begin
          EK_C_4_listeSablonu2(xls);
          xls.Save(Apaht);
        end;
      end;

    finally
      result := true;
      xls.Free;
    end
Except
   result := false;
end;
end;

end.
