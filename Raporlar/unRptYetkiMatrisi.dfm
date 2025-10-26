object frRptYetkiMatrisi: TfrRptYetkiMatrisi
  Left = 0
  Top = 0
  Width = 800
  Height = 400
  OnCreate = UniFrameCreate
  TabOrder = 0
  object pnlTop: TUniPanel
    Left = 0
    Top = 0
    Width = 800
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
    DesignSize = (
      800
      72)
    object btnSearch: TUniBitBtn
      Left = 223
      Top = 17
      Width = 96
      Height = 36
      Action = actSearch
      TabOrder = 1
      Images = MainMod.PrjImgList
      ImageIndex = 10
    end
    object btnClose: TUniBitBtn
      Left = 694
      Top = 18
      Width = 96
      Height = 36
      Action = actClose
      Anchors = [akRight, akBottom]
      TabOrder = 2
      Images = MainMod.PrjImgList
      ImageIndex = 5
    end
    object UniBitBtn1: TUniBitBtn
      Left = 325
      Top = 18
      Width = 96
      Height = 36
      Action = actExcel
      TabOrder = 3
      Images = MainMod.PrjImgList
      ImageIndex = 4
    end
    object UniLabel1: TUniLabel
      Left = 10
      Top = 29
      Width = 31
      Height = 13
      Hint = ''
      Caption = 'Rapor'
      TabOrder = 4
    end
    object edRapor: TUniComboBox
      Left = 47
      Top = 25
      Width = 161
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'F'#304'Z'#304'KSEL + D'#304'J'#304'TAL'
      Items.Strings = (
        'F'#304'Z'#304'KSEL + D'#304'J'#304'TAL'
        'SADECE F'#304'Z'#304'KSEL'
        'SADECE D'#304'J'#304'TAL')
      ItemIndex = 0
      TabOrder = 5
      CharCase = ecUpperCase
      IconItems = <>
      OnChange = edRaporChange
    end
    object btnHelp: TUniBitBtn
      Left = 592
      Top = 18
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
  object grdMatris: TUniDBGrid
    Left = 0
    Top = 72
    Width = 800
    Height = 328
    Hint = ''
    ClientEvents.UniEvents.Strings = (
      
        'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  config.cls=' +
        #39'custom-grid'#39';'#13#10'}')
    DataSource = dsMatris
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    WebOptions.Paged = False
    Grouping.FieldName = 'kisi_str'
    Grouping.Enabled = True
    LoadMask.Enabled = False
    LoadMask.Message = 'Rapor haz'#305'rlan'#305'yor...'
    Align = alClient
    Font.OverrideDefaults = [ovFontHeight]
    ParentFont = False
    TabOrder = 1
    OnColumnSort = grdMatrisColumnSort
    Columns = <
      item
        FieldName = 'kisi_str'
        Title.Caption = 'Ki'#351'i Grubu'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 300
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
        Locked = True
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end
      item
        FieldName = 'kaynak_str'
        Title.Caption = 'Veri Kayna'#287#305
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 300
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
        Locked = True
        Menu.MenuEnabled = False
        Menu.ColumnHideable = False
      end>
  end
  object ActList: TActionList
    Left = 156
    Top = 165
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
  object qErisim: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT *'
      'FROM data_access'
      
        'WHERE mc_id = :pMCID AND kaynak_id = :pKyID AND kisi_id = :pKsID' +
        '  and coalesce(title_id,0) >0'
      'ORDER BY id')
    Left = 222
    Top = 165
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pMCID'
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pKyID'
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pKsID'
        Value = 0
      end>
  end
  object tblMatris: TVirtualTable
    FieldDefs = <
      item
        Name = 'kaynak_id'
        DataType = ftInteger
      end
      item
        Name = 'kisi_id'
        DataType = ftInteger
      end
      item
        Name = 'kaynak_str'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'kisi_str'
        DataType = ftString
        Size = 100
      end>
    Left = 219
    Top = 225
    Data = {
      0400040009006B61796E616B5F6964030000000000000007006B6973695F6964
      03000000000000000A006B61796E616B5F737472010064000000000008006B69
      73695F7374720100640000000000000000000000}
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT chl.*, onm.description as onem_aciklama'
      'FROM vw_data_checklist chl'
      
        '  LEFT JOIN def_data_onemderece onm on onm.id = chl.onem_dereces' +
        'i_id'
      'WHERE chl.active = '#39'E'#39' AND chl.mc_id = 2'
      
        'ORDER BY chl.onem_derecesi_str DESC, chl.kaynak_str, chl.kisi_st' +
        'r')
    Left = 156
    Top = 219
  end
  object dsMatris: TUniDataSource
    DataSet = tblMatris
    Left = 264
    Top = 225
  end
end
