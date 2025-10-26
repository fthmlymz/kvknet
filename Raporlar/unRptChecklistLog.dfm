object RptChecklistLog: TRptChecklistLog
  Left = 0
  Top = 0
  ClientHeight = 550
  ClientWidth = 1354
  Caption = 'Kontrol Listesi Loglar'#305
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  TextHeight = 15
  object pnlButtons: TUniPanel
    Left = 0
    Top = 486
    Width = 1354
    Height = 64
    Hint = ''
    Align = alBottom
    TabOrder = 0
    Caption = ''
    object btnCancel: TUniBitBtn
      AlignWithMargins = True
      Left = 1254
      Top = 14
      Width = 96
      Height = 36
      Hint = ''
      Margins.Top = 13
      Margins.Bottom = 13
      Caption = 'Kapat'
      Align = alRight
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
      Images = MainMod.PrjImgList
      ImageIndex = 5
      OnClick = btnCancelClick
    end
    object pnlAra: TUniPanel
      Left = 1
      Top = 1
      Width = 560
      Height = 62
      Hint = ''
      Visible = False
      Align = alLeft
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
      BorderStyle = ubsNone
      Caption = ''
      object UniLabel1: TUniLabel
        Left = 3
        Top = 10
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Ki'#351'i Grubu'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
      end
      object cbAraKisi: TUniComboBox
        Left = 94
        Top = 5
        Width = 145
        Height = 23
        Hint = ''
        Text = ''
        TabOrder = 2
        IconItems = <>
      end
      object UniLabel2: TUniLabel
        Left = 3
        Top = 37
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Veri Kayna'#287#305
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
      end
      object cbAraKaynak: TUniComboBox
        Left = 94
        Top = 34
        Width = 145
        Height = 23
        Hint = ''
        Text = ''
        TabOrder = 4
        IconItems = <>
      end
      object UniLabel3: TUniLabel
        Left = 255
        Top = 10
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = #304#351'lem Zaman'#305'-I'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 5
      end
      object edAraTarih1: TUniDateTimePicker
        Left = 346
        Top = 5
        Width = 200
        Height = 23
        Hint = ''
        DateTime = 44446.499138599540000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Kind = tUniDateTime
        TabOrder = 6
      end
      object edAraTarih2: TUniDateTimePicker
        Left = 346
        Top = 34
        Width = 200
        Height = 23
        Hint = ''
        DateTime = 44439.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Kind = tUniDateTime
        TabOrder = 7
      end
      object UniLabel4: TUniLabel
        Left = 254
        Top = 37
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = #304#351'lem Zaman'#305'-II'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 8
      end
    end
    object btnHelp: TUniBitBtn
      AlignWithMargins = True
      Left = 1152
      Top = 14
      Width = 96
      Height = 36
      Hint = ''
      Margins.Top = 13
      Margins.Bottom = 13
      Caption = 'Yard'#305'm'
      Align = alRight
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 3
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = btnHelpClick
    end
    object btnPrepare: TUniBitBtn
      AlignWithMargins = True
      Left = 564
      Top = 14
      Width = 96
      Height = 36
      Hint = ''
      Margins.Top = 13
      Margins.Bottom = 13
      Caption = 'Haz'#305'rla'
      Align = alLeft
      TabOrder = 4
      ScreenMask.Enabled = True
      ScreenMask.Message = 'L'#252'tfen Bekleyiniz..'
      ScreenMask.Target = grd
      Images = MainMod.PrjImgList
      ImageIndex = 15
      OnClick = btnPrepareClick
    end
    object UniBitBtn1: TUniBitBtn
      AlignWithMargins = True
      Left = 666
      Top = 14
      Width = 96
      Height = 36
      Hint = ''
      Margins.Top = 13
      Margins.Bottom = 13
      Caption = 'Excel'
      Align = alLeft
      TabOrder = 5
      Images = MainMod.PrjImgList
      ImageIndex = 4
      OnClick = UniBitBtn1Click
    end
  end
  object pnlLog: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 1354
    Height = 486
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 1
    object grd: TUniDBGrid
      Left = 0
      Top = 0
      Width = 1354
      Height = 486
      Hint = ''
      ClientEvents.UniEvents.Strings = (
        
          'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  config.cls=' +
          #39'custom-grid'#39';'#13#10'}')
      DataSource = dsRapor
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.Paged = False
      Grouping.FieldName = 'groupstr'
      Grouping.FieldCaption = 'Ref.No'
      Grouping.Enabled = True
      LoadMask.Enabled = False
      LoadMask.Message = 'L'#252'tfen Bekleyiniz...'
      Align = alClient
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      TabOrder = 1
      OnColumnSort = grdColumnSort
      OnDrawColumnCell = grdDrawColumnCell
      Columns = <
        item
          FieldName = 'log_tarih'
          Title.Caption = 'Kay'#305't Tarihi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'log_islem'
          Title.Caption = #304#351'lem'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'log_kullanici_id'
          Title.Caption = 'Kullan'#305'c'#305' No'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 128
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'log_kullanici_adi'
          Title.Caption = 'Kullan'#305'c'#305' Ad'#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'log_kullanici_ip'
          Title.Caption = 'IP Adresi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'id'
          Title.Caption = 'Kay'#305't No'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 72
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'mc_id'
          Title.Caption = 'Kurum No'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 80
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'active'
          Title.Caption = 'Aktif'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 50
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'idy'
          Title.Caption = #304'lk Kaydeden'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 96
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'idt'
          Title.Caption = #304'lk Kay'#305't Tarihi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'sdy'
          Title.Caption = 'Son D'#252'zenleyen'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 110
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'sdt'
          Title.Caption = 'Son Kay'#305't Tarihi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 105
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'tarih'
          Title.Caption = 'Tarih'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'kaynak_id'
          Title.Caption = 'Kaynak No'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 80
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'kaynak_str'
          Title.Caption = 'Veri Kayna'#287#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 160
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'kisi_id'
          Title.Caption = 'Ki'#351'i No'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 72
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'kisi_str'
          Title.Caption = #304'lgili Ki'#351'i'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 128
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'kontrol_id'
          Title.Caption = 'Kontrol No'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'kontrol_str'
          Title.Caption = 'Kontrol Sonucu'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 110
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'tedbir_ids'
          Title.Caption = 'Tedbir No'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'tedbir_str'
          Title.Caption = 'Tedbirler'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'dayanak_ids'
          Title.Caption = 'Dayanak No'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'dayanak_str'
          Title.Caption = 'Dayanaklar'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'dokuman_ids'
          Title.Caption = 'Dok'#252'man No'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'dokuman_str'
          Title.Caption = 'Dok'#252'manlar'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'ekipman_ids'
          Title.Caption = 'Ekipman No'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 85
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'ekipman_str'
          Title.Caption = 'Ekipmanlar'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'sorumlu_ids'
          Title.Caption = 'Sorumlu No'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 85
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'sorumlu_str'
          Title.Caption = 'Sorumlular'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'hkk_gereksinim'
          Title.Caption = 'Hukuki Dayanak'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 115
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'hkk_sozlesme'
          Title.Caption = 'S'#246'zle'#351'me Dayana'#287#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 128
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'hkk_sozmadde'
          Title.Caption = 'S'#246'zle'#351'me Maddesi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 128
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'calisma_talimat'
          Title.Caption = 'Planlanan '#199'al'#305#351'ma ve Talimatlar'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 196
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'oneriler'
          Title.Caption = #214'neriler'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'guncelleme_araligi'
          Title.Caption = 'G'#252'ncelleme Aral'#305#287#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 128
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'tetkik_araligi'
          Title.Caption = 'Tetkik Aral'#305#287#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 128
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'tetkik_yonetim'
          Title.Caption = 'Tetkik Soru/Y'#246'netimi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 135
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'onem_derecesi_id'
          Title.Caption = #214'nem Der. No'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'onem_derecesi_str'
          Title.Caption = #214'nem Derecesi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'koru_idarionlem'
          Title.Caption = #304'dari '#214'nlemler'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'koru_teknikonlem'
          Title.Caption = 'Teknik '#214'nlemler'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 115
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'danisman_notu'
          Title.Caption = 'Dan'#305#351'man Notu'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 110
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'kilitli'
          Title.Caption = 'Kilitli'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 50
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'kilitli_sdy'
          Title.Caption = 'Kilit Son De'#287'i'#351'iklik'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 128
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'kilitli_sdt'
          Title.Caption = 'Kilit Son De'#287'i'#351'iklik Tarihi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 175
          Font.OverrideDefaults = [ovFontHeight]
        end>
    end
  end
  object qDept: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, title FROM sys_deptdef'
      'ORDER BY id')
    Left = 545
    Top = 246
  end
  object qTitle: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, title FROM sys_titledef'
      'ORDER BY id')
    Left = 545
    Top = 288
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
  object tblRapor: TVirtualTable
    FieldDefs = <
      item
        Name = 'log_id'
        DataType = ftInteger
      end
      item
        Name = 'log_tarih'
        DataType = ftDateTime
      end
      item
        Name = 'log_islem'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'log_kullanici_id'
        DataType = ftInteger
      end
      item
        Name = 'log_kullanici_adi'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'log_kullanici_ip'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'mc_id'
        DataType = ftInteger
      end
      item
        Name = 'active'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'idy'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'idt'
        DataType = ftDateTime
      end
      item
        Name = 'sdy'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'sdt'
        DataType = ftDateTime
      end
      item
        Name = 'olusturan'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'degistiren'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'tarih'
        DataType = ftDateTime
      end
      item
        Name = 'kaynak_id'
        DataType = ftInteger
      end
      item
        Name = 'kaynak_str'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'kisi_id'
        DataType = ftInteger
      end
      item
        Name = 'kisi_str'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'kontrol_id'
        DataType = ftInteger
      end
      item
        Name = 'kontrol_str'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'tedbir_ids'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'tedbir_str'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'dayanak_ids'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'dayanak_str'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'dokuman_ids'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'dokuman_str'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'ekipman_ids'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'ekipman_str'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'sorumlu_ids'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'sorumlu_str'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'hkk_gereksinim'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'hkk_sozlesme'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'hkk_sozmadde'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'calisma_talimat'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'oneriler'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'guncelleme_araligi'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'tetkik_araligi'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'tetkik_yonetim'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'onem_derecesi_id'
        DataType = ftInteger
      end
      item
        Name = 'onem_derecesi_str'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'koru_idarionlem'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'koru_teknikonlem'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'danisman_notu'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'kilitli'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'kilitli_sdy'
        DataType = ftInteger
      end
      item
        Name = 'kilitli_sdt'
        DataType = ftDateTime
      end
      item
        Name = 'groupstr'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'formatstr'
        DataType = ftString
        Size = 20
      end>
    Left = 395
    Top = 249
    Data = {
      0400320006006C6F675F6964030000000000000009006C6F675F74617269680B
      0000000000000009006C6F675F69736C656D010014000000000010006C6F675F
      6B756C6C616E6963695F6964030000000000000011006C6F675F6B756C6C616E
      6963695F616469010064000000000010006C6F675F6B756C6C616E6963695F69
      70010014000000000002006964030000000000000005006D635F696403000000
      0000000006006163746976650100010000000000030069647901006400000000
      0003006964740B00000000000000030073647901006400000000000300736474
      0B0000000000000009006F6C7573747572616E01003200000000000A00646567
      6973746972656E0100320000000000050074617269680B000000000000000900
      6B61796E616B5F696403000000000000000A006B61796E616B5F7374720100D0
      070000000007006B6973695F6964030000000000000008006B6973695F737472
      0100D007000000000A006B6F6E74726F6C5F696403000000000000000B006B6F
      6E74726F6C5F7374720100D007000000000A007465646269725F6964730100D0
      07000000000A007465646269725F7374720100D007000000000B00646179616E
      616B5F6964730100D007000000000B00646179616E616B5F7374720100D00700
      0000000B00646F6B756D616E5F6964730100D007000000000B00646F6B756D61
      6E5F7374720100D007000000000B00656B69706D616E5F6964730100D0070000
      00000B00656B69706D616E5F7374720100D007000000000B00736F72756D6C75
      5F6964730100D007000000000B00736F72756D6C755F7374720100D007000000
      000E00686B6B5F676572656B73696E696D0100D007000000000C00686B6B5F73
      6F7A6C65736D650100D007000000000C00686B6B5F736F7A6D616464650100D0
      07000000000F0063616C69736D615F74616C696D61740100D007000000000800
      6F6E6572696C65720100D00700000000120067756E63656C6C656D655F617261
      6C6967690100D007000000000E007465746B696B5F6172616C6967690100D007
      000000000E007465746B696B5F796F6E6574696D0100D0070000000010006F6E
      656D5F64657265636573695F6964030000000000000011006F6E656D5F646572
      65636573695F7374720100D007000000000F006B6F72755F69646172696F6E6C
      656D0100D0070000000010006B6F72755F74656B6E696B6F6E6C656D0100D007
      000000000D0064616E69736D616E5F6E6F74750100D0070000000007006B696C
      69746C6901000100000000000B006B696C69746C695F73647903000000000000
      000B006B696C69746C695F7364740B00000000000000080067726F7570737472
      01003200000000000900666F726D617473747201001400000000000000000000
      00}
  end
  object dsRapor: TUniDataSource
    DataSet = qRapor
    Left = 432
    Top = 201
  end
  object qKurum: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, title, code FROM sys_mcdef order by id')
    Left = 545
    Top = 134
  end
  object qKaynak: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, kaynak FROM def_data_kaynak'
      'ORDER BY id')
    Left = 545
    Top = 206
  end
  object qkisi: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, kisi FROM def_data_kisi'
      'ORDER BY id')
    Left = 545
    Top = 166
  end
  object dsDept: TUniDataSource
    Left = 593
    Top = 250
  end
  object dsTitle: TUniDataSource
    Left = 593
    Top = 292
  end
  object dsKisi: TUniDataSource
    DataSet = qkisi
    Left = 593
    Top = 162
  end
  object dsKaynak: TUniDataSource
    DataSet = qKaynak
    Left = 593
    Top = 204
  end
  object qRapor: TVirtualQuery
    SourceDataSets = <
      item
        DataSet = tblRapor
      end>
    SQL.Strings = (
      'SELECT * FROM tblRapor')
    Left = 388
    Top = 208
  end
end
