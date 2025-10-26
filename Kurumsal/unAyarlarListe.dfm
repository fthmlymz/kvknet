object frAyarlarListe: TfrAyarlarListe
  Left = 0
  Top = 0
  Width = 960
  Height = 400
  OnCreate = UniFrameCreate
  TabOrder = 0
  object pnlTop: TUniPanel
    Left = 0
    Top = 0
    Width = 960
    Height = 72
    Hint = ''
    Align = alTop
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      960
      72)
    object UniLabel1: TUniLabel
      Left = 12
      Top = 13
      Width = 78
      Height = 13
      Hint = ''
      Caption = 'Arama Kriterleri'
      TabOrder = 1
    end
    object edSrcType: TUniComboBox
      Left = 96
      Top = 10
      Width = 190
      Height = 23
      Hint = ''
      Style = csDropDownList
      Text = 'PARAMETRE'
      Items.Strings = (
        'PARAMETRE')
      ItemIndex = 0
      TabOrder = 2
      CharCase = ecUpperCase
      IconItems = <>
      OnChange = edSrcTypeChange
    end
    object edSrcText: TUniEdit
      Left = 96
      Top = 39
      Width = 190
      Height = 23
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      TabOrder = 3
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}'
        
          'keypress=function keypress(sender, e, eOpts)'#13#10'{'#13#10'   if (e.getKey' +
          '() == 13)'#13#10'   {'#13#10'      ajaxRequest(sender, '#39'doSearch'#39', ["aText="' +
          '+sender.getValue()]);'#13#10'   };'#13#10'}')
      OnAjaxEvent = edSrcTextAjaxEvent
    end
    object UniLabel2: TUniLabel
      Left = 14
      Top = 43
      Width = 76
      Height = 13
      Hint = ''
      Caption = 'Aranacak '#304'fade'
      TabOrder = 4
    end
    object btnSearch: TUniBitBtn
      Left = 292
      Top = 18
      Width = 96
      Height = 36
      Action = actSearch
      TabOrder = 5
      Images = MainMod.PrjImgList
      ImageIndex = 10
    end
    object btnAdd: TUniBitBtn
      Left = 394
      Top = 18
      Width = 96
      Height = 36
      Action = actAdd
      TabOrder = 6
      Images = MainMod.PrjImgList
      ImageIndex = 18
    end
    object btnEdit: TUniBitBtn
      Left = 496
      Top = 18
      Width = 96
      Height = 36
      Action = actEdit
      TabOrder = 7
      Images = MainMod.PrjImgList
      ImageIndex = 2
    end
    object btnDelete: TUniBitBtn
      Left = 598
      Top = 18
      Width = 96
      Height = 36
      Action = actDelete
      TabOrder = 8
      Images = MainMod.PrjImgList
      ImageIndex = 12
    end
    object btnClose: TUniBitBtn
      Left = 860
      Top = 18
      Width = 96
      Height = 36
      Action = actClose
      Anchors = [akTop, akRight]
      TabOrder = 9
      Images = MainMod.PrjImgList
      ImageIndex = 5
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 72
    Width = 960
    Height = 328
    Hint = ''
    DataSource = dsParam
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    WebOptions.Paged = False
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Font.OverrideDefaults = [ovFontHeight]
    ParentFont = False
    TabOrder = 1
    Columns = <
      item
        FieldName = 'module'
        Title.Alignment = taCenter
        Title.Caption = 'Mod'#252'l'
        Width = 120
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'sub_module'
        Title.Alignment = taCenter
        Title.Caption = 'Alt Mod'#252'l'
        Width = 120
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'param_val'
        Title.Alignment = taCenter
        Title.Caption = 'Parametre'
        Width = 300
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'val1'
        Title.Alignment = taCenter
        Title.Caption = '1. De'#287'er'
        Width = 200
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'description'
        Title.Alignment = taCenter
        Title.Caption = 'A'#231#305'klama'
        Width = 600
        Font.OverrideDefaults = [ovFontHeight]
      end>
  end
  object dsParam: TUniDataSource
    DataSet = MainMod.qParam
    Left = 276
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
    object actDelete: TAction
      Caption = 'Kay'#305't Sil'
      OnExecute = actDeleteExecute
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
