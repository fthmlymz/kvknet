object frRptRiskAnalizRaporu: TfrRptRiskAnalizRaporu
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
      Left = 232
      Top = 18
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
    object UniLabel1: TUniLabel
      Left = 12
      Top = 28
      Width = 43
      Height = 13
      Hint = ''
      Caption = 'S'#305'ralama'
      TabOrder = 3
    end
    object edOrder: TUniComboBox
      Left = 61
      Top = 24
      Width = 161
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'Y'#220'KSEKTEN D'#220#350#220#286'E'
      Items.Strings = (
        'Y'#220'KSEKTEN D'#220#350#220#286'E'
        'D'#220#350#220'KTEN Y'#220'KSE'#286'E')
      ItemIndex = 0
      TabOrder = 4
      CharCase = ecUpperCase
      IconItems = <>
      OnChange = edOrderChange
    end
    object UniBitBtn1: TUniBitBtn
      Left = 334
      Top = 18
      Width = 96
      Height = 36
      Action = actExcel
      TabOrder = 5
      Images = MainMod.PrjImgList
      ImageIndex = 4
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
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 72
    Width = 800
    Height = 328
    Hint = ''
    ClientEvents.UniEvents.Strings = (
      
        'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  config.cls=' +
        #39'custom-grid'#39';'#13#10'}')
    DataSource = dsRisk
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
    WebOptions.Paged = False
    LoadMask.Enabled = False
    LoadMask.Message = 'Rapor haz'#305'rlan'#305'yor...'
    Align = alClient
    Font.OverrideDefaults = [ovFontHeight]
    ParentFont = False
    TabOrder = 1
    Columns = <
      item
        FieldName = 'id'
        Title.Caption = 'Ref. No'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 75
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'kaynak_str'
        Title.Caption = 'Veri Kayna'#287#305
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 250
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end
      item
        FieldName = 'kisi_str'
        Title.Caption = 'Ki'#351'i Grubu'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 200
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end
      item
        FieldName = 'kontrol_str'
        Title.Caption = 'Kontrol'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 120
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end
      item
        FieldName = 'onem_derecesi_str'
        Title.Caption = #214'nem Derecesi'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 150
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'onem_aciklama'
        Title.Caption = #214'nem A'#231#305'klama'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 300
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end
      item
        FieldName = 'koru_idarionlem'
        Title.Caption = 'Mevcut '#304'dari '#214'nlemler'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 300
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end
      item
        FieldName = 'koru_teknikonlem'
        Title.Caption = 'Mevcut Teknik '#214'nlemler'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 300
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end
      item
        FieldName = 'danisman_notu'
        Title.Caption = 'Dan'#305#351'man Notu'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 300
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end
      item
        FieldName = 'ekipman_str'
        Title.Caption = 'Ekipman (Donan'#305'm/Yaz'#305'l'#305'm/Hizmet)'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 300
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'tedbir_str'
        Title.Caption = 'G'#252'venlik Tedbirleri'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 300
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'sorumlu_str'
        Title.Caption = 'Sorumlu Departmanlar'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 300
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end
      item
        FieldName = 'calisma_talimat'
        Title.Caption = 'Planlanan '#199'al'#305#351'ma / Talimat'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 300
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end
      item
        FieldName = 'oneriler'
        Title.Caption = #214'neriler'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 300
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
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
  object qRisk: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT chl.*, onm.description as onem_aciklama'
      'FROM vw_data_checklist chl'
      
        '  LEFT JOIN def_data_onemderece onm on onm.id = chl.onem_dereces' +
        'i_id'
      'WHERE chl.active = '#39'E'#39' AND chl.mc_id = 2'
      
        'ORDER BY chl.onem_derecesi_str DESC, chl.kaynak_str, chl.kisi_st' +
        'r')
    Left = 222
    Top = 165
  end
  object dsRisk: TUniDataSource
    DataSet = qRisk
    Left = 264
    Top = 165
  end
end
