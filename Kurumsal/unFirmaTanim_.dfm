object frmFirmaTanim: TfrmFirmaTanim
  Left = 0
  Top = 0
  ClientHeight = 461
  ClientWidth = 525
  Caption = 'Veri Sorumlusu Bilgileri'
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object PgControl: TUniPageControl
    Left = 0
    Top = 0
    Width = 525
    Height = 361
    Hint = ''
    ActivePage = pgDiger
    Align = alClient
    TabOrder = 0
    object pgKurum: TUniTabSheet
      Hint = ''
      Caption = 'Veri Sorumlusu'
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      object UniLabel8: TUniLabel
        Left = 6
        Top = 65
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Ticari '#220'nvan'#305
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
      end
      object UniLabel17: TUniLabel
        Left = 262
        Top = 90
        Width = 75
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Vergi No'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 9
      end
      object UniLabel9: TUniLabel
        Left = 6
        Top = 265
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'KEP Adresi'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
      end
      object UniLabel10: TUniLabel
        Left = 6
        Top = 90
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Vergi Dairesi'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 5
      end
      object UniLabel11: TUniLabel
        Left = 6
        Top = 240
        Width = 85
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
      object UniLabel16: TUniLabel
        Left = 6
        Top = 165
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Adres No'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 8
      end
      object edUnvan: TUniDBEdit
        Tag = 9
        Left = 96
        Top = 62
        Width = 409
        Height = 22
        Hint = ''
        DataField = 'krm_unvan'
        DataSource = dsMCDef
        CharCase = ecUpperCase
        TabOrder = 17
        TabStop = False
        ReadOnly = True
      end
      object edKrmVDairesi: TUniDBEdit
        Left = 96
        Top = 87
        Width = 163
        Height = 22
        Hint = ''
        DataField = 'krm_vdairesi'
        DataSource = dsMCDef
        CharCase = ecUpperCase
        TabOrder = 18
        TabStop = False
        ReadOnly = True
      end
      object edKrmVNo: TUniDBEdit
        Left = 342
        Top = 87
        Width = 163
        Height = 22
        Hint = ''
        DataField = 'krm_vkn'
        DataSource = dsMCDef
        CharCase = ecUpperCase
        TabOrder = 19
        TabStop = False
        ReadOnly = True
      end
      object edKrmKEP: TUniDBEdit
        Tag = 9
        Left = 96
        Top = 262
        Width = 409
        Height = 22
        Hint = ''
        DataField = 'krm_kep'
        DataSource = dsMCDef
        CharCase = ecLowerCase
        TabOrder = 29
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleLowerCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object edKrmTel1: TUniDBEdit
        Tag = 9
        Left = 96
        Top = 112
        Width = 163
        Height = 22
        Hint = ''
        DataField = 'krm_telefon1'
        DataSource = dsMCDef
        CharCase = ecUpperCase
        TabOrder = 20
        InputMask.Mask = '(999)9999999'
      end
      object edKrmAdresNo: TUniDBEdit
        Left = 96
        Top = 162
        Width = 163
        Height = 22
        Hint = ''
        DataField = 'krm_adresno'
        DataSource = dsMCDef
        CharCase = ecUpperCase
        TabOrder = 24
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel30: TUniLabel
        Left = 6
        Top = 115
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Telefon 1'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 14
      end
      object UniLabel29: TUniLabel
        Left = 262
        Top = 116
        Width = 75
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Telefon 2'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 13
      end
      object edKrmEMail: TUniDBEdit
        Left = 96
        Top = 237
        Width = 409
        Height = 22
        Hint = ''
        DataField = 'krm_email'
        DataSource = dsMCDef
        CharCase = ecLowerCase
        TabOrder = 28
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleLowerCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object edKrmTel2: TUniDBEdit
        Tag = 9
        Left = 342
        Top = 112
        Width = 163
        Height = 22
        Hint = ''
        DataField = 'krm_telefon2'
        DataSource = dsMCDef
        CharCase = ecUpperCase
        TabOrder = 21
        InputMask.Mask = '(999)9999999'
      end
      object UniLabel12: TUniLabel
        Left = 6
        Top = 190
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
      object edKrmAdres1: TUniDBEdit
        Tag = 9
        Left = 96
        Top = 187
        Width = 409
        Height = 22
        Hint = ''
        DataField = 'krm_adres1'
        DataSource = dsMCDef
        CharCase = ecUpperCase
        TabOrder = 26
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object edKrmAdres2: TUniDBEdit
        Left = 96
        Top = 212
        Width = 409
        Height = 22
        Hint = ''
        DataField = 'krm_adres2'
        DataSource = dsMCDef
        CharCase = ecUpperCase
        TabOrder = 27
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel22: TUniLabel
        Left = 6
        Top = 290
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Web Adresi'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 10
      end
      object edWeb1: TUniDBEdit
        Left = 96
        Top = 287
        Width = 409
        Height = 22
        Hint = ''
        DataField = 'krm_web1'
        DataSource = dsMCDef
        CharCase = ecLowerCase
        TabOrder = 30
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleLowerCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel25: TUniLabel
        Left = 262
        Top = 167
        Width = 75
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = #350'ehir'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 11
      end
      object edSehir: TUniDBEdit
        Left = 342
        Top = 162
        Width = 163
        Height = 22
        Hint = ''
        DataField = 'krm_sehir'
        DataSource = dsMCDef
        CharCase = ecUpperCase
        TabOrder = 25
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel1: TUniLabel
        Left = 6
        Top = 15
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Kurum Kodu'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 0
      end
      object edCode: TUniDBEdit
        Tag = 9
        Left = 96
        Top = 12
        Width = 100
        Height = 22
        Hint = ''
        DataField = 'code'
        DataSource = dsMCDef
        CharCase = ecUpperCase
        TabOrder = 15
        TabStop = False
        ReadOnly = True
      end
      object UniLabel2: TUniLabel
        Left = 6
        Top = 40
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'K'#305'sa '#220'nvan'#305
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
      end
      object edTitle: TUniDBEdit
        Left = 96
        Top = 37
        Width = 271
        Height = 22
        Hint = ''
        DataField = 'title'
        DataSource = dsMCDef
        CharCase = ecUpperCase
        TabOrder = 16
        TabStop = False
        ReadOnly = True
      end
      object UniLabel3: TUniLabel
        Left = 6
        Top = 140
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Fax'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
      end
      object edFax: TUniDBEdit
        Tag = 9
        Left = 96
        Top = 137
        Width = 163
        Height = 22
        Hint = ''
        DataField = 'krm_fax'
        DataSource = dsMCDef
        CharCase = ecUpperCase
        TabOrder = 22
        InputMask.Mask = '(999)9999999'
      end
      object UniLabel27: TUniLabel
        Left = 262
        Top = 141
        Width = 75
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Mersis No'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 12
      end
      object edMersisNo: TUniDBEdit
        Left = 342
        Top = 137
        Width = 163
        Height = 22
        Hint = ''
        DataField = 'krm_mersis'
        DataSource = dsMCDef
        CharCase = ecUpperCase
        TabOrder = 23
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
    end
    object pgVeriSorumlusu: TUniTabSheet
      Hint = ''
      Caption = #304'rtibat Kurulacak Ki'#351'i'
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      object UniLabel13: TUniLabel
        Left = 6
        Top = 40
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Ad'#305
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 0
      end
      object UniLabel34: TUniLabel
        Left = 6
        Top = 15
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'TC Kimlik No'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 7
      end
      object UniLabel35: TUniLabel
        Left = 262
        Top = 40
        Width = 75
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Soyad'#305
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 8
      end
      object edVSAd: TUniDBEdit
        Left = 96
        Top = 37
        Width = 163
        Height = 22
        Hint = ''
        DataField = 'vs_ad'
        DataSource = dsMCDef
        CharCase = ecUpperCase
        TabOrder = 10
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object edVSSoyad: TUniDBEdit
        Left = 342
        Top = 37
        Width = 163
        Height = 22
        Hint = ''
        DataField = 'vs_soyad'
        DataSource = dsMCDef
        CharCase = ecUpperCase
        TabOrder = 11
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object edVSTCK: TUniDBEdit
        Left = 96
        Top = 12
        Width = 163
        Height = 22
        Hint = ''
        DataField = 'vs_tck'
        DataSource = dsMCDef
        CharCase = ecUpperCase
        TabOrder = 9
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object edVSEMail: TUniDBEdit
        Left = 96
        Top = 162
        Width = 409
        Height = 22
        Hint = ''
        DataField = 'vs_email'
        DataSource = dsMCDef
        CharCase = ecLowerCase
        TabOrder = 17
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleLowerCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object edVSTel1: TUniDBEdit
        Left = 96
        Top = 62
        Width = 163
        Height = 22
        Hint = ''
        DataField = 'vs_telefon1'
        DataSource = dsMCDef
        CharCase = ecUpperCase
        TabOrder = 12
        InputMask.Mask = '(999)9999999'
      end
      object edVSTel2: TUniDBEdit
        Left = 342
        Top = 62
        Width = 163
        Height = 22
        Hint = ''
        DataField = 'vs_telefon2'
        DataSource = dsMCDef
        CharCase = ecUpperCase
        TabOrder = 13
        InputMask.Mask = '(999)9999999'
      end
      object edVSAdresNo: TUniDBEdit
        Left = 96
        Top = 87
        Width = 163
        Height = 22
        Hint = ''
        DataField = 'vs_adresno'
        DataSource = dsMCDef
        CharCase = ecUpperCase
        TabOrder = 14
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos); '#13#10'}')
      end
      object edVSAdres1: TUniDBEdit
        Left = 96
        Top = 112
        Width = 409
        Height = 22
        Hint = ''
        DataField = 'vs_adres1'
        DataSource = dsMCDef
        CharCase = ecUpperCase
        TabOrder = 15
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object edVSAdres2: TUniDBEdit
        Left = 96
        Top = 137
        Width = 409
        Height = 22
        Hint = ''
        DataField = 'vs_adres2'
        DataSource = dsMCDef
        CharCase = ecUpperCase
        TabOrder = 16
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel14: TUniLabel
        Left = 6
        Top = 165
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'E-Mail'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
      end
      object UniLabel15: TUniLabel
        Left = 6
        Top = 190
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'KEP Adresi'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
      end
      object UniLabel18: TUniLabel
        Left = 6
        Top = 65
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Sabit Telefon'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
      end
      object UniLabel19: TUniLabel
        Left = 262
        Top = 65
        Width = 75
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Mobil Telefon'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
      end
      object UniLabel20: TUniLabel
        Left = 6
        Top = 90
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Adres No'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 5
      end
      object UniLabel21: TUniLabel
        Left = 6
        Top = 115
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Adres'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 6
      end
      object edVSKEP: TUniDBEdit
        Left = 96
        Top = 187
        Width = 409
        Height = 22
        Hint = ''
        DataField = 'vs_kep'
        DataSource = dsMCDef
        CharCase = ecLowerCase
        TabOrder = 18
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleLowerCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
    end
    object pgDiger: TUniTabSheet
      Hint = ''
      Caption = 'Di'#287'er Bilgiler'
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      object UniDBImage1: TUniDBImage
        Left = 363
        Top = 146
        Width = 128
        Height = 128
        Hint = ''
        DataField = 'krm_logo'
        DataSource = dsMCDef
        Center = False
        Stretch = True
      end
      object btnEditPic: TUniBitBtn
        Left = 363
        Top = 280
        Width = 128
        Height = 36
        Hint = ''
        Caption = 'Logo De'#287'i'#351'tir'
        TabOrder = 8
        ScreenMask.Enabled = True
        ScreenMask.Message = 'Resim Y'#252'kleniyor...'
        Images = MainMod.PrjImgList
        ImageIndex = 1
        OnClick = btnEditPicClick
      end
      object UniLabel23: TUniLabel
        Left = 6
        Top = 15
        Width = 140
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Ayd'#305'nlatma Metni (T'#252'rk'#231'e)'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 0
      end
      object edWeb2: TUniDBEdit
        Tag = 9
        Left = 152
        Top = 12
        Width = 307
        Height = 22
        Hint = ''
        DataField = 'krm_web2'
        DataSource = dsMCDef
        CharCase = ecLowerCase
        TabOrder = 3
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleLowerCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel24: TUniLabel
        Left = 6
        Top = 58
        Width = 140
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Ayd'#305'nlatma Metni ('#304'ngilizce)'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
      end
      object edWeb3: TUniDBEdit
        Tag = 9
        Left = 152
        Top = 54
        Width = 307
        Height = 22
        Hint = ''
        DataField = 'krm_web3'
        DataSource = dsMCDef
        CharCase = ecLowerCase
        TabOrder = 4
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleLowerCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel28: TUniLabel
        Left = 6
        Top = 99
        Width = 140
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Veri Sahibi Ba'#351'vuru Formu'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
      end
      object edVSBFormLink: TUniEdit
        Left = 152
        Top = 95
        Width = 307
        Hint = ''
        Text = ''
        TabOrder = 5
        TabStop = False
        ReadOnly = True
      end
      object btnGoToVSBForm: TUniBitBtn
        Left = 465
        Top = 89
        Width = 36
        Height = 36
        Hint = ''
        Caption = ''
        TabOrder = 6
        IconAlign = iaCenter
        Images = MainMod.PrjImgList
        ImageIndex = 24
        OnClick = btnGoToVSBFormClick
      end
      object btnGoToWeb2: TUniBitBtn
        Left = 465
        Top = 5
        Width = 36
        Height = 36
        Hint = ''
        Caption = ''
        TabOrder = 9
        IconAlign = iaCenter
        Images = MainMod.PrjImgList
        ImageIndex = 24
        OnClick = btnGoToWeb2Click
      end
      object btnGoToWeb3: TUniBitBtn
        Left = 465
        Top = 47
        Width = 36
        Height = 36
        Hint = ''
        Caption = ''
        TabOrder = 10
        IconAlign = iaCenter
        Images = MainMod.PrjImgList
        ImageIndex = 24
        OnClick = btnGoToWeb3Click
      end
      object UniLabel31: TUniLabel
        Left = 6
        Top = 185
        Width = 98
        Height = 13
        Hint = ''
        Caption = 'Kurum Logosu i'#231'in;'
        ParentFont = False
        Font.Color = clMaroon
        Font.Style = [fsUnderline]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 11
      end
      object UniLabel32: TUniLabel
        Left = 6
        Top = 206
        Width = 193
        Height = 13
        Hint = ''
        Caption = 'Desteklenen Formatlar : JPG veya PNG'
        ParentFont = False
        Font.Color = clMaroon
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 12
      end
      object UniLabel33: TUniLabel
        Left = 6
        Top = 224
        Width = 200
        Height = 13
        Hint = ''
        Caption = 'Desteklenen Dosya Boyutu : Max. 50 KB'
        ParentFont = False
        Font.Color = clMaroon
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 13
      end
      object UniLabel36: TUniLabel
        Left = 6
        Top = 243
        Width = 272
        Height = 13
        Hint = ''
        Caption = 'Tavsiye Edilen Ebatlar : 256x256 piksel, 128x128 piksel'
        ParentFont = False
        Font.Color = clMaroon
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 14
      end
      object UniLabel37: TUniLabel
        Left = 6
        Top = 260
        Width = 250
        Height = 13
        Hint = ''
        Caption = 'Di'#287'er ebatlarda logonuz d'#252'zg'#252'n g'#246'z'#252'kmeyebilir'
        ParentFont = False
        Font.Color = clMaroon
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 15
      end
      object imgQRCode: TUniImage
        Left = 188
        Top = 123
        Width = 64
        Height = 64
        Hint = ''
        Stretch = True
      end
      object btnQRCode: TUniBitBtn
        Left = 6
        Top = 123
        Width = 160
        Height = 36
        Hint = ''
        Caption = 'Karekodu '#304'ndir'
        TabOrder = 17
        Images = MainMod.PrjImgList
        ImageIndex = 6
        OnClick = btnQRCodeClick
      end
      object UniMenuButton1: TUniMenuButton
        Left = 6
        Top = 280
        Width = 160
        Height = 36
        Hint = ''
        DropdownMenu = menuKVKKSayfasi
        Caption = 'KVKK Sayfas'#305
        TabOrder = 18
        Images = MainMod.PrjImgList
        ImageIndex = 24
      end
    end
  end
  object pnlButtons: TUniPanel
    Left = 0
    Top = 361
    Width = 525
    Height = 100
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      525
      100)
    object pnlLog: TUniContainerPanel
      Left = 1
      Top = 1
      Width = 523
      Height = 45
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
        Left = 257
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
        Left = 257
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
        Top = 6
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
        Left = 356
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
        Left = 356
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
    object btnEdit: TUniBitBtn
      Left = 218
      Top = 56
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
      Left = 320
      Top = 56
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
      Left = 422
      Top = 56
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
    object UniBitBtn1: TUniBitBtn
      Left = 116
      Top = 56
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      Anchors = [akRight, akBottom]
      TabOrder = 5
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = UniBitBtn1Click
    end
  end
  object dsMCDef: TUniDataSource
    AutoEdit = False
    DataSet = MainMod.qMCDef
    Left = 309
    Top = 222
  end
  object FileUp: TUniFileUpload
    Filter = 'image/*'
    Title = 'Resim Y'#252'kle'
    Messages.Uploading = 'Y'#252'kleniyor...'
    Messages.PleaseWait = 'L'#252'tfen Bekleyiniz...'
    Messages.Cancel = #304'ptal'
    Messages.Processing = 'Y'#252'kleniyor...'
    Messages.UploadError = 'Y'#252'kleme Hatas'#305
    Messages.Upload = 'Y'#252'kle'
    Messages.NoFileError = 'L'#252'tfen Resim Dosyas'#305' Se'#231'iniz'
    Messages.BrowseText = 'Se'#231'...'
    Messages.UploadTimeout = 'Timeout occurred...'
    Messages.MaxSizeError = 'File is bigger than maximum allowed size'
    Messages.MaxFilesError = 'You can upload maximum %d files.'
    Width = 400
    OnCompleted = FileUpCompleted
    Left = 280
    Top = 219
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user')
    Left = 188
    Top = 304
  end
  object menuKVKKSayfasi: TUniPopupMenu
    Left = 274
    Top = 315
    object btnKVKKSayfasi: TUniMenuItem
      Caption = 'Standart KVKK Sayfas'#305' Olu'#351'tur'
      OnClick = btnKVKKSayfasiClick
    end
    object btnKVKKSayfasiDepartman: TUniMenuItem
      Caption = 'Departman KVKK Sayfas'#305' Olu'#351'tur'
      OnClick = btnKVKKSayfasiDepartmanClick
    end
  end
end
