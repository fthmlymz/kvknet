object frmEnvanterTanim2test: TfrmEnvanterTanim2test
  Left = 0
  Top = 0
  ClientHeight = 612
  ClientWidth = 1107
  Caption = 'Envanter Formu'
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  Visible = True
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object pnlData: TUniPanel
    Left = 0
    Top = 55
    Width = 1107
    Height = 509
    Hint = ''
    Align = alClient
    TabOrder = 0
    Caption = ''
    object PgControl: TUniPageControl
      Left = 1
      Top = 1
      Width = 1105
      Height = 507
      Hint = ''
      ActivePage = pgDDayanak
      Align = alClient
      TabOrder = 1
      OnChange = PgControlChange
      object pgTemel: TUniTabSheet
        Hint = ''
        Caption = 'Temel Bilgiler'
        Font.OverrideDefaults = [ovFontHeight]
        ParentFont = False
        object UniLabel3: TUniLabel
          Left = 12
          Top = 15
          Width = 85
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Aktif'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 2
        end
        object edActive: TUniDBCheckBox
          Left = 103
          Top = 11
          Width = 30
          Height = 17
          Hint = ''
          DataField = 'active'
          DataSource = dsEnvanter
          ValueChecked = 'E'
          ValueUnchecked = 'H'
          Caption = ''
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 7
          ParentColor = False
          Color = clBtnFace
        end
        object UniLabel1: TUniLabel
          Left = 12
          Top = 38
          Width = 85
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Tarih'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 0
        end
        object edTarih: TUniDBDateTimePicker
          Left = 103
          Top = 35
          Width = 184
          Hint = ''
          DataField = 'tarih'
          DataSource = dsEnvanter
          DateTime = 44100.000000000000000000
          DateFormat = 'dd.MM.yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 8
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
        end
        object UniLabel9: TUniLabel
          Left = 12
          Top = 68
          Width = 85
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Departman'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 4
        end
        object edDept: TUniDBLookupComboBox
          Left = 103
          Top = 65
          Width = 345
          Height = 28
          Hint = ''
          ListOnlyMode = lmFollowSource
          ListField = 'title'
          ListSource = dsDept
          KeyField = 'id'
          ListFieldIndex = 0
          DataField = 'dept_id'
          DataSource = dsEnvanter
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          EmptyText = 'Se'#231'im Yap'#305'lmam'#305#351
          TabOrder = 9
          Color = clWindow
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase('#39'TR'#39')); '#13#10'  sender.inputEl.' +
              'dom.setSelectionRange(pos, pos);'#13#10'}'#13#10)
          Style = csDropDown
        end
        object UniLabel2: TUniLabel
          Left = 12
          Top = 100
          Width = 85
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'S'#252're'#231
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
        end
        object edSurec: TUniDBLookupComboBox
          Left = 103
          Top = 95
          Width = 345
          Height = 28
          Hint = ''
          ListOnlyMode = lmFollowSource
          ListField = 'surec'
          ListSource = dsSurec
          KeyField = 'id'
          ListFieldIndex = 0
          DataField = 'surec_id'
          DataSource = dsEnvanter
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          EmptyText = 'Se'#231'im Yap'#305'lmam'#305#351
          TabOrder = 10
          Color = clWindow
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase('#39'TR'#39')); '#13#10'  sender.inputEl.' +
              'dom.setSelectionRange(pos, pos);'#13#10'}')
          Style = csDropDown
        end
        object UniLabel8: TUniLabel
          Left = 12
          Top = 127
          Width = 85
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Veri Kayna'#287#305
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 3
        end
        object edKaynak: TUniDBLookupComboBox
          Left = 103
          Top = 125
          Width = 345
          Height = 28
          Hint = ''
          ListOnlyMode = lmFollowSource
          ListField = 'kaynak'
          ListSource = dsKaynak
          KeyField = 'id'
          ListFieldIndex = 0
          DataField = 'kaynak_id'
          DataSource = dsEnvanter
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          EmptyText = 'Se'#231'im Yap'#305'lmam'#305#351
          TabOrder = 11
          Color = clWindow
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase('#39'TR'#39')); '#13#10'  sender.inputEl.' +
              'dom.setSelectionRange(pos, pos);'#13#10'}')
          Style = csDropDown
          OnChange = edKaynakChange
        end
        object edNitelik: TUniDBCheckBox
          Left = 103
          Top = 213
          Width = 250
          Height = 17
          Hint = ''
          DataField = 'nitelik'
          DataSource = dsEnvanter
          ValueChecked = 'E'
          ValueUnchecked = 'H'
          Caption = #214'zel Nitelikte Ki'#351'isel Veri '#304#231'eriyor'
          ParentFont = False
          Font.Color = 13226752
          Font.Style = [fsBold]
          Font.OverrideDefaults = [ovFontHeight]
          TabStop = False
          TabOrder = 14
          ParentColor = False
          Color = clBtnFace
          ReadOnly = True
        end
        object UniLabel37: TUniLabel
          Left = 12
          Top = 189
          Width = 85
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = #214'nem Derecesi'
          ParentFont = False
          Font.Color = 13226752
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 6
        end
        object edOnem: TUniDBLookupComboBox
          Left = 103
          Top = 185
          Width = 345
          Height = 28
          Hint = ''
          ListOnlyMode = lmFollowSource
          ListField = 'onemderece'
          ListSource = dsOnem
          KeyField = 'id'
          ListFieldIndex = 0
          DataField = 'onem_derecesi_id'
          DataSource = dsCheckList
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          EmptyText = 'Se'#231'im Yap'#305'lmam'#305#351
          TabStop = False
          TabOrder = 13
          ReadOnly = True
          Color = clWindow
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase('#39'TR'#39')); '#13#10'  sender.inputEl.' +
              'dom.setSelectionRange(pos, pos);'#13#10'}')
          Style = csDropDown
        end
        object UniLabel23: TUniLabel
          Left = 12
          Top = 157
          Width = 85
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Veri Konusu Ki'#351'i'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 5
        end
        object edKisi: TUniDBLookupComboBox
          Left = 103
          Top = 155
          Width = 345
          Height = 28
          Hint = ''
          ListOnlyMode = lmFollowSource
          ListField = 'kisi'
          ListSource = dsKisi
          KeyField = 'id'
          ListFieldIndex = 0
          DataField = 'kisi_id'
          DataSource = dsEnvanter
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          EmptyText = 'Se'#231'im Yap'#305'lmam'#305#351
          TabOrder = 12
          Color = clWindow
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase('#39'TR'#39')); '#13#10'  sender.inputEl.' +
              'dom.setSelectionRange(pos, pos);'#13#10'}')
          Style = csDropDown
          OnChange = edKaynakChange
        end
        object grpFSaklama: TUniGroupBox
          Left = 480
          Top = 24
          Width = 436
          Height = 76
          Hint = ''
          Caption = '  Fiziksel Saklama  '
          TabOrder = 15
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          object UniLabel39: TUniLabel
            Left = 9
            Top = 46
            Width = 49
            Height = 13
            Hint = ''
            Caption = 'Faaliyetin'
            ParentFont = False
            Font.Color = clDefault
            Font.OverrideDefaults = [ovFontHeight]
            TabOrder = 2
          end
          object edFImha: TUniDBComboBox
            Left = 63
            Top = 41
            Width = 118
            Hint = ''
            DataField = 'sakl_fsure_imha'
            DataSource = dsEnvanter
            Style = csDropDownList
            Items.Strings = (
              'BA'#350'LANGI'#199
              'B'#304'T'#304#350)
            TabOrder = 5
            IconItems = <>
          end
          object UniLabel41: TUniLabel
            Left = 189
            Top = 46
            Width = 86
            Height = 13
            Hint = ''
            Caption = 'tarihinden sonra'
            ParentFont = False
            Font.Color = clDefault
            Font.OverrideDefaults = [ovFontHeight]
            TabOrder = 3
          end
          object edFSure: TUniDBNumberEdit
            Left = 274
            Top = 41
            Width = 57
            Height = 22
            Hint = ''
            DataField = 'sakl_fsure_sure'
            DataSource = dsEnvanter
            TabOrder = 6
            MaxValue = 999.000000000000000000
            DecimalPrecision = 0
            DecimalSeparator = ','
          end
          object edFSureTip: TUniDBComboBox
            Left = 337
            Top = 41
            Width = 85
            Hint = ''
            DataField = 'sakl_fsure_tip'
            DataSource = dsEnvanter
            Style = csDropDownList
            Items.Strings = (
              'YIL'
              'AY'
              'G'#220'N')
            TabOrder = 7
            IconItems = <>
          end
          object UniLabel13: TUniLabel
            Left = 9
            Top = 19
            Width = 109
            Height = 13
            Hint = ''
            Caption = 'Veriler Fiziksel Olarak'
            ParentFont = False
            Font.Color = 13226752
            Font.OverrideDefaults = [ovFontHeight]
            TabOrder = 1
          end
          object edFSureVar: TUniDBComboBox
            Left = 122
            Top = 15
            Width = 145
            Hint = ''
            DataField = 'sakl_fsure_var'
            DataSource = dsEnvanter
            Style = csDropDownList
            Items.Strings = (
              'SAKLANIYOR'
              'SAKLANMIYOR')
            TabOrder = 4
            IconItems = <>
            OnChange = edFSureVarChange
          end
        end
        object grpSSaklama: TUniGroupBox
          Left = 480
          Top = 128
          Width = 436
          Height = 76
          Hint = ''
          Caption = '  Dijital Saklama  '
          TabOrder = 16
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          object edSSureTip: TUniDBComboBox
            Left = 339
            Top = 41
            Width = 85
            Hint = ''
            DataField = 'sakl_ssure_tip'
            DataSource = dsEnvanter
            Style = csDropDownList
            Items.Strings = (
              'YIL'
              'AY'
              'G'#220'N')
            ParentFont = False
            Font.OverrideDefaults = [ovFontHeight]
            TabOrder = 7
            IconItems = <>
          end
          object edSSure: TUniDBNumberEdit
            Left = 276
            Top = 41
            Width = 57
            Height = 22
            Hint = ''
            DataField = 'sakl_ssure_sure'
            DataSource = dsEnvanter
            ParentFont = False
            Font.OverrideDefaults = [ovFontHeight]
            TabOrder = 6
            MaxValue = 999.000000000000000000
            DecimalPrecision = 0
            DecimalSeparator = ','
          end
          object UniLabel40: TUniLabel
            Left = 9
            Top = 46
            Width = 49
            Height = 13
            Hint = ''
            Caption = 'Faaliyetin'
            ParentFont = False
            Font.Color = clDefault
            Font.OverrideDefaults = [ovFontHeight]
            TabOrder = 2
          end
          object edSImha: TUniDBComboBox
            Left = 63
            Top = 41
            Width = 118
            Hint = ''
            DataField = 'sakl_ssure_imha'
            DataSource = dsEnvanter
            Style = csDropDownList
            Items.Strings = (
              'BA'#350'LANGI'#199
              'B'#304'T'#304#350)
            ParentFont = False
            Font.OverrideDefaults = [ovFontHeight]
            TabOrder = 5
            IconItems = <>
          end
          object UniLabel42: TUniLabel
            Left = 189
            Top = 46
            Width = 86
            Height = 13
            Hint = ''
            Caption = 'tarihinden sonra'
            ParentFont = False
            Font.Color = clDefault
            Font.OverrideDefaults = [ovFontHeight]
            TabOrder = 3
          end
          object UniLabel19: TUniLabel
            Left = 9
            Top = 19
            Width = 102
            Height = 13
            Hint = ''
            Caption = 'Veriler Dijital Olarak'
            ParentFont = False
            Font.Color = 13226752
            Font.OverrideDefaults = [ovFontHeight]
            TabOrder = 1
          end
          object edSSureVar: TUniDBComboBox
            Left = 117
            Top = 15
            Width = 145
            Hint = ''
            DataField = 'sakl_ssure_var'
            DataSource = dsEnvanter
            Style = csDropDownList
            Items.Strings = (
              'SAKLANIYOR'
              'SAKLANMIYOR')
            ParentFont = False
            Font.OverrideDefaults = [ovFontHeight]
            TabOrder = 4
            IconItems = <>
            OnChange = edSSureVarChange
          end
        end
        object lbactive: TUniLabel
          Left = 129
          Top = 15
          Width = 120
          Height = 13
          Hint = ''
          AutoSize = False
          Caption = '......'
          ParentFont = False
          Font.Color = clMaroon
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 17
        end
      end
      object pgDetay: TUniTabSheet
        Hint = ''
        Caption = 'Detay Bilgiler'
        Font.OverrideDefaults = [ovFontHeight]
        ParentFont = False
        object pgdetaycontrol: TUniPageControl
          Left = 287
          Top = 0
          Width = 810
          Height = 479
          Hint = ''
          ActivePage = pgSakl_Erisim
          Align = alClient
          TabOrder = 0
          OnChange = pgdetaycontrolChange
          object pgTopl_Amac: TUniTabSheet
            Hint = ''
            Caption = 'Veri Toplama (Ama'#231'lar)'
            Font.OverrideDefaults = [ovFontHeight]
            ParentFont = False
            object grdAmacTopD: TUniDBGrid
              Left = 10
              Top = 207
              Width = 400
              Height = 170
              Hint = ''
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
              WebOptions.Paged = False
              WebOptions.CustomizableCells = False
              WebOptions.FetchAll = True
              LoadMask.Message = 'Y'#252'kleniyor...'
              EmptyText = 'Veri Bulunamad'#305
              Font.OverrideDefaults = [ovFontHeight]
              ParentFont = False
              TabOrder = 0
              Columns = <
                item
                  FieldName = 'name'
                  Title.Alignment = taCenter
                  Title.Caption = 'Veri Toplama Ama'#231'lar'#305
                  Width = 370
                  Font.OverrideDefaults = [ovFontHeight]
                  ReadOnly = True
                  DisplayMemo = True
                end>
            end
            object pnlamacvt: TUniPanel
              Left = 0
              Top = 0
              Width = 552
              Height = 451
              Hint = ''
              Align = alClient
              TabOrder = 1
              ShowCaption = False
              Caption = ''
              object rgamacvt: TUniRadioGroup
                Left = 1
                Top = 1
                Width = 550
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
              object grdAmacTop: TUniDBGrid
                Left = 1
                Top = 51
                Width = 550
                Height = 399
                Hint = ''
                DataSource = dstamac
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
                WebOptions.Paged = False
                WebOptions.CustomizableCells = False
                WebOptions.FetchAll = True
                LoadMask.Message = 'Y'#252'kleniyor...'
                EmptyText = 'Veri Bulunamad'#305
                Align = alClient
                Font.OverrideDefaults = [ovFontHeight]
                ParentFont = False
                TabOrder = 2
                Columns = <
                  item
                    FieldName = 'name'
                    Title.Alignment = taCenter
                    Title.Caption = 'Genel Veri Toplama Ama'#231'lar'#305
                    Width = 370
                    Font.OverrideDefaults = [ovFontHeight]
                    ReadOnly = True
                    DisplayMemo = True
                  end>
              end
            end
            object UniPanel10: TUniPanel
              Left = 552
              Top = 0
              Width = 250
              Height = 451
              Hint = ''
              Align = alRight
              TabOrder = 2
              BorderStyle = ubsNone
              ShowCaption = False
              Caption = ''
              object btnAmacTopAdd: TUniBitBtn
                Left = 17
                Top = 10
                Width = 30
                Height = 30
                Hint = ''
                Caption = ''
                ParentFont = False
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 1
                Images = MainMod.BtnImgList
                ImageIndex = 0
                OnClick = btnAmacTopAddClick
              end
              object btnAmacTopDel: TUniBitBtn
                Left = 17
                Top = 46
                Width = 30
                Height = 30
                Hint = ''
                Caption = ''
                ParentFont = False
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 2
                Images = MainMod.BtnImgList
                ImageIndex = 5
                OnClick = btnAmacTopDelClick
              end
              object btnAmacTopNew: TUniBitBtn
                Left = 17
                Top = 82
                Width = 30
                Height = 30
                Hint = ''
                Caption = ''
                ParentFont = False
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 3
                Images = MainMod.BtnImgList
                ImageIndex = 1
                OnClick = btnAmacTopNewClick
              end
              object UniLabel21: TUniLabel
                Left = 70
                Top = 10
                Width = 162
                Height = 170
                Hint = ''
                AutoSize = False
                Caption = 
                  'Bu k'#305's'#305'mda girdi'#287'iniz ama'#231'lar, veri kayna'#287#305'n'#305'n geneli i'#231'in ge'#231'er' +
                  'lidir ve t'#252'm veri tipleri i'#231'in ge'#231'erli olacakt'#305'r.'
                ParentFont = False
                Font.Color = 13226752
                Font.Height = -12
                Font.Style = [fsBold]
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 4
              end
            end
          end
          object pgTopl_Metod: TUniTabSheet
            Hint = ''
            Caption = 'Veri Toplama (Metodlar)'
            Font.OverrideDefaults = [ovFontHeight]
            ParentFont = False
            object grdMetodTopD: TUniDBGrid
              Left = 10
              Top = 207
              Width = 400
              Height = 170
              Hint = ''
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
              WebOptions.Paged = False
              WebOptions.CustomizableCells = False
              WebOptions.FetchAll = True
              LoadMask.Message = 'Y'#252'kleniyor...'
              EmptyText = 'Veri Bulunamad'#305
              Font.OverrideDefaults = [ovFontHeight]
              ParentFont = False
              TabOrder = 0
              Columns = <
                item
                  FieldName = 'name'
                  Title.Alignment = taCenter
                  Title.Caption = 'Veri Toplama Metodlar'#305
                  Width = 370
                  Font.OverrideDefaults = [ovFontHeight]
                  ReadOnly = True
                  DisplayMemo = True
                end>
            end
            object pnlmetodvt: TUniPanel
              Left = 0
              Top = 0
              Width = 552
              Height = 451
              Hint = ''
              Align = alClient
              TabOrder = 1
              ShowCaption = False
              Caption = ''
              object rgmetodvt: TUniRadioGroup
                Left = 1
                Top = 1
                Width = 550
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
              object grdMetodTop: TUniDBGrid
                Left = 1
                Top = 51
                Width = 550
                Height = 399
                Hint = ''
                DataSource = dstmetod
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
                WebOptions.Paged = False
                WebOptions.CustomizableCells = False
                WebOptions.FetchAll = True
                LoadMask.Message = 'Y'#252'kleniyor...'
                EmptyText = 'Veri Bulunamad'#305
                Align = alClient
                Font.OverrideDefaults = [ovFontHeight]
                ParentFont = False
                TabOrder = 2
                Columns = <
                  item
                    FieldName = 'name'
                    Title.Alignment = taCenter
                    Title.Caption = 'Genel Veri Toplama Metodlar'#305
                    Width = 370
                    Font.OverrideDefaults = [ovFontHeight]
                    ReadOnly = True
                    DisplayMemo = True
                  end>
              end
            end
            object UniPanel9: TUniPanel
              Left = 552
              Top = 0
              Width = 250
              Height = 451
              Hint = ''
              Align = alRight
              TabOrder = 2
              BorderStyle = ubsNone
              ShowCaption = False
              Caption = ''
              object btnMetodTopAdd: TUniBitBtn
                Left = 18
                Top = 10
                Width = 30
                Height = 30
                Hint = ''
                Caption = ''
                ParentFont = False
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 1
                Images = MainMod.BtnImgList
                ImageIndex = 0
                OnClick = btnMetodTopAddClick
              end
              object btnMetodTopDel: TUniBitBtn
                Left = 18
                Top = 46
                Width = 30
                Height = 30
                Hint = ''
                Caption = ''
                ParentFont = False
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 2
                Images = MainMod.BtnImgList
                ImageIndex = 5
                OnClick = btnMetodTopDelClick
              end
              object btnMetodTopNew: TUniBitBtn
                Left = 18
                Top = 82
                Width = 30
                Height = 30
                Hint = ''
                Caption = ''
                ParentFont = False
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 3
                Images = MainMod.BtnImgList
                ImageIndex = 1
                OnClick = btnMetodTopNewClick
              end
              object UniLabel43: TUniLabel
                Left = 65
                Top = 3
                Width = 162
                Height = 170
                Hint = ''
                AutoSize = False
                Caption = 
                  'Bu k'#305's'#305'mda girdi'#287'iniz metodlar, veri kayna'#287#305'n'#305'n geneli i'#231'in ge'#231'e' +
                  'rlidir ve t'#252'm veri tipleri i'#231'in ge'#231'erli olacakt'#305'r.'
                ParentFont = False
                Font.Color = 13226752
                Font.Height = -12
                Font.Style = [fsBold]
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 4
              end
            end
          end
          object pgSakl_Amac: TUniTabSheet
            Hint = ''
            Caption = 'Veri Saklama (Ama'#231'lar)'
            Font.OverrideDefaults = [ovFontHeight]
            ParentFont = False
            object grdAmacSakD: TUniDBGrid
              Left = 10
              Top = 207
              Width = 400
              Height = 170
              Hint = ''
              TitleFont.OverrideDefaults = [ovFontHeight]
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
              WebOptions.Paged = False
              WebOptions.CustomizableCells = False
              WebOptions.FetchAll = True
              LoadMask.Message = 'Veri y'#252'kleniyor...'
              EmptyText = 'Veri yok'
              TabOrder = 0
              Columns = <
                item
                  FieldName = 'name'
                  Title.Alignment = taCenter
                  Title.Caption = 'Veri Saklama Ama'#231'lar'#305
                  Title.Font.OverrideDefaults = [ovFontHeight]
                  Width = 380
                  Font.OverrideDefaults = [ovFontHeight]
                  ReadOnly = True
                  DisplayMemo = True
                end>
            end
            object pnlamacvs: TUniPanel
              Left = 0
              Top = 0
              Width = 552
              Height = 451
              Hint = ''
              Align = alClient
              TabOrder = 1
              ShowCaption = False
              Caption = ''
              object rgamacvs: TUniRadioGroup
                Left = 1
                Top = 1
                Width = 550
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
              object grdAmacSak: TUniDBGrid
                Left = 1
                Top = 51
                Width = 550
                Height = 399
                Hint = ''
                TitleFont.OverrideDefaults = [ovFontHeight]
                DataSource = dssamac
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
                WebOptions.Paged = False
                WebOptions.CustomizableCells = False
                WebOptions.FetchAll = True
                LoadMask.Message = 'Veri y'#252'kleniyor...'
                EmptyText = 'Veri bulunamad'#305
                Align = alClient
                TabOrder = 2
                Columns = <
                  item
                    FieldName = 'name'
                    Title.Alignment = taCenter
                    Title.Caption = 'Genel Veri Saklama Ama'#231'lar'#305
                    Title.Font.OverrideDefaults = [ovFontHeight]
                    Width = 380
                    Font.OverrideDefaults = [ovFontHeight]
                    ReadOnly = True
                    DisplayMemo = True
                  end>
              end
            end
            object UniPanel8: TUniPanel
              Left = 552
              Top = 0
              Width = 250
              Height = 451
              Hint = ''
              Align = alRight
              TabOrder = 2
              BorderStyle = ubsNone
              ShowCaption = False
              Caption = ''
              object btnAmacSakAdd: TUniBitBtn
                Left = 19
                Top = 10
                Width = 30
                Height = 30
                Hint = ''
                Caption = ''
                ParentFont = False
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 1
                Images = MainMod.BtnImgList
                ImageIndex = 0
                OnClick = btnAmacSakAddClick
              end
              object btnAmacSakDel: TUniBitBtn
                Left = 19
                Top = 46
                Width = 30
                Height = 30
                Hint = ''
                Caption = ''
                ParentFont = False
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 2
                Images = MainMod.BtnImgList
                ImageIndex = 5
                OnClick = btnAmacSakDelClick
              end
              object btnAmacSakNew: TUniBitBtn
                Left = 19
                Top = 82
                Width = 30
                Height = 30
                Hint = ''
                Caption = ''
                ParentFont = False
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 3
                Images = MainMod.BtnImgList
                ImageIndex = 1
                OnClick = btnAmacSakNewClick
              end
              object UniLabel46: TUniLabel
                Left = 70
                Top = 10
                Width = 162
                Height = 170
                Hint = ''
                AutoSize = False
                Caption = 
                  'Bu k'#305's'#305'mda girdi'#287'iniz ama'#231'lar, veri kayna'#287#305'n'#305'n geneli i'#231'in ge'#231'er' +
                  'lidir ve t'#252'm veri tipleri i'#231'in ge'#231'erli olacakt'#305'r.'
                ParentFont = False
                Font.Color = 13226752
                Font.Height = -12
                Font.Style = [fsBold]
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 4
              end
            end
          end
          object pgSakl_Metod: TUniTabSheet
            Hint = ''
            Caption = 'Veri Saklama (Metodlar)'
            Font.OverrideDefaults = [ovFontHeight]
            ParentFont = False
            object grdMetodSakD: TUniDBGrid
              Left = 10
              Top = 207
              Width = 400
              Height = 170
              Hint = ''
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
              WebOptions.Paged = False
              WebOptions.CustomizableCells = False
              WebOptions.FetchAll = True
              LoadMask.Message = 'Y'#252'kleniyor...'
              EmptyText = 'Veri Bulunamad'#305
              Font.OverrideDefaults = [ovFontHeight]
              ParentFont = False
              TabOrder = 0
              Columns = <
                item
                  FieldName = 'name'
                  Title.Alignment = taCenter
                  Title.Caption = 'Veri Saklama Metodlar'#305
                  Width = 380
                  Font.OverrideDefaults = [ovFontHeight]
                  ReadOnly = True
                  DisplayMemo = True
                end>
            end
            object pnlmetodvs: TUniPanel
              Left = 0
              Top = 0
              Width = 552
              Height = 451
              Hint = ''
              Align = alClient
              TabOrder = 1
              ShowCaption = False
              Caption = ''
              object rgmetodvs: TUniRadioGroup
                Left = 1
                Top = 1
                Width = 550
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
              object grdMetodSak: TUniDBGrid
                Left = 1
                Top = 51
                Width = 550
                Height = 399
                Hint = ''
                DataSource = dssmetod
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
                WebOptions.Paged = False
                WebOptions.CustomizableCells = False
                WebOptions.FetchAll = True
                LoadMask.Message = 'Y'#252'kleniyor...'
                EmptyText = 'Veri Bulunamad'#305
                Align = alClient
                Font.OverrideDefaults = [ovFontHeight]
                ParentFont = False
                TabOrder = 2
                Columns = <
                  item
                    FieldName = 'name'
                    Title.Alignment = taCenter
                    Title.Caption = 'Genel Veri Saklama Metodlar'#305
                    Width = 380
                    Font.OverrideDefaults = [ovFontHeight]
                    ReadOnly = True
                    DisplayMemo = True
                  end>
              end
            end
            object UniPanel7: TUniPanel
              Left = 552
              Top = 0
              Width = 250
              Height = 451
              Hint = ''
              Align = alRight
              TabOrder = 2
              BorderStyle = ubsNone
              ShowCaption = False
              Caption = ''
              object btnMetodSakAdd: TUniBitBtn
                Left = 17
                Top = 10
                Width = 30
                Height = 30
                Hint = ''
                Caption = ''
                ParentFont = False
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 1
                Images = MainMod.BtnImgList
                ImageIndex = 0
                OnClick = btnMetodSakAddClick
              end
              object btnMetodSakDel: TUniBitBtn
                Left = 17
                Top = 46
                Width = 30
                Height = 30
                Hint = ''
                Caption = ''
                ParentFont = False
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 2
                Images = MainMod.BtnImgList
                ImageIndex = 5
                OnClick = btnMetodSakDelClick
              end
              object btnMetodSakNew: TUniBitBtn
                Left = 17
                Top = 82
                Width = 30
                Height = 30
                Hint = ''
                Caption = ''
                ParentFont = False
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 3
                Images = MainMod.BtnImgList
                ImageIndex = 1
                OnClick = btnMetodSakNewClick
              end
              object UniLabel47: TUniLabel
                Left = 74
                Top = 10
                Width = 162
                Height = 170
                Hint = ''
                AutoSize = False
                Caption = 
                  'Bu k'#305's'#305'mda girdi'#287'iniz metodlar, veri kayna'#287#305'n'#305'n geneli i'#231'in ge'#231'e' +
                  'rlidir ve t'#252'm veri tipleri i'#231'in ge'#231'erli olacakt'#305'r.'
                ParentFont = False
                Font.Color = 13226752
                Font.Height = -12
                Font.Style = [fsBold]
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 4
              end
            end
          end
          object pgSakl_Erisim: TUniTabSheet
            Hint = ''
            Caption = 'Veri Eri'#351'im'
            Font.OverrideDefaults = [ovFontHeight]
            ParentFont = False
            object grdDeptsD: TUniDBGrid
              Left = 10
              Top = 207
              Width = 400
              Height = 170
              Hint = ''
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
              WebOptions.Paged = False
              WebOptions.CustomizableCells = False
              WebOptions.FetchAll = True
              LoadMask.Message = 'Y'#252'kleniyor...'
              EmptyText = 'Veri Bulunamad'#305
              Font.OverrideDefaults = [ovFontHeight]
              ParentFont = False
              TabOrder = 0
              Columns = <
                item
                  FieldName = 'name'
                  Title.Alignment = taCenter
                  Title.Caption = 'Eri'#351'im Sa'#287'layan Di'#287'er Departmanlar'
                  Width = 380
                  Font.OverrideDefaults = [ovFontHeight]
                  ReadOnly = True
                  DisplayMemo = True
                end>
            end
            object pnveriErisim: TUniPanel
              Left = 0
              Top = 0
              Width = 552
              Height = 451
              Hint = ''
              Align = alClient
              TabOrder = 1
              ShowCaption = False
              Caption = ''
              object rgveriErisim: TUniRadioGroup
                Left = 1
                Top = 1
                Width = 550
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
                Width = 550
                Height = 399
                Hint = ''
                DataSource = dserisim
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
                WebOptions.Paged = False
                WebOptions.CustomizableCells = False
                WebOptions.FetchAll = True
                LoadMask.Message = 'Y'#252'kleniyor...'
                EmptyText = 'Veri Bulunamad'#305
                Align = alClient
                Font.OverrideDefaults = [ovFontHeight]
                ParentFont = False
                TabOrder = 2
                Columns = <
                  item
                    FieldName = 'name'
                    Title.Alignment = taCenter
                    Title.Caption = 'Genel Eri'#351'im Sa'#287'layan Di'#287'er Departmanlar'
                    Width = 380
                    Font.OverrideDefaults = [ovFontHeight]
                    ReadOnly = True
                    DisplayMemo = True
                  end>
              end
            end
            object UniPanel6: TUniPanel
              Left = 552
              Top = 0
              Width = 250
              Height = 451
              Hint = ''
              Align = alRight
              TabOrder = 2
              BorderStyle = ubsNone
              ShowCaption = False
              Caption = ''
              object btnDeptsAdd: TUniBitBtn
                Left = 20
                Top = 10
                Width = 30
                Height = 30
                Hint = ''
                Caption = ''
                ParentFont = False
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 1
                Images = MainMod.BtnImgList
                ImageIndex = 0
                OnClick = btnDeptsAddClick
              end
              object btnDeptsDel: TUniBitBtn
                Left = 20
                Top = 46
                Width = 30
                Height = 30
                Hint = ''
                Caption = ''
                ParentFont = False
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 2
                Images = MainMod.BtnImgList
                ImageIndex = 5
                OnClick = btnDeptsDelClick
              end
              object btnDeptsNew: TUniBitBtn
                Left = 20
                Top = 82
                Width = 30
                Height = 30
                Hint = ''
                Caption = ''
                ParentFont = False
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 3
                Images = MainMod.BtnImgList
                ImageIndex = 1
                OnClick = btnDeptsNewClick
              end
              object UniLabel49: TUniLabel
                Left = 77
                Top = 10
                Width = 162
                Height = 170
                Hint = ''
                AutoSize = False
                Caption = 
                  'Bu k'#305's'#305'mda girdi'#287'iniz departmanlar, veri kayna'#287#305'n'#305'n geneli i'#231'in ' +
                  'ge'#231'erlidir ve t'#252'm veri tipleri i'#231'in ge'#231'erli olacakt'#305'r.'
                ParentFont = False
                Font.Color = 13226752
                Font.Height = -12
                Font.Style = [fsBold]
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 4
              end
            end
          end
          object pgPayl_Amac: TUniTabSheet
            Hint = ''
            Caption = 'Veri Payla'#351'ma (Ama'#231'lar)'
            Font.OverrideDefaults = [ovFontHeight]
            ParentFont = False
            object grdAmacPayD: TUniDBGrid
              Left = 10
              Top = 207
              Width = 400
              Height = 170
              Hint = ''
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
              WebOptions.Paged = False
              WebOptions.CustomizableCells = False
              WebOptions.FetchAll = True
              LoadMask.Message = 'Y'#252'kleniyor...'
              EmptyText = 'Veri Bulunamad'#305
              Font.OverrideDefaults = [ovFontHeight]
              ParentFont = False
              TabOrder = 0
              Columns = <
                item
                  FieldName = 'name'
                  Title.Alignment = taCenter
                  Title.Caption = 'Veri Payla'#351'ma Ama'#231'lar'#305
                  Width = 380
                  Font.OverrideDefaults = [ovFontHeight]
                  ReadOnly = True
                  DisplayMemo = True
                end>
            end
            object pnlamacvp: TUniPanel
              Left = 0
              Top = 0
              Width = 552
              Height = 451
              Hint = ''
              Align = alClient
              TabOrder = 1
              ShowCaption = False
              Caption = ''
              object rgamacvp: TUniRadioGroup
                Left = 1
                Top = 1
                Width = 550
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
              object grdAmacPay: TUniDBGrid
                Left = 1
                Top = 51
                Width = 550
                Height = 399
                Hint = ''
                DataSource = dspamac
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
                WebOptions.Paged = False
                WebOptions.CustomizableCells = False
                WebOptions.FetchAll = True
                LoadMask.Message = 'Y'#252'kleniyor...'
                EmptyText = 'Veri Bulunamad'#305
                Align = alClient
                Font.OverrideDefaults = [ovFontHeight]
                ParentFont = False
                TabOrder = 2
                Columns = <
                  item
                    FieldName = 'name'
                    Title.Alignment = taCenter
                    Title.Caption = 'Genel Veri Payla'#351'ma Ama'#231'lar'#305
                    Width = 380
                    Font.OverrideDefaults = [ovFontHeight]
                    ReadOnly = True
                    DisplayMemo = True
                  end>
              end
            end
            object UniPanel5: TUniPanel
              Left = 552
              Top = 0
              Width = 250
              Height = 451
              Hint = ''
              Align = alRight
              TabOrder = 2
              ShowCaption = False
              Caption = ''
              object btnAmacPayAdd: TUniBitBtn
                AlignWithMargins = True
                Left = 16
                Top = 14
                Width = 30
                Height = 30
                Hint = ''
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
                Caption = ''
                ParentFont = False
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 1
                Images = MainMod.BtnImgList
                ImageIndex = 0
                OnClick = btnAmacPayAddClick
              end
              object btnAmacPayDel: TUniBitBtn
                AlignWithMargins = True
                Left = 16
                Top = 52
                Width = 30
                Height = 30
                Hint = ''
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
                Caption = ''
                ParentFont = False
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 2
                Images = MainMod.BtnImgList
                ImageIndex = 5
                OnClick = btnAmacPayDelClick
              end
              object btnAmacPayNew: TUniBitBtn
                AlignWithMargins = True
                Left = 16
                Top = 91
                Width = 30
                Height = 30
                Hint = ''
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
                Caption = ''
                ParentFont = False
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 3
                Images = MainMod.BtnImgList
                ImageIndex = 1
                OnClick = btnAmacPayNewClick
              end
              object UniLabel51: TUniLabel
                Left = 74
                Top = 10
                Width = 162
                Height = 170
                Hint = ''
                AutoSize = False
                Caption = 
                  'Bu k'#305's'#305'mda girdi'#287'iniz ama'#231'lar, veri kayna'#287#305'n'#305'n geneli i'#231'in ge'#231'er' +
                  'lidir ve t'#252'm veri tipleri i'#231'in ge'#231'erli olacakt'#305'r.'
                ParentFont = False
                Font.Color = 13226752
                Font.Height = -12
                Font.Style = [fsBold]
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 4
              end
            end
          end
          object pgPayl_Metod: TUniTabSheet
            Hint = ''
            Caption = 'Veri Payla'#351'ma (Metodlar)'
            Font.OverrideDefaults = [ovFontHeight]
            ParentFont = False
            object grdMetodPayD: TUniDBGrid
              Left = 13
              Top = 207
              Width = 400
              Height = 170
              Hint = ''
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
              WebOptions.Paged = False
              WebOptions.CustomizableCells = False
              WebOptions.FetchAll = True
              LoadMask.Message = 'Y'#252'kleniyor...'
              EmptyText = 'Veri Bulunamad'#305
              Font.OverrideDefaults = [ovFontHeight]
              ParentFont = False
              TabOrder = 0
              Columns = <
                item
                  FieldName = 'name'
                  Title.Alignment = taCenter
                  Title.Caption = 'Veri Payla'#351#305'm Metodlar'#305
                  Width = 380
                  Font.OverrideDefaults = [ovFontHeight]
                  ReadOnly = True
                  DisplayMemo = True
                end>
            end
            object pnlmetodvp: TUniPanel
              Left = 0
              Top = 0
              Width = 552
              Height = 451
              Hint = ''
              Align = alClient
              TabOrder = 1
              ShowCaption = False
              Caption = ''
              object rgmetodvp: TUniRadioGroup
                Left = 1
                Top = 1
                Width = 550
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
              object grdMetodPay: TUniDBGrid
                Left = 1
                Top = 51
                Width = 550
                Height = 399
                Hint = ''
                DataSource = dspmetod
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
                WebOptions.Paged = False
                WebOptions.CustomizableCells = False
                WebOptions.FetchAll = True
                LoadMask.Message = 'Y'#252'kleniyor...'
                EmptyText = 'Veri Bulunamad'#305
                Align = alClient
                Font.OverrideDefaults = [ovFontHeight]
                ParentFont = False
                TabOrder = 2
                Columns = <
                  item
                    FieldName = 'name'
                    Title.Alignment = taCenter
                    Title.Caption = 'Genel Veri Payla'#351#305'm Metodlar'#305
                    Width = 380
                    Font.OverrideDefaults = [ovFontHeight]
                    ReadOnly = True
                    DisplayMemo = True
                  end>
              end
            end
            object UniPanel4: TUniPanel
              Left = 552
              Top = 0
              Width = 250
              Height = 451
              Hint = ''
              Align = alRight
              TabOrder = 2
              BorderStyle = ubsNone
              ShowCaption = False
              Caption = ''
              object btnMetodPayAdd: TUniBitBtn
                AlignWithMargins = True
                Left = 16
                Top = 13
                Width = 30
                Height = 32
                Hint = ''
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
                Caption = ''
                ParentFont = False
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 1
                Images = MainMod.BtnImgList
                ImageIndex = 0
                OnClick = btnMetodPayAddClick
              end
              object btnMetodPayDel: TUniBitBtn
                AlignWithMargins = True
                Left = 16
                Top = 54
                Width = 30
                Height = 32
                Hint = ''
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
                Caption = ''
                ParentFont = False
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 2
                Images = MainMod.BtnImgList
                ImageIndex = 5
                OnClick = btnMetodPayDelClick
              end
              object btnMetodPayNew: TUniBitBtn
                AlignWithMargins = True
                Left = 16
                Top = 96
                Width = 30
                Height = 32
                Hint = ''
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
                Caption = ''
                ParentFont = False
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 3
                Images = MainMod.BtnImgList
                ImageIndex = 1
                OnClick = btnMetodPayNewClick
              end
              object UniLabel53: TUniLabel
                Left = 71
                Top = 15
                Width = 162
                Height = 170
                Hint = ''
                AutoSize = False
                Caption = 
                  'Bu k'#305's'#305'mda girdi'#287'iniz metodlar, veri kayna'#287#305'n'#305'n geneli i'#231'in ge'#231'e' +
                  'rlidir ve t'#252'm veri tipleri i'#231'in ge'#231'erli olacakt'#305'r.'
                ParentFont = False
                Font.Color = 13226752
                Font.Height = -12
                Font.Style = [fsBold]
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 4
              end
            end
          end
          object pgPayl_Taraf: TUniTabSheet
            Hint = ''
            Caption = 'Payla'#351#305'lan Taraflar'
            Font.OverrideDefaults = [ovFontHeight]
            ParentFont = False
            object grdTarafD: TUniDBGrid
              Left = 13
              Top = 207
              Width = 400
              Height = 170
              Hint = ''
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
              WebOptions.Paged = False
              WebOptions.CustomizableCells = False
              WebOptions.FetchAll = True
              LoadMask.Message = 'Y'#252'kleniyor...'
              EmptyText = 'Veri Bulunamad'#305
              TabOrder = 0
              Columns = <
                item
                  FieldName = 'name'
                  Title.Alignment = taCenter
                  Title.Caption = 'Veri Aktar'#305'm Al'#305'c'#305' Grubu (Payla'#351#305'lan Taraflar)'
                  Width = 380
                  Font.OverrideDefaults = [ovFontHeight]
                  ReadOnly = True
                  DisplayMemo = True
                end>
            end
            object pnlpaylasilanTaraf: TUniPanel
              Left = 0
              Top = 0
              Width = 552
              Height = 451
              Hint = ''
              Align = alClient
              TabOrder = 1
              ShowCaption = False
              Caption = ''
              object rgPaylasilanTaraf: TUniRadioGroup
                Left = 1
                Top = 1
                Width = 550
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
              object grdTaraf: TUniDBGrid
                Left = 1
                Top = 51
                Width = 550
                Height = 399
                Hint = ''
                DataSource = dstaraf
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
                WebOptions.Paged = False
                WebOptions.CustomizableCells = False
                WebOptions.FetchAll = True
                LoadMask.Message = 'Y'#252'kleniyor...'
                EmptyText = 'Veri Bulunamad'#305
                Align = alClient
                TabOrder = 2
                Columns = <
                  item
                    FieldName = 'name'
                    Title.Alignment = taCenter
                    Title.Caption = 'Genel Veri Aktar'#305'm Al'#305'c'#305' Grubu (Payla'#351#305'lan Taraflar)'
                    Width = 380
                    Font.OverrideDefaults = [ovFontHeight]
                    ReadOnly = True
                    DisplayMemo = True
                  end>
              end
            end
            object UniPanel3: TUniPanel
              Left = 552
              Top = 0
              Width = 250
              Height = 451
              Hint = ''
              Align = alRight
              TabOrder = 2
              BorderStyle = ubsNone
              ShowCaption = False
              Caption = ''
              object edTarafTipi: TUniDBComboBox
                Left = 7
                Top = 35
                Width = 145
                Height = 28
                Hint = ''
                DataField = 'payl_taraftipi'
                DataSource = dsEnvanter
                Style = csDropDownList
                Items.Strings = (
                  'YURT '#304#199#304
                  'YURT DI'#350'I'
                  'Y.'#304#199#304'/Y.DI'#350'I'
                  'PAYLA'#350'ILMIYOR')
                TabOrder = 1
                IconItems = <>
              end
              object UniLabel31: TUniLabel
                Left = 5
                Top = 16
                Width = 78
                Height = 13
                Hint = ''
                AutoSize = False
                Caption = 'Payl. Taraf Tipi'
                ParentFont = False
                Font.Color = 13226752
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 2
              end
              object btnTarafAdd: TUniBitBtn
                AlignWithMargins = True
                Left = 5
                Top = 71
                Width = 30
                Height = 32
                Hint = ''
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
                Caption = ''
                ParentFont = False
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 3
                Images = MainMod.BtnImgList
                ImageIndex = 0
                OnClick = btnTarafAddClick
              end
              object btnTarafDel: TUniBitBtn
                AlignWithMargins = True
                Left = 5
                Top = 113
                Width = 30
                Height = 32
                Hint = ''
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
                Caption = ''
                ParentFont = False
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 4
                Images = MainMod.BtnImgList
                ImageIndex = 5
                OnClick = btnTarafDelClick
              end
              object btnTarafNew: TUniBitBtn
                AlignWithMargins = True
                Left = 5
                Top = 155
                Width = 30
                Height = 32
                Hint = ''
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
                Caption = ''
                ParentFont = False
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 5
                Images = MainMod.BtnImgList
                ImageIndex = 1
                OnClick = btnTarafNewClick
              end
              object UniLabel55: TUniLabel
                Left = 49
                Top = 77
                Width = 162
                Height = 140
                Hint = ''
                AutoSize = False
                Caption = 
                  'Bu k'#305's'#305'mda girdi'#287'iniz payla'#351#305'm taraflar'#305', veri kayna'#287#305'n'#305'n geneli' +
                  ' i'#231'in ge'#231'erlidir ve t'#252'm veri tipleri i'#231'in ge'#231'erli olacakt'#305'r.'
                ParentFont = False
                Font.Color = 13226752
                Font.Height = -12
                Font.Style = [fsBold]
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 6
              end
            end
          end
        end
        object UniPanel1: TUniPanel
          Left = 0
          Top = 0
          Width = 287
          Height = 479
          Hint = ''
          Align = alLeft
          TabOrder = 1
          Caption = 'UniPanel1'
          object grdVeriTipi: TUniDBGrid
            Left = 1
            Top = 93
            Width = 285
            Height = 385
            Hint = ''
            TitleFont.OverrideDefaults = [ovFontHeight]
            DataSource = dsEnvDet
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
            WebOptions.Paged = False
            WebOptions.PageSize = 50
            WebOptions.CustomizableCells = False
            WebOptions.FetchAll = True
            LoadMask.Message = 'Veri y'#252'kleniyor...'
            EmptyText = 'Veri bulunamad'#305
            Align = alClient
            Font.OverrideDefaults = [ovFontHeight]
            ParentFont = False
            TabOrder = 1
            OnDrawColumnCell = grdVeriTipiDrawColumnCell
            Columns = <
              item
                FieldName = 'veritipi_str'
                Title.Alignment = taCenter
                Title.Caption = 'Veri Tipi'
                Title.Font.OverrideDefaults = [ovFontHeight]
                Width = 250
                Font.OverrideDefaults = [ovFontHeight]
                ReadOnly = True
                DisplayMemo = True
              end
              item
                FieldName = 'kategori_str'
                Title.Alignment = taCenter
                Title.Caption = 'Veri Kategorisi'
                Title.Font.OverrideDefaults = [ovFontHeight]
                Width = 250
                Visible = False
                Font.OverrideDefaults = [ovFontHeight]
                ReadOnly = True
                DisplayMemo = True
              end>
          end
          object UniPanel2: TUniPanel
            Left = 1
            Top = 51
            Width = 285
            Height = 42
            Hint = ''
            Align = alTop
            TabOrder = 2
            BorderStyle = ubsInset
            Caption = ''
            object btnEnvDetAdd: TUniBitBtn
              Left = 6
              Top = 6
              Width = 30
              Height = 30
              Hint = ''
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 1
              Images = MainMod.BtnImgList
              ImageIndex = 0
              OnClick = btnEnvDetAddClick
            end
            object btnEnvDetDel: TUniBitBtn
              Left = 42
              Top = 6
              Width = 30
              Height = 30
              Hint = ''
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 2
              Images = MainMod.BtnImgList
              ImageIndex = 5
              OnClick = btnEnvDetDelClick
            end
            object chbKategori: TUniCheckBox
              Left = 160
              Top = 11
              Width = 120
              Height = 17
              Hint = ''
              Caption = 'Kategori G'#246'ster'
              ParentFont = False
              Font.Style = [fsBold]
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 3
              OnClick = chbKategoriClick
            end
          end
          object rgVeritipi: TUniRadioGroup
            Left = 1
            Top = 1
            Width = 285
            Height = 50
            Hint = ''
            Items.Strings = (
              'Ekle'
              #199#305'kart'
              'De'#287'i'#351'tir')
            Align = alTop
            Caption = 'Yap'#305'lacak '#304#351'lem'
            TabOrder = 3
            Columns = 3
          end
        end
      end
      object pgOnlemler: TUniTabSheet
        Hint = ''
        Caption = #214'nlemler'
        Font.OverrideDefaults = [ovFontHeight]
        ParentFont = False
        object UniLabel34: TUniLabel
          Left = 453
          Top = 14
          Width = 85
          Height = 88
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Mevcut '#304'dari '#214'nlemler'
          ParentFont = False
          Font.Color = 13226752
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 3
        end
        object UniDBMemo16: TUniDBMemo
          Left = 544
          Top = 13
          Width = 345
          Height = 88
          Hint = ''
          DataField = 'koru_idarionlem'
          DataSource = dsCheckList
          ReadOnly = True
          TabOrder = 8
          TabStop = False
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase('#39'TR'#39')); '#13#10'  sender.inputEl.' +
              'dom.setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel35: TUniLabel
          Left = 453
          Top = 110
          Width = 85
          Height = 88
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Mevcut Teknik '#214'nlemler'
          ParentFont = False
          Font.Color = 13226752
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 4
        end
        object UniDBMemo17: TUniDBMemo
          Left = 544
          Top = 110
          Width = 345
          Height = 88
          Hint = ''
          DataField = 'koru_teknikonlem'
          DataSource = dsCheckList
          ReadOnly = True
          TabOrder = 9
          TabStop = False
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase('#39'TR'#39')); '#13#10'  sender.inputEl.' +
              'dom.setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel36: TUniLabel
          Left = 453
          Top = 251
          Width = 85
          Height = 88
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Dan'#305#351'man Notu'
          ParentFont = False
          Font.Color = 13226752
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 5
        end
        object UniDBMemo18: TUniDBMemo
          Left = 544
          Top = 251
          Width = 345
          Height = 88
          Hint = ''
          DataField = 'danisman_notu'
          DataSource = dsCheckList
          ReadOnly = True
          TabOrder = 10
          TabStop = False
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase('#39'TR'#39')); '#13#10'  sender.inputEl.' +
              'dom.setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel20: TUniLabel
          Left = 8
          Top = 16
          Width = 85
          Height = 88
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Al'#305'nan Fiziksel '#214'nlem'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
        end
        object UniDBMemo7: TUniDBMemo
          Left = 99
          Top = 13
          Width = 345
          Height = 88
          Hint = ''
          DataField = 'sakl_fizikselonlem'
          DataSource = dsEnvanter
          TabOrder = 6
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase('#39'TR'#39')); '#13#10'  sender.inputEl.' +
              'dom.setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel24: TUniLabel
          Left = 8
          Top = 113
          Width = 85
          Height = 88
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Al'#305'nan Dijital '#214'nlem'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 2
        end
        object UniDBMemo9: TUniDBMemo
          Left = 99
          Top = 110
          Width = 345
          Height = 88
          Hint = ''
          DataField = 'sakl_sanalonlem'
          DataSource = dsEnvanter
          TabOrder = 7
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase('#39'TR'#39')); '#13#10'  sender.inputEl.' +
              'dom.setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel10: TUniLabel
          Left = 15
          Top = 253
          Width = 436
          Height = 79
          Hint = ''
          AutoSize = False
          Caption = 
            'D'#304'KKAT..! BU SAYFADA SADECE F'#304'Z'#304'KSEL VE D'#304'J'#304'TAL '#214'NLEMLER'#304' BEL'#304'RT' +
            #304'N'#304'Z. D'#304#286'ER '#214'NLEMLER, KONTROL L'#304'STELER'#304'NDEN OLU'#350'TURULMAKTADIR VE' +
            ' VER'#304' KAYNA'#286'I '#304'LE BA'#286'LANTILIDIR. HUKUK'#199'ULAR / DANI'#350'MANLAR TARAFI' +
            'NDAN DOLDURULMASI UYGUNDUR.'
          ParentFont = False
          Font.Color = 13226752
          Font.Height = -12
          Font.Style = [fsBold]
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 0
        end
      end
      object pgDDayanak: TUniTabSheet
        Hint = ''
        Caption = 'Di'#287'er Dayanak/Dok'#252'manlar'
        Font.OverrideDefaults = [ovFontHeight]
        ParentFont = False
        object btnDgrDayanakAdd: TUniBitBtn
          Left = 418
          Top = 8
          Width = 36
          Height = 36
          Hint = ''
          Caption = ''
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 0
          Images = MainMod.PrjImgList
          ImageIndex = 18
          OnClick = btnDgrDayanakAddClick
        end
        object btnDgrDayanakDel: TUniBitBtn
          Left = 418
          Top = 50
          Width = 36
          Height = 36
          Hint = ''
          Caption = ''
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
          Images = MainMod.PrjImgList
          ImageIndex = 12
          OnClick = btnDgrDayanakDelClick
        end
        object btnDgrDocsAdd: TUniBitBtn
          Left = 886
          Top = 8
          Width = 36
          Height = 36
          Hint = ''
          Caption = ''
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 3
          Images = MainMod.PrjImgList
          ImageIndex = 18
          OnClick = btnDgrDocsAddClick
        end
        object btnDgrDocsDel: TUniBitBtn
          Left = 886
          Top = 50
          Width = 36
          Height = 36
          Hint = ''
          Caption = ''
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 4
          Images = MainMod.PrjImgList
          ImageIndex = 12
          OnClick = btnDgrDocsDelClick
        end
        object btnDgrDayanakNew: TUniBitBtn
          Left = 418
          Top = 92
          Width = 36
          Height = 36
          Hint = ''
          Caption = ''
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 2
          Images = MainMod.PrjImgList
          ImageIndex = 29
          OnClick = btnDgrDayanakNewClick
        end
        object btnDgrDocsNew: TUniBitBtn
          Left = 886
          Top = 92
          Width = 36
          Height = 36
          Hint = ''
          Visible = False
          Caption = ''
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 5
          Images = MainMod.PrjImgList
          ImageIndex = 18
        end
        object UniLabel12: TUniLabel
          Left = 10
          Top = 400
          Width = 497
          Height = 13
          Hint = ''
          Caption = 
            'BU ALANLAR '#350'U ANDA KULLANIMDA OLAN Y'#214'NET'#304'M S'#304'STEM'#304'NE UYGUN DOLDU' +
            'RULMALIDIR'
          ParentFont = False
          Font.Color = 13226752
          Font.Height = -12
          Font.Style = [fsBold]
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 6
        end
        object pnldgrdayanak: TUniPanel
          Left = 10
          Top = 10
          Width = 400
          Height = 350
          Hint = ''
          TabOrder = 7
          ShowCaption = False
          Caption = ''
          object rgdgrDayanak: TUniRadioGroup
            Left = 1
            Top = 1
            Width = 398
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
          object grdDgrDayanak: TUniDBGrid
            Left = 1
            Top = 51
            Width = 398
            Height = 298
            Hint = ''
            DataSource = dsdgrdayanak
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
            WebOptions.Paged = False
            WebOptions.CustomizableCells = False
            WebOptions.FetchAll = True
            LoadMask.Message = 'Veri y'#252'kleniyor...'
            EmptyText = 'Veri Bulunamad'#305
            Align = alClient
            TabOrder = 2
            Columns = <
              item
                FieldName = 'name'
                Title.Alignment = taCenter
                Title.Caption = 'Di'#287'er Dayanaklar'
                Width = 380
                Font.OverrideDefaults = [ovFontHeight]
                ReadOnly = True
                DisplayMemo = True
              end>
          end
        end
        object pnldgrdoc: TUniPanel
          Left = 477
          Top = 10
          Width = 400
          Height = 350
          Hint = ''
          TabOrder = 8
          ShowCaption = False
          Caption = ''
          object rgdgrdoc: TUniRadioGroup
            Left = 1
            Top = 1
            Width = 398
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
          object grdDgrDocs: TUniDBGrid
            Left = 1
            Top = 51
            Width = 398
            Height = 298
            Hint = ''
            DataSource = dsdokumanlar
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
            WebOptions.Paged = False
            WebOptions.CustomizableCells = False
            WebOptions.FetchAll = True
            LoadMask.Message = 'Veri y'#252'kleniyor...'
            EmptyText = 'Veri Bulunamad'#305
            Align = alClient
            TabOrder = 2
            Columns = <
              item
                FieldName = 'name'
                Title.Alignment = taCenter
                Title.Caption = 'Di'#287'er Dok'#252'manlar'
                Width = 380
                Font.OverrideDefaults = [ovFontHeight]
                ReadOnly = True
                DisplayMemo = True
              end>
          end
        end
      end
      object pgHukuk: TUniTabSheet
        Hint = ''
        Caption = 'Hukuksal Dayanak/Dok'#252'manlar'
        Font.OverrideDefaults = [ovFontHeight]
        ParentFont = False
        object UniLabel25: TUniLabel
          Left = 12
          Top = 288
          Width = 85
          Height = 67
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Ayd'#305'nlatma Metni/ A'#231#305'k R'#305'za/ Muvafakatname Ad'#305' ve Maddesi'
          ParentFont = False
          Font.Color = 13226752
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 0
        end
        object UniDBMemo10: TUniDBMemo
          Left = 103
          Top = 288
          Width = 345
          Height = 67
          Hint = ''
          DataField = 'hkk_gereksinim'
          DataSource = dsCheckList
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
          TabOrder = 4
          TabStop = False
        end
        object UniLabel26: TUniLabel
          Left = 480
          Top = 288
          Width = 85
          Height = 67
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'S'#246'zle'#351'mesel Dayana'#287#305' Varsa S'#246'zle'#351'menin '#304'smi'
          ParentFont = False
          Font.Color = 13226752
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
        end
        object UniDBMemo11: TUniDBMemo
          Left = 571
          Top = 288
          Width = 345
          Height = 67
          Hint = ''
          DataField = 'hkk_sozlesme'
          DataSource = dsCheckList
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
          TabOrder = 5
          TabStop = False
        end
        object UniLabel27: TUniLabel
          Left = 480
          Top = 360
          Width = 85
          Height = 67
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'S'#246'zle'#351'menin Maddesi'
          ParentFont = False
          Font.Color = 13226752
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 2
        end
        object UniDBMemo12: TUniDBMemo
          Left = 571
          Top = 360
          Width = 345
          Height = 67
          Hint = ''
          DataField = 'hkk_sozmadde'
          DataSource = dsCheckList
          ParentFont = False
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
          TabOrder = 6
          TabStop = False
        end
        object UniLabel38: TUniLabel
          Left = 12
          Top = 372
          Width = 436
          Height = 67
          Hint = ''
          AutoSize = False
          Caption = 
            'D'#304'KKAT..! BU SAYFADAK'#304' B'#304'LG'#304'LER'#304' DE'#286#304#350'T'#304'REMEZS'#304'N'#304'Z. BURADAK'#304' B'#304'L' +
            'G'#304'LER KONTROL L'#304'STELER'#304'NDEN OLU'#350'TURULMAKTADIR. BU B'#304'LG'#304'LER, VER'#304 +
            ' KAYNA'#286'I '#304'LE BA'#286'LANTILIDIR VE HUKUK'#199'ULAR / DANI'#350'MANLAR TARAFINDA' +
            'N DOLDURULMASI UYGUNDUR.'
          ParentFont = False
          Font.Color = 13226752
          Font.Height = -12
          Font.Style = [fsBold]
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 3
        end
        object pnlhkkdayanak: TUniPanel
          Left = 12
          Top = 0
          Width = 435
          Height = 273
          Hint = ''
          TabOrder = 7
          ShowCaption = False
          Caption = ''
          object grdHkkDayanak: TUniDBGrid
            Left = 1
            Top = 1
            Width = 433
            Height = 271
            Hint = ''
            DataSource = dshkkdayanak
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
            WebOptions.Paged = False
            WebOptions.CustomizableCells = False
            WebOptions.FetchAll = True
            LoadMask.Message = 'Veri y'#252'kleniyor'
            EmptyText = 'Veri Bulunamad'#305
            Align = alClient
            Font.OverrideDefaults = [ovFontHeight]
            ParentFont = False
            TabOrder = 1
            Columns = <
              item
                FieldName = 'name'
                Title.Alignment = taCenter
                Title.Caption = 'Hukuki Dayanaklar'
                Width = 410
                Font.OverrideDefaults = [ovFontHeight]
                ReadOnly = True
                DisplayMemo = True
              end>
          end
        end
        object pnlhkkdayanakdoc: TUniPanel
          Left = 460
          Top = 0
          Width = 456
          Height = 273
          Hint = ''
          TabOrder = 8
          ShowCaption = False
          Caption = ''
          object grdHkkDocs: TUniDBGrid
            Left = 1
            Top = 1
            Width = 454
            Height = 271
            Hint = ''
            DataSource = dshkkdokuman
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
            WebOptions.Paged = False
            WebOptions.CustomizableCells = False
            WebOptions.FetchAll = True
            LoadMask.Message = 'Veri y'#252'kleniyor...'
            EmptyText = 'Veri Bulunamad'#305
            Align = alClient
            Font.OverrideDefaults = [ovFontHeight]
            ParentFont = False
            TabOrder = 1
            Columns = <
              item
                FieldName = 'name'
                Title.Alignment = taCenter
                Title.Caption = 'Hukuki Dok'#252'manlar'
                Width = 410
                Font.OverrideDefaults = [ovFontHeight]
                ReadOnly = True
                DisplayMemo = True
              end>
          end
        end
      end
    end
  end
  object pnlButtons: TUniPanel
    Left = 0
    Top = 564
    Width = 1107
    Height = 48
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      1107
      48)
    object btnCancel: TUniBitBtn
      Left = 1005
      Top = 5
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
      Left = 903
      Top = 5
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
    object UniLabel7: TUniLabel
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
      TabOrder = 9
    end
    object lbSDT: TUniLabel
      Left = 435
      Top = 24
      Width = 200
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
      Left = 801
      Top = 5
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
  end
  object pnlMsg: TUniPanel
    Left = 0
    Top = 0
    Width = 1107
    Height = 55
    Hint = ''
    Align = alTop
    TabOrder = 2
    ShowCaption = False
    Caption = ''
    object UniLabel11: TUniLabel
      AlignWithMargins = True
      Left = 21
      Top = 25
      Width = 391
      Height = 13
      Hint = ''
      Margins.Left = 20
      Caption = 
        'Gerekli alanlar'#305' de'#287'i'#351'tirip kaydetti'#287'inizde, yeni bir envanter o' +
        'lu'#351'turalacakt'#305'r.'
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
      Width = 197
      Height = 13
      Hint = ''
      Margins.Left = 20
      Margins.Top = 5
      Caption = 'Envanter kopyas'#305' olu'#351'turuyorsunuz !  '
      Align = alTop
      ParentFont = False
      Font.Color = clMaroon
      Font.Height = -12
      Font.Style = [fsBold]
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
    end
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    Left = 36
    Top = 221
  end
  object qSurec: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, surec FROM def_data_surec'
      'WHERE mc_id = 2'
      'ORDER BY id')
    Left = 338
    Top = 244
  end
  object dsSurec: TUniDataSource
    DataSet = qSurec
    Left = 386
    Top = 244
  end
  object qDept: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      
        'SELECT id, title FROM sys_deptdef WHERE active = '#39'E'#39' AND mc_id =' +
        ' 4   ORDER BY title')
    Left = 338
    Top = 193
  end
  object dsDept: TUniDataSource
    DataSet = qDept
    Left = 386
    Top = 193
  end
  object qKaynak: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, kaynak FROM def_data_kaynak'
      'WHERE mc_id = 2'
      'ORDER BY id')
    Left = 338
    Top = 295
  end
  object dsKaynak: TUniDataSource
    DataSet = qKaynak
    Left = 386
    Top = 295
  end
  object qOnem: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, onemderece FROM def_data_onemderece'
      'WHERE mc_id = 2'
      'ORDER BY id')
    Left = 338
    Top = 398
  end
  object dsOnem: TUniDataSource
    DataSet = qOnem
    Left = 386
    Top = 398
  end
  object qEnvanter: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM data_envanter WHERE id = 541378')
    BeforePost = qEnvanterBeforePost
    Left = 24
    Top = 350
  end
  object dsEnvanter: TUniDataSource
    OnStateChange = dsEnvanterStateChange
    OnDataChange = dsEnvanterDataChange
    Left = 80
    Top = 350
  end
  object qCheckList: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT *'
      'FROM data_checklist'
      'ORDER BY id')
    Left = 351
    Top = 86
  end
  object dsCheckList: TUniDataSource
    DataSet = qCheckList
    Left = 423
    Top = 86
  end
  object qKisi: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, kisi FROM def_data_kisi'
      'WHERE mc_id = 2'
      'ORDER BY id'
      '')
    Left = 338
    Top = 346
  end
  object dsKisi: TUniDataSource
    DataSet = qKisi
    Left = 386
    Top = 346
  end
  object qEnvDet: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      
        'SELECT k.kategori kategori_str ,v.veri_tipi veritipi_str, REPLAC' +
        'E(REPLACE(v.nitelik, '#39'KV'#39', '#39'H'#39'), '#39'ON'#39', '#39'E'#39') nitelik_str, e.* FRO' +
        'M data_envanter e'
      'join def_data_kategori k on k."id"=e.kategori_id'
      'join def_data_veritipi v on v."id" = e.veritipi_id'
      ' WHERE main_id = 541378')
    CachedUpdates = True
    Left = 22
    Top = 396
  end
  object dsEnvDet: TUniDataSource
    Left = 78
    Top = 396
  end
  object vqenvanter: TVirtualTable
    Left = 52
    Top = 350
    Data = {04000000000000000000}
  end
  object VqEnvDet: TVirtualTable
    Left = 50
    Top = 396
    Data = {04000000000000000000}
  end
  object vtmp1: TVirtualTable
    Left = 37
    Top = 193
    Data = {04000000000000000000}
  end
  object vqtmp: TVirtualQuery
    SourceDataSets = <>
    Left = 77
    Top = 193
  end
  object qtmp2: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    CachedUpdates = True
    Left = 76
    Top = 221
  end
  object dstamac: TUniDataSource
    DataSet = qtamaclar
    Left = 962
    Top = 144
  end
  object qtamaclar: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      ' select * from def_data_amac where mc_id=4')
    Left = 928
    Top = 144
  end
  object qtmetodlar: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      ' select * from def_data_metod where mc_id=4')
    Left = 928
    Top = 291
  end
  object dstmetod: TUniDataSource
    DataSet = qtmetodlar
    Left = 962
    Top = 291
  end
  object dssamac: TUniDataSource
    DataSet = qsamaclar
    Left = 962
    Top = 193
  end
  object dspamac: TUniDataSource
    DataSet = qpamaclar
    Left = 962
    Top = 242
  end
  object dssmetod: TUniDataSource
    DataSet = qsmetodlar
    Left = 962
    Top = 340
  end
  object dspmetod: TUniDataSource
    DataSet = qpmetodlar
    Left = 962
    Top = 389
  end
  object qdepartmanlar: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      ' select * from sys_deptdefwhere mc_id=4')
    Left = 928
    Top = 438
  end
  object dserisim: TUniDataSource
    DataSet = qdepartmanlar
    Left = 962
    Top = 438
  end
  object qtaraflar: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      ' select * from sys_deptdefwhere mc_id=4')
    Left = 928
    Top = 488
  end
  object dstaraf: TUniDataSource
    DataSet = qtaraflar
    Left = 962
    Top = 488
  end
  object qdgrdayanaklar: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM def_data_dayanak where mc_id=4')
    Left = 1000
    Top = 242
  end
  object dsdgrdayanak: TUniDataSource
    DataSet = qdgrdayanaklar
    Left = 1032
    Top = 242
  end
  object qdgrdokumanlar: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM def_data_dokuman where mc_id=4')
    Left = 1000
    Top = 144
  end
  object dsdokumanlar: TUniDataSource
    DataSet = qdgrdokumanlar
    Left = 1032
    Top = 144
  end
  object dshkkdayanak: TUniDataSource
    DataSet = qhkkdayanaklar
    Left = 1032
    Top = 291
  end
  object dshkkdokuman: TUniDataSource
    DataSet = qhkkdokumanlar
    Left = 1032
    Top = 193
  end
  object qsamaclar: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      ' select * from def_data_amac where mc_id=4')
    Left = 928
    Top = 193
  end
  object qpamaclar: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      ' select * from def_data_amac where mc_id=4')
    Left = 928
    Top = 242
  end
  object qsmetodlar: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      ' select * from def_data_metod where mc_id=4')
    Left = 928
    Top = 340
  end
  object qpmetodlar: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      ' select * from def_data_metod where mc_id=4')
    Left = 928
    Top = 389
  end
  object qhkkdokumanlar: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM def_data_dokuman where mc_id=4')
    Left = 1000
    Top = 193
  end
  object qhkkdayanaklar: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM def_data_dayanak where mc_id=4')
    Left = 1000
    Top = 291
  end
  object qdetail: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT *'
      'FROM data_envanter'
      'WHERE main_id > 0'
      'ORDER BY id')
    CachedUpdates = True
    Left = 106
    Top = 398
  end
end
