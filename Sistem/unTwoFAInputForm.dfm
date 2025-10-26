object frmTwoFAInput: TfrmTwoFAInput
  Left = 0
  Top = 0
  ClientHeight = 430
  ClientWidth = 316
  Caption = #304'ki Fakt'#246'rl'#252' Do'#287'rulama'
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  Script.Strings = (
    'window.onresize = function(){'
    '  if (typeof frmLogin !== '#39'undefined'#39') {  '
    '    var getSize = Ext.getBody().getViewSize(),'
    '        winWidth = getSize.width,'
    '        winHeight = getSize.height,'
    '        left = (winWidth - frmLogin.window.width) / 2,'
    '        top = (winHeight - frmLogin.window.height) / 2;'
    ''
    '    frmLogin.window.setPosition(left, top);'
    '  }'
    '}')
  AlignmentControl = uniAlignmentClient
  ClientEvents.ExtEvents.Strings = (
    
      'window.afterrender=function window.afterrender(sender, eOpts)'#13#10'{' +
      #13#10'  sender.body.setStyle('#39'background-image'#39', '#39'url("files\images\' +
      'yukleme.png")'#39');'#13#10'  sender.body.setStyle('#39'background-size'#39', '#39'cov' +
      'er'#39');'#13#10'}')
  Font.OverrideDefaults = [ovFontHeight]
  Layout = 'fit'
  TextHeight = 15
  object UniPanel2: TUniPanel
    Left = 0
    Top = 273
    Width = 316
    Height = 157
    Hint = ''
    Align = alClient
    TabOrder = 1
    BorderStyle = ubsNone
    ShowCaption = False
    Caption = ''
    object btnCancel: TUniButton
      Left = 168
      Top = 101
      Width = 75
      Height = 25
      Hint = ''
      Caption = #304'ptal'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TUniButton
      Left = 68
      Top = 101
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'Tamam'
      TabOrder = 2
      OnClick = btnOKClick
    end
    object edtCode: TUniEdit
      Left = 24
      Top = 56
      Width = 268
      Height = 24
      Hint = ''
      MaxLength = 6
      Text = ''
      TabOrder = 3
      EmptyText = 'Do'#287'rulama Kodu'
      InputMask.Mask = '999999'
    end
    object lbExpire: TUniLabel
      Left = 24
      Top = 37
      Width = 157
      Height = 13
      Hint = ''
      Caption = 'Kodunuzun ge'#231'erlilik s'#252'resi : 1'
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
    end
    object lblInfo: TUniLabel
      Left = 24
      Top = 18
      Width = 175
      Height = 13
      Hint = ''
      Caption = 'L'#252'tfen Do'#287'rulama kodunu giriniz:'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 5
    end
  end
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 316
    Height = 273
    Hint = ''
    Align = alTop
    TabOrder = 0
    BorderStyle = ubsNone
    ShowCaption = False
    Caption = ''
    object imgQRCode: TUniImage
      Left = 88
      Top = 60
      Width = 150
      Height = 150
      Hint = ''
      Stretch = True
    end
  end
end
