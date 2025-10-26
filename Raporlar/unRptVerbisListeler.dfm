object frRptVerbisListeler: TfrRptVerbisListeler
  Left = 0
  Top = 0
  Width = 1007
  Height = 518
  OnCreate = UniFrameCreate
  TabOrder = 0
  object pnlTop: TUniPanel
    Left = 0
    Top = 0
    Width = 1007
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
      1007
      72)
    object btnSearch: TUniBitBtn
      Left = 193
      Top = 17
      Width = 96
      Height = 36
      Action = actSearch
      TabOrder = 1
      Images = MainMod.PrjImgList
      ImageIndex = 10
    end
    object btnClose: TUniBitBtn
      Left = 889
      Top = 18
      Width = 96
      Height = 36
      Action = actClose
      Anchors = [akRight, akBottom]
      TabOrder = 2
      Images = MainMod.PrjImgList
      ImageIndex = 5
    end
    object btnExcel: TUniBitBtn
      Left = 295
      Top = 18
      Width = 96
      Height = 36
      Action = actExcel
      TabOrder = 3
      ScreenMask.Enabled = True
      ScreenMask.Message = 'Dok'#252'man Haz'#305'rlan'#305'yor...'
      ScreenMask.Color = 16744448
      Images = MainMod.PrjImgList
      ImageIndex = 4
    end
    object UniLabel1: TUniLabel
      Left = 22
      Top = 30
      Width = 61
      Height = 13
      Hint = ''
      Caption = 'Rapor Tarihi'
      TabOrder = 4
    end
    object edTarihSec: TUniComboBox
      Left = 90
      Top = 25
      Width = 90
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'BUG'#220'N'
      Items.Strings = (
        'BUG'#220'N')
      ItemIndex = 0
      TabOrder = 5
      CharCase = ecUpperCase
      IconItems = <>
    end
    object btnArsivle: TUniBitBtn
      Left = 397
      Top = 18
      Width = 96
      Height = 36
      Hint = ''
      Enabled = False
      Caption = 'Ar'#351'ivle'
      TabOrder = 6
      Images = MainMod.PrjImgList
      ImageIndex = 3
      OnClick = btnArsivleClick
    end
    object btnHelp: TUniBitBtn
      Left = 787
      Top = 18
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 7
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = btnHelpClick
    end
  end
  object UniPageControl1: TUniPageControl
    Left = 0
    Top = 72
    Width = 1007
    Height = 446
    Hint = ''
    ActivePage = tsVeriKategori
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
        Width = 999
        Height = 418
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
        OnColumnSort = gridVeriKategorileriColumnSort
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
            Width = 500
            Font.OverrideDefaults = [ovFontHeight]
            DisplayMemo = True
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
        Width = 999
        Height = 418
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
        OnColumnSort = gridAmacColumnSort
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
            Width = 500
            Font.OverrideDefaults = [ovFontHeight]
            DisplayMemo = True
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
        Width = 999
        Height = 418
        Hint = ''
        DataSource = dsAlici
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
        WebOptions.Paged = False
        LoadMask.Enabled = False
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        OnColumnSort = gridAktarimAliciColumnSort
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
            Width = 500
            Font.OverrideDefaults = [ovFontHeight]
            DisplayMemo = True
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
        Width = 999
        Height = 418
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
        OnColumnSort = gridSaklamaSuresiColumnSort
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
            Width = 500
            Font.OverrideDefaults = [ovFontHeight]
            DisplayMemo = True
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
        Width = 999
        Height = 418
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
        OnColumnSort = gridVeriKonusuKisiColumnSort
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
            Width = 500
            Font.OverrideDefaults = [ovFontHeight]
            DisplayMemo = True
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
        Width = 999
        Height = 418
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
        OnColumnSort = gridAktarimYabanciColumnSort
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
            Width = 500
            Font.OverrideDefaults = [ovFontHeight]
            DisplayMemo = True
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
        Width = 999
        Height = 418
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
        OnColumnSort = gridGuvenlikTedbirColumnSort
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
            Width = 500
            Font.OverrideDefaults = [ovFontHeight]
            DisplayMemo = True
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
      end>
    Left = 222
    Top = 216
    Data = {
      0400040006006361745F6964030000000000000007006361745F73747201002C
      01000000000700646174615F696403000000000000000800646174615F737472
      01002C0100000000000000000000}
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
      'GROUP BY kategori_id, kat.kategori'
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
      end>
    Left = 230
    Top = 296
    Data = {
      0400040006006361745F6964030000000000000007006361745F73747201002C
      01000000000700646174615F696403000000000000000800646174615F737472
      01002C0100000000000000000000}
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
      'SELECT * FROM tblAmac')
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
      end>
    Left = 374
    Top = 168
    Data = {
      0400030006006361745F6964030000000000000007006361745F73747201002C
      01000000000800646174615F73747201002C0100000000000000000000}
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
      end>
    Left = 374
    Top = 224
    Data = {
      0400040006006361745F6964030000000000000007006361745F73747201002C
      01000000000700646174615F696403000000000000000800646174615F737472
      01002C0100000000000000000000}
  end
  object qKisi: TVirtualQuery
    IndexFieldNames = 'cat_str'
    SourceDataSets = <
      item
        DataSet = tblKisi
      end>
    SQL.Strings = (
      'SELECT * FROM tblVTipi')
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
      end>
    Left = 374
    Top = 288
    Data = {
      040002000700646174615F696403000000000000000800646174615F73747201
      002C0100000000000000000000}
  end
  object qYabanci: TVirtualQuery
    SourceDataSets = <
      item
        DataSet = tblYabanci
      end>
    SQL.Strings = (
      'SELECT * FROM tblAmac')
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
      end>
    Left = 374
    Top = 344
    Data = {
      040002000700646174615F696403000000000000000800646174615F73747201
      002C0100000000000000000000}
  end
  object qTedbir: TVirtualQuery
    SourceDataSets = <
      item
        DataSet = tblTedbir
      end>
    SQL.Strings = (
      'SELECT * FROM tblAmac')
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
      end>
    Left = 222
    Top = 168
    Data = {
      040002000700646174615F696403000000000000000800646174615F73747201
      002C0100000000000000000000}
  end
  object qAlici: TVirtualQuery
    SourceDataSets = <
      item
        DataSet = tblAlici
      end>
    SQL.Strings = (
      'SELECT * FROM tblAmac')
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
end
