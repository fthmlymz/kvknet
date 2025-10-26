object frmKVKKMetodSec: TfrmKVKKMetodSec
  Left = 0
  Top = 0
  ClientHeight = 389
  ClientWidth = 529
  Caption = 'Metod Listesi'
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object grdList: TUniDBGrid
    Left = 0
    Top = 0
    Width = 529
    Height = 341
    Hint = ''
    TitleFont.OverrideDefaults = [ovFontHeight]
    DataSource = dsMetod
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
        FieldName = 'metod'
        Title.Alignment = taCenter
        Title.Caption = 'Metod'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 500
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end>
  end
  object UniPanel1: TUniPanel
    Left = 0
    Top = 341
    Width = 529
    Height = 48
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      529
      48)
    object btnSelect: TUniBitBtn
      Left = 426
      Top = 6
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Se'#231
      Anchors = [akTop, akRight]
      TabOrder = 2
      Images = MainMod.PrjImgList
      ImageIndex = 14
      OnClick = btnSelectClick
    end
    object btnCancel: TUniBitBtn
      Left = 324
      Top = 6
      Width = 96
      Height = 36
      Hint = ''
      Caption = #304'ptal'
      Anchors = [akTop, akRight]
      TabOrder = 3
      Images = MainMod.PrjImgList
      ImageIndex = 5
      OnClick = btnCancelClick
    end
    object edSrcText: TUniEdit
      Left = 9
      Top = 11
      Width = 309
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      TabOrder = 1
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
  end
  object dsMetod: TUniDataSource
    DataSet = qMetod
    Left = 345
    Top = 90
  end
  object qMetod: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM def_data_metod'
      'ORDER BY metod')
    Left = 297
    Top = 90
  end
end
