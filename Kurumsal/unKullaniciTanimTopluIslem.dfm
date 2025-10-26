object frmKullaniciTanimTopluIslem: TfrmKullaniciTanimTopluIslem
  Left = 0
  Top = 0
  ClientHeight = 422
  ClientWidth = 1275
  Caption = 'Kullan'#305'c'#305' Tan'#305'mlar'#305' Toplu Ekleme'
  WindowState = wsMaximized
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  TextHeight = 15
  object pnlButtons: TUniPanel
    Left = 0
    Top = 0
    Width = 1275
    Height = 60
    Hint = ''
    Align = alTop
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      1275
      60)
    object btnCancel: TUniBitBtn
      Left = 1192
      Top = 6
      Width = 75
      Height = 48
      Hint = ''
      Caption = 'Kapat'
      Anchors = [akRight, akBottom]
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnSablonIndir: TUniBitBtn
      Left = 7
      Top = 6
      Width = 160
      Height = 48
      Hint = ''
      Caption = 'Excel '#350'ablonu '#304'ndir'
      Anchors = [akLeft, akBottom]
      TabOrder = 2
      Images = MainMod.PrjImgList
      ImageIndex = 4
      OnClick = btnSablonIndirClick
    end
    object btnYukle: TUniBitBtn
      Left = 173
      Top = 6
      Width = 160
      Height = 48
      Hint = ''
      Caption = 'Excel Dosyas'#305' Y'#252'kle'
      Anchors = [akLeft, akBottom]
      TabOrder = 3
      Images = MainMod.PrjImgList
      ImageIndex = 4
      OnClick = btnYukleClick
    end
    object btnAdd: TUniBitBtn
      Left = 339
      Top = 6
      Width = 160
      Height = 48
      Hint = ''
      Caption = 'Kullan'#305'c'#305'lar'#305' Kaydet'
      Anchors = [akLeft, akBottom]
      TabOrder = 4
      Images = MainMod.PrjImgList
      ImageIndex = 14
      OnClick = btnAddClick
    end
  end
  object pnlLog: TUniContainerPanel
    Left = 0
    Top = 60
    Width = 1275
    Height = 362
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 1
    object grd: TUniDBGrid
      Left = 0
      Top = 0
      Width = 1275
      Height = 334
      Hint = ''
      ClientEvents.UniEvents.Strings = (
        
          'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  config.cls=' +
          #39'custom-grid'#39';'#13#10'}')
      DataSource = dsImport
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.Paged = False
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      TabOrder = 1
      OnDrawColumnCell = grdDrawColumnCell
      Columns = <
        item
          FieldName = 'sirano'
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
          FieldName = 'user_name'
          Title.Alignment = taCenter
          Title.Caption = 'Kullan'#305'c'#305' Ad'#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'full_name'
          Title.Alignment = taCenter
          Title.Caption = 'Ad'#305' Soyad'#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 200
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'phone'
          Title.Alignment = taCenter
          Title.Caption = 'Telefon'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'email'
          Title.Alignment = taCenter
          Title.Caption = 'E-Posta Adresi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'ldap_user_name'
          Title.Caption = 'LDAP Kullan'#305'c'#305' Ad'#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'ROL'
          Title.Caption = 'Rol'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'list_dept'
          Title.Caption = 'Yetkili Departmanlar'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'durum'
          Title.Caption = 'Durum'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 200
          Visible = False
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
          DisplayMemo = True
        end
        item
          FieldName = 'mesaj'
          Title.Alignment = taCenter
          Title.Caption = #304#351'lem Durumu'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 500
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
          DisplayMemo = True
        end>
    end
    object UniPanel1: TUniPanel
      Left = 0
      Top = 334
      Width = 1275
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
    object edMailMsg: TUniMemo
      Left = 585
      Top = 161
      Width = 91
      Height = 50
      Hint = ''
      Visible = False
      Lines.Strings = (
        'edMailMsg')
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 3
      WordWrap = False
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
        Name = 'user_name'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'full_name'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'email'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'phone'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'durum'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'mesaj'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'ldap_user_name'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ROL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'list_dept'
        DataType = ftString
        Size = 1000
      end>
    BeforePost = tblImportBeforePost
    Left = 395
    Top = 249
    Data = {
      04000B000600736972616E6F0300000000000000020069640300000000000000
      0900757365725F6E616D650100140000000000090066756C6C5F6E616D650100
      1E00000000000500656D61696C0100320000000000050070686F6E6501001400
      000000000500647572756D010014000000000005006D6573616A0100F4010000
      00000E006C6461705F757365725F6E616D6501003200000000000300524F4C01
      001E000000000009006C6973745F646570740100E80300000000000000000000}
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
  object qUser: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT *'
      'FROM usr_user'
      '')
    Left = 69
    Top = 144
  end
end
