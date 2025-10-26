object frmRiskOlasilikHesaplamaAnketi: TfrmRiskOlasilikHesaplamaAnketi
  Left = 0
  Top = 0
  ClientHeight = 551
  ClientWidth = 984
  Caption = 'Risk Olas'#305'l'#305'k  Hesaplama Belirleme Anketi'
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
    ScrollHeight = 682
    ScrollWidth = 984
    ScrollY = 95
    object rgbDeneyim: TUniRadioGroup
      AlignWithMargins = True
      Left = 4
      Top = 49
      Width = 959
      Height = 58
      Hint = ''
      Margins.Top = 10
      Items.Strings = (
        'Hi'#231' ger'#231'ekle'#351'medi.'
        #199'ok nadir ger'#231'ekle'#351'ti ('#246'rne'#287'in, y'#305'lda 1 kez).'
        'Ara s'#305'ra ger'#231'ekle'#351'ti ('#246'rne'#287'in, birka'#231' ayda bir).'
        'S'#305'kl'#305'kla ger'#231'ekle'#351'ti ('#246'rne'#287'in, ayda bir).'
        #199'ok s'#305'k ger'#231'ekle'#351'ti ('#246'rne'#287'in, haftada bir veya daha fazla)')
      Align = alTop
      Caption = ''
      TabOrder = 1
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      Columns = 3
      OnClick = secimChange
    end
    object rgbsiklik: TUniRadioGroup
      AlignWithMargins = True
      Left = 4
      Top = 158
      Width = 959
      Height = 66
      Hint = ''
      Margins.Top = 10
      Items.Strings = (
        #199'ok d'#252#351#252'k (Hata olas'#305'l'#305#287#305' neredeyse yok).'
        'D'#252#351#252'k (Hata olas'#305'l'#305#287#305' nadir).'
        'Orta (Hata olas'#305'l'#305#287#305' makul d'#252'zeyde).'
        'Y'#252'ksek (Hata olas'#305'l'#305#287#305' s'#305'k).'
        #199'ok y'#252'ksek (Hata olas'#305'l'#305#287#305' ka'#231#305'n'#305'lmaz).')
      Align = alTop
      Caption = ''
      TabOrder = 2
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      Columns = 3
      Vertical = False
      OnClick = secimChange
    end
    object rgbkullanici: TUniRadioGroup
      AlignWithMargins = True
      Left = 4
      Top = 517
      Width = 959
      Height = 70
      Hint = ''
      Margins.Top = 10
      Items.Strings = (
        #199'ok d'#252#351#252'k (Hata yapma olas'#305'l'#305#287#305' yok).'
        'D'#252#351#252'k (Hata nadiren yap'#305'l'#305'r).'
        'Orta (Hata makul d'#252'zeyde yap'#305'l'#305'r).'
        'Y'#252'ksek (Hata s'#305'k yap'#305'l'#305'r).'
        #199'ok y'#252'ksek (Hata ka'#231#305'n'#305'lmazd'#305'r).')
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
      Caption = '5. Kullan'#305'c'#305' Hatalar'#305'na Ba'#287'l'#305' Olas'#305'l'#305'k'
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
      Caption = 'Bu risk daha '#246'nce bu s'#252're'#231'te hi'#231' ger'#231'ekle'#351'ti mi?'
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
      Caption = '1. Ge'#231'mi'#351' Deneyimlere Dayal'#305' Olas'#305'l'#305'k'
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
      Caption = 'S'#252're'#231'te yer alan kullan'#305'c'#305'lar'#305'n hata yapma olas'#305'l'#305#287#305' nedir?'
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
      Caption = '2. S'#252're'#231'teki Hata Olma S'#305'kl'#305#287#305
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
        'Bu s'#252're'#231'te insan veya sistem kaynakl'#305' hata olu'#351'ma olas'#305'l'#305#287#305' nedi' +
        'r?'
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
      Caption = '3. D'#305#351' Etkenlere Ba'#287'l'#305' Olas'#305'l'#305'k'
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
        'Bu s'#252're'#231' d'#305#351' etkenlerden ('#246'rne'#287'in, altyap'#305' sorunlar'#305', tedarik zi' +
        'nciri aksakl'#305'klar'#305') ne s'#305'kl'#305'kla etkilenir?'
      Align = alTop
      ParentFont = False
      Font.Color = clDefault
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 11
    end
    object rgbdisetmen: TUniRadioGroup
      AlignWithMargins = True
      Left = 4
      Top = 275
      Width = 959
      Height = 70
      Hint = ''
      Margins.Top = 10
      Items.Strings = (
        #199'ok d'#252#351#252'k (Neredeyse hi'#231' etkilenmez).'
        'D'#252#351#252'k ('#199'ok nadir etkilenir).'
        'Orta (Ara s'#305'ra etkilenir).'
        'Y'#252'ksek (S'#305'kl'#305'kla etkilenir).'
        #199'ok y'#252'ksek (Her zaman etkilenir).')
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
      Caption = '4. Teknolojik Problemlerin Olas'#305'l'#305#287#305
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
        'Bu s'#252're'#231'te kullan'#305'lan teknolojilerin sorun '#231#305'karma olas'#305'l'#305#287#305' ned' +
        'ir?'
      Align = alTop
      ParentFont = False
      Font.Color = clDefault
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 14
    end
    object rgbteknoloji: TUniRadioGroup
      AlignWithMargins = True
      Left = 4
      Top = 396
      Width = 959
      Height = 70
      Hint = ''
      Margins.Top = 10
      Items.Strings = (
        #199'ok d'#252#351#252'k (Sorun '#231#305'kma ihtimali yok).'
        'D'#252#351#252'k (Sorun nadiren '#231#305'kar).'
        'Orta (Sorun ara s'#305'ra '#231#305'kar).'
        'Y'#252'ksek (Sorun s'#305'k'#231'a '#231#305'kar).'
        #199'ok y'#252'ksek (Sorun her zaman '#231#305'kar).')
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
