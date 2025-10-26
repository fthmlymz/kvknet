object frKullaniciListe: TfrKullaniciListe
  Left = 0
  Top = 0
  Width = 1347
  Height = 451
  OnCreate = UniFrameCreate
  TabOrder = 0
  object lbKayitSayisi: TUniLabel
    Left = 300
    Top = 304
    Width = 62
    Height = 13
    Hint = ''
    Caption = 'lbKayitSayisi'
    TabOrder = 3
  end
  object pnlTop: TUniPanel
    Left = 0
    Top = 0
    Width = 1347
    Height = 72
    Hint = ''
    Align = alTop
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      1347
      72)
    object UniLabel1: TUniLabel
      Left = 12
      Top = 13
      Width = 78
      Height = 13
      Hint = ''
      Caption = 'Arama Kriterleri'
      TabOrder = 1
    end
    object edSrcType: TUniComboBox
      Left = 96
      Top = 10
      Width = 112
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'ADI SOYADI'
      Items.Strings = (
        'KULLANICI ADI'
        'ADI SOYADI'
        'ROL')
      ItemIndex = 1
      TabOrder = 2
      CharCase = ecUpperCase
      IconItems = <>
      OnChange = edSrcTypeChange
    end
    object edSrcActive: TUniComboBox
      Left = 214
      Top = 10
      Width = 96
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'AKT'#304'F'
      Items.Strings = (
        'AKT'#304'F'
        'PAS'#304'F'
        'T'#220'M'#220)
      ItemIndex = 0
      TabOrder = 3
      IconItems = <>
      OnChange = edSrcActiveChange
    end
    object edSrcText: TUniEdit
      Left = 96
      Top = 39
      Width = 214
      Height = 23
      Hint = ''
      CharCaseConversion = uccTurkish
      CharCase = ecUpperCase
      Text = ''
      TabOrder = 4
      ClientEvents.ExtEvents.Strings = (
        
          'keypress=function keypress(sender, e, eOpts)'#13#10'{'#13#10'   if (e.getKey' +
          '() == 13)'#13#10'   {'#13#10'      ajaxRequest(sender, '#39'doSearch'#39', ["aText="' +
          '+sender.getValue()]);'#13#10'   };'#13#10'}'
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
          'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
          'ender.setValue(val.toLocaleUpperCase('#39'TR'#39')); '#13#10'  sender.inputEl.' +
          'dom.setSelectionRange(pos, pos);'#13#10'}')
      OnAjaxEvent = edSrcTextAjaxEvent
    end
    object UniLabel2: TUniLabel
      Left = 14
      Top = 44
      Width = 76
      Height = 13
      Hint = ''
      Caption = 'Aranacak '#304'fade'
      TabOrder = 5
    end
    object btnSearch: TUniBitBtn
      Left = 316
      Top = 18
      Width = 96
      Height = 36
      Action = actSearch
      TabOrder = 6
      Images = MainMod.PrjImgList
      ImageIndex = 10
    end
    object btnAdd: TUniBitBtn
      Left = 418
      Top = 18
      Width = 96
      Height = 36
      Action = actAdd
      TabOrder = 7
      Images = MainMod.PrjImgList
      ImageIndex = 18
    end
    object btnEdit: TUniBitBtn
      Left = 520
      Top = 18
      Width = 96
      Height = 36
      Action = actEdit
      TabOrder = 8
      Images = MainMod.PrjImgList
      ImageIndex = 2
      OnClick = btnEditClick
    end
    object btnDelete: TUniBitBtn
      Left = 622
      Top = 18
      Width = 102
      Height = 36
      Action = actResetPwd
      TabOrder = 9
      Images = MainMod.PrjImgList
      ImageIndex = 11
    end
    object btnClose: TUniBitBtn
      Left = 1239
      Top = 18
      Width = 96
      Height = 36
      Action = actClose
      Anchors = [akTop, akRight]
      TabOrder = 10
      Images = MainMod.PrjImgList
      ImageIndex = 5
    end
    object btnTopluEkle: TUniBitBtn
      Left = 730
      Top = 18
      Width = 120
      Height = 36
      Hint = ''
      Caption = 'Toplu Ekleme'
      TabOrder = 11
      Images = MainMod.PrjImgList
      ImageIndex = 15
      OnClick = btnTopluEkleClick
    end
    object btnHelp: TUniBitBtn
      Left = 1137
      Top = 18
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 12
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = btnHelpClick
    end
    object btnExcel: TUniBitBtn
      Left = 856
      Top = 18
      Width = 96
      Height = 36
      Action = actClose
      Caption = 'Excel'
      TabOrder = 13
      Images = MainMod.PrjImgList
      ImageIndex = 4
      OnClick = btnExcelClick
    end
    object btnDiger: TUniMenuButton
      Left = 1037
      Top = 18
      Width = 94
      Height = 36
      Hint = ''
      DropdownMenu = popDiger
      Caption = 'Di'#287'er'
      Anchors = [akTop, akRight]
      TabOrder = 14
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 72
    Width = 1347
    Height = 379
    Hint = ''
    PagingBarAuxControl = lbKayitSayisi
    DataSource = dsUser
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    WebOptions.PageSize = 125
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Font.OverrideDefaults = [ovFontHeight]
    ParentFont = False
    TabOrder = 1
    OnColumnSort = UniDBGrid1ColumnSort
    Columns = <
      item
        FieldName = 'active'
        Title.Alignment = taCenter
        Title.Caption = 'AKT'#304'F'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 80
        Font.OverrideDefaults = [ovFontHeight]
        Alignment = taLeftJustify
        Sortable = True
        CheckBoxField.BooleanFieldOnly = False
        CheckBoxField.FieldValues = 'E;H'
        CheckBoxField.DisplayValues = 'EVET;HAYIR'
      end
      item
        FieldName = 'user_name'
        Title.Alignment = taCenter
        Title.Caption = 'KULLANICI ADI'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 120
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'full_name'
        Title.Alignment = taCenter
        Title.Caption = 'ADI SOYADI'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 200
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'rol'
        Title.Alignment = taCenter
        Title.Caption = 'ROL'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 200
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'phone'
        Title.Alignment = taCenter
        Title.Caption = 'TELEFON'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 120
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'email'
        Title.Alignment = taCenter
        Title.Caption = 'E-MA'#304'L'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 250
        Font.OverrideDefaults = [ovFontHeight]
      end>
  end
  object edMailMsg: TUniMemo
    Left = 585
    Top = 161
    Width = 91
    Height = 50
    Hint = ''
    Visible = False
    Lines.Strings = (
      'edMailMsg')
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 2
    WordWrap = False
  end
  object dsUser: TUniDataSource
    DataSet = MainMod.qUser
    Left = 276
    Top = 165
  end
  object ActList: TActionList
    Left = 321
    Top = 165
    object actAdd: TAction
      Caption = 'Yeni Kay'#305't'
      OnExecute = actAddExecute
    end
    object actEdit: TAction
      Caption = 'De'#287'i'#351'tir'
    end
    object actResetPwd: TAction
      Caption = 'Parola S'#305'f'#305'rla'
      OnExecute = actResetPwdExecute
    end
    object actSearch: TAction
      Caption = 'Liste'
      OnExecute = actSearchExecute
    end
    object actClose: TAction
      Caption = 'Kapat'
      OnExecute = actCloseExecute
    end
  end
  object qExcel: TUniQuery
    Connection = MainMod.DBMain
    Left = 399
    Top = 171
  end
  object tblExcel: TVirtualTable
    FieldDefs = <
      item
        Name = 'uname_str'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'fullname_str'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'phone_str'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'mail_str'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'dept_str'
        DataType = ftString
        Size = 1000
      end>
    Left = 453
    Top = 171
    Data = {
      040005000900756E616D655F73747201001400000000000C0066756C6C6E616D
      655F73747201001E0000000000090070686F6E655F7374720100140000000000
      08006D61696C5F73747201006400000000000800646570745F7374720100E803
      00000000000000000000}
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    Left = 576
    Top = 184
  end
  object popDiger: TUniPopupMenu
    Left = 807
    Top = 150
    object mnLog: TUniMenuItem
      Caption = 'Log'
      OnClick = mnLogClick
    end
  end
end
