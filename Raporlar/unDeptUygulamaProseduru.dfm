object frDeptUygulamaProseduru: TfrDeptUygulamaProseduru
  Left = 0
  Top = 0
  Width = 1047
  Height = 400
  OnCreate = UniFrameCreate
  OnDestroy = UniFrameDestroy
  TabOrder = 0
  object pnlTop: TUniPanel
    Left = 0
    Top = 0
    Width = 1047
    Height = 400
    Hint = ''
    Align = alClient
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    object pnlNav: TUniPanel
      Left = 1
      Top = 1
      Width = 1045
      Height = 96
      Hint = ''
      Align = alTop
      TabOrder = 1
      Caption = ''
      DesignSize = (
        1045
        96)
      object UniLabel3: TUniLabel
        Left = 10
        Top = 41
        Width = 82
        Height = 13
        Hint = ''
        Caption = #304'lgili Departman'
        TabOrder = 1
      end
      object edSrcDept: TUniComboBox
        Left = 98
        Top = 37
        Width = 360
        Hint = ''
        Style = csDropDownList
        Text = ''
        TabOrder = 2
        IconItems = <>
      end
      object btnSearch: TUniBitBtn
        Left = 464
        Top = 30
        Width = 96
        Height = 36
        Action = actSearch
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
        Images = MainMod.PrjImgList
      end
      object btnHelp: TUniBitBtn
        Left = 821
        Top = 30
        Width = 96
        Height = 36
        Hint = ''
        Caption = 'Yard'#305'm'
        Anchors = [akRight, akBottom]
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
        Images = MainMod.PrjImgList
        ImageIndex = 16
        OnClick = btnHelpClick
      end
      object btnClose: TUniBitBtn
        Left = 929
        Top = 30
        Width = 96
        Height = 36
        Action = actClose
        Anchors = [akRight, akBottom]
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 5
        Images = MainMod.PrjImgList
      end
    end
  end
  object ActList: TActionList
    Left = 348
    Top = 165
    object actSearch: TAction
      Caption = #304'ndir'
      OnExecute = actSearchExecute
    end
    object actClose: TAction
      Caption = 'Kapat'
      OnExecute = actCloseExecute
    end
  end
  object ppmDownload: TUniPopupMenu
    ScreenMask.Enabled = True
    ScreenMask.Message = 'Dok'#252'man Haz'#305'rlan'#305'yor...'
    ScreenMask.Color = 16744448
    Left = 409
    Top = 164
    object ppmiAydinlatmaMetni: TUniMenuItem
      Caption = 'Ayd'#305'nlatma Metni'
    end
    object ppmiAcikRizaBeyani: TUniMenuItem
      Caption = 'A'#231#305'k R'#305'za Beyan'#305
    end
    object ListeyiExceleKaydet1: TUniMenuItem
      Caption = 'Listeyi Excel'#39'e Kaydet'
    end
  end
  object DOCXRpt: TrXMLReport
    ActionAfter = aaNone
    OnUserCalc = DOCXRptUserCalc
    Left = 348
    Top = 223
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user')
    Left = 405
    Top = 222
  end
end
