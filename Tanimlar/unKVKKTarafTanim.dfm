object frmKVKKTarafTanim: TfrmKVKKTarafTanim
  Left = 0
  Top = 0
  ClientHeight = 230
  ClientWidth = 485
  Caption = 'Payla'#351#305'm Taraf Bilgileri'
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object pnlData: TUniPanel
    Left = 0
    Top = 0
    Width = 485
    Height = 94
    Hint = ''
    Align = alClient
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    ExplicitWidth = 478
    ExplicitHeight = 177
    object UniLabel2: TUniLabel
      Left = 6
      Top = 20
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Payla'#351#305'm Taraf'#305
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
    end
    object UniLabel9: TUniLabel
      Left = 6
      Top = 45
      Width = 85
      Height = 13
      Hint = ''
      Visible = False
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'A'#231#305'klama'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
    end
    object edTanim: TUniDBEdit
      Left = 96
      Top = 16
      Width = 361
      Height = 22
      Hint = ''
      DataField = 'taraf'
      DataSource = dsTaraf
      CharCase = ecUpperCase
      TabOrder = 3
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
    object edDesc: TUniDBMemo
      Left = 96
      Top = 41
      Width = 361
      Height = 32
      Hint = ''
      Visible = False
      DataField = 'description'
      DataSource = dsTaraf
      TabOrder = 4
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
  end
  object pnlButtons: TUniPanel
    Left = 0
    Top = 94
    Width = 485
    Height = 136
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    ExplicitTop = 177
    ExplicitWidth = 478
    DesignSize = (
      485
      136)
    object btnCancel: TUniBitBtn
      Left = 276
      Top = 90
      Width = 96
      Height = 36
      Hint = ''
      Caption = #304'ptal'
      Anchors = [akRight, akBottom]
      TabOrder = 2
      Images = MainMod.PrjImgList
      ImageIndex = 5
      OnClick = btnCancelClick
      ExplicitLeft = 269
    end
    object btnPost: TUniBitBtn
      Left = 378
      Top = 90
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Kaydet'
      Anchors = [akRight, akBottom]
      TabOrder = 1
      Images = MainMod.PrjImgList
      ImageIndex = 14
      OnClick = btnPostClick
      ExplicitLeft = 371
    end
    object pnlLog: TUniContainerPanel
      Left = 1
      Top = 1
      Width = 483
      Height = 80
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 3
      ExplicitWidth = 476
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
      Left = 6
      Top = 90
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
  object qTaraf: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM def_data_taraf')
    Left = 231
    Top = 96
  end
  object dsTaraf: TUniDataSource
    DataSet = qTaraf
    Left = 291
    Top = 96
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    Left = 399
    Top = 96
  end
end
