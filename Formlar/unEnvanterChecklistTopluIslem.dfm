object frmEnvanterChecklistTopluIslem: TfrmEnvanterChecklistTopluIslem
  Left = 0
  Top = 0
  ClientHeight = 562
  ClientWidth = 1282
  Caption = 'E-Dan'#305#351'man Soru Tan'#305'mlar'#305' Tan'#305'mlar'#305' Toplu Ekleme'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  TextHeight = 15
  object pnlButtons: TUniPanel
    Left = 0
    Top = 0
    Width = 1282
    Height = 110
    Hint = ''
    Align = alTop
    TabOrder = 0
    Caption = ''
    DesignSize = (
      1282
      110)
    object btnCancel: TUniBitBtn
      Left = 1199
      Top = 62
      Width = 75
      Height = 44
      Hint = ''
      Caption = 'Kapat'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnListele: TUniBitBtn
      Left = 366
      Top = 56
      Width = 160
      Height = 48
      Hint = ''
      Caption = 'Listele'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
      Images = MainMod.PrjImgList
      ImageIndex = 14
      OnClick = btnListeleClick
    end
    object UniGroupBox1: TUniGroupBox
      Left = 12
      Top = 34
      Width = 150
      Height = 72
      Hint = ''
      Caption = 'Envanter Formlar'#305
      TabOrder = 3
      object UniLabel9: TUniLabel
        Left = 3
        Top = 18
        Width = 50
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Aktif'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
      end
      object UniLabel1: TUniLabel
        Left = 3
        Top = 37
        Width = 50
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Pasif'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
      end
      object cbEnvanterAktif: TUniCheckBox
        Left = 72
        Top = 18
        Width = 28
        Height = 17
        Hint = ''
        Caption = ''
        TabOrder = 3
      end
      object cbEnvanterPasif: TUniCheckBox
        Left = 72
        Top = 37
        Width = 28
        Height = 17
        Hint = ''
        Caption = ''
        TabOrder = 4
      end
    end
    object UniGroupBox2: TUniGroupBox
      Left = 201
      Top = 34
      Width = 150
      Height = 72
      Hint = ''
      Caption = 'Kontrol Formlar'#305
      TabOrder = 4
      object UniLabel2: TUniLabel
        Left = 3
        Top = 18
        Width = 50
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Aktif'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
      end
      object UniLabel3: TUniLabel
        Left = 3
        Top = 37
        Width = 50
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Pasif'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
      end
      object cbKontrolAktif: TUniCheckBox
        Left = 72
        Top = 18
        Width = 28
        Height = 17
        Hint = ''
        Caption = ''
        TabOrder = 3
      end
      object cbKontrolPasif: TUniCheckBox
        Left = 72
        Top = 37
        Width = 28
        Height = 17
        Hint = ''
        Caption = ''
        TabOrder = 4
      end
    end
    object btnEnvanterAc: TUniBitBtn
      Left = 537
      Top = 56
      Width = 160
      Height = 48
      Hint = ''
      Caption = 'Envanter Listesinde A'#231
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 5
      Images = MainMod.PrjImgList
      ImageIndex = 14
      OnClick = btnEnvanterAcClick
    end
  end
  object pnlLog: TUniContainerPanel
    Left = 0
    Top = 110
    Width = 1282
    Height = 452
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 1
    object grd: TUniDBGrid
      Left = 0
      Top = 0
      Width = 1282
      Height = 424
      Hint = ''
      ClientEvents.UniEvents.Strings = (
        
          'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  config.cls=' +
          #39'custom-grid'#39';'#13#10'}')
      TitleFont.OverrideDefaults = [ovFontHeight]
      DataSource = dsKontrol
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.Paged = False
      LoadMask.Message = 'Veri y'#252'kleniyor...'
      EmptyText = 'Veri yok'
      Align = alClient
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      TabOrder = 1
      OnDrawColumnCell = grdDrawColumnCell
      Columns = <
        item
          FieldName = 'kaynak_str'
          Title.Caption = 'Kaynak'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 250
        end
        item
          FieldName = 'kisi_str'
          Title.Caption = 'Ki'#351'i'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 250
        end
        item
          FieldName = 'env_var'
          Title.Caption = 'Envanter Var'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Alignment = taLeftJustify
          CheckBoxField.BooleanFieldOnly = False
          CheckBoxField.FieldValues = 'E;H'
          CheckBoxField.DisplayValues = 'Evet;Hay'#305'r'
        end
        item
          FieldName = 'env_active'
          Title.Caption = 'Envanter Aktif'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Alignment = taLeftJustify
          CheckBoxField.BooleanFieldOnly = False
          CheckBoxField.FieldValues = 'E;H'
          CheckBoxField.DisplayValues = 'Evet;Hay'#305'r'
        end
        item
          FieldName = 'chl_var'
          Title.Caption = 'Kontrol Var'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Alignment = taLeftJustify
          CheckBoxField.BooleanFieldOnly = False
          CheckBoxField.FieldValues = 'E;H'
          CheckBoxField.DisplayValues = 'Evet;Hay'#305'r'
        end
        item
          FieldName = 'chl_active'
          Title.Caption = 'Kontrol Aktif'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Alignment = taLeftJustify
          CheckBoxField.BooleanFieldOnly = False
          CheckBoxField.FieldValues = 'E;H'
          CheckBoxField.DisplayValues = 'Evet;Hay'#305'r'
        end
        item
          FieldName = 'chl_kilitli'
          Title.Caption = 'Kontrol Kilitli'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Alignment = taLeftJustify
          CheckBoxField.BooleanFieldOnly = False
          CheckBoxField.FieldValues = 'E;H'
          CheckBoxField.DisplayValues = 'Evet;Hay'#305'r'
        end>
    end
    object UniPanel1: TUniPanel
      Left = 0
      Top = 424
      Width = 1282
      Height = 28
      Hint = ''
      Align = alBottom
      TabOrder = 2
      Caption = ''
      object UniDBNavigator1: TUniDBNavigator
        Left = 1
        Top = 1
        Width = 241
        Height = 25
        Hint = ''
        DataSource = dsKontrol
        VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        TabOrder = 1
      end
    end
  end
  object qTmp: TUniQuery
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
    Left = 447
    Top = 315
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
  object dsKontrol: TUniDataSource
    DataSet = qKontrol
    Left = 440
    Top = 249
  end
  object tblKontrol: TVirtualTable
    FieldDefs = <
      item
        Name = 'kaynak_str'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'kisi_str'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'env_var'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'chl_var'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'durum'
        DataType = ftInteger
      end
      item
        Name = 'env_active'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'chl_active'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'chl_kilitli'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'env_id'
        DataType = ftInteger
      end
      item
        Name = 'chl_id'
        DataType = ftInteger
      end>
    Left = 368
    Top = 248
    Data = {
      04000A000A006B61796E616B5F737472010064000000000008006B6973695F73
      747201006400000000000700656E765F7661720100010000000000070063686C
      5F76617201000100000000000500647572756D03000000000000000A00656E76
      5F61637469766501000100000000000A0063686C5F6163746976650100010000
      0000000B0063686C5F6B696C69746C6901001400000000000600656E765F6964
      0300000000000000060063686C5F69640300000000000000000000000000}
  end
  object qKontrol: TVirtualQuery
    SourceDataSets = <
      item
        DataSet = tblKontrol
      end>
    SQL.Strings = (
      'SELECT * FROM tblKontrol'
      'ORDER BY durum')
    Left = 506
    Top = 242
  end
end
