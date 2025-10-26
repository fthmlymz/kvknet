object frmKVKKVeriDokumanTanim: TfrmKVKKVeriDokumanTanim
  Left = 0
  Top = 0
  ClientHeight = 304
  ClientWidth = 479
  Caption = 'Dok'#252'man Bilgileri'
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object pnlData: TUniPanel
    Left = 0
    Top = 0
    Width = 479
    Height = 204
    Hint = ''
    Align = alClient
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      479
      204)
    object UniLabel2: TUniLabel
      Left = 6
      Top = 43
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Dok'#252'man'
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
    end
    object UniLabel9: TUniLabel
      Left = 6
      Top = 125
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'A'#231#305'klama'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 3
    end
    object edDoc: TUniDBEdit
      Left = 96
      Top = 42
      Width = 361
      Height = 22
      Hint = ''
      DataField = 'dokuman'
      DataSource = dsDokuman
      CharCase = ecUpperCase
      TabOrder = 5
      ReadOnly = True
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
      ReadOnlyMode = urmNotEditable
    end
    object edDesc: TUniDBMemo
      Left = 96
      Top = 124
      Width = 361
      Height = 66
      Hint = ''
      DataField = 'description'
      DataSource = dsDokuman
      TabOrder = 6
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
    object UniLabel3: TUniLabel
      Left = 3
      Top = 15
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Dok'#252'man Tipi'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
    end
    object edMain: TUniEdit
      Left = 96
      Top = 12
      Width = 199
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      TabOrder = 4
      TabStop = False
      ReadOnly = True
    end
    object UniLabel1: TUniLabel
      Left = 6
      Top = 76
      Width = 85
      Height = 13
      Hint = ''
      Visible = False
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Dosya T'#252'r'#252
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 7
    end
    object edDosyaTuru: TUniDBComboBox
      Left = 97
      Top = 72
      Width = 91
      Height = 28
      Hint = ''
      Visible = False
      DataField = 'dosya_tur'
      DataSource = dsDokuman
      Style = csDropDownList
      Items.Strings = (
        'PDF'
        'WORD'
        'POWERPOINT'
        'EXCEL'
        'TEXT')
      TabOrder = 8
      IconItems = <>
    end
    object btnDownload: TUniButton
      Tag = 1
      Left = 407
      Top = 68
      Width = 48
      Height = 48
      Hint = ''
      Caption = #304'ndir'
      Anchors = [akTop, akRight]
      TabOrder = 9
      ScreenMask.Enabled = True
      ScreenMask.Message = 'Dok'#252'man Haz'#305'rlan'#305'yor...'
      ScreenMask.Color = 16744448
      Images = MainMod.PrjImgList
      ImageIndex = 3
      IconAlign = iaTop
      OnClick = btnDownloadClick
    end
    object btnUpload: TUniButton
      Tag = 1
      Left = 351
      Top = 68
      Width = 48
      Height = 48
      Hint = ''
      Caption = 'Y'#252'kle'
      Anchors = [akTop, akRight]
      TabOrder = 10
      ScreenMask.Enabled = True
      ScreenMask.Message = 'Dok'#252'man Y'#252'kleniyor...'
      ScreenMask.Color = 16744448
      Images = MainMod.PrjImgList
      ImageIndex = 19
      IconAlign = iaTop
      OnClick = btnUploadClick
    end
  end
  object pnlButtons: TUniPanel
    Left = 0
    Top = 204
    Width = 479
    Height = 100
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      479
      100)
    object btnCancel: TUniBitBtn
      Left = 269
      Top = 56
      Width = 96
      Height = 36
      Hint = ''
      Caption = #304'ptal'
      Anchors = [akRight, akBottom]
      TabOrder = 2
      Images = MainMod.PrjImgList
      ImageIndex = 5
      OnClick = btnCancelClick
    end
    object btnPost: TUniBitBtn
      Left = 377
      Top = 56
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Kaydet'
      Anchors = [akRight, akBottom]
      TabOrder = 1
      Images = MainMod.PrjImgList
      ImageIndex = 14
      OnClick = btnPostClick
    end
    object pnlLog: TUniContainerPanel
      Left = 1
      Top = 1
      Width = 477
      Height = 45
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 3
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
      object lbIDY: TUniLabel
        Left = 111
        Top = 5
        Width = 140
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
        Width = 140
        Height = 13
        Hint = ''
        AutoSize = False
        Caption = 'lbIDT'
        ParentFont = False
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 6
      end
      object UniLabel6: TUniLabel
        Left = 237
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
        Left = 237
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
      object lbSDT: TUniLabel
        Left = 336
        Top = 23
        Width = 140
        Height = 13
        Hint = ''
        AutoSize = False
        Caption = 'lbSDT'
        ParentFont = False
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 8
      end
      object lbSDY: TUniLabel
        Left = 336
        Top = 5
        Width = 140
        Height = 13
        Hint = ''
        AutoSize = False
        Caption = 'lbSDY'
        ParentFont = False
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 7
      end
    end
    object btnHelp: TUniBitBtn
      Left = 9
      Top = 56
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = btnHelpClick
    end
  end
  object dsDokuman: TUniDataSource
    DataSet = MainMod.qDokuman
    Left = 291
    Top = 96
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    Left = 375
    Top = 96
  end
  object FileUp: TUniFileUpload
    MaxAllowedSize = 10485760
    Filter = '.DOCX, .XLSX, .PPTX, .PPSX, .TXT, .PDF'
    Title = 'Dosya Y'#252'kle'
    Messages.Uploading = 'Y'#252'kleniyor...'
    Messages.PleaseWait = 'L'#252'tfen Bekleyiniz'
    Messages.Cancel = #304'ptal'
    Messages.Processing = 'Y'#252'kleniyor...'
    Messages.UploadError = 'Y'#252'kleme Hatas'#305
    Messages.Upload = 'Y'#252'kle'
    Messages.NoFileError = 'L'#252'tfen Y'#252'klenecek Dosya Se'#231'iniz'
    Messages.BrowseText = 'Se'#231'...'
    Messages.UploadTimeout = 'Timeout occurred...'
    Messages.MaxSizeError = 'File is bigger than maximum allowed size'
    Messages.MaxFilesError = 'You can upload maximum %d files.'
    Width = 400
    OnCompleted = FileUpCompleted
    Left = 186
    Top = 99
  end
  object SaveDlg: TSaveDialog
    Title = 'Dosya Kaydet'
    Left = 216
    Top = 99
  end
  object DOCXRpt: TrXMLReport
    ActionAfter = aaNone
    OnUserCalc = DOCXRptUserCalc
    Left = 147
    Top = 111
  end
end
