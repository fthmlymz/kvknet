object frmOzelOnaySablonTanim: TfrmOzelOnaySablonTanim
  Left = 0
  Top = 0
  ClientHeight = 591
  ClientWidth = 535
  Caption = #214'zel Onay Belgesi Bilgileri'
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object pnlButtons: TUniPanel
    Left = 0
    Top = 495
    Width = 535
    Height = 96
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      535
      96)
    object btnCancel: TUniBitBtn
      Left = 431
      Top = 55
      Width = 96
      Height = 36
      Hint = ''
      Caption = #304'ptal'
      Anchors = [akRight, akBottom]
      TabOrder = 2
      Images = MainMod.PrjImgList
      ImageIndex = 5
      OnClick = btnCancelClick
    end
    object btnPost: TUniBitBtn
      Left = 329
      Top = 55
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Kaydet'
      Anchors = [akRight, akBottom]
      TabOrder = 1
      Images = MainMod.PrjImgList
      ImageIndex = 14
      OnClick = btnPostClick
    end
    object pnlLog: TUniContainerPanel
      Left = 1
      Top = 1
      Width = 533
      Height = 48
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 3
      object UniLabel4: TUniLabel
        Left = 12
        Top = 6
        Width = 96
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = #304'lk Kay'#305't Yapan :'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
      end
      object UniLabel5: TUniLabel
        Left = 12
        Top = 24
        Width = 96
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = #304'lk Kay'#305't Zaman'#305' :'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
      end
      object UniLabel6: TUniLabel
        Left = 268
        Top = 5
        Width = 96
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Son De'#287'. Yapan :'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
      end
      object UniLabel7: TUniLabel
        Left = 268
        Top = 23
        Width = 96
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Son De'#287'. Zaman'#305' :'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
      end
      object lbIDY: TUniLabel
        Left = 111
        Top = 5
        Width = 150
        Height = 13
        Hint = ''
        AutoSize = False
        Caption = 'lbIDY'
        ParentFont = False
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 5
      end
      object lbIDT: TUniLabel
        Left = 111
        Top = 24
        Width = 150
        Height = 13
        Hint = ''
        AutoSize = False
        Caption = 'lbIDT'
        ParentFont = False
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 6
      end
      object lbSDY: TUniLabel
        Left = 367
        Top = 5
        Width = 150
        Height = 13
        Hint = ''
        AutoSize = False
        Caption = 'lbSDY'
        ParentFont = False
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 7
      end
      object lbSDT: TUniLabel
        Left = 367
        Top = 23
        Width = 150
        Height = 13
        Hint = ''
        AutoSize = False
        Caption = 'lbSDT'
        ParentFont = False
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 8
      end
    end
    object btnEdit: TUniBitBtn
      Left = 227
      Top = 55
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'De'#287'i'#351'tir'
      Anchors = [akRight, akBottom]
      TabOrder = 4
      Images = MainMod.PrjImgList
      ImageIndex = 2
      OnClick = btnEditClick
    end
    object btnYardim: TUniBitBtn
      Left = 9
      Top = 55
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      TabOrder = 5
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = btnYardimClick
    end
  end
  object PgControl: TUniPageControl
    Left = 0
    Top = 0
    Width = 535
    Height = 495
    Hint = ''
    ActivePage = pgGenel
    Align = alClient
    TabOrder = 1
    object pgGenel: TUniTabSheet
      Hint = ''
      Caption = 'Genel Bilgiler'
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      object UniLabel1: TUniLabel
        Left = 5
        Top = 12
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Durumu'
        ParentFont = False
        Font.Color = clMaroon
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 0
      end
      object edDurum: TUniDBComboBox
        Left = 96
        Top = 9
        Width = 175
        Height = 28
        Hint = ''
        DataField = 'durum'
        DataSource = dsOzelOnay
        Style = csDropDownList
        Items.Strings = (
          'YAYINDA'
          #304'NCELEMEDE'
          'PAS'#304'F')
        TabOrder = 1
        IconItems = <>
      end
      object UniLabel3: TUniLabel
        Left = 5
        Top = 42
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Belge Tan'#305'm'#305
        ParentFont = False
        Font.Color = clMaroon
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
      end
      object edTanim: TUniDBEdit
        Left = 96
        Top = 37
        Width = 418
        Height = 22
        Hint = ''
        DataField = 'tanim'
        DataSource = dsOzelOnay
        CharCase = ecUpperCase
        TabOrder = 3
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel8: TUniLabel
        Left = 5
        Top = 66
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'A'#231#305'klama'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
      end
      object edDesc: TUniDBMemo
        Left = 97
        Top = 65
        Width = 417
        Height = 119
        Hint = ''
        DataField = 'description'
        DataSource = dsOzelOnay
        TabOrder = 5
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object grBilgilendirme: TUniGroupBox
        Left = 6
        Top = 185
        Width = 508
        Height = 63
        Hint = ''
        Caption = 'Bilgilendirme Dosyas'#305
        TabOrder = 6
        object btnBilgiDetail: TUniButton
          Tag = 1
          Left = 406
          Top = 10
          Width = 96
          Height = 36
          Hint = ''
          Caption = 'Detay'
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
          Images = MainMod.PrjImgList
          ImageIndex = 1
          OnClick = btnBilgiDetailClick
        end
        object edBilgiTur: TUniDBEdit
          Left = 9
          Top = 16
          Width = 50
          Height = 22
          Hint = ''
          DataField = 'dosya_tur'
          DataSource = dsDosyaBilgi
          CharCase = ecUpperCase
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 2
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
        object edBilgiAciklama: TUniDBEdit
          Left = 63
          Top = 16
          Width = 337
          Height = 22
          Hint = ''
          DataField = 'dosya_aciklama'
          DataSource = dsDosyaBilgi
          CharCase = ecUpperCase
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 3
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
      end
      object edAcikRiza: TUniDBCheckBox
        Left = 17
        Top = 251
        Width = 250
        Height = 17
        Hint = ''
        DataField = 'onay_var'
        DataSource = dsOzelOnay
        ValueChecked = 'E'
        ValueUnchecked = 'H'
        Caption = 'Onay / R'#305'za Beyan'#305' Gerekli'
        ParentFont = False
        Font.Color = 13226752
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 7
        ParentColor = False
        Color = clBtnFace
        OnClick = edAcikRizaClick
      end
      object grRiza: TUniGroupBox
        Left = 6
        Top = 267
        Width = 508
        Height = 63
        Hint = ''
        Caption = 'Onay / R'#305'za Dosyas'#305
        TabOrder = 8
        object btnOnayDetail: TUniButton
          Tag = 2
          Left = 406
          Top = 10
          Width = 96
          Height = 36
          Hint = ''
          Caption = 'Detay'
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
          Images = MainMod.PrjImgList
          ImageIndex = 1
          OnClick = btnOnayDetailClick
        end
        object edOnayTur: TUniDBEdit
          Left = 9
          Top = 16
          Width = 50
          Height = 22
          Hint = ''
          DataField = 'dosya_tur'
          DataSource = dsDosyaOnay
          CharCase = ecUpperCase
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 2
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
        object edOnayAciklama: TUniDBEdit
          Left = 65
          Top = 16
          Width = 335
          Height = 22
          Hint = ''
          DataField = 'dosya_aciklama'
          DataSource = dsDosyaOnay
          CharCase = ecUpperCase
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 3
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
      end
      object UniLabel2: TUniLabel
        Left = 8
        Top = 397
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Web Link Adresi'
        ParentFont = False
        Font.Color = clNavy
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 12
      end
      object edWebLink: TUniEdit
        Left = 99
        Top = 393
        Width = 289
        Hint = ''
        Text = ''
        TabOrder = 11
        TabStop = False
        ReadOnly = True
      end
      object btnPrepLink: TUniBitBtn
        Left = 16
        Top = 418
        Width = 120
        Height = 36
        Hint = ''
        Caption = 'Link Olu'#351'tur'
        TabOrder = 13
        Images = MainMod.PrjImgList
        ImageIndex = 9
        OnClick = btnPrepLinkClick
      end
      object btnGoToLink: TUniBitBtn
        Left = 142
        Top = 418
        Width = 120
        Height = 36
        Hint = ''
        Caption = 'Adrese Git'
        TabOrder = 14
        Images = MainMod.PrjImgList
        ImageIndex = 0
        OnClick = btnGoToLinkClick
      end
      object edIYSOnay: TUniDBCheckBox
        Left = 17
        Top = 338
        Width = 250
        Height = 17
        Hint = ''
        DataField = 'iys_var'
        DataSource = dsOzelOnay
        ValueChecked = 'E'
        ValueUnchecked = 'H'
        Caption = #304'YS Onay'#305' Gerekli'
        ParentFont = False
        Font.Color = 13226752
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 9
        ParentColor = False
        Color = clBtnFace
        OnClick = edAcikRizaClick
      end
      object btnQRCode: TUniBitBtn
        Left = 268
        Top = 418
        Width = 120
        Height = 36
        Hint = ''
        Caption = 'Karekodu '#304'ndir'
        TabOrder = 15
        Images = MainMod.PrjImgList
        ImageIndex = 6
        OnClick = btnQRCodeClick
      end
      object imgQRCode: TUniImage
        Left = 394
        Top = 335
        Width = 120
        Height = 120
        Hint = ''
        Stretch = True
      end
      object UniDBComboBox1: TUniDBComboBox
        Left = 100
        Top = 359
        Width = 171
        Height = 28
        Hint = ''
        DataField = 'oo_tur'
        DataSource = dsOzelOnay
        Style = csDropDownList
        Items.Strings = (
          #214'ZEL ONAY'
          'AYDINLATMA'
          'A'#199'IK RIZA'
          'POL'#304'T'#304'KA'
          'KOM'#304'SYON KARARI'
          'PORTALDA PAS'#304'F')
        TabOrder = 10
        IconItems = <>
      end
      object UniLabel9: TUniLabel
        Left = 9
        Top = 364
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Portal Grubu '
        ParentFont = False
        Font.Color = clNavy
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 17
      end
    end
    object pgVeriKaynagi: TUniTabSheet
      Hint = ''
      Caption = 'Veri Kaynaklar'#305
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      object UniLabel11: TUniLabel
        Left = 12
        Top = 12
        Width = 86
        Height = 13
        Hint = ''
        Caption = 'VER'#304' KAYNAKLARI'
        ParentFont = False
        Font.Color = clMaroon
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 0
      end
      object grdVK: TUniDBGrid
        Left = 9
        Top = 31
        Width = 412
        Height = 393
        Hint = ''
        DataSource = dsOzelVK
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
        WebOptions.Paged = False
        WebOptions.CustomizableCells = False
        WebOptions.FetchAll = True
        LoadMask.Message = 'Loading data...'
        EmptyText = 'Veri Bulunamad'#305
        TabOrder = 1
        Columns = <
          item
            FieldName = 'name'
            Title.Alignment = taCenter
            Title.Caption = 'Veri Kayna'#287#305
            Width = 400
            Font.OverrideDefaults = [ovFontHeight]
            DisplayMemo = True
          end>
      end
      object btnVKAdd: TUniBitBtn
        Left = 427
        Top = 31
        Width = 30
        Height = 30
        Hint = 'Departman Ekle'
        Caption = ''
        TabOrder = 2
        Images = MainMod.BtnImgList
        ImageIndex = 0
        OnClick = btnVKAddClick
      end
      object btnVKDel: TUniBitBtn
        Left = 427
        Top = 67
        Width = 30
        Height = 30
        Hint = 'Departman Sil'
        Caption = ''
        TabOrder = 3
        Images = MainMod.BtnImgList
        ImageIndex = 5
        OnClick = btnVKDelClick
      end
    end
  end
  object dsOzelOnay: TUniDataSource
    DataSet = qOzelOnay
    OnStateChange = dsOzelOnayStateChange
    Left = 204
    Top = 99
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    Left = 30
    Top = 131
  end
  object qDosyaBilgi: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT *'
      'FROM def_data_ozelonay_docs'
      'WHERE tur = '#39'1'#39' AND oo_id = :oid')
    CachedUpdates = True
    Left = 299
    Top = 99
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oid'
        Value = 0
      end>
  end
  object qDosyaOnay: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT *'
      'FROM def_data_ozelonay_docs'
      'WHERE tur = '#39'2'#39' AND oo_id = :oid')
    CachedUpdates = True
    Left = 299
    Top = 147
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oid'
        Value = 0
      end>
  end
  object qOzelOnay: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT *'
      'FROM def_data_ozelonay'
      'ORDER BY id')
    Left = 144
    Top = 99
  end
  object dsDosyaBilgi: TUniDataSource
    DataSet = qDosyaBilgi
    Left = 372
    Top = 99
  end
  object dsDosyaOnay: TUniDataSource
    DataSet = qDosyaOnay
    Left = 372
    Top = 147
  end
  object tblOzelVK: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'name'
        DataType = ftString
        Size = 500
      end>
    Left = 141
    Top = 147
    Data = {
      0400020002006964030000000000000004006E616D650100F401000000000000
      00000000}
  end
  object dsOzelVK: TUniDataSource
    DataSet = tblOzelVK
    Left = 204
    Top = 147
  end
end
