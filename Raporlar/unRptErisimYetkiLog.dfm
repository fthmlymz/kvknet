object RptErisimYetkiLog: TRptErisimYetkiLog
  Left = 0
  Top = 0
  ClientHeight = 430
  ClientWidth = 1277
  Caption = 'Eri'#351'im Yetki De'#287'i'#351'iklikleri'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  OnCreate = UniFormCreate
  TextHeight = 15
  object pnlButtons: TUniPanel
    Left = 0
    Top = 366
    Width = 1277
    Height = 64
    Hint = ''
    Align = alBottom
    TabOrder = 0
    Caption = ''
    object btnCancel: TUniBitBtn
      AlignWithMargins = True
      Left = 1177
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
      Width = 548
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
        Left = 94
        Top = 4
        Width = 145
        Height = 23
        Hint = ''
        Text = ''
        TabOrder = 2
        IconItems = <>
      end
      object UniLabel2: TUniLabel
        Left = 3
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
        Left = 94
        Top = 33
        Width = 145
        Height = 23
        Hint = ''
        Text = ''
        TabOrder = 4
        IconItems = <>
      end
      object UniLabel3: TUniLabel
        Left = 245
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
        Left = 336
        Top = 4
        Width = 200
        Height = 23
        Hint = ''
        DateTime = 44446.473054594910000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Kind = tUniDateTime
        TabOrder = 6
      end
      object edAraTarih2: TUniDateTimePicker
        Left = 336
        Top = 33
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
        Left = 245
        Top = 35
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = #304#351'lem Zaman'#305'-I'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 8
      end
    end
    object btnHelp: TUniBitBtn
      AlignWithMargins = True
      Left = 1075
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
      Left = 552
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
      ScreenMask.Message = 'L'#252'tfen bekleyiniz...'
      ScreenMask.Target = grd
      Images = MainMod.PrjImgList
      ImageIndex = 15
      OnClick = btnPrepareClick
    end
    object UniBitBtn1: TUniBitBtn
      AlignWithMargins = True
      Left = 654
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
    Width = 1277
    Height = 366
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 1
    object grd: TUniDBGrid
      Left = 0
      Top = 0
      Width = 1277
      Height = 366
      Hint = ''
      ClientEvents.UniEvents.Strings = (
        
          'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  config.cls=' +
          #39'custom-grid'#39';'#13#10'}')
      DataSource = dsRapor
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.Paged = False
      Grouping.FieldName = 'groupstr'
      Grouping.FieldCaption = 'DEPARTMAN - '#220'NVAN'
      Grouping.Enabled = True
      LoadMask.Enabled = False
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      TabOrder = 1
      OnColumnSort = grdColumnSort
      OnDrawColumnCell = grdDrawColumnCell
      Columns = <
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
          Width = 128
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
          FieldName = 'kaynak'
          Title.Caption = 'Veri Kayna'#287#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Visible = False
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'kisi'
          Title.Caption = 'Ki'#351'i Grubu'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Visible = False
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'departman'
          Title.Caption = 'departman'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Visible = False
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'unvan'
          Title.Caption = #220'nvan'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Visible = False
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'permf'
          Title.Caption = 'Fiziksel Eri'#351'im'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'perms'
          Title.Caption = 'Dijital Eri'#351'im'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 120
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
          FieldName = 'id'
          Title.Caption = 'Ref. No'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 72
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
  object dsRapor: TUniDataSource
    DataSet = tblRapor
    Left = 440
    Top = 249
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
      'SELECT id, kaynak FROM def_data_kaynak where mc_id=:mc_id'
      'ORDER BY KAYNAK')
    Left = 545
    Top = 206
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'mc_id'
        Value = nil
      end>
  end
  object qkisi: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, kisi FROM def_data_kisi where mc_id=:mc_id'
      'ORDER BY kisi')
    Left = 545
    Top = 166
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'mc_id'
        Value = nil
      end>
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
        Name = 'kaynak_id'
        DataType = ftInteger
      end
      item
        Name = 'kisi_id'
        DataType = ftInteger
      end
      item
        Name = 'dept_id'
        DataType = ftInteger
      end
      item
        Name = 'title_id'
        DataType = ftInteger
      end
      item
        Name = 'permf'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'perms'
        DataType = ftString
        Size = 20
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
        Name = 'kaynak'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'kisi'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'departman'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'unvan'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'formatstr'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'groupstr'
        DataType = ftString
        Size = 200
      end>
    Left = 395
    Top = 249
    Data = {
      0400180009006C6F675F74617269680B0000000000000009006C6F675F69736C
      656D010014000000000010006C6F675F6B756C6C616E6963695F696403000000
      0000000011006C6F675F6B756C6C616E6963695F616469010064000000000010
      006C6F675F6B756C6C616E6963695F6970010014000000000002006964030000
      000000000005006D635F6964030000000000000009006B61796E616B5F696403
      0000000000000007006B6973695F696403000000000000000700646570745F69
      64030000000000000008007469746C655F696403000000000000000500706572
      6D66010014000000000005007065726D73010014000000000003006964790100
      64000000000003006964740B0000000000000003007364790100640000000000
      03007364740B0000000000000005004B7572756D0100C8000000000006006B61
      796E616B0100C8000000000004006B6973690100C80000000000090064657061
      72746D616E0100C800000000000500756E76616E01001400000000000900666F
      726D61747374720100060000000000080067726F75707374720100C800000000
      00000000000000}
  end
end
