object frKVKKKisiListe: TfrKVKKKisiListe
  Left = 0
  Top = 0
  Width = 1065
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
    Width = 1065
    Height = 72
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
      1065
      72)
    object edSrcText: TUniEdit
      Left = 96
      Top = 24
      Width = 189
      Height = 23
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
          'ender.setValue(val.toLocaleUpperCase('#39'TR'#39')); '#13#10'  sender.inputEl.do' +
          'm.setSelectionRange(pos, pos);'#13#10'}')
      OnAjaxEvent = edSrcTextAjaxEvent
    end
    object UniLabel2: TUniLabel
      Left = 12
      Top = 29
      Width = 76
      Height = 13
      Hint = ''
      Caption = 'Aranacak '#304'fade'
      TabOrder = 2
    end
    object btnSearch: TUniBitBtn
      Left = 292
      Top = 18
      Width = 96
      Height = 36
      Action = actSearch
      TabOrder = 3
      Images = MainMod.PrjImgList
      ImageIndex = 10
    end
    object btnAdd: TUniBitBtn
      Left = 394
      Top = 18
      Width = 96
      Height = 36
      Action = actAdd
      TabOrder = 4
      Images = MainMod.PrjImgList
      ImageIndex = 18
    end
    object btnEdit: TUniBitBtn
      Left = 496
      Top = 18
      Width = 96
      Height = 36
      Action = actEdit
      TabOrder = 5
      Images = MainMod.PrjImgList
      ImageIndex = 2
    end
    object btnDelete: TUniBitBtn
      Left = 598
      Top = 18
      Width = 96
      Height = 36
      Action = actDelete
      TabOrder = 6
      Images = MainMod.PrjImgList
      ImageIndex = 12
    end
    object btnClose: TUniBitBtn
      Left = 957
      Top = 18
      Width = 96
      Height = 36
      Action = actClose
      Anchors = [akTop, akRight]
      TabOrder = 7
      Images = MainMod.PrjImgList
      ImageIndex = 5
    end
    object btnExcel: TUniBitBtn
      Left = 700
      Top = 18
      Width = 96
      Height = 36
      Action = actExcel
      TabOrder = 8
      Images = MainMod.PrjImgList
      ImageIndex = 4
    end
    object btnHelp: TUniBitBtn
      Left = 855
      Top = 18
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 9
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = btnHelpClick
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 72
    Width = 1065
    Height = 328
    Hint = ''
    PagingBarAuxControl = lbKayitSayisi
    TitleFont.OverrideDefaults = [ovFontHeight]
    DataSource = dsKisi
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
        FieldName = 'kisi'
        Title.Alignment = taCenter
        Title.Caption = #304'lgili Ki'#351'i'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 400
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
        DisplayMemo = True
      end
      item
        FieldName = 'description'
        Title.Alignment = taCenter
        Title.Caption = 'A'#231#305'klama'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 600
        Visible = False
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end>
  end
  object dsKisi: TUniDataSource
    DataSet = qKisi
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
    object actExcel: TAction
      Caption = 'Excel'
      OnExecute = actExcelExecute
    end
  end
  object qKisi: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM def_data_kisi')
    Left = 228
    Top = 165
  end
end
