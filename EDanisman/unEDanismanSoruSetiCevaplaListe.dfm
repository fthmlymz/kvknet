object frmEDanismanSoruSetiCevaplaListe: TfrmEDanismanSoruSetiCevaplaListe
  Left = 0
  Top = 0
  Width = 1280
  Height = 400
  OnCreate = UniFrameCreate
  TabOrder = 0
  object lbKayitSayisi: TUniLabel
    Left = 124
    Top = 296
    Width = 62
    Height = 13
    Hint = ''
    Caption = 'lbKayitSayisi'
    TabOrder = 3
  end
  object pnlTop: TUniPanel
    Left = 0
    Top = 0
    Width = 1280
    Height = 110
    Hint = ''
    Align = alTop
    TabOrder = 0
    Caption = ''
    DesignSize = (
      1280
      110)
    object edSrcText: TUniEdit
      Left = 96
      Top = 45
      Width = 308
      Hint = 
        'Anahtar kelimenin i'#231'inde ge'#231'ti'#287'i ifadeleri bulmak i'#231'in * veya % ' +
        'i'#351'aretleri kullanmal'#305's'#305'n'#305'z.'
      CharCaseConversion = uccTurkish
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase("TR")); '#13#10'  sender.inputEl.' +
          'dom.setSelectionRange(pos, pos);'#13#10'}'
        
          'keypress=function keypress(sender, e, eOpts)'#13#10'{'#13#10'   if (e.getKey' +
          '() == 13)'#13#10'   {'#13#10'      ajaxRequest(sender, '#39'doSearch'#39', ["aText="' +
          '+sender.getValue()]);'#13#10'   };'#13#10'}')
      OnAjaxEvent = edSrcTextAjaxEvent
    end
    object UniLabel1: TUniLabel
      Left = 12
      Top = 20
      Width = 78
      Height = 13
      Hint = ''
      Caption = 'Arama Kriterleri'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
    end
    object btnSearch: TUniBitBtn
      Left = 413
      Top = 33
      Width = 96
      Height = 36
      Action = actSearch
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 3
      Images = MainMod.PrjImgList
      ImageIndex = 10
    end
    object btnClose: TUniBitBtn
      Left = 1174
      Top = 33
      Width = 96
      Height = 36
      Action = actClose
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
      Images = MainMod.PrjImgList
      ImageIndex = 5
    end
    object UniLabel2: TUniLabel
      Left = 14
      Top = 49
      Width = 76
      Height = 13
      Hint = ''
      Caption = 'Aranacak '#304'fade'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 5
    end
    object edSrcDurumu: TUniComboBox
      Left = 232
      Top = 15
      Width = 172
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'AKT'#304'F'
      Items.Strings = (
        'T'#220'M'#220
        'AKT'#304'F'
        'PAS'#304'F'
        'CEVAPLANMAMI'#350' AKT'#304'F')
      ItemIndex = 1
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 7
      CharCase = ecUpperCase
      IconItems = <>
      OnChange = edSrcDurumuChange
    end
    object edSrcTipi: TUniComboBox
      Left = 96
      Top = 13
      Width = 130
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'BA'#350'LIK'
      Items.Strings = (
        'REF. NO'
        'BA'#350'LIK'
        'SORU SET'#304' NO')
      ItemIndex = 1
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 6
      CharCase = ecUpperCase
      IconItems = <>
      OnChange = edSrcTipiChange
    end
    object UniBitBtn1: TUniBitBtn
      Left = 1072
      Top = 33
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 8
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = UniBitBtn1Click
    end
    object UniLabel3: TUniLabel
      Left = 8
      Top = 76
      Width = 82
      Height = 13
      Hint = ''
      Caption = #304'lgili Departman'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 9
    end
    object edSrcDept: TUniComboBox
      Left = 96
      Top = 72
      Width = 308
      Hint = ''
      Style = csDropDownList
      Text = ''
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 10
      IconItems = <>
      OnAjaxEvent = edSrcDeptAjaxEvent
      OnChange = edSrcDeptChange
    end
    object UniBitBtn2: TUniBitBtn
      Left = 515
      Top = 33
      Width = 255
      Height = 36
      Action = actCevapla
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 11
      Images = MainMod.PrjImgList
      ImageIndex = 22
    end
    object UniMenuButton1: TUniMenuButton
      Left = 776
      Top = 33
      Width = 128
      Height = 36
      Hint = ''
      DropdownMenu = ppmDownload
      Caption = 'Raporlar'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 12
      Images = MainMod.PrjImgList
      ImageIndex = 23
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 110
    Width = 1280
    Height = 290
    Hint = ''
    PagingBarAuxControl = lbKayitSayisi
    TitleFont.OverrideDefaults = [ovFontHeight]
    DataSource = dsSoruSeti
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    WebOptions.PageSize = 125
    LoadMask.Message = 'Veri y'#252'kleniyor...'
    HiddenPanel = hpnFiltre
    EmptyText = 'Veri yok'
    Align = alClient
    Font.OverrideDefaults = [ovFontHeight]
    ParentFont = False
    TabOrder = 1
    OnColumnSort = UniDBGrid1ColumnSort
    OnDrawColumnCell = UniDBGrid1DrawColumnCell
    OnColumnFilter = UniDBGrid1ColumnFilter
    Columns = <
      item
        FieldName = 'id'
        Filtering.Enabled = True
        Title.Alignment = taCenter
        Title.Caption = 'Ref. No'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 75
        Font.OverrideDefaults = [ovFontHeight]
        Alignment = taCenter
        Sortable = True
      end
      item
        FieldName = 'active'
        Filtering.Enabled = True
        Filtering.Editor = cbfAktif
        Title.Alignment = taCenter
        Title.Caption = 'Aktif'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 60
        Font.OverrideDefaults = [ovFontHeight]
        Alignment = taCenter
        Sortable = True
        CheckBoxField.FieldValues = 'E;H'
        CheckBoxField.DisplayValues = 'Evet;Hay'#305'r'
      end
      item
        FieldName = 'ss_no'
        Filtering.Enabled = True
        Filtering.Editor = edfSoruSetiNo
        Title.Alignment = taCenter
        Title.Caption = 'Soru Seti No'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 96
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
        DisplayMemo = True
      end
      item
        FieldName = 'baslik'
        Filtering.Enabled = True
        Filtering.Editor = edfBaslik
        Title.Alignment = taCenter
        Title.Caption = 'Ba'#351'l'#305'k'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 500
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
        DisplayMemo = True
      end
      item
        FieldName = 'departman'
        Filtering.Enabled = True
        Filtering.Editor = edfDepartman
        Title.Alignment = taCenter
        Title.Caption = 'Departman'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 160
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
        DisplayMemo = True
      end
      item
        FieldName = 'sorusayisi'
        Filtering.Enabled = True
        Filtering.Editor = edfSoruSayi
        Title.Alignment = taCenter
        Title.Caption = 'Soru Say'#305's'#305
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 96
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'cevaplandi'
        Filtering.Enabled = True
        Filtering.Editor = edfCevaplandi
        Title.Alignment = taCenter
        Title.Caption = 'Cevapland'#305
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 96
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
        CheckBoxField.FieldValues = '1;0'
        CheckBoxField.DisplayValues = 'Evet;Hay'#305'r'
      end
      item
        FieldName = 'tarih'
        Filtering.Enabled = True
        Title.Alignment = taCenter
        Title.Caption = 'Tarih<BR><BR><BR>'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 128
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'bitis_tarihi'
        Filtering.Enabled = True
        Title.Alignment = taCenter
        Title.Caption = 'Biti'#351' Tarihi<BR><BR><BR>'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 128
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end>
  end
  object hpnFiltre: TUniHiddenPanel
    Left = 330
    Top = 135
    Width = 160
    Height = 247
    Hint = ''
    Visible = True
    object cbfAktif: TUniComboBox
      Left = 15
      Top = 3
      Width = 94
      Hint = ''
      Style = csDropDownList
      Text = ''
      Items.Strings = (
        'E'
        'H')
      TabOrder = 1
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'    var val = sender.' +
          'getValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10' ' +
          ' sender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.do' +
          'm.setSelectionRange(pos, pos);'#13#10'}')
      IconItems = <>
    end
    object edfSoruSetiNo: TUniEdit
      Left = 15
      Top = 31
      Width = 94
      Hint = ''
      CharCase = ecUpperCase
      CharEOL = #13
      Text = ''
      TabOrder = 2
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
    object edfBaslik: TUniEdit
      Left = 15
      Top = 55
      Width = 94
      Hint = ''
      CharCase = ecUpperCase
      CharEOL = #13
      Text = ''
      TabOrder = 3
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'    var val = sender.' +
          'getValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10' ' +
          ' sender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.do' +
          'm.setSelectionRange(pos, pos);'#13#10'}')
    end
    object edfDepartman: TUniEdit
      Left = 15
      Top = 80
      Width = 94
      Hint = ''
      CharCase = ecUpperCase
      CharEOL = #13
      Text = ''
      TabOrder = 4
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'    var val = sender.' +
          'getValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10' ' +
          ' sender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.do' +
          'm.setSelectionRange(pos, pos);'#13#10'}')
    end
    object edfSoruSayi: TUniEdit
      Left = 15
      Top = 108
      Width = 94
      Hint = ''
      CharCase = ecUpperCase
      CharEOL = #13
      Text = ''
      TabOrder = 5
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'    var val = sender.' +
          'getValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10' ' +
          ' sender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.do' +
          'm.setSelectionRange(pos, pos);'#13#10'}')
    end
    object edfCevaplandi: TUniNumberEdit
      Left = 15
      Top = 136
      Width = 94
      Hint = ''
      CharEOL = #13
      TabOrder = 6
      DecimalSeparator = ','
    end
  end
  object ActList: TActionList
    Left = 591
    Top = 252
    object actAdd: TAction
      Caption = 'Yeni Kay'#305't'
    end
    object actEdit: TAction
      Caption = 'De'#287'i'#351'tir'
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
    object acExcel: TAction
      Caption = 'Listeyi Excel'#39'e Kaydet'
    end
    object actCevapla: TAction
      Caption = 'Cevapla'
      OnExecute = actCevaplaExecute
    end
    object actSonuc: TAction
      Caption = 'Sonu'#231' Raporu'
    end
  end
  object dsSoruSeti: TUniDataSource
    DataSet = qSoruSeti
    Left = 267
    Top = 165
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user')
    Left = 405
    Top = 222
  end
  object qSoruSeti: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user')
    Left = 229
    Top = 166
  end
  object DOCXRpt: TrXMLReport
    ActionAfter = aaNone
    OnUserCalc = DOCXRptUserCalc
    Left = 477
    Top = 164
  end
  object tblRapor: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'soruno'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'sorumetni'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'secenekno'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'secenekmetni'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'sonucmetni'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'satirno'
        DataType = ftInteger
      end
      item
        Name = 'bulgumetni'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'riskSeviyesi'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'riskmetni'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'referansmetni'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'fonksiyon'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'hdr_kurum'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'hdr_departman'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'hdr_baslik'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'hdr_tarih'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'hdr_logo'
        DataType = ftBlob
      end>
    Left = 547
    Top = 171
    Data = {
      040010000600736F72756E6F01001400000000000900736F72756D65746E6901
      00E803000000000900736563656E656B6E6F01001400000000000C0073656365
      6E656B6D65746E690100E803000000000A00736F6E75636D65746E690100E803
      00000000070073617469726E6F03000000000000000A0062756C67756D65746E
      690100E803000000000C007269736B536576697965736901000F000000000009
      007269736B6D65746E690100E803000000000D007265666572616E736D65746E
      690100E803000000000900666F6E6B7369796F6E010032000000000009006864
      725F6B7572756D0100C800000000000D006864725F6465706172746D616E0100
      C800000000000A006864725F6261736C696B0100C8000000000009006864725F
      7461726968010014000000000008006864725F6C6F676F0F0000000000000000
      0000000000}
  end
  object qRapor: TVirtualQuery
    Active = True
    SourceDataSets = <
      item
        DataSet = tblRapor
      end>
    SQL.Strings = (
      'select * from tblRapor order by satirno')
    Left = 600
    Top = 176
    object qRaporsoruno: TStringField
      FieldName = 'soruno'
    end
    object qRaporsorumetni: TStringField
      FieldName = 'sorumetni'
      Size = 1000
    end
    object qRaporsecenekno: TStringField
      FieldName = 'secenekno'
    end
    object qRaporsecenekmetni: TStringField
      FieldName = 'secenekmetni'
      Size = 1000
    end
    object qRaporsonucmetni: TStringField
      FieldName = 'sonucmetni'
      Size = 1000
    end
    object qRaporbulgumetni: TStringField
      FieldName = 'bulgumetni'
      Size = 1000
    end
    object qRaporriskseviyesi: TStringField
      FieldName = 'riskseviyesi'
      Size = 15
    end
    object qRaporriskmetni: TStringField
      FieldName = 'riskmetni'
      Size = 1000
    end
    object qRaporreferansmetni: TStringField
      FieldName = 'referansmetni'
      Size = 1000
    end
    object qRaporsatirno: TIntegerField
      FieldName = 'satirno'
    end
    object qRaporfonksiyon: TStringField
      FieldName = 'fonksiyon'
      Size = 50
    end
    object qRaporhdr_kurum: TStringField
      FieldName = 'hdr_kurum'
      Size = 200
    end
    object qRaporhdr_departman: TStringField
      FieldName = 'hdr_departman'
      Size = 200
    end
    object qRaporhdr_ssbaslik: TStringField
      FieldName = 'hdr_baslik'
      Size = 200
    end
    object qRaporhdr_tarih: TStringField
      FieldName = 'hdr_tarih'
    end
    object qRaporhdr_logo: TBlobField
      FieldName = 'hdr_logo'
    end
  end
  object rptSonuc: TfrxReport
    Version = '2023.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44574.454472395800000000
    ReportOptions.LastChange = 44679.520272442130000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      
        '  if dsSonucDetayriskmetni.Text = '#39#39'  then dsSonucDetayriskmetni' +
        '.Visible := false;'
      
        '  if dsSonucDetayreferansmetni.Text = '#39#39' then dsSonucDetayrefera' +
        'nsmetni.Visible := false;                                       ' +
        '                                                                ' +
        '  '
      
        '  if dsSonucDetayreferansmetni.Text = '#39#39' then memo4.Visible := f' +
        'alse;                                                           ' +
        '                                              '
      '  '
      '        '
      'end.')
    Left = 734
    Top = 83
    Datasets = <
      item
        DataSet = dsSonucDetay
        DataSetName = 'dsSonucDetay'
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
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 457.322837090000000000
        Top = 173.858380000000000000
        Width = 718.110700000000000000
        DataSet = dsSonucDetay
        DataSetName = 'dsSonucDetay'
        RowCount = 0
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Width = 718.110236220000000000
          Height = 445.984540000000000000
          Frame.Typ = []
        end
        object dsSonucDetaysorumetni: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Left = 18.897650000000000000
          Top = 26.456710000000000000
          Width = 691.653990000000000000
          Height = 75.590551180000000000
          StretchMode = smActualHeight
          DataField = 'sorumetni'
          DataSet = dsSonucDetay
          DataSetName = 'dsSonucDetay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsSonucDetay."sorumetni"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object dsSonucDetaysecenekmetni: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Left = 86.929190000000000000
          Top = 105.826840000000000000
          Width = 680.315400000000000000
          Height = 26.456692910000000000
          StretchMode = smActualHeight
          DataField = 'secenekmetni'
          DataSet = dsSonucDetay
          DataSetName = 'dsSonucDetay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsSonucDetay."secenekmetni"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Left = 18.897650000000000000
          Top = 105.826840000000000000
          Width = 68.031540000000000000
          Height = 26.456692910000000000
          DataSet = dsSonucDetay
          DataSetName = 'dsSonucDetay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Cevap')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Left = 86.929190000000000000
          Top = 139.842610000000000000
          Width = 623.622450000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataSet = dsSonucDetay
          DataSetName = 'dsSonucDetay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsSonucDetay."riskseviyesi"]')
          ParentFont = False
        end
        object dsSonucDetayriskmetni: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Left = 18.897650000000000000
          Top = 158.740260000000000000
          Width = 691.653990000000000000
          Height = 37.795275590000000000
          StretchMode = smActualHeight
          DataField = 'riskmetni'
          DataSet = dsSonucDetay
          DataSetName = 'dsSonucDetay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsSonucDetay."riskmetni"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Left = 18.897650000000000000
          Top = 317.480520000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataSet = dsSonucDetay
          DataSetName = 'dsSonucDetay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Referanslar')
          ParentFont = False
        end
        object dsSonucDetayreferansmetni: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Left = 18.897650000000000000
          Top = 343.937230000000000000
          Width = 691.653990000000000000
          Height = 68.031540000000000000
          StretchMode = smActualHeight
          DataSet = dsSonucDetay
          DataSetName = 'dsSonucDetay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsSonucDetay."referansmetni"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Left = 18.897650000000000000
          Top = 139.842610000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataSet = dsSonucDetay
          DataSetName = 'dsSonucDetay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Risk')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Left = 18.897650000000000000
          Top = 204.094620000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataSet = dsSonucDetay
          DataSetName = 'dsSonucDetay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Tavsiyeler')
          ParentFont = False
        end
        object dsSonucDetaysonucmetni: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Left = 18.897650000000000000
          Top = 222.992270000000000000
          Width = 691.653990000000000000
          Height = 75.590551180000000000
          StretchMode = smActualHeight
          DataField = 'sonucmetni'
          DataSet = dsSonucDetay
          DataSetName = 'dsSonucDetay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsSonucDetay."sonucmetni"]')
          ParentFont = False
        end
        object dsSonucDetaysoruno: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Left = 18.897650000000000000
          Top = 7.559060000000000000
          Width = 691.653990000000000000
          Height = 18.897650000000000000
          DataField = 'soruno'
          DataSet = dsSonucDetay
          DataSetName = 'dsSonucDetay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsSonucDetay."soruno"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Top = 102.047310000000000000
          Width = 718.110236220000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Top = 136.063080000000000000
          Width = 718.110236220000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Top = 196.535560000000000000
          Width = 718.110236220000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Top = 317.480520000000000000
          Width = 718.110236220000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 94.488250000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object dsSonucBaslikkurum: TfrxMemoView
          AllowVectorExport = True
          Left = 94.488250000000000000
          Top = 11.338590000000000000
          Width = 529.134200000000000000
          Height = 30.236240000000000000
          DataSetName = 'dsSonucBaslik'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsSonucDetay."hdr_kurum"]')
          ParentFont = False
        end
        object dsSonucBasliksorusetibasligi: TfrxMemoView
          AllowVectorExport = True
          Left = 94.488250000000000000
          Top = 41.574830000000000000
          Width = 529.134200000000000000
          Height = 26.456710000000000000
          DataSetName = 'dsSonucBaslik'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsSonucDetay."hdr_baslik"]')
          ParentFont = False
        end
        object pictureLogo: TfrxPictureView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 94.488188980000000000
          DataField = 'hdr_logo'
          DataSet = dsSonucDetay
          DataSetName = 'dsSonucDetay'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 691.653990000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Page#]/[TotalPages#]')
          ParentFont = False
        end
        object dsSonucDetayhdr_tarih: TfrxMemoView
          AllowVectorExport = True
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = 'hdr_tarih'
          DataSet = dsSonucDetay
          DataSetName = 'dsSonucDetay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsSonucDetay."hdr_tarih"]')
          ParentFont = False
        end
      end
    end
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
    Left = 830
    Top = 94
  end
  object dsRapor: TUniDataSource
    DataSet = qRapor
    Left = 639
    Top = 157
  end
  object dsSonucDetay: TfrxDBDataset
    UserName = 'dsSonucDetay'
    CloseDataSource = False
    FieldAliases.Strings = (
      'soruno=soruno'
      'sorumetni=sorumetni'
      'secenekno=secenekno'
      'secenekmetni=secenekmetni'
      'sonucmetni=sonucmetni'
      'bulgumetni=bulgumetni'
      'riskseviyesi=riskseviyesi'
      'riskmetni=riskmetni'
      'referansmetni=referansmetni'
      'satirno=satirno'
      'fonksiyon=fonksiyon'
      'hdr_kurum=hdr_kurum'
      'hdr_departman=hdr_departman'
      'hdr_baslik=hdr_baslik'
      'hdr_tarih=hdr_tarih'
      'hdr_logo=hdr_logo')
    DataSource = dsRapor
    BCDToCurrency = False
    DataSetOptions = []
    Left = 791
    Top = 95
  end
  object frxDOCXExport1: TfrxDOCXExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    PictureType = gpPNG
    ExportType = dxTable
    Left = 871
    Top = 94
  end
  object ppmDownload: TUniPopupMenu
    ScreenMask.Enabled = True
    ScreenMask.Message = 'Dok'#252'man Haz'#305'rlan'#305'yor...'
    ScreenMask.Color = 16744448
    Left = 670
    Top = 260
    object ppmiAydinlatmaMetni: TUniMenuItem
      Caption = 'Sonu'#231' Raporu PDF'
      OnClick = ppmiAydinlatmaMetniClick
    end
    object SonucRaporuYatayPDF1: TUniMenuItem
      Caption = 'Sonuc Raporu Yatay PDF'
      OnClick = SonucRaporuYatayPDF1Click
    end
    object ppmiAcikRizaBeyani: TUniMenuItem
      Caption = 'Sonu'#231' Raporu Word DOCX'
      OnClick = ppmiAcikRizaBeyaniClick
    end
    object SonuraporuPPT1: TUniMenuItem
      Caption = 'Sonu'#231' Raporu Sunu PPTX'
      OnClick = SonuraporuPPT1Click
    end
  end
  object frxPPTXExport1: TfrxPPTXExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    PictureType = gpPNG
    Left = 712
    Top = 168
  end
  object rptSonuc2: TfrxReport
    Version = '2023.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44574.454472395800000000
    ReportOptions.LastChange = 45379.395382511580000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      
        '  if dsSonucDetayriskmetni.Text = '#39#39'  then dsSonucDetayriskmetni' +
        '.Visible := false;'
      
        '  if dsSonucDetayreferansmetni.Text = '#39#39' then dsSonucDetayrefera' +
        'nsmetni.Visible := false;                                       ' +
        '                                                                ' +
        '  '
      
        '  if dsSonucDetayreferansmetni.Text = '#39#39' then memo4.Visible := f' +
        'alse;                                                           ' +
        '                                              '
      '  '
      '        '
      'end.')
    Left = 682
    Top = 102
    Datasets = <
      item
        DataSet = dsSonucDetay
        DataSetName = 'dsSonucDetay'
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
        Height = 548.031610790000000000
        Top = 173.858380000000000000
        Width = 1046.929810000000000000
        DataSet = dsSonucDetay
        DataSetName = 'dsSonucDetay'
        RowCount = 0
        object Shape6: TfrxShapeView
          AllowVectorExport = True
          Top = 294.803340000000000000
          Width = 1043.149816220000000000
          Height = 158.740260000000000000
          Frame.Typ = []
        end
        object Shape5: TfrxShapeView
          AllowVectorExport = True
          Top = 453.543360790000000000
          Width = 1043.149816220000000000
          Height = 94.488188980000000000
          Frame.Typ = []
        end
        object Shape4: TfrxShapeView
          AllowVectorExport = True
          Top = 162.519790000000000000
          Width = 1043.149816220000000000
          Height = 132.283550000000000000
          Frame.Typ = []
        end
        object Shape3: TfrxShapeView
          AllowVectorExport = True
          Top = 128.504020000000000000
          Width = 1043.149816220000000000
          Height = 34.015770000000000000
          Frame.Typ = []
        end
        object Shape2: TfrxShapeView
          AllowVectorExport = True
          Width = 1043.150280000000000000
          Height = 128.504020000000000000
          Frame.Typ = []
        end
        object dsSonucDetaysorumetni: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Left = 18.897650000000000000
          Top = 22.677180000000000000
          Width = 1020.473100000000000000
          Height = 102.047310000000000000
          DataField = 'sorumetni'
          DataSet = dsSonucDetay
          DataSetName = 'dsSonucDetay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsSonucDetay."sorumetni"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object dsSonucDetaysecenekmetni: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Left = 86.929190000000000000
          Top = 132.283550000000000000
          Width = 952.441560000000000000
          Height = 26.456692910000000000
          DataField = 'secenekmetni'
          DataSet = dsSonucDetay
          DataSetName = 'dsSonucDetay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsSonucDetay."secenekmetni"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Left = 18.897650000000000000
          Top = 132.283550000000000000
          Width = 68.031540000000000000
          Height = 26.456692910000000000
          DataSet = dsSonucDetay
          DataSetName = 'dsSonucDetay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Cevap')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Left = 86.929190000000000000
          Top = 166.299320000000000000
          Width = 952.440944880000000000
          Height = 18.897650000000000000
          DataSet = dsSonucDetay
          DataSetName = 'dsSonucDetay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsSonucDetay."riskseviyesi"]')
          ParentFont = False
        end
        object dsSonucDetayriskmetni: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Left = 18.897650000000000000
          Top = 185.196970000000000000
          Width = 1020.473100000000000000
          Height = 105.826840000000000000
          DataField = 'riskmetni'
          DataSet = dsSonucDetay
          DataSetName = 'dsSonucDetay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsSonucDetay."riskmetni"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Left = 18.897650000000000000
          Top = 458.323130000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          DataSet = dsSonucDetay
          DataSetName = 'dsSonucDetay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Referanslar')
          ParentFont = False
        end
        object dsSonucDetayreferansmetni: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Left = 18.897650000000000000
          Top = 475.220780000000000000
          Width = 1020.473100000000000000
          Height = 68.031496060000000000
          DataSet = dsSonucDetay
          DataSetName = 'dsSonucDetay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsSonucDetay."referansmetni"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Left = 18.897650000000000000
          Top = 166.299320000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataSet = dsSonucDetay
          DataSetName = 'dsSonucDetay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Risk')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Left = 18.897650000000000000
          Top = 298.582870000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataSet = dsSonucDetay
          DataSetName = 'dsSonucDetay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Tavsiyeler')
          ParentFont = False
        end
        object dsSonucDetaysonucmetni: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Left = 18.897650000000000000
          Top = 317.480520000000000000
          Width = 1020.473100000000000000
          Height = 132.283550000000000000
          DataField = 'sonucmetni'
          DataSet = dsSonucDetay
          DataSetName = 'dsSonucDetay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsSonucDetay."sonucmetni"]')
          ParentFont = False
        end
        object dsSonucDetaysoruno: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 18.897650000000000000
          Top = 3.779530000000000000
          Width = 691.653990000000000000
          Height = 18.897650000000000000
          DataField = 'soruno'
          DataSet = dsSonucDetay
          DataSetName = 'dsSonucDetay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsSonucDetay."soruno"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 94.488250000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object dsSonucBaslikkurum: TfrxMemoView
          AllowVectorExport = True
          Left = 75.590600000000000000
          Top = 11.338590000000000000
          Width = 869.291900000000000000
          Height = 30.236240000000000000
          DataSetName = 'dsSonucBaslik'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsSonucDetay."hdr_kurum"]')
          ParentFont = False
        end
        object dsSonucBasliksorusetibasligi: TfrxMemoView
          AllowVectorExport = True
          Left = 75.590600000000000000
          Top = 41.574830000000000000
          Width = 869.291900000000000000
          Height = 26.456710000000000000
          DataSetName = 'dsSonucBaslik'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsSonucDetay."hdr_baslik"]')
          ParentFont = False
        end
        object pictureLogo: TfrxPictureView
          AllowVectorExport = True
          Left = 952.441560000000000000
          Width = 94.488250000000000000
          Height = 94.488188980000000000
          DataField = 'hdr_logo'
          DataSet = dsSonucDetay
          DataSetName = 'dsSonucDetay'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 782.362710000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 948.662030000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Page#]/[TotalPages#]')
          ParentFont = False
        end
        object dsSonucDetayhdr_tarih: TfrxMemoView
          AllowVectorExport = True
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = 'hdr_tarih'
          DataSet = dsSonucDetay
          DataSetName = 'dsSonucDetay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsSonucDetay."hdr_tarih"]')
          ParentFont = False
        end
      end
    end
  end
end
