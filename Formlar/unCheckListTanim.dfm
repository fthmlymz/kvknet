object frmCheckListTanim: TfrmCheckListTanim
  Left = 0
  Top = 0
  ClientHeight = 711
  ClientWidth = 723
  Caption = 'Kontrol Listesi Formu'
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object pnlData: TUniPanel
    Left = 0
    Top = 47
    Width = 723
    Height = 580
    Hint = ''
    Align = alClient
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = ''
    object PgControl: TUniPageControl
      Left = 1
      Top = 149
      Width = 721
      Height = 430
      Hint = ''
      ActivePage = pgHukuk
      Align = alBottom
      TabOrder = 1
      object pgHukuk: TUniTabSheet
        Hint = ''
        Caption = 'Hukuksal Dayanaklar'
        Font.OverrideDefaults = [ovFontHeight]
        ParentFont = False
        object btnDayanakAdd: TUniBitBtn
          Left = 667
          Top = 12
          Width = 30
          Height = 30
          Hint = 'Departman Ekle'
          Caption = ''
          TabOrder = 3
          Images = MainMod.BtnImgList
          ImageIndex = 0
          OnClick = btnDayanakAddClick
        end
        object btnDayanakDel: TUniBitBtn
          Left = 667
          Top = 48
          Width = 30
          Height = 30
          Hint = 'Departman Sil'
          Caption = ''
          TabOrder = 4
          Images = MainMod.BtnImgList
          ImageIndex = 5
          OnClick = btnDayanakDelClick
        end
        object UniLabel14: TUniLabel
          Left = 6
          Top = 186
          Width = 85
          Height = 64
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Ayd'#305'nlatma Metni/ A'#231#305'k R'#305'za/ Muvafakatname Ad'#305' ve Maddesi'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 0
        end
        object UniDBMemo6: TUniDBMemo
          Left = 97
          Top = 186
          Width = 561
          Height = 64
          Hint = ''
          DataField = 'hkk_gereksinim'
          DataSource = dsCheckList
          TabOrder = 6
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel15: TUniLabel
          Left = 5
          Top = 256
          Width = 85
          Height = 64
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'S'#246'zle'#351'mesel Dayana'#287#305' Varsa S'#246'zle'#351'menin '#304'smi'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
        end
        object UniDBMemo7: TUniDBMemo
          Left = 97
          Top = 257
          Width = 561
          Height = 64
          Hint = ''
          DataField = 'hkk_sozlesme'
          DataSource = dsCheckList
          TabOrder = 7
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel16: TUniLabel
          Left = 6
          Top = 325
          Width = 85
          Height = 64
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'S'#246'zle'#351'menin Maddesi'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 2
        end
        object UniDBMemo8: TUniDBMemo
          Left = 97
          Top = 327
          Width = 561
          Height = 63
          Hint = ''
          DataField = 'hkk_sozmadde'
          DataSource = dsCheckList
          TabOrder = 8
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
        object btnDayanakNew: TUniBitBtn
          Left = 667
          Top = 84
          Width = 30
          Height = 30
          Hint = 'Departman Sil'
          Caption = ''
          TabOrder = 5
          Images = MainMod.BtnImgList
          ImageIndex = 1
          OnClick = btnDayanakNewClick
        end
        object pnlhkkdayanak: TUniPanel
          Left = 13
          Top = 12
          Width = 644
          Height = 168
          Hint = ''
          TabOrder = 9
          ShowCaption = False
          Caption = ''
          object rgHKKdayanak: TUniRadioGroup
            Left = 1
            Top = 1
            Width = 642
            Height = 50
            Hint = ''
            Items.Strings = (
              'Ekle'
              #199#305'kart'
              'De'#287'i'#351'tir')
            Align = alTop
            Caption = 'Yap'#305'lacak '#304#351'lem'
            TabOrder = 1
            Columns = 3
          end
          object grdDayanak: TUniDBGrid
            Left = 1
            Top = 51
            Width = 642
            Height = 116
            Hint = ''
            TitleFont.OverrideDefaults = [ovFontHeight]
            DataSource = dsDayanak
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
            WebOptions.Paged = False
            WebOptions.CustomizableCells = False
            WebOptions.FetchAll = True
            LoadMask.Message = 'Veri y'#252'kleniyor...'
            EmptyText = 'Veri yok'
            Align = alClient
            TabOrder = 2
            Columns = <
              item
                FieldName = 'name'
                Title.Alignment = taCenter
                Title.Caption = 'Hukuki Dayanaklar'
                Title.Font.OverrideDefaults = [ovFontHeight]
                Width = 610
                Font.OverrideDefaults = [ovFontHeight]
                ReadOnly = True
                DisplayMemo = True
              end>
          end
        end
      end
      object pgTedbir: TUniTabSheet
        Hint = ''
        Caption = 'Tedbirler ve Dok'#252'manlar'
        Font.OverrideDefaults = [ovFontHeight]
        ParentFont = False
        object btnDocsAdd: TUniBitBtn
          Left = 667
          Top = 208
          Width = 30
          Height = 30
          Hint = 'Departman Ekle'
          Caption = ''
          TabOrder = 3
          Images = MainMod.BtnImgList
          ImageIndex = 0
          OnClick = btnDocsAddClick
        end
        object btnDocsDel: TUniBitBtn
          Left = 667
          Top = 244
          Width = 30
          Height = 30
          Hint = 'Departman Sil'
          Caption = ''
          TabOrder = 4
          Images = MainMod.BtnImgList
          ImageIndex = 5
          OnClick = btnDocsDelClick
        end
        object btnTedbirAdd: TUniBitBtn
          Left = 667
          Top = 12
          Width = 30
          Height = 30
          Hint = 'Departman Ekle'
          Caption = ''
          TabOrder = 0
          Images = MainMod.BtnImgList
          ImageIndex = 0
          OnClick = btnTedbirAddClick
        end
        object btnTedbirDel: TUniBitBtn
          Left = 667
          Top = 48
          Width = 30
          Height = 30
          Hint = 'Departman Sil'
          Caption = ''
          TabOrder = 1
          Images = MainMod.BtnImgList
          ImageIndex = 5
          OnClick = btnTedbirDelClick
        end
        object btnTedbirNew: TUniBitBtn
          Left = 667
          Top = 84
          Width = 30
          Height = 30
          Hint = 'Departman Sil'
          Caption = ''
          TabOrder = 2
          Images = MainMod.BtnImgList
          ImageIndex = 1
          OnClick = btnTedbirNewClick
        end
        object btnDocsNew: TUniBitBtn
          Left = 667
          Top = 280
          Width = 30
          Height = 30
          Hint = 'Departman Sil'
          Visible = False
          Caption = ''
          TabOrder = 5
          Images = MainMod.BtnImgList
          ImageIndex = 1
          OnClick = btnDocsNewClick
        end
        object pnltedbir: TUniPanel
          Left = 14
          Top = 3
          Width = 647
          Height = 190
          Hint = ''
          TabOrder = 6
          ShowCaption = False
          Caption = ''
          object rgtedbir: TUniRadioGroup
            Left = 1
            Top = 1
            Width = 645
            Height = 50
            Hint = ''
            Items.Strings = (
              'Ekle'
              #199#305'kart'
              'De'#287'i'#351'tir')
            Align = alTop
            Caption = 'Yap'#305'lacak '#304#351'lem'
            TabOrder = 1
            Columns = 3
          end
          object grdTedbir: TUniDBGrid
            Left = 1
            Top = 51
            Width = 645
            Height = 138
            Hint = '13'
            DataSource = dsTedbir
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
            WebOptions.Paged = False
            WebOptions.CustomizableCells = False
            WebOptions.FetchAll = True
            LoadMask.Message = 'Loading data...'
            EmptyText = 'Veri Bulunamad'#305
            Align = alClient
            TabOrder = 2
            Columns = <
              item
                FieldName = 'name'
                Title.Alignment = taCenter
                Title.Caption = 'Veri G'#252'venli'#287'i Tedbirleri'
                Width = 610
                Font.OverrideDefaults = [ovFontHeight]
                ReadOnly = True
                DisplayMemo = True
              end>
          end
        end
        object pnlDoc: TUniPanel
          Left = 15
          Top = 204
          Width = 646
          Height = 195
          Hint = ''
          TabOrder = 7
          ShowCaption = False
          Caption = ''
          object rgdoc: TUniRadioGroup
            Left = 1
            Top = 1
            Width = 644
            Height = 50
            Hint = ''
            Items.Strings = (
              'Ekle'
              #199#305'kart'
              'De'#287'i'#351'tir')
            Align = alTop
            Caption = 'Yap'#305'lacak '#304#351'lem'
            TabOrder = 1
            Columns = 3
          end
          object grdDocs: TUniDBGrid
            Left = 1
            Top = 51
            Width = 644
            Height = 143
            Hint = ''
            DataSource = dsDocs
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
            WebOptions.Paged = False
            WebOptions.CustomizableCells = False
            WebOptions.FetchAll = True
            LoadMask.Message = 'Loading data...'
            EmptyText = 'Veri Bulunamad'#305
            Align = alClient
            TabOrder = 2
            Columns = <
              item
                FieldName = 'name'
                Title.Alignment = taCenter
                Title.Caption = #304'li'#351'kili Dok'#252'manlar'
                Width = 610
                Font.OverrideDefaults = [ovFontHeight]
                ReadOnly = True
                DisplayMemo = True
              end>
          end
        end
      end
      object pgBaglantı: TUniTabSheet
        Hint = ''
        Caption = 'Ba'#287'lant'#305' Verileri'
        Font.OverrideDefaults = [ovFontHeight]
        ParentFont = False
        object btnEkipAdd: TUniBitBtn
          Left = 667
          Top = 12
          Width = 30
          Height = 30
          Hint = 'Departman Ekle'
          Caption = ''
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 0
          Images = MainMod.BtnImgList
          ImageIndex = 0
          OnClick = btnEkipAddClick
        end
        object btnEkipDel: TUniBitBtn
          Left = 667
          Top = 48
          Width = 30
          Height = 30
          Hint = 'Departman Sil'
          Caption = ''
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
          Images = MainMod.BtnImgList
          ImageIndex = 5
          OnClick = btnEkipDelClick
        end
        object btnDeptsAdd: TUniBitBtn
          Left = 667
          Top = 208
          Width = 30
          Height = 30
          Hint = 'Departman Ekle'
          Caption = ''
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 3
          Images = MainMod.BtnImgList
          ImageIndex = 0
          OnClick = btnDeptsAddClick
        end
        object btnDeptsDel: TUniBitBtn
          Left = 667
          Top = 244
          Width = 30
          Height = 30
          Hint = 'Departman Sil'
          Caption = ''
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 4
          Images = MainMod.BtnImgList
          ImageIndex = 5
          OnClick = btnDeptsDelClick
        end
        object btnEkipNew: TUniBitBtn
          Left = 667
          Top = 84
          Width = 30
          Height = 30
          Hint = 'Departman Sil'
          Caption = ''
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 2
          Images = MainMod.BtnImgList
          ImageIndex = 1
          OnClick = btnEkipNewClick
        end
        object btnDeptsNew: TUniBitBtn
          Left = 667
          Top = 280
          Width = 30
          Height = 30
          Hint = 'Departman Sil'
          Caption = ''
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 5
          Images = MainMod.BtnImgList
          ImageIndex = 1
          OnClick = btnDeptsNewClick
        end
        object pnlekipman: TUniPanel
          Left = 16
          Top = 3
          Width = 645
          Height = 196
          Hint = ''
          TabOrder = 6
          ShowCaption = False
          Caption = ''
          object rgekipman: TUniRadioGroup
            Left = 1
            Top = 1
            Width = 643
            Height = 50
            Hint = ''
            Items.Strings = (
              'Ekle'
              #199#305'kart'
              'De'#287'i'#351'tir')
            Align = alTop
            Caption = 'Yap'#305'lacak '#304#351'lem'
            TabOrder = 1
            Columns = 3
          end
          object grdEkip: TUniDBGrid
            Left = 1
            Top = 51
            Width = 643
            Height = 144
            Hint = ''
            DataSource = dsEkipman
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
            WebOptions.Paged = False
            WebOptions.CustomizableCells = False
            WebOptions.FetchAll = True
            LoadMask.Message = 'Loading data...'
            EmptyText = 'Veri Bulunamad'#305
            Align = alClient
            TabOrder = 2
            Columns = <
              item
                FieldName = 'name'
                Title.Alignment = taCenter
                Title.Caption = 'Ekipman / Yaz'#305'l'#305'm'
                Width = 610
                Font.OverrideDefaults = [ovFontHeight]
                ReadOnly = True
                DisplayMemo = True
              end>
          end
        end
        object pnldep: TUniPanel
          Left = 16
          Top = 205
          Width = 645
          Height = 194
          Hint = ''
          TabOrder = 7
          ShowCaption = False
          Caption = ''
          object rgdept: TUniRadioGroup
            Left = 1
            Top = 1
            Width = 643
            Height = 50
            Hint = ''
            Items.Strings = (
              'Ekle'
              #199#305'kart'
              'De'#287'i'#351'tir')
            Align = alTop
            Caption = 'Yap'#305'lacak '#304#351'lem'
            TabOrder = 1
            Columns = 3
          end
          object grdDepts: TUniDBGrid
            Left = 1
            Top = 51
            Width = 643
            Height = 142
            Hint = ''
            DataSource = dsDepts
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
            WebOptions.Paged = False
            WebOptions.CustomizableCells = False
            WebOptions.FetchAll = True
            LoadMask.Message = 'Loading data...'
            EmptyText = 'Veri Bulunamad'#305
            Align = alClient
            TabOrder = 2
            Columns = <
              item
                FieldName = 'name'
                Title.Alignment = taCenter
                Title.Caption = 'Sorumlu Departmanlar'
                Width = 610
                Font.OverrideDefaults = [ovFontHeight]
                ReadOnly = True
                DisplayMemo = True
              end>
          end
        end
      end
      object pgOnlemler: TUniTabSheet
        Hint = ''
        Caption = #214'nlemler'
        Font.OverrideDefaults = [ovFontHeight]
        ParentFont = False
        object UniLabel37: TUniLabel
          Left = 6
          Top = 16
          Width = 85
          Height = 13
          Hint = ''
          Visible = False
          Alignment = taRightJustify
          AutoSize = False
          Caption = #214'nem Derecesi'
          ParentFont = False
          Font.Color = clMaroon
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 3
        end
        object edOnem: TUniDBLookupComboBox
          Left = 96
          Top = 13
          Width = 345
          Hint = ''
          Visible = False
          ListOnlyMode = lmFollowSource
          ListField = 'onemderece'
          ListSource = dsOnem
          KeyField = 'id'
          ListFieldIndex = 0
          DataField = 'onem_derecesi_id'
          DataSource = dsCheckList
          EmptyText = 'Se'#231'im Yap'#305'lmam'#305#351
          TabOrder = 4
          Color = clWindow
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel34: TUniLabel
          Left = 6
          Top = 41
          Width = 85
          Height = 70
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Mevcut '#304'dari '#214'nlemler'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 0
        end
        object UniDBMemo16: TUniDBMemo
          Left = 96
          Top = 41
          Width = 561
          Height = 70
          Hint = ''
          DataField = 'koru_idarionlem'
          DataSource = dsCheckList
          TabOrder = 5
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel35: TUniLabel
          Left = 6
          Top = 120
          Width = 85
          Height = 70
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Mevcut Teknik '#214'nlemler'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
        end
        object UniDBMemo17: TUniDBMemo
          Left = 96
          Top = 120
          Width = 561
          Height = 70
          Hint = ''
          DataField = 'koru_teknikonlem'
          DataSource = dsCheckList
          TabOrder = 6
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel36: TUniLabel
          Left = 6
          Top = 199
          Width = 85
          Height = 70
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Dan'#305#351'man Notu'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 2
        end
        object UniDBMemo18: TUniDBMemo
          Left = 96
          Top = 199
          Width = 561
          Height = 70
          Hint = ''
          DataField = 'danisman_notu'
          DataSource = dsCheckList
          TabOrder = 7
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
      end
      object pgDiger: TUniTabSheet
        Hint = ''
        Caption = 'Di'#287'er'
        Font.OverrideDefaults = [ovFontHeight]
        ParentFont = False
        object UniLabel8: TUniLabel
          Left = 6
          Top = 12
          Width = 85
          Height = 70
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Planlanan '#199'al'#305#351'ma / Talimat'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 0
        end
        object UniDBMemo1: TUniDBMemo
          Left = 97
          Top = 12
          Width = 561
          Height = 70
          Hint = ''
          DataField = 'calisma_talimat'
          DataSource = dsCheckList
          TabOrder = 5
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel10: TUniLabel
          Left = 6
          Top = 86
          Width = 85
          Height = 70
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = #214'neriler'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
        end
        object UniDBMemo2: TUniDBMemo
          Left = 97
          Top = 89
          Width = 561
          Height = 70
          Hint = ''
          DataField = 'oneriler'
          DataSource = dsCheckList
          TabOrder = 6
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel11: TUniLabel
          Left = 6
          Top = 167
          Width = 85
          Height = 70
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Uygulama G'#252'ncelleme Aral'#305#287#305
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 2
        end
        object UniDBMemo3: TUniDBMemo
          Left = 97
          Top = 167
          Width = 561
          Height = 70
          Hint = ''
          DataField = 'guncelleme_araligi'
          DataSource = dsCheckList
          TabOrder = 7
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel12: TUniLabel
          Left = 6
          Top = 245
          Width = 85
          Height = 70
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Tetkik Aral'#305#287#305
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 3
        end
        object UniDBMemo4: TUniDBMemo
          Left = 97
          Top = 245
          Width = 561
          Height = 70
          Hint = ''
          DataField = 'tetkik_araligi'
          DataSource = dsCheckList
          TabOrder = 8
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel13: TUniLabel
          Left = 6
          Top = 323
          Width = 85
          Height = 70
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Tekik Soru / Y'#246'netim'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 4
        end
        object UniDBMemo5: TUniDBMemo
          Left = 97
          Top = 324
          Width = 561
          Height = 63
          Hint = ''
          DataField = 'tetkik_yonetim'
          DataSource = dsCheckList
          TabOrder = 9
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
      end
    end
    object UniPanel5: TUniPanel
      Left = 0
      Top = 3
      Width = 600
      Height = 134
      Hint = ''
      TabOrder = 2
      BorderStyle = ubsNone
      ShowCaption = False
      Caption = ''
    end
    object UniPanel8: TUniPanel
      Left = 1
      Top = 1
      Width = 721
      Height = 148
      Hint = ''
      Align = alClient
      TabOrder = 3
      BorderStyle = ubsNone
      ShowCaption = False
      Caption = ''
      object UniPanel7: TUniPanel
        AlignWithMargins = True
        Left = 611
        Top = 3
        Width = 107
        Height = 142
        Hint = ''
        Align = alRight
        TabOrder = 1
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        object btnKilitle: TUniBitBtn
          Left = 0
          Top = 0
          Width = 107
          Height = 36
          Hint = ''
          Caption = 'Kilitle'
          Align = alTop
          TabOrder = 1
          Images = MainMod.PrjImgList
          ImageIndex = 7
          OnClick = btnKilitleClick
        end
      end
      object UniPanel6: TUniPanel
        Left = 0
        Top = 0
        Width = 608
        Height = 148
        Hint = ''
        Align = alClient
        TabOrder = 2
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        object unipanel1: TUniPanel
          Left = 0
          Top = 0
          Width = 608
          Height = 30
          Hint = ''
          Align = alTop
          TabOrder = 1
          BorderStyle = ubsNone
          Caption = ''
          object UniLabel3: TUniLabel
            AlignWithMargins = True
            Left = 3
            Top = 10
            Width = 85
            Height = 17
            Hint = ''
            Margins.Top = 10
            Margins.Right = 10
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Aktif'
            Align = alLeft
            ParentFont = False
            Font.Color = clMaroon
            Font.OverrideDefaults = [ovFontHeight]
            TabOrder = 1
          end
          object edActive: TUniDBCheckBox
            AlignWithMargins = True
            Left = 101
            Top = 7
            Width = 26
            Height = 20
            Hint = ''
            Margins.Top = 7
            ParentCustomHint = False
            ParentRTL = False
            DataField = 'active'
            DataSource = dsCheckList
            ValueChecked = 'E'
            ValueUnchecked = 'H'
            Caption = ''
            ParentFont = False
            Font.OverrideDefaults = [ovFontHeight]
            Align = alLeft
            TabOrder = 2
            ParentColor = False
            Color = clBtnFace
          end
          object lbAktifDurum: TUniLabel
            AlignWithMargins = True
            Left = 133
            Top = 10
            Width = 112
            Height = 17
            Hint = ''
            Margins.Top = 10
            Margins.Right = 10
            AutoSize = False
            Caption = '..'
            Align = alLeft
            ParentFont = False
            Font.Color = clMaroon
            Font.OverrideDefaults = [ovFontHeight]
            TabOrder = 3
          end
          object UniLabel18: TUniLabel
            AlignWithMargins = True
            Left = 258
            Top = 10
            Width = 74
            Height = 17
            Hint = ''
            Margins.Top = 10
            Margins.Right = 10
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Envanter Kilitli'
            Align = alLeft
            ParentFont = False
            Font.Color = clMaroon
            Font.OverrideDefaults = [ovFontHeight]
            TabOrder = 4
          end
          object chbKilit: TUniDBCheckBox
            AlignWithMargins = True
            Left = 345
            Top = 7
            Width = 17
            Height = 20
            Hint = ''
            Margins.Top = 7
            DataField = 'kilitli'
            DataSource = dsCheckList
            ValueChecked = 'E'
            ValueUnchecked = 'H'
            Caption = ''
            Align = alLeft
            TabOrder = 5
            ParentColor = False
            Color = clBtnFace
            ReadOnly = True
          end
          object lbKilitDurum: TUniLabel
            AlignWithMargins = True
            Left = 368
            Top = 10
            Width = 120
            Height = 17
            Hint = ''
            Margins.Top = 10
            Margins.Right = 10
            AutoSize = False
            Caption = '..'
            Align = alLeft
            ParentFont = False
            Font.Color = clMaroon
            Font.OverrideDefaults = [ovFontHeight]
            TabOrder = 6
          end
        end
        object UniPanel2: TUniPanel
          Left = 0
          Top = 30
          Width = 608
          Height = 35
          Hint = ''
          Align = alTop
          TabOrder = 2
          BorderStyle = ubsNone
          Caption = ''
          object UniLabel1: TUniLabel
            AlignWithMargins = True
            Left = 3
            Top = 10
            Width = 85
            Height = 22
            Hint = ''
            Margins.Top = 10
            Margins.Right = 10
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Tarih'
            Align = alLeft
            ParentFont = False
            Font.Color = clMaroon
            Font.OverrideDefaults = [ovFontHeight]
            TabOrder = 1
          end
          object edTarih: TUniDBDateTimePicker
            AlignWithMargins = True
            Left = 101
            Top = 3
            Width = 120
            Height = 29
            Hint = ''
            DataField = 'tarih'
            DataSource = dsCheckList
            DateTime = 44100.000000000000000000
            DateFormat = 'dd.MM.yyyy'
            TimeFormat = 'HH:mm:ss'
            Align = alLeft
            TabOrder = 2
          end
          object UniLabel9: TUniLabel
            AlignWithMargins = True
            Left = 227
            Top = 10
            Width = 55
            Height = 22
            Hint = ''
            Margins.Top = 10
            Margins.Right = 10
            Visible = False
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Kontrol'
            Align = alLeft
            ParentFont = False
            Font.OverrideDefaults = [ovFontHeight]
            TabOrder = 3
          end
          object edKontrol: TUniDBLookupComboBox
            AlignWithMargins = True
            Left = 295
            Top = 3
            Width = 310
            Height = 29
            Hint = ''
            Visible = False
            ListOnlyMode = lmFollowSource
            ListField = 'kontrolsonuc'
            ListSource = dsKontrol
            KeyField = 'id'
            ListFieldIndex = 0
            DataField = 'kontrol_id'
            DataSource = dsCheckList
            Align = alClient
            EmptyText = 'Se'#231'im Yap'#305'lmam'#305#351
            TabOrder = 4
            Color = clWindow
            ClientEvents.ExtEvents.Strings = (
              
                'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
                'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
                'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
                'setSelectionRange(pos, pos);'#13#10'}')
          end
        end
        object UniPanel3: TUniPanel
          Left = 0
          Top = 65
          Width = 608
          Height = 35
          Hint = ''
          Align = alTop
          TabOrder = 3
          BorderStyle = ubsNone
          ShowCaption = False
          Caption = ''
          object UniLabel2: TUniLabel
            AlignWithMargins = True
            Left = 3
            Top = 10
            Width = 85
            Height = 22
            Hint = ''
            Margins.Top = 10
            Margins.Right = 10
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Veri Kayna'#287#305
            Align = alLeft
            ParentFont = False
            Font.Color = clMaroon
            Font.OverrideDefaults = [ovFontHeight]
            TabOrder = 1
          end
          object edKaynak: TUniDBLookupComboBox
            AlignWithMargins = True
            Left = 101
            Top = 3
            Width = 504
            Height = 29
            Hint = ''
            ListOnlyMode = lmFollowSource
            ListField = 'kaynak'
            ListSource = dsKaynak
            KeyField = 'kaynak_id'
            ListFieldIndex = 0
            DataField = 'kaynak_id'
            DataSource = dsCheckList
            Align = alClient
            EmptyText = 'Se'#231'im Yap'#305'lmam'#305#351
            TabOrder = 2
            Color = clWindow
            ClientEvents.ExtEvents.Strings = (
              
                'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
                'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
                'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
                'setSelectionRange(pos, pos);'#13#10'}')
            Style = csDropDown
            OnChange = edKaynakChange
          end
        end
        object UniPanel4: TUniPanel
          Left = 0
          Top = 100
          Width = 608
          Height = 35
          Hint = ''
          Align = alTop
          TabOrder = 4
          BorderStyle = ubsNone
          ShowCaption = False
          Caption = 'UniPanel4'
          object UniLabel17: TUniLabel
            AlignWithMargins = True
            Left = 3
            Top = 10
            Width = 85
            Height = 22
            Hint = ''
            Margins.Top = 10
            Margins.Right = 10
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Veri Konusu Ki'#351'i'
            Align = alLeft
            ParentFont = False
            Font.Color = clMaroon
            Font.OverrideDefaults = [ovFontHeight]
            TabOrder = 1
          end
          object edKisi: TUniDBLookupComboBox
            AlignWithMargins = True
            Left = 101
            Top = 3
            Width = 504
            Height = 29
            Hint = ''
            ListOnlyMode = lmFollowSource
            ListField = 'kisi'
            ListSource = dsKisi
            KeyField = 'kisi_id'
            ListFieldIndex = 0
            DataField = 'kisi_id'
            DataSource = dsCheckList
            Align = alClient
            EmptyText = 'Se'#231'im Yap'#305'lmam'#305#351
            TabOrder = 2
            Color = clWindow
            ClientEvents.ExtEvents.Strings = (
              
                'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
                'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
                'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
                'setSelectionRange(pos, pos);'#13#10'}')
          end
        end
      end
    end
  end
  object pnlButtons: TUniPanel
    Left = 0
    Top = 627
    Width = 723
    Height = 84
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      723
      84)
    object btnCancel: TUniBitBtn
      Left = 612
      Top = 43
      Width = 96
      Height = 36
      Hint = ''
      Caption = #304'ptal'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
      Images = MainMod.PrjImgList
      ImageIndex = 5
      OnClick = btnCancelClick
    end
    object btnPost: TUniBitBtn
      Left = 510
      Top = 42
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Kaydet'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
      Images = MainMod.PrjImgList
      ImageIndex = 14
      OnClick = btnPostClick
    end
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
      TabOrder = 3
    end
    object lbIDY: TUniLabel
      Left = 114
      Top = 5
      Width = 220
      Height = 13
      Hint = ''
      AutoSize = False
      Caption = 'lbIDY'
      ParentFont = False
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
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
    object UniLabel6: TUniLabel
      Left = 369
      Top = 5
      Width = 96
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Son De'#287'. Yapan :'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 7
    end
    object lbSDY: TUniLabel
      Left = 468
      Top = 5
      Width = 220
      Height = 13
      Hint = ''
      AutoSize = False
      Caption = 'lbSDY'
      ParentFont = False
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 8
    end
    object UniLabel7: TUniLabel
      Left = 369
      Top = 23
      Width = 96
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Son De'#287'. Zaman'#305' :'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 9
    end
    object lbSDT: TUniLabel
      Left = 468
      Top = 23
      Width = 220
      Height = 13
      Hint = ''
      AutoSize = False
      Caption = 'lbSDT'
      ParentFont = False
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 10
    end
    object btnHelp: TUniBitBtn
      Left = 408
      Top = 43
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Yard'#305'm'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 11
      Images = MainMod.PrjImgList
      ImageIndex = 16
      OnClick = btnHelpClick
    end
    object lbKilitliSDY: TUniLabel
      Left = 110
      Top = 42
      Width = 220
      Height = 13
      Hint = ''
      AutoSize = False
      Caption = 'lbKilitliSDY'
      ParentFont = False
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 12
    end
    object lbKilitliSDT: TUniLabel
      Left = 110
      Top = 61
      Width = 220
      Height = 13
      Hint = ''
      AutoSize = False
      Caption = 'lbKilitliSDT'
      ParentFont = False
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 13
    end
    object UniLabel21: TUniLabel
      Left = 11
      Top = 61
      Width = 96
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Kilit De'#287'. Zaman'#305' :'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 14
    end
    object UniLabel22: TUniLabel
      Left = 11
      Top = 43
      Width = 96
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Kilit De'#287'. Yapan :'
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 15
    end
  end
  object pnlMsg: TUniPanel
    Left = 0
    Top = 0
    Width = 723
    Height = 47
    Hint = ''
    Align = alTop
    TabOrder = 2
    ShowCaption = False
    Caption = ''
    object UniLabel19: TUniLabel
      AlignWithMargins = True
      Left = 21
      Top = 25
      Width = 418
      Height = 13
      Hint = ''
      Margins.Left = 20
      Caption = 
        'Gerekli alanlar'#305' de'#287'i'#351'tirip kaydetti'#287'inizde, yeni bir kontrol fo' +
        'rmu olu'#351'turalacakt'#305'r.'
      Align = alTop
      ParentFont = False
      Font.Color = clMaroon
      Font.Height = -12
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
    end
    object UniLabel58: TUniLabel
      AlignWithMargins = True
      Left = 21
      Top = 6
      Width = 227
      Height = 13
      Hint = ''
      Margins.Left = 20
      Margins.Top = 5
      Caption = 'Kontrol Formu kopyas'#305' olu'#351'turuyorsunuz !  '
      Align = alTop
      ParentFont = False
      Font.Color = clMaroon
      Font.Height = -12
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
    end
  end
  object dsCheckList: TUniDataSource
    DataSet = qCheckList
    OnStateChange = dsCheckListStateChange
    OnDataChange = dsCheckListDataChange
    Left = 195
    Top = 240
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    Left = 264
    Top = 240
  end
  object qCheckList: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT *'
      'FROM data_checklist'
      'ORDER BY id')
    BeforePost = qCheckListBeforePost
    Left = 138
    Top = 240
  end
  object qKaynak: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT DISTINCT env.kaynak_id, kyn.kaynak'
      'FROM data_envanter env'
      'LEFT JOIN def_data_kaynak kyn ON kyn.id = env.kaynak_id'
      'ORDER BY 2')
    Left = 542
    Top = 176
  end
  object dsKaynak: TUniDataSource
    DataSet = qKaynak
    Left = 587
    Top = 176
  end
  object dsKontrol: TUniDataSource
    DataSet = qKontrol
    OnStateChange = dsKontrolStateChange
    Left = 450
    Top = 179
  end
  object qKontrol: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, kontrolsonuc FROM def_data_kontrolsonuc'
      'WHERE mc_id = 2'
      'ORDER BY id')
    Left = 402
    Top = 179
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
    Left = 372
    Top = 459
    Data = {
      0400020002006964030000000000000004006E616D650100C800000000000000
      00000000}
  end
  object dsDepts: TUniDataSource
    DataSet = tblDepts
    Left = 429
    Top = 459
  end
  object tblEkipman: TVirtualTable
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'name'
        DataType = ftString
        Size = 300
      end>
    Left = 372
    Top = 408
    Data = {
      0400020002006964030000000000000004006E616D6501002C01000000000000
      00000000}
  end
  object dsEkipman: TUniDataSource
    DataSet = tblEkipman
    Left = 429
    Top = 408
  end
  object tblDocs: TVirtualTable
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'name'
        DataType = ftString
        Size = 300
      end>
    Left = 372
    Top = 357
    Data = {
      0400020002006964030000000000000004006E616D6501002C01000000000000
      00000000}
  end
  object dsDocs: TUniDataSource
    DataSet = tblDocs
    Left = 429
    Top = 357
  end
  object tblDayanak: TVirtualTable
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'name'
        DataType = ftString
        Size = 300
      end>
    Left = 372
    Top = 255
    Data = {
      0400020002006964030000000000000004006E616D6501002C01000000000000
      00000000}
  end
  object dsDayanak: TUniDataSource
    DataSet = tblDayanak
    Left = 429
    Top = 255
  end
  object tblTedbir: TVirtualTable
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'name'
        DataType = ftString
        Size = 300
      end>
    Left = 372
    Top = 306
    Data = {
      0400020002006964030000000000000004006E616D6501002C01000000000000
      00000000}
  end
  object dsTedbir: TUniDataSource
    DataSet = tblTedbir
    Left = 429
    Top = 306
  end
  object qOnem: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, onemderece FROM def_data_onemderece'
      'WHERE mc_id = 2'
      'ORDER BY id')
    Left = 515
    Top = 302
  end
  object dsOnem: TUniDataSource
    DataSet = qOnem
    Left = 560
    Top = 302
  end
  object qKisi: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT DISTINCT env.kisi_id, ks.kisi'
      'FROM data_envanter env'
      'LEFT JOIN def_data_kisi ks ON ks.id = env.kaynak_id'
      'ORDER BY 2')
    Left = 542
    Top = 224
  end
  object dsKisi: TUniDataSource
    DataSet = qKisi
    Left = 587
    Top = 224
  end
  object vqchecklist: TVirtualTable
    Left = 133
    Top = 288
    Data = {04000000000000000000}
  end
end
