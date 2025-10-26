object frmOzelOnayKayitTanim: TfrmOzelOnayKayitTanim
  Left = 0
  Top = 0
  ClientHeight = 601
  ClientWidth = 711
  Caption = #214'zel Onay Kayd'#305
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object pnlButtons: TUniPanel
    Left = 0
    Top = 513
    Width = 711
    Height = 88
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      711
      88)
    object btnCancel: TUniBitBtn
      Left = 609
      Top = 47
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
      Left = 507
      Top = 47
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
    object btnEdit: TUniBitBtn
      Left = 405
      Top = 47
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'De'#287'i'#351'tir'
      Anchors = [akRight, akBottom]
      TabOrder = 3
      Images = MainMod.PrjImgList
      ImageIndex = 2
      OnClick = btnEditClick
    end
    object pnlLog: TUniContainerPanel
      Left = 1
      Top = 1
      Width = 709
      Height = 42
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 4
      object UniLabel4: TUniLabel
        Left = 12
        Top = 6
        Width = 117
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
        Width = 117
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
        Left = 321
        Top = 5
        Width = 117
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
        Left = 321
        Top = 23
        Width = 117
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
        Left = 135
        Top = 5
        Width = 180
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
        Left = 135
        Top = 24
        Width = 180
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
        Left = 444
        Top = 5
        Width = 180
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
        Left = 444
        Top = 23
        Width = 180
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
  end
  object PgControl: TUniPageControl
    Left = 0
    Top = 0
    Width = 711
    Height = 513
    Hint = ''
    ActivePage = pgGenel
    Align = alClient
    TabOrder = 1
    object pgGenel: TUniTabSheet
      Hint = ''
      Caption = 'Genel Bilgiler'
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object UniLabel1: TUniLabel
        Left = 6
        Top = 15
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = #214'zel Onay T'#252'r'#252
        ParentFont = False
        Font.Color = clMaroon
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 9
      end
      object edOzelOnay: TUniDBLookupComboBox
        Left = 96
        Top = 12
        Width = 555
        Height = 28
        Hint = ''
        ListOnlyMode = lmFollowSource
        ListField = 'tanim'
        ListSource = dsOOTnm
        KeyField = 'id'
        ListFieldIndex = 0
        DataField = 'oo_id'
        DataSource = dsOzOnay
        TabOrder = 0
        Color = clWindow
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
        Style = csDropDown
        OnChange = edOzelOnayChange
      end
      object edDesc: TUniDBMemo
        Left = 96
        Top = 293
        Width = 424
        Height = 43
        Hint = ''
        DataField = 'aciklama'
        DataSource = dsOzOnay
        TabOrder = 3
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object edDurum: TUniDBComboBox
        Left = 426
        Top = 123
        Width = 150
        Hint = ''
        DataField = 'durum'
        DataSource = dsOzOnay
        Style = csDropDownList
        Items.Strings = (
          'AKT'#304'F'
          'RIZA ALINMADI'
          'PAS'#304'F/'#304'PTAL'
          'FAAL'#304'YET B'#304'TT'#304
          'RIZA GER'#304' '#199'EK'#304'LD'#304)
        ItemIndex = 0
        TabOrder = 11
        IconItems = <>
        OnChange = edDurumChange
      end
      object edSaat: TUniDBEdit
        Left = 527
        Top = 147
        Width = 49
        Height = 22
        Hint = ''
        DataField = 'saat'
        DataSource = dsOzOnay
        CharCase = ecUpperCase
        TabOrder = 13
        InputMask.Mask = '99:99'
      end
      object edTarih: TUniDBDateTimePicker
        Left = 427
        Top = 147
        Width = 99
        Hint = ''
        DataField = 'tarih'
        DataSource = dsOzOnay
        DateTime = 44100.000000000000000000
        DateFormat = 'dd.MM.yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 12
      end
      object edWebLink: TUniEdit
        Left = 96
        Top = 346
        Width = 424
        Hint = ''
        Text = ''
        TabOrder = 4
        TabStop = False
        ReadOnly = True
      end
      object btnGoToLink: TUniBitBtn
        Left = 219
        Top = 374
        Width = 113
        Height = 36
        Hint = ''
        Caption = 'Adrese Git'
        TabOrder = 6
        Images = MainMod.PrjImgList
        ImageIndex = 0
        OnClick = btnGoToLinkClick
      end
      object btnPrepLink: TUniBitBtn
        Left = 96
        Top = 374
        Width = 117
        Height = 36
        Hint = ''
        Caption = 'Link Olu'#351'tur'
        TabOrder = 5
        Images = MainMod.PrjImgList
        ImageIndex = 9
        OnClick = btnPrepLinkClick
      end
      object btnSendSMS: TUniBitBtn
        Left = 338
        Top = 374
        Width = 113
        Height = 36
        Hint = 'SMS G'#246'nder'
        Caption = 'SMS G'#246'nder'
        TabOrder = 7
        Images = MainMod.PrjImgList
        ImageIndex = 13
        OnClick = btnSendSMSClick
      end
      object edTimeStamp: TUniDBCheckBox
        Left = 426
        Top = 209
        Width = 115
        Height = 17
        Hint = ''
        DataField = 'damga'
        DataSource = dsOzOnay
        ValueChecked = 'E'
        ValueUnchecked = 'H'
        Caption = 'Zaman Damgas'#305
        ParentFont = False
        Font.Color = clNavy
        Font.OverrideDefaults = [ovFontHeight]
        TabStop = False
        TabOrder = 15
        ParentColor = False
        Color = clBtnFace
        ReadOnly = True
      end
      object edFaaliyetBitis: TUniDBDateTimePicker
        Left = 427
        Top = 170
        Width = 100
        Hint = ''
        DataField = 'faal_bitis'
        DataSource = dsOzOnay
        DateTime = 44100.000000000000000000
        DateFormat = 'dd.MM.yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 14
      end
      object imgQRCode: TUniImage
        Left = 531
        Top = 293
        Width = 120
        Height = 120
        Hint = ''
        Stretch = True
      end
      object btnQRCode: TUniBitBtn
        Left = 531
        Top = 419
        Width = 120
        Height = 36
        Hint = ''
        Caption = 'Karekodu '#304'ndir'
        TabOrder = 17
        Images = MainMod.PrjImgList
        ImageIndex = 6
        OnClick = btnQRCodeClick
      end
      object radioOnaySira: TUniRadioGroup
        Left = 342
        Top = 72
        Width = 234
        Height = 45
        Hint = ''
        Items.Strings = (
          #304'lgili Ki'#351'i'
          'Veli / Vasi')
        Caption = 'Onay Veren'
        TabOrder = 10
        Columns = 2
        OnClick = radioOnaySiraClick
      end
      object gbKisi: TUniGroupBox
        Left = 22
        Top = 37
        Width = 314
        Height = 122
        Hint = ''
        Caption = #304'lgili Ki'#351'i Bilgileri'
        TabOrder = 1
        object UniLabel3: TUniLabel
          Left = 11
          Top = 18
          Width = 60
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Ad Soyad'
          ParentFont = False
          Font.Color = clMaroon
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 5
        end
        object UniLabel14: TUniLabel
          Left = 11
          Top = 44
          Width = 60
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Kimlik No'
          ParentFont = False
          Font.Color = clMaroon
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 6
        end
        object edKimlikNo: TUniDBEdit
          Left = 74
          Top = 40
          Width = 225
          Height = 22
          Hint = ''
          DataField = 'kimlik_no'
          DataSource = dsOzOnay
          CharCase = ecUpperCase
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 2
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
        object edGSMNo: TUniDBEdit
          Tag = 9
          Left = 74
          Top = 64
          Width = 225
          Height = 22
          Hint = ''
          DataField = 'gsmno'
          DataSource = dsOzOnay
          CharCase = ecUpperCase
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 3
          InputMask.Mask = '(999)9999999'
        end
        object edEMail: TUniDBEdit
          Left = 74
          Top = 88
          Width = 225
          Height = 22
          Hint = ''
          DataField = 'email'
          DataSource = dsOzOnay
          CharCase = ecLowerCase
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 4
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleLowerCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
        object edAdSoyad: TUniDBEdit
          Left = 74
          Top = 16
          Width = 225
          Height = 22
          Hint = ''
          DataField = 'ad_soyad'
          DataSource = dsOzOnay
          CharCase = ecUpperCase
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel30: TUniLabel
          Left = 11
          Top = 67
          Width = 60
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Cep Tel'
          ParentFont = False
          Font.Color = clMaroon
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 7
        end
        object UniLabel12: TUniLabel
          Left = 11
          Top = 91
          Width = 60
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'E-Mail'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 8
        end
      end
      object gbVeli: TUniGroupBox
        Left = 22
        Top = 158
        Width = 314
        Height = 122
        Hint = ''
        Caption = 'Veli / Vasi'
        TabOrder = 2
        object UniLabel17: TUniLabel
          Left = 11
          Top = 18
          Width = 60
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Ad Soyad'
          ParentFont = False
          Font.Color = clMaroon
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 5
        end
        object edVeliEmail: TUniDBEdit
          Left = 74
          Top = 88
          Width = 225
          Height = 22
          Hint = ''
          DataField = 'email2'
          DataSource = dsOzOnay
          CharCase = ecLowerCase
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 3
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleLowerCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel20: TUniLabel
          Left = 8
          Top = 92
          Width = 60
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'E-Mail'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 6
        end
        object UniLabel19: TUniLabel
          Left = 11
          Top = 67
          Width = 60
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Cep Tel'
          ParentFont = False
          Font.Color = clMaroon
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 7
        end
        object edveliGSM: TUniDBEdit
          Tag = 9
          Left = 74
          Top = 64
          Width = 225
          Height = 22
          Hint = ''
          DataField = 'gsmno2'
          DataSource = dsOzOnay
          CharCase = ecUpperCase
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 2
          InputMask.Mask = '(999)9999999'
        end
        object edVeliKimlikNo: TUniDBEdit
          Left = 74
          Top = 40
          Width = 225
          Height = 22
          Hint = ''
          DataField = 'kimlik_no2'
          DataSource = dsOzOnay
          CharCase = ecUpperCase
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel18: TUniLabel
          Left = 11
          Top = 44
          Width = 60
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Kimlik No'
          ParentFont = False
          Font.Color = clMaroon
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 8
        end
        object edveliAdSoyad: TUniDBEdit
          Left = 74
          Top = 16
          Width = 225
          Height = 22
          Hint = ''
          DataField = 'ad_soyad2'
          DataSource = dsOzOnay
          CharCase = ecUpperCase
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 0
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
      end
      object groupIYS: TUniGroupBox
        Left = 33
        Top = 420
        Width = 487
        Height = 54
        Hint = ''
        Caption = #304'YS Onaylar'#305
        TabOrder = 8
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        object edIYSSMS: TUniDBCheckBox
          Left = 12
          Top = 14
          Width = 85
          Height = 24
          Hint = ''
          DataField = 'iys_sms'
          DataSource = dsOzOnay
          ValueChecked = 'E'
          ValueUnchecked = 'H'
          Caption = '  SMS Onay'#305
          ParentFont = False
          Font.Color = clNavy
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
          ParentColor = False
          Color = clBtnFace
        end
        object edIYSPhone: TUniDBCheckBox
          Left = 98
          Top = 14
          Width = 121
          Height = 24
          Hint = ''
          DataField = 'iys_phone'
          DataSource = dsOzOnay
          ValueChecked = 'E'
          ValueUnchecked = 'H'
          Caption = '  Sesli Arama Onay'#305
          ParentFont = False
          Font.Color = clNavy
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 2
          ParentColor = False
          Color = clBtnFace
        end
        object lbIYSPhone: TUniLabel
          Left = 111
          Top = 31
          Width = 100
          Height = 8
          Hint = ''
          AutoSize = False
          Caption = ''
          ParentFont = False
          Font.Height = -7
          Font.OverrideDefaults = [ovFontHeight]
          Transparent = False
          TabOrder = 3
        end
        object lbIYSSMS: TUniLabel
          Left = 8
          Top = 31
          Width = 100
          Height = 8
          Hint = ''
          AutoSize = False
          Caption = ''
          ParentFont = False
          Font.Height = -7
          Font.OverrideDefaults = [ovFontHeight]
          Transparent = False
          TabOrder = 4
        end
        object edIYSEMail: TUniDBCheckBox
          Left = 219
          Top = 14
          Width = 126
          Height = 24
          Hint = ''
          DataField = 'iys_email'
          DataSource = dsOzOnay
          ValueChecked = 'E'
          ValueUnchecked = 'H'
          Caption = '  E-Mail G'#246'nd. Onay'#305
          ParentFont = False
          Font.Color = clNavy
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 6
          ParentColor = False
          Color = clBtnFace
        end
        object lbIYSEMail: TUniLabel
          Left = 231
          Top = 31
          Width = 100
          Height = 8
          Hint = ''
          AutoSize = False
          Caption = ''
          ParentFont = False
          Font.Height = -7
          Font.OverrideDefaults = [ovFontHeight]
          Transparent = False
          TabOrder = 7
        end
        object bIYSKontrol: TUniButton
          Left = 12
          Top = 63
          Width = 58
          Height = 26
          Hint = ''
          Visible = False
          Caption = 'Sorgula'
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 5
        end
        object btnIYSGonder: TUniButton
          Left = 362
          Top = 6
          Width = 120
          Height = 33
          Hint = ''
          Caption = #304'YS G'#246'nder'
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 8
          Images = MainMod.PrjImgList
          ImageIndex = 20
          OnClick = btnIYSGonderClick
        end
      end
      object UniLabel8: TUniLabel
        Left = 6
        Top = 296
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'A'#231#305'klama'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 18
      end
      object UniLabel13: TUniLabel
        Left = 2
        Top = 349
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Onay Ba'#287'lant'#305's'#305
        ParentFont = False
        Font.Color = clNavy
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 19
      end
      object UniLabel2: TUniLabel
        Left = 351
        Top = 127
        Width = 69
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Durum'
        ParentFont = False
        Font.Color = clMaroon
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 20
      end
      object UniLabel10: TUniLabel
        Left = 336
        Top = 151
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Tarih - Saat'
        ParentFont = False
        Font.Color = clMaroon
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 21
      end
      object UniLabel15: TUniLabel
        Left = 336
        Top = 175
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Biti'#351'/'#304'ptal Tarihi'
        ParentFont = False
        Font.Color = clMaroon
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 22
      end
      object lbSMSLog: TUniLabel
        Left = 339
        Top = 409
        Width = 109
        Height = 11
        Hint = ''
        AutoSize = False
        Caption = ''
        ParentFont = False
        Font.Height = -7
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        Transparent = False
        TabOrder = 23
      end
    end
    object pgDocs: TUniTabSheet
      Hint = ''
      Caption = 'Ekler (Belgeler)'
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object grdDocs: TUniDBGrid
        Left = 12
        Top = 31
        Width = 649
        Height = 297
        Hint = ''
        DataSource = dsARDoc
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
        WebOptions.Paged = False
        WebOptions.CustomizableCells = False
        WebOptions.FetchAll = True
        LoadMask.Message = 'Loading data...'
        EmptyText = 'Veri Bulunamad'#305
        TabOrder = 1
        Columns = <
          item
            FieldName = 'aciklama'
            Title.Caption = 'A'#231#305'klama'
            Width = 290
            Font.OverrideDefaults = [ovFontHeight]
            DisplayMemo = True
          end
          item
            FieldName = 'idt'
            Title.Caption = 'Ekleme Zaman'#305
            Width = 120
            Font.OverrideDefaults = [ovFontHeight]
            Alignment = taCenter
          end
          item
            FieldName = 'ekleyen'
            Title.Caption = 'Ekleyen'
            Width = 180
            Font.OverrideDefaults = [ovFontHeight]
            ReadOnly = True
            DisplayMemo = True
          end>
      end
      object btnDocsAdd: TUniBitBtn
        Left = 667
        Top = 31
        Width = 30
        Height = 30
        Hint = 'Departman Ekle'
        Caption = ''
        TabOrder = 2
        Images = MainMod.BtnImgList
        ImageIndex = 0
        OnClick = btnDocsAddClick
      end
      object btnDocsDel: TUniBitBtn
        Left = 667
        Top = 67
        Width = 30
        Height = 30
        Hint = 'Departman Sil'
        Caption = ''
        TabOrder = 3
        Images = MainMod.BtnImgList
        ImageIndex = 5
        OnClick = btnDocsDelClick
      end
      object btnDocsDown: TUniBitBtn
        Left = 667
        Top = 101
        Width = 30
        Height = 30
        Hint = 'Departman Sil'
        Caption = ''
        TabOrder = 4
        ScreenMask.Enabled = True
        ScreenMask.Message = 'Dok'#252'man Haz'#305'rlan'#305'yor...'
        ScreenMask.Color = 16744448
        Images = MainMod.BtnImgList
        ImageIndex = 8
        OnClick = btnDocsDownClick
      end
      object UniLabel11: TUniLabel
        Left = 12
        Top = 12
        Width = 89
        Height = 13
        Hint = ''
        Caption = 'EKLER (BELGELER)'
        ParentFont = False
        Font.Color = clMaroon
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 0
      end
    end
    object pgVeriKaynagi: TUniTabSheet
      Hint = ''
      Caption = 'Veri Kaynaklar'#305
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object UniLabel16: TUniLabel
        Left = 12
        Top = 12
        Width = 86
        Height = 13
        Hint = ''
        Caption = 'VER'#304' KAYNAKLARI'
        ParentFont = False
        Font.Color = clMaroon
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 0
      end
      object grdVK: TUniDBGrid
        Left = 12
        Top = 31
        Width = 680
        Height = 262
        Hint = ''
        DataSource = dsARVK
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
        WebOptions.Paged = False
        WebOptions.CustomizableCells = False
        WebOptions.FetchAll = True
        LoadMask.Message = 'Loading data...'
        EmptyText = 'Veri Bulunamad'#305
        TabOrder = 1
        Columns = <
          item
            FieldName = 'kaynak_str'
            Title.Caption = 'Veri Kayna'#287#305
            Width = 220
            Font.OverrideDefaults = [ovFontHeight]
            DisplayMemo = True
          end
          item
            FieldName = 'durum'
            Title.Caption = 'Durum'
            Width = 120
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'sakl_tip'
            Title.Caption = 'Saklama '#350'ekli'
            Width = 100
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'sakl_str'
            Title.Caption = 'Saklama S'#252'resi'
            Width = 150
            Font.OverrideDefaults = [ovFontHeight]
            DisplayMemo = True
          end
          item
            FieldName = 'bitis_tarihi'
            Title.Caption = 'Pln. '#304'mha Tarihi'
            Width = 128
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'imha_tarihi'
            Title.Caption = 'Gr'#231'. '#304'mha Tarihi'
            Width = 128
            Font.OverrideDefaults = [ovFontHeight]
          end>
      end
      object btnVKChange: TUniBitBtn
        Left = 12
        Top = 298
        Width = 127
        Height = 30
        Hint = ''
        Caption = 'Durum De'#287'i'#351'tir'
        TabOrder = 2
        OnClick = btnVKChangeClick
      end
      object btnVKRefresh: TUniBitBtn
        Left = 147
        Top = 298
        Width = 127
        Height = 30
        Hint = ''
        Visible = False
        Caption = 'Eksik VK G'#252'ncelle'
        TabOrder = 3
        OnClick = btnVKRefreshClick
      end
      object btnVKDelete: TUniBitBtn
        Left = 282
        Top = 298
        Width = 127
        Height = 30
        Hint = ''
        Caption = 'VK Sil'
        TabOrder = 4
        OnClick = btnVKDeleteClick
      end
      object btnVKCalcDate: TUniBitBtn
        Left = 565
        Top = 299
        Width = 127
        Height = 30
        Hint = ''
        Visible = False
        Caption = #304'mha Trh. Hesapla'
        TabOrder = 5
        OnClick = btnVKCalcDateClick
      end
    end
  end
  object dsOzOnay: TUniDataSource
    DataSet = qOzOnay
    OnStateChange = dsOzOnayStateChange
    Left = 609
    Top = 204
  end
  object qOzOnay: TUniQuery
    UpdatingTable = 'data_acikriza'
    KeyFields = 'id'
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT rz.*, ks.kisi as kisi_str, oo.tanim as oo_tanim'
      'FROM data_acikriza rz'
      
        'LEFT JOIN def_data_ozelonay oo ON oo.durum = '#39'YAYINDA'#39' AND oo.id' +
        ' = rz.oo_id'
      'LEFT JOIN def_data_kisi ks ON ks.id = rz.kisi_id'
      'WHERE rz.mc_id = 2'
      'ORDER BY rz.id'
      '')
    Left = 558
    Top = 204
  end
  object qOOTnm: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, tanim'
      'FROM def_data_ozelonay'
      'WHERE mc_id = 2'
      'ORDER BY id')
    Left = 342
    Top = 24
  end
  object dsOOTnm: TUniDataSource
    DataSet = qOOTnm
    Left = 342
    Top = 78
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    Left = 284
    Top = 173
  end
  object qARDoc: TUniQuery
    UpdatingTable = 'data_acikriza_docs'
    KeyFields = 'id'
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT ard.*, us.full_name as ekleyen'
      'FROM data_acikriza_docs ard'
      '  LEFT JOIN usr_user us ON us.id = ard.idy'
      'WHERE ard.mc_id = 2 AND ard.ar_id = :pid'
      'ORDER BY ard.id')
    CachedUpdates = True
    Left = 327
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pid'
        Value = 0
      end>
    object qARDocid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object qARDocar_id: TIntegerField
      FieldName = 'ar_id'
    end
    object qARDocmc_id: TIntegerField
      FieldName = 'mc_id'
    end
    object qARDocidy: TIntegerField
      FieldName = 'idy'
    end
    object qARDocidt: TDateTimeField
      FieldName = 'idt'
    end
    object qARDocsdy: TIntegerField
      FieldName = 'sdy'
    end
    object qARDocsdt: TDateTimeField
      FieldName = 'sdt'
    end
    object qARDocaciklama: TStringField
      FieldName = 'aciklama'
      Size = 100
    end
    object qARDocbelge_adi: TStringField
      FieldName = 'belge_adi'
      Size = 300
    end
    object qARDocbelge: TBlobField
      FieldName = 'belge'
    end
    object qARDocekleyen: TStringField
      FieldName = 'ekleyen'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Size = 30
    end
  end
  object dsARDoc: TUniDataSource
    DataSet = qARDoc
    Left = 375
    Top = 173
  end
  object qARVK: TUniQuery
    UpdatingTable = 'data_acikriza_vk'
    KeyFields = 'id'
    Connection = MainMod.DBMain
    SQL.Strings = (
      
        'SELECT vk.*, us1.full_name as ekleyen, us2.full_name as degistir' +
        'en'
      'FROM data_acikriza_vk vk'
      '  LEFT JOIN usr_user us1 ON us1.id = vk.idy'
      '  LEFT JOIN usr_user us2 ON us2.id = vk.sdy'
      'WHERE vk.mc_id = 2 and vk.ar_id = 1'
      'ORDER BY vk.kaynak_id'
      '')
    Left = 558
    Top = 255
  end
  object dsARVK: TUniDataSource
    DataSet = qARVK
    Left = 609
    Top = 255
  end
  object qAddIys: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT prc_add_iys_consent('
      '  :p_mcid::integer,'
      '  :p_idy::integer,'
      '  :p_recipient::varchar,'
      '  :p_recipienttype::varchar,'
      '  :p_status::varchar,'
      '  :p_type::varchar,'
      '  :p_consentdate::timestamp,'
      '  :p_source::varchar'
      ')')
    Left = 306
    Top = 308
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_mcid'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'p_idy'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'p_recipient'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'p_recipienttype'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'p_status'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'p_type'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftDateTime
        Name = 'p_consentdate'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'p_source'
        ParamType = ptInput
        Value = nil
      end>
  end
end
