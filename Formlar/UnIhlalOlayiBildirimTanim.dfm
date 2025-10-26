object frmIhlalOlayiBildirimTanim: TfrmIhlalOlayiBildirimTanim
  Left = 0
  Top = 0
  ClientHeight = 680
  ClientWidth = 904
  Caption = 'Ki'#351'isel Veri '#304'hlal Olay'#305' Bildirimi'
  OnResize = UniFormResize
  WindowState = wsMaximized
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object pnlButtons: TUniPanel
    Left = 0
    Top = 589
    Width = 904
    Height = 91
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    object pnllog: TUniPanel
      Left = 1
      Top = 1
      Width = 902
      Height = 50
      Hint = ''
      Align = alTop
      TabOrder = 1
      BorderStyle = ubsNone
      ShowCaption = False
      Caption = ''
      object UniLabel10: TUniLabel
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
        TabOrder = 1
      end
      object UniLabel11: TUniLabel
        Left = 337
        Top = 5
        Width = 96
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Son De'#287'. Yapan :'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
      end
      object UniLabel12: TUniLabel
        Left = 337
        Top = 23
        Width = 96
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Son De'#287'. Zaman'#305' :'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
      end
      object UniLabel9: TUniLabel
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
        TabOrder = 4
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
        TabOrder = 5
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
        TabOrder = 6
      end
      object lbSDT: TUniLabel
        Left = 439
        Top = 24
        Width = 200
        Height = 13
        Hint = ''
        AutoSize = False
        Caption = 'lbSDT'
        ParentFont = False
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 7
      end
      object lbSDY: TUniLabel
        Left = 436
        Top = 5
        Width = 200
        Height = 13
        Hint = ''
        AutoSize = False
        Caption = 'lbSDY'
        ParentFont = False
        Font.Style = [fsBold]
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 8
      end
    end
    object pnlbutton: TUniPanel
      Left = 1
      Top = 51
      Width = 902
      Height = 39
      Hint = ''
      Align = alClient
      TabOrder = 2
      BorderStyle = ubsNone
      ShowCaption = False
      Caption = ''
      object btnCancel: TUniBitBtn
        AlignWithMargins = True
        Left = 796
        Top = 3
        Width = 96
        Height = 33
        Hint = ''
        Margins.Right = 10
        Caption = #304'ptal'
        Align = alRight
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabStop = False
        TabOrder = 2
        Images = MainMod.PrjImgList
        ImageIndex = 5
        OnClick = btnCancelClick
      end
      object btnHelp: TUniBitBtn
        AlignWithMargins = True
        Left = 592
        Top = 3
        Width = 96
        Height = 33
        Hint = ''
        Caption = 'Yard'#305'm'
        Align = alRight
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabStop = False
        TabOrder = 3
        Images = MainMod.PrjImgList
        ImageIndex = 16
        OnClick = btnHelpClick
      end
      object btnPost: TUniBitBtn
        AlignWithMargins = True
        Left = 694
        Top = 3
        Width = 96
        Height = 33
        Hint = ''
        Caption = 'Kaydet'
        Align = alRight
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
        Images = MainMod.PrjImgList
        ImageIndex = 14
        OnClick = btnPostClick
      end
    end
  end
  object UniPanel2: TUniPanel
    Left = 0
    Top = 0
    Width = 904
    Height = 589
    Hint = ''
    Align = alClient
    TabOrder = 1
    ShowCaption = False
    Caption = ''
  end
  object cpdata: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 904
    Height = 589
    Hint = ''
    ParentColor = False
    Align = alClient
    AutoScroll = True
    TabOrder = 2
    ScrollHeight = 781
    ScrollWidth = 904
    object scrooldata: TUniScrollBox
      Left = 86
      Top = 19
      Width = 705
      Height = 762
      Hint = ''
      TabOrder = 1
      ScrollHeight = 710
      ScrollWidth = 691
      object btnihlalbul: TUniBitBtn
        Left = 634
        Top = 27
        Width = 35
        Height = 29
        Hint = 'Departman Ekle'
        Caption = ''
        TabOrder = 0
        Images = MainMod.PrjImgList
        ImageIndex = 18
        OnClick = btnihlalbulClick
      end
      object edbildirimtarihi: TUniDBDateTimePicker
        Left = 229
        Top = 60
        Width = 184
        Height = 25
        Hint = ''
        DataField = 'bildirim_tarihi'
        DataSource = dsdata
        DateTime = 45616.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 1
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
      end
      object edihlal: TUniEdit
        Left = 229
        Top = 30
        Width = 402
        Hint = ''
        Text = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
        ReadOnly = True
      end
      object edtarih: TUniLabel
        Left = 9
        Top = 60
        Width = 203
        Height = 26
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = #304'lgili ki'#351'ilere yap'#305'lan/yap'#305'lacak bildirimin tarihi'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
      end
      object mmBildirimYontemi: TUniDBMemo
        Left = 229
        Top = 170
        Width = 462
        Height = 76
        Hint = ''
        DataField = 'bildirim_yontemi'
        DataSource = dsdata
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase('#39'tr'#39')); '#13#10'  sender.inputEl.' +
            'dom.setSelectionRange(pos, pos);'#13#10'}')
      end
      object mmgecbildirimneden: TUniDBMemo
        Left = 229
        Top = 93
        Width = 462
        Height = 68
        Hint = ''
        DataField = 'gec_bildirim_nedeni'
        DataSource = dsdata
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 5
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase('#39'tr'#39')); '#13#10'  sender.inputEl.' +
            'dom.setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniDBCheckBox1: TUniDBCheckBox
        Left = 229
        Top = 309
        Width = 20
        Height = 17
        Hint = ''
        DataField = 'bildirim_yapildimi'
        DataSource = dsdata
        ValueChecked = 'E'
        ValueUnchecked = 'H'
        Caption = ''
        TabOrder = 6
        ParentColor = False
        Color = clBtnFace
      end
      object UniDBMemo1: TUniDBMemo
        Left = 229
        Top = 357
        Width = 462
        Height = 89
        Hint = ''
        DataField = 'bilgi_alma_yontemi'
        DataSource = dsdata
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 7
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase('#39'tr'#39')); '#13#10'  sender.inputEl.' +
            'dom.setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniDBMemo2: TUniDBMemo
        Left = 317
        Top = 286
        Width = 374
        Height = 63
        Hint = ''
        DataField = 'bildirim_yapildimi_aciklama'
        DataSource = dsdata
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 8
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase('#39'tr'#39')); '#13#10'  sender.inputEl.' +
            'dom.setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniLabel1: TUniLabel
        Left = 3
        Top = 105
        Width = 205
        Height = 53
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 
          'Kurula bildirimde tespit tarihinden sonra 72 saat ge'#231'irilmi'#351' ise' +
          ' ge'#231' bildirimin sebebini a'#231#305'klay'#305'n'#305'z '
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 9
      end
      object UniLabel15: TUniLabel
        Left = 97
        Top = 35
        Width = 115
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = #304'hlal Olay'#305
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 10
      end
      object UniLabel2: TUniLabel
        Left = 58
        Top = 301
        Width = 150
        Height = 32
        Hint = ''
        AutoSize = False
        Caption = #304'lgili ki'#351'ilere ihlal bildirimi yap'#305'ld'#305' m'#305'?'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 11
      end
      object UniLabel29: TUniLabel
        Left = 3
        Top = 170
        Width = 205
        Height = 76
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 
          #304'lgili ki'#351'ilere hangi y'#246'ntemle bildirim yap'#305'ld'#305#287#305'/yap'#305'laca'#287#305' hak' +
          'k'#305'nda detayl'#305' bilgi veriniz.'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 12
      end
      object UniLabel3: TUniLabel
        Left = 58
        Top = 366
        Width = 150
        Height = 71
        Hint = ''
        AutoSize = False
        Caption = 
          #304'lgili ki'#351'ilerin veri ihlali ile ilgili bilgi almalar'#305'n'#305' sa'#287'laya' +
          'cak ileti'#351'im yollar'#305'n'#305' belirtiniz.'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 13
      end
      object UniLabel6: TUniLabel
        Left = 261
        Top = 304
        Width = 50
        Height = 27
        Hint = ''
        AutoSize = False
        Caption = 'A'#231#305'klama giriniz'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 14
      end
      object UniDBCheckBox2: TUniDBCheckBox
        Left = 303
        Top = 491
        Width = 20
        Height = 18
        Hint = ''
        DataField = 'yurtici_kurum_bildirim'
        DataSource = dsdata
        ValueChecked = 'E'
        ValueUnchecked = 'H'
        Caption = ''
        TabOrder = 15
        ParentColor = False
        Color = clBtnFace
      end
      object UniDBCheckBox3: TUniDBCheckBox
        Left = 303
        Top = 623
        Width = 20
        Height = 17
        Hint = ''
        DataField = 'yurtdisi_kurum_bildirim'
        DataSource = dsdata
        ValueChecked = 'E'
        ValueUnchecked = 'H'
        Caption = ''
        TabOrder = 16
        ParentColor = False
        Color = clBtnFace
      end
      object UniLabel4: TUniLabel
        Left = 7
        Top = 452
        Width = 262
        Height = 92
        Hint = ''
        AutoSize = False
        Caption = 
          'Yurti'#231'inde bulunan di'#287'er organizasyon veya kurumlara ihlal hakk'#305 +
          'nda bilgi verildi mi veya vermeyi d'#252#351#252'n'#252'yor musunuz? ('#214'rne'#287'in po' +
          'lis, di'#287'er denetim yada g'#246'zetim kurumlar'#305'. Di'#287'er kurumlar ile il' +
          'eti'#351'ime ge'#231'meniz gerekir.) Evet se'#231'ene'#287'ini i'#351'aretlediyseniz dosy' +
          'a ekleyiniz. '
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 17
      end
      object UniLabel5: TUniLabel
        Left = 7
        Top = 598
        Width = 262
        Height = 67
        Hint = ''
        AutoSize = False
        Caption = 
          'Yurtd'#305#351#305'nda bulunan di'#287'er veri koruma otoritelerineihlal hakk'#305'nd' +
          'a bilgi verildi mi veya vermeyi d'#252#351#252'n'#252'yor musunuz? ('#214'rne'#287'in poli' +
          's, di'#287'er denitim yada g'#246'zetim kurumlar'#305'. Di'#287'er kurumlar ile ile'#351 +
          'itime ge'#231'meniz gerekir.) Evet i'#351'aretlediyseniz dosya ekleyiniz'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 18
      end
      object UniLabel38: TUniLabel
        Left = 177
        Top = 259
        Width = 31
        Height = 13
        Hint = ''
        Caption = 'Dosya'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 19
      end
      object edbildirimyontem: TUniDBEdit
        Left = 229
        Top = 253
        Width = 380
        Height = 25
        Hint = ''
        DataField = 'dosya_adi'
        DataSource = dsbildirimyontemi
        CharCase = ecLowerCase
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 20
        ReadOnly = True
      end
      object btilgilikisidosya: TUniSpeedButton
        Left = 616
        Top = 251
        Width = 34
        Height = 29
        Hint = ''
        Caption = ''
        ParentColor = False
        IconAlign = iaCenter
        Images = MainMod.PrjImgList
        ImageIndex = 18
        TabOrder = 21
        OnClick = btilgilikisidosyaClick
      end
      object btbildirimevrak: TUniSpeedButton
        Left = 656
        Top = 251
        Width = 34
        Height = 29
        Hint = ''
        Caption = ''
        ParentColor = False
        IconAlign = iaCenter
        Images = MainMod.PrjImgList
        ImageIndex = 1
        TabOrder = 22
        OnClick = btbildirimevrakClick
      end
      object UniLabel7: TUniLabel
        Left = 167
        Top = 560
        Width = 31
        Height = 13
        Hint = ''
        Caption = 'Dosya'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 23
      end
      object UniDBEdit1: TUniDBEdit
        Left = 229
        Top = 554
        Width = 364
        Height = 25
        Hint = ''
        DataField = 'dosya_adi'
        DataSource = dsyurticibildirim
        CharCase = ecLowerCase
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 24
        ReadOnly = True
      end
      object UniSpeedButton1: TUniSpeedButton
        Left = 615
        Top = 552
        Width = 34
        Height = 29
        Hint = ''
        Caption = ''
        ParentColor = False
        IconAlign = iaCenter
        Images = MainMod.PrjImgList
        ImageIndex = 18
        TabOrder = 25
        OnClick = UniSpeedButton1Click
      end
      object UniSpeedButton2: TUniSpeedButton
        Left = 655
        Top = 552
        Width = 34
        Height = 29
        Hint = ''
        Caption = ''
        ParentColor = False
        IconAlign = iaCenter
        Images = MainMod.PrjImgList
        ImageIndex = 1
        TabOrder = 26
        OnClick = UniSpeedButton2Click
      end
      object UniDBEdit2: TUniDBEdit
        Left = 229
        Top = 683
        Width = 364
        Height = 25
        Hint = ''
        DataField = 'dosya_adi'
        DataSource = dsyurtdisibildirim
        CharCase = ecLowerCase
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 27
        ReadOnly = True
      end
      object UniLabel8: TUniLabel
        Left = 167
        Top = 689
        Width = 31
        Height = 13
        Hint = ''
        Caption = 'Dosya'
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 28
      end
      object UniSpeedButton4: TUniSpeedButton
        Left = 615
        Top = 681
        Width = 34
        Height = 29
        Hint = ''
        Caption = ''
        ParentColor = False
        IconAlign = iaCenter
        Images = MainMod.PrjImgList
        ImageIndex = 18
        TabOrder = 29
        OnClick = UniSpeedButton4Click
      end
      object UniSpeedButton5: TUniSpeedButton
        Left = 655
        Top = 681
        Width = 34
        Height = 29
        Hint = ''
        Caption = ''
        ParentColor = False
        IconAlign = iaCenter
        Images = MainMod.PrjImgList
        ImageIndex = 1
        TabOrder = 30
        OnClick = UniSpeedButton5Click
      end
      object UniDBMemo3: TUniDBMemo
        Left = 342
        Top = 456
        Width = 348
        Height = 89
        Hint = ''
        DataField = 'yurtici_kurum_bildirim'
        DataSource = dsdata
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 31
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase('#39'tr'#39')); '#13#10'  sender.inputEl.' +
            'dom.setSelectionRange(pos, pos);'#13#10'}')
      end
      object UniDBMemo4: TUniDBMemo
        Left = 342
        Top = 587
        Width = 348
        Height = 89
        Hint = ''
        DataField = 'yurtdisi_kurum_bildirim'
        DataSource = dsdata
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 32
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase('#39'tr'#39')); '#13#10'  sender.inputEl.' +
            'dom.setSelectionRange(pos, pos);'#13#10'}')
      end
    end
  end
  object qdata: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'select * from def_data_ihlal_bildirim where mc_id=4 ')
    Active = True
    Left = 528
    Top = 80
  end
  object dsdata: TUniDataSource
    DataSet = qdata
    Left = 576
    Top = 80
  end
  object vqdata: TVirtualTable
    DetailFields = 'id'
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'ihlal_id'
        DataType = ftInteger
      end
      item
        Name = 'mc_id'
        DataType = ftInteger
      end
      item
        Name = 'bildirim_tarihi'
        DataType = ftDateTime
      end
      item
        Name = 'bildirim_yontemi'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'bilgi_alma_yontemi'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'yurtici_kurum_bildirim'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'yurtdisi_kurum_bildirim'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'idy'
        DataType = ftInteger
      end
      item
        Name = 'idt'
        DataType = ftDateTime
      end
      item
        Name = 'sdy'
        DataType = ftInteger
      end
      item
        Name = 'sdt'
        DataType = ftDateTime
      end
      item
        Name = 'gec_bildirim_nedeni'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'bildirim_yapildimi'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'bildirim_yapildimi_aciklama'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'yurtdisi_bildirim_aciklama'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'yurtici_bildirim_aciklama'
        DataType = ftString
        Size = 500
      end>
    Left = 624
    Top = 80
    Data = {
      04001100020069640300000000000000080069686C616C5F6964030000000000
      000005006D635F696403000000000000000F0062696C646972696D5F74617269
      68690B00000000000000100062696C646972696D5F796F6E74656D690100F401
      00000000120062696C67695F616C6D615F796F6E74656D690100F40100000000
      1600797572746963695F6B7572756D5F62696C646972696D0100010000000000
      170079757274646973695F6B7572756D5F62696C646972696D01000100000000
      000300696479030000000000000003006964740B000000000000000300736479
      030000000000000003007364740B0000000000000013006765635F62696C6469
      72696D5F6E6564656E690100F40100000000120062696C646972696D5F796170
      696C64696D6901000100000000001B0062696C646972696D5F796170696C6469
      6D695F6163696B6C616D610100F401000000001A0079757274646973695F6269
      6C646972696D5F6163696B6C616D610100F40100000000190079757274696369
      5F62696C646972696D5F6163696B6C616D610100F40100000000000000000000}
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    Left = 508
    Top = 295
  end
  object vqbildirimyontemi: TVirtualTable
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'ihlal_id'
        DataType = ftInteger
      end
      item
        Name = 'konu'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'file'
        DataType = ftBlob
      end
      item
        Name = 'dosya_adi'
        DataType = ftString
        Size = 100
      end>
    Left = 493
    Top = 378
    Data = {
      04000500020069640300000000000000080069686C616C5F6964030000000000
      000004006B6F6E750100640000000000040066696C650F000000000000000900
      646F7379615F6164690100640000000000000000000000}
  end
  object dsbildirimyontemi: TUniDataSource
    DataSet = vqbildirimyontemi
    Left = 549
    Top = 378
  end
  object vqyurticibildirim: TVirtualTable
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'ihlal_id'
        DataType = ftInteger
      end
      item
        Name = 'konu'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'file'
        DataType = ftBlob
      end
      item
        Name = 'dosya_adi'
        DataType = ftString
        Size = 100
      end>
    Left = 485
    Top = 434
    Data = {
      04000500020069640300000000000000080069686C616C5F6964030000000000
      000004006B6F6E750100640000000000040066696C650F000000000000000900
      646F7379615F6164690100640000000000000000000000}
  end
  object dsyurticibildirim: TUniDataSource
    DataSet = vqyurticibildirim
    Left = 541
    Top = 434
  end
  object vqyurtdisibildirim: TVirtualTable
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'ihlal_id'
        DataType = ftInteger
      end
      item
        Name = 'konu'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'file'
        DataType = ftBlob
      end
      item
        Name = 'dosya_adi'
        DataType = ftString
        Size = 100
      end>
    Left = 485
    Top = 498
    Data = {
      04000500020069640300000000000000080069686C616C5F6964030000000000
      000004006B6F6E750100640000000000040066696C650F000000000000000900
      646F7379615F6164690100640000000000000000000000}
  end
  object dsyurtdisibildirim: TUniDataSource
    DataSet = vqyurtdisibildirim
    Left = 541
    Top = 498
  end
  object FileUp: TUniFileUpload
    MaxAllowedSize = 2097152
    Title = 'Dosya Y'#252'kle'
    Messages.Uploading = 'Y'#252'kleniyor...'
    Messages.PleaseWait = 'L'#252'tfen Bekleyiniz'
    Messages.Cancel = #304'ptal'
    Messages.Processing = 'Y'#252'kleniyor...'
    Messages.UploadError = 'Y'#252'kleme Hatas'#305
    Messages.Upload = 'Y'#252'kle'
    Messages.NoFileError = 'L'#252'tfen Y'#252'klenecek Dosya Se'#231'iniz'
    Messages.BrowseText = 'Se'#231'...'
    Messages.UploadTimeout = 'Zaman a'#351#305'm'#305' olu'#351'tu...'
    Messages.MaxSizeError = 'Dosya izin verilen maksimum boyuttan daha b'#252'y'#252'k'
    Messages.MaxFilesError = 'En fazla %d dosya y'#252'kleyebilirsiniz.'
    Width = 400
    OnCompleted = FileUpCompleted
    Left = 629
    Top = 350
  end
end
