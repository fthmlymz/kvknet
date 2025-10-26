object RptEnvanterLog: TRptEnvanterLog
  Left = 0
  Top = 0
  ClientHeight = 550
  ClientWidth = 1434
  Caption = 'Envanter De'#287'i'#351'iklikleri'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  TextHeight = 15
  object pnlButtons: TUniPanel
    Left = 0
    Top = 490
    Width = 1434
    Height = 60
    Hint = ''
    Align = alBottom
    TabOrder = 0
    Caption = ''
    object btnCancel: TUniBitBtn
      AlignWithMargins = True
      Left = 1334
      Top = 12
      Width = 96
      Height = 36
      Hint = ''
      Margins.Top = 11
      Margins.Bottom = 11
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
      Height = 58
      Hint = ''
      Visible = False
      Align = alLeft
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
      BorderStyle = ubsNone
      Caption = ''
      object UniLabel1: TUniLabel
        Left = 4
        Top = 8
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
        Left = 95
        Top = 3
        Width = 145
        Height = 23
        Hint = ''
        Text = ''
        TabOrder = 2
        IconItems = <>
      end
      object UniLabel2: TUniLabel
        Left = 4
        Top = 35
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
        Left = 95
        Top = 32
        Width = 145
        Height = 23
        Hint = ''
        Text = ''
        TabOrder = 4
        IconItems = <>
      end
      object UniLabel3: TUniLabel
        Left = 255
        Top = 8
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
        Top = 3
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
        Top = 32
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
        Left = 255
        Top = 35
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
    object btnPrepare: TUniBitBtn
      AlignWithMargins = True
      Left = 564
      Top = 12
      Width = 96
      Height = 36
      Hint = ''
      Margins.Top = 11
      Margins.Bottom = 11
      Caption = 'Haz'#305'rla'
      Align = alLeft
      TabOrder = 3
      ScreenMask.Enabled = True
      ScreenMask.Message = 'L'#252'tfen Bekleyiniz...'
      ScreenMask.Target = grd
      Images = MainMod.PrjImgList
      ImageIndex = 15
      OnClick = btnPrepareClick
    end
    object UniBitBtn1: TUniBitBtn
      AlignWithMargins = True
      Left = 666
      Top = 12
      Width = 96
      Height = 36
      Hint = ''
      Margins.Top = 11
      Margins.Bottom = 11
      Caption = 'Excel'
      Align = alLeft
      TabOrder = 4
      Images = MainMod.PrjImgList
      ImageIndex = 4
      OnClick = UniBitBtn1Click
    end
  end
  object pnlLog: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 1434
    Height = 490
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 1
    object grd: TUniDBGrid
      Left = 0
      Top = 0
      Width = 1434
      Height = 490
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
      LoadMask.Message = 'L'#252'fen Bekleyiniz...'
      Align = alClient
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      TabOrder = 1
      OnColumnSort = grdColumnSort
      OnDrawColumnCell = grdDrawColumnCell
      Columns = <
        item
          FieldName = 'id'
          Title.Caption = 'Detay Ref. No'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'main_id'
          Title.Caption = 'Ana Ref. No.'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 72
          Visible = False
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'log_tarih'
          Title.Caption = #304#351'lem Tarihi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'log_islem'
          Title.Caption = #304#351'lem'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'log_kullanici_id'
          Title.Caption = 'Kullan'#305'c'#305' No'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 85
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'log_kullanici_adi'
          Title.Caption = 'Kullan'#305'c'#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'log_kullanici_ip'
          Title.Caption = #304#351'lem Yap. IP Adresi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'idy'
          Title.Caption = #304'lk Kay'#305't Yapan'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'idt'
          Title.Caption = #304'lk Kay'#305't Tarihi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'sdy'
          Title.Caption = 'Son Kay'#305't Yapan'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'sdt'
          Title.Caption = 'Son Kay'#305't Tarihi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'Kurum'
          Title.Caption = 'Kurum'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Visible = False
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'active'
          Title.Caption = 'Aktif'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 72
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'tarih'
          Title.Caption = 'Tarih'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 72
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'dept_str'
          Title.Caption = 'Departman'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 85
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'surec_str'
          Title.Caption = 'S'#252're'#231
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 72
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'kaynak_str'
          Title.Caption = 'Veri Kayna'#287#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'veritipi_str'
          Title.Caption = 'Veri Tipi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 75
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'kategori_str'
          Title.Caption = 'Veri Kategorisi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'kisi_str'
          Title.Caption = 'Veri Konusu Ki'#351'i'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 110
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'nitelik'
          Title.Caption = #214'zel Ntl. K'#351'l. Veri'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 115
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'topl_amac_str'
          Title.Caption = 'V. Top. Amac'#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'topl_metod_str'
          Title.Caption = 'V. Top. Metodu'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 115
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'topl_detay'
          Title.Caption = 'V. Top. D.'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 115
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'topl_cikti'
          Title.Caption = 'V. Top. Sr'#231'. '#199#305'kt'#305's'#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'topl_paylasim'
          Title.Caption = 'Payla'#351#305'm'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 72
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'topl_paylasimtipi'
          Title.Caption = 'Payla'#351#305'm Bi'#231'imi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 135
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'sakl_amac_str'
          Title.Caption = 'V. Sak. Amac'#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 135
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'sakl_metod_str'
          Title.Caption = 'V. Sak. Metodu'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 135
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'sakl_erisim_str'
          Title.Caption = 'Eri'#351'im Sa'#287'layanlar'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 135
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'sakl_sanalonlem'
          Title.Caption = 'Dijital '#214'nlemler'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 135
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'sakl_fizikselonlem'
          Title.Caption = 'Fiziksel '#214'nlemler'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 135
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'sakl_ssure_var'
          Title.Caption = 'Dij. Sak. S'#252'resi Var'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 135
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'sakl_ssure_tip'
          Title.Caption = 'Dij. Sak. S'#252're Tipi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 135
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'sakl_ssure_sure'
          Title.Caption = 'Dij. Sak. S'#252'resi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'sakl_ssure'
          Title.Caption = 'Dijital Saklama S'#252'resi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'sakl_fsure_var'
          Title.Caption = 'Fiz. Sak. S'#252'resi Var'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'sakl_fsure_tip'
          Title.Caption = 'Fiz. Sak. S'#252'resi Tipi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'sakl_fsure_sure'
          Title.Caption = 'Fiz. Sak. S'#252'resi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'sakl_fsure_imha'
          Title.Caption = 'Fiz. Sak. '#304'mha'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'sakl_fsure'
          Title.Caption = 'Fiziksel Saklama S'#252'resi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'payl_amac_str'
          Title.Caption = 'V. Payl. Ama'#231'lar'#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'payl_metod_str'
          Title.Caption = 'V. Payl. Metodlar'#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'payl_taraf_str'
          Title.Caption = 'V. Payl. Taraflar'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'payl_taraftipi'
          Title.Caption = 'V. Payl. Taraf Tipi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'payl_sozlesme'
          Title.Caption = 'V. Payl. Day. S'#246'zle'#351'me Var'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 170
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'payl_sozisim'
          Title.Caption = 'V. Payl. S'#246'zle'#351'me'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'payl_sozmadde'
          Title.Caption = 'V. Payl. S'#246'zle'#351'me Maddesi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 165
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'dgr_dayanak_str'
          Title.Caption = 'Di'#287'er Dayanaklar'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'dgr_dokuman_str'
          Title.Caption = 'Di'#287'er Dok'#252'manlar'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'dgr_politika'
          Title.Caption = 'Di'#287'er Politikalar Var'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'dgr_polisim'
          Title.Caption = 'Di'#287'er Politikalar'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'dgr_polmadde'
          Title.Caption = 'Di'#287'er Politika Detay'#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'dgr_sozlesme'
          Title.Caption = 'Di'#287'er S'#246'zle'#351'me Var'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'dgr_sozisim'
          Title.Caption = 'Di'#287'er S'#246'zle'#351'me'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'dgr_sozmadde'
          Title.Caption = 'Di'#287'er S'#246'zle'#351'me Maddeleri'
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
        Name = 'Kurum'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'formatstr'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'groupstr'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'active'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'tarih'
        DataType = ftDateTime
      end
      item
        Name = 'dept_str'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'surec_str'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'kaynak_str'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'veritipi_str'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'kategori_str'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'kisi_str'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'nitelik'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'topl_amac_str'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'topl_metod_str'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'topl_detay'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'topl_cikti'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'topl_paylasim'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'topl_paylasimtipi'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'sakl_amac_str'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'sakl_metod_str'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'sakl_erisim_str'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'sakl_sanalonlem'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'sakl_fizikselonlem'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'sakl_ssure_var'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'sakl_ssure_tip'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'sakl_ssure_sure'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'sakl_ssure_imha'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'sakl_ssure'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'sakl_fsure_var'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'sakl_fsure_tip'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'sakl_fsure_sure'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'sakl_fsure_imha'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'sakl_fsure'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'payl_amac_str'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'payl_metod_str'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'payl_taraf_str'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'payl_taraftipi'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'payl_sozlesme'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'payl_sozisim'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'payl_sozmadde'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'dgr_dayanak_str'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'dgr_dokuman_str'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'dgr_politika'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'dgr_polisim'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'dgr_polmadde'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'dgr_sozlesme'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'dgr_sozisim'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'dgr_sozmadde'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'kilitli'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'main_id'
        DataType = ftInteger
      end>
    Left = 395
    Top = 249
    Data = {
      04003D0009006C6F675F74617269680B0000000000000009006C6F675F69736C
      656D010014000000000010006C6F675F6B756C6C616E6963695F696403000000
      0000000011006C6F675F6B756C6C616E6963695F616469010064000000000010
      006C6F675F6B756C6C616E6963695F6970010014000000000002006964030000
      000000000005006D635F69640300000000000000030069647901006400000000
      0003006964740B00000000000000030073647901006400000000000300736474
      0B0000000000000005004B7572756D0100C800000000000900666F726D617473
      747201003C0000000000080067726F75707374720100C8000000000006006163
      746976650100010000000000050074617269680B000000000000000800646570
      745F7374720100D00700000000090073757265635F7374720100D00700000000
      0A006B61796E616B5F7374720100D007000000000C0076657269746970695F73
      74720100D007000000000C006B617465676F72695F7374720100D00700000000
      08006B6973695F7374720100D0070000000007006E6974656C696B0100D00700
      0000000D00746F706C5F616D61635F7374720100D007000000000E00746F706C
      5F6D65746F645F7374720100D007000000000A00746F706C5F64657461790100
      D007000000000A00746F706C5F63696B74690100D007000000000D00746F706C
      5F7061796C6173696D0100D007000000001100746F706C5F7061796C6173696D
      746970690100D007000000000D0073616B6C5F616D61635F7374720100D00700
      0000000E0073616B6C5F6D65746F645F7374720100D007000000000F0073616B
      6C5F65726973696D5F7374720100D007000000000F0073616B6C5F73616E616C
      6F6E6C656D0100D00700000000120073616B6C5F66697A696B73656C6F6E6C65
      6D0100D007000000000E0073616B6C5F73737572655F7661720100D007000000
      000E0073616B6C5F73737572655F7469700100D007000000000F0073616B6C5F
      73737572655F737572650100D007000000000F0073616B6C5F73737572655F69
      6D68610100D007000000000A0073616B6C5F73737572650100D007000000000E
      0073616B6C5F66737572655F7661720100D007000000000E0073616B6C5F6673
      7572655F7469700100D007000000000F0073616B6C5F66737572655F73757265
      0100D007000000000F0073616B6C5F66737572655F696D68610100D007000000
      000A0073616B6C5F66737572650100D007000000000D007061796C5F616D6163
      5F7374720100D007000000000E007061796C5F6D65746F645F7374720100D007
      000000000E007061796C5F74617261665F7374720100D007000000000E007061
      796C5F7461726166746970690100D007000000000D007061796C5F736F7A6C65
      736D650100D007000000000C007061796C5F736F7A6973696D0100D007000000
      000D007061796C5F736F7A6D616464650100D007000000000F006467725F6461
      79616E616B5F7374720100D007000000000F006467725F646F6B756D616E5F73
      74720100D007000000000C006467725F706F6C6974696B610100D00700000000
      0B006467725F706F6C6973696D0100D007000000000C006467725F706F6C6D61
      6464650100D007000000000C006467725F736F7A6C65736D650100D007000000
      000B006467725F736F7A6973696D0100D007000000000C006467725F736F7A6D
      616464650100D0070000000007006B696C69746C690100D0070000000007006D
      61696E5F69640300000000000000000000000000}
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
    Top = 200
  end
end
