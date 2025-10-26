object frmEDanismanSecenekTanim: TfrmEDanismanSecenekTanim
  Left = 0
  Top = 0
  ClientHeight = 318
  ClientWidth = 634
  Caption = 'E-Dan'#305#351'man Se'#231'enek Detaylar'#305
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  TextHeight = 15
  object pnlData: TUniPanel
    Left = 0
    Top = 0
    Width = 634
    Height = 270
    Hint = ''
    Align = alClient
    TabOrder = 0
    Caption = ''
    object UniLabel3: TUniLabel
      Left = 3
      Top = 12
      Width = 109
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Se'#231'enek Metni'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 5
    end
    object UniLabel8: TUniLabel
      Left = 3
      Top = 188
      Width = 109
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Sonu'#231'lar / Tavsiyeler'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 6
    end
    object edSecenek: TUniMemo
      Left = 118
      Top = 12
      Width = 508
      Height = 72
      Hint = ''
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
    object edSonuc: TUniMemo
      Left = 118
      Top = 188
      Width = 508
      Height = 64
      Hint = ''
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
    object UniLabel2: TUniLabel
      Left = 3
      Top = 90
      Width = 109
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Risk Seviyesi'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 7
    end
    object edRiskSeviye: TUniComboBox
      Left = 118
      Top = 90
      Width = 145
      Hint = ''
      Style = csOwnerDrawFixed
      Text = ''
      Items.Strings = (
        '0 - R'#304'SK YOK'
        '1 - '#199'OK D'#220#350#220'K'
        '2 - D'#220#350#220'K'
        '3 - ORTA'
        '4 - Y'#220'KSEK'
        '5 - '#199'OK Y'#220'KSEK')
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
      IconItems = <>
    end
    object edRisk: TUniMemo
      Left = 118
      Top = 118
      Width = 508
      Height = 64
      Hint = ''
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 3
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
    object UniLabel4: TUniLabel
      Left = 3
      Top = 118
      Width = 109
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Riskler'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 8
    end
  end
  object pnlButtons: TUniPanel
    Left = 0
    Top = 270
    Width = 634
    Height = 48
    Hint = ''
    Align = alBottom
    TabOrder = 1
    Caption = ''
    DesignSize = (
      634
      48)
    object btnCancel: TUniBitBtn
      Left = 530
      Top = 6
      Width = 96
      Height = 36
      Hint = ''
      Caption = #304'ptal'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
      Images = MainMod.PrjImgList
      ImageIndex = 5
      OnClick = btnCancelClick
    end
    object btnOk: TUniBitBtn
      Left = 428
      Top = 6
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Tamam'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
      Images = MainMod.PrjImgList
      ImageIndex = 14
      OnClick = btnOkClick
    end
  end
end
