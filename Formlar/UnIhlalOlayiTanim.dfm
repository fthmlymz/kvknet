object frmIhlalOlayi: TfrmIhlalOlayi
  Left = 0
  Top = 0
  ClientHeight = 719
  ClientWidth = 1537
  Caption = #304'hlal Olay Tan'#305'm'#305
  WindowState = wsMaximized
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  ActiveControl = btnCancel
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object UniPanel1: TUniPanel
    Left = 987
    Top = 0
    Width = 550
    Height = 666
    Hint = ''
    Align = alRight
    TabOrder = 0
    ShowCaption = False
    Caption = ''
    object pnlsurec: TUniPanel
      Left = 1
      Top = 1
      Width = 548
      Height = 664
      Hint = ''
      Align = alClient
      TabOrder = 1
      TitleVisible = True
      Title = 'S'#252're'#231'ler'
      Caption = ''
      Layout = 'vbox'
      object UniPanel5: TUniPanel
        Left = 1
        Top = 1
        Width = 546
        Height = 212
        Hint = ''
        Align = alTop
        TabOrder = 2
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        AlignmentControl = uniAlignmentClient
        ParentAlignmentControl = False
        Layout = 'fit'
        LayoutConfig.Flex = 6
        object UniPanel3: TUniPanel
          Left = 0
          Top = 0
          Width = 546
          Height = 35
          Hint = ''
          Align = alTop
          TabOrder = 2
          BorderStyle = ubsNone
          ShowCaption = False
          Caption = ''
          ParentAlignmentControl = False
          Layout = 'fit'
          object btnSurecAdd: TUniBitBtn
            AlignWithMargins = True
            Left = 473
            Top = 3
            Width = 25
            Height = 29
            Hint = 'Risk i'#231'in bir tedbir ekler'
            Margins.Right = 10
            ShowHint = True
            ParentShowHint = False
            Caption = ''
            Align = alRight
            TabOrder = 0
            Images = MainMod.BtnImgList
            ImageIndex = 0
            OnClick = btnSurecAddClick
          end
          object btnsurecdelete: TUniBitBtn
            AlignWithMargins = True
            Left = 511
            Top = 3
            Width = 25
            Height = 29
            Hint = 'Riske ba'#287'l'#305' tedbiri siler'
            Margins.Right = 10
            ShowHint = True
            ParentShowHint = False
            Caption = ''
            Align = alRight
            TabOrder = 2
            Images = MainMod.BtnImgList
            ImageIndex = 5
            OnClick = btnsurecdeleteClick
          end
        end
        object UniDBGrid2: TUniDBGrid
          Left = 0
          Top = 35
          Width = 546
          Height = 177
          Hint = ''
          TitleFont.OverrideDefaults = [ovFontHeight]
          DataSource = dsvqsurec
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
          WebOptions.Paged = False
          LoadMask.Enabled = False
          LoadMask.ShowMessage = False
          LoadMask.Message = 'Loading data...'
          ForceFit = True
          BorderStyle = ubsNone
          Align = alClient
          Font.OverrideDefaults = [ovFontHeight]
          ParentFont = False
          TabOrder = 1
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
        Top = 413
        Width = 546
        Height = 250
        Hint = ''
        Align = alClient
        TabOrder = 1
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        Layout = 'fit'
        LayoutConfig.Flex = 4
        object UniDBGrid3: TUniDBGrid
          Left = 0
          Top = 0
          Width = 546
          Height = 250
          Hint = ''
          HeaderTitle = 'Kaynak'
          TitleFont.OverrideDefaults = [ovFontHeight]
          DataSource = dsvqkaynak
          WebOptions.Paged = False
          LoadMask.ShowMessage = False
          LoadMask.Message = 'Loading data...'
          ForceFit = True
          BorderStyle = ubsNone
          Align = alClient
          Font.OverrideDefaults = [ovFontHeight]
          ParentFont = False
          TabOrder = 1
          Columns = <
            item
              FieldName = 'Sec'
              Title.Caption = 'Se'#231'im'
              Title.Font.OverrideDefaults = [ovFontHeight]
              Width = 100
              Font.OverrideDefaults = [ovFontHeight]
              CheckBoxField.AutoPost = True
              CheckBoxField.FieldValues = 'E;H'
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
      object pnlilgilikisi: TUniPanel
        Left = 1
        Top = 213
        Width = 546
        Height = 200
        Hint = ''
        Align = alTop
        TabOrder = 3
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        Layout = 'fit'
        object UniDBGrid1: TUniDBGrid
          Left = 0
          Top = 0
          Width = 546
          Height = 200
          Hint = ''
          HeaderTitle = #304'lgili Ki'#351'i'
          TitleFont.OverrideDefaults = [ovFontHeight]
          DataSource = dsilgilikisi
          WebOptions.Paged = False
          LoadMask.ShowMessage = False
          LoadMask.Message = 'Loading data...'
          ForceFit = True
          BorderStyle = ubsNone
          Align = alClient
          Font.OverrideDefaults = [ovFontHeight]
          ParentFont = False
          TabOrder = 1
          Columns = <
            item
              FieldName = 'Sec'
              Title.Caption = 'Se'#231'im'
              Title.Font.OverrideDefaults = [ovFontHeight]
              Width = 100
              Font.OverrideDefaults = [ovFontHeight]
              CheckBoxField.AutoPost = True
              CheckBoxField.FieldValues = 'E;H'
              Menu.MenuEnabled = False
            end
            item
              FieldName = 'kisi'
              Title.Caption = #304'lgili kisi'
              Title.Font.OverrideDefaults = [ovFontHeight]
              Width = 500
              Font.OverrideDefaults = [ovFontHeight]
              ReadOnly = True
            end>
        end
      end
    end
  end
  object pnlButtons: TUniPanel
    Left = 0
    Top = 666
    Width = 1537
    Height = 53
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    object pnllog: TUniPanel
      Left = 1
      Top = 1
      Width = 544
      Height = 51
      Hint = ''
      Align = alLeft
      TabOrder = 1
      BorderStyle = ubsNone
      ShowCaption = False
      Caption = ''
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
        TabOrder = 1
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
        TabOrder = 2
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
        TabOrder = 3
      end
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
        TabOrder = 4
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
        TabOrder = 5
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
        TabOrder = 6
      end
      object lbSDT: TUniLabel
        Left = 439
        Top = 24
        Width = 200
        Height = 13
        Hint = ''
        AutoSize = False
        Caption = 'lbSDT'
        ParentFont = False
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 7
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
        TabOrder = 8
      end
    end
    object pnlbutton: TUniPanel
      Left = 545
      Top = 1
      Width = 991
      Height = 51
      Hint = ''
      Align = alClient
      TabOrder = 2
      BorderStyle = ubsNone
      ShowCaption = False
      Caption = ''
      object btnCancel: TUniBitBtn
        AlignWithMargins = True
        Left = 885
        Top = 3
        Width = 96
        Height = 45
        Hint = ''
        Margins.Right = 10
        Caption = #304'ptal'
        Align = alRight
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabStop = False
        TabOrder = 2
        Images = MainMod.PrjImgList
        ImageIndex = 5
        OnClick = btnCancelClick
      end
      object btnHelp: TUniBitBtn
        AlignWithMargins = True
        Left = 681
        Top = 3
        Width = 96
        Height = 45
        Hint = ''
        Caption = 'Yard'#305'm'
        Align = alRight
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabStop = False
        TabOrder = 3
        Images = MainMod.PrjImgList
        ImageIndex = 16
        OnClick = btnHelpClick
      end
      object btnPost: TUniBitBtn
        AlignWithMargins = True
        Left = 783
        Top = 3
        Width = 96
        Height = 45
        Hint = ''
        Caption = 'Kaydet'
        Align = alRight
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
        Images = MainMod.PrjImgList
        ImageIndex = 14
        OnClick = btnPostClick
      end
    end
  end
  object pgControl: TUniPageControl
    Left = 0
    Top = 0
    Width = 987
    Height = 666
    Hint = ''
    ActivePage = tsihlalgenel
    Align = alClient
    TabOrder = 2
    object tsihlalgenel: TUniTabSheet
      Hint = ''
      Caption = #304'hlal Olay'#305' Tespit'
      AutoScroll = True
      ScrollHeight = 1579
      ScrollWidth = 1092
      ScrollY = 758
      object scroll: TUniScrollBox
        Left = -16
        Top = -109
        Width = 1108
        Height = 930
        Hint = ''
        TabOrder = 0
        ScrollHeight = 883
        ScrollWidth = 941
        object UniLabel8: TUniLabel
          Left = 26
          Top = 64
          Width = 100
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = #304'hlal '#304#231'eri'#287'i'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 0
        end
        object UniLabel34: TUniLabel
          Left = 0
          Top = 38
          Width = 126
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Kullan'#305'c'#305' G'#246'rev/'#220'nvan'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
        end
        object UniLabel5: TUniLabel
          Left = 67
          Top = 324
          Width = 61
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Veri '#304#351'leyen'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 2
        end
        object UniLabel7: TUniLabel
          Left = 28
          Top = 632
          Width = 100
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = #304'hlal Tespiti'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 3
        end
        object UniLabel2: TUniLabel
          Left = 67
          Top = 203
          Width = 59
          Height = 13
          Hint = ''
          Caption = 'Tespit Tarihi'
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 4
        end
        object UniLabel29: TUniLabel
          Left = 28
          Top = 347
          Width = 100
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Veri '#304#351'leyen Adres'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 5
        end
        object UniLabel33: TUniLabel
          Left = 75
          Top = 10
          Width = 51
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Kullan'#305'c'#305
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 6
        end
        object UniLabel1: TUniLabel
          Left = 74
          Top = 172
          Width = 52
          Height = 13
          Hint = ''
          Caption = 'Biti'#351' Tarihi'
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 7
        end
        object edkulGorUnvan: TUniDBEdit
          Left = 142
          Top = 35
          Width = 423
          Height = 25
          Hint = ''
          DataField = 'kullanici_gorev_unvan'
          DataSource = dsdata
          CharCase = ecUpperCase
          CharCaseConversion = uccTurkish
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 8
        end
        object UniDBMemo1: TUniDBMemo
          Left = 143
          Top = 630
          Width = 798
          Height = 84
          Hint = ''
          DataField = 'ihlal_tespiti'
          DataSource = dsdata
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 9
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase('#39'tr'#39')); '#13#10'  sender.inputEl.' +
              'dom.setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniDBMemo2: TUniDBMemo
          Left = 142
          Top = 63
          Width = 798
          Height = 65
          Hint = ''
          DataField = 'ihlal_icerigi'
          DataSource = dsdata
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 10
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase('#39'tr'#39')); '#13#10'  sender.inputEl.' +
              'dom.setSelectionRange(pos, pos);'#13#10'}')
        end
        object edtarih: TUniLabel
          Left = 47
          Top = 141
          Width = 79
          Height = 13
          Hint = ''
          Caption = 'Ba'#351'lang'#305#231' Tarihi'
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 11
        end
        object UniDBDateTimePicker1: TUniDBDateTimePicker
          Left = 142
          Top = 134
          Width = 263
          Height = 25
          Hint = ''
          DataField = 'baslangic_tarihi'
          DataSource = dsdata
          DateTime = 45616.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Kind = tUniDateTime
          TabOrder = 12
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
        end
        object UniDBDateTimePicker2: TUniDBDateTimePicker
          Left = 142
          Top = 165
          Width = 263
          Height = 25
          Hint = ''
          DataField = 'bitis_tarihi'
          DataSource = dsdata
          DateTime = 45616.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Kind = tUniDateTime
          TabOrder = 13
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
        end
        object UniDBDateTimePicker3: TUniDBDateTimePicker
          Left = 142
          Top = 196
          Width = 263
          Height = 25
          Hint = ''
          DataField = 'tespit_tarihi'
          DataSource = dsdata
          DateTime = 45616.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Kind = tUniDateTime
          TabOrder = 14
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
        end
        object edkullanici: TUniEdit
          Left = 142
          Top = 8
          Width = 423
          Height = 25
          Hint = ''
          Enabled = False
          CharCaseConversion = uccTurkish
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 15
          EmptyText = 'Kullan'#305'c'#305
        end
        object mmAciklama: TUniDBMemo
          Left = 142
          Top = 347
          Width = 425
          Height = 50
          Hint = ''
          DataField = 'veri_isleyen_adresi'
          DataSource = dsdata
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 16
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase('#39'tr'#39')); '#13#10'  sender.inputEl.' +
              'dom.setSelectionRange(pos, pos);'#13#10'}')
        end
        object edveriisleyen: TUniDBEdit
          Left = 142
          Top = 319
          Width = 425
          Height = 25
          Hint = ''
          DataField = 'veri_isleyen'
          DataSource = dsdata
          CharCase = ecUpperCase
          CharCaseConversion = uccTurkish
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 17
        end
        object UniLabel15: TUniLabel
          Left = 711
          Top = 404
          Width = 210
          Height = 13
          Hint = ''
          AutoSize = False
          Caption = #304'hlal Kayna'#287#305' Detayl'#305' A'#231#305'klama'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 18
        end
        object UniLabel3: TUniLabel
          Left = 30
          Top = 404
          Width = 84
          Height = 13
          Hint = ''
          AutoSize = False
          Caption = #304'hlal Kayna'#287#305
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 19
        end
        object UniLabel4: TUniLabel
          Left = 387
          Top = 404
          Width = 76
          Height = 13
          Hint = ''
          AutoSize = False
          Caption = 'Siber Sald'#305'r'#305
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 20
        end
        object grdihlalkaynagi: TUniDBGrid
          Left = 30
          Top = 423
          Width = 351
          Height = 136
          Hint = ''
          DataSource = dsihlalkaynagi
          Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
          WebOptions.Paged = False
          LoadMask.ShowMessage = False
          LoadMask.Message = 'Loading data...'
          TabOrder = 21
          Columns = <
            item
              Flex = 1
              FieldName = 'sec'
              Title.Caption = 'sec'
              Width = 34
              Font.OverrideDefaults = [ovFontHeight]
            end
            item
              Flex = 4
              FieldName = 'parameter'
              Title.Caption = 'parameter'
              Width = 604
              Font.OverrideDefaults = [ovFontHeight]
            end>
        end
        object grdsibersaldiri: TUniDBGrid
          Left = 387
          Top = 423
          Width = 318
          Height = 136
          Hint = ''
          DataSource = dssibersaldiri
          Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
          WebOptions.Paged = False
          LoadMask.ShowMessage = False
          LoadMask.Message = 'Loading data...'
          ForceFit = True
          TabOrder = 22
          Columns = <
            item
              Flex = 1
              FieldName = 'sec'
              Title.Caption = 'sec'
              Width = 34
              Font.OverrideDefaults = [ovFontHeight]
            end
            item
              Flex = 4
              FieldName = 'parameter'
              Title.Caption = 'parameter'
              Width = 604
              Font.OverrideDefaults = [ovFontHeight]
            end>
        end
        object UniDBMemo3: TUniDBMemo
          Left = 711
          Top = 423
          Width = 230
          Height = 134
          Hint = ''
          DataField = 'ihlal_kaynagi_aciklama'
          DataSource = dsdata
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 23
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase('#39'tr'#39')); '#13#10'  sender.inputEl.' +
              'dom.setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel36: TUniLabel
          Left = 47
          Top = 237
          Width = 855
          Height = 13
          Hint = ''
          AutoSize = False
          Caption = 
            'Ki'#351'isel veri ihlali '#351#252'phesi olay veri i'#351'leyen taraf'#305'ndan sizlere' +
            ' bildirildiyse (Yaz'#305', e-posta mesaj'#305' vb. tevsik edici belgeleri ' +
            'bu formu ek olarak ekleyiniz.)'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 24
        end
        object edfileName: TUniDBEdit
          Left = 142
          Top = 259
          Width = 393
          Height = 25
          Hint = ''
          DataField = 'dosya_adi'
          DataSource = dsVsBilDosya
          CharCase = ecLowerCase
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 25
          ReadOnly = True
        end
        object UniSpeedButton1: TUniSpeedButton
          Left = 541
          Top = 257
          Width = 34
          Height = 29
          Hint = ''
          Caption = ''
          ParentColor = False
          IconAlign = iaCenter
          Images = MainMod.PrjImgList
          ImageIndex = 18
          TabOrder = 26
          OnClick = UniSpeedButton1Click
        end
        object edDosya: TUniLabel
          Left = 95
          Top = 265
          Width = 31
          Height = 13
          Hint = ''
          Caption = 'Dosya'
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 27
        end
        object UniDBDateTimePicker4: TUniDBDateTimePicker
          Left = 142
          Top = 288
          Width = 263
          Height = 25
          Hint = ''
          DataField = 'tespit_tarihi'
          DataSource = dsdata
          DateTime = 45616.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Kind = tUniDateTime
          TabOrder = 28
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
        end
        object UniLabel35: TUniLabel
          Left = 3
          Top = 284
          Width = 123
          Height = 35
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Veri Sorumlusuna Bildirim Tarihi'
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 29
        end
        object UniSpeedButton2: TUniSpeedButton
          Left = 581
          Top = 257
          Width = 34
          Height = 29
          Hint = ''
          Caption = ''
          ParentColor = False
          IconAlign = iaCenter
          Images = MainMod.PrjImgList
          ImageIndex = 1
          TabOrder = 30
          OnClick = UniSpeedButton2Click
        end
        object UniLabel37: TUniLabel
          Left = 47
          Top = 568
          Width = 855
          Height = 13
          Hint = ''
          AutoSize = False
          Caption = 
            'Ki'#351'isel veri ihlali '#351#252'phesi olay'#305'n nas'#305'l tespit edildi'#287'i hakk'#305'nd' +
            'a bilgi veriniz. (Varsa tevsik edici belgeleri bu form ek olarak' +
            ' ekleyiniz.)'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 31
        end
        object grdverietki: TUniDBGrid
          Left = 30
          Top = 740
          Width = 423
          Height = 93
          Hint = ''
          DataSource = dsverietki
          Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
          WebOptions.Paged = False
          LoadMask.ShowMessage = False
          LoadMask.Message = 'Loading data...'
          ForceFit = True
          TabOrder = 32
          Columns = <
            item
              Flex = 1
              FieldName = 'sec'
              Title.Caption = 'sec'
              Width = 34
              Font.OverrideDefaults = [ovFontHeight]
            end
            item
              Flex = 4
              FieldName = 'parameter'
              Title.Caption = 'parameter'
              Width = 604
              Font.OverrideDefaults = [ovFontHeight]
            end>
        end
        object UniDBMemo4: TUniDBMemo
          Left = 460
          Top = 739
          Width = 480
          Height = 94
          Hint = ''
          DataField = 'ihlal_etki_aciklama'
          DataSource = dsdata
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 33
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase('#39'tr'#39')); '#13#10'  sender.inputEl.' +
              'dom.setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel16: TUniLabel
          Left = 460
          Top = 722
          Width = 162
          Height = 13
          Hint = ''
          AutoSize = False
          Caption = 'Veri Etkisi Detayl'#305' A'#231#305'klama'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 34
        end
        object UniLabel6: TUniLabel
          Left = 52
          Top = 722
          Width = 76
          Height = 13
          Hint = ''
          AutoSize = False
          Caption = 'Veri Etkisi'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 35
        end
        object edtespitevrak: TUniDBEdit
          Left = 143
          Top = 589
          Width = 393
          Height = 25
          Hint = ''
          DataField = 'dosya_adi'
          DataSource = dsTesbitEvrak
          CharCase = ecLowerCase
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 36
          ReadOnly = True
        end
        object UniLabel38: TUniLabel
          Left = 97
          Top = 595
          Width = 31
          Height = 13
          Hint = ''
          Caption = 'Dosya'
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 37
        end
        object UniSpeedButton3: TUniSpeedButton
          Left = 542
          Top = 587
          Width = 34
          Height = 29
          Hint = ''
          Caption = ''
          ParentColor = False
          IconAlign = iaCenter
          Images = MainMod.PrjImgList
          ImageIndex = 18
          TabOrder = 38
          OnClick = UniSpeedButton3Click
        end
        object btbildirimevrak: TUniSpeedButton
          Left = 582
          Top = 587
          Width = 34
          Height = 29
          Hint = ''
          Caption = ''
          ParentColor = False
          IconAlign = iaCenter
          Images = MainMod.PrjImgList
          ImageIndex = 1
          TabOrder = 39
          OnClick = btbildirimevrakClick
        end
        object UniDBCheckBox1: TUniDBCheckBox
          Left = 144
          Top = 858
          Width = 28
          Height = 25
          Hint = ''
          DataField = 'kisisel_veri_ihlali'
          DataSource = dsdata
          ValueChecked = 'E'
          ValueUnchecked = 'H'
          Caption = ''
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 40
          ParentColor = False
          Color = clBtnFace
          FieldLabelWidth = 150
        end
        object UniLabel39: TUniLabel
          Left = 4
          Top = 863
          Width = 124
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Ki'#351'isel Veri ihlali'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 41
        end
      end
    end
    object tsetki: TUniTabSheet
      Hint = ''
      AlignmentControl = uniAlignmentClient
      ParentAlignmentControl = False
      Caption = #304'hlal Tan'#305'mlar'#305' Ayr'#305'nt'#305
      AutoScroll = True
      ScrollHeight = 489
      ScrollWidth = 955
      object UniDBMemo6: TUniDBMemo
        Left = 45
        Top = 173
        Width = 910
        Height = 50
        Hint = ''
        DataField = 'ihlal_etki_kisigrup_aciklama'
        DataSource = dsdata
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 0
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase('#39'tr'#39')); '#13#10'  sender.inputEl.' +
            'dom.setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniDBMemo7: TUniDBMemo
        Left = 474
        Top = 269
        Width = 481
        Height = 220
        Hint = ''
        DataField = 'ihlal_etki_ilgili_kisi_aciklama'
        DataSource = dsdata
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase('#39'tr'#39')); '#13#10'  sender.inputEl.' +
            'dom.setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel18: TUniLabel
        Left = 45
        Top = 154
        Width = 461
        Height = 13
        Hint = ''
        Caption = 
          #304'hlalden etkilenen ilgili ki'#351'i gruplar'#305' s'#252're'#231'lerden gelecek olup' +
          ' detay a'#231#305'klamalar'#305'n'#305'z'#305' giriniz'
        ParentFont = False
        Font.Color = clMaroon
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
      end
      object UniLabel19: TUniLabel
        Left = 45
        Top = 244
        Width = 142
        Height = 13
        Hint = ''
        Caption = #304'lgili ki'#351'iler '#252'zerindeki etkisi'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
      end
      object UniLabel20: TUniLabel
        Left = 474
        Top = 244
        Width = 159
        Height = 13
        Hint = ''
        Caption = #304'lgili ki'#351'iler '#252'zerindeki a'#231#305'klama'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 5
      end
      object grdilgilikisietki: TUniDBGrid
        Left = 45
        Top = 269
        Width = 423
        Height = 220
        Hint = ''
        DataSource = dskisiseletki
        Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
        WebOptions.Paged = False
        LoadMask.ShowMessage = False
        LoadMask.Message = 'Loading data...'
        ForceFit = True
        TabOrder = 1
        Columns = <
          item
            Flex = 1
            FieldName = 'sec'
            Title.Caption = 'sec'
            Width = 34
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            Flex = 4
            FieldName = 'parameter'
            Title.Caption = 'parameter'
            Width = 604
            Font.OverrideDefaults = [ovFontHeight]
          end>
      end
      object UniDBMemo5: TUniDBMemo
        Left = 177
        Top = 62
        Width = 778
        Height = 76
        Hint = ''
        DataField = 'ihlal_etkis_sayi_aciklama'
        DataSource = dsdata
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 6
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase('#39'tr'#39')); '#13#10'  sender.inputEl.' +
            'dom.setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniDBNumberEdit1: TUniDBNumberEdit
        Left = 177
        Top = 8
        Width = 156
        Height = 22
        Hint = ''
        DataField = 'etkilenen_kisi_sayisi'
        DataSource = dsdata
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 7
        DecimalSeparator = ','
      end
      object UniDBNumberEdit2: TUniDBNumberEdit
        Left = 177
        Top = 36
        Width = 156
        Height = 20
        Hint = ''
        DataField = 'etkilenen_kayit_sayisi'
        DataSource = dsdata
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 8
        DecimalSeparator = ','
      end
      object UniLabel13: TUniLabel
        Left = 96
        Top = 12
        Width = 65
        Height = 18
        Hint = ''
        AutoSize = False
        Caption = 'E. Ki'#351'i say'#305's'#305
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 9
      end
      object UniLabel14: TUniLabel
        Left = 56
        Top = 37
        Width = 105
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'E. Kay'#305't Say'#305's'#305
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 10
      end
      object UniLabel17: TUniLabel
        Left = 31
        Top = 66
        Width = 130
        Height = 69
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 
          'Ki'#351'i ve/veya Kay'#305't Say'#305'lar'#305' Tahmini ise Kesin say'#305'lar'#305'n tespit e' +
          'dilememe nedenini a'#231#305'klay'#305'n'#305'z.'
        ParentFont = False
        Font.Color = clMaroon
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 11
      end
    end
    object tsolasisonuc: TUniTabSheet
      Hint = ''
      Caption = #304'hlal Olas'#305' Sonu'#231'lar'#305
      object rgRiskSeviyekisi: TUniRadioGroup
        Left = 19
        Top = 63
        Width = 878
        Height = 51
        Hint = 
          #199'ok Y'#252'ksek : '#304'lgili ki'#351'iler '#252'stesinden gelemeyecekleri zorluklar' +
          ' ve geri d'#246'nd'#252'r'#252'lemez sonu'#231'lar ile kar'#351#305'la'#351'abilir ('#304#351'in durmas'#305',' +
          ' uzun s'#252'reli psikolojik veya fiziksel rahats'#305'zl'#305'k, '#246'l'#252'm vb.)'
        ShowHint = True
        ParentShowHint = False
        BodyRTL = True
        Items.Strings = (
          'B'#304'L'#304'NM'#304'YOR '
          'D'#220#350#220'K R'#304'SK'
          'ORTA R'#304'SK'
          'Y'#220'KSEK R'#304'SK'
          #199'OK Y'#220'KSEK')
        Caption = ''
        TabOrder = 0
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        Columns = 5
      end
      object rgRiskSeviyeKurum: TUniRadioGroup
        Left = 19
        Top = 276
        Width = 878
        Height = 48
        Hint = #199'ok Y'#252'ksek :Her t'#252'rl'#252' hizmet sunma yetisinin kaybedilmesi.'
        ShowHint = True
        ParentShowHint = False
        BodyRTL = True
        Items.Strings = (
          'B'#304'L'#304'NM'#304'YOR '
          'D'#220#350#220'K R'#304'SK'
          'KABUL ED'#304'LEB'#304'L'#304'R R'#304'SK'
          'ORTA R'#304'SK'
          'Y'#220'KSEK R'#304'SK'
          'KR'#304'T'#304'K R'#304'SK')
        Caption = ''
        TabOrder = 2
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        Columns = 6
      end
      object UniDBMemo8: TUniDBMemo
        Left = 19
        Top = 163
        Width = 878
        Height = 77
        Hint = ''
        DataField = 'olasi_kisisel_sonuc_aciklama'
        DataSource = dsdata
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase('#39'tr'#39')); '#13#10'  sender.inputEl.' +
            'dom.setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniDBMemo9: TUniDBMemo
        Left = 19
        Top = 360
        Width = 878
        Height = 77
        Hint = ''
        DataField = 'olasi_kurumsal_sonuc_aciklama'
        DataSource = dsdata
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase('#39'tr'#39')); '#13#10'  sender.inputEl.' +
            'dom.setSelectionRange(pos, pos);'#13#10'}')
      end
      object lbaciklama: TUniLabel
        Left = 19
        Top = 13
        Width = 878
        Height = 57
        Hint = ''
        AutoSize = False
        Caption = 
          #304'hlal sebebiyle ilgili ki'#351'ilerin '#246'nemli olumsuz etkilere maruz k' +
          'alma olas'#305'l'#305#287#305' (Ger'#231'ekle'#351'en veri ihlalinin d'#252'zeyinin belirlenmes' +
          'inde ilgili ki'#351'iler '#252'zerinde ne kadar bir potansiyel etkiye nede' +
          'n oldu'#287'unun de'#287'erlendirilmesi gerekmektedir. S'#246'z konusu potansiy' +
          'el etkinin de'#287'erlendirilmesinde ise ihlalin niteli'#287'i, nedeni, ih' +
          'lale maruz kalan verinin t'#252'r'#252', ihlalin etkisinin azalt'#305'lmas'#305'nda ' +
          'al'#305'nan '#246'nlemler ile ihlalden etkilenen ilgili ki'#351'i kategorileri ' +
          'g'#246'z '#246'n'#252'nde bulundurulmal'#305'd'#305'r.)'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
      end
      object UniLabel22: TUniLabel
        Left = 19
        Top = 138
        Width = 45
        Height = 13
        Hint = ''
        Caption = 'A'#231#305'klama'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 5
      end
      object UniLabel23: TUniLabel
        Left = 19
        Top = 257
        Width = 130
        Height = 13
        Hint = ''
        Caption = #304'hlalin kuruma olan etkisi'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 6
      end
      object UniLabel24: TUniLabel
        Left = 19
        Top = 338
        Width = 45
        Height = 13
        Hint = ''
        Caption = 'A'#231#305'klama'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 7
      end
    end
    object tsonlem: TUniTabSheet
      Hint = ''
      Caption = #214'nlemler'
      object scrollOnlem: TUniScrollBox
        Left = 3
        Top = 0
        Width = 966
        Height = 1000
        Hint = ''
        TabOrder = 0
        ScrollHeight = 626
        ScrollWidth = 917
        object UniDBMemo10: TUniDBMemo
          Left = 27
          Top = 29
          Width = 878
          Height = 77
          Hint = ''
          DataField = 'personel_egitimi'
          DataSource = dsdata
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 0
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase('#39'tr'#39')); '#13#10'  sender.inputEl.' +
              'dom.setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel25: TUniLabel
          Left = 39
          Top = 9
          Width = 878
          Height = 18
          Hint = ''
          AutoSize = False
          Caption = 
            #304'hlal ile ilgili olan '#231'al'#305#351'anlar'#305'n son bir y'#305'l i'#231'erisinde ald'#305#287#305 +
            ' e'#287'itimler nelerdir?'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
        end
        object UniDBMemo11: TUniDBMemo
          Left = 27
          Top = 197
          Width = 438
          Height = 138
          Hint = ''
          DataField = 'teknik_tedbir_ihlal_oncesi'
          DataSource = dsdata
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 2
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase('#39'tr'#39')); '#13#10'  sender.inputEl.' +
              'dom.setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniDBMemo12: TUniDBMemo
          Left = 471
          Top = 197
          Width = 434
          Height = 138
          Hint = ''
          DataField = 'idari_tedbir_ihlal_oncesi'
          DataSource = dsdata
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 3
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase('#39'tr'#39')); '#13#10'  sender.inputEl.' +
              'dom.setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel26: TUniLabel
          Left = 27
          Top = 146
          Width = 878
          Height = 28
          Hint = ''
          AutoSize = False
          Caption = 
            'Bu t'#252'r ihlalleri engellemek i'#231'in ihlalin ger'#231'ekle'#351'mesinden '#246'nce ' +
            'alm'#305#351' oldu'#287'unuz teknik ve idari tedbirlerini belirtiniz. '
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 4
        end
        object UniLabel27: TUniLabel
          Left = 27
          Top = 173
          Width = 79
          Height = 13
          Hint = ''
          Caption = 'Teknik tedbirler'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 5
        end
        object UniLabel28: TUniLabel
          Left = 471
          Top = 173
          Width = 70
          Height = 13
          Hint = ''
          Caption = #304'dari Tedbirler'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 6
        end
        object UniDBMemo13: TUniDBMemo
          Left = 471
          Top = 450
          Width = 434
          Height = 143
          Hint = ''
          DataField = 'idari_tedbir_ihlal_sonrasi'
          DataSource = dsdata
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 7
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase('#39'tr'#39')); '#13#10'  sender.inputEl.' +
              'dom.setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniDBMemo14: TUniDBMemo
          Left = 27
          Top = 450
          Width = 438
          Height = 143
          Hint = ''
          DataField = 'teknik_tedbir_ihlal_sonrasi'
          DataSource = dsdata
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 8
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase('#39'tr'#39')); '#13#10'  sender.inputEl.' +
              'dom.setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel30: TUniLabel
          Left = 31
          Top = 426
          Width = 79
          Height = 13
          Hint = ''
          Caption = 'Teknik tedbirler'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 9
        end
        object UniLabel31: TUniLabel
          Left = 475
          Top = 426
          Width = 70
          Height = 13
          Hint = ''
          Caption = #304'dari Tedbirler'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 10
        end
        object UniLabel32: TUniLabel
          Left = 27
          Top = 379
          Width = 878
          Height = 50
          Hint = ''
          AutoSize = False
          Caption = 
            #304'hlal sonras'#305' alm'#305#351' oldu'#287'unuz veya almay'#305' planlad'#305#287#305'n'#305'z teknik v' +
            'e idari tedbirleri belirtiniz ve bunlar'#305'n tahminen ne zaman tama' +
            'mlanaca'#287#305' hakk'#305'nda bilgi veriniz. (Problemi '#231#246'zmek ve olumsuz et' +
            'kilerini ortadan kald'#305'rmak ad'#305'na alm'#305#351' oldu'#287'unuz '#246'nlemleri belir' +
            'tiniz; '#246'rne'#287'in yanl'#305#351'l'#305'kla g'#246'nderilmi'#351' olan verilerin yok edilme' +
            'si, '#351'ifrelerin g'#252'venli'#287'inin sa'#287'lanmas'#305', veri g'#252'venli'#287'i e'#287'itimi p' +
            'lanlanmas'#305' vb.)'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 11
        end
        object UniLabel40: TUniLabel
          Left = 25
          Top = 119
          Width = 31
          Height = 13
          Hint = ''
          Caption = 'Dosya'
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 12
        end
        object edpersonelegitim: TUniDBEdit
          Left = 72
          Top = 113
          Width = 393
          Height = 25
          Hint = ''
          DataField = 'dosya_adi'
          DataSource = dspersonelEgitim
          CharCase = ecLowerCase
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 13
          ReadOnly = True
        end
        object UniSpeedButton5: TUniSpeedButton
          Left = 471
          Top = 111
          Width = 34
          Height = 29
          Hint = ''
          Caption = ''
          ParentColor = False
          Images = MainMod.PrjImgList
          ImageIndex = 18
          TabOrder = 14
          OnClick = UniSpeedButton5Click
        end
        object UniSpeedButton6: TUniSpeedButton
          Left = 511
          Top = 111
          Width = 34
          Height = 29
          Hint = ''
          Caption = ''
          ParentColor = False
          IconAlign = iaCenter
          Images = MainMod.PrjImgList
          ImageIndex = 1
          TabOrder = 15
          OnClick = UniSpeedButton6Click
        end
        object UniLabel41: TUniLabel
          Left = 25
          Top = 349
          Width = 31
          Height = 13
          Hint = ''
          Caption = 'Dosya'
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 16
        end
        object edihlalOncesiTedbir: TUniDBEdit
          Left = 72
          Top = 343
          Width = 393
          Height = 25
          Hint = ''
          DataField = 'dosya_adi'
          DataSource = dsIhlOncesiTetbir
          CharCase = ecLowerCase
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 17
          ReadOnly = True
        end
        object UniSpeedButton7: TUniSpeedButton
          Left = 471
          Top = 341
          Width = 34
          Height = 29
          Hint = ''
          Caption = ''
          ParentColor = False
          Images = MainMod.PrjImgList
          ImageIndex = 18
          TabOrder = 18
          OnClick = UniSpeedButton7Click
        end
        object UniSpeedButton8: TUniSpeedButton
          Left = 511
          Top = 341
          Width = 34
          Height = 29
          Hint = ''
          Caption = ''
          ParentColor = False
          IconAlign = iaCenter
          Images = MainMod.PrjImgList
          ImageIndex = 1
          TabOrder = 19
          OnClick = UniSpeedButton8Click
        end
        object UniLabel42: TUniLabel
          Left = 25
          Top = 605
          Width = 31
          Height = 13
          Hint = ''
          Caption = 'Dosya'
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 20
        end
        object edihlalSonrasıTedbir: TUniDBEdit
          Left = 72
          Top = 599
          Width = 393
          Height = 25
          Hint = ''
          DataField = 'dosya_adi'
          DataSource = dsIhlSonrasiTedbir
          CharCase = ecLowerCase
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 21
          ReadOnly = True
        end
        object UniSpeedButton9: TUniSpeedButton
          Left = 471
          Top = 597
          Width = 34
          Height = 29
          Hint = ''
          Caption = ''
          ParentColor = False
          Images = MainMod.PrjImgList
          ImageIndex = 18
          TabOrder = 22
          OnClick = UniSpeedButton9Click
        end
        object UniSpeedButton10: TUniSpeedButton
          Left = 511
          Top = 597
          Width = 34
          Height = 29
          Hint = ''
          Caption = ''
          ParentColor = False
          IconAlign = iaCenter
          Images = MainMod.PrjImgList
          ImageIndex = 1
          TabOrder = 23
          OnClick = UniSpeedButton10Click
        end
      end
    end
  end
  object qdata: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'select * from def_data_ihlal where mc_id=4 ')
    Left = 16
    Top = 200
  end
  object dsdata: TUniDataSource
    DataSet = vqdata
    OnDataChange = dsdataDataChange
    Left = 120
    Top = 200
  end
  object vqdata: TVirtualTable
    DetailFields = 'id'
    FieldDefs = <
      item
        Name = 'id'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'mc_id'
        DataType = ftInteger
      end
      item
        Name = 'baslangic_tarihi'
        DataType = ftDateTime
      end
      item
        Name = 'bitis_tarihi'
        DataType = ftDateTime
      end
      item
        Name = 'tespit_tarihi'
        DataType = ftDateTime
      end
      item
        Name = 'veri_isleyen'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'veri_isleyen_adresi'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'ihlal_kaynagi_genel'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ihlal_kaynagi_siber_saldiri'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ihlal_etkisi'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ihlal_tespiti'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'etkilenen_kisi_sayisi'
        DataType = ftInteger
      end
      item
        Name = 'etkilenen_kayit_sayisi'
        DataType = ftInteger
      end
      item
        Name = 'ihlal_icerigi'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'idy'
        DataType = ftInteger
      end
      item
        Name = 'idt'
        DataType = ftDateTime
      end
      item
        Name = 'sdy'
        DataType = ftInteger
      end
      item
        Name = 'sdt'
        DataType = ftDateTime
      end
      item
        Name = 'ihlal_kaynagi_aciklama'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'ihlal_etki_aciklama'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'ihlal_etki_kisigrup_aciklama'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'ihlal_etki_ilgili_kisi_aciklama'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'ihlal_etki_ilgili_kisi'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'olasi_kisisel_sonuc'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'olasi_kisisel_sonuc_aciklama'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'olasi_kurumsal_sonuc'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'olasi_kurumsal_sonuc_aciklama'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'personel_egitimi'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'teknik_tedbir_ihlal_oncesi'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'idari_tedbir_ihlal_oncesi'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'teknik_tedbir_ihale_sonrasi'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'idari_tedbir_hale_sonrasi'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'kullanici_gorev_unvan'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'vs_bildirim_tarihi'
        DataType = ftDateTime
      end
      item
        Name = 'kisisel_veri_ihlali'
        DataType = ftString
        Size = 1
      end>
    Left = 64
    Top = 192
    Data = {
      0400230002006964030000000000000005006D635F6964030000000000000010
      006261736C616E6769635F7461726968690B000000000000000C006269746973
      5F7461726968690B000000000000000D007465737069745F7461726968690B00
      0000000000000C00766572695F69736C6579656E0100FF000000000013007665
      72695F69736C6579656E5F6164726573690100E80300000000130069686C616C
      5F6B61796E6167695F67656E656C0100FF00000000001B0069686C616C5F6B61
      796E6167695F73696265725F73616C646972690100FF00000000000C0069686C
      616C5F65746B6973690100FF00000000000D0069686C616C5F74657370697469
      0100E80300000000150065746B696C656E656E5F6B6973695F73617969736903
      00000000000000160065746B696C656E656E5F6B617969745F73617969736903
      000000000000000D0069686C616C5F696365726967690100E803000000000300
      696479030000000000000003006964740B000000000000000300736479030000
      000000000003007364740B00000000000000160069686C616C5F6B61796E6167
      695F6163696B6C616D610100E80300000000130069686C616C5F65746B695F61
      63696B6C616D610100E803000000001C0069686C616C5F65746B695F6B697369
      677275705F6163696B6C616D610100E803000000001F0069686C616C5F65746B
      695F696C67696C695F6B6973695F6163696B6C616D610100E803000000001600
      69686C616C5F65746B695F696C67696C695F6B6973690100FF00000000001300
      6F6C6173695F6B69736973656C5F736F6E756301003200000000001C006F6C61
      73695F6B69736973656C5F736F6E75635F6163696B6C616D6101002C01000000
      0014006F6C6173695F6B7572756D73616C5F736F6E756301003200000000001D
      006F6C6173695F6B7572756D73616C5F736F6E75635F6163696B6C616D610100
      2C01000000001000706572736F6E656C5F65676974696D690100E80300000000
      1A0074656B6E696B5F7465646269725F69686C616C5F6F6E636573690100E803
      00000000190069646172695F7465646269725F69686C616C5F6F6E6365736901
      00E803000000001B0074656B6E696B5F7465646269725F6968616C655F736F6E
      726173690100E80300000000190069646172695F7465646269725F68616C655F
      736F6E726173690100E8030000000015006B756C6C616E6963695F676F726576
      5F756E76616E0100FF0000000000120076735F62696C646972696D5F74617269
      68690B0000000000000013006B69736973656C5F766572695F69686C616C6901
      00010000000000000000000000}
  end
  object vqsurec: TVirtualTable
    FieldDefs = <
      item
        Name = 'ihlalSurec_Id'
        DataType = ftInteger
      end
      item
        Name = 'ihlal_id'
        DataType = ftInteger
      end
      item
        Name = 'surec_Id'
        DataType = ftInteger
      end
      item
        Name = 'surec'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'Kaynak_Ids'
        DataType = ftString
        Size = 50
      end>
    AfterScroll = vqsurecAfterScroll
    Left = 933
    Top = 42
    Data = {
      040005000D0069686C616C53757265635F49640300000000000000080069686C
      616C5F69640300000000000000080073757265635F4964030000000000000005
      00737572656301009600000000000A004B61796E616B5F496473010032000000
      0000000000000000}
  end
  object dsvqsurec: TUniDataSource
    DataSet = vqsurec
    Left = 973
    Top = 42
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    Left = 748
    Top = 271
  end
  object qtmp2: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    Left = 780
    Top = 271
  end
  object vqkaynak: TVirtualTable
    MasterSource = dsvqsurec
    MasterFields = 'surec_Id'
    DetailFields = 'surec_Id'
    FieldDefs = <
      item
        Name = 'ihlalSurec_Id'
        DataType = ftInteger
      end
      item
        Name = 'ihlal_id'
        DataType = ftInteger
      end
      item
        Name = 'surec_Id'
        DataType = ftInteger
      end
      item
        Name = 'kaynak_id'
        DataType = ftInteger
      end
      item
        Name = 'kaynak'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'sec'
        DataType = ftBoolean
      end>
    Left = 925
    Top = 98
    Data = {
      040006000D0069686C616C53757265635F49640300000000000000080069686C
      616C5F69640300000000000000080073757265635F4964030000000000000009
      006B61796E616B5F6964030000000000000006006B61796E616B010064000000
      000003007365630500000000000000000000000000}
  end
  object dsvqkaynak: TUniDataSource
    DataSet = vqkaynak
    Left = 981
    Top = 106
  end
  object vtmq: TVirtualQuery
    SourceDataSets = <
      item
        DataSet = vqkaynak
      end
      item
        DataSet = vqsurec
      end>
    Left = 933
    Top = 237
  end
  object vtmq2: TVirtualQuery
    SourceDataSets = <
      item
        DataSet = vqkaynak
      end
      item
        DataSet = vqsurec
      end
      item
        DataSet = vqilgilikisi
      end>
    Left = 989
    Top = 237
  end
  object dskisiseletki: TUniDataSource
    DataSet = vtkisiseletki
    Left = 77
    Top = 370
  end
  object vtkisiseletki: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'parameter'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'subid'
        DataType = ftInteger
      end
      item
        Name = 'sec'
        DataType = ftBoolean
      end>
    Left = 20
    Top = 368
    Data = {
      040003000900706172616D657465720100640000000000050073756269640300
      00000000000003007365630500000000000000000000000000}
  end
  object vtverietki: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'parameter'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'subid'
        DataType = ftInteger
      end
      item
        Name = 'sec'
        DataType = ftBoolean
      end>
    Left = 20
    Top = 280
    Data = {
      040003000900706172616D657465720100640000000000050073756269640300
      00000000000003007365630500000000000000000000000000}
  end
  object dsverietki: TUniDataSource
    DataSet = vtverietki
    Left = 77
    Top = 282
  end
  object vtihlalkaynagi: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'parameter'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'subid'
        DataType = ftInteger
      end
      item
        Name = 'sec'
        DataType = ftBoolean
      end>
    Left = 20
    Top = 32
    Data = {
      040003000900706172616D657465720100640000000000050073756269640300
      00000000000003007365630500000000000000000000000000}
  end
  object dsihlalkaynagi: TUniDataSource
    DataSet = vtihlalkaynagi
    Left = 77
    Top = 34
  end
  object vtsibersaldiri: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'parameter'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'subid'
        DataType = ftInteger
      end
      item
        Name = 'sec'
        DataType = ftBoolean
      end>
    Left = 20
    Top = 120
    Data = {
      040003000900706172616D657465720100640000000000050073756269640300
      00000000000003007365630500000000000000000000000000}
  end
  object dssibersaldiri: TUniDataSource
    DataSet = vtsibersaldiri
    Left = 77
    Top = 122
  end
  object vqVsBilDosya: TVirtualTable
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'mc_id'
        DataType = ftInteger
      end
      item
        Name = 'ihlal_id'
        DataType = ftInteger
      end
      item
        Name = 'konu'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'dosya_adi'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'file'
        DataType = ftBlob
      end>
    Left = 821
    Top = 394
    Data = {
      0400060002006964030000000000000005006D635F6964030000000000000008
      0069686C616C5F6964030000000000000004006B6F6E75010064000000000009
      00646F7379615F6164690100640000000000040066696C650F00000000000000
      000000000000}
  end
  object dsVsBilDosya: TUniDataSource
    DataSet = vqVsBilDosya
    Left = 877
    Top = 394
  end
  object FileUp: TUniFileUpload
    MaxAllowedSize = 2097152
    Title = 'Dosya Y'#252'kle'
    Messages.Uploading = 'Y'#252'kleniyor...'
    Messages.PleaseWait = 'L'#252'tfen Bekleyiniz'
    Messages.Cancel = #304'ptal'
    Messages.Processing = 'Y'#252'kleniyor...'
    Messages.UploadError = 'Y'#252'kleme Hatas'#305
    Messages.Upload = 'Y'#252'kle'
    Messages.NoFileError = 'L'#252'tfen Y'#252'klenecek Dosya Se'#231'iniz'
    Messages.BrowseText = 'Se'#231'...'
    Messages.UploadTimeout = 'Zaman a'#351#305'm'#305' olu'#351'tu...'
    Messages.MaxSizeError = 'Dosya izin verilen maksimum boyuttan daha b'#252'y'#252'k'
    Messages.MaxFilesError = 'En fazla %d dosya y'#252'kleyebilirsiniz.'
    Width = 400
    OnCompleted = FileUpCompleted
    Left = 629
    Top = 350
  end
  object vqTesbitEvrak: TVirtualTable
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'mc_id'
        DataType = ftInteger
      end
      item
        Name = 'ihlal_id'
        DataType = ftInteger
      end
      item
        Name = 'konu'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'dosya_adi'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'file'
        DataType = ftBlob
      end>
    Left = 821
    Top = 434
    Data = {
      0400060002006964030000000000000005006D635F6964030000000000000008
      0069686C616C5F6964030000000000000004006B6F6E75010064000000000009
      00646F7379615F6164690100640000000000040066696C650F00000000000000
      000000000000}
  end
  object dsTesbitEvrak: TUniDataSource
    DataSet = vqTesbitEvrak
    Left = 877
    Top = 434
  end
  object vqpersonelEgitim: TVirtualTable
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'mc_id'
        DataType = ftInteger
      end
      item
        Name = 'ihlal_id'
        DataType = ftInteger
      end
      item
        Name = 'konu'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'dosya_adi'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'file'
        DataType = ftBlob
      end>
    Left = 821
    Top = 488
    Data = {
      0400060002006964030000000000000005006D635F6964030000000000000008
      0069686C616C5F6964030000000000000004006B6F6E75010064000000000009
      00646F7379615F6164690100640000000000040066696C650F00000000000000
      000000000000}
  end
  object dspersonelEgitim: TUniDataSource
    DataSet = vqpersonelEgitim
    Left = 877
    Top = 488
  end
  object vqIhlOncesiTetbir: TVirtualTable
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'mc_id'
        DataType = ftInteger
      end
      item
        Name = 'ihlal_id'
        DataType = ftInteger
      end
      item
        Name = 'konu'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'dosya_adi'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'file'
        DataType = ftBlob
      end>
    Left = 821
    Top = 536
    Data = {
      0400060002006964030000000000000005006D635F6964030000000000000008
      0069686C616C5F6964030000000000000004006B6F6E75010064000000000009
      00646F7379615F6164690100640000000000040066696C650F00000000000000
      000000000000}
  end
  object dsIhlOncesiTetbir: TUniDataSource
    DataSet = vqIhlOncesiTetbir
    Left = 877
    Top = 536
  end
  object vqIhlSonrasiTedbir: TVirtualTable
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'mc_id'
        DataType = ftInteger
      end
      item
        Name = 'ihlal_id'
        DataType = ftInteger
      end
      item
        Name = 'konu'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'dosya_adi'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'file'
        DataType = ftBlob
      end>
    Left = 821
    Top = 592
    Data = {
      0400060002006964030000000000000005006D635F6964030000000000000008
      0069686C616C5F6964030000000000000004006B6F6E75010064000000000009
      00646F7379615F6164690100640000000000040066696C650F00000000000000
      000000000000}
  end
  object dsIhlSonrasiTedbir: TUniDataSource
    DataSet = vqIhlSonrasiTedbir
    Left = 877
    Top = 592
  end
  object vqilgilikisi: TVirtualTable
    MasterSource = dsvqsurec
    MasterFields = 'surec_Id'
    DetailFields = 'surec_Id'
    FieldDefs = <
      item
        Name = 'ihlalSurec_Id'
        DataType = ftInteger
      end
      item
        Name = 'ihlal_id'
        DataType = ftInteger
      end
      item
        Name = 'surec_Id'
        DataType = ftInteger
      end
      item
        Name = 'kaynak_id'
        DataType = ftInteger
      end
      item
        Name = 'kaynak'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'kisi_id'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'kisi'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'sec'
        DataType = ftBoolean
      end>
    Left = 925
    Top = 162
    Data = {
      040008000D0069686C616C53757265635F49640300000000000000080069686C
      616C5F69640300000000000000080073757265635F4964030000000000000009
      006B61796E616B5F6964030000000000000006006B61796E616B010064000000
      000007006B6973695F6964010014000000000004006B69736901009600000000
      0003007365630500000000000000000000000000}
  end
  object dsilgilikisi: TUniDataSource
    DataSet = vqilgilikisi
    Left = 981
    Top = 170
  end
end
