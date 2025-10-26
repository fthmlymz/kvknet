object frmPortalSetting: TfrmPortalSetting
  Left = 0
  Top = 0
  ClientHeight = 609
  ClientWidth = 696
  Caption = 'Portal Setting'
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object pnlButtons: TUniPanel
    Left = 0
    Top = 509
    Width = 696
    Height = 100
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      696
      100)
    object pnlLog: TUniContainerPanel
      Left = 1
      Top = 1
      Width = 694
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
      Left = 389
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
      Left = 491
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
      Left = 593
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
      Left = 287
      Top = 56
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      Anchors = [akRight, akBottom]
      TabOrder = 5
      Images = MainMod.PrjImgList
      ImageIndex = 16
    end
  end
  object UniPageControl1: TUniPageControl
    Left = 0
    Top = 0
    Width = 696
    Height = 509
    Hint = ''
    ActivePage = tsportal
    Align = alClient
    TabOrder = 1
    object tsportal: TUniTabSheet
      Hint = ''
      Caption = 'Portal Ayalar'#305
      object UniDBMemo1: TUniDBMemo
        Left = 26
        Top = 318
        Width = 662
        Height = 89
        Hint = ''
        DataField = 'data_subject_application_warning_text'
        DataSource = dssysportalsetting
        TabOrder = 0
        FieldLabel = 'Veri sahibi ba'#351'vuru uyar'#305' metni'
        FieldLabelWidth = 200
        FieldLabelAlign = laRight
      end
      object UniDBCheckBox2: TUniDBCheckBox
        Left = 26
        Top = 295
        Width = 97
        Height = 17
        Hint = ''
        DataField = 'show_portal_krm_logo'
        DataSource = dssysportalsetting
        ValueChecked = 'E'
        ValueUnchecked = 'H'
        Caption = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
        ParentColor = False
        Color = clBtnFace
        FieldLabel = 'Kurum Logosunu G'#246'ster'
        FieldLabelWidth = 200
        FieldLabelAlign = laRight
      end
      object UniDBCheckBox1: TUniDBCheckBox
        Left = 26
        Top = 267
        Width = 97
        Height = 17
        Hint = ''
        DataField = 'show_ip_address'
        DataSource = dssysportalsetting
        ValueChecked = 'E'
        ValueUnchecked = 'H'
        Caption = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
        ParentColor = False
        Color = clBtnFace
        FieldLabel = 'IP Adres G'#246'ster'
        FieldLabelWidth = 200
        FieldLabelAlign = laRight
      end
      object edaltrenk: TUniDBEdit
        Left = 26
        Top = 45
        Width = 447
        Height = 22
        Hint = ''
        DataField = 'secondary_color_code'
        DataSource = dssysportalsetting
        CharCase = ecUpperCase
        TabOrder = 3
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
        FieldLabel = 'Alt Renk'
        FieldLabelWidth = 200
        FieldLabelAlign = laRight
      end
      object edanarenk: TUniDBEdit
        Left = 26
        Top = 17
        Width = 447
        Height = 22
        Hint = ''
        DataField = 'primary_color_code'
        DataSource = dssysportalsetting
        CharCase = ecUpperCase
        TabOrder = 4
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
        FieldLabel = 'Ana Renk'
        FieldLabelWidth = 200
        FieldLabelAlign = laRight
      end
      object clbalt: TUniColorButton
        Left = 479
        Top = 45
        Width = 108
        Height = 25
        Hint = ''
        Color = clBlack
        Caption = 'Se'#231
        OnSelect = clbaltSelect
      end
      object clbAna: TUniColorButton
        Left = 479
        Top = 14
        Width = 108
        Height = 25
        Hint = ''
        Color = clBlack
        Caption = 'Se'#231
        OnSelect = clbAnaSelect
      end
      object cbxKvkLogo: TUniDBCheckBox
        Left = 26
        Top = 211
        Width = 97
        Height = 17
        Hint = ''
        DataField = 'show_portal_kvknet_logo'
        DataSource = dssysportalsetting
        ValueChecked = 'E'
        ValueUnchecked = 'H'
        Caption = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 7
        ParentColor = False
        Color = clBtnFace
        FieldLabel = 'Portalda KVKNet Logosu G'#246'ster'
        FieldLabelWidth = 200
        FieldLabelAlign = laRight
      end
      object cbxPolitika: TUniDBCheckBox
        Left = 26
        Top = 100
        Width = 97
        Height = 17
        Hint = ''
        DataField = 'show_policies'
        DataSource = dssysportalsetting
        ValueChecked = 'E'
        ValueUnchecked = 'H'
        Caption = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 8
        ParentColor = False
        Color = clBtnFace
        FieldLabel = 'Politikalar'#305' G'#246'ster'
        FieldLabelWidth = 200
        FieldLabelAlign = laRight
      end
      object cbxUygulamaLogosu: TUniDBCheckBox
        Left = 26
        Top = 239
        Width = 97
        Height = 17
        Hint = ''
        DataField = 'show_application_login_kvknet_logo'
        DataSource = dssysportalsetting
        ValueChecked = 'E'
        ValueUnchecked = 'H'
        Caption = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 9
        ParentColor = False
        Color = clBtnFace
        FieldLabel = 'VSB KVKNet Logosu G'#246'ster'
        FieldLabelWidth = 200
        FieldLabelAlign = laRight
      end
      object cbxBilgiMetni: TUniDBCheckBox
        Left = 26
        Top = 128
        Width = 97
        Height = 17
        Hint = ''
        DataField = 'show_information_texts'
        DataSource = dssysportalsetting
        ValueChecked = 'E'
        ValueUnchecked = 'H'
        Caption = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 10
        ParentColor = False
        Color = clBtnFace
        FieldLabel = 'Ayd'#305'nlatma Metinlerini G'#246'ster'
        FieldLabelWidth = 200
        FieldLabelAlign = laRight
      end
      object cbxKomisyon: TUniDBCheckBox
        Left = 26
        Top = 73
        Width = 97
        Height = 17
        Hint = ''
        DataField = 'show_commission_decisions'
        DataSource = dssysportalsetting
        ValueChecked = 'E'
        ValueUnchecked = 'H'
        Caption = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 11
        ParentColor = False
        Color = clBtnFace
        FieldLabel = 'Komisyon Kararlar'#305'n'#305' G'#246'ster'
        FieldLabelWidth = 200
        FieldLabelAlign = laRight
      end
      object cbxAcikriza: TUniDBCheckBox
        Left = 26
        Top = 156
        Width = 97
        Height = 17
        Hint = ''
        DataField = 'show_explicit_consent_texts'
        DataSource = dssysportalsetting
        ValueChecked = 'E'
        ValueUnchecked = 'H'
        Caption = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 12
        ParentColor = False
        Color = clBtnFace
        FieldLabel = 'A'#231#305'k R'#305'za Metinlerini G'#246'ster'
        FieldLabelWidth = 200
        FieldLabelAlign = laRight
      end
      object cbxBasvuru: TUniDBCheckBox
        Left = 26
        Top = 184
        Width = 97
        Height = 17
        Hint = ''
        DataField = 'show_data_subject_applications'
        DataSource = dssysportalsetting
        ValueChecked = 'E'
        ValueUnchecked = 'H'
        Caption = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 13
        ParentColor = False
        Color = clBtnFace
        FieldLabel = 'Veri Sahibi Ba'#351'vurular'#305'n'#305' G'#246'ster'
        FieldLabelWidth = 200
        FieldLabelAlign = laRight
      end
    end
    object tsafis: TUniTabSheet
      Hint = ''
      Caption = 'Afi'#351' Ayarlar'#305
      object UniDBCheckBox3: TUniDBCheckBox
        Left = 42
        Top = 45
        Width = 97
        Height = 17
        Hint = ''
        DataField = 'show_afis_web_link'
        DataSource = dssysportalsetting
        ValueChecked = 'E'
        ValueUnchecked = 'H'
        Caption = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 0
        ParentColor = False
        Color = clBtnFace
        FieldLabel = 'Web Adresini G'#246'ster'
        FieldLabelWidth = 200
        FieldLabelAlign = laRight
      end
      object UniDBCheckBox4: TUniDBCheckBox
        Left = 42
        Top = 72
        Width = 97
        Height = 17
        Hint = ''
        DataField = 'show_afis_portal_link'
        DataSource = dssysportalsetting
        ValueChecked = 'E'
        ValueUnchecked = 'H'
        Caption = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
        ParentColor = False
        Color = clBtnFace
        FieldLabel = 'Portal Adresini G'#246'ster'
        FieldLabelWidth = 200
        FieldLabelAlign = laRight
      end
      object UniDBCheckBox5: TUniDBCheckBox
        Left = 42
        Top = 100
        Width = 97
        Height = 17
        Hint = ''
        DataField = 'show_afis_mail'
        DataSource = dssysportalsetting
        ValueChecked = 'E'
        ValueUnchecked = 'H'
        Caption = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
        ParentColor = False
        Color = clBtnFace
        FieldLabel = 'Mail Adresini G'#246'ster'
        FieldLabelWidth = 200
        FieldLabelAlign = laRight
      end
      object UniDBCheckBox6: TUniDBCheckBox
        Left = 42
        Top = 128
        Width = 97
        Height = 17
        Hint = ''
        DataField = 'show_afis_gsm_no'
        DataSource = dssysportalsetting
        ValueChecked = 'E'
        ValueUnchecked = 'H'
        Caption = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
        ParentColor = False
        Color = clBtnFace
        FieldLabel = 'Telefon Numaras'#305' G'#246'ster'
        FieldLabelWidth = 200
        FieldLabelAlign = laRight
      end
    end
  end
  object dssysportalsetting: TUniDataSource
    AutoEdit = False
    DataSet = MainMod.qsysPortalsetting
    Left = 301
    Top = 398
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user')
    Left = 350
    Top = 405
  end
end
