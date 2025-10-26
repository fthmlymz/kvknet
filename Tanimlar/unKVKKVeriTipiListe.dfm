object frKVKKVeriTipiListe: TfrKVKKVeriTipiListe
  Left = 0
  Top = 0
  Width = 1022
  Height = 400
  OnCreate = UniFrameCreate
  TabOrder = 0
  object UniPanel1: TUniPanel
    Left = 292
    Top = 0
    Width = 730
    Height = 400
    Hint = ''
    Align = alClient
    TabOrder = 1
    Caption = ''
    object grdDetail: TUniDBGrid
      Left = 1
      Top = 65
      Width = 728
      Height = 334
      Hint = ''
      TitleFont.OverrideDefaults = [ovFontHeight]
      DataSource = dsVeriTipi
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.Paged = False
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      TabOrder = 2
      OnColumnSort = grdDetailColumnSort
      OnDrawColumnCell = grdDetailDrawColumnCell
      Columns = <
        item
          FieldName = 'veri_tipi'
          Title.Alignment = taCenter
          Title.Caption = 'Veri Tipi'
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
          Visible = False
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end>
    end
    object pnlButtons: TUniPanel
      Left = 1
      Top = 1
      Width = 728
      Height = 64
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
        728
        64)
      object btnAdd: TUniBitBtn
        Left = 12
        Top = 14
        Width = 96
        Height = 36
        Action = actAdd
        TabOrder = 1
        Images = MainMod.PrjImgList
        ImageIndex = 18
      end
      object btnEdit: TUniBitBtn
        Left = 114
        Top = 14
        Width = 96
        Height = 36
        Action = actEdit
        TabOrder = 2
        Images = MainMod.PrjImgList
        ImageIndex = 2
      end
      object btnDelete: TUniBitBtn
        Left = 216
        Top = 14
        Width = 96
        Height = 36
        Action = actDelete
        TabOrder = 3
        Images = MainMod.PrjImgList
        ImageIndex = 12
      end
      object btnClose: TUniBitBtn
        Left = 622
        Top = 14
        Width = 96
        Height = 36
        Action = actClose
        Anchors = [akTop, akRight]
        TabOrder = 4
        Images = MainMod.PrjImgList
        ImageIndex = 5
      end
      object btnExcel: TUniBitBtn
        Left = 318
        Top = 14
        Width = 96
        Height = 36
        Action = actExcel
        TabOrder = 5
        Images = MainMod.PrjImgList
        ImageIndex = 4
      end
      object btnHelp: TUniBitBtn
        Left = 520
        Top = 14
        Width = 96
        Height = 36
        Hint = ''
        Caption = 'Yard'#305'm'
        Anchors = [akRight, akBottom]
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 6
        Images = MainMod.PrjImgList
        ImageIndex = 16
        OnClick = btnHelpClick
      end
    end
  end
  object UniPanel2: TUniPanel
    Left = 0
    Top = 0
    Width = 286
    Height = 400
    Hint = ''
    Align = alLeft
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = 'UniPanel2'
    object grdMain: TUniDBGrid
      Left = 1
      Top = 22
      Width = 284
      Height = 377
      Hint = ''
      TitleFont.OverrideDefaults = [ovFontHeight]
      DataSource = dsMain
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.Paged = False
      LoadMask.Message = 'Loading data...'
      Align = alClient
      TabOrder = 1
      OnColumnSort = grdMainColumnSort
      Columns = <
        item
          FieldName = 'kategori'
          Title.Alignment = taCenter
          Title.Caption = 'Veri Kategorisi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 250
          Font.OverrideDefaults = [ovFontHeight]
          Sortable = True
          DisplayMemo = True
        end>
    end
    object UniPanel3: TUniPanel
      Left = 1
      Top = 1
      Width = 284
      Height = 21
      Hint = ''
      Align = alTop
      TabOrder = 2
      Caption = ''
    end
  end
  object UniSplitter1: TUniSplitter
    Left = 286
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
      Caption = 'Kay'#305't Sil'
      OnExecute = actDeleteExecute
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
  object qMain: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM def_data_kategori'
      'WHERE mc_id = 2'
      'ORDER BY kategori')
    AfterScroll = qMainAfterScroll
    Left = 93
    Top = 153
  end
  object dsMain: TUniDataSource
    DataSet = qMain
    Left = 141
    Top = 153
  end
  object dsVeriTipi: TUniDataSource
    DataSet = MainMod.qVeriTipi
    Left = 420
    Top = 165
  end
end
