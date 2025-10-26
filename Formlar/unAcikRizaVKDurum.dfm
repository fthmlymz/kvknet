object frmAcikRizaVKDurum: TfrmAcikRizaVKDurum
  Left = 0
  Top = 0
  ClientHeight = 299
  ClientWidth = 373
  Caption = 'Durum Bilgileri'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 373
    Height = 251
    Hint = ''
    Align = alClient
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    ExplicitHeight = 249
    object UniLabel2: TUniLabel
      Left = 6
      Top = 16
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Durum'
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
    end
    object edDurum: TUniComboBox
      Left = 97
      Top = 13
      Width = 145
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'ALINDI'
      Items.Strings = (
        'ALINDI'
        'ALINMADI'
        #304'MHA ED'#304'LD'#304)
      ItemIndex = 0
      TabOrder = 2
      IconItems = <>
      OnChange = edDurumChange
    end
    object UniLabel12: TUniLabel
      Left = 6
      Top = 41
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = #304'mha Tarihi'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 3
    end
    object edTarih: TUniDateTimePicker
      Left = 97
      Top = 37
      Width = 145
      Hint = ''
      DateTime = 44257.000000000000000000
      DateFormat = 'dd.MM.yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 4
    end
    object UniLabel1: TUniLabel
      Left = 6
      Top = 66
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'A'#231#305'klama'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 5
    end
    object edAciklama: TUniMemo
      Left = 97
      Top = 62
      Width = 268
      Height = 173
      Hint = ''
      Lines.Strings = (
        'edAciklama')
      TabOrder = 6
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
  end
  object pnlButtons: TUniPanel
    Left = 0
    Top = 251
    Width = 373
    Height = 48
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      373
      48)
    object btnCancel: TUniBitBtn
      Left = 269
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
      Left = 167
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
end
