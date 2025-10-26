object MainForm: TMainForm
  Left = 0
  Top = 0
  HelpType = htKeyword
  ClientHeight = 639
  ClientWidth = 1206
  Caption = 'ARYOM - KVKNET Y'#246'netim Sistemi'
  OldCreateOrder = False
  ShowHint = True
  Menu = MainMenu
  MonitoredKeys.Keys = <>
  OnReady = UniFormReady
  OnBeforeShow = UniFormBeforeShow
  OnAfterShow = UniFormAfterShow
  OnAjaxEvent = UniFormAjaxEvent
  OnCreate = UniFormCreate
  TextHeight = 15
  object pnlTop: TUniPanel
    Left = 0
    Top = 5
    Width = 1206
    Height = 60
    Hint = ''
    ShowHint = True
    Align = alTop
    TabOrder = 0
    Caption = ''
    object UniPanel1: TUniPanel
      Left = 1
      Top = 1
      Width = 1204
      Height = 60
      Hint = ''
      ShowHint = True
      Align = alTop
      TabOrder = 1
      Caption = ''
      object btnDgrNet: TUniBitBtn
        AlignWithMargins = True
        Left = 866
        Top = 12
        Width = 96
        Height = 35
        Hint = ''
        Margins.Top = 11
        Margins.Bottom = 12
        ShowHint = True
        Caption = 'DGRNET'
        Align = alRight
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
        Images = MainMod.PrjImgList
        ImageIndex = 24
        OnClick = btnDgrNetClick
      end
      object lbCompName: TUniLabel
        AlignWithMargins = True
        Left = 60
        Top = 31
        Width = 112
        Height = 22
        Hint = ''
        Margins.Left = 5
        Margins.Right = 5
        ShowHint = True
        Alignment = taCenter
        Caption = 'lbCompName'
        ParentFont = False
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontName, ovFontHeight]
        TabOrder = 2
      end
      object lbGroupName: TUniLabel
        AlignWithMargins = True
        Left = 60
        Top = 5
        Width = 116
        Height = 22
        Hint = ''
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        ShowHint = True
        Alignment = taCenter
        Caption = 'lbGroupName'
        ParentFont = False
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontName, ovFontHeight]
        TabOrder = 3
      end
      object btnUserSettings: TUniMenuButton
        AlignWithMargins = True
        Left = 968
        Top = 13
        Width = 232
        Height = 35
        Hint = ''
        Margins.Top = 12
        Margins.Bottom = 11
        ShowHint = True
        DropdownMenu = ppmUser
        Caption = 'Kullan'#305'c'#305' Ad'#305
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF006D819200496C8900A5AFB900FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009DA4
          AC00597A960065778700478EC50046AFFF004F779900657C90005C758B00DDDE
          DF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00597A
          960046AFFF0046AFFF0046AEFE0044A8F50046AFFF0046AFFF0045AAF7008493
          A100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006577
          870046AFFF003E90CE004E61730079848F004C63770043A3ED003F94D600AFB2
          B600FFFFFF00CECECF008B8B8D0088878A00FBFAFB00FFFFFF006D819200478E
          C50046AFFF0050647600FAFAFA00FFFFFF00CECDCD00496D8B0045ADFC004778
          A000A5AFB900CBCBCC00FDFDFD00D9D9DA00A7A6A800FFFFFF00496C890046AF
          FF0046AFFF0073859500FFFFFF00FFFFFF00FFFFFF00556F860046AFFF0046AF
          FF0064778800FFFFFF00FFFFFF00B7B7B800BCBCBD00FFFFFF00A5AFB9004F77
          990046AFFF0051708A00E7E7E800FFFFFF00BCBFC300467CA70043A2EB005A71
          8600CDD0D400BBBABC00FFFFFF008E8E9000FBFBFB00FFFFFF00FFFFFF00657C
          900046AFFF0046AEFD004C7A9F005C7A93004A88B80046AFFF00419DE300A0A8
          AF00FFFFFF00605F6200F9F9F900DFDFE00089888A00A7A7A900FFFFFF005C75
          8B0045AAF7003F94D60045ADFC0046AFFF0043A2EB00419DE3004198DB00919D
          A800FFFFFF00A5A4A600D5D5D500FFFFFF00FFFFFF0087878900FFFFFF00DDDE
          DF008493A100B0B3B60048799F0046AFFF005A718600A0A8AF00919DA800FBFA
          FB00FFFFFF0088878A00E5E5E500FFFFFF00EBEBEB0084838500FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00A5AFB90064778800CDCFD300FFFFFF00FFFFFF00FFFF
          FF00F5F5F5006C6B6E00FFFFFF00AEADAF0099999B00DBDBDB00FFFFFF00FFFF
          FF00FFFFFF00CECECF00CBCBCC00FFFFFF00BBBABC005F5E6100A7A7A9008585
          87006D6C6F00E7E7E800FFFFFF0091909200F5F5F500FFFFFF00FFFFFF00FFFF
          FF00FFFFFF008B8B8D00FDFDFD00FFFFFF00FFFFFF00F9F9F900D5D5D500E5E5
          E500FFFFFF00FFFFFF00FFFFFF00E6E5E600A3A3A400FFFFFF00FFFFFF00FFFF
          FF00FFFFFF0088878A00D9D9DA00B7B7B8008E8E9000DFDFE000FFFFFF00FFFF
          FF00AEADAF0091909200E6E5E6009A9A9C00C5C5C600FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FBFAFB00A7A6A800BCBCBD00FBFBFB0089888A00FFFFFF00EBEB
          EB0099999B00F5F5F500A3A3A400C5C5C600FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A7A7A900878789008483
          8500DBDBDB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
        Align = alRight
        ParentFont = False
        Font.Height = -13
        Font.OverrideDefaults = [ovFontName, ovFontHeight]
        TabOrder = 4
      end
      object imgLogo: TUniDBImage
        Left = 6
        Top = 6
        Width = 48
        Height = 48
        Hint = ''
        ShowHint = True
        DataField = 'krm_logo'
        DataSource = dsMCDef
        Center = False
        Stretch = True
        Proportional = True
      end
    end
  end
  object pnlMain: TUniContainerPanel
    Left = 258
    Top = 65
    Width = 948
    Height = 555
    Hint = ''
    ShowHint = True
    ParentColor = False
    Align = alClient
    TabOrder = 1
    object PgControl: TUniPageControl
      Left = 0
      Top = 0
      Width = 948
      Height = 555
      Hint = ''
      ShowHint = True
      ActivePage = tsHome
      Images = UniNativeImageList2
      Align = alClient
      TabOrder = 0
      OnChange = PgControlChange
      object tsHome: TUniTabSheet
        Hint = ''
        ShowHint = True
        Caption = 'Ana Sayfa'
        Font.OverrideDefaults = [ovFontName, ovFontHeight]
        ParentFont = False
        OnClose = TabSheetClose
      end
    end
  end
  object StatusBar: TUniStatusBar
    Left = 0
    Top = 620
    Width = 1206
    Height = 19
    Hint = ''
    ShowHint = True
    Panels = <
      item
        Alignment = taCenter
        Width = 200
      end
      item
        Width = 200
      end>
    SizeGrip = False
    Align = alBottom
    ParentColor = False
    Color = clWindow
  end
  object Splitter: TUniSplitter
    Left = 252
    Top = 65
    Width = 6
    Height = 555
    Hint = ''
    ShowHint = True
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object pnlNavTree: TUniPanel
    Left = 0
    Top = 65
    Width = 252
    Height = 555
    Hint = ''
    ShowHint = True
    Constraints.MaxWidth = 300
    Align = alLeft
    ParentFont = False
    Font.OverrideDefaults = [ovFontName, ovFontHeight]
    TabOrder = 4
    TitleVisible = True
    TitleAlign = taCenter
    Title = 'Ana Men'#252
    Caption = ''
    Collapsible = True
    CollapseDirection = cdLeft
    object NavTree: TUniTreeView
      Left = 1
      Top = 60
      Width = 250
      Height = 470
      Hint = ''
      ShowHint = True
      Items.FontData = {0100000000}
      Images = UniNativeImageList2
      Font.Name = 'Verdana'
      Font.OverrideDefaults = [ovFontName, ovFontHeight]
      ParentFont = False
      Align = alClient
      TabOrder = 1
      ScreenMask.ShowMessage = False
      ScreenMask.Target = Owner
      ScreenMask.Color = clWhite
      ScreenMask.Opacity = 0.200000002980232200
      Color = clWindow
      BorderStyle = ubsNone
      OnLoaded = NavTreeLoaded
      OnClick = NavTreeClick
    end
    object pnlToolBar: TUniPanel
      Left = 1
      Top = 1
      Width = 250
      Height = 59
      Hint = ''
      ShowHint = True
      Align = alTop
      TabOrder = 2
      Caption = ''
      object ToolBar: TUniToolBar
        Left = 1
        Top = 1
        Width = 248
        Height = 34
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        ButtonHeight = 25
        ButtonWidth = 25
        Images = imgToolbar
        BorderWidth = 1
        LayoutAttribs.Padding = '0'
        TabOrder = 1
        ParentColor = False
        Color = clBtnFace
        object btnExpandAll: TUniToolButton
          Left = 0
          Top = 0
          Hint = 'T'#252'm Men'#252'y'#252' A'#231
          ShowHint = True
          ImageIndex = 0
          Caption = 'btnExpandAll'
          TabOrder = 1
          OnClick = btnExpandAllClick
        end
        object btnCollapseAll: TUniToolButton
          Left = 25
          Top = 0
          Hint = 'T'#252'm Men'#252'y'#252' Kapat'
          ShowHint = True
          ImageIndex = 1
          Caption = 'btnCollapseAll'
          TabOrder = 2
          OnClick = btnCollapseAllClick
        end
        object UniToolButton3: TUniToolButton
          Left = 50
          Top = 0
          Width = 8
          Hint = ''
          ShowHint = True
          Style = tbsSeparator
          Caption = 'UniToolButton3'
          TabOrder = 3
        end
        object btnCloseAllTabs: TUniToolButton
          Left = 58
          Top = 0
          Hint = 'A'#231#305'k T'#252'm Sayfalar'#305' Kapat'
          ShowHint = True
          ImageIndex = 2
          Caption = 'btnCloseAllTabs'
          ScreenMask.Enabled = True
          ScreenMask.Message = 'Cleaning up...'
          ScreenMask.Target = Owner
          ScreenMask.Color = clWhite
          ScreenMask.Opacity = 0.349999994039535500
          TabOrder = 4
          OnClick = btnCloseAllTabsClick
        end
      end
      object edSearchMenu: TUniComboBox
        Left = 1
        Top = 35
        Width = 248
        Height = 23
        Hint = ''
        ShowHint = True
        Text = ''
        Align = alClient
        ParentFont = False
        Font.OverrideDefaults = [ovFontName, ovFontHeight]
        TabOrder = 2
        EmptyText = 'Men'#252'de Ara'
        MinQueryLength = 3
        CheckChangeDelay = 250
        ClearButton = True
        FieldLabelWidth = 250
        Triggers = <
          item
            ButtonId = 0
            IconCls = 'x-form-search-trigger'
            HandleClicks = True
          end>
        IconItems = <>
        OnChange = edSearchMenuChange
        OnTriggerEvent = edSearchMenuTriggerEvent
      end
    end
    object pnlVersion: TUniPanel
      Left = 1
      Top = 530
      Width = 250
      Height = 24
      Cursor = crHandPoint
      Hint = 'S'#252'r'#252'm Notlar'#305'n'#305' g'#246'rmek i'#231'in t'#305'klay'#305'n'#305'z'
      ShowHint = True
      Align = alBottom
      ParentFont = False
      Font.Charset = TURKISH_CHARSET
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontName, ovFontHeight]
      TabOrder = 3
      Caption = 'pnlVersion'
      OnClick = pnlVersionClick
    end
  end
  object pnlMenu: TUniPanel
    Left = 0
    Top = 0
    Width = 1206
    Height = 5
    Hint = ''
    Visible = False
    ShowHint = True
    Align = alTop
    TabOrder = 5
    Caption = ''
  end
  object imgToolbar: TUniNativeImageList
    Left = 405
    Top = 134
    Images = {
      04000000FFFFFF1F057E04000000000100010010100000010020006804000016
      0000002800000010000000200000000100200000000000000000000000000000
      000000000000000000000000000000000000008C7973FF000000000000000000
      00000063A65AFF848684FF848684FF848684FF848684FF848684FF848684FF84
      8684FF848684FF848684FF00000000000000008C7163FF00000000000000007B
      6152FF63A65AFF848684FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7E7FFE7
      E7E7FFE7E7E7FF848684FF00000000000000008C7163FF8C7973FF8C7163FF31
      A631FF63A65AFF848684FFE7E7E7FFE7E7E7FFE7E7E7FF212021FFE7E7E7FFE7
      E7E7FFE7E7E7FF848684FF00000000000000008C7973FF000000000000000063
      A65AFF84B684FF848684FFF7F7EFFFF7F7EFFFF7F7EFFF212021FFF7F7EFFFF7
      F7EFFFF7F7EFFF848684FF00000000000000008C7163FF000000000000000000
      00000063A65AFF848684FFF7F7EFFF181818FF181818FF000000FF181818FF18
      1818FFF7F7EFFF848684FF00000000000000008C7973FF000000000000000000
      00000000000000848684FFFFF7F7FFFFF7F7FFFFF7F7FF081010FFFFF7F7FFFF
      F7F7FFFFF7F7FF848684FF00000000000000008C7163FF000000000000000000
      00000063A65AFF848684FFFFF7F7FFFFF7F7FFFFF7F7FF000000FFFFF7F7FFFF
      F7F7FFFFF7F7FF848684FF00000000000000008C7973FF000000000000000063
      A65AFF63A65AFF848684FFFFFFF7FFFFFFF7FFFFFFF7FFFFFFF7FFFFFFF7FFFF
      FFF7FFFFFFF7FF848684FF00000000000000008C7163FF8C7973FF8C7163FF31
      A631FF63A65AFF8C8E94FF848684FF848684FF848684FF848684FF848684FF84
      8684FF848684FF8C8E94FF00000000000000008C7163FF000000000000000063
      A65AFF63A65AFF84B684FF84B684FF63A65AFF00000000000000000000000000
      000000000000000000000000000000000000008C7163FF000000000000000000
      00000063A65AFF63A65AFF63A65AFF0000000000000000000000000000000000
      00000000000000000000000000000063A65AFF63A65AFF7B6152FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000063A65AFF63A65AFF63A65AFF63A65AFF63A65AFF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000031A631FF63A65AFF63A65AFF84B684FF31A631FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000063A65AFF63A65AFF9CDFA5FF63A65AFF63A65AFF00
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000063A65AFF63A65AFF63A65AFF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000DC00AC41D800AC41C000AC41D800AC41DC00AC41DE
      00AC41DC00AC41D800AC41C000AC41D83FAC41DC7FAC418FFFAC4107FFAC4107
      FFAC4107FFAC418FFFAC41FFFFFF1F057E040000000001000100101000000100
      2000680400001600000028000000100000002000000001002000000000000000
      00000000000000000000000000000000000000000000000000008C7973FF0000
      0000000000000000000063A65AFF848684FF848684FF848684FF848684FF8486
      84FF848684FF848684FF848684FF848684FF00000000000000008C7163FF0000
      0000000000007B6152FF63A65AFF848684FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7
      E7FFE7E7E7FFE7E7E7FFE7E7E7FF848684FF00000000000000008C7163FF8C79
      73FF8C7163FF31A631FF63A65AFF848684FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7
      E7FFE7E7E7FFE7E7E7FFE7E7E7FF848684FF00000000000000008C7973FF0000
      00000000000063A65AFF84B684FF848684FFF7F7EFFFF7F7EFFFF7F7EFFFF7F7
      EFFFF7F7EFFFF7F7EFFFF7F7EFFF848684FF00000000000000008C7163FF0000
      0000000000000000000063A65AFF848684FFF7F7EFFF181818FF181818FF0000
      00FF181818FF181818FFF7F7EFFF848684FF00000000000000008C7973FF0000
      0000000000000000000000000000848684FFFFF7F7FFFFF7F7FFFFF7F7FFFFF7
      F7FFFFF7F7FFFFF7F7FFFFF7F7FF848684FF00000000000000008C7163FF0000
      0000000000000000000063A65AFF848684FFFFF7F7FFFFF7F7FFFFF7F7FFFFF7
      F7FFFFF7F7FFFFF7F7FFFFF7F7FF848684FF00000000000000008C7973FF0000
      00000000000063A65AFF63A65AFF848684FFFFFFF7FFFFFFF7FFFFFFF7FFFFFF
      F7FFFFFFF7FFFFFFF7FFFFFFF7FF848684FF00000000000000008C7163FF8C79
      73FF8C7163FF31A631FF63A65AFF8C8E94FF848684FF848684FF848684FF8486
      84FF848684FF848684FF848684FF8C8E94FF00000000000000008C7163FF0000
      00000000000063A65AFF63A65AFF84B684FF84B684FF63A65AFF000000000000
      00000000000000000000000000000000000000000000000000008C7163FF0000
      0000000000000000000063A65AFF63A65AFF63A65AFF00000000000000000000
      0000000000000000000000000000000000000000000063A65AFF63A65AFF7B61
      52FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063A65AFF63A65AFF63A65AFF63A6
      5AFF63A65AFF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000031A631FF63A65AFF63A65AFF84B6
      84FF31A631FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063A65AFF63A65AFF9CDFA5FF63A6
      5AFF63A65AFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063A65AFF63A65AFF63A6
      5AFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DC00AC41D800AC41C000AC41D800
      AC41DC00AC41DE00AC41DC00AC41D800AC41C000AC41D83FAC41DC7FAC418FFF
      AC4107FFAC4107FFAC4107FFAC418FFFAC41FFFFFF1F040101000089504E470D
      0A1A0A0000000D49484452000000100000001008060000001FF3FF6100000009
      7048597300000EC300000EC301C76FA864000000B349444154388D6360A01030
      3EEF739BCFC0C09080437E8164D1AE444206FCC7A760E6272B9C720D0D0D8C2C
      849C585F5F8F55BCB1B191818181818165E6272BBC8AB0CB20004117C06C22CB
      005C2E43369889900B08018A0D2018065090C8C8C8B8806C03181919175C0B35
      C29A5E8875010303030383E6AAB30CEFB62D636060606010F28A62B81E664C9A
      0177B27D1914BB96C1D90C0CD40A444289050654A66E867B4165EA6686EB61C6
      0C8CC4DA842B1001A91430D225B86B260000000049454E44AE426082FFFFFF1F
      057E040000000001000100101000000100200068040000160000002800000010
      0000002000000001002000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000006AA361FF388D35FF1A
      7D1AFF1D7F1DFF3B8E38FF73A668FF0000000000000000000000000000000000
      0000000000000000000000000000007BAB70FF208121FF26912AFF26992CFF24
      9E2BFF219B27FF219527FF238E25FF1F801FFF93B583FF000000000000000000
      00000000000000000000003D8F39FF2F8F32FF3BAA46FF38AB42FF31A83BFF2D
      A535FF2BA433FF2DA535FF31A83BFF33A43CFF2A8B2CFF51984BFF0000000000
      000000000000007CAB70FF369539FF4BB558FF44B250FF3DAE49FF38AB43FF3C
      A342FF3DA141FF35A93FFF38AB43FF3DAE49FF44B250FF2F8D2FFF9AB88AFF00
      00000000000000248324FF52B760FF50B85EFF4AB557FF44B251FF46A94DFFE7
      E1DCFF4C9E4BFF3DAE48FF40AF4CFF44B251FF4AB557FF48AF54FF238222FF00
      00000073A769FF41A24AFF5CBE6CFF56BB65FF50B85FFF50AF59FFE7E1DCFFE7
      E1DCFF599B54FF53A254FF55A456FF57A559FF57AE5EFF56BB65FF38983DFF8C
      B17DFF499545FF58B768FF62C273FF5CBF6DFF5BB466FFE7E1DCFFE7E1DCFFE7
      E1DCFFE7E1DCFFE7E1DCFFE7E1DCFFF3EFEBFF61AA64FF5CBF6DFF4BAC56FF57
      9B51FF2D872CFF6CC67EFF68C57BFF66BA72FFE7E1DCFFE7E1DCFFE7E1DCFFE7
      E1DCFFE7E1DCFFE7E1DCFFE7E1DCFFF3EFEBFF66AD6AFF63C275FF5FBC6FFF27
      8426FF2A8529FF72CA86FF6FC983FFF3EFEBFFF3EFEBFFF3EFEBFFF3EFEBFFF3
      EFEBFFF3EFEBFFF3EFEBFFF3EFEBFFF3EFEBFF6CB071FF6AC67DFF65C076FF2D
      882CFF449341FF68BF79FF76CC8BFF71CA86FFFAF5F4FFFAF5F4FFFAF5F4FFFA
      F5F4FFFAF5F4FFFAF5F4FFFAF5F4FFFAF5F4FF72B378FF71CA86FF58B266FF59
      9B52FF71A667FF51AB5EFF7DD093FF79CE8FFF76CC8BFFFAF5F4FFF6F1F0FFF6
      F1F0FFFAF5F4FFFAF5F4FFFAF5F4FFFAF5F4FF77C386FF79CE8FFF459F4DFF8C
      B17EFF00000000268427FF7DCE92FF81D298FF7ED194FF7BCF91FFFAF5F4FFF6
      F1F0FF7AB781FF78CE8EFF79CE8FFF7BCF91FF7ED194FF71C585FF248324FF00
      000000000000007DAB71FF499E4FFF89D7A1FF86D59DFF83D49BFF82D399FFFA
      F5F4FF80C891FF81D297FF82D399FF83D49BFF86D59DFF3A923DFF9AB88AFF00
      000000000000000000000040903DFF439B49FF82CF98FF8CD8A4FF8AD7A3FF89
      D7A1FF89D7A1FF89D7A1FF8AD7A3FF7BCA8FFF3A933DFF559A4EFF0000000000
      0000000000000000000000000000007DAB71FF248324FF51A95DFF6EBF7FFF87
      D39EFF83D099FF6BBC7CFF4CA456FF218222FF93B584FF000000000000000000
      000000000000000000000000000000000000000000000075A86BFF4A9648FF28
      8527FF288527FF4B9648FF76A86BFF0000000000000000000000000000000000
      000000F81FAC41E007AC41C003AC418001AC418001AC410000AC410000AC4100
      00AC410000AC410000AC410000AC418001AC418001AC41C003AC41E007AC41F8
      1FAC41}
  end
  object UniNativeImageList2: TUniNativeImageList
    Left = 404
    Top = 192
  end
  object ppmUser: TUniPopupMenu
    Left = 463
    Top = 134
    object ppmiSelectComp: TUniMenuItem
      Caption = #199'al'#305#351'ma '#350'irketi Se'#231
      OnClick = ppmiSelectCompClick
    end
    object ppmiLicenceInfo: TUniMenuItem
      Caption = 'Lisans Bilgileri'
      OnClick = ppmiLicenceInfoClick
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object ppmiChangePwd: TUniMenuItem
      Caption = #350'ifre De'#287'i'#351'tir'
      OnClick = ppmiChangePwdClick
    end
    object ppmiChangeTheme: TUniMenuItem
      Caption = 'Tema De'#287'i'#351'tir'
      Visible = False
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object ppmiUserLogout: TUniMenuItem
      Caption = #199'IKI'#350
      OnClick = ppmiUserLogoutClick
    end
  end
  object tmrClock: TUniTimer
    Interval = 240000
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = tmrClockTimer
    Left = 343
    Top = 134
  end
  object dsMCDef: TUniDataSource
    AutoEdit = False
    DataSet = MainMod.qMCDef
    Left = 513
    Top = 135
  end
  object MainMenu: TUniMainMenu
    Images = UniNativeImageList2
    ScreenMask.Enabled = True
    ScreenMask.Color = clWhite
    ScreenMask.Opacity = 0.200000002980232200
    AttachedPanel = pnlMenu
    Left = 332
    Top = 197
    object EnvanterYnetimi1: TUniMenuItem
      Caption = 'Envanter Y'#246'netimi'
      object mmiVeriTipiAnalizFormu: TUniMenuItem
        Caption = 'Veri Tipi Analiz Formu'
        HelpContext = 190
        OnClick = mmiVeriTipiAnalizFormuClick
      end
      object mmiEnvanterFormlari: TUniMenuItem
        Tag = 100
        Caption = 'Envanter Formlar'#305
        HelpContext = 89
        OnClick = mmiEnvanterFormlariClick
      end
      object mmiKontrolFormlari: TUniMenuItem
        Tag = 100
        Caption = 'Kontrol Formlar'#305
        HelpContext = 93
        OnClick = mmiKontrolFormlariClick
      end
      object mmiDetayliEnvanterListesi: TUniMenuItem
        Caption = 'Detayl'#305' Envanter Listesi'
        HelpContext = 89
        OnClick = mmiDetayliEnvanterListesiClick
      end
      object mmiKVKKSurecler: TUniMenuItem
        Caption = 'S'#252're'#231'ler'
        HelpContext = 20
        Hint = '2'
        OnClick = mmiKVKKSureclerClick
      end
      object mmiKVKKVeriKaynaklari: TUniMenuItem
        Caption = 'Veri Kaynaklar'#305
        HelpContext = 24
        Hint = '3'
        OnClick = mmiKVKKVeriKaynaklariClick
      end
      object mmiKVKKVeriKategorisi: TUniMenuItem
        Caption = 'Veri Kategorisi'
        HelpContext = 28
        Hint = '4'
        OnClick = mmiKVKKVeriKategorisiClick
      end
      object mmiKVKKVeriTipleri: TUniMenuItem
        Caption = 'Veri Tipleri'
        HelpContext = 76
        OnClick = mmiKVKKVeriTipleriClick
      end
      object mmiKVKKVeriKonusuKisi: TUniMenuItem
        Caption = #304'lgili Ki'#351'i'
        HelpContext = 32
        Hint = '5'
        OnClick = mmiKVKKVeriKonusuKisiClick
      end
      object mmiKVKKVeriPaylasimTaraflari: TUniMenuItem
        Caption = 'Veri Payla'#351#305'm Taraflar'#305
        HelpContext = 44
        Hint = '8'
        OnClick = mmiKVKKVeriPaylasimTaraflariClick
      end
      object mmiKVKKAmaclar: TUniMenuItem
        Caption = 'Ama'#231'lar'
        HelpContext = 36
        Hint = '6'
        OnClick = mmiKVKKAmaclarClick
      end
      object mmiKVKKVeriPaylasimMetodlari: TUniMenuItem
        Caption = 'Metodlar'
        HelpContext = 52
        Hint = '10'
        OnClick = mmiKVKKVeriPaylasimMetodlariClick
      end
      object mmiKVKKHukukiDayanaklar: TUniMenuItem
        Caption = 'Dayanaklar'
        HelpContext = 60
        Hint = '12'
        OnClick = mmiKVKKHukukiDayanaklarClick
      end
      object mmiKVKKGuvenlikTedbirleri: TUniMenuItem
        Caption = 'G'#252'venlik Tedbirleri'
        HelpContext = 64
        Hint = '13'
        OnClick = mmiKVKKGuvenlikTedbirleriClick
      end
      object mmiKVKKEkipman: TUniMenuItem
        Caption = 'Ekipman (Donan'#305'm/Yaz'#305'l'#305'm/Hizmet)'
        HelpContext = 85
        OnClick = mmiKVKKEkipmanClick
      end
    end
    object AydnlatmaAkRzaYnetimi1: TUniMenuItem
      Caption = 'Ayd'#305'nlatma & A'#231#305'k R'#305'za Y'#246'netimi'
      object mmiAydinlatmaMetniSablonlari: TUniMenuItem
        Tag = 100
        Caption = 'Ayd'#305'nlatma Metni '#350'ablonlar'#305
        HelpContext = 117
        OnClick = mmiAydinlatmaMetniSablonlariClick
      end
      object mmiOzelOnaySablonlari: TUniMenuItem
        Caption = #214'zel Onay '#350'ablonlar'#305
        HelpContext = 147
        OnClick = mmiOzelOnaySablonlariClick
      end
      object mmiAcikRizaKayitlari: TUniMenuItem
        Tag = 100
        Caption = 'A'#231#305'k R'#305'za Kay'#305'tlar'#305
        HelpContext = 122
        OnClick = mmiAcikRizaKayitlariClick
      end
    end
    object lgiliKiiBavuruYnetimi1: TUniMenuItem
      Caption = #304'lgili Ki'#351'i Ba'#351'vuru Y'#246'netimi'
      object mmiVSBasvuruFormlari: TUniMenuItem
        Tag = 200
        Caption = #304'lgili Ki'#351'i Ba'#351'vurular'#305
        HelpContext = 104
        OnClick = mmiVSBasvuruFormlariClick
      end
      object mmiVSDepartmanFormlari: TUniMenuItem
        Tag = 200
        Caption = #304'lgili Ki'#351'i Departman Formlar'#305
        HelpContext = 112
        OnClick = mmiVSDepartmanFormlariClick
      end
    end
    object YetkiMatrisYnetimi1: TUniMenuItem
      Caption = 'Yetki Matris Y'#246'netimi'
      object mmiErisimYetkiTanimlari: TUniMenuItem
        Caption = 'Yetki Matrisi Giri'#351'leri'
        HelpContext = 40
        OnClick = mmiErisimYetkiTanimlariClick
      end
      object mmiRptYetkiMatrisi: TUniMenuItem
        Caption = 'Yetki Matrisi Raporu'
        HelpContext = 141
        OnClick = mmiRptYetkiMatrisiClick
      end
      object mmiUnvanTanimlari: TUniMenuItem
        Caption = #220'nvan Tan'#305'mlar'#305
        HelpContext = 136
        OnClick = mmiUnvanTanimlariClick
      end
    end
    object DkmanablonYnetimi1: TUniMenuItem
      Caption = 'Dok'#252'man '#350'ablon Y'#246'netimi'
      object mmiKVKKDokumanSablonlari: TUniMenuItem
        Tag = 100
        Caption = 'Dok'#252'man '#350'ablonlar'#305
        HelpContext = 80
        OnClick = mmiKVKKDokumanSablonlariClick
      end
      object DepartmanKVKKUygulamaProsedrleri1: TUniMenuItem
        Caption = 'Departman KVKK Prosed'#252'r'#252
        HelpContext = 180
        OnClick = DepartmanKVKKUygulamaProsedrleri1Click
      end
      object mmiKVKKDokumanTipleri: TUniMenuItem
        Caption = 'Dok'#252'man Tipleri'
        HelpContext = 72
        Hint = '15'
        OnClick = mmiKVKKDokumanTipleriClick
      end
    end
    object Verbis1: TUniMenuItem
      Caption = 'Verbis'
      object mmiVerbisRaporlariToplu: TUniMenuItem
        Caption = 'Verbis Raporlar'#305
        HelpContext = 100
        OnClick = mmiVerbisRaporlariTopluClick
      end
      object mmiVerbisRaporArsivi: TUniMenuItem
        Caption = 'Verbis Raporlar'#305' Ar'#351'ivi'
        HelpContext = 100
        OnClick = mmiVerbisRaporArsiviClick
      end
    end
    object mhaYnetimi1: TUniMenuItem
      Caption = #304'mha Y'#246'netimi'
      object mmiRptVKImhaRaporu: TUniMenuItem
        Caption = 'Veri '#304'mha Raporu'
        HelpContext = 134
        OnClick = mmiRptVKImhaRaporuClick
      end
      object mmiRptVKImhaGecmisi: TUniMenuItem
        Caption = 'Veri '#304'mha Ge'#231'mi'#351'i'
        HelpContext = 134
        OnClick = mmiRptVKImhaGecmisiClick
      end
    end
    object RiskYnetimi1: TUniMenuItem
      Caption = 'Risk Y'#246'netimi'
      object mmiKVKKNETSurecRiskTanim: TUniMenuItem
        Caption = 'Risk De'#287'erlendirme'
        HelpContext = 197
        OnClick = mmiKVKKNETSurecRiskTanimClick
      end
      object SreRiskMevcudDurum1: TUniMenuItem
        Caption = 'Risk Analizi'
        HelpContext = 201
        OnClick = SreRiskMevcudDurum1Click
        CheckItem = True
      end
      object mmiRiskTanimlari: TUniMenuItem
        Caption = 'Risk Tan'#305'mlar'#305
        HelpContext = 194
        OnClick = mmiRiskTanimlariClick
      end
    end
    object mmIhlalYonetimi: TUniMenuItem
      Caption = #304'hlal Y'#246'netimi'
      object mmiIhlalOlaylari: TUniMenuItem
        Caption = #304'hlal Olaylar'#305
        HelpContext = 208
        OnClick = mmiIhlalOlaylariClick
      end
      object mmiIhlalBildirimi: TUniMenuItem
        Caption = #304'hlal Bildirimi'
        HelpContext = 211
        OnClick = mmiIhlalBildirimiClick
      end
    end
    object KvkkPortal1: TUniMenuItem
      Caption = 'Kvkk Portal'
      object mmikvkPortal: TUniMenuItem
        Caption = 'Portal'
        HelpContext = 189
        OnClick = mmikvkPortalClick
      end
    end
    object Edanmanlk1: TUniMenuItem
      Caption = 'E-Dan'#305#351'man'
      object mEdanismanSoru: TUniMenuItem
        Caption = 'E-Dan'#305#351'man Sorular'
        HelpContext = 163
        OnClick = mEdanismanSoruClick
      end
      object EDanmanSoruSetleri1: TUniMenuItem
        Caption = 'E-Dan'#305#351'man Soru Setleri'
        HelpContext = 167
        OnClick = EDanmanSoruSetleri1Click
      end
      object EDanmanSoruSetiCevapla1: TUniMenuItem
        Caption = 'E-Dan'#305#351'man Soru Seti Cevapla'
        HelpContext = 171
        OnClick = EDanmanSoruSetiCevapla1Click
      end
      object DepartmanFonksiyonTanmlar1: TUniMenuItem
        Caption = 'Departman - Fonksiyon Tan'#305'mlar'#305
        HelpContext = 174
        OnClick = DepartmanFonksiyonTanmlar1Click
      end
    end
    object mmilogKontrol: TUniMenuItem
      Caption = 'Log Kontrol'
      object mmiEnvanterLoglari: TUniMenuItem
        Caption = 'Envanter Formlar'#305' Loglar'#305
        HelpContext = 161
        OnClick = mmiEnvanterLoglariClick
      end
      object KontrolListesiLoglar1: TUniMenuItem
        Caption = 'Kontrol Formlar'#305' Loglar'#305
        HelpContext = 179
        OnClick = KontrolListesiLoglar1Click
      end
      object mmiSMSLoglari: TUniMenuItem
        Caption = 'SMS Loglar'#305
        HelpContext = 158
        OnClick = mmiSMSLoglariClick
      end
      object mmiZamanDamgasiLoglari: TUniMenuItem
        Caption = 'Zaman Damgas'#305' Loglar'#305
        HelpContext = 159
        OnClick = mmiZamanDamgasiLoglariClick
      end
      object mmiYetkiMatrisiLoglari: TUniMenuItem
        Caption = 'Yetki Matrisi Loglar'#305
        HelpContext = 162
        OnClick = mmiYetkiMatrisiLoglariClick
      end
      object mmiKullaniciGirisLoglari: TUniMenuItem
        Caption = 'Kullan'#305'c'#305' Giri'#351' Loglar'#305
        HelpContext = 160
        OnClick = mmiKullaniciGirisLoglariClick
      end
    end
    object mmiKurumTanimlari: TUniMenuItem
      Caption = 'Kurum Tan'#305'mlar'#305
      object mmiGrupFirmaBilgileri: TUniMenuItem
        Caption = 'Grup Firma Bilgileri'
        HelpContext = 1
        OnClick = mmiGrupFirmaBilgileriClick
      end
      object mmiVeriSorumlusuBilgileri: TUniMenuItem
        Caption = 'Veri Sorumlusu Bilgileri'
        HelpContext = 3
        OnClick = mmiVeriSorumlusuBilgileriClick
      end
      object mmKurumParametreleri: TUniMenuItem
        Caption = 'Kurum Parametreleri'
        HelpContext = 10
        OnClick = mmKurumParametreleriClick
      end
      object mmiRolTanimlari: TUniMenuItem
        Caption = 'Rol Tan'#305'mlar'#305
        HelpContext = 16
        OnClick = mmiRolTanimlariClick
      end
      object mmiKullaniciTanimlari: TUniMenuItem
        Caption = 'Kullan'#305'c'#305' Tan'#305'mlar'#305
        HelpContext = 12
        OnClick = mmiKullaniciTanimlariClick
      end
      object mmiDepartmanTanimlari: TUniMenuItem
        Caption = 'Departman Tan'#305'mlar'#305
        HelpContext = 6
        OnClick = mmiDepartmanTanimlariClick
      end
      object PortalSayfaAyar1: TUniMenuItem
        Caption = 'Portal Sayfa- Afi'#351' Ayar'#305
        HelpContext = 214
        OnClick = PortalSayfaAyar1Click
      end
      object mmiDuyurular: TUniMenuItem
        Caption = 'Duyurular'
        HelpContext = 142
        OnClick = mmiDuyurularClick
      end
    end
    object Yardm1: TUniMenuItem
      Caption = 'Yard'#305'm'
      object YardmListesi1: TUniMenuItem
        Caption = 'Yard'#305'm Listesi'
        HelpContext = 154
        OnClick = YardmListesi1Click
      end
      object mmiDestek: TUniMenuItem
        Caption = 'Destek'
        HelpContext = 183
        OnClick = mmiDestekClick
      end
    end
  end
end
