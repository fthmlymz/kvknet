object frmRiskSurecTedbirTanim: TfrmRiskSurecTedbirTanim
  Left = 0
  Top = 0
  ClientHeight = 499
  ClientWidth = 720
  Caption = 'Risk Tedbir Tan'#305'm'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object UniPanel2: TUniPanel
    Left = 0
    Top = 0
    Width = 720
    Height = 408
    Hint = ''
    Align = alClient
    TabOrder = 0
    ShowCaption = False
    Caption = ''
    object UniPanel1: TUniPanel
      Left = 1
      Top = 1
      Width = 718
      Height = 406
      Hint = ''
      Align = alClient
      TabOrder = 1
      BorderStyle = ubsNone
      ShowCaption = False
      Caption = ''
      object cbdurum: TUniComboBox
        Left = 112
        Top = 123
        Width = 505
        Hint = ''
        Text = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
        EmptyText = 'Durum'
        CharCase = ecUpperCase
        IconItems = <>
        OnChange = Oncombochange
      end
      object UniLabel1: TUniLabel
        Left = 71
        Top = 128
        Width = 35
        Height = 13
        Hint = ''
        Caption = 'Durum'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 6
      end
      object UniLabel29: TUniLabel
        Left = 21
        Top = 67
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Tedbir A'#231#305'klama'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 7
      end
      object mmAciklama: TUniDBMemo
        Left = 112
        Top = 67
        Width = 505
        Height = 50
        Hint = ''
        DataField = 'aciklama'
        DataSource = dsdata
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
            'setSelectionRange(pos, pos);'#13#10'}')
      end
      object edTedbir: TUniDBEdit
        Left = 112
        Top = 41
        Width = 505
        Height = 22
        Hint = ''
        DataField = 'tedbir'
        DataSource = dsdata
        CharCase = ecUpperCase
        CharCaseConversion = uccTurkish
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
      end
      object UniLabel5: TUniLabel
        Left = 21
        Top = 46
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Tedbir'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 8
      end
      object UniLabel13: TUniLabel
        Left = 9
        Top = 21
        Width = 97
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Risk'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 9
      end
      object edrisk: TUniEdit
        Left = 112
        Top = 11
        Width = 505
        Hint = ''
        CharCaseConversion = uccTurkish
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
        ReadOnly = True
      end
      object UniLabel2: TUniLabel
        Left = 51
        Top = 158
        Width = 55
        Height = 13
        Hint = ''
        Caption = 'Sorumlusu'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 10
      end
      object edtarih: TUniLabel
        Left = 81
        Top = 186
        Width = 25
        Height = 13
        Hint = ''
        Caption = 'Tarih'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 11
      end
      object UniDBDateTimePicker1: TUniDBDateTimePicker
        Left = 112
        Top = 181
        Width = 155
        Height = 25
        Hint = ''
        DataField = 'tarih'
        DataSource = dsdata
        DateTime = 45616.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 5
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
      end
      object edsorumlu: TUniDBLookupComboBox
        Left = 112
        Top = 152
        Width = 506
        Hint = ''
        ListOnlyMode = lmFollowSource
        ListField = 'sorumlu'
        ListSource = dsusers
        KeyField = 'id'
        ListFieldIndex = 0
        ClearButton = True
        DataField = 'Sorumlu_id'
        DataSource = dsdata
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 12
        Color = clWindow
      end
    end
  end
  object pnlButtons: TUniPanel
    Left = 0
    Top = 408
    Width = 720
    Height = 91
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    object pnllog: TUniPanel
      Left = 1
      Top = 1
      Width = 718
      Height = 50
      Hint = ''
      Align = alTop
      TabOrder = 1
      BorderStyle = ubsNone
      ShowCaption = False
      Caption = ''
      object UniLabel10: TUniLabel
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
        TabOrder = 1
      end
      object UniLabel11: TUniLabel
        Left = 337
        Top = 5
        Width = 96
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Son De'#287'. Yapan :'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
      end
      object UniLabel12: TUniLabel
        Left = 337
        Top = 23
        Width = 96
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Son De'#287'. Zaman'#305' :'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
      end
      object UniLabel9: TUniLabel
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
        TabOrder = 4
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
        TabOrder = 5
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
        TabOrder = 6
      end
      object lbSDT: TUniLabel
        Left = 439
        Top = 24
        Width = 200
        Height = 13
        Hint = ''
        AutoSize = False
        Caption = 'lbSDT'
        ParentFont = False
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 7
      end
      object lbSDY: TUniLabel
        Left = 436
        Top = 5
        Width = 200
        Height = 13
        Hint = ''
        AutoSize = False
        Caption = 'lbSDY'
        ParentFont = False
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 8
      end
    end
    object pnlbutton: TUniPanel
      Left = 1
      Top = 51
      Width = 718
      Height = 39
      Hint = ''
      Align = alClient
      TabOrder = 2
      BorderStyle = ubsNone
      ShowCaption = False
      Caption = ''
      ExplicitTop = 44
      object btnCancel: TUniBitBtn
        AlignWithMargins = True
        Left = 612
        Top = 3
        Width = 96
        Height = 33
        Hint = ''
        Margins.Right = 10
        Caption = #304'ptal'
        Align = alRight
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabStop = False
        TabOrder = 1
        Images = MainMod.PrjImgList
        ImageIndex = 5
        OnClick = btnCancelClick
      end
      object btnHelp: TUniBitBtn
        AlignWithMargins = True
        Left = 408
        Top = 3
        Width = 96
        Height = 33
        Hint = ''
        Caption = 'Yard'#305'm'
        Align = alRight
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabStop = False
        TabOrder = 2
        Images = MainMod.PrjImgList
        ImageIndex = 16
      end
      object btnPost: TUniBitBtn
        AlignWithMargins = True
        Left = 510
        Top = 3
        Width = 96
        Height = 33
        Hint = ''
        Caption = 'Kaydet'
        Align = alRight
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
        Images = MainMod.PrjImgList
        ImageIndex = 14
        OnClick = btnPostClick
      end
    end
  end
  object qdata: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      
        'select * from def_data_risk_tedbir t where t.mc_id = 4 and t.ris' +
        'k_id = 1 and t.id=1')
    BeforePost = qdataBeforePost
    Left = 176
    Top = 248
  end
  object dsdata: TUniDataSource
    DataSet = qdata
    OnStateChange = dsdataStateChange
    Left = 224
    Top = 248
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    Left = 180
    Top = 303
  end
  object qusers: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      
        'select t.id,t.full_name sorumlu from usr_user t where t.active =' +
        #39'E'#39' and mc_id=4 order by t.full_name')
    Active = True
    Left = 316
    Top = 312
  end
  object dsusers: TUniDataSource
    DataSet = qusers
    Left = 356
    Top = 320
  end
end
