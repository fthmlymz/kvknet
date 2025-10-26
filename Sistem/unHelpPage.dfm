object frmHelpPage: TfrmHelpPage
  Left = 0
  Top = 0
  ClientHeight = 561
  ClientWidth = 1008
  Caption = 'Yard'#305'm'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  TextHeight = 15
  object UniHTMLFrame1: TUniHTMLFrame
    Left = 0
    Top = 0
    Width = 1008
    Height = 561
    Hint = ''
    AutoScroll = True
    Align = alClient
    ScrollHeight = 561
    ScrollWidth = 1008
  end
  object qHelp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM sys_help')
    Left = 231
    Top = 96
  end
  object dsHelp: TUniDataSource
    DataSet = qHelp
    Left = 291
    Top = 96
  end
end
