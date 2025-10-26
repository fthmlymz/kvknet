object frmDuyuruDetay: TfrmDuyuruDetay
  Left = 0
  Top = 0
  ClientHeight = 430
  ClientWidth = 635
  Caption = 'Duyuru Detaylar'#305
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  TextHeight = 15
  object pnlData: TUniPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 430
    Hint = ''
    Align = alClient
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      635
      430)
    object btnClose: TUniBitBtn
      Left = 535
      Top = 388
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Kapat'
      Anchors = [akRight, akBottom]
      TabOrder = 1
      Images = MainMod.PrjImgList
      ImageIndex = 5
      OnClick = btnCloseClick
    end
    object htmlFrame: TUniHTMLFrame
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 627
      Height = 378
      Hint = ''
      Align = alTop
    end
  end
  object qDuyuru: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM sys_news')
    ReadOnly = True
    Left = 231
    Top = 96
  end
  object dsDuyuru: TUniDataSource
    DataSet = qDuyuru
    Left = 291
    Top = 96
  end
end
