object frVSDepartmanListe: TfrVSDepartmanListe
  Left = 0
  Top = 0
  Width = 850
  Height = 454
  OnCreate = UniFrameCreate
  TabOrder = 0
  object lbKayitSayisi: TUniLabel
    Left = 300
    Top = 304
    Width = 62
    Height = 13
    Hint = ''
    Caption = 'lbKayitSayisi'
    TabOrder = 2
  end
  object pnlTop: TUniPanel
    Left = 0
    Top = 0
    Width = 850
    Height = 79
    Hint = ''
    Align = alTop
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      850
      79)
    object edSrcType: TUniComboBox
      Left = 96
      Top = 15
      Width = 180
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'REF. NO'
      Items.Strings = (
        'REF. NO'
        'DEPARTMAN'
        #220'ST DEPARTMAN'
        'ONAY'
        'DURUMU'
        'AD SOYAD'
        'CEP TELEFONU'
        'E-MAIL'
        'BA'#350'V. TAR'#304'H'#304
        'BA'#350'V. B'#304#199#304'M'#304
        'BA'#350'V. EVR. NO')
      ItemIndex = 0
      TabOrder = 1
      CharCase = ecUpperCase
      IconItems = <>
      OnChange = edSrcTypeChange
    end
    object edSrcDurum: TUniComboBox
      Left = 96
      Top = 50
      Width = 180
      Height = 28
      Hint = ''
      Visible = False
      Style = csDropDownList
      Text = 'T'#220'M'#220
      Items.Strings = (
        'T'#220'M'#220
        'BEKLEMEDE'
        #304'NCELEN'#304'YOR'
        'CEVAPLANDI')
      ItemIndex = 0
      TabOrder = 3
      IconItems = <>
      OnChange = edSrcDurumChange
    end
    object UniLabel1: TUniLabel
      Left = 12
      Top = 20
      Width = 78
      Height = 13
      Hint = ''
      Caption = 'Arama Kriterleri'
      TabOrder = 4
    end
    object btnSearch: TUniBitBtn
      Left = 282
      Top = 25
      Width = 96
      Height = 36
      Action = actSearch
      TabOrder = 5
      Images = MainMod.PrjImgList
      ImageIndex = 10
    end
    object btnEdit: TUniBitBtn
      Left = 384
      Top = 25
      Width = 96
      Height = 36
      Action = actEdit
      TabOrder = 6
      Images = MainMod.PrjImgList
      ImageIndex = 2
    end
    object UniLabel2: TUniLabel
      Left = 12
      Top = 51
      Width = 76
      Height = 13
      Hint = ''
      Caption = 'Aranacak '#304'fade'
      TabOrder = 7
    end
    object edSrcBvSekil: TUniComboBox
      Left = 96
      Top = 51
      Width = 180
      Height = 28
      Hint = ''
      Visible = False
      Style = csDropDownList
      Text = 'T'#220'M'#220
      Items.Strings = (
        'T'#220'M'#220
        #350'AHSEN'
        'NOTER'
        'KEP'
        'MA'#304'L'
        'TAAH. POSTA'
        'ONLINE'
        'ELDEN')
      ItemIndex = 0
      TabOrder = 8
      IconItems = <>
      OnChange = edSrcDurumChange
    end
    object edSrcOnay: TUniComboBox
      Left = 96
      Top = 51
      Width = 180
      Height = 28
      Hint = ''
      Visible = False
      Style = csDropDownList
      Text = 'T'#220'M'#220
      Items.Strings = (
        'T'#220'M'#220
        'BEKL'#304'YOR'
        'ONAYLANDI')
      ItemIndex = 0
      TabOrder = 9
      IconItems = <>
      OnChange = edSrcDurumChange
    end
    object edSrcText: TUniEdit
      Left = 96
      Top = 50
      Width = 180
      Height = 23
      Hint = ''
      CharCaseConversion = uccTurkish
      CharCase = ecUpperCase
      Text = ''
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
    object edSrcDate: TUniDateTimePicker
      Left = 95
      Top = 50
      Width = 181
      Height = 23
      Hint = ''
      Visible = False
      DateTime = 44101.000000000000000000
      DateFormat = 'dd.MM.yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 10
      ClientEvents.ExtEvents.Strings = (
        
          'keypress=function keypress(sender, e, eOpts)'#13#10'{'#13#10'   if (e.getKey' +
          '() == 13)'#13#10'   {'#13#10'      ajaxRequest(sender, '#39'doSearch'#39', ["aText="' +
          '+sender.getValue()]);'#13#10'   };'#13#10'}')
      OnChange = edSrcDateChange
    end
    object btnClose: TUniBitBtn
      Left = 740
      Top = 25
      Width = 96
      Height = 36
      Action = actClose
      Anchors = [akTop, akRight]
      TabOrder = 11
      Images = MainMod.PrjImgList
    end
    object btnHelp: TUniBitBtn
      Left = 638
      Top = 25
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 12
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = btnHelpClick
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 79
    Width = 850
    Height = 375
    Hint = ''
    PagingBarAuxControl = lbKayitSayisi
    TitleFont.OverrideDefaults = [ovFontHeight]
    DataSource = dsVSDept
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    WebOptions.PageSize = 50
    LoadMask.Message = 'Veri y'#252'kleniyor...'
    EmptyText = 'Veri yok'
    Align = alClient
    Font.OverrideDefaults = [ovFontHeight]
    ParentFont = False
    TabOrder = 1
    OnColumnSort = UniDBGrid1ColumnSort
    Columns = <
      item
        FieldName = 'vsb_id'
        Title.Caption = 'Ref. No'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 75
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        Sortable = True
      end
      item
        FieldName = 'dept_name'
        Title.Caption = 'Departman'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 150
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        Sortable = True
      end
      item
        FieldName = 'onay'
        Title.Caption = 'Onay'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 100
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        Sortable = True
      end
      item
        FieldName = 'durum'
        Title.Caption = 'Ba'#351'v. Durumu'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 120
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        Sortable = True
      end
      item
        FieldName = 'adisoyadi'
        Title.Caption = #304'lgili Ki'#351'i Ad-Soyad'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 180
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        Sortable = True
      end
      item
        FieldName = 'tel1'
        Title.Caption = 'Cep Telefonu'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 120
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
      end
      item
        FieldName = 'email'
        Title.Caption = 'E-Mail'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 200
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
      end
      item
        FieldName = 'vsgrup'
        Title.Caption = #304'lgili Ki'#351'i Grubu'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 150
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        Sortable = True
      end
      item
        FieldName = 'basvuru_tarihi'
        Title.Caption = 'Ba'#351'v. Tarihi'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 128
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        Sortable = True
      end
      item
        FieldName = 'basvuru_sekli'
        Title.Caption = 'Ba'#351'v. Bi'#231'imi'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 100
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        Sortable = True
      end
      item
        FieldName = 'son_tarih'
        Title.Caption = 'Son Cevap Tarihi'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 128
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        Sortable = True
      end
      item
        FieldName = 'basvuru_evrakno'
        Title.Caption = 'Ba'#351'v. Evr. No'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 120
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        Sortable = True
      end
      item
        FieldName = 'main_dept_name'
        Title.Caption = #220'st Departman'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 150
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'sdt'
        Title.Caption = 'Onay Zaman'#305
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 120
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        Sortable = True
      end>
  end
  object ActList: TActionList
    Left = 339
    Top = 165
    object actEdit: TAction
      Caption = 'De'#287'i'#351'tir'
      OnExecute = actEditExecute
    end
    object actCopy: TAction
      Caption = 'Kopyala'
      Hint = 'Se'#231'ili Kayd'#305'n Koyas'#305'n'#305' Olu'#351'tur'
    end
    object actSearch: TAction
      Caption = 'Liste'
      OnExecute = actSearchExecute
    end
    object actClose: TAction
      Caption = 'Kapat'
      OnExecute = actCloseExecute
    end
  end
  object dsVSDept: TUniDataSource
    DataSet = qVSDept
    Left = 279
    Top = 165
  end
  object qVSDept: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT vdp.*, bv.*, dp.title as dept_name, ks.kisi as vsgrup'
      'FROM data_vsbasvuru_dept vdp'
      '  LEFT JOIN data_vsbasvuru bv ON bv.id = vdp.vsb_id'
      '  LEFT JOIN sys_deptdef dp ON dp.id = vdp.dept_id'
      '  LEFT JOIN def_data_kisi ks ON ks.id = bv.kg_id'
      'WHERE dp.mc_id = 2'
      'ORDER BY bv.basvuru_tarihi')
    OnCalcFields = qVSDeptCalcFields
    Left = 228
    Top = 165
    object qVSDeptid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object qVSDeptvsb_id: TIntegerField
      FieldName = 'vsb_id'
    end
    object qVSDeptmc_id: TIntegerField
      FieldName = 'mc_id'
    end
    object qVSDeptdept_id: TIntegerField
      FieldName = 'dept_id'
    end
    object qVSDeptonay: TStringField
      FieldName = 'onay'
      Size = 10
    end
    object qVSDeptidy: TIntegerField
      FieldName = 'idy'
    end
    object qVSDeptidt: TDateTimeField
      FieldName = 'idt'
    end
    object qVSDeptsdy: TIntegerField
      FieldName = 'sdy'
    end
    object qVSDeptsdt: TDateTimeField
      FieldName = 'sdt'
    end
    object qVSDeptaciklama: TStringField
      FieldName = 'aciklama'
      Size = 500
    end
    object qVSDeptid_1: TIntegerField
      FieldName = 'id_1'
      ReadOnly = True
      Required = True
    end
    object qVSDeptmc_id_1: TIntegerField
      FieldName = 'mc_id_1'
      ReadOnly = True
    end
    object qVSDeptdurum: TStringField
      FieldName = 'durum'
      ReadOnly = True
    end
    object qVSDeptidy_1: TIntegerField
      FieldName = 'idy_1'
      ReadOnly = True
    end
    object qVSDeptidt_1: TDateTimeField
      FieldName = 'idt_1'
      ReadOnly = True
    end
    object qVSDeptsdy_1: TIntegerField
      FieldName = 'sdy_1'
      ReadOnly = True
    end
    object qVSDeptsdt_1: TDateTimeField
      FieldName = 'sdt_1'
      ReadOnly = True
    end
    object qVSDeptkg_id: TIntegerField
      FieldName = 'kg_id'
      ReadOnly = True
    end
    object qVSDeptadi: TStringField
      FieldName = 'adi'
      ReadOnly = True
    end
    object qVSDeptsoyadi: TStringField
      FieldName = 'soyadi'
      ReadOnly = True
    end
    object qVSDeptkimlik_no: TStringField
      FieldName = 'kimlik_no'
      ReadOnly = True
    end
    object qVSDepttel1: TStringField
      FieldName = 'tel1'
      ReadOnly = True
    end
    object qVSDepttel2: TStringField
      FieldName = 'tel2'
      ReadOnly = True
    end
    object qVSDeptadres1: TStringField
      FieldName = 'adres1'
      ReadOnly = True
      Size = 50
    end
    object qVSDeptadres2: TStringField
      FieldName = 'adres2'
      ReadOnly = True
      Size = 50
    end
    object qVSDeptilce: TStringField
      FieldName = 'ilce'
      ReadOnly = True
    end
    object qVSDeptsehir: TStringField
      FieldName = 'sehir'
      ReadOnly = True
    end
    object qVSDeptemail: TStringField
      FieldName = 'email'
      ReadOnly = True
      Size = 50
    end
    object qVSDeptkep: TStringField
      FieldName = 'kep'
      ReadOnly = True
      Size = 50
    end
    object qVSDeptbasvuru_tarihi: TDateField
      FieldName = 'basvuru_tarihi'
      ReadOnly = True
    end
    object qVSDeptbasvuru_sekli: TStringField
      FieldName = 'basvuru_sekli'
      ReadOnly = True
    end
    object qVSDeptbasvuru_evrakno: TStringField
      FieldName = 'basvuru_evrakno'
      ReadOnly = True
    end
    object qVSDeptbasvuru_aciklama: TStringField
      FieldName = 'basvuru_aciklama'
      ReadOnly = True
      Size = 1000
    end
    object qVSDeptcevap_tarihi: TDateField
      FieldName = 'cevap_tarihi'
      ReadOnly = True
    end
    object qVSDeptcevap_sekli: TStringField
      FieldName = 'cevap_sekli'
      ReadOnly = True
    end
    object qVSDeptcevap_aciklama: TStringField
      FieldName = 'cevap_aciklama'
      ReadOnly = True
      Size = 1000
    end
    object qVSDeptcevap_evrakno: TStringField
      FieldName = 'cevap_evrakno'
      ReadOnly = True
    end
    object qVSDeptkg_detay: TStringField
      FieldName = 'kg_detay'
      ReadOnly = True
      Size = 300
    end
    object qVSDeptbasvuru_konu: TStringField
      FieldName = 'basvuru_konu'
      ReadOnly = True
      Size = 300
    end
    object qVSDeptbasvuru_dept_id: TIntegerField
      FieldName = 'basvuru_dept_id'
      ReadOnly = True
    end
    object qVSDeptcevap_sekli_talep: TStringField
      FieldName = 'cevap_sekli_talep'
      ReadOnly = True
    end
    object qVSDeptdept_name: TStringField
      FieldName = 'dept_name'
      ReadOnly = True
      Size = 30
    end
    object qVSDeptvsgrup: TStringField
      FieldName = 'vsgrup'
      ReadOnly = True
      Size = 100
    end
    object qVSDeptadisoyadi: TStringField
      FieldKind = fkCalculated
      FieldName = 'adisoyadi'
      Size = 40
      Calculated = True
    end
    object qVSDeptson_tarih: TDateField
      FieldKind = fkCalculated
      FieldName = 'son_tarih'
      Calculated = True
    end
    object qVSDeptkalan_sure: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'kalan_sure'
      Calculated = True
    end
  end
end
