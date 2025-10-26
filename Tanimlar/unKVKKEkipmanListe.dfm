object frKVKKEkipmanListe: TfrKVKKEkipmanListe
  Left = 0
  Top = 0
  Width = 1280
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
    Width = 1280
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
      1280
      72)
    object edSrcText: TUniEdit
      Left = 96
      Top = 41
      Width = 294
      Height = 23
      Hint = ''
      CharCaseConversion = uccTurkish
      CharCase = ecUpperCase
      Text = ''
      TabOrder = 1
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
    object UniLabel1: TUniLabel
      Left = 12
      Top = 16
      Width = 78
      Height = 13
      Hint = ''
      Caption = 'Arama Kriterleri'
      TabOrder = 2
    end
    object btnSearch: TUniBitBtn
      Left = 396
      Top = 18
      Width = 96
      Height = 36
      Action = actSearch
      TabOrder = 3
      Images = MainMod.PrjImgList
      ImageIndex = 10
    end
    object btnClose: TUniBitBtn
      Left = 1172
      Top = 18
      Width = 96
      Height = 36
      Action = actClose
      Anchors = [akTop, akRight]
      TabOrder = 4
      Images = MainMod.PrjImgList
      ImageIndex = 5
    end
    object btnAdd: TUniBitBtn
      Left = 498
      Top = 18
      Width = 96
      Height = 36
      Action = actAdd
      TabOrder = 5
      Images = MainMod.PrjImgList
      ImageIndex = 18
    end
    object btnEdit: TUniBitBtn
      Left = 600
      Top = 18
      Width = 96
      Height = 36
      Action = actEdit
      TabOrder = 6
      Images = MainMod.PrjImgList
      ImageIndex = 2
    end
    object btnDelete: TUniBitBtn
      Left = 702
      Top = 18
      Width = 96
      Height = 36
      Action = actDelete
      TabOrder = 7
      Images = MainMod.PrjImgList
      ImageIndex = 12
    end
    object UniLabel2: TUniLabel
      Left = 14
      Top = 45
      Width = 76
      Height = 13
      Hint = ''
      Caption = 'Aranacak '#304'fade'
      TabOrder = 8
    end
    object edSrcDurumu: TUniComboBox
      Left = 262
      Top = 12
      Width = 128
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'T'#220'M'#220
      Items.Strings = (
        'T'#220'M'#220
        'MEVCUT'
        'ALINMALI'
        'PLANLANDI'
        'KULLANILMIYOR')
      ItemIndex = 0
      TabOrder = 10
      CharCase = ecUpperCase
      IconItems = <>
      OnChange = edSrcTypeChange
    end
    object edSrcTipi: TUniComboBox
      Left = 96
      Top = 12
      Width = 160
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'T'#220'M'#220
      Items.Strings = (
        'T'#220'M'#220
        'DONANIM'
        'YAZILIM'
        'H'#304'ZMET')
      ItemIndex = 0
      TabOrder = 9
      CharCase = ecUpperCase
      IconItems = <>
      OnChange = edSrcTypeChange
    end
    object btnExcel: TUniBitBtn
      Left = 804
      Top = 18
      Width = 96
      Height = 36
      Action = actExcel
      TabOrder = 11
      ScreenMask.Enabled = True
      ScreenMask.Message = 'Dok'#252'man Haz'#305'rlan'#305'yor...'
      ScreenMask.Color = 16744448
      Images = MainMod.PrjImgList
      ImageIndex = 4
    end
    object btnHelp: TUniBitBtn
      Left = 1070
      Top = 18
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 12
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = btnHelpClick
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 72
    Width = 1280
    Height = 328
    Hint = ''
    PagingBarAuxControl = lbKayitSayisi
    DataSource = dsEkipman
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
        FieldName = 'tipi'
        Title.Alignment = taCenter
        Title.Caption = 'Tipi'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 120
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'durumu'
        Title.Alignment = taCenter
        Title.Caption = 'Durumu'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 120
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'ekipman'
        Title.Alignment = taCenter
        Title.Caption = 'Ekipman'
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
        Width = 500
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end>
  end
  object dsEkipman: TUniDataSource
    DataSet = MainMod.qEkipman
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
    object actDelete: TAction
      Caption = 'Kay'#305't Sil'
      OnExecute = actDeleteExecute
    end
    object actSearch: TAction
      Caption = 'Liste'
      OnExecute = actSearchExecute
    end
    object actExcel: TAction
      Caption = 'Excel'
      OnExecute = actExcelExecute
    end
    object actClose: TAction
      Caption = 'Kapat'
      OnExecute = actCloseExecute
    end
  end
end
