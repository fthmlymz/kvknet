object frmRiskEtkiHesaplamaAnketi: TfrmRiskEtkiHesaplamaAnketi
  Left = 0
  Top = 0
  ClientHeight = 551
  ClientWidth = 984
  Caption = 'Risk Etki  Hesaplama Belirleme Anketi'
  WindowState = wsMaximized
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  TextHeight = 15
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 984
    Height = 509
    Hint = ''
    AutoScroll = True
    Align = alClient
    TabOrder = 0
    ShowCaption = False
    Caption = ''
    ScrollHeight = 786
    ScrollWidth = 984
    ScrollY = 199
    object rgbOperasyonel: TUniRadioGroup
      AlignWithMargins = True
      Left = 4
      Top = 49
      Width = 959
      Height = 58
      Hint = ''
      Margins.Top = 10
      Items.Strings = (
        #199'ok d'#252#351#252'k (Etkilenmez).'
        'D'#252#351#252'k (Az etkilenir).'
        'Orta (Bir miktar yava'#351'lama olur).'
        'Y'#252'ksek (Ciddi i'#351' kayb'#305'na neden olur).'
        #199'ok y'#252'ksek ('#304#351'leyi'#351' tamamen durur).')
      Align = alTop
      Caption = ''
      TabOrder = 1
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      Columns = 3
      OnClick = secimChange
    end
    object rgbFinansal: TUniRadioGroup
      AlignWithMargins = True
      Left = 4
      Top = 158
      Width = 959
      Height = 66
      Hint = ''
      Margins.Top = 10
      Items.Strings = (
        #199'ok d'#252#351#252'k (Neredeyse yok).'
        'D'#252#351#252'k (Minimal kay'#305'p).'
        'Orta (Makul d'#252'zeyde kay'#305'p).'
        'Y'#252'ksek (Ciddi kay'#305'p).'
        #199'ok y'#252'ksek (Felaket d'#252'zeyde kay'#305'p).')
      Align = alTop
      Caption = ''
      TabOrder = 2
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      Columns = 3
      Vertical = False
      OnClick = secimChange
    end
    object rgbkaynak: TUniRadioGroup
      AlignWithMargins = True
      Left = 4
      Top = 517
      Width = 959
      Height = 70
      Hint = ''
      Margins.Top = 10
      Items.Strings = (
        #199'ok d'#252#351#252'k (H'#305'zla d'#252'zeltilebilir).'
        'D'#252#351#252'k (Az kaynak kullan'#305'm'#305'yla d'#252'zeltilebilir).'
        'Orta (Orta d'#252'zeyde kaynak gerekir).'
        'Y'#252'ksek (Ciddi zaman ve kaynak harcamas'#305' gerekir).'
        #199'ok y'#252'ksek (D'#252'zeltmek neredeyse imkans'#305'zd'#305'r).')
      Align = alTop
      Caption = ''
      TabOrder = 3
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      Columns = 3
      Vertical = False
      OnClick = secimChange
    end
    object UniLabel29: TUniLabel
      AlignWithMargins = True
      Left = 11
      Top = 472
      Width = 952
      Height = 13
      Hint = ''
      Margins.Left = 10
      AutoSize = False
      Caption = '5. Zaman ve Kaynak Kullan'#305'm'#305' Etkisi'
      Align = alTop
      ParentFont = False
      Font.Color = clMaroon
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      ParentColor = False
      Color = clBtnFace
      TabOrder = 4
    end
    object UniLabel1: TUniLabel
      AlignWithMargins = True
      Left = 31
      Top = 23
      Width = 932
      Height = 13
      Hint = ''
      Margins.Left = 30
      AutoSize = False
      Caption = 
        'Bu riskin ger'#231'ekle'#351'mesi durumunda g'#252'nl'#252'k operasyonlar'#305'n'#305'z'#305' veya ' +
        'i'#351'leyi'#351'inizi ne kadar etkiler?'
      Align = alTop
      ParentFont = False
      Font.Color = clDefault
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 5
    end
    object UniLabel2: TUniLabel
      AlignWithMargins = True
      Left = 11
      Top = 4
      Width = 952
      Height = 13
      Hint = ''
      Margins.Left = 10
      AutoSize = False
      Caption = '1. Operasyonel Etki'
      Align = alTop
      ParentFont = False
      Font.Color = clMaroon
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      ParentColor = False
      Color = clBtnFace
      TabOrder = 6
    end
    object UniLabel3: TUniLabel
      AlignWithMargins = True
      Left = 31
      Top = 491
      Width = 932
      Height = 13
      Hint = ''
      Margins.Left = 30
      AutoSize = False
      Caption = 
        'Bu riskin ger'#231'ekle'#351'mesi durumunda bu s'#252'reci d'#252'zeltmek i'#231'in ne ka' +
        'dar zaman ve kaynak gerekir?'
      Align = alTop
      ParentFont = False
      Font.Color = clDefault
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 7
    end
    object UniLabel4: TUniLabel
      AlignWithMargins = True
      Left = 11
      Top = 113
      Width = 952
      Height = 13
      Hint = ''
      Margins.Left = 10
      AutoSize = False
      Caption = '2. Finansal Etki'
      Align = alTop
      ParentFont = False
      Font.Color = clMaroon
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      ParentColor = False
      Color = clBtnFace
      TabOrder = 8
    end
    object UniLabel5: TUniLabel
      AlignWithMargins = True
      Left = 31
      Top = 132
      Width = 932
      Height = 13
      Hint = ''
      Margins.Left = 30
      AutoSize = False
      Caption = 
        'Bu riskin ger'#231'ekle'#351'mesi durumunda finansal kay'#305'p ne d'#252'zeyde olur' +
        '?'
      Align = alTop
      ParentFont = False
      Font.Color = clDefault
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 9
    end
    object UniLabel6: TUniLabel
      AlignWithMargins = True
      Left = 11
      Top = 230
      Width = 952
      Height = 13
      Hint = ''
      Margins.Left = 10
      AutoSize = False
      Caption = '3. Hukuki ve Reg'#252'lasyon Etkisi'
      Align = alTop
      ParentFont = False
      Font.Color = clMaroon
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      ParentColor = False
      Color = clBtnFace
      TabOrder = 10
    end
    object UniLabel7: TUniLabel
      AlignWithMargins = True
      Left = 31
      Top = 249
      Width = 932
      Height = 13
      Hint = ''
      Margins.Left = 30
      AutoSize = False
      Caption = 
        'Bu riskin ger'#231'ekle'#351'mesi durumunda hukuki sorunlarla kar'#351#305'la'#351'ma o' +
        'las'#305'l'#305#287#305'n'#305'z nedir?'
      Align = alTop
      ParentFont = False
      Font.Color = clDefault
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 11
    end
    object rgbhukuki: TUniRadioGroup
      AlignWithMargins = True
      Left = 4
      Top = 275
      Width = 959
      Height = 70
      Hint = ''
      Margins.Top = 10
      Items.Strings = (
        #199'ok d'#252#351#252'k (Hukuki sorun beklenmiyor).'
        'D'#252#351#252'k (Hafif bir hukuki risk).'
        'Orta (Hukuki riskler y'#246'netilebilir).'
        'Y'#252'ksek (Ciddi hukuki yapt'#305'r'#305'mlar olabilir).'
        #199'ok y'#252'ksek (Hukuki sorunlar b'#252'y'#252'k zarar verebilir).')
      Align = alTop
      Caption = ''
      TabOrder = 12
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      Columns = 3
      Vertical = False
      OnClick = secimChange
    end
    object UniLabel8: TUniLabel
      AlignWithMargins = True
      Left = 11
      Top = 351
      Width = 952
      Height = 13
      Hint = ''
      Margins.Left = 10
      AutoSize = False
      Caption = '4. M'#252#351'teri G'#252'veni ve '#304'tibar Etkisi'
      Align = alTop
      ParentFont = False
      Font.Color = clMaroon
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      ParentColor = False
      Color = clBtnFace
      TabOrder = 13
    end
    object UniLabel9: TUniLabel
      AlignWithMargins = True
      Left = 31
      Top = 370
      Width = 932
      Height = 13
      Hint = ''
      Margins.Left = 30
      AutoSize = False
      Caption = 
        'Bu riskin ger'#231'ekle'#351'mesi durumunda m'#252#351'teri g'#252'veni veya '#351'irket iti' +
        'bar'#305' ne kadar zarar g'#246'r'#252'r?'
      Align = alTop
      ParentFont = False
      Font.Color = clDefault
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 14
    end
    object rgbitibar: TUniRadioGroup
      AlignWithMargins = True
      Left = 4
      Top = 396
      Width = 959
      Height = 70
      Hint = ''
      Margins.Top = 10
      Items.Strings = (
        #199'ok d'#252#351#252'k (Etkilenmez).'
        'D'#252#351#252'k (Hafif itibar kayb'#305').'
        'Orta (M'#252#351'teri g'#252'veninde azalma).'
        'Y'#252'ksek (M'#252#351'terilerde ciddi g'#252'ven kayb'#305').'
        #199'ok y'#252'ksek ('#304'tibar tamamen sars'#305'l'#305'r).')
      Align = alTop
      Caption = ''
      TabOrder = 15
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      Columns = 3
      Vertical = False
      OnClick = secimChange
    end
  end
  object UniPanel2: TUniPanel
    Left = 0
    Top = 509
    Width = 984
    Height = 42
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.Color = clMaroon
    Font.Height = -16
    Font.Style = [fsBold]
    TabOrder = 1
    Caption = '____'
    object btnPost: TUniBitBtn
      AlignWithMargins = True
      Left = 755
      Top = 4
      Width = 96
      Height = 34
      Hint = ''
      Caption = 'Tamam'
      Align = alRight
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
      Images = MainMod.PrjImgList
      ImageIndex = 14
      OnClick = btnPostClick
    end
    object btnCancel: TUniBitBtn
      AlignWithMargins = True
      Left = 857
      Top = 4
      Width = 96
      Height = 34
      Hint = ''
      Margins.Right = 30
      Caption = #304'ptal'
      Align = alRight
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
      Images = MainMod.PrjImgList
      ImageIndex = 5
      OnClick = btnCancelClick
    end
  end
end
