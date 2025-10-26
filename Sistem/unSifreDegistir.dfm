object frmSifreDegistir: TfrmSifreDegistir
  Left = 0
  Top = 0
  ClientHeight = 158
  ClientWidth = 289
  Caption = #350'ifre De'#287'i'#351'tir'
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  TextHeight = 15
  object UniLabel1: TUniLabel
    Left = 9
    Top = 16
    Width = 109
    Height = 13
    Hint = ''
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Eski Parola'
    ParentFont = False
    Font.Color = clMaroon
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
  end
  object UniLabel2: TUniLabel
    Left = 9
    Top = 47
    Width = 109
    Height = 13
    Hint = ''
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Yeni Parola'
    ParentFont = False
    Font.Color = clMaroon
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
  end
  object UniLabel3: TUniLabel
    Left = 8
    Top = 78
    Width = 109
    Height = 13
    Hint = ''
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Yeni Parola (Tekrar)'
    ParentFont = False
    Font.Color = clMaroon
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 2
  end
  object UniPanel1: TUniPanel
    Left = 0
    Top = 110
    Width = 289
    Height = 48
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 3
    Caption = ''
    object btnChange: TUniBitBtn
      Left = 174
      Top = 6
      Width = 105
      Height = 36
      Hint = ''
      Caption = 'De'#287'i'#351'tir'
      TabOrder = 1
      Images = MainMod.PrjImgList
      ImageIndex = 14
      OnClick = btnChangeClick
    end
    object btnCancel: TUniBitBtn
      Left = 10
      Top = 6
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Vazge'#231
      TabOrder = 2
      Images = MainMod.PrjImgList
      ImageIndex = 5
      OnClick = btnCancelClick
    end
  end
  object edEski: TUniEdit
    Left = 126
    Top = 12
    Width = 142
    Hint = ''
    PasswordChar = '#'
    Text = ''
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 4
  end
  object edYeni1: TUniEdit
    Left = 126
    Top = 43
    Width = 142
    Hint = ''
    PasswordChar = '#'
    Text = ''
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 5
  end
  object edYeni2: TUniEdit
    Left = 126
    Top = 75
    Width = 142
    Hint = ''
    PasswordChar = '#'
    Text = ''
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 6
  end
end
