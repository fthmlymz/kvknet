object frDepartmanListe: TfrDepartmanListe
  Left = 0
  Top = 0
  Width = 824
  Height = 400
  OnCreate = UniFrameCreate
  TabOrder = 0
  object lbKayitSayisi: TUniLabel
    Left = 300
    Top = 304
    Width = 62
    Height = 13
    Hint = ''
    Caption = 'lbKayitSayisi'
    TabOrder = 2
  end
  object pnlTop: TUniPanel
    Left = 0
    Top = 0
    Width = 824
    Height = 72
    Hint = ''
    Align = alTop
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      824
      72)
    object edSrcType: TUniComboBox
      Left = 96
      Top = 11
      Width = 96
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'DEPT. ADI'
      Items.Strings = (
        'REF. NO'
        'DEPT. KODU'
        'DEPT. ADI'
        'Y'#214'NET'#304'C'#304
        #220'ST DEPT.')
      ItemIndex = 2
      TabOrder = 1
      CharCase = ecUpperCase
      IconItems = <>
      OnChange = edSrcTypeChange
    end
    object edSrcText: TUniEdit
      Left = 96
      Top = 43
      Width = 198
      Height = 23
      Hint = ''
      CharCaseConversion = uccTurkish
      CharCase = ecUpperCase
      Text = ''
      TabOrder = 2
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase('#39'TR'#39')); '#13#10'  sender.inputEl.' +
          'dom.setSelectionRange(pos, pos);'#13#10'}'
        
          'keypress=function keypress(sender, e, eOpts)'#13#10'{'#13#10'   if (e.getKey' +
          '() == 13)'#13#10'   {'#13#10'      ajaxRequest(sender, '#39'doSearch'#39', ["aText="' +
          '+sender.getValue()]);'#13#10'   };'#13#10'}')
      OnAjaxEvent = edSrcTextAjaxEvent
    end
    object edSrcActive: TUniComboBox
      Left = 198
      Top = 11
      Width = 96
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'AKT'#304'F'
      Items.Strings = (
        'AKT'#304'F'
        'PAS'#304'F'
        'T'#220'M'#220)
      ItemIndex = 0
      TabOrder = 3
      IconItems = <>
      OnChange = edSrcActiveChange
    end
    object UniLabel1: TUniLabel
      Left = 12
      Top = 15
      Width = 78
      Height = 13
      Hint = ''
      Caption = 'Arama Kriterleri'
      TabOrder = 4
    end
    object btnSearch: TUniBitBtn
      Left = 309
      Top = 18
      Width = 96
      Height = 36
      Action = actSearch
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 5
      Images = MainMod.PrjImgList
      ImageIndex = 10
    end
    object btnClose: TUniBitBtn
      Left = 717
      Top = 18
      Width = 96
      Height = 36
      Action = actClose
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 6
      Images = MainMod.PrjImgList
      ImageIndex = 5
    end
    object btnAdd: TUniBitBtn
      Left = 411
      Top = 18
      Width = 96
      Height = 36
      Action = actAdd
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 7
      Images = MainMod.PrjImgList
      ImageIndex = 18
    end
    object btnEdit: TUniBitBtn
      Left = 513
      Top = 18
      Width = 96
      Height = 36
      Action = actEdit
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 8
      Images = MainMod.PrjImgList
      ImageIndex = 2
    end
    object UniLabel2: TUniLabel
      Left = 14
      Top = 45
      Width = 76
      Height = 13
      Hint = ''
      Caption = 'Aranacak '#304'fade'
      TabOrder = 9
    end
    object btnHelp: TUniBitBtn
      Left = 615
      Top = 18
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 10
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = btnHelpClick
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 72
    Width = 824
    Height = 328
    Hint = ''
    PagingBarAuxControl = lbKayitSayisi
    DataSource = dsDept
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    WebOptions.PageSize = 125
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Font.OverrideDefaults = [ovFontHeight]
    ParentFont = False
    TabOrder = 1
    OnColumnSort = UniDBGrid1ColumnSort
    Columns = <
      item
        FieldName = 'id'
        Title.Alignment = taCenter
        Title.Caption = 'Ref. No'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 128
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        Sortable = True
      end
      item
        FieldName = 'active'
        Title.Alignment = taCenter
        Title.Caption = 'Aktif'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 96
        Font.OverrideDefaults = [ovFontHeight]
        Alignment = taLeftJustify
        ReadOnly = True
        Sortable = True
        CheckBoxField.BooleanFieldOnly = False
        CheckBoxField.FieldValues = 'E;H'
        CheckBoxField.DisplayValues = 'EVET;HAYIR'
      end
      item
        FieldName = 'code'
        Title.Alignment = taCenter
        Title.Caption = 'Dept. Kodu'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 128
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        Sortable = True
      end
      item
        FieldName = 'title'
        Title.Alignment = taCenter
        Title.Caption = 'Departman Ad'#305
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 360
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        Sortable = True
      end
      item
        FieldName = 'mainDept'
        Title.Caption = #220'st Departman'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 330
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'man_name'
        Title.Alignment = taCenter
        Title.Caption = 'Y'#246'netici'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 250
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        Sortable = True
      end
      item
        FieldName = 'phone'
        Title.Caption = 'GSM No'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 150
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
      end
      item
        FieldName = 'email'
        Title.Caption = 'E-Mail'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 230
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
      end>
  end
  object dsDept: TUniDataSource
    DataSet = MainMod.qDept
    Left = 279
    Top = 165
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
    object actSearch: TAction
      Caption = 'Liste'
      OnExecute = actSearchExecute
    end
    object actClose: TAction
      Caption = 'Kapat'
      OnExecute = actCloseExecute
    end
  end
end
