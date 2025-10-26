object frmRiskSec: TfrmRiskSec
  Left = 0
  Top = 0
  ClientHeight = 441
  ClientWidth = 865
  Caption = 'Riskler'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object grd: TUniDBGrid
    Left = 0
    Top = 0
    Width = 865
    Height = 393
    Hint = ''
    DataSource = dsdata
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgCheckSelect, dgConfirmDelete, dgAutoRefreshRow]
    WebOptions.Paged = False
    LoadMask.Message = 'Loading data...'
    EmptyText = 'Kay'#305't Bulunamad'#305
    ForceFit = True
    Align = alClient
    Font.OverrideDefaults = [ovFontHeight]
    ParentFont = False
    TabOrder = 0
    OnDrawColumnCell = grdDrawColumnCell
    OnColumnFilter = grdColumnFilter
    Columns = <
      item
        FieldName = 'risk'
        Filtering.Enabled = True
        Filtering.Editor = fltRisk
        Title.Caption = 'Risk'
        Width = 630
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
      end
      item
        FieldName = 'uyari'
        Filtering.Enabled = True
        Filtering.Editor = fltUyari
        Title.Caption = 'Uyar'#305
        Width = 200
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        DisplayMemo = True
      end>
  end
  object UniContainerPanel4: TUniContainerPanel
    Left = 0
    Top = 393
    Width = 865
    Height = 48
    Hint = ''
    ParentColor = False
    Align = alBottom
    TabOrder = 1
    ExplicitWidth = 706
    DesignSize = (
      865
      48)
    object btnSelect: TUniBitBtn
      Left = 660
      Top = 6
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Se'#231
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
      Images = MainMod.PrjImgList
      ImageIndex = 14
      OnClick = btnSelectClick
      ExplicitLeft = 501
    end
    object btnCancel: TUniBitBtn
      Left = 762
      Top = 5
      Width = 96
      Height = 36
      Hint = ''
      Caption = #304'ptal'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
      Images = MainMod.PrjImgList
      ImageIndex = 5
      OnClick = btnCancelClick
      ExplicitLeft = 603
    end
    object btnNew: TUniBitBtn
      Left = 558
      Top = 6
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yeni Kay'#305't'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 3
      Images = MainMod.PrjImgList
      ImageIndex = 14
      OnClick = btnNewClick
      ExplicitLeft = 399
    end
  end
  object UniHiddenPanel1: TUniHiddenPanel
    Left = 437
    Top = 80
    Width = 160
    Height = 256
    Hint = ''
    Visible = True
    object fltRisk: TUniEdit
      Left = 16
      Top = 16
      Width = 129
      Hint = ''
      CharCaseConversion = uccTurkish
      CharCase = ecUpperCase
      CharEOL = #13
      Text = 'fltRisk'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
      ClearButton = True
    end
    object fltUyari: TUniComboBox
      Left = 12
      Top = 56
      Width = 145
      Hint = ''
      Text = 'fltUyari'
      Items.Strings = (
        'Se'#231'ilemez'
        'Uygun')
      TabOrder = 2
      CharCase = ecUpperCase
      ClearButton = True
      IconItems = <>
    end
  end
  object qdata: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      
        '   SELECT * FROM ( SELECT T.risk,case when r.risk is not null th' +
        'en '#39'SE'#199#304'LEMEZ'#39' else '#39'UYGUN'#39'  end AS uyari '
      '                 FROM '#9'def_data_risk_tanim '
      '                 T LEFT JOIN def_data_risk r ON r.risk = T.risk '
      '                 WHERE '#9'T.mc_id = 4) ORDER BY risk ')
    Left = 364
    Top = 144
  end
  object dsdata: TUniDataSource
    DataSet = qdata
    Left = 412
    Top = 144
  end
end
