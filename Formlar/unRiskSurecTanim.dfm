object frmRiskSurecTanim: TfrmRiskSurecTanim
  Left = 0
  Top = 0
  ClientHeight = 717
  ClientWidth = 1103
  Caption = 'Risk Tan'#305'm'
  WindowState = wsMaximized
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  OnCreate = UniFormCreate
  TextHeight = 15
  object pnlButtons: TUniPanel
    Left = 0
    Top = 669
    Width = 1103
    Height = 48
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      1103
      48)
    object UniLabel9: TUniLabel
      Left = 12
      Top = 6
      Width = 96
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = #304'lk Kay'#305't Yapan :'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
    end
    object lbIDY: TUniLabel
      Left = 111
      Top = 5
      Width = 220
      Height = 13
      Hint = ''
      AutoSize = False
      Caption = 'lbIDY'
      ParentFont = False
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
    end
    object UniLabel10: TUniLabel
      Left = 12
      Top = 24
      Width = 96
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = #304'lk Kay'#305't Zaman'#305' :'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 3
    end
    object lbIDT: TUniLabel
      Left = 111
      Top = 24
      Width = 220
      Height = 13
      Hint = ''
      AutoSize = False
      Caption = 'lbIDT'
      ParentFont = False
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
    end
    object UniLabel11: TUniLabel
      Left = 337
      Top = 5
      Width = 96
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Son De'#287'. Yapan :'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 5
    end
    object lbSDY: TUniLabel
      Left = 436
      Top = 5
      Width = 200
      Height = 13
      Hint = ''
      AutoSize = False
      Caption = 'lbSDY'
      ParentFont = False
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 6
    end
    object UniLabel12: TUniLabel
      Left = 337
      Top = 23
      Width = 96
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Son De'#287'. Zaman'#305' :'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 7
    end
    object lbSDT: TUniLabel
      Left = 435
      Top = 24
      Width = 200
      Height = 13
      Hint = ''
      AutoSize = False
      Caption = 'lbSDT'
      ParentFont = False
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 8
    end
    object btnHelp: TUniBitBtn
      Left = 859
      Top = 6
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 9
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = btnHelpClick
    end
    object btnexit: TUniBitBtn
      Left = 961
      Top = 6
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Kapat'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 10
      Images = MainMod.PrjImgList
      ImageIndex = 5
      OnClick = btnexitClick
    end
  end
  object pnldetay: TUniPanel
    Left = 665
    Top = 0
    Width = 438
    Height = 669
    Hint = ''
    Align = alRight
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    ClientEvents.ExtEvents.Strings = (
      
        'afterrender=function afterrender(sender, eOpts) {'#13#10'    var me = ' +
        'sender;'#13#10#13#10'    function updateToolTips() {'#13#10'        me.items.ite' +
        'ms.forEach(function(item) {'#13#10'            if (item.tools) {'#13#10'    ' +
        '            item.tools.forEach(function(tool) {'#13#10'               ' +
        '     if (tool.type === '#39'collapse-top'#39' || tool.type === '#39'collapse' +
        '-bottom'#39') {'#13#10'                        tool.setTooltip('#39'Paneli kap' +
        'at'#39');'#13#10'                    } else if (tool.type === '#39'expand-top'#39 +
        ' || tool.type === '#39'expand-bottom'#39') {'#13#10'                        to' +
        'ol.setTooltip('#39'Paneli a'#231#39');'#13#10'                    }'#13#10'            ' +
        '    });'#13#10'            }'#13#10'        });'#13#10'    }'#13#10#13#10'    // '#304'lk y'#252'kleme' +
        ' s'#305'ras'#305'nda tooltips ayarlar'#305#13#10'    updateToolTips();'#13#10#13#10'    // He' +
        'r panelde collapse ve expand olaylar'#305'n'#305' dinle'#13#10'    me.items.item' +
        's.forEach(function(item) {'#13#10'        item.addListener('#39'expand'#39', u' +
        'pdateToolTips);'#13#10'        item.addListener('#39'collapse'#39', updateTool' +
        'Tips);'#13#10'    });'#13#10'}')
    TitleAlign = taCenter
    Title = 'Detay'
    Caption = ''
    AlignmentControl = uniAlignmentClient
    ParentAlignmentControl = False
    Layout = 'accordion'
    object pnltedbir: TUniPanel
      Left = 1
      Top = 0
      Width = 436
      Height = 300
      Hint = ''
      TabOrder = 1
      BorderStyle = ubsSingle
      ShowCaption = False
      TitleVisible = True
      TitleAlign = taCenter
      Title = 'Tedbirler'
      Caption = ''
      Layout = 'fit'
      object pnltedbirbaslik: TUniPanel
        Left = 0
        Top = 0
        Width = 436
        Height = 34
        Hint = ''
        Align = alTop
        TabOrder = 1
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        object btnTedbiradd: TUniBitBtn
          AlignWithMargins = True
          Left = 305
          Top = 3
          Width = 25
          Height = 28
          Hint = 'Risk i'#231'in bir tedbir ekler'
          Margins.Right = 10
          ShowHint = True
          ParentShowHint = False
          Caption = ''
          TabOrder = 1
          Images = MainMod.BtnImgList
          ImageIndex = 0
          OnClick = btnTedbiraddClick
        end
        object btntedbiredit: TUniBitBtn
          AlignWithMargins = True
          Left = 343
          Top = 3
          Width = 25
          Height = 28
          Hint = 'Riske ba'#287'l'#305' tedbiri d'#252'zenler'
          Margins.Right = 10
          ShowHint = True
          ParentShowHint = False
          Caption = ''
          TabOrder = 2
          Images = MainMod.BtnImgList
          ImageIndex = 1
          OnClick = btntedbireditClick
        end
        object btntedbirdelete: TUniBitBtn
          AlignWithMargins = True
          Left = 381
          Top = 3
          Width = 25
          Height = 28
          Hint = 'Riske ba'#287'l'#305' tedbiri kald'#305'r'#305'r'
          Margins.Right = 30
          ShowHint = True
          ParentShowHint = False
          Caption = ''
          TabOrder = 3
          Images = MainMod.BtnImgList
          ImageIndex = 5
          OnClick = btntedbirdeleteClick
        end
      end
      object UniDBGrid1: TUniDBGrid
        Left = 0
        Top = 34
        Width = 436
        Height = 138
        Hint = ''
        TitleFont.OverrideDefaults = [ovFontHeight]
        DataSource = dsRiskTedbir
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
        WebOptions.Paged = False
        LoadMask.Enabled = False
        LoadMask.Message = 'Loading data...'
        ForceFit = True
        BorderStyle = ubsNone
        Align = alClient
        Font.OverrideDefaults = [ovFontHeight]
        ParentFont = False
        TabOrder = 2
        Columns = <
          item
            FieldName = 'tedbir'
            Title.Caption = 'Tedbir'
            Title.Font.OverrideDefaults = [ovFontHeight]
            Width = 500
            Font.OverrideDefaults = [ovFontHeight]
          end>
      end
      object UniPanel3: TUniPanel
        Left = 0
        Top = 172
        Width = 436
        Height = 128
        Hint = ''
        Align = alBottom
        TabOrder = 3
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        object UniDBMemo1: TUniDBMemo
          Left = 0
          Top = 57
          Width = 436
          Height = 71
          Hint = ''
          DataField = 'aciklama'
          DataSource = dsRiskTedbir
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          Align = alBottom
          ReadOnly = True
          TabOrder = 1
        end
        object UniLabel13: TUniLabel
          Left = 6
          Top = 39
          Width = 83
          Height = 18
          Hint = ''
          AutoSize = False
          Caption = 'A'#231#305'klama'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 2
        end
        object UniLabel14: TUniLabel
          Left = 6
          Top = 13
          Width = 35
          Height = 13
          Hint = ''
          Caption = 'Durum'
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 3
        end
        object cbRiskTedbirDurum: TUniComboBox
          Left = 45
          Top = 10
          Width = 156
          Hint = ''
          Text = ''
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 4
          EmptyText = 'Durum'
          ReadOnly = True
          CharCase = ecUpperCase
          IconItems = <>
        end
      end
    end
    object pnlsurec: TUniPanel
      Left = 6
      Top = 329
      Width = 435
      Height = 337
      Hint = ''
      TabOrder = 2
      TitleVisible = True
      Title = 'S'#252're'#231'ler'
      Caption = ''
      Layout = 'vbox'
      object UniPanel5: TUniPanel
        Left = 1
        Top = 1
        Width = 433
        Height = 211
        Hint = ''
        TabOrder = 2
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        Layout = 'fit'
        LayoutConfig.Flex = 6
        object UniPanel1: TUniPanel
          Left = 0
          Top = 0
          Width = 433
          Height = 34
          Hint = ''
          Align = alTop
          TabOrder = 1
          BorderStyle = ubsNone
          ShowCaption = False
          Caption = ''
          object btnSurecAdd: TUniBitBtn
            AlignWithMargins = True
            Left = 316
            Top = 3
            Width = 25
            Height = 28
            Hint = 'Risk i'#231'in bir tedbir ekler'
            Margins.Right = 10
            ShowHint = True
            ParentShowHint = False
            Caption = ''
            TabOrder = 1
            Images = MainMod.BtnImgList
            ImageIndex = 0
            OnClick = btnSurecAddClick
          end
          object btnsurecdelete: TUniBitBtn
            AlignWithMargins = True
            Left = 354
            Top = 3
            Width = 25
            Height = 28
            Hint = 'Riske ba'#287'l'#305' tedbiri siler'
            Margins.Right = 30
            ShowHint = True
            ParentShowHint = False
            Caption = ''
            TabOrder = 2
            Images = MainMod.BtnImgList
            ImageIndex = 5
            OnClick = btnsurecdeleteClick
          end
        end
        object UniDBGrid2: TUniDBGrid
          Left = 0
          Top = 34
          Width = 433
          Height = 177
          Hint = ''
          TitleFont.OverrideDefaults = [ovFontHeight]
          DataSource = dsrisksurec
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
          WebOptions.Paged = False
          LoadMask.Enabled = False
          LoadMask.Message = 'Loading data...'
          ForceFit = True
          BorderStyle = ubsNone
          Align = alClient
          Font.OverrideDefaults = [ovFontHeight]
          ParentFont = False
          TabOrder = 2
          Columns = <
            item
              FieldName = 'surec'
              Title.Caption = 'S'#252're'#231
              Title.Font.OverrideDefaults = [ovFontHeight]
              Width = 904
              Font.OverrideDefaults = [ovFontHeight]
              ReadOnly = True
            end>
        end
      end
      object pnlkaynak: TUniPanel
        Left = 1
        Top = 212
        Width = 433
        Height = 124
        Hint = ''
        TabOrder = 1
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        Layout = 'fit'
        LayoutConfig.Flex = 4
        object UniPanel6: TUniPanel
          Left = 0
          Top = 0
          Width = 433
          Height = 34
          Hint = ''
          Visible = False
          Align = alTop
          TabOrder = 1
          ShowCaption = False
          Caption = ''
          object btnKaynakAdd: TUniBitBtn
            AlignWithMargins = True
            Left = 317
            Top = 2
            Width = 24
            Height = 28
            Hint = 'Risk i'#231'in bir tedbir ekler'
            Margins.Right = 10
            ShowHint = True
            ParentShowHint = False
            Caption = ''
            TabOrder = 1
            Images = MainMod.BtnImgList
            ImageIndex = 0
            OnClick = btnKaynakAddClick
          end
          object btnKayanakDelet: TUniBitBtn
            AlignWithMargins = True
            Left = 354
            Top = 2
            Width = 24
            Height = 28
            Hint = 'Risk i'#231'in bir tedbir ekler'
            Margins.Right = 10
            ShowHint = True
            ParentShowHint = False
            Caption = ''
            TabOrder = 2
            Images = MainMod.BtnImgList
            ImageIndex = 5
            OnClick = btnKaynakAddClick
          end
        end
        object UniDBGrid3: TUniDBGrid
          Left = 0
          Top = 34
          Width = 433
          Height = 90
          Hint = ''
          TitleFont.OverrideDefaults = [ovFontHeight]
          DataSource = dskaynaklar
          WebOptions.Paged = False
          LoadMask.Message = 'Loading data...'
          ForceFit = True
          BorderStyle = ubsNone
          Align = alClient
          Font.OverrideDefaults = [ovFontHeight]
          ParentFont = False
          TabOrder = 2
          OnCellClick = UniDBGrid3CellClick
          Columns = <
            item
              FieldName = 'Sec'
              Title.Caption = ' '
              Title.Font.OverrideDefaults = [ovFontHeight]
              Width = 50
              Font.OverrideDefaults = [ovFontHeight]
              Menu.MenuEnabled = False
            end
            item
              FieldName = 'kaynak'
              Title.Caption = 'Kaynak'
              Title.Font.OverrideDefaults = [ovFontHeight]
              Width = 500
              Font.OverrideDefaults = [ovFontHeight]
              ReadOnly = True
            end>
        end
      end
    end
  end
  object pnlrisk: TUniPanel
    Left = 0
    Top = 0
    Width = 665
    Height = 669
    Hint = ''
    Align = alClient
    Anchors = [akRight, akBottom]
    TabOrder = 2
    ShowCaption = False
    Caption = ''
    object UniPanel2: TUniPanel
      Left = 1
      Top = 271
      Width = 663
      Height = 355
      Hint = ''
      Align = alClient
      TabOrder = 1
      BorderStyle = ubsNone
      Caption = ''
      object UniGroupBox1: TUniGroupBox
        Left = 0
        Top = 0
        Width = 663
        Height = 185
        Hint = ''
        Caption = 'Hesaplama Parametreleri'
        Align = alTop
        TabOrder = 1
        object UniLabel3: TUniLabel
          Left = 40
          Top = 29
          Width = 70
          Height = 13
          Hint = ''
          Caption = 'Riskin '#350'iddeti'
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
        end
        object cbetki: TUniComboBox
          Left = 116
          Top = 24
          Width = 487
          Hint = ''
          Text = ''
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 6
          EmptyText = 'Risk '#350'iddeti'
          CharCase = ecUpperCase
          IconItems = <>
          OnChange = Oncombochange
        end
        object UniLabel4: TUniLabel
          Left = 44
          Top = 58
          Width = 66
          Height = 13
          Hint = ''
          Caption = 'Risk Olas'#305'l'#305#287#305
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 2
        end
        object btnEtkiHesapla: TUniBitBtn
          Left = 606
          Top = 24
          Width = 25
          Height = 27
          Hint = 'Departman Ekle'
          Caption = ''
          TabOrder = 3
          Images = MainMod.BtnImgList
          ImageIndex = 1
          OnClick = btnEtkiHesaplaClick
        end
        object cbolasilik: TUniComboBox
          Left = 116
          Top = 53
          Width = 487
          Hint = ''
          Text = ''
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 7
          EmptyText = 'Risk Olas'#305'l'#305#287#305
          CharCase = ecUpperCase
          IconItems = <>
          OnChange = Oncombochange
        end
        object btnOlasilikHesapla: TUniBitBtn
          Left = 606
          Top = 52
          Width = 25
          Height = 25
          Hint = 'Departman Ekle'
          Caption = ''
          TabOrder = 4
          Images = MainMod.BtnImgList
          ImageIndex = 1
          OnClick = btnOlasilikHesaplaClick
        end
        object lbfrekans: TUniLabel
          Left = 44
          Top = 87
          Width = 67
          Height = 13
          Hint = ''
          Caption = 'Risk Frekans'#305
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 5
        end
        object cbfrekans: TUniComboBox
          Left = 116
          Top = 82
          Width = 487
          Hint = ''
          Text = ''
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 9
          EmptyText = 'Risk Frekans'#305
          CharCase = ecUpperCase
          IconItems = <>
          OnChange = Oncombochange
        end
        object lbfakredilme: TUniLabel
          Left = 28
          Top = 116
          Width = 82
          Height = 13
          Hint = ''
          Caption = 'Fark Edilebilirlik'
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 8
        end
        object cbfarkedilme: TUniComboBox
          Left = 116
          Top = 111
          Width = 487
          Hint = ''
          Text = ''
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 10
          EmptyText = 'Farkedilebilirlik'
          CharCase = ecUpperCase
          IconItems = <>
          OnChange = Oncombochange
        end
        object UniLabel7: TUniLabel
          Left = 37
          Top = 145
          Width = 73
          Height = 13
          Hint = ''
          Caption = 'Riskin Seviyesi'
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 12
        end
        object edriskseviye: TUniDBEdit
          Left = 116
          Top = 140
          Width = 89
          Height = 22
          Hint = ''
          DataField = 'seviye'
          DataSource = dsdata
          CharCase = ecUpperCase
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 11
          TabStop = False
          ReadOnly = True
        end
        object lbriskseviyestr: TUniLabel
          Left = 211
          Top = 143
          Width = 392
          Height = 17
          Hint = ''
          AutoSize = False
          Caption = 'Riskin Seviyesi'
          ParentFont = False
          Font.Color = clMaroon
          Font.Height = -12
          Font.Style = [fsBold]
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 13
        end
      end
    end
    object UniPanel4: TUniPanel
      Left = 1
      Top = 626
      Width = 663
      Height = 42
      Hint = ''
      Align = alBottom
      TabOrder = 2
      ShowCaption = False
      Caption = ''
      object btnCancel: TUniBitBtn
        AlignWithMargins = True
        Left = 563
        Top = 4
        Width = 96
        Height = 34
        Hint = ''
        Caption = #304'ptal'
        Align = alRight
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
        Images = MainMod.PrjImgList
        ImageIndex = 5
        OnClick = btnCancelClick
      end
      object btnPost: TUniBitBtn
        AlignWithMargins = True
        Left = 461
        Top = 4
        Width = 96
        Height = 34
        Hint = ''
        Caption = 'Kaydet'
        Align = alRight
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
        Images = MainMod.PrjImgList
        ImageIndex = 14
        OnClick = btnPostClick
      end
    end
    object UniGroupBox2: TUniGroupBox
      Left = 1
      Top = 1
      Width = 663
      Height = 270
      Hint = ''
      Caption = ''
      Align = alTop
      TabOrder = 3
      object cbmetot: TUniComboBox
        Left = 116
        Top = 28
        Width = 487
        Hint = ''
        Text = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
        EmptyText = 'ANAL'#304'Z METOT'
        CharCase = ecUpperCase
        IconItems = <>
        OnChange = Oncombochange
      end
      object UniLabel15: TUniLabel
        Left = 25
        Top = 33
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Analiz Metot'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 5
      end
      object cbdurum: TUniComboBox
        Left = 116
        Top = 149
        Width = 487
        Hint = ''
        Text = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
        EmptyText = 'Durum'
        CharCase = ecUpperCase
        IconItems = <>
        OnChange = Oncombochange
      end
      object edRisk: TUniDBEdit
        Left = 116
        Top = 59
        Width = 487
        Height = 22
        Hint = ''
        DataField = 'risk'
        DataSource = dsdata
        CharCase = ecUpperCase
        CharCaseConversion = uccTurkish
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
        ReadOnly = True
        EmptyText = 'Risk'
      end
      object mmAciklama: TUniDBMemo
        Left = 116
        Top = 90
        Width = 487
        Height = 50
        Hint = ''
        DataField = 'aciklama'
        DataSource = dsdata
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel1: TUniLabel
        Left = 75
        Top = 154
        Width = 35
        Height = 13
        Hint = ''
        Caption = 'Durum'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 6
      end
      object UniLabel2: TUniLabel
        Left = 35
        Top = 186
        Width = 75
        Height = 13
        Hint = ''
        Caption = 'Risk Kategorisi'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 7
      end
      object UniLabel29: TUniLabel
        Left = 25
        Top = 90
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Risk A'#231#305'klama'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 8
      end
      object UniLabel5: TUniLabel
        Left = 23
        Top = 64
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Risk'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 9
      end
      object UniLabel8: TUniLabel
        Left = 53
        Top = 217
        Width = 55
        Height = 13
        Hint = ''
        Caption = 'Sorumlusu'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 10
      end
      object btnHesapInfo: TUniBitBtn
        Left = 606
        Top = 26
        Width = 25
        Height = 27
        Hint = 'Hesaplama Bilgi'
        Caption = 'I'
        TabOrder = 11
        Images = MainMod.BtnImgList
        OnClick = btnHesapInfoClick
      end
      object edsorumlu: TUniDBLookupComboBox
        Left = 116
        Top = 212
        Width = 487
        Hint = ''
        ListOnlyMode = lmFollowSource
        ListField = 'sorumlu'
        ListSource = dsusers
        KeyField = 'id'
        ListFieldIndex = 0
        ClearButton = True
        DataField = 'Sorumlu_id'
        DataSource = dsdata
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        EmptyText = 'SORUMLU'
        TabOrder = 12
        Color = clWindow
      end
      object lcKategori: TUniDBLookupComboBox
        Left = 116
        Top = 181
        Width = 487
        Hint = ''
        ListField = 'subid;parameter'
        ListSource = dskategori
        KeyField = 'subid'
        ListFieldIndex = 0
        DataField = 'kategori'
        DataSource = dsdata
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        EmptyText = 'KATEGOR'#304
        TabOrder = 13
        Color = clWindow
      end
      object btnrisktanimadd: TUniBitBtn
        Left = 606
        Top = 57
        Width = 25
        Height = 27
        Hint = 'Risk Tan'#305'm '
        ShowHint = True
        ParentShowHint = False
        Caption = 'R'
        TabOrder = 14
        Images = MainMod.BtnImgList
        OnClick = btnrisktanimaddClick
      end
    end
  end
  object qdata: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT *'
      '  FROM def_data_risk r'
      ' where r.mc_id = 4 and id=2')
    AfterScroll = qdataAfterScroll
    Left = 528
    Top = 80
  end
  object dsdata: TUniDataSource
    DataSet = qdata
    OnStateChange = dsdataStateChange
    Left = 576
    Top = 80
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    Left = 780
    Top = 319
  end
  object QRiskTedbir: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      
        ' select * from def_data_risk_tedbir t where t.mc_id =4 and t.ris' +
        'k_id = 4 ')
    AfterScroll = QRiskTedbirAfterScroll
    Left = 528
    Top = 172
  end
  object dsRiskTedbir: TUniDataSource
    DataSet = QRiskTedbir
    OnStateChange = dsdataStateChange
    Left = 576
    Top = 170
  end
  object qrisksurec: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'select * from  def_data_risk_surec_eslesme es '
      
        '       join  def_data_risk r on r.mc_id=es.mc_id and es.risk_id=' +
        'r.id '
      
        '       join def_data_surec s on s.mc_id=es.mc_id and s.id=es.sur' +
        'ec_id '
      '       where es.mc_id= 4 and es.risk_id=4')
    AfterScroll = qrisksurecAfterScroll
    Left = 528
    Top = 219
  end
  object dsrisksurec: TUniDataSource
    DataSet = qrisksurec
    OnStateChange = dsdataStateChange
    Left = 576
    Top = 216
  end
  object vqGddate: TVirtualTable
    Left = 633
    Top = 81
    Data = {04000000000000000000}
  end
  object vqGdrisktedbir: TVirtualTable
    Left = 633
    Top = 129
    Data = {04000000000000000000}
  end
  object vqGdrisksurec: TVirtualTable
    Left = 633
    Top = 177
    Data = {04000000000000000000}
  end
  object qusers: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      
        'select t.id,t.full_name sorumlu from usr_user t where t.active =' +
        #39'E'#39' and mc_id=4 order by t.full_name')
    Left = 528
    Top = 126
  end
  object dsusers: TUniDataSource
    DataSet = qusers
    Left = 576
    Top = 125
  end
  object qkategori: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      
        'SELECT * FROM sys_modul_parameter WHERE module='#39'R'#304'SK ANAL'#304'Z'#304#39' an' +
        'd main_parameter='#39'R'#304'SK KATEGOR'#304#39' ORDER BY subid')
    Left = 706
    Top = 88
  end
  object dskategori: TUniDataSource
    DataSet = qkategori
    Left = 746
    Top = 88
  end
  object qkaynaklar: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'select distinct kaynak_id,k.kaynak'
      'from data_envanter t '
      #9'join def_data_kaynak k on k.id=t.kaynak_id   '
      'where t.mc_id=4 and t.active='#39'E'#39' and surec_id=18449'
      ' --and k.id=any(string_to_array('#39'12,5'#39', '#39','#39')::int[])'
      'order by k.kaynak')
    OnCalcFields = qkaynaklarCalcFields
    Left = 738
    Top = 200
    object qkaynaklarkaynak_id: TIntegerField
      FieldName = 'kaynak_id'
    end
    object qkaynaklarkaynak: TStringField
      FieldName = 'kaynak'
      ReadOnly = True
      Size = 100
    end
    object qkaynaklarSec: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'Sec'
      Calculated = True
    end
  end
  object dskaynaklar: TUniDataSource
    DataSet = qkaynaklar
    Left = 778
    Top = 200
  end
end
