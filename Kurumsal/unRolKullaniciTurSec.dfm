object frmRolKullaniciTurSec: TfrmRolKullaniciTurSec
  Left = 0
  Top = 0
  ClientHeight = 222
  ClientWidth = 295
  Caption = 'T'#252'r Se'#231'iniz'
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  TextHeight = 15
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 295
    Height = 100
    Hint = ''
    Align = alTop
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    object UniLabel1: TUniLabel
      AlignWithMargins = True
      Left = 1
      Top = 6
      Width = 293
      Height = 88
      Hint = ''
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 5
      Alignment = taCenter
      AutoSize = False
      Caption = 
        'Siz grup kurumlarda yetkili kullan'#305'c'#305's'#305'n'#305'z.'#13'Hem grup bilgilerini' +
        ' hem de '#231'al'#305#351't'#305#287#305'n'#305'z kurumdaki bilgileri g'#246'rebilirsiniz.'#13#13'Hangi ' +
        'bilgileri g'#246'rmek istersiniz?'
      Align = alClient
      ParentFont = False
      Font.Color = clMaroon
      Font.Height = -13
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
    end
  end
  object UniPanel2: TUniPanel
    Left = 0
    Top = 100
    Width = 295
    Height = 74
    Hint = ''
    Align = alClient
    TabOrder = 1
    Caption = ''
    ExplicitHeight = 77
    object rgSecim: TUniRadioGroup
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 287
      Height = 66
      Hint = ''
      Items.Strings = (
        'Grup kullan'#305'c'#305'lar'#305'n'#305' a'#231
        'Kurum kullan'#305'c'#305'lar'#305'n'#305' a'#231)
      ItemIndex = 1
      Align = alClient
      Caption = ''
      TabOrder = 1
      ParentFont = False
      Font.Height = -13
      Font.OverrideDefaults = [ovFontHeight]
      ExplicitHeight = 69
    end
  end
  object UniPanel3: TUniPanel
    Left = 0
    Top = 174
    Width = 295
    Height = 48
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 2
    Caption = ''
    DesignSize = (
      295
      48)
    object btnSelect: TUniBitBtn
      Left = 195
      Top = 6
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Se'#231
      Anchors = [akTop, akRight]
      TabOrder = 1
      Images = MainMod.PrjImgList
      ImageIndex = 14
      OnClick = btnSelectClick
    end
    object btnCancel: TUniBitBtn
      Left = 4
      Top = 6
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
  end
end
