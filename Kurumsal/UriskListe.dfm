object frmRistListe: TfrmRistListe
  Left = 0
  Top = 0
  Width = 824
  Height = 400
  OnCreate = UniFrameCreate
  TabOrder = 0
  object pnlTop: TUniPanel
    Left = 0
    Top = 0
    Width = 824
    Height = 72
    Hint = ''
    Align = alTop
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      824
      72)
    object edSrcType: TUniComboBox
      Left = 96
      Top = 11
      Width = 137
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = ''
      Items.Strings = (
        ''
        'R'#304'SK')
      TabOrder = 1
      CharCase = ecUpperCase
      IconItems = <>
      OnChange = edSrcTypeChange
    end
    object edSrcText: TUniEdit
      Left = 96
      Top = 41
      Width = 198
      Height = 23
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
    object UniLabel1: TUniLabel
      Left = 12
      Top = 15
      Width = 78
      Height = 13
      Hint = ''
      Caption = 'Arama Kriterleri'
      TabOrder = 3
    end
    object btnSearch: TUniBitBtn
      Left = 309
      Top = 18
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Liste'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
      Images = MainMod.PrjImgList
      ImageIndex = 10
      OnClick = btnSearchClick
    end
    object btnClose: TUniBitBtn
      Left = 717
      Top = 18
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Kapat'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 5
      Images = MainMod.PrjImgList
      ImageIndex = 5
      OnClick = btnCloseClick
    end
    object btnAdd: TUniBitBtn
      Left = 411
      Top = 18
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yeni Kay'#305't'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 6
      Images = MainMod.PrjImgList
      ImageIndex = 18
      OnClick = actAddExecute
    end
    object btnEdit: TUniBitBtn
      Left = 513
      Top = 18
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'De'#287'i'#351'tir'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 7
      Images = MainMod.PrjImgList
      ImageIndex = 2
      OnClick = btnEditClick
    end
    object UniLabel2: TUniLabel
      Left = 14
      Top = 45
      Width = 76
      Height = 13
      Hint = ''
      Caption = 'Aranacak '#304'fade'
      TabOrder = 8
    end
    object btnHelp: TUniBitBtn
      Left = 615
      Top = 18
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 9
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = btnHelpClick
    end
    object lbKayitSayisi: TUniLabel
      Left = 300
      Top = 300
      Width = 62
      Height = 13
      Hint = ''
      Caption = 'lbKayitSayisi'
      TabOrder = 10
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 72
    Width = 824
    Height = 328
    Hint = ''
    DataSource = dsriskliste
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    WebOptions.PageSize = 125
    LoadMask.Message = 'Veriler Y'#252'kleniyor..'
    Align = alClient
    Font.OverrideDefaults = [ovFontHeight]
    ParentFont = False
    TabOrder = 1
    Columns = <
      item
        FieldName = 'risk'
        Title.Caption = 'Risk'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 500
        Font.OverrideDefaults = [ovFontHeight]
      end>
  end
  object dsriskliste: TUniDataSource
    DataSet = qriskliste
    Left = 344
    Top = 176
  end
  object qriskliste: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM def_data_Risk_tanim t where t.mc_id=2')
    Left = 400
    Top = 176
  end
  object ActList: TActionList
    Left = 257
    Top = 205
    object actAdd: TAction
      Caption = 'Yeni Kay'#305't'
      OnExecute = actAddExecute
    end
    object actEdit: TAction
      Caption = 'De'#287'i'#351'tir'
    end
    object actSearch: TAction
      Caption = 'Liste'
    end
    object actClose: TAction
      Caption = 'Kapat'
    end
  end
end
