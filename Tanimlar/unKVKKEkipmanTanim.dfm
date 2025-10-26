object frmKVKKEkipmanTanim: TfrmKVKKEkipmanTanim
  Left = 0
  Top = 0
  ClientHeight = 367
  ClientWidth = 475
  Caption = 'Ekipman Bilgileri'
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object pnlData: TUniPanel
    Left = 0
    Top = 0
    Width = 475
    Height = 231
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
      Caption = 'Ekipman Tipi'
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
    end
    object UniLabel2: TUniLabel
      Left = 6
      Top = 42
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Ekipman Durumu'
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
    end
    object UniLabel3: TUniLabel
      Left = 6
      Top = 72
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Ekipman Ad'#305
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 3
    end
    object edEkipman: TUniDBEdit
      Left = 96
      Top = 70
      Width = 361
      Height = 22
      Hint = ''
      DataField = 'ekipman'
      DataSource = dsEkipman
      CharCase = ecUpperCase
      TabOrder = 7
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
    object UniLabel8: TUniLabel
      Left = 6
      Top = 101
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'A'#231#305'klama'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
    end
    object edTipi: TUniDBComboBox
      Left = 96
      Top = 12
      Width = 127
      Height = 23
      Hint = ''
      DataField = 'tipi'
      DataSource = dsEkipman
      Style = csDropDownList
      Items.Strings = (
        'BEL'#304'RT'#304'LMEM'#304#350
        'DONANIM'
        'YAZILIM'
        'H'#304'ZMET')
      ItemIndex = 0
      TabOrder = 5
      IconItems = <>
    end
    object edDurumu: TUniDBComboBox
      Left = 96
      Top = 38
      Width = 127
      Height = 23
      Hint = ''
      DataField = 'durumu'
      DataSource = dsEkipman
      Style = csDropDownList
      Items.Strings = (
        'BEL'#304'RT'#304'LMEM'#304#350
        'MEVCUT'
        'ALINMALI'
        'PLANLANDI'
        'KULLANILMIYOR')
      ItemIndex = 0
      TabOrder = 6
      IconItems = <>
    end
    object edDesc: TUniDBMemo
      Left = 96
      Top = 97
      Width = 361
      Height = 119
      Hint = ''
      DataField = 'description'
      DataSource = dsEkipman
      TabOrder = 8
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
  end
  object pnlButtons: TUniPanel
    Left = 0
    Top = 231
    Width = 475
    Height = 136
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      475
      136)
    object btnCancel: TUniBitBtn
      Left = 269
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
      Left = 371
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
      Width = 473
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
      Left = 7
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
  object dsEkipman: TUniDataSource
    DataSet = MainMod.qEkipman
    Left = 339
    Top = 6
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    Left = 222
    Top = 63
  end
end
