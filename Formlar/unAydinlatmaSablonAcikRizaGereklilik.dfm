object frmAydinlatmaSablonAcikRizaGereklilik: TfrmAydinlatmaSablonAcikRizaGereklilik
  Left = 0
  Top = 0
  ClientHeight = 622
  ClientWidth = 1348
  Caption = 'A'#231#305'k r'#305'za gerektiren verileri se'#231'iniz'
  WindowState = wsMaximized
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  OnDestroy = UniFormDestroy
  TextHeight = 15
  object pnlmain: TUniPanel
    Left = 0
    Top = 0
    Width = 1348
    Height = 534
    Hint = ''
    Align = alClient
    TabOrder = 0
    ShowCaption = False
    Caption = 'pnlmain'
    AlignmentControl = uniAlignmentClient
    ParentAlignmentControl = False
    Layout = 'hbox'
    LayoutAttribs.Padding = '5'
    LayoutConfig.BodyPadding = '5'
    object pnlVeritipi: TUniPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 389
      Height = 526
      Hint = ''
      TabOrder = 3
      ShowCaption = False
      Title = 'A'#231#305'k R'#305'za Gerektiren Kategori ve Veri tipleri'
      Caption = ''
      Layout = 'fit'
      LayoutConfig.Flex = 2
      LayoutConfig.Height = '100%'
      object grdveritipi: TUniDBGrid
        Left = 1
        Top = 62
        Width = 387
        Height = 430
        Hint = ''
        ClientEvents.UniEvents.Strings = (
          
            'beforeInit=function beforeInit(sender, config) {'#13#10'    var groupi' +
            'ngFeature = Ext.create('#39'Ext.grid.feature.Grouping'#39', {'#13#10'        g' +
            'roupHeaderTpl: new Ext.XTemplate('#13#10'            '#39'<span style="fon' +
            't-family: Comic Sans MS, Comic Sans; font-size: 12px; font-weigh' +
            't: bold; font-style: italic; color: green">{columnName}: {name}<' +
            '/span>'#39','#13#10'            '#39#39', {'#13#10'            }'#13#10'        ),'#13#10'        ' +
            'hideGroupedHeader: true'#13#10'    });'#13#10#13#10'  '#13#10'}'#13#10)
        HeaderTitle = 'Veri Tipleri'
        DataSource = dsveritipi
        WebOptions.Paged = False
        Grouping.FieldName = 'kategori_str'
        Grouping.FieldCaption = 'Kategori '
        Grouping.Enabled = True
        LoadMask.ShowMessage = False
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 1
        OnCellClick = grdCellClick
        OnColumnSort = grdveritipiColumnSort
        Columns = <
          item
            FieldName = 'sec'
            Title.Caption = 'Se'#231
            Width = 100
            Font.OverrideDefaults = [ovFontHeight]
            Alignment = taLeftJustify
            CheckBoxField.BooleanFieldOnly = False
          end
          item
            FieldName = 'veritipi_str'
            Title.Caption = 'Veri Tipi'
            Title.Font.OverrideDefaults = [ovFontHeight]
            Width = 250
            Font.OverrideDefaults = [ovFontHeight]
            ReadOnly = True
            DisplayMemo = True
          end>
      end
      object UniPanel3: TUniPanel
        Left = 1
        Top = 492
        Width = 387
        Height = 33
        Hint = ''
        Align = alBottom
        TabOrder = 2
        ShowCaption = False
        Caption = ''
        object btnSelectVtipi: TUniSpeedButton
          Tag = 10
          AlignWithMargins = True
          Left = 21
          Top = 4
          Width = 24
          Height = 25
          Hint = 'T'#252'm'#252'n'#252' Se'#231
          Margins.Left = 20
          ShowHint = True
          ParentShowHint = False
          Caption = ''
          ParentColor = False
          Images = MainMod.BtnImgList
          ImageIndex = 4
          TabOrder = 1
          OnClick = selectall
        end
        object btnNoSelectvtipi: TUniSpeedButton
          Tag = 20
          AlignWithMargins = True
          Left = 51
          Top = 4
          Width = 23
          Height = 25
          Hint = 'T'#252'm se'#231'imleri kald'#305'r'
          ShowHint = True
          ParentShowHint = False
          Caption = ''
          ParentColor = False
          Images = MainMod.BtnImgList
          ImageIndex = 2
          TabOrder = 2
          OnClick = selectall
        end
      end
      object pnlKategori: TUniPanel
        Left = 1
        Top = 1
        Width = 387
        Height = 61
        Hint = ''
        Align = alTop
        TabOrder = 3
        ShowCaption = False
        TitleVisible = True
        Title = 'Kategori'
        Caption = ''
        Layout = 'fit'
        object chlKategori: TUniCheckComboBox
          AlignWithMargins = True
          Left = 4
          Top = 26
          Width = 379
          Height = 31
          Hint = ''
          Margins.Top = 20
          Text = ''
          Align = alBottom
          TabOrder = 1
          ClientEvents.ExtEvents.Strings = (
            
              'afterrender=function afterrender(sender) {'#13#10'    sender.inputEl.s' +
              'etStyle('#39'white-space'#39', '#39'normal'#39');'#13#10'    sender.inputEl.setStyle('#39 +
              'height'#39', '#39'auto'#39');'#13#10'    sender.inputEl.setStyle('#39'overflow-wrap'#39', ' +
              #39'break-word'#39');'#13#10'}')
          IconItems = <>
          OnChange = chlKategoriChange
        end
      end
    end
    object pnlamac: TUniPanel
      AlignWithMargins = True
      Left = 399
      Top = 4
      Width = 499
      Height = 526
      Hint = ''
      TabOrder = 1
      ShowCaption = False
      Title = 'A'#231#305'k R'#305'za Gerektiren Kategori ve Veri tipleri'
      Caption = ''
      Layout = 'fit'
      LayoutConfig.Flex = 2
      LayoutConfig.Height = '100%'
      object grdamac: TUniDBGrid
        Left = 1
        Top = 1
        Width = 497
        Height = 491
        Hint = ''
        HeaderTitle = 'Ama'#231'lar'
        DataSource = dsamac
        WebOptions.Paged = False
        LoadMask.ShowMessage = False
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 1
        OnCellClick = grdCellClick
        Columns = <
          item
            FieldName = 'sec'
            Title.Caption = 'Se'#231
            Width = 100
            Font.OverrideDefaults = [ovFontHeight]
            Alignment = taLeftJustify
            CheckBoxField.BooleanFieldOnly = False
          end
          item
            FieldName = 'amac_str'
            Title.Caption = 'Ama'#231'lar'
            Title.Font.OverrideDefaults = [ovFontHeight]
            Width = 300
            Font.OverrideDefaults = [ovFontHeight]
            ReadOnly = True
            DisplayMemo = True
          end>
      end
      object UniPanel4: TUniPanel
        Left = 1
        Top = 492
        Width = 497
        Height = 33
        Hint = ''
        Align = alBottom
        TabOrder = 2
        ShowCaption = False
        Caption = ''
        object btnselectAmac: TUniSpeedButton
          Tag = 10
          AlignWithMargins = True
          Left = 21
          Top = 4
          Width = 24
          Height = 25
          Hint = 'T'#252'm'#252'n'#252' Se'#231
          Margins.Left = 20
          ShowHint = True
          ParentShowHint = False
          Caption = ''
          ParentColor = False
          Images = MainMod.BtnImgList
          ImageIndex = 4
          TabOrder = 1
          OnClick = selectall
        end
        object btnNoselectAmac: TUniSpeedButton
          Tag = 20
          AlignWithMargins = True
          Left = 51
          Top = 4
          Width = 23
          Height = 25
          Hint = 'T'#252'm se'#231'imleri kald'#305'r'
          ShowHint = True
          ParentShowHint = False
          Caption = ''
          ParentColor = False
          Images = MainMod.BtnImgList
          ImageIndex = 2
          TabOrder = 2
          OnClick = selectall
        end
      end
    end
    object pnltaraf: TUniPanel
      AlignWithMargins = True
      Left = 904
      Top = 4
      Width = 440
      Height = 526
      Hint = ''
      TabOrder = 2
      ShowCaption = False
      Title = 'A'#231#305'k R'#305'za Gerektiren Kategori ve Veri tipleri'
      Caption = ''
      Layout = 'fit'
      LayoutConfig.Flex = 2
      LayoutConfig.Height = '100%'
      object grdtaraf: TUniDBGrid
        Left = 1
        Top = 1
        Width = 438
        Height = 491
        Hint = ''
        HeaderTitle = 'Payla'#351#305'lan Taraflar'
        DataSource = dstaraf
        WebOptions.Paged = False
        LoadMask.ShowMessage = False
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 1
        OnCellClick = grdCellClick
        Columns = <
          item
            FieldName = 'sec'
            Title.Caption = 'Se'#231
            Width = 100
            Font.OverrideDefaults = [ovFontHeight]
            Alignment = taLeftJustify
            CheckBoxField.BooleanFieldOnly = False
          end
          item
            FieldName = 'taraf_str'
            Title.Caption = 'Taraf'
            Title.Font.OverrideDefaults = [ovFontHeight]
            Width = 300
            Font.OverrideDefaults = [ovFontHeight]
            ReadOnly = True
            DisplayMemo = True
          end>
      end
      object UniPanel1: TUniPanel
        Left = 1
        Top = 492
        Width = 438
        Height = 33
        Hint = ''
        Align = alBottom
        TabOrder = 2
        ShowCaption = False
        Caption = ''
        object btnselectTaraf: TUniSpeedButton
          Tag = 10
          AlignWithMargins = True
          Left = 21
          Top = 4
          Width = 24
          Height = 25
          Hint = 'T'#252'm'#252'n'#252' Se'#231
          Margins.Left = 20
          ShowHint = True
          ParentShowHint = False
          Caption = ''
          ParentColor = False
          Images = MainMod.BtnImgList
          ImageIndex = 4
          TabOrder = 1
          OnClick = selectall
        end
        object btnNoSelectTaraf: TUniSpeedButton
          Tag = 20
          AlignWithMargins = True
          Left = 51
          Top = 4
          Width = 23
          Height = 25
          Hint = 'T'#252'm se'#231'imleri kald'#305'r'
          ShowHint = True
          ParentShowHint = False
          Caption = ''
          ParentColor = False
          Images = MainMod.BtnImgList
          ImageIndex = 2
          TabOrder = 2
          OnClick = selectall
        end
      end
    end
  end
  object pnlButtons: TUniPanel
    Left = 0
    Top = 534
    Width = 1348
    Height = 88
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      1348
      88)
    object btnCancel: TUniBitBtn
      Left = 1242
      Top = 49
      Width = 96
      Height = 36
      Hint = ''
      Caption = #304'ptal'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
      Images = MainMod.PrjImgList
      ImageIndex = 5
      OnClick = btnCancelClick
    end
    object btnPost: TUniBitBtn
      Left = 1140
      Top = 49
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Kaydet'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 0
      Images = MainMod.PrjImgList
      ImageIndex = 14
      OnClick = btnPostClick
    end
    object pnlLog: TUniContainerPanel
      Left = 1
      Top = 1
      Width = 1346
      Height = 42
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 4
      object UniLabel4: TUniLabel
        Left = 12
        Top = 6
        Width = 117
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = #304'lk Kay'#305't Yapan :'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
      end
      object UniLabel5: TUniLabel
        Left = 12
        Top = 24
        Width = 117
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = #304'lk Kay'#305't Zaman'#305' :'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
      end
      object UniLabel6: TUniLabel
        Left = 321
        Top = 5
        Width = 117
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Son De'#287'. Yapan :'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
      end
      object UniLabel7: TUniLabel
        Left = 321
        Top = 23
        Width = 117
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Son De'#287'. Zaman'#305' :'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
      end
      object lbIDY: TUniLabel
        Left = 135
        Top = 5
        Width = 180
        Height = 13
        Hint = ''
        AutoSize = False
        Caption = 'lbIDY'
        ParentFont = False
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 5
      end
      object lbIDT: TUniLabel
        Left = 135
        Top = 24
        Width = 180
        Height = 13
        Hint = ''
        AutoSize = False
        Caption = 'lbIDT'
        ParentFont = False
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 6
      end
      object lbSDY: TUniLabel
        Left = 444
        Top = 5
        Width = 180
        Height = 13
        Hint = ''
        AutoSize = False
        Caption = 'lbSDY'
        ParentFont = False
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 7
      end
      object lbSDT: TUniLabel
        Left = 444
        Top = 23
        Width = 180
        Height = 13
        Hint = ''
        AutoSize = False
        Caption = 'lbSDT'
        ParentFont = False
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 8
      end
    end
    object btnHelp: TUniBitBtn
      Left = 1032
      Top = 49
      Width = 96
      Height = 36
      Hint = ''
      ParentShowHint = False
      Caption = 'Yard'#305'm'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
      Images = MainMod.PrjImgList
      ImageIndex = 16
    end
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    Left = 435
    Top = 28
  end
  object vtveritipi: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'veritipi_id'
        DataType = ftInteger
      end
      item
        Name = 'veritipi_str'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'kategori_str'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'sec'
        DataType = ftBoolean
      end>
    Left = 40
    Top = 32
    Data = {
      040004000B0076657269746970695F696403000000000000000C007665726974
      6970695F73747201002C01000000000C006B617465676F72695F73747201002C
      010000000003007365630500000000000000000000000000}
  end
  object dsveritipi: TUniDataSource
    DataSet = vtveritipi
    Left = 85
    Top = 36
  end
  object vtamac: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'amac_id'
        DataType = ftInteger
      end
      item
        Name = 'amac_str'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'sec'
        DataType = ftBoolean
      end>
    Left = 32
    Top = 88
    Data = {
      040003000700616D61635F696403000000000000000800616D61635F73747201
      002C010000000003007365630500000000000000000000000000}
  end
  object dsamac: TUniDataSource
    DataSet = vtamac
    Left = 77
    Top = 92
  end
  object vttaraf: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'taraf_id'
        DataType = ftInteger
      end
      item
        Name = 'taraf_str'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'sec'
        DataType = ftBoolean
      end>
    Left = 32
    Top = 152
    Data = {
      04000300080074617261665F69640300000000000000090074617261665F7374
      7201002C010000000003007365630500000000000000000000000000}
  end
  object dstaraf: TUniDataSource
    DataSet = vttaraf
    Left = 77
    Top = 156
  end
  object qAcikrizaSecenek: TUniQuery
    KeyFields = 'id'
    Connection = MainMod.DBMain
    Left = 500
    Top = 37
  end
end
