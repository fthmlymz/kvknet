object frRptVKImhaRaporu: TfrRptVKImhaRaporu
  Left = 0
  Top = 0
  Width = 1196
  Height = 492
  OnCreate = UniFrameCreate
  TabOrder = 0
  object pnlTop: TUniPanel
    Left = 0
    Top = 0
    Width = 1196
    Height = 72
    Hint = ''
    Align = alTop
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    ClientEvents.ExtEvents.Strings = (
      
        'resize=function resize(sender, width, height, oldWidth, oldHeigh' +
        't, eOpts)'#13#10'{'#13#10'  ajaxRequest(sender, '#39'doResize'#39', []);'#13#10'}')
    Caption = ''
    DesignSize = (
      1196
      72)
    object btnSearch: TUniBitBtn
      Left = 766
      Top = 18
      Width = 96
      Height = 36
      Action = actSearch
      TabOrder = 1
      Images = MainMod.PrjImgList
      ImageIndex = 10
    end
    object btnClose: TUniBitBtn
      Left = 1087
      Top = 18
      Width = 96
      Height = 36
      Action = actClose
      Anchors = [akTop, akRight]
      TabOrder = 2
      Images = MainMod.PrjImgList
      ImageIndex = 5
    end
    object UniLabel1: TUniLabel
      Left = 8
      Top = 14
      Width = 79
      Height = 13
      Hint = ''
      Caption = 'Ba'#351'lang'#305#231' Tarihi'
      TabOrder = 3
    end
    object UniLabel2: TUniLabel
      Left = 195
      Top = 16
      Width = 52
      Height = 13
      Hint = ''
      Caption = 'Biti'#351' Tarihi'
      TabOrder = 4
    end
    object edBasTarih: TUniDateTimePicker
      Left = 93
      Top = 10
      Width = 96
      Height = 23
      Hint = ''
      DateTime = 44270.000000000000000000
      DateFormat = 'dd.MM.yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 5
    end
    object edBitTarih: TUniDateTimePicker
      Left = 253
      Top = 10
      Width = 96
      Height = 23
      Hint = ''
      DateTime = 44270.000000000000000000
      DateFormat = 'dd.MM.yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 6
    end
    object btnExcel: TUniBitBtn
      Left = 868
      Top = 18
      Width = 96
      Height = 36
      Action = actExcel
      TabOrder = 7
      ScreenMask.Enabled = True
      ScreenMask.Message = 'Dok'#252'man Haz'#305'rlan'#305'yor...'
      ScreenMask.Color = 16744448
      Images = MainMod.PrjImgList
      ImageIndex = 4
    end
    object UniLabel3: TUniLabel
      Left = 361
      Top = 16
      Width = 54
      Height = 13
      Hint = ''
      Caption = 'Ad'#305' Soyad'#305
      TabOrder = 8
    end
    object UniLabel4: TUniLabel
      Left = 555
      Top = 14
      Width = 67
      Height = 13
      Hint = ''
      Caption = 'Cep Telefonu'
      TabOrder = 9
    end
    object UniLabel5: TUniLabel
      Left = 25
      Top = 42
      Width = 62
      Height = 13
      Hint = ''
      Caption = 'Veri Kayna'#287#305
      TabOrder = 10
    end
    object edVeriKaynagi: TUniEdit
      Left = 93
      Top = 39
      Width = 256
      Height = 23
      Hint = ''
      CharCaseConversion = uccTurkish
      CharCase = ecUpperCase
      Text = ''
      TabOrder = 11
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase('#39'TR'#39')); '#13#10'  sender.inputEl.' +
          'dom.setSelectionRange(pos, pos);'#13#10'}'
        
          'keypress=function keypress(sender, e, eOpts)'#13#10'{'#13#10'   if (e.getKey' +
          '() == 13)'#13#10'   {'#13#10'      ajaxRequest(sender, '#39'doSearch'#39', ["aText="' +
          '+sender.getValue()]);'#13#10'   };'#13#10'}')
      OnAjaxEvent = edVeriKaynagiAjaxEvent
    end
    object edCepTel: TUniEdit
      Left = 629
      Top = 10
      Width = 128
      Height = 23
      Hint = ''
      CharCaseConversion = uccTurkish
      CharCase = ecUpperCase
      Text = ''
      TabOrder = 12
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase('#39'TR'#39')); '#13#10'  sender.inputEl.' +
          'dom.setSelectionRange(pos, pos);'#13#10'}'
        
          'keypress=function keypress(sender, e, eOpts)'#13#10'{'#13#10'   if (e.getKey' +
          '() == 13)'#13#10'   {'#13#10'      ajaxRequest(sender, '#39'doSearch'#39', ["aText="' +
          '+sender.getValue()]);'#13#10'   };'#13#10'}')
      OnAjaxEvent = edCepTelAjaxEvent
    end
    object edAdiSoyadi: TUniEdit
      Left = 421
      Top = 10
      Width = 128
      Height = 23
      Hint = ''
      CharCaseConversion = uccTurkish
      CharCase = ecUpperCase
      Text = ''
      TabOrder = 13
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase('#39'TR'#39')); '#13#10'  sender.inputEl.' +
          'dom.setSelectionRange(pos, pos);'#13#10'}'
        
          'keypress=function keypress(sender, e, eOpts)'#13#10'{'#13#10'   if (e.getKey' +
          '() == 13)'#13#10'   {'#13#10'      ajaxRequest(sender, '#39'doSearch'#39', ["aText="' +
          '+sender.getValue()]);'#13#10'   };'#13#10'}')
      OnAjaxEvent = edAdiSoyadiAjaxEvent
    end
    object UniLabel6: TUniLabel
      Left = 355
      Top = 42
      Width = 60
      Height = 13
      Hint = ''
      Caption = 'Departman '
      TabOrder = 14
    end
    object edDept: TUniComboBox
      Left = 421
      Top = 39
      Width = 336
      Height = 23
      Hint = ''
      Text = ''
      TabOrder = 15
      IconItems = <>
      OnChange = edDeptChange
    end
    object btnHelp: TUniBitBtn
      Left = 985
      Top = 18
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 16
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = btnHelpClick
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 72
    Width = 1196
    Height = 420
    Hint = ''
    ClientEvents.UniEvents.Strings = (
      
        'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  config.cls=' +
        #39'custom-grid'#39';'#13#10'}')
    DataSource = dsRapor
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
    WebOptions.Paged = False
    Grouping.FieldName = 'onem'
    Grouping.FieldCaption = #214'nem'
    Grouping.Enabled = True
    LoadMask.Message = 'L'#252'tfen Bekleyiniz ......'
    Align = alClient
    Font.OverrideDefaults = [ovFontHeight]
    ParentFont = False
    TabOrder = 1
    OnColumnSort = UniDBGrid1ColumnSort
    Columns = <
      item
        FieldName = 'ref_no'
        Title.Caption = 'Ref. No'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 75
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'onem'
        Title.Caption = #214'nem'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 100
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'deptstr'
        Title.Caption = 'Departman'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 250
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'kisi'
        Title.Caption = #304'lgili Ki'#351'i Grubu'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 200
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end
      item
        FieldName = 'kaynak_str'
        Title.Caption = 'Veri Kayna'#287#305
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 250
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end
      item
        FieldName = 'ar_durum'
        Title.Caption = 'A'#231#305'k R'#305'za Drm'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 100
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'ad_soyad'
        Title.Caption = 'Ad Soyad'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 200
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end
      item
        FieldName = 'gsmno'
        Title.Caption = 'Cep Telefonu'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 110
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'tarih'
        Title.Caption = 'A.R. Tarihi'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 100
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'bit_tarih'
        Title.Caption = 'Faal.Bt'#351'. Tarihi'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 100
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'sakl_tip'
        Title.Caption = 'Sakl. '#350'ekli'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 85
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'sakl_str'
        Title.Caption = 'Sakl. S'#252'resi'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 120
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end
      item
        FieldName = 'bitis_tarihi'
        Title.Caption = 'Pln.'#304'mha Tarihi'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 100
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'payl_taraf_str'
        Title.Caption = 'Payla'#351#305'lan Taraflar'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 250
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'main_dept_title'
        Title.Caption = #220'st Departman'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 250
        Font.OverrideDefaults = [ovFontHeight]
      end>
  end
  object ActList: TActionList
    Left = 156
    Top = 165
    object actSearch: TAction
      Caption = 'Liste'
      OnExecute = actSearchExecute
    end
    object actClose: TAction
      Caption = 'Kapat'
      OnExecute = actCloseExecute
    end
    object actExcel: TAction
      Caption = 'Excel'
      OnExecute = actExcelExecute
    end
    object actDurumDegistir: TAction
      Caption = 'Durumunu De'#287'i'#351'tir ('#304'mha Et)'
      OnExecute = actDurumDegistirExecute
    end
    object actDurumDegistirHepsini: TAction
      Caption = 'Hepsinin Durumunu De'#287'i'#351'tir ('#304'mha Et)'
    end
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT kategori_id, kategori_str, count(id)'
      'FROM vw_data_envanter'
      'WHERE active = '#39'E'#39' AND mc_id = 2'
      'GROUP BY kategori_id, kategori_str'
      'ORDER BY 1')
    Left = 156
    Top = 216
  end
  object qImha: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM'
      '('
      
        '(select ar.id as ref_no, '#39'NORMAL'#39'::character varying (10) as one' +
        'm, ayd.tanim as aydinlatma, kisi.kisi, ar.durum as ar_durum, ar.' +
        'ad_soyad, ar.gsmno, ar.tarih, '
      
        'null as bit_tarih, vk.kaynak_str, vk.sakl_tip, vk.sakl_str, vk.b' +
        'itis_tarihi'
      'from data_acikriza_vk vk'
      '  left join data_acikriza ar on ar.id = vk.ar_id'
      '  left join def_data_aydinlatma ayd on ayd.id = vk.ayd_id'
      '  left join def_data_kisi kisi on kisi.id = vk.kisi_id'
      'where vk.durum = '#39'ALINDI'#39' and ar.durum = '#39'AKT'#304'F'#39' and'
      
        '  vk.bitis_tarihi between '#39'01.01.2021'#39' and '#39'31.12.2021'#39' and vk.m' +
        'c_id = 2'
      'order by ar.id)'
      'union all'
      
        '(select ar.id as ref_no, '#39'AC'#304'L'#39'::character varying (10) as onem,' +
        ' ayd.tanim as aydinlatma, kisi.kisi, ar.durum as ar_durum, ar.ad' +
        '_soyad, ar.gsmno, ar.tarih, '
      
        'ar.faal_bitis as bit_tarih, vk.kaynak_str, vk.sakl_tip, vk.sakl_' +
        'str, vk.bitis_tarihi'
      'from data_acikriza_vk vk'
      '  left join data_acikriza ar on ar.id = vk.ar_id'
      '  left join def_data_aydinlatma ayd on ayd.id = vk.ayd_id'
      '  left join def_data_kisi kisi on kisi.id = vk.kisi_id'
      'where vk.durum = '#39'ALINDI'#39' and ar.durum <> '#39'AKT'#304'F'#39' and'
      'vk.bitis_tarihi < '#39'01.01.2024'#39' and vk.mc_id = 2'
      'order by ar.id)'
      ') as x')
    Left = 222
    Top = 165
  end
  object dsImha: TUniDataSource
    DataSet = qImha
    Left = 264
    Top = 165
  end
  object tblRapor: TVirtualTable
    FieldDefs = <
      item
        Name = 'ref_no'
        DataType = ftInteger
      end
      item
        Name = 'onem'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'aydinlatma'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'kisi'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ar_durum'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ad_soyad'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'gsmno'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'tarih'
        DataType = ftDate
      end
      item
        Name = 'bit_tarih'
        DataType = ftDate
      end
      item
        Name = 'kaynak_str'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'sakl_tip'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'sakl_str'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'bitis_tarihi'
        DataType = ftDate
      end
      item
        Name = 'deptstr'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'payl_taraf_str'
        DataType = ftString
        Size = 500
      end>
    Left = 219
    Top = 225
    Data = {
      04000F0006007265665F6E6F030000000000000004006F6E656D010007000000
      00000A00617964696E6C61746D61010064000000000004006B69736901006400
      00000000080061725F647572756D0100140000000000080061645F736F796164
      0100280000000000050067736D6E6F0100140000000000050074617269680900
      00000000000009006269745F746172696809000000000000000A006B61796E61
      6B5F7374720100E80300000000080073616B6C5F746970010014000000000008
      0073616B6C5F73747201003C00000000000C0062697469735F74617269686909
      000000000000000700646570747374720100E803000000000E007061796C5F74
      617261665F7374720100F40100000000000000000000}
  end
  object dsRapor: TUniDataSource
    DataSet = tblRapor
    Left = 264
    Top = 225
  end
  object UniPopupMenu1: TUniPopupMenu
    Left = 376
    Top = 208
    object DurumunuDeitirmhaEt1: TUniMenuItem
      Action = actDurumDegistir
    end
    object HepsininDurumunuDeitirmhaEt1: TUniMenuItem
      Action = actDurumDegistirHepsini
    end
  end
end
