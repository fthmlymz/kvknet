object frmDepartmanSec: TfrmDepartmanSec
  Left = 0
  Top = 0
  ClientHeight = 389
  ClientWidth = 854
  Caption = 'Departman Listesi'
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object grdList: TUniDBGrid
    Left = 0
    Top = 0
    Width = 854
    Height = 341
    Hint = ''
    DataSource = dsDepts
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
        FieldName = 'code'
        Title.Alignment = taCenter
        Title.Caption = 'Dept. Kodu'
        Width = 150
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'title'
        Title.Alignment = taCenter
        Title.Caption = 'Dept. Ad'#305
        Width = 250
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end
      item
        FieldName = 'main_dept_str'
        Title.Caption = #220'st Departman'
        Width = 250
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'active'
        Title.Alignment = taCenter
        Title.Caption = 'Aktif'
        Width = 75
        Font.OverrideDefaults = [ovFontHeight]
      end>
  end
  object UniPanel1: TUniPanel
    Left = 0
    Top = 341
    Width = 854
    Height = 48
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 504
    DesignSize = (
      854
      48)
    object btnSelect: TUniBitBtn
      Left = 742
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
      ExplicitLeft = 392
    end
    object btnCancel: TUniBitBtn
      Left = 640
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
      ExplicitLeft = 290
    end
    object edSrcText: TUniEdit
      Left = 9
      Top = 13
      Width = 275
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
  object dsDepts: TUniDataSource
    DataSet = qDepts
    Left = 345
    Top = 90
  end
  object qDepts: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM sys_deptdef'
      'ORDER BY code')
    Left = 297
    Top = 90
  end
end
