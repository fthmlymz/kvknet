object frmRolTanim: TfrmRolTanim
  Left = 0
  Top = 0
  ClientHeight = 521
  ClientWidth = 749
  Caption = 'Rol Bilgileri'
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  OnCreate = UniFormCreate
  TextHeight = 15
  object pnlData: TUniPanel
    Left = 0
    Top = 0
    Width = 749
    Height = 385
    Hint = ''
    Align = alClient
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      749
      385)
    object UniLabel2: TUniLabel
      Left = 5
      Top = 15
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Rol Ad'#305
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
    end
    object edRole: TUniDBEdit
      Left = 96
      Top = 12
      Width = 271
      Height = 22
      Hint = ''
      DataField = 'rol'
      DataSource = dsRole
      CharCase = ecUpperCase
      TabOrder = 2
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
    object grdPerms: TUniDBTreeGrid
      Left = 11
      Top = 66
      Width = 735
      Height = 313
      Hint = ''
      DataSource = dsPerms
      ClientEvents.ExtEvents.Strings = (
        
          'cellkeydown=function cellkeydown(sender, td, cellIndex, record, ' +
          'tr, rowIndex, e, eOpts)'#13#10'{'#13#10'    if (e.keyCode == 32)'#13#10'    {'#13#10'   ' +
          '   ajaxRequest(this, '#39'_myKeyEvent'#39', []); //{ keycode: e.keyCode ' +
          '} );'#13#10'    };'#13#10'}')
      ClientEvents.UniEvents.Strings = (
        
          'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'  var me = se' +
          'nder;'#13#10'  me.expandSelectedNode = function()'#13#10'  {'#13#10'     var _sele' +
          'ction = me.getSelectionModel().getSelection()[0];'#13#10'     if (_sel' +
          'ection)'#13#10'     {'#13#10'        _selection.cascadeBy'#13#10'        ('#13#10'      ' +
          '     function(node) {node.expand();}'#13#10'        )'#13#10'     }'#13#10'  };'#13#10' ' +
          ' me.collapseSelectedNode = function()'#13#10'  {'#13#10'     var _selection ' +
          '= me.getSelectionModel().getSelection()[0];'#13#10'     if (_selection' +
          ')'#13#10'     {'#13#10'        _selection.cascadeBy'#13#10'        ('#13#10'           f' +
          'unction(node) {node.collapse();}'#13#10'        )'#13#10'     }'#13#10'  };'#13#10'  me.' +
          'expcolSelectedNode = function()'#13#10'  {'#13#10'     var _selection = me.g' +
          'etSelectionModel().getSelection()[0];'#13#10'     if (_selection)'#13#10'   ' +
          '  {'#13#10'        _selection.cascadeBy'#13#10'        ('#13#10'           functio' +
          'n(node)'#13#10'           {'#13#10'              if (node.data.expanded) { n' +
          'ode.collapse(); }'#13#10'              else { node.expand(); }'#13#10'      ' +
          '     }'#13#10'        )'#13#10'     }'#13#10'  };'#13#10'}')
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 3
      LoadMask.Message = 'Loading data...'
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
      IdParentField = 'parent_id'
      IdField = 'id'
      OnDblClick = grdPermsDblClick
      OnFieldImage = grdPermsFieldImage
      OnAjaxEvent = grdPermsAjaxEvent
      Columns = <
        item
          FieldName = 'perm_def'
          Title.Caption = 'Tan'#305'm'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 300
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'perm_data'
          Title.Caption = 'Yetki'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 60
          Font.OverrideDefaults = [ovFontHeight]
          ImageOptions.Visible = True
          ImageOptions.Width = 16
          ImageOptions.Height = 16
        end
        item
          FieldName = 'perm_id'
          Title.Caption = 'Yetki No'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 60
          Visible = False
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'perm_note'
          Title.Caption = 'A'#231#305'klama'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 350
          Font.OverrideDefaults = [ovFontHeight]
        end>
    end
    object UniLabel1: TUniLabel
      Left = 8
      Top = 48
      Width = 43
      Height = 13
      Hint = ''
      Caption = 'YETK'#304'LER'
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
    end
    object imgGrant: TUniImage
      Left = 420
      Top = 12
      Width = 20
      Height = 20
      Hint = ''
      Visible = False
      Picture.Data = {
        07544269746D617036040000424D360400000000000036000000280000001000
        0000100000000100200000000000000400000000000000000000000000000000
        0000000000000061210000612100006121000061210000612100006121000061
        2100006121000061210000612100006121000061210000612100006121000061
        2100000000000061210000C7210000C7210000C7210000C7210000C7210000C7
        210000C7210000C7210000C7210000C7210000C7210000C7210000C721000061
        2100000000000061210000C7210000C7210000C7210000C7210000C7210000C7
        210000C7210000C7210000C7210000C7210000C7210000C7210000C721000061
        2100000000000061210000C7210000C7210000C7210000C7210000C7210000C7
        210000C7210000C7210000C7210000C7210000C7210000C7210000C721000061
        2100000000000061210000C7210000C7210000C7210000C7210000C7210000FF
        000000C7210000C7210000C7210000C7210000C7210000C7210000C721000061
        2100000000000061210000C7210000C7210000C7210000C72100FFFFFF00FFFF
        FF0000FF000000C7210000C7210000C7210000C7210000C7210000C721000061
        2100000000000061210000C7210000C7210000C72100FFFFFF00FFFFFF00F7FF
        FF00FFFFFF0000FF000000C7210000C7210000C7210000C7210000C721000061
        2100000000000061210000C7210000FF0000F7FFFF00FFFFFF0000FF000000FF
        0000F7FFFF00FFFFFF0000FF000000C7210000C7210000C7210000C721000061
        21000000000000612100A8FFA800F7FFFF00F7FFFF00A8FFA80000C7210000C7
        210000FF0000F7FFFF00FFFFFF00A8FFA80000C7210000C7210000C721000061
        2100000000000061210000C7210000C7210000C7210000C7210000C7210000C7
        210000C7210000C72100FFFFFF00FFFFFF00A8FFA80000C7210000C721000061
        2100000000000061210000C7210000C7210000C7210000C7210000C7210000C7
        210000C7210000C7210000C72100FFFFFF00FFFFFF00A8FFA80000C721000061
        2100000000000061210000C7210000C7210000C7210000C7210000C7210000C7
        210000C7210000C7210000C7210000C7210000C7210000C7210000C721000061
        2100000000000061210000C7210000C7210000C7210000C7210000C7210000C7
        210000C7210000C7210000C7210000C7210000C7210000C7210000C721000061
        2100000000000061210000C7210000C7210000C7210000C7210000C7210000C7
        210000C7210000C7210000C7210000C7210000C7210000C7210000C721000061
        2100000000000061210000612100006121000061210000612100006121000061
        2100006121000061210000612100006121000061210000612100006121000061
        2100000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000}
    end
    object imgReject: TUniImage
      Left = 457
      Top = 12
      Width = 20
      Height = 20
      Hint = ''
      Visible = False
      Picture.Data = {
        07544269746D617036040000424D360400000000000036000000280000001000
        0000100000000100200000000000000400000000000000000000000000000000
        0000000000000000840000008400000084000000840000008400000084000000
        8400000084000000840000008400000084000000840000008400000084000000
        840000000000000084000020E7000020E7000020E7000020E7000020E7000020
        E7000020E7000020E7000020E7000020E7000020E7000020E7000020E7000000
        840000000000000084000020E7000020E7000020E7000020E7000020E7000020
        E7000020E7000020E7000020E7000020E7000020E7000020E7000020E7000000
        840000000000000084000020E7000020E700FFFFFF00FFFFFF000020E7000020
        E7000020E7000020E7000020E700FFFFFF00FFFFFF000020E7000020E7000000
        840000000000000084000020E7000020E700FFFFFF00FFFFFF00FFFFFF000020
        E7000020E7000020E700FFFFFF00FFFFFF00FFFFFF000020E7000020E7000000
        840000000000000084000020E7000020E7000020E700FFFFFF00FFFFFF00FFFF
        FF000020E700FFFFFF00FFFFFF00FFFFFF000020E7000020E7000020E7000000
        840000000000000084000020E7000020E7000020E7000020E700FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF000020E7000020E7000020E7000020E7000000
        840000000000000084000020E7000020E7000020E7000020E7000020E700FFFF
        FF00FFFFFF00FFFFFF000020E7000020E7000020E7000020E7000020E7000000
        840000000000000084000020E7000020E7000020E7000020E700FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF000020E7000020E7000020E7000020E7000000
        840000000000000084000020E7000020E7000020E700FFFFFF00FFFFFF00FFFF
        FF000020E700FFFFFF00FFFFFF00FFFFFF000020E7000020E7000020E7000000
        840000000000000084000020E7000020E700FFFFFF00FFFFFF00FFFFFF000020
        E7000020E7000020E700FFFFFF00FFFFFF00FFFFFF000020E7000020E7000000
        840000000000000084000020E7000020E700FFFFFF00FFFFFF000020E7000020
        E7000020E7000020E7000020E700FFFFFF00FFFFFF000020E7000020E7000000
        840000000000000084000020E7000020E7000020E7000020E7000020E7000020
        E7000020E7000020E7000020E7000020E7000020E7000020E7000020E7000000
        840000000000000084000020E7000020E7000020E7000020E7000020E7000020
        E7000020E7000020E7000020E7000020E7000020E7000020E7000020E7000000
        8400000000000000840000008400000084000000840000008400000084000000
        8400000084000000840000008400000084000000840000008400000084000000
        8400000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000}
    end
  end
  object pnlButtons: TUniPanel
    Left = 0
    Top = 385
    Width = 749
    Height = 136
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      749
      136)
    object btnCancel: TUniBitBtn
      Left = 645
      Top = 91
      Width = 96
      Height = 36
      Hint = ''
      Caption = #304'ptal'
      Anchors = [akRight, akBottom]
      TabOrder = 2
      Images = MainMod.PrjImgList
      ImageIndex = 5
      OnClick = btnCancelClick
    end
    object btnPost: TUniBitBtn
      Left = 543
      Top = 91
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Kaydet'
      Anchors = [akRight, akBottom]
      TabOrder = 1
      Images = MainMod.PrjImgList
      ImageIndex = 14
      OnClick = btnPostClick
    end
    object pnlLog: TUniContainerPanel
      Left = 1
      Top = 1
      Width = 747
      Height = 80
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 3
      object UniLabel4: TUniLabel
        Left = 12
        Top = 6
        Width = 96
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = #304'lk Kay'#305't Yapan :'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
      end
      object UniLabel5: TUniLabel
        Left = 12
        Top = 24
        Width = 96
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = #304'lk Kay'#305't Zaman'#305' :'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
      end
      object UniLabel6: TUniLabel
        Left = 12
        Top = 43
        Width = 96
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Son De'#287'. Yapan :'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
      end
      object UniLabel7: TUniLabel
        Left = 12
        Top = 61
        Width = 96
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Son De'#287'. Zaman'#305' :'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
      end
      object lbIDY: TUniLabel
        Left = 111
        Top = 5
        Width = 220
        Height = 13
        Hint = ''
        AutoSize = False
        Caption = 'lbIDY'
        ParentFont = False
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 5
      end
      object lbIDT: TUniLabel
        Left = 111
        Top = 24
        Width = 220
        Height = 13
        Hint = ''
        AutoSize = False
        Caption = 'lbIDT'
        ParentFont = False
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 6
      end
      object lbSDY: TUniLabel
        Left = 111
        Top = 43
        Width = 220
        Height = 13
        Hint = ''
        AutoSize = False
        Caption = 'lbSDY'
        ParentFont = False
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 7
      end
      object lbSDT: TUniLabel
        Left = 111
        Top = 61
        Width = 220
        Height = 13
        Hint = ''
        AutoSize = False
        Caption = 'lbSDT'
        ParentFont = False
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 8
      end
    end
    object btnHelp: TUniBitBtn
      Left = 13
      Top = 91
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = btnHelpClick
    end
  end
  object dsRole: TUniDataSource
    DataSet = MainMod.qRole
    Left = 243
    Top = 9
  end
  object qPerms: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM sys_permission'
      'ORDER BY id, parent_id')
    OnCalcFields = qPermsCalcFields
    Left = 195
    Top = 147
    object qPermsid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object qPermsparent_id: TIntegerField
      FieldName = 'parent_id'
    end
    object qPermsperm_type: TStringField
      FieldName = 'perm_type'
      Size = 5
    end
    object qPermsperm_id: TIntegerField
      FieldName = 'perm_id'
    end
    object qPermsperm_def: TStringField
      FieldName = 'perm_def'
      Size = 30
    end
    object qPermsperm_note: TStringField
      FieldName = 'perm_note'
      Size = 100
    end
    object qPermsperm_data: TStringField
      FieldKind = fkCalculated
      FieldName = 'perm_data'
      Size = 1
      Calculated = True
    end
  end
  object dsPerms: TUniDataSource
    DataSet = qPerms
    Left = 282
    Top = 147
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    Left = 144
    Top = 147
  end
  object tblPerms: TVirtualTable
    Left = 245
    Top = 195
    Data = {04000000000000000000}
  end
end
