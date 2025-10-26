object frmVSDepartmanKayit: TfrmVSDepartmanKayit
  Left = 0
  Top = 0
  ClientHeight = 457
  ClientWidth = 821
  Caption = #304'lgili Ki'#351'i Ba'#351'vurusu - Departman G'#246'r'#252#351#252
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object pnlButtons: TUniPanel
    Left = 0
    Top = 374
    Width = 821
    Height = 83
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      821
      83)
    object btnCancel: TUniBitBtn
      Left = 713
      Top = 40
      Width = 96
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
      Left = 611
      Top = 40
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Kaydet'
      Anchors = [akRight, akBottom]
      TabOrder = 1
      Images = MainMod.PrjImgList
      ImageIndex = 14
      OnClick = btnPostClick
    end
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
      TabOrder = 3
    end
    object lbIDY: TUniLabel
      Left = 111
      Top = 5
      Width = 220
      Height = 13
      Hint = ''
      AutoSize = False
      Caption = 'lbIDY'
      ParentFont = False
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
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
      TabOrder = 5
    end
    object lbIDT: TUniLabel
      Left = 111
      Top = 24
      Width = 220
      Height = 13
      Hint = ''
      AutoSize = False
      Caption = 'lbIDT'
      ParentFont = False
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 6
    end
    object UniLabel6: TUniLabel
      Left = 337
      Top = 6
      Width = 96
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Son De'#287'. Yapan :'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 7
    end
    object lbSDY: TUniLabel
      Left = 436
      Top = 6
      Width = 220
      Height = 13
      Hint = ''
      AutoSize = False
      Caption = 'lbSDY'
      ParentFont = False
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 8
    end
    object UniLabel7: TUniLabel
      Left = 337
      Top = 24
      Width = 96
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Son De'#287'. Zaman'#305' :'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 9
    end
    object lbSDT: TUniLabel
      Left = 436
      Top = 24
      Width = 220
      Height = 13
      Hint = ''
      AutoSize = False
      Caption = 'lbSDT'
      ParentFont = False
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 10
    end
    object btnHelp: TUniBitBtn
      Left = 509
      Top = 40
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 11
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = btnHelpClick
    end
  end
  object PgControl: TUniPageControl
    Left = 0
    Top = 0
    Width = 821
    Height = 374
    Hint = ''
    ActivePage = pgEkler
    Align = alClient
    TabOrder = 0
    object pgDept: TUniTabSheet
      Hint = ''
      Caption = 'Departman G'#246'r'#252#351#252
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object UniLabel23: TUniLabel
        Left = 9
        Top = 17
        Width = 75
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Durumu'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 0
      end
      object edDeptDurum: TUniDBComboBox
        Left = 93
        Top = 12
        Width = 163
        Height = 28
        Hint = ''
        DataField = 'onay'
        DataSource = dsBsvDept
        Style = csDropDownList
        Items.Strings = (
          'BEKL'#304'YOR'
          'ONAYLANDI')
        TabOrder = 2
        IconItems = <>
      end
      object UniLabel24: TUniLabel
        Left = 9
        Top = 41
        Width = 75
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'A'#231#305'klama'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
      end
      object edDeptAciklama: TUniDBMemo
        Left = 93
        Top = 38
        Width = 499
        Height = 294
        Hint = ''
        DataField = 'aciklama'
        DataSource = dsBsvDept
        ScrollBars = ssVertical
        TabOrder = 3
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
    end
    object pgEkler: TUniTabSheet
      Hint = ''
      Caption = 'Ekler'
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object grdDocs: TUniDBGrid
        Left = 12
        Top = 12
        Width = 787
        Height = 280
        Hint = ''
        DataSource = dsBsvDoc
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
        WebOptions.Paged = False
        WebOptions.CustomizableCells = False
        WebOptions.FetchAll = True
        LoadMask.Message = 'Loading data...'
        EmptyText = 'Veri Bulunamad'#305
        TabOrder = 0
        Columns = <
          item
            FieldName = 'idt'
            Title.Alignment = taCenter
            Title.Caption = 'Ekleme Zaman'#305
            Width = 120
            Font.OverrideDefaults = [ovFontHeight]
            Alignment = taCenter
          end
          item
            FieldName = 'belge_adi'
            Title.Caption = 'Dosya Ad'#305
            Width = 280
            Font.OverrideDefaults = [ovFontHeight]
            DisplayMemo = True
          end
          item
            FieldName = 'aciklama'
            Title.Alignment = taCenter
            Title.Caption = 'A'#231#305'klama'
            Width = 280
            Font.OverrideDefaults = [ovFontHeight]
            DisplayMemo = True
          end
          item
            FieldName = 'dept_name'
            Title.Alignment = taCenter
            Title.Caption = 'Departman'
            Width = 150
            Font.OverrideDefaults = [ovFontHeight]
            ReadOnly = True
            DisplayMemo = True
          end
          item
            FieldName = 'ekleyen'
            Title.Alignment = taCenter
            Title.Caption = 'Ekleyen'
            Width = 150
            Font.OverrideDefaults = [ovFontHeight]
            ReadOnly = True
            DisplayMemo = True
          end>
      end
      object btnDocsAdd: TUniBitBtn
        Left = 682
        Top = 298
        Width = 30
        Height = 30
        Hint = 'Departman Ekle'
        Caption = ''
        TabOrder = 1
        Images = MainMod.BtnImgList
        ImageIndex = 0
        OnClick = btnDocsAddClick
      end
      object btnDocsDel: TUniBitBtn
        Left = 724
        Top = 298
        Width = 30
        Height = 30
        Hint = 'Departman Sil'
        Caption = ''
        TabOrder = 2
        Images = MainMod.BtnImgList
        ImageIndex = 5
        OnClick = btnDocsDelClick
      end
      object btnDocsDown: TUniBitBtn
        Left = 769
        Top = 298
        Width = 30
        Height = 30
        Hint = 'Departman Sil'
        Caption = ''
        TabOrder = 3
        Images = MainMod.BtnImgList
        ImageIndex = 8
        OnClick = btnDocsDownClick
      end
    end
    object pgVeriSahibi: TUniTabSheet
      Hint = ''
      Caption = #304'lgili Ki'#351'i'
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      object UniLabel9: TUniLabel
        Left = 6
        Top = 16
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Ki'#351'i Grubu'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
      end
      object UniLabel34: TUniLabel
        Left = 6
        Top = 135
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Kimlik No'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 9
      end
      object edKimlikNo: TUniDBEdit
        Left = 96
        Top = 132
        Width = 145
        Height = 22
        Hint = ''
        DataField = 'kimlik_no'
        DataSource = dsBasvuru
        CharCase = ecUpperCase
        TabOrder = 13
        TabStop = False
        ReadOnly = True
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel13: TUniLabel
        Left = 6
        Top = 162
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Ad'#305' Soyad'#305
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
      end
      object edAd: TUniDBEdit
        Left = 96
        Top = 157
        Width = 145
        Height = 22
        Hint = ''
        DataField = 'adi'
        DataSource = dsBasvuru
        CharCase = ecUpperCase
        TabOrder = 14
        TabStop = False
        ReadOnly = True
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel18: TUniLabel
        Left = 6
        Top = 185
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Telefon'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 6
      end
      object edTel1: TUniDBEdit
        Left = 96
        Top = 182
        Width = 145
        Height = 22
        Hint = ''
        DataField = 'tel1'
        DataSource = dsBasvuru
        CharCase = ecUpperCase
        TabOrder = 16
        TabStop = False
        ReadOnly = True
        InputMask.Mask = '(999)9999999'
      end
      object edSoyad: TUniDBEdit
        Left = 243
        Top = 157
        Width = 145
        Height = 22
        Hint = ''
        DataField = 'soyadi'
        DataSource = dsBasvuru
        CharCase = ecUpperCase
        TabOrder = 15
        TabStop = False
        ReadOnly = True
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object edTel2: TUniDBEdit
        Left = 243
        Top = 182
        Width = 145
        Height = 22
        Hint = ''
        DataField = 'tel2'
        DataSource = dsBasvuru
        CharCase = ecUpperCase
        TabOrder = 17
        TabStop = False
        ReadOnly = True
        InputMask.Mask = '(999)9999999'
      end
      object UniLabel21: TUniLabel
        Left = 6
        Top = 210
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Adres'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 7
      end
      object edAdres1: TUniDBEdit
        Left = 96
        Top = 207
        Width = 292
        Height = 22
        Hint = ''
        DataField = 'adres1'
        DataSource = dsBasvuru
        CharCase = ecUpperCase
        TabOrder = 18
        TabStop = False
        ReadOnly = True
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object edAdres2: TUniDBEdit
        Left = 96
        Top = 232
        Width = 292
        Height = 22
        Hint = ''
        DataField = 'adres2'
        DataSource = dsBasvuru
        CharCase = ecUpperCase
        TabOrder = 19
        TabStop = False
        ReadOnly = True
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel1: TUniLabel
        Left = 6
        Top = 260
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = #304'l'#231'e / '#350'ehir'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 0
      end
      object edIlce: TUniDBEdit
        Left = 96
        Top = 257
        Width = 145
        Height = 22
        Hint = ''
        DataField = 'ilce'
        DataSource = dsBasvuru
        CharCase = ecUpperCase
        TabOrder = 20
        TabStop = False
        ReadOnly = True
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object edSehir: TUniDBEdit
        Left = 243
        Top = 257
        Width = 145
        Height = 22
        Hint = ''
        DataField = 'sehir'
        DataSource = dsBasvuru
        CharCase = ecUpperCase
        TabOrder = 21
        TabStop = False
        ReadOnly = True
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel14: TUniLabel
        Left = 6
        Top = 285
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'E-Mail'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
      end
      object edEMail: TUniDBEdit
        Left = 96
        Top = 282
        Width = 292
        Height = 22
        Hint = ''
        DataField = 'email'
        DataSource = dsBasvuru
        CharCase = ecLowerCase
        TabOrder = 22
        TabStop = False
        ReadOnly = True
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleLowerCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel15: TUniLabel
        Left = 6
        Top = 310
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'KEP Adresi'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 5
      end
      object edKEP: TUniDBEdit
        Left = 96
        Top = 307
        Width = 292
        Height = 22
        Hint = ''
        DataField = 'kep'
        DataSource = dsBasvuru
        CharCase = ecLowerCase
        TabOrder = 23
        TabStop = False
        ReadOnly = True
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleLowerCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel22: TUniLabel
        Left = 6
        Top = 111
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Durumu'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 8
      end
      object UniPanel1: TUniPanel
        Left = 396
        Top = 12
        Width = 409
        Height = 322
        Hint = ''
        TabOrder = 24
        BorderStyle = ubsFrameLowered
        Caption = ''
        object edBsTarih: TUniDBDateTimePicker
          Left = 106
          Top = 10
          Width = 145
          Hint = ''
          DataField = 'basvuru_tarihi'
          DataSource = dsBasvuru
          DateTime = 44100.000000000000000000
          DateFormat = 'dd.MM.yyyy'
          TimeFormat = 'HH:mm:ss'
          ReadOnly = True
          TabOrder = 6
          TabStop = False
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
        end
        object edBsEvrNo: TUniDBEdit
          Left = 106
          Top = 59
          Width = 145
          Height = 23
          Hint = ''
          DataField = 'basvuru_evrakno'
          DataSource = dsBasvuru
          CharCase = ecUpperCase
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 8
          TabStop = False
          ReadOnly = True
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel10: TUniLabel
          Left = 12
          Top = 62
          Width = 85
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Ba'#351'v. Evrak No'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 3
        end
        object UniLabel8: TUniLabel
          Left = 12
          Top = 38
          Width = 85
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Ba'#351'vuru Bi'#231'imi'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 2
        end
        object UniLabel3: TUniLabel
          Left = 12
          Top = 14
          Width = 85
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Ba'#351'vuru Tarihi'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
        end
        object edBsAciklama: TUniDBMemo
          Left = 12
          Top = 123
          Width = 382
          Height = 187
          Hint = ''
          DataField = 'basvuru_aciklama'
          DataSource = dsBasvuru
          ScrollBars = ssVertical
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
          TabOrder = 10
          TabStop = False
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel11: TUniLabel
          Left = 12
          Top = 109
          Width = 92
          Height = 13
          Hint = ''
          Caption = 'Ba'#351'vuru  A'#231#305'klama'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 4
        end
        object edBsSekli: TUniDBEdit
          Left = 106
          Top = 34
          Width = 145
          Height = 23
          Hint = ''
          DataField = 'basvuru_sekli'
          DataSource = dsBasvuru
          CharCase = ecUpperCase
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 7
          TabStop = False
          ReadOnly = True
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel12: TUniLabel
          Left = 12
          Top = 87
          Width = 85
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Ba'#351'v. Konusu'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 5
        end
        object edBSKonu: TUniDBEdit
          Left = 106
          Top = 84
          Width = 288
          Height = 23
          Hint = ''
          DataField = 'basvuru_konu'
          DataSource = dsBasvuru
          CharCase = ecUpperCase
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 9
          TabStop = False
          ReadOnly = True
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
      end
      object edKisiGrubu: TUniDBEdit
        Left = 96
        Top = 12
        Width = 292
        Height = 22
        Hint = ''
        DataField = 'kisi_grubu'
        DataSource = dsBasvuru
        CharCase = ecUpperCase
        TabOrder = 10
        TabStop = False
        ReadOnly = True
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object edDurumu: TUniDBEdit
        Left = 96
        Top = 107
        Width = 145
        Height = 22
        Hint = ''
        DataField = 'durum'
        DataSource = dsBasvuru
        CharCase = ecUpperCase
        TabOrder = 12
        TabStop = False
        ReadOnly = True
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel2: TUniLabel
        Left = 6
        Top = 40
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Ki'#351'i Detay'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
      end
      object edKisiDetay: TUniDBMemo
        Left = 96
        Top = 37
        Width = 292
        Height = 67
        Hint = ''
        DataField = 'kg_detay'
        DataSource = dsBasvuru
        ScrollBars = ssVertical
        ReadOnly = True
        TabOrder = 11
        TabStop = False
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
    end
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, kisi FROM def_data_kisi'
      'WHERE mc_id = 2'
      'ORDER BY id')
    Left = 544
    Top = 219
  end
  object qBsvDept: TUniQuery
    UpdatingTable = 'data_vsbasvuru_dept'
    KeyFields = 'id'
    SQLInsert.Strings = (
      'INSERT INTO data_vsbasvuru_dept'
      
        '  (id, vsb_id, mc_id, dept_id, onay, idy, idt, sdy, sdt, aciklam' +
        'a)'
      'VALUES'
      
        '  (:id, :vsb_id, :mc_id, :dept_id, :onay, :idy, :idt, :sdy, :sdt' +
        ', :aciklama)')
    SQLDelete.Strings = (
      'DELETE FROM data_vsbasvuru_dept'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE data_vsbasvuru_dept'
      'SET'
      
        '  id = :id, vsb_id = :vsb_id, mc_id = :mc_id, dept_id = :dept_id' +
        ', onay = :onay, idy = :idy, idt = :idt, sdy = :sdy, sdt = :sdt, ' +
        'aciklama = :aciklama'
      'WHERE'
      '  id = :Old_id')
    SQLLock.Strings = (
      'SELECT * FROM data_vsbasvuru_dept'
      'WHERE'
      '  id = :Old_id'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT id, vsb_id, mc_id, dept_id, onay, idy, idt, sdy, sdt, aci' +
        'klama FROM data_vsbasvuru_dept'
      'WHERE'
      '  id = :Old_id')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM data_vsbasvuru_dept'
      ''
      ') t')
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT *'
      'FROM data_vsbasvuru_dept'
      'WHERE mc_id = 2'
      'ORDER BY id')
    Left = 667
    Top = 123
  end
  object dsBsvDept: TUniDataSource
    DataSet = qBsvDept
    Left = 715
    Top = 123
  end
  object qBsvDoc: TUniQuery
    UpdatingTable = 'data_vsbasvuru_docs'
    KeyFields = 'id'
    SQLInsert.Strings = (
      'INSERT INTO data_vsbasvuru_docs'
      
        '  (id, vsb_id, mc_id, dept_id, idy, idt, sdy, sdt, aciklama, bel' +
        'ge_adi, belge)'
      'VALUES'
      
        '  (:id, :vsb_id, :mc_id, :dept_id, :idy, :idt, :sdy, :sdt, :acik' +
        'lama, :belge_adi, :belge)')
    SQLDelete.Strings = (
      'DELETE FROM data_vsbasvuru_docs'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE data_vsbasvuru_docs'
      'SET'
      
        '  id = :id, vsb_id = :vsb_id, mc_id = :mc_id, dept_id = :dept_id' +
        ', idy = :idy, idt = :idt, sdy = :sdy, sdt = :sdt, aciklama = :ac' +
        'iklama, belge_adi = :belge_adi, belge = :belge'
      'WHERE'
      '  id = :Old_id')
    SQLLock.Strings = (
      'SELECT * FROM data_vsbasvuru_docs'
      'WHERE'
      '  id = :Old_id'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT id, vsb_id, mc_id, dept_id, idy, idt, sdy, sdt, aciklama,' +
        ' belge_adi, belge FROM data_vsbasvuru_docs'
      'WHERE'
      '  id = :Old_id')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM data_vsbasvuru_docs'
      ''
      ') t')
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT bsd.*, dp.title as dept_name, us.full_name as ekleyen'
      'FROM data_vsbasvuru_docs bsd'
      '  LEFT JOIN sys_deptdef dp ON dp.id = bsd.dept_id'
      '  LEFT JOIN usr_user us ON us.id = bsd.idy'
      'WHERE bsd.mc_id = 2 AND bsd.vsb_id = :pid'
      'ORDER BY bsd.id')
    CachedUpdates = True
    Left = 667
    Top = 171
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pid'
        Value = 0
      end>
    object qBsvDocid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object qBsvDocvsb_id: TIntegerField
      FieldName = 'vsb_id'
    end
    object qBsvDocmc_id: TIntegerField
      FieldName = 'mc_id'
    end
    object qBsvDocdept_id: TIntegerField
      FieldName = 'dept_id'
    end
    object qBsvDocidy: TIntegerField
      FieldName = 'idy'
    end
    object qBsvDocidt: TDateTimeField
      FieldName = 'idt'
    end
    object qBsvDocsdy: TIntegerField
      FieldName = 'sdy'
    end
    object qBsvDocsdt: TDateTimeField
      FieldName = 'sdt'
    end
    object qBsvDocaciklama: TStringField
      FieldName = 'aciklama'
      Size = 100
    end
    object qBsvDocbelge_adi: TStringField
      FieldName = 'belge_adi'
      Size = 300
    end
    object qBsvDocbelge: TBlobField
      FieldName = 'belge'
    end
    object qBsvDocdept_name: TStringField
      FieldName = 'dept_name'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Size = 30
    end
    object qBsvDocekleyen: TStringField
      FieldName = 'ekleyen'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Size = 30
    end
  end
  object dsBsvDoc: TUniDataSource
    DataSet = qBsvDoc
    Left = 715
    Top = 171
  end
  object qBasvuru: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT bsv.*, kg.kisi AS kisi_grubu'
      'FROM data_vsbasvuru bsv'
      '  LEFT JOIN def_data_kisi kg ON kg.id = bsv.kg_id'
      'WHERE bsv.mc_id = 2 AND bsv.id = 0'
      'ORDER BY bsv.id')
    CachedUpdates = True
    Left = 667
    Top = 219
  end
  object dsBasvuru: TUniDataSource
    DataSet = qBasvuru
    Left = 715
    Top = 219
  end
end
