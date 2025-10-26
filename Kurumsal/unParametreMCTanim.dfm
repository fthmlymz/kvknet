object frmParametreMCTanim: TfrmParametreMCTanim
  Left = 0
  Top = 0
  ClientHeight = 532
  ClientWidth = 719
  Caption = 'Kurum Parametreleri'
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object PgControl: TUniPageControl
    Left = 0
    Top = 0
    Width = 719
    Height = 396
    Hint = ''
    ActivePage = pgSMS
    Align = alClient
    TabOrder = 0
    object pgKurum: TUniTabSheet
      Hint = ''
      Caption = 'Kurum Bilgileri'
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      object UniLabel33: TUniLabel
        Left = 4
        Top = 25
        Width = 114
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Kurum T'#252'r'#252
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 0
      end
      object UniDBComboBox1: TUniDBComboBox
        Left = 129
        Top = 17
        Width = 145
        Height = 28
        Hint = ''
        DataField = 'kurum_turu'
        DataSource = dsMCParam
        Style = csDropDownList
        Items.Strings = (
          '00_BEL'#304'RT'#304'LMED'#304
          '01_BELED'#304'YE'
          '02_'#220'N'#304'VERS'#304'TE'
          '03_'#214'ZEL SEKT'#214'R'
          '04-KAMU')
        TabOrder = 1
        IconItems = <>
      end
      object UniLabel37: TUniLabel
        Left = 4
        Top = 52
        Width = 114
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'API Anahtar'#305
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
      end
      object edAPIPassword: TUniEdit
        Left = 129
        Top = 47
        Width = 145
        Hint = ''
        PasswordChar = '#'
        Text = ''
        TabOrder = 3
      end
      object UniLabel65: TUniLabel
        Left = 3
        Top = 76
        Width = 114
        Height = 31
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Kullan'#305'c'#305' Ayd'#305'nlatma Metni Link'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
      end
      object UniDBEdit11: TUniDBEdit
        Left = 128
        Top = 74
        Width = 455
        Height = 22
        Hint = ''
        DataField = 'kullanici_aydinlatma_link'
        DataSource = dsMCParam
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 5
      end
    end
    object pgSMS: TUniTabSheet
      Hint = ''
      Caption = 'SMS'
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      object edSMSOrijin: TUniDBEdit
        Tag = 9
        Left = 185
        Top = 123
        Width = 200
        Height = 22
        Hint = ''
        DataField = 'sms_origin'
        DataSource = dsMCParam
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
      end
      object UniLabel30: TUniLabel
        Left = 60
        Top = 130
        Width = 120
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'SMS Orijinator / Ba'#351'l'#305'k'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 8
      end
      object UniLabel1: TUniLabel
        Left = 60
        Top = 30
        Width = 120
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'SMS Sa'#287'lay'#305'c'#305
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 6
      end
      object UniLabel2: TUniLabel
        Left = 60
        Top = 55
        Width = 120
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'SMS Web Servis Adresi'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 7
      end
      object edSMSHost: TUniDBEdit
        Left = 186
        Top = 49
        Width = 200
        Height = 22
        Hint = ''
        DataField = 'sms_host'
        DataSource = dsMCParam
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
      end
      object cbSMSSaglayici: TUniDBComboBox
        Left = 186
        Top = 21
        Width = 200
        Hint = ''
        DataField = 'sms_saglayici'
        DataSource = dsMCParam
        Style = csDropDownList
        Items.Strings = (
          ''
          '3C1B'
          'AJANSWEB'
          'ANADOLUSMS'
          'ANKARABB'
          'AS'#304'STBT'
          'AS'#304'STEL'
          'BOTASSMS'
          'BOZOKSMS'
          'CALLTURKSMS'
          'CODECSMS'
          'DEB'#304'S'
          'ENERJIBAKANLIGI'
          'F'#304'NKSMS'
          'FIRATSMS'
          'GOLDSMS'
          'HAL'#304'L'#304'YEBLD'
          'ISTELKOMSMS'
          #304'ZTEK'
          'JETSMS'
          'JETTMESAJ'
          'KOB'#304'KOMSMS'
          'KONYABB'
          'MARMARASMS'
          'MOB'#304'LDEV'
          'MOB'#304'LPARK'
          'NETGSMSMS'
          'ORGAN'#304'KSMS'
          'SDUSMS'
          'SENASMS'
          'TEDASSMS'
          'TEKNOMART'
          'TTMESAJ'
          'ULASTIRMABAKANLIGI'
          'VODAFONESMS'
          'VOICETELEKOM'
          'VOICETELEKOMARDAHAN')
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        Sorted = True
        TabOrder = 0
        IconItems = <>
      end
      object UniLabel17: TUniLabel
        Left = 60
        Top = 174
        Width = 120
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'OTP aktif'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 9
      end
      object UniDBCheckBox3: TUniDBCheckBox
        Left = 186
        Top = 173
        Width = 97
        Height = 17
        Hint = ''
        DataField = 'sms_otp_aktif'
        DataSource = dsMCParam
        ValueChecked = 'E'
        ValueUnchecked = 'H'
        Caption = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 10
        ParentColor = False
        Color = clBtnFace
      end
      object UniLabel8: TUniLabel
        Left = 60
        Top = 80
        Width = 120
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'SMS Kullan'#305'c'#305'ad'#305
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 11
      end
      object UniLabel10: TUniLabel
        Left = 60
        Top = 105
        Width = 120
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'SMS Parolas'#305
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 12
      end
      object edSMSUsername: TUniDBEdit
        Tag = 9
        Left = 185
        Top = 74
        Width = 200
        Height = 22
        Hint = ''
        DataField = 'sms_username'
        DataSource = dsMCParam
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
      end
      object edSMSPassword: TUniEdit
        Left = 185
        Top = 98
        Width = 200
        Hint = ''
        PasswordChar = '#'
        Text = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
      end
      object UniLabel38: TUniLabel
        Left = 61
        Top = 155
        Width = 120
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'SMS Vendor / API Key'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 13
      end
      object UniDBEdit8: TUniDBEdit
        Tag = 9
        Left = 186
        Top = 148
        Width = 200
        Height = 22
        Hint = ''
        DataField = 'sms_apikey'
        DataSource = dsMCParam
        PasswordChar = '*'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 5
      end
    end
    object pgVeriSorumlusu: TUniTabSheet
      Hint = ''
      Caption = 'e-Mail'
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      object UniLabel13: TUniLabel
        Left = 95
        Top = 55
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'SMTP Port'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 6
      end
      object UniLabel34: TUniLabel
        Left = 95
        Top = 30
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'SMTP Host'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 10
      end
      object edVSAd: TUniDBEdit
        Left = 186
        Top = 48
        Width = 200
        Height = 22
        Hint = ''
        DataField = 'smtp_port'
        DataSource = dsMCParam
        TabOrder = 1
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object edSMTPHost: TUniDBEdit
        Left = 186
        Top = 24
        Width = 200
        Height = 22
        Hint = ''
        DataField = 'smtp_host'
        DataSource = dsMCParam
        TabOrder = 0
      end
      object edVSAdresNo: TUniDBEdit
        Left = 186
        Top = 151
        Width = 200
        Height = 22
        Hint = ''
        DataField = 'smtp_username'
        DataSource = dsMCParam
        TabOrder = 4
      end
      object UniLabel18: TUniLabel
        Left = 95
        Top = 80
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'SMTP SSL'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 7
      end
      object UniLabel20: TUniLabel
        Left = 95
        Top = 157
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'SMTP Kullan'#305'c'#305
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 8
      end
      object UniLabel21: TUniLabel
        Left = 95
        Top = 182
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'SMTP Parola'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 9
      end
      object UniDBCheckBox1: TUniDBCheckBox
        Left = 187
        Top = 76
        Width = 163
        Height = 17
        Hint = ''
        DataField = 'smtp_ssl'
        DataSource = dsMCParam
        ValueChecked = 'E'
        ValueUnchecked = 'H'
        Caption = ''
        TabOrder = 2
        ParentColor = False
        Color = clBtnFace
      end
      object edSMTPPassword: TUniEdit
        Left = 186
        Top = 176
        Width = 200
        Hint = ''
        PasswordChar = '#'
        Text = ''
        TabOrder = 5
      end
      object UniLabel26: TUniLabel
        Left = 95
        Top = 101
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'TLS Kullan'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 11
      end
      object cbSMTPUseTLS: TUniComboBox
        Left = 186
        Top = 95
        Width = 97
        Height = 28
        Hint = ''
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'No TLS'
          'Implicit TLS'
          'Require TLS'
          'Explicit TLS')
        TabOrder = 3
        IconItems = <>
      end
      object edvarsiyalangonderici: TUniDBEdit
        Left = 186
        Top = 203
        Width = 200
        Height = 22
        Hint = ''
        DataField = 'smtp_varsayilan_gonderen'
        DataSource = dsMCParam
        TabOrder = 12
      end
      object UniLabel47: TUniLabel
        Left = 16
        Top = 209
        Width = 164
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'SMTP Varsayilan G'#246'nderen'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 13
      end
      object UniLabel48: TUniLabel
        Left = 16
        Top = 131
        Width = 163
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'SMTP Kimlik Dogrulama Gerekli'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 14
      end
      object UniDBCheckBox7: TUniDBCheckBox
        Left = 186
        Top = 127
        Width = 163
        Height = 17
        Hint = ''
        DataField = 'email_auth'
        DataSource = dsMCParam
        ValueChecked = 'E'
        ValueUnchecked = 'H'
        Caption = ''
        TabOrder = 15
        ParentColor = False
        Color = clBtnFace
      end
      object UniLabel49: TUniLabel
        Left = 95
        Top = 240
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'SMPT Tip'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 16
      end
      object cbSMTPTip: TUniDBComboBox
        Left = 186
        Top = 234
        Width = 199
        Height = 28
        Hint = ''
        DataField = 'email_saglayici'
        DataSource = dsMCParam
        Style = csDropDownList
        Items.Strings = (
          'VARSAYILAN'
          'RELAY'
          #304'K'#304' A'#350'AMALI DO'#286'RULAMA')
        TabOrder = 17
        IconItems = <>
      end
    end
    object pgIYS: TUniTabSheet
      Hint = ''
      Caption = #304'YS'
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      object UniLabel3: TUniLabel
        Left = 60
        Top = 80
        Width = 120
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = #304'YS Kullan'#305'c'#305'ad'#305
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 7
      end
      object UniLabel9: TUniLabel
        Left = 60
        Top = 105
        Width = 120
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = #304'YS Parolas'#305
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 8
      end
      object UniDBEdit1: TUniDBEdit
        Tag = 9
        Left = 186
        Top = 73
        Width = 200
        Height = 22
        Hint = ''
        DataField = 'iys_username'
        DataSource = dsMCParam
        TabOrder = 2
      end
      object UniDBEdit3: TUniDBEdit
        Tag = 9
        Left = 186
        Top = 123
        Width = 200
        Height = 22
        Hint = ''
        DataField = 'iys_code'
        DataSource = dsMCParam
        TabOrder = 4
      end
      object UniLabel11: TUniLabel
        Left = 60
        Top = 130
        Width = 120
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = #304'YS Code'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 9
      end
      object UniLabel12: TUniLabel
        Left = 60
        Top = 30
        Width = 120
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = #304'YS Sa'#287'lay'#305'c'#305
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 10
      end
      object UniLabel14: TUniLabel
        Left = 60
        Top = 55
        Width = 120
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = #304'YS Web Servis Adresi'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 11
      end
      object UniDBEdit4: TUniDBEdit
        Left = 186
        Top = 48
        Width = 200
        Height = 22
        Hint = ''
        DataField = 'iys_host'
        DataSource = dsMCParam
        TabOrder = 1
      end
      object cbIysSaglayici: TUniDBComboBox
        Left = 186
        Top = 24
        Width = 200
        Height = 28
        Hint = ''
        DataField = 'iys_saglayici'
        DataSource = dsMCParam
        Style = csDropDownList
        Items.Strings = (
          ''
          'JET'#304'YS')
        TabOrder = 0
        IconItems = <>
      end
      object UniDBEdit5: TUniDBEdit
        Tag = 9
        Left = 186
        Top = 148
        Width = 200
        Height = 22
        Hint = ''
        DataField = 'iys_brandcode'
        DataSource = dsMCParam
        TabOrder = 5
      end
      object UniLabel15: TUniLabel
        Left = 60
        Top = 155
        Width = 120
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = #304'YS Brand Code'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 12
      end
      object UniLabel16: TUniLabel
        Left = 95
        Top = 175
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = #304'YS Aktif'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 13
      end
      object UniDBCheckBox2: TUniDBCheckBox
        Left = 186
        Top = 171
        Width = 97
        Height = 17
        Hint = ''
        DataField = 'iys_aktif'
        DataSource = dsMCParam
        ValueChecked = 'E'
        ValueUnchecked = 'H'
        Caption = ''
        TabOrder = 6
        ParentColor = False
        Color = clBtnFace
      end
      object edIYSPassword: TUniEdit
        Left = 186
        Top = 98
        Width = 200
        Hint = ''
        PasswordChar = '#'
        Text = ''
        TabOrder = 3
      end
    end
    object pgAR: TUniTabSheet
      Hint = ''
      Caption = 'A'#231#305'k R'#305'za'
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      object UniLabel23: TUniLabel
        Left = 16
        Top = 29
        Width = 164
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Genel AR SMS Mesaj'#305' '
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 7
      end
      object UniLabel24: TUniLabel
        Left = 15
        Top = 81
        Width = 164
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Genel AR '#304#351'lem Ba'#351'ar'#305'l'#305' Mesaj'#305' '
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 8
      end
      object UniLabel25: TUniLabel
        Left = 15
        Top = 133
        Width = 164
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Genel AR Son. Y'#246'n. Adresi'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 9
      end
      object UniDBMemo1: TUniDBMemo
        Left = 186
        Top = 29
        Width = 324
        Height = 46
        Hint = ''
        DataField = 'ar_genel_sms_mesaji'
        DataSource = dsMCParam
        TabOrder = 0
      end
      object UniDBMemo2: TUniDBMemo
        Left = 186
        Top = 81
        Width = 324
        Height = 46
        Hint = ''
        DataField = 'ar_genel_basarili_mesaji'
        DataSource = dsMCParam
        TabOrder = 1
      end
      object UniDBMemo3: TUniDBMemo
        Left = 186
        Top = 133
        Width = 324
        Height = 46
        Hint = ''
        DataField = 'ar_genel_yonlendirme_adresi'
        DataSource = dsMCParam
        TabOrder = 2
      end
      object UniLabel27: TUniLabel
        Left = 3
        Top = 194
        Width = 177
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'SMS ile do'#287'rulama'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 10
      end
      object UniDBCheckBox4: TUniDBCheckBox
        Left = 186
        Top = 194
        Width = 54
        Height = 17
        Hint = ''
        DataField = 'ar_sms_dogrulama'
        DataSource = dsMCParam
        ValueChecked = 'E'
        ValueUnchecked = 'H'
        Caption = ''
        TabOrder = 3
        ParentColor = False
        Color = clBtnFace
      end
      object UniDBCheckBox5: TUniDBCheckBox
        Left = 186
        Top = 211
        Width = 54
        Height = 17
        Hint = ''
        DataField = 'ar_email_dogrulama'
        DataSource = dsMCParam
        ValueChecked = 'E'
        ValueUnchecked = 'H'
        Caption = ''
        TabOrder = 4
        ParentColor = False
        Color = clBtnFace
      end
      object UniLabel28: TUniLabel
        Left = 3
        Top = 213
        Width = 177
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'E-Mail ile do'#287'rulama'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 11
      end
      object UniLabel35: TUniLabel
        Left = 3
        Top = 234
        Width = 177
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = #214'zel Alan 1 A'#231#305'klamas'#305
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 12
      end
      object UniLabel36: TUniLabel
        Left = 3
        Top = 259
        Width = 177
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = #214'zel Alan 2 A'#231#305'klamas'#305
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 13
      end
      object UniDBEdit6: TUniDBEdit
        Left = 186
        Top = 230
        Width = 324
        Height = 22
        Hint = ''
        DataField = 'ar_ozel_1'
        DataSource = dsMCParam
        TabOrder = 5
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniDBEdit7: TUniDBEdit
        Left = 186
        Top = 253
        Width = 324
        Height = 22
        Hint = ''
        DataField = 'ar_ozel_2'
        DataSource = dsMCParam
        TabOrder = 6
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel42: TUniLabel
        Left = 45
        Top = 288
        Width = 136
        Height = 28
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'A'#231#305'k R'#305'za Listesinde bilgileri maskele'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 14
      end
      object UniDBCheckBox6: TUniDBCheckBox
        Left = 187
        Top = 292
        Width = 54
        Height = 17
        Hint = ''
        DataField = 'ar_bilgileri_maskele'
        DataSource = dsMCParam
        ValueChecked = 'E'
        ValueUnchecked = 'H'
        Caption = ''
        TabOrder = 15
        ParentColor = False
        Color = clBtnFace
      end
    end
    object pgOO: TUniTabSheet
      Hint = ''
      Caption = #214'zel Onay'
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      object UniLabel29: TUniLabel
        Left = 16
        Top = 29
        Width = 164
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Genel '#214'O SMS Mesaj'#305' '
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
      end
      object UniLabel31: TUniLabel
        Left = 16
        Top = 81
        Width = 164
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Genel '#214'O '#304#351'lem Ba'#351'ar'#305'l'#305' Mesaj'#305' '
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
      end
      object UniLabel32: TUniLabel
        Left = 15
        Top = 133
        Width = 164
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Genel '#214'O Son. Y'#246'n. Adresi'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 5
      end
      object UniDBMemo4: TUniDBMemo
        Left = 186
        Top = 29
        Width = 324
        Height = 46
        Hint = ''
        DataField = 'oo_genel_sms_mesaji'
        DataSource = dsMCParam
        TabOrder = 0
      end
      object UniDBMemo5: TUniDBMemo
        Left = 186
        Top = 81
        Width = 324
        Height = 46
        Hint = ''
        DataField = 'oo_genel_basarili_mesaji'
        DataSource = dsMCParam
        TabOrder = 1
      end
      object UniDBMemo6: TUniDBMemo
        Left = 186
        Top = 133
        Width = 324
        Height = 46
        Hint = ''
        DataField = 'oo_genel_yonlendirme_adresi'
        DataSource = dsMCParam
        TabOrder = 2
      end
    end
    object pgZD: TUniTabSheet
      Hint = ''
      Caption = 'Zaman Damgas'#305
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      object UniLabel19: TUniLabel
        Left = 14
        Top = 106
        Width = 166
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Z.D. Kullan'#305'c'#305' Ad'#305
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 5
      end
      object UniLabel22: TUniLabel
        Left = 60
        Top = 130
        Width = 120
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Z.D. Parola'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 6
      end
      object UniDBEdit2: TUniDBEdit
        Tag = 9
        Left = 185
        Top = 99
        Width = 200
        Height = 22
        Hint = ''
        DataField = 'zd_username'
        DataSource = dsMCParam
        TabOrder = 3
      end
      object edzdPassword: TUniEdit
        Left = 185
        Top = 125
        Width = 200
        Hint = ''
        PasswordChar = '#'
        Text = ''
        TabOrder = 4
      end
      object UniLabel39: TUniLabel
        Left = 60
        Top = 27
        Width = 120
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Z.D. Sa'#287'lay'#305'c'#305
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 7
      end
      object UniDBComboBox2: TUniDBComboBox
        Left = 186
        Top = 22
        Width = 200
        Height = 28
        Hint = ''
        DataField = 'zd_saglayici'
        DataSource = dsMCParam
        Style = csDropDownList
        Items.Strings = (
          'KAMUSM'
          'E-G'#220'VEN')
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 0
        IconItems = <>
      end
      object UniLabel40: TUniLabel
        Left = 60
        Top = 53
        Width = 120
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Z.D. Web Servis Adresi'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 8
      end
      object UniDBEdit9: TUniDBEdit
        Left = 185
        Top = 47
        Width = 200
        Height = 22
        Hint = ''
        DataField = 'zd_host'
        DataSource = dsMCParam
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
      end
      object UniLabel41: TUniLabel
        Left = 61
        Top = 78
        Width = 119
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Z.D. Port'#305
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 9
      end
      object UniDBEdit10: TUniDBEdit
        Tag = 9
        Left = 185
        Top = 72
        Width = 200
        Height = 22
        Hint = ''
        DataField = 'zd_port'
        DataSource = dsMCParam
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
      end
      object btnZDKontor: TUniButton
        Left = 186
        Top = 153
        Width = 199
        Height = 36
        Hint = ''
        Caption = 'Z.D. Kont'#246'r Sorgula'
        TabOrder = 10
      end
    end
    object pgldap: TUniTabSheet
      Hint = ''
      Caption = 'LDAP'
      object cbldapturu: TUniComboBox
        Left = 128
        Top = 51
        Width = 145
        Height = 28
        Hint = ''
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'H'
          'E'
          'L'
          'KEYLOAK')
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 0
        IconItems = <>
      end
      object UniLabel43: TUniLabel
        Left = 128
        Top = 304
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'LDAP T'#252'r'#252
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
      end
      object UniLabel44: TUniLabel
        Left = 2
        Top = 87
        Width = 120
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'URL'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
      end
      object edldapurl: TUniEdit
        Left = 128
        Top = 82
        Width = 433
        Hint = ''
        Text = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
      end
      object UniLabel45: TUniLabel
        Left = 2
        Top = 112
        Width = 120
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Client ID'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
      end
      object edldapclientid: TUniEdit
        Tag = 9
        Left = 127
        Top = 107
        Width = 434
        Hint = ''
        Text = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 5
      end
      object UniLabel46: TUniLabel
        Left = 2
        Top = 137
        Width = 120
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Secret'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 6
      end
      object edldapscret: TUniEdit
        Tag = 9
        Left = 128
        Top = 132
        Width = 433
        Hint = ''
        Text = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 7
      end
      object UniPanel1: TUniPanel
        Left = 0
        Top = 229
        Width = 711
        Height = 139
        Hint = ''
        Align = alBottom
        TabOrder = 8
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        object UniLabel50: TUniLabel
          Left = 11
          Top = 24
          Width = 70
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'E :'
          ParentFont = False
          Font.Style = [fsBold]
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
        end
        object UniLabel51: TUniLabel
          Left = 11
          Top = 58
          Width = 70
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'KEYLOAK :'
          ParentFont = False
          Font.Style = [fsBold]
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 2
        end
        object UniLabel52: TUniLabel
          Left = 11
          Top = 41
          Width = 70
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'L :'
          ParentFont = False
          Font.Style = [fsBold]
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 3
        end
        object UniLabel53: TUniLabel
          Left = 11
          Top = 8
          Width = 70
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'H :'
          ParentFont = False
          Font.Style = [fsBold]
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 4
        end
        object UniLabel54: TUniLabel
          Left = 90
          Top = 41
          Width = 337
          Height = 13
          Hint = ''
          AutoSize = False
          Caption = 'OpenLDAP'
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 5
        end
        object UniLabel55: TUniLabel
          Left = 90
          Top = 109
          Width = 337
          Height = 13
          Hint = ''
          AutoSize = False
          Caption = 'Gerekiyor ise doldurulacak'
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 6
        end
        object UniLabel56: TUniLabel
          Left = 90
          Top = 24
          Width = 337
          Height = 13
          Hint = ''
          AutoSize = False
          Caption = 'LDAP Active Directory'
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 7
        end
        object UniLabel57: TUniLabel
          Left = 87
          Top = 8
          Width = 337
          Height = 13
          Hint = ''
          AutoSize = False
          Caption = 'Hay'#305'r LDAP kullan'#305'lm'#305'yor'
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 8
        end
        object UniLabel58: TUniLabel
          Left = 11
          Top = 74
          Width = 70
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'URL :'
          ParentFont = False
          Font.Style = [fsBold]
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 9
        end
        object UniLabel59: TUniLabel
          Left = 11
          Top = 91
          Width = 70
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'CLIENT ID :'
          ParentFont = False
          Font.Style = [fsBold]
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 10
        end
        object UniLabel60: TUniLabel
          Left = 10
          Top = 109
          Width = 70
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'SECRET :'
          ParentFont = False
          Font.Style = [fsBold]
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 11
        end
        object UniLabel61: TUniLabel
          Left = 90
          Top = 58
          Width = 337
          Height = 13
          Hint = ''
          AutoSize = False
          Caption = 'KEYLOAK API'
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 12
        end
        object UniLabel62: TUniLabel
          Left = 90
          Top = 75
          Width = 337
          Height = 13
          Hint = ''
          AutoSize = False
          Caption = 'LDAP Adresi'
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 13
        end
        object UniLabel63: TUniLabel
          Left = 90
          Top = 92
          Width = 337
          Height = 13
          Hint = ''
          AutoSize = False
          Caption = 'Gerekiyor ise doldurulacak'
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 14
        end
      end
      object UniLabel64: TUniLabel
        Left = 2
        Top = 58
        Width = 120
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'LDAP T'#252'r'#252
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 9
      end
    end
  end
  object pnlButtons: TUniPanel
    Left = 0
    Top = 396
    Width = 719
    Height = 136
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      719
      136)
    object pnlLog: TUniContainerPanel
      Left = 1
      Top = 1
      Width = 717
      Height = 80
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 1
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
        Left = 12
        Top = 43
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
        Left = 12
        Top = 61
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
        Top = 6
        Width = 220
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
      object lbSDY: TUniLabel
        Left = 111
        Top = 43
        Width = 220
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
        Left = 111
        Top = 61
        Width = 220
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
    object btnEdit: TUniBitBtn
      Left = 413
      Top = 91
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'De'#287'i'#351'tir'
      Anchors = [akRight, akBottom]
      TabOrder = 2
      Images = MainMod.PrjImgList
      ImageIndex = 2
      OnClick = btnEditClick
    end
    object btnPost: TUniBitBtn
      Left = 515
      Top = 91
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Kaydet'
      Anchors = [akRight, akBottom]
      TabOrder = 3
      Images = MainMod.PrjImgList
      ImageIndex = 14
      OnClick = btnPostClick
    end
    object btnCancel: TUniBitBtn
      Left = 617
      Top = 91
      Width = 96
      Height = 36
      Hint = ''
      Caption = #304'ptal'
      Anchors = [akRight, akBottom]
      TabOrder = 4
      Images = MainMod.PrjImgList
      ImageIndex = 5
      OnClick = btnCancelClick
    end
    object btnHelp: TUniBitBtn
      Left = 204
      Top = 91
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 5
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = btnHelpClick
    end
  end
  object dsMCParam: TUniDataSource
    AutoEdit = False
    DataSet = MainMod.qMCParam
    Left = 407
    Top = 345
  end
  object qsysparameter: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      
        'SELECT * FROM sys_parameter where param_val in ('#39'LDAP AKT'#304'F'#39','#39'LD' +
        'AP HOST'#39') ')
    Left = 105
    Top = 336
  end
  object dssysparameter: TUniDataSource
    AutoEdit = False
    DataSet = qsysparameter
    Left = 159
    Top = 337
  end
end
