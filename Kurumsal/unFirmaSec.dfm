object frmFirmaSec: TfrmFirmaSec
  Left = 0
  Top = 0
  ClientHeight = 321
  ClientWidth = 504
  Caption = 'Firma Se'#231
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object UniContainerPanel4: TUniContainerPanel
    Left = 0
    Top = 273
    Width = 504
    Height = 48
    Hint = ''
    ParentColor = False
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      504
      48)
    object btnSelect: TUniBitBtn
      Left = 299
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
    end
    object btnCancel: TUniBitBtn
      Left = 401
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
    end
  end
  object grdMCList: TUniDBGrid
    Left = 0
    Top = 0
    Width = 504
    Height = 273
    Hint = ''
    DataSource = dsGCDef
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
    WebOptions.Paged = False
    LoadMask.Message = 'Loading data...'
    EmptyText = 'Kay'#305't Bulunamad'#305
    Align = alClient
    Font.OverrideDefaults = [ovFontHeight]
    ParentFont = False
    TabOrder = 1
    OnDblClick = grdMCListDblClick
    Columns = <
      item
        FieldName = 'code'
        Title.Alignment = taCenter
        Title.Caption = 'Kod'
        Width = 150
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'title'
        Title.Alignment = taCenter
        Title.Caption = #220'nvan'
        Width = 250
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end
      item
        FieldName = 'active'
        Title.Alignment = taCenter
        Title.Caption = 'Aktif'
        Width = 75
        Font.OverrideDefaults = [ovFontHeight]
        Alignment = taLeftJustify
        CheckBoxField.BooleanFieldOnly = False
        CheckBoxField.FieldValues = 'E;H'
        CheckBoxField.DisplayValues = 'EVET;HAYIR'
      end>
  end
  object dsGCDef: TUniDataSource
    DataSet = MainMod.qMCDef
    Left = 345
    Top = 90
  end
end
