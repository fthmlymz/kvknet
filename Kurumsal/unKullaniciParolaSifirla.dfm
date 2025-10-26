object frmKullaniciParolaSifirla: TfrmKullaniciParolaSifirla
  Left = 0
  Top = 0
  ClientHeight = 161
  ClientWidth = 312
  Caption = 'Kullan'#305'c'#305' Bilgileri'
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  TextHeight = 15
  object pnlData: TUniPanel
    Left = 0
    Top = 0
    Width = 312
    Height = 161
    Hint = ''
    Align = alClient
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      312
      161)
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
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
    end
    object UniLabel2: TUniLabel
      Left = 6
      Top = 41
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Kullan'#305'c'#305' Ad'#305
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
    end
    object UniLabel3: TUniLabel
      Left = 6
      Top = 66
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'E-Posta Adresi'
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 3
    end
    object edKurumKodu: TUniEdit
      Left = 97
      Top = 13
      Width = 200
      Hint = ''
      Text = ''
      TabOrder = 4
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
    object edKullaniciAdi: TUniEdit
      Left = 97
      Top = 37
      Width = 200
      Hint = ''
      Text = ''
      TabOrder = 5
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
    object edePosta: TUniEdit
      Left = 97
      Top = 61
      Width = 200
      Hint = ''
      Text = ''
      TabOrder = 6
    end
    object btnPost: TUniBitBtn
      Left = 67
      Top = 113
      Width = 128
      Height = 36
      Hint = ''
      Caption = 'Parola S'#305'f'#305'rla'
      Anchors = [akRight, akBottom]
      TabOrder = 8
      Images = MainMod.PrjImgList
      ImageIndex = 11
      OnClick = btnPostClick
    end
    object btnCancel: TUniBitBtn
      Left = 201
      Top = 113
      Width = 96
      Height = 36
      Hint = ''
      Caption = #304'ptal'
      Anchors = [akRight, akBottom]
      TabOrder = 9
      Images = MainMod.PrjImgList
      ImageIndex = 5
      OnClick = btnCancelClick
    end
    object edMailMsg: TUniMemo
      Left = 0
      Top = 133
      Width = 91
      Height = 50
      Hint = ''
      Visible = False
      Lines.Strings = (
        'edMailMsg')
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 10
      WordWrap = False
    end
    object lbCaptcha: TUniLabel
      Left = 90
      Top = 85
      Width = 104
      Height = 22
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lbCaptcha'
      ParentFont = False
      Font.Color = clRed
      Font.Height = -16
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 11
    end
    object edCaptcha: TUniEdit
      Left = 194
      Top = 85
      Width = 103
      Hint = ''
      CharCase = ecUpperCase
      MaxLength = 5
      Text = ''
      ParentFont = False
      Font.Charset = TURKISH_CHARSET
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 7
    end
    object UniLabel4: TUniLabel
      Left = 6
      Top = 89
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'G'#252'venlik Kodu'
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 12
    end
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    Left = 24
    Top = 72
  end
end
