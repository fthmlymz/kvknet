object frmHelpTanim: TfrmHelpTanim
  Left = 0
  Top = 0
  ClientHeight = 501
  ClientWidth = 714
  Caption = 'Yard'#305'm Dok'#252'manlar'#305
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object pnlData: TUniPanel
    Left = 0
    Top = 0
    Width = 714
    Height = 365
    Hint = ''
    Align = alClient
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    object UniLabel9: TUniLabel
      Left = 5
      Top = 86
      Width = 85
      Height = 13
      Hint = ''
      AutoSize = False
      Caption = 'Detay '
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
    end
    object UniLabel2: TUniLabel
      Left = 5
      Top = 62
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Ba'#351'l'#305'k'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
    end
    object edTitle: TUniDBMemo
      Left = 96
      Top = 59
      Width = 615
      Height = 40
      Hint = ''
      DataField = 'title'
      DataSource = dsHelp
      TabOrder = 3
    end
    object UniLabel3: TUniLabel
      Left = 317
      Top = 35
      Width = 85
      Height = 18
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Form Ad'#305
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
    end
    object edFormAdi: TUniDBComboBox
      Left = 408
      Top = 30
      Width = 193
      Height = 23
      Hint = ''
      DataField = 'formname'
      DataSource = dsHelp
      Items.Strings = (
        'AcikRizaKayitListe'
        'AcikRizaKayitTanim'
        'AydinlatmaSablonListe'
        'AydinlatmaSablonTanim'
        'CheckkListTanim'
        'CheckListListe'
        'EDanismanCevapTanim'
        'EDanismanSoruListe'
        'EDanismanSoruSetiCevaplaListe'
        'EDanismanSoruSetiListe'
        'EDanismanSoruSetiTanim'
        'EDanismanSoruTanim'
        'EnvanterListe'
        'EnvanterTanim'
        'FirmaTanim'
        'KullaniciListe'
        'KullaniciTanim'
        'OzelOnayListe'
        'OzelOnayTanim'
        'VSBasvuruListe'
        'VSDepartmanListe'
        'ErisimYetkiListe'
        'KVKKVeriDokumanListe'
        'RptVerbisListeler'
        'RptVKImhaRaporu'
        'RptVKImhaGecmisi'
        'RptRiskAnalizRaporu'
        'RptYetkiMatrisi'
        'DeptUygulamaProseduru'
        'RptEnvanterLog'
        'RptCheckListLog'
        'RptSMSLog'
        'RptTimeStampLog'
        'RptLoginLog'
        'KVKKSurecListe'
        'KVKKKaynakListe'
        'KVKKKategoriListe'
        'KVKKVeriTipiListe'
        'KVKKKisiListe'
        'KVKKTarafListe'
        'KVKKAmacListe'
        'KVKKMetodListe'
        'KVKKDayanakListe'
        'KVKKTedbirListe'
        'KVKKOnemDereceListe'
        'KVKKKontrolSonucListe'
        'KVKKEkipmanListe'
        'KVKKDokumanTipListe'
        'ParametreMCTanim'
        'RolListe'
        'DepartmanListe'
        'UnvanListe'
        'DuyuruListe')
      TabOrder = 5
      IconItems = <>
    end
    object UniLabel8: TUniLabel
      Left = 5
      Top = 35
      Width = 85
      Height = 18
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'S'#305'ra No'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 6
    end
    object edHtml: TUniHTMLMemo
      Left = 3
      Top = 105
      Width = 708
      Height = 259
      Hint = ''
      ScrollBars = ssVertical
      Color = clWindow
      TabOrder = 7
    end
    object UniDBEdit1: TUniDBEdit
      Left = 96
      Top = 33
      Width = 121
      Height = 22
      Hint = ''
      DataField = 'number'
      DataSource = dsHelp
      TabOrder = 8
    end
  end
  object pnlButtons: TUniPanel
    Left = 0
    Top = 365
    Width = 714
    Height = 136
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      714
      136)
    object btnCancel: TUniBitBtn
      Left = 610
      Top = 91
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
      Left = 508
      Top = 91
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
      Width = 712
      Height = 80
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
        Left = 12
        Top = 43
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
        Left = 12
        Top = 61
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
        Width = 220
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
        Width = 220
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
        Left = 111
        Top = 43
        Width = 220
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
        Left = 111
        Top = 61
        Width = 220
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
    object btnPreview: TUniBitBtn
      Left = 406
      Top = 91
      Width = 96
      Height = 36
      Hint = ''
      Caption = #214'nizleme'
      Anchors = [akRight, akBottom]
      TabOrder = 4
      Images = MainMod.PrjImgList
      ImageIndex = 1
      OnClick = btnPreviewClick
    end
  end
  object qHelp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM sys_help')
    Left = 231
    Top = 96
  end
  object dsHelp: TUniDataSource
    DataSet = qHelp
    Left = 291
    Top = 96
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    Left = 399
    Top = 96
  end
end
