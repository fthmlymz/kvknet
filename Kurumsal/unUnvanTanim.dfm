object frmUnvanTanim: TfrmUnvanTanim
  Left = 0
  Top = 0
  ClientHeight = 261
  ClientWidth = 360
  Caption = #220'nvan Bilgileri'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object pnlData: TUniPanel
    Left = 0
    Top = 0
    Width = 360
    Height = 125
    Hint = ''
    Align = alClient
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    object UniLabel2: TUniLabel
      Left = 6
      Top = 59
      Width = 70
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = #220'nvan'
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
    end
    object Aktif: TUniLabel
      Left = 6
      Top = 87
      Width = 70
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Aktif'
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 3
    end
    object edUnvan: TUniDBEdit
      Left = 81
      Top = 55
      Width = 262
      Height = 22
      Hint = ''
      DataField = 'title'
      DataSource = dsTitle
      CharCase = ecUpperCase
      TabOrder = 5
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
    object UniLabel3: TUniLabel
      Left = 5
      Top = 15
      Width = 70
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Departman'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
    end
    object edDept: TUniEdit
      Left = 81
      Top = 12
      Width = 262
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      TabOrder = 4
      TabStop = False
      ReadOnly = True
    end
    object edActive: TUniDBCheckBox
      Left = 81
      Top = 85
      Width = 30
      Height = 17
      Hint = ''
      DataField = 'active'
      DataSource = dsTitle
      ValueChecked = 'E'
      ValueUnchecked = 'H'
      Caption = ''
      TabOrder = 6
      ParentColor = False
      Color = clBtnFace
    end
  end
  object pnlButtons: TUniPanel
    Left = 0
    Top = 125
    Width = 360
    Height = 136
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      360
      136)
    object btnCancel: TUniBitBtn
      Left = 261
      Top = 91
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
      Left = 159
      Top = 91
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
      Width = 358
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
    object btnHelp: TUniBitBtn
      Left = 8
      Top = 91
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
  object qTitle: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM sys_titledef'
      'WHERE mc_id = 2')
    Left = 191
    Top = 60
  end
  object dsTitle: TUniDataSource
    DataSet = qTitle
    Left = 230
    Top = 60
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    Left = 305
    Top = 60
  end
end
