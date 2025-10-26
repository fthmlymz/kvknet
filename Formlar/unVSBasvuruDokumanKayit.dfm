object frmVSBasvuruDokumanKayit: TfrmVSBasvuruDokumanKayit
  Left = 0
  Top = 0
  ClientHeight = 122
  ClientWidth = 524
  Caption = 'Dok'#252'man Bilgileri'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  TextHeight = 15
  object pnlButtons: TUniPanel
    Left = 0
    Top = 74
    Width = 524
    Height = 48
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      524
      48)
    object btnCancel: TUniBitBtn
      Left = 425
      Top = 6
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
      Left = 323
      Top = 6
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
  end
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 524
    Height = 74
    Hint = ''
    Align = alClient
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    ExplicitHeight = 75
    object UniLabel34: TUniLabel
      Left = 6
      Top = 16
      Width = 75
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'A'#231#305'klama'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
    end
    object edAciklama: TUniDBEdit
      Left = 87
      Top = 13
      Width = 367
      Height = 22
      Hint = ''
      DataField = 'aciklama'
      DataSource = dsBsvDoc
      CharCase = ecUpperCase
      TabOrder = 3
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
    object UniLabel13: TUniLabel
      Left = 6
      Top = 41
      Width = 75
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Belge Ad'#305
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
    end
    object edDosyaAdi: TUniDBEdit
      Left = 87
      Top = 38
      Width = 367
      Height = 22
      Hint = ''
      DataField = 'belge_adi'
      DataSource = dsBsvDoc
      CharCase = ecUpperCase
      TabOrder = 4
      Color = clMoneyGreen
      ReadOnly = True
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
    object btnSelect: TUniBitBtn
      Left = 460
      Top = 13
      Width = 56
      Height = 48
      Hint = 'Departman Sil'
      Caption = 'Y'#252'kle'
      TabOrder = 5
      IconAlign = iaTop
      Images = MainMod.PrjImgList
      ImageIndex = 19
      OnClick = btnSelectClick
    end
  end
  object FileUp: TUniFileUpload
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
    Left = 294
    Top = 75
  end
  object dsBsvDoc: TUniDataSource
    Left = 238
    Top = 76
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, kisi FROM def_data_kisi'
      'WHERE mc_id = 2'
      'ORDER BY id')
    Left = 163
    Top = 76
  end
end
