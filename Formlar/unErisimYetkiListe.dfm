object frErisimYetkiListe: TfrErisimYetkiListe
  Left = 0
  Top = 0
  Width = 871
  Height = 400
  OnCreate = UniFrameCreate
  TabOrder = 0
  object UniPanel2: TUniPanel
    Left = 0
    Top = 0
    Width = 307
    Height = 400
    Hint = ''
    Align = alLeft
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = 'UniPanel2'
    object UniPanel3: TUniPanel
      Left = 1
      Top = 1
      Width = 305
      Height = 21
      Hint = ''
      Align = alTop
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
      ClientEvents.ExtEvents.Strings = (
        
          'resize=function resize(sender, width, height, oldWidth, oldHeigh' +
          't, eOpts)'#13#10'{'#13#10'  ajaxRequest(sender, '#39'doResize'#39', []);'#13#10'}')
      Caption = ''
      OnAjaxEvent = UniPanel3AjaxEvent
    end
    object grdMain: TUniDBTreeGrid
      Left = 1
      Top = 22
      Width = 305
      Height = 377
      Hint = ''
      DataSource = dsMain
      TreeKeyFields = 'kisi_str;kaynak_str'
      Align = alClient
      TitleFont.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
      LoadMask.Message = 'Veri y'#252'kleniyor...'
      EmptyText = 'Veri yok'
      Columns = <
        item
          FieldName = 'kaynak_str'
          Title.Caption = #304'lgili Ki'#351'i - Veri Kayna'#287#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 300
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
        end>
    end
  end
  object UniSplitter1: TUniSplitter
    Left = 307
    Top = 0
    Width = 6
    Height = 400
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object UniPanel1: TUniPanel
    Left = 313
    Top = 0
    Width = 558
    Height = 400
    Hint = ''
    Align = alClient
    TabOrder = 2
    Caption = ''
    object grdErisim: TUniDBGrid
      Left = 1
      Top = 73
      Width = 556
      Height = 277
      Hint = ''
      TitleFont.OverrideDefaults = [ovFontHeight]
      DataSource = dsErisim
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.Paged = False
      LoadMask.Message = 'Veri y'#252'kleniyor...'
      EmptyText = 'Veri yok'
      Align = alClient
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      TabOrder = 2
      Columns = <
        item
          FieldName = 'dept_str'
          Title.Caption = 'Departman'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 250
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'title_str'
          Title.Caption = #220'nvan'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 250
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'permf'
          Title.Caption = 'Fiziksel Eri'#351'im'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'perms'
          Title.Caption = 'Dijital Eri'#351'im'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
        end>
    end
    object pnlButtons: TUniPanel
      Left = 1
      Top = 1
      Width = 556
      Height = 72
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
        556
        72)
      object btnAdd: TUniBitBtn
        Left = 12
        Top = 18
        Width = 96
        Height = 36
        Action = actAdd
        TabOrder = 1
        Images = MainMod.PrjImgList
        ImageIndex = 18
      end
      object btnEdit: TUniBitBtn
        Left = 114
        Top = 18
        Width = 96
        Height = 36
        Action = actEdit
        TabOrder = 2
        Images = MainMod.PrjImgList
        ImageIndex = 2
      end
      object btnDelete: TUniBitBtn
        Left = 216
        Top = 18
        Width = 96
        Height = 36
        Action = actDelete
        TabOrder = 3
        Images = MainMod.PrjImgList
        ImageIndex = 12
      end
      object btnClose: TUniBitBtn
        Left = 450
        Top = 18
        Width = 96
        Height = 36
        Action = actClose
        Anchors = [akRight, akBottom]
        TabOrder = 4
        Images = MainMod.PrjImgList
        ImageIndex = 5
      end
      object btnHelp: TUniBitBtn
        Left = 348
        Top = 18
        Width = 96
        Height = 36
        Hint = ''
        Caption = 'Yard'#305'm'
        Anchors = [akRight, akBottom]
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 5
        Images = MainMod.PrjImgList
        ImageIndex = 16
        OnClick = btnHelpClick
      end
    end
    object UniPanel4: TUniPanel
      Left = 1
      Top = 350
      Width = 556
      Height = 49
      Hint = ''
      Align = alBottom
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 3
      ClientEvents.ExtEvents.Strings = (
        
          'resize=function resize(sender, width, height, oldWidth, oldHeigh' +
          't, eOpts)'#13#10'{'#13#10'  ajaxRequest(sender, '#39'doResize'#39', []);'#13#10'}')
      Caption = ''
      OnAjaxEvent = pnlButtonsAjaxEvent
      DesignSize = (
        556
        49)
      object UniLabel2: TUniLabel
        Left = 6
        Top = 3
        Width = 133
        Height = 17
        Hint = ''
        Caption = 'YETK'#304' A'#199'IKLAMALARI'
        ParentFont = False
        Font.Color = clMaroon
        Font.Height = -13
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
      end
      object UniLabel1: TUniLabel
        Left = 6
        Top = 24
        Width = 66
        Height = 17
        Hint = ''
        Caption = 'G : G'#214'RME'
        ParentFont = False
        Font.Color = clNavy
        Font.Height = -13
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
      end
      object UniLabel3: TUniLabel
        Left = 90
        Top = 24
        Width = 92
        Height = 17
        Hint = ''
        Caption = 'D : DE'#286#304#350'T'#304'RME'
        ParentFont = False
        Font.Color = clNavy
        Font.Height = -13
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
      end
      object UniLabel4: TUniLabel
        Left = 210
        Top = 24
        Width = 125
        Height = 17
        Hint = ''
        Caption = 'S : S'#304'LME (Tam Yetkili)'
        ParentFont = False
        Font.Color = clNavy
        Font.Height = -13
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
      end
      object btnLog: TUniBitBtn
        Left = 427
        Top = 6
        Width = 120
        Height = 36
        Hint = ''
        Caption = 'De'#287'i'#351'iklikler'
        Anchors = [akRight, akBottom]
        TabOrder = 5
        Images = MainMod.PrjImgList
        ImageIndex = 1
        OnClick = btnLogClick
      end
    end
  end
  object ActList: TActionList
    Left = 369
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
  end
  object qMain: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      
        'SELECT kaynak_id, ky.kaynak kaynak_str, kisi_id, ks.kisi kisi_st' +
        'r'
      'FROM data_envanter env'
      'LEFT JOIN def_data_kaynak ky ON env.kaynak_id=ky.id'
      'LEFT JOIN def_data_kisi ks ON env.kisi_id=ks.id'
      'WHERE mc_id = 2'
      'GROUP BY kaynak_id, ky.kaynak, kisi_id, ks.kisi'
      'ORDER BY ks.kisi, ky.kaynak')
    AfterScroll = qMainAfterScroll
    Left = 93
    Top = 153
  end
  object dsMain: TUniDataSource
    DataSet = qMain
    Left = 141
    Top = 153
  end
  object qErisim: TUniQuery
    UpdatingTable = 'data_access'
    KeyFields = 'id'
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT ac.*, ky.kaynak AS kaynak_str, ks.kisi AS kisi_str,'
      '  dp.title AS dept_str, tt.title as title_str'
      'FROM data_access ac'
      '  LEFT JOIN def_data_kaynak ky ON ky.id = ac.kaynak_id'
      '  LEFT JOIN def_data_kisi ks ON ks.id = ac.kisi_id'
      '  LEFT JOIN sys_deptdef dp ON dp.id = ac.dept_id'
      '  LEFT JOIN sys_titledef tt ON tt.id = ac.title_id'
      
        'WHERE ac.mc_id = :pMCID AND ac.kaynak_id = :pKaynak AND ac.kisi_' +
        'id = :pKisi'
      'ORDER BY dept_str, title_str')
    Left = 426
    Top = 165
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pMCID'
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pKaynak'
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pKisi'
        Value = 0
      end>
  end
  object dsErisim: TUniDataSource
    DataSet = qErisim
    Left = 474
    Top = 165
  end
end
