object frmEDanismanCevapTanim: TfrmEDanismanCevapTanim
  Left = 0
  Top = 0
  ClientHeight = 537
  ClientWidth = 844
  Caption = 'E-Dan'#305#351'man Cevaplar'
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object pnlData: TUniPanel
    Left = 0
    Top = 0
    Width = 844
    Height = 438
    Hint = ''
    Align = alClient
    TabOrder = 0
    Caption = ''
    object UniLabel8: TUniLabel
      Left = 5
      Top = 121
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'A'#231#305'klama'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 3
    end
    object edDesc: TUniDBMemo
      Left = 96
      Top = 122
      Width = 740
      Height = 56
      Hint = ''
      DataField = 'soru_aciklama'
      DataSource = dsSoru
      ScrollBars = ssVertical
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      ReadOnly = True
      TabOrder = 1
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
    object edsoru: TUniDBMemo
      Left = 96
      Top = 36
      Width = 740
      Height = 80
      Hint = ''
      DataField = 'soru_metni'
      DataSource = dsSoru
      ScrollBars = ssVertical
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      ReadOnly = True
      TabOrder = 0
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
    object UniLabel1: TUniLabel
      Left = 5
      Top = 15
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Soru No'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
    end
    object edSoruNo: TUniDBEdit
      Left = 96
      Top = 10
      Width = 236
      Height = 22
      Hint = ''
      DataField = 'soru_no'
      DataSource = dsSoru
      CharCase = ecUpperCase
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 5
      ReadOnly = True
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
    object UniLabel2: TUniLabel
      Left = 5
      Top = 36
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Soru Metni'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 6
    end
    object UniScrollBox1: TUniScrollBox
      Left = 96
      Top = 184
      Width = 740
      Height = 243
      Hint = ''
      TabOrder = 7
      object pc5: TUniPanel
        Left = 0
        Top = 240
        Width = 721
        Height = 60
        Hint = ''
        Align = alTop
        TabOrder = 0
        Caption = ''
        DesignSize = (
          721
          60)
        object cb5: TUniDBCheckBox
          Left = 3
          Top = 20
          Width = 15
          Height = 17
          Hint = ''
          DataField = 'secenek_5_secildi'
          DataSource = dsCevap
          ValueChecked = 'E'
          ValueUnchecked = 'H'
          Caption = ''
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
          ParentColor = False
          Color = clBtnFace
          OnClick = cb1Click
        end
        object mc5: TUniDBMemo
          Left = 24
          Top = -2
          Width = 697
          Height = 61
          Hint = ''
          DataField = 'secenek_5'
          DataSource = dsCevap
          ScrollBars = ssVertical
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          Anchors = [akLeft, akTop, akRight, akBottom]
          ReadOnly = True
          TabOrder = 2
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
      end
      object pc4: TUniPanel
        Left = 0
        Top = 180
        Width = 721
        Height = 60
        Hint = ''
        Align = alTop
        TabOrder = 1
        Caption = ''
        DesignSize = (
          721
          60)
        object cb4: TUniDBCheckBox
          Left = 3
          Top = 20
          Width = 15
          Height = 17
          Hint = ''
          DataField = 'secenek_4_secildi'
          DataSource = dsCevap
          ValueChecked = 'E'
          ValueUnchecked = 'H'
          Caption = ''
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
          ParentColor = False
          Color = clBtnFace
          OnClick = cb1Click
        end
        object mc4: TUniDBMemo
          Left = 24
          Top = -2
          Width = 697
          Height = 60
          Hint = ''
          DataField = 'secenek_4'
          DataSource = dsCevap
          ScrollBars = ssVertical
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          Anchors = [akLeft, akTop, akRight, akBottom]
          ReadOnly = True
          TabOrder = 2
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
      end
      object pc3: TUniPanel
        Left = 0
        Top = 120
        Width = 721
        Height = 60
        Hint = ''
        Align = alTop
        TabOrder = 2
        Caption = ''
        DesignSize = (
          721
          60)
        object cb3: TUniDBCheckBox
          Left = 3
          Top = 20
          Width = 15
          Height = 17
          Hint = ''
          DataField = 'secenek_3_secildi'
          DataSource = dsCevap
          ValueChecked = 'E'
          ValueUnchecked = 'H'
          Caption = ''
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
          ParentColor = False
          Color = clBtnFace
          OnClick = cb1Click
        end
        object mc3: TUniDBMemo
          Left = 24
          Top = -2
          Width = 697
          Height = 60
          Hint = ''
          DataField = 'secenek_3'
          DataSource = dsCevap
          ScrollBars = ssVertical
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          Anchors = [akLeft, akTop, akRight, akBottom]
          ReadOnly = True
          TabOrder = 2
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
      end
      object pc2: TUniPanel
        Left = 0
        Top = 60
        Width = 721
        Height = 60
        Hint = ''
        Align = alTop
        TabOrder = 3
        Caption = ''
        DesignSize = (
          721
          60)
        object cb2: TUniDBCheckBox
          Left = 3
          Top = 20
          Width = 15
          Height = 17
          Hint = ''
          DataField = 'secenek_2_secildi'
          DataSource = dsCevap
          ValueChecked = 'E'
          ValueUnchecked = 'H'
          Caption = ''
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
          ParentColor = False
          Color = clBtnFace
          OnClick = cb1Click
        end
        object mc2: TUniDBMemo
          Left = 24
          Top = -2
          Width = 697
          Height = 60
          Hint = ''
          DataField = 'secenek_2'
          DataSource = dsCevap
          ScrollBars = ssVertical
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          Anchors = [akLeft, akTop, akRight, akBottom]
          ReadOnly = True
          TabOrder = 2
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
      end
      object pc1: TUniPanel
        Left = 0
        Top = 0
        Width = 721
        Height = 60
        Hint = ''
        Align = alTop
        TabOrder = 4
        Caption = ''
        DesignSize = (
          721
          60)
        object cb1: TUniDBCheckBox
          Left = 3
          Top = 20
          Width = 15
          Height = 17
          Hint = ''
          DataField = 'secenek_1_secildi'
          DataSource = dsCevap
          ValueChecked = 'E'
          ValueUnchecked = 'H'
          Caption = ''
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
          ParentColor = False
          Color = clBtnFace
          OnClick = cb1Click
        end
        object mc1: TUniDBMemo
          Left = 24
          Top = -2
          Width = 697
          Height = 60
          Hint = ''
          DataField = 'secenek_1'
          DataSource = dsCevap
          ScrollBars = ssVertical
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          Anchors = [akLeft, akTop, akRight, akBottom]
          ReadOnly = True
          TabOrder = 2
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
      end
    end
  end
  object pnlButtons: TUniPanel
    Left = 0
    Top = 438
    Width = 844
    Height = 99
    Hint = ''
    Align = alBottom
    TabOrder = 1
    Caption = ''
    DesignSize = (
      844
      99)
    object btnCancel: TUniBitBtn
      Left = 740
      Top = 55
      Width = 96
      Height = 36
      Hint = ''
      Caption = #304'ptal'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
      Images = MainMod.PrjImgList
      ImageIndex = 5
      OnClick = btnCancelClick
    end
    object btnPost: TUniBitBtn
      Left = 638
      Top = 55
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Kaydet'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
      Images = MainMod.PrjImgList
      ImageIndex = 14
      OnClick = btnPostClick
    end
    object pnlLog: TUniContainerPanel
      Left = 1
      Top = 1
      Width = 842
      Height = 45
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
        Left = 414
        Top = 5
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
        Left = 414
        Top = 23
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
        Left = 513
        Top = 5
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
        Left = 513
        Top = 23
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
    object UniBitBtn1: TUniBitBtn
      Left = 434
      Top = 55
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = UniBitBtn1Click
    end
    object btnBos: TUniBitBtn
      Left = 536
      Top = 55
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Bo'#351' Ge'#231
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 5
      Images = MainMod.PrjImgList
      ImageIndex = 21
      OnClick = btnBosClick
    end
  end
  object dsSoru: TUniDataSource
    AutoEdit = False
    DataSet = qSoru
    Left = 279
    Top = 77
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    Left = 363
    Top = 76
  end
  object qSoru: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM edns_soru')
    Left = 229
    Top = 78
  end
  object qCevap: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM edns_cevap')
    Left = 229
    Top = 134
  end
  object dsCevap: TUniDataSource
    DataSet = qCevap
    Left = 279
    Top = 133
  end
  object qSoruSeti: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM edns_soruseti')
    Left = 151
    Top = 81
  end
end
