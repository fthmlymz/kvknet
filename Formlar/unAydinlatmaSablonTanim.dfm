object frmAydinlatmaSablonTanim: TfrmAydinlatmaSablonTanim
  Left = 0
  Top = 0
  ClientHeight = 535
  ClientWidth = 1085
  Caption = 'Ayd'#305'nlatma Metni Bilgileri'
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object pnlData: TUniPanel
    Left = 0
    Top = 0
    Width = 520
    Height = 439
    Hint = ''
    Align = alClient
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    object UniLabel1: TUniLabel
      Left = 6
      Top = 15
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Durumu'
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
    end
    object UniLabel3: TUniLabel
      Left = 6
      Top = 99
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = #350'ablon Tan'#305'm'#305
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 3
    end
    object edTanim: TUniDBEdit
      Left = 96
      Top = 96
      Width = 401
      Height = 22
      Hint = ''
      DataField = 'tanim'
      DataSource = dsAydinlatma
      CharCase = ecUpperCase
      TabOrder = 9
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
    object UniLabel8: TUniLabel
      Left = 6
      Top = 125
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'A'#231#305'klama'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
    end
    object edDurum: TUniDBComboBox
      Left = 96
      Top = 12
      Width = 175
      Height = 28
      Hint = ''
      DataField = 'durum'
      DataSource = dsAydinlatma
      Style = csDropDownList
      Items.Strings = (
        'YAYINDA'
        #304'NCELEMEDE'
        'PAS'#304'F')
      TabOrder = 6
      IconItems = <>
    end
    object edDesc: TUniDBMemo
      Left = 96
      Top = 125
      Width = 401
      Height = 119
      Hint = ''
      DataField = 'description'
      DataSource = dsAydinlatma
      TabOrder = 10
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
    object UniLabel9: TUniLabel
      Left = 6
      Top = 71
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = #304'lgili Ki'#351'i'
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 5
    end
    object edKisi: TUniDBLookupComboBox
      Left = 96
      Top = 69
      Width = 401
      Hint = ''
      ListOnlyMode = lmFollowSource
      ListField = 'kisi'
      ListSource = dsKisi
      KeyField = 'kisi_id'
      ListFieldIndex = 0
      DataField = 'kisi_id'
      DataSource = dsAydinlatma
      TabOrder = 8
      Color = clWindow
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
      Style = csDropDown
      OnChange = edKisiChange
      OnChangeValue = edKisiChangeValue
    end
    object edAcikRiza: TUniDBCheckBox
      Left = 97
      Top = 46
      Width = 250
      Height = 17
      Hint = ''
      DataField = 'acik_riza'
      DataSource = dsAydinlatma
      ValueChecked = 'E'
      ValueUnchecked = 'H'
      Caption = 'A'#231#305'k R'#305'za Beyan'#305' Gerekli'
      ParentFont = False
      Font.Color = 13226752
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 7
      ParentColor = False
      Color = clBtnFace
      OnClick = edAcikRizaClick
    end
    object edWebLink: TUniEdit
      Left = 97
      Top = 284
      Width = 401
      Hint = ''
      Text = ''
      TabOrder = 12
      TabStop = False
      ReadOnly = True
    end
    object UniLabel2: TUniLabel
      Left = 6
      Top = 286
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Web Link Adresi'
      ParentFont = False
      Font.Color = clNavy
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
    end
    object btnGoToLink: TUniBitBtn
      Left = 184
      Top = 312
      Width = 77
      Height = 25
      Hint = ''
      Caption = 'Adrese Git'
      TabOrder = 14
      OnClick = btnGoToLinkClick
    end
    object btnPrepLink: TUniBitBtn
      Left = 96
      Top = 312
      Width = 82
      Height = 25
      Hint = ''
      Caption = 'Link Olu'#351'tur'
      TabOrder = 13
      OnClick = btnPrepLinkClick
    end
    object edIYSOnay: TUniDBCheckBox
      Left = 97
      Top = 255
      Width = 175
      Height = 17
      Hint = ''
      DataField = 'iys_var'
      DataSource = dsAydinlatma
      ValueChecked = 'E'
      ValueUnchecked = 'H'
      Caption = #304'YS Onay'#305' Gerekli'
      ParentFont = False
      Font.Color = 13226752
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 11
      ParentColor = False
      Color = clBtnFace
    end
    object btnQRCode: TUniBitBtn
      Left = 267
      Top = 312
      Width = 105
      Height = 25
      Hint = ''
      Caption = 'Karekodu '#304'ndir'
      TabOrder = 15
      OnClick = btnQRCodeClick
    end
    object imgQRCode: TUniImage
      Left = 378
      Top = 312
      Width = 120
      Height = 120
      Hint = ''
      Stretch = True
    end
    object btnAcikrizaSecenek: TUniBitBtn
      Left = 303
      Top = 42
      Width = 106
      Height = 25
      Hint = ''
      Caption = 'A'#231#305'k Riza Verileri'
      TabOrder = 17
      OnClick = btnAcikrizaSecenekClick
    end
  end
  object pnlButtons: TUniPanel
    Left = 0
    Top = 439
    Width = 1085
    Height = 96
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      1085
      96)
    object btnCancel: TUniBitBtn
      Left = 973
      Top = 54
      Width = 105
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
      Left = 862
      Top = 54
      Width = 105
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
      Width = 1083
      Height = 45
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
        Left = 255
        Top = 5
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
        Left = 255
        Top = 23
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
        Width = 150
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
        Width = 150
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
        Left = 354
        Top = 5
        Width = 150
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
        Left = 354
        Top = 23
        Width = 150
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
    object btnFHelp: TUniBitBtn
      Left = 751
      Top = 54
      Width = 105
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      Anchors = [akRight, akBottom]
      TabOrder = 4
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = btnFHelpClick
    end
  end
  object pnldetayveri: TUniPanel
    Left = 520
    Top = 0
    Width = 565
    Height = 439
    Hint = ''
    Align = alRight
    TabOrder = 2
    Caption = 'pnldetayveri'
    object UniDBMemo1: TUniDBMemo
      AlignWithMargins = True
      Left = 4
      Top = 23
      Width = 557
      Height = 120
      Hint = ''
      DataField = 'veritipi_str'
      DataSource = dsacikrizasecenek
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      Align = alTop
      TabOrder = 1
    end
    object UniDBMemo3: TUniDBMemo
      AlignWithMargins = True
      Left = 4
      Top = 313
      Width = 557
      Height = 120
      Hint = ''
      DataField = 'taraf_str'
      DataSource = dsacikrizasecenek
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      Align = alTop
      TabOrder = 2
    end
    object UniDBMemo2: TUniDBMemo
      AlignWithMargins = True
      Left = 4
      Top = 168
      Width = 557
      Height = 120
      Hint = ''
      DataField = 'amac_str'
      DataSource = dsacikrizasecenek
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      Align = alTop
      TabOrder = 3
    end
    object UniLabel10: TUniLabel
      AlignWithMargins = True
      Left = 4
      Top = 294
      Width = 179
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      Caption = 'A'#231#305'k R'#305'zaya Konu Payla'#351#305'lan Taraflar'
      Align = alTop
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
    end
    object UniLabel11: TUniLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 142
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      Caption = 'A'#231#305'k R'#305'zaya Konu Veri Tipleri'
      Align = alTop
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 5
    end
    object UniLabel12: TUniLabel
      AlignWithMargins = True
      Left = 4
      Top = 149
      Width = 129
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      Caption = 'A'#231#305'k R'#305'zaya Konu Ama'#231'lar'
      Align = alTop
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 6
    end
  end
  object dsAydinlatma: TUniDataSource
    DataSet = MainMod.qAydinlatma
    Left = 303
    Top = 165
  end
  object qKisi: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT DISTINCT env.kisi_id, ks.kisi'
      'FROM data_envanter env'
      'LEFT JOIN def_data_kisi ks ON ks.id = env.kisi_id'
      'ORDER BY 2')
    Left = 363
    Top = 60
  end
  object dsKisi: TUniDataSource
    DataSet = qKisi
    Left = 405
    Top = 60
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    Left = 363
    Top = 164
  end
  object qacikrizasecenek: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT '
      '    (WITH veritipi AS ('
      '        SELECT '
      
        '            RTRIM(k.kategori || '#39'('#39' || STRING_AGG(DISTINCT a.ver' +
        'i_tipi, '#39', '#39') || '#39')'#39', '#39','#39') AS veritipi_str'
      '        FROM def_data_veritipi a'
      '        JOIN def_data_kategori k ON a.md_id = k.id'
      
        '        JOIN data_acikriza_detay_secenek s ON a.id = ANY (string' +
        '_to_array(s.veritipi_ids, '#39','#39')::int[])'
      '        WHERE s.kisi_id = :kisi_id'
      '            AND s.mc_id = :mc_id'
      '        GROUP BY k.kategori'
      '    )'
      
        '    SELECT STRING_AGG(DISTINCT veritipi_str, E'#39'\n'#39') AS veritipi_' +
        'str FROM veritipi) AS veritipi_str,'
      ''
      '    (SELECT string_agg('#39'-'#39' || amac, E'#39',\n'#39')::VARCHAR AS amac_str'
      '    FROM def_data_amac a'
      
        '    JOIN data_acikriza_detay_secenek s ON a.id = ANY (string_to_' +
        'array(s.amac_ids, '#39','#39')::int[])'
      '    WHERE s.kisi_id =:kisi_id'
      '        AND s.mc_id =:mc_id) AS amac_str,'
      ''
      
        '    (SELECT string_agg('#39'-'#39' || a.taraf, E'#39',\n'#39')::VARCHAR AS taraf' +
        '_str'
      '    FROM def_data_taraf a'
      
        '    JOIN data_acikriza_detay_secenek s ON a.id = ANY (string_to_' +
        'array(s.taraf_ids, '#39','#39')::int[])'
      '    WHERE s.kisi_id =:kisi_id '
      '        AND s.mc_id =:mc_id) AS taraf_str')
    Left = 531
    Top = 60
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'kisi_id'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'mc_id'
        Value = nil
      end>
  end
  object dsacikrizasecenek: TUniDataSource
    DataSet = qacikrizasecenek
    Left = 573
    Top = 60
  end
end
