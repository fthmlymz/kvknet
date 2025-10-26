object frmSQLLog: TfrmSQLLog
  Left = 0
  Top = 0
  ClientHeight = 600
  ClientWidth = 798
  Caption = 'KVK SQL Log'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  TextHeight = 15
  object LogMemo: TUniMemo
    Left = 0
    Top = 0
    Width = 798
    Height = 552
    Hint = ''
    Align = alClient
    ReadOnly = True
    TabOrder = 0
    WordWrap = False
  end
  object pnlButtons: TUniPanel
    Left = 0
    Top = 552
    Width = 798
    Height = 48
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      798
      48)
    object btnCancel: TUniBitBtn
      Left = 691
      Top = 6
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Kapat'
      Anchors = [akTop, akRight]
      TabOrder = 1
      Images = MainMod.PrjImgList
      ImageIndex = 5
      OnClick = btnCancelClick
    end
  end
end
