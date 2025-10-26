object frmEDanismanSoruSetiListe: TfrmEDanismanSoruSetiListe
  Left = 0
  Top = 0
  Width = 1250
  Height = 400
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
    Width = 1250
    Height = 110
    Hint = ''
    Align = alTop
    TabOrder = 0
    Caption = ''
    DesignSize = (
      1250
      110)
    object edSrcText: TUniEdit
      Left = 96
      Top = 46
      Width = 310
      Hint = 
        'Anahtar kelimenin i'#231'inde ge'#231'ti'#287'i ifadeleri bulmak i'#231'in * veya % ' +
        'i'#351'aretleri kullanmal'#305's'#305'n'#305'z.'
      CharCaseConversion = uccTurkish
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
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
    object UniLabel1: TUniLabel
      Left = 12
      Top = 19
      Width = 78
      Height = 13
      Hint = ''
      Caption = 'Arama Kriterleri'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
    end
    object btnSearch: TUniBitBtn
      Left = 412
      Top = 43
      Width = 96
      Height = 36
      Action = actSearch
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 3
      Images = MainMod.PrjImgList
      ImageIndex = 10
    end
    object btnClose: TUniBitBtn
      Left = 1135
      Top = 43
      Width = 96
      Height = 36
      Action = actClose
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
      Images = MainMod.PrjImgList
      ImageIndex = 5
    end
    object btnAdd: TUniBitBtn
      Left = 514
      Top = 43
      Width = 96
      Height = 36
      Action = actAdd
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 5
      Images = MainMod.PrjImgList
      ImageIndex = 18
    end
    object btnEdit: TUniBitBtn
      Left = 616
      Top = 43
      Width = 96
      Height = 36
      Action = actEdit
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 6
      Images = MainMod.PrjImgList
      ImageIndex = 2
    end
    object UniLabel2: TUniLabel
      Left = 14
      Top = 50
      Width = 76
      Height = 13
      Hint = ''
      Caption = 'Aranacak '#304'fade'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 7
    end
    object edSrcDurumu: TUniComboBox
      Left = 232
      Top = 15
      Width = 174
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'AKT'#304'F'
      Items.Strings = (
        'T'#220'M'#220
        'AKT'#304'F'
        'PAS'#304'F'
        'CEVAPLANMAMI'#350' AKT'#304'F')
      ItemIndex = 1
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 9
      CharCase = ecUpperCase
      IconItems = <>
      OnChange = edSrcTipiChange
    end
    object edSrcTipi: TUniComboBox
      Left = 96
      Top = 15
      Width = 130
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'BA'#350'LIK'
      Items.Strings = (
        'REF. NO'
        'BA'#350'LIK'
        'SORU SET'#304' NO')
      ItemIndex = 1
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 8
      CharCase = ecUpperCase
      IconItems = <>
      OnChange = edSrcTipiChange
    end
    object UniBitBtn1: TUniBitBtn
      Left = 1033
      Top = 43
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 10
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = UniBitBtn1Click
    end
    object UniLabel3: TUniLabel
      Left = 8
      Top = 75
      Width = 82
      Height = 13
      Hint = ''
      Caption = #304'lgili Departman'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 11
    end
    object edSrcDept: TUniComboBox
      Left = 96
      Top = 72
      Width = 310
      Hint = ''
      Style = csDropDownList
      Text = ''
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 12
      IconItems = <>
      OnChange = edSrcDeptChange
    end
    object UniBitBtn2: TUniBitBtn
      Left = 820
      Top = 43
      Width = 96
      Height = 36
      Visible = False
      Action = actCevapla
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 13
      Images = MainMod.PrjImgList
      ImageIndex = 22
    end
    object UniBitBtn3: TUniBitBtn
      Left = 922
      Top = 43
      Width = 96
      Height = 36
      Visible = False
      Action = actSonuc
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 14
      Images = MainMod.PrjImgList
      ImageIndex = 23
    end
    object UniBitBtn4: TUniBitBtn
      Left = 718
      Top = 43
      Width = 96
      Height = 36
      Action = actCopy
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 15
      Images = MainMod.PrjImgList
      ImageIndex = 8
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 110
    Width = 1250
    Height = 290
    Hint = ''
    PagingBarAuxControl = lbKayitSayisi
    TitleFont.OverrideDefaults = [ovFontHeight]
    DataSource = dsSoru
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    WebOptions.PageSize = 150
    LoadMask.Message = 'Veri y'#252'kleniyor...'
    HiddenPanel = hpnFiltre
    EmptyText = 'Veri yok'
    Align = alClient
    Font.OverrideDefaults = [ovFontHeight]
    ParentFont = False
    TabOrder = 1
    OnColumnSort = UniDBGrid1ColumnSort
    OnDrawColumnCell = UniDBGrid1DrawColumnCell
    OnColumnFilter = UniDBGrid1ColumnFilter
    Columns = <
      item
        FieldName = 'id'
        Title.Alignment = taCenter
        Title.Caption = 'Ref. No'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 75
        Font.OverrideDefaults = [ovFontHeight]
        Alignment = taCenter
        Sortable = True
      end
      item
        FieldName = 'active'
        Filtering.Editor = cbfActive
        Title.Alignment = taCenter
        Title.Caption = 'Aktif'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 60
        Font.OverrideDefaults = [ovFontHeight]
        Alignment = taCenter
        Sortable = True
        CheckBoxField.FieldValues = 'E;H'
        CheckBoxField.DisplayValues = 'Evet;Hay'#305'r'
      end
      item
        FieldName = 'ss_no'
        Filtering.Editor = edfSSNo
        Title.Alignment = taCenter
        Title.Caption = 'Soru Seti No'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 96
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
        DisplayMemo = True
      end
      item
        FieldName = 'baslik'
        Filtering.Editor = edfBaslik
        Title.Alignment = taCenter
        Title.Caption = 'Ba'#351'l'#305'k'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 500
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
        DisplayMemo = True
      end
      item
        FieldName = 'sorusayisi'
        Title.Alignment = taCenter
        Title.Caption = 'Soru Say'#305's'#305
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 72
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'cevaplandi'
        Title.Alignment = taCenter
        Title.Caption = 'Cevapland'#305
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 96
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
        CheckBoxField.FieldValues = '1;0'
        CheckBoxField.DisplayValues = 'Evet;Hay'#305'r'
      end
      item
        FieldName = 'tarih'
        Title.Alignment = taCenter
        Title.Caption = 'Tarih'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 120
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'bitis_tarihi'
        Title.Alignment = taCenter
        Title.Caption = 'Biti'#351' Tarihi'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 120
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
      end
      item
        FieldName = 'departman'
        Filtering.Editor = edfDepartman
        Title.Alignment = taCenter
        Title.Caption = 'Departman'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 250
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
        DisplayMemo = True
      end>
  end
  object hpnFiltre: TUniHiddenPanel
    Left = 723
    Top = 162
    Width = 160
    Height = 202
    Hint = ''
    Visible = True
    object cbfActive: TUniComboBox
      Left = 21
      Top = 18
      Width = 106
      Height = 21
      Hint = ''
      Style = csDropDownList
      Text = ''
      Items.Strings = (
        'E'
        'H')
      TabOrder = 1
      IconItems = <>
    end
    object edfSSNo: TUniEdit
      Left = 21
      Top = 45
      Width = 106
      Hint = ''
      Text = ''
      TabOrder = 2
    end
    object edfBaslik: TUniEdit
      Left = 21
      Top = 73
      Width = 106
      Hint = ''
      Text = ''
      TabOrder = 3
    end
    object edfDepartman: TUniEdit
      Left = 21
      Top = 101
      Width = 106
      Hint = ''
      Text = ''
      TabOrder = 4
    end
  end
  object ActList: TActionList
    Left = 348
    Top = 165
    object actAdd: TAction
      Caption = 'Yeni Kay'#305't'
      OnExecute = actAddExecute
    end
    object actEdit: TAction
      Caption = 'De'#287'i'#351'tir'
      OnExecute = actEditExecute
    end
    object actCopy: TAction
      Caption = 'Kopyala'
      OnExecute = actCopyExecute
    end
    object actDownload: TAction
      Caption = #350'ablon '#304'ndir'
    end
    object actSearch: TAction
      Caption = 'Liste'
      OnExecute = actSearchExecute
    end
    object actClose: TAction
      Caption = 'Kapat'
      OnExecute = actCloseExecute
    end
    object acExcel: TAction
      Caption = 'Listeyi Excel'#39'e Kaydet'
    end
    object actCevapla: TAction
      Caption = 'Cevapla'
      OnExecute = actCevaplaExecute
    end
    object actSonuc: TAction
      Caption = 'Sonu'#231' Raporu'
    end
  end
  object dsSoru: TUniDataSource
    DataSet = qSoruSeti
    Left = 279
    Top = 165
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user')
    Left = 405
    Top = 222
  end
  object qSoruSeti: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user')
    Left = 197
    Top = 158
  end
  object DOCXRpt: TrXMLReport
    ActionAfter = aaNone
    OnUserCalc = DOCXRptUserCalc
    Left = 477
    Top = 164
  end
  object tblRapor: TVirtualTable
    FieldDefs = <
      item
        Name = 'soruno'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'sorumetni'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'secenekno'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'secenekmetni'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'sonucmetni'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'satirno'
        DataType = ftInteger
      end>
    Left = 547
    Top = 171
    Data = {
      040006000600736F72756E6F01001400000000000900736F72756D65746E6901
      00E803000000000900736563656E656B6E6F01001400000000000C0073656365
      6E656B6D65746E690100E803000000000A00736F6E75636D65746E690100E803
      00000000070073617469726E6F0300000000000000000000000000}
  end
  object qRapor: TVirtualQuery
    SourceDataSets = <
      item
        DataSet = tblRapor
      end>
    Left = 600
    Top = 176
  end
end
