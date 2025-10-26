object frmHizliEnvanterGirisi: TfrmHizliEnvanterGirisi
  Left = 0
  Top = 0
  ClientHeight = 651
  ClientWidth = 813
  Caption = 'HIZLI ENVANTER'
  Position = poDesktopCenter
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  TextHeight = 15
  object pg: TUniPageControl
    Left = 0
    Top = 0
    Width = 813
    Height = 651
    Hint = ''
    ActivePage = tsVeri
    TabBarVisible = False
    Align = alClient
    TabOrder = 0
    object tsTemel: TUniTabSheet
      Hint = ''
      Caption = 'Temel Bilgiler'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object UniLabel9: TUniLabel
        Left = 12
        Top = 92
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Departman'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 0
      end
      object UniLabel2: TUniLabel
        Left = 11
        Top = 135
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
      object UniLabel8: TUniLabel
        Left = 11
        Top = 179
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Veri Kayna'#287#305
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 2
      end
      object UniLabel23: TUniLabel
        Left = 11
        Top = 220
        Width = 85
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Veri Konusu Ki'#351'i'
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 3
      end
      object cbKisi: TUniComboBox
        Left = 102
        Top = 217
        Width = 291
        Height = 36
        Hint = ''
        Style = csDropDownList
        Text = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 4
        IconItems = <>
      end
      object cbDepartman: TUniComboBox
        Left = 103
        Top = 90
        Width = 291
        Height = 36
        Hint = ''
        Style = csDropDownList
        Text = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 5
        IconItems = <>
      end
      object cbSurec: TUniComboBox
        Left = 102
        Top = 132
        Width = 291
        Height = 36
        Hint = ''
        Style = csDropDownList
        Text = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 6
        IconItems = <>
      end
      object cbKaynak: TUniComboBox
        Left = 102
        Top = 175
        Width = 291
        Height = 36
        Hint = ''
        Style = csDropDownList
        Text = ''
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 7
        IconItems = <>
      end
      object btnKisiEkle: TUniSpeedButton
        Left = 399
        Top = 217
        Width = 36
        Height = 36
        Hint = ''
        Caption = ''
        ParentColor = False
        IconAlign = iaCenter
        Images = MainMod.PrjImgList
        ImageIndex = 18
        TabOrder = 8
        OnClick = btnKisiEkleClick
      end
      object btnSurecEkle: TUniSpeedButton
        Left = 399
        Top = 132
        Width = 36
        Height = 36
        Hint = ''
        Caption = ''
        ParentColor = False
        IconAlign = iaCenter
        Images = MainMod.PrjImgList
        ImageIndex = 18
        TabOrder = 9
        OnClick = btnSurecEkleClick
      end
      object btnKaynakEkle: TUniSpeedButton
        Left = 399
        Top = 175
        Width = 36
        Height = 36
        Hint = ''
        Caption = ''
        ParentColor = False
        IconAlign = iaCenter
        Images = MainMod.PrjImgList
        ImageIndex = 18
        TabOrder = 10
        OnClick = btnKaynakEkleClick
      end
      object pnTemelBilgiBaslik: TUniPanel
        AlignWithMargins = True
        Left = 0
        Top = 10
        Width = 805
        Height = 40
        Hint = ''
        Margins.Left = 0
        Margins.Top = 10
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        TabOrder = 11
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        object UniLabel6: TUniLabel
          AlignWithMargins = True
          Left = 20
          Top = 10
          Width = 674
          Height = 27
          Hint = ''
          Margins.Left = 20
          Margins.Top = 10
          AutoSize = False
          Caption = 'TEMEL B'#304'LG'#304'LER'#304' SE'#199#304'N'#304'Z'#10
          Align = alClient
          ParentFont = False
          Font.Color = clDefault
          Font.Height = -17
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
        end
        object btnTemelSonraki: TUniButton
          AlignWithMargins = True
          Left = 697
          Top = 0
          Width = 36
          Height = 40
          Hint = ''
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = ''
          Align = alRight
          TabOrder = 2
          Images = MainMod.PrjImgList
          ImageIndex = 25
          IconAlign = iaRight
          OnClick = btnTemelSonrakiClick
        end
        object btnVazgec: TUniButton
          AlignWithMargins = True
          Left = 769
          Top = 0
          Width = 36
          Height = 40
          Hint = ''
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = ''
          Align = alRight
          TabOrder = 3
          Images = MainMod.PrjImgList
          ImageIndex = 5
          IconAlign = iaRight
          OnClick = btnVazgecClick
        end
        object btnYardim: TUniButton
          AlignWithMargins = True
          Left = 733
          Top = 0
          Width = 36
          Height = 40
          Hint = ''
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = ''
          Align = alRight
          TabOrder = 4
          Images = MainMod.PrjImgList
          ImageIndex = 16
          OnClick = btnYardimClick
        end
      end
    end
    object tsVeri: TUniTabSheet
      Hint = ''
      ParentAlignmentControl = False
      Caption = 'Veriler'
      OnBeforeActivate = tsVeriBeforeActivate
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object gridVeriKategorisi: TUniDBGrid
        AlignWithMargins = True
        Left = 0
        Top = 96
        Width = 390
        Height = 527
        Hint = ''
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        DataSource = dsVeriKategorisi
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgMultiSelect, dgAutoRefreshRow]
        WebOptions.Paged = False
        LoadMask.Message = 'Loading data...'
        HiddenPanel = hpnlVKategori
        ForceFit = True
        Align = alLeft
        TabOrder = 2
        OnSelectionChange = gridVeriKategorisiSelectionChange
        OnCellClick = gridVeriKategorisiCellClick
        OnColumnSort = gridVeriKategorisiColumnSort
        OnColumnFilter = gridVeriKategorisiColumnFilter
        Columns = <
          item
            FieldName = 'sec'
            Filtering.Enabled = True
            Title.Alignment = taCenter
            Title.Caption = 'Se'#231
            Width = 32
            Alignment = taLeftJustify
            Sortable = True
            CheckBoxField.AutoPost = True
            CheckBoxField.BooleanFieldOnly = False
            CheckBoxField.FieldValues = 'E;H'
            CheckBoxField.DisplayValues = ';'
          end
          item
            FieldName = 'kategori_id'
            Filtering.Enabled = True
            Title.Alignment = taCenter
            Title.Caption = 'Ref No'
            Width = 64
            Visible = False
            Font.OverrideDefaults = [ovFontHeight]
            Sortable = True
          end
          item
            FieldName = 'kategori'
            Filtering.Enabled = True
            Filtering.Editor = fltrKategori
            Title.Alignment = taCenter
            Title.Caption = 'Veri Kategorisi'
            Width = 250
            Font.OverrideDefaults = [ovFontHeight]
            Sortable = True
          end>
      end
      object gridVeriTipi: TUniDBGrid
        AlignWithMargins = True
        Left = 395
        Top = 96
        Width = 410
        Height = 527
        Hint = ''
        Margins.Left = 5
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        DataSource = dsVeriTipi
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgMultiSelect, dgAutoRefreshRow]
        WebOptions.Paged = False
        LoadMask.Message = 'Loading data...'
        HiddenPanel = hpnlVTip
        ForceFit = True
        Align = alClient
        Anchors = [akTop, akRight, akBottom]
        Font.OverrideDefaults = [ovFontHeight]
        ParentFont = False
        TabOrder = 5
        OnCellClick = gridVeriTipiCellClick
        OnColumnSort = gridVeriTipiColumnSort
        OnColumnFilter = gridVeriTipiColumnFilter
        Columns = <
          item
            FieldName = 'sec'
            Filtering.Enabled = True
            Title.Alignment = taCenter
            Title.Caption = 'Se'#231
            Title.Font.OverrideDefaults = [ovFontHeight]
            Width = 32
            Font.OverrideDefaults = [ovFontHeight]
            Alignment = taLeftJustify
            Sortable = True
            CheckBoxField.AutoPost = True
            CheckBoxField.BooleanFieldOnly = False
            CheckBoxField.FieldValues = 'E;H'
            CheckBoxField.DisplayValues = ';'
          end
          item
            FieldName = 'veritipi_id'
            Filtering.Enabled = True
            Title.Alignment = taCenter
            Title.Caption = 'Ref No'
            Title.Font.OverrideDefaults = [ovFontHeight]
            Width = 50
            Visible = False
            Font.OverrideDefaults = [ovFontHeight]
            Sortable = True
          end
          item
            FieldName = 'veri_tipi'
            Filtering.Enabled = True
            Filtering.Editor = fltrVeriTipi
            Title.Alignment = taCenter
            Title.Caption = ' Veri Tipi'
            Title.Font.OverrideDefaults = [ovFontHeight]
            Width = 220
            Font.OverrideDefaults = [ovFontHeight]
            Sortable = True
          end
          item
            FieldName = 'nitelik'
            Filtering.Enabled = True
            Filtering.Editor = fltrNitelik
            Title.Alignment = taCenter
            Title.Caption = 'Nitelik'
            Title.Font.OverrideDefaults = [ovFontHeight]
            Width = 72
            Font.OverrideDefaults = [ovFontHeight]
            Sortable = True
          end>
      end
      object hpnlVKategori: TUniHiddenPanel
        Left = 175
        Top = 169
        Width = 160
        Height = 256
        Hint = ''
        Visible = True
        object fltrKategori: TUniEdit
          Left = 22
          Top = 20
          Width = 121
          Hint = ''
          ParentShowHint = False
          CharEOL = #13
          Text = ''
          TabOrder = 1
          EmptyText = 'Arama '#304#231'in Entere Bas'#305'n'#305'z'
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
      end
      object hpnlVTip: TUniHiddenPanel
        Left = 555
        Top = 186
        Width = 160
        Height = 256
        Hint = ''
        Visible = True
        object fltrVeriTipi: TUniEdit
          Left = 17
          Top = 52
          Width = 121
          Hint = ''
          CharEOL = #13
          Text = ''
          TabOrder = 1
          EmptyText = 'Arama '#304#231'in Entere Bas'#305'n'#305'z'
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
        object fltrNitelik: TUniEdit
          Left = 18
          Top = 80
          Width = 121
          Hint = ''
          CharEOL = #13
          Text = ''
          TabOrder = 2
          EmptyText = 'Arama '#304#231'in Entere Bas'#305'n'#305'z'
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
      end
      object pnlVerilerBaslik: TUniPanel
        AlignWithMargins = True
        Left = 0
        Top = 10
        Width = 805
        Height = 40
        Hint = ''
        Margins.Left = 0
        Margins.Top = 10
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        TabOrder = 0
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        object UniLabel7: TUniLabel
          AlignWithMargins = True
          Left = 20
          Top = 10
          Width = 710
          Height = 27
          Hint = ''
          Margins.Left = 20
          Margins.Top = 10
          AutoSize = False
          Caption = 
            'K'#304#350#304'SEL VER'#304' KATEGOR'#304'LER'#304'N'#304' VE KATEGOR'#304'LERE BA'#286'LI T'#304'PLER'#304'N'#304' SE'#199#304 +
            'N'#304'Z'#10
          Align = alClient
          ParentFont = False
          Font.Color = clDefault
          Font.Height = -17
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
        end
        object btnVeriSonraki: TUniButton
          AlignWithMargins = True
          Left = 769
          Top = 0
          Width = 36
          Height = 40
          Hint = ''
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = ''
          Align = alRight
          TabOrder = 2
          Images = MainMod.PrjImgList
          ImageIndex = 25
          IconAlign = iaRight
          OnClick = btnVeriSonrakiClick
        end
        object btnVeriOnceki: TUniButton
          AlignWithMargins = True
          Left = 733
          Top = 0
          Width = 36
          Height = 40
          Hint = ''
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = ''
          Align = alRight
          TabOrder = 3
          Images = MainMod.PrjImgList
          ImageIndex = 26
          IconAlign = iaRight
          OnClick = btnVeriOncekiClick
        end
      end
      object pnlverilerbaslik2: TUniPanel
        AlignWithMargins = True
        Left = 3
        Top = 53
        Width = 802
        Height = 38
        Hint = ''
        Margins.Right = 0
        Margins.Bottom = 5
        Align = alTop
        TabOrder = 1
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        object btnVeriTipiEkle: TUniSpeedButton
          AlignWithMargins = True
          Left = 766
          Top = 0
          Width = 36
          Height = 38
          Hint = ''
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = ''
          Align = alRight
          ParentColor = False
          IconAlign = iaCenter
          Images = MainMod.PrjImgList
          ImageIndex = 18
          TabOrder = 1
          OnClick = btnVeriTipiEkleClick
        end
        object btnKategoriEkle: TUniSpeedButton
          Left = 358
          Top = 3
          Width = 36
          Height = 36
          Hint = ''
          Visible = False
          Caption = ''
          ParentColor = False
          IconAlign = iaCenter
          Images = MainMod.PrjImgList
          ImageIndex = 18
          TabOrder = 2
          OnClick = btnKategoriEkleClick
        end
        object UniLabel1: TUniLabel
          AlignWithMargins = True
          Left = 10
          Top = 12
          Width = 85
          Height = 23
          Hint = ''
          Margins.Left = 10
          Margins.Top = 12
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Veri Kategorileri'
          Align = alLeft
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 3
        end
        object UniLabel3: TUniLabel
          AlignWithMargins = True
          Left = 401
          Top = 14
          Width = 85
          Height = 13
          Hint = ''
          AutoSize = False
          Caption = 'Veri Tipleri'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 4
        end
      end
    end
    object tsAmac: TUniTabSheet
      Hint = ''
      Caption = 'Ama'#231'lar'
      OnBeforeActivate = tsAmacBeforeActivate
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object upAmacBaslikAna: TUniPanel
        Left = 0
        Top = 0
        Width = 805
        Height = 88
        Hint = ''
        Align = alTop
        TabOrder = 2
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        object UniPanel3: TUniPanel
          AlignWithMargins = True
          Left = 0
          Top = 10
          Width = 805
          Height = 38
          Hint = ''
          Margins.Left = 0
          Margins.Top = 10
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          TabOrder = 1
          BorderStyle = ubsNone
          ShowCaption = False
          Caption = ''
          object UniLabel10: TUniLabel
            AlignWithMargins = True
            Left = 20
            Top = 10
            Width = 710
            Height = 25
            Hint = ''
            Margins.Left = 20
            Margins.Top = 10
            AutoSize = False
            Caption = 'AMA'#199'LARI SE'#199#304'N'#304'Z'#10
            Align = alClient
            ParentFont = False
            Font.Color = clDefault
            Font.Height = -17
            Font.OverrideDefaults = [ovFontHeight]
            TabOrder = 1
          end
          object btnAmacSonraki: TUniButton
            Left = 769
            Top = 0
            Width = 36
            Height = 38
            Hint = ''
            Caption = ''
            Align = alRight
            TabOrder = 2
            Images = MainMod.PrjImgList
            ImageIndex = 25
            IconAlign = iaRight
            OnClick = btnAmacSonrakiClick
          end
          object btnAmacOnceki: TUniButton
            Left = 733
            Top = 0
            Width = 36
            Height = 38
            Hint = ''
            Caption = ''
            Align = alRight
            TabOrder = 3
            Images = MainMod.PrjImgList
            ImageIndex = 26
            IconAlign = iaRight
            OnClick = btnAmacOncekiClick
          end
        end
        object UniPanel2: TUniPanel
          Left = 0
          Top = 48
          Width = 805
          Height = 38
          Hint = ''
          Align = alTop
          TabOrder = 2
          BorderStyle = ubsNone
          ShowCaption = False
          Caption = ''
          object btnAmacEkle: TUniSpeedButton
            AlignWithMargins = True
            Left = 769
            Top = 0
            Width = 36
            Height = 38
            Hint = ''
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Caption = ''
            Align = alRight
            ParentColor = False
            IconAlign = iaCenter
            Images = MainMod.PrjImgList
            ImageIndex = 18
            TabOrder = 1
            OnClick = btnAmacEkleClick
          end
        end
      end
      object gridAmac: TUniDBGrid
        Left = 0
        Top = 88
        Width = 805
        Height = 542
        Hint = ''
        DataSource = dsAmac
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgMultiSelect, dgAutoRefreshRow]
        WebOptions.Paged = False
        LoadMask.Message = 'Loading data...'
        HiddenPanel = hpnlAmaclar
        ForceFit = True
        Align = alTop
        Font.OverrideDefaults = [ovFontHeight]
        ParentFont = False
        TabOrder = 0
        OnSelectionChange = gridVeriKategorisiSelectionChange
        OnColumnSort = gridAmacColumnSort
        OnColumnFilter = gridAmacColumnFilter
        Columns = <
          item
            FieldName = 'amac_id'
            Title.Alignment = taCenter
            Title.Caption = 'Ref No'
            Width = 50
            Visible = False
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'amac'
            Filtering.Enabled = True
            Filtering.Editor = fltrAmac
            Title.Alignment = taCenter
            Title.Caption = 'Ama'#231
            Width = 400
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'toplama'
            Title.Alignment = taCenter
            Title.Caption = 'Toplama'
            Width = 64
            Font.OverrideDefaults = [ovFontHeight]
            Alignment = taLeftJustify
            CheckBoxField.AutoPost = True
            CheckBoxField.BooleanFieldOnly = False
            CheckBoxField.FieldValues = 'E;H'
            CheckBoxField.DisplayValues = ';'
          end
          item
            FieldName = 'saklama'
            Title.Alignment = taCenter
            Title.Caption = 'Saklama'
            Width = 64
            Font.OverrideDefaults = [ovFontHeight]
            Alignment = taLeftJustify
            CheckBoxField.AutoPost = True
            CheckBoxField.BooleanFieldOnly = False
            CheckBoxField.FieldValues = 'E;H'
            CheckBoxField.DisplayValues = ';'
          end
          item
            FieldName = 'paylasma'
            Title.Alignment = taCenter
            Title.Caption = 'Payla'#351'ma'
            Width = 64
            Font.OverrideDefaults = [ovFontHeight]
            Alignment = taLeftJustify
            CheckBoxField.AutoPost = True
            CheckBoxField.BooleanFieldOnly = False
            CheckBoxField.FieldValues = 'E;H'
            CheckBoxField.DisplayValues = ';'
          end
          item
            FieldName = 'toplamasecilir'
            Title.Alignment = taCenter
            Title.Caption = 'toplamasecilir'
            Width = 64
            Visible = False
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'saklamasecilir'
            Title.Alignment = taCenter
            Title.Caption = 'saklamasecilir'
            Width = 64
            Visible = False
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'paylasmasecilir'
            Title.Alignment = taCenter
            Title.Caption = 'paylasmasecilir'
            Width = 64
            Visible = False
            Font.OverrideDefaults = [ovFontHeight]
          end>
      end
      object hpnlAmaclar: TUniHiddenPanel
        Left = 126
        Top = 192
        Width = 160
        Height = 256
        Hint = ''
        Visible = True
        object fltrAmac: TUniEdit
          Left = 17
          Top = 108
          Width = 121
          Hint = ''
          Text = ''
          TabOrder = 1
          EmptyText = 'Arama...'
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
      end
    end
    object tsMetod: TUniTabSheet
      Hint = ''
      Caption = 'Metodlar'
      OnBeforeActivate = tsMetodBeforeActivate
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object gridMetod: TUniDBGrid
        Left = 0
        Top = 91
        Width = 805
        Height = 532
        Hint = ''
        BodyRTL = False
        DataSource = dsMetod
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgMultiSelect, dgAutoRefreshRow]
        WebOptions.Paged = False
        LoadMask.Message = 'Loading data...'
        HiddenPanel = hpnlMetodlar
        ForceFit = True
        Align = alTop
        Font.OverrideDefaults = [ovFontHeight]
        ParentFont = False
        TabOrder = 0
        OnColumnSort = gridMetodColumnSort
        OnColumnFilter = gridMetodColumnFilter
        Columns = <
          item
            FieldName = 'metod_id'
            Title.Alignment = taCenter
            Title.Caption = 'Ref No'
            Width = 50
            Visible = False
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'metod'
            Filtering.Enabled = True
            Filtering.Editor = fltrMetod
            Title.Alignment = taCenter
            Title.Caption = 'Metod'
            Width = 400
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'toplama'
            Title.Alignment = taCenter
            Title.Caption = 'Toplama'
            Width = 64
            Font.OverrideDefaults = [ovFontHeight]
            Alignment = taLeftJustify
            CheckBoxField.AutoPost = True
            CheckBoxField.BooleanFieldOnly = False
            CheckBoxField.FieldValues = 'E;H'
            CheckBoxField.DisplayValues = ';'
          end
          item
            FieldName = 'saklama'
            Title.Alignment = taCenter
            Title.Caption = 'Saklama'
            Width = 64
            Font.OverrideDefaults = [ovFontHeight]
            Alignment = taLeftJustify
            CheckBoxField.AutoPost = True
            CheckBoxField.BooleanFieldOnly = False
            CheckBoxField.FieldValues = 'E;H'
            CheckBoxField.DisplayValues = ';'
          end
          item
            FieldName = 'paylasma'
            Title.Alignment = taCenter
            Title.Caption = 'Payla'#351'ma'
            Width = 64
            Font.OverrideDefaults = [ovFontHeight]
            Alignment = taLeftJustify
            CheckBoxField.AutoPost = True
            CheckBoxField.BooleanFieldOnly = False
            CheckBoxField.FieldValues = 'E;H'
            CheckBoxField.DisplayValues = ';'
          end
          item
            FieldName = 'toplamasecilir'
            Title.Alignment = taCenter
            Title.Caption = 'toplamasecilir'
            Width = 64
            Visible = False
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'saklamasecilir'
            Title.Alignment = taCenter
            Title.Caption = 'saklamasecilir'
            Width = 64
            Visible = False
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'paylasmasecilir'
            Title.Alignment = taCenter
            Title.Caption = 'paylasmasecilir'
            Width = 64
            Visible = False
            Font.OverrideDefaults = [ovFontHeight]
          end>
      end
      object hpnlMetodlar: TUniHiddenPanel
        Left = 207
        Top = 237
        Width = 160
        Height = 256
        Hint = ''
        Visible = True
        object fltrMetod: TUniEdit
          Left = 18
          Top = 136
          Width = 121
          Hint = ''
          Text = ''
          TabOrder = 1
          EmptyText = 'Arama...'
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
      end
      object UniPanel5: TUniPanel
        AlignWithMargins = True
        Left = 0
        Top = 10
        Width = 805
        Height = 81
        Hint = ''
        Margins.Left = 0
        Margins.Top = 10
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        TabOrder = 2
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        object pnlMetodBaslik: TUniPanel
          Left = 0
          Top = 0
          Width = 805
          Height = 38
          Hint = ''
          Margins.Left = 0
          Margins.Top = 10
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          TabOrder = 1
          BorderStyle = ubsNone
          ShowCaption = False
          Caption = ''
          object UniLabel11: TUniLabel
            AlignWithMargins = True
            Left = 20
            Top = 12
            Width = 710
            Height = 23
            Hint = ''
            Margins.Left = 20
            Margins.Top = 12
            ParentShowHint = False
            AutoSize = False
            Caption = 'METODLARI SE'#199#304'N'#304'Z'
            Align = alClient
            ParentFont = False
            Font.Color = clDefault
            Font.Height = -17
            Font.OverrideDefaults = [ovFontHeight]
            TabOrder = 1
          end
          object btnMetodSonraki: TUniButton
            AlignWithMargins = True
            Left = 769
            Top = 0
            Width = 36
            Height = 38
            Hint = ''
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Caption = ''
            Align = alRight
            TabOrder = 2
            Images = MainMod.PrjImgList
            ImageIndex = 25
            IconAlign = iaRight
            OnClick = btnMetodSonrakiClick
          end
          object btnMetodOnceki: TUniButton
            AlignWithMargins = True
            Left = 733
            Top = 0
            Width = 36
            Height = 38
            Hint = ''
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Caption = ''
            Align = alRight
            TabOrder = 3
            Images = MainMod.PrjImgList
            ImageIndex = 26
            IconAlign = iaRight
            OnClick = btnMetodOncekiClick
          end
        end
        object UniPanel6: TUniPanel
          Left = 0
          Top = 38
          Width = 805
          Height = 38
          Hint = ''
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          TabOrder = 2
          BorderStyle = ubsNone
          ShowCaption = False
          Caption = ''
          object btnMetodEkle: TUniSpeedButton
            AlignWithMargins = True
            Left = 769
            Top = 0
            Width = 36
            Height = 38
            Hint = ''
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Caption = ''
            Align = alRight
            ParentColor = False
            IconAlign = iaCenter
            Images = MainMod.PrjImgList
            ImageIndex = 18
            TabOrder = 1
            OnClick = btnMetodEkleClick
          end
        end
      end
    end
    object tsSaklama: TUniTabSheet
      Hint = ''
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Caption = 'Veri Saklama'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object grpFSaklama: TUniGroupBox
        AlignWithMargins = True
        Left = 10
        Top = 80
        Width = 785
        Height = 68
        Hint = ''
        Margins.Left = 10
        Margins.Top = 30
        Margins.Right = 10
        Caption = '  Fiziksel Saklama  '
        Align = alTop
        TabOrder = 0
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        object UniLabel39: TUniLabel
          Left = 318
          Top = 29
          Width = 49
          Height = 13
          Hint = ''
          Caption = 'Faaliyetin'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 2
        end
        object UniLabel41: TUniLabel
          Left = 497
          Top = 29
          Width = 86
          Height = 13
          Hint = ''
          Caption = 'tarihinden sonra'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 3
        end
        object UniLabel13: TUniLabel
          Left = 52
          Top = 29
          Width = 109
          Height = 13
          Hint = ''
          Caption = 'Veriler Fiziksel Olarak'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
        end
        object edFSureVar: TUniComboBox
          Left = 167
          Top = 25
          Width = 145
          Height = 28
          Hint = ''
          Style = csDropDownList
          Text = ''
          Items.Strings = (
            'SAKLANIYOR'
            'SAKLANMIYOR')
          TabOrder = 4
          IconItems = <>
          OnChange = edFSureVarChange
        end
        object edFImha: TUniComboBox
          Left = 373
          Top = 25
          Width = 118
          Height = 28
          Hint = ''
          Style = csDropDownList
          Text = ''
          Items.Strings = (
            'BA'#350'LANGI'#199
            'B'#304'T'#304#350)
          TabOrder = 5
          IconItems = <>
        end
        object edFSure: TUniNumberEdit
          Left = 589
          Top = 25
          Width = 57
          Hint = ''
          TabOrder = 6
          DecimalSeparator = ','
        end
        object edFSureTip: TUniComboBox
          Left = 652
          Top = 25
          Width = 85
          Height = 28
          Hint = ''
          Style = csDropDownList
          Text = ''
          Items.Strings = (
            'YIL'
            'AY'
            'G'#220'N')
          TabOrder = 7
          IconItems = <>
        end
      end
      object grpSSaklama: TUniGroupBox
        AlignWithMargins = True
        Left = 10
        Top = 171
        Width = 785
        Height = 68
        Hint = ''
        Margins.Left = 10
        Margins.Top = 20
        Margins.Right = 10
        Caption = '  Dijital Saklama  '
        Align = alTop
        TabOrder = 1
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        object UniLabel40: TUniLabel
          Left = 314
          Top = 29
          Width = 49
          Height = 13
          Hint = ''
          Caption = 'Faaliyetin'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 2
        end
        object UniLabel42: TUniLabel
          Left = 493
          Top = 29
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
          Left = 55
          Top = 29
          Width = 102
          Height = 13
          Hint = ''
          Caption = 'Veriler Dijital Olarak'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
        end
        object edSImha: TUniComboBox
          Left = 369
          Top = 26
          Width = 118
          Height = 28
          Hint = ''
          Style = csDropDownList
          Text = ''
          Items.Strings = (
            'BA'#350'LANGI'#199
            'B'#304'T'#304#350)
          TabOrder = 4
          IconItems = <>
        end
        object edSSureVar: TUniComboBox
          Left = 163
          Top = 26
          Width = 145
          Height = 28
          Hint = ''
          Style = csDropDownList
          Text = ''
          Items.Strings = (
            'SAKLANIYOR'
            'SAKLANMIYOR')
          TabOrder = 5
          IconItems = <>
          OnChange = edSSureVarChange
        end
        object edSSure: TUniNumberEdit
          Left = 585
          Top = 26
          Width = 57
          Hint = ''
          TabOrder = 6
          DecimalSeparator = ','
        end
        object edSSureTip: TUniComboBox
          Left = 648
          Top = 26
          Width = 85
          Height = 28
          Hint = ''
          Style = csDropDownList
          Text = ''
          Items.Strings = (
            'YIL'
            'AY'
            'G'#220'N')
          TabOrder = 7
          IconItems = <>
        end
      end
      object pnlsaklamabaslik: TUniPanel
        AlignWithMargins = True
        Left = 0
        Top = 10
        Width = 805
        Height = 40
        Hint = ''
        Margins.Left = 0
        Margins.Top = 10
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        TabOrder = 2
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        object UniLabel12: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = 10
          Width = 727
          Height = 27
          Hint = ''
          Margins.Top = 10
          AutoSize = False
          Caption = 'SAKLAMA S'#220'RELER'#304'N'#304' BEL'#304'RLEY'#304'N'#304'Z'#10
          Align = alClient
          ParentFont = False
          Font.Color = clDefault
          Font.Height = -17
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
        end
        object btnSaklamaSonraki: TUniButton
          AlignWithMargins = True
          Left = 769
          Top = 0
          Width = 36
          Height = 40
          Hint = ''
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = ''
          Align = alRight
          TabOrder = 2
          Images = MainMod.PrjImgList
          ImageIndex = 25
          IconAlign = iaRight
          OnClick = btnSaklamaSonrakiClick
        end
        object btnSaklamaOnceki: TUniButton
          AlignWithMargins = True
          Left = 733
          Top = 0
          Width = 36
          Height = 40
          Hint = ''
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = ''
          Align = alRight
          TabOrder = 3
          Images = MainMod.PrjImgList
          ImageIndex = 26
          IconAlign = iaRight
          OnClick = btnSaklamaOncekiClick
        end
      end
    end
    object tsPaylasma: TUniTabSheet
      Hint = ''
      Caption = 'Veri Payla'#351'ma'
      OnBeforeActivate = tsPaylasmaBeforeActivate
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object gridTaraf: TUniDBGrid
        AlignWithMargins = True
        Left = 10
        Top = 109
        Width = 785
        Height = 529
        Hint = ''
        Margins.Left = 10
        Margins.Right = 10
        Margins.Bottom = 0
        DataSource = dsTaraf
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgMultiSelect, dgAutoRefreshRow]
        WebOptions.Paged = False
        LoadMask.Message = 'Loading data...'
        HiddenPanel = hpnlVPaylasma
        ForceFit = True
        Align = alTop
        Font.OverrideDefaults = [ovFontHeight]
        ParentFont = False
        TabOrder = 0
        OnCellClick = gridTarafCellClick
        OnColumnSort = gridTarafColumnSort
        OnColumnFilter = gridTarafColumnFilter
        Columns = <
          item
            FieldName = 'sec'
            Title.Alignment = taCenter
            Title.Caption = 'Se'#231
            Width = 32
            Font.OverrideDefaults = [ovFontHeight]
            Alignment = taLeftJustify
            CheckBoxField.AutoPost = True
            CheckBoxField.BooleanFieldOnly = False
            CheckBoxField.FieldValues = 'E;H'
            CheckBoxField.DisplayValues = ';'
          end
          item
            FieldName = 'taraf_id'
            Title.Alignment = taCenter
            Title.Caption = 'Ref No'
            Width = 50
            Visible = False
            Font.OverrideDefaults = [ovFontHeight]
          end
          item
            FieldName = 'taraf'
            Filtering.Enabled = True
            Filtering.Editor = fltrTaraf
            Title.Alignment = taCenter
            Title.Caption = ' Veri Tipi'
            Width = 300
            Font.OverrideDefaults = [ovFontHeight]
          end>
      end
      object hpnlVPaylasma: TUniHiddenPanel
        Left = 189
        Top = 264
        Width = 160
        Height = 256
        Hint = ''
        Visible = True
        object fltrTaraf: TUniEdit
          Left = 18
          Top = 164
          Width = 121
          Hint = ''
          Text = ''
          TabOrder = 1
          EmptyText = 'Arama...'
          ClientEvents.ExtEvents.Strings = (
            
              'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
              'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
              'ender.setValue(val.toLocaleUpperCase()); '#13#10'  sender.inputEl.dom.' +
              'setSelectionRange(pos, pos);'#13#10'}')
        end
      end
      object pnlpaylasimbaslik: TUniPanel
        AlignWithMargins = True
        Left = 3
        Top = 0
        Width = 799
        Height = 103
        Hint = ''
        Margins.Top = 0
        Align = alTop
        TabOrder = 2
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        object UniPanel4: TUniPanel
          AlignWithMargins = True
          Left = 0
          Top = 10
          Width = 799
          Height = 38
          Hint = ''
          Margins.Left = 0
          Margins.Top = 10
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          TabOrder = 1
          BorderStyle = ubsNone
          ShowCaption = False
          Caption = ''
          object btnPaylasmaSonraki: TUniButton
            AlignWithMargins = True
            Left = 763
            Top = 0
            Width = 36
            Height = 38
            Hint = ''
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Caption = ''
            Align = alRight
            TabOrder = 1
            Images = MainMod.PrjImgList
            ImageIndex = 25
            IconAlign = iaRight
            OnClick = btnPaylasmaSonrakiClick
          end
          object btnPaylasmaOnceki: TUniButton
            AlignWithMargins = True
            Left = 727
            Top = 0
            Width = 36
            Height = 38
            Hint = ''
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Caption = ''
            Align = alRight
            TabOrder = 2
            Images = MainMod.PrjImgList
            ImageIndex = 26
            IconAlign = iaRight
            OnClick = btnPaylasmaOncekiClick
          end
          object UniLabel14: TUniLabel
            AlignWithMargins = True
            Left = 20
            Top = 6
            Width = 704
            Height = 29
            Hint = ''
            Margins.Left = 20
            Margins.Top = 6
            AutoSize = False
            Caption = 'PAYLA'#350'IM TARAFLARINI BEL'#304'RLEY'#304'N'#304'Z'
            Align = alClient
            ParentFont = False
            Font.Color = clDefault
            Font.Height = -17
            Font.OverrideDefaults = [ovFontHeight]
            TabOrder = 3
          end
        end
        object UniPanel1: TUniPanel
          Left = 0
          Top = 48
          Width = 799
          Height = 38
          Hint = ''
          Align = alTop
          TabOrder = 2
          BorderStyle = ubsNone
          ShowCaption = False
          Caption = ''
          object UniLabel5: TUniLabel
            AlignWithMargins = True
            Left = 20
            Top = 12
            Width = 79
            Height = 23
            Hint = ''
            Margins.Left = 20
            Margins.Top = 12
            AutoSize = False
            Caption = 'Payl. Taraf Tipi'
            Align = alLeft
            ParentFont = False
            Font.Color = clDefault
            Font.OverrideDefaults = [ovFontHeight]
            TabOrder = 1
          end
          object edTarafTipi: TUniComboBox
            AlignWithMargins = True
            Left = 112
            Top = 5
            Width = 160
            Height = 30
            Hint = ''
            Margins.Left = 10
            Margins.Top = 5
            Style = csDropDownList
            Text = ''
            Items.Strings = (
              'YURT '#304#199#304
              'YURT DI'#350'I'
              'Y.'#304#199#304'/Y.DI'#350'I'
              'PAYLA'#350'ILMIYOR')
            Align = alLeft
            ParentFont = False
            Font.OverrideDefaults = [ovFontHeight]
            TabOrder = 2
            IconItems = <>
            OnChange = edTarafTipiChange
          end
          object btnTarafEkle: TUniSpeedButton
            AlignWithMargins = True
            Left = 763
            Top = 0
            Width = 36
            Height = 38
            Hint = ''
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Caption = ''
            Align = alRight
            ParentColor = False
            IconAlign = iaCenter
            Images = MainMod.PrjImgList
            ImageIndex = 18
            TabOrder = 3
            OnClick = btnTarafEkleClick
          end
        end
        object UniLabel4: TUniLabel
          Left = 20
          Top = 83
          Width = 79
          Height = 13
          Hint = ''
          AutoSize = False
          Caption = 'Payl. Taraflar'
          ParentFont = False
          Font.Color = clDefault
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 3
        end
      end
    end
    object tsSonuc: TUniTabSheet
      Hint = ''
      Caption = 'Kaydet'
      OnBeforeActivate = tsSonucBeforeActivate
      object memoKayit: TUniMemo
        AlignWithMargins = True
        Left = 10
        Top = 68
        Width = 785
        Height = 545
        Hint = ''
        Margins.Left = 10
        Margins.Top = 20
        Margins.Right = 10
        ParentFont = False
        Font.Color = clDefault
        Font.OverrideDefaults = [ovFontHeight]
        Align = alClient
        ReadOnly = True
        TabOrder = 0
      end
      object pnlkaydetbaslik: TUniPanel
        AlignWithMargins = True
        Left = 0
        Top = 10
        Width = 805
        Height = 38
        Hint = ''
        Margins.Left = 0
        Margins.Top = 10
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        TabOrder = 1
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        object UniLabel15: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = 10
          Width = 730
          Height = 25
          Hint = ''
          Margins.Top = 10
          Margins.Right = 0
          AutoSize = False
          Caption = 
            'L'#252'tfen kay'#305't de'#287'i'#351'iklik '#246'zetini kontrol ediniz, do'#287'ru ise "KAYDE' +
            'T" butonuna t'#305'klay'#305'n'#305'z.'
          Align = alClient
          ParentFont = False
          Font.Color = clDefault
          Font.Height = -17
          Font.OverrideDefaults = [ovFontHeight]
          TabOrder = 1
        end
        object btnKaydet: TUniButton
          Left = 769
          Top = 0
          Width = 36
          Height = 38
          Hint = ''
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = ''
          Align = alRight
          TabOrder = 2
          Images = MainMod.PrjImgList
          ImageIndex = 14
          OnClick = btnKaydetClick
        end
        object btnKaydetOnceki: TUniButton
          Left = 733
          Top = 0
          Width = 36
          Height = 38
          Hint = ''
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = ''
          Align = alRight
          TabOrder = 3
          Images = MainMod.PrjImgList
          ImageIndex = 26
          IconAlign = iaRight
          OnClick = btnKaydetOncekiClick
        end
      end
    end
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    Left = 517
    Top = 327
  end
  object tblVeriTipi: TVirtualTable
    FieldDefs = <
      item
        Name = 'sec'
        DataType = ftString
        Size = 1
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
        Name = 'veri_tipi'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'nitelik'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'kategori'
        DataType = ftString
        Size = 150
      end>
    Left = 502
    Top = 504
    Data = {
      04000600030073656301000100000000000B0076657269746970695F69640300
      0000000000000B006B617465676F72695F696403000000000000000900766572
      695F74697069010064000000000007006E6974656C696B010002000000000008
      006B617465676F72690100960000000000000000000000}
  end
  object dsVeriTipi: TUniDataSource
    DataSet = tblVeriTipi
    Left = 547
    Top = 504
  end
  object qVeriTipiTanim: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT vt.*, ktg.kategori '
      'FROM def_data_veritipi vt '
      'LEFT JOIN def_data_kategori ktg ON ktg.id = vt.md_id '
      'WHERE vt.mc_id = 2'
      'ORDER BY vt.veri_tipi')
    Left = 385
    Top = 504
  end
  object dsVeriTipiTanim: TUniDataSource
    DataSet = qVeriTipiTanim
    Left = 430
    Top = 504
  end
  object qVeriKategorisiTanim: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT ktg.id, ktg.kategori '
      'FROM def_data_kategori ktg'
      'WHERE ktg.mc_id = 2'
      'ORDER BY ktg.kategori ')
    Left = 388
    Top = 456
  end
  object dsVeriKategorisiTanim: TUniDataSource
    DataSet = qVeriKategorisiTanim
    Left = 430
    Top = 456
  end
  object tblAmac: TVirtualTable
    FieldDefs = <
      item
        Name = 'amac_id'
        DataType = ftInteger
      end
      item
        Name = 'amac'
        DataType = ftString
        Size = 150
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
        Name = 'toplamasecilir'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'saklamasecilir'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'paylasmasecilir'
        DataType = ftString
        Size = 1
      end>
    Left = 502
    Top = 555
    Data = {
      040008000700616D61635F696403000000000000000400616D61630100960000
      0000000700746F706C616D610100010000000000070073616B6C616D61010001
      000000000008007061796C61736D6101000100000000000E00746F706C616D61
      736563696C697201000100000000000E0073616B6C616D61736563696C697201
      000100000000000F007061796C61736D61736563696C69720100010000000000
      000000000000}
  end
  object dsAmac: TUniDataSource
    DataSet = tblAmac
    Left = 547
    Top = 555
  end
  object tblMetod: TVirtualTable
    FieldDefs = <
      item
        Name = 'metod_id'
        DataType = ftInteger
      end
      item
        Name = 'metod'
        DataType = ftString
        Size = 100
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
        Name = 'toplamasecilir'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'saklamasecilir'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'paylasmasecilir'
        DataType = ftString
        Size = 1
      end>
    Left = 502
    Top = 606
    Data = {
      0400080008006D65746F645F6964030000000000000005006D65746F64010064
      00000000000700746F706C616D610100010000000000070073616B6C616D6101
      0001000000000008007061796C61736D6101000100000000000E00746F706C61
      6D61736563696C697201000100000000000E0073616B6C616D61736563696C69
      7201000100000000000F007061796C61736D61736563696C6972010001000000
      0000000000000000}
  end
  object dsMetod: TUniDataSource
    DataSet = tblMetod
    Left = 547
    Top = 606
  end
  object tblTaraf: TVirtualTable
    FieldDefs = <
      item
        Name = 'taraf_id'
        DataType = ftInteger
      end
      item
        Name = 'taraf'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'sec'
        DataType = ftString
        Size = 1
      end>
    Left = 646
    Top = 357
    Data = {
      04000300080074617261665F6964030000000000000005007461726166010064
      000000000003007365630100010000000000000000000000}
  end
  object dsTaraf: TUniDataSource
    DataSet = tblTaraf
    Left = 688
    Top = 357
  end
  object qEnvM: TUniQuery
    Connection = MainMod.DBMain
    Left = 515
    Top = 270
  end
  object qEnvD: TUniQuery
    Connection = MainMod.DBMain
    Left = 557
    Top = 270
  end
  object tblVeriKategorisi: TVirtualTable
    FieldDefs = <
      item
        Name = 'sec'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'kategori_id'
        DataType = ftInteger
      end
      item
        Name = 'kategori'
        DataType = ftString
        Size = 100
      end>
    Left = 502
    Top = 456
    Data = {
      04000300030073656301000100000000000B006B617465676F72695F69640300
      00000000000008006B617465676F72690100640000000000000000000000}
  end
  object dsVeriKategorisi: TUniDataSource
    DataSet = tblVeriKategorisi
    Left = 547
    Top = 456
  end
end
