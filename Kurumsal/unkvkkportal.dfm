object frmkvkkPortal: TfrmkvkkPortal
  Left = 0
  Top = 0
  ClientHeight = 556
  ClientWidth = 720
  Caption = 'KVKNET portal'
  BorderStyle = bsSingle
  OldCreateOrder = False
  OnKeyDown = UniFormKeyDown
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object PgControl: TUniPageControl
    Left = 0
    Top = 0
    Width = 720
    Height = 456
    Hint = ''
    ActivePage = pgDiger
    Align = alClient
    TabOrder = 0
    object pgDiger: TUniTabSheet
      Hint = ''
      Caption = 'Portal Bilgileri'
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object gbVerisahibiBasVuru: TUniGroupBox
        Left = 32
        Top = 78
        Width = 649
        Height = 96
        Hint = ''
        Caption = 'Veri Sahibi Ba'#351'vuru Formu'
        TabOrder = 0
        object edVSBFormLink: TUniEdit
          Left = 5
          Top = 38
          Width = 307
          Hint = ''
          Text = ''
          TabOrder = 1
          TabStop = False
          ReadOnly = True
        end
        object btnGoToVSBForm: TUniBitBtn
          Left = 318
          Top = 31
          Width = 36
          Height = 36
          Hint = ''
          Caption = ''
          TabOrder = 2
          IconAlign = iaCenter
          Images = MainMod.PrjImgList
          ImageIndex = 24
          OnClick = btnGoToVSBFormClick
        end
        object imgQRCode: TUniImage
          Left = 374
          Top = 17
          Width = 64
          Height = 64
          Hint = ''
          Stretch = True
        end
        object btnQRCode: TUniBitBtn
          Left = 460
          Top = 31
          Width = 160
          Height = 36
          Hint = ''
          Caption = 'Karekodu '#304'ndir'
          TabOrder = 4
          Images = MainMod.PrjImgList
          ImageIndex = 6
          OnClick = btnQRCodeClick
        end
      end
      object gbkvkkportal: TUniGroupBox
        Left = 32
        Top = 176
        Width = 649
        Height = 96
        Hint = ''
        Caption = 'KVKK Portal'#305
        TabOrder = 1
        object edKvkkPortalLink: TUniEdit
          Left = 5
          Top = 42
          Width = 307
          Hint = ''
          Text = ''
          TabOrder = 1
          TabStop = False
          ReadOnly = True
        end
        object UniBitBtn2: TUniBitBtn
          Left = 318
          Top = 35
          Width = 36
          Height = 36
          Hint = ''
          Caption = ''
          TabOrder = 2
          IconAlign = iaCenter
          Images = MainMod.PrjImgList
          ImageIndex = 24
          OnClick = UniBitBtn2Click
        end
        object imgKvkkQRCode: TUniImage
          Left = 374
          Top = 21
          Width = 64
          Height = 64
          Hint = ''
          Stretch = True
        end
        object btnKvkkQRCode: TUniBitBtn
          Left = 460
          Top = 35
          Width = 160
          Height = 36
          Hint = ''
          Caption = 'Karekodu '#304'ndir'
          TabOrder = 4
          Images = MainMod.PrjImgList
          ImageIndex = 6
          OnClick = btnKvkkQRCodeClick
        end
      end
      object gbkvkkPortalDepartman: TUniGroupBox
        Left = 32
        Top = 277
        Width = 649
        Height = 140
        Hint = ''
        Caption = 'KVKK Portal'#305'(Departman)'
        TabOrder = 2
        object edKvkkPortalDeptLink: TUniEdit
          Left = 5
          Top = 38
          Width = 307
          Hint = ''
          Text = ''
          TabOrder = 1
          TabStop = False
          ReadOnly = True
        end
        object UniBitBtn3: TUniBitBtn
          Left = 318
          Top = 31
          Width = 36
          Height = 36
          Hint = ''
          Caption = ''
          TabOrder = 2
          IconAlign = iaCenter
          Images = MainMod.PrjImgList
          ImageIndex = 24
          OnClick = UniBitBtn3Click
        end
        object UniGroupBox1: TUniGroupBox
          AlignWithMargins = True
          Left = 413
          Top = 18
          Width = 231
          Height = 117
          Hint = ''
          Caption = 'KVKK Sayfas'#305
          Align = alRight
          TabOrder = 3
          object UniBitBtn4: TUniBitBtn
            AlignWithMargins = True
            Left = 5
            Top = 18
            Width = 221
            Height = 36
            Hint = ''
            Caption = 'Standart KVKK Sayfas'#305' Olu'#351'tur'
            Align = alTop
            TabOrder = 1
            Images = MainMod.PrjImgList
            ImageIndex = 6
            OnClick = UniBitBtn4Click
          end
          object UniBitBtn5: TUniBitBtn
            AlignWithMargins = True
            Left = 5
            Top = 60
            Width = 221
            Height = 36
            Hint = ''
            Caption = 'Departman KVKK Sayfas'#305' Olu'#351'tur'
            Align = alTop
            TabOrder = 2
            Images = MainMod.PrjImgList
            ImageIndex = 6
            OnClick = UniBitBtn5Click
          end
        end
      end
      object UniGroupBox2: TUniGroupBox
        Left = 32
        Top = 16
        Width = 591
        Height = 56
        Hint = ''
        Caption = 'Ayd'#305'nlatma Metni (T'#252'rk'#231'e)'
        TabOrder = 3
        object edWeb2: TUniDBEdit
          Tag = 9
          Left = 6
          Top = 22
          Width = 307
          Height = 22
          Hint = ''
          DataField = 'krm_web2'
          DataSource = dsMCDef
          CharCase = ecLowerCase
          TabOrder = 1
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleLowerCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
        object btnGoToWeb2: TUniBitBtn
          Left = 318
          Top = 15
          Width = 36
          Height = 36
          Hint = ''
          Caption = ''
          TabOrder = 2
          IconAlign = iaCenter
          Images = MainMod.PrjImgList
          ImageIndex = 24
          OnClick = btnGoToWeb2Click
        end
      end
    end
  end
  object pnlButtons: TUniPanel
    Left = 0
    Top = 456
    Width = 720
    Height = 100
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      720
      100)
    object pnlLog: TUniContainerPanel
      Left = 1
      Top = 1
      Width = 718
      Height = 45
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 1
      object UniLabel4: TUniLabel
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
      object UniLabel5: TUniLabel
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
        TabOrder = 2
      end
      object UniLabel6: TUniLabel
        Left = 257
        Top = 5
        Width = 96
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
        Left = 257
        Top = 23
        Width = 96
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
        Left = 111
        Top = 6
        Width = 150
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
        Left = 111
        Top = 24
        Width = 150
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
        Left = 356
        Top = 5
        Width = 150
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
        Left = 356
        Top = 23
        Width = 150
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
    object btnEdit: TUniBitBtn
      Left = 413
      Top = 56
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'De'#287'i'#351'tir'
      Anchors = [akRight, akBottom]
      TabOrder = 2
      Images = MainMod.PrjImgList
      ImageIndex = 2
      OnClick = btnEditClick
    end
    object btnPost: TUniBitBtn
      Left = 515
      Top = 56
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Kaydet'
      Anchors = [akRight, akBottom]
      TabOrder = 3
      Images = MainMod.PrjImgList
      ImageIndex = 14
      OnClick = btnPostClick
    end
    object btnCancel: TUniBitBtn
      Left = 617
      Top = 56
      Width = 96
      Height = 36
      Hint = ''
      Caption = #304'ptal'
      Anchors = [akRight, akBottom]
      TabOrder = 4
      Images = MainMod.PrjImgList
      ImageIndex = 5
      OnClick = btnCancelClick
    end
    object UniBitBtn1: TUniBitBtn
      Left = 311
      Top = 56
      Width = 96
      Height = 36
      Hint = ''
      Visible = False
      Caption = 'Yard'#305'm'
      Anchors = [akRight, akBottom]
      TabOrder = 5
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = UniBitBtn1Click
    end
  end
  object dsMCDef: TUniDataSource
    AutoEdit = False
    DataSet = MainMod.qMCDef
    Left = 269
    Top = 406
  end
  object FileUp: TUniFileUpload
    Filter = 'image/*'
    Title = 'Resim Y'#252'kle'
    Messages.Uploading = 'Y'#252'kleniyor...'
    Messages.PleaseWait = 'L'#252'tfen Bekleyiniz...'
    Messages.Cancel = #304'ptal'
    Messages.Processing = 'Y'#252'kleniyor...'
    Messages.UploadError = 'Y'#252'kleme Hatas'#305
    Messages.Upload = 'Y'#252'kle'
    Messages.NoFileError = 'L'#252'tfen Resim Dosyas'#305' Se'#231'iniz'
    Messages.BrowseText = 'Se'#231'...'
    Messages.UploadTimeout = 'Timeout occurred...'
    Messages.MaxSizeError = 'File is bigger than maximum allowed size'
    Messages.MaxFilesError = 'You can upload maximum %d files.'
    Width = 400
    OnCompleted = FileUpCompleted
    Left = 200
    Top = 403
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user')
    Left = 70
    Top = 405
  end
  object menuKVKKSayfasi: TUniPopupMenu
    Left = 116
    Top = 408
    object btnKVKKSayfasi: TUniMenuItem
      Caption = 'Standart KVKK Sayfas'#305' Olu'#351'tur'
    end
    object btnKVKKSayfasiDepartman: TUniMenuItem
      Caption = 'Departman KVKK Sayfas'#305' Olu'#351'tur'
    end
  end
  object rptPDF: TfrxReport
    Version = '2023.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44577.819415798600000000
    ReportOptions.LastChange = 45777.497781574070000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 440
    Top = 408
    Datasets = <
      item
        DataSet = fdbVSB
        DataSetName = 'frxdsMCDef'
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
      LeftMargin = 15.000000000000000000
      RightMargin = 15.000000000000000000
      TopMargin = 15.000000000000000000
      BottomMargin = 15.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 963.780150000000000000
        Top = 18.897650000000000000
        Width = 680.315400000000000000
        Stretched = True
        object Rich1: TfrxRichView
          AllowVectorExport = True
          Top = 94.488250000000000000
          Width = 680.314960630000000000
          Height = 283.464750000000000000
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
            5C66305C667332305C7061720D0A5C7061720D0A5B66727864734D434465662E
            226B726D5F756E76616E225D5C66315C7061720D0A0D0A5C706172645C6E6F77
            696463746C7061725C71635C6366305C66305C667332325C6C616E6731303333
            205645525C66325C753330343F205341485C753330343F425C753330343F2042
            415C2761615655525520464F524D555C7061720D0A5C7061720D0A5C7061720D
            0A5C7061720D0A5C66315C667332315C6C616E67313035355C7061720D0A5C70
            61720D0A0D0A5C70617264200D0A7B5C706E746578745C663220312E5C746162
            7D7B5C2A5C706E5C706E6C766C626F64795C706E66325C706E696E64656E7430
            5C706E7374617274315C706E6465637B5C706E747874612E7D7D0D0A5C6E6F77
            696463746C7061725C66692D3334305C6C693832305C7362315C74783834315C
            66305C667332325C6C616E67313033332042615C66325C276261767572755C65
            78706E6474772D3720205C6578706E6474773020595C2766366E74656D695C70
            61720D0A0D0A5C706172645C6E6F77696463746C7061725C6C693132305C7269
            3131335C736233385C736C3237365C736C6D756C74315C716A5C62305C66315C
            6C616E673130353520202020202020205C66325C6C616E673130333320363639
            38207361795C753330353F6C5C753330353F204B695C2762616973656C205665
            72696C6572696E204B6F72756E6D61735C753330353F204B616E756E755C7271
            756F7465206E756E20285C6C64626C71756F74655C62204B616E756E5C62305C
            7264626C71756F746520292031312E204D6164646573696E6465207361795C75
            3330353F6C616E2068616B6C61725C753330353F6E5C753330353F7A206B6170
            73616D5C753330353F6E64616B692074616C65706C6572696E697A692C204B61
            6E756E5C7271756F746520756E2031332E206D61646465736920696C65205665
            726920536F72756D6C7573756E612042615C27626176757275205573756C2076
            6520457361736C61725C753330353F2048616B6B5C753330353F6E6461205465
            626C695C753238373F5C7271756F746520696E20352E206D6164646573692067
            6572655C753238373F696E63652C20695C276261627520666F726D20696C6520
            615C276261615C753238373F5C753330353F646120615C2765375C753330353F
            6B6C616E616E20795C2766366E74656D6C657264656E2062697269796C652062
            615C276261767572756E757A75205C66315C6C616E6731303535204B7572756D
            756D757A615C66325C6C616E67313033332020696C65746562696C697273696E
            697A2E5C7061720D0A0D0A5C706172645C6E6F77696463746C7061725C625C66
            315C667332315C6C616E67313035355C7061720D0A7D0D0A00}
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 302.362400000000000000
          Top = 18.897650000000000000
          Width = 75.590551180000000000
          Height = 75.590551180000000000
          DataField = 'krm_logo'
          DataSet = fdbVSB
          DataSetName = 'frxdsMCDef'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Top = 396.850650000000000000
          Width = 113.385900000000000000
          Height = 56.692950000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 396.850650000000000000
          Width = 151.181200000000000000
          Height = 56.692950000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'BA'#350'VURU Y'#214'NTEM'#304)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 264.567100000000000000
          Top = 396.850650000000000000
          Width = 207.874150000000000000
          Height = 56.692950000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'BA'#350'VURU '
            'YAPILACAK ADRES')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 472.441250000000000000
          Top = 396.850650000000000000
          Width = 207.874150000000000000
          Height = 56.692950000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'BA'#350'VURUDA G'#214'STER'#304'LECEK B'#304'LG'#304)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Top = 453.543600000000000000
          Width = 113.385900000000000000
          Height = 113.385826770000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          Memo.UTF8W = (
            '1. Yaz'#305'l'#305' Olarak Ba'#351'vuru')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Top = 566.929500000000000000
          Width = 113.385900000000000000
          Height = 113.385826770000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          Memo.UTF8W = (
            '2. Kay'#305'tl'#305' Elektronik Posta (KEP) Yolu ile Ba'#351'vuru')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Top = 680.315400000000000000
          Width = 113.385900000000000000
          Height = 113.385826770000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          Memo.UTF8W = (
            '3. Elektronik Posta Adresi ile Ba'#351'vuru')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 453.543600000000000000
          Width = 151.181102360000000000
          Height = 113.385826770000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Islak imzal'#305' '#351'ahsen ba'#351'vuru veya Noter vas'#305'tas'#305'yla')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 264.567100000000000000
          Top = 453.543600000000000000
          Width = 207.874150000000000000
          Height = 113.385826770000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsMCDef."krm_adres1"] [frxdsMCDef."krm_adres2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 472.441250000000000000
          Top = 453.543600000000000000
          Width = 207.874150000000000000
          Height = 113.385826770000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            
              'Zarf'#305'n/tebligat'#305'n '#252'zerine '#8220'Ki'#351'isel Verilerin Korunmas'#305' Kanunu Ka' +
              'psam'#305'nda Bilgi Talebi'#8221' yaz'#305'lacakt'#305'r.')
          ParentFont = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 566.929500000000000000
          Width = 151.181102360000000000
          Height = 113.385826770000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Kay'#305'tl'#305' elektronik posta (KEP) adresi ile')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 264.567100000000000000
          Top = 566.929500000000000000
          Width = 207.874150000000000000
          Height = 113.385826770000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsMCDef."krm_kep"]')
          ParentFont = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 472.441250000000000000
          Top = 566.929500000000000000
          Width = 207.874150000000000000
          Height = 113.385826770000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            
              'E-posta'#8217'n'#305'n konu k'#305'sm'#305'na '#8220'Ki'#351'isel Verilerin Korunmas'#305' Kanunu Bil' +
              'gi Talebi'#8221' yaz'#305'lacakt'#305'r.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 680.315400000000000000
          Width = 151.181102360000000000
          Height = 113.385826770000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            
              'Kurumumuzun sisteminde kay'#305'tl'#305' bulunan elektronik posta adresini' +
              'z kullan'#305'lmak suretiyle')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 264.567100000000000000
          Top = 680.315400000000000000
          Width = 207.874150000000000000
          Height = 113.385826770000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsMCDef."krm_email"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 472.441250000000000000
          Top = 680.315400000000000000
          Width = 207.874150000000000000
          Height = 113.385826770000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            
              'E-posta'#8217'n'#305'n konu k'#305'sm'#305'na '#8220'Ki'#351'isel Verilerin Korunmas'#305' Kanunu Bil' +
              'gi Talebi'#8221' yaz'#305'lacakt'#305'r.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Rich3: TfrxRichView
          AllowVectorExport = True
          Top = 805.039890000000000000
          Width = 680.314960630000000000
          Height = 147.401670000000000000
          StretchMode = smMaxHeight
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235345C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313035357B5C666F6E7474626C7B5C66
            305C666E696C5C66636861727365743136322054696D6573204E657720526F6D
            616E3B7D7D0D0A7B5C2A5C67656E657261746F72205269636865643230203130
            2E302E32363130307D5C766965776B696E64345C756331200D0A5C706172645C
            6E6F77696463746C7061725C6C693132305C72693131335C736C3237365C736C
            6D756C74315C716A5C66305C667332325C6C616E673130333320202020202020
            2054617261665C2766646D5C2766647A6120696C6574696C6D695C276665206F
            6C616E2062615C276665767572756C61725C2766646E5C2766647A204B616E75
            6E5C7271756F746520756E2031335C7271756F74655C2766636E635C27666320
            6D6164646573696E696E20325C7271756F746520696E636920665C2766646B72
            61735C27666420676572655C276630696E63652C2074616C6562696E206E6974
            656C695C276630696E6520675C27663672652074616C6562696E697A696E2062
            697A6C65726520756C615C276665745C2766645C2766305C2766642074617269
            6874656E20697469626172656E206F74757A20675C2766636E20695C27653769
            6E64652079616E5C276664746C616E645C276664725C2766646C6163616B745C
            276664722E2059616E5C276664746C61725C2766646D5C2766647A20696C6769
            6C69204B616E756E5C7271756F746520756E2031335C7271756F74655C276663
            6E635C276663206D61646465736920685C2766636B6D5C27666320676572655C
            276630696E63652079617A5C2766646C5C276664207665796120656C656B7472
            6F6E696B206F7274616D64616E2074617261665C2766646E5C2766647A612075
            6C615C276665745C276664725C2766646C6163616B745C276664722E5C706172
            0D0A0D0A5C706172645C6E6F77696463746C7061725C667332345C6C616E6731
            3035355C7061720D0A7D0D0A00}
        end
      end
    end
    object Page2: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 15.000000000000000000
      RightMargin = 15.000000000000000000
      TopMargin = 15.000000000000000000
      BottomMargin = 15.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object Memo34: TfrxMemoView
        AllowVectorExport = True
        Top = 555.590910000000000000
        Width = 340.157700000000000000
        Height = 75.590600000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        ParentFont = False
        VAlign = vaCenter
      end
      object Rich4: TfrxRichView
        AllowVectorExport = True
        Top = 71.811070000000000000
        Width = 661.417310630000000000
        Height = 68.031540000000000000
        StretchMode = smMaxHeight
        Frame.Typ = []
        GapX = 2.000000000000000000
        GapY = 1.000000000000000000
        RichEdit = {
          7B5C727466315C616E73695C616E7369637067313235345C64656666305C6E6F
          7569636F6D7061745C6465666C616E67313035357B5C666F6E7474626C7B5C66
          305C666E696C5C66636861727365743136322054696D6573204E657720526F6D
          616E3B7D7D0D0A7B5C7374796C6573686565747B204E6F726D616C3B7D7B5C73
          312068656164696E6720313B7D7D0D0A7B5C2A5C67656E657261746F72205269
          6368656432302031302E302E32363130307D5C766965776B696E64345C756331
          200D0A5C706172645C6E6F77696463746C7061725C73315C736236375C747838
          32315C625C66305C667332345C6C616E67313033332020202020202020322E20
          4B696D6C696B207665205C2764646C6574695C276665696D5C6578706E647477
          2D313620205C6578706E647477302042696C67696C6572696E697A5C7061720D
          0A0D0A5C706172645C6E6F77696463746C7061725C6C693130305C736234315C
          6230202020202020204C5C2766637466656E2073697A696E6C6520696C657469
          5C276665696D652067655C2765376562696C6D656D697A207665206B696D6C69
          5C276630696E697A6920646F5C27663072756C61796162696C6D656D697A2061
          645C2766646E6120615C276665615C2766305C27666464616B6920616C616E6C
          61725C27666420646F6C647572756E757A2E5C625C6C616E67313035355C7061
          720D0A7D0D0A00}
      end
      object Memo19: TfrxMemoView
        AllowVectorExport = True
        Top = 151.181200000000000000
        Width = 188.976500000000000000
        Height = 37.795300000000000000
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
        Top = 151.181200000000000000
        Width = 491.338900000000000000
        Height = 37.795300000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo21: TfrxMemoView
        AllowVectorExport = True
        Top = 188.976500000000000000
        Width = 188.976500000000000000
        Height = 75.590600000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Memo.UTF8W = (
          'T.C. Kimlik Numaras'#305' /'
          
            'Di'#287'er '#220'lke Vatanda'#351'lar'#305' i'#231'in Pasaport Numaras'#305' veya Kimlik Numar' +
            'as'#305)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo22: TfrxMemoView
        AllowVectorExport = True
        Left = 188.976500000000000000
        Top = 188.976500000000000000
        Width = 491.338900000000000000
        Height = 75.590600000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo23: TfrxMemoView
        AllowVectorExport = True
        Top = 264.567100000000000000
        Width = 188.976500000000000000
        Height = 75.590600000000000000
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
        Top = 264.567100000000000000
        Width = 491.338900000000000000
        Height = 75.590600000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo25: TfrxMemoView
        AllowVectorExport = True
        Top = 340.157700000000000000
        Width = 188.976500000000000000
        Height = 37.795300000000000000
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
        Top = 340.157700000000000000
        Width = 491.338900000000000000
        Height = 37.795300000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo27: TfrxMemoView
        AllowVectorExport = True
        Top = 377.953000000000000000
        Width = 188.976500000000000000
        Height = 37.795300000000000000
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
        Top = 377.953000000000000000
        Width = 491.338900000000000000
        Height = 37.795300000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo30: TfrxMemoView
        AllowVectorExport = True
        Top = 415.748300000000000000
        Width = 188.976500000000000000
        Height = 37.795300000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Memo.UTF8W = (
          'Faks Numaras'#305)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo31: TfrxMemoView
        AllowVectorExport = True
        Left = 188.976500000000000000
        Top = 415.748300000000000000
        Width = 491.338900000000000000
        Height = 37.795300000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo32: TfrxMemoView
        AllowVectorExport = True
        Top = 453.543600000000000000
        Width = 188.976500000000000000
        Height = 37.795300000000000000
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
        Top = 453.543600000000000000
        Width = 491.338900000000000000
        Height = 37.795300000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        ParentFont = False
        VAlign = vaCenter
      end
      object Rich5: TfrxRichView
        AllowVectorExport = True
        Top = 510.236550000000000000
        Width = 661.417310630000000000
        Height = 45.354360000000000000
        StretchMode = smMaxHeight
        Frame.Typ = []
        GapX = 2.000000000000000000
        GapY = 1.000000000000000000
        RichEdit = {
          7B5C727466315C616E73695C616E7369637067313235345C64656666305C6E6F
          7569636F6D7061745C6465666C616E67313035357B5C666F6E7474626C7B5C66
          305C666E696C5C66636861727365743136322054696D6573204E657720526F6D
          616E3B7D7D0D0A7B5C2A5C67656E657261746F72205269636865643230203130
          2E302E32363130307D5C766965776B696E64345C756331200D0A5C706172645C
          6E6F77696463746C7061725C7362335C625C66305C667332345C6C616E673130
          33332020202020202020332E204C5C2766637466656E204B7572756D756D757A
          20696C65206F6C616E20696C695C2766656B696E697A692062656C697274696E
          697A2E205C7061720D0A202020202020205C62305C6920284D5C2766635C2766
          65746572692C20695C276665206F7274615C2766305C2766642C205C27653761
          6C5C2766645C276665616E20616461795C2766642C2065736B69205C27653761
          6C5C2766645C276665616E2C205C2766635C2765375C2766636E635C27666320
          7461726166206669726D61205C276537616C5C2766645C276665616E5C276664
          2C2068697373656461725C6578706E6474772D3920205C6578706E6474773020
          67696269295C625C69305C6C616E67313035355C7061720D0A7D0D0A00}
      end
      object Memo35: TfrxMemoView
        AllowVectorExport = True
        Left = 340.157700000000000000
        Top = 555.590910000000000000
        Width = 340.157700000000000000
        Height = 75.590600000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        ParentFont = False
        VAlign = vaCenter
      end
      object CheckBox1: TfrxCheckBoxView
        AllowVectorExport = True
        Left = 18.897650000000000000
        Top = 566.929500000000000000
        Width = 18.897650000000000000
        Height = 18.897650000000000000
        CheckColor = clBlack
        Checked = False
        CheckStyle = csCross
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
      end
      object Memo36: TfrxMemoView
        AllowVectorExport = True
        Left = 45.354360000000000000
        Top = 566.929500000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = []
        Memo.UTF8W = (
          'M'#252#351'teri')
        ParentFont = False
        VAlign = vaCenter
      end
      object CheckBox2: TfrxCheckBoxView
        AllowVectorExport = True
        Left = 18.897650000000000000
        Top = 597.165740000000000000
        Width = 18.897650000000000000
        Height = 18.897650000000000000
        CheckColor = clBlack
        Checked = False
        CheckStyle = csCross
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
      end
      object Memo37: TfrxMemoView
        AllowVectorExport = True
        Left = 45.354360000000000000
        Top = 597.165740000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = []
        Memo.UTF8W = (
          'Ziyaret'#231'i')
        ParentFont = False
        VAlign = vaCenter
      end
      object CheckBox3: TfrxCheckBoxView
        AllowVectorExport = True
        Left = 355.275820000000000000
        Top = 566.929500000000000000
        Width = 18.897650000000000000
        Height = 18.897650000000000000
        CheckColor = clBlack
        Checked = False
        CheckStyle = csCross
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
      end
      object Memo38: TfrxMemoView
        AllowVectorExport = True
        Left = 381.732530000000000000
        Top = 566.929500000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = []
        Memo.UTF8W = (
          #304#351' Orta'#287#305)
        ParentFont = False
        VAlign = vaCenter
      end
      object CheckBox4: TfrxCheckBoxView
        AllowVectorExport = True
        Left = 355.275820000000000000
        Top = 597.165740000000000000
        Width = 18.897650000000000000
        Height = 18.897650000000000000
        CheckColor = clBlack
        Checked = False
        CheckStyle = csCross
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
      end
      object Memo39: TfrxMemoView
        AllowVectorExport = True
        Left = 381.732530000000000000
        Top = 597.165740000000000000
        Width = 279.685220000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = []
        Memo.UTF8W = (
          'Di'#287'er: ................................................')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo40: TfrxMemoView
        AllowVectorExport = True
        Top = 631.181510000000000000
        Width = 680.315400000000000000
        Height = 75.590600000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Memo.UTF8W = (
          'Kurumumuz i'#231'erisinde ileti'#351'imde oldu'#287'unuz Birim:'
          
            '................................................................' +
            '................................................................' +
            '................................')
        ParentFont = False
      end
      object Memo41: TfrxMemoView
        AllowVectorExport = True
        Top = 706.772110000000000000
        Width = 680.315400000000000000
        Height = 75.590600000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Memo.UTF8W = (
          'Konu: '
          
            '................................................................' +
            '................................................................' +
            '................................')
        ParentFont = False
      end
      object Memo42: TfrxMemoView
        AllowVectorExport = True
        Top = 805.039890000000000000
        Width = 340.157700000000000000
        Height = 177.637910000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo43: TfrxMemoView
        AllowVectorExport = True
        Left = 340.157700000000000000
        Top = 805.039890000000000000
        Width = 340.157700000000000000
        Height = 177.637910000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        ParentFont = False
        VAlign = vaCenter
      end
      object CheckBox5: TfrxCheckBoxView
        AllowVectorExport = True
        Left = 18.897650000000000000
        Top = 816.378480000000000000
        Width = 18.897650000000000000
        Height = 18.897650000000000000
        CheckColor = clBlack
        Checked = False
        CheckStyle = csCross
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
      end
      object Memo44: TfrxMemoView
        AllowVectorExport = True
        Left = 45.354360000000000000
        Top = 816.378480000000000000
        Width = 219.212740000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = []
        Memo.UTF8W = (
          'Eski '#199'al'#305#351'an'#305'm')
        ParentFont = False
        VAlign = vaCenter
      end
      object CheckBox6: TfrxCheckBoxView
        AllowVectorExport = True
        Left = 18.897650000000000000
        Top = 899.528140000000000000
        Width = 18.897650000000000000
        Height = 18.897650000000000000
        CheckColor = clBlack
        Checked = False
        CheckStyle = csCross
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
      end
      object Memo45: TfrxMemoView
        AllowVectorExport = True
        Left = 45.354360000000000000
        Top = 899.528140000000000000
        Width = 257.008040000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = []
        Memo.UTF8W = (
          'Di'#287'er: ..............................')
        ParentFont = False
        VAlign = vaCenter
      end
      object CheckBox7: TfrxCheckBoxView
        AllowVectorExport = True
        Left = 355.275820000000000000
        Top = 816.378480000000000000
        Width = 18.897650000000000000
        Height = 18.897650000000000000
        CheckColor = clBlack
        Checked = False
        CheckStyle = csCross
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
      end
      object Memo46: TfrxMemoView
        AllowVectorExport = True
        Left = 381.732530000000000000
        Top = 816.378480000000000000
        Width = 291.023810000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = []
        Memo.UTF8W = (
          #304#351' Ba'#351'vurusu / '#214'zge'#231'mi'#351' Payla'#351#305'm'#305' Yapt'#305'm')
        ParentFont = False
        VAlign = vaCenter
      end
      object CheckBox8: TfrxCheckBoxView
        AllowVectorExport = True
        Left = 355.275820000000000000
        Top = 899.528140000000000000
        Width = 18.897650000000000000
        Height = 18.897650000000000000
        CheckColor = clBlack
        Checked = False
        CheckStyle = csCross
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
      end
      object Memo47: TfrxMemoView
        AllowVectorExport = True
        Left = 381.732530000000000000
        Top = 899.528140000000000000
        Width = 279.685220000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = []
        Memo.UTF8W = (
          #220#231#252'nc'#252' Ki'#351'i Firma '#199'al'#305#351'an'#305'y'#305'm')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo48: TfrxMemoView
        AllowVectorExport = True
        Left = 18.897650000000000000
        Top = 842.835190000000000000
        Width = 283.464750000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = []
        Memo.UTF8W = (
          #199'al'#305#351't'#305#287#305'm Y'#305'llar: ..............................')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo49: TfrxMemoView
        AllowVectorExport = True
        Left = 381.732530000000000000
        Top = 842.835190000000000000
        Width = 283.464750000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = []
        Memo.UTF8W = (
          'Tarih: ..............................')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo50: TfrxMemoView
        AllowVectorExport = True
        Left = 355.275820000000000000
        Top = 925.984850000000000000
        Width = 306.141930000000000000
        Height = 56.692950000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        Frame.Typ = []
        Memo.UTF8W = (
          'L'#252'tfen '#231'al'#305#351't'#305#287#305'n'#305'z firma ve pozisyon bilgisini belirtiniz'
          
            '................................................................' +
            '......')
        ParentFont = False
      end
    end
    object Page3: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle2: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 888.189550000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Rich6: TfrxRichView
          AllowVectorExport = True
          Top = 37.795300000000000000
          Width = 718.110700000000000000
          Height = 355.275820000000000000
          StretchMode = smActualHeight
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235345C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313035357B5C666F6E7474626C7B5C66
            305C666E696C5C66636861727365743136322054696D6573204E657720526F6D
            616E3B7D7B5C66315C666E696C5C6663686172736574302054696D6573204E65
            7720526F6D616E3B7D7B5C66325C666E696C5C66636861727365743233382054
            696D6573204E657720526F6D616E3B7D7D0D0A7B5C7374796C6573686565747B
            204E6F726D616C3B7D7B5C73312068656164696E6720313B7D7D0D0A7B5C2A5C
            67656E657261746F722052696368656432302031302E302E32363130307D5C76
            6965776B696E64345C756331200D0A5C706172645C6E6F77696463746C706172
            5C73315C736233375C74783833365C74783833375C625C66305C667332345C6C
            616E67313033332020202020202020342E204C5C2766637466656E204B616E75
            6E206B617073616D5C2766646E64616B692074616C6562696E697A6920646574
            61796C5C276664206F6C6172616B5C6578706E6474772D323220205C6578706E
            647477302062656C697274696E697A3A5C6C616E673130353520205C66315C6C
            616E67313033335C7061720D0A0D0A5C706172645C6E6F77696463746C706172
            5C6C693131365C716A5C7061720D0A5C6230202E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E5C66305C6C616E673130353520
            2E2E2E2E2E2E2E2E2E2E5C66315C6C616E67313033335C7061720D0A2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E5C66305C
            6C616E6731303535202E2E2E2E2E2E2E2E2E2E5C66315C6C616E67313033335C
            7061720D0A2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E5C66305C6C616E6731303535202E2E2E2E2E2E2E2E2E2E5C66315C
            6C616E67313033335C7061720D0A2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E5C66305C6C616E6731303535202E2E2E2E2E
            2E2E2E2E2E5C66315C6C616E67313033335C7061720D0A2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E5C66305C6C616E6731
            303535202E2E2E2E2E2E2E2E2E2E5C66315C6C616E67313033335C7061720D0A
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            5C66305C6C616E6731303535202E2E2E2E2E2E2E2E2E2E5C66315C6C616E6731
            3033335C7061720D0A2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E5C66305C6C616E6731303535202E2E2E2E2E2E2E2E2E2E
            5C66315C6C616E67313033335C7061720D0A2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E5C66305C6C616E6731303535202E
            2E2E2E2E2E2E2E2E2E5C66315C6C616E67313033335C7061720D0A2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E5C66305C6C
            616E6731303535202E2E2E2E2E2E2E2E2E2E5C66315C6C616E67313033335C70
            61720D0A2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E5C66305C6C616E6731303535202E2E2E2E2E2E2E2E2E2E5C66315C6C
            616E67313033335C7061720D0A2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E5C66305C6C616E6731303535202E2E2E2E2E2E
            2E2E2E2E5C66315C6C616E67313033335C7061720D0A2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E5C66305C6C616E673130
            3535202E2E2E2E2E2E2E2E2E2E5C66315C6C616E67313033335C7061720D0A2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E5C
            66305C6C616E6731303535202E2E2E2E2E2E2E2E2E2E5C66315C6C616E673130
            33335C7061720D0A2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E5C66305C6C616E6731303535202E2E2E2E2E2E2E2E2E2E5C
            66315C6C616E67313033335C7061720D0A2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
            2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E5C66305C6C616E6731303535202E2E
            2E2E2E2E2E2E2E2E5C66315C6C616E67313033335C7061720D0A5C7061720D0A
            20202020202020352E205C62204C5C2766637466656E2062615C66325C276261
            767572756E757A61207665726563655C753238373F696D697A2079616E5C7533
            30353F745C753330353F6E2074617261665C753330353F6E5C753330353F7A61
            2062696C646972696C6D6520795C2766366E74656D696E695C6578706E647477
            2D33342020205C6578706E647477302073655C276537696E697A3A5C7061720D
            0A5C62305C7061720D0A7D0D0A00}
        end
        object Rich7: TfrxRichView
          AllowVectorExport = True
          Top = 525.354670000000000000
          Width = 718.110700000000000000
          Height = 211.653680000000000000
          StretchMode = smActualHeight
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235345C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313035357B5C666F6E7474626C7B5C66
            305C666E696C5C66636861727365743233382054696D6573204E657720526F6D
            616E3B7D7B5C66315C666E696C5C66636861727365743136322054696D657320
            4E657720526F6D616E3B7D7D0D0A7B5C2A5C67656E657261746F722052696368
            656432302031302E302E32363130307D5C766965776B696E64345C756331200D
            0A5C706172645C6E6F77696463746C7061725C7362385C695C66305C66733234
            5C6C616E67313033335C7061720D0A0D0A5C706172645C6E6F77696463746C70
            61725C6C693131365C72693131325C736C3237365C736C6D756C74315C716A5C
            69305C753330343F5C27626162755C6578706E6474772D313120205C6578706E
            647477302062615C276261767572755C6578706E6474772D313120205C657870
            6E6474773020666F726D752C5C6578706E6474772D313020205C6578706E6474
            77305C66315C6C616E6731303535204B7572756D756D757A5C6578706E647477
            2D31315C66305C6C616E673130333320205C6578706E6474773020696C655C65
            78706E6474772D313220205C6578706E64747730206F6C616E5C6578706E6474
            772D313220205C6578706E6474773020696C695C2762616B696E697A695C6578
            706E6474772D313120205C6578706E64747730207465737069745C6578706E64
            74772D313020205C6578706E647477302065646572656B2C5C6578706E647477
            2D313320205C6578706E647477302076617273612C5C6578706E6474772D3131
            20205C6578706E647477305C66315C6C616E6731303535204B7572756D756D75
            7A5C6578706E6474772D31315C66305C6C616E673130333320205C6578706E64
            7477302074617261665C753330353F6E64616E5C6578706E6474772D31312020
            5C6578706E6474773020695C2762616C656E656E5C6578706E6474772D313120
            205C6578706E64747730206B695C2762616973656C20766572696C6572696E69
            7A695C6578706E6474772D313120205C6578706E6474773020656B73696B7369
            7A5C6578706E6474772D313120205C6578706E64747730206F6C6172616B5C65
            78706E6474772D313020205C6578706E647477302062656C69726C6579657265
            6B2C5C6578706E6474772D313020205C6578706E6474773020696C67696C695C
            6578706E6474772D313120205C6578706E647477302062615C27626176757275
            6E757A615C6578706E6474772D313120205C6578706E6474773020646F5C7532
            38373F72755C6578706E6474772D313120205C6578706E647477302076655C65
            78706E6474772D313020205C6578706E64747730206B616E756E695C6578706E
            6474772D313120205C6578706E6474773020735C276663726573696E64655C65
            78706E6474772D313020205C6578706E647477302063657661705C6578706E64
            74772D313420205C6578706E6474773020766572696C6562696C6D6573692069
            5C276537696E2074616E7A696D206564696C6D695C2762617469722E2048756B
            756B612061796B5C753330353F725C753330353F2076652068616B735C753330
            353F7A20626972205C276261656B696C64652076657269207061796C615C2762
            615C753330353F6D5C753330353F6E64616E206B61796E616B6C616E6162696C
            6563656B2068756B756B69207269736B6C6572696E2062657274617261662065
            64696C6D657369207665205C2766367A656C6C696B6C65206B695C2762616973
            656C20766572696C6572696E697A696E20675C27666376656E6C695C75323837
            3F696E696E2073615C753238373F6C616E6D61735C753330353F20616D61635C
            753330353F796C612C206B696D6C696B207665207965746B6920746573706974
            6920695C276537696E205C66315C6C616E6731303535204B7572756D756D757A
            5C66305C6C616E67313033332020656B20657672616B207665206D616C756D61
            7420284E5C27666366757320635C2766637A64616E5C753330353F2076657961
            20735C276663725C276663635C2766632062656C676573692073757265746920
            76622E292074616C65702065746D652068616B6B5C753330353F6E5C75333035
            3F2073616B6C5C753330353F2074757461722E20466F726D206B617073616D5C
            753330353F6E646120696C65746D656B7465206F6C64755C753238373F756E75
            7A2074616C65706C6572696E697A6520696C695C2762616B696E2062696C6769
            6C6572696E20646F5C753238373F727520766520675C2766636E63656C206F6C
            6D616D61735C753330353F207961206461207965746B6973697A206269722062
            615C27626176757275207961705C753330353F6C6D61735C753330353F206861
            6C696E6465205C66315C6C616E6731303535204B7572756D756D757A5C66305C
            6C616E6731303333202C20735C2766367A206B6F6E7573752079616E6C5C7533
            30353F5C2762612062696C6769207961206461207965746B6973697A2062615C
            27626176757275206B61796E616B6C5C753330353F2074616C65706C65726465
            6E20646F6C61795C753330353F206D6573756C69796574206B6162756C5C6578
            706E6474772D313420205C6578706E647477302065746D656D656B7465646972
            2E5C7061720D0A0D0A5C706172645C66315C6C616E67313035355C7061720D0A
            7D0D0A00}
        end
        object CheckBox9: TfrxCheckBoxView
          AllowVectorExport = True
          Left = 37.795300000000000000
          Top = 396.850650000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo51: TfrxMemoView
          AllowVectorExport = True
          Left = 64.252010000000000000
          Top = 396.850650000000000000
          Width = 351.496290000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Adresime g'#246'nderilmesini istiyorum.')
          ParentFont = False
          VAlign = vaCenter
        end
        object CheckBox10: TfrxCheckBoxView
          AllowVectorExport = True
          Left = 37.795300000000000000
          Top = 427.086890000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo52: TfrxMemoView
          AllowVectorExport = True
          Left = 64.252010000000000000
          Top = 427.086890000000000000
          Width = 351.496290000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'E-posta adresime g'#246'nderilmesini istiyorum.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795300000000000000
          Top = 445.984540000000000000
          Width = 491.338900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = []
          Memo.UTF8W = (
            
              '(E-posta y'#246'ntemini se'#231'meniz h'#226'linde size daha h'#305'zl'#305' yan'#305't verebi' +
              'lece'#287'iz.)')
          ParentFont = False
        end
        object CheckBox11: TfrxCheckBoxView
          AllowVectorExport = True
          Left = 37.795300000000000000
          Top = 476.220780000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo54: TfrxMemoView
          AllowVectorExport = True
          Left = 64.252010000000000000
          Top = 476.220780000000000000
          Width = 351.496290000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Elden teslim almak istiyorum.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795300000000000000
          Top = 495.118430000000000000
          Width = 680.315400000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = []
          Memo.UTF8W = (
            
              '(Vek'#226'leten teslim al'#305'nmas'#305' durumunda noter tasdikli vek'#226'letname ' +
              'veya yetki belgesi olmas'#305' gerekmektedir.)')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          AllowVectorExport = True
          Left = 18.897650000000000000
          Top = 774.803650000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Ba'#351'vuru Sahibi (Ki'#351'isel Veri Sahibi) ')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          AllowVectorExport = True
          Left = 18.897650000000000000
          Top = 805.039890000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Ad'#305' Soyad'#305)
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          AllowVectorExport = True
          Left = 18.897650000000000000
          Top = 835.276130000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Ba'#351'vuru Tarihi')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          AllowVectorExport = True
          Left = 18.897650000000000000
          Top = 861.732840000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            #304'mza')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          AllowVectorExport = True
          Left = 139.842610000000000000
          Top = 805.039890000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ':')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          AllowVectorExport = True
          Left = 139.842610000000000000
          Top = 835.276130000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ':')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          AllowVectorExport = True
          Left = 139.842610000000000000
          Top = 861.732840000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ':')
          ParentFont = False
        end
      end
    end
  end
  object fdbVSB: TfrxDBDataset
    UserName = 'frxdsMCDef'
    CloseDataSource = False
    DataSource = dsMCDef
    BCDToCurrency = False
    DataSetOptions = []
    Left = 488
    Top = 408
  end
  object frxPDFExport: TfrxPDFExport
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
    Left = 328
    Top = 408
  end
end
