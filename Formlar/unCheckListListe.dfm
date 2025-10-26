object frCheckListListe: TfrCheckListListe
  Left = 0
  Top = 0
  Width = 1114
  Height = 333
  OnCreate = UniFrameCreate
  TabOrder = 0
  object v: TUniPanel
    Left = 0
    Top = 0
    Width = 1114
    Height = 145
    Hint = ''
    Align = alTop
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      1114
      145)
    object edSrcType: TUniComboBox
      Left = 96
      Top = 15
      Width = 113
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'VER'#304' KAYNA'#286'I'
      Items.Strings = (
        'REF. NO'
        'KONTROL'
        'VER'#304' KAYNA'#286'I'
        #304'LG'#304'L'#304' K'#304#350#304
        'TAR'#304'H'
        'OLU'#350'TURAN'
        'DE'#286#304#350'T'#304'REN')
      ItemIndex = 2
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
      CharCase = ecUpperCase
      IconItems = <>
      OnChange = edSrcTypeChange
    end
    object UniLabel1: TUniLabel
      Left = 12
      Top = 20
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
      Left = 1008
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
    object btnAdd: TUniBitBtn
      Left = 198
      Top = 91
      Width = 96
      Height = 36
      Action = actAdd
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 7
      Images = MainMod.PrjImgList
      ImageIndex = 18
    end
    object btnEdit: TUniBitBtn
      Left = 300
      Top = 91
      Width = 96
      Height = 36
      Action = actEdit
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 8
      Images = MainMod.PrjImgList
      ImageIndex = 2
    end
    object btnDelete: TUniBitBtn
      Left = 710
      Top = 49
      Width = 96
      Height = 36
      Visible = False
      Action = actCopy
      Caption = 'eski Kopyala'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 9
      Images = MainMod.PrjImgList
      ImageIndex = 8
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
      TabOrder = 10
    end
    object edSrcDate: TUniDateTimePicker
      Left = 96
      Top = 43
      Width = 161
      Hint = ''
      Visible = False
      DateTime = 44101.000000000000000000
      DateFormat = 'dd.MM.yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 11
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      ClientEvents.ExtEvents.Strings = (
        
          'keypress=function keypress(sender, e, eOpts)'#13#10'{'#13#10'   if (e.getKey' +
          '() == 13)'#13#10'   {'#13#10'      ajaxRequest(sender, '#39'doSearch'#39', ["aText="' +
          '+sender.getValue()]);'#13#10'   };'#13#10'}')
      OnAjaxEvent = edSrcDateAjaxEvent
    end
    object btnExcel: TUniBitBtn
      Left = 504
      Top = 91
      Width = 96
      Height = 36
      Action = actExcel
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 12
      ScreenMask.Enabled = True
      ScreenMask.Message = 'Dok'#252'man Haz'#305'rlan'#305'yor...'
      ScreenMask.Color = 16744448
      Images = MainMod.PrjImgList
      ImageIndex = 4
    end
    object UniBitBtn1: TUniBitBtn
      Left = 906
      Top = 91
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 13
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = UniBitBtn1Click
    end
    object edSrcActive: TUniComboBox
      Left = 215
      Top = 15
      Width = 96
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
    object edSrcKilitli: TUniComboBox
      Left = 317
      Top = 15
      Width = 128
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'T'#220'M'#220
      Items.Strings = (
        'K'#304'L'#304'TL'#304
        'K'#304'L'#304'TL'#304' DE'#286#304'L'
        'T'#220'M'#220)
      ItemIndex = 2
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 14
      IconItems = <>
      OnChange = edSrcActiveChange
    end
    object edSrcText: TUniEdit
      Left = 96
      Top = 46
      Width = 349
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
          'ender.setValue(val.toLocaleUpperCase("TR")); '#13#10'  sender.inputEl.' +
          'dom.setSelectionRange(pos, pos);'#13#10'}'
        
          'keypress=function keypress(sender, e, eOpts)'#13#10'{'#13#10'   if (e.getKey' +
          '() == 13)'#13#10'   {'#13#10'      ajaxRequest(sender, '#39'doSearch'#39', ["aText="' +
          '+sender.getValue()]);'#13#10'   };'#13#10'}')
      OnAjaxEvent = edSrcTextAjaxEvent
    end
    object btnLock: TUniMenuButton
      Left = 606
      Top = 91
      Width = 128
      Height = 36
      Hint = ''
      Visible = False
      DropdownMenu = ppmLock
      Caption = 'Kilitle'
      TabOrder = 15
      Images = MainMod.PrjImgList
      ImageIndex = 7
    end
    object chbDepYetki: TUniCheckBox
      Left = 581
      Top = 9
      Width = 30
      Height = 17
      Hint = ''
      Caption = ''
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 16
      FieldLabelWidth = 150
    end
    object UniBitBtn2: TUniBitBtn
      Left = 402
      Top = 91
      Width = 96
      Height = 36
      Hint = 'Se'#231'ili Kayd'#305'n Koyas'#305'n'#305' Olu'#351'tur'
      Caption = 'Kopyala'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 17
      Images = MainMod.PrjImgList
      ImageIndex = 8
      OnClick = UniBitBtn2Click
    end
    object chbBosDayanak: TUniCheckBox
      Left = 581
      Top = 31
      Width = 30
      Height = 17
      Hint = ''
      Caption = ''
      TabOrder = 18
      FieldLabelWidth = 150
    end
    object chbbosTedbir: TUniCheckBox
      Left = 581
      Top = 53
      Width = 30
      Height = 17
      Hint = ''
      Caption = ''
      TabOrder = 19
      FieldLabelWidth = 150
    end
    object UniLabel3: TUniLabel
      Left = 451
      Top = 11
      Width = 123
      Height = 13
      Hint = ''
      Caption = 'T'#252'm Departman Yetkileri'
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 20
    end
    object UniLabel4: TUniLabel
      Left = 451
      Top = 33
      Width = 106
      Height = 13
      Hint = ''
      Caption = 'Hukuki Dayanak Bo'#351
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 21
    end
    object UniLabel5: TUniLabel
      Left = 451
      Top = 55
      Width = 53
      Height = 13
      Hint = ''
      Caption = 'Tedbir Bo'#351
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 22
    end
  end
  object grdCheckList: TUniDBGrid
    Left = 0
    Top = 145
    Width = 1114
    Height = 188
    Hint = ''
    PagingBarAuxControl = pnlpagingBarcrt
    TitleFont.OverrideDefaults = [ovFontHeight]
    DataSource = dsCheckList
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgCheckSelect, dgConfirmDelete, dgMultiSelect, dgAutoRefreshRow]
    WebOptions.PageSize = 50
    LoadMask.Message = 'Veri y'#252'kleniyor...'
    EmptyText = 'Veri yok'
    Align = alClient
    Font.OverrideDefaults = [ovFontHeight]
    ParentFont = False
    TabOrder = 1
    OnColumnSort = grdCheckListColumnSort
    OnDrawColumnCell = grdCheckListDrawColumnCell
    Columns = <
      item
        FieldName = 'id'
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
        Title.Caption = 'Env. Kilitli'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 100
        Font.OverrideDefaults = [ovFontHeight]
        Alignment = taLeftJustify
        Sortable = True
        CheckBoxField.BooleanFieldOnly = False
        CheckBoxField.FieldValues = 'E;H'
        CheckBoxField.DisplayValues = 'EVET;HAYIR'
      end
      item
        FieldName = 'kontrol_str'
        Title.Alignment = taCenter
        Title.Caption = 'Kontrol'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 150
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
        DisplayMemo = True
      end
      item
        FieldName = 'kaynak_str'
        Title.Caption = 'Veri Kayna'#287#305
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 200
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'kisi_str'
        Title.Alignment = taCenter
        Title.Caption = #304'lgili Ki'#351'i'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 200
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'onem_derecesi_str'
        Title.Caption = #214'nem Derecesi'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 150
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
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
        FieldName = 'degistiren'
        Title.Alignment = taCenter
        Title.Caption = 'De'#287'i'#351'tiren'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 180
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end>
  end
  object pnlpagingBarcrt: TUniPanel
    AlignWithMargins = True
    Left = 120
    Top = 260
    Width = 700
    Height = 29
    Hint = ''
    TabOrder = 2
    BorderStyle = ubsNone
    ShowCaption = False
    Caption = ''
    object lbKayitSayisi: TUniLabel
      AlignWithMargins = True
      Left = 513
      Top = 7
      Width = 180
      Height = 19
      Hint = ''
      Margins.Top = 7
      Margins.Right = 7
      AutoSize = False
      Caption = 'lbKayitSayisi'
      Align = alRight
      TabOrder = 1
    end
    object UniPanel37: TUniPanel
      AlignWithMargins = True
      Left = 3
      Top = 5
      Width = 20
      Height = 19
      Hint = ''
      Margins.Top = 5
      Margins.Bottom = 5
      ShowHint = True
      ParentShowHint = False
      Align = alLeft
      ParentFont = False
      Font.Charset = TURKISH_CHARSET
      Font.Color = clBlack
      Font.Name = 'Verdana'
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
      Caption = ''
      Color = 14803455
    end
    object UniLabel6: TUniLabel
      AlignWithMargins = True
      Left = 29
      Top = 7
      Width = 120
      Height = 19
      Hint = ''
      Margins.Top = 7
      Margins.Right = 7
      AutoSize = False
      Caption = 'Envanter Formu Yok'
      Align = alLeft
      TabOrder = 3
    end
    object UniPanel1: TUniPanel
      AlignWithMargins = True
      Left = 159
      Top = 5
      Width = 20
      Height = 19
      Hint = ''
      Margins.Top = 5
      Margins.Bottom = 5
      ShowHint = True
      ParentShowHint = False
      Align = alLeft
      ParentFont = False
      Font.Charset = TURKISH_CHARSET
      Font.Color = clBlack
      Font.Name = 'Verdana'
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
      Caption = ''
      Color = clInfoBk
    end
    object UniLabel7: TUniLabel
      AlignWithMargins = True
      Left = 185
      Top = 7
      Width = 179
      Height = 19
      Hint = ''
      Margins.Top = 7
      Margins.Right = 7
      AutoSize = False
      Caption = 'Kontrol Formu Kilitli'
      Align = alLeft
      TabOrder = 5
    end
  end
  object ActList: TActionList
    Left = 339
    Top = 165
    object actAdd: TAction
      Caption = 'Yeni Kay'#305't'
      OnExecute = actAddExecute
    end
    object actEdit: TAction
      Caption = 'De'#287'i'#351'tir'
      OnExecute = actEditExecute
    end
    object actCopy: TAction
      Caption = 'Kopyala'
      Hint = 'Se'#231'ili Kayd'#305'n Koyas'#305'n'#305' Olu'#351'tur'
      OnExecute = actCopyExecute
    end
    object actExcel: TAction
      Caption = 'Excel'
      OnExecute = actExcelExecute
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
  object dsCheckList: TUniDataSource
    DataSet = qCheckList
    Left = 279
    Top = 165
  end
  object qCheckList: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      
        'SELECT chl.*, us1.full_name AS olusturan, us2.full_name AS degis' +
        'tiren,'
      '  kyn.kaynak AS kaynak_str, ks.kisi AS kisi_str,'
      
        '  knt.kontrolsonuc AS kontrol_str, onm.onemderece AS onem_derece' +
        'si_str'
      'FROM data_checklist chl'
      '  LEFT JOIN usr_user us1 ON us1.id = chl.idy'
      '  LEFT JOIN usr_user us2 ON us2.id = chl.sdy'
      '  LEFT JOIN def_data_kaynak kyn ON kyn.id = chl.kaynak_id'
      '  LEFT JOIN def_data_kisi ks ON ks.id = chl.kisi_id'
      '  LEFT JOIN def_data_kontrolsonuc knt ON knt.id = chl.kontrol_id'
      
        '  LEFT JOIN def_data_onemderece onm ON onm.id = chl.onem_dereces' +
        'i_id'
      'WHERE chl.mc_id = 2'
      'ORDER BY kyn.kaynak, ks.kisi')
    Left = 222
    Top = 165
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      
        'SELECT chl.*, us1.full_name AS olusturan, us2.full_name AS degis' +
        'tiren,'
      '  kyn.kaynak AS kaynak_str, ks.kisi AS kisi_str,'
      
        '  knt.kontrolsonuc AS kontrol_str, onm.onemderece AS onem_derece' +
        'si_str'
      'FROM data_checklist chl'
      '  LEFT JOIN usr_user us1 ON us1.id = chl.idy'
      '  LEFT JOIN usr_user us2 ON us2.id = chl.sdy'
      '  LEFT JOIN def_data_kaynak kyn ON kyn.id = chl.kaynak_id'
      '  LEFT JOIN def_data_kisi ks ON ks.id = chl.kisi_id'
      '  LEFT JOIN def_data_kontrolsonuc knt ON knt.id = chl.kontrol_id'
      
        '  LEFT JOIN def_data_onemderece onm ON onm.id = chl.onem_dereces' +
        'i_id'
      'WHERE chl.mc_id = 2'
      'ORDER BY kyn.kaynak, ks.kisi')
    Left = 454
    Top = 165
  end
  object ppmLock: TUniPopupMenu
    Images = MainMod.PrjImgList
    Left = 516
    Top = 168
    object ppmiLock: TUniMenuItem
      Caption = 'Se'#231'ili Olanlar -> Kilitle'
      ImageIndex = 8
      OnClick = ppmiLockClick
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object ppmiUnlock: TUniMenuItem
      Caption = 'Se'#231'ili Olanlar -> Kilit Kald'#305'r'
      OnClick = ppmiUnlockClick
    end
  end
end
