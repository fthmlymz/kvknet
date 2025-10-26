object frmVSBasvuruKayit: TfrmVSBasvuruKayit
  Left = 0
  Top = 0
  ClientHeight = 430
  ClientWidth = 809
  Caption = #304'lgli Ki'#351'i Ba'#351'vuru Bilgileri'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object pnlButtons: TUniPanel
    Left = 0
    Top = 347
    Width = 809
    Height = 83
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      809
      83)
    object btnCancel: TUniBitBtn
      Left = 708
      Top = 38
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
      Left = 606
      Top = 38
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
      Left = 439
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
      Left = 439
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
      Left = 504
      Top = 38
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
    Width = 809
    Height = 347
    Hint = ''
    ActivePage = pgDept
    Align = alClient
    TabOrder = 0
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
        Caption = #304'lgili Ki'#351'i'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
      end
      object edKisiGrubu: TUniDBLookupComboBox
        Left = 97
        Top = 13
        Width = 409
        Hint = ''
        ListOnlyMode = lmFollowSource
        ListField = 'kisi'
        ListSource = dsGrup
        KeyField = 'id'
        ListFieldIndex = 0
        DataField = 'kg_id'
        DataSource = dsVSBasvuru
        EmptyText = 'Se'#231'im Yap'#305'lmam'#305#351
        TabOrder = 14
        Color = clWindow
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
        Style = csDropDown
      end
      object UniLabel34: TUniLabel
        Left = 6
        Top = 68
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Kimlik No'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 12
      end
      object edKimlikNo: TUniDBEdit
        Left = 96
        Top = 65
        Width = 163
        Height = 22
        Hint = ''
        DataField = 'kimlik_no'
        DataSource = dsVSBasvuru
        CharCase = ecUpperCase
        TabOrder = 16
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel13: TUniLabel
        Left = 6
        Top = 93
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Ad'#305
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
      end
      object edAd: TUniDBEdit
        Left = 96
        Top = 90
        Width = 163
        Height = 22
        Hint = ''
        DataField = 'adi'
        DataSource = dsVSBasvuru
        CharCase = ecUpperCase
        TabOrder = 17
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel18: TUniLabel
        Left = 6
        Top = 118
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Cep Telefonu'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 6
      end
      object edTel1: TUniDBEdit
        Left = 96
        Top = 115
        Width = 163
        Height = 22
        Hint = ''
        DataField = 'tel1'
        DataSource = dsVSBasvuru
        CharCase = ecUpperCase
        TabOrder = 19
        InputMask.Mask = '(999)9999999'
      end
      object UniLabel35: TUniLabel
        Left = 262
        Top = 93
        Width = 75
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Soyad'#305
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 13
      end
      object edSoyad: TUniDBEdit
        Left = 342
        Top = 90
        Width = 163
        Height = 22
        Hint = ''
        DataField = 'soyadi'
        DataSource = dsVSBasvuru
        CharCase = ecUpperCase
        TabOrder = 18
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel19: TUniLabel
        Left = 262
        Top = 118
        Width = 75
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Sabit Telefon'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 7
      end
      object edTel2: TUniDBEdit
        Left = 342
        Top = 115
        Width = 163
        Height = 22
        Hint = ''
        DataField = 'tel2'
        DataSource = dsVSBasvuru
        CharCase = ecUpperCase
        TabOrder = 20
        InputMask.Mask = '(999)9999999'
      end
      object UniLabel21: TUniLabel
        Left = 6
        Top = 151
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Adres'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 8
      end
      object edAdres1: TUniDBEdit
        Left = 96
        Top = 148
        Width = 409
        Height = 22
        Hint = ''
        DataField = 'adres1'
        DataSource = dsVSBasvuru
        CharCase = ecUpperCase
        TabOrder = 21
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object edAdres2: TUniDBEdit
        Left = 96
        Top = 173
        Width = 409
        Height = 22
        Hint = ''
        DataField = 'adres2'
        DataSource = dsVSBasvuru
        CharCase = ecUpperCase
        TabOrder = 22
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel1: TUniLabel
        Left = 6
        Top = 201
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = #304'l'#231'e'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 0
      end
      object edIlce: TUniDBEdit
        Left = 96
        Top = 198
        Width = 163
        Height = 22
        Hint = ''
        DataField = 'ilce'
        DataSource = dsVSBasvuru
        CharCase = ecUpperCase
        TabOrder = 23
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel2: TUniLabel
        Left = 262
        Top = 201
        Width = 75
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = #350'ehir'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
      end
      object edSehir: TUniDBEdit
        Left = 342
        Top = 198
        Width = 163
        Height = 22
        Hint = ''
        DataField = 'sehir'
        DataSource = dsVSBasvuru
        CharCase = ecUpperCase
        TabOrder = 24
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel14: TUniLabel
        Left = 6
        Top = 226
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
        Top = 223
        Width = 409
        Height = 22
        Hint = ''
        DataField = 'email'
        DataSource = dsVSBasvuru
        CharCase = ecLowerCase
        TabOrder = 25
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleLowerCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel15: TUniLabel
        Left = 6
        Top = 251
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
        Top = 248
        Width = 409
        Height = 22
        Hint = ''
        DataField = 'kep'
        DataSource = dsVSBasvuru
        CharCase = ecLowerCase
        TabOrder = 26
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleLowerCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel22: TUniLabel
        Left = 16
        Top = 42
        Width = 75
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Durumu'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 9
      end
      object edDurumu: TUniDBComboBox
        Left = 96
        Top = 39
        Width = 163
        Hint = ''
        DataField = 'durum'
        DataSource = dsVSBasvuru
        Style = csDropDownList
        Items.Strings = (
          'BEKLEMEDE'
          #304'NCELEN'#304'YOR'
          'CEVAPLANDI')
        TabOrder = 15
        IconItems = <>
      end
      object edKisiDetay: TUniDBMemo
        Left = 531
        Top = 30
        Width = 249
        Height = 106
        Hint = ''
        DataField = 'kg_detay'
        DataSource = dsVSBasvuru
        ScrollBars = ssVertical
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 27
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel27: TUniLabel
        Left = 531
        Top = 16
        Width = 74
        Height = 13
        Hint = ''
        Caption = #304'lgili Ki'#351'i Detay'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 10
      end
      object UniLabel29: TUniLabel
        Left = 531
        Top = 144
        Width = 103
        Height = 13
        Hint = ''
        Caption = #304'leti'#351'imde Old. Birim'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 11
      end
      object edBirim: TUniDBEdit
        Left = 531
        Top = 159
        Width = 249
        Height = 22
        Hint = ''
        DataField = 'title'
        DataSource = dsVSBasvuru
        CharCase = ecUpperCase
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 28
        TabStop = False
        ReadOnly = True
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
    end
    object pgBasvuru: TUniTabSheet
      Hint = ''
      Caption = 'Ba'#351'vuru'
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      object UniLabel3: TUniLabel
        Left = 6
        Top = 16
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Ba'#351'vuru Tarihi'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 0
      end
      object UniLabel8: TUniLabel
        Left = 6
        Top = 42
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Ba'#351'vuru Y'#246'ntemi'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
      end
      object edBsTarih: TUniDBDateTimePicker
        Left = 100
        Top = 12
        Width = 145
        Hint = ''
        DataField = 'basvuru_tarihi'
        DataSource = dsVSBasvuru
        DateTime = 44100.000000000000000000
        DateFormat = 'dd.MM.yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 10
      end
      object UniLabel10: TUniLabel
        Left = 6
        Top = 68
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Ba'#351'v. Evrak No'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
      end
      object edBsSekli: TUniDBComboBox
        Left = 100
        Top = 39
        Width = 145
        Hint = ''
        DataField = 'basvuru_sekli'
        DataSource = dsVSBasvuru
        Style = csDropDownList
        Items.Strings = (
          #350'AHSEN'
          'NOTER'
          'KEP'
          'MA'#304'L'
          'TAAH. POSTA'
          'ONLINE'
          'ELDEN')
        TabOrder = 11
        IconItems = <>
      end
      object edBsEvrNo: TUniDBEdit
        Left = 100
        Top = 65
        Width = 145
        Height = 22
        Hint = ''
        DataField = 'basvuru_evrakno'
        DataSource = dsVSBasvuru
        CharCase = ecUpperCase
        TabOrder = 12
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel11: TUniLabel
        Left = 5
        Top = 119
        Width = 85
        Height = 67
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Ba'#351'vuru  A'#231#305'klama'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
      end
      object edBsAciklama: TUniDBMemo
        Left = 100
        Top = 119
        Width = 288
        Height = 169
        Hint = ''
        DataField = 'basvuru_aciklama'
        DataSource = dsVSBasvuru
        ScrollBars = ssVertical
        TabOrder = 14
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel12: TUniLabel
        Left = 405
        Top = 16
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Cevap Tarihi'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
      end
      object UniLabel16: TUniLabel
        Left = 405
        Top = 42
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Cevap Y'#246'ntemi'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 5
      end
      object UniLabel17: TUniLabel
        Left = 405
        Top = 68
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Cevap Evrak No'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 6
      end
      object edCvSekli: TUniDBComboBox
        Left = 499
        Top = 39
        Width = 145
        Hint = ''
        DataField = 'cevap_sekli'
        DataSource = dsVSBasvuru
        Style = csDropDownList
        Items.Strings = (
          'ELDEN'
          'KEP'
          'MA'#304'L'
          'NOTER'
          'TAAH. POSTA')
        TabOrder = 16
        IconItems = <>
      end
      object edCvEvrNo: TUniDBEdit
        Left = 499
        Top = 65
        Width = 145
        Height = 23
        Hint = ''
        DataField = 'cevap_evrakno'
        DataSource = dsVSBasvuru
        CharCase = ecUpperCase
        TabOrder = 17
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel20: TUniLabel
        Left = 405
        Top = 119
        Width = 85
        Height = 67
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = '   Cevap  A'#231#305'klama'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 7
      end
      object edCvAciklama: TUniDBMemo
        Left = 499
        Top = 119
        Width = 288
        Height = 169
        Hint = ''
        DataField = 'cevap_aciklama'
        DataSource = dsVSBasvuru
        ScrollBars = ssVertical
        TabOrder = 19
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object edCvTarih: TUniDBDateTimePicker
        Left = 499
        Top = 12
        Width = 145
        Hint = ''
        DataField = 'cevap_tarihi'
        DataSource = dsVSBasvuru
        DateTime = 44100.000000000000000000
        DateFormat = 'dd.MM.yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 15
      end
      object UniLabel28: TUniLabel
        Left = 6
        Top = 95
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Ba'#351'v. Konusu'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 8
      end
      object edBsKonu: TUniDBEdit
        Left = 100
        Top = 92
        Width = 288
        Height = 22
        Hint = ''
        DataField = 'basvuru_konu'
        DataSource = dsVSBasvuru
        CharCase = ecUpperCase
        TabOrder = 13
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel30: TUniLabel
        Left = 405
        Top = 95
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Cvp.Ynt. (Talep)'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 9
      end
      object edCvSekliTalep: TUniDBEdit
        Left = 499
        Top = 92
        Width = 145
        Height = 23
        Hint = ''
        DataField = 'cevap_sekli_talep'
        DataSource = dsVSBasvuru
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
    end
    object pgDept: TUniTabSheet
      Hint = ''
      Caption = 'Departmanlar'
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      object grdDepts: TUniDBGrid
        Left = 12
        Top = 12
        Width = 322
        Height = 265
        Hint = ''
        DataSource = dsBsvDept
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
        WebOptions.Paged = False
        WebOptions.CustomizableCells = False
        WebOptions.FetchAll = True
        LoadMask.Message = 'Loading data...'
        EmptyText = 'Veri Bulunamad'#305
        TabOrder = 0
        Columns = <
          item
            FieldName = 'lookupdeptname'
            Title.Alignment = taCenter
            Title.Caption = 'Sorumlu Departmanlar'
            Width = 300
            Font.OverrideDefaults = [ovFontHeight]
            ReadOnly = True
            DisplayMemo = True
          end>
      end
      object btnDeptsAdd: TUniBitBtn
        Left = 342
        Top = 12
        Width = 30
        Height = 30
        Hint = 'Departman Ekle'
        Caption = ''
        TabOrder = 1
        Images = MainMod.BtnImgList
        ImageIndex = 0
        OnClick = btnDeptsAddClick
      end
      object btnDeptsDel: TUniBitBtn
        Left = 342
        Top = 48
        Width = 30
        Height = 30
        Hint = 'Departman Sil'
        Caption = ''
        TabOrder = 2
        Images = MainMod.BtnImgList
        ImageIndex = 5
        OnClick = btnDeptsDelClick
      end
      object UniPanel1: TUniPanel
        Left = 399
        Top = 12
        Width = 394
        Height = 265
        Hint = ''
        TabOrder = 3
        BorderStyle = ubsFrameLowered
        Caption = 'UniPanel1'
        object UniLabel23: TUniLabel
          Left = 9
          Top = 15
          Width = 75
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Durumu'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
        end
        object UniLabel24: TUniLabel
          Left = 9
          Top = 39
          Width = 75
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'A'#231#305'klama'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 2
        end
        object edDeptAciklama: TUniDBMemo
          Left = 93
          Top = 36
          Width = 288
          Height = 164
          Hint = ''
          DataField = 'aciklama'
          DataSource = dsBsvDept
          ScrollBars = ssVertical
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
          TabOrder = 5
          TabStop = False
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel25: TUniLabel
          Left = 9
          Top = 234
          Width = 75
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Onay Zaman'#305
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 3
        end
        object UniLabel26: TUniLabel
          Left = 9
          Top = 207
          Width = 75
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Onaylayan'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 4
        end
        object edDeptOnayZamani: TUniEdit
          Left = 93
          Top = 229
          Width = 288
          Height = 23
          Hint = ''
          CharCase = ecUpperCase
          Text = ''
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
        object edDeptOnaylayan: TUniEdit
          Left = 93
          Top = 203
          Width = 288
          Height = 23
          Hint = ''
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 6
          TabStop = False
          ReadOnly = True
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
        object edDeptDurum: TUniDBEdit
          Left = 94
          Top = 10
          Width = 163
          Height = 23
          Hint = ''
          DataField = 'onay'
          DataSource = dsBsvDept
          CharCase = ecUpperCase
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 8
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
      end
      object btnDeptsMail: TUniBitBtn
        Left = 342
        Top = 84
        Width = 30
        Height = 30
        Hint = 'Mail G'#246'nder'
        Caption = ''
        TabOrder = 4
        Images = MainMod.BtnImgList
        ImageIndex = 7
        OnClick = btnDeptsMailClick
      end
    end
    object pgEkler: TUniTabSheet
      Hint = ''
      Caption = 'Ekler'
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      object grdDocs: TUniDBGrid
        Left = 12
        Top = 12
        Width = 775
        Height = 226
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
        Left = 673
        Top = 244
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
        Left = 715
        Top = 244
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
        Left = 757
        Top = 245
        Width = 30
        Height = 30
        Hint = 'Departman Sil'
        Caption = ''
        TabOrder = 3
        ScreenMask.Enabled = True
        ScreenMask.Message = 'Dok'#252'man Haz'#305'rlan'#305'yor...'
        ScreenMask.Color = 16744448
        Images = MainMod.BtnImgList
        ImageIndex = 8
        OnClick = btnDocsDownClick
      end
    end
  end
  object edMailMsg: TUniMemo
    Left = 314
    Top = 364
    Width = 91
    Height = 29
    Hint = ''
    Visible = False
    Lines.Strings = (
      'edMailMsg')
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 2
    TabStop = False
    WordWrap = False
  end
  object dsVSBasvuru: TUniDataSource
    DataSet = MainMod.qVSBasvuru
    Left = 579
    Top = 126
  end
  object qGrup: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, kisi FROM def_data_kisi'
      'WHERE mc_id = 2'
      'ORDER BY id')
    Left = 544
    Top = 171
  end
  object dsGrup: TUniDataSource
    DataSet = qGrup
    Left = 580
    Top = 171
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
      'SELECT bsd.*, dp.title as dept_name, us.full_name as onaylayan'
      'FROM data_vsbasvuru_dept bsd'
      '  LEFT JOIN sys_deptdef dp ON dp.id = bsd.dept_id'
      '  LEFT JOIN usr_user us ON us.id = bsd.sdy'
      'WHERE bsd.mc_id = 2 AND bsd.vsb_id = :pid'
      'ORDER BY bsd.id')
    CachedUpdates = True
    AfterScroll = qBsvDeptAfterScroll
    Left = 667
    Top = 123
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pid'
        Value = 0
      end>
    object qBsvDeptid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object qBsvDeptvsb_id: TIntegerField
      FieldName = 'vsb_id'
    end
    object qBsvDeptmc_id: TIntegerField
      FieldName = 'mc_id'
    end
    object qBsvDeptdept_id: TIntegerField
      FieldName = 'dept_id'
    end
    object qBsvDeptonay: TStringField
      FieldName = 'onay'
      Size = 10
    end
    object qBsvDeptidy: TIntegerField
      FieldName = 'idy'
    end
    object qBsvDeptidt: TDateTimeField
      FieldName = 'idt'
    end
    object qBsvDeptsdy: TIntegerField
      FieldName = 'sdy'
    end
    object qBsvDeptsdt: TDateTimeField
      FieldName = 'sdt'
    end
    object qBsvDeptaciklama: TStringField
      FieldName = 'aciklama'
      Size = 500
    end
    object qBsvDeptdept_name: TStringField
      FieldName = 'dept_name'
      ReadOnly = True
      Size = 30
    end
    object qBsvDeptonaylayan: TStringField
      FieldName = 'onaylayan'
      ReadOnly = True
      Size = 30
    end
    object qBsvDeptlookupdeptname: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupdeptname'
      LookupDataSet = qDept
      LookupKeyFields = 'id'
      LookupResultField = 'title'
      KeyFields = 'dept_id'
      Size = 100
      Lookup = True
    end
  end
  object dsBsvDept: TUniDataSource
    DataSet = qBsvDept
    Left = 715
    Top = 123
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
      'SELECT bsd.*, dp.title as dept_name, us.full_name as onaylayan '
      'FROM data_vsbasvuru_dept bsd '
      'LEFT JOIN sys_deptdef dp ON dp.id = bsd.dept_id '
      'LEFT JOIN usr_user us ON us.id = bsd.sdy'
      'WHERE bsd.mc_id = 2 AND bsd.vsb_id = :pid'
      'ORDER BY bsd.id'
      ''
      '')
    CachedUpdates = True
    AfterScroll = qBsvDeptAfterScroll
    Left = 667
    Top = 171
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pid'
        Value = 0
      end>
  end
  object dsBsvDoc: TUniDataSource
    DataSet = qBsvDoc
    Left = 715
    Top = 171
  end
  object qDept: TUniQuery
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
      'SELECT id, title'
      'FROM sys_deptdef'
      'ORDER BY title')
    CachedUpdates = True
    Left = 670
    Top = 237
  end
end
