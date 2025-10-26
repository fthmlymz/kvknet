object RptSMSLog: TRptSMSLog
  Left = 0
  Top = 0
  ClientHeight = 430
  ClientWidth = 1120
  Caption = 'SMS Loglar'#305
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  TextHeight = 15
  object pnlButtons: TUniPanel
    Left = 0
    Top = 366
    Width = 1120
    Height = 64
    Hint = ''
    Align = alBottom
    TabOrder = 0
    Caption = ''
    object btnCancel: TUniBitBtn
      AlignWithMargins = True
      Left = 1020
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
      Width = 320
      Height = 62
      Hint = ''
      Align = alLeft
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
      BorderStyle = ubsNone
      Caption = ''
      object UniLabel3: TUniLabel
        Left = 7
        Top = 9
        Width = 80
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
        Left = 93
        Top = 4
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
        Left = 93
        Top = 33
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
        Left = 7
        Top = 36
        Width = 80
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
      Left = 918
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
      Left = 324
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
      ScreenMask.Message = 'L'#252'tfen Bekleyiniz...'
      ScreenMask.Target = grd
      Images = MainMod.PrjImgList
      ImageIndex = 15
      OnClick = btnPrepareClick
    end
    object UniBitBtn1: TUniBitBtn
      AlignWithMargins = True
      Left = 426
      Top = 14
      Width = 96
      Height = 36
      Hint = ''
      Margins.Top = 13
      Margins.Bottom = 13
      Caption = 'Excel'
      Align = alLeft
      TabOrder = 5
      ScreenMask.Message = 'L'#252'tfen Bekleyiniz...'
      Images = MainMod.PrjImgList
      ImageIndex = 4
      OnClick = UniBitBtn1Click
      ExplicitTop = 13
    end
  end
  object pnlLog: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 1120
    Height = 366
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 1
    object grd: TUniDBGrid
      Left = 0
      Top = 0
      Width = 1120
      Height = 366
      Hint = ''
      ClientEvents.UniEvents.Strings = (
        
          'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  config.cls=' +
          #39'custom-grid'#39';'#13#10'}')
      DataSource = dsRapor
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.Paged = False
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
          FieldName = 'kurum'
          Title.Caption = 'Kurum'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 200
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'src_time'
          Title.Caption = 'G'#246'nderim Tarihi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'src_type'
          Title.Caption = 'G'#246'nderim Tipi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 96
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'src_aciklama'
          Title.Caption = 'G'#246'nderim A'#231#305'klamas'#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 200
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'ar_id'
          Title.Caption = 'AR Ref. No.'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 96
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'ar_aciklama'
          Title.Caption = 'A'#231#305'k R'#305'za A'#231#305'klamas'#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 160
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'src_ip'
          Title.Caption = 'G'#246'nd. IP Adresi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 160
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'result'
          Title.Caption = 'Sonu'#231
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 69
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'result_str'
          Title.Caption = 'Sonu'#231' Mesaj'#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 400
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'result_id'
          Title.Caption = 'Sonu'#231' Kodu'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 128
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
        Name = 'kurum'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'ar_id'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'src_time'
        DataType = ftDateTime
      end
      item
        Name = 'src_type'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'src_ip'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'result_str'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'result_id'
        DataType = ftInteger
      end
      item
        Name = 'src_aciklama'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ar_aciklama'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'result'
        DataType = ftString
        Size = 20
      end>
    Left = 395
    Top = 249
    Data = {
      04000A0005006B7572756D0100C80000000000050061725F6964010014000000
      000008007372635F74696D650B0000000000000008007372635F747970650100
      14000000000006007372635F697001001400000000000A00726573756C745F73
      74720100C800000000000900726573756C745F696403000000000000000C0073
      72635F6163696B6C616D6101003200000000000B0061725F6163696B6C616D61
      0100C800000000000600726573756C740100140000000000000000000000}
  end
  object qkisi: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, kisi FROM def_data_kisi'
      'ORDER BY id')
    Left = 545
    Top = 166
  end
end
