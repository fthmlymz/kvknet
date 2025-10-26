object RptLoginLog: TRptLoginLog
  Left = 0
  Top = 0
  ClientHeight = 430
  ClientWidth = 1277
  Caption = 'Kullan'#305'c'#305' Giri'#351' Loglar'#305
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
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
      Width = 312
      Height = 62
      Hint = ''
      Align = alLeft
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
      BorderStyle = ubsNone
      Caption = ''
      object UniLabel3: TUniLabel
        Left = 9
        Top = 9
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = #304#351'lem Zaman'#305'-I'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
      end
      object edAraTarih1: TUniDateTimePicker
        Left = 100
        Top = 5
        Width = 200
        Height = 23
        Hint = ''
        DateTime = 44446.473054594910000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Kind = tUniDateTime
        TabOrder = 2
      end
      object edAraTarih2: TUniDateTimePicker
        Left = 100
        Top = 34
        Width = 200
        Height = 23
        Hint = ''
        DateTime = 44439.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Kind = tUniDateTime
        TabOrder = 3
      end
      object UniLabel1: TUniLabel
        Left = 9
        Top = 39
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = #304#351'lem Zaman'#305'-II'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
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
      Left = 316
      Top = 14
      Width = 96
      Height = 36
      Hint = ''
      Margins.Top = 13
      Margins.Bottom = 13
      Caption = 'Haz'#305'rla'
      Align = alLeft
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
      ScreenMask.Enabled = True
      ScreenMask.Message = 'L'#252'tfen Bekleyiniz...'
      ScreenMask.Target = grd
      Images = MainMod.PrjImgList
      ImageIndex = 15
      OnClick = btnPrepareClick
    end
    object UniBitBtn1: TUniBitBtn
      AlignWithMargins = True
      Left = 418
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
          FieldName = 'id'
          Title.Caption = 'ID'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 64
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'cmp_code'
          Title.Caption = 'Kurum Kodu'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 128
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'kurum'
          Title.Caption = 'Kurum'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 255
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'user_name'
          Title.Caption = 'Kullan'#305'c'#305' Ad'#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 128
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'user'
          Title.Caption = 'Kullan'#305'c'#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 196
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'cmp_active'
          Title.Caption = 'Kurum Aktif'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 96
          Font.OverrideDefaults = [ovFontHeight]
          CheckBoxField.FieldValues = 'E;H'
          CheckBoxField.DisplayValues = 'Evet;Hay'#305'r'
        end
        item
          FieldName = 'usr_active'
          Title.Caption = 'Kullan'#305'c'#305' Aktif'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 128
          Font.OverrideDefaults = [ovFontHeight]
          CheckBoxField.FieldValues = 'E;H'
          CheckBoxField.DisplayValues = 'Evet;Hay'#305'r'
        end
        item
          FieldName = 'log_time'
          Title.Caption = 'Giri'#351' Zaman'#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'log_success'
          Title.Caption = 'Giri'#351' Ba'#351'ar'#305'l'#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 160
          Font.OverrideDefaults = [ovFontHeight]
          CheckBoxField.FieldValues = 'E;H'
          CheckBoxField.DisplayValues = 'Evet;Hay'#305'r'
        end
        item
          FieldName = 'ip_no'
          Title.Caption = 'IP Adresi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'mac_no'
          Title.Caption = 'MAC Adresi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'prg_id'
          Title.Caption = 'Program'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 128
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'prg_vers'
          Title.Caption = 'Program Versiyonu'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 128
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'db_pid'
          Title.Caption = 'DB PID'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 96
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
    Left = 439
    Top = 299
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
    Top = 118
  end
  object qKaynak: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, kaynak FROM def_data_kaynak'
      'ORDER BY id')
    Left = 545
    Top = 206
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
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'cmp_code'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'kurum'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'user_name'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'user'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'cmp_active'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'usr_active'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'log_time'
        DataType = ftDateTime
      end
      item
        Name = 'log_success'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ip_no'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'mac_no'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'prg_id'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'prg_vers'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'db_pid'
        DataType = ftInteger
      end>
    Left = 395
    Top = 249
    Data = {
      04000E000200696403000000000000000800636D705F636F6465010014000000
      000005006B7572756D0100C800000000000900757365725F6E616D6501001400
      0000000004007573657201001400000000000A00636D705F6163746976650100
      1400000000000A007573725F616374697665010014000000000008006C6F675F
      74696D650B000000000000000B006C6F675F7375636365737301001400000000
      00050069705F6E6F01001E000000000006006D61635F6E6F01001E0000000000
      06007072675F6964010064000000000008007072675F7665727301001E000000
      0000060064625F7069640300000000000000000000000000}
  end
  object qkisi: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, kisi FROM def_data_kisi'
      'ORDER BY id')
    Left = 545
    Top = 166
  end
  object qKullanici: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, title, code FROM sys_mcdef order by id')
    Left = 593
    Top = 118
  end
end
