object frHelpListe: TfrHelpListe
  Left = 0
  Top = 0
  Width = 900
  Height = 400
  OnCreate = UniFrameCreate
  TabOrder = 0
  object pnlTop: TUniPanel
    Left = 0
    Top = 0
    Width = 900
    Height = 89
    Hint = ''
    Align = alTop
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    ClientEvents.ExtEvents.Strings = (
      
        'resize=function resize(sender, width, height, oldWidth, oldHeigh' +
        't, eOpts)'#13#10'{'#13#10'  ajaxRequest(sender, '#39'doResize'#39', []);'#13#10'}')
    Caption = ''
    OnAjaxEvent = pnlTopAjaxEvent
    DesignSize = (
      900
      89)
    object edSrcText: TUniEdit
      Left = 95
      Top = 14
      Width = 189
      Hint = ''
      CharCaseConversion = uccTurkish
      CharCase = ecUpperCase
      Text = ''
      TabOrder = 1
      ClientEvents.ExtEvents.Strings = (
        
          'keypress=function keypress(sender, e, eOpts)'#13#10'{'#13#10'   if (e.getKey' +
          '() == 13)'#13#10'   {'#13#10'      ajaxRequest(sender, '#39'doSearch'#39', ["aText="' +
          '+sender.getValue()]);'#13#10'   };'#13#10'}'
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase("TR")); '#13#10'  sender.inputEl.' +
          'dom.setSelectionRange(pos, pos);'#13#10'}')
      OnAjaxEvent = edSrcTextAjaxEvent
    end
    object UniLabel2: TUniLabel
      Left = 13
      Top = 21
      Width = 76
      Height = 13
      Hint = ''
      Caption = 'Aranacak '#304'fade'
      TabOrder = 2
    end
    object btnSearch: TUniBitBtn
      Left = 10
      Top = 47
      Width = 96
      Height = 36
      Action = actSearch
      TabOrder = 3
      Images = MainMod.PrjImgList
      ImageIndex = 10
    end
    object btnAdd: TUniBitBtn
      Left = 214
      Top = 47
      Width = 96
      Height = 36
      Action = actAdd
      TabOrder = 4
      Images = MainMod.PrjImgList
      ImageIndex = 18
    end
    object btnEdit: TUniBitBtn
      Left = 316
      Top = 47
      Width = 96
      Height = 36
      Action = actEdit
      TabOrder = 5
      Images = MainMod.PrjImgList
      ImageIndex = 2
    end
    object btnDelete: TUniBitBtn
      Left = 418
      Top = 47
      Width = 96
      Height = 36
      Action = actDelete
      TabOrder = 6
      Images = MainMod.PrjImgList
      ImageIndex = 12
    end
    object btnClose: TUniBitBtn
      Left = 792
      Top = 47
      Width = 96
      Height = 36
      Action = actClose
      Anchors = [akTop, akRight]
      TabOrder = 7
      Images = MainMod.PrjImgList
      ImageIndex = 5
    end
    object UniBitBtn1: TUniBitBtn
      Left = 112
      Top = 47
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'G'#246'ster'
      TabOrder = 8
      Images = MainMod.PrjImgList
      ImageIndex = 1
      OnClick = UniBitBtn1Click
    end
  end
  object grdList: TUniDBGrid
    Left = 0
    Top = 89
    Width = 900
    Height = 311
    Hint = ''
    DataSource = dsHelp
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    WebOptions.Paged = False
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Font.OverrideDefaults = [ovFontHeight]
    ParentFont = False
    TabOrder = 1
    OnColumnSort = grdListColumnSort
    OnDblClick = grdListDblClick
    Columns = <
      item
        FieldName = 'number'
        Title.Alignment = taCenter
        Title.Caption = 'S'#305'ra No'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 100
      end
      item
        FieldName = 'title'
        Title.Alignment = taCenter
        Title.Caption = 'Ba'#351'l'#305'k'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 500
        Sortable = True
        DisplayMemo = True
      end
      item
        FieldName = 'description'
        Title.Caption = 'description'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 64
        Visible = False
      end>
  end
  object dsHelp: TUniDataSource
    DataSet = qHelp
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
  object qHelp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM sys_help')
    Left = 228
    Top = 165
  end
end
