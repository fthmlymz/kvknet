object frmKVKKVeriDokumanSec: TfrmKVKKVeriDokumanSec
  Left = 0
  Top = 0
  ClientHeight = 397
  ClientWidth = 582
  Caption = 'Dok'#252'man Listesi'
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  OnCreate = UniFormCreate
  TextHeight = 15
  object grdList: TUniDBGrid
    Left = 0
    Top = 0
    Width = 582
    Height = 329
    Hint = ''
    TitleFont.OverrideDefaults = [ovFontHeight]
    DataSource = dsDocs
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
        FieldName = 'dokuman'
        Title.Alignment = taCenter
        Title.Caption = 'Dok'#252'man Ad'#305
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 550
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end>
  end
  object UniPanel1: TUniPanel
    Left = 0
    Top = 329
    Width = 582
    Height = 68
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      582
      68)
    object edSrcType: TUniComboBox
      Left = 6
      Top = 7
      Width = 358
      Hint = ''
      Style = csDropDownList
      Text = ''
      TabOrder = 1
      CharCase = ecUpperCase
      IconItems = <>
      OnChange = edSrcTypeChange
    end
    object edSrcText: TUniEdit
      Left = 6
      Top = 35
      Width = 358
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
    object btnSelect: TUniBitBtn
      Left = 474
      Top = 15
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
      Left = 372
      Top = 15
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
  end
  object dsDocs: TUniDataSource
    DataSet = qDocs
    Left = 345
    Top = 90
  end
  object qDocs: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM def_data_dokuman'
      'ORDER BY dokuman')
    Left = 297
    Top = 90
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT dokumantip FROM def_data_dokumantip'
      'WHERE mc_id = 2'
      'ORDER BY dokumantip')
    Left = 297
    Top = 147
  end
end
