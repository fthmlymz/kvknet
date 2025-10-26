object frAcikRizaKayitListe: TfrAcikRizaKayitListe
  Left = 0
  Top = 0
  Width = 1144
  Height = 401
  OnCreate = UniFrameCreate
  TabOrder = 0
  object lbKayitSayisi: TUniLabel
    Left = 232
    Top = 270
    Width = 62
    Height = 13
    Hint = ''
    Caption = 'lbKayitSayisi'
    TabOrder = 3
  end
  object pnlTop: TUniPanel
    Left = 0
    Top = 0
    Width = 1144
    Height = 145
    Hint = ''
    Align = alTop
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      1144
      145)
    object edSrcText: TUniEdit
      Left = 96
      Top = 42
      Width = 377
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'   var val = sender.g' +
          'etValue() ; '#13#10'   var pos = sender.inputEl.dom.selectionStart;'#13#10' ' +
          '  sender.setValue(val.toLocaleUpperCase()); '#13#10'   sender.inputEl.' +
          'dom.setSelectionRange(pos, pos);'#13#10'}'
        
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
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
    end
    object btnSearch: TUniBitBtn
      Left = 96
      Top = 91
      Width = 75
      Height = 36
      Action = actSearch
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 3
      Images = MainMod.PrjImgList
      ImageIndex = 10
    end
    object btnEdit: TUniBitBtn
      Left = 303
      Top = 91
      Width = 96
      Height = 36
      Action = actEdit
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
      Images = MainMod.PrjImgList
      ImageIndex = 2
    end
    object UniLabel2: TUniLabel
      Left = 14
      Top = 43
      Width = 76
      Height = 13
      Hint = ''
      Caption = 'Aranacak '#304'fade'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 5
    end
    object edSrcDurum: TUniComboBox
      Left = 244
      Top = 11
      Width = 120
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'AKT'#304'F'
      Items.Strings = (
        'T'#220'M'#220
        'AKT'#304'F'
        'RIZA ALINMADI'
        'PAS'#304'F/'#304'PTAL'
        'FAAL'#304'YET B'#304'TT'#304
        'RIZA GER'#304' '#199'EK'#304'LD'#304)
      ItemIndex = 1
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 7
      CharCase = ecUpperCase
      IconItems = <>
      OnChange = edSrcDurumChange
    end
    object edSrcType: TUniComboBox
      Left = 96
      Top = 11
      Width = 142
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'AD SOYAD'
      Items.Strings = (
        'REF. NO'
        'A'#199'IK RIZA T'#220'R'#220
        #304'LG'#304'L'#304' K'#304#350#304
        'AD SOYAD'
        'CEP TELEFONU'
        'E-MAIL'
        'K'#304'ML'#304'K NO'
        'KAYIT YAPAN K'#304#350#304)
      ItemIndex = 3
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 6
      ClientEvents.ExtEvents.Strings = (
        
          'dblclick=function dblclick(sender, eOpts)'#13#10'{'#13#10'   var x = sender.' +
          'getValue();'#13#10'   console.log(x);'#13#10'}')
      CharCase = ecUpperCase
      IconItems = <>
      OnChange = edSrcTypeChange
    end
    object btnUserSettings: TUniMenuButton
      Left = 177
      Top = 91
      Width = 120
      Height = 36
      Hint = ''
      DropdownMenu = ppmNew
      Caption = 'Yeni Kay'#305't'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 8
      Images = MainMod.PrjImgList
      ImageIndex = 18
    end
    object UniBitBtn1: TUniBitBtn
      Left = 929
      Top = 91
      Width = 96
      Height = 36
      Action = actHelp
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 9
      Images = MainMod.PrjImgList
      ImageIndex = 16
    end
    object edSrcDept: TUniComboBox
      Left = 595
      Top = 11
      Width = 347
      Hint = ''
      Style = csDropDownList
      Text = ''
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 10
      IconItems = <>
      OnChange = edSrcDeptChange
    end
    object UniLabel3: TUniLabel
      Left = 507
      Top = 15
      Width = 82
      Height = 13
      Hint = ''
      Caption = #304'lgili Departman'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 11
    end
    object UniMenuButton1: TUniMenuButton
      Left = 405
      Top = 91
      Width = 175
      Height = 36
      Hint = ''
      DropdownMenu = ppmExcel
      Caption = 'Toplu '#304#351'lemler'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 12
      Images = MainMod.PrjImgList
      ImageIndex = 15
    end
    object cbOnayTuru: TUniComboBox
      Left = 370
      Top = 11
      Width = 103
      Height = 28
      Hint = ''
      Style = csDropDownList
      Text = 'T'#220'M'#220
      Items.Strings = (
        'T'#220'M'#220
        'A'#199'IK RIZA'
        #214'ZEL ONAY')
      ItemIndex = 0
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 13
      CharCase = ecUpperCase
      IconItems = <>
      OnChange = edSrcDurumChange
    end
    object lbOzel1: TUniLabel
      Left = 556
      Top = 43
      Width = 33
      Height = 13
      Hint = ''
      Caption = #214'zel-1'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 14
    end
    object lbOzel2: TUniLabel
      Left = 753
      Top = 43
      Width = 33
      Height = 13
      Hint = ''
      Caption = #214'zel-2'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 15
    end
    object edSrcOzel2: TUniEdit
      Left = 792
      Top = 39
      Width = 150
      Hint = ''
      Text = ''
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      Anchors = [akTop, akRight]
      TabOrder = 16
      ClientEvents.ExtEvents.Strings = (
        
          'keypress=function keypress(sender, e, eOpts)'#13#10'{'#13#10'   if (e.getKey' +
          '() == 13)'#13#10'   {'#13#10'      ajaxRequest(sender, '#39'doSearch'#39', ["aText="' +
          '+sender.getValue()]);'#13#10'   };'#13#10'}')
      OnAjaxEvent = edSrcTextAjaxEvent
    end
    object edSrcOzel1: TUniEdit
      Left = 595
      Top = 39
      Width = 150
      Hint = ''
      Text = ''
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      Anchors = [akTop, akRight]
      TabOrder = 17
      ClientEvents.ExtEvents.Strings = (
        
          'keypress=function keypress(sender, e, eOpts)'#13#10'{'#13#10'   if (e.getKey' +
          '() == 13)'#13#10'   {'#13#10'      ajaxRequest(sender, '#39'doSearch'#39', ["aText="' +
          '+sender.getValue()]);'#13#10'   };'#13#10'}')
      OnAjaxEvent = edSrcTextAjaxEvent
    end
    object cbBilgileriGizle: TUniCheckBox
      Left = 96
      Top = 69
      Width = 98
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Bilgileri gizle'
      TabOrder = 18
    end
    object UniLabel4: TUniLabel
      Left = 965
      Top = 15
      Width = 34
      Height = 13
      Hint = ''
      Caption = 'Tarih-1'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 19
    end
    object UniLabel5: TUniLabel
      Left = 965
      Top = 43
      Width = 34
      Height = 13
      Hint = ''
      Caption = 'Tarih-2'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 20
    end
    object edSrcTarih2: TUniDateTimePicker
      Left = 1006
      Top = 39
      Width = 120
      Hint = ''
      DateTime = 44748.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      Anchors = [akTop, akRight]
      TabOrder = 21
    end
    object edSrcTarih1: TUniDateTimePicker
      Left = 1006
      Top = 11
      Width = 120
      Hint = ''
      DateTime = 44748.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      Anchors = [akTop, akRight]
      TabOrder = 22
    end
    object btnClose: TUniBitBtn
      Left = 1030
      Top = 91
      Width = 96
      Height = 36
      Action = actClose
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 23
      Images = MainMod.PrjImgList
      ImageIndex = 5
    end
    object btnTest: TUniButton
      Left = 595
      Top = 91
      Width = 46
      Height = 36
      Hint = ''
      Visible = False
      Caption = '...'
      TabOrder = 24
      OnClick = btnTestClick
    end
    object btnDiger: TUniMenuButton
      Left = 818
      Top = 91
      Width = 94
      Height = 36
      Hint = ''
      DropdownMenu = popDiger
      Caption = 'Di'#287'er'
      Anchors = [akTop, akRight]
      TabOrder = 25
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 145
    Width = 1144
    Height = 256
    Hint = ''
    ClientEvents.ExtEvents.Strings = (
      
        'mousedown=function mousedown(sender, x, y, eOpts)'#13#10'{'#13#10'    if (eO' +
        'pts == 2) {'#13#10'        Ext.defer(function(){'#13#10'            ajaxRequ' +
        'est(sender, '#39'popup'#39', ['#39'x='#39'+x, '#39'y='#39'+y])'#13#10'        }, 300);'#13#10'    } ' +
        #13#10#13#10'}')
    PagingBarAuxControl = lbKayitSayisi
    TitleFont.OverrideDefaults = [ovFontHeight]
    DataSource = dsRiza
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    WebOptions.PageSize = 100
    LoadMask.Message = 'Veri y'#252'kleniyor..'
    HiddenPanel = hpnFiltre
    EmptyText = 'Veri yok'
    Align = alClient
    Font.OverrideDefaults = [ovFontHeight]
    ParentFont = False
    TabOrder = 1
    Summary.Align = taBottom
    Summary.GrandTotalAlign = taBottom
    OnAjaxEvent = UniDBGrid1AjaxEvent
    OnColumnSort = UniDBGrid1ColumnSort
    OnColumnFilter = UniDBGrid1ColumnFilter
    Columns = <
      item
        FieldName = 'id'
        Filtering.Editor = edfId
        Title.Caption = 'Ref. No'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 75
        Font.OverrideDefaults = [ovFontHeight]
        Alignment = taCenter
        ReadOnly = True
        Sortable = True
      end
      item
        FieldName = 'durum'
        Filtering.Editor = cbfDurum
        Title.Caption = 'Durum'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 150
        Font.OverrideDefaults = [ovFontHeight]
        Alignment = taCenter
        ReadOnly = True
        Sortable = True
      end
      item
        FieldName = 'id_tur'
        Filtering.Editor = cbfIdTur
        Title.Caption = 'Onay T'#252'r'#252
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 90
        Font.OverrideDefaults = [ovFontHeight]
        Alignment = taCenter
        ReadOnly = True
        Sortable = True
      end
      item
        FieldName = 'ayd_tanim'
        Filtering.Editor = edfAydTanim
        Title.Caption = 'A'#231#305'k R'#305'za / '#214'zel Onay T'#252'r'#252
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 250
        Font.OverrideDefaults = [ovFontHeight]
        Sortable = True
        DisplayMemo = True
      end
      item
        FieldName = 'kisi_str'
        Filtering.Editor = edfKisiStr
        Title.Caption = #304'lgili Ki'#351'i'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 250
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        Sortable = True
        DisplayMemo = True
      end
      item
        FieldName = 'tarih'
        Title.Caption = 'Tarih'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 100
        Font.OverrideDefaults = [ovFontHeight]
        Alignment = taCenter
        ReadOnly = True
        Sortable = True
      end
      item
        FieldName = 'm_ad_soyad'
        Filtering.Editor = edfMAdSoyad
        Title.Caption = 'Ad Soyad'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 300
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        Sortable = True
        DisplayMemo = True
      end
      item
        FieldName = 'm_kimlik_no'
        Filtering.Editor = edfMKimlikNo
        Title.Caption = 'Kimlik No'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 75
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        Sortable = True
        DisplayMemo = True
      end
      item
        FieldName = 'm_gsmno'
        Filtering.Editor = edfMGsm
        Title.Caption = 'Cep Telefonu'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 120
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end
      item
        FieldName = 'm_email'
        Filtering.Editor = edfMEmail
        Title.Caption = 'E-Mail'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 200
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end
      item
        FieldName = 'ozel_1'
        Title.Caption = #214'zel Kod 1'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 80
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'ozel_2'
        Title.Caption = #214'zel Kod 2'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 80
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'iys_email'
        Title.Caption = #304'YS E-Mail'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 85
        Font.OverrideDefaults = [ovFontHeight]
        Alignment = taCenter
        CheckBoxField.BooleanFieldOnly = False
        CheckBoxField.FieldValues = 'E;H'
        CheckBoxField.DisplayValues = 'EVET;HAYIR'
      end
      item
        FieldName = 'iys_sms'
        Title.Caption = #304'YS SMS'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 85
        Font.OverrideDefaults = [ovFontHeight]
        Alignment = taCenter
        CheckBoxField.BooleanFieldOnly = False
        CheckBoxField.FieldValues = 'E;H'
        CheckBoxField.DisplayValues = 'EVET;HAYIR'
      end
      item
        FieldName = 'iys_phone'
        Title.Caption = #304'YS Sesli'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 85
        Font.OverrideDefaults = [ovFontHeight]
        Alignment = taCenter
        CheckBoxField.BooleanFieldOnly = False
        CheckBoxField.FieldValues = 'E;H'
        CheckBoxField.DisplayValues = 'EVET;HAYIR'
      end>
  end
  object hpnFiltre: TUniHiddenPanel
    Left = 534
    Top = 168
    Width = 277
    Height = 205
    Hint = ''
    Visible = True
    object edfId: TUniEdit
      Left = 18
      Top = 18
      Width = 121
      Hint = ''
      CharCase = ecUpperCase
      CharEOL = #13
      Text = ''
      TabOrder = 1
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'     var val = sender' +
          '.getValue() ; '#13#10'   var pos = sender.inputEl.dom.selectionStart;'#13 +
          #10'   sender.setValue(val.toLocaleUpperCase()); '#13#10'   sender.inputE' +
          'l.dom.setSelectionRange(pos, pos);'#13#10'}')
    end
    object cbfDurum: TUniComboBox
      Left = 18
      Top = 46
      Width = 121
      Hint = ''
      Style = csDropDownList
      Text = ''
      Items.Strings = (
        'AKT'#304'F'
        'RIZA ALINMADI'
        'PAS'#304'F/'#304'PTAL'
        'FAAL'#304'YET B'#304'TT'#304
        'RIZA GER'#304' '#199'EK'#304'LD'#304)
      TabOrder = 2
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'     var val = sender' +
          '.getValue() ; '#13#10'   var pos = sender.inputEl.dom.selectionStart;'#13 +
          #10'   sender.setValue(val.toLocaleUpperCase()); '#13#10'   sender.inputE' +
          'l.dom.setSelectionRange(pos, pos);'#13#10'}')
      CharCase = ecUpperCase
      IconItems = <>
    end
    object cbfIdTur: TUniComboBox
      Left = 18
      Top = 74
      Width = 121
      Hint = ''
      Style = csDropDownList
      Text = ''
      Items.Strings = (
        'AR'
        'OO')
      TabOrder = 3
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'     var val = sender' +
          '.getValue() ; '#13#10'   var pos = sender.inputEl.dom.selectionStart;'#13 +
          #10'   sender.setValue(val.toLocaleUpperCase()); '#13#10'   sender.inputE' +
          'l.dom.setSelectionRange(pos, pos);'#13#10'}')
      CharCase = ecUpperCase
      IconItems = <>
    end
    object edfKisiStr: TUniEdit
      Left = 15
      Top = 135
      Width = 121
      Hint = ''
      CharCase = ecUpperCase
      CharEOL = #13
      Text = ''
      TabOrder = 4
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'     var val = sender' +
          '.getValue() ; '#13#10'   var pos = sender.inputEl.dom.selectionStart;'#13 +
          #10'   sender.setValue(val.toLocaleUpperCase()); '#13#10'   sender.inputE' +
          'l.dom.setSelectionRange(pos, pos);'#13#10'}')
    end
    object edfMAdSoyad: TUniEdit
      Left = 15
      Top = 163
      Width = 121
      Hint = ''
      CharCase = ecUpperCase
      CharEOL = #13
      Text = ''
      TabOrder = 5
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'     var val = sender' +
          '.getValue() ; '#13#10'   var pos = sender.inputEl.dom.selectionStart;'#13 +
          #10'   sender.setValue(val.toLocaleUpperCase()); '#13#10'   sender.inputE' +
          'l.dom.setSelectionRange(pos, pos);'#13#10'}')
    end
    object edfMKimlikNo: TUniEdit
      Left = 145
      Top = 18
      Width = 121
      Hint = ''
      CharCase = ecUpperCase
      CharEOL = #13
      Text = ''
      TabOrder = 6
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'     var val = sender' +
          '.getValue() ; '#13#10'   var pos = sender.inputEl.dom.selectionStart;'#13 +
          #10'   sender.setValue(val.toLocaleUpperCase()); '#13#10'   sender.inputE' +
          'l.dom.setSelectionRange(pos, pos);'#13#10'}')
    end
    object edfMGsm: TUniEdit
      Left = 145
      Top = 46
      Width = 121
      Hint = ''
      CharCase = ecUpperCase
      CharEOL = #13
      Text = ''
      TabOrder = 7
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'     var val = sender' +
          '.getValue() ; '#13#10'   var pos = sender.inputEl.dom.selectionStart;'#13 +
          #10'   sender.setValue(val.toLocaleUpperCase()); '#13#10'   sender.inputE' +
          'l.dom.setSelectionRange(pos, pos);'#13#10'}')
    end
    object edfMEmail: TUniEdit
      Left = 145
      Top = 74
      Width = 121
      Hint = ''
      CharCase = ecUpperCase
      CharEOL = #13
      Text = ''
      TabOrder = 8
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'     var val = sender' +
          '.getValue() ; '#13#10'   var pos = sender.inputEl.dom.selectionStart;'#13 +
          #10'   sender.setValue(val.toLocaleUpperCase()); '#13#10'   sender.inputE' +
          'l.dom.setSelectionRange(pos, pos);'#13#10'}')
    end
    object edfAydTanim: TUniEdit
      Left = 18
      Top = 102
      Width = 121
      Hint = ''
      CharCase = ecUpperCase
      CharEOL = #13
      Text = ''
      TabOrder = 9
      ClientEvents.ExtEvents.Strings = (
        
          'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'     var val = sender' +
          '.getValue() ; '#13#10'   var pos = sender.inputEl.dom.selectionStart;'#13 +
          #10'   sender.setValue(val.toLocaleUpperCase()); '#13#10'   sender.inputE' +
          'l.dom.setSelectionRange(pos, pos);'#13#10'}')
    end
  end
  object edKayitKisi: TUniDBLookupComboBox
    Left = 96
    Top = 54
    Width = 377
    Hint = ''
    Visible = False
    ListOnlyMode = lmFollowSource
    ListField = 'user_name'
    ListSource = dsUser
    KeyField = 'id'
    ListFieldIndex = 0
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 4
    Color = clWindow
    RemoteQuery = True
    FieldLabelFont.OverrideDefaults = [ovFontHeight]
    OnChange = edKayitKisiChange
  end
  object dsRiza: TUniDataSource
    DataSet = qRiza
    Left = 297
    Top = 165
  end
  object ActList: TActionList
    Left = 348
    Top = 165
    object actAddAR: TAction
      Caption = 'Yeni A'#231#305'k R'#305'za Kayd'#305
      OnExecute = actAddARExecute
    end
    object actAddOO: TAction
      Caption = 'Yeni '#214'zel Onay Kayd'#305
      OnExecute = actAddOOExecute
    end
    object actEdit: TAction
      Caption = 'De'#287'i'#351'tir'
      OnExecute = actEditExecute
    end
    object actDelete: TAction
      Caption = 'Kay'#305't Sil'
      OnExecute = actDeleteExecute
    end
    object actClose: TAction
      Caption = 'Kapat'
      OnExecute = actCloseExecute
    end
    object actSearch: TAction
      Caption = 'Liste'
      OnExecute = actSearchExecute
    end
    object actExportExcel: TAction
      Caption = 'Listeyi Excel'#39'e Kaydet'
      OnExecute = actExportExcelExecute
    end
    object actImportExcelAR: TAction
      Caption = 'Excel'#39'den A'#231#305'k R'#305'za i'#231'eri Al'
      OnExecute = actImportExcelARExecute
    end
    object actImportExcelOO: TAction
      Caption = 'Excel'#39'den '#214'zel Onay '#304#231'eri Al'
      OnExecute = actImportExcelOOExecute
    end
    object actHelp: TAction
      Caption = 'Yard'#305'm'
      OnExecute = actHelpExecute
    end
    object acHepsineMesaj: TAction
      Caption = 'Toplu SMS / E-Mail G'#246'nder'
      OnExecute = acHepsineMesajExecute
    end
  end
  object qRiza: TUniQuery
    UpdatingTable = 'data_acikriza'
    KeyFields = 'id'
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT rz.*, ks.kisi as kisi_str, ayd.tanim as ayd_tanim'
      'FROM data_acikriza rz'
      
        'LEFT JOIN def_data_aydinlatma ayd ON ayd.durum = '#39'YAYINDA'#39' AND a' +
        'yd.id = rz.ayd_id'
      'LEFT JOIN def_data_kisi ks ON ks.id = rz.kisi_id'
      'WHERE rz.mc_id = 2'
      'ORDER BY rz.id'
      '')
    Left = 252
    Top = 165
  end
  object ppmNew: TUniPopupMenu
    Left = 403
    Top = 165
    object ppmiNewAR: TUniMenuItem
      Action = actAddAR
    end
    object ppmiNewOO: TUniMenuItem
      Action = actAddOO
    end
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user')
    Left = 405
    Top = 222
  end
  object ppmData: TUniPopupMenu
    Left = 536
    Top = 200
    object YeniAkRzaKayd1: TUniMenuItem
      Action = actAddAR
    end
    object YenizelOnayKayd1: TUniMenuItem
      Action = actAddOO
    end
    object Deitir1: TUniMenuItem
      Action = actEdit
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object ListeyiExceleKaydet1: TUniMenuItem
      Action = actExportExcel
    end
    object ExceldenieriAl1: TUniMenuItem
      Action = actImportExcelAR
      Caption = 'Excel'#39'den A'#231#305'k R'#305'za Listesini '#304#231'eri Al'
    end
    object ExceldenzelOnayeriAl2: TUniMenuItem
      Action = actImportExcelOO
      Caption = 'Excel'#39'den '#214'zel Onay Listesini '#304#231'eri Al'
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object Yardm1: TUniMenuItem
      Action = actHelp
    end
  end
  object ppmExcel: TUniPopupMenu
    Left = 480
    Top = 160
    object UniMenuItem5: TUniMenuItem
      Action = actExportExcel
    end
    object UniMenuItem6: TUniMenuItem
      Action = actImportExcelAR
    end
    object ExceldenzelOnayeriAl1: TUniMenuItem
      Action = actImportExcelOO
    end
    object HepsineSMSEMailGnder1: TUniMenuItem
      Action = acHepsineMesaj
    end
  end
  object dsUser: TUniDataSource
    DataSet = qUser
    Left = 424
    Top = 280
  end
  object qUser: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'select * from usr_user')
    Left = 464
    Top = 288
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
