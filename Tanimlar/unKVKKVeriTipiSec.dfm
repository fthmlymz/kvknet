object frmKVKKVeriTipiSec: TfrmKVKKVeriTipiSec
  Left = 0
  Top = 0
  ClientHeight = 389
  ClientWidth = 606
  Caption = 'Veri Tipi Listesi'
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  OnCreate = UniFormCreate
  TextHeight = 15
  object grdList: TUniDBGrid
    Left = 0
    Top = 0
    Width = 606
    Height = 321
    Hint = ''
    TitleFont.OverrideDefaults = [ovFontHeight]
    DataSource = dsVeriTipi
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
    WebOptions.Paged = False
    LoadMask.Message = 'Loading data...'
    EmptyText = 'Kay'#305't Bulunamad'#305
    Align = alClient
    Font.OverrideDefaults = [ovFontHeight]
    ParentFont = False
    TabOrder = 0
    OnDblClick = grdListDblClick
    OnDrawColumnCell = grdListDrawColumnCell
    Columns = <
      item
        FieldName = 'veri_tipi'
        Title.Alignment = taCenter
        Title.Caption = 'Veri Tipi'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 300
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end
      item
        FieldName = 'kategori'
        Title.Alignment = taCenter
        Title.Caption = 'Kategori'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 300
        Font.OverrideDefaults = [ovFontHeight]
      end>
  end
  object UniPanel1: TUniPanel
    Left = 0
    Top = 321
    Width = 606
    Height = 68
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      606
      68)
    object btnSelect: TUniBitBtn
      Left = 457
      Top = 14
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Se'#231
      Anchors = [akTop, akRight]
      TabOrder = 3
      Images = MainMod.PrjImgList
      ImageIndex = 14
      OnClick = btnSelectClick
    end
    object btnCancel: TUniBitBtn
      Left = 355
      Top = 14
      Width = 96
      Height = 36
      Hint = ''
      Caption = #304'ptal'
      Anchors = [akTop, akRight]
      TabOrder = 4
      Images = MainMod.PrjImgList
      ImageIndex = 5
      OnClick = btnCancelClick
    end
    object edSrcText: TUniEdit
      Left = 6
      Top = 35
      Width = 343
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      TabOrder = 2
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}'
        
          'keypress=function keypress(sender, e, eOpts)'#13#10'{'#13#10'   if (e.getKey' +
          '() == 13)'#13#10'   {'#13#10'      ajaxRequest(sender, '#39'doSearch'#39', ["aText="' +
          '+sender.getValue()]);'#13#10'   };'#13#10'}')
      OnAjaxEvent = edSrcTextAjaxEvent
    end
    object edSrcType: TUniComboBox
      Left = 6
      Top = 7
      Width = 343
      Hint = ''
      Style = csDropDownList
      Text = ''
      TabOrder = 1
      CharCase = ecUpperCase
      IconItems = <>
      OnChange = edSrcTypeChange
    end
  end
  object dsVeriTipi: TUniDataSource
    DataSet = qVeriTipi
    Left = 345
    Top = 90
  end
  object qVeriTipi: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM def_data_veritipi'
      'ORDER BY veri_tipi')
    Left = 297
    Top = 90
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT kategori FROM def_data_kategori'
      'WHERE mc_id = 2'
      'ORDER BY kategori')
    Left = 297
    Top = 147
  end
end
