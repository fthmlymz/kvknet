object frRiskSurecMevcutDurum: TfrRiskSurecMevcutDurum
  Left = 0
  Top = 0
  Width = 1246
  Height = 487
  OnCreate = UniFrameCreate
  TabOrder = 0
  object pnlbaslik: TUniPanel
    Left = 0
    Top = 0
    Width = 1246
    Height = 120
    Hint = ''
    Align = alTop
    TabOrder = 0
    ShowCaption = False
    Caption = ''
    object pnledit: TUniPanel
      Left = 1
      Top = 1
      Width = 1244
      Height = 71
      Hint = ''
      Align = alTop
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
      BorderStyle = ubsNone
      ShowCaption = False
      Caption = ''
      Layout = 'fit'
      object UniLabel4: TUniLabel
        Left = 8
        Top = 19
        Width = 77
        Height = 13
        Hint = ''
        Caption = 'Aranacak Kriter'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
      end
      object cbSrcType: TUniComboBox
        Left = 90
        Top = 14
        Width = 161
        Hint = ''
        Text = ''
        Items.Strings = (
          'R'#304'SK'
          'METOT'
          'OLASILIK'
          'ETK'#304
          'FREKANS'
          'FAKRED'#304'LEB'#304'L'#304'RL'#304'K'
          '')
        TabOrder = 2
        EmptyText = 'Aranacak Kriter'
        ClearButton = True
        IconItems = <>
      end
      object cbdurum: TUniComboBox
        Left = 257
        Top = 14
        Width = 122
        Hint = ''
        Text = ''
        TabOrder = 3
        EmptyText = 'Durum'
        ClearButton = True
        IconItems = <>
        OnChange = cbdurumChange
      end
      object UniLabel6: TUniLabel
        Left = 8
        Top = 51
        Width = 76
        Height = 13
        Hint = ''
        Caption = 'Aranacak '#304'fade'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
      end
      object edSrcText: TUniEdit
        Left = 90
        Top = 46
        Width = 289
        Height = 23
        Hint = ''
        CharCaseConversion = uccTurkish
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 5
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase('#39'TR'#39')); '#13#10'  sender.inputEl.do' +
            'm.setSelectionRange(pos, pos);'#13#10'}'
          
            'keypress=function keypress(sender, e, eOpts)'#13#10'{'#13#10'   if (e.getKey' +
            '() == 13)'#13#10'   {'#13#10'      ajaxRequest(sender, '#39'doSearch'#39', ["aText="' +
            '+sender.getValue()]);'#13#10'   };'#13#10'}')
        ClearButton = True
        OnAjaxEvent = edSrcTextAjaxEvent
      end
      object cbseviye: TUniComboBox
        Left = 386
        Top = 14
        Width = 188
        Hint = ''
        Text = ''
        TabOrder = 6
        EmptyText = 'Risk Seviye'
        ClearButton = True
        IconItems = <>
        OnChange = cbseviyeChange
      end
      object cbSK: TUniComboBox
        Left = 580
        Top = 14
        Width = 188
        Hint = ''
        Text = ''
        Items.Strings = (
          'S'#220'RE'#199
          'KAYNAK')
        ItemIndex = 0
        TabOrder = 7
        EmptyText = 'S'#252're'#231' / Kaynak'
        IconItems = <>
        OnChange = cbSKChange
      end
    end
    object pnlbutton: TUniPanel
      Left = 1
      Top = 74
      Width = 1244
      Height = 45
      Hint = ''
      Align = alBottom
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
        Height = 39
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
      object btnGzdGListe: TUniBitBtn
        AlignWithMargins = True
        Left = 159
        Top = 3
        Width = 130
        Height = 39
        Hint = ''
        Margins.Left = 10
        Caption = 'G'#246'zden Ge'#231'irmeler'
        Align = alLeft
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
        Images = MainMod.PrjImgList
        ImageIndex = 10
        OnClick = btnGzdGListeClick
      end
      object btnGzdGecir: TUniBitBtn
        AlignWithMargins = True
        Left = 302
        Top = 3
        Width = 130
        Height = 39
        Hint = ''
        Margins.Left = 10
        Caption = 'G'#246'zden Ge'#231'ir'
        Align = alLeft
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
        Images = MainMod.PrjImgList
        ImageIndex = 10
        OnClick = btnGzdGecirClick
      end
    end
  end
  object pnlliste: TUniPanel
    Left = 0
    Top = 120
    Width = 1246
    Height = 334
    Hint = ''
    Align = alClient
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    ShowCaption = False
    Caption = ''
    object grd: TUniDBGrid
      Left = 1
      Top = 1
      Width = 1244
      Height = 332
      Hint = ''
      DataSource = dsdata
      ReadOnly = True
      LoadMask.Message = 'Loading data...'
      Align = alClient
      ParentFont = False
      TabOrder = 1
      OnColumnSort = grdColumnSort
      OnDrawColumnCell = grdDrawColumnCell
      Columns = <
        item
          FieldName = 'surec_kaynak'
          Title.Caption = 'S'#252're'#231
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 250
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
          Sortable = True
          DisplayMemo = True
        end
        item
          FieldName = 'risk'
          Title.Caption = 'Risk'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 250
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
          Sortable = True
          DisplayMemo = True
        end
        item
          FieldName = 'strdurum'
          Title.Caption = 'Risk Durumu'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 111
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
          Sortable = True
          DisplayMemo = True
        end
        item
          FieldName = 'strmetot'
          Title.Caption = 'Metot'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 64
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
          DisplayMemo = True
        end
        item
          FieldName = 'strkategori'
          Title.Caption = 'Risk Kategori'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 121
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
          Sortable = True
          DisplayMemo = True
        end
        item
          FieldName = 'strolasilik'
          Title.Caption = 'Risk Olas'#305'l'#305'k'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 123
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
          Sortable = True
          DisplayMemo = True
        end
        item
          FieldName = 'stretki'
          Title.Caption = 'Risk Etki'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 115
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
          Sortable = True
          DisplayMemo = True
        end
        item
          FieldName = 'strfrekans'
          Title.Caption = 'Frekans'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 64
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
          DisplayMemo = True
        end
        item
          FieldName = 'strfarkedilebilirlik'
          Title.Caption = 'Farkedilebilirlik'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 83
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
          DisplayMemo = True
        end
        item
          FieldName = 'strseviye'
          Title.Caption = 'Risk Seviyesi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 105
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
          Sortable = True
          DisplayMemo = True
        end
        item
          FieldName = 'tedbivar'
          Title.Caption = 'Tedbir'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 77
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
          Sortable = True
          DisplayMemo = True
        end
        item
          FieldName = 'tedbirdurum'
          Title.Caption = 'Tedbir Durumu'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 250
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
          Sortable = True
          DisplayMemo = True
        end
        item
          FieldName = 'gozden_gecirme_tar'
          Title.Caption = 'G'#246'z. De'#287'. Tarihi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 112
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
        end>
    end
  end
  object pnlcolors: TUniPanel
    Left = 0
    Top = 454
    Width = 1246
    Height = 33
    Hint = ''
    Margins.Bottom = 10
    Align = alBottom
    TabOrder = 2
    ShowCaption = False
    Caption = ''
    object UniPanel1: TUniPanel
      AlignWithMargins = True
      Left = 6
      Top = 8
      Width = 15
      Height = 17
      Hint = ''
      Margins.Left = 5
      Margins.Top = 7
      Margins.Right = 5
      Margins.Bottom = 7
      Align = alLeft
      TabOrder = 1
      ShowCaption = False
      Caption = ''
      Color = clGreen
    end
    object clrdusuk: TUniLabel
      AlignWithMargins = True
      Left = 29
      Top = 11
      Width = 61
      Height = 13
      Hint = ''
      Margins.Top = 10
      Margins.Right = 20
      Caption = 'D'#220#350#220'K R'#304'SK'
      Align = alLeft
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      ParentColor = False
      Color = clGreen
      TabOrder = 2
    end
    object UniLabel1: TUniLabel
      AlignWithMargins = True
      Left = 138
      Top = 11
      Width = 114
      Height = 13
      Hint = ''
      Margins.Top = 10
      Margins.Right = 20
      Caption = 'KABUL ED'#304'LEB'#304'L'#304'R R'#304'SK'
      Align = alLeft
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 3
    end
    object UniPanel2: TUniPanel
      AlignWithMargins = True
      Left = 115
      Top = 8
      Width = 15
      Height = 17
      Hint = ''
      Margins.Left = 5
      Margins.Top = 7
      Margins.Right = 5
      Margins.Bottom = 7
      Align = alLeft
      TabOrder = 4
      ShowCaption = False
      Caption = ''
      Color = clLime
    end
    object UniPanel3: TUniPanel
      AlignWithMargins = True
      Left = 277
      Top = 8
      Width = 15
      Height = 17
      Hint = ''
      Margins.Left = 5
      Margins.Top = 7
      Margins.Right = 5
      Margins.Bottom = 7
      Align = alLeft
      TabOrder = 5
      ShowCaption = False
      Caption = ''
      Color = clYellow
    end
    object UniLabel2: TUniLabel
      AlignWithMargins = True
      Left = 300
      Top = 11
      Width = 52
      Height = 13
      Hint = ''
      Margins.Top = 10
      Margins.Right = 20
      Caption = 'ORTA R'#304'SK'
      Align = alLeft
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 6
    end
    object UniPanel4: TUniPanel
      AlignWithMargins = True
      Left = 377
      Top = 8
      Width = 15
      Height = 17
      Hint = ''
      Margins.Left = 5
      Margins.Top = 7
      Margins.Right = 5
      Margins.Bottom = 7
      Align = alLeft
      TabOrder = 7
      ShowCaption = False
      Caption = ''
      Color = 4227327
    end
    object UniLabel5: TUniLabel
      AlignWithMargins = True
      Left = 400
      Top = 11
      Width = 62
      Height = 13
      Hint = ''
      Margins.Top = 10
      Margins.Right = 20
      Caption = 'Y'#220'KSEK R'#304'SK'
      Align = alLeft
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 8
    end
    object UniPanel5: TUniPanel
      AlignWithMargins = True
      Left = 487
      Top = 8
      Width = 15
      Height = 17
      Hint = ''
      Margins.Left = 5
      Margins.Top = 7
      Margins.Right = 5
      Margins.Bottom = 7
      Align = alLeft
      TabOrder = 9
      ShowCaption = False
      Caption = ''
      Color = clRed
    end
    object UniLabel7: TUniLabel
      AlignWithMargins = True
      Left = 510
      Top = 11
      Width = 55
      Height = 13
      Hint = ''
      Margins.Top = 10
      Margins.Right = 20
      Caption = 'KR'#304'T'#304'K R'#304'SK'
      Align = alLeft
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 10
    end
  end
  object qdata: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT *'
      '  FROM (SELECT r.gozden_gecirme_tar,'
      '               r.id risk_id,'
      '               r.mc_id,'
      '               s.surec surec_kaynak, r.risk,'
      '               r.aciklama,'
      '               r.durum,'
      '               r.kategori,'
      '               r.olasilik,'
      '               r.etki,'
      '               r.seviye,'
      '               r.metot,'
      '               (CASE'
      '                 WHEN r.metot = 1 THEN'
      '                  '#39'L T'#304'P'#304' MATR'#304'S'#39
      '                 WHEN r.metot = 2 THEN'
      '                  '#39'FMEA'#39
      '                 WHEN r.metot = 3 THEN'
      '                  '#39'FINE-KINNEY'#39
      '                 ELSE'
      '                  '#39#39
      '               END) strmetot,'
      '               (CASE'
      '                 WHEN r.kategori = 1 THEN'
      '                  '#39'OPERASYONEL'#39
      '                 WHEN r.kategori = 2 THEN'
      '                  '#39'B'#304'LG'#304' G'#220'VENL'#304#286#304#39
      '                 WHEN r.kategori = 3 THEN'
      '                  '#39'YASAL'#39
      '                 ELSE'
      '                  '#39#39
      '               END) strkategori,'
      '               (CASE'
      '                 WHEN r.durum = 1 THEN'
      '                  '#39'A'#199'IK'#39
      '                 WHEN r.durum = 2 THEN'
      '                  '#39'KAPALI'#39
      '                 WHEN r.durum = 3 THEN'
      '                  '#39'DEVAM ED'#304'YOR'#39
      '                 ELSE'
      '                  '#39#39
      '               END) strdurum,'
      '               case'
      '                 when r.metot = 1 then'
      '                  (CASE'
      '                    WHEN r.olasilik = 1 THEN'
      '                     '#39#199'OK D'#220#350#220'K OLASILIK'#39
      '                    WHEN r.olasilik = 2 THEN'
      '                     '#39'D'#220#350#220'K OLASILIK'#39
      '                    WHEN r.olasilik = 3 THEN'
      '                     '#39'ORTA OLASILIK'#39
      '                    WHEN r.olasilik = 4 THEN'
      '                     '#39'Y'#220'KSEK OLASILIK'#39
      '                    WHEN r.olasilik = 5 THEN'
      '                     '#39#199'OK Y'#220'KSEK OLASILIK'#39
      '                    ELSE'
      '                     '#39#39
      '                  END)'
      '                 when r.metot = 2 then'
      '                  (CASE'
      '                    WHEN r.olasilik = 1 THEN'
      '                     '#39#199'OK D'#220#350#220'K OLASILIK'#39
      '                    WHEN r.olasilik = 2 THEN'
      '                     '#39'D'#220#350#220'K OLASILIK'#39
      '                    WHEN r.olasilik = 3 THEN'
      '                     '#39'ORTA OLASILIK'#39
      '                    WHEN r.olasilik = 4 THEN'
      '                     '#39'Y'#220'KSEK OLASILIK'#39
      '                    WHEN r.olasilik = 5 THEN'
      '                     '#39#199'OK Y'#220'KSEK OLASILIK'#39
      '                    ELSE'
      '                     '#39#39
      '                  END)'
      '                 when r.metot = 3 then'
      '                  (CASE'
      '                    WHEN r.olasilik = 1 THEN'
      '                     '#39'0.2 - BEKLENMEZ'#39
      '                    WHEN r.olasilik = 2 THEN'
      '                     '#39'0.5 - BEKLENMEZ FAKAT M'#220'MK'#220'N'#39
      '                    WHEN r.olasilik = 3 THEN'
      '                     '#39'1 - M'#220'MK'#220'N FAKAT D'#220#350#220'K'#39
      '                    WHEN r.olasilik = 4 THEN'
      '                     '#39'3 - OLASI'#39
      '                    WHEN r.olasilik = 5 THEN'
      '                     '#39'6 - Y'#220'KSEK'#39
      '                    WHEN r.olasilik = 6 THEN'
      '                     '#39'10 - KES'#304'N'#39
      '                    ELSE'
      '                     '#39#39
      '                  END)'
      '               end strolasilik,'
      '               case'
      '                 when r.metot = 1 then'
      '                  (CASE'
      '                    WHEN r.etki = 1 THEN'
      '                     '#39#199'OK D'#220#350#220'K OLASILIK'#39
      '                    WHEN r.etki = 2 THEN'
      '                     '#39'D'#220#350#220'K OLASILIK'#39
      '                    WHEN r.etki = 3 THEN'
      '                     '#39'ORTA OLASILIK'#39
      '                    WHEN r.etki = 4 THEN'
      '                     '#39'Y'#220'KSEK OLASILIK'#39
      '                    WHEN r.etki = 5 THEN'
      '                     '#39#199'OK Y'#220'KSEK OLASILIK'#39
      '                    ELSE'
      '                     '#39#39
      '                  END)'
      '                 when r.metot = 2 then'
      '                  (CASE'
      '                    WHEN r.etki = 1 THEN'
      '                     '#39#199'OK D'#220#350#220'K OLASILIK'#39
      '                    WHEN r.etki = 2 THEN'
      '                     '#39'D'#220#350#220'K OLASILIK'#39
      '                    WHEN r.etki = 3 THEN'
      '                     '#39'ORTA OLASILIK'#39
      '                    WHEN r.etki = 4 THEN'
      '                     '#39'Y'#220'KSEK OLASILIK'#39
      '                    WHEN r.etki = 5 THEN'
      '                     '#39#199'OK Y'#220'KSEK OLASILIK'#39
      '                    ELSE'
      '                     '#39#39
      '                  END)'
      '                 when r.metot = 3 then'
      '                  (CASE'
      '                    WHEN r.etki = 1 THEN'
      '                     '#39'0.2 - BEKLENMEZ'#39
      '                    WHEN r.etki = 2 THEN'
      '                     '#39'0.5 - BEKLENMEZ FAKAT M'#220'MK'#220'N'#39
      '                    WHEN r.etki = 3 THEN'
      '                     '#39'1 - M'#220'MK'#220'N FAKAT D'#220#350#220'K'#39
      '                    WHEN r.etki = 4 THEN'
      '                     '#39'3 - OLASI'#39
      '                    WHEN r.etki = 5 THEN'
      '                     '#39'6 - Y'#220'KSEK'#39
      '                    WHEN r.etki = 6 THEN'
      '                     '#39'10 - KES'#304'N'#39
      '                    ELSE'
      '                     '#39#39
      '                  END)'
      '               end stretki,'
      '               (CASE'
      '                 WHEN r.frekans = 1 THEN'
      
        '                  '#39'0.5 - '#199'OK SEYREK (YILDA B'#304'R VEYA DAHA SEYREK)' +
        #39
      '                 WHEN r.frekans = 2 THEN'
      '                  '#39'1 - SEYREK (YILDA B'#304'RKA'#199' DEFA)'#39
      '                 WHEN r.frekans = 3 THEN'
      '                  '#39'2 - SIK DE'#286#304'L (AYDA B'#304'R VEYA B'#304'RKA'#199' DEFA)'#39
      '                 WHEN r.frekans = 4 THEN'
      '                  '#39'3 - ARA SIRA (HAFTADA B'#304'R VEYA B'#304'RKA'#199' DEFA)'#39
      '                 WHEN r.frekans = 5 THEN'
      '                  '#39'6 - SIK (G'#220'NDE B'#304'R VEYA B'#304'RKA'#199' DEFA)'#39
      '                 WHEN r.frekans = 6 THEN'
      '                  '#39'10 - HEMEN S'#220'REKL'#304' TEKRAR'#39
      '                 ELSE'
      '                  '#39#39
      '               END) strfrekans,'
      '               (CASE'
      '                 WHEN r.farkedilebilirlik = 1 THEN'
      
        '                  '#39'0.5 - '#199'OK SEYREK (YILDA B'#304'R VEYA DAHA SEYREK)' +
        #39
      '                 WHEN r.farkedilebilirlik = 2 THEN'
      '                  '#39'1 - SEYREK (YILDA B'#304'RKA'#199' DEFA)'#39
      '                 WHEN r.farkedilebilirlik = 3 THEN'
      '                  '#39'2 - SIK DE'#286#304'L (AYDA B'#304'R VEYA B'#304'RKA'#199' DEFA)'#39
      '                 WHEN r.farkedilebilirlik = 4 THEN'
      '                  '#39'3 - ARA SIRA (HAFTADA B'#304'R VEYA B'#304'RKA'#199' DEFA)'#39
      '                 WHEN r.farkedilebilirlik = 5 THEN'
      '                  '#39'6 - SIK (G'#220'NDE B'#304'R VEYA B'#304'RKA'#199' DEFA)'#39
      '                 WHEN r.farkedilebilirlik = 6 THEN'
      '                  '#39'10 - HEMEN S'#220'REKL'#304' TEKRAR'#39
      '                 ELSE'
      '                  '#39#39
      '               END) strfarkedilebilirlik,'
      '               case'
      '                 when r.metot = 1 then'
      '                  (case'
      '                    when r.seviye < 5 then'
      '                     '#39'D'#220#350#220'K R'#304'SK'#39
      '                    when r.seviye >= 5 and r.seviye <= 10 then'
      '                     '#39'KABUL ED'#304'LEB'#304'L'#304'R R'#304'SK'#39
      '                    when r.seviye >= 11 and r.seviye <= 15 then'
      '                     '#39'ORTA R'#304'SK'#39
      '                    when r.seviye >= 16 and r.seviye <= 20 then'
      '                     '#39'Y'#220'KSEK R'#304'SK'#39
      '                    when r.seviye > 21 then'
      '                     '#39'KR'#304'T'#304'K R'#304'SK'#39
      '                  end)'
      '                 when r.metot = 2 then'
      '                  (case'
      '                    when r.seviye < 25 THEN'
      '                     '#39'D'#220#350#220'K R'#304'SK'#39
      '                    when r.seviye >= 25 and r.seviye <= 50 THEN'
      '                     '#39'KABUL ED'#304'LEB'#304'L'#304'R R'#304'SK'#39
      '                    when r.seviye >= 50 and r.seviye <= 75 THEN'
      '                     '#39'ORTA R'#304'SK'#39
      '                    when r.seviye >= 75 and r.seviye <= 100 THEN'
      '                     '#39'Y'#220'KSEK R'#304'SK'#39
      '                    when r.seviye > 100 THEN'
      '                     '#39'KR'#304'T'#304'K R'#304'SK'#39
      '                  end)'
      '                 when r.metot = 3 then'
      '                  (case'
      '                    when r.seviye < 200 THEN'
      '                     '#39'D'#220#350#220'K R'#304'SK'#39
      
        '                    when r.seviye >= 200 and r.seviye <= 400 THE' +
        'N'
      '                     '#39'KABUL ED'#304'LEB'#304'L'#304'R R'#304'SK'#39
      
        '                    when r.seviye >= 400 and r.seviye <= 600 THE' +
        'N'
      '                     '#39'ORTA R'#304'SK'#39
      
        '                    when r.seviye >= 600 and r.seviye <= 800 THE' +
        'N'
      '                     '#39'Y'#220'KSEK R'#304'SK'#39
      '                    when r.seviye > 800 THEN'
      '                     '#39'KR'#304'T'#304'K R'#304'SK'#39
      '                  end)'
      '               end strseviye,'
      '               case'
      '                 when r.risk <> '#39#39' then'
      '                  case'
      
        '                    when COALESCE(at.durum, kt.durum, it.durum, ' +
        '0) > 0 then'
      '                     '#39'VAR'#39
      '                    else'
      '                     '#39'YOK'#39
      '                  END'
      '               end tedbivar,'
      '               case'
      '                 when r.risk <> '#39#39' then'
      '                  case'
      
        '                    when COALESCE(at.durum, it.durum, 0) > 0 the' +
        'n'
      '                     '#39'DEVAM ED'#304'YOR'#39
      '                    else'
      '                     '#39'TAMAMLANDI'#39
      '                  END'
      '               end tedbirdurum'
      '          from def_data_surec s'
      '          left join def_data_risk_surec_eslesme rs'
      '            ON rs.surec_id = s.id'
      '           and rs.mc_id = s.mc_id'
      '          left join def_data_risk r'
      '            on r.id = rs.risk_id'
      '           and r.mc_id = s.mc_id'
      '          left join def_data_risk_tedbir at'
      '            on at.risk_id = rs.risk_id'
      '           and at.mc_id = s.mc_id'
      '           and at.durum = 1'
      '          left join def_data_risk_tedbir kt'
      '            on kt.risk_id = rs.risk_id'
      '           and kt.mc_id = s.mc_id'
      '           and kt.durum = 2'
      '          left join def_data_risk_tedbir it'
      '            on it.risk_id = rs.risk_id'
      '           and it.mc_id = s.mc_id'
      '           and it.durum = 3'
      '          left join sys_modul_parameter mp'
      '            on mp.module = '#39'R'#304'SK ANAL'#304'Z'#304#39
      '           AND MP.main_parameter = '#39'R'#304'SK KATEGOR'#304#39
      '           AND mp.subid = r.kategori) tl'
      ' where mc_id = 0')
    Left = 296
    Top = 216
  end
  object dsdata: TUniDataSource
    DataSet = qdata
    Left = 344
    Top = 216
  end
end
