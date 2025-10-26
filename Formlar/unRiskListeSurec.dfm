object frRiskLiseSurec: TfrRiskLiseSurec
  Left = 0
  Top = 0
  Width = 1106
  Height = 480
  OnCreate = UniFrameCreate
  TabOrder = 0
  object pnlbaslik: TUniPanel
    Left = 0
    Top = 0
    Width = 1106
    Height = 120
    Hint = ''
    Align = alTop
    TabOrder = 0
    ShowCaption = False
    Caption = ''
    object pnledit: TUniPanel
      Left = 1
      Top = 1
      Width = 1104
      Height = 71
      Hint = ''
      Align = alTop
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
      BorderStyle = ubsNone
      ShowCaption = False
      Caption = ''
      object cbseviye: TUniComboBox
        Left = 477
        Top = 14
        Width = 188
        Hint = ''
        Text = ''
        TabOrder = 1
        EmptyText = 'Seviye'
        ClearButton = True
        IconItems = <>
        OnChange = cbseviyeChange
      end
      object cbdurum: TUniComboBox
        Left = 271
        Top = 14
        Width = 122
        Hint = ''
        Text = ''
        TabOrder = 2
        EmptyText = 'Durum'
        ClearButton = True
        IconItems = <>
        OnChange = cbdurumChange
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
        TabOrder = 3
      end
      object edSrcText: TUniEdit
        Left = 104
        Top = 44
        Width = 289
        Height = 23
        Hint = ''
        CharCaseConversion = uccTurkish
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
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
      object UniLabel3: TUniLabel
        Left = 412
        Top = 19
        Width = 55
        Height = 13
        Hint = ''
        Caption = 'Risk Seviye'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 5
      end
      object cbSrcType: TUniComboBox
        Left = 104
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
          'FAKRED'#304'LEB'#304'L'#304'RL'#304'K')
        TabOrder = 6
        EmptyText = 'Aranacak Kriter'
        ClearButton = True
        IconItems = <>
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
        TabOrder = 7
      end
    end
    object pnlbutton: TUniPanel
      Left = 1
      Top = 74
      Width = 1104
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
      object btnAdd: TUniBitBtn
        AlignWithMargins = True
        Left = 152
        Top = 3
        Width = 120
        Height = 39
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
        Height = 39
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
  object pnlliste: TUniPanel
    Left = 0
    Top = 120
    Width = 1106
    Height = 360
    Hint = ''
    Align = alClient
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    ShowCaption = False
    Caption = ''
    object UniDBGrid1: TUniDBGrid
      Left = 1
      Top = 1
      Width = 1104
      Height = 358
      Hint = ''
      DataSource = dsdata
      ReadOnly = True
      LoadMask.Message = 'Veriler y'#252'kleniyor..'
      ForceFit = True
      Align = alClient
      TabOrder = 1
      Columns = <
        item
          FieldName = 'id'
          Title.Caption = 'Ref.No.'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'sdurum'
          Title.Caption = 'Durum'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
          DisplayMemo = True
        end
        item
          FieldName = 'risk'
          Title.Caption = 'Risk'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 300
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'aciklama'
          Title.Caption = 'A'#231#305'klama'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 300
          Visible = False
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'skategori'
          Title.Caption = 'Risk Kategorisi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 300
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
          DisplayMemo = True
        end
        item
          FieldName = 'seviye'
          Title.Caption = 'Risk Seviyesi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 80
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'sseviye'
          Title.Caption = 'Seviye'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'solasilik'
          Title.Caption = 'Risk olas'#305'l'#305#287#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 300
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
          DisplayMemo = True
        end
        item
          FieldName = 'setki'
          Title.Caption = 'Riskin Etkisi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 300
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
          DisplayMemo = True
        end
        item
          FieldName = 'sfrekans'
          Title.Caption = 'Frekans'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'sfarkedilebilirlik'
          Title.Caption = 'Farkedilebilirlik'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end>
    end
  end
  object qdata: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT *,'
      '       (CASE'
      '         WHEN r.kategori = 1 THEN'
      '          '#39'OPERASYONEL'#39
      '         WHEN r.kategori = 2 THEN'
      '          '#39'B'#304'LG'#304' G'#220'VENL'#304#286#304#39
      '         WHEN r.kategori = 3 THEN'
      '          '#39'YASAL'#39
      '         ELSE'
      '          '#39#39
      '       END) skategori,'
      '       (CASE'
      '         WHEN r.durum = 1 THEN'
      '          '#39'A'#199'IK'#39
      '         WHEN r.durum = 2 THEN'
      '          '#39'KAPALI'#39
      '         WHEN r.durum = 3 THEN'
      '          '#39'DEVAN ED'#304'YOR'#39
      '         ELSE'
      '          '#39#39
      '       END) sdurum,'
      '       (CASE'
      '         WHEN r.metot = 1 THEN'
      '          '#39'L Tipi Matris'#39
      '         WHEN r.metot = 2 THEN'
      '          '#39'FMEA'#39
      '         WHEN r.metot = 3 THEN'
      '          '#39'Fine-Kinney'#39
      '         ELSE'
      '          '#39#39
      '       END) smetot,'
      '       case'
      '         when r.metot = 1 then'
      '          (CASE'
      '            WHEN r.olasilik = 1 THEN'
      '             '#39#199'OK D'#220#350#220'K OLASILIK'#39
      '            WHEN r.olasilik = 2 THEN'
      '             '#39'D'#220#350#220'K OLASILIK'#39
      '            WHEN r.olasilik = 3 THEN'
      '             '#39'ORTA OLASILIK'#39
      '            WHEN r.olasilik = 4 THEN'
      '             '#39'Y'#220'KSEK OLASILIK'#39
      '            WHEN r.olasilik = 5 THEN'
      '             '#39#199'OK Y'#220'KSEK OLASILIK'#39
      '            ELSE'
      '             '#39#39
      '          END)'
      '         when r.metot = 2 then'
      '          (CASE'
      '            WHEN r.olasilik = 1 THEN'
      '             '#39#199'OK D'#220#350#220'K OLASILIK'#39
      '            WHEN r.olasilik = 2 THEN'
      '             '#39'D'#220#350#220'K OLASILIK'#39
      '            WHEN r.olasilik = 3 THEN'
      '             '#39'ORTA OLASILIK'#39
      '            WHEN r.olasilik = 4 THEN'
      '             '#39'Y'#220'KSEK OLASILIK'#39
      '            WHEN r.olasilik = 5 THEN'
      '             '#39#199'OK Y'#220'KSEK OLASILIK'#39
      '            ELSE'
      '             '#39#39
      '          END)'
      '         when r.metot = 3 then'
      '          (CASE'
      '            WHEN r.olasilik = 1 THEN'
      '             '#39'0.2 - Beklenmez'#39
      '            WHEN r.olasilik = 2 THEN'
      '             '#39'0.5 - Beklenmez fakat m'#252'mk'#252'n '#39
      '            WHEN r.olasilik = 3 THEN'
      '             '#39'1 - M'#252'mk'#252'n fakat d'#252#351#252'k'#39
      '            WHEN r.olasilik = 4 THEN'
      '             '#39'3 - Olas'#305#39
      '            WHEN r.olasilik = 5 THEN'
      '             '#39'6 - Y'#252'ksek'#39
      '            WHEN r.olasilik = 6 THEN'
      '             '#39'10 - Kesin'#39
      '            ELSE'
      '             '#39#39
      '          END)'
      '       end solasilik,'
      '       case'
      '         when r.metot = 1 then'
      '          (CASE'
      '            WHEN r.etki = 1 THEN'
      '             '#39#199'OK D'#220#350#220'K OLASILIK'#39
      '            WHEN r.etki = 2 THEN'
      '             '#39'D'#220#350#220'K OLASILIK'#39
      '            WHEN r.etki = 3 THEN'
      '             '#39'ORTA OLASILIK'#39
      '            WHEN r.etki = 4 THEN'
      '             '#39'Y'#220'KSEK OLASILIK'#39
      '            WHEN r.etki = 5 THEN'
      '             '#39#199'OK Y'#220'KSEK OLASILIK'#39
      '            ELSE'
      '             '#39#39
      '          END)'
      '         when r.metot = 2 then'
      '          (CASE'
      '            WHEN r.etki = 1 THEN'
      '             '#39#199'OK D'#220#350#220'K OLASILIK'#39
      '            WHEN r.etki = 2 THEN'
      '             '#39'D'#220#350#220'K OLASILIK'#39
      '            WHEN r.etki = 3 THEN'
      '             '#39'ORTA OLASILIK'#39
      '            WHEN r.etki = 4 THEN'
      '             '#39'Y'#220'KSEK OLASILIK'#39
      '            WHEN r.etki = 5 THEN'
      '             '#39#199'OK Y'#220'KSEK OLASILIK'#39
      '            ELSE'
      '             '#39#39
      '          END)'
      '         when r.metot = 3 then'
      '          (CASE'
      '            WHEN r.etki = 1 THEN'
      '             '#39'0.2 - Beklenmez'#39
      '            WHEN r.etki = 2 THEN'
      '             '#39'0.5 - Beklenmez fakat m'#252'mk'#252'n '#39
      '            WHEN r.etki = 3 THEN'
      '             '#39'1 - M'#252'mk'#252'n fakat d'#252#351#252'k'#39
      '            WHEN r.etki = 4 THEN'
      '             '#39'3 - Olas'#305#39
      '            WHEN r.etki = 5 THEN'
      '             '#39'6 - Y'#252'ksek'#39
      '            WHEN r.etki = 6 THEN'
      '             '#39'10 - Kesin'#39
      '            ELSE'
      '             '#39#39
      '          END)'
      '       end setki,'
      '       (CASE'
      '         WHEN r.frekans = 1 THEN'
      '          '#39'0.5 - '#199'ok seyrek (y'#305'lda bir veya daha seyrek)'#39
      '         WHEN r.frekans = 2 THEN'
      '          '#39'1 - Seyrek (y'#305'lda birka'#231' defa)'#39
      '         WHEN r.frekans = 3 THEN'
      '          '#39'2 - S'#305'k de'#287'il (ayda bir veya birka'#231' defa)'#39
      '         WHEN r.frekans = 4 THEN'
      '          '#39'3 - Ara s'#305'ra (haftada bir veya birka'#231' defa)'#39
      '         WHEN r.frekans = 5 THEN'
      '          '#39'6 - S'#305'k (g'#252'nde bir veya birka'#231' defa)'#39
      '         WHEN r.frekans = 6 THEN'
      '          '#39'10 - Hemen s'#252'rekli tekrar'#39
      '         ELSE'
      '          '#39#39
      '       END) sfrekans,'
      '       (CASE'
      '         WHEN r.farkedilebilirlik = 1 THEN'
      '          '#39'0.5 - '#199'ok seyrek (y'#305'lda bir veya daha seyrek)'#39
      '         WHEN r.farkedilebilirlik = 2 THEN'
      '          '#39'1 - Seyrek (y'#305'lda birka'#231' defa)'#39
      '         WHEN r.farkedilebilirlik = 3 THEN'
      '          '#39'2 - S'#305'k de'#287'il (ayda bir veya birka'#231' defa)'#39
      '         WHEN r.farkedilebilirlik = 4 THEN'
      '          '#39'3 - Ara s'#305'ra (haftada bir veya birka'#231' defa)'#39
      '         WHEN r.farkedilebilirlik = 5 THEN'
      '          '#39'6 - S'#305'k (g'#252'nde bir veya birka'#231' defa)'#39
      '         WHEN r.farkedilebilirlik = 6 THEN'
      '          '#39'10 - Hemen s'#252'rekli tekrar'#39
      '         ELSE'
      '          '#39#39
      '       END) sfarkedilebilirlik,'
      '       case'
      '         when r.metot = 1 then'
      '          (case'
      '            when r.seviye < 5 then'
      '             '#39'D'#220#350#220'K R'#304'SK'#39
      '            when r.seviye >= 5 and r.seviye <= 10 then'
      '             '#39'KABUL ED'#304'LEB'#304'L'#304'R R'#304'SK'#39
      '            when r.seviye >= 11 and r.seviye <= 15 then'
      '             '#39'ORTA R'#304'SK'#39
      '            when r.seviye >= 16 and r.seviye <= 20 then'
      '             '#39'Y'#220'KSEK R'#304'SK'#39
      '            when r.seviye > 21 then'
      '             '#39'KR'#304'T'#304'K R'#304'SK'#39
      '          end)'
      '         when r.metot = 2 then'
      '          (case'
      '            when r.seviye < 25 THEN'
      '             '#39'D'#220#350#220'K R'#304'SK'#39
      '            when r.seviye >= 25 and r.seviye <= 50 THEN'
      '             '#39'KABUL ED'#304'LEB'#304'L'#304'R R'#304'SK'#39
      '            when r.seviye >= 50 and r.seviye <= 75 THEN'
      '             '#39'ORTA R'#304'SK'#39
      '            when r.seviye >= 75 and r.seviye <= 100 THEN'
      '             '#39'Y'#220'KSEK R'#304'SK'#39
      '            when r.seviye > 100 THEN'
      '             '#39'KR'#304'T'#304'K R'#304'SK'#39
      '          end)'
      '         when r.metot = 3 then'
      '          (case'
      '            when r.seviye < 200 THEN'
      '             '#39'D'#220#350#220'K R'#304'SK'#39
      '            when r.seviye >= 200 and r.seviye <= 400 THEN'
      '             '#39'KABUL ED'#304'LEB'#304'L'#304'R R'#304'SK'#39
      '            when r.seviye >= 400 and r.seviye <= 600 THEN'
      '             '#39'ORTA R'#304'SK'#39
      '            when r.seviye >= 600 and r.seviye <= 800 THEN'
      '             '#39'Y'#220'KSEK R'#304'SK'#39
      '            when r.seviye > 800 THEN'
      '             '#39'KR'#304'T'#304'K R'#304'SK'#39
      '          end)'
      '       end sseviye'
      '  FROM def_data_risk r'
      ' where r.mc_id = 0 and id=0')
    Left = 296
    Top = 216
  end
  object dsdata: TUniDataSource
    DataSet = qdata
    Left = 344
    Top = 216
  end
end
