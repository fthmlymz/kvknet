object frKVKKVeriDokumanListe: TfrKVKKVeriDokumanListe
  Left = 0
  Top = 0
  Width = 1301
  Height = 630
  OnCreate = UniFrameCreate
  TabOrder = 0
  object UniPanel2: TUniPanel
    Left = 0
    Top = 0
    Width = 286
    Height = 630
    Hint = ''
    Align = alLeft
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    Caption = 'UniPanel2'
    object grdMain: TUniDBGrid
      Left = 1
      Top = 22
      Width = 284
      Height = 518
      Hint = ''
      DataSource = dsMain
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.Paged = False
      LoadMask.Message = 'Loading data...'
      Align = alClient
      TabOrder = 1
      OnColumnSort = grdMainColumnSort
      Columns = <
        item
          FieldName = 'dokumantip'
          Title.Alignment = taCenter
          Title.Caption = 'Dok'#252'man Tipi'
          Width = 250
          Font.OverrideDefaults = [ovFontHeight]
          Sortable = True
          DisplayMemo = True
        end>
    end
    object UniPanel3: TUniPanel
      Left = 1
      Top = 1
      Width = 284
      Height = 21
      Hint = ''
      Align = alTop
      TabOrder = 2
      Caption = ''
      ExplicitWidth = 285
    end
    object edLog: TUniMemo
      Left = 1
      Top = 540
      Width = 284
      Height = 89
      Hint = ''
      Align = alBottom
      TabOrder = 3
      ExplicitTop = 541
      ExplicitWidth = 285
    end
  end
  object UniPanel1: TUniPanel
    Left = 292
    Top = 0
    Width = 1009
    Height = 630
    Hint = ''
    Align = alClient
    TabOrder = 1
    Caption = 'UniPanel1'
    object pnlTop: TUniPanel
      Left = 1
      Top = 1
      Width = 1007
      Height = 96
      Hint = ''
      Align = alTop
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
      ClientEvents.ExtEvents.Strings = (
        
          'resize=function resize(sender, width, height, oldWidth, oldHeigh' +
          't, eOpts)'#13#10'{'#13#10'  ajaxRequest(sender, '#39'doResize'#39', []);'#13#10'}')
      Caption = ''
      OnAjaxEvent = pnlTopAjaxEvent
      DesignSize = (
        1007
        96)
      object edSrcText: TUniEdit
        Left = 85
        Top = 38
        Width = 198
        Hint = ''
        CharCaseConversion = uccTurkish
        CharCase = ecUpperCase
        Text = ''
        TabOrder = 1
        ClientEvents.ExtEvents.Strings = (
          
            'keyup=function keyup(sender, e, eOpts)'#13#10'{'#13#10'  var val = sender.ge' +
            'tValue() ; '#13#10'  var pos = sender.inputEl.dom.selectionStart;'#13#10'  s' +
            'ender.setValue(val.toLocaleUpperCase('#39'TR'#39')); '#13#10'  sender.inputEl.' +
            'dom.setSelectionRange(pos, pos);'#13#10'}'
          
            'keypress=function keypress(sender, e, eOpts)'#13#10'{'#13#10'   if (e.getKey' +
            '() == 13)'#13#10'   {'#13#10'      ajaxRequest(sender, '#39'doSearch'#39', ["aText="' +
            '+sender.getValue()]);'#13#10'   };'#13#10'}')
        OnAjaxEvent = edSrcTextAjaxEvent
      end
      object btnSearch: TUniBitBtn
        Left = 289
        Top = 30
        Width = 96
        Height = 36
        Action = actSearch
        TabOrder = 2
        Images = MainMod.PrjImgList
        ImageIndex = 10
      end
      object btnClose: TUniBitBtn
        Left = 902
        Top = 30
        Width = 96
        Height = 36
        Action = actClose
        Anchors = [akRight, akBottom]
        TabOrder = 3
        Images = MainMod.PrjImgList
        ImageIndex = 5
      end
      object btnAdd: TUniBitBtn
        Left = 391
        Top = 30
        Width = 96
        Height = 36
        Action = actAdd
        TabOrder = 4
        Images = MainMod.PrjImgList
        ImageIndex = 18
      end
      object btnEdit: TUniBitBtn
        Left = 493
        Top = 30
        Width = 96
        Height = 36
        Action = actEdit
        TabOrder = 5
        Images = MainMod.PrjImgList
        ImageIndex = 2
      end
      object btnDelete: TUniBitBtn
        Left = 595
        Top = 30
        Width = 96
        Height = 36
        Action = actDelete
        TabOrder = 6
        Images = MainMod.PrjImgList
        ImageIndex = 12
      end
      object UniLabel2: TUniLabel
        Left = 3
        Top = 43
        Width = 76
        Height = 13
        Hint = ''
        Caption = 'Aranacak '#304'fade'
        TabOrder = 7
      end
      object UniBitBtn1: TUniBitBtn
        Left = 697
        Top = 30
        Width = 96
        Height = 36
        Action = actDownload
        TabOrder = 8
        Images = MainMod.PrjImgList
        ImageIndex = 3
      end
      object btnYardim: TUniBitBtn
        Left = 799
        Top = 30
        Width = 97
        Height = 36
        Hint = ''
        Caption = 'Yard'#305'm'
        Anchors = [akRight, akBottom]
        TabOrder = 9
        Images = MainMod.PrjImgList
        ImageIndex = 16
        OnClick = btnYardimClick
      end
    end
    object grdDoc: TUniDBGrid
      Left = 1
      Top = 97
      Width = 1007
      Height = 532
      Hint = ''
      TitleFont.OverrideDefaults = [ovFontHeight]
      DataSource = dsDoc
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.Paged = False
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      TabOrder = 2
      Summary.Align = taBottom
      Summary.Enabled = True
      Summary.GrandTotal = True
      Summary.GrandTotalAlign = taBottom
      OnColumnSort = grdDocColumnSort
      OnDblClick = grdDocDblClick
      Columns = <
        item
          FieldName = 'dokuman'
          Title.Alignment = taCenter
          Title.Caption = 'Dok'#252'man'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 500
          Font.OverrideDefaults = [ovFontHeight]
          Sortable = True
          DisplayMemo = True
          ShowSummary = True
        end
        item
          FieldName = 'description'
          Title.Alignment = taCenter
          Title.Caption = 'A'#231#305'klama'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 500
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end>
    end
  end
  object UniSplitter1: TUniSplitter
    Left = 286
    Top = 0
    Width = 6
    Height = 630
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object dsDoc: TUniDataSource
    DataSet = MainMod.qDokuman
    Left = 369
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
      OnExecute = actEditExecute
    end
    object actDelete: TAction
      Caption = 'Kay'#305't Sil'
      OnExecute = actDeleteExecute
    end
    object actSearch: TAction
      Caption = 'Liste'
      OnExecute = actSearchExecute
    end
    object actDownload: TAction
      Caption = #304'ndir'
      OnExecute = actDownloadExecute
    end
    object actClose: TAction
      Caption = 'Kapat'
      OnExecute = actCloseExecute
    end
    object actDownloadUnprocessed: TAction
      Caption = #350'ablonu '#304'ndir'
      OnExecute = actDownloadUnprocessedExecute
    end
  end
  object qMain: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM def_data_dokumantip'
      'WHERE mc_id = 2'
      'ORDER BY dokumantip')
    AfterScroll = qMainAfterScroll
    Left = 93
    Top = 153
  end
  object dsMain: TUniDataSource
    DataSet = qMain
    Left = 141
    Top = 153
  end
  object ppmDownload: TUniPopupMenu
    ScreenMask.Enabled = True
    ScreenMask.Message = 'Dok'#252'man Haz'#305'rlan'#305'yor...'
    ScreenMask.Color = 16744448
    Left = 425
    Top = 164
    object ppmiAcikRizaBeyani: TUniMenuItem
      Action = actDownloadUnprocessed
      Caption = 'Bo'#351' '#350'ablonu '#304'ndir'
    end
    object ppmiAydinlatmaMetni: TUniMenuItem
      Action = actDownload
      Caption = 'Dosyay'#305' '#304'ndir'
    end
  end
  object DOCXRpt: TrXMLReport
    ActionAfter = aaNone
    OnUserCalc = DOCXRptUserCalc
    Left = 321
    Top = 222
  end
end
