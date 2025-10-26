object frDuyuruListe: TfrDuyuruListe
  Left = 0
  Top = 0
  Width = 903
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
    Width = 903
    Height = 73
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
      903
      73)
    object edSrcText: TUniEdit
      Left = 94
      Top = 25
      Width = 189
      Hint = ''
      Text = ''
      TabOrder = 1
      ClientEvents.ExtEvents.Strings = (
        
          'keypress=function keypress(sender, e, eOpts)'#13#10'{'#13#10'   if (e.getKey' +
          '() == 13)'#13#10'   {'#13#10'      ajaxRequest(sender, '#39'doSearch'#39', ["aText="' +
          '+sender.getValue()]);'#13#10'   };'#13#10'}')
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
      Top = 19
      Width = 96
      Height = 36
      Action = actSearch
      TabOrder = 3
      Images = MainMod.PrjImgList
      ImageIndex = 10
    end
    object btnAdd: TUniBitBtn
      Left = 394
      Top = 19
      Width = 96
      Height = 36
      Action = actAdd
      TabOrder = 4
      Images = MainMod.PrjImgList
      ImageIndex = 18
    end
    object btnEdit: TUniBitBtn
      Left = 496
      Top = 19
      Width = 96
      Height = 36
      Action = actEdit
      TabOrder = 5
      Images = MainMod.PrjImgList
      ImageIndex = 2
    end
    object btnDelete: TUniBitBtn
      Left = 598
      Top = 19
      Width = 96
      Height = 36
      Action = actDelete
      TabOrder = 6
      Images = MainMod.PrjImgList
      ImageIndex = 12
    end
    object btnClose: TUniBitBtn
      Left = 803
      Top = 19
      Width = 96
      Height = 36
      Action = actClose
      Anchors = [akTop, akRight]
      TabOrder = 7
      Images = MainMod.PrjImgList
      ImageIndex = 5
    end
    object btnHelp: TUniBitBtn
      Left = 700
      Top = 19
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 8
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = btnHelpClick
    end
  end
  object grdList: TUniDBGrid
    Left = 0
    Top = 73
    Width = 903
    Height = 327
    Hint = ''
    PagingBarAuxControl = lbKayitSayisi
    DataSource = dsDuyuru
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    WebOptions.PageSize = 50
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Font.OverrideDefaults = [ovFontHeight]
    ParentFont = False
    TabOrder = 1
    OnColumnSort = grdListColumnSort
    OnDblClick = grdListDblClick
    Columns = <
      item
        FieldName = 'news_date'
        Title.Caption = 'Tarih'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 110
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'title'
        Title.Alignment = taCenter
        Title.Caption = 'Ba'#351'l'#305'k'
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
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end>
  end
  object dsDuyuru: TUniDataSource
    DataSet = qDuyuru
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
  object qDuyuru: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM sys_news')
    Left = 228
    Top = 165
  end
end
