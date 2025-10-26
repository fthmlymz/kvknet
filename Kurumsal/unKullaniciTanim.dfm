object frmKullaniciTanim: TfrmKullaniciTanim
  Left = 0
  Top = 0
  ClientHeight = 339
  ClientWidth = 880
  Caption = 'Kullan'#305'c'#305' Tan'#305'mlar'#305
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object pnlData: TUniPanel
    Left = 0
    Top = 0
    Width = 880
    Height = 203
    Hint = ''
    Align = alClient
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    ExplicitWidth = 688
    object UniLabel1: TUniLabel
      Left = 6
      Top = 17
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Kullan'#305'c'#305' Ad'#305
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
    end
    object UniLabel2: TUniLabel
      Left = 5
      Top = 40
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Ad'#305' Soyad'#305
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
    end
    object UniLabel3: TUniLabel
      Left = 6
      Top = 121
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Aktif'
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 3
    end
    object edUName: TUniDBEdit
      Tag = 9
      Left = 96
      Top = 12
      Width = 271
      Height = 22
      Hint = ''
      DataField = 'user_name'
      DataSource = dsUser
      CharCase = ecUpperCase
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 7
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
    object edFName: TUniDBEdit
      Left = 96
      Top = 37
      Width = 271
      Height = 22
      Hint = ''
      DataField = 'full_name'
      DataSource = dsUser
      CharCase = ecUpperCase
      TabOrder = 8
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
    object edActive: TUniDBCheckBox
      Left = 96
      Top = 119
      Width = 30
      Height = 17
      Hint = ''
      DataField = 'active'
      DataSource = dsUser
      ValueChecked = 'E'
      ValueUnchecked = 'H'
      Caption = ''
      TabOrder = 11
      ParentColor = False
      Color = clBtnFace
    end
    object UniLabel8: TUniLabel
      Left = 6
      Top = 147
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Rol'
      ParentFont = False
      Font.Color = clMaroon
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
    end
    object edRole: TUniDBLookupComboBox
      Left = 96
      Top = 144
      Width = 271
      Height = 23
      Hint = ''
      ListOnlyMode = lmFollowSource
      ListField = 'rol'
      ListSource = dsRole
      KeyField = 'rol'
      ListFieldIndex = 0
      DataField = 'rol'
      DataSource = dsUser
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      EmptyText = 'Se'#231'im Yap'#305'lmam'#305#351
      TabOrder = 12
      Color = clWindow
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
      Style = csDropDown
    end
    object btnDeptAdd: TUniBitBtn
      Left = 819
      Top = 12
      Width = 36
      Height = 36
      Hint = 'Departman Ekle'
      Caption = ''
      TabOrder = 14
      Images = MainMod.PrjImgList
      ImageIndex = 18
      OnClick = btnDeptAddClick
    end
    object btnDeptDel: TUniBitBtn
      Left = 819
      Top = 54
      Width = 36
      Height = 36
      Hint = 'Departman Sil'
      Caption = ''
      TabOrder = 15
      Images = MainMod.PrjImgList
      ImageIndex = 12
      OnClick = btnDeptDelClick
    end
    object UniLabel9: TUniLabel
      Left = 6
      Top = 67
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Telefon'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 5
    end
    object edPhone: TUniDBEdit
      Left = 96
      Top = 62
      Width = 133
      Height = 22
      Hint = ''
      DataField = 'phone'
      DataSource = dsUser
      CharCase = ecUpperCase
      TabOrder = 9
      InputMask.Mask = '(999)9999999'
    end
    object edMail: TUniDBEdit
      Left = 96
      Top = 87
      Width = 271
      Height = 22
      Hint = ''
      DataField = 'email'
      DataSource = dsUser
      CharCase = ecLowerCase
      TabOrder = 10
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleLowerCase()); '#13#10'  sender.inputEl.dom.' +
          'setSelectionRange(pos, pos);'#13#10'}')
    end
    object UniLabel11: TUniLabel
      Left = 6
      Top = 91
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'E-Mail'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 6
    end
    object UniDBGrid1: TUniDBGrid
      Left = 397
      Top = 14
      Width = 416
      Height = 181
      Hint = ''
      DataSource = dsDepts
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.Paged = False
      WebOptions.CustomizableCells = False
      WebOptions.FetchAll = True
      LoadMask.Message = 'Loading data...'
      EmptyText = 'Veri Bulunamad'#305
      TabOrder = 16
      Columns = <
        item
          FieldName = 'name'
          Title.Alignment = taCenter
          Title.Caption = 'Yetkili Oldu'#287'u Departmanlar'
          Width = 400
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
          DisplayMemo = True
        end>
    end
    object UniLabel10: TUniLabel
      Left = 6
      Top = 177
      Width = 85
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'LDAP Kul. Ad'#305
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 17
    end
    object edUNameLDAP: TUniDBEdit
      Left = 97
      Top = 173
      Width = 271
      Height = 22
      Hint = ''
      DataField = 'ldap_user_name'
      DataSource = dsUser
      TabOrder = 13
    end
  end
  object pnlButtons: TUniPanel
    Left = 0
    Top = 203
    Width = 880
    Height = 136
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 688
    DesignSize = (
      880
      136)
    object btnCancel: TUniBitBtn
      Left = 775
      Top = 90
      Width = 96
      Height = 36
      Hint = ''
      Caption = #304'ptal'
      Anchors = [akRight, akBottom]
      TabOrder = 2
      Images = MainMod.PrjImgList
      ImageIndex = 5
      OnClick = btnCancelClick
      ExplicitLeft = 583
    end
    object btnPost: TUniBitBtn
      Left = 673
      Top = 90
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Kaydet'
      Anchors = [akRight, akBottom]
      TabOrder = 1
      Images = MainMod.PrjImgList
      ImageIndex = 14
      OnClick = btnPostClick
      ExplicitLeft = 481
    end
    object pnlLog: TUniContainerPanel
      Left = 1
      Top = 1
      Width = 878
      Height = 80
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 3
      ExplicitWidth = 686
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
      Top = 90
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
  object qRole: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_role'
      '')
    Left = 177
    Top = 114
  end
  object dsRole: TUniDataSource
    DataSet = qRole
    Left = 219
    Top = 114
  end
  object dsUser: TUniDataSource
    DataSet = MainMod.qUser
    Left = 270
    Top = 57
  end
  object tblDepts: TVirtualTable
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'name'
        DataType = ftString
        Size = 200
      end>
    Left = 480
    Top = 57
    Data = {
      0400020002006964030000000000000004006E616D650100C800000000000000
      00000000}
  end
  object dsDepts: TUniDataSource
    DataSet = tblDepts
    Left = 525
    Top = 57
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    Left = 135
    Top = 114
  end
end
