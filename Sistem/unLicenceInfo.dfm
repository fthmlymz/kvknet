object frmLicenceInfo: TfrmLicenceInfo
  Left = 0
  Top = 0
  ClientHeight = 128
  ClientWidth = 397
  Caption = 'Lisans Bilgileri'
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 397
    Height = 84
    Hint = ''
    Align = alClient
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    ExplicitHeight = 77
    object UniLabel1: TUniLabel
      Left = 9
      Top = 9
      Width = 82
      Height = 13
      Hint = ''
      Caption = 'Kullan'#305'lan Paket'
      TabOrder = 1
    end
    object UniLabel2: TUniLabel
      Left = 9
      Top = 30
      Width = 107
      Height = 13
      Hint = ''
      Caption = 'Maks. Kullan'#305'c'#305' Say'#305's'#305
      TabOrder = 2
    end
    object UniLabel3: TUniLabel
      Left = 9
      Top = 51
      Width = 86
      Height = 13
      Hint = ''
      Caption = 'Lisans Biti'#351' Tarihi'
      TabOrder = 3
    end
    object UniLabel4: TUniLabel
      Left = 114
      Top = 9
      Width = 7
      Height = 13
      Hint = ''
      AutoSize = False
      Caption = ':'
      TabOrder = 4
    end
    object UniLabel5: TUniLabel
      Left = 114
      Top = 30
      Width = 7
      Height = 13
      Hint = ''
      AutoSize = False
      Caption = ':'
      TabOrder = 5
    end
    object UniLabel6: TUniLabel
      Left = 114
      Top = 51
      Width = 7
      Height = 13
      Hint = ''
      AutoSize = False
      Caption = ':'
      TabOrder = 6
    end
    object lbPaket: TUniLabel
      Left = 126
      Top = 9
      Width = 250
      Height = 13
      Hint = ''
      AutoSize = False
      Caption = 'lbPaket'
      TabOrder = 7
    end
    object lbKullanici: TUniLabel
      Left = 126
      Top = 30
      Width = 250
      Height = 13
      Hint = ''
      AutoSize = False
      Caption = 'lbKullanici'
      TabOrder = 8
    end
    object lbTarih: TUniLabel
      Left = 126
      Top = 51
      Width = 250
      Height = 13
      Hint = ''
      AutoSize = False
      Caption = 'lbTarih'
      TabOrder = 9
    end
  end
  object UniPanel2: TUniPanel
    Left = 0
    Top = 84
    Width = 397
    Height = 44
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      397
      44)
    object UniButton1: TUniButton
      Left = 294
      Top = 3
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Tamam'
      Anchors = [akTop, akRight]
      TabOrder = 1
      Images = MainMod.PrjImgList
      ImageIndex = 14
      OnClick = UniButton1Click
    end
  end
end
