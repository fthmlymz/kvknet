object frDashboard: TfrDashboard
  Left = 0
  Top = 0
  Width = 1292
  Height = 861
  Hint = 'S'#252'r'#252'm Notlar'#305
  OnCreate = UniFrameCreate
  Layout = 'vbox'
  LayoutConfig.Flex = 1
  Color = 15658734
  ShowHint = True
  ParentShowHint = False
  TabOrder = 0
  ParentColor = False
  ParentBackground = False
  object UniScrollBox1: TUniScrollBox
    Left = 0
    Top = 0
    Width = 1292
    Height = 861
    Hint = ''
    ShowHint = True
    Align = alClient
    Color = clWhite
    TabOrder = 0
    ScrollHeight = 848
    ScrollWidth = 1240
    object UniPanel16: TUniPanel
      Left = 1029
      Top = 57
      Width = 210
      Height = 100
      Hint = ''
      ShowHint = True
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 9
      BorderStyle = ubsNone
      Caption = ''
      Color = clGray
      LayoutAttribs.Align = 'middle'
    end
    object UniPanel13: TUniPanel
      Left = 778
      Top = 57
      Width = 210
      Height = 100
      Hint = ''
      ShowHint = True
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 7
      BorderStyle = ubsNone
      Caption = ''
      Color = clGray
      LayoutAttribs.Align = 'middle'
    end
    object UniPanel10: TUniPanel
      Left = 527
      Top = 57
      Width = 210
      Height = 100
      Hint = ''
      ShowHint = True
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 5
      BorderStyle = ubsNone
      Caption = ''
      Color = clGray
      LayoutAttribs.Align = 'middle'
    end
    object UniPanel6: TUniPanel
      Left = 276
      Top = 57
      Width = 210
      Height = 100
      Hint = ''
      ShowHint = True
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 3
      BorderStyle = ubsNone
      Caption = ''
      Color = clGray
      LayoutAttribs.Align = 'middle'
    end
    object UniPanel1: TUniPanel
      Left = 29
      Top = 57
      Width = 210
      Height = 100
      Hint = ''
      ShowHint = True
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
      BorderStyle = ubsNone
      Caption = ''
      Color = clGray
      LayoutAttribs.Align = 'middle'
    end
    object UniPanel2: TUniPanel
      Left = 20
      Top = 50
      Width = 210
      Height = 100
      Hint = ''
      ShowHint = True
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 0
      ClientEvents.UniEvents.Strings = (
        
          'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  sender.cls=' +
          #39'red_borders'#39';'#13#10'}')
      BorderStyle = ubsNone
      Caption = ''
      Color = 8757270
      LayoutAttribs.Align = 'middle'
      object lbCnt_Envanter: TUniLabel
        Left = 9
        Top = 9
        Width = 104
        Height = 38
        Hint = ''
        ShowHint = True
        Caption = '9.876'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -32
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        ClientEvents.UniEvents.Strings = (
          
            'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  sender.base' +
            'Cls='#39'title'#39';'#13#10'}')
        TabOrder = 1
        LayoutConfig.Width = '100%'
      end
      object UniImage1: TUniImage
        Left = 150
        Top = 10
        Width = 55
        Height = 55
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Stretch = True
        Url = 'files/images/dsh_envanter.png'
        Transparent = True
        LayoutConfig.Height = '100%'
        LayoutConfig.Width = '100%'
      end
      object UniPanel4: TUniPanel
        Left = 0
        Top = 75
        Width = 210
        Height = 25
        Cursor = crHandPoint
        Hint = ''
        ShowHint = True
        Align = alBottom
        ParentFont = False
        Font.Color = clWhite
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
        BorderStyle = ubsNone
        Caption = 'Daha Fazla'
        Color = 6321168
        OnClick = UniPanel4Click
        object UniImage6: TUniImage
          Left = 180
          Top = 3
          Width = 19
          Height = 19
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Stretch = True
          Url = 'files/images/dsh_rightarrow.png'
          Transparent = True
          LayoutConfig.Height = '100%'
          LayoutConfig.Width = '100%'
          OnClick = UniPanel4Click
        end
      end
      object UniLabel2: TUniLabel
        Left = 9
        Top = 50
        Width = 110
        Height = 16
        Hint = ''
        ShowHint = True
        Caption = 'Envanter Kayd'#305
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        ClientEvents.UniEvents.Strings = (
          
            'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  sender.base' +
            'Cls='#39'subtitle'#39';'#13#10'}')
        TabOrder = 2
        LayoutConfig.Width = '100%'
      end
    end
    object UniPanel3: TUniPanel
      Left = 270
      Top = 50
      Width = 210
      Height = 100
      Hint = ''
      ShowHint = True
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
      ClientEvents.UniEvents.Strings = (
        
          'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  sender.cls=' +
          #39'red_borders'#39';'#13#10'}')
      BorderStyle = ubsNone
      Caption = ''
      Color = 1154291
      LayoutAttribs.Align = 'middle'
      object lbCnt_Kontrol: TUniLabel
        Left = 9
        Top = 9
        Width = 104
        Height = 38
        Hint = ''
        ShowHint = True
        Caption = '9.876'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -32
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        ClientEvents.UniEvents.Strings = (
          
            'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  sender.base' +
            'Cls='#39'title'#39';'#13#10'}')
        TabOrder = 1
        LayoutConfig.Width = '100%'
      end
      object UniImage2: TUniImage
        Left = 150
        Top = 10
        Width = 55
        Height = 55
        Hint = ''
        ShowHint = True
        Stretch = True
        Url = 'files/images/dsh_checklist.png'
        LayoutConfig.Height = '100%'
        LayoutConfig.Width = '100%'
      end
      object UniPanel5: TUniPanel
        Left = 0
        Top = 75
        Width = 210
        Height = 25
        Cursor = crHandPoint
        Hint = ''
        ShowHint = True
        Align = alBottom
        ParentFont = False
        Font.Color = clWhite
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
        BorderStyle = ubsNone
        Caption = 'Daha Fazla'
        Color = 686266
        OnClick = UniPanel5Click
        object UniImage7: TUniImage
          Left = 180
          Top = 3
          Width = 19
          Height = 19
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Stretch = True
          Url = 'files/images/dsh_rightarrow.png'
          LayoutConfig.Height = '100%'
          LayoutConfig.Width = '100%'
          OnClick = UniPanel5Click
        end
      end
      object UniLabel4: TUniLabel
        Left = 9
        Top = 50
        Width = 96
        Height = 16
        Hint = ''
        ShowHint = True
        Caption = 'Kontrol Kayd'#305
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        ClientEvents.UniEvents.Strings = (
          
            'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  sender.base' +
            'Cls='#39'subtitle'#39';'#13#10'}')
        TabOrder = 2
        LayoutConfig.Width = '100%'
      end
    end
    object UniPanel7: TUniPanel
      Left = 521
      Top = 50
      Width = 210
      Height = 100
      Hint = ''
      ShowHint = True
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
      ClientEvents.UniEvents.Strings = (
        
          'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  sender.cls=' +
          #39'red_borders'#39';'#13#10'}')
      BorderStyle = ubsNone
      Caption = ''
      Color = 13273921
      LayoutAttribs.Align = 'middle'
      object lbCnt_AcikRiza: TUniLabel
        Left = 9
        Top = 9
        Width = 104
        Height = 38
        Hint = ''
        ShowHint = True
        Caption = '9.876'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -32
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        ClientEvents.UniEvents.Strings = (
          
            'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  sender.base' +
            'Cls='#39'title'#39';'#13#10'}')
        TabOrder = 1
        LayoutConfig.Width = '100%'
      end
      object UniImage3: TUniImage
        Left = 150
        Top = 10
        Width = 55
        Height = 55
        Hint = ''
        ShowHint = True
        Stretch = True
        Url = 'files/images/dsh_acikriza.png'
        LayoutConfig.Height = '100%'
        LayoutConfig.Width = '100%'
      end
      object UniPanel8: TUniPanel
        Left = 0
        Top = 75
        Width = 210
        Height = 25
        Cursor = crHandPoint
        Hint = ''
        ShowHint = True
        Align = alBottom
        ParentFont = False
        Font.Color = clWhite
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
        BorderStyle = ubsNone
        Caption = 'Daha Fazla'
        Color = 8936486
        OnClick = UniPanel8Click
        object UniImage8: TUniImage
          Left = 180
          Top = 3
          Width = 19
          Height = 19
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Stretch = True
          Url = 'files/images/dsh_rightarrow.png'
          LayoutConfig.Height = '100%'
          LayoutConfig.Width = '100%'
          OnClick = UniPanel8Click
        end
      end
      object UniLabel6: TUniLabel
        Left = 9
        Top = 50
        Width = 64
        Height = 16
        Hint = ''
        ShowHint = True
        Caption = 'A'#231#305'k R'#305'za'
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        ClientEvents.UniEvents.Strings = (
          
            'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  sender.base' +
            'Cls='#39'subtitle'#39';'#13#10'}')
        TabOrder = 2
        LayoutConfig.Width = '100%'
      end
    end
    object UniPanel11: TUniPanel
      Left = 772
      Top = 50
      Width = 210
      Height = 100
      Hint = ''
      ShowHint = True
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 6
      ClientEvents.UniEvents.Strings = (
        
          'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  sender.cls=' +
          #39'red_borders'#39';'#13#10'}')
      BorderStyle = ubsNone
      Caption = ''
      Color = 6442559
      LayoutAttribs.Align = 'middle'
      object lbCnt_Aydinlatma: TUniLabel
        Left = 9
        Top = 9
        Width = 104
        Height = 38
        Hint = ''
        ShowHint = True
        Caption = '9.876'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -32
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        ClientEvents.UniEvents.Strings = (
          
            'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  sender.base' +
            'Cls='#39'title'#39';'#13#10'}')
        TabOrder = 1
        LayoutConfig.Width = '100%'
      end
      object UniImage4: TUniImage
        Left = 150
        Top = 10
        Width = 55
        Height = 55
        Hint = ''
        ShowHint = True
        Stretch = True
        Url = 'files/images/dsh_aydinlatma.png'
        LayoutConfig.Height = '100%'
        LayoutConfig.Width = '100%'
      end
      object UniPanel9: TUniPanel
        Left = 0
        Top = 75
        Width = 210
        Height = 25
        Cursor = crHandPoint
        Hint = ''
        ShowHint = True
        Align = alBottom
        ParentFont = False
        Font.Color = clWhite
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
        BorderStyle = ubsNone
        Caption = 'Daha Fazla'
        Color = 4338731
        OnClick = UniPanel9Click
        object UniImage9: TUniImage
          Left = 180
          Top = 3
          Width = 19
          Height = 19
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Stretch = True
          Url = 'files/images/dsh_rightarrow.png'
          LayoutConfig.Height = '100%'
          LayoutConfig.Width = '100%'
          OnClick = UniPanel9Click
        end
      end
      object UniLabel8: TUniLabel
        Left = 9
        Top = 50
        Width = 127
        Height = 16
        Hint = ''
        ShowHint = True
        Caption = 'Ayd'#305'nlatma Metni'
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        ClientEvents.UniEvents.Strings = (
          
            'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  sender.base' +
            'Cls='#39'subtitle'#39';'#13#10'}')
        TabOrder = 2
        LayoutConfig.Width = '100%'
      end
    end
    object UniPanel14: TUniPanel
      Left = 1023
      Top = 50
      Width = 210
      Height = 100
      Hint = ''
      ShowHint = True
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 8
      ClientEvents.UniEvents.Strings = (
        
          'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  sender.cls=' +
          #39'red_borders'#39';'#13#10'}')
      BorderStyle = ubsNone
      Caption = ''
      Color = 159
      LayoutAttribs.Align = 'middle'
      object lbCnt_Basvuru: TUniLabel
        Left = 9
        Top = 9
        Width = 104
        Height = 38
        Hint = ''
        ShowHint = True
        Caption = '9.876'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -32
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        ClientEvents.UniEvents.Strings = (
          
            'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  sender.base' +
            'Cls='#39'title'#39';'#13#10'}')
        TabOrder = 1
        LayoutConfig.Width = '100%'
      end
      object UniImage5: TUniImage
        Left = 150
        Top = 10
        Width = 55
        Height = 55
        Hint = ''
        ShowHint = True
        Stretch = True
        Url = 'files/images/dsh_basvuru.png'
        LayoutConfig.Height = '100%'
        LayoutConfig.Width = '100%'
      end
      object UniPanel12: TUniPanel
        Left = 0
        Top = 75
        Width = 210
        Height = 25
        Cursor = crHandPoint
        Hint = ''
        ShowHint = True
        Align = alBottom
        ParentFont = False
        Font.Color = clWhite
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
        BorderStyle = ubsNone
        Caption = 'Daha Fazla'
        Color = 106
        OnClick = UniPanel12Click
        object UniImage10: TUniImage
          Left = 180
          Top = 3
          Width = 19
          Height = 19
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Stretch = True
          Url = 'files/images/dsh_rightarrow.png'
          LayoutConfig.Height = '100%'
          LayoutConfig.Width = '100%'
          OnClick = UniPanel12Click
        end
      end
      object UniLabel10: TUniLabel
        Left = 9
        Top = 50
        Width = 141
        Height = 16
        Hint = ''
        ShowHint = True
        Caption = #304'lgili Ki'#351'i Ba'#351'vurusu'
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        ClientEvents.UniEvents.Strings = (
          
            'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  sender.base' +
            'Cls='#39'subtitle'#39';'#13#10'}')
        TabOrder = 2
        LayoutConfig.Width = '100%'
      end
    end
    object pnlEnvDetay: TUniPanel
      Left = 320
      Top = 166
      Width = 400
      Height = 347
      Hint = ''
      ShowHint = True
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 10
      Caption = ''
      object grdEnvDetay: TUniDBGrid
        Left = 1
        Top = 46
        Width = 398
        Height = 165
        Hint = ''
        ShowHint = True
        DataSource = dsEnvDetay
        Options = [dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
        WebOptions.Paged = False
        WebOptions.CustomizableCells = False
        LoadMask.Message = 'Rapor Haz'#305'rlan'#305'yor...'
        BorderStyle = ubsNone
        Align = alTop
        Font.OverrideDefaults = [ovFontHeight]
        ParentFont = False
        TabOrder = 1
        Columns = <
          item
            FieldName = 'alanadi'
            Title.Alignment = taCenter
            Title.Caption = 'Veri Kayna'#287#305
            Width = 335
            Font.OverrideDefaults = [ovFontHeight]
            DisplayMemo = True
          end
          item
            FieldName = 'adet'
            Title.Caption = 'adet'
            Width = 40
            Font.OverrideDefaults = [ovFontHeight]
            ReadOnly = True
          end>
      end
      object chtEnvDetay: TUniChart
        Left = 1
        Top = 211
        Width = 398
        Height = 135
        Hint = ''
        ShowHint = True
        Animate = True
        Legend.Font.Color = clBlack
        Legend.Font.Name = 'Arial'
        Legend.Visible = False
        ClientEvents.UniEvents.Strings = (
          
            'chart.beforeInit=function chart.beforeInit(sender, config)'#13#10'{'#13#10' ' +
            ' config.colors = ["#585858", "green", "yellow", "red", "#94ae0a"' +
            ', "#115fa6", "#a61120", "#ff8809", "#ffd13e", "#a61187", "#24ad9' +
            'a", "#7c7474"];'#13#10'  //config.colors = ["green", "yellow", "red", ' +
            '"#94ae0a", "#115fa6", "#a61120", "#ff8809", "#ffd13e", "#a61187"' +
            ', "#24ad9a", "#7c7474", "#a66111"];'#13#10'  //sender.themeAttrs.serie' +
            'sThemes = [{fill: '#39'#585858'#39'}, {fill: '#39'green'#39'}, {fill: '#39'yellow'#39'}]' +
            ';'#13#10'  //sender.themeAttrs.colors = ['#39'#585858'#39', '#39'green'#39', '#39'yellow'#39']' +
            #13#10'}                                            '
          
            'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  config.bord' +
            'er=false;'#13#10'}')
        LayoutConfig.BodyPadding = '10'
        Align = alClient
        Shadow = False
        TitleVisible = False
        TitleAlign = taCenter
        object serEnvDetay: TUniBarSeries
          Colors.Strings = (
            '#0000FF'
            '#00FF00'
            '#FF0000'
            '#00FFFF'
            '#FFFF00'
            '#FF00FF')
          Title = 'UniBarSeries1'
          SeriesLabel.Font.Color = clWhite
          DataSource = dsEnvDetay
          YValues.ValueSource = 'adet'
        end
      end
      object hdrEnvDetay: TUniPanel
        Left = 1
        Top = 1
        Width = 398
        Height = 45
        Hint = ''
        ShowHint = True
        Align = alTop
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
        Caption = 'Envanter Kay'#305'tlar'#305'nda Kullan'#305'lan Veri Kaynaklar'#305
        Color = 13401877
      end
    end
    object UniPanel17: TUniPanel
      Left = 0
      Top = 0
      Width = 1290
      Height = 30
      Hint = ''
      ShowHint = True
      Align = alTop
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 11
      Caption = ''
      Color = clGray
      object UniLabel1: TUniLabel
        Left = 9
        Top = 6
        Width = 171
        Height = 16
        Hint = ''
        ShowHint = True
        Caption = 'KVKNET -> DASHBOARD'
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
      end
      object imgRefresh0: TUniImage
        Left = 239
        Top = 4
        Width = 22
        Height = 22
        Cursor = crHandPoint
        Hint = ''
        ShowHint = True
        Stretch = True
        Url = 'files/images/refresh_gray.png'
        LayoutConfig.Height = '100%'
        LayoutConfig.Width = '100%'
        OnClick = imgRefresh0Click
      end
    end
    object UniPanel15: TUniPanel
      Left = 20
      Top = 166
      Width = 280
      Height = 347
      Hint = ''
      ShowHint = True
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 12
      Caption = ''
      object UniPanel18: TUniPanel
        Left = 1
        Top = 1
        Width = 278
        Height = 45
        Hint = ''
        ShowHint = True
        Align = alClient
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
        Caption = 'Envanter '#304'statistikleri'
        Color = 13401877
        object imgRefresh1: TUniImage
          Left = 249
          Top = 12
          Width = 21
          Height = 21
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Stretch = True
          Url = 'files/images/refresh_gray.png'
          LayoutConfig.Height = '100%'
          LayoutConfig.Width = '100%'
          OnClick = imgRefresh0Click
        end
      end
      object UniPanel19: TUniPanel
        Left = 1
        Top = 76
        Width = 278
        Height = 30
        Hint = ''
        ShowHint = True
        Align = alBottom
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Name = 'Verdana'
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
        BorderStyle = ubsNone
        Caption = ''
        Color = 15461355
        object UniLabel5: TUniLabel
          Tag = 2
          Left = 8
          Top = 8
          Width = 92
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Caption = 'Veri Kategorileri'
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 1
          OnClick = EnvDetayRefresh
        end
        object lbist_Kategori: TUniLabel
          Tag = 2
          Left = 220
          Top = 8
          Width = 50
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0,000'
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 2
          OnClick = EnvDetayRefresh
        end
      end
      object UniPanel20: TUniPanel
        Left = 1
        Top = 46
        Width = 278
        Height = 30
        Hint = ''
        ShowHint = True
        Align = alBottom
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Name = 'Verdana'
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
        BorderStyle = ubsNone
        Caption = ''
        Color = clWhite
        object UniLabel3: TUniLabel
          Tag = 1
          Left = 8
          Top = 6
          Width = 87
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Caption = 'Veri Kaynaklar'#305
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 1
          OnClick = EnvDetayRefresh
        end
        object lbist_Kaynak: TUniLabel
          Tag = 1
          Left = 220
          Top = 8
          Width = 50
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0,000'
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 2
          OnClick = EnvDetayRefresh
        end
      end
      object UniPanel21: TUniPanel
        Left = 1
        Top = 106
        Width = 278
        Height = 30
        Hint = ''
        ShowHint = True
        Align = alBottom
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Name = 'Verdana'
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
        BorderStyle = ubsNone
        Caption = ''
        Color = clWhite
        object UniLabel7: TUniLabel
          Tag = 3
          Left = 8
          Top = 8
          Width = 61
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Caption = 'Veri Tipleri'
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 1
          OnClick = EnvDetayRefresh
        end
        object lbist_VTipi: TUniLabel
          Tag = 3
          Left = 220
          Top = 8
          Width = 50
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0,000'
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 2
          OnClick = EnvDetayRefresh
        end
      end
      object UniPanel22: TUniPanel
        Left = 1
        Top = 166
        Width = 278
        Height = 30
        Hint = ''
        ShowHint = True
        Align = alBottom
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Name = 'Verdana'
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 5
        BorderStyle = ubsNone
        Caption = ''
        Color = clWhite
        object UniLabel9: TUniLabel
          Tag = 5
          Left = 8
          Top = 8
          Width = 128
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Caption = 'Veri Toplama Ama'#231'lar'#305
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 1
          OnClick = EnvDetayRefresh
        end
        object lbist_TopAmac: TUniLabel
          Tag = 5
          Left = 220
          Top = 8
          Width = 50
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0,000'
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 2
          OnClick = EnvDetayRefresh
        end
      end
      object UniPanel23: TUniPanel
        Left = 1
        Top = 256
        Width = 278
        Height = 30
        Hint = ''
        ShowHint = True
        Align = alBottom
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Name = 'Verdana'
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 6
        BorderStyle = ubsNone
        Caption = ''
        Color = 15461355
        object UniLabel11: TUniLabel
          Tag = 8
          Left = 8
          Top = 8
          Width = 154
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Caption = 'Veri Aktar'#305'lan Al'#305'c'#305' Gruplar'#305
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 1
          OnClick = EnvDetayRefresh
        end
        object lbist_Grup: TUniLabel
          Tag = 8
          Left = 220
          Top = 8
          Width = 50
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0,000'
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 2
          OnClick = EnvDetayRefresh
        end
      end
      object UniPanel24: TUniPanel
        Left = 1
        Top = 136
        Width = 278
        Height = 30
        Hint = ''
        ShowHint = True
        Align = alBottom
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Name = 'Verdana'
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 7
        BorderStyle = ubsNone
        Caption = ''
        Color = 15461355
        object UniLabel12: TUniLabel
          Tag = 4
          Left = 8
          Top = 8
          Width = 142
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Caption = 'Veri Konusu Ki'#351'i Gruplar'#305
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 1
          OnClick = EnvDetayRefresh
        end
        object lbist_Kisi: TUniLabel
          Tag = 4
          Left = 220
          Top = 8
          Width = 50
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0,000'
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 2
          OnClick = EnvDetayRefresh
        end
      end
      object UniPanel25: TUniPanel
        Left = 1
        Top = 286
        Width = 278
        Height = 30
        Hint = ''
        ShowHint = True
        Align = alBottom
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Name = 'Verdana'
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 8
        BorderStyle = ubsNone
        Caption = ''
        Color = clWhite
        object UniLabel13: TUniLabel
          Tag = 9
          Left = 8
          Top = 8
          Width = 178
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Caption = 'Ybn. '#220'lkelere Aktar'#305'lan Kaynak'
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 1
          OnClick = EnvDetayRefresh
        end
        object lbist_Yabanci: TUniLabel
          Tag = 9
          Left = 220
          Top = 8
          Width = 50
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0,000'
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 2
          OnClick = EnvDetayRefresh
        end
      end
      object UniPanel26: TUniPanel
        Left = 1
        Top = 316
        Width = 278
        Height = 30
        Hint = ''
        ShowHint = True
        Align = alBottom
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Name = 'Verdana'
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 9
        BorderStyle = ubsNone
        Caption = ''
        Color = 15461355
        object UniLabel14: TUniLabel
          Tag = 10
          Left = 8
          Top = 8
          Width = 136
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Caption = 'Veri G'#252'venli'#287'i Tedbirleri'
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 1
          OnClick = EnvDetayRefresh
        end
        object lbist_Tedbir: TUniLabel
          Tag = 10
          Left = 220
          Top = 8
          Width = 50
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0,000'
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 2
          OnClick = EnvDetayRefresh
        end
      end
      object UniPanel27: TUniPanel
        Left = 1
        Top = 196
        Width = 278
        Height = 30
        Hint = ''
        ShowHint = True
        Align = alBottom
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Name = 'Verdana'
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 10
        BorderStyle = ubsNone
        Caption = ''
        Color = 15461355
        object UniLabel15: TUniLabel
          Tag = 6
          Left = 8
          Top = 8
          Width = 130
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Caption = 'Veri Saklama Ama'#231'lar'#305
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 1
          OnClick = EnvDetayRefresh
        end
        object lbist_SakAmac: TUniLabel
          Tag = 6
          Left = 220
          Top = 8
          Width = 50
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0,000'
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 2
          OnClick = EnvDetayRefresh
        end
      end
      object UniPanel28: TUniPanel
        Left = 1
        Top = 226
        Width = 278
        Height = 30
        Hint = ''
        ShowHint = True
        Align = alBottom
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Name = 'Verdana'
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 11
        BorderStyle = ubsNone
        Caption = ''
        Color = clWhite
        object UniLabel17: TUniLabel
          Tag = 7
          Left = 8
          Top = 8
          Width = 135
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Caption = 'Veri Payla'#351'ma Ama'#231'lar'#305
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 1
          OnClick = EnvDetayRefresh
        end
        object lbist_PayAmac: TUniLabel
          Tag = 7
          Left = 220
          Top = 8
          Width = 50
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0,000'
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 2
          OnClick = EnvDetayRefresh
        end
      end
    end
    object pnlKontrol: TUniPanel
      Left = 20
      Top = 521
      Width = 699
      Height = 320
      Hint = ''
      ShowHint = True
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 13
      Caption = ''
      object grdKontrol: TUniDBGrid
        Left = 1
        Top = 46
        Width = 697
        Height = 140
        Hint = ''
        ShowHint = True
        DataSource = dsKontrol
        Options = [dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
        WebOptions.Paged = False
        WebOptions.CustomizableCells = False
        LoadMask.Message = 'Rapor Haz'#305'rlan'#305'yor...'
        BorderStyle = ubsNone
        Align = alTop
        Font.OverrideDefaults = [ovFontHeight]
        ParentFont = False
        TabOrder = 1
        Exporter.Enabled = True
        Exporter.FileName = 'deneme'
        Exporter.Title = 'deneme'
        OnDrawColumnCell = grdKontrolDrawColumnCell
        Columns = <
          item
            FieldName = 'kisi_str'
            Title.Alignment = taCenter
            Title.Caption = #304'lgili Ki'#351'i Grubu'
            Width = 250
            Font.OverrideDefaults = [ovFontHeight]
            ReadOnly = True
            DisplayMemo = True
          end
          item
            FieldName = 'kaynak_str'
            Title.Alignment = taCenter
            Title.Caption = 'Veri Kayna'#287#305
            Width = 290
            Font.OverrideDefaults = [ovFontHeight]
            ReadOnly = True
            DisplayMemo = True
          end
          item
            FieldName = 'env_var'
            Title.Alignment = taCenter
            Title.Caption = 'Envanter'
            Width = 65
            Font.OverrideDefaults = [ovFontHeight]
            Alignment = taLeftJustify
            CheckBoxField.BooleanFieldOnly = False
            CheckBoxField.FieldValues = 'E;H'
            CheckBoxField.DisplayValues = 'VAR;YOK'
          end
          item
            FieldName = 'chl_var'
            Title.Alignment = taCenter
            Title.Caption = 'Kontrol'
            Width = 65
            Font.OverrideDefaults = [ovFontHeight]
            Alignment = taLeftJustify
            CheckBoxField.BooleanFieldOnly = False
            CheckBoxField.FieldValues = 'E;H'
            CheckBoxField.DisplayValues = 'VAR;YOK'
          end
          item
            FieldName = 'mesaj_str'
            Title.Alignment = taCenter
            Title.Caption = 'Durum'
            Width = 64
            Visible = False
          end>
      end
      object UniPanel30: TUniPanel
        Left = 1
        Top = 1
        Width = 697
        Height = 25
        Hint = ''
        ShowHint = True
        Align = alTop
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
        Caption = 'Envanter - Kontrol Formlar'#305' Kar'#351#305'la'#351't'#305'rmas'#305
        Color = 13401877
        object imgRefresh5: TUniImage
          Left = 669
          Top = 3
          Width = 19
          Height = 19
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Stretch = True
          Url = 'files/images/refresh_gray.png'
          LayoutConfig.Height = '100%'
          LayoutConfig.Width = '100%'
          OnClick = imgRefresh0Click
        end
        object imgGridToXls: TUniImage
          Left = 644
          Top = 3
          Width = 19
          Height = 19
          Cursor = crHandPoint
          Hint = 'Excel'#39'e G'#246'nder -> Envanter - Kontrol Formlar'#305' Kar'#351#305'la'#351't'#305'rmas'#305
          ShowHint = True
          Center = True
          Stretch = True
          LayoutConfig.Height = '100%'
          LayoutConfig.Width = '100%'
          Images = MainMod.PrjImgList
          ImageIndex = 4
          OnClick = imgGridToXlsClick
        end
      end
      object UniPanel29: TUniPanel
        Left = 1
        Top = 26
        Width = 697
        Height = 20
        Hint = ''
        ShowHint = True
        Align = alTop
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
        BorderStyle = ubsNone
        Caption = ''
        Color = 6776679
        object UniPanel31: TUniPanel
          Left = 540
          Top = 0
          Width = 65
          Height = 20
          Hint = ''
          ShowHint = True
          Align = alLeft
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clWhite
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
          BorderStyle = ubsOutset
          Caption = 'Envanter'
          Color = 6776679
        end
        object UniPanel32: TUniPanel
          Left = 0
          Top = 0
          Width = 250
          Height = 20
          Hint = ''
          ShowHint = True
          Align = alLeft
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clWhite
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 2
          BorderStyle = ubsOutset
          Caption = 'Ki'#351'i Grubu'
          Color = 6776679
        end
        object UniPanel33: TUniPanel
          Left = 250
          Top = 0
          Width = 290
          Height = 20
          Hint = ''
          ShowHint = True
          Align = alLeft
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clWhite
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 3
          BorderStyle = ubsOutset
          Caption = 'Veri Kayna'#287#305
          Color = 6776679
        end
        object UniPanel34: TUniPanel
          Left = 605
          Top = 0
          Width = 65
          Height = 20
          Hint = ''
          ShowHint = True
          Align = alLeft
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clWhite
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 4
          BorderStyle = ubsOutset
          Caption = 'Kontrol'
          Color = 6776679
        end
      end
      object UniPanel35: TUniPanel
        Left = 1
        Top = 186
        Width = 697
        Height = 133
        Hint = ''
        ShowHint = True
        Align = alClient
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
        BorderStyle = ubsNone
        Caption = ''
        Color = clWhite
        object chtKontrol: TUniChart
          Left = 0
          Top = 0
          Width = 502
          Height = 133
          Hint = ''
          ShowHint = True
          Animate = True
          Legend.Font.Color = clBlack
          Legend.Font.Name = 'Arial'
          Legend.Visible = False
          ClientEvents.UniEvents.Strings = (
            
              'chart.beforeInit=function chart.beforeInit(sender, config)'#13#10'{'#13#10' ' +
              ' config.colors = ["#585858", "green", "yellow", "red", "#94ae0a"' +
              ', "#115fa6", "#a61120", "#ff8809", "#ffd13e", "#a61187", "#24ad9' +
              'a", "#7c7474"];'#13#10'  //config.colors = ["green", "yellow", "red", ' +
              '"#94ae0a", "#115fa6", "#a61120", "#ff8809", "#ffd13e", "#a61187"' +
              ', "#24ad9a", "#7c7474", "#a66111"];'#13#10'  //sender.themeAttrs.serie' +
              'sThemes = [{fill: '#39'#585858'#39'}, {fill: '#39'green'#39'}, {fill: '#39'yellow'#39'}]' +
              ';'#13#10'  //sender.themeAttrs.colors = ['#39'#585858'#39', '#39'green'#39', '#39'yellow'#39']' +
              #13#10'}                                            '
            
              'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  config.bord' +
              'er=false;'#13#10'}')
          LayoutConfig.BodyPadding = '10'
          Align = alLeft
          Shadow = False
          TitleVisible = False
          TitleAlign = taCenter
          object serKontrol: TUniPieSeries
            Donut = 25
            Colors.Strings = (
              '#FFCECE'
              '#FFFFB9'
              '#AAD5D5'
              '#0000FF'
              '#00FF00'
              '#FF0000'
              '#00FFFF'
              '#FFFF00'
              '#FF00FF')
            DefaultColors = False
            SeriesLabel.Font.OverrideDefaults = [ovFontHeight]
          end
        end
        object UniPanel36: TUniPanel
          Left = 512
          Top = 13
          Width = 30
          Height = 20
          Hint = ''
          ShowHint = True
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clBlack
          Font.Name = 'Verdana'
          TabOrder = 2
          Caption = ''
          Color = 14737600
        end
        object UniPanel37: TUniPanel
          Left = 512
          Top = 53
          Width = 30
          Height = 20
          Hint = ''
          ShowHint = True
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clBlack
          Font.Name = 'Verdana'
          TabOrder = 3
          Caption = ''
          Color = 14803455
        end
        object UniPanel38: TUniPanel
          Left = 512
          Top = 93
          Width = 30
          Height = 20
          Hint = ''
          ShowHint = True
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clBlack
          Font.Name = 'Verdana'
          TabOrder = 4
          Caption = ''
          Color = clInfoBk
        end
        object UniPanel39: TUniPanel
          Left = 546
          Top = 10
          Width = 150
          Height = 26
          Hint = ''
          ShowHint = True
          ParentFont = False
          TabOrder = 5
          BorderStyle = ubsNone
          Caption = ''
          Color = clWhite
          object UniLabel16: TUniLabel
            Left = 0
            Top = 0
            Width = 150
            Height = 26
            Hint = ''
            ShowHint = True
            AutoSize = False
            Caption = 'Envanter ve Kontrol Formlar'#305' Mevcut'
            Align = alClient
            ParentFont = False
            Font.Charset = TURKISH_CHARSET
            Font.Name = 'Verdana'
            Font.OverrideDefaults = [ovFontHeight]
            ClientEvents.UniEvents.Strings = (
              
                'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  sender.base' +
                'Cls='#39'subtitle'#39';'#13#10'}')
            TabOrder = 1
            LayoutConfig.Width = '100%'
          end
        end
        object UniPanel40: TUniPanel
          Left = 546
          Top = 50
          Width = 150
          Height = 26
          Hint = ''
          ShowHint = True
          ParentFont = False
          TabOrder = 6
          BorderStyle = ubsNone
          Caption = ''
          Color = clWhite
          object UniLabel18: TUniLabel
            Left = 0
            Top = 0
            Width = 150
            Height = 26
            Hint = ''
            ShowHint = True
            AutoSize = False
            Caption = 'Envanter Formu Var'#13'Kontrol Formu Yok'
            ParentFont = False
            Font.Charset = TURKISH_CHARSET
            Font.Color = clBlack
            Font.Name = 'Verdana'
            Font.OverrideDefaults = [ovFontHeight]
            ClientEvents.UniEvents.Strings = (
              
                'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  sender.base' +
                'Cls='#39'subtitle'#39';'#13#10'}')
            TabOrder = 1
            LayoutConfig.Width = '100%'
          end
        end
        object UniPanel41: TUniPanel
          Left = 546
          Top = 90
          Width = 150
          Height = 26
          Hint = ''
          ShowHint = True
          ParentFont = False
          TabOrder = 7
          BorderStyle = ubsNone
          Caption = ''
          Color = clWhite
          object UniLabel19: TUniLabel
            Left = 0
            Top = 0
            Width = 150
            Height = 26
            Hint = ''
            ShowHint = True
            AutoSize = False
            Caption = 'Envanter Formu Yok'#13'Kontrol Formu Var'
            ParentFont = False
            Font.Charset = TURKISH_CHARSET
            Font.Color = clBlack
            Font.Name = 'Verdana'
            Font.OverrideDefaults = [ovFontHeight]
            ClientEvents.UniEvents.Strings = (
              
                'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  sender.base' +
                'Cls='#39'subtitle'#39';'#13#10'}')
            TabOrder = 1
            LayoutConfig.Width = '100%'
          end
        end
      end
    end
    object UniPanel42: TUniPanel
      Left = 740
      Top = 166
      Width = 250
      Height = 347
      Hint = ''
      ShowHint = True
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 14
      Caption = ''
      object UniPanel43: TUniPanel
        Left = 1
        Top = 1
        Width = 248
        Height = 45
        Hint = ''
        ShowHint = True
        Align = alTop
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
        Caption = #304'lgili Ki'#351'i Ba'#351'vurular'#305
        Color = 6776679
        object imgRefresh2: TUniImage
          Left = 218
          Top = 12
          Width = 21
          Height = 21
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Stretch = True
          Url = 'files/images/refresh_gray.png'
          LayoutConfig.Height = '100%'
          LayoutConfig.Width = '100%'
          OnClick = imgRefresh0Click
        end
      end
      object UniPanel45: TUniPanel
        Left = 1
        Top = 46
        Width = 248
        Height = 36
        Hint = ''
        ShowHint = True
        Align = alTop
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Name = 'Verdana'
        TabOrder = 2
        BorderStyle = ubsNone
        Caption = ''
        Color = clWhite
        object UniPanel46: TUniPanel
          AlignWithMargins = True
          Left = 181
          Top = 5
          Width = 62
          Height = 26
          Hint = ''
          Margins.Left = 0
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ShowHint = True
          Align = alRight
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
          BorderStyle = ubsOutset
          Caption = ''
          Color = 8757270
          object lbBsvCevapli: TUniLabel
            Tag = 1
            Left = 6
            Top = 5
            Width = 50
            Height = 13
            Cursor = crHandPoint
            Hint = ''
            ShowHint = True
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0,000'
            ParentFont = False
            Font.Charset = TURKISH_CHARSET
            Font.Color = clWhite
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            Font.OverrideDefaults = [ovFontHeight]
            ParentColor = False
            Color = clWhite
            TabOrder = 1
          end
        end
        object UniPanel47: TUniPanel
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 176
          Height = 26
          Hint = ''
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 0
          Margins.Bottom = 5
          ShowHint = True
          Align = alClient
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clWhite
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 2
          BorderStyle = ubsOutset
          Caption = ''
          Color = clWhite
          object UniLabel22: TUniLabel
            Tag = 1
            Left = 8
            Top = 5
            Width = 140
            Height = 13
            Cursor = crHandPoint
            Hint = ''
            ShowHint = True
            Caption = 'Cevaplanm'#305#351' Ba'#351'vuru'
            ParentFont = False
            Font.Charset = TURKISH_CHARSET
            Font.Color = 6442559
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            Font.OverrideDefaults = [ovFontHeight]
            ParentColor = False
            Color = clWhite
            TabOrder = 1
          end
        end
      end
      object chtBasvuru: TUniChart
        Left = 1
        Top = 118
        Width = 248
        Height = 228
        Hint = ''
        ShowHint = True
        Animate = True
        Legend.Font.Color = clBlack
        Legend.Font.Name = 'Arial'
        Legend.Visible = False
        ClientEvents.UniEvents.Strings = (
          
            'chart.beforeInit=function chart.beforeInit(sender, config)'#13#10'{'#13#10' ' +
            ' config.colors = ["#585858", "green", "yellow", "red", "#94ae0a"' +
            ', "#115fa6", "#a61120", "#ff8809", "#ffd13e", "#a61187", "#24ad9' +
            'a", "#7c7474"];'#13#10'  //config.colors = ["green", "yellow", "red", ' +
            '"#94ae0a", "#115fa6", "#a61120", "#ff8809", "#ffd13e", "#a61187"' +
            ', "#24ad9a", "#7c7474", "#a66111"];'#13#10'  //sender.themeAttrs.serie' +
            'sThemes = [{fill: '#39'#585858'#39'}, {fill: '#39'green'#39'}, {fill: '#39'yellow'#39'}]' +
            ';'#13#10'  //sender.themeAttrs.colors = ['#39'#585858'#39', '#39'green'#39', '#39'yellow'#39']' +
            #13#10'}                                            '
          
            'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  config.bord' +
            'er=false;'#13#10'}')
        LayoutConfig.BodyPadding = '10'
        Align = alClient
        Shadow = False
        TitleVisible = False
        TitleAlign = taCenter
        object serBasvuru: TUniPieSeries
          Donut = 70
          Colors.Strings = (
            '#16A085'
            '#9F0000'
            '#0000FF'
            '#00FF00'
            '#FF0000'
            '#00FFFF'
            '#FFFF00'
            '#FF00FF')
          DefaultColors = False
          SeriesLabel.Font.Color = clWhite
          SeriesLabel.Font.Style = [fsBold]
        end
        object serBsvGray: TUniPieSeries
          Donut = 95
          Colors.Strings = (
            '#676767'
            '#676767'
            '#0000FF'
            '#00FF00'
            '#FF0000'
            '#00FFFF'
            '#FFFF00'
            '#FF00FF')
          DefaultColors = False
          SeriesLabel.Enabled = False
        end
      end
      object UniPanel44: TUniPanel
        Left = 1
        Top = 82
        Width = 248
        Height = 36
        Hint = ''
        ShowHint = True
        Align = alTop
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Name = 'Verdana'
        TabOrder = 4
        BorderStyle = ubsNone
        Caption = ''
        Color = clWhite
        object UniPanel48: TUniPanel
          AlignWithMargins = True
          Left = 181
          Top = 5
          Width = 62
          Height = 26
          Hint = ''
          Margins.Left = 0
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ShowHint = True
          Align = alRight
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clWhite
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
          BorderStyle = ubsOutset
          Caption = ''
          Color = 159
          object lbBsvCevapsiz: TUniLabel
            Tag = 1
            Left = 6
            Top = 5
            Width = 50
            Height = 13
            Cursor = crHandPoint
            Hint = ''
            ShowHint = True
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0,000'
            ParentFont = False
            Font.Charset = TURKISH_CHARSET
            Font.Color = clWhite
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            Font.OverrideDefaults = [ovFontHeight]
            ParentColor = False
            Color = clWhite
            TabOrder = 1
          end
        end
        object UniPanel49: TUniPanel
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 176
          Height = 26
          Hint = ''
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 0
          Margins.Bottom = 5
          ShowHint = True
          Align = alClient
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clWhite
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 2
          BorderStyle = ubsOutset
          Caption = ''
          Color = clWhite
          object UniLabel21: TUniLabel
            Tag = 1
            Left = 8
            Top = 5
            Width = 160
            Height = 13
            Cursor = crHandPoint
            Hint = ''
            ShowHint = True
            Caption = 'Cevaplanmam'#305#351' Ba'#351'vuru'
            ParentFont = False
            Font.Charset = TURKISH_CHARSET
            Font.Color = 6442559
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            Font.OverrideDefaults = [ovFontHeight]
            ParentColor = False
            Color = clWhite
            TabOrder = 1
          end
        end
      end
    end
    object UniPanel50: TUniPanel
      Left = 1010
      Top = 166
      Width = 230
      Height = 347
      Hint = ''
      ShowHint = True
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 15
      Caption = ''
      Color = clWhite
      object UniPanel51: TUniPanel
        Left = 1
        Top = 1
        Width = 228
        Height = 45
        Hint = ''
        ShowHint = True
        Align = alTop
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
        Caption = #304'lgili Ki'#351'i Ba'#351'v. Drm.'
        Color = 6776679
        object imgRefresh3: TUniImage
          Left = 200
          Top = 12
          Width = 21
          Height = 21
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Stretch = True
          Url = 'files/images/refresh_gray.png'
          LayoutConfig.Height = '100%'
          LayoutConfig.Width = '100%'
          OnClick = imgRefresh0Click
        end
      end
      object UniPanel52: TUniPanel
        Left = 1
        Top = 46
        Width = 228
        Height = 30
        Hint = ''
        ShowHint = True
        Align = alTop
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Name = 'Verdana'
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
        BorderStyle = ubsNone
        Caption = ''
        Color = clWhite
        object UniLabel20: TUniLabel
          Tag = 1
          Left = 8
          Top = 8
          Width = 68
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Caption = 'BEKLEMEDE'
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 1
        end
        object lbBsvBekleme: TUniLabel
          Tag = 1
          Left = 180
          Top = 8
          Width = 40
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0,000'
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 2
        end
      end
      object UniPanel53: TUniPanel
        Left = 1
        Top = 76
        Width = 228
        Height = 30
        Hint = ''
        ShowHint = True
        Align = alTop
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Name = 'Verdana'
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
        BorderStyle = ubsNone
        Caption = ''
        Color = 15461355
        object UniLabel24: TUniLabel
          Tag = 2
          Left = 8
          Top = 8
          Width = 79
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Caption = #304'NCELEN'#304'YOR'
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 1
        end
        object lbBsvInceleme: TUniLabel
          Tag = 2
          Left = 180
          Top = 8
          Width = 40
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0,000'
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 2
        end
      end
      object UniPanel54: TUniPanel
        Left = 1
        Top = 181
        Width = 228
        Height = 45
        Hint = ''
        ShowHint = True
        Align = alBottom
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
        Caption = 'Cevap S'#252'resi Yakla'#351'an'
        Color = 6776679
        object imgRefresh4: TUniImage
          Left = 200
          Top = 12
          Width = 21
          Height = 21
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Stretch = True
          Url = 'files/images/refresh_gray.png'
          LayoutConfig.Height = '100%'
          LayoutConfig.Width = '100%'
          OnClick = imgRefresh0Click
        end
      end
      object UniPanel55: TUniPanel
        Left = 1
        Top = 226
        Width = 228
        Height = 30
        Hint = ''
        ShowHint = True
        Align = alBottom
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Name = 'Verdana'
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 5
        BorderStyle = ubsNone
        Caption = ''
        Color = clWhite
        object UniLabel26: TUniLabel
          Tag = 1
          Left = 8
          Top = 8
          Width = 131
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Caption = '15 G'#252'nden Az Kalanlar'
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 1
        end
        object lbBsv15Gun: TUniLabel
          Tag = 1
          Left = 180
          Top = 8
          Width = 40
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0,000'
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 2
        end
      end
      object UniPanel56: TUniPanel
        Left = 1
        Top = 256
        Width = 228
        Height = 30
        Hint = ''
        ShowHint = True
        Align = alBottom
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Name = 'Verdana'
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 6
        BorderStyle = ubsNone
        Caption = ''
        Color = 15461355
        object UniLabel28: TUniLabel
          Tag = 2
          Left = 8
          Top = 8
          Width = 131
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Caption = '10 G'#252'nden Az Kalanlar'
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 1
        end
        object lbBsv10Gun: TUniLabel
          Tag = 2
          Left = 180
          Top = 8
          Width = 40
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0,000'
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 2
        end
        object UniImage13: TUniImage
          Left = 148
          Top = 3
          Width = 24
          Height = 24
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Stretch = True
          LayoutConfig.Height = '100%'
          LayoutConfig.Width = '100%'
        end
      end
      object UniPanel57: TUniPanel
        Left = 1
        Top = 286
        Width = 228
        Height = 30
        Hint = ''
        ShowHint = True
        Align = alBottom
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Name = 'Verdana'
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 7
        BorderStyle = ubsNone
        Caption = ''
        Color = clWhite
        object UniLabel30: TUniLabel
          Tag = 3
          Left = 8
          Top = 8
          Width = 124
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Caption = '5 G'#252'nden Az Kalanlar'
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 1
        end
        object lbBsv05Gun: TUniLabel
          Tag = 3
          Left = 180
          Top = 8
          Width = 40
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0,000'
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clHotLight
          Font.Name = 'Verdana'
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 2
        end
        object UniImage14: TUniImage
          Left = 148
          Top = 3
          Width = 24
          Height = 24
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Stretch = True
          LayoutConfig.Height = '100%'
          LayoutConfig.Width = '100%'
        end
      end
      object UniPanel58: TUniPanel
        Left = 1
        Top = 316
        Width = 228
        Height = 30
        Hint = ''
        ShowHint = True
        Align = alBottom
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Name = 'Verdana'
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 8
        BorderStyle = ubsNone
        Caption = ''
        Color = 15461355
        object UniLabel23: TUniLabel
          Tag = 4
          Left = 8
          Top = 8
          Width = 100
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Caption = 'S'#252'resi Dolanlar'
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clRed
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 1
        end
        object lbBsv30Gun: TUniLabel
          Tag = 4
          Left = 180
          Top = 8
          Width = 40
          Height = 13
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0,000'
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clRed
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Font.OverrideDefaults = [ovFontHeight]
          ParentColor = False
          Color = clWhite
          TabOrder = 2
        end
        object UniImage20: TUniImage
          Left = 148
          Top = 3
          Width = 24
          Height = 24
          Cursor = crHandPoint
          Hint = ''
          ShowHint = True
          Stretch = True
          LayoutConfig.Height = '100%'
          LayoutConfig.Width = '100%'
        end
      end
    end
    object UniPanel59: TUniPanel
      Left = 740
      Top = 519
      Width = 500
      Height = 311
      Hint = ''
      ShowHint = True
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 16
      Caption = ''
      object UniPanel60: TUniPanel
        Left = 1
        Top = 1
        Width = 498
        Height = 25
        Hint = ''
        ShowHint = True
        Align = alTop
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
        Caption = 'Cevaplanmas'#305' Beklenen E-Dan'#305#351'man Soru Seti'
        Color = 13401877
        object imgRefresh6: TUniImage
          Left = 469
          Top = 2
          Width = 21
          Height = 21
          Cursor = crHandPoint
          Hint = ''
          Visible = False
          ShowHint = True
          Stretch = True
          Url = 'files/images/refresh_gray.png'
          LayoutConfig.Height = '100%'
          LayoutConfig.Width = '100%'
          OnClick = imgRefresh0Click
        end
        object imgDuyuruListesi: TUniImage
          Left = 442
          Top = 2
          Width = 21
          Height = 21
          Cursor = crHandPoint
          Hint = ''
          Visible = False
          ShowHint = True
          Stretch = True
          Url = 'files/images/dsh_list.png'
          LayoutConfig.Height = '100%'
          LayoutConfig.Width = '100%'
          OnClick = imgDuyuruListesiClick
        end
      end
      object grdDuyuru: TUniDBGrid
        Left = 1
        Top = 46
        Width = 498
        Height = 264
        Hint = ''
        ShowHint = True
        DataSource = dsedanismaSoruSeti
        Options = [dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
        WebOptions.Paged = False
        WebOptions.CustomizableCells = False
        LoadMask.Message = 'Rapor Haz'#305'rlan'#305'yor...'
        ForceFit = True
        BorderStyle = ubsNone
        Align = alClient
        Font.OverrideDefaults = [ovFontHeight]
        ParentFont = False
        TabOrder = 2
        OnDblClick = grdDuyuruDblClick
        Columns = <
          item
            FieldName = 'departman'
            Title.Caption = 'Departman'
            Title.Font.OverrideDefaults = [ovFontHeight]
            Width = 200
            Font.OverrideDefaults = [ovFontHeight]
            DisplayMemo = True
          end
          item
            FieldName = 'baslik'
            Title.Caption = 'Ba'#351'l'#305'k'
            Title.Font.OverrideDefaults = [ovFontHeight]
            Width = 200
            Font.OverrideDefaults = [ovFontHeight]
          end>
      end
      object UniPanel61: TUniPanel
        Left = 1
        Top = 26
        Width = 498
        Height = 20
        Hint = ''
        ShowHint = True
        Align = alTop
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
        BorderStyle = ubsNone
        Caption = ''
        Color = 6776679
        object UniPanel62: TUniPanel
          Left = 249
          Top = 0
          Width = 249
          Height = 20
          Hint = ''
          ShowHint = True
          Align = alLeft
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clWhite
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
          BorderStyle = ubsOutset
          Caption = 'Ba'#351'l'#305'k'
          Color = 6776679
        end
        object UniPanel63: TUniPanel
          Left = 0
          Top = 0
          Width = 249
          Height = 20
          Hint = ''
          ShowHint = True
          Align = alLeft
          ParentFont = False
          Font.Charset = TURKISH_CHARSET
          Font.Color = clWhite
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 2
          BorderStyle = ubsOutset
          Caption = 'Departman'
          Color = 6776679
        end
      end
    end
    object lblVersiyon: TUniLabel
      Left = 1131
      Top = 835
      Width = 109
      Height = 13
      Hint = ''
      ShowHint = True
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lblVersiyon'
      ParentFont = False
      Font.Height = -9
      TabOrder = 17
    end
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user')
    Left = 579
    Top = 213
  end
  object qEnvDetay: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      
        'SELECT kaynak_str as alanadi, COUNT(ID) AS adet FROM vw_data_env' +
        'anter'
      'WHERE active = '#39'E'#39' AND mc_id = 2'
      'GROUP BY kaynak_str'
      'ORDER BY 2 DESC')
    Left = 660
    Top = 213
  end
  object dsEnvDetay: TUniDataSource
    DataSet = qEnvDetay
    Left = 728
    Top = 213
  end
  object tblKontrol: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'kaynak_str'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'kisi_str'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'env_var'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'chl_var'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'durum'
        DataType = ftInteger
      end
      item
        Name = 'mesaj_str'
        DataType = ftString
        Size = 100
      end>
    Left = 578
    Top = 266
    Data = {
      040006000A006B61796E616B5F737472010064000000000008006B6973695F73
      747201006400000000000700656E765F7661720100010000000000070063686C
      5F76617201000100000000000500647572756D030000000000000009006D6573
      616A5F7374720100640000000000000000000000}
  end
  object qKontrol: TVirtualQuery
    SourceDataSets = <
      item
        DataSet = tblKontrol
      end>
    SQL.Strings = (
      'SELECT * FROM tblKontrol'
      'ORDER BY durum')
    Left = 656
    Top = 266
  end
  object dsKontrol: TUniDataSource
    DataSet = qKontrol
    Left = 728
    Top = 266
  end
  object dsDuyuru: TUniDataSource
    DataSet = qDuyuru
    Left = 825
    Top = 605
  end
  object DshTimer: TUniTimer
    Interval = 500
    Enabled = False
    ChainMode = True
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = DshTimerTimer
    Left = 813
    Top = 219
  end
  object qDuyuru: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM sys_news')
    Left = 772
    Top = 597
  end
  object qedanismaSoruSeti: TUniQuery
    Connection = MainMod.DBMain
    Left = 764
    Top = 663
  end
  object dsedanismaSoruSeti: TUniDataSource
    DataSet = qedanismaSoruSeti
    Left = 820
    Top = 663
  end
end
