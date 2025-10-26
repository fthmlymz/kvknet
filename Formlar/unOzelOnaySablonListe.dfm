object frOzelOnaySablonListe: TfrOzelOnaySablonListe
  Left = 0
  Top = 0
  Width = 955
  Height = 400
  OnCreate = UniFrameCreate
  TabOrder = 0
  object lbKayitSayisi: TUniLabel
    Left = 300
    Top = 304
    Width = 62
    Height = 13
    Hint = ''
    Caption = 'lbKayitSayisi'
    TabOrder = 2
  end
  object pnlTop: TUniPanel
    Left = 0
    Top = 0
    Width = 955
    Height = 145
    Hint = ''
    Align = alTop
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      955
      145)
    object edSrcText: TUniEdit
      Left = 96
      Top = 45
      Width = 410
      Hint = ''
      CharCaseConversion = uccTurkish
      CharCase = ecUpperCase
      Text = ''
      TabOrder = 1
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase('#39'TR'#39')); '#13#10'  sender.inputEl.' +
          'dom.setSelectionRange(pos, pos);'#13#10'}'
        
          'keypress=function keypress(sender, e, eOpts)'#13#10'{'#13#10'   if (e.getKey' +
          '() == 13)'#13#10'   {'#13#10'      ajaxRequest(sender, '#39'doSearch'#39', ["aText="' +
          '+sender.getValue()]);'#13#10'   };'#13#10'}')
      OnAjaxEvent = edSrcTextAjaxEvent
    end
    object UniLabel1: TUniLabel
      Left = 12
      Top = 17
      Width = 78
      Height = 13
      Hint = ''
      Caption = 'Arama Kriterleri'
      TabOrder = 2
    end
    object btnSearch: TUniBitBtn
      Left = 96
      Top = 91
      Width = 96
      Height = 36
      Action = actSearch
      TabOrder = 3
      Images = MainMod.PrjImgList
      ImageIndex = 10
    end
    object btnClose: TUniBitBtn
      Left = 845
      Top = 91
      Width = 96
      Height = 36
      Action = actClose
      Anchors = [akRight, akBottom]
      TabOrder = 4
      Images = MainMod.PrjImgList
      ImageIndex = 5
    end
    object btnAdd: TUniBitBtn
      Left = 198
      Top = 91
      Width = 96
      Height = 36
      Action = actAdd
      TabOrder = 5
      Images = MainMod.PrjImgList
      ImageIndex = 18
    end
    object btnEdit: TUniBitBtn
      Left = 300
      Top = 91
      Width = 96
      Height = 36
      Action = actEdit
      TabOrder = 6
      Images = MainMod.PrjImgList
      ImageIndex = 2
    end
    object UniLabel2: TUniLabel
      Left = 14
      Top = 49
      Width = 76
      Height = 13
      Hint = ''
      Caption = 'Aranacak '#304'fade'
      TabOrder = 7
    end
    object edSrcDurumu: TUniComboBox
      Left = 232
      Top = 15
      Width = 108
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'YAYINDA'
      Items.Strings = (
        'T'#220'M'#220
        'YAYINDA'
        #304'NCELEMEDE'
        'PAS'#304'F')
      ItemIndex = 1
      TabOrder = 9
      CharCase = ecUpperCase
      IconItems = <>
      OnChange = edSrcTipiChange
    end
    object edSrcTipi: TUniComboBox
      Left = 96
      Top = 15
      Width = 130
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'TANIM'
      Items.Strings = (
        'REF. NO'
        'TANIM'
        'A'#199'IKLAMA')
      ItemIndex = 1
      TabOrder = 8
      CharCase = ecUpperCase
      IconItems = <>
      OnChange = edSrcTipiChange
    end
    object edSrcIys: TUniComboBox
      Left = 346
      Top = 15
      Width = 160
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'T'#220'M'#220
      Items.Strings = (
        'T'#220'M'#220
        'IYS '#304'STENECEK'
        'IYS '#304'STENMEYECEK')
      ItemIndex = 0
      TabOrder = 10
      CharCase = ecUpperCase
      IconItems = <>
      OnChange = edSrcIysChange
    end
    object UniMenuButton1: TUniMenuButton
      Left = 402
      Top = 91
      Width = 160
      Height = 36
      Hint = ''
      DropdownMenu = ppmExcel
      Caption = 'Toplu '#304#351'lemler'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 11
      Images = MainMod.PrjImgList
      ImageIndex = 15
    end
    object btnHelp: TUniBitBtn
      Left = 743
      Top = 91
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 12
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = btnHelpClick
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 145
    Width = 955
    Height = 255
    Hint = ''
    PagingBarAuxControl = lbKayitSayisi
    TitleFont.OverrideDefaults = [ovFontHeight]
    DataSource = dsOzelOnay
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    WebOptions.PageSize = 100
    LoadMask.Message = 'Veri y'#252'kleniyor...'
    EmptyText = 'Veri yok'
    Align = alClient
    Font.OverrideDefaults = [ovFontHeight]
    ParentFont = False
    TabOrder = 1
    OnColumnSort = UniDBGrid1ColumnSort
    Columns = <
      item
        FieldName = 'id'
        Title.Caption = 'Ref. No'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 75
        Font.OverrideDefaults = [ovFontHeight]
        Alignment = taCenter
        Sortable = True
      end
      item
        FieldName = 'durum'
        Title.Caption = 'Durum'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 120
        Font.OverrideDefaults = [ovFontHeight]
        Alignment = taCenter
        Sortable = True
      end
      item
        FieldName = 'oo_tur'
        Title.Caption = 'Portal Grubu'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 100
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'onay_var'
        Title.Caption = #214'zel Onay'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 85
        Font.OverrideDefaults = [ovFontHeight]
        Alignment = taCenter
        Sortable = True
        CheckBoxField.BooleanFieldOnly = False
        CheckBoxField.FieldValues = 'E;H'
        CheckBoxField.DisplayValues = 'VAR;YOK'
      end
      item
        FieldName = 'iys_var'
        Title.Caption = #304'YS Onay'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 85
        Font.OverrideDefaults = [ovFontHeight]
        Alignment = taCenter
        Sortable = True
        CheckBoxField.BooleanFieldOnly = False
        CheckBoxField.FieldValues = 'E;H'
        CheckBoxField.DisplayValues = 'VAR;YOK'
      end
      item
        FieldName = 'tanim'
        Title.Caption = 'Tan'#305'm'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 400
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
        DisplayMemo = True
      end
      item
        FieldName = 'description'
        Title.Caption = 'A'#231#305'klama'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 500
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end>
  end
  object ActList: TActionList
    Left = 348
    Top = 165
    object actAdd: TAction
      Caption = 'Yeni Kay'#305't'
      OnExecute = actAddExecute
    end
    object actEdit: TAction
      Caption = 'De'#287'i'#351'tir'
      OnExecute = actEditExecute
    end
    object actDownload: TAction
      Caption = #350'ablon '#304'ndir'
    end
    object actSearch: TAction
      Caption = 'Liste'
      OnExecute = actSearchExecute
    end
    object actClose: TAction
      Caption = 'Kapat'
      OnExecute = actCloseExecute
    end
    object actExcel: TAction
      Caption = 'Listeyi Excel'#39'e Kaydet'
      OnExecute = actExcelExecute
    end
    object actTopluKarekod: TAction
      Caption = 'Karekodlar'#305' Toplu Kaydet'
      OnExecute = actTopluKarekodExecute
    end
  end
  object dsOzelOnay: TUniDataSource
    DataSet = qOzelOnay
    Left = 279
    Top = 165
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user')
    Left = 405
    Top = 222
  end
  object qSure: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      
        'SELECT DISTINCT kategori_str, veritipi_str, sakl_ssure, sakl_fsu' +
        're'
      'FROM vw_data_envanter'
      'WHERE active = '#39'E'#39' AND mc_id = 2 AND kisi_id = 369')
    Left = 453
    Top = 222
  end
  object tblAktarim: TVirtualTable
    FieldDefs = <
      item
        Name = 'kaynak_id'
        DataType = ftInteger
      end
      item
        Name = 'kaynak_str'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'kategori_ids'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'kategori_str'
        DataType = ftString
        Size = 5000
      end
      item
        Name = 'veritipi_ids'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'veritipi_str'
        DataType = ftString
        Size = 5000
      end
      item
        Name = 'payl_amac_ids'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'payl_amac_str'
        DataType = ftString
        Size = 5000
      end
      item
        Name = 'payl_taraf_ids'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'payl_taraf_str'
        DataType = ftString
        Size = 5000
      end
      item
        Name = 'payl_metod_ids'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'payl_metod_str'
        DataType = ftString
        Size = 5000
      end>
    Left = 498
    Top = 222
    Data = {
      04000C0009006B61796E616B5F696403000000000000000A006B61796E616B5F
      7374720100F401000000000C006B617465676F72695F6964730100F401000000
      000C006B617465676F72695F73747201008813000000000C0076657269746970
      695F6964730100F401000000000C0076657269746970695F7374720100881300
      0000000D007061796C5F616D61635F6964730100F401000000000D007061796C
      5F616D61635F73747201008813000000000E007061796C5F74617261665F6964
      730100F401000000000E007061796C5F74617261665F73747201008813000000
      000E007061796C5F6D65746F645F6964730100F401000000000E007061796C5F
      6D65746F645F7374720100881300000000000000000000}
  end
  object qOzelOnay: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT *'
      'FROM def_data_ozelonay'
      'ORDER BY id')
    Left = 219
    Top = 165
  end
  object ppmExcel: TUniPopupMenu
    Left = 520
    Top = 168
    object UniMenuItem5: TUniMenuItem
      Action = actExcel
    end
    object KarekodlarTopluKaydet1: TUniMenuItem
      Action = actTopluKarekod
    end
  end
  object tblKarekod: TVirtualTable
    FieldDefs = <
      item
        Name = 'ref_no'
        DataType = ftInteger
      end
      item
        Name = 'durum'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'tanim'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'web_adresi'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'aciklama'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'karekod'
        DataType = ftBlob
      end>
    Left = 618
    Top = 270
    Data = {
      0400060006007265665F6E6F03000000000000000500647572756D0100140000
      000000050074616E696D0100C800000000000A007765625F6164726573690100
      C8000000000008006163696B6C616D610100C8000000000007006B6172656B6F
      640F00000000000000000000000000}
  end
  object frxReportKarekod: TfrxReport
    Version = '2023.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Varsay'#305'lan'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44589.434054710600000000
    ReportOptions.LastChange = 44589.434054710600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 664
    Top = 248
    Datasets = <
      item
        DataSet = frxdsKarekod
        DataSetName = 'frxdsKarekod'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 188.976377950000000000
        Top = 98.267780000000000000
        Width = 1046.929810000000000000
        DataSet = frxdsKarekod
        DataSetName = 'frxdsKarekod'
        RowCount = 0
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Width = 75.590599999999990000
          Height = 188.976500000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsKarekod."ref_no"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 75.590600000000000000
          Width = 321.260050000000000000
          Height = 188.976500000000000000
          DataField = 'tanim'
          DataSet = frxdsKarekod
          DataSetName = 'frxdsKarekod'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsKarekod."tanim"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Width = 226.771800000000000000
          Height = 188.976500000000000000
          DataField = 'web_adresi'
          DataSet = frxdsKarekod
          DataSetName = 'frxdsKarekod'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsKarekod."web_adresi"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 396.850650000000000000
          Width = 226.771800000000000000
          Height = 188.976500000000000000
          DataField = 'aciklama'
          DataSet = frxdsKarekod
          DataSetName = 'frxdsKarekod'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsKarekod."aciklama"]')
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 850.394250000000100000
          Width = 188.976377950000000000
          Height = 188.976377950000000000
          DataField = 'karekod'
          DataSet = frxdsKarekod
          DataSetName = 'frxdsKarekod'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Ref No')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 75.590600000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          DataSet = frxdsKarekod
          DataSetName = 'frxdsKarekod'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Dok'#252'man Tan'#305'm'#305)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          DataSet = frxdsKarekod
          DataSetName = 'frxdsKarekod'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Web Adresi')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 396.850650000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          DataSet = frxdsKarekod
          DataSetName = 'frxdsKarekod'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'A'#231#305'klama')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 850.394250000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Karekod')
          ParentFont = False
        end
      end
    end
  end
  object frxdsKarekod: TfrxDBDataset
    UserName = 'frxdsKarekod'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ref_no=ref_no'
      'durum=durum'
      'tanim=tanim'
      'web_adresi=web_adresi'
      'aciklama=aciklama'
      'karekod=karekod')
    DataSet = tblKarekod
    BCDToCurrency = False
    DataSetOptions = []
    Left = 712
    Top = 288
  end
  object frxDOCXExport1: TfrxDOCXExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    PictureType = gpPNG
    ExportType = dxTable
    Left = 784
    Top = 288
  end
  object qExport: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user')
    Left = 461
    Top = 166
  end
end
