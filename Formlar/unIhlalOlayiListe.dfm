object frmIhlalOlayiListe: TfrmIhlalOlayiListe
  Left = 0
  Top = 0
  Width = 1064
  Height = 480
  OnCreate = UniFrameCreate
  TabOrder = 0
  object UniDBGrid1: TUniDBGrid
    AlignWithMargins = True
    Left = 5
    Top = 86
    Width = 1049
    Height = 391
    Hint = ''
    Margins.Left = 5
    Margins.Right = 10
    ClientEvents.ExtEvents.Strings = (
      
        'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10'   sender.vi' +
        'ew.rowExpander.collapseRow = function(rowIdx) {'#13#10'        var row' +
        'Node = this.view.getNode(rowIdx),'#13#10'            row = Ext.get(row' +
        'Node),'#13#10'            nextBd = Ext.get(row).down(this.rowBodyTrSel' +
        'ector),'#13#10'            record = this.view.getRecord(rowNode),'#13#10'   ' +
        '         grid = this.getCmp();'#13#10'        if (!row.hasCls(this.row' +
        'CollapsedCls)) {'#13#10'            row.addCls(this.rowCollapsedCls);'#13 +
        #10'            nextBd.addCls(this.rowBodyHiddenCls);'#13#10'            ' +
        'this.recordsExpanded[record.internalId] = false;'#13#10'            th' +
        'is.view.fireEvent('#39'collapsebody'#39', rowNode, record, nextBd.dom);'#13 +
        #10'        }'#13#10'    };'#13#10'}')
    DataSource = dsdata
    ReadOnly = True
    LoadMask.Message = 'Veriler y'#252'kleniyor..'
    ForceFit = True
    Align = alClient
    TabOrder = 0
    RowWidget.AlignmentControl = uniAlignmentClient
    RowWidget.Layout = 'fit'
    RowWidget.Enabled = True
    OnRowExpand = UniDBGrid1RowExpand
    OnRowCollapse = UniDBGrid1RowCollapse
    Columns = <
      item
        Flex = 4
        FieldName = 'ihlal_icerigi'
        Title.Caption = #304'hlal '#304#231'eri'#287'i'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 6004
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
      end
      item
        Flex = 3
        FieldName = 'ihlal_kaynagi'
        Title.Caption = #304'hlalin Kayna'#287#305
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 72
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        DisplayMemo = True
      end
      item
        Flex = 3
        FieldName = 'ihlal_etki_aciklama'
        Title.Caption = #304'hal Etkisi'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 102
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        DisplayMemo = True
      end
      item
        Flex = 2
        FieldName = 'baslangic_tarihi'
        Title.Caption = 'ihal Ba'#351'lama Tarihi'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 112
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
      end
      item
        Flex = 2
        FieldName = 'bitis_tarihi'
        Title.Caption = #304'hlal Biti'#351' Tarihi'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 112
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
      end
      item
        Flex = 2
        FieldName = 'tespit_tarihi'
        Title.Caption = #304'hlal Tespit Tarihi'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 112
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
      end
      item
        Flex = 2
        FieldName = 'veri_isleyen'
        Title.Caption = 'Veri '#304#351'leyen'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 1534
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
      end
      item
        Flex = 1
        FieldName = 'etkilenen_kisi_sayisi'
        Title.Caption = 'Ki'#351'i Say'#305's'#305
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 107
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        GroupHeader = 'Etkilenen'
      end
      item
        Flex = 1
        FieldName = 'etkilenen_kayit_sayisi'
        Title.Caption = 'Kay'#305't Say'#305's'#305
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 115
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        GroupHeader = 'Etkilenen'
      end>
  end
  object pnlbaslik: TUniPanel
    Left = 0
    Top = 0
    Width = 1064
    Height = 83
    Hint = ''
    Align = alTop
    TabOrder = 1
    ShowCaption = False
    Caption = ''
    object pnledit: TUniPanel
      Left = 1
      Top = 1
      Width = 1062
      Height = 71
      Hint = ''
      Align = alTop
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
      BorderStyle = ubsNone
      ShowCaption = False
      Caption = ''
      object UniPanel1: TUniPanel
        Left = 0
        Top = 0
        Width = 486
        Height = 71
        Hint = ''
        Align = alLeft
        TabOrder = 1
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        object cbSrcType: TUniComboBox
          Left = 104
          Top = 14
          Width = 270
          Hint = ''
          Text = ''
          Items.Strings = (
            #304'HLAL '#304#199'ER'#304#286#304
            'BA'#350'LAMA TAR'#304'H'#304
            'B'#304'T'#304#350' TAR'#304'H'#304
            'TESP'#304'T TAR'#304'H'#304
            'ETK'#304'LENEN S'#220'RE'#199
            'ETK'#304'LENEN K'#304#350#304' GRUBU'
            'ETK'#304'LENEN KAYNAK'
            '')
          TabOrder = 1
          EmptyText = 'Aranacak Kriter'
          ClearButton = True
          IconItems = <>
          OnChange = cbSrcTypeChange
        end
        object eddate: TUniDateTimePicker
          Left = 250
          Top = 48
          Width = 209
          Hint = ''
          Visible = False
          DateTime = 45666.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 2
        end
        object edSrcText: TUniEdit
          Left = 104
          Top = 45
          Width = 289
          Height = 23
          Hint = ''
          CharCaseConversion = uccTurkish
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 3
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase('#39'tr'#39')); '#13#10'  sender.inputEl.' +
              'dom.setSelectionRange(pos, pos);'#13#10'}'
            
              'keypress=function keypress(sender, e, eOpts)'#13#10'{'#13#10'   if (e.getKey' +
              '() == 13)'#13#10'   {'#13#10'      ajaxRequest(sender, '#39'doSearch'#39', ["aText="' +
              '+sender.getValue()]);'#13#10'   };'#13#10'}')
          ClearButton = True
          OnAjaxEvent = edSrcTextAjaxEvent
        end
        object UniLabel4: TUniLabel
          Left = 22
          Top = 19
          Width = 77
          Height = 13
          Hint = ''
          Caption = 'Aranacak Kriter'
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 4
        end
        object UniLabel6: TUniLabel
          Left = 22
          Top = 49
          Width = 76
          Height = 13
          Hint = ''
          Caption = 'Aranacak '#304'fade'
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 5
        end
      end
      object pnlbutton: TUniPanel
        AlignWithMargins = True
        Left = 489
        Top = 12
        Width = 570
        Height = 47
        Hint = ''
        Margins.Top = 12
        Margins.Bottom = 12
        Align = alClient
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        object btnSearch: TUniBitBtn
          AlignWithMargins = True
          Left = 50
          Top = 3
          Width = 96
          Height = 41
          Hint = ''
          Margins.Left = 50
          Caption = 'Liste'
          Align = alLeft
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
          Images = MainMod.PrjImgList
          ImageIndex = 10
          OnClick = btnSearchClick
        end
        object btnAdd: TUniBitBtn
          AlignWithMargins = True
          Left = 152
          Top = 3
          Width = 120
          Height = 41
          Hint = ''
          Caption = 'Yeni Kay'#305't'
          Align = alLeft
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 2
          Images = MainMod.PrjImgList
          ImageIndex = 18
          OnClick = btnAddClick
        end
        object btnEdit: TUniBitBtn
          AlignWithMargins = True
          Left = 278
          Top = 3
          Width = 96
          Height = 41
          Hint = ''
          Caption = 'De'#287'i'#351'tir'
          Align = alLeft
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 3
          Images = MainMod.PrjImgList
          ImageIndex = 2
          OnClick = btnEditClick
        end
      end
    end
  end
  object qdata: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id,'
      '       mc_id,'
      '       baslangic_tarihi,'
      '       bitis_tarihi,'
      '       tespit_tarihi,'
      '       veri_isleyen,'
      '       veri_isleyen_adresi,'
      '       ihlal_kaynagi_genel,'
      '       ihlal_kaynagi_siber_saldiri,'
      '       ihlal_etkisi,'
      '       ihlal_tespiti,'
      '       etkilenen_kisi_sayisi,'
      '       etkilenen_kayit_sayisi,'
      '       ihlal_icerigi,'
      '       '#39#304'HLAL KAYNA'#286'I : '#39'||string_agg(case'
      '                    when trim(val_genel) = '#39'1'#39' THEN'
      '                     '#39'BELGE/C'#304'HAZ HIRSIZLI'#286'I VEYA KAYBOLMASI'#39
      '                    when trim(val_genel) = '#39'2'#39' THEN'
      '                     '#39'VER'#304'LER'#304'N G'#220'VENS'#304'Z ORTAMDA DEPOLANMASI'#39
      '                    when trim(val_genel) = '#39'3'#39' THEN'
      '                     '#39'SABOTAJ'#39
      '                    when trim(val_genel) = '#39'4'#39' THEN'
      '                     '#39'KAZA/'#304'HMAL'#39
      '                    when trim(val_genel) = '#39'5'#39' THEN'
      '                     '#39'D'#304#286'ER'#39
      '                  end,'
      '                  '#39','#39' || E'#39'\n'#39') ||E'#39'\n'#39'||'
      '       '#39'S'#304'BER SALDIRI : '#39'||string_agg(case'
      '                    when trim(val_siber) = '#39'1'#39' THEN'
      '                     '#39'ZARARLI YAZILIMLAR'#39
      '                    when trim(val_siber) = '#39'2'#39' THEN'
      '                     '#39'SOSYAL M'#220'HEND'#304'SL'#304'K'#39
      '                    when trim(val_siber) = '#39'3'#39' THEN'
      '                     '#39'H'#304'ZMET DI'#350'I BIRAKMA (DOS-DDOS)'#39
      '                    when trim(val_siber) = '#39'4'#39' THEN'
      '                     '#39'F'#304'DYE YAZILIMI (RANSOMWARE)'#39
      '                    when trim(val_siber) = '#39'5'#39' THEN'
      '                     '#39'PAROLA SALDIRISI (BRUTE-FORCE ATTACK)'#39
      '                  end,'
      '                  '#39','#39' || E'#39'\n'#39') as ihlal_kaynagi,'
      '       string_agg(case'
      '                    when trim(val_etki) = '#39'1'#39' THEN'
      '                     '#39'VER'#304' G'#304'ZL'#304'L'#304#286#304#39
      '                    when trim(val_etki) = '#39'2'#39' THEN'
      '                     '#39'VER'#304' B'#220'T'#220'NL'#220#286#220#39
      '                    when trim(val_etki) = '#39'3'#39' THEN'
      '                     '#39'VER'#304'YE ER'#304#350#304'M/ULA'#350'ILAB'#304'L'#304'RL'#304'K'#39
      '                  END,'
      '                  '#39','#39' || E'#39'\n'#39') AS ihlal_etki_aciklama'
      '  FROM (SELECT *,'
      
        '               unnest(string_to_array(ihlal_kaynagi_genel, '#39','#39'))' +
        ' AS val_genel,'
      
        '               unnest(string_to_array(ihlal_kaynagi_siber_saldir' +
        'i, '#39','#39')) AS val_siber,'
      
        '               unnest(string_to_array(ihlal_etkisi, '#39','#39')) as val' +
        '_etki'
      '          FROM def_data_ihlal'
      '          where mc_id = 4) AS subquery'
      ' GROUP BY id,'
      '          mc_id,'
      '          baslangic_tarihi,'
      '          bitis_tarihi,'
      '          tespit_tarihi,'
      '          veri_isleyen,'
      '          veri_isleyen_adresi,'
      '          ihlal_kaynagi_genel,'
      '          ihlal_kaynagi_siber_saldiri,'
      '          ihlal_etkisi,'
      '          ihlal_tespiti,'
      '          etkilenen_kisi_sayisi,'
      '          etkilenen_kayit_sayisi,'
      '          ihlal_icerigi;')
    CachedUpdates = True
    Left = 296
    Top = 216
  end
  object dsdata: TUniDataSource
    DataSet = qdata
    Left = 344
    Top = 216
  end
end
