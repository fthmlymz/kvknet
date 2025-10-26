object frEnvanterListe2: TfrEnvanterListe2
  Left = 0
  Top = 0
  Width = 1042
  Height = 400
  OnCreate = UniFrameCreate
  TabOrder = 0
  object pnlTop: TUniPanel
    Left = 0
    Top = 0
    Width = 1042
    Height = 145
    Hint = ''
    Align = alTop
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      1042
      145)
    object edSrcType: TUniComboBox
      Left = 96
      Top = 13
      Width = 150
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'REF. NO'
      Items.Strings = (
        'REF. NO'
        'DEPARTMAN'
        #220'ST DEPARTMAN'
        'S'#220'RE'#199
        'VER'#304' KAYNA'#286'I'
        #304'LG'#304'L'#304' K'#304#350#304
        'TAR'#304'H'
        'OLU'#350'TURAN'
        'DE'#286#304#350'T'#304'REN')
      ItemIndex = 0
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
      CharCase = ecUpperCase
      ClearButton = True
      IconItems = <>
      OnChange = edSrcTypeChange
    end
    object edSrcActive: TUniComboBox
      Left = 252
      Top = 13
      Width = 150
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'AKT'#304'F'
      Items.Strings = (
        'AKT'#304'F'
        'PAS'#304'F'
        'T'#220'M'#220)
      ItemIndex = 0
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 3
      IconItems = <>
      OnChange = edSrcActiveChange
    end
    object UniLabel1: TUniLabel
      Left = 12
      Top = 18
      Width = 78
      Height = 13
      Hint = ''
      Caption = 'Arama Kriterleri'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
    end
    object btnSearch: TUniBitBtn
      Left = 96
      Top = 91
      Width = 96
      Height = 36
      Action = actSearch
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 5
      Images = MainMod.PrjImgList
      ImageIndex = 10
    end
    object btnClose: TUniBitBtn
      Left = 928
      Top = 91
      Width = 96
      Height = 36
      Action = actClose
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 6
      ClientEvents.ExtEvents.Strings = (
        
          'mouseover=function mouseover(sender, e, eOpts)'#13#10'{'#13#10'config.baseCl' +
          's="btn";'#13#10'config.cls="btn-danger";'#13#10'}')
      Images = MainMod.PrjImgList
      ImageIndex = 5
    end
    object btnAdd: TUniBitBtn
      Left = 198
      Top = 91
      Width = 120
      Height = 36
      Action = actAdd
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 7
      Images = MainMod.PrjImgList
      ImageIndex = 18
    end
    object btnEdit: TUniBitBtn
      Left = 324
      Top = 91
      Width = 96
      Height = 36
      Action = actEdit
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 8
      Images = MainMod.PrjImgList
      ImageIndex = 2
    end
    object btnDelete: TUniBitBtn
      Left = 426
      Top = 49
      Width = 96
      Height = 36
      Visible = False
      Action = actCopy
      Caption = 'EskiKopyala'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 9
      Images = MainMod.PrjImgList
      ImageIndex = 8
    end
    object UniLabel2: TUniLabel
      Left = 14
      Top = 48
      Width = 76
      Height = 13
      Hint = ''
      Caption = 'Aranacak '#304'fade'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 10
    end
    object edSrcDate: TUniDateTimePicker
      Left = 96
      Top = 45
      Width = 150
      Hint = ''
      Visible = False
      DateTime = 44101.000000000000000000
      DateFormat = 'dd.MM.yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 11
      ClientEvents.ExtEvents.Strings = (
        
          'keypress=function keypress(sender, e, eOpts)'#13#10'{'#13#10'   if (e.getKey' +
          '() == 13)'#13#10'   {'#13#10'      ajaxRequest(sender, '#39'doSearch'#39', ["aText="' +
          '+sender.getValue()]);'#13#10'   };'#13#10'}')
      OnAjaxEvent = edSrcDateAjaxEvent
    end
    object edSrcText: TUniEdit
      Left = 96
      Top = 45
      Width = 306
      Height = 23
      Hint = ''
      CharCaseConversion = uccTurkish
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
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
    object btnDownload: TUniMenuButton
      Left = 712
      Top = 91
      Width = 108
      Height = 36
      Hint = ''
      DropdownMenu = ppmDownload
      Caption = #304'ndir'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 12
      Images = MainMod.PrjImgList
      ImageIndex = 3
    end
    object UniBitBtn1: TUniBitBtn
      Left = 826
      Top = 91
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 13
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = UniBitBtn1Click
    end
    object UniMenuButton1: TUniMenuButton
      Left = 528
      Top = 91
      Width = 178
      Height = 36
      Hint = ''
      DropdownMenu = ppmHizli
      Caption = 'H'#305'zl'#305' Env.'#13#10'Formu'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 14
      Images = MainMod.PrjImgList
      ImageIndex = 27
    end
    object UniBitBtn2: TUniBitBtn
      Left = 426
      Top = 91
      Width = 96
      Height = 36
      Action = ActNewCopy
      Caption = 'Kopyala'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 15
      Images = MainMod.PrjImgList
      ImageIndex = 8
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 145
    Width = 1042
    Height = 255
    Hint = ''
    PagingBarAuxControl = pnlpagingBarcrt
    TitleFont.OverrideDefaults = [ovFontHeight]
    DataSource = dsEnvanter
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgCheckSelect, dgAlwaysShowSelection, dgConfirmDelete, dgMultiSelect, dgAutoRefreshRow, dgPersistentSelection]
    WebOptions.PageSize = 50
    LoadMask.Message = 'Veri y'#252'kleniyor...'
    EmptyText = 'Veri yok'
    Align = alClient
    Font.OverrideDefaults = [ovFontHeight]
    ParentFont = False
    TabOrder = 1
    OnSelectionChange = UniDBGrid1SelectionChange
    OnColumnSort = UniDBGrid1ColumnSort
    OnDrawColumnCell = UniDBGrid1DrawColumnCell
    OnAfterLoad = UniDBGrid1AfterLoad
    Columns = <
      item
        FieldName = 'id'
        Title.Alignment = taCenter
        Title.Caption = 'Ref. No'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 75
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'active'
        Title.Alignment = taCenter
        Title.Caption = 'Aktif'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 85
        Font.OverrideDefaults = [ovFontHeight]
        Alignment = taLeftJustify
        Sortable = True
        CheckBoxField.BooleanFieldOnly = False
        CheckBoxField.FieldValues = 'E;H'
        CheckBoxField.DisplayValues = 'EVET;HAYIR'
      end
      item
        FieldName = 'kilitli'
        Title.Alignment = taCenter
        Title.Caption = 'Kilitli'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 75
        Font.OverrideDefaults = [ovFontHeight]
        Alignment = taLeftJustify
        Sortable = True
        CheckBoxField.BooleanFieldOnly = False
        CheckBoxField.FieldValues = 'E;H'
        CheckBoxField.DisplayValues = 'EVET;HAYIR'
      end
      item
        FieldName = 'dept_str'
        Title.Alignment = taCenter
        Title.Caption = 'Departman'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 180
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'surec_str'
        Title.Alignment = taCenter
        Title.Caption = 'S'#252're'#231
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 250
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'kaynak_str'
        Title.Alignment = taCenter
        Title.Caption = 'Veri Kayna'#287#305
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 250
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'kisi_str'
        Title.Caption = #304'lgili Ki'#351'i'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 200
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'nitelik'
        Title.Alignment = taCenter
        Title.Caption = #214'zel Ntl. K'#351'l. Veri'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 135
        Font.OverrideDefaults = [ovFontHeight]
        Alignment = taLeftJustify
        Sortable = True
        CheckBoxField.BooleanFieldOnly = False
        CheckBoxField.FieldValues = 'E;H'
        CheckBoxField.DisplayValues = 'EVET;HAYIR'
      end
      item
        FieldName = 'tarih'
        Title.Alignment = taCenter
        Title.Caption = 'Tarih'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 80
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'olusturan'
        Title.Alignment = taCenter
        Title.Caption = 'Olu'#351'turan'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 180
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'main_dept_str'
        Title.Caption = #220'st Departman'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 250
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'degistiren'
        Title.Alignment = taCenter
        Title.Caption = 'De'#287'i'#351'tiren'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 180
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end>
  end
  object pnlpagingBarcrt: TUniPanel
    AlignWithMargins = True
    Left = 56
    Top = 334
    Width = 700
    Height = 29
    Hint = ''
    TabOrder = 2
    BorderStyle = ubsNone
    ShowCaption = False
    Caption = ''
    object lbKayitSayisi: TUniLabel
      AlignWithMargins = True
      Left = 513
      Top = 7
      Width = 180
      Height = 19
      Hint = ''
      Margins.Top = 7
      Margins.Right = 7
      AutoSize = False
      Caption = 'lbKayitSayisi'
      Align = alRight
      TabOrder = 1
    end
    object UniPanel37: TUniPanel
      AlignWithMargins = True
      Left = 3
      Top = 5
      Width = 20
      Height = 19
      Hint = ''
      Margins.Top = 5
      Margins.Bottom = 5
      ShowHint = True
      ParentShowHint = False
      Align = alLeft
      ParentFont = False
      Font.Charset = TURKISH_CHARSET
      Font.Color = clBlack
      Font.Name = 'Verdana'
      TabOrder = 2
      Caption = ''
      Color = 14803455
    end
    object UniLabel3: TUniLabel
      AlignWithMargins = True
      Left = 29
      Top = 7
      Width = 120
      Height = 19
      Hint = ''
      Margins.Top = 7
      Margins.Right = 7
      AutoSize = False
      Caption = 'Kontrol Formu Yok'
      Align = alLeft
      TabOrder = 3
    end
    object UniPanel1: TUniPanel
      AlignWithMargins = True
      Left = 159
      Top = 5
      Width = 20
      Height = 19
      Hint = ''
      Margins.Top = 5
      Margins.Bottom = 5
      ShowHint = True
      ParentShowHint = False
      Align = alLeft
      ParentFont = False
      Font.Charset = TURKISH_CHARSET
      Font.Color = clBlack
      Font.Name = 'Verdana'
      TabOrder = 4
      Caption = ''
      Color = clInfoBk
    end
    object UniLabel4: TUniLabel
      AlignWithMargins = True
      Left = 185
      Top = 7
      Width = 179
      Height = 19
      Hint = ''
      Margins.Top = 7
      Margins.Right = 7
      AutoSize = False
      Caption = 'Kontrol Formu Kilitli'
      Align = alLeft
      TabOrder = 5
    end
  end
  object dsEnvanter: TUniDataSource
    DataSet = qEnvanter
    Left = 279
    Top = 165
  end
  object ActList: TActionList
    Left = 339
    Top = 165
    object actAdd: TAction
      Caption = 'Yeni Kay'#305't'
      OnExecute = actAddExecute
    end
    object actEdit: TAction
      Caption = 'De'#287'i'#351'tir'
      OnExecute = actEditExecute
    end
    object actCopy: TAction
      Caption = 'Kopyala'
      Hint = 'Se'#231'ili Kayd'#305'n Koyas'#305'n'#305' Olu'#351'tur'
      OnExecute = actCopyExecute
    end
    object actSearch: TAction
      Caption = 'Liste'
      OnExecute = actSearchExecute
    end
    object actClose: TAction
      Caption = 'Kapat'
      OnExecute = actCloseExecute
    end
    object actHizliAdd: TAction
      Caption = 'H'#305'zl'#305' Ekle'
      OnExecute = actHizliAddExecute
    end
    object actHizliEdit: TAction
      Caption = 'H'#305'zl'#305' D'#252'zenle'
      OnExecute = actHizliEditExecute
    end
    object ActNewCopy: TAction
      Caption = 'ActNewCopy'
      OnExecute = ActNewCopyExecute
    end
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    Left = 276
    Top = 219
  end
  object ppmDownload: TUniPopupMenu
    ScreenMask.Enabled = True
    ScreenMask.Message = 'Dok'#252'man Haz'#305'rlan'#305'yor...'
    ScreenMask.Color = 16744448
    Left = 409
    Top = 161
    object ppmiEnvanterListesi: TUniMenuItem
      Caption = 'Detayl'#305' Envanter Listesi'
      OnClick = ppmiEnvanterListesiClick
    end
    object ppmiKVKKPolitikasi: TUniMenuItem
      Caption = 'KVKK Politikas'#305
      OnClick = ppmiKVKKPolitikasiClick
    end
    object ppmiImhaPolitikasi: TUniMenuItem
      Caption = 'Saklama ve '#304'mha Politikas'#305
      OnClick = ppmiImhaPolitikasiClick
    end
    object ppmOzelNitelikliVeriPolitikasi: TUniMenuItem
      Caption = #214'zel Nitelikli Veri Politikas'#305
      OnClick = ppmOzelNitelikliVeriPolitikasiClick
    end
  end
  object tblCatVT: TVirtualTable
    FieldDefs = <
      item
        Name = 'cat_id'
        DataType = ftInteger
      end
      item
        Name = 'cat_str'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'cat_info'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'cat_vt'
        DataType = ftString
        Size = 2000
      end>
    Left = 435
    Top = 219
    Data = {
      0400040006006361745F6964030000000000000007006361745F737472010064
      000000000008006361745F696E666F0100F4010000000006006361745F767401
      00D00700000000000000000000}
  end
  object qCatVT: TVirtualQuery
    IndexFieldNames = 'cat_str'
    SourceDataSets = <
      item
        DataSet = tblCatVT
      end>
    SQL.Strings = (
      'SELECT * FROM tblCatVT')
    Left = 489
    Top = 219
  end
  object qTmp2: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    Left = 321
    Top = 219
  end
  object tblKisiVT: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'kisi_id'
        DataType = ftInteger
      end
      item
        Name = 'kisi_str'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'kisi_vt'
        DataType = ftString
        Size = 2000
      end>
    Left = 435
    Top = 264
    Data = {
      0400030007006B6973695F6964030000000000000008006B6973695F73747201
      0064000000000007006B6973695F76740100D00700000000000000000000}
  end
  object qKisiVT: TVirtualQuery
    IndexFieldNames = 'kisi_str'
    SourceDataSets = <
      item
        DataSet = tblKisiVT
      end>
    SQL.Strings = (
      'SELECT * FROM tblKisiVT')
    Left = 489
    Top = 264
  end
  object tblTaraf: TVirtualTable
    FieldDefs = <
      item
        Name = 'taraf_id'
        DataType = ftInteger
      end
      item
        Name = 'taraf_str'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'taraf_info'
        DataType = ftString
        Size = 500
      end>
    Left = 435
    Top = 309
    Data = {
      04000300080074617261665F69640300000000000000090074617261665F7374
      7201006400000000000A0074617261665F696E666F0100F40100000000000000
      000000}
  end
  object qTaraf: TVirtualQuery
    IndexFieldNames = 'taraf_str'
    SourceDataSets = <
      item
        DataSet = tblTaraf
      end>
    SQL.Strings = (
      'SELECT * FROM tblTaraf')
    Left = 489
    Top = 309
  end
  object qKisi: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      
        'SELECT DISTINCT (env.kisi_id), ks.kisi AS kisi_str, ks.descripti' +
        'on, '
      'string_agg(vt.veri_tipi,'#39', '#39')::varchar as veritipi_str'
      'FROM data_envanter env'
      'LEFT JOIN def_data_kisi ks ON ks.id = env.kisi_id'
      'LEFT JOIN def_data_veritipi vt ON vt.id = env.veritipi_id  '
      'WHERE env.active = '#39'E'#39' AND env.mc_id = 2'
      'GROUP by kisi_id, ks.kisi, ks.description'
      'ORDER BY env.kisi_id'
      '')
    Left = 534
    Top = 219
  end
  object qEnvanter: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT *'
      'FROM data_envanter'
      'WHERE main_id = 0'
      'ORDER BY id')
    Left = 219
    Top = 165
  end
  object tblSure: TVirtualTable
    FieldDefs = <
      item
        Name = 'cat_id'
        DataType = ftInteger
      end
      item
        Name = 'cat_str'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'data_str'
        DataType = ftString
        Size = 300
      end>
    Left = 584
    Top = 219
    Data = {
      0400030006006361745F6964030000000000000007006361745F73747201002C
      01000000000800646174615F73747201002C0100000000000000000000}
  end
  object qSure: TVirtualQuery
    SourceDataSets = <
      item
        DataSet = tblSure
      end>
    SQL.Strings = (
      'SELECT * FROM tblAmac')
    Left = 638
    Top = 219
  end
  object DOCXRpt: TrXMLReport
    ActionAfter = aaNone
    OnUserCalc = DOCXRptUserCalc
    Left = 477
    Top = 164
  end
  object ppmHizli: TUniPopupMenu
    ScreenMask.Enabled = True
    ScreenMask.Message = 'Dok'#252'man Haz'#305'rlan'#305'yor...'
    ScreenMask.Color = 16744448
    Left = 538
    Top = 167
    object HzlGiri1: TUniMenuItem
      Action = actHizliAdd
    end
    object HzlDzenle1: TUniMenuItem
      Action = actHizliEdit
    end
  end
  object qdayanak: TUniQuery
    Connection = MainMod.DBMain
    Left = 728
    Top = 184
  end
  object qamac: TUniQuery
    Connection = MainMod.DBMain
    Left = 728
    Top = 240
  end
  object qilgiliKisiSure: TUniQuery
    Connection = MainMod.DBMain
    Left = 592
    Top = 288
  end
  object frKVKKPolitika: TfrxReport
    Version = '2023.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45510.473970023200000000
    ReportOptions.LastChange = 45510.473970023200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin '
      '//report.Variables['#39'companyaddress'#39'] := '#39#39#39#39' + '#39'test'#39' + '#39#39#39#39';  '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 840
    Top = 248
    Datasets = <
      item
        DataSet = qmcdef
        DataSetName = 'qMcdef'
      end
      item
        DataSet = qkategori
        DataSetName = 'qkategori'
      end
      item
        DataSet = tblVtKisi
        DataSetName = 'tblVtKisi'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      OnBeforePrint = 'Page1OnBeforePrint'
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 173.858380000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 30.236240000000000000
          Top = 15.118120000000000000
          Width = 211.653680000000000000
          Height = 90.708720000000000000
          DataField = 'krm_logo'
          DataSet = qmcdef
          DataSetName = 'qMcdef'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 374.173470000000000000
        Top = 215.433210000000000000
        Width = 718.110700000000000000
        object Rich1: TfrxRichView
          Align = baClient
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 374.173470000000000000
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235345C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313035357B5C666F6E7474626C7B5C66
            305C6673776973735C66707271325C666368617273657431363220417269616C
            3B7D7D0D0A7B5C2A5C67656E657261746F722052696368656432302031302E30
            2E32363130307D5C766965776B696E64345C756331200D0A5C706172645C7769
            6463746C7061725C73613136305C736C3235325C736C6D756C74315C716A5C62
            5C66305C6673323220312E5C74616220475C276464525C2764645C276465205C
            7061720D0A312E312E5C74616220506F6C6974696B616E5C2766646E20416D61
            635C276664205C7061720D0A312E312E312E5C7461625C6230204B695C276665
            6973656C20566572696C6572696E204B6F72756E6D61735C27666420506F6C69
            74696B61735C2766645C7271756F7465206E5C2766646E2028506F6C6974696B
            612920616D61635C2766645C62202C205B714D636465662E226B726D5F756E76
            616E225D2020285B714D636465662E227469746C65225D29205C6230206B695C
            2766656973656C20766572696C6572696E206B6F72756E6D61735C2766646E61
            20795C2766366E656C696B2062656E696D73656E656E2073697374656D6C6572
            206B6F6E7573756E646120615C2765375C2766646B6C616D616C617264612062
            756C756E6D616B20766520735C27666372655C2765376C65726520696C695C27
            66656B696E20657361736C61725C2766642062656C69726C656D656B7469722E
            205C7061720D0A5C7061720D0A5C6220312E322E5C746162204B617073616D5C
            2766645C7061720D0A312E332E5C7461625C623020506F6C6974696B612C205C
            62205B714D636465662E227469746C65225D5C62302074617261665C2766646E
            64616E20795C2766366E6574696C656E2C206B695C2766656973656C20766572
            696C6572696E20695C2766656C656E6D657369207665206B6F72756E6D61735C
            2766646E6120795C2766366E656C696B20795C276663725C276663745C276663
            6C656E20745C2766636D206661616C697965746C6572646520757967756C616E
            6D616B7461645C27666472207665206B695C2766656973656C20766572697369
            20695C2766656C656E656E206B695C276665696C6572696E206F746F6D617469
            6B206F6C616E2079612064612068657268616E6769206269722076657269206B
            61795C276664742073697374656D696E696E207061725C27653761735C276664
            206F6C6D616B206B6179645C276664796C61206F746F6D6174696B206F6C6D61
            79616E20796F6C6C61726C6120695C2766656C656E656E20745C2766636D206B
            695C2766656973656C20766572696C6572696E6520696C695C2766656B696E64
            69722E205C756C5C625C7061720D0A5C756C6E6F6E6520312E342E5C7461625C
            756C20427520706F6C6974696B612C206B695C2766656973656C207665726920
            6E6974656C695C276630692074615C2766655C2766646D6179616E2076657269
            6C65726520757967756C616E6D617A2E205C7061720D0A5C756C6E6F6E655C62
            305C7061720D0A7D0D0A00}
        end
      end
    end
  end
  object qmcdef: TfrxDBDataset
    UserName = 'qMcdef'
    CloseDataSource = False
    DataSet = MainMod.qMCDef
    BCDToCurrency = False
    DataSetOptions = []
    Left = 776
    Top = 304
  end
  object qkategori: TfrxDBDataset
    UserName = 'qkategori'
    CloseDataSource = False
    DataSet = qCatVT
    BCDToCurrency = False
    DataSetOptions = []
    Left = 824
    Top = 304
  end
  object tblVtKisi: TfrxDBDataset
    UserName = 'tblVtKisi'
    CloseDataSource = False
    DataSet = tblKisiVT
    BCDToCurrency = False
    DataSetOptions = []
    Left = 864
    Top = 304
  end
  object frxDesigner1: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    GradientEnd = 11982554
    GradientStart = clWindow
    TemplatesExt = 'fr3'
    Restrictions = []
    RTLLanguage = False
    MemoParentFont = False
    Left = 800
    Top = 240
  end
  object frxDOCXExport1: TfrxDOCXExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    PictureType = gpPNG
    ExportType = dxTable
    Left = 880
    Top = 232
  end
end
