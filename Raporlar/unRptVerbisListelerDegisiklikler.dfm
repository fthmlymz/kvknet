object frRptVerbisListelerDegisiklikler: TfrRptVerbisListelerDegisiklikler
  Left = 0
  Top = 0
  Width = 1119
  Height = 539
  OnCreate = UniFrameCreate
  TabOrder = 0
  object pnlTop: TUniPanel
    Left = 0
    Top = 0
    Width = 1119
    Height = 72
    Hint = ''
    Align = alTop
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    ClientEvents.ExtEvents.Strings = (
      
        'resize=function resize(sender, width, height, oldWidth, oldHeigh' +
        't, eOpts)'#13#10'{'#13#10'  ajaxRequest(sender, '#39'doResize'#39', []);'#13#10'}')
    Caption = ''
    OnAjaxEvent = pnlTopAjaxEvent
    DesignSize = (
      1119
      72)
    object btnSearch: TUniBitBtn
      Left = 591
      Top = 18
      Width = 96
      Height = 36
      Action = actSearch
      TabOrder = 1
      Images = MainMod.PrjImgList
      ImageIndex = 10
    end
    object btnClose: TUniBitBtn
      Left = 1010
      Top = 18
      Width = 96
      Height = 36
      Action = actClose
      Anchors = [akTop, akRight]
      TabOrder = 2
      Images = MainMod.PrjImgList
      ImageIndex = 5
    end
    object UniLabel1: TUniLabel
      Left = 40
      Top = 14
      Width = 62
      Height = 13
      Hint = ''
      Caption = 'Rapor Tarihi'
      TabOrder = 3
    end
    object edTarihSec: TUniComboBox
      Left = 108
      Top = 11
      Width = 133
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'BUG'#220'N'
      Items.Strings = (
        'BUG'#220'N')
      ItemIndex = 0
      TabOrder = 4
      CharCase = ecUpperCase
      IconItems = <>
    end
    object UniLabel2: TUniLabel
      Left = 7
      Top = 46
      Width = 95
      Height = 13
      Hint = ''
      Caption = 'Kar'#351#305'la'#351't'#305'rma Tarihi'
      TabOrder = 5
    end
    object edTarihSec2: TUniComboBox
      Left = 108
      Top = 41
      Width = 133
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'BUG'#220'N'
      Items.Strings = (
        'BUG'#220'N')
      ItemIndex = 0
      TabOrder = 6
      CharCase = ecUpperCase
      IconItems = <>
    end
    object UniLabel3: TUniLabel
      Left = 402
      Top = 9
      Width = 149
      Height = 13
      Hint = ''
      Caption = 'Solda olup sa'#287'da olmayanlar'
      TabOrder = 7
    end
    object cbSolVarSagYok: TUniCheckBox
      Left = 554
      Top = 6
      Width = 17
      Height = 17
      Hint = ''
      Checked = True
      Caption = ''
      TabOrder = 8
    end
    object cbSolYokSagVar: TUniCheckBox
      Left = 554
      Top = 24
      Width = 17
      Height = 17
      Hint = ''
      Checked = True
      Caption = ''
      TabOrder = 9
    end
    object UniLabel4: TUniLabel
      Left = 402
      Top = 27
      Width = 149
      Height = 13
      Hint = ''
      Caption = 'Sa'#287'da olup solda olmayanlar'
      TabOrder = 10
    end
    object UniLabel5: TUniLabel
      Left = 402
      Top = 44
      Width = 104
      Height = 13
      Hint = ''
      Caption = #304'ki tarafta da olanlar'
      TabOrder = 11
    end
    object cbSolVarSagVar: TUniCheckBox
      Left = 554
      Top = 44
      Width = 17
      Height = 17
      Hint = ''
      Checked = True
      Caption = ''
      TabOrder = 12
    end
    object UniBitBtn1: TUniBitBtn
      Left = 693
      Top = 18
      Width = 96
      Height = 36
      Action = actExcel
      TabOrder = 13
      Images = MainMod.PrjImgList
    end
  end
  object UniPageControl1: TUniPageControl
    Left = 0
    Top = 72
    Width = 1119
    Height = 467
    Hint = ''
    ActivePage = tsAmac
    Align = alClient
    TabOrder = 1
    object tsVeriKategori: TUniTabSheet
      Hint = ''
      Caption = 'Veri Kategorileri'
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      object gridVeriKategorileri: TUniDBGrid
        Left = 0
        Top = 0
        Width = 1111
        Height = 439
        Hint = ''
        ClientEvents.UniEvents.Strings = (
          
            'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  config.cls=' +
            #39'custom-grid'#39';'#13#10'}')
        DataSource = dsVTipi
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
        WebOptions.Paged = False
        Grouping.FieldName = 'cat_str'
        Grouping.FieldCaption = 'Kategori '
        Grouping.Enabled = True
        LoadMask.Enabled = False
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        Exporter.Enabled = True
        Exporter.IncludeGroups = True
        Exporter.FileName = 'VER'#304' KATEGOR'#304'LER'#304
        Exporter.Exporter = UniGridExcelExporter1
        Exporter.Title = 'VER'#304' KATEGOR'#304'LER'#304
        OnColumnSort = gridVeriKategorileriColumnSort
        OnDrawColumnCell = gridVeriKategorileriDrawColumnCell
        Columns = <
          item
            FieldName = 'cat_id'
            Title.Caption = 'cat_id'
            Title.Font.OverrideDefaults = [ovFontHeight]
            Width = 64
            Visible = False
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'cat_str'
            Title.Caption = 'cat_str'
            Title.Font.OverrideDefaults = [ovFontHeight]
            Width = 1804
            Visible = False
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'data_id'
            Title.Caption = 'data_id'
            Title.Font.OverrideDefaults = [ovFontHeight]
            Width = 0
            Visible = False
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'data_str'
            Title.Alignment = taCenter
            Title.Caption = #304#351'lenen Veri Tipleri'
            Title.Font.OverrideDefaults = [ovFontHeight]
            Width = 367
            Font.OverrideDefaults = [ovFontHeight]
            DisplayMemo = True
          end
          item
            FieldName = 'data_str2'
            Title.Alignment = taCenter
            Title.Caption = #304#351'lenen Veri Tipleri'
            Title.Font.OverrideDefaults = [ovFontHeight]
            Width = 331
            Font.OverrideDefaults = [ovFontHeight]
            DisplayMemo = True
          end
          item
            FieldName = 'mesaj_str'
            Title.Alignment = taCenter
            Title.Caption = 'Durum'
            Title.Font.OverrideDefaults = [ovFontHeight]
            Width = 137
          end>
      end
    end
    object tsAmac: TUniTabSheet
      Hint = ''
      Caption = 'Ki'#351'isel Veri '#304#351'leme Ama'#231'lar'#305
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      object gridAmac: TUniDBGrid
        Left = 0
        Top = 0
        Width = 1111
        Height = 439
        Hint = ''
        ClientEvents.UniEvents.Strings = (
          
            'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  config.cls=' +
            #39'custom-grid'#39';'#13#10'}')
        DataSource = dsAmac
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
        WebOptions.Paged = False
        Grouping.FieldName = 'cat_str'
        Grouping.FieldCaption = 'Kategori'
        Grouping.Enabled = True
        LoadMask.Enabled = False
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        Exporter.Enabled = True
        Exporter.IncludeGroups = True
        Exporter.FileName = 'K'#304#350#304'SEL VER'#304' '#304#350'LEME AMA'#199'LARI'
        Exporter.Exporter = UniGridExcelExporter1
        Exporter.Title = 'K'#304#350#304'SEL VER'#304' '#304#350'LEME AMA'#199'LARI'
        OnColumnSort = gridAmacColumnSort
        OnDrawColumnCell = gridAmacDrawColumnCell
        Columns = <
          item
            FieldName = 'cat_id'
            Title.Caption = 'cat_id'
            Width = 64
            Visible = False
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'cat_str'
            Title.Caption = 'cat_str'
            Width = 1804
            Visible = False
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'data_id'
            Title.Caption = 'data_id'
            Width = 0
            Visible = False
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'data_str'
            Title.Alignment = taCenter
            Title.Caption = 'Ki'#351'isel Veri '#304#351'leme Amac'#305
            Width = 377
            Font.OverrideDefaults = [ovFontHeight]
            DisplayMemo = True
          end
          item
            FieldName = 'data_str2'
            Title.Alignment = taCenter
            Title.Caption = 'Ki'#351'isel Veri '#304#351'leme Amac'#305
            Width = 176
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'mesaj_str'
            Title.Alignment = taCenter
            Title.Caption = 'Durum'
            Width = 255
          end>
      end
    end
    object tsAktarimAlici: TUniTabSheet
      Hint = ''
      Caption = 'Veri Aktar'#305'm'#305' Al'#305'c'#305' Gruplar'#305
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      object gridAktarimAlici: TUniDBGrid
        Left = 0
        Top = 0
        Width = 1111
        Height = 439
        Hint = ''
        DataSource = dsAlici
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
        WebOptions.Paged = False
        LoadMask.Enabled = False
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        Exporter.Enabled = True
        Exporter.IncludeGroups = True
        Exporter.FileName = 'VER'#304' AKTARIMI ALICI GRUPLARI'
        Exporter.Exporter = UniGridExcelExporter1
        Exporter.Title = 'VER'#304' AKTARIMI ALICI GRUPLARI'
        OnColumnSort = gridAktarimAliciColumnSort
        OnDrawColumnCell = gridAktarimAliciDrawColumnCell
        Columns = <
          item
            FieldName = 'data_id'
            Title.Caption = 'data_id'
            Width = 0
            Visible = False
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'data_str'
            Title.Alignment = taCenter
            Title.Caption = 'Veri Aktar'#305'm Al'#305'c'#305' Gruplar'#305
            Width = 353
            Font.OverrideDefaults = [ovFontHeight]
            DisplayMemo = True
          end
          item
            FieldName = 'data_str2'
            Title.Alignment = taCenter
            Title.Caption = 'Veri Aktar'#305'm Al'#305'c'#305' Gruplar'#305
            Width = 272
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'mesaj_str'
            Title.Alignment = taCenter
            Title.Caption = 'Durum'
            Width = 242
          end>
      end
    end
    object tsSaklamaSuresi: TUniTabSheet
      Hint = ''
      Caption = 'Veri Saklama S'#252'releri'
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      object gridSaklamaSuresi: TUniDBGrid
        Left = 0
        Top = 0
        Width = 1111
        Height = 439
        Hint = ''
        ClientEvents.UniEvents.Strings = (
          
            'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  config.cls=' +
            #39'custom-grid'#39';'#13#10'}')
        DataSource = dsSure
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
        WebOptions.Paged = False
        Grouping.FieldName = 'cat_str'
        Grouping.FieldCaption = 'Kategori'
        Grouping.Enabled = True
        LoadMask.Enabled = False
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        Exporter.Enabled = True
        Exporter.IncludeGroups = True
        Exporter.FileName = 'VER'#304' SAKLAMA S'#220'RELER'#304
        Exporter.Exporter = UniGridExcelExporter1
        Exporter.Title = 'VER'#304' SAKLAMA S'#220'RELER'#304
        OnColumnSort = gridSaklamaSuresiColumnSort
        OnDrawColumnCell = gridSaklamaSuresiDrawColumnCell
        Columns = <
          item
            FieldName = 'cat_id'
            Title.Caption = 'cat_id'
            Width = 64
            Visible = False
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'cat_str'
            Title.Caption = 'cat_str'
            Width = 1804
            Visible = False
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'data_str'
            Title.Alignment = taCenter
            Title.Caption = 'Veri Saklama S'#252'releri'
            Width = 370
            Font.OverrideDefaults = [ovFontHeight]
            DisplayMemo = True
          end
          item
            FieldName = 'data_str2'
            Title.Alignment = taCenter
            Title.Caption = 'Veri Saklama S'#252'releri'
            Width = 186
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'mesaj_str'
            Title.Alignment = taCenter
            Title.Caption = 'Durum'
            Width = 239
          end>
      end
    end
    object tsVeriKonusuKisi: TUniTabSheet
      Hint = ''
      Caption = 'Veri Konusu Ki'#351'i Gruplar'#305
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      object gridVeriKonusuKisi: TUniDBGrid
        Left = 0
        Top = 0
        Width = 1111
        Height = 439
        Hint = ''
        ClientEvents.UniEvents.Strings = (
          
            'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  config.cls=' +
            #39'custom-grid'#39';'#13#10'}')
        DataSource = dsKisi
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
        WebOptions.Paged = False
        Grouping.FieldName = 'cat_str'
        Grouping.FieldCaption = 'Kategori '
        Grouping.Enabled = True
        LoadMask.Enabled = False
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        Exporter.Enabled = True
        Exporter.IncludeGroups = True
        Exporter.FileName = 'VER'#304' KONUSU K'#304#350#304' GRUPLARI'
        Exporter.Exporter = UniGridExcelExporter1
        Exporter.Title = 'VER'#304' KONUSU K'#304#350#304' GRUPLARI'
        OnColumnSort = gridVeriKonusuKisiColumnSort
        OnDrawColumnCell = gridVeriKonusuKisiDrawColumnCell
        Columns = <
          item
            FieldName = 'cat_id'
            Title.Caption = 'cat_id'
            Width = 64
            Visible = False
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'cat_str'
            Title.Caption = 'cat_str'
            Width = 1804
            Visible = False
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'data_id'
            Title.Caption = 'data_id'
            Width = 0
            Visible = False
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'data_str'
            Title.Alignment = taCenter
            Title.Caption = 'Veri Konusu Ki'#351'i Gruplar'#305
            Width = 405
            Font.OverrideDefaults = [ovFontHeight]
            DisplayMemo = True
          end
          item
            FieldName = 'data_str2'
            Title.Alignment = taCenter
            Title.Caption = 'Veri Konusu Ki'#351'i Gruplar'#305
            Width = 229
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'mesaj_str'
            Title.Alignment = taCenter
            Title.Caption = 'Durum'
            Width = 223
          end>
      end
    end
    object tsAktarimYabanci: TUniTabSheet
      Hint = ''
      Caption = 'Yabanc'#305' '#220'lkelere Aktar'#305'lacak Bilgiler'
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      object gridAktarimYabanci: TUniDBGrid
        Left = 0
        Top = 0
        Width = 1111
        Height = 439
        Hint = ''
        ClientEvents.UniEvents.Strings = (
          
            'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  config.cls=' +
            #39'custom-grid'#39';'#13#10'}')
        DataSource = dsYabanci
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
        WebOptions.Paged = False
        LoadMask.Enabled = False
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        Exporter.Enabled = True
        Exporter.IncludeGroups = True
        Exporter.FileName = 'YABANCI '#220'LKELERE AKTARIMLAR'
        Exporter.Exporter = UniGridExcelExporter1
        Exporter.Title = 'YABANCI '#220'LKELERE AKTARIMLAR'
        OnColumnSort = gridAktarimYabanciColumnSort
        OnDrawColumnCell = gridAktarimYabanciDrawColumnCell
        Columns = <
          item
            FieldName = 'data_id'
            Title.Caption = 'data_id'
            Width = 0
            Visible = False
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'data_str'
            Title.Alignment = taCenter
            Title.Caption = 'Yabanc'#305' '#220'lkelere Aktar'#305'lacak Bilgiler'
            Width = 365
            Font.OverrideDefaults = [ovFontHeight]
            DisplayMemo = True
          end
          item
            FieldName = 'data_str2'
            Title.Alignment = taCenter
            Title.Caption = 'Yabanc'#305' '#220'lkelere Aktar'#305'lacak Bilgiler'
            Width = 387
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'mesaj_str'
            Title.Alignment = taCenter
            Title.Caption = 'Durum'
            Width = 186
          end>
      end
    end
    object tsGuvenlikTedbir: TUniTabSheet
      Hint = ''
      Caption = 'Veri G'#252'venli'#287'i Tedbirleri'
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      object gridGuvenlikTedbir: TUniDBGrid
        Left = 0
        Top = 0
        Width = 1111
        Height = 439
        Hint = ''
        ClientEvents.UniEvents.Strings = (
          
            'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  config.cls=' +
            #39'custom-grid'#39';'#13#10'}')
        DataSource = dsTedbir
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
        WebOptions.Paged = False
        LoadMask.Enabled = False
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        Exporter.Enabled = True
        Exporter.IncludeGroups = True
        Exporter.FileName = 'VER'#304' G'#220'VENL'#304#286#304' TEDB'#304'RLER'
        Exporter.Exporter = UniGridExcelExporter1
        Exporter.Title = 'VER'#304' G'#220'VENL'#304#286#304' TEDB'#304'RLER'
        OnColumnSort = gridGuvenlikTedbirColumnSort
        OnDrawColumnCell = gridGuvenlikTedbirDrawColumnCell
        Columns = <
          item
            FieldName = 'data_id'
            Title.Caption = 'data_id'
            Width = 0
            Visible = False
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'data_str'
            Title.Alignment = taCenter
            Title.Caption = 'Veri G'#252'venli'#287'i Tedbirleri'
            Width = 428
            Font.OverrideDefaults = [ovFontHeight]
            DisplayMemo = True
          end
          item
            FieldName = 'data_str2'
            Title.Caption = 'Veri G'#252'venli'#287'i Tedbirleri'
            Width = 241
            Font.OverrideDefaults = [ovFontHeight]
            DisplayMemo = True
          end
          item
            FieldName = 'mesaj_str'
            Title.Alignment = taCenter
            Title.Caption = 'Durum'
            Width = 299
          end>
      end
    end
  end
  object ActList: TActionList
    Left = 156
    Top = 165
    object actSearch: TAction
      Caption = 'Liste'
      OnExecute = actSearchExecute
    end
    object actClose: TAction
      Caption = 'Kapat'
      OnExecute = actCloseExecute
    end
    object actExcel: TAction
      Caption = 'Excel'
      OnExecute = actExcelExecute
    end
  end
  object tblVTipi: TVirtualTable
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
        Name = 'data_id'
        DataType = ftInteger
      end
      item
        Name = 'data_str'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'data_str2'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'data_id2'
        DataType = ftInteger
      end
      item
        Name = 'data_flag'
        DataType = ftInteger
      end
      item
        Name = 'mesaj_str'
        DataType = ftString
        Size = 20
      end>
    BeforePost = tblVTipiBeforePost
    Left = 222
    Top = 216
    Data = {
      0400080006006361745F6964030000000000000007006361745F73747201002C
      01000000000700646174615F696403000000000000000800646174615F737472
      01002C01000000000900646174615F7374723201002C01000000000800646174
      615F69643203000000000000000900646174615F666C61670300000000000000
      09006D6573616A5F7374720100140000000000000000000000}
  end
  object dsVTipi: TUniDataSource
    DataSet = qVTipi
    Left = 321
    Top = 216
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT kategori_id, kat.kategori AS kategori_str, count(env.id)'
      'FROM data_envanter env'
      'LEFT JOIN def_data_kategori kat ON env.kategori_id = kat.id'
      'WHERE env.active = '#39'E'#39' AND env.main_id > 0 AND env.mc_id = 2'
      'GROUP BY kategori_id, kategori_str'
      'ORDER BY 1')
    Left = 156
    Top = 216
  end
  object qVTipi: TVirtualQuery
    IndexFieldNames = 'cat_str'
    SourceDataSets = <
      item
        DataSet = tblVTipi
      end>
    SQL.Strings = (
      'SELECT * FROM tblVTipi')
    Left = 276
    Top = 216
  end
  object tblAmac: TVirtualTable
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
        Name = 'data_id'
        DataType = ftInteger
      end
      item
        Name = 'data_str'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'data_id2'
        DataType = ftInteger
      end
      item
        Name = 'data_str2'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'data_flag'
        DataType = ftInteger
      end
      item
        Name = 'mesaj_str'
        DataType = ftString
        Size = 20
      end>
    BeforePost = tblAmacBeforePost
    Left = 230
    Top = 296
    Data = {
      0400080006006361745F6964030000000000000007006361745F73747201002C
      01000000000700646174615F696403000000000000000800646174615F737472
      01002C01000000000800646174615F6964320300000000000000090064617461
      5F7374723201002C01000000000900646174615F666C61670300000000000000
      09006D6573616A5F7374720100140000000000000000000000}
  end
  object qAmac: TVirtualQuery
    SourceDataSets = <
      item
        DataSet = tblAmac
      end>
    SQL.Strings = (
      'SELECT * FROM tblAmac')
    Left = 284
    Top = 296
  end
  object dsAmac: TUniDataSource
    DataSet = qAmac
    Left = 329
    Top = 296
  end
  object qKategori: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT kategori_id, kat.kategori AS kategori_str, count(env.id)'
      'FROM data_envanter env'
      'LEFT JOIN def_data_kategori kat ON env.kategori_id = kat.id'
      'WHERE env.active = '#39'E'#39' AND env.main_id > 0 AND env.mc_id = 2'
      'GROUP BY kategori_id, kategori_str'
      'ORDER BY 1')
    Left = 182
    Top = 293
  end
  object qSure: TVirtualQuery
    SourceDataSets = <
      item
        DataSet = tblSure
      end>
    SQL.Strings = (
      'SELECT * FROM tblSure')
    Left = 428
    Top = 168
  end
  object dsSure: TUniDataSource
    DataSet = qSure
    Left = 473
    Top = 168
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
      end
      item
        Name = 'data_str2'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'data_flag'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'mesaj_str'
        DataType = ftString
        Size = 20
      end>
    BeforePost = tblSureBeforePost
    Left = 374
    Top = 168
    Data = {
      0400060006006361745F6964030000000000000007006361745F73747201002C
      01000000000800646174615F73747201002C01000000000900646174615F7374
      723201002C01000000000900646174615F666C6167010014000000000009006D
      6573616A5F7374720100140000000000000000000000}
  end
  object tblKisi: TVirtualTable
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
        Name = 'data_id'
        DataType = ftInteger
      end
      item
        Name = 'data_str'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'data_str2'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'data_id2'
        DataType = ftInteger
      end
      item
        Name = 'data_flag'
        DataType = ftInteger
      end
      item
        Name = 'mesaj_str'
        DataType = ftString
        Size = 20
      end>
    BeforePost = tblKisiBeforePost
    Left = 374
    Top = 224
    Data = {
      0400080006006361745F6964030000000000000007006361745F73747201002C
      01000000000700646174615F696403000000000000000800646174615F737472
      01002C01000000000900646174615F7374723201002C01000000000800646174
      615F69643203000000000000000900646174615F666C61670300000000000000
      09006D6573616A5F7374720100140000000000000000000000}
  end
  object qKisi: TVirtualQuery
    IndexFieldNames = 'cat_str'
    SourceDataSets = <
      item
        DataSet = tblKisi
      end>
    SQL.Strings = (
      'SELECT * FROM tblKisi')
    Left = 428
    Top = 224
  end
  object dsKisi: TUniDataSource
    DataSet = qKisi
    Left = 473
    Top = 224
  end
  object tblYabanci: TVirtualTable
    FieldDefs = <
      item
        Name = 'data_id'
        DataType = ftInteger
      end
      item
        Name = 'data_str'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'data_id2'
        DataType = ftInteger
      end
      item
        Name = 'data_str2'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'data_flag'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'mesaj_str'
        DataType = ftString
        Size = 20
      end>
    BeforePost = tblYabanciBeforePost
    Left = 374
    Top = 288
    Data = {
      040006000700646174615F696403000000000000000800646174615F73747201
      002C01000000000800646174615F69643203000000000000000900646174615F
      7374723201002C01000000000900646174615F666C6167010014000000000009
      006D6573616A5F7374720100140000000000000000000000}
  end
  object qYabanci: TVirtualQuery
    SourceDataSets = <
      item
        DataSet = tblYabanci
      end>
    SQL.Strings = (
      'SELECT * FROM tblYabanci')
    Left = 428
    Top = 288
  end
  object dsYabanci: TUniDataSource
    DataSet = qYabanci
    Left = 466
    Top = 288
  end
  object tblTedbir: TVirtualTable
    FieldDefs = <
      item
        Name = 'data_id'
        DataType = ftInteger
      end
      item
        Name = 'data_str'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'data_id2'
        DataType = ftInteger
      end
      item
        Name = 'data_str2'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'data_flag'
        DataType = ftInteger
      end
      item
        Name = 'mesaj_str'
        DataType = ftString
        Size = 20
      end>
    BeforePost = tblTedbirBeforePost
    Left = 374
    Top = 344
    Data = {
      040006000700646174615F696403000000000000000800646174615F73747201
      002C01000000000800646174615F69643203000000000000000900646174615F
      7374723201002C01000000000900646174615F666C6167030000000000000009
      006D6573616A5F7374720100140000000000000000000000}
  end
  object qTedbir: TVirtualQuery
    SourceDataSets = <
      item
        DataSet = tblTedbir
      end>
    SQL.Strings = (
      'SELECT * FROM tblTedbir')
    Left = 428
    Top = 344
  end
  object dsTedbir: TUniDataSource
    DataSet = qTedbir
    Left = 473
    Top = 344
  end
  object tblAlici: TVirtualTable
    FieldDefs = <
      item
        Name = 'data_id'
        DataType = ftInteger
      end
      item
        Name = 'data_str'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'data_id2'
        DataType = ftInteger
      end
      item
        Name = 'data_str2'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'data_flag'
        DataType = ftInteger
      end
      item
        Name = 'mesaj_str'
        DataType = ftString
        Size = 20
      end>
    BeforePost = tblAliciBeforePost
    Left = 222
    Top = 168
    Data = {
      040006000700646174615F696403000000000000000800646174615F73747201
      002C01000000000800646174615F69643203000000000000000900646174615F
      7374723201002C01000000000900646174615F666C6167030000000000000009
      006D6573616A5F7374720100140000000000000000000000}
  end
  object qAlici: TVirtualQuery
    SourceDataSets = <
      item
        DataSet = tblAlici
      end>
    SQL.Strings = (
      'SELECT * FROM tblAlici')
    Left = 276
    Top = 168
  end
  object dsAlici: TUniDataSource
    DataSet = qAlici
    Left = 321
    Top = 168
  end
  object qArchive: TUniQuery
    Connection = MainMod.DBMain
    Left = 108
    Top = 216
  end
  object qTmp2: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT kategori_id, kat.kategori AS kategori_str, count(env.id)'
      'FROM data_envanter env'
      'LEFT JOIN def_data_kategori kat ON env.kategori_id = kat.id'
      'WHERE env.active = '#39'E'#39' AND env.main_id > 0 AND env.mc_id = 2'
      'GROUP BY kategori_id, kategori_str'
      'ORDER BY 1')
    Left = 156
    Top = 264
  end
  object qTmp1: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT kategori_id, kat.kategori AS kategori_str, count(env.id)'
      'FROM data_envanter env'
      'LEFT JOIN def_data_kategori kat ON env.kategori_id = kat.id'
      'WHERE env.active = '#39'E'#39' AND env.main_id > 0 AND env.mc_id = 2'
      'GROUP BY kategori_id, kategori_str'
      'ORDER BY 1')
    Left = 108
    Top = 266
  end
  object tblTmp1: TVirtualTable
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
        Name = 'data_id'
        DataType = ftInteger
      end
      item
        Name = 'data_str'
        DataType = ftString
        Size = 300
      end>
    Left = 110
    Top = 376
    Data = {
      0400040006006361745F6964030000000000000007006361745F73747201002C
      01000000000700646174615F696403000000000000000800646174615F737472
      01002C0100000000000000000000}
  end
  object tblTmp2: TVirtualTable
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
        Name = 'data_id'
        DataType = ftInteger
      end
      item
        Name = 'data_str'
        DataType = ftString
        Size = 300
      end>
    Left = 150
    Top = 376
    Data = {
      0400040006006361745F6964030000000000000007006361745F73747201002C
      01000000000700646174615F696403000000000000000800646174615F737472
      01002C0100000000000000000000}
  end
  object UniGridExcelExporter1: TUniGridExcelExporter
    FileExtention = 'xlsx'
    MimeType = 
      'application/vnd.openxmlformats-officedocument.spreadsheetml.shee' +
      't'
    CharSet = 'UTF-8'
    Left = 544
    Top = 256
  end
end
