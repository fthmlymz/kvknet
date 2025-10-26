object frmDepartmanTanim: TfrmDepartmanTanim
  Left = 0
  Top = 0
  ClientHeight = 321
  ClientWidth = 666
  Caption = 'Departman Bilgileri'
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object pnlButtons: TUniPanel
    Left = 0
    Top = 231
    Width = 666
    Height = 90
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      666
      90)
    object btnCancel: TUniBitBtn
      Left = 565
      Top = 51
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
      Left = 463
      Top = 51
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
      Width = 664
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
        Left = 348
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
        Left = 348
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
        Left = 447
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
        Left = 447
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
    object btnHelp: TUniBitBtn
      Left = 9
      Top = 51
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
  object pnlData: TUniPanel
    Left = 0
    Top = 0
    Width = 666
    Height = 231
    Hint = ''
    Align = alClient
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    object UniLabel1: TUniLabel
      Left = 5
      Top = 53
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Dept. Kodu'
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
    end
    object UniLabel2: TUniLabel
      Left = 6
      Top = 80
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Dept. Ad'#305
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
    end
    object UniLabel3: TUniLabel
      Left = 6
      Top = 105
      Width = 85
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
    object edCode: TUniDBEdit
      Tag = 9
      Left = 96
      Top = 47
      Width = 100
      Height = 22
      Hint = ''
      DataField = 'code'
      DataSource = dsDept
      CharCase = ecUpperCase
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 5
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
    object edTitle: TUniDBEdit
      Left = 96
      Top = 76
      Width = 271
      Height = 22
      Hint = ''
      DataField = 'title'
      DataSource = dsDept
      CharCase = ecUpperCase
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 6
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
    object edActive: TUniDBCheckBox
      Left = 103
      Top = 104
      Width = 30
      Height = 17
      Hint = ''
      DataField = 'active'
      DataSource = dsDept
      ValueChecked = 'E'
      ValueUnchecked = 'H'
      Caption = ''
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 7
      ParentColor = False
      Color = clBtnFace
    end
    object UniLabel8: TUniLabel
      Left = 5
      Top = 133
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Y'#246'netici'
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
    end
    object edManager: TUniDBLookupComboBox
      Left = 96
      Top = 130
      Width = 271
      Height = 28
      Hint = ''
      ListOnlyMode = lmFollowSource
      ListField = 'full_name'
      ListSource = dsUsers
      KeyField = 'id'
      ListFieldIndex = 0
      DataField = 'manager'
      DataSource = dsDept
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      EmptyText = 'Se'#231'im Yap'#305'lmam'#305#351
      TabOrder = 8
      Color = clWindow
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
      Style = csDropDown
    end
    object UniLabel9: TUniLabel
      Left = 373
      Top = 28
      Width = 76
      Height = 13
      Hint = ''
      AutoSize = False
      Caption = 'Fonksiyonlar'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 9
    end
    object grdDepts: TUniDBGrid
      Left = 373
      Top = 47
      Width = 284
      Height = 168
      Hint = ''
      DataSource = dsFunc
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.Paged = False
      WebOptions.CustomizableCells = False
      WebOptions.FetchAll = True
      LoadMask.Message = 'Y'#252'kleniyor...'
      EmptyText = 'Veri Bulunamad'#305
      TabOrder = 10
      Columns = <
        item
          FieldName = 'function'
          Title.Caption = 'Fonksiyonlar'
          Width = 250
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
          DisplayMemo = True
        end>
    end
    object btnFuncEkle: TUniBitBtn
      Left = 583
      Top = 5
      Width = 36
      Height = 36
      Hint = ''
      Caption = ''
      TabOrder = 11
      Images = MainMod.PrjImgList
      ImageIndex = 18
      OnClick = btnFuncEkleClick
    end
    object BtnFuncSil: TUniBitBtn
      Left = 625
      Top = 5
      Width = 36
      Height = 36
      Hint = ''
      Caption = ''
      TabOrder = 12
      Images = MainMod.PrjImgList
      ImageIndex = 12
      OnClick = BtnFuncSilClick
    end
    object lbUBYS: TUniLabel
      Left = 5
      Top = 24
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'UBYS ID'
      ParentFont = False
      Font.Color = clBlack
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 13
    end
    object UniLabel10: TUniLabel
      Left = 3
      Top = 174
      Width = 85
      Height = 14
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = #220'st Departman'
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 14
    end
    object UniDBLookupComboBox1: TUniDBLookupComboBox
      Left = 94
      Top = 169
      Width = 273
      Height = 23
      Hint = ''
      ListField = 'title'
      ListSource = dsmaindept
      KeyField = 'id'
      ListFieldIndex = 0
      ClearButton = True
      DataField = 'main_dept_id'
      DataSource = dsDept
      TabOrder = 15
      Color = clWindow
      Style = csDropDown
    end
  end
  object edUbysDept: TUniDBNumberEdit
    Left = 96
    Top = 19
    Width = 100
    Height = 22
    Hint = ''
    DataField = 'ubys_dept_id'
    DataSource = dsDept
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 2
    DecimalSeparator = ','
  end
  object qUsers: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    Left = 261
    Top = 63
  end
  object dsDept: TUniDataSource
    DataSet = MainMod.qDept
    Left = 222
    Top = 6
  end
  object dsUsers: TUniDataSource
    DataSet = qUsers
    Left = 303
    Top = 63
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    Left = 222
    Top = 63
  end
  object qFunc: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      
        'SELECT df.*, fd.function FROM sys_deptfunc df, sys_funcdef fd WH' +
        'ERE df.func_id=fd.id AND dept_id=:dept_id')
    Left = 429
    Top = 95
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dept_id'
        Value = nil
      end>
  end
  object dsFunc: TUniDataSource
    DataSet = qFunc
    Left = 471
    Top = 95
  end
  object qmainDept: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      
        'SELECT id, title FROM sys_deptdef WHERE mc_id =4 AND   active = ' +
        #39'E'#39' and coalesce(main_dept_id,0) < 1 '
      'order by title')
    Left = 381
    Top = 183
  end
  object dsmaindept: TUniDataSource
    DataSet = qmainDept
    Left = 423
    Top = 183
  end
end
