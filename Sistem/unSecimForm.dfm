object frmSecimForm: TfrmSecimForm
  Left = 0
  Top = 0
  ClientHeight = 380
  ClientWidth = 504
  Caption = 'Se'#231'im Formu'
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  TextHeight = 15
  object grdList: TUniDBGrid
    Left = 0
    Top = 64
    Width = 504
    Height = 268
    Hint = ''
    ParentRTL = False
    TitleFont.OverrideDefaults = [ovFontHeight]
    DataSource = dsList
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow, dgDontShowSelected]
    WebOptions.Paged = False
    LoadMask.Message = 'Loading data...'
    EmptyText = 'Kay'#305't Bulunamad'#305
    ForceFit = True
    Align = alClient
    Font.OverrideDefaults = [ovFontHeight]
    ParentFont = False
    TabOrder = 0
    OnColumnSort = grdListColumnSort
    OnDblClick = grdListDblClick
    OnMultiColumnSort = grdListMultiColumnSort
    OnColumnFilter = grdListColumnFilter
    OnAfterLoad = grdListAfterLoad
    Columns = <
      item
        FieldName = 'id'
        Filtering.Enabled = True
        Filtering.Editor = fltrId
        Title.Caption = 'REF'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 125
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        DisplayMemo = True
      end
      item
        FieldName = 'value'
        Filtering.Enabled = True
        Filtering.Editor = fltrValue
        Title.Caption = 'DE'#286'ER'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 450
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        DisplayMemo = True
      end
      item
        Title.Caption = ' '
        Width = 0
        Visible = False
        DisplayMemo = True
      end>
  end
  object UniPanel1: TUniPanel
    Left = 0
    Top = 332
    Width = 504
    Height = 48
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      504
      48)
    object btnSelect: TUniBitBtn
      Left = 401
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
      Left = 299
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
  object hpnlFiltre: TUniHiddenPanel
    Left = 328
    Top = 69
    Width = 160
    Height = 211
    Hint = ''
    Visible = True
    object fltrId: TUniEdit
      Left = 17
      Top = 52
      Width = 121
      Hint = ''
      CharEOL = #13
      Text = ''
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
      EmptyText = 'Arama...'
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
    object fltrValue: TUniEdit
      Left = 18
      Top = 80
      Width = 121
      Hint = ''
      CharEOL = #13
      Text = ''
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
      EmptyText = 'Arama...'
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
  end
  object lbMesaj: TUniLabel
    Left = 0
    Top = 0
    Width = 504
    Height = 64
    Hint = ''
    AutoSize = False
    Caption = ''
    Align = alTop
    ParentFont = False
    Font.Height = -16
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 3
  end
  object vtList: TVirtualTable
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'value'
        DataType = ftString
        Size = 1000
      end>
    Left = 330
    Top = 99
    Data = {
      04000200020069640100140000000000050076616C75650100E8030000000000
      0000000000}
  end
  object dsList: TUniDataSource
    DataSet = vtList
    Left = 364
    Top = 99
  end
  object qList: TUniQuery
    Connection = MainMod.DBMain
    Filtered = True
    Left = 351
    Top = 183
  end
end
