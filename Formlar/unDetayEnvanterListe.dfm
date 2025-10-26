object frDetayEnvanterListe: TfrDetayEnvanterListe
  Left = 0
  Top = 0
  Width = 1146
  Height = 580
  OnCreate = UniFrameCreate
  TabOrder = 0
  object lbKayitSayisi: TUniLabel
    Left = 744
    Top = 280
    Width = 62
    Height = 13
    Hint = ''
    Caption = 'lbKayitSayisi'
    TabOrder = 2
  end
  object pnlTop: TUniPanel
    Left = 0
    Top = 0
    Width = 1146
    Height = 145
    Hint = ''
    Align = alTop
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      1146
      145)
    object edSrcType: TUniComboBox
      Left = 96
      Top = 14
      Width = 150
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'S'#220'RE'#199
      Items.Strings = (
        'REF. NO'
        'DEPARTMAN'
        #220'ST DEPARTMAN'
        'S'#220'RE'#199
        'VER'#304' KAYNA'#286'I'
        'KATEGOR'#304
        'VER'#304' T'#304'P'#304
        'VER'#304' KONUSU K'#304#350#304
        'TAR'#304'H'
        'OLU'#350'TURAN'
        'DE'#286#304#350'T'#304'REN')
      ItemIndex = 3
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
      CharCase = ecUpperCase
      IconItems = <>
      OnChange = edSrcTypeChange
    end
    object edSrcActive: TUniComboBox
      Left = 252
      Top = 14
      Width = 150
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'AKT'#304'F'
      Items.Strings = (
        'AKT'#304'F'
        'PAS'#304'F'
        'T'#220'M'#220)
      ItemIndex = 0
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 3
      IconItems = <>
      OnChange = edSrcActiveChange
    end
    object UniLabel1: TUniLabel
      Left = 12
      Top = 17
      Width = 78
      Height = 13
      Hint = ''
      Caption = 'Arama Kriterleri'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
    end
    object btnSearch: TUniBitBtn
      Left = 96
      Top = 91
      Width = 96
      Height = 36
      Action = actSearch
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 5
      Images = MainMod.PrjImgList
      ImageIndex = 10
    end
    object btnClose: TUniBitBtn
      Left = 1039
      Top = 91
      Width = 96
      Height = 36
      Action = actClose
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 6
      Images = MainMod.PrjImgList
      ImageIndex = 5
    end
    object UniLabel2: TUniLabel
      Left = 14
      Top = 50
      Width = 76
      Height = 13
      Hint = ''
      Caption = 'Aranacak '#304'fade'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 7
    end
    object edSrcDate: TUniDateTimePicker
      Left = 96
      Top = 42
      Width = 150
      Hint = ''
      Visible = False
      DateTime = 44101.000000000000000000
      DateFormat = 'dd.MM.yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 8
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      ClientEvents.ExtEvents.Strings = (
        
          'keypress=function keypress(sender, e, eOpts)'#13#10'{'#13#10'   if (e.getKey' +
          '() == 13)'#13#10'   {'#13#10'      ajaxRequest(sender, '#39'doSearch'#39', ["aText="' +
          '+sender.getValue()]);'#13#10'   };'#13#10'}')
      OnAjaxEvent = edSrcDateAjaxEvent
    end
    object edSrcText: TUniEdit
      Left = 96
      Top = 45
      Width = 306
      Hint = ''
      CharCaseConversion = uccTurkish
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase('#39'TR'#39')); '#13#10'  sender.inputEl.' +
          'dom.setSelectionRange(pos, pos);'#13#10'}'
        
          'keypress=function keypress(sender, e, eOpts)'#13#10'{'#13#10'   if (e.getKey' +
          '() == 13)'#13#10'   {'#13#10'      ajaxRequest(sender, '#39'doSearch'#39', ["aText="' +
          '+sender.getValue()]);'#13#10'   };'#13#10'}')
      OnAjaxEvent = edSrcTextAjaxEvent
    end
    object btnDownload: TUniMenuButton
      Left = 198
      Top = 91
      Width = 128
      Height = 36
      Hint = ''
      DropdownMenu = ppmDownload
      Caption = #304'ndir'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 9
      Images = MainMod.PrjImgList
      ImageIndex = 3
    end
    object btnHelp: TUniBitBtn
      Left = 937
      Top = 91
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 10
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = btnHelpClick
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 145
    Width = 1146
    Height = 435
    Hint = ''
    PagingBarAuxControl = lbKayitSayisi
    TitleFont.OverrideDefaults = [ovFontHeight]
    DataSource = dsEnvanter
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    WebOptions.PageSize = 50
    LoadMask.Message = 'Veri y'#252'kleniyor...'
    EmptyText = 'Veri yok'
    Align = alClient
    Font.OverrideDefaults = [ovFontHeight]
    ParentFont = False
    TabOrder = 1
    OnColumnSort = UniDBGrid1ColumnSort
    OnDrawColumnCell = UniDBGrid1DrawColumnCell
    Columns = <
      item
        FieldName = 'main_id'
        Title.Alignment = taCenter
        Title.Caption = 'Ref. No'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 75
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'active'
        Title.Alignment = taCenter
        Title.Caption = 'Aktif'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 85
        Font.OverrideDefaults = [ovFontHeight]
        Alignment = taLeftJustify
        Sortable = True
        CheckBoxField.BooleanFieldOnly = False
        CheckBoxField.FieldValues = 'E;H'
        CheckBoxField.DisplayValues = 'EVET;HAYIR'
      end
      item
        FieldName = 'kilitli'
        Title.Alignment = taCenter
        Title.Caption = 'Kilitli'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 64
        Font.OverrideDefaults = [ovFontHeight]
        Alignment = taLeftJustify
        Sortable = True
        CheckBoxField.BooleanFieldOnly = False
        CheckBoxField.FieldValues = 'E;H'
        CheckBoxField.DisplayValues = 'EVET;HAYIR'
      end
      item
        FieldName = 'dept_str'
        Title.Alignment = taCenter
        Title.Caption = 'Departman'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 180
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'surec_str'
        Title.Alignment = taCenter
        Title.Caption = 'S'#252're'#231
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 250
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'kaynak_str'
        Title.Alignment = taCenter
        Title.Caption = 'Veri Kayna'#287#305
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 250
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'kategori_str'
        Title.Alignment = taCenter
        Title.Caption = 'Veri Kategorisi'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 250
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'veritipi_str'
        Title.Alignment = taCenter
        Title.Caption = 'Veri Tipi'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 250
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'kisi_str'
        Title.Caption = 'Veri Konusu Ki'#351'i'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 200
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'nitelik'
        Title.Alignment = taCenter
        Title.Caption = #214'zel Ntl. K'#351'l. Veri'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 120
        Font.OverrideDefaults = [ovFontHeight]
        Alignment = taLeftJustify
        Sortable = True
        CheckBoxField.BooleanFieldOnly = False
        CheckBoxField.FieldValues = 'E;H'
        CheckBoxField.DisplayValues = 'EVET;HAYIR'
      end
      item
        FieldName = 'tarih'
        Title.Alignment = taCenter
        Title.Caption = 'Tarih'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 80
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'olusturan'
        Title.Alignment = taCenter
        Title.Caption = 'Olu'#351'turan'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 180
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'main_dept_str'
        Title.Caption = #220'st Departman'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 180
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'degistiren'
        Title.Alignment = taCenter
        Title.Caption = 'De'#287'i'#351'tiren'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 180
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end>
  end
  object dsEnvanter: TUniDataSource
    DataSet = qEnvanter
    Left = 279
    Top = 165
  end
  object ActList: TActionList
    Left = 339
    Top = 165
    object actSearch: TAction
      Caption = 'Liste'
      OnExecute = actSearchExecute
    end
    object actClose: TAction
      Caption = 'Kapat'
      OnExecute = actCloseExecute
    end
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    Left = 276
    Top = 219
  end
  object ppmDownload: TUniPopupMenu
    ScreenMask.Enabled = True
    ScreenMask.Message = 'Dok'#252'man Haz'#305'rlan'#305'yor...'
    ScreenMask.Color = 16744448
    Left = 409
    Top = 164
    object ppmiExcelTablosu: TUniMenuItem
      Caption = 'Excel Tablosu'
      OnClick = ppmiExcelTablosuClick
    end
    object ppmiEnvanterRaporu: TUniMenuItem
      Caption = 'Envanter Raporu'
      OnClick = ppmiEnvanterRaporuClick
    end
    object ppmiKVKKPolitikasi: TUniMenuItem
      Caption = 'KVKK Politikas'#305
      OnClick = ppmiKVKKPolitikasiClick
    end
    object ppmiImhaPolitikasi: TUniMenuItem
      Caption = 'Saklama ve '#304'mha Politikas'#305
      OnClick = ppmiImhaPolitikasiClick
    end
    object ppmOzelNitelikliVeriPolitikasi: TUniMenuItem
      Caption = #214'zel Nitelikli Veri Politikas'#305
      OnClick = ppmOzelNitelikliVeriPolitikasiClick
    end
  end
  object tblCatVT: TVirtualTable
    FieldDefs = <
      item
        Name = 'cat_id'
        DataType = ftInteger
      end
      item
        Name = 'cat_str'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'cat_info'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'cat_vt'
        DataType = ftString
        Size = 2000
      end>
    Left = 435
    Top = 219
    Data = {
      0400040006006361745F6964030000000000000007006361745F737472010064
      000000000008006361745F696E666F0100F4010000000006006361745F767401
      00D00700000000000000000000}
  end
  object qCatVT: TVirtualQuery
    IndexFieldNames = 'cat_str'
    SourceDataSets = <
      item
        DataSet = tblCatVT
      end>
    SQL.Strings = (
      'SELECT * FROM tblCatVT')
    Left = 489
    Top = 219
  end
  object qTmp2: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    Left = 321
    Top = 219
  end
  object tblKisiVT: TVirtualTable
    FieldDefs = <
      item
        Name = 'kisi_id'
        DataType = ftInteger
      end
      item
        Name = 'kisi_str'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'kisi_vt'
        DataType = ftString
        Size = 2000
      end>
    Left = 435
    Top = 264
    Data = {
      0400030007006B6973695F6964030000000000000008006B6973695F73747201
      0064000000000007006B6973695F76740100D00700000000000000000000}
  end
  object qKisiVT: TVirtualQuery
    IndexFieldNames = 'kisi_str'
    SourceDataSets = <
      item
        DataSet = tblKisiVT
      end>
    SQL.Strings = (
      'SELECT * FROM tblKisiVT')
    Left = 489
    Top = 264
  end
  object tblTaraf: TVirtualTable
    FieldDefs = <
      item
        Name = 'taraf_id'
        DataType = ftInteger
      end
      item
        Name = 'taraf_str'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'taraf_info'
        DataType = ftString
        Size = 500
      end>
    Left = 435
    Top = 309
    Data = {
      04000300080074617261665F69640300000000000000090074617261665F7374
      7201006400000000000A0074617261665F696E666F0100F40100000000000000
      000000}
  end
  object qTaraf: TVirtualQuery
    IndexFieldNames = 'taraf_str'
    SourceDataSets = <
      item
        DataSet = tblTaraf
      end>
    SQL.Strings = (
      'SELECT * FROM tblTaraf')
    Left = 489
    Top = 309
  end
  object qKisi: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      
        'SELECT DISTINCT env.kisi_id, ks.kisi AS kisi_str, ks.description' +
        ' AS kisi_info'
      'FROM data_envanter env'
      'LEFT JOIN def_data_kisi ks ON ks.id = env.kisi_id'
      'WHERE env.active = '#39'E'#39' AND env.mc_id = 2'
      'ORDER BY env.kisi_id')
    Left = 534
    Top = 219
  end
  object qEnvanter: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT *'
      'FROM data_envanter'
      'ORDER BY id')
    Left = 219
    Top = 165
  end
  object qRapor: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT env.*,'
      
        '     us1.full_name AS olusturan, us2.full_name AS degistiren, de' +
        'pt.title AS dept_str,'
      
        '     src.surec AS surec_str, kyn.kaynak AS kaynak_str, ks.kisi A' +
        'S kisi_str,'
      '     cat.kategori AS kategori_str, vt.veri_tipi AS veritipi_str,'
      
        '     fnc_id2str(env.topl_amac_ids, '#39'def_data_amac'#39', '#39'amac'#39')::cha' +
        'racter varying (5000) AS topl_amac_str1,'
      
        '     fnc_id2str(env.topl_metod_ids, '#39'def_data_metod'#39', '#39'metod'#39')::' +
        'character varying (5000) AS topl_metod_str1,'
      
        '     fnc_id2str(env.sakl_amac_ids, '#39'def_data_amac'#39', '#39'amac'#39')::cha' +
        'racter varying (5000) AS sakl_amac_str1,'
      
        '     fnc_id2str(env.sakl_metod_ids, '#39'def_data_metod'#39', '#39'metod'#39')::' +
        'character varying (5000) AS sakl_metod_str1,'
      
        '     fnc_id2str(env.sakl_erisim_ids, '#39'sys_deptdef'#39', '#39'title'#39')::ch' +
        'aracter varying (5000) AS sakl_erisim_str1,'
      
        '     fnc_id2str(env.payl_amac_ids, '#39'def_data_amac'#39', '#39'amac'#39')::cha' +
        'racter varying (5000) AS payl_amac_str1,'
      
        '     fnc_id2str(env.payl_metod_ids, '#39'def_data_metod'#39', '#39'metod'#39')::' +
        'character varying (5000) AS payl_metod_str1,'
      
        '     fnc_id2str(env.payl_taraf_ids, '#39'def_data_taraf'#39', '#39'taraf'#39')::' +
        'character varying (5000) AS payl_taraf_str1,'
      
        '     fnc_id2str(env.dgr_dayanak_ids, '#39'def_data_dayanak'#39', '#39'dayana' +
        'k'#39')::character varying (5000) AS dgr_dayanak_str,'
      
        '     fnc_id2str(env.dgr_dokuman_ids, '#39'def_data_dokuman'#39', '#39'dokuma' +
        'n'#39')::character varying (5000) AS dgr_dokuman_str,'
      '     chl.*,'
      
        '     fnc_id2str(chl.kontrol_id::character varying (20), '#39'def_dat' +
        'a_kontrolsonuc'#39', '#39'kontrolsonuc'#39')::character varying (50) AS kont' +
        'rol_str,'
      
        '     fnc_id2str(chl.tedbir_ids, '#39'def_data_tedbir'#39', '#39'tedbir'#39')::ch' +
        'aracter varying (5000) AS tedbir_str,'
      
        '     fnc_id2str(chl.dayanak_ids, '#39'def_data_dayanak'#39', '#39'dayanak'#39'):' +
        ':character varying (5000) AS dayanak_str,'
      
        '     fnc_id2str(chl.dokuman_ids, '#39'def_data_dokuman'#39', '#39'dokuman'#39'):' +
        ':character varying (5000) AS dokuman_str,'
      
        '     fnc_id2str(chl.ekipman_ids, '#39'def_data_ekipman'#39', '#39'ekipman'#39'):' +
        ':character varying (5000) AS ekipman_str,'
      
        '     fnc_id2str(chl.sorumlu_ids, '#39'sys_deptdef'#39', '#39'title'#39')::charac' +
        'ter varying (5000) AS sorumlu_str,'
      
        '     fnc_id2str(chl.onem_derecesi_id::character varying (20), '#39'd' +
        'ef_data_onemderece'#39', '#39'onemderece'#39')::character varying (50) AS on' +
        'em_derecesi_str,'
      
        '     menv.topl_amac_ids, menv.topl_metod_ids, menv.sakl_amac_ids' +
        ', menv.sakl_metod_ids,'
      
        '     menv.sakl_erisim_ids, menv.payl_amac_ids, menv.payl_metod_i' +
        'ds, menv.payl_taraf_ids,'
      
        '     fnc_id2str(menv.topl_amac_ids, '#39'def_data_amac'#39', '#39'amac'#39')::ch' +
        'aracter varying (5000) AS topl_amac_str2,'
      
        '     fnc_id2str(menv.topl_metod_ids, '#39'def_data_metod'#39', '#39'metod'#39'):' +
        ':character varying (5000) AS topl_metod_str2,'
      
        '     fnc_id2str(menv.sakl_amac_ids, '#39'def_data_amac'#39', '#39'amac'#39')::ch' +
        'aracter varying (5000) AS sakl_amac_str2,'
      
        '     fnc_id2str(menv.sakl_metod_ids, '#39'def_data_metod'#39', '#39'metod'#39'):' +
        ':character varying (5000) AS sakl_metod_str2,'
      
        '     fnc_id2str(menv.sakl_erisim_ids, '#39'sys_deptdef'#39', '#39'title'#39')::c' +
        'haracter varying (5000) AS sakl_erisim_str2,'
      
        '     fnc_id2str(menv.payl_amac_ids, '#39'def_data_amac'#39', '#39'amac'#39')::ch' +
        'aracter varying (5000) AS payl_amac_str2,'
      
        '     fnc_id2str(menv.payl_metod_ids, '#39'def_data_metod'#39', '#39'metod'#39'):' +
        ':character varying (5000) AS payl_metod_str2,'
      
        '     fnc_id2str(menv.payl_taraf_ids, '#39'def_data_taraf'#39', '#39'taraf'#39'):' +
        ':character varying (5000) AS payl_taraf_str2'
      'FROM data_envanter env'
      '     LEFT JOIN usr_user us1 ON us1.id = env.idy'
      '     LEFT JOIN usr_user us2 ON us2.id = env.sdy'
      '     LEFT JOIN sys_deptdef dept ON dept.id = env.dept_id'
      '     LEFT JOIN def_data_surec src ON src.id = env.surec_id'
      '     LEFT JOIN def_data_kaynak kyn ON kyn.id = env.kaynak_id'
      '     LEFT JOIN def_data_kisi ks ON ks.id = env.kisi_id'
      '     LEFT JOIN def_data_kategori cat ON cat.id = env.kategori_id'
      '     LEFT JOIN def_data_veritipi vt ON vt.id = env.veritipi_id'
      
        '     LEFT JOIN data_checklist chl ON chl.active = '#39'E'#39' AND chl.ka' +
        'ynak_id = env.kaynak_id AND chl.kisi_id = env.kisi_id'
      '     LEFT JOIN data_envanter menv ON menv.id = env.main_id'
      'WHERE env.main_id > 0 AND env.mc_id = 2 AND env.active = '#39'E'#39
      'ORDER BY env.tarih DESC, env.id DESC')
    OnCalcFields = qRaporCalcFields
    Left = 219
    Top = 222
    object qRaporid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object qRapormc_id: TIntegerField
      FieldName = 'mc_id'
    end
    object qRaporactive: TStringField
      FieldName = 'active'
      Size = 1
    end
    object qRaporidy: TIntegerField
      FieldName = 'idy'
    end
    object qRaporidt: TDateTimeField
      FieldName = 'idt'
    end
    object qRaporsdy: TIntegerField
      FieldName = 'sdy'
    end
    object qRaporsdt: TDateTimeField
      FieldName = 'sdt'
    end
    object qRaportarih: TDateField
      FieldName = 'tarih'
    end
    object qRapordept_id: TIntegerField
      FieldName = 'dept_id'
    end
    object qRaporsurec_id: TIntegerField
      FieldName = 'surec_id'
    end
    object qRaporkaynak_id: TIntegerField
      FieldName = 'kaynak_id'
    end
    object qRaporveritipi_id: TIntegerField
      FieldName = 'veritipi_id'
    end
    object qRaporkategori_id: TIntegerField
      FieldName = 'kategori_id'
    end
    object qRaporkisi_id: TIntegerField
      FieldName = 'kisi_id'
    end
    object qRapornitelik: TStringField
      FieldName = 'nitelik'
      Size = 1
    end
    object qRaportopl_amac_ids: TStringField
      FieldName = 'topl_amac_ids'
      ReadOnly = True
      Size = 500
    end
    object qRaportopl_detay: TStringField
      FieldName = 'topl_detay'
      Size = 300
    end
    object qRaportopl_cikti: TStringField
      FieldName = 'topl_cikti'
      Size = 300
    end
    object qRaportopl_paylasim: TStringField
      FieldName = 'topl_paylasim'
      Size = 300
    end
    object qRaportopl_paylasimtipi: TStringField
      FieldName = 'topl_paylasimtipi'
      Size = 300
    end
    object qRaporsakl_metod_ids: TStringField
      FieldName = 'sakl_metod_ids'
      ReadOnly = True
      Size = 500
    end
    object qRaporsakl_sanalonlem: TStringField
      FieldName = 'sakl_sanalonlem'
      Size = 300
    end
    object qRaporsakl_fizikselonlem: TStringField
      FieldName = 'sakl_fizikselonlem'
      Size = 300
    end
    object qRaporsakl_erisim_ids: TStringField
      FieldName = 'sakl_erisim_ids'
      ReadOnly = True
      Size = 500
    end
    object qRaporsakl_amac_ids: TStringField
      FieldName = 'sakl_amac_ids'
      ReadOnly = True
      Size = 500
    end
    object qRaporsakl_imha: TStringField
      FieldName = 'sakl_imha'
      Size = 1
    end
    object qRaporpayl_taraf_ids: TStringField
      FieldName = 'payl_taraf_ids'
      ReadOnly = True
      Size = 500
    end
    object qRaporpayl_amac_ids: TStringField
      FieldName = 'payl_amac_ids'
      ReadOnly = True
      Size = 500
    end
    object qRaporpayl_metod_ids: TStringField
      FieldName = 'payl_metod_ids'
      ReadOnly = True
      Size = 500
    end
    object qRaporpayl_sozlesme: TStringField
      FieldName = 'payl_sozlesme'
      Size = 1
    end
    object qRaporpayl_sozisim: TStringField
      FieldName = 'payl_sozisim'
      Size = 300
    end
    object qRaporpayl_sozmadde: TStringField
      FieldName = 'payl_sozmadde'
      Size = 300
    end
    object qRapordgr_dayanak_ids: TStringField
      FieldName = 'dgr_dayanak_ids'
      Size = 500
    end
    object qRapordgr_dokuman_ids: TStringField
      FieldName = 'dgr_dokuman_ids'
      Size = 500
    end
    object qRapordgr_politika: TStringField
      FieldName = 'dgr_politika'
      Size = 1
    end
    object qRapordgr_polisim: TStringField
      FieldName = 'dgr_polisim'
      Size = 300
    end
    object qRapordgr_polmadde: TStringField
      FieldName = 'dgr_polmadde'
      Size = 300
    end
    object qRapordgr_sozlesme: TStringField
      FieldName = 'dgr_sozlesme'
      Size = 1
    end
    object qRapordgr_sozisim: TStringField
      FieldName = 'dgr_sozisim'
      Size = 300
    end
    object qRapordgr_sozmadde: TStringField
      FieldName = 'dgr_sozmadde'
      Size = 300
    end
    object qRaportopl_metod_ids: TStringField
      FieldName = 'topl_metod_ids'
      ReadOnly = True
      Size = 500
    end
    object qRaporpayl_taraftipi: TStringField
      FieldName = 'payl_taraftipi'
      Size = 15
    end
    object qRaporsakl_ssure_tip: TStringField
      FieldName = 'sakl_ssure_tip'
      Size = 5
    end
    object qRaporsakl_fsure_tip: TStringField
      FieldName = 'sakl_fsure_tip'
      Size = 5
    end
    object qRaporsakl_ssure_sure: TIntegerField
      FieldName = 'sakl_ssure_sure'
    end
    object qRaporsakl_fsure_sure: TIntegerField
      FieldName = 'sakl_fsure_sure'
    end
    object qRaporsakl_ssure_diger: TStringField
      FieldName = 'sakl_ssure_diger'
      Size = 50
    end
    object qRaporsakl_fsure_diger: TStringField
      FieldName = 'sakl_fsure_diger'
      Size = 50
    end
    object qRaporsakl_ssure_imha: TStringField
      FieldName = 'sakl_ssure_imha'
      Size = 10
    end
    object qRaporsakl_fsure_imha: TStringField
      FieldName = 'sakl_fsure_imha'
      Size = 10
    end
    object qRaporsakl_ssure_var: TStringField
      FieldName = 'sakl_ssure_var'
      Size = 15
    end
    object qRaporsakl_fsure_var: TStringField
      FieldName = 'sakl_fsure_var'
      Size = 15
    end
    object qRapormain_id: TIntegerField
      FieldName = 'main_id'
    end
    object qRaporsakl_ssure: TStringField
      FieldName = 'sakl_ssure'
      Size = 50
    end
    object qRaporsakl_fsure: TStringField
      FieldName = 'sakl_fsure'
      Size = 50
    end
    object qRaporolusturan: TStringField
      FieldName = 'olusturan'
      ReadOnly = True
      Size = 30
    end
    object qRapordegistiren: TStringField
      FieldName = 'degistiren'
      ReadOnly = True
      Size = 30
    end
    object qRapordept_str: TStringField
      FieldName = 'dept_str'
      ReadOnly = True
      Size = 30
    end
    object qRaporsurec_str: TStringField
      FieldName = 'surec_str'
      ReadOnly = True
      Size = 150
    end
    object qRaporkaynak_str: TStringField
      FieldName = 'kaynak_str'
      ReadOnly = True
      Size = 100
    end
    object qRaporkisi_str: TStringField
      FieldName = 'kisi_str'
      ReadOnly = True
      Size = 100
    end
    object qRaporkategori_str: TStringField
      FieldName = 'kategori_str'
      ReadOnly = True
      Size = 100
    end
    object qRaporveritipi_str: TStringField
      FieldName = 'veritipi_str'
      ReadOnly = True
      Size = 100
    end
    object qRaportopl_amac_str1: TStringField
      FieldName = 'topl_amac_str1'
      ReadOnly = True
      Size = 5000
    end
    object qRaportopl_metod_str1: TStringField
      FieldName = 'topl_metod_str1'
      ReadOnly = True
      Size = 5000
    end
    object qRaporsakl_amac_str1: TStringField
      FieldName = 'sakl_amac_str1'
      ReadOnly = True
      Size = 5000
    end
    object qRaporsakl_metod_str1: TStringField
      FieldName = 'sakl_metod_str1'
      ReadOnly = True
      Size = 5000
    end
    object qRaporsakl_erisim_str1: TStringField
      FieldName = 'sakl_erisim_str1'
      ReadOnly = True
      Size = 5000
    end
    object qRaporpayl_amac_str1: TStringField
      FieldName = 'payl_amac_str1'
      ReadOnly = True
      Size = 5000
    end
    object qRaporpayl_metod_str1: TStringField
      FieldName = 'payl_metod_str1'
      ReadOnly = True
      Size = 5000
    end
    object qRaporpayl_taraf_str1: TStringField
      FieldName = 'payl_taraf_str1'
      ReadOnly = True
      Size = 5000
    end
    object qRapordgr_dayanak_str: TStringField
      FieldName = 'dgr_dayanak_str'
      ReadOnly = True
      Size = 5000
    end
    object qRapordgr_dokuman_str: TStringField
      FieldName = 'dgr_dokuman_str'
      ReadOnly = True
      Size = 5000
    end
    object qRaporid_1: TIntegerField
      FieldName = 'id_1'
      ReadOnly = True
      Required = True
    end
    object qRapormc_id_1: TIntegerField
      FieldName = 'mc_id_1'
      ReadOnly = True
    end
    object qRaporactive_1: TStringField
      FieldName = 'active_1'
      ReadOnly = True
      Size = 1
    end
    object qRaporidy_1: TIntegerField
      FieldName = 'idy_1'
      ReadOnly = True
    end
    object qRaporidt_1: TDateTimeField
      FieldName = 'idt_1'
      ReadOnly = True
    end
    object qRaporsdy_1: TIntegerField
      FieldName = 'sdy_1'
      ReadOnly = True
    end
    object qRaporsdt_1: TDateTimeField
      FieldName = 'sdt_1'
      ReadOnly = True
    end
    object qRaportarih_1: TDateField
      FieldName = 'tarih_1'
      ReadOnly = True
    end
    object qRaporkaynak_id_1: TIntegerField
      FieldName = 'kaynak_id_1'
      ReadOnly = True
    end
    object qRaporkontrol_id: TIntegerField
      FieldName = 'kontrol_id'
      ReadOnly = True
    end
    object qRaportedbir_ids: TStringField
      FieldName = 'tedbir_ids'
      ReadOnly = True
      Size = 500
    end
    object qRapordayanak_ids: TStringField
      FieldName = 'dayanak_ids'
      ReadOnly = True
      Size = 500
    end
    object qRapordokuman_ids: TStringField
      FieldName = 'dokuman_ids'
      ReadOnly = True
      Size = 500
    end
    object qRaporekipman_ids: TStringField
      FieldName = 'ekipman_ids'
      ReadOnly = True
      Size = 500
    end
    object qRaporsorumlu_ids: TStringField
      FieldName = 'sorumlu_ids'
      ReadOnly = True
      Size = 500
    end
    object qRaporhkk_gereksinim: TStringField
      FieldName = 'hkk_gereksinim'
      ReadOnly = True
      Size = 300
    end
    object qRaporhkk_sozlesme: TStringField
      FieldName = 'hkk_sozlesme'
      ReadOnly = True
      Size = 300
    end
    object qRaporhkk_sozmadde: TStringField
      FieldName = 'hkk_sozmadde'
      ReadOnly = True
      Size = 300
    end
    object qRaporcalisma_talimat: TStringField
      FieldName = 'calisma_talimat'
      ReadOnly = True
      Size = 300
    end
    object qRaporoneriler: TStringField
      FieldName = 'oneriler'
      ReadOnly = True
      Size = 300
    end
    object qRaporguncelleme_araligi: TStringField
      FieldName = 'guncelleme_araligi'
      ReadOnly = True
      Size = 300
    end
    object qRaportetkik_araligi: TStringField
      FieldName = 'tetkik_araligi'
      ReadOnly = True
      Size = 300
    end
    object qRaportetkik_yonetim: TStringField
      FieldName = 'tetkik_yonetim'
      ReadOnly = True
      Size = 300
    end
    object qRaporonem_derecesi_id: TIntegerField
      FieldName = 'onem_derecesi_id'
      ReadOnly = True
    end
    object qRaporkoru_idarionlem: TStringField
      FieldName = 'koru_idarionlem'
      ReadOnly = True
      Size = 300
    end
    object qRaporkoru_teknikonlem: TStringField
      FieldName = 'koru_teknikonlem'
      ReadOnly = True
      Size = 300
    end
    object qRapordanisman_notu: TStringField
      FieldName = 'danisman_notu'
      ReadOnly = True
      Size = 300
    end
    object qRaporkisi_id_1: TIntegerField
      FieldName = 'kisi_id_1'
      ReadOnly = True
    end
    object qRaporkilitli: TStringField
      FieldName = 'kilitli'
      ReadOnly = True
      Size = 1
    end
    object qRaporkilitli_sdy: TIntegerField
      FieldName = 'kilitli_sdy'
      ReadOnly = True
    end
    object qRaporkilitli_sdt: TDateTimeField
      FieldName = 'kilitli_sdt'
      ReadOnly = True
    end
    object qRaporkontrol_str: TStringField
      FieldName = 'kontrol_str'
      ReadOnly = True
      Size = 50
    end
    object qRaportedbir_str: TStringField
      FieldName = 'tedbir_str'
      ReadOnly = True
      Size = 5000
    end
    object qRapordayanak_str: TStringField
      FieldName = 'dayanak_str'
      ReadOnly = True
      Size = 5000
    end
    object qRapordokuman_str: TStringField
      FieldName = 'dokuman_str'
      ReadOnly = True
      Size = 5000
    end
    object qRaporekipman_str: TStringField
      FieldName = 'ekipman_str'
      ReadOnly = True
      Size = 5000
    end
    object qRaporsorumlu_str: TStringField
      FieldName = 'sorumlu_str'
      ReadOnly = True
      Size = 5000
    end
    object qRaporonem_derecesi_str: TStringField
      FieldName = 'onem_derecesi_str'
      ReadOnly = True
      Size = 50
    end
    object qRaportopl_amac_ids_1: TStringField
      FieldName = 'topl_amac_ids_1'
      Size = 500
    end
    object qRaportopl_metod_ids_1: TStringField
      FieldName = 'topl_metod_ids_1'
      Size = 500
    end
    object qRaporsakl_amac_ids_1: TStringField
      FieldName = 'sakl_amac_ids_1'
      Size = 500
    end
    object qRaporsakl_metod_ids_1: TStringField
      FieldName = 'sakl_metod_ids_1'
      Size = 500
    end
    object qRaporsakl_erisim_ids_1: TStringField
      FieldName = 'sakl_erisim_ids_1'
      Size = 500
    end
    object qRaporpayl_amac_ids_1: TStringField
      FieldName = 'payl_amac_ids_1'
      Size = 500
    end
    object qRaporpayl_metod_ids_1: TStringField
      FieldName = 'payl_metod_ids_1'
      Size = 500
    end
    object qRaporpayl_taraf_ids_1: TStringField
      FieldName = 'payl_taraf_ids_1'
      Size = 500
    end
    object qRaportopl_amac_str2: TStringField
      FieldName = 'topl_amac_str2'
      ReadOnly = True
      Size = 5000
    end
    object qRaportopl_metod_str2: TStringField
      FieldName = 'topl_metod_str2'
      ReadOnly = True
      Size = 5000
    end
    object qRaporsakl_amac_str2: TStringField
      FieldName = 'sakl_amac_str2'
      ReadOnly = True
      Size = 5000
    end
    object qRaporsakl_metod_str2: TStringField
      FieldName = 'sakl_metod_str2'
      ReadOnly = True
      Size = 5000
    end
    object qRaporsakl_erisim_str2: TStringField
      FieldName = 'sakl_erisim_str2'
      ReadOnly = True
      Size = 5000
    end
    object qRaporpayl_amac_str2: TStringField
      FieldName = 'payl_amac_str2'
      ReadOnly = True
      Size = 5000
    end
    object qRaporpayl_metod_str2: TStringField
      FieldName = 'payl_metod_str2'
      ReadOnly = True
      Size = 5000
    end
    object qRaporpayl_taraf_str2: TStringField
      FieldName = 'payl_taraf_str2'
      ReadOnly = True
      Size = 5000
    end
    object qRaportopl_amac_str: TStringField
      FieldKind = fkCalculated
      FieldName = 'topl_amac_str'
      Size = 5000
      Calculated = True
    end
    object qRaportopl_metod_str: TStringField
      FieldKind = fkCalculated
      FieldName = 'topl_metod_str'
      Size = 5000
      Calculated = True
    end
    object qRaporsakl_amac_str: TStringField
      FieldKind = fkCalculated
      FieldName = 'sakl_amac_str'
      Size = 5000
      Calculated = True
    end
    object qRaporsakl_metod_str: TStringField
      FieldKind = fkCalculated
      FieldName = 'sakl_metod_str'
      Size = 5000
      Calculated = True
    end
    object qRaporsakl_erisim_str: TStringField
      FieldKind = fkCalculated
      FieldName = 'sakl_erisim_str'
      Size = 5000
      Calculated = True
    end
    object qRaporpayl_amac_str: TStringField
      FieldKind = fkCalculated
      FieldName = 'payl_amac_str'
      Size = 5000
      Calculated = True
    end
    object qRaporpayl_metod_str: TStringField
      FieldKind = fkCalculated
      FieldName = 'payl_metod_str'
      Size = 5000
      Calculated = True
    end
    object qRaporpayl_taraf_str: TStringField
      FieldKind = fkCalculated
      FieldName = 'payl_taraf_str'
      Size = 5000
      Calculated = True
    end
  end
  object tblSure: TVirtualTable
    FieldDefs = <
      item
        Name = 'cat_id'
        DataType = ftInteger
      end
      item
        Name = 'cat_str'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'data_str'
        DataType = ftString
        Size = 300
      end>
    Left = 584
    Top = 219
    Data = {
      0400030006006361745F6964030000000000000007006361745F73747201002C
      01000000000800646174615F73747201002C0100000000000000000000}
  end
  object qSure: TVirtualQuery
    SourceDataSets = <
      item
        DataSet = tblSure
      end>
    SQL.Strings = (
      'SELECT * FROM tblAmac')
    Left = 638
    Top = 219
  end
  object DOCXRpt: TrXMLReport
    ActionAfter = aaNone
    OnUserCalc = DOCXRptUserCalc
    Left = 477
    Top = 164
  end
  object qdayanak: TUniQuery
    Connection = MainMod.DBMain
    Left = 728
    Top = 184
  end
  object qamac: TUniQuery
    Connection = MainMod.DBMain
    Left = 728
    Top = 240
  end
  object qilgiliKisiSure: TUniQuery
    Connection = MainMod.DBMain
    Left = 720
    Top = 296
  end
end
