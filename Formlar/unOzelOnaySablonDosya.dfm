object frmOzelOnaySablonDosya: TfrmOzelOnaySablonDosya
  Left = 0
  Top = 0
  ClientHeight = 461
  ClientWidth = 484
  Caption = #214'zel Onay Belgesi Bilgileri'
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object pnlData: TUniPanel
    Left = 0
    Top = 0
    Width = 484
    Height = 335
    Hint = ''
    Align = alClient
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      484
      335)
    object UniLabel3: TUniLabel
      Left = 3
      Top = 41
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Dosya Tan'#305'm'#305
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
    end
    object edTanim: TUniDBEdit
      Left = 94
      Top = 38
      Width = 381
      Height = 22
      Hint = ''
      DataField = 'dosya_aciklama'
      DataSource = dsDosya
      CharCase = ecUpperCase
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
    object UniLabel9: TUniLabel
      Left = 3
      Top = 11
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Dosya T'#252'r'#252
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 3
    end
    object edDosyaTuru: TUniDBComboBox
      Left = 94
      Top = 7
      Width = 91
      Height = 28
      Hint = ''
      DataField = 'dosya_tur'
      DataSource = dsDosya
      Style = csDropDownList
      Items.Strings = (
        'PDF'
        'HTML')
      TabOrder = 4
      IconItems = <>
      OnChange = edDosyaTuruChange
    end
    object edHtml: TUniHTMLMemo
      Left = 1
      Top = 135
      Width = 482
      Height = 199
      Hint = ''
      ScrollBars = ssVertical
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      Align = alBottom
      Color = clWindow
      TabOrder = 9
    end
    object edDosyaAdi: TUniDBEdit
      Left = 94
      Top = 65
      Width = 381
      Height = 22
      Hint = ''
      DataField = 'dosya_adi'
      DataSource = dsDosya
      CharCase = ecUpperCase
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
      ReadOnly = True
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
    object UniLabel1: TUniLabel
      Left = 3
      Top = 68
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Dosya Ad'#305
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
    end
    object btnUpload: TUniButton
      Tag = 1
      Left = 278
      Top = 93
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Y'#252'kle'
      Anchors = [akTop, akRight]
      TabOrder = 7
      Images = MainMod.PrjImgList
      ImageIndex = 19
      OnClick = btnUploadClick
    end
    object btnDownload: TUniButton
      Tag = 1
      Left = 379
      Top = 93
      Width = 96
      Height = 36
      Hint = ''
      Caption = #304'ndir'
      Anchors = [akTop, akRight]
      TabOrder = 8
      Images = MainMod.PrjImgList
      ImageIndex = 3
      OnClick = btnDownloadClick
    end
  end
  object pnlButtons: TUniPanel
    Left = 0
    Top = 335
    Width = 484
    Height = 126
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      484
      126)
    object btnCancel: TUniBitBtn
      Left = 381
      Top = 87
      Width = 96
      Height = 36
      Hint = ''
      Caption = #304'ptal'
      Anchors = [akTop, akRight]
      TabOrder = 2
      Images = MainMod.PrjImgList
      ImageIndex = 5
      OnClick = btnCancelClick
    end
    object btnPost: TUniBitBtn
      Left = 279
      Top = 87
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Kaydet'
      Anchors = [akTop, akRight]
      TabOrder = 1
      Images = MainMod.PrjImgList
      ImageIndex = 14
      OnClick = btnPostClick
    end
    object pnlLog: TUniContainerPanel
      Left = 1
      Top = 1
      Width = 482
      Height = 80
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
      object UniLabel6: TUniLabel
        Left = 12
        Top = 43
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
        Left = 12
        Top = 61
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
        Top = 5
        Width = 220
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
        Width = 220
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
        Left = 111
        Top = 43
        Width = 220
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
        Left = 111
        Top = 61
        Width = 220
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
    object btnSil: TUniButton
      Tag = 1
      Left = 177
      Top = 87
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Sil'
      Anchors = [akTop, akRight]
      TabOrder = 4
      Images = MainMod.PrjImgList
      ImageIndex = 12
      OnClick = btnSilClick
    end
  end
  object dsDosya: TUniDataSource
    Left = 83
    Top = 219
  end
  object SaveDlg: TSaveDialog
    Title = 'Dosya Kaydet'
    Left = 279
    Top = 219
  end
  object FileUp: TUniFileUpload
    MaxAllowedSize = 2097152
    Filter = '.pdf'
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
    Left = 231
    Top = 219
  end
end
