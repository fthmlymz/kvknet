object frmVeriTipiAnalizIslemleri: TfrmVeriTipiAnalizIslemleri
  Left = 0
  Top = 0
  Width = 1300
  Height = 1200
  OnCreate = UniFrameCreate
  Layout = 'fit'
  LayoutConfig.BodyPadding = '50'
  LayoutAttribs.Padding = '50'
  TabOrder = 0
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 1300
    Height = 1200
    Hint = ''
    ParentColor = False
    Align = alClient
    AlignmentControl = uniAlignmentClient
    ParentAlignmentControl = False
    TabOrder = 0
    Layout = 'fit'
    object pnla: TUniPanel
      Left = 0
      Top = 0
      Width = 1300
      Height = 1200
      Hint = ''
      Align = alClient
      TabOrder = 1
      ShowCaption = False
      TitleAlign = taCenter
      Caption = ''
      AlignmentControl = uniAlignmentClient
      ParentAlignmentControl = False
      Layout = 'accordion'
      OnResize = pnlaResize
      object pnl2kaynak: TUniPanel
        Left = 35
        Top = 285
        Width = 1262
        Height = 100
        Hint = ''
        CreateOrder = 1
        TabOrder = 1
        ShowCaption = False
        TitleVisible = True
        Title = 'Veri Kayna'#287#305' Se'#231'im'
        Caption = ''
        Layout = 'fit'
        LayoutConfig.BodyPadding = '15'
        OnResize = pnl2kaynakResize
        object pnl1kaynak: TUniPanel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 734
          Height = 92
          Hint = ''
          Align = alLeft
          TabOrder = 1
          BorderStyle = ubsNone
          Title = 'Kaynaklar'
          Caption = 'pnl1kaynak'
          Layout = 'hbox'
          LayoutConfig.Flex = 1
          LayoutConfig.Height = '100%'
          object UniPanel7: TUniPanel
            Left = 0
            Top = 0
            Width = 734
            Height = 48
            Hint = ''
            Align = alTop
            TabOrder = 2
            BorderStyle = ubsNone
            ShowCaption = False
            Caption = ''
            object btnaddKaynak: TUniBitBtn
              AlignWithMargins = True
              Left = 694
              Top = 10
              Width = 30
              Height = 28
              Hint = ''
              Margins.Left = 10
              Margins.Top = 10
              Margins.Right = 10
              Margins.Bottom = 10
              Caption = ''
              Align = alRight
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 1
              Images = MainMod.BtnImgList
              ImageIndex = 0
              OnClick = btnaddKaynakClick
            end
          end
          object grdkaynak: TUniDBGrid
            Left = 0
            Top = 48
            Width = 734
            Height = 44
            Hint = ''
            TitleFont.OverrideDefaults = [ovFontHeight]
            DataSource = dsKaynak
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete]
            WebOptions.Paged = False
            WebOptions.PageSize = 50
            WebOptions.CustomizableCells = False
            WebOptions.FetchAll = True
            LoadMask.Message = 'Veri y'#252'kleniyor...'
            EmptyText = 'Veri yok'
            TrackOver = False
            Align = alClient
            Font.OverrideDefaults = [ovFontHeight]
            ParentFont = False
            TabOrder = 1
            OnCellClick = grdkaynakCellClick
            OnColumnSort = grdkaynakColumnSort
            OnColumnFilter = grdkaynakColumnFilter
            Columns = <
              item
                FieldName = 'kaynak'
                Filtering.Enabled = True
                Filtering.Editor = fedkaynak
                Title.Alignment = taCenter
                Title.Caption = 'Kaynak'
                Title.Font.OverrideDefaults = [ovFontHeight]
                Width = 350
                Font.OverrideDefaults = [ovFontHeight]
                Sortable = True
                DisplayMemo = True
              end
              item
                FieldName = 'select'
                Filtering.Enabled = True
                Filtering.Editor = fchkaynakselect
                Title.Caption = 'Se'#231
                Width = 100
                Alignment = taLeftJustify
                Sortable = True
                CheckBoxField.AutoPost = True
                CheckBoxField.BooleanFieldOnly = False
                CheckBoxField.FieldValues = 'T;F'
                CheckBoxField.DisplayValues = ' ;  '
                Menu.MenuEnabled = False
              end>
          end
        end
        object pnl2veritipi: TUniPanel
          AlignWithMargins = True
          Left = 744
          Top = 4
          Width = 461
          Height = 92
          Hint = ''
          Align = alLeft
          TabOrder = 2
          BorderStyle = ubsNone
          Title = 'Veri Tipleri'
          Caption = 'pnl2veritipi'
          Layout = 'hbox'
          LayoutConfig.Flex = 2
          LayoutConfig.Height = '100%'
          object grdveritipi: TUniDBGrid
            Left = 0
            Top = 54
            Width = 461
            Height = 38
            Hint = ''
            TitleFont.OverrideDefaults = [ovFontHeight]
            DataSource = dsveritipi
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete]
            WebOptions.Paged = False
            WebOptions.PageSize = 50
            WebOptions.CustomizableCells = False
            WebOptions.FetchAll = True
            Grouping.FieldName = 'kategori'
            Grouping.FieldCaption = 'Kategori'
            Grouping.Enabled = True
            LoadMask.Message = 'Veri y'#252'kleniyor...'
            EmptyText = 'Veri yok'
            TrackOver = False
            Align = alClient
            Font.OverrideDefaults = [ovFontHeight]
            ParentFont = False
            TabOrder = 1
            OnColumnSort = grdveritipiColumnSort
            OnColumnFilter = grdveritipiColumnFilter
            Columns = <
              item
                FieldName = 'veri_tipi'
                Filtering.Enabled = True
                Filtering.Editor = fedveritipi
                Title.Caption = 'Veri tipi'
                Width = 300
                Font.OverrideDefaults = [ovFontHeight]
              end
              item
                FieldName = 'kategori'
                Filtering.Enabled = True
                Filtering.Editor = fedkategori
                Title.Caption = 'Kategori'
                Width = 300
                Font.OverrideDefaults = [ovFontHeight]
              end
              item
                FieldName = 'select'
                Filtering.Enabled = True
                Filtering.Editor = fchveritipiselect
                Title.Caption = 'Se'#231
                Width = 100
                Font.OverrideDefaults = [ovFontHeight]
                Alignment = taLeftJustify
                CheckBoxField.AutoPost = True
                CheckBoxField.BooleanFieldOnly = False
                CheckBoxField.FieldValues = 'T;F'
                CheckBoxField.DisplayValues = ' ;  '
                Menu.MenuEnabled = False
              end>
          end
          object UniPanel6: TUniPanel
            AlignWithMargins = True
            Left = 10
            Top = 3
            Width = 448
            Height = 48
            Hint = ''
            Margins.Left = 10
            Align = alTop
            TabOrder = 2
            BorderStyle = ubsNone
            ShowCaption = False
            Caption = ''
            object btnaddvertipi: TUniBitBtn
              AlignWithMargins = True
              Left = 408
              Top = 10
              Width = 30
              Height = 28
              Hint = ''
              Margins.Left = 10
              Margins.Top = 10
              Margins.Right = 10
              Margins.Bottom = 10
              Caption = ''
              Align = alRight
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 1
              Images = MainMod.BtnImgList
              ImageIndex = 0
              OnClick = btnaddvertipiClick
            end
            object btnaddkategori: TUniBitBtn
              AlignWithMargins = True
              Left = 358
              Top = 10
              Width = 30
              Height = 28
              Hint = ''
              Margins.Left = 10
              Margins.Top = 10
              Margins.Right = 10
              Margins.Bottom = 10
              Caption = ''
              Align = alRight
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 2
              Images = MainMod.BtnImgList
              ImageIndex = 0
              OnClick = btnaddkategoriClick
            end
          end
        end
      end
      object pnl3amac: TUniPanel
        Left = 35
        Top = 400
        Width = 1221
        Height = 193
        Hint = ''
        CreateOrder = 2
        TabOrder = 3
        ShowCaption = False
        TitleVisible = True
        Title = 'Ama'#231' - Metot - Payla'#351#305'lan Taraf'
        Caption = ''
        Layout = 'fit'
        LayoutAttribs.Padding = '5'
        object pnlamac: TUniPanel
          Left = 1
          Top = 1
          Width = 872
          Height = 191
          Hint = ''
          Align = alLeft
          TabOrder = 1
          ShowCaption = False
          Title = 'Ama'#231'lar'
          Caption = ''
          Layout = 'fit'
          LayoutConfig.Flex = 1
          LayoutConfig.Height = '100%'
          object UniPanel9: TUniPanel
            Left = 1
            Top = 1
            Width = 870
            Height = 48
            Hint = ''
            Align = alTop
            TabOrder = 1
            ShowCaption = False
            Caption = ''
            object btaddamac: TUniBitBtn
              AlignWithMargins = True
              Left = 830
              Top = 9
              Width = 30
              Height = 26
              Hint = ''
              Margins.Left = 10
              Margins.Top = 10
              Margins.Right = 10
              Margins.Bottom = 10
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 1
              Images = MainMod.BtnImgList
              ImageIndex = 0
              OnClick = btaddamacClick
            end
          end
          object grdamac: TUniDBGrid
            Left = 1
            Top = 49
            Width = 870
            Height = 141
            Hint = ''
            DataSource = dsamac
            WebOptions.Paged = False
            WebOptions.CustomizableCells = False
            WebOptions.FetchAll = True
            Grouping.Enabled = True
            Grouping.ShowCaption = False
            LoadMask.Message = 'Loading data...'
            TrackOver = False
            Align = alClient
            Font.OverrideDefaults = [ovFontHeight]
            ParentFont = False
            TabOrder = 2
            OnColumnSort = grdamacColumnSort
            OnColumnFilter = grdamacColumnFilter
            Columns = <
              item
                FieldName = 'amac'
                Filtering.Enabled = True
                Filtering.Editor = fedamac
                Title.Caption = 'Ama'#231
                Title.Font.OverrideDefaults = [ovFontHeight]
                Width = 500
                Font.OverrideDefaults = [ovFontHeight]
                Sortable = True
              end
              item
                FieldName = 'selectToplama'
                Filtering.Enabled = True
                Filtering.Editor = fchamacToplamaselect
                Title.Caption = 'Toplama'
                Title.Font.OverrideDefaults = [ovFontHeight]
                Width = 80
                Font.OverrideDefaults = [ovFontHeight]
                Alignment = taLeftJustify
                Sortable = True
                CheckBoxField.AutoPost = True
                CheckBoxField.BooleanFieldOnly = False
                CheckBoxField.FieldValues = 'T;F'
                CheckBoxField.DisplayValues = ' ;  '
                Menu.MenuEnabled = False
              end
              item
                FieldName = 'selectSaklama'
                Filtering.Enabled = True
                Filtering.Editor = fchamacSaklamaselect
                Title.Caption = 'Saklama'
                Title.Font.OverrideDefaults = [ovFontHeight]
                Width = 80
                Font.OverrideDefaults = [ovFontHeight]
                Alignment = taLeftJustify
                Sortable = True
                CheckBoxField.AutoPost = True
                CheckBoxField.BooleanFieldOnly = False
                CheckBoxField.FieldValues = 'T;F'
                CheckBoxField.DisplayValues = ' ;  '
              end
              item
                FieldName = 'SelectPaylasma'
                Filtering.Enabled = True
                Filtering.Editor = fchamacPaylasmaselect
                Title.Caption = 'Payla'#351'ma'
                Title.Font.OverrideDefaults = [ovFontHeight]
                Width = 80
                Font.OverrideDefaults = [ovFontHeight]
                Alignment = taLeftJustify
                Sortable = True
                CheckBoxField.AutoPost = True
                CheckBoxField.BooleanFieldOnly = False
                CheckBoxField.FieldValues = 'T;F'
                CheckBoxField.DisplayValues = ' ;  '
              end>
          end
        end
      end
      object pnl4metod: TUniPanel
        Left = 20
        Top = 612
        Width = 1220
        Height = 310
        Hint = ''
        CreateOrder = 3
        TabOrder = 4
        ShowCaption = False
        Title = 'aaaaaaaaaaaaa'
        Caption = ''
        Layout = 'fit'
        object pnlmetod: TUniPanel
          Left = 1
          Top = 1
          Width = 887
          Height = 308
          Hint = ''
          Align = alLeft
          TabOrder = 1
          ShowCaption = False
          Title = 'Metodlar'
          Caption = ''
          Layout = 'fit'
          LayoutConfig.Flex = 1
          LayoutConfig.Height = '100%'
          object grdmetod: TUniDBGrid
            Left = 1
            Top = 49
            Width = 885
            Height = 258
            Hint = ''
            DataSource = dsmetod
            WebOptions.Paged = False
            WebOptions.CustomizableCells = False
            WebOptions.FetchAll = True
            Grouping.Enabled = True
            Grouping.ShowCaption = False
            LoadMask.Message = 'Loading data...'
            TrackOver = False
            Align = alClient
            Font.OverrideDefaults = [ovFontHeight]
            ParentFont = False
            TabOrder = 1
            OnColumnSort = grdmetodColumnSort
            OnColumnFilter = grdmetodColumnFilter
            Columns = <
              item
                FieldName = 'metod'
                Filtering.Enabled = True
                Filtering.Editor = fedMetod
                Title.Caption = 'Metot'
                Title.Font.OverrideDefaults = [ovFontHeight]
                Width = 500
                Font.OverrideDefaults = [ovFontHeight]
                Sortable = True
              end
              item
                FieldName = 'selectToplama'
                Filtering.Enabled = True
                Filtering.Editor = fchMetodToplamaselect
                Title.Caption = 'Toplama'
                Title.Font.OverrideDefaults = [ovFontHeight]
                Width = 80
                Font.OverrideDefaults = [ovFontHeight]
                Alignment = taLeftJustify
                Sortable = True
                CheckBoxField.AutoPost = True
                CheckBoxField.BooleanFieldOnly = False
                CheckBoxField.FieldValues = 'T;F'
                CheckBoxField.DisplayValues = ' ;  '
                Menu.MenuEnabled = False
              end
              item
                FieldName = 'selectSaklama'
                Filtering.Enabled = True
                Filtering.Editor = fchMetodSaklamaSelect
                Title.Caption = 'Saklama'
                Title.Font.OverrideDefaults = [ovFontHeight]
                Width = 80
                Font.OverrideDefaults = [ovFontHeight]
                Alignment = taLeftJustify
                Sortable = True
                CheckBoxField.AutoPost = True
                CheckBoxField.BooleanFieldOnly = False
                CheckBoxField.FieldValues = 'T;F'
                CheckBoxField.DisplayValues = ' ;  '
              end
              item
                FieldName = 'SelectPaylasma'
                Filtering.Enabled = True
                Filtering.Editor = fchMetodPaylasmaSelect
                Title.Caption = 'Payla'#351'ma'
                Title.Font.OverrideDefaults = [ovFontHeight]
                Width = 80
                Font.OverrideDefaults = [ovFontHeight]
                Alignment = taLeftJustify
                Sortable = True
                CheckBoxField.AutoPost = True
                CheckBoxField.BooleanFieldOnly = False
                CheckBoxField.FieldValues = 'T;F'
                CheckBoxField.DisplayValues = ' ;  '
              end>
          end
          object UniPanel4: TUniPanel
            Left = 1
            Top = 1
            Width = 885
            Height = 48
            Hint = ''
            Align = alTop
            TabOrder = 2
            ShowCaption = False
            Caption = ''
            object btnaddmetod: TUniBitBtn
              AlignWithMargins = True
              Left = 844
              Top = 12
              Width = 30
              Height = 26
              Hint = ''
              Margins.Left = 10
              Margins.Top = 10
              Margins.Right = 10
              Margins.Bottom = 10
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 1
              Images = MainMod.BtnImgList
              ImageIndex = 0
              OnClick = btnaddmetodClick
            end
          end
        end
      end
      object pnl5taraf: TUniPanel
        Left = 22
        Top = 927
        Width = 1193
        Height = 225
        Hint = ''
        CreateOrder = 4
        TabOrder = 5
        ShowCaption = False
        TitleVisible = True
        Title = 'uuuuuuuuuuuuuuuuuuuuuuu'
        Caption = ''
        Layout = 'fit'
        object pnltaraf: TUniPanel
          Left = 1
          Top = 1
          Width = 885
          Height = 223
          Hint = ''
          Align = alLeft
          TabOrder = 1
          ShowCaption = False
          Title = 'Payla'#351#305'lan Taraflar'
          Caption = ''
          Layout = 'fit'
          LayoutConfig.Flex = 1
          LayoutConfig.IgnorePosition = False
          LayoutConfig.Height = '100%'
          object UniPanel5: TUniPanel
            Left = 1
            Top = 1
            Width = 883
            Height = 88
            Hint = ''
            Align = alTop
            TabOrder = 1
            ShowCaption = False
            Caption = ''
            object btnaddtaraf: TUniBitBtn
              AlignWithMargins = True
              Left = 843
              Top = 46
              Width = 30
              Height = 26
              Hint = ''
              Margins.Left = 10
              Margins.Top = 10
              Margins.Right = 10
              Margins.Bottom = 10
              Caption = ''
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              TabOrder = 1
              Images = MainMod.BtnImgList
              ImageIndex = 0
              OnClick = btnaddtarafClick
            end
            object UniRadioGroup1: TUniRadioGroup
              Left = 3
              Top = 7
              Width = 238
              Height = 66
              Hint = ''
              Items.Strings = (
                'YURT '#304#199#304
                'YURT DI'#350'I'
                'Y.'#304#199#304'/Y.DI'#350'I'
                'PAYLA'#350'ILMIYOR')
              Caption = 'Payla'#351#305'lan Taraf Tipi'
              TabOrder = 2
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              Columns = 2
            end
          end
          object grdtaraf: TUniDBGrid
            Left = 1
            Top = 89
            Width = 883
            Height = 133
            Hint = ''
            DataSource = dstaraf
            WebOptions.Paged = False
            WebOptions.CustomizableCells = False
            WebOptions.FetchAll = True
            Grouping.Enabled = True
            Grouping.ShowCaption = False
            LoadMask.Message = 'Loading data...'
            TrackOver = False
            Align = alClient
            Font.OverrideDefaults = [ovFontHeight]
            ParentFont = False
            TabOrder = 2
            OnColumnSort = grdtarafColumnSort
            OnColumnFilter = grdtarafColumnFilter
            Columns = <
              item
                FieldName = 'taraf'
                Filtering.Enabled = True
                Filtering.Editor = fedtaraf
                Title.Caption = 'Taraf'
                Title.Font.OverrideDefaults = [ovFontHeight]
                Width = 500
                Font.OverrideDefaults = [ovFontHeight]
                Sortable = True
              end
              item
                FieldName = 'select'
                Filtering.Enabled = True
                Filtering.Editor = fchTarafSelect
                Title.Caption = 'Se'#231
                Title.Font.OverrideDefaults = [ovFontHeight]
                Width = 100
                Font.OverrideDefaults = [ovFontHeight]
                Alignment = taLeftJustify
                Sortable = True
                CheckBoxField.AutoPost = True
                CheckBoxField.BooleanFieldOnly = False
                CheckBoxField.FieldValues = 'T;F'
                CheckBoxField.DisplayValues = ' ;  '
                Menu.MenuEnabled = False
              end>
          end
        end
      end
      object pnl1giris: TUniPanel
        Left = 35
        Top = 0
        Width = 1222
        Height = 262
        Hint = ''
        TabOrder = 2
        TitleVisible = True
        Title = 'Veri Tan'#305'mlama Giri'#351
        Caption = 'UniPanel2'
        Layout = 'fit'
        object UniPanel3: TUniPanel
          Left = 1
          Top = 1
          Width = 1220
          Height = 260
          Hint = ''
          Align = alClient
          TabOrder = 1
          BorderStyle = ubsNone
          ShowCaption = False
          Caption = ''
          object edDept: TUniDBLookupComboBox
            Left = 103
            Top = 95
            Width = 291
            Height = 28
            Hint = ''
            ListOnlyMode = lmFollowSource
            ListField = 'title'
            ListSource = dsdept
            KeyField = 'id'
            ListFieldIndex = 0
            DataField = 'dept_id'
            DataSource = dsvqenvanter
            ParentFont = False
            Font.OverrideDefaults = [ovFontHeight]
            EmptyText = 'Se'#231'im Yap'#305'lmam'#305#351
            TabOrder = 1
            Color = clWindow
            ClientEvents.ExtEvents.Strings = (
              
                'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
                'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
                'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
                'setSelectionRange(pos, pos);'#13#10'}')
            Style = csDropDown
            OnChange = OnchangeDepSurKisi
          end
          object edKisi: TUniDBLookupComboBox
            Left = 103
            Top = 175
            Width = 291
            Height = 28
            Hint = ''
            ListOnlyMode = lmFollowSource
            ListField = 'kisi'
            ListSource = dsKisi
            KeyField = 'id'
            ListFieldIndex = 0
            DataField = 'kisi_id'
            DataSource = dsvqenvanter
            ParentFont = False
            Font.OverrideDefaults = [ovFontHeight]
            EmptyText = 'Se'#231'im Yap'#305'lmam'#305#351
            TabOrder = 2
            Color = clWindow
            ClientEvents.ExtEvents.Strings = (
              
                'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
                'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
                'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
                'setSelectionRange(pos, pos);'#13#10'}')
            Style = csDropDown
            OnChange = OnchangeDepSurKisi
          end
          object edSurec: TUniDBLookupComboBox
            Left = 103
            Top = 135
            Width = 291
            Height = 28
            Hint = ''
            ListOnlyMode = lmFollowSource
            ListField = 'surec'
            ListSource = dssurec
            KeyField = 'id'
            ListFieldIndex = 0
            DataField = 'surec_id'
            DataSource = dsvqenvanter
            ParentFont = False
            Font.OverrideDefaults = [ovFontHeight]
            EmptyText = 'Se'#231'im Yap'#305'lmam'#305#351
            TabOrder = 3
            Color = clWindow
            ClientEvents.ExtEvents.Strings = (
              
                'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
                'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
                'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
                'setSelectionRange(pos, pos);'#13#10'}')
            Style = csDropDown
            OnChange = OnchangeDepSurKisi
          end
          object UniLabel2: TUniLabel
            Left = 12
            Top = 140
            Width = 85
            Height = 13
            Hint = ''
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'S'#252're'#231
            ParentFont = False
            Font.Color = clDefault
            Font.OverrideDefaults = [ovFontHeight]
            TabOrder = 4
          end
          object UniLabel23: TUniLabel
            Left = 12
            Top = 183
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
          object UniLabel9: TUniLabel
            Left = 12
            Top = 105
            Width = 85
            Height = 13
            Hint = ''
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Departman'
            ParentFont = False
            Font.Color = clDefault
            Font.OverrideDefaults = [ovFontHeight]
            TabOrder = 6
          end
          object UniPanel1: TUniPanel
            Left = 440
            Top = 20
            Width = 582
            Height = 125
            Hint = ''
            ParentFont = False
            Font.OverrideDefaults = [ovFontHeight]
            TabOrder = 7
            ShowCaption = False
            TitleVisible = True
            Title = 'fiziksel Salmama'
            Caption = ''
            object gbfSure: TUniGroupBox
              AlignWithMargins = True
              Left = 281
              Top = 10
              Width = 109
              Height = 73
              Hint = ''
              Margins.Top = 5
              Caption = 'S'#252're'
              TabOrder = 1
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              object edFSure: TUniDBNumberEdit
                AlignWithMargins = True
                Left = 7
                Top = 25
                Width = 95
                Height = 36
                Hint = ''
                Margins.Left = 5
                Margins.Top = 10
                Margins.Right = 5
                Margins.Bottom = 10
                DataField = 'sakl_fsure_sure'
                DataSource = dsvqenvanter
                Align = alClient
                ParentFont = False
                Font.OverrideDefaults = [ovFontHeight]
                TabOrder = 1
                MaxValue = 999.000000000000000000
                DecimalPrecision = 0
                DecimalSeparator = ','
              end
            end
            object rgfSaklama: TUniRadioGroup
              AlignWithMargins = True
              Left = 3
              Top = 10
              Width = 158
              Height = 73
              Hint = ''
              Margins.Top = 5
              Items.Strings = (
                'SAKLANIYOR'
                'SAKLANMIYOR')
              ItemIndex = 0
              Caption = 'Veriler Fiziksel olarak '
              TabOrder = 2
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              OnClick = rgfSaklamaClick
            end
            object rgfSaklamaBaslama: TUniRadioGroup
              AlignWithMargins = True
              Left = 164
              Top = 10
              Width = 114
              Height = 73
              Hint = ''
              Margins.Top = 5
              Items.Strings = (
                'BA'#350'LANGI'#199
                'B'#304'T'#304#350)
              ItemIndex = 0
              Caption = 'Faliyetin'
              TabOrder = 3
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              OnClick = rgfSaklamaBaslamaClick
            end
            object rgfGunAyYil: TUniRadioGroup
              AlignWithMargins = True
              Left = 395
              Top = 10
              Width = 122
              Height = 73
              Hint = ''
              Margins.Top = 5
              Items.Strings = (
                'YIL'
                'AY'
                'G'#220'N')
              ItemIndex = 0
              Caption = 'G'#252'n/Ay/Y'#305'l'
              TabOrder = 4
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              Columns = 2
              OnClick = rgfGunAyYilClick
            end
          end
          object UniPanel2: TUniPanel
            Left = 440
            Top = 153
            Width = 582
            Height = 108
            Hint = ''
            ParentFont = False
            Font.OverrideDefaults = [ovFontHeight]
            TabOrder = 8
            ShowCaption = False
            TitleVisible = True
            Title = 'Dijital saklama'
            Caption = ''
            object rgdsaklama: TUniRadioGroup
              AlignWithMargins = True
              Left = 3
              Top = 5
              Width = 158
              Height = 73
              Hint = ''
              Margins.Top = 5
              Items.Strings = (
                'SAKLANIYOR'
                'SAKLANMIYOR')
              ItemIndex = 0
              Caption = 'Veriler Dijital olarak '
              TabOrder = 1
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              OnClick = rgdsaklamaClick
            end
            object rgdsaklamaBaslama: TUniRadioGroup
              AlignWithMargins = True
              Left = 166
              Top = 5
              Width = 114
              Height = 73
              Hint = ''
              Margins.Top = 5
              Items.Strings = (
                'BA'#350'LANGI'#199
                'B'#304'T'#304#350)
              ItemIndex = 0
              Caption = 'Faliyetin'
              TabOrder = 2
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              OnClick = rgdsaklamaBaslamaClick
            end
            object gbdsure: TUniGroupBox
              AlignWithMargins = True
              Left = 281
              Top = 11
              Width = 109
              Height = 73
              Hint = ''
              Margins.Top = 5
              Caption = 'S'#252're'
              TabOrder = 3
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              object eddsure: TUniDBNumberEdit
                AlignWithMargins = True
                Left = 7
                Top = 25
                Width = 95
                Height = 36
                Hint = ''
                Margins.Left = 5
                Margins.Top = 10
                Margins.Right = 5
                Margins.Bottom = 10
                DataField = 'sakl_ssure_sure'
                DataSource = dsvqenvanter
                Align = alClient
                TabOrder = 1
                MaxValue = 999.000000000000000000
                DecimalPrecision = 0
                DecimalSeparator = ','
              end
            end
            object rgdGunAyYil: TUniRadioGroup
              AlignWithMargins = True
              Left = 397
              Top = 5
              Width = 122
              Height = 73
              Hint = ''
              Margins.Top = 5
              Items.Strings = (
                'YIL'
                'AY'
                'G'#220'N')
              ItemIndex = 0
              Caption = 'S'#252're G'#252'n/Ay/Y'#305'l'
              TabOrder = 4
              ParentFont = False
              Font.OverrideDefaults = [ovFontHeight]
              Columns = 2
              OnClick = rgdGunAyYilClick
            end
          end
          object btnSurecEkle: TUniSpeedButton
            Left = 398
            Top = 135
            Width = 30
            Height = 29
            Hint = ''
            Caption = ''
            ParentColor = False
            IconAlign = iaCenter
            Images = MainMod.PrjImgList
            ImageIndex = 18
            TabOrder = 9
            OnClick = btnSurecEkleClick
          end
          object btnKisiEkle: TUniSpeedButton
            Left = 398
            Top = 175
            Width = 30
            Height = 29
            Hint = ''
            Caption = ''
            ParentColor = False
            IconAlign = iaCenter
            Images = MainMod.PrjImgList
            ImageIndex = 18
            TabOrder = 10
            OnClick = btnKisiEkleClick
          end
        end
      end
    end
  end
  object UniHiddenPanel1: TUniHiddenPanel
    Left = 1001
    Top = 132
    Width = 269
    Height = 474
    Hint = ''
    Visible = True
    object fedkaynak: TUniEdit
      Left = 16
      Top = 16
      Width = 209
      Hint = ''
      CharEOL = #13
      Text = ''
      TabOrder = 1
      EmptyText = 'Veri Kayna'#287#305
    end
    object fchkaynakselect: TUniComboBox
      Left = 16
      Top = 44
      Width = 145
      Hint = ''
      Text = 'fchkaynakselect'
      Items.Strings = (
        ''
        'Evet'
        'Hay'#305'r')
      ItemIndex = 0
      TabOrder = 2
      IconItems = <>
    end
    object fchveritipiselect: TUniComboBox
      Left = 24
      Top = 136
      Width = 145
      Hint = ''
      Text = 'fchkaynakselect'
      Items.Strings = (
        ''
        'Evet'
        'Hay'#305'r')
      ItemIndex = 0
      TabOrder = 3
      IconItems = <>
    end
    object fchamacToplamaselect: TUniComboBox
      Left = 24
      Top = 200
      Width = 145
      Hint = ''
      Text = 'fchkaynakselect'
      Items.Strings = (
        ''
        'Evet'
        'Hay'#305'r')
      ItemIndex = 0
      TabOrder = 4
      IconItems = <>
    end
    object fedveritipi: TUniEdit
      Left = 24
      Top = 82
      Width = 209
      Hint = ''
      CharEOL = #13
      Text = ''
      TabOrder = 5
      EmptyText = 'Veri Tipi'
    end
    object fedkategori: TUniEdit
      Left = 24
      Top = 108
      Width = 209
      Hint = ''
      CharEOL = #13
      Text = ''
      TabOrder = 6
      EmptyText = 'Kategori'
    end
    object fedamac: TUniEdit
      Left = 24
      Top = 172
      Width = 209
      Hint = ''
      CharEOL = #13
      Text = ''
      TabOrder = 7
      EmptyText = 'Ama'#231
    end
    object fchamacSaklamaselect: TUniComboBox
      Left = 24
      Top = 228
      Width = 145
      Hint = ''
      Text = 'fchkaynakselect'
      Items.Strings = (
        ''
        'Evet'
        'Hay'#305'r')
      ItemIndex = 0
      TabOrder = 8
      IconItems = <>
    end
    object fchamacPaylasmaselect: TUniComboBox
      Left = 24
      Top = 256
      Width = 145
      Hint = ''
      Text = 'fchkaynakselect'
      Items.Strings = (
        ''
        'Evet'
        'Hay'#305'r')
      ItemIndex = 0
      TabOrder = 9
      IconItems = <>
    end
    object fchMetodPaylasmaSelect: TUniComboBox
      Left = 24
      Top = 375
      Width = 145
      Hint = ''
      Text = 'fchkaynakselect'
      Items.Strings = (
        ''
        'Evet'
        'Hay'#305'r')
      ItemIndex = 0
      TabOrder = 10
      IconItems = <>
    end
    object fchMetodSaklamaSelect: TUniComboBox
      Left = 24
      Top = 347
      Width = 145
      Hint = ''
      Text = 'fchkaynakselect'
      Items.Strings = (
        ''
        'Evet'
        'Hay'#305'r')
      ItemIndex = 0
      TabOrder = 11
      IconItems = <>
    end
    object fchMetodToplamaselect: TUniComboBox
      Left = 24
      Top = 319
      Width = 145
      Hint = ''
      Text = 'fchkaynakselect'
      Items.Strings = (
        ''
        'Evet'
        'Hay'#305'r')
      ItemIndex = 0
      TabOrder = 12
      IconItems = <>
    end
    object fedMetod: TUniEdit
      Left = 24
      Top = 291
      Width = 209
      Hint = ''
      CharEOL = #13
      Text = ''
      TabOrder = 13
      EmptyText = 'Metot'
    end
    object fedtaraf: TUniEdit
      Left = 24
      Top = 412
      Width = 209
      Hint = ''
      CharEOL = #13
      Text = ''
      TabOrder = 14
      EmptyText = 'Taraf'
    end
    object fchTarafSelect: TUniComboBox
      Left = 24
      Top = 440
      Width = 145
      Hint = ''
      Text = 'fchkaynakselect'
      Items.Strings = (
        ''
        'Evet'
        'Hay'#305'r')
      ItemIndex = 0
      TabOrder = 15
      IconItems = <>
    end
  end
  object qdept: TUniQuery
    Connection = MainMod.DBMain
    Left = 21
    Top = 28
  end
  object dsdept: TUniDataSource
    DataSet = qdept
    Left = 56
    Top = 32
  end
  object qsurec: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, surec FROM def_data_surec'
      'WHERE mc_id = 2'
      'ORDER BY id')
    Left = 21
    Top = 84
  end
  object dssurec: TUniDataSource
    DataSet = qsurec
    Left = 61
    Top = 92
  end
  object vqenvanter: TVirtualTable
    FieldDefs = <
      item
        Name = 'id'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'mc_id'
        DataType = ftInteger
      end
      item
        Name = 'active'
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
        Name = 'tarih'
        DataType = ftDate
      end
      item
        Name = 'dept_id'
        DataType = ftInteger
      end
      item
        Name = 'surec_id'
        DataType = ftInteger
      end
      item
        Name = 'kaynak_id'
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
        Name = 'kisi_id'
        DataType = ftInteger
      end
      item
        Name = 'nitelik'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'topl_amac_ids'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'topl_detay'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'topl_cikti'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'topl_paylasim'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'topl_paylasimtipi'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'sakl_metod_ids'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'sakl_sanalonlem'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'sakl_fizikselonlem'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'sakl_erisim_ids'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'sakl_amac_ids'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'sakl_imha'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'payl_taraf_ids'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'payl_amac_ids'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'payl_metod_ids'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'payl_sozlesme'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'payl_sozisim'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'payl_sozmadde'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'dgr_dayanak_ids'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'dgr_dokuman_ids'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'dgr_politika'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'dgr_polisim'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'dgr_polmadde'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'dgr_sozlesme'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'dgr_sozisim'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'dgr_sozmadde'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'topl_metod_ids'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'payl_taraftipi'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'sakl_ssure_tip'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'sakl_fsure_tip'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'sakl_ssure_sure'
        DataType = ftInteger
      end
      item
        Name = 'sakl_fsure_sure'
        DataType = ftInteger
      end
      item
        Name = 'sakl_ssure_diger'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'sakl_fsure_diger'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'sakl_ssure_imha'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'sakl_fsure_imha'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'sakl_ssure_var'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'sakl_fsure_var'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'main_id'
        DataType = ftInteger
      end
      item
        Name = 'sakl_ssure'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'sakl_fsure'
        DataType = ftString
        Size = 50
      end>
    Left = 24
    Top = 168
    Data = {
      0400370002006964030000000000000005006D635F6964030000000000000006
      0061637469766501000100000000000300696479030000000000000003006964
      740B000000000000000300736479030000000000000003007364740B00000000
      0000000500746172696809000000000000000700646570745F69640300000000
      000000080073757265635F6964030000000000000009006B61796E616B5F6964
      03000000000000000B0076657269746970695F696403000000000000000B006B
      617465676F72695F6964030000000000000007006B6973695F69640300000000
      00000007006E6974656C696B01000100000000000D00746F706C5F616D61635F
      6964730100F401000000000A00746F706C5F646574617901002C01000000000A
      00746F706C5F63696B746901002C01000000000D00746F706C5F7061796C6173
      696D01002C01000000001100746F706C5F7061796C6173696D7469706901002C
      01000000000E0073616B6C5F6D65746F645F6964730100F401000000000F0073
      616B6C5F73616E616C6F6E6C656D01002C0100000000120073616B6C5F66697A
      696B73656C6F6E6C656D01002C01000000000F0073616B6C5F65726973696D5F
      6964730100F401000000000D0073616B6C5F616D61635F6964730100F4010000
      0000090073616B6C5F696D686101000100000000000E007061796C5F74617261
      665F6964730100F401000000000D007061796C5F616D61635F6964730100F401
      000000000E007061796C5F6D65746F645F6964730100F401000000000D007061
      796C5F736F7A6C65736D6501000100000000000C007061796C5F736F7A697369
      6D01002C01000000000D007061796C5F736F7A6D6164646501002C0100000000
      0F006467725F646179616E616B5F6964730100F401000000000F006467725F64
      6F6B756D616E5F6964730100F401000000000C006467725F706F6C6974696B61
      01000100000000000B006467725F706F6C6973696D01002C01000000000C0064
      67725F706F6C6D6164646501002C01000000000C006467725F736F7A6C65736D
      6501000100000000000B006467725F736F7A6973696D01002C01000000000C00
      6467725F736F7A6D6164646501002C01000000000E00746F706C5F6D65746F64
      5F6964730100F401000000000E007061796C5F74617261667469706901000F00
      000000000E0073616B6C5F73737572655F74697001000500000000000E007361
      6B6C5F66737572655F74697001000500000000000F0073616B6C5F7373757265
      5F7375726503000000000000000F0073616B6C5F66737572655F737572650300
      000000000000100073616B6C5F73737572655F64696765720100320000000000
      100073616B6C5F66737572655F646967657201003200000000000F0073616B6C
      5F73737572655F696D686101000A00000000000F0073616B6C5F66737572655F
      696D686101000A00000000000E0073616B6C5F73737572655F76617201000F00
      000000000E0073616B6C5F66737572655F76617201000F000000000007006D61
      696E5F696403000000000000000A0073616B6C5F737375726501003200000000
      000A0073616B6C5F66737572650100320000000000000000000000}
  end
  object dsvqenvanter: TUniDataSource
    DataSet = vqenvanter
    Left = 85
    Top = 172
  end
  object qKisi: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, kisi FROM def_data_kisi'
      'WHERE mc_id = 2'
      'ORDER BY id'
      '')
    Left = 130
    Top = 13
  end
  object dsKisi: TUniDataSource
    DataSet = qKisi
    Left = 178
    Top = 21
  end
  object qKaynak: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT id, kaynak FROM def_data_kaynak'
      'WHERE mc_id = 2'
      'ORDER BY id')
    Left = 18
    Top = 240
    object qKaynakid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object qKaynakkaynak: TStringField
      FieldName = 'kaynak'
      Size = 100
    end
    object qKaynakisSelected: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'isSelected'
      Calculated = True
    end
  end
  object dsKaynak: TUniDataSource
    DataSet = vqkaynak
    Left = 130
    Top = 240
  end
  object vqkaynak: TVirtualTable
    Active = True
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'mc_id'
        DataType = ftInteger
      end
      item
        Name = 'kaynak'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'description'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'select'
        DataType = ftString
        Size = 20
      end>
    BeforePost = vqkaynakBeforePost
    AfterPost = vqkaynakAfterPost
    Left = 72
    Top = 240
    Data = {
      0400050002006964030000000000000005006D635F6964030000000000000006
      006B61796E616B01006400000000000B006465736372697074696F6E0100F401
      00000000060073656C6563740100140000000000000003000000040000000100
      0000040000000200000005000000616161616106000000616161616161010000
      0046040000000200000004000000020000000500000031313131310400000031
      3131310000000004000000030000000400000002000000040000003838383803
      00000038383800000000}
  end
  object qveritipi: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT'
      'ktg.kategori ,'
      #9'vt.*'#9
      'FROM'
      #9'def_data_veritipi vt'
      #9'LEFT JOIN def_data_kategori ktg ON ktg.ID = vt.md_id '
      'WHERE'
      #9'vt.mc_id = 24'
      #9'order by ktg.kategori,vt.veri_tipi')
    Left = 200
    Top = 240
  end
  object vqveritipi: TVirtualTable
    Active = True
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'mc_id'
        DataType = ftInteger
      end
      item
        Name = 'md_id'
        DataType = ftInteger
      end
      item
        Name = 'veri_tipi'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'description'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'nitelik'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'select'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'kategori'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'KaynakId'
        DataType = ftInteger
      end>
    BeforePost = vqveritipiBeforePost
    AfterPost = vqveritipiAfterPost
    AfterScroll = vqveritipiAfterScroll
    Left = 248
    Top = 240
    Data = {
      0400090002006964030000000000000005006D635F6964030000000000000005
      006D645F696403000000000000000900766572695F7469706901006400000000
      000B006465736372697074696F6E0100F4010000000007006E6974656C696B01
      00020000000000060073656C656374010014000000000008006B617465676F72
      69010064000000000008004B61796E616B496403000000000000000000010000
      000400000001000000040000000200000004000000020000000C000000656561
      7569617569617569650000000000000000000000000000000000000000}
  end
  object dsveritipi: TUniDataSource
    DataSet = vqveritipi
    Left = 304
    Top = 240
  end
  object qamac: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT '
      '    amac||'#39' ('#39'||'
      '    TRIM(BOTH '#39','#39' FROM'
      
        '        COALESCE(NULLIF(CASE WHEN toplama = '#39'E'#39' THEN '#39'T'#39' END, '#39#39 +
        '), '#39#39') || '
      
        '        COALESCE('#39','#39' || NULLIF(CASE WHEN saklama = '#39'E'#39' THEN '#39'S'#39' ' +
        'END, '#39#39'), '#39#39') || '
      
        '        COALESCE('#39','#39' || NULLIF(CASE WHEN paylasma = '#39'E'#39' THEN '#39'P'#39 +
        ' END, '#39#39'), '#39#39')'
      '    )||'#39')'#39' AS amac_guncel,'
      '    amac,id,mc_id,description,toplama,saklama,paylasma'
      'FROM def_data_amac where mc_id=2')
    Left = 376
    Top = 240
  end
  object vqamac: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'mc_id'
        DataType = ftInteger
      end
      item
        Name = 'amac'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'description'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'toplama'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'saklama'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'paylasma'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'KaynakId'
        DataType = ftInteger
      end
      item
        Name = 'VeriTipiId'
        DataType = ftInteger
      end
      item
        Name = 'selectToplama'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'selectSaklama'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SelectPaylasma'
        DataType = ftString
        Size = 20
      end>
    Left = 424
    Top = 240
    Data = {
      04000C0002006964030000000000000005006D635F6964030000000000000004
      00616D616301009600000000000B006465736372697074696F6E0100F4010000
      00000700746F706C616D610100010000000000070073616B6C616D6101000100
      0000000008007061796C61736D61010001000000000008004B61796E616B4964
      03000000000000000A005665726954697069496403000000000000000D007365
      6C656374546F706C616D6101001400000000000D0073656C65637453616B6C61
      6D6101001400000000000E0053656C6563745061796C61736D61010014000000
      0000000001000000040000000100000004000000020000000100000033020000
      0036360100000046010000004601000000460000000000000000000000000000
      000000000000}
  end
  object dsamac: TUniDataSource
    DataSet = vqamac
    Left = 472
    Top = 240
  end
  object qmetod: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      ' SELECT'
      '   metod|| '#39' ('#39'||  '
      '   TRIM(BOTH  '#39','#39' FROM  '
      
        '   COALESCE(NULLIF(CASE WHEN toplama =  '#39'E'#39' THEN  '#39'T'#39' END,  '#39#39'),' +
        '  '#39#39') ||  '
      
        '   COALESCE( '#39','#39' || NULLIF(CASE WHEN saklama =  '#39'E'#39' THEN  '#39'S'#39' EN' +
        'D,  '#39#39'),  '#39#39') ||  '
      
        '   COALESCE( '#39','#39' || NULLIF(CASE WHEN paylasma =  '#39'E'#39' THEN  '#39'P'#39' E' +
        'ND,  '#39#39'),  '#39#39')  '
      
        '   )|| '#39')'#39' AS metod ,id,mc_id,description,toplama,saklama,paylas' +
        'ma  '
      '  FROM def_data_metod where mc_id=2'
      '   order by metod')
    Left = 528
    Top = 248
  end
  object vqmetod: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'mc_id'
        DataType = ftInteger
      end
      item
        Name = 'metod'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'description'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'toplama'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'saklama'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'paylasma'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'KaynakId'
        DataType = ftInteger
      end
      item
        Name = 'VeriTipiId'
        DataType = ftInteger
      end
      item
        Name = 'selectToplama'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'selectSaklama'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SelectPaylasma'
        DataType = ftString
        Size = 20
      end>
    Left = 576
    Top = 248
    Data = {
      04000C0002006964030000000000000005006D635F6964030000000000000005
      006D65746F6401009600000000000B006465736372697074696F6E0100F40100
      0000000700746F706C616D610100010000000000070073616B6C616D61010001
      000000000008007061796C61736D61010001000000000008004B61796E616B49
      6403000000000000000A005665726954697069496403000000000000000D0073
      656C656374546F706C616D6101001400000000000D0073656C65637453616B6C
      616D6101001400000000000E0053656C6563745061796C61736D610100140000
      0000000000010000000400000001000000040000000200000000000000020000
      0036360100000046010000004601000000460000000000000000000000000000
      000000000000}
  end
  object dsmetod: TUniDataSource
    DataSet = vqmetod
    Left = 624
    Top = 248
  end
  object qtaraf: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM def_data_taraf where mc_id=24  order by taraf')
    Left = 696
    Top = 248
  end
  object vqtaraf: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'mc_id'
        DataType = ftInteger
      end
      item
        Name = 'taraf'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'description'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'KaynakId'
        DataType = ftInteger
      end
      item
        Name = 'VeriTipiId'
        DataType = ftInteger
      end
      item
        Name = 'select'
        DataType = ftString
        Size = 20
      end>
    Left = 744
    Top = 248
    Data = {
      0400070002006964030000000000000005006D635F6964030000000000000005
      00746172616601009600000000000B006465736372697074696F6E0100F40100
      00000008004B61796E616B496403000000000000000A00566572695469706949
      640300000000000000060073656C656374010014000000000000000100000004
      0000000100000004000000020000000000000002000000363600000000000000
      0000000000}
  end
  object dstaraf: TUniDataSource
    DataSet = vqtaraf
    Left = 792
    Top = 248
  end
end
