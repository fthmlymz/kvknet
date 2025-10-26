object frAydinlatmaSablonListe: TfrAydinlatmaSablonListe
  Left = 0
  Top = 0
  Width = 1150
  Height = 400
  OnCreate = UniFrameCreate
  TabOrder = 0
  object lbKayitSayisi: TUniLabel
    Left = 953
    Top = 296
    Width = 62
    Height = 13
    Hint = ''
    Caption = 'lbKayitSayisi'
    TabOrder = 2
  end
  object pnlTop: TUniPanel
    Left = 0
    Top = 0
    Width = 1150
    Height = 145
    Hint = ''
    Align = alTop
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      1150
      145)
    object edSrcText: TUniEdit
      Left = 454
      Top = 15
      Width = 244
      Hint = 
        'Anahtar kelimenin i'#231'inde ge'#231'ti'#287'i ifadeleri bulmak i'#231'in * veya % ' +
        'i'#351'aretleri kullanmal'#305's'#305'n'#305'z.'
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
      Top = 19
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
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 3
      Images = MainMod.PrjImgList
      ImageIndex = 10
    end
    object btnClose: TUniBitBtn
      Left = 1021
      Top = 91
      Width = 105
      Height = 36
      Action = actClose
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
      Images = MainMod.PrjImgList
      ImageIndex = 5
    end
    object btnAdd: TUniBitBtn
      Left = 198
      Top = 91
      Width = 105
      Height = 36
      Action = actAdd
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 5
      Images = MainMod.PrjImgList
      ImageIndex = 18
    end
    object btnEdit: TUniBitBtn
      Left = 309
      Top = 91
      Width = 105
      Height = 36
      Action = actEdit
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 6
      Images = MainMod.PrjImgList
      ImageIndex = 2
    end
    object UniLabel2: TUniLabel
      Left = 372
      Top = 19
      Width = 76
      Height = 13
      Hint = ''
      Caption = 'Aranacak '#304'fade'
      TabOrder = 7
    end
    object edSrcDurumu: TUniComboBox
      Left = 227
      Top = 15
      Width = 125
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
      Width = 125
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = #304'LG'#304'L'#304' K'#304#350#304
      Items.Strings = (
        'REF. NO'
        'TANIM'
        #304'LG'#304'L'#304' K'#304#350#304
        'A'#199'IKLAMA')
      ItemIndex = 2
      TabOrder = 8
      CharCase = ecUpperCase
      IconItems = <>
      OnChange = edSrcTipiChange
    end
    object btnDownload: TUniMenuButton
      Left = 420
      Top = 91
      Width = 96
      Height = 36
      Hint = ''
      DropdownMenu = ppmDownload
      Caption = #304'ndir'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 10
      Images = MainMod.PrjImgList
      ImageIndex = 3
    end
    object btnHelp: TUniBitBtn
      Left = 910
      Top = 91
      Width = 105
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 11
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = btnHelpClick
    end
    object UniLabel3: TUniLabel
      Left = 366
      Top = 47
      Width = 82
      Height = 13
      Hint = ''
      Caption = #304'lgili Departman'
      TabOrder = 12
    end
    object edSrcDept: TUniComboBox
      Left = 454
      Top = 44
      Width = 244
      Hint = ''
      Style = csDropDownList
      Text = ''
      TabOrder = 13
      IconItems = <>
      OnChange = edSrcDeptChange
    end
    object edSrcIys: TUniComboBox
      Left = 96
      Top = 44
      Width = 256
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'T'#220'M'#220
      Items.Strings = (
        'T'#220'M'#220
        'IYS '#304'STENECEK'
        'IYS '#304'STENMEYECEK')
      ItemIndex = 0
      TabOrder = 14
      CharCase = ecUpperCase
      IconItems = <>
      OnChange = edSrcIysChange
    end
    object UniMenuButton1: TUniMenuButton
      Left = 522
      Top = 91
      Width = 160
      Height = 36
      Hint = ''
      DropdownMenu = ppmExcel
      Caption = 'Toplu '#304#351'lemler'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 15
      Images = MainMod.PrjImgList
      ImageIndex = 15
    end
    object UniLabel4: TUniLabel
      Left = 30
      Top = 47
      Width = 60
      Height = 13
      Hint = ''
      Caption = 'IYS Kriterleri'
      TabOrder = 16
    end
    object btnMetinGuncelle: TUniBitBtn
      Left = 688
      Top = 91
      Width = 121
      Height = 36
      Hint = ''
      Caption = 'Metin G'#252'ncelle'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 17
      Images = MainMod.PrjImgList
      ImageIndex = 15
      OnClick = btnMetinGuncelleClick
    end
    object btnTest: TUniButton
      Left = 847
      Top = 102
      Width = 26
      Height = 25
      Hint = ''
      Visible = False
      Caption = '...'
      TabOrder = 18
      OnClick = btnTestClick
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 145
    Width = 1150
    Height = 255
    Hint = ''
    ClientEvents.ExtEvents.Strings = (
      
        'mousedown=function mousedown(sender, x, y, eOpts)'#13#10'{'#13#10'    if (eO' +
        'pts == 2) {'#13#10'        Ext.defer(function(){'#13#10'            ajaxRequ' +
        'est(sender, '#39'popup'#39', ['#39'x='#39'+x, '#39'y='#39'+y])'#13#10'        }, 300);'#13#10'    } ' +
        #13#10#13#10'}')
    PagingBarAuxControl = lbKayitSayisi
    TitleFont.OverrideDefaults = [ovFontHeight]
    DataSource = dsAydinlatma
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    WebOptions.PageSize = 100
    LoadMask.Message = 'Veri y'#252'kleniyor...'
    EmptyText = 'Veri yok'
    Align = alClient
    Font.OverrideDefaults = [ovFontHeight]
    ParentFont = False
    TabOrder = 1
    OnAjaxEvent = UniDBGrid1AjaxEvent
    OnColumnSort = UniDBGrid1ColumnSort
    Columns = <
      item
        FieldName = 'id'
        Title.Alignment = taCenter
        Title.Caption = 'Ref. No'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 75
        Font.OverrideDefaults = [ovFontHeight]
        Alignment = taCenter
        Sortable = True
      end
      item
        FieldName = 'durum'
        Title.Alignment = taCenter
        Title.Caption = 'Durum'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 120
        Font.OverrideDefaults = [ovFontHeight]
        Alignment = taCenter
        Sortable = True
      end
      item
        FieldName = 'acik_riza'
        Title.Alignment = taCenter
        Title.Caption = 'A'#231#305'k R'#305'za'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 85
        Font.OverrideDefaults = [ovFontHeight]
        Alignment = taCenter
        Sortable = True
        CheckBoxField.BooleanFieldOnly = False
        CheckBoxField.FieldValues = 'E;H'
        CheckBoxField.DisplayValues = 'VAR;YOK'
        ShowSummary = True
      end
      item
        FieldName = 'iys_var'
        Title.Alignment = taCenter
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
        FieldName = 'kisi_str'
        Title.Alignment = taCenter
        Title.Caption = #304'lgili Ki'#351'i'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 200
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
        DisplayMemo = True
      end
      item
        FieldName = 'tanim'
        Title.Alignment = taCenter
        Title.Caption = 'Tan'#305'm'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 400
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
        DisplayMemo = True
      end
      item
        FieldName = 'description'
        Title.Alignment = taCenter
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
    object actImportExcel: TAction
      Caption = 'Excel'#39'den '#304#231'eri Al'
      OnExecute = actImportExcelExecute
    end
    object actTopluKarekod: TAction
      Caption = 'Karekodlar'#305' Toplu Kaydet'
      OnExecute = actTopluKarekodExecute
    end
    object actTopluKarekodA5: TAction
      Caption = 'Karekod Afi'#351'leri Toplu Kaydet'
      OnExecute = actTopluKarekodA5Execute
    end
  end
  object dsAydinlatma: TUniDataSource
    DataSet = MainMod.qAydinlatma
    Left = 279
    Top = 165
  end
  object ppmDownload: TUniPopupMenu
    ScreenMask.Enabled = True
    ScreenMask.Message = 'Dok'#252'man Haz'#305'rlan'#305'yor...'
    ScreenMask.Color = 16744448
    Left = 400
    Top = 161
    object AydnlatmaveAkRzaBelgesiPDF1: TUniMenuItem
      Caption = 'Ayd'#305'nlatma ve A'#231#305'k R'#305'za '#350'ablonu (PDF)'
      OnClick = AydnlatmaveAkRzaBelgesiPDF1Click
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object AydnlatmaveAkRzaablonunuGncelle1: TUniMenuItem
      Caption = 'Ayd. ve A.R. '#350'ab. G'#252'ncelle'
      Visible = False
      OnClick = AydnlatmaveAkRzaablonunuGncelle1Click
    end
    object ListeyiExceleKaydet1: TUniMenuItem
      Action = actExcel
    end
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
      'WHERE active = '#39'E'#39' AND mc_id = 2 AND kisi_id = 369'
      ''
      'SELECT DISTINCT ky.kaynak AS kaynak_str, sakl_ssure, sakl_fsure'
      'FROM data_envanter env'
      'LEFT JOIN def_data_kaynak ky ON env.kaynak_id=ky.id'
      'WHERE env.active = '#39'E'#39' AND env.mc_id = 2 AND env.kisi_id = 369')
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
  object qExport: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user')
    Left = 461
    Top = 166
  end
  object DOCXRpt: TrXMLReport
    ActionAfter = aaNone
    OnUserCalc = DOCXRptUserCalc
    Left = 348
    Top = 223
  end
  object tblKatVeriTipi: TVirtualTable
    FieldDefs = <
      item
        Name = 'kategori'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'veritipi'
        DataType = ftString
        Size = 5000
      end>
    Left = 624
    Top = 165
    Data = {
      0400020008006B617465676F7269010064000000000008007665726974697069
      0100881300000000000000000000}
  end
  object qAmac: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      
        'SELECT DISTINCT kategori_str, veritipi_str, sakl_ssure, sakl_fsu' +
        're'
      'FROM vw_data_envanter'
      'WHERE active = '#39'E'#39' AND mc_id = 2 AND kisi_id = 369')
    Left = 684
    Top = 165
  end
  object qDayanak: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      
        'SELECT DISTINCT kategori_str, veritipi_str, sakl_ssure, sakl_fsu' +
        're'
      'FROM vw_data_envanter'
      'WHERE active = '#39'E'#39' AND mc_id = 2 AND kisi_id = 369')
    Left = 735
    Top = 165
  end
  object qMetod: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      
        'SELECT DISTINCT kategori_str, veritipi_str, sakl_ssure, sakl_fsu' +
        're'
      'FROM vw_data_envanter'
      'WHERE active = '#39'E'#39' AND mc_id = 2 AND kisi_id = 369')
    Left = 786
    Top = 165
  end
  object ppmExcel: TUniPopupMenu
    ScreenMask.Enabled = True
    ScreenMask.Message = 'L'#252'tfen Bekleyiniz'
    Left = 544
    Top = 195
    object UniMenuItem5: TUniMenuItem
      Action = actExcel
      Visible = False
    end
    object UniMenuItem6: TUniMenuItem
      Action = actImportExcel
    end
    object KarekodlarTopluKaydet1: TUniMenuItem
      Action = actTopluKarekod
    end
    object KarekodlarTopluKaydetA51: TUniMenuItem
      Action = actTopluKarekodA5
    end
  end
  object tblKarekod: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'ref_no'
        DataType = ftInteger
      end
      item
        Name = 'ilgili_kisi'
        DataType = ftString
        Size = 100
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
        Name = 'dokuman_turu'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'web_adresi'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'aciklama'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'karekod'
        DataType = ftBlob
      end>
    Left = 618
    Top = 270
    Data = {
      0400080006007265665F6E6F03000000000000000B00696C67696C695F6B6973
      6901006400000000000500647572756D0100140000000000050074616E696D01
      00C800000000000C00646F6B756D616E5F7475727501000A00000000000A0077
      65625F6164726573690100C8000000000008006163696B6C616D610100F40100
      00000007006B6172656B6F640F00000000000000000001000000040000000100
      000005000000646FF0616E05000000616B7469660500000074616EFD6D030000
      00616161080000007561697565617569070000007561756965617500000000}
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
          Left = 75.590599999999990000
          Width = 283.464750000000000000
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
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 359.055350000000000000
          Width = 94.488249999999990000
          Height = 188.976500000000000000
          DataField = 'dokuman_turu'
          DataSet = frxdsKarekod
          DataSetName = 'frxdsKarekod'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsKarekod."dokuman_turu"]')
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
          Left = 453.543600000000000000
          Width = 170.078850000000000000
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
          Width = 75.590599999999990000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Referans No')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 75.590599999999990000
          Width = 283.464750000000000000
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
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 359.055350000000000000
          Width = 94.488249999999990000
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
            'Dok'#252'man T'#252'r'#252)
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
          Left = 453.543600000000000000
          Width = 170.078850000000000000
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
      'ilgili_kisi=ilgili_kisi'
      'durum=durum'
      'tanim=tanim'
      'dokuman_turu=dokuman_turu'
      'web_adresi=web_adresi'
      'aciklama=aciklama'
      'karekod=karekod')
    DataSet = tblKarekod
    BCDToCurrency = False
    DataSetOptions = []
    Left = 712
    Top = 288
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ExportEMF = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 736
    Top = 232
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
  object frxReportKarekodA5: TfrxReport
    Version = '2023.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Varsay'#305'lan'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44589.434054710600000000
    ReportOptions.LastChange = 45901.448385694400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      '  '
      ''
      'procedure Child1OnBeforePrint(Sender: TfrxComponent);'
      'var'
      '  Memo: TfrxMemoView;'
      '  MemoNames: array[0..3] of string;'
      '  i: Integer;'
      '  PrevBottom, Bosluk: Double;'
      'begin'
      '  // Memolar'#305'n isimlerini belirle'
      '  MemoNames[0] := '#39'frxDsMcDefkrm_web1'#39';'
      '  MemoNames[1] := '#39'frxDsMcDefkrm_web2'#39';'
      '  MemoNames[2] := '#39'frxDsMcDefkrm_email'#39';'
      '  MemoNames[3] := '#39'frxDsMcDefkrm_telefon1'#39';'
      ''
      
        '  PrevBottom := 0;        // Child band i'#231'indeki ba'#351'lang'#305#231' nokta' +
        's'#305
      '  Bosluk := 0.5;          // Memo aras'#305' bo'#351'luk'
      ''
      '  for i := 0 to length(MemoNames) -1 do'
      '  begin'
      '    Memo := TfrxMemoView(Sender.FindObject(MemoNames[i]));'
      ''
      '      if Memo.visible = true then'
      '      begin         '
      
        '        Memo.Top := PrevBottom;        // '#214'nceki memo'#8217'nun alt'#305'na' +
        ' yerle'#351'tir'
      '        PrevBottom := Memo.Top + Memo.Height + Bosluk;'
      '      end;'
      ''
      '  end;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 616
    Top = 221
    Datasets = <
      item
        DataSet = frxdsKarekod
        DataSetName = 'frxdsKarekod'
      end
      item
        DataSet = frxDsMcDef
        DataSetName = 'frxDsMcDef'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 148.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 11
      Frame.Typ = []
      MirrorMode = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 657.638220000000000000
        Top = 18.897650000000000000
        Width = 559.370440000000000000
        Child = frxReportKarekodA5.Child1
        DataSet = frxdsKarekod
        DataSetName = 'frxdsKarekod'
        RowCount = 0
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 18.897650000000000000
          Top = 18.897650000000000000
          Width = 525.354670000000000000
          Height = 755.906000000000000000
          Curve = 1
          Frame.Color = clHotLight
          Frame.Typ = []
          Frame.Width = 5.000000000000000000
          Shape = skRoundRectangle
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795300000000000000
          Top = 207.874150000000000000
          Width = 472.441250000000000000
          Height = 75.590600000000000000
          DataField = 'tanim'
          DataSet = frxdsKarekod
          DataSetName = 'frxdsKarekod'
          Font.Charset = TURKISH_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxdsKarekod."tanim"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 188.976500000000000000
          Top = 377.953000000000000000
          Width = 188.976377950000000000
          Height = 188.976377950000000000
          DataField = 'karekod'
          DataSet = frxdsKarekod
          DataSetName = 'frxdsKarekod'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Picture2: TfrxPictureView
          AllowVectorExport = True
          Left = 207.874150000000000000
          Top = 56.692950000000000000
          Width = 151.181138980000000000
          Height = 151.181138980000000000
          Center = True
          DataField = 'krm_logo'
          DataSet = frxDsMcDef
          DataSetName = 'frxDsMcDef'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo3: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 188.976500000000000000
          Top = 321.260050000000000000
          Width = 188.976500000000000000
          Height = 37.795300000000000000
          DataSet = frxDsMcDef
          DataSetName = 'frxDsMcDef'
          Font.Charset = TURKISH_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Detayl'#305' bilgi i'#231'in l'#252'tfen'
            'karekodu okutunuz')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Child1: TfrxChild
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 83.149660000000000000
        Top = 699.213050000000000000
        Width = 559.370440000000000000
        OnBeforePrint = 'Child1OnBeforePrint'
        ToNRows = 0
        ToNRowsMode = rmCount
        object frxDsMcDefkrm_web1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 37.795300000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          DataField = 'krm_web1'
          DataSet = frxDsMcDef
          DataSetName = 'frxDsMcDef'
          Font.Charset = TURKISH_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsMcDef."krm_web1"]')
          ParentFont = False
        end
        object frxDsMcDefkrm_web2: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 37.795300000000000000
          Top = 18.897650000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          DataField = 'krm_web2'
          DataSet = frxDsMcDef
          DataSetName = 'frxDsMcDef'
          Font.Charset = TURKISH_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsMcDef."krm_web2"]')
          ParentFont = False
        end
        object frxDsMcDefkrm_email: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 37.795300000000000000
          Top = 37.795300000000000000
          Width = 521.575140000000000000
          Height = 18.897650000000000000
          DataSet = frxDsMcDef
          DataSetName = 'frxDsMcDef'
          Font.Charset = TURKISH_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsMcDef."krm_email"]')
          ParentFont = False
        end
        object frxDsMcDefkrm_telefon1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 37.795300000000000000
          Top = 56.692950000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          DataField = 'krm_telefon1'
          DataSet = frxDsMcDef
          DataSetName = 'frxDsMcDef'
          Font.Charset = TURKISH_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsMcDef."krm_telefon1"]')
          ParentFont = False
        end
      end
    end
  end
  object frxDsMcDef: TfrxDBDataset
    UserName = 'frxDsMcDef'
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
    DataSet = MainMod.qMCDef
    BCDToCurrency = False
    DataSetOptions = []
    Left = 649
    Top = 327
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
    Left = 807
    Top = 237
  end
  object qDocs: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT *'
      'from def_data_aydinlatma_docs'
      'where ayd_id=:ayd_id'
      'order by id desc')
    Left = 831
    Top = 165
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ayd_id'
        Value = nil
      end>
  end
  object ppmData: TUniPopupMenu
    Left = 912
    Top = 216
    object YeniKayt1: TUniMenuItem
      Action = actAdd
      Break = mbBarBreak
      Caption = 'Yeni Ayd'#305'nlatma Metni Kayd'#305
    end
    object Deitir1: TUniMenuItem
      Action = actEdit
    end
    object N3: TUniMenuItem
      Caption = '-'
    end
    object ndir1: TUniMenuItem
      Caption = #304'ndir'
      object AydnlatmaveAkRzaablonuPDF1: TUniMenuItem
        Caption = 'Ayd'#305'nlatma ve A'#231#305'k R'#305'za '#350'ablonu (PDF)'
        OnClick = AydnlatmaveAkRzaBelgesiPDF1Click
      end
      object N2: TUniMenuItem
        Caption = '-'
      end
      object AydveARabGncelle1: TUniMenuItem
        Caption = 'Ayd. ve A.R. '#350'ab. G'#252'ncelle'
        OnClick = AydnlatmaveAkRzaablonunuGncelle1Click
      end
      object ListeyiExceleKaydet2: TUniMenuItem
        Caption = 'Listeyi Excel'#39'e Kaydet'
        Visible = False
        OnClick = actExcelExecute
      end
    end
    object N4: TUniMenuItem
      Caption = '-'
    end
    object oplulemler1: TUniMenuItem
      Caption = 'Toplu '#304#351'lemler'
      object ListeyiExceleKaydet3: TUniMenuItem
        Action = actExcel
        Break = mbBarBreak
      end
      object ListeyiExceleKaydet4: TUniMenuItem
        Action = actImportExcel
      end
      object KarekodlarTopluKaydet2: TUniMenuItem
        Action = actTopluKarekod
      end
      object KarekodAfileriTopluKaydet1: TUniMenuItem
        Action = actTopluKarekodA5
      end
    end
    object N5: TUniMenuItem
      Caption = '-'
    end
    object Yardm1: TUniMenuItem
      Caption = 'Yard'#305'm'
      OnClick = btnHelpClick
    end
    object Kapat1: TUniMenuItem
      Action = actClose
    end
  end
  object UniScreenMask1: TUniScreenMask
    AttachedControl = UniMenuButton1
    Enabled = True
    DisplayMessage = 'L'#252'tfen bekleyiniz...'
    TargetControl = Owner
    Left = 210
    Top = 249
  end
end
