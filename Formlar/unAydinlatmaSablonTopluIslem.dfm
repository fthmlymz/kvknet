object frmAydinlatmaSablonTopluIslem: TfrmAydinlatmaSablonTopluIslem
  Left = 0
  Top = 0
  ClientHeight = 430
  ClientWidth = 1277
  Caption = 'Ayd'#305'nlatma Metni Listesi Toplu '#304#351'lem'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object pnlExcelImport: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 1277
    Height = 430
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    object grd: TUniDBGrid
      Left = 0
      Top = 145
      Width = 1277
      Height = 257
      Hint = ''
      ClientEvents.UniEvents.Strings = (
        
          'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  config.cls=' +
          #39'custom-grid'#39';'#13#10'}')
      TitleFont.OverrideDefaults = [ovFontHeight]
      DataSource = dsImport
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.Paged = False
      LoadMask.Message = 'Veri y'#252'kleniyor...'
      EmptyText = 'Veri yok'
      Align = alClient
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      TabOrder = 1
      OnColumnSort = grdColumnSort
      OnDrawColumnCell = grdDrawColumnCell
      Columns = <
        item
          FieldName = 'sirano'
          Title.Alignment = taCenter
          Title.Caption = 'S'#305'ra No'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 75
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
        end
        item
          FieldName = 'id'
          Title.Alignment = taCenter
          Title.Caption = 'ID'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 64
          Visible = False
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
        end
        item
          FieldName = 'durum'
          Title.Alignment = taCenter
          Title.Caption = 'Durum'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
          PickList.Strings = (
            'AKT'#304'F'
            'RIZA ALINMADI'
            'PAS'#304'F/'#304'PTAL'
            'FAAL'#304'YET B'#304'TT'#304
            'RIZA GER'#304' '#199'EK'#304'LD'#304)
        end
        item
          FieldName = 'acik_riza'
          Title.Alignment = taCenter
          Title.Caption = 'A'#231#305'k R'#305'za'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 75
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'iys_var'
          Title.Alignment = taCenter
          Title.Caption = #304'YS Onay'#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 85
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'kisi_id'
          Title.Alignment = taCenter
          Title.Caption = 'Ki'#351'i ID'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 60
          Visible = False
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'ilgili_kisi'
          Title.Alignment = taCenter
          Title.Caption = #304'lgili Ki'#351'i Grubu'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'tanim'
          Title.Alignment = taCenter
          Title.Caption = 'Tan'#305'm'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'description'
          Title.Alignment = taCenter
          Title.Caption = 'A'#231#305'klama'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 250
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'islemmesaj'
          Title.Alignment = taCenter
          Title.Caption = #304#351'lem Durumu'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 400
          Font.OverrideDefaults = [ovFontHeight]
        end>
    end
    object UniPanel1: TUniPanel
      Left = 0
      Top = 402
      Width = 1277
      Height = 28
      Hint = ''
      Align = alBottom
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
      Caption = ''
      object UniDBNavigator1: TUniDBNavigator
        Left = 1
        Top = 1
        Width = 241
        Height = 25
        Hint = ''
        DataSource = dsImport
        VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        TabOrder = 1
      end
    end
    object pnlImportButtons: TUniPanel
      Left = 0
      Top = 0
      Width = 1277
      Height = 145
      Hint = ''
      Align = alTop
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 3
      Caption = ''
      DesignSize = (
        1277
        145)
      object btnCancel: TUniBitBtn
        Left = 1191
        Top = 49
        Width = 75
        Height = 44
        Hint = ''
        Caption = 'Kapat'
        Anchors = [akRight, akBottom]
        TabOrder = 1
        OnClick = btnCancelClick
      end
      object btnSablonIndir: TUniBitBtn
        Left = 8
        Top = 49
        Width = 160
        Height = 48
        Hint = ''
        Caption = 'Excel '#350'ablonu '#304'ndir'
        Anchors = [akRight, akBottom]
        TabOrder = 2
        Images = MainMod.PrjImgList
        ImageIndex = 4
        OnClick = btnSablonIndirClick
      end
      object btnYukle: TUniBitBtn
        Left = 174
        Top = 49
        Width = 160
        Height = 48
        Hint = ''
        Caption = 'Excel Dosyas'#305' Y'#252'kle'
        Anchors = [akRight, akBottom]
        TabOrder = 3
        Images = MainMod.PrjImgList
        ImageIndex = 4
        OnClick = btnYukleClick
      end
      object btnAdd: TUniBitBtn
        Left = 340
        Top = 49
        Width = 160
        Height = 48
        Hint = ''
        Caption = 'Listeyi Sisteme Kaydet'
        Anchors = [akRight, akBottom]
        TabOrder = 4
        Images = MainMod.PrjImgList
        ImageIndex = 14
        OnClick = btnAddClick
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
  object tblImport: TVirtualTable
    FieldDefs = <
      item
        Name = 'sirano'
        DataType = ftInteger
      end
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'durum'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'acik_riza'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'iys_var'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'kisi_id'
        DataType = ftInteger
      end
      item
        Name = 'ilgili_kisi'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'tanim'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'description'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'islemdurum'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'islemmesaj'
        DataType = ftString
        Size = 200
      end>
    BeforePost = tblImportBeforePost
    Left = 395
    Top = 249
    Data = {
      04000B000600736972616E6F0300000000000000020069640300000000000000
      0500647572756D010032000000000009006163696B5F72697A61010001000000
      000007006979735F766172010001000000000007006B6973695F696403000000
      000000000B00696C67696C695F6B6973690100640000000000050074616E696D
      01006400000000000B006465736372697074696F6E0100F401000000000A0069
      736C656D647572756D01001400000000000A0069736C656D6D6573616A0100C8
      0000000000000000000000}
  end
  object dsImport: TUniDataSource
    DataSet = tblImport
    Left = 440
    Top = 249
  end
  object FileUp: TUniFileUpload
    MaxAllowedSize = 10485760
    Filter = '.XLSX'
    Title = 'Dosya Y'#252'kle'
    Messages.Uploading = 'Y'#252'kleniyor...'
    Messages.PleaseWait = 'L'#252'tfen Bekleyiniz'
    Messages.Cancel = #304'ptal'
    Messages.Processing = 'Y'#252'kleniyor...'
    Messages.UploadError = 'Y'#252'kleme Hatas'#305
    Messages.Upload = 'Y'#252'kle'
    Messages.NoFileError = 'L'#252'tfen Y'#252'klenecek Dosya Se'#231'iniz'
    Messages.BrowseText = 'Se'#231'...'
    Messages.UploadTimeout = 'Timeout occurred...'
    Messages.MaxSizeError = 'File is bigger than maximum allowed size'
    Messages.MaxFilesError = 'You can upload maximum %d files.'
    Width = 400
    OnCompleted = FileUpCompleted
    Left = 231
    Top = 219
  end
  object qAYD: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT *'
      'FROM data_acikriza'
      'where id=0'
      '')
    Left = 69
    Top = 144
  end
  object qKisi: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT DISTINCT env.kisi_id, ks.kisi'
      'FROM data_envanter env'
      'LEFT JOIN def_data_kisi ks ON ks.id = env.kisi_id'
      'ORDER BY 2')
    Left = 387
    Top = 316
  end
end
