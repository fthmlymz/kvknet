object frRolListe: TfrRolListe
  Left = 0
  Top = 0
  Width = 1006
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
    Width = 1006
    Height = 72
    Hint = ''
    Align = alTop
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      1006
      72)
    object UniLabel1: TUniLabel
      Left = 12
      Top = 14
      Width = 78
      Height = 13
      Hint = ''
      Caption = 'Arama Kriterleri'
      TabOrder = 1
    end
    object edSrcType: TUniComboBox
      Left = 96
      Top = 10
      Width = 128
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'ROL ADI'
      Items.Strings = (
        'ROL ADI')
      ItemIndex = 0
      TabOrder = 2
      CharCase = ecUpperCase
      IconItems = <>
      OnChange = edSrcTypeChange
    end
    object edSrcText: TUniEdit
      Left = 96
      Top = 40
      Width = 128
      Height = 23
      Hint = ''
      CharCaseConversion = uccTurkish
      CharCase = ecUpperCase
      Text = ''
      TabOrder = 3
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase('#39'TR'#39')); '#13#10'  sender.inputEl.do' +
          'm.setSelectionRange(pos, pos);'#13#10'}'
        
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
      Left = 277
      Top = 18
      Width = 96
      Height = 36
      Action = actSearch
      TabOrder = 5
      Images = MainMod.PrjImgList
      ImageIndex = 10
    end
    object btnAdd: TUniBitBtn
      Left = 379
      Top = 18
      Width = 96
      Height = 36
      Action = actAdd
      TabOrder = 6
      Images = MainMod.PrjImgList
      ImageIndex = 18
    end
    object btnEdit: TUniBitBtn
      Left = 481
      Top = 18
      Width = 96
      Height = 36
      Action = actEdit
      TabOrder = 7
      Images = MainMod.PrjImgList
      ImageIndex = 2
    end
    object btnDelete: TUniBitBtn
      Left = 583
      Top = 18
      Width = 96
      Height = 36
      Action = actDelete
      TabOrder = 8
      Images = MainMod.PrjImgList
      ImageIndex = 12
    end
    object btnClose: TUniBitBtn
      Left = 891
      Top = 18
      Width = 96
      Height = 36
      Action = actClose
      Anchors = [akTop, akRight]
      TabOrder = 9
      Images = MainMod.PrjImgList
      ImageIndex = 5
    end
    object btnHelp: TUniBitBtn
      Left = 789
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
    Width = 1006
    Height = 328
    Hint = ''
    PagingBarAuxControl = lbKayitSayisi
    TitleFont.OverrideDefaults = [ovFontHeight]
    DataSource = dsRole
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
        FieldName = 'rol'
        Title.Alignment = taCenter
        Title.Caption = 'Rol Ad'#305
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 400
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end>
  end
  object dsRole: TUniDataSource
    DataSet = MainMod.qRole
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
      ShortCut = 16497
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
