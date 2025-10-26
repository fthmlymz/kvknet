object frmFonksiyonSec: TfrmFonksiyonSec
  Left = 0
  Top = 0
  ClientHeight = 285
  ClientWidth = 309
  Caption = 'Fonksiyon Listesi'
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object grdList: TUniDBGrid
    Left = 0
    Top = 0
    Width = 309
    Height = 237
    Hint = ''
    DataSource = dsFonksiyon
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
    WebOptions.Paged = False
    LoadMask.Message = 'Loading data...'
    EmptyText = 'Kay'#305't Bulunamad'#305
    Align = alClient
    Font.OverrideDefaults = [ovFontHeight]
    ParentFont = False
    TabOrder = 0
    OnDblClick = grdListDblClick
    Columns = <
      item
        FieldName = 'function'
        Title.Alignment = taCenter
        Title.Caption = 'Fonksiyon'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 300
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end>
  end
  object UniPanel1: TUniPanel
    Left = 0
    Top = 237
    Width = 309
    Height = 48
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      309
      48)
    object btnSelect: TUniBitBtn
      Left = 210
      Top = 6
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Se'#231
      Anchors = [akTop, akRight]
      TabOrder = 1
      Images = MainMod.PrjImgList
      ImageIndex = 14
      OnClick = btnSelectClick
    end
    object btnCancel: TUniBitBtn
      Left = 8
      Top = 6
      Width = 96
      Height = 36
      Hint = ''
      Caption = #304'ptal'
      Anchors = [akTop, akRight]
      TabOrder = 2
      Images = MainMod.PrjImgList
      ImageIndex = 5
      OnClick = btnCancelClick
    end
  end
  object dsFonksiyon: TUniDataSource
    DataSet = qFonksiyon
    Left = 233
    Top = 90
  end
  object qFonksiyon: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM sys_funcdef ORDER BY function')
    Left = 169
    Top = 82
  end
end
