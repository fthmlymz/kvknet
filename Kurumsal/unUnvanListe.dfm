object frUnvanListe: TfrUnvanListe
  Left = 0
  Top = 0
  Width = 967
  Height = 400
  OnCreate = UniFrameCreate
  TabOrder = 0
  object UniPanel2: TUniPanel
    Left = 0
    Top = 0
    Width = 290
    Height = 400
    Hint = ''
    Align = alLeft
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = 'UniPanel2'
    object grdDept: TUniDBGrid
      Left = 1
      Top = 22
      Width = 288
      Height = 377
      Hint = ''
      DataSource = dsDept
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.Paged = False
      LoadMask.Message = 'Loading data...'
      Align = alClient
      TabOrder = 1
      OnColumnSort = grdDeptColumnSort
      Columns = <
        item
          FieldName = 'title'
          Title.Alignment = taCenter
          Title.Caption = 'Departmanlar'
          Width = 250
          Font.OverrideDefaults = [ovFontHeight]
          Sortable = True
          DisplayMemo = True
        end
        item
          FieldName = 'active'
          Title.Caption = 'Aktif'
          Width = 75
          Font.OverrideDefaults = [ovFontHeight]
          Alignment = taLeftJustify
          Sortable = True
          CheckBoxField.BooleanFieldOnly = False
          CheckBoxField.FieldValues = 'E;H'
          CheckBoxField.DisplayValues = 'EVET;HAYIR'
        end>
    end
    object UniPanel3: TUniPanel
      Left = 1
      Top = 1
      Width = 288
      Height = 21
      Hint = ''
      Align = alTop
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
      Caption = ''
    end
  end
  object UniPanel1: TUniPanel
    Left = 296
    Top = 0
    Width = 671
    Height = 400
    Hint = ''
    Align = alClient
    TabOrder = 1
    Caption = ''
    object grdTitle: TUniDBGrid
      Left = 1
      Top = 73
      Width = 669
      Height = 326
      Hint = ''
      DataSource = dsTitle
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.Paged = False
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      TabOrder = 2
      OnColumnSort = grdTitleColumnSort
      Columns = <
        item
          FieldName = 'id'
          Title.Caption = 'Ref. No'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 75
          Font.OverrideDefaults = [ovFontHeight]
          Sortable = True
        end
        item
          FieldName = 'active'
          Title.Caption = 'Aktif'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 75
          Font.OverrideDefaults = [ovFontHeight]
          Alignment = taLeftJustify
          Sortable = True
          CheckBoxField.BooleanFieldOnly = False
          CheckBoxField.FieldValues = 'E;H'
          CheckBoxField.DisplayValues = 'EVET;HAYIR'
        end
        item
          FieldName = 'title'
          Title.Caption = #220'nvan'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 350
          Font.OverrideDefaults = [ovFontHeight]
          Sortable = True
        end>
    end
    object pnlButtons: TUniPanel
      Left = 1
      Top = 1
      Width = 669
      Height = 72
      Hint = ''
      Align = alTop
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
      ClientEvents.ExtEvents.Strings = (
        
          'resize=function resize(sender, width, height, oldWidth, oldHeigh' +
          't, eOpts)'#13#10'{'#13#10'  ajaxRequest(sender, '#39'doResize'#39', []);'#13#10'}')
      Caption = ''
      OnAjaxEvent = pnlButtonsAjaxEvent
      DesignSize = (
        669
        72)
      object btnAdd: TUniBitBtn
        Left = 136
        Top = 18
        Width = 96
        Height = 36
        Action = actAdd
        TabOrder = 1
        Images = MainMod.PrjImgList
        ImageIndex = 18
      end
      object btnEdit: TUniBitBtn
        Left = 238
        Top = 18
        Width = 96
        Height = 36
        Action = actEdit
        TabOrder = 2
        Images = MainMod.PrjImgList
        ImageIndex = 2
      end
      object btnDelete: TUniBitBtn
        Left = 340
        Top = 18
        Width = 96
        Height = 36
        Action = actDelete
        TabOrder = 3
        Images = MainMod.PrjImgList
        ImageIndex = 12
      end
      object btnClose: TUniBitBtn
        Left = 543
        Top = 18
        Width = 96
        Height = 36
        Action = actClose
        Anchors = [akTop, akRight]
        TabOrder = 4
        Images = MainMod.PrjImgList
        ImageIndex = 5
      end
      object UniLabel1: TUniLabel
        Left = 11
        Top = 28
        Width = 35
        Height = 13
        Hint = ''
        Caption = 'Durum'
        TabOrder = 5
      end
      object edSrcActive: TUniComboBox
        Left = 52
        Top = 24
        Width = 78
        Height = 23
        Hint = ''
        Style = csDropDownList
        Text = 'AKT'#304'F'
        Items.Strings = (
          'AKT'#304'F'
          'PAS'#304'F'
          'T'#220'M'#220)
        ItemIndex = 0
        TabOrder = 6
        IconItems = <>
        OnChange = edSrcActiveChange
      end
      object btnHelp: TUniBitBtn
        Left = 442
        Top = 18
        Width = 96
        Height = 36
        Hint = ''
        Caption = 'Yard'#305'm'
        Anchors = [akRight, akBottom]
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 7
        Images = MainMod.PrjImgList
        ImageIndex = 16
        OnClick = btnHelpClick
      end
    end
  end
  object UniSplitter1: TUniSplitter
    Left = 290
    Top = 0
    Width = 6
    Height = 400
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object ActList: TActionList
    Left = 321
    Top = 165
    object actAdd: TAction
      Caption = 'Yeni Kay'#305't'
      OnExecute = actAddExecute
    end
    object actEdit: TAction
      Caption = 'De'#287'i'#351'tir'
      OnExecute = actEditExecute
    end
    object actDelete: TAction
      Caption = 'Sil'
      OnExecute = actDeleteExecute
    end
    object actSearch: TAction
      Caption = 'Liste'
    end
    object actClose: TAction
      Caption = 'Kapat'
      OnExecute = actCloseExecute
    end
  end
  object dsTitle: TUniDataSource
    DataSet = qTitle
    Left = 399
    Top = 165
  end
  object qTitle: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM sys_titledef WHERE mc_id = 2')
    Left = 360
    Top = 165
  end
  object qDept: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, title, active FROM sys_deptdef'
      'WHERE mc_id = 2'
      'ORDER BY title')
    AfterScroll = qDeptAfterScroll
    Left = 93
    Top = 153
  end
  object dsDept: TUniDataSource
    DataSet = qDept
    Left = 141
    Top = 153
  end
end
