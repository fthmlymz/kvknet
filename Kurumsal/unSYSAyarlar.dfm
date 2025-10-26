object frmsysAyarlarTanim: TfrmsysAyarlarTanim
  Left = 0
  Top = 0
  ClientHeight = 276
  ClientWidth = 477
  Caption = 'Program '#199'al'#305#351'ma Ayarlar'#305
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object pnlData: TUniPanel
    Left = 0
    Top = 0
    Width = 477
    Height = 228
    Hint = ''
    Align = alClient
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    object UniLabel1: TUniLabel
      Left = 6
      Top = 15
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Mod'#252'l'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
    end
    object UniLabel2: TUniLabel
      Left = 6
      Top = 41
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Alt Mod'#252'l'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
    end
    object UniLabel9: TUniLabel
      Left = 6
      Top = 66
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Parametre'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 5
    end
    object UniLabel11: TUniLabel
      Left = 6
      Top = 90
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'A'#231#305'klama'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 7
    end
    object edModule: TUniDBEdit
      Tag = 9
      Left = 96
      Top = 12
      Width = 199
      Height = 22
      Hint = ''
      DataField = 'module'
      DataSource = dsParam
      CharCase = ecUpperCase
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 8
      TabStop = False
      ReadOnly = True
    end
    object edSubModule: TUniDBEdit
      Left = 96
      Top = 37
      Width = 199
      Height = 22
      Hint = ''
      DataField = 'sub_module'
      DataSource = dsParam
      CharCase = ecUpperCase
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 9
      TabStop = False
      ReadOnly = True
    end
    object edParam: TUniDBEdit
      Left = 96
      Top = 62
      Width = 370
      Height = 22
      Hint = ''
      DataField = 'param_val'
      DataSource = dsParam
      CharCase = ecUpperCase
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 10
      TabStop = False
      ReadOnly = True
    end
    object edDesc: TUniDBEdit
      Left = 96
      Top = 87
      Width = 370
      Height = 22
      Hint = ''
      DataField = 'description'
      DataSource = dsParam
      CharCase = ecUpperCase
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 11
      TabStop = False
      ReadOnly = True
    end
    object UniLabel3: TUniLabel
      Left = 6
      Top = 134
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = '1. De'#287'er'
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 3
    end
    object UniLabel8: TUniLabel
      Left = 6
      Top = 159
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = '2. De'#287'er'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
    end
    object UniLabel10: TUniLabel
      Left = 6
      Top = 183
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = '3. De'#287'er'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 6
    end
    object edVal1: TUniDBEdit
      Left = 96
      Top = 130
      Width = 370
      Height = 22
      Hint = ''
      DataField = 'val1'
      DataSource = dsParam
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 12
    end
    object edVal2: TUniDBEdit
      Left = 96
      Top = 155
      Width = 370
      Height = 22
      Hint = ''
      DataField = 'val2'
      DataSource = dsParam
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 13
    end
    object edVal3: TUniDBEdit
      Left = 96
      Top = 180
      Width = 370
      Height = 22
      Hint = ''
      DataField = 'val3'
      DataSource = dsParam
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 14
    end
  end
  object pnlButtons: TUniPanel
    Left = 0
    Top = 228
    Width = 477
    Height = 48
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      477
      48)
    object btnCancel: TUniBitBtn
      Left = 370
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
    object btnPost: TUniBitBtn
      Left = 268
      Top = 6
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
  end
  object dsParam: TUniDataSource
    DataSet = MainMod.qsysparam
    Left = 333
    Top = 15
  end
end
