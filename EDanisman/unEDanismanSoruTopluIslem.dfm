object frmEDanismanSoruTopluIslem: TfrmEDanismanSoruTopluIslem
  Left = 0
  Top = 0
  ClientHeight = 562
  ClientWidth = 1282
  Caption = 'E-Dan'#305#351'man Soru Tan'#305'mlar'#305' Tan'#305'mlar'#305' Toplu Ekleme'
  OnShow = UniFormShow
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
      Left = 1190
      Top = 36
      Width = 75
      Height = 36
      Hint = ''
      Caption = 'Kapat'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnSablonIndir: TUniBitBtn
      Left = 7
      Top = 36
      Width = 160
      Height = 36
      Hint = ''
      Caption = 'Excel '#350'ablonu '#304'ndir'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
      Images = MainMod.PrjImgList
      ImageIndex = 4
      OnClick = btnSablonIndirClick
    end
    object btnYukle: TUniBitBtn
      Left = 173
      Top = 36
      Width = 160
      Height = 36
      Hint = ''
      Caption = 'Excel Dosyas'#305' Y'#252'kle'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 3
      Images = MainMod.PrjImgList
      ImageIndex = 4
      OnClick = btnYukleClick
    end
    object btnAdd: TUniBitBtn
      Left = 339
      Top = 36
      Width = 160
      Height = 36
      Hint = ''
      Caption = 'Sorular'#305' Kaydet'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
      Images = MainMod.PrjImgList
      ImageIndex = 14
      OnClick = btnAddClick
    end
    object lbAydinlatma: TUniLabel
      Left = 519
      Top = 48
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Fonksiyon'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 5
    end
    object edFonk: TUniComboBox
      Left = 610
      Top = 44
      Width = 244
      Hint = ''
      Style = csDropDownList
      Text = ''
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 6
      IconItems = <>
    end
    object UniBitBtn1: TUniBitBtn
      Left = 1088
      Top = 36
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 7
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = UniBitBtn1Click
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
          Title.Caption = 'S'#305'ra No'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 50
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
        end
        item
          FieldName = 'active'
          Title.Caption = 'Aktif'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 64
          Font.OverrideDefaults = [ovFontHeight]
          CheckBoxField.FieldValues = 'E;H'
          CheckBoxField.DisplayValues = 'EVET;HAYIR'
        end
        item
          FieldName = 'soru_no'
          Title.Caption = 'Soru No'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'soru_metni'
          Title.Caption = 'Soru Metni'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'soru_aciklama'
          Title.Caption = 'A'#231#305'klama'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'referans'
          Title.Caption = 'Referans'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'secenek_sekli'
          Title.Caption = 'Se'#231'enek '#350'ekli'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
          PickList.Strings = (
            'CHECKBOX'
            'RADIOBUTTON')
        end
        item
          FieldName = 'secenek_1'
          Title.Caption = '1. Se'#231'enek'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'secenek_1_sonuc'
          Title.Caption = '1. Sonu'#231' / Tavsiye'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'secenek_1_riskseviye'
          Title.Caption = '1. Risk Seviyesi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'secenek_1_risk'
          Title.Caption = '1. Risk'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'secenek_2'
          Title.Caption = '2. Se'#231'enek'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'secenek_2_sonuc'
          Title.Caption = '2. Sonu'#231' / Tavsiye'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'secenek_2_riskseviye'
          Title.Caption = '2. Risk Seviyesi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'secenek_2_risk'
          Title.Caption = '2. Risk'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'secenek_3'
          Title.Caption = '3. Se'#231'enek'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'secenek_3_sonuc'
          Title.Caption = '3. Sonu'#231' / Tavsiye'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'secenek_3_riskseviye'
          Title.Caption = '3. Risk Seviyesi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'secenek_3_risk'
          Title.Caption = '3. Risk'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'secenek_4'
          Title.Caption = '4. Se'#231'enek'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'secenek_4_sonuc'
          Title.Caption = '4. Sonu'#231' / Tavsiye'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'secenek_4_riskseviye'
          Title.Caption = '4. Risk Seviyesi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'secenek_4_risk'
          Title.Caption = '4. Risk'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'secenek_5'
          Title.Caption = '5. Se'#231'enek'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'secenek_5_sonuc'
          Title.Caption = '5. Sonu'#231' / Tavsiye'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'secenek_5_riskseviye'
          Title.Caption = '5. Risk Seviyesi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'secenek_5_risk'
          Title.Caption = '5. Risk'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'durum'
          Title.Caption = 'Durum'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Visible = False
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'mesaj'
          Title.Caption = #304#351'lem Durumu'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 240
          Font.OverrideDefaults = [ovFontHeight]
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
        DataSource = dsImport
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
  object tblImport: TVirtualTable
    FieldDefs = <
      item
        Name = 'sirano'
        DataType = ftInteger
      end
      item
        Name = 'active'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'soru_no'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'soru_metni'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'soru_aciklama'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'referans'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'secenek_sekli'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'secenek_1'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'secenek_1_sonuc'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'secenek_1_riskseviye'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'secenek_1_risk'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'secenek_2'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'secenek_2_sonuc'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'secenek_2_riskseviye'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'secenek_2_risk'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'secenek_3'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'secenek_3_sonuc'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'secenek_3_riskseviye'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'secenek_3_risk'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'secenek_4'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'secenek_4_sonuc'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'secenek_4_riskseviye'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'secenek_4_risk'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'secenek_5'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'secenek_5_sonuc'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'secenek_5_riskseviye'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'secenek_5_risk'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'durum'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'mesaj'
        DataType = ftString
        Size = 50
      end>
    BeforePost = tblImportBeforePost
    Left = 395
    Top = 249
    Data = {
      04001D000600736972616E6F0300000000000000060061637469766501000100
      000000000700736F72755F6E6F01000500000000000A00736F72755F6D65746E
      690100E803000000000D00736F72755F6163696B6C616D610100E80300000000
      08007265666572616E730100E803000000000D00736563656E656B5F73656B6C
      6901000C00000000000900736563656E656B5F310100E803000000000F007365
      63656E656B5F315F736F6E75630100E803000000001400736563656E656B5F31
      5F7269736B7365766979650100E803000000000E00736563656E656B5F315F72
      69736B0100E803000000000900736563656E656B5F320100E803000000000F00
      736563656E656B5F325F736F6E75630100E803000000001400736563656E656B
      5F325F7269736B7365766979650100E803000000000E00736563656E656B5F32
      5F7269736B0100E803000000000900736563656E656B5F330100E80300000000
      0F00736563656E656B5F335F736F6E75630100E803000000001400736563656E
      656B5F335F7269736B7365766979650100E803000000000E00736563656E656B
      5F335F7269736B0100E803000000000900736563656E656B5F340100E8030000
      00000F00736563656E656B5F345F736F6E75630100E803000000001400736563
      656E656B5F345F7269736B7365766979650100E803000000000E00736563656E
      656B5F345F7269736B0100E803000000000900736563656E656B5F350100E803
      000000000F00736563656E656B5F355F736F6E75630100E80300000000140073
      6563656E656B5F355F7269736B7365766979650100E803000000000E00736563
      656E656B5F355F7269736B0100E803000000000500647572756D010014000000
      000005006D6573616A0100320000000000000000000000}
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
  object qSoru: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT *'
      'FROM usr_user'
      '')
    Left = 69
    Top = 144
  end
  object qFonk: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, tanim'
      'FROM def_data_aydinlatma'
      'WHERE mc_id = 2'
      'ORDER BY id')
    Left = 346
    Top = 110
  end
  object dsFonk: TUniDataSource
    DataSet = qFonk
    Left = 388
    Top = 110
  end
end
