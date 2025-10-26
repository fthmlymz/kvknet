object frVSBasvuruListe: TfrVSBasvuruListe
  Left = 0
  Top = 0
  Width = 1024
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
    Width = 1024
    Height = 103
    Hint = ''
    Align = alTop
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      1024
      103)
    object edSrcType: TUniComboBox
      Left = 96
      Top = 13
      Width = 180
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'REF. NO'
      Items.Strings = (
        'REF. NO'
        'DURUMU'
        'BA'#350'V. '#350'EKL'#304
        'BA'#350'V. EVR. NO'
        'CEVAP '#350'EKL'#304
        'CEVAP EVR. NO'
        #304'LG'#304'L'#304' K'#304#350#304
        'ADI'
        'SOYADI'
        #350'EH'#304'R'
        'CEP TELEFONU')
      ItemIndex = 0
      TabOrder = 1
      CharCase = ecUpperCase
      IconItems = <>
      OnChange = edSrcTypeChange
    end
    object edSrcDurum: TUniComboBox
      Left = 96
      Top = 41
      Width = 180
      Height = 28
      Hint = ''
      Visible = False
      Style = csDropDownList
      Text = 'T'#220'M'#220
      Items.Strings = (
        'T'#220'M'#220
        'BEKLEMEDE'
        #304'NCELEN'#304'YOR'
        'CEVAPLANDI')
      ItemIndex = 0
      TabOrder = 3
      IconItems = <>
      OnChange = edSrcDurumChange
    end
    object UniLabel1: TUniLabel
      Left = 12
      Top = 20
      Width = 78
      Height = 13
      Hint = ''
      Caption = 'Arama Kriterleri'
      TabOrder = 4
    end
    object btnSearch: TUniBitBtn
      Left = 283
      Top = 20
      Width = 96
      Height = 36
      Action = actSearch
      TabOrder = 5
      Images = MainMod.PrjImgList
      ImageIndex = 10
    end
    object btnClose: TUniBitBtn
      Left = 900
      Top = 20
      Width = 96
      Height = 36
      Action = actClose
      Anchors = [akTop, akRight]
      TabOrder = 6
      Images = MainMod.PrjImgList
      ImageIndex = 5
    end
    object btnAdd: TUniBitBtn
      Left = 385
      Top = 20
      Width = 96
      Height = 36
      Action = actAdd
      TabOrder = 7
      Images = MainMod.PrjImgList
      ImageIndex = 18
    end
    object btnEdit: TUniBitBtn
      Left = 487
      Top = 20
      Width = 96
      Height = 36
      Action = actEdit
      TabOrder = 8
      Images = MainMod.PrjImgList
      ImageIndex = 2
    end
    object UniLabel2: TUniLabel
      Left = 12
      Top = 50
      Width = 76
      Height = 13
      Hint = ''
      Caption = 'Aranacak '#304'fade'
      TabOrder = 9
    end
    object edSrcBvSekil: TUniComboBox
      Left = 96
      Top = 54
      Width = 180
      Height = 28
      Hint = ''
      Visible = False
      Style = csDropDownList
      Text = 'T'#220'M'#220
      Items.Strings = (
        'T'#220'M'#220
        'ELDEN'
        #350'AHSEN'
        'NOTER'
        'KEP'
        'MA'#304'L'
        'TAAH. POSTA'
        'ONLINE')
      ItemIndex = 0
      TabOrder = 10
      IconItems = <>
      OnChange = edSrcDurumChange
    end
    object edSrcCvSekil: TUniComboBox
      Left = 96
      Top = 66
      Width = 180
      Height = 28
      Hint = ''
      Visible = False
      Style = csDropDownList
      Text = 'T'#220'M'#220
      Items.Strings = (
        'T'#220'M'#220
        'ELDEN'
        'KEP'
        'MA'#304'L'
        'NOTER'
        'TAAH. POSTA')
      ItemIndex = 0
      TabOrder = 11
      IconItems = <>
      OnChange = edSrcDurumChange
    end
    object edSrcText: TUniEdit
      Left = 96
      Top = 75
      Width = 180
      Hint = ''
      CharCaseConversion = uccTurkish
      CharCase = ecUpperCase
      Text = ''
      TabOrder = 2
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase('#39'TR'#39')); '#13#10'  sender.inputEl.do' +
          'm.setSelectionRange(pos, pos);'#13#10'}'
        
          'keypress=function keypress(sender, e, eOpts)'#13#10'{'#13#10'   if (e.getKey' +
          '() == 13)'#13#10'   {'#13#10'      ajaxRequest(sender, '#39'doSearch'#39', ["aText="' +
          '+sender.getValue()]);'#13#10'   };'#13#10'}')
      OnAjaxEvent = edSrcTextAjaxEvent
    end
    object btnPrint: TUniBitBtn
      Left = 589
      Top = 20
      Width = 96
      Height = 36
      Action = actPrint
      TabOrder = 12
      Images = MainMod.PrjImgList
      ImageIndex = 17
    end
    object btnHelp: TUniBitBtn
      Left = 798
      Top = 20
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 13
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = btnHelpClick
    end
    object btnDiger: TUniMenuButton
      Left = 698
      Top = 20
      Width = 94
      Height = 36
      Hint = ''
      DropdownMenu = popDiger
      Caption = 'Di'#287'er'
      Anchors = [akTop, akRight]
      TabOrder = 14
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 103
    Width = 1024
    Height = 297
    Hint = ''
    PagingBarAuxControl = lbKayitSayisi
    TitleFont.OverrideDefaults = [ovFontHeight]
    DataSource = dsVSBasvuru
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    WebOptions.PageSize = 50
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
        Sortable = True
      end
      item
        FieldName = 'durum'
        Title.Caption = 'Durum'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 120
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'basvuru_tarihi'
        Title.Caption = 'Ba'#351'v. Tarihi'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 100
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'son_tarih'
        Title.Caption = 'Son Cevap Tarihi'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 115
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'basvuru_sekli'
        Title.Caption = 'Ba'#351'v. '#350'ekli'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 120
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'basvuru_evrakno'
        Title.Caption = 'Ba'#351'v. Evrak No'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 120
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'cevap_tarihi'
        Title.Caption = 'Cevap Tarihi'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 100
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'cevap_sekli'
        Title.Caption = 'Cevap '#350'ekli'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 120
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'cevap_evrakno'
        Title.Caption = 'Cevap Evrak No'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 120
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'kisi'
        Title.Caption = #304'lgili Ki'#351'i'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 200
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        Sortable = True
        DisplayMemo = True
      end
      item
        FieldName = 'adi'
        Title.Caption = 'Ad'#305
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 120
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'soyadi'
        Title.Caption = 'Soyad'#305
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 120
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'sehir'
        Title.Caption = #350'ehir'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 120
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'tel1'
        Title.Caption = 'Cep Telefonu'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 120
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'email'
        Title.Caption = 'E-Mail'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 304
        Font.OverrideDefaults = [ovFontHeight]
      end>
  end
  object dsVSBasvuru: TUniDataSource
    DataSet = MainMod.qVSBasvuru
    Left = 127
    Top = 165
  end
  object ActList: TActionList
    Left = 35
    Top = 166
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
    end
    object actSearch: TAction
      Caption = 'Liste'
      OnExecute = actSearchExecute
    end
    object actClose: TAction
      Caption = 'Kapat'
      OnExecute = actCloseExecute
    end
    object actPrint: TAction
      Caption = #304'ndir'
      OnExecute = actPrintExecute
    end
  end
  object frxReportVSB: TfrxReport
    Version = '2023.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44577.819415798600000000
    ReportOptions.LastChange = 44724.991565451400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 444
    Top = 162
    Datasets = <
      item
        DataSet = frxdsMCDef
        DataSetName = 'frxdsMCDef'
      end
      item
        DataSet = frxdsVSBasvuru
        DataSetName = 'frxdsVSBasvuru'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page2: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 15.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 15.000000000000000000
      BottomMargin = 15.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object Memo34: TfrxMemoView
        AllowVectorExport = True
        Top = 404.409710000000000000
        Width = 680.315400000000000000
        Height = 45.354330710000000000
        DataSet = frxdsVSBasvuru
        DataSetName = 'frxdsVSBasvuru'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Memo.UTF8W = (
          #304'lgili Ki'#351'i Grubu: [frxdsVSBasvuru."kisi"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo19: TfrxMemoView
        AllowVectorExport = True
        Top = 102.047310000000000000
        Width = 188.976500000000000000
        Height = 26.456710000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Memo.UTF8W = (
          'Ad-Soyad')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo20: TfrxMemoView
        AllowVectorExport = True
        Left = 188.976500000000000000
        Top = 102.047310000000000000
        Width = 491.338900000000000000
        Height = 26.456710000000000000
        DataSet = frxdsVSBasvuru
        DataSetName = 'frxdsVSBasvuru'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Memo.UTF8W = (
          '[frxdsVSBasvuru."adi"] [frxdsVSBasvuru."soyadi"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo21: TfrxMemoView
        AllowVectorExport = True
        Top = 128.504020000000000000
        Width = 188.976500000000000000
        Height = 41.574830000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Memo.UTF8W = (
          'T.C. Kimlik No / '
          'Pasaport veya Kimlik No')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo22: TfrxMemoView
        AllowVectorExport = True
        Left = 188.976500000000000000
        Top = 128.504020000000000000
        Width = 491.338900000000000000
        Height = 41.574830000000000000
        DataField = 'kimlik_no'
        DataSet = frxdsVSBasvuru
        DataSetName = 'frxdsVSBasvuru'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Memo.UTF8W = (
          '[frxdsVSBasvuru."kimlik_no"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo23: TfrxMemoView
        AllowVectorExport = True
        Top = 170.078850000000000000
        Width = 188.976500000000000000
        Height = 52.913420000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Memo.UTF8W = (
          'Tebligata Esas Yerle'#351'im Yeri Adresi / '#304#351' Yeri Adresi')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo24: TfrxMemoView
        AllowVectorExport = True
        Left = 188.976500000000000000
        Top = 170.078850000000000000
        Width = 491.338900000000000000
        Height = 52.913420000000000000
        DataSet = frxdsVSBasvuru
        DataSetName = 'frxdsVSBasvuru'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Memo.UTF8W = (
          '[frxdsVSBasvuru."adres1"] [frxdsVSBasvuru."adres2"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo25: TfrxMemoView
        AllowVectorExport = True
        Top = 222.992270000000000000
        Width = 188.976500000000000000
        Height = 26.456692910000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Memo.UTF8W = (
          'Cep Telefonu')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo26: TfrxMemoView
        AllowVectorExport = True
        Left = 188.976500000000000000
        Top = 222.992270000000000000
        Width = 491.338900000000000000
        Height = 26.456692910000000000
        DataSet = frxdsVSBasvuru
        DataSetName = 'frxdsVSBasvuru'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Memo.UTF8W = (
          '[frxdsVSBasvuru."tel1"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo27: TfrxMemoView
        AllowVectorExport = True
        Top = 249.448980000000000000
        Width = 188.976500000000000000
        Height = 26.456692910000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Memo.UTF8W = (
          'Telefon Numaras'#305)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo29: TfrxMemoView
        AllowVectorExport = True
        Left = 188.976500000000000000
        Top = 249.448980000000000000
        Width = 491.338900000000000000
        Height = 26.456692910000000000
        DataField = 'tel2'
        DataSet = frxdsVSBasvuru
        DataSetName = 'frxdsVSBasvuru'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Memo.UTF8W = (
          '[frxdsVSBasvuru."tel2"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo32: TfrxMemoView
        AllowVectorExport = True
        Top = 275.905690000000000000
        Width = 188.976500000000000000
        Height = 26.456692910000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Memo.UTF8W = (
          'E-Posta Adresi')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo33: TfrxMemoView
        AllowVectorExport = True
        Left = 188.976500000000000000
        Top = 275.905690000000000000
        Width = 491.338900000000000000
        Height = 26.456692910000000000
        DataField = 'email'
        DataSet = frxdsVSBasvuru
        DataSetName = 'frxdsVSBasvuru'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Memo.UTF8W = (
          '[frxdsVSBasvuru."email"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo40: TfrxMemoView
        AllowVectorExport = True
        Top = 449.764070000000000000
        Width = 680.315400000000000000
        Height = 45.354360000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Memo.UTF8W = (
          #304'leti'#351'imde oldu'#287'u Birim: [frxdsVSBasvuru."title"]')
        ParentFont = False
      end
      object Memo41: TfrxMemoView
        AllowVectorExport = True
        Top = 495.118430000000000000
        Width = 680.315400000000000000
        Height = 45.354330710000000000
        DataSet = frxdsVSBasvuru
        DataSetName = 'frxdsVSBasvuru'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Memo.UTF8W = (
          'Konu: [frxdsVSBasvuru."basvuru_konu"]')
        ParentFont = False
      end
      object Rich1: TfrxRichView
        AllowVectorExport = True
        Top = 18.897650000000000000
        Width = 680.314960630000000000
        Height = 37.795300000000000000
        StretchMode = smMaxHeight
        Frame.Typ = []
        GapX = 2.000000000000000000
        GapY = 1.000000000000000000
        RichEdit = {
          7B5C727466315C616E73695C616E7369637067313235345C64656666305C6E6F
          7569636F6D7061745C6465666C616E67313035357B5C666F6E7474626C7B5C66
          305C666E696C5C6663686172736574302054696D6573204E657720526F6D616E
          3B7D7B5C66315C666E696C5C66636861727365743136322054696D6573204E65
          7720526F6D616E3B7D7B5C66325C666E696C5C66636861727365743233382054
          696D6573204E657720526F6D616E3B7D7D0D0A7B5C636F6C6F7274626C203B5C
          726564305C677265656E305C626C7565303B5C7265643235355C677265656E32
          35355C626C75653235353B7D0D0A7B5C2A5C67656E657261746F722052696368
          656432302031302E302E32363130307D5C766965776B696E64345C756331200D
          0A5C706172645C6362706174325C77696463746C7061725C71635C6366315C62
          5C66305C66733230205B66727864734D434465662E226B726D5F756E76616E22
          5D5C66315C7061720D0A0D0A5C706172645C6E6F77696463746C7061725C7163
          5C6366305C66305C667332325C6C616E6731303333205645525C66325C753330
          343F205341485C753330343F425C753330343F2042415C276161565552552046
          4F524D555C7061720D0A5C7061720D0A7D0D0A00}
      end
      object frxdsVSBasvurubasvuru_tarihi: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 517.795610000000000000
        Top = 71.811070000000000000
        Width = 158.740260000000000000
        Height = 18.897650000000000000
        DataSet = frxdsVSBasvuru
        DataSetName = 'frxdsVSBasvuru'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          'Tarih:[frxdsVSBasvuru."basvuru_tarihi"]')
        ParentFont = False
      end
      object Memo1: TfrxMemoView
        AllowVectorExport = True
        Top = 71.811070000000000000
        Width = 325.039580000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Frame.Typ = []
        Memo.UTF8W = (
          'Kimlik ve '#304'leti'#351'im Bilgileri')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo28: TfrxMemoView
        AllowVectorExport = True
        Top = 377.953000000000000000
        Width = 325.039580000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Frame.Typ = []
        Memo.UTF8W = (
          'Kurumumuz ile olan ili'#351'ki')
        ParentFont = False
      end
      object Memo30: TfrxMemoView
        AllowVectorExport = True
        Top = 540.472790000000000000
        Width = 680.315400000000000000
        Height = 464.882190000000000000
        DataSet = frxdsVSBasvuru
        DataSetName = 'frxdsVSBasvuru'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Memo.UTF8W = (
          'Talebin Detaylar'#305': [frxdsVSBasvuru."basvuru_aciklama"]')
        ParentFont = False
      end
      object Memo31: TfrxMemoView
        AllowVectorExport = True
        Left = 188.976500000000000000
        Top = 302.362400000000000000
        Width = 491.338900000000000000
        Height = 45.354330710000000000
        DataSet = frxdsVSBasvuru
        DataSetName = 'frxdsVSBasvuru'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Memo.UTF8W = (
          '[frxdsVSBasvuru."cevap_sekli_talep"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo35: TfrxMemoView
        AllowVectorExport = True
        Top = 302.362400000000000000
        Width = 188.976500000000000000
        Height = 45.354342910000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Memo.UTF8W = (
          'Tercih Edilen Cevaplama Y'#246'ntemi')
        ParentFont = False
        VAlign = vaCenter
      end
    end
  end
  object frxdsMCDef: TfrxDBDataset
    UserName = 'frxdsMCDef'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'gc_id=gc_id'
      'code=code'
      'title=title'
      'idy=idy'
      'idt=idt'
      'sdy=sdy'
      'sdt=sdt'
      'active=active'
      'krm_vkn=krm_vkn'
      'krm_vdairesi=krm_vdairesi'
      'krm_email=krm_email'
      'krm_kep=krm_kep'
      'krm_telefon1=krm_telefon1'
      'krm_telefon2=krm_telefon2'
      'krm_adresno=krm_adresno'
      'krm_adres1=krm_adres1'
      'krm_adres2=krm_adres2'
      'vs_tck=vs_tck'
      'vs_ad=vs_ad'
      'vs_soyad=vs_soyad'
      'vs_email=vs_email'
      'vs_kep=vs_kep'
      'vs_telefon1=vs_telefon1'
      'vs_telefon2=vs_telefon2'
      'vs_adresno=vs_adresno'
      'vs_adres1=vs_adres1'
      'vs_adres2=vs_adres2'
      'krm_unvan=krm_unvan'
      'krm_web1=krm_web1'
      'krm_web2=krm_web2'
      'krm_web3=krm_web3'
      'krm_sehir=krm_sehir'
      'krm_logo=krm_logo'
      'krm_fax=krm_fax'
      'krm_mersis=krm_mersis'
      'krm_guid=krm_guid'
      'krm_logo_type=krm_logo_type')
    OpenDataSource = False
    DataSource = dsMCDef
    BCDToCurrency = False
    DataSetOptions = []
    Left = 448
    Top = 219
  end
  object frxdsVSBasvuru: TfrxDBDataset
    UserName = 'frxdsVSBasvuru'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'mc_id=mc_id'
      'durum=durum'
      'idy=idy'
      'idt=idt'
      'sdy=sdy'
      'sdt=sdt'
      'kg_id=kg_id'
      'adi=adi'
      'soyadi=soyadi'
      'kimlik_no=kimlik_no'
      'tel1=tel1'
      'tel2=tel2'
      'adres1=adres1'
      'adres2=adres2'
      'ilce=ilce'
      'sehir=sehir'
      'email=email'
      'kep=kep'
      'kisi=kisi'
      'basvuru_tarihi=basvuru_tarihi'
      'basvuru_sekli=basvuru_sekli'
      'basvuru_evrakno=basvuru_evrakno'
      'basvuru_aciklama=basvuru_aciklama'
      'cevap_tarihi=cevap_tarihi'
      'cevap_sekli=cevap_sekli'
      'cevap_aciklama=cevap_aciklama'
      'cevap_evrakno=cevap_evrakno'
      'kg_detay=kg_detay'
      'basvuru_dept_id=basvuru_dept_id'
      'basvuru_konu=basvuru_konu'
      'cevap_sekli_talep=cevap_sekli_talep'
      'title=title'
      'son_tarih=son_tarih'
      'kalan_sure=kalan_sure')
    OpenDataSource = False
    DataSource = dsVSBasvuru
    BCDToCurrency = False
    DataSetOptions = []
    Left = 516
    Top = 219
  end
  object dsMCDef: TUniDataSource
    DataSet = MainMod.qMCDef
    Left = 127
    Top = 219
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 517
    Top = 162
  end
  object popDiger: TUniPopupMenu
    Left = 807
    Top = 150
    object mnLog: TUniMenuItem
      Caption = 'Log'
      OnClick = mnLogClick
    end
  end
end
