object frmAcikRizaKayitTopluIslem: TfrmAcikRizaKayitTopluIslem
  Left = 0
  Top = 0
  ClientHeight = 422
  ClientWidth = 1275
  Caption = 'A'#231#305'k R'#305'za Listesi Toplu '#304#351'lem'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  TextHeight = 15
  object pnlExcelImport: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 1275
    Height = 422
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    object grd: TUniDBGrid
      Left = 0
      Top = 145
      Width = 1275
      Height = 249
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
          FieldName = 'tarih'
          Title.Alignment = taCenter
          Title.Caption = 'Tarih'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'saat'
          Title.Alignment = taCenter
          Title.Caption = 'Saat'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 75
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'kimlik_no'
          Title.Alignment = taCenter
          Title.Caption = 'Kimlik No'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 85
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'adsoyad'
          Title.Alignment = taCenter
          Title.Caption = 'Ad Soyad'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 200
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'gsmno'
          Title.Alignment = taCenter
          Title.Caption = 'Cep Telefonu'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'email'
          Title.Alignment = taCenter
          Title.Caption = 'E-Mail'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'islemdurum'
          Title.Caption = 'islemdurum'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 64
          Visible = False
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'islemmesaj'
          Title.Alignment = taCenter
          Title.Caption = #304#351'lem Durumu'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 300
          Font.OverrideDefaults = [ovFontHeight]
        end>
    end
    object UniPanel1: TUniPanel
      Left = 0
      Top = 394
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
    object pnlImportButtons: TUniPanel
      Left = 0
      Top = 0
      Width = 1275
      Height = 145
      Hint = ''
      Align = alTop
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 3
      Caption = ''
      DesignSize = (
        1275
        145)
      object btnCancel: TUniBitBtn
        Left = 1183
        Top = 51
        Width = 75
        Height = 44
        Hint = ''
        Caption = 'Kapat'
        Anchors = [akTop, akRight]
        TabOrder = 1
        OnClick = btnCancelClick
      end
      object btnSablonIndir: TUniBitBtn
        Left = 9
        Top = 51
        Width = 160
        Height = 44
        Hint = ''
        Caption = 'Excel '#350'ablonu '#304'ndir'
        Anchors = [akRight, akBottom]
        TabOrder = 2
        Images = MainMod.PrjImgList
        ImageIndex = 4
        OnClick = btnSablonIndirClick
      end
      object btnYukle: TUniBitBtn
        Left = 175
        Top = 51
        Width = 160
        Height = 44
        Hint = ''
        Caption = 'Excel Dosyas'#305' Y'#252'kle'
        Anchors = [akRight, akBottom]
        TabOrder = 3
        Images = MainMod.PrjImgList
        ImageIndex = 4
        OnClick = btnYukleClick
      end
      object btnAdd: TUniBitBtn
        Left = 341
        Top = 51
        Width = 160
        Height = 44
        Hint = ''
        Caption = 'Listeyi Sisteme Kaydet'
        Anchors = [akRight, akBottom]
        TabOrder = 4
        Images = MainMod.PrjImgList
        ImageIndex = 14
        OnClick = btnAddClick
      end
      object lbAydinlatma: TUniLabel
        Left = 524
        Top = 65
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'A'#231#305'k R'#305'za T'#252'r'#252
        ParentFont = False
        Font.Color = clMaroon
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 5
      end
      object edAydinlatma: TUniDBLookupComboBox
        Left = 615
        Top = 61
        Width = 223
        Height = 28
        Hint = ''
        ListOnlyMode = lmFollowSource
        ListField = 'tanim'
        ListSource = dsAyd
        KeyField = 'id'
        ListFieldIndex = 0
        DataField = 'ayd_id'
        TabOrder = 6
        Color = clWindow
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
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
        Name = 'tarih'
        DataType = ftDate
      end
      item
        Name = 'saat'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'faal_bitis'
        DataType = ftDateTime
      end
      item
        Name = 'kimlik_no'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'adsoyad'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'gsmno'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'email'
        DataType = ftString
        Size = 50
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
    Left = 387
    Top = 257
    Data = {
      04000C000600736972616E6F0300000000000000020069640300000000000000
      0500647572756D01003200000000000500746172696809000000000000000400
      7361617401000500000000000A006661616C5F62697469730B00000000000000
      09006B696D6C696B5F6E6F010014000000000007006164736F79616401002800
      00000000050067736D6E6F01001400000000000500656D61696C010032000000
      00000A0069736C656D647572756D01001400000000000A0069736C656D6D6573
      616A0100C80000000000000000000000}
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
  object qAR: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT *'
      'FROM data_acikriza'
      'where id=0'
      '')
    Left = 69
    Top = 144
  end
  object qAyd: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, tanim'
      'FROM def_data_aydinlatma'
      'WHERE mc_id = 2'
      'ORDER BY id')
    Left = 346
    Top = 110
  end
  object dsAyd: TUniDataSource
    DataSet = qAyd
    Left = 388
    Top = 110
  end
  object qOOTnm: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, tanim'
      'FROM def_data_ozelonay'
      'WHERE mc_id = 2'
      'ORDER BY id')
    Left = 344
    Top = 166
  end
  object dsOOTnm: TUniDataSource
    DataSet = qOOTnm
    Left = 389
    Top = 166
  end
end
