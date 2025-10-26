object frmErisimYetkiTanim: TfrmErisimYetkiTanim
  Left = 0
  Top = 0
  ClientHeight = 353
  ClientWidth = 556
  Caption = 'Eri'#351'im Yetkileri'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object pnlData: TUniPanel
    Left = 0
    Top = 0
    Width = 556
    Height = 228
    Hint = ''
    Align = alClient
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    ExplicitWidth = 397
    object UniLabel2: TUniLabel
      Left = 6
      Top = 72
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Departman'
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
    end
    object UniLabel3: TUniLabel
      Left = 6
      Top = 15
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Veri Kayna'#287#305
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
    end
    object edKaynak: TUniEdit
      Left = 96
      Top = 12
      Width = 442
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      TabOrder = 3
      TabStop = False
      ReadOnly = True
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
    object UniLabel1: TUniLabel
      Left = 6
      Top = 39
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = #304'lgili Ki'#351'i'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
    end
    object edKisi: TUniEdit
      Left = 96
      Top = 36
      Width = 442
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      TabOrder = 5
      TabStop = False
      ReadOnly = True
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
    object UniLabel8: TUniLabel
      Left = 6
      Top = 104
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = #220'nvan'
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 6
    end
    object edDept: TUniDBLookupComboBox
      Left = 97
      Top = 66
      Width = 442
      Height = 28
      Hint = ''
      ListOnlyMode = lmFollowSource
      ListField = 'title'
      ListSource = dsDept
      KeyField = 'id'
      ListFieldIndex = 0
      DataField = 'dept_id'
      DataSource = dsErisim
      EmptyText = 'Se'#231'im Yap'#305'lmam'#305#351
      TabOrder = 7
      Color = clWindow
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
      OnChange = edDeptChange
    end
    object edTitle: TUniDBLookupComboBox
      Left = 96
      Top = 100
      Width = 442
      Height = 28
      Hint = ''
      ListOnlyMode = lmFollowSource
      ListField = 'title'
      ListSource = dsTitle
      KeyField = 'id'
      ListFieldIndex = 0
      DataField = 'title_id'
      DataSource = dsErisim
      EmptyText = 'Se'#231'im Yap'#305'lmam'#305#351
      TabOrder = 8
      Color = clWindow
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
      ForceSelection = True
    end
    object rgFiziksel: TUniDBRadioGroup
      Left = 12
      Top = 138
      Width = 115
      Height = 73
      Hint = ''
      DataField = 'permf'
      DataSource = dsErisim
      Caption = '  Fiziksel Eri'#351'im  '
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 9
      Items.Strings = (
        'Eri'#351'im Yok'
        'Eri'#351'im Var')
      Values.Strings = (
        'YOK'
        'VAR')
    end
    object rgSanal: TUniRadioGroup
      Left = 133
      Top = 138
      Width = 405
      Height = 73
      Hint = ''
      Items.Strings = (
        'Eri'#351'im Yok'
        'Eri'#351'im Var')
      ItemIndex = 0
      ClientEvents.ExtEvents.Strings = (
        
          'radioGroup.change=function radioGroup.change(sender, newValue, o' +
          'ldValue, eOpts)'#13#10'{'#13#10'  ajaxRequest(sender, '#39'doChange'#39', []);'#13#10'}')
      Caption = '  Dijital Eri'#351'im  '
      TabOrder = 10
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      OnAjaxEvent = rgSanalAjaxEvent
      OnChangeValue = rgSanalChangeValue
    end
    object cbSanalYetki: TUniComboBox
      Left = 365
      Top = 183
      Width = 173
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = ''
      Items.Strings = (
        'Sadece G'#246'rme'
        'De'#287'i'#351'tirme'
        'De'#287'i'#351'tirme + Silme')
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 11
      IconItems = <>
    end
  end
  object pnlButtons: TUniPanel
    Left = 0
    Top = 228
    Width = 556
    Height = 125
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 397
    DesignSize = (
      556
      125)
    object btnCancel: TUniBitBtn
      Left = 452
      Top = 85
      Width = 96
      Height = 36
      Hint = ''
      Caption = #304'ptal'
      Anchors = [akRight, akBottom]
      TabOrder = 2
      Images = MainMod.PrjImgList
      ImageIndex = 5
      OnClick = btnCancelClick
      ExplicitLeft = 293
    end
    object btnPost: TUniBitBtn
      Left = 350
      Top = 85
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Kaydet'
      Anchors = [akRight, akBottom]
      TabOrder = 1
      Images = MainMod.PrjImgList
      ImageIndex = 14
      OnClick = btnPostClick
      ExplicitLeft = 191
    end
    object pnlLog: TUniContainerPanel
      Left = 1
      Top = 1
      Width = 554
      Height = 80
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 3
      ExplicitWidth = 395
      DesignSize = (
        554
        80)
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
        Left = 114
        Top = 42
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
      object btnLog: TUniBitBtn
        Left = 434
        Top = 24
        Width = 120
        Height = 36
        Hint = ''
        Caption = 'De'#287'i'#351'iklikler'
        Anchors = [akRight, akBottom]
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 9
        Images = MainMod.PrjImgList
        ImageIndex = 1
        OnClick = btnLogClick
        ExplicitLeft = 275
      end
    end
    object btnHelp: TUniBitBtn
      Left = 6
      Top = 85
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
  object qErisim: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT *'
      'FROM data_access'
      'WHERE id = 0')
    Left = 249
    Top = 90
  end
  object dsErisim: TUniDataSource
    DataSet = qErisim
    Left = 297
    Top = 90
  end
  object qDept: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, title FROM sys_deptdef'
      'WHERE active = '#39'E'#39' AND mc_id = 2'
      'ORDER BY title')
    Left = 249
    Top = 6
  end
  object dsDept: TUniDataSource
    DataSet = qDept
    Left = 297
    Top = 6
  end
  object qTitle: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, title FROM sys_titledef'
      'WHERE active = '#39'E'#39' AND mc_id = 2'
      'ORDER BY title')
    Left = 249
    Top = 48
  end
  object dsTitle: TUniDataSource
    DataSet = qTitle
    Left = 297
    Top = 48
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT ac.*, ky.kaynak AS kaynak_str, ks.kisi AS kisi_str,'
      '  dp.title AS dept_str, tt.title as title_str'
      'FROM data_access ac'
      '  LEFT JOIN def_data_kaynak ky ON ky.id = ac.kaynak_id'
      '  LEFT JOIN def_data_kisi ks ON ks.id = ac.kisi_id'
      '  LEFT JOIN sys_deptdef dp ON dp.id = ac.dept_id'
      '  LEFT JOIN sys_titledef tt ON tt.id = ac.title_id'
      
        'WHERE ac.mc_id = :pMCID AND ac.kaynak_id = :pKaynak AND ac.kisi_' +
        'id = :pKisi'
      'ORDER BY dept_str, title_str')
    Left = 234
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pMCID'
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pKaynak'
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pKisi'
        Value = 0
      end>
  end
end
