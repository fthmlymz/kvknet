object frmEnvanterTanim2: TfrmEnvanterTanim2
  Left = 0
  Top = 0
  ClientHeight = 519
  ClientWidth = 943
  Caption = 'Envanter Formu'
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnBeforeShow = UniFormBeforeShow
  TextHeight = 15
  object pnlData: TUniPanel
    Left = 0
    Top = 55
    Width = 943
    Height = 416
    Hint = ''
    Align = alClient
    TabOrder = 0
    Caption = ''
    object PgControl: TUniPageControl
      Left = 1
      Top = 1
      Width = 941
      Height = 414
      Hint = ''
      ActivePage = pgDDayanak
      Align = alClient
      TabOrder = 1
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
            Left = 117
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
        object UniPageControl1: TUniPageControl
          Left = 287
          Top = 0
          Width = 646
          Height = 386
          Hint = ''
          ActivePage = pgPayl_Taraf
          Align = alClient
          TabOrder = 0
          object pgTopl_Amac: TUniTabSheet
            Hint = ''
            Caption = 'Veri Toplama (Ama'#231'lar)'
            Font.OverrideDefaults = [ovFontHeight]
            ParentFont = False
            object btnAmacTopAdd: TUniBitBtn
              Left = 420
              Top = 10
              Width = 30
              Height = 30
              Hint = ''
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 0
              Images = MainMod.BtnImgList
              ImageIndex = 0
              OnClick = btnAmacTopAddClick
            end
            object btnAmacTopDel: TUniBitBtn
              Left = 420
              Top = 46
              Width = 30
              Height = 30
              Hint = ''
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 1
              Images = MainMod.BtnImgList
              ImageIndex = 5
              OnClick = btnAmacTopDelClick
            end
            object btnAmacTopNew: TUniBitBtn
              Left = 420
              Top = 82
              Width = 30
              Height = 30
              Hint = ''
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 2
              Images = MainMod.BtnImgList
              ImageIndex = 1
              OnClick = btnAmacTopNewClick
            end
            object grdAmacTopD: TUniDBGrid
              Left = 10
              Top = 207
              Width = 400
              Height = 170
              Hint = ''
              DataSource = dsAmacTopD
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
              WebOptions.Paged = False
              WebOptions.CustomizableCells = False
              WebOptions.FetchAll = True
              LoadMask.Message = 'Y'#252'kleniyor...'
              EmptyText = 'Veri Bulunamad'#305
              Font.OverrideDefaults = [ovFontHeight]
              ParentFont = False
              TabOrder = 3
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
            object btnAmacTopDAdd: TUniBitBtn
              Left = 420
              Top = 207
              Width = 30
              Height = 30
              Hint = ''
              Visible = False
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 4
              Images = MainMod.BtnImgList
              ImageIndex = 0
              OnClick = btnAmacTopDAddClick
            end
            object btnAmacTopDDel: TUniBitBtn
              Left = 420
              Top = 243
              Width = 30
              Height = 30
              Hint = ''
              Visible = False
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 5
              Images = MainMod.BtnImgList
              ImageIndex = 5
              OnClick = btnAmacTopDDelClick
            end
            object btnAmacTopDNew: TUniBitBtn
              Left = 420
              Top = 279
              Width = 30
              Height = 30
              Hint = ''
              Visible = False
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 6
              Images = MainMod.BtnImgList
              ImageIndex = 1
              OnClick = btnAmacTopNewClick
            end
            object UniLabel21: TUniLabel
              Left = 455
              Top = 10
              Width = 162
              Height = 170
              Hint = ''
              AutoSize = False
              Caption = 
                'Bu k'#305's'#305'mda girdi'#287'iniz ama'#231'lar, veri kayna'#287#305'n'#305'n geneli i'#231'in ge'#231'er' +
                'lidir ve t'#252'm veri tipleri i'#231'in ge'#231'erli olacakt'#305'r. Bu sebeple alt' +
                ' k'#305's'#305'mda tekrar belirtmenize gerek yoktur.'
              ParentFont = False
              Font.Color = 13226752
              Font.Height = -12
              Font.Style = [fsBold]
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 7
            end
            object UniLabel33: TUniLabel
              Left = 455
              Top = 207
              Width = 162
              Height = 170
              Hint = ''
              Visible = False
              AutoSize = False
              Caption = 
                'Bu k'#305's'#305'mda girdi'#287'iniz ama'#231'lar, sadece se'#231'ili veri tipine '#246'zel ge' +
                #231'erlidir. Di'#287'er veri tiplerini etkilemez.'
              ParentFont = False
              Font.Color = 13226752
              Font.Height = -12
              Font.Style = [fsBold]
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 8
            end
            object pnlamacvt: TUniPanel
              Left = 0
              Top = 0
              Width = 412
              Height = 358
              Hint = ''
              Align = alLeft
              TabOrder = 9
              ShowCaption = False
              Caption = ''
              object rgamacvt: TUniRadioGroup
                Left = 1
                Top = 1
                Width = 410
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
                Width = 410
                Height = 306
                Hint = ''
                DataSource = dsAmacTop
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
          end
          object pgTopl_Metod: TUniTabSheet
            Hint = ''
            Caption = 'Veri Toplama (Metodlar)'
            Font.OverrideDefaults = [ovFontHeight]
            ParentFont = False
            object btnMetodTopAdd: TUniBitBtn
              Left = 420
              Top = 10
              Width = 30
              Height = 30
              Hint = ''
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 0
              Images = MainMod.BtnImgList
              ImageIndex = 0
              OnClick = btnMetodTopAddClick
            end
            object btnMetodTopDel: TUniBitBtn
              Left = 420
              Top = 46
              Width = 30
              Height = 30
              Hint = ''
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 1
              Images = MainMod.BtnImgList
              ImageIndex = 5
              OnClick = btnMetodTopDelClick
            end
            object btnMetodTopNew: TUniBitBtn
              Left = 420
              Top = 82
              Width = 30
              Height = 30
              Hint = ''
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 2
              Images = MainMod.BtnImgList
              ImageIndex = 1
              OnClick = btnMetodTopNewClick
            end
            object grdMetodTopD: TUniDBGrid
              Left = 10
              Top = 207
              Width = 400
              Height = 170
              Hint = ''
              DataSource = dsMetodTopD
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
              WebOptions.Paged = False
              WebOptions.CustomizableCells = False
              WebOptions.FetchAll = True
              LoadMask.Message = 'Y'#252'kleniyor...'
              EmptyText = 'Veri Bulunamad'#305
              Font.OverrideDefaults = [ovFontHeight]
              ParentFont = False
              TabOrder = 3
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
            object btnMetodTopDAdd: TUniBitBtn
              Left = 420
              Top = 207
              Width = 30
              Height = 30
              Hint = ''
              Visible = False
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 4
              Images = MainMod.BtnImgList
              ImageIndex = 0
              OnClick = btnMetodTopDAddClick
            end
            object btnMetodTopDDel: TUniBitBtn
              Left = 420
              Top = 243
              Width = 30
              Height = 30
              Hint = ''
              Visible = False
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 5
              Images = MainMod.BtnImgList
              ImageIndex = 5
              OnClick = btnMetodTopDDelClick
            end
            object btnMetodTopDNew: TUniBitBtn
              Left = 420
              Top = 279
              Width = 30
              Height = 30
              Hint = ''
              Visible = False
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 6
              Images = MainMod.BtnImgList
              ImageIndex = 1
              OnClick = btnMetodTopNewClick
            end
            object UniLabel43: TUniLabel
              Left = 456
              Top = 10
              Width = 162
              Height = 170
              Hint = ''
              AutoSize = False
              Caption = 
                'Bu k'#305's'#305'mda girdi'#287'iniz metodlar, veri kayna'#287#305'n'#305'n geneli i'#231'in ge'#231'e' +
                'rlidir ve t'#252'm veri tipleri i'#231'in ge'#231'erli olacakt'#305'r. Bu sebeple al' +
                't k'#305's'#305'mda tekrar belirtmenize gerek yoktur.'
              ParentFont = False
              Font.Color = 13226752
              Font.Height = -12
              Font.Style = [fsBold]
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 7
            end
            object UniLabel44: TUniLabel
              Left = 455
              Top = 207
              Width = 162
              Height = 170
              Hint = ''
              Visible = False
              AutoSize = False
              Caption = 
                'Bu k'#305's'#305'mda girdi'#287'iniz metodlar, sadece se'#231'ili veri tipine '#246'zel g' +
                'e'#231'erlidir. Di'#287'er veri tiplerini etkilemez.'
              ParentFont = False
              Font.Color = 13226752
              Font.Height = -12
              Font.Style = [fsBold]
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 8
            end
            object pnlmetodvt: TUniPanel
              Left = 0
              Top = 0
              Width = 412
              Height = 358
              Hint = ''
              Align = alLeft
              TabOrder = 9
              ShowCaption = False
              Caption = ''
              object rgmetodvt: TUniRadioGroup
                Left = 1
                Top = 1
                Width = 410
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
                Width = 410
                Height = 306
                Hint = ''
                DataSource = dsMetodTop
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
          end
          object pgTopl_Diger: TUniTabSheet
            Hint = ''
            TabVisible = False
            Caption = 'Veri Toplama (Di'#287'er)'
            Font.OverrideDefaults = [ovFontHeight]
            ParentFont = False
            object UniLabel14: TUniLabel
              Left = 10
              Top = 10
              Width = 85
              Height = 67
              Hint = ''
              Alignment = taRightJustify
              AutoSize = False
              Caption = #304#351'lem ve S'#252're'#231'ler Hk. Detayl'#305' Bilgi'
              ParentFont = False
              Font.Color = clDefault
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 0
            end
            object UniDBMemo2: TUniDBMemo
              Left = 101
              Top = 11
              Width = 345
              Height = 67
              Hint = ''
              DataField = 'topl_detay'
              DataSource = dsEnvDet
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 1
              ClientEvents.ExtEvents.Strings = (
                
                  'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
                  'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
                  'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
                  'setSelectionRange(pos, pos);'#13#10'}')
            end
            object UniLabel15: TUniLabel
              Left = 10
              Top = 83
              Width = 85
              Height = 67
              Hint = ''
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'S'#252're'#231' '#199#305'kt'#305's'#305
              ParentFont = False
              Font.Color = clDefault
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 2
            end
            object UniDBMemo3: TUniDBMemo
              Left = 101
              Top = 84
              Width = 345
              Height = 67
              Hint = ''
              DataField = 'topl_cikti'
              DataSource = dsEnvDet
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 3
              ClientEvents.ExtEvents.Strings = (
                
                  'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
                  'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
                  'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
                  'setSelectionRange(pos, pos);'#13#10'}')
            end
            object UniLabel16: TUniLabel
              Left = 10
              Top = 155
              Width = 85
              Height = 67
              Hint = ''
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Payla'#351#305'lan Ki'#351'i / Birim (Yoksa bo'#351' b'#305'rak'#305'n'#305'z)'
              ParentFont = False
              Font.Color = clDefault
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 4
            end
            object UniDBMemo4: TUniDBMemo
              Left = 101
              Top = 155
              Width = 345
              Height = 67
              Hint = ''
              DataField = 'topl_paylasim'
              DataSource = dsEnvDet
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 5
              ClientEvents.ExtEvents.Strings = (
                
                  'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
                  'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
                  'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
                  'setSelectionRange(pos, pos);'#13#10'}')
            end
            object UniLabel17: TUniLabel
              Left = 10
              Top = 227
              Width = 85
              Height = 67
              Hint = ''
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Payla'#351'ma Bi'#231'imi'
              ParentFont = False
              Font.Color = clDefault
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 6
            end
            object UniDBMemo5: TUniDBMemo
              Left = 101
              Top = 227
              Width = 345
              Height = 67
              Hint = ''
              DataField = 'topl_paylasimtipi'
              DataSource = dsEnvDet
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 7
              ClientEvents.ExtEvents.Strings = (
                
                  'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
                  'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
                  'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
                  'setSelectionRange(pos, pos);'#13#10'}')
            end
          end
          object pgSakl_Amac: TUniTabSheet
            Hint = ''
            Caption = 'Veri Saklama (Ama'#231'lar)'
            Font.OverrideDefaults = [ovFontHeight]
            ParentFont = False
            object btnAmacSakAdd: TUniBitBtn
              Left = 420
              Top = 10
              Width = 30
              Height = 30
              Hint = ''
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 0
              Images = MainMod.BtnImgList
              ImageIndex = 0
              OnClick = btnAmacSakAddClick
            end
            object btnAmacSakDel: TUniBitBtn
              Left = 420
              Top = 46
              Width = 30
              Height = 30
              Hint = ''
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 1
              Images = MainMod.BtnImgList
              ImageIndex = 5
              OnClick = btnAmacSakDelClick
            end
            object btnAmacSakNew: TUniBitBtn
              Left = 420
              Top = 82
              Width = 30
              Height = 30
              Hint = ''
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 2
              Images = MainMod.BtnImgList
              ImageIndex = 1
              OnClick = btnAmacSakNewClick
            end
            object grdAmacSakD: TUniDBGrid
              Left = 10
              Top = 207
              Width = 400
              Height = 170
              Hint = ''
              TitleFont.OverrideDefaults = [ovFontHeight]
              DataSource = dsAmacSakD
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
              WebOptions.Paged = False
              WebOptions.CustomizableCells = False
              WebOptions.FetchAll = True
              LoadMask.Message = 'Veri y'#252'kleniyor...'
              EmptyText = 'Veri yok'
              TabOrder = 3
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
            object btnAmacSakDAdd: TUniBitBtn
              Left = 419
              Top = 207
              Width = 30
              Height = 30
              Hint = ''
              Visible = False
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 4
              Images = MainMod.BtnImgList
              ImageIndex = 0
              OnClick = btnAmacSakDAddClick
            end
            object btnAmacSakDDel: TUniBitBtn
              Left = 420
              Top = 243
              Width = 30
              Height = 30
              Hint = ''
              Visible = False
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 5
              Images = MainMod.BtnImgList
              ImageIndex = 5
              OnClick = btnAmacSakDDelClick
            end
            object btnAmacSakDNew: TUniBitBtn
              Left = 420
              Top = 279
              Width = 30
              Height = 30
              Hint = ''
              Visible = False
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 6
              Images = MainMod.BtnImgList
              ImageIndex = 1
              OnClick = btnAmacSakNewClick
            end
            object UniLabel45: TUniLabel
              Left = 455
              Top = 207
              Width = 162
              Height = 170
              Hint = ''
              Visible = False
              AutoSize = False
              Caption = 
                'Bu k'#305's'#305'mda girdi'#287'iniz ama'#231'lar, sadece se'#231'ili veri tipine '#246'zel ge' +
                #231'erlidir. Di'#287'er veri tiplerini etkilemez.'
              ParentFont = False
              Font.Color = 13226752
              Font.Height = -12
              Font.Style = [fsBold]
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 7
            end
            object UniLabel46: TUniLabel
              Left = 455
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
              TabOrder = 8
            end
            object pnlamacvs: TUniPanel
              Left = 0
              Top = 0
              Width = 412
              Height = 358
              Hint = ''
              Align = alLeft
              TabOrder = 9
              ShowCaption = False
              Caption = ''
              object rgamacvs: TUniRadioGroup
                Left = 1
                Top = 1
                Width = 410
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
                Width = 410
                Height = 306
                Hint = ''
                TitleFont.OverrideDefaults = [ovFontHeight]
                DataSource = dsAmacSak
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
                    Title.Caption = 'Genel Veri Saklama Ama'#231'lar'#305
                    Title.Font.OverrideDefaults = [ovFontHeight]
                    Width = 380
                    Font.OverrideDefaults = [ovFontHeight]
                    ReadOnly = True
                    DisplayMemo = True
                  end>
              end
            end
          end
          object pgSakl_Metod: TUniTabSheet
            Hint = ''
            Caption = 'Veri Saklama (Metodlar)'
            Font.OverrideDefaults = [ovFontHeight]
            ParentFont = False
            object btnMetodSakAdd: TUniBitBtn
              Left = 420
              Top = 10
              Width = 30
              Height = 30
              Hint = ''
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 0
              Images = MainMod.BtnImgList
              ImageIndex = 0
              OnClick = btnMetodSakAddClick
            end
            object btnMetodSakDel: TUniBitBtn
              Left = 420
              Top = 46
              Width = 30
              Height = 30
              Hint = ''
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 1
              Images = MainMod.BtnImgList
              ImageIndex = 5
              OnClick = btnMetodSakDelClick
            end
            object btnMetodSakNew: TUniBitBtn
              Left = 420
              Top = 82
              Width = 30
              Height = 30
              Hint = ''
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 2
              Images = MainMod.BtnImgList
              ImageIndex = 1
              OnClick = btnMetodSakNewClick
            end
            object grdMetodSakD: TUniDBGrid
              Left = 10
              Top = 207
              Width = 400
              Height = 170
              Hint = ''
              DataSource = dsMetodSakD
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
              WebOptions.Paged = False
              WebOptions.CustomizableCells = False
              WebOptions.FetchAll = True
              LoadMask.Message = 'Y'#252'kleniyor...'
              EmptyText = 'Veri Bulunamad'#305
              Font.OverrideDefaults = [ovFontHeight]
              ParentFont = False
              TabOrder = 3
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
            object btnMetodSakDAdd: TUniBitBtn
              Left = 420
              Top = 207
              Width = 30
              Height = 30
              Hint = ''
              Visible = False
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 4
              Images = MainMod.BtnImgList
              ImageIndex = 0
              OnClick = btnMetodSakDAddClick
            end
            object btnMetodSakDDel: TUniBitBtn
              Left = 420
              Top = 243
              Width = 30
              Height = 30
              Hint = ''
              Visible = False
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 5
              Images = MainMod.BtnImgList
              ImageIndex = 5
              OnClick = btnMetodSakDDelClick
            end
            object btnMetodSakDNew: TUniBitBtn
              Left = 420
              Top = 279
              Width = 30
              Height = 30
              Hint = ''
              Visible = False
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 6
              Images = MainMod.BtnImgList
              ImageIndex = 1
              OnClick = btnMetodSakNewClick
            end
            object UniLabel47: TUniLabel
              Left = 455
              Top = 10
              Width = 162
              Height = 170
              Hint = ''
              AutoSize = False
              Caption = 
                'Bu k'#305's'#305'mda girdi'#287'iniz metodlar, veri kayna'#287#305'n'#305'n geneli i'#231'in ge'#231'e' +
                'rlidir ve t'#252'm veri tipleri i'#231'in ge'#231'erli olacakt'#305'r. Bu sebeple al' +
                't k'#305's'#305'mda tekrar belirtmenize gerek yoktur.'
              ParentFont = False
              Font.Color = 13226752
              Font.Height = -12
              Font.Style = [fsBold]
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 7
            end
            object UniLabel48: TUniLabel
              Left = 455
              Top = 207
              Width = 162
              Height = 170
              Hint = ''
              Visible = False
              AutoSize = False
              Caption = 
                'Bu k'#305's'#305'mda girdi'#287'iniz metodlar, sadece se'#231'ili veri tipine '#246'zel g' +
                'e'#231'erlidir. Di'#287'er veri tiplerini etkilemez.'
              ParentFont = False
              Font.Color = 13226752
              Font.Height = -12
              Font.Style = [fsBold]
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 8
            end
            object pnlmetodvs: TUniPanel
              Left = 0
              Top = 0
              Width = 412
              Height = 358
              Hint = ''
              Align = alLeft
              TabOrder = 9
              ShowCaption = False
              Caption = ''
              object rgmetodvs: TUniRadioGroup
                Left = 1
                Top = 1
                Width = 410
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
                Width = 410
                Height = 306
                Hint = ''
                DataSource = dsMetodSak
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
          end
          object pgSakl_Erisim: TUniTabSheet
            Hint = ''
            Caption = 'Veri Eri'#351'im'
            Font.OverrideDefaults = [ovFontHeight]
            ParentFont = False
            object btnDeptsAdd: TUniBitBtn
              Left = 420
              Top = 10
              Width = 30
              Height = 30
              Hint = ''
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 0
              Images = MainMod.BtnImgList
              ImageIndex = 0
              OnClick = btnDeptsAddClick
            end
            object btnDeptsDel: TUniBitBtn
              Left = 420
              Top = 46
              Width = 30
              Height = 30
              Hint = ''
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 1
              Images = MainMod.BtnImgList
              ImageIndex = 5
              OnClick = btnDeptsDelClick
            end
            object btnDeptsNew: TUniBitBtn
              Left = 420
              Top = 82
              Width = 30
              Height = 30
              Hint = ''
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 2
              Images = MainMod.BtnImgList
              ImageIndex = 1
              OnClick = btnDeptsNewClick
            end
            object grdDeptsD: TUniDBGrid
              Left = 10
              Top = 207
              Width = 400
              Height = 170
              Hint = ''
              DataSource = dsDeptsD
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
              WebOptions.Paged = False
              WebOptions.CustomizableCells = False
              WebOptions.FetchAll = True
              LoadMask.Message = 'Y'#252'kleniyor...'
              EmptyText = 'Veri Bulunamad'#305
              Font.OverrideDefaults = [ovFontHeight]
              ParentFont = False
              TabOrder = 3
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
            object btnDeptsDAdd: TUniBitBtn
              Left = 420
              Top = 207
              Width = 30
              Height = 30
              Hint = ''
              Visible = False
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 4
              Images = MainMod.BtnImgList
              ImageIndex = 0
              OnClick = btnDeptsDAddClick
            end
            object btnDeptsDDel: TUniBitBtn
              Left = 420
              Top = 243
              Width = 30
              Height = 30
              Hint = ''
              Visible = False
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 5
              Images = MainMod.BtnImgList
              ImageIndex = 5
              OnClick = btnDeptsDDelClick
            end
            object btnDeptsDNew: TUniBitBtn
              Left = 420
              Top = 279
              Width = 30
              Height = 30
              Hint = ''
              Visible = False
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 6
              Images = MainMod.BtnImgList
              ImageIndex = 1
              OnClick = btnDeptsNewClick
            end
            object UniLabel49: TUniLabel
              Left = 455
              Top = 10
              Width = 162
              Height = 170
              Hint = ''
              AutoSize = False
              Caption = 
                'Bu k'#305's'#305'mda girdi'#287'iniz departmanlar, veri kayna'#287#305'n'#305'n geneli i'#231'in ' +
                'ge'#231'erlidir ve t'#252'm veri tipleri i'#231'in ge'#231'erli olacakt'#305'r. Bu sebepl' +
                'e alt k'#305's'#305'mda tekrar belirtmenize gerek yoktur.'
              ParentFont = False
              Font.Color = 13226752
              Font.Height = -12
              Font.Style = [fsBold]
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 7
            end
            object UniLabel50: TUniLabel
              Left = 455
              Top = 210
              Width = 162
              Height = 170
              Hint = ''
              Visible = False
              AutoSize = False
              Caption = 
                'Bu k'#305's'#305'mda girdi'#287'iniz departmanlar, sadece se'#231'ili veri tipine '#246'z' +
                'el ge'#231'erlidir. Di'#287'er veri tiplerini etkilemez.'
              ParentFont = False
              Font.Color = 13226752
              Font.Height = -12
              Font.Style = [fsBold]
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 8
            end
            object pnveriErisim: TUniPanel
              Left = 0
              Top = 0
              Width = 412
              Height = 358
              Hint = ''
              Align = alLeft
              TabOrder = 9
              ShowCaption = False
              Caption = ''
              object rgveriErisim: TUniRadioGroup
                Left = 1
                Top = 1
                Width = 410
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
                Width = 410
                Height = 306
                Hint = ''
                DataSource = dsDepts
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
          end
          object pgPayl_Amac: TUniTabSheet
            Hint = ''
            Caption = 'Veri Payla'#351'ma (Ama'#231'lar)'
            Font.OverrideDefaults = [ovFontHeight]
            ParentFont = False
            object btnAmacPayAdd: TUniBitBtn
              Left = 420
              Top = 10
              Width = 30
              Height = 30
              Hint = ''
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 0
              Images = MainMod.BtnImgList
              ImageIndex = 0
              OnClick = btnAmacPayAddClick
            end
            object btnAmacPayDel: TUniBitBtn
              Left = 420
              Top = 46
              Width = 30
              Height = 30
              Hint = ''
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 1
              Images = MainMod.BtnImgList
              ImageIndex = 5
              OnClick = btnAmacPayDelClick
            end
            object btnAmacPayNew: TUniBitBtn
              Left = 420
              Top = 82
              Width = 30
              Height = 30
              Hint = ''
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 2
              Images = MainMod.BtnImgList
              ImageIndex = 1
              OnClick = btnAmacPayNewClick
            end
            object grdAmacPayD: TUniDBGrid
              Left = 10
              Top = 207
              Width = 400
              Height = 170
              Hint = ''
              DataSource = dsAmacPayD
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
              WebOptions.Paged = False
              WebOptions.CustomizableCells = False
              WebOptions.FetchAll = True
              LoadMask.Message = 'Y'#252'kleniyor...'
              EmptyText = 'Veri Bulunamad'#305
              Font.OverrideDefaults = [ovFontHeight]
              ParentFont = False
              TabOrder = 3
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
            object btnAmacPayDAdd: TUniBitBtn
              Left = 420
              Top = 207
              Width = 30
              Height = 30
              Hint = ''
              Visible = False
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 4
              Images = MainMod.BtnImgList
              ImageIndex = 0
              OnClick = btnAmacPayDAddClick
            end
            object btnAmacPayDDel: TUniBitBtn
              Left = 420
              Top = 243
              Width = 30
              Height = 30
              Hint = ''
              Visible = False
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 5
              Images = MainMod.BtnImgList
              ImageIndex = 5
              OnClick = btnAmacPayDDelClick
            end
            object btnAmacPayDNew: TUniBitBtn
              Left = 420
              Top = 279
              Width = 30
              Height = 30
              Hint = ''
              Visible = False
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 6
              Images = MainMod.BtnImgList
              ImageIndex = 1
              OnClick = btnAmacPayNewClick
            end
            object UniLabel51: TUniLabel
              Left = 455
              Top = 10
              Width = 162
              Height = 170
              Hint = ''
              AutoSize = False
              Caption = 
                'Bu k'#305's'#305'mda girdi'#287'iniz ama'#231'lar, veri kayna'#287#305'n'#305'n geneli i'#231'in ge'#231'er' +
                'lidir ve t'#252'm veri tipleri i'#231'in ge'#231'erli olacakt'#305'r. Bu sebeple alt' +
                ' k'#305's'#305'mda tekrar belirtmenize gerek yoktur.'
              ParentFont = False
              Font.Color = 13226752
              Font.Height = -12
              Font.Style = [fsBold]
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 7
            end
            object UniLabel52: TUniLabel
              Left = 455
              Top = 207
              Width = 162
              Height = 170
              Hint = ''
              Visible = False
              AutoSize = False
              Caption = 
                'Bu k'#305's'#305'mda girdi'#287'iniz ama'#231'lar, sadece se'#231'ili veri tipine '#246'zel ge' +
                #231'erlidir. Di'#287'er veri tiplerini etkilemez.'
              ParentFont = False
              Font.Color = 13226752
              Font.Height = -12
              Font.Style = [fsBold]
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 8
            end
            object pnlamacvp: TUniPanel
              Left = 0
              Top = 0
              Width = 412
              Height = 358
              Hint = ''
              Align = alLeft
              TabOrder = 9
              ShowCaption = False
              Caption = ''
              object rgamacvp: TUniRadioGroup
                Left = 1
                Top = 1
                Width = 410
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
                Width = 410
                Height = 306
                Hint = ''
                DataSource = dsAmacPay
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
          end
          object pgPayl_Metod: TUniTabSheet
            Hint = ''
            Caption = 'Veri Payla'#351'ma (Metodlar)'
            Font.OverrideDefaults = [ovFontHeight]
            ParentFont = False
            object btnMetodPayAdd: TUniBitBtn
              Left = 420
              Top = 10
              Width = 30
              Height = 30
              Hint = ''
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 0
              Images = MainMod.BtnImgList
              ImageIndex = 0
              OnClick = btnMetodPayAddClick
            end
            object btnMetodPayDel: TUniBitBtn
              Left = 420
              Top = 46
              Width = 30
              Height = 30
              Hint = ''
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 1
              Images = MainMod.BtnImgList
              ImageIndex = 5
              OnClick = btnMetodPayDelClick
            end
            object btnMetodPayNew: TUniBitBtn
              Left = 420
              Top = 82
              Width = 30
              Height = 30
              Hint = ''
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 2
              Images = MainMod.BtnImgList
              ImageIndex = 1
              OnClick = btnMetodPayNewClick
            end
            object grdMetodPayD: TUniDBGrid
              Left = 13
              Top = 207
              Width = 400
              Height = 170
              Hint = ''
              DataSource = dsMetodPayD
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
              WebOptions.Paged = False
              WebOptions.CustomizableCells = False
              WebOptions.FetchAll = True
              LoadMask.Message = 'Y'#252'kleniyor...'
              EmptyText = 'Veri Bulunamad'#305
              Font.OverrideDefaults = [ovFontHeight]
              ParentFont = False
              TabOrder = 3
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
            object btnMetodPayDAdd: TUniBitBtn
              Left = 420
              Top = 207
              Width = 30
              Height = 30
              Hint = ''
              Visible = False
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 4
              Images = MainMod.BtnImgList
              ImageIndex = 0
              OnClick = btnMetodPayDAddClick
            end
            object btnMetodPayDDel: TUniBitBtn
              Left = 420
              Top = 243
              Width = 30
              Height = 30
              Hint = ''
              Visible = False
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 5
              Images = MainMod.BtnImgList
              ImageIndex = 5
              OnClick = btnMetodPayDDelClick
            end
            object btnMetodPayDNew: TUniBitBtn
              Left = 420
              Top = 279
              Width = 30
              Height = 30
              Hint = ''
              Visible = False
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 6
              Images = MainMod.BtnImgList
              ImageIndex = 1
              OnClick = btnMetodPayNewClick
            end
            object UniLabel53: TUniLabel
              Left = 456
              Top = 17
              Width = 162
              Height = 170
              Hint = ''
              AutoSize = False
              Caption = 
                'Bu k'#305's'#305'mda girdi'#287'iniz metodlar, veri kayna'#287#305'n'#305'n geneli i'#231'in ge'#231'e' +
                'rlidir ve t'#252'm veri tipleri i'#231'in ge'#231'erli olacakt'#305'r. Bu sebeple al' +
                't k'#305's'#305'mda tekrar belirtmenize gerek yoktur.'
              ParentFont = False
              Font.Color = 13226752
              Font.Height = -12
              Font.Style = [fsBold]
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 7
            end
            object UniLabel54: TUniLabel
              Left = 455
              Top = 207
              Width = 162
              Height = 170
              Hint = ''
              Visible = False
              AutoSize = False
              Caption = 
                'Bu k'#305's'#305'mda girdi'#287'iniz metodlar, sadece se'#231'ili veri tipine '#246'zel g' +
                'e'#231'erlidir. Di'#287'er veri tiplerini etkilemez.'
              ParentFont = False
              Font.Color = 13226752
              Font.Height = -12
              Font.Style = [fsBold]
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 8
            end
            object pnlmetodvp: TUniPanel
              Left = 0
              Top = 0
              Width = 412
              Height = 358
              Hint = ''
              Align = alLeft
              TabOrder = 9
              ShowCaption = False
              Caption = ''
              object rgmetodvp: TUniRadioGroup
                Left = 1
                Top = 1
                Width = 410
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
                Width = 410
                Height = 306
                Hint = ''
                DataSource = dsMetodPay
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
          end
          object pgPayl_Taraf: TUniTabSheet
            Hint = ''
            Caption = 'Payla'#351#305'lan Taraflar'
            Font.OverrideDefaults = [ovFontHeight]
            ParentFont = False
            object btnTarafAdd: TUniBitBtn
              Left = 420
              Top = 10
              Width = 30
              Height = 30
              Hint = ''
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 0
              Images = MainMod.BtnImgList
              ImageIndex = 0
              OnClick = btnTarafAddClick
            end
            object btnTarafDel: TUniBitBtn
              Left = 420
              Top = 46
              Width = 30
              Height = 30
              Hint = ''
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 1
              Images = MainMod.BtnImgList
              ImageIndex = 5
              OnClick = btnTarafDelClick
            end
            object btnTarafNew: TUniBitBtn
              Left = 420
              Top = 82
              Width = 30
              Height = 30
              Hint = ''
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 2
              Images = MainMod.BtnImgList
              ImageIndex = 1
              OnClick = btnTarafNewClick
            end
            object grdTarafD: TUniDBGrid
              Left = 13
              Top = 207
              Width = 400
              Height = 170
              Hint = ''
              DataSource = dsTarafD
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
              WebOptions.Paged = False
              WebOptions.CustomizableCells = False
              WebOptions.FetchAll = True
              LoadMask.Message = 'Y'#252'kleniyor...'
              EmptyText = 'Veri Bulunamad'#305
              TabOrder = 3
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
            object btnTarafDAdd: TUniBitBtn
              Left = 419
              Top = 207
              Width = 30
              Height = 30
              Hint = ''
              Visible = False
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 4
              Images = MainMod.BtnImgList
              ImageIndex = 0
              OnClick = btnTarafDAddClick
            end
            object btnTarafDDel: TUniBitBtn
              Left = 420
              Top = 243
              Width = 30
              Height = 30
              Hint = ''
              Visible = False
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 5
              Images = MainMod.BtnImgList
              ImageIndex = 5
              OnClick = btnTarafDDelClick
            end
            object btnTarafDNew: TUniBitBtn
              Left = 420
              Top = 279
              Width = 30
              Height = 30
              Hint = ''
              Visible = False
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 6
              Images = MainMod.BtnImgList
              ImageIndex = 1
              OnClick = btnTarafNewClick
            end
            object UniLabel31: TUniLabel
              Left = 467
              Top = 14
              Width = 85
              Height = 13
              Hint = ''
              AutoSize = False
              Caption = 'Payl. Taraf Tipi'
              ParentFont = False
              Font.Color = 13226752
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 7
            end
            object edTarafTipi: TUniDBComboBox
              Left = 467
              Top = 28
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
              TabOrder = 8
              IconItems = <>
            end
            object UniLabel55: TUniLabel
              Left = 455
              Top = 64
              Width = 162
              Height = 140
              Hint = ''
              AutoSize = False
              Caption = 
                'Bu k'#305's'#305'mda girdi'#287'iniz payla'#351#305'm taraflar'#305', veri kayna'#287#305'n'#305'n geneli' +
                ' i'#231'in ge'#231'erlidir ve t'#252'm veri tipleri i'#231'in ge'#231'erli olacakt'#305'r. Bu ' +
                'sebeple alt k'#305's'#305'mda tekrar belirtmenize gerek yoktur.'
              ParentFont = False
              Font.Color = 13226752
              Font.Height = -12
              Font.Style = [fsBold]
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 9
            end
            object UniLabel56: TUniLabel
              Left = 455
              Top = 207
              Width = 162
              Height = 170
              Hint = ''
              Visible = False
              AutoSize = False
              Caption = 
                'Bu k'#305's'#305'mda girdi'#287'iniz payla'#351#305'm taraflar'#305', sadece se'#231'ili veri tip' +
                'ine '#246'zel ge'#231'erlidir. Di'#287'er veri tiplerini etkilemez.'
              ParentFont = False
              Font.Color = 13226752
              Font.Height = -12
              Font.Style = [fsBold]
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 10
            end
            object pnlpaylasilanTaraf: TUniPanel
              Left = 0
              Top = 0
              Width = 412
              Height = 358
              Hint = ''
              Align = alLeft
              TabOrder = 11
              ShowCaption = False
              Caption = ''
              object rgPaylasilanTaraf: TUniRadioGroup
                Left = 1
                Top = 1
                Width = 410
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
                Width = 410
                Height = 306
                Hint = ''
                DataSource = dsTaraf
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
          end
        end
        object UniPanel1: TUniPanel
          Left = 0
          Top = 0
          Width = 287
          Height = 386
          Hint = ''
          Align = alLeft
          TabOrder = 1
          Caption = 'UniPanel1'
          object grdVeriTipi: TUniDBGrid
            Left = 1
            Top = 93
            Width = 285
            Height = 292
            Hint = ''
            TitleFont.OverrideDefaults = [ovFontHeight]
            DataSource = dsDetail
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
            WebOptions.Paged = False
            WebOptions.PageSize = 50
            WebOptions.CustomizableCells = False
            WebOptions.FetchAll = True
            LoadMask.Message = 'Veri y'#252'kleniyor...'
            EmptyText = 'Veri yok'
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
      object pgSozlesmePolitika: TUniTabSheet
        Hint = ''
        TabVisible = False
        Caption = 'S'#246'zle'#351'me / Politika / Prosed'#252'r'
        Font.OverrideDefaults = [ovFontHeight]
        ParentFont = False
        object chbPaylSozlesme: TUniDBCheckBox
          Left = 106
          Top = 18
          Width = 249
          Height = 17
          Hint = ''
          DataField = 'payl_sozlesme'
          DataSource = dsEnvanter
          ValueChecked = 'E'
          ValueUnchecked = 'H'
          Caption = 'Payla'#351#305'm '#304'le '#304'lgili Olarak S'#246'zle'#351'me Var'
          ParentFont = False
          Font.Color = 13226752
          Font.Style = [fsBold]
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 7
          ParentColor = False
          Color = clBtnFace
          OnClick = chbPaylSozlesmeClick
        end
        object UniLabel18: TUniLabel
          Left = 12
          Top = 43
          Width = 85
          Height = 67
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'S'#246'zle'#351'mesel Dayana'#287#305' Varsa S'#246'zle'#351'menin '#304'smi'
          ParentFont = False
          Font.Color = 13226752
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 0
        end
        object UniDBMemo6: TUniDBMemo
          Left = 103
          Top = 44
          Width = 345
          Height = 67
          Hint = ''
          DataField = 'payl_sozisim'
          DataSource = dsEnvanter
          TabOrder = 8
        end
        object UniLabel22: TUniLabel
          Left = 12
          Top = 116
          Width = 85
          Height = 67
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'S'#246'zle'#351'menin Maddesi'
          ParentFont = False
          Font.Color = 13226752
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
        end
        object UniDBMemo8: TUniDBMemo
          Left = 103
          Top = 116
          Width = 345
          Height = 67
          Hint = ''
          DataField = 'payl_sozmadde'
          DataSource = dsEnvanter
          TabOrder = 9
        end
        object chbDgrPol: TUniDBCheckBox
          Left = 106
          Top = 213
          Width = 250
          Height = 17
          Hint = ''
          DataField = 'dgr_politika'
          DataSource = dsEnvanter
          ValueChecked = 'E'
          ValueUnchecked = 'H'
          Caption = #304'lgili Politika ve Prosed'#252'r Var'
          ParentFont = False
          Font.Style = [fsBold]
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 10
          ParentColor = False
          Color = clBtnFace
          OnClick = chbDgrPolClick
        end
        object UniLabel29: TUniLabel
          Left = 12
          Top = 245
          Width = 85
          Height = 50
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = #304'lgili Politika ve Prosed'#252'r'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 3
        end
        object UniDBMemo13: TUniDBMemo
          Left = 103
          Top = 245
          Width = 345
          Height = 50
          Hint = ''
          DataField = 'dgr_polisim'
          DataSource = dsEnvanter
          TabOrder = 11
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase('#39'TR'#39')); '#13#10'  sender.inputEl.' +
              'dom.setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel30: TUniLabel
          Left = 12
          Top = 305
          Width = 85
          Height = 50
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = #304'lgili Politika ve Prosed'#252'r K'#305'sm'#305
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 4
        end
        object UniDBMemo14: TUniDBMemo
          Left = 103
          Top = 305
          Width = 345
          Height = 50
          Hint = ''
          DataField = 'dgr_polmadde'
          DataSource = dsEnvanter
          TabOrder = 12
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase('#39'TR'#39')); '#13#10'  sender.inputEl.' +
              'dom.setSelectionRange(pos, pos);'#13#10'}')
        end
        object chbDgrSoz: TUniDBCheckBox
          Left = 574
          Top = 217
          Width = 250
          Height = 17
          Hint = ''
          DataField = 'dgr_sozlesme'
          DataSource = dsEnvanter
          ValueChecked = 'E'
          ValueUnchecked = 'H'
          Caption = #304'lgili Olarak S'#246'zle'#351'me Var'
          ParentFont = False
          Font.Style = [fsBold]
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 13
          ParentColor = False
          Color = clBtnFace
          OnClick = chbDgrSozClick
        end
        object UniLabel28: TUniLabel
          Left = 480
          Top = 245
          Width = 85
          Height = 50
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = #304'lgili S'#246'zle'#351'menin '#304'smi'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 2
        end
        object UniDBMemo15: TUniDBMemo
          Left = 571
          Top = 245
          Width = 345
          Height = 50
          Hint = ''
          DataField = 'dgr_sozisim'
          DataSource = dsEnvanter
          TabOrder = 14
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase('#39'TR'#39')); '#13#10'  sender.inputEl.' +
              'dom.setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel32: TUniLabel
          Left = 480
          Top = 305
          Width = 85
          Height = 50
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'S'#246'zle'#351'menin Maddesi'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 5
        end
        object UniDBMemo19: TUniDBMemo
          Left = 571
          Top = 305
          Width = 345
          Height = 50
          Hint = ''
          DataField = 'dgr_sozmadde'
          DataSource = dsEnvanter
          TabOrder = 15
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase('#39'TR'#39')); '#13#10'  sender.inputEl.' +
              'dom.setSelectionRange(pos, pos);'#13#10'}')
        end
        object UniLabel57: TUniLabel
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
          OnClick = btnDgrDocsNewClick
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
            DataSource = dsDgrDayanak
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
            DataSource = dsDgrDocs
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
            DataSource = dsHkkDayanak
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
            WebOptions.Paged = False
            WebOptions.CustomizableCells = False
            WebOptions.FetchAll = True
            LoadMask.Message = 'Loading data...'
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
            DataSource = dsHkkDocs
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
            WebOptions.Paged = False
            WebOptions.CustomizableCells = False
            WebOptions.FetchAll = True
            LoadMask.Message = 'Loading data...'
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
    Top = 471
    Width = 943
    Height = 48
    Hint = ''
    Align = alBottom
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      943
      48)
    object btnCancel: TUniBitBtn
      Left = 841
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
      Left = 739
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
      Left = 637
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
    Width = 943
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
    Left = 852
    Top = 375
  end
  object qSurec: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, surec FROM def_data_surec'
      'WHERE mc_id = 2'
      'ORDER BY id')
    Left = 890
    Top = 107
  end
  object dsSurec: TUniDataSource
    DataSet = qSurec
    Left = 938
    Top = 107
  end
  object qDept: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, title FROM sys_deptdef'
      'ORDER BY id'
      '')
    Left = 874
    Top = 62
  end
  object dsDept: TUniDataSource
    DataSet = qDept
    Left = 938
    Top = 62
  end
  object qKaynak: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, kaynak FROM def_data_kaynak'
      'WHERE mc_id = 2'
      'ORDER BY id')
    Left = 890
    Top = 152
  end
  object dsKaynak: TUniDataSource
    DataSet = qKaynak
    Left = 938
    Top = 152
  end
  object qOnem: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, onemderece FROM def_data_onemderece'
      'WHERE mc_id = 2'
      'ORDER BY id')
    Left = 890
    Top = 242
  end
  object dsOnem: TUniDataSource
    DataSet = qOnem
    Left = 938
    Top = 242
  end
  object tblAmacTop: TVirtualTable
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
    Left = 1371
    Top = 267
    Data = {
      0400020002006964030000000000000004006E616D6501002C01000000000000
      00000000}
  end
  object dsAmacTop: TUniDataSource
    DataSet = tblAmacTop
    Left = 1437
    Top = 267
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
    Left = 1371
    Top = 42
    Data = {
      0400020002006964030000000000000004006E616D650100C800000000000000
      00000000}
  end
  object dsDepts: TUniDataSource
    DataSet = tblDepts
    Left = 1437
    Top = 42
  end
  object tblMetodSak: TVirtualTable
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
    Left = 1371
    Top = 177
    Data = {
      0400020002006964030000000000000004006E616D6501002C01000000000000
      00000000}
  end
  object dsMetodSak: TUniDataSource
    DataSet = tblMetodSak
    Left = 1437
    Top = 177
  end
  object tblDgrDayanak: TVirtualTable
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
    Left = 1167
    Top = 189
    Data = {
      0400020002006964030000000000000004006E616D6501002C01000000000000
      00000000}
  end
  object dsDgrDayanak: TUniDataSource
    DataSet = tblDgrDayanak
    Left = 1239
    Top = 189
  end
  object tblTaraf: TVirtualTable
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
    Left = 1371
    Top = 87
    Data = {
      0400020002006964030000000000000004006E616D6501002C01000000000000
      00000000}
  end
  object dsTaraf: TUniDataSource
    DataSet = tblTaraf
    Left = 1437
    Top = 87
  end
  object tblMetodPay: TVirtualTable
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
    Left = 1371
    Top = 222
    Data = {
      0400020002006964030000000000000004006E616D6501002C01000000000000
      00000000}
  end
  object dsMetodPay: TUniDataSource
    DataSet = tblMetodPay
    Left = 1437
    Top = 222
  end
  object qEnvanter: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT *'
      'FROM data_envanter'
      'WHERE main_id = 0'
      'ORDER BY id')
    BeforePost = qEnvanterBeforePost
    Left = 568
    Top = 382
  end
  object dsEnvanter: TUniDataSource
    DataSet = qEnvanter
    OnStateChange = dsEnvanterStateChange
    OnDataChange = dsEnvanterDataChange
    Left = 625
    Top = 382
  end
  object tblDgrDocs: TVirtualTable
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
    Left = 1167
    Top = 234
    Data = {
      0400020002006964030000000000000004006E616D6501002C01000000000000
      00000000}
  end
  object dsDgrDocs: TUniDataSource
    DataSet = tblDgrDocs
    Left = 1239
    Top = 234
  end
  object tblHkkDayanak: TVirtualTable
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
    Left = 1167
    Top = 99
    Data = {
      0400020002006964030000000000000004006E616D6501002C01000000000000
      00000000}
  end
  object dsHkkDayanak: TUniDataSource
    DataSet = tblHkkDayanak
    Left = 1239
    Top = 99
  end
  object tblHkkDocs: TVirtualTable
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
    Left = 1167
    Top = 144
    Data = {
      0400020002006964030000000000000004006E616D6501002C01000000000000
      00000000}
  end
  object dsHkkDocs: TUniDataSource
    DataSet = tblHkkDocs
    Left = 1239
    Top = 144
  end
  object qCheckList: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT *'
      'FROM data_checklist'
      'ORDER BY id')
    Left = 1167
    Top = 54
  end
  object dsCheckList: TUniDataSource
    DataSet = qCheckList
    Left = 1239
    Top = 54
  end
  object dsAmacSak: TUniDataSource
    DataSet = tblAmacSak
    Left = 1437
    Top = 312
  end
  object tblAmacSak: TVirtualTable
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
    Left = 1371
    Top = 312
    Data = {
      0400020002006964030000000000000004006E616D6501002C01000000000000
      00000000}
  end
  object dsAmacPay: TUniDataSource
    DataSet = tblAmacPay
    Left = 1437
    Top = 357
  end
  object tblAmacPay: TVirtualTable
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
    Left = 1371
    Top = 357
    Data = {
      0400020002006964030000000000000004006E616D6501002C01000000000000
      00000000}
  end
  object qKisi: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, kisi FROM def_data_kisi'
      'WHERE mc_id = 2'
      'ORDER BY id'
      '')
    Left = 890
    Top = 205
  end
  object dsKisi: TUniDataSource
    DataSet = qKisi
    Left = 938
    Top = 197
  end
  object tblMetodTop: TVirtualTable
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
    Left = 1371
    Top = 132
    Data = {
      0400020002006964030000000000000004006E616D6501002C01000000000000
      00000000}
  end
  object dsMetodTop: TUniDataSource
    DataSet = tblMetodTop
    Left = 1437
    Top = 132
  end
  object qEnvDet: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT *'
      'FROM data_envanter'
      'WHERE main_id > 0'
      'ORDER BY id')
    CachedUpdates = True
    Left = 582
    Top = 436
  end
  object dsEnvDet: TUniDataSource
    DataSet = qEnvDet
    Left = 630
    Top = 436
  end
  object tblDeptsD: TVirtualTable
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
    Left = 1563
    Top = 42
    Data = {
      0400020002006964030000000000000004006E616D650100C800000000000000
      00000000}
  end
  object dsDeptsD: TUniDataSource
    DataSet = tblDeptsD
    Left = 1629
    Top = 42
  end
  object tblTarafD: TVirtualTable
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
    Left = 1563
    Top = 87
    Data = {
      0400020002006964030000000000000004006E616D6501002C01000000000000
      00000000}
  end
  object dsTarafD: TUniDataSource
    DataSet = tblTarafD
    Left = 1629
    Top = 87
  end
  object tblMetodTopD: TVirtualTable
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
    Left = 1563
    Top = 132
    Data = {
      0400020002006964030000000000000004006E616D6501002C01000000000000
      00000000}
  end
  object dsMetodTopD: TUniDataSource
    DataSet = tblMetodTopD
    Left = 1629
    Top = 132
  end
  object tblMetodSakD: TVirtualTable
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
    Left = 1563
    Top = 177
    Data = {
      0400020002006964030000000000000004006E616D6501002C01000000000000
      00000000}
  end
  object dsMetodSakD: TUniDataSource
    DataSet = tblMetodSakD
    Left = 1629
    Top = 177
  end
  object tblMetodPayD: TVirtualTable
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
    Left = 1563
    Top = 222
    Data = {
      0400020002006964030000000000000004006E616D6501002C01000000000000
      00000000}
  end
  object dsMetodPayD: TUniDataSource
    DataSet = tblMetodPayD
    Left = 1629
    Top = 222
  end
  object tblAmacTopD: TVirtualTable
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
    Left = 1563
    Top = 267
    Data = {
      0400020002006964030000000000000004006E616D6501002C01000000000000
      00000000}
  end
  object dsAmacTopD: TUniDataSource
    DataSet = tblAmacTopD
    Left = 1629
    Top = 267
  end
  object tblAmacSakD: TVirtualTable
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
    Left = 1563
    Top = 312
    Data = {
      0400020002006964030000000000000004006E616D6501002C01000000000000
      00000000}
  end
  object dsAmacSakD: TUniDataSource
    DataSet = tblAmacSakD
    Left = 1629
    Top = 312
  end
  object tblAmacPayD: TVirtualTable
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
    Left = 1563
    Top = 357
    Data = {
      0400020002006964030000000000000004006E616D6501002C01000000000000
      00000000}
  end
  object dsAmacPayD: TUniDataSource
    DataSet = tblAmacPayD
    Left = 1629
    Top = 357
  end
  object tblDetail: TVirtualTable
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'veritipi_id'
        DataType = ftInteger
      end
      item
        Name = 'kategori_id'
        DataType = ftInteger
      end
      item
        Name = 'veritipi_str'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'kategori_str'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'nitelik'
        DataType = ftString
        Size = 1
      end>
    BeforeScroll = tblDetailBeforeScroll
    AfterScroll = tblDetailAfterScroll
    Left = 750
    Top = 372
    Data = {
      040006000200696403000000000000000B0076657269746970695F6964030000
      00000000000B006B617465676F72695F696403000000000000000C0076657269
      746970695F73747201006400000000000C006B617465676F72695F7374720100
      64000000000007006E6974656C696B0100010000000000000000000000}
  end
  object dsDetail: TUniDataSource
    DataSet = tblDetail
    Left = 798
    Top = 372
  end
  object vqenvanter: TVirtualTable
    Left = 517
    Top = 377
    Data = {04000000000000000000}
  end
  object VqEnvDet: TVirtualTable
    Left = 528
    Top = 433
    Data = {04000000000000000000}
  end
  object vtmp1: TVirtualTable
    Left = 581
    Top = 297
    Data = {04000000000000000000}
  end
  object vqtmp: TVirtualQuery
    SourceDataSets = <>
    Left = 621
    Top = 297
  end
  object qdetail: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT *'
      'FROM data_envanter'
      'WHERE main_id > 0'
      'ORDER BY id')
    CachedUpdates = True
    Left = 678
    Top = 308
  end
  object qtmp2: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    CachedUpdates = True
    Left = 892
    Top = 383
  end
end
