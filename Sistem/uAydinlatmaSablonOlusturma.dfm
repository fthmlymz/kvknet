object frmAydinlatmaSablonOlusturma: TfrmAydinlatmaSablonOlusturma
  Left = 0
  Top = 0
  ClientHeight = 446
  ClientWidth = 822
  Caption = 'Ayd'#305'nlatma / A'#231#305'k R'#305'za Rapor Olu'#351'turma'
  BorderStyle = bsSingle
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.OverrideDefaults = [ovFontHeight]
  OnAfterShow = UniFormAfterShow
  TextHeight = 15
  object memLog: TUniMemo
    AlignWithMargins = True
    Left = 10
    Top = 51
    Width = 802
    Height = 331
    Hint = ''
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alClient
    TabOrder = 0
  end
  object UniPanel1: TUniPanel
    Left = 0
    Top = 392
    Width = 822
    Height = 54
    Hint = ''
    Align = alBottom
    TabOrder = 1
    Caption = 'UniPanel1'
    object UniButton1: TUniButton
      AlignWithMargins = True
      Left = 743
      Top = 4
      Width = 75
      Height = 46
      Hint = ''
      Caption = 'UniButton1'
      Align = alRight
      TabOrder = 1
    end
    object UniPanel2: TUniPanel
      Left = 1
      Top = -1
      Width = 820
      Height = 54
      Hint = ''
      Align = alBottom
      TabOrder = 2
      ShowCaption = False
      Caption = ''
      DesignSize = (
        820
        54)
      object btnClose: TUniBitBtn
        Left = 708
        Top = 9
        Width = 96
        Height = 36
        Hint = ''
        Caption = 'Kapat'
        Anchors = [akRight, akBottom]
        ParentFont = False
        Font.OverrideDefaults = [ovFontHeight]
        TabOrder = 1
        ClientEvents.ExtEvents.Strings = (
          
            'mouseover=function mouseover(sender, e, eOpts)'#13#10'{'#13#10'config.baseCl' +
            's="btn";'#13#10'config.cls="btn-danger";'#13#10'}')
        Images = MainMod.PrjImgList
        ImageIndex = 5
        OnClick = btnCloseClick
      end
    end
  end
  object pnlbaslik: TUniPanel
    Left = 0
    Top = 0
    Width = 822
    Height = 41
    Hint = ''
    Align = alTop
    TabOrder = 2
    Caption = 'Ayd'#305'nlatma / A'#231#305'k R'#305'za rapor olu'#351'turuluyor. Bekleyiniz  !..'
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user')
    Left = 12
    Top = 8
  end
  object qAydinlatma: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT ayd.*, ks.kisi as kisi_str'
      'FROM def_data_aydinlatma ayd'
      'LEFT JOIN def_data_kisi ks ON ks.id = ayd.kisi_id'
      'WHERE ayd.durum = '#39'YAYINDA'#39' and ayd.mc_id=:mc_id'
      'ORDER BY ayd.id')
    Left = 53
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'mc_id'
        Value = nil
      end>
  end
  object qAydDocs: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * '
      'FROM def_data_aydinlatma_docs'
      'WHERE id=0'
      'ORDER BY mc_id, id')
    Left = 109
    Top = 5
    object qAydDocsid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object qAydDocsmc_id: TIntegerField
      FieldName = 'mc_id'
    end
    object qAydDocsayd_id: TIntegerField
      FieldName = 'ayd_id'
    end
    object qAydDocsdosya: TBlobField
      FieldName = 'dosya'
    end
    object qAydDocssdt: TDateTimeField
      FieldName = 'sdt'
    end
    object qAydDocsayd_guid: TStringField
      FieldName = 'ayd_guid'
    end
  end
  object qTemizle: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'DELETE'
      'FROM def_data_aydinlatma_docs'
      'WHERE ayd_id=:ayd_id and id<>:doc_id')
    Left = 157
    Top = 5
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ayd_id'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'doc_id'
        Value = nil
      end>
  end
  object qPost: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user')
    Left = 53
    Top = 75
  end
  object qSeq: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user')
    Left = 12
    Top = 73
  end
  object qSure: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      
        'SELECT DISTINCT kategori_str, veritipi_str, sakl_ssure, sakl_fsu' +
        're'
      'FROM vw_data_envanter'
      'WHERE active = '#39'E'#39' AND mc_id = 2 AND kisi_id = 369')
    Left = 33
    Top = 226
  end
  object tblAktarim: TVirtualTable
    FieldDefs = <
      item
        Name = 'kaynak_id'
        DataType = ftInteger
      end
      item
        Name = 'kaynak_str'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'kategori_ids'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'kategori_str'
        DataType = ftString
        Size = 5000
      end
      item
        Name = 'veritipi_ids'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'veritipi_str'
        DataType = ftString
        Size = 5000
      end
      item
        Name = 'payl_amac_ids'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'payl_amac_str'
        DataType = ftString
        Size = 5000
      end
      item
        Name = 'payl_taraf_ids'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'payl_taraf_str'
        DataType = ftString
        Size = 5000
      end
      item
        Name = 'payl_metod_ids'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'payl_metod_str'
        DataType = ftString
        Size = 5000
      end>
    Left = 166
    Top = 226
    Data = {
      04000C0009006B61796E616B5F696403000000000000000A006B61796E616B5F
      7374720100F401000000000C006B617465676F72695F6964730100F401000000
      000C006B617465676F72695F73747201008813000000000C0076657269746970
      695F6964730100F401000000000C0076657269746970695F7374720100881300
      0000000D007061796C5F616D61635F6964730100F401000000000D007061796C
      5F616D61635F73747201008813000000000E007061796C5F74617261665F6964
      730100F401000000000E007061796C5F74617261665F73747201008813000000
      000E007061796C5F6D65746F645F6964730100F401000000000E007061796C5F
      6D65746F645F7374720100881300000000000000000000}
  end
  object qAmac: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT DISTINCT topl_amac_ids as amac from data_envanter')
    Left = 79
    Top = 281
  end
  object tblKatVeriTipi: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'kategori'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'veritipi'
        DataType = ftString
        Size = 5000
      end>
    Left = 159
    Top = 273
    Data = {
      0400020008006B617465676F7269010064000000000008007665726974697069
      0100881300000000000000000000}
  end
  object qDayanak: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT dayanak FROM def_data_dayanak WHERE id = 0')
    Left = 28
    Top = 333
  end
  object qMetod: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT metod FROM def_data_metod WHERE id = 0')
    Left = 79
    Top = 333
  end
  object frxReportAM: TfrxReport
    Version = '2023.1.3'
    DotMatrixReport = False
    EngineOptions.SilentMode = True
    EngineOptions.NewSilentMode = simSilent
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44577.819415798600000000
    ReportOptions.LastChange = 45713.562973125000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 420
    Top = 112
    Datasets = <
      item
        DataSet = frxdsAktarim
        DataSetName = 'frxdsAktarim'
      end
      item
        DataSet = frxdsAmac
        DataSetName = 'frxdsAmac'
      end
      item
        DataSet = frxdsAydinlatma
        DataSetName = 'frxdsAydinlatma'
      end
      item
        DataSet = frxdsDayanak
        DataSetName = 'frxdsDayanak'
      end
      item
        DataSet = frxdsDummy
        DataSetName = 'frxdsDummy'
      end
      item
        DataSet = frxdsKatVeriTipi
        DataSetName = 'frxdsKatVeriTipi'
      end
      item
        DataSet = frxdsMCDef
        DataSetName = 'frxdsMCDef'
      end
      item
        DataSet = frxdsMetod
        DataSetName = 'frxdsMetod'
      end
      item
        DataSet = frxdsSure
        DataSetName = 'frxdsSure'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.100000000000000000
      PaperSize = 256
      LeftMargin = 15.000000000000000000
      RightMargin = 15.000000000000000000
      TopMargin = 15.000000000000000000
      BottomMargin = 15.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 170.078740160000000000
        Top = 18.897650000000000000
        Width = 680.315400000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 90.708720000000000000
          Top = 75.590551180000000000
          Width = 491.338533860000000000
          Height = 94.488188980000000000
          DataSet = frxdsSure
          DataSetName = 'frxdsSure'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'T.C.'
            '[frxdsMCDef."krm_unvan"]'
            'K'#304#350#304'SEL VER'#304'LER'#304'N KORUNMASI KANUNU HAKKINDA  '
            '[frxdsAydinlatma."kisi_str"] AYDINLATMA METN'#304)
          ParentFont = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 302.362400000000000000
          Width = 75.590551180000000000
          Height = 75.590551180000000000
          DataField = 'krm_logo'
          DataSet = frxdsMCDef
          DataSetName = 'frxdsMCDef'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 200.315090000000000000
        Top = 249.448980000000000000
        Width = 680.315400000000000000
        DataSet = frxdsDummy
        DataSetName = 'frxdsDummy'
        RowCount = 0
        Stretched = True
        object Rich1: TfrxRichView
          AllowVectorExport = True
          Width = 680.315400000000000000
          Height = 200.315090000000000000
          StretchMode = smActualHeight
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235345C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313035357B5C666F6E7474626C7B5C66
            305C666E696C5C66636861727365743136322054696D6573204E657720526F6D
            616E3B7D7B5C66315C666E696C5C66636861727365743233382054696D657320
            4E657720526F6D616E3B7D7D0D0A7B5C636F6C6F7274626C203B5C7265643235
            355C677265656E3235355C626C75653235353B5C726564305C677265656E305C
            626C7565303B7D0D0A7B5C2A5C67656E657261746F7220526963686564323020
            31302E302E32363130307D5C766965776B696E64345C756331200D0A5C706172
            645C6362706174315C77696463746C7061725C73613130305C716A5C68696768
            6C69676874315C625C66305C667332302020202020202020205B66727864734D
            434465662E226B726D5F756E76616E225D205C62302020285C62205B66727864
            734D434465662E226B726D5F616472657331225D205B66727864734D43446566
            2E226B726D5F616472657332225D5C686967686C69676874305C6230202C205C
            62205B66727864734D434465662E226B726D5F7664616972657369225D5C6230
            2020566572676920446169726573692C205C62205B66727864734D434465662E
            226B726D5F766B6E225D5C623020206E756D6172616C5C276664207665726769
            206D5C2766636B656C6C65666929207665726920736F72756D6C75737520735C
            2766646661745C276664796C612C206B695C2766656973656C20766572696C65
            72696E697A2C20695C2766656C656E6D656C6572696E6920676572656B746972
            656E20616D615C276537205C27653765725C27653765766573696E6465207665
            20627520616D615C27653720696C652062615C2766306C616E745C2766646C5C
            2766642C20735C2766646E5C276664726C5C276664207665205C2766366C5C27
            65375C2766636C5C276663205C276665656B696C64652C2074617261665C2766
            646D5C2766647A612062696C64697264695C276630696E697A20766579612062
            696C646972696C64695C27663069205C276665656B6C69796C65206B695C2766
            656973656C20766572696C6572696E20646F5C27663072756C755C276630756E
            7520766520656E20675C2766636E63656C2068616C696E69206B6F7275796172
            616B2C206B6179646564696C6563655C276630696E692C206465706F6C616E61
            63615C2766305C2766646E5C2766642C206D75686166617A61206564696C6563
            655C276630696E692C2079656E6964656E20645C2766637A656E6C656E656365
            5C276630696E692C206B616E756E656E206275206B695C2766656973656C2076
            6572696C6572692074616C65702065746D657965207965746B696C69206F6C61
            6E206B7572756D6C617220696C65207061796C615C2766655C2766646C616361
            5C2766305C2766646E5C2766642C205C2766635C2765375C2766636E635C2766
            63206B695C276665696C65726520616B7461725C2766646C6162696C6563655C
            276630696E692C20646576726564696C6562696C6563655C276630696E692C20
            735C2766646E5C276664666C616E645C276664725C2766646C6162696C656365
            5C276630696E69207665204B695C2766656973656C20566572696C6572696E20
            4B6F72756E6D61735C66315C753330353F5C663020204B616E756E75276E6461
            202842756E64616E20736F6E7261205C6C64626C71756F7465204B564B4B5C72
            64626C71756F746520206F6C6172616B20616E5C2766646C6163616B745C2766
            647229207361795C2766646C616E2073616972205C276665656B696C6C657264
            6520695C2766656C656E6562696C6563655C276630696E692062696C6D656B74
            656469722E205C686967686C69676874315C7061720D0A0D0A5C706172645C63
            62706174315C6E6F77696463746C7061725C73613130305C716A5C6366325C68
            6967686C69676874305C622048414E475C276464204B5C2764645C2764655C27
            646453454C205645525C2764644C45525C2764644E5C2764645A5C276464205C
            2764645C2764654C5C276464594F52555A3F5C7061720D0A5C62302020202020
            20202020415C276665615C2766305C27666464612062656C697274696C656E20
            6B695C2766656973656C20766572696C6572696E697A3B205665726920736F72
            756D6C7573755C6673313620205C6366305C686967686C69676874315C625C66
            733230205B66727864734D434465662E226B726D5F756E76616E225D205C6366
            325C686967686C69676874305C6230206F6C6172616B2036363938207361795C
            2766646C5C276664204B695C2766656973656C20566572696C6572696E204B6F
            72756E6D61735C276664204B616E756E75276E6120757967756E206F6C617261
            6B20615C276665615C2766305C27666464616B69206B617073616D20695C2765
            37696E646520695C2766656C656E6563656B7469722E5C7061720D0A0D0A5C70
            6172645C716A5C6366305C667331365C7061720D0A7D0D0A00}
        end
      end
      object MasterData2: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 529.134200000000000000
        Width = 680.315400000000000000
        DataSet = frxdsKatVeriTipi
        DataSetName = 'frxdsKatVeriTipi'
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'kategori'
          DataSet = frxdsKatVeriTipi
          DataSetName = 'frxdsKatVeriTipi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsKatVeriTipi."kategori"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 264.567100000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'veritipi'
          DataSet = frxdsKatVeriTipi
          DataSetName = 'frxdsKatVeriTipi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsKatVeriTipi."veritipi"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 34.015770000000000000
        Top = 472.441250000000000000
        Width = 680.315400000000000000
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Top = 15.118120000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxdsKatVeriTipi
          DataSetName = 'frxdsKatVeriTipi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'Veri Kategorisi')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 264.567100000000000000
          Top = 15.118120000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxdsKatVeriTipi
          DataSetName = 'frxdsKatVeriTipi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'Veri Tipi')
          ParentFont = False
        end
      end
      object MasterData3: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 83.149660000000000000
        Top = 570.709030000000000000
        Width = 680.315400000000000000
        DataSet = frxdsDummy
        DataSetName = 'frxdsDummy'
        RowCount = 0
        object Rich3: TfrxRichView
          AllowVectorExport = True
          Top = 15.118120000000000000
          Width = 680.315400000000000000
          Height = 60.472480000000000000
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235345C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313035357B5C666F6E7474626C7B5C66
            305C666E696C5C66636861727365743136322054696D6573204E657720526F6D
            616E3B7D7D0D0A7B5C636F6C6F7274626C203B5C726564305C677265656E305C
            626C7565303B5C7265643235355C677265656E3235355C626C75653235353B7D
            0D0A7B5C2A5C67656E657261746F722052696368656432302031302E302E3236
            3130307D5C766965776B696E64345C756331200D0A5C706172645C6362706174
            325C6E6F77696463746C7061725C73613130305C6366315C625C66305C667332
            30204B5C2764645C2764655C27646453454C205645525C2764644C45525C2764
            644E5C2764645A5C276464204E45205C276465454B5C2764644C444520564520
            48414E475C2764642048554B554B5C2764642053454245504C45524C4520544F
            504C55594F52555A3F5C62305C7061720D0A0D0A5C706172645C636270617432
            5C6E6F77696463746C7061725C73613130305C716A5C62205665726920546F70
            6C616D61204D65746F746C61725C2766643A5C6366305C62305C667331365C70
            61720D0A7D0D0A00}
        end
      end
      object MasterData4: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 676.535870000000000000
        Width = 680.315400000000000000
        DataSet = frxdsMetod
        DataSetName = 'frxdsMetod'
        RowCount = 0
        Stretched = True
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 45.354360000000000000
          Width = 634.961040000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'metod'
          DataSet = frxdsMetod
          DataSetName = 'frxdsMetod'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            '[frxdsMetod."metod"]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Width = 45.354330708661400000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '-')
          ParentFont = False
        end
      end
      object MasterData5: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 718.110700000000000000
        Width = 680.315400000000000000
        DataSet = frxdsDummy
        DataSetName = 'frxdsDummy'
        RowCount = 0
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 680.315400000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            'Hukuki Sebepler:')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData6: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 778.583180000000000000
        Width = 680.315400000000000000
        DataSet = frxdsDayanak
        DataSetName = 'frxdsDayanak'
        RowCount = 0
        Stretched = True
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 45.354360000000000000
          Width = 634.961040000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'dayanak'
          DataSet = frxdsDayanak
          DataSetName = 'frxdsDayanak'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            '[frxdsDayanak."dayanak"]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Width = 45.354330708661400000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '-')
          ParentFont = False
        end
      end
      object MasterData7: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 75.590600000000000000
        Top = 820.158010000000000000
        Width = 680.315400000000000000
        DataSet = frxdsDummy
        DataSetName = 'frxdsDummy'
        RowCount = 0
        object Rich4: TfrxRichView
          AllowVectorExport = True
          Top = 11.338590000000000000
          Width = 680.315400000000000000
          Height = 56.692950000000000000
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235345C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313035357B5C666F6E7474626C7B5C66
            305C666E696C5C66636861727365743136322054696D6573204E657720526F6D
            616E3B7D7D0D0A7B5C636F6C6F7274626C203B5C726564305C677265656E305C
            626C7565303B5C7265643235355C677265656E3235355C626C75653235353B7D
            0D0A7B5C2A5C67656E657261746F722052696368656432302031302E302E3236
            3130307D5C766965776B696E64345C756331200D0A5C706172645C6362706174
            325C6E6F77696463746C7061725C73613130305C6366315C625C66305C667332
            30204B5C2764645C2764655C27646453454C205645525C2764644C45525C2764
            644E5C2764645A5C2764642048414E475C27646420414D415C2763374C41524C
            41205C2764645C2764654C5C276464594F52205645204E45204B414441522053
            414B4C49594F52555A3F5C62305C7061720D0A0D0A5C706172645C6362706174
            325C6E6F77696463746C7061725C73613130305C716A5C622056657269205C27
            64645C2766656C656D6520416D615C2765376C61725C2766643A5C6366305C62
            305C667331365C7061720D0A7D0D0A00}
        end
      end
      object MasterData8: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 918.425790000000000000
        Width = 680.315400000000000000
        DataSet = frxdsAmac
        DataSetName = 'frxdsAmac'
        RowCount = 0
        Stretched = True
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 45.354360000000000000
          Width = 634.961040000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'amac'
          DataSet = frxdsAmac
          DataSetName = 'frxdsAmac'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxdsAmac."amac"]')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '-')
          ParentFont = False
        end
      end
      object MasterData9: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 1190.551950000000000000
        Width = 680.315400000000000000
        DataSet = frxdsAktarim
        DataSetName = 'frxdsAktarim'
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'kaynak_str'
          DataSet = frxdsAktarim
          DataSetName = 'frxdsAktarim'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsAktarim."kaynak_str"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 529.134200000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'payl_metod_str'
          DataSet = frxdsAktarim
          DataSetName = 'frxdsAktarim'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsAktarim."payl_metod_str"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 396.850650000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'payl_taraf_str'
          DataSet = frxdsAktarim
          DataSetName = 'frxdsAktarim'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsAktarim."payl_taraf_str"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 136.063080000000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'payl_amac_str'
          DataSet = frxdsAktarim
          DataSetName = 'frxdsAktarim'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsAktarim."payl_amac_str"]')
          ParentFont = False
        end
      end
      object Header2: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 41.574830000000000000
        Top = 1126.299940000000000000
        Width = 680.315400000000000000
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Top = 22.677180000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxdsKatVeriTipi
          DataSetName = 'frxdsKatVeriTipi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'Veri Kayna'#287#305)
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 529.134200000000000000
          Top = 22.677180000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxdsKatVeriTipi
          DataSetName = 'frxdsKatVeriTipi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'Payla'#351'ma Metodu')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 396.850650000000000000
          Top = 22.677180000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxdsKatVeriTipi
          DataSetName = 'frxdsKatVeriTipi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'Payla'#351#305'lan Taraf')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 136.063080000000000000
          Top = 22.677180000000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxdsKatVeriTipi
          DataSetName = 'frxdsKatVeriTipi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'Payla'#351'ma Amac'#305)
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 124.724490000000000000
        Top = 2067.402910000000000000
        Width = 680.315400000000000000
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Width = 113.385900000000000000
          Height = 90.708720000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #304'leti'#351'im Bilgileri'
            'KEP Mail Adresi'
            'E- Mail Adresi'
            'Adres')
          ParentFont = False
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end>
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 90.708720000000000000
          Width = 566.929500000000000000
          Height = 34.015770000000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxdsDummy."tarih"]   '
            '[frxdsDummy."ipadres"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Width = 566.929133860000000000
          Height = 90.708720000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ': [frxdsMCDef."krm_unvan"]'
            ': [frxdsMCDef."krm_kep"]'
            ': [frxdsMCDef."krm_email"]'
            ': [frxdsMCDef."krm_adres1"] [frxdsMCDef."vs_adres2"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end>
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Top = 90.708720000000000000
          Width = 113.385900000000000000
          Height = 34.015770000000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Tarih'
            'IP Adresi')
          ParentFont = False
        end
      end
      object MasterData10: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 411.968770000000000000
        Top = 1232.126780000000000000
        Width = 680.315400000000000000
        DataSet = frxdsDummy
        DataSetName = 'frxdsDummy'
        RowCount = 0
        object Rich2: TfrxRichView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Width = 680.315400000000000000
          Height = 411.968770000000000000
          StretchMode = smActualHeight
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235345C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313035357B5C666F6E7474626C7B5C66
            305C666E696C5C66636861727365743136322054696D6573204E657720526F6D
            616E3B7D7D0D0A7B5C636F6C6F7274626C203B5C726564305C677265656E305C
            626C7565303B5C7265643235355C677265656E3235355C626C75653235353B7D
            0D0A7B5C2A5C67656E657261746F722052696368656432302031302E302E3236
            3130307D5C766965776B696E64345C756331200D0A5C706172645C6362706174
            325C6E6F77696463746C7061725C73613130305C6366315C625C66305C667332
            302048414B4C4152494E495A5C7061720D0A5C62302020202020202020204B56
            4B4B5C7271756F7465206E5C2766646E2031312E206D61646465736920676572
            655C276630692062697A65205C276665616873656E2C206B696D6C695C276630
            696E697A692069737061742065746D656E697A206B6179645C276664796C612C
            206B695C2766656973656C20766572696C6572696E697A20696C6520696C6769
            6C693B5C7061720D0A0D0A5C706172645C6362706174325C6E6F77696463746C
            7061725C73623130305C73613130302020202020202020202D2048616B6B5C27
            66646E5C2766647A6461206B695C2766656973656C207665726920695C276665
            6C6579697020695C2766656C656D6564695C276630696D697A69205C2766365C
            27663072656E6562696C69722C20655C276630657220695C2766656C69796F72
            73616B207665796120695C2766656C656D695C27666573656B2C2062756E6120
            696C695C2766656B696E2062696C67692074616C65702065646562696C697273
            696E697A2E5C7061720D0A20202020202020202D204B695C2766656973656C20
            766572696C6572696E697A696E20695C2766656C656E6D6520616D61635C2766
            646E5C2766642076652062756E6C61725C2766646E20616D61635C2766646E61
            20757967756E206B756C6C616E5C2766646C5C27666470206B756C6C616E5C27
            66646C6D61645C2766645C2766305C276664205C2766365C27663072656E6562
            696C697273696E697A2E5C7061720D0A20202020202020202D204B695C276665
            6973656C20766572696C6572696E697A696E207975727420695C276537692076
            657961207975727420645C2766645C2766655C2766646E6120616B7461725C27
            66646C5C2766647020616B7461725C2766646C6D61645C2766645C2766305C27
            66646E5C276664207665206B696D6C65726520616B7461725C2766646C645C27
            66645C2766305C2766646E5C276664205C2766365C27663072656E6562696C69
            7273696E697A2E5C7061720D0A20202020202020202D2059616E6C5C2766645C
            27666520766520656B73696B206B695C2766656973656C20766572696C657269
            6E697A696E20645C2766637A656C74696C6D6573696E69207665206275207665
            72696C6572696E20616B7461725C2766646C645C2766645C2766305C27666420
            7665796120616B7461725C2766646C6D5C2766645C276665206F6C6162696C65
            63655C2766306920616C5C276664635C2766646C61725C2766646E2062696C67
            696C656E646972696C6D6573696E692074616C65702065646562696C69727369
            6E697A2E5C7061720D0A20202020202020202D204B695C2766656973656C2076
            6572696C6572696E697A696E204B564B4B206D6164646520375C7271756F7465
            206465205C2766366E675C276636725C2766636C656E205C2766656172746C61
            72205C27653765725C27653765766573696E646520696D6861206564696C6D65
            73696E69202873696C696E6D6573696E692C20796F6B206564696C6D6573696E
            69207665796120616E6F6E696D2068616C65206765746972696C6D6573696E69
            292074616C65702065646562696C697273696E697A2E20416E63616B20696D68
            612074616C6562696E697A20696C67696C69206D65767A75617474616E206B61
            796E616B6C616E616E20795C2766636B5C2766636D6C5C2766636C5C2766636B
            6C6572696D697A206B617073616D5C2766646E64612C20696D6861206564696C
            6970206564696C6D65796563655C276630692C20696D6861206564696C656365
            6B73652068616E676920795C2766366E74656D696E20757967756E206F6C6475
            5C2766307520736F6D7574206F6C61795C2766646E206B6F5C276665756C6C61
            725C2766646E6120675C27663672652074617261665C2766646D5C2766647A63
            612064655C27663065726C656E646972696C6563656B7469722E204275206261
            5C2766306C616D64612073655C27653774695C276630696D697A20696D686120
            795C2766366E74656D696E69206E6564656E2073655C27653774695C27663069
            6D697A20696C6520696C67696C692062697A64656E20686572207A616D616E20
            62696C67692074616C65702065646562696C697273696E697A2E5C7061720D0A
            20202020202020202D204B695C2766656973656C20766572696C6572696E697A
            696E20616B7461725C2766646C645C2766645C2766305C276664207665796120
            616B7461725C2766646C6162696C6563655C27663069205C2766635C2765375C
            2766636E635C276663206B695C276665696C6572696E20735C2766367A206B6F
            6E75737520696D68612074616C6562696E697A20696C6520696C67696C692062
            696C67696C656E646972696C6D6573696E692074616C65702065646562696C69
            7273696E697A2E5C7061720D0A20202020202020202D204D5C2766636E686173
            5C27666472616E20626972206F746F6D6174696B2073697374656D206B756C6C
            616E5C2766646C6172616B206F6C755C276665747572756C6D755C276665206B
            695C2766656973656C207665726920616E616C697A696E697A696E20736F6E75
            5C2765376C61725C2766646E6120627520736F6E755C2765376C6172205C2765
            375C2766646B61726C61725C2766646E5C2766647A612061796B5C276664725C
            2766647973612069746972617A2065646562696C697273696E697A2E5C706172
            0D0A20202020202020202D204B695C2766656973656C20766572696C6572696E
            697A696E206B616E756E612061796B5C276664725C276664206F6C6172616B20
            695C2766656C656E6D65736920736562656269796C65207A617261726120755C
            27663072616D616E5C2766647A2068616C696E6465207A617261725C2766646E
            206769646572696C6D6573696E692074616C65702065646562696C697273696E
            697A2E5C7061720D0A7D0D0A00}
        end
      end
      object MasterData11: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 340.157700000000000000
        Top = 1666.772730000000000000
        Width = 680.315400000000000000
        DataSet = frxdsDummy
        DataSetName = 'frxdsDummy'
        RowCount = 0
        object Rich5: TfrxRichView
          AllowVectorExport = True
          Width = 680.315400000000000000
          Height = 340.157700000000000000
          StretchMode = smActualHeight
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235345C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313035357B5C666F6E7474626C7B5C66
            305C666E696C5C66636861727365743136322054696D6573204E657720526F6D
            616E3B7D7D0D0A7B5C636F6C6F7274626C203B5C726564305C677265656E305C
            626C7565303B5C726564305C677265656E305C626C75653235353B5C72656432
            35355C677265656E3235355C626C75653235353B7D0D0A7B5C2A5C67656E6572
            61746F722052696368656432302031302E302E32363130307D5C766965776B69
            6E64345C756331200D0A5C706172645C6362706174335C6E6F77696463746C70
            61725C73613130305C6366315C66305C6673323020202020202020202042615C
            276665767572756E757A64612079657220616C616E2074616C65706C6572696E
            697A2C2074616C6562696E206E6974656C695C276630696E6520675C27663672
            6520656E2067655C276537206F74757A20675C2766636E20695C276537696E64
            65205C2766636372657473697A206F6C6172616B20736F6E755C2765376C616E
            645C276664725C2766646C6163616B745C276664722E20416E63616B2C20695C
            2766656C656D696E207665726920736F72756D6C75737520695C276537696E20
            6179725C276664636120626972206D616C697965746920676572656B7469726D
            65736920685C2765326C696E64652C204B695C2766656973656C20566572696C
            657269204B6F72756D61204B7572756C752074617261665C2766646E64616E5C
            7E7B5C6366305C667332327B5C6669656C647B5C2A5C666C64696E73747B4859
            5045524C494E4B2022687474703A2F2F7777772E7265736D6967617A6574652E
            676F762E74722F65736B696C65722F323031382F30332F32303138303331302D
            362E68746D227D7D7B5C666C6472736C747B5C756C5C6366325C6366315C756C
            5C66733230205665726920536F72756D6C7573756E612042615C276665767572
            75205573756C20766520457361736C61725C2766642048616B6B5C2766646E64
            61205465626C695C2766307D7D7D7D5C66305C667332305C7271756F74652064
            652062656C69726C656E656E2074617269666564656B69205C27666363726574
            20616C5C2766646E6162696C69722E5C7061720D0A20202020202020204B695C
            2766656973656C20766572696C6572696E697A696E20695C2766656C656E6D65
            736920696C6520696C67696C692068757375736C617264612062615C27666576
            7572756E757A75207665726920736F72756D6C7573756E756E20696E7465726E
            6574206164726573696E64652062756C756E616E2062615C2766657675727520
            666F726D756E7520646F6C6475726172616B20766579615C7E7B5C6366305C66
            7332327B5C6669656C647B5C2A5C666C64696E73747B48595045524C494E4B20
            22687474703A2F2F7777772E7265736D6967617A6574652E676F762E74722F65
            736B696C65722F323031382F30332F32303138303331302D362E68746D227D7D
            7B5C666C6472736C747B5C756C5C6366325C6366315C756C5C66733230205665
            726920536F72756D6C7573756E612042615C27666576757275205573756C2076
            6520457361736C61725C2766642048616B6B5C2766646E6461205465626C695C
            2766305C7E7D7D7D7D5C66305C667332305C7271756F746520696E20352E206D
            6164646573696E6465205C2766656172746C6172612075796D616B206B617964
            5C276664796C6120615C276665615C2766305C27666464616B69205C27666565
            6B696C6C65726465207961706162696C697273696E697A3A5C7061720D0A0D0A
            5C706172645C6362706174335C6E6F77696463746C7061725C73623130305C73
            613130302020202020202020202D2059617A5C2766646C5C2766642076652069
            6D7A616C5C276664206F6C6172616B5C7061720D0A20202020202020202D204B
            61795C276664746C5C27666420656C656B74726F6E696B20706F73746120284B
            455029206164726573696E697A64656E20675C2766366E6465726563655C2766
            30696E697A20652D706F73746120696C655C7061720D0A20202020202020202D
            20475C27666376656E6C6920656C656B74726F6E696B20696D7A612076657961
            206D6F62696C20696D7A6120696C655C7061720D0A20202020202020202D2057
            656220736974656D697A64652079657220616C616E20696C67696C69206B695C
            276665692062615C27666576757275206C696E6B69796C65205C7061720D0A0D
            0A5C706172645C6362706174335C6E6F77696463746C7061725C736131303020
            202020202020202042615C276665767572756E757A75206B6F6C61796C615C27
            6665745C276664726162696C6D656B2061645C2766646E612C2074616C657020
            65646563655C276630696E697A2062615C2766657675727520666F726D756E75
            20646F6C6475726172616B2C2079756B61725C276664646120735C2766367A5C
            276663206564696C6D695C276665206F6C616E2073655C276537656E656B6C65
            7264656E2068657268616E6769206269726920696C652074617261665C276664
            6D5C2766647A612074616C6562696E697A6920696C65746562696C697273696E
            697A2E5C7061720D0A20202020202020205665726920536F72756D6C75737520
            74617261665C2766646E64616E2074616C6562696E697A696E206E6974656C69
            5C276630696E652076652062615C2766657675727520795C2766366E74656D69
            6E697A6520675C2766367265207665726920736F72756D6C7573752074617261
            665C2766646E64616E2062615C276665767572756E756E2073697A6520616974
            206F6C7570206F6C6D61645C2766645C2766305C2766646E5C2766646E206265
            6C69726C656E6D65736920766520625C276636796C6563652068616B6C61725C
            2766646E5C2766647A5C276664206B6F7275796162696C6D656B20616D61635C
            276664796C6120656B20646F5C27663072756C616D616C617220286B61795C27
            6664746C5C2766642074656C65666F6E756E757A61206D6573616A20675C2766
            366E646572696C6D6573692C206172616E6D616E5C2766647A20676962692920
            69737465796562696C6972697A2E205C276436726E655C276630696E20566572
            6920536F72756D6C7573756E6461206B61795C276664746C5C276664206F6C61
            6E20652D706F737461206164726573696E697A20617261635C2766646C5C2766
            645C2766305C276664796C612062615C27666576757275207961706D616E5C27
            66647A2068616C696E6465205665726920536F72756D6C757375206F6C617261
            6B2C206B61795C276664746C5C2766642062615C2766656B612062697220696C
            6574695C276665696D20795C2766366E74656D696E69206B756C6C616E617261
            6B2073697A6520756C615C2766656162696C69722076652062615C2766657675
            72756E756E2073697A6520616974206F6C7570206F6C6D61645C2766645C2766
            305C2766646E5C2766646E207465796964696E692069737465796562696C6972
            697A2E5C7061720D0A0D0A5C706172645C6366305C667331365C7061720D0A7D
            0D0A00}
        end
      end
      object Header3: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 41.574830000000000000
        Top = 960.000620000000000000
        Width = 680.315400000000000000
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Top = 22.677180000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxdsKatVeriTipi
          DataSetName = 'frxdsKatVeriTipi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'Veri Kayna'#287#305)
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 408.189240000000000000
          Top = 22.677180000000000000
          Width = 272.125991570000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxdsKatVeriTipi
          DataSetName = 'frxdsKatVeriTipi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'Fiziksel Saklama S'#252'resi')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 136.063080000000000000
          Top = 22.677180000000000000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxdsKatVeriTipi
          DataSetName = 'frxdsKatVeriTipi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'Dijital Saklama S'#252'resi')
          ParentFont = False
        end
      end
      object MasterData12: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 1024.252630000000000000
        Width = 680.315400000000000000
        DataSet = frxdsSure
        DataSetName = 'frxdsSure'
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'kaynak_str'
          DataSet = frxdsSure
          DataSetName = 'frxdsSure'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsSure."kaynak_str"]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 408.189240000000000000
          Width = 272.125984250000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'sakl_fsure'
          DataSet = frxdsSure
          DataSetName = 'frxdsSure'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsSure."sakl_fsure"]')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 136.063080000000000000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'sakl_ssure'
          DataSet = frxdsSure
          DataSetName = 'frxdsSure'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsSure."sakl_ssure"]')
          ParentFont = False
        end
      end
      object MasterData13: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 1065.827460000000000000
        Width = 680.315400000000000000
        DataSet = frxdsDummy
        DataSetName = 'frxdsDummy'
        RowCount = 0
        object Rich6: TfrxRichView
          AllowVectorExport = True
          Top = 15.118120000000000000
          Width = 680.315400000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235345C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313035357B5C666F6E7474626C7B5C66
            305C666E696C5C66636861727365743136322054696D6573204E657720526F6D
            616E3B7D7D0D0A7B5C636F6C6F7274626C203B5C726564305C677265656E305C
            626C7565303B5C7265643235355C677265656E3235355C626C75653235353B7D
            0D0A7B5C2A5C67656E657261746F722052696368656432302031302E302E3236
            3130307D5C766965776B696E64345C756331200D0A5C706172645C6362706174
            325C6E6F77696463746C7061725C73613130305C716A5C6366315C625C66305C
            66733230204B5C2764645C2764655C27646453454C205645525C2764644C4552
            5C2764644E5C2764645A5C276464204E4552454C45524520414B54415249594F
            52555A3F5C6366305C62305C667331365C7061720D0A7D0D0A00}
        end
      end
    end
  end
  object frxReportAMR: TfrxReport
    Version = '2023.1.3'
    DotMatrixReport = False
    EngineOptions.SilentMode = True
    EngineOptions.NewSilentMode = simSilent
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44577.819415798600000000
    ReportOptions.LastChange = 45609.475316388900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 535
    Top = 112
    Datasets = <
      item
      end
      item
      end
      item
      end
      item
      end
      item
      end
      item
      end
      item
      end
      item
      end
      item
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      LeftMargin = 15.000000000000000000
      RightMargin = 15.000000000000000000
      TopMargin = 15.000000000000000000
      BottomMargin = 15.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 170.078740160000000000
        Top = 18.897650000000000000
        Width = 680.315400000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Top = 75.590551180000000000
          Width = 680.315033860000000000
          Height = 94.488188980000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'T.C.'
            '[frxdsMCDef."krm_unvan"]'
            'K'#304#350#304'SEL VER'#304'LER'#304'N KORUNMASI KANUNU HAKKINDA  '
            '[frxdsAydinlatma."kisi_str"] AYDINLATMA METN'#304)
          ParentFont = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 302.362400000000000000
          Width = 75.590551180000000000
          Height = 75.590551180000000000
          DataField = 'krm_logo'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 185.196970000000000000
        Top = 249.448980000000000000
        Width = 680.315400000000000000
        RowCount = 0
        Stretched = True
        object Rich1: TfrxRichView
          AllowVectorExport = True
          Width = 680.315400000000000000
          Height = 154.960730000000000000
          StretchMode = smActualHeight
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235345C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313035357B5C666F6E7474626C7B5C66
            305C666E696C5C66636861727365743136322054696D6573204E657720526F6D
            616E3B7D7B5C66315C666E696C5C66636861727365743233382054696D657320
            4E657720526F6D616E3B7D7B5C66325C666E696C5C6663686172736574302054
            696D6573204E657720526F6D616E3B7D7B5C66335C666E696C5C666368617273
            6574313632205461686F6D613B7D7D0D0A7B5C636F6C6F7274626C203B5C7265
            64305C677265656E305C626C7565303B5C7265643235355C677265656E323535
            5C626C75653235353B7D0D0A7B5C2A5C67656E657261746F7220526963686564
            32302031302E302E32363130307D5C766965776B696E64345C756331200D0A5C
            706172645C6362706174325C77696463746C7061725C73613130305C716A5C63
            66315C686967686C69676874325C625C66305C66733230202020202020202020
            5B66727864734D434465662E226B726D5F756E76616E225D20205C623020285C
            62205B66727864734D434465662E226B726D5F616472657331225D205B667278
            64734D434465662E226B726D5F616472657332225D5C686967686C6967687430
            202C205B66727864734D434465662E226B726D5F7664616972657369225D205C
            623020566572676920446169726573692C205C62205B66727864734D43446566
            2E226B726D5F766B6E225D205C6230206E756D6172616C5C2766642076657267
            69206D5C2766636B656C6C65666929207665726920736F72756D6C7573752073
            5C2766646661745C276664796C612C206B695C2766656973656C20766572696C
            6572696E697A2C20695C2766656C656E6D656C6572696E6920676572656B7469
            72656E20616D615C276537205C27653765725C27653765766573696E64652076
            6520627520616D615C27653720696C652062615C2766306C616E745C2766646C
            5C2766642C20735C2766646E5C276664726C5C276664207665205C2766366C5C
            2765375C2766636C5C276663205C276665656B696C64652C2074617261665C27
            66646D5C2766647A612062696C64697264695C276630696E697A207665796120
            62696C646972696C64695C27663069205C276665656B6C69796C65206B695C27
            66656973656C20766572696C6572696E20646F5C27663072756C755C27663075
            6E7520766520656E20675C2766636E63656C2068616C696E69206B6F72757961
            72616B2C206B6179646564696C6563655C276630696E692C206465706F6C616E
            6163615C2766305C2766646E5C2766642C206D75686166617A61206564696C65
            63655C276630696E692C2079656E6964656E20645C2766637A656E6C656E6563
            655C276630696E692C206B616E756E656E206275206B695C2766656973656C20
            766572696C6572692074616C65702065746D657965207965746B696C69206F6C
            616E206B7572756D6C617220696C65207061796C615C66315C2762615C753330
            353F5C6630206C6162696C6563655C66315C753238373F5C663020696E692C20
            68756B756B6120757967756E6C756B205C66315C2762615C6630206172746C61
            725C66315C753330353F5C6630206E6120675C66325C6C616E67313033335C27
            66365C66305C6C616E6731303535207265205C2766635C2765375C2766636E63
            5C276663206B695C276665696C65726520616B7461725C2766646C6162696C65
            63655C276630696E692C20646576726564696C6562696C6563655C276630696E
            692C20735C2766646E5C276664666C616E645C276664725C2766646C6162696C
            6563655C276630696E692076652036363938205361795C66315C753330353F5C
            6630206C5C66315C753330353F5C663020204B695C2766656973656C20566572
            696C6572696E204B6F72756E6D61735C66315C753330353F5C663020204B616E
            756E75276E6461202842756E64616E20736F6E7261205C6C64626C71756F7465
            204B564B4B5C7264626C71756F746520206F6C6172616B20616E5C2766646C61
            63616B745C2766647229207361795C2766646C616E2073616972205C27666565
            6B696C6C6572646520695C2766656C656E6562696C6563655C276630696E6920
            62696C6D656B74656469722E205C686967686C69676874325C7061720D0A0D0A
            5C706172645C6362706174325C6E6F77696463746C7061725C73613130305C71
            6A5C686967686C69676874305C622048414E475C276464204B5C2764645C2764
            655C27646453454C205645525C2764644C45525C2764644E5C2764645A5C2764
            64205C2764645C2764654C5C276464594F52555A3F5C62305C7061720D0A0D0A
            5C706172645C716A5C66335C667331345C7061720D0A7D0D0A00}
        end
      end
      object MasterData2: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 514.016080000000000000
        Width = 680.315400000000000000
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'kategori'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsKatVeriTipi."kategori"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 264.567100000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'veritipi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsKatVeriTipi."veritipi"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 34.015770000000000000
        Top = 457.323130000000000000
        Width = 680.315400000000000000
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Top = 15.118120000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'Veri Kategorisi')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 264.567100000000000000
          Top = 15.118120000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'Veri Tipi')
          ParentFont = False
        end
      end
      object MasterData3: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 102.047310000000000000
        Top = 706.772110000000000000
        Width = 680.315400000000000000
        RowCount = 0
        Stretched = True
        object Rich3: TfrxRichView
          AllowVectorExport = True
          Top = 15.118120000000000000
          Width = 680.315400000000000000
          Height = 56.692950000000000000
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235345C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313035357B5C666F6E7474626C7B5C66
            305C666E696C5C66636861727365743136322054696D6573204E657720526F6D
            616E3B7D7B5C66315C666E696C5C66636861727365743233382054696D657320
            4E657720526F6D616E3B7D7B5C66325C666E696C5C6663686172736574313632
            205461686F6D613B7D7D0D0A7B5C636F6C6F7274626C203B5C726564305C6772
            65656E305C626C7565303B5C7265643235355C677265656E3235355C626C7565
            3235353B7D0D0A7B5C2A5C67656E657261746F72205269636865643230203130
            2E302E32363130307D5C766965776B696E64345C756331200D0A5C706172645C
            6362706174325C6E6F77696463746C7061725C73613130305C6366315C625C66
            305C66733230204B5C2764645C2764655C27646453454C205645525C2764644C
            45525C2764644E5C2764645A5C2764642048414E475C66315C753330343F5C66
            3020204D45544F544C41524C412056452048554B554B5C276464205345424550
            4C45524C4520544F504C55594F52555A3F5C7061720D0A0D0A5C706172645C63
            62706174325C6E6F77696463746C7061725C73613130305C716A205665726920
            546F706C616D61204D65746F746C61725C2766643A5C66325C667331345C7061
            720D0A7D0D0A00}
        end
      end
      object MasterData4: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 831.496600000000000000
        Width = 680.315400000000000000
        RowCount = 0
        Stretched = True
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 45.354360000000000000
          Width = 634.961040000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'metod'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            '[frxdsMetod."metod"]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Width = 45.354330708661400000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '-')
          ParentFont = False
        end
      end
      object MasterData5: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 873.071430000000000000
        Width = 680.315400000000000000
        RowCount = 0
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 680.315400000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            'Hukuki Sebepler:')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData6: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 933.543910000000000000
        Width = 680.315400000000000000
        RowCount = 0
        Stretched = True
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 45.354360000000000000
          Width = 634.961040000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'dayanak'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            '[frxdsDayanak."dayanak"]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Width = 45.354330708661400000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '-')
          ParentFont = False
        end
      end
      object MasterData7: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 86.929190000000000000
        Top = 555.590910000000000000
        Width = 680.315400000000000000
        RowCount = 0
        Stretched = True
        object Rich4: TfrxRichView
          AllowVectorExport = True
          Top = 11.338590000000000000
          Width = 680.315400000000000000
          Height = 60.472480000000000000
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235345C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313035357B5C666F6E7474626C7B5C66
            305C666E696C5C66636861727365743136322054696D6573204E657720526F6D
            616E3B7D7B5C66315C666E696C5C6663686172736574313632205461686F6D61
            3B7D7D0D0A7B5C636F6C6F7274626C203B5C726564305C677265656E305C626C
            7565303B5C7265643235355C677265656E3235355C626C75653235353B7D0D0A
            7B5C2A5C67656E657261746F722052696368656432302031302E302E32363130
            307D5C766965776B696E64345C756331200D0A5C706172645C6362706174325C
            6E6F77696463746C7061725C73613130305C6366315C625C66305C6673323020
            4B5C2764645C2764655C27646453454C205645525C2764644C45525C2764644E
            5C2764645A5C2764642048414E475C27646420414D415C2763374C41524C4120
            5C2764645C2764654C5C276464594F52205645204E45204B414441522053414B
            4C49594F52555A3F5C7061720D0A0D0A5C706172645C6362706174325C6E6F77
            696463746C7061725C73613130305C716A2056657269205C2764645C2766656C
            656D6520416D615C2765376C61725C2766643A5C62305C66315C667331345C70
            61720D0A7D0D0A00}
        end
      end
      object MasterData8: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 665.197280000000000000
        Width = 680.315400000000000000
        RowCount = 0
        Stretched = True
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 45.354360000000000000
          Width = 634.961040000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'amac'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxdsAmac."amac"]')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '-')
          ParentFont = False
        end
      end
      object MasterData9: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 1205.670070000000000000
        Width = 680.315400000000000000
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'kaynak_str'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsAktarim."kaynak_str"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 529.134200000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'payl_metod_str'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsAktarim."payl_metod_str"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 396.850650000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'payl_taraf_str'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsAktarim."payl_taraf_str"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 136.063080000000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'payl_amac_str'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsAktarim."payl_amac_str"]')
          ParentFont = False
        end
      end
      object Header2: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 41.574830000000000000
        Top = 1141.418060000000000000
        Width = 680.315400000000000000
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Top = 22.677180000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'Veri Kayna'#287#305)
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 529.134200000000000000
          Top = 22.677180000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'Payla'#351'ma Metodu')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 396.850650000000000000
          Top = 22.677180000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'Payla'#351#305'lan Taraf')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 136.063080000000000000
          Top = 22.677180000000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'Payla'#351'ma Amac'#305)
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 124.724490000000000000
        Top = 2082.521030000000000000
        Width = 680.315400000000000000
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Width = 113.385900000000000000
          Height = 90.708720000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #304'leti'#351'im Bilgileri'
            'KEP Mail Adresi'
            'E- Mail Adresi'
            'Adres')
          ParentFont = False
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end>
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 90.708720000000000000
          Width = 566.929500000000000000
          Height = 34.015770000000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxdsDummy."tarih"]   '
            '[frxdsDummy."ipadres"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Width = 566.929133860000000000
          Height = 90.708720000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ': [frxdsMCDef."krm_unvan"]'
            ': [frxdsMCDef."krm_kep"]'
            ': [frxdsMCDef."krm_email"]'
            ': [frxdsMCDef."krm_adres1"] [frxdsMCDef."vs_adres2"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end>
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Top = 90.708720000000000000
          Width = 113.385900000000000000
          Height = 34.015770000000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Tarih'
            'IP Adresi')
          ParentFont = False
        end
      end
      object MasterData10: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 411.968770000000000000
        Top = 1247.244900000000000000
        Width = 680.315400000000000000
        RowCount = 0
        object Rich2: TfrxRichView
          AllowVectorExport = True
          Left = 0.559060000000000000
          Width = 680.315400000000000000
          Height = 366.614410000000000000
          StretchMode = smActualHeight
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235345C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313035357B5C666F6E7474626C7B5C66
            305C666E696C5C66636861727365743136322054696D6573204E657720526F6D
            616E3B7D7B5C66315C666E696C5C66636861727365743233382054696D657320
            4E657720526F6D616E3B7D7B5C66325C666E696C5C6663686172736574302054
            696D6573204E657720526F6D616E3B7D7D0D0A7B5C636F6C6F7274626C203B5C
            726564305C677265656E305C626C7565303B5C7265643235355C677265656E32
            35355C626C75653235353B7D0D0A7B5C2A5C67656E657261746F722052696368
            656432302031302E302E32363130307D5C766965776B696E64345C756331200D
            0A5C706172645C6362706174325C6E6F77696463746C7061725C73613130305C
            6366315C625C66305C667332302048414B4C4152494E495A5C62305C7061720D
            0A20202020202020204B564B4B5C7271756F7465206E5C2766646E2031312E20
            6D616464657369206B617073616D5C66315C753330353F5C6630206E64612C20
            6B696D6C695C276630696E697A692069737061742065746D656E697A206B6179
            645C276664796C613B5C7061720D0A0D0A5C706172645C6362706174325C6E6F
            77696463746C7061725C73623130305C73613130302020202020202020202D20
            4B695C2766656973656C20766572696C6572696E697A696E20695C2766656C65
            79697020695C2766656C656D6564695C276630696D697A69205C2766365C2766
            3072656E6562696C69722C20655C276630657220695C2766656C69796F727361
            6B207665796120695C2766656C656D695C27666573656B2C2062756E6120696C
            695C2766656B696E2062696C67692074616C65702065646562696C697273696E
            697A2E5C7061720D0A20202020202020202D204B695C2766656973656C207665
            72696C6572696E697A696E20695C2766656C656E6D6520616D61635C2766646E
            5C2766642076652062756E6C61725C2766646E20616D61635C2766646E612075
            7967756E206B756C6C616E5C2766646C5C27666470206B756C6C616E5C276664
            6C6D61645C2766645C2766305C276664205C2766365C27663072656E6562696C
            697273696E697A2E5C7061720D0A20202020202020202D204B695C2766656973
            656C20766572696C6572696E697A696E207975727420695C2765376920766579
            61207975727420645C2766645C2766655C2766646E6120616B7461725C276664
            6C5C2766647020616B7461725C2766646C6D61645C2766645C2766305C276664
            6E5C276664207665206B696D6C65726520616B7461725C2766646C645C276664
            5C2766305C2766646E5C276664205C2766365C27663072656E6562696C697273
            696E697A2E5C7061720D0A20202020202020202D2059616E6C5C2766645C2766
            6520766520656B73696B206B695C2766656973656C20766572696C6572696E69
            7A696E20645C2766637A656C74696C6D6573696E692076652062752076657269
            6C6572696E20616B7461725C2766646C645C2766645C2766305C276664207665
            796120616B7461725C2766646C6D5C2766645C276665206F6C6162696C656365
            5C2766306920616C5C276664635C2766646C61725C2766646E2062696C67696C
            656E646972696C6D6573696E692074616C65702065646562696C697273696E69
            7A2E5C7061720D0A20202020202020202D204B695C2766656973656C20766572
            696C6572696E697A696E20696D6861206564696C6D6573696E692074616C6570
            2065646562696C697273696E697A2E205C7061720D0A20202020202020202D20
            4B695C66315C2762615C6630206973656C20766572696C6572696E697A696E20
            696D68612076652F7665796120645C66325C6C616E67313033335C2766635C66
            305C6C616E6731303535207A656C746D656C6572696E6520696C695C66315C27
            62615C6630206B696E206765725C66325C6C616E67313033335C2765375C6630
            5C6C616E673130353520656B6C655C66315C2762615C663020746972696C656E
            20695C66315C2762615C6630206C656D6C6572696E2C2074617261665C66315C
            753330353F5C6630206D5C66315C753330353F5C6630207A636120616B746172
            5C66315C753330353F5C6630206D5C66315C753330353F5C6630202073615C66
            315C753238373F5C6630206C616E6D5C66315C753330353F5C2762615C663020
            205C66325C6C616E67313033335C2766635C2765375C2766635C66305C6C616E
            6731303535206E635C66325C6C616E67313033335C2766635C66305C6C616E67
            3130353520206B695C66315C2762615C663020696C6572652062696C64697269
            6C6D6573696E692074616C65702065646562696C697273696E697A2E5C706172
            0D0A20202020202020202D204D5C2766636E6861735C27666472616E20626972
            206F746F6D6174696B2073697374656D206B756C6C616E5C2766646C6172616B
            206F6C755C276665747572756C6D755C276665206B695C2766656973656C2076
            65726920616E616C697A696E697A696E20616C657968696E697A652062697220
            736F6E755C66325C6C616E67313033335C2765375C66305C6C616E6731303535
            20206F7274617961205C66325C6C616E67313033335C2765375C66315C6C616E
            67313035355C753330353F5C6630206B61726D61735C66315C753330353F5C66
            30206E612069746972617A2065646562696C697273696E697A2E5C7061720D0A
            20202020202020202D204B695C2766656973656C20766572696C6572696E697A
            696E206B616E756E612061796B5C276664725C276664206F6C6172616B20695C
            2766656C656E6D65736920736562656269796C65207A617261726120755C2766
            3072616D616E5C2766647A2068616C696E6465207A617261725C2766646E2067
            69646572696C6D6573696E692074616C65702065646562696C697273696E697A
            2E5C7061720D0A7D0D0A00}
        end
      end
      object MasterData11: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 340.157700000000000000
        Top = 1681.890850000000000000
        Width = 680.315400000000000000
        RowCount = 0
        object Rich5: TfrxRichView
          AllowVectorExport = True
          Width = 680.315400000000000000
          Height = 340.157700000000000000
          StretchMode = smActualHeight
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235345C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313035357B5C666F6E7474626C7B5C66
            305C666E696C5C6663686172736574302054696D6573204E657720526F6D616E
            3B7D7B5C66315C666E696C5C66636861727365743136322054696D6573204E65
            7720526F6D616E3B7D7B5C66325C666E696C5C66636861727365743233382054
            696D6573204E657720526F6D616E3B7D7B5C66335C666E696C5C666368617273
            6574313632205461686F6D613B7D7D0D0A7B5C636F6C6F7274626C203B5C7265
            64305C677265656E305C626C7565303B5C726564305C677265656E305C626C75
            653235353B5C7265643235355C677265656E3235355C626C75653235353B7D0D
            0A7B5C2A5C67656E657261746F722052696368656432302031302E302E323631
            30307D5C766965776B696E64345C756331200D0A5C706172645C636270617433
            5C6E6F77696463746C7061725C73613130305C6366315C66305C667332302020
            2020202020202042615C66315C2766655C663020767572756E757A6461207965
            7220616C616E2074616C65706C6572696E697A2C2074616C6562696E206E6974
            656C695C66315C2766305C663020696E6520675C66315C2766365C6630207265
            20656E2067655C66315C2765375C663020206F74757A20675C66315C2766635C
            6630206E20695C66315C2765375C663020696E6465205C66315C2766635C6630
            206372657473697A206F6C6172616B20736F6E755C66315C2765375C6630206C
            616E645C66315C2766645C663020725C66315C2766645C6630206C6163616B74
            5C66315C2766645C663020722E20416E63616B2C20695C66315C2766655C6630
            206C656D696E207665726920736F72756D6C75737520695C66315C2765375C66
            3020696E206179725C66315C2766645C663020636120626972206D616C697965
            746920676572656B7469726D65736920685C66315C2765325C6630206C696E64
            652C204B695C66315C2766655C6630206973656C20566572696C657269204B6F
            72756D61204B7572756C752074617261665C66315C2766645C6630206E64616E
            5C66315C7E7B5C66307B5C6669656C647B5C2A5C666C64696E73747B48595045
            524C494E4B2022687474703A2F2F7777772E7265736D6967617A6574652E676F
            762E74722F65736B696C65722F323031382F30332F32303138303331302D362E
            68746D227D7D7B5C666C6472736C747B5C756C5C6366325C6366325C756C2056
            65726920536F72756D6C7573756E612042615C66315C2766655C663020767572
            75205573756C20766520457361736C61725C66315C2766645C6630202048616B
            6B5C66315C2766645C6630206E6461205465626C695C66315C2766305C663120
            7D7D7D7D5C66315C667332305C7271756F74655C66302064652062656C69726C
            656E656E2074617269666564656B69205C66315C2766635C6630206372657420
            616C5C66315C2766645C6630206E6162696C6563656B7469722E5C7061720D0A
            20202020202020204B695C66315C2766655C6630206973656C20766572696C65
            72696E697A696E20695C66315C2766655C6630206C656E6D65736920696C6520
            696C67696C692068757375736C617264612062615C66315C2766655C66302076
            7572756E757A75207B7B5C6669656C647B5C2A5C666C64696E73747B48595045
            524C494E4B2022687474703A2F2F7777772E7265736D6967617A6574652E676F
            762E74722F65736B696C65722F323031382F30332F32303138303331302D362E
            68746D227D7D7B5C666C6472736C747B5C756C5C6366325C6366325C756C2056
            65726920536F72756D6C7573756E612042615C66315C2766655C663020767572
            75205573756C20766520457361736C61725C66315C2766645C6630202048616B
            6B5C66315C2766645C6630206E6461205465626C695C66315C2766305C7E5C66
            31207D7D7D7D5C66315C667332305C7271756F74655C663020696E20352E206D
            6164646573696E64655C6631206B695C663020205C66315C2766655C66302061
            72746C6172612075796D616B206B6179645C66315C2766645C663020796C6120
            615C66315C2766655C663020615C66315C2766305C2766645C66302064616B69
            205C66315C2766655C663020656B696C6C65726465207961706162696C697273
            696E697A3A5C7061720D0A0D0A5C706172645C6362706174335C6E6F77696463
            746C7061725C73623130305C73613130302020202020202020202D2059617A5C
            66315C2766645C6630206C5C66315C2766645C66302020766520696D7A616C5C
            66315C2766645C663020206F6C6172616B5C7061720D0A20202020202020202D
            204B61795C66315C2766645C663020746C5C66315C2766645C66302020656C65
            6B74726F6E696B20706F7374616E5C66325C753330353F5C6630207A20284B45
            5029207661735C66325C753330353F5C6630207461735C66325C753330353F5C
            663020796C615C7061720D0A20202020202020202D20475C66315C2766635C66
            302076656E6C6920656C656B74726F6E696B20696D7A612076657961206D6F62
            696C20696D7A61796C615C7061720D0A20202020202020202D205C66325C7533
            30343F5C6630206E7465726E657420736974656D697A64652079657220616C61
            6E20696C67696C69206B695C66315C2766655C663020692062615C66315C2766
            655C663020767572752062615C66325C753238373F5C6630206C616E745C6632
            5C753330353F5C663020735C66325C753330353F5C663020796C615C7061720D
            0A0D0A5C706172645C6362706174335C6E6F77696463746C7061725C73613130
            302020202020202020205665726920536F72756D6C7573752062615C66315C27
            66655C663020767572756E756E2073697A6520616974206F6C7570206F6C6D61
            645C66315C2766645C2766305C2766645C6630206E5C66315C2766645C663020
            6E2062656C69726C656E6D65736920616D61635C66325C753330353F5C663020
            796C6120656B20646F5C66315C2766305C66302072756C616D616C617220286B
            61795C66315C2766645C663020746C5C66315C2766645C6630202074656C6566
            6F6E756E757A61206D6573616A20675C66315C2766365C6630206E646572696C
            6D6573692C206172616E6D616E5C66315C2766645C6630207A20676962692920
            69737465796562696C6972697A2E5C7061720D0A0D0A5C706172645C66335C66
            7331345C7061720D0A7D0D0A00}
        end
      end
      object Header3: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 41.574830000000000000
        Top = 975.118740000000000000
        Width = 680.315400000000000000
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Top = 22.677180000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'Veri Kayna'#287#305)
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 408.189240000000000000
          Top = 22.677180000000000000
          Width = 272.125991570000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'Fiziksel Saklama S'#252'resi')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 136.063080000000000000
          Top = 22.677180000000000000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'Dijital Saklama S'#252'resi')
          ParentFont = False
        end
      end
      object MasterData12: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 1039.370750000000000000
        Width = 680.315400000000000000
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'kaynak_str'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsSure."kaynak_str"]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 408.189240000000000000
          Width = 272.125984250000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'sakl_fsure'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsSure."sakl_fsure"]')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 136.063080000000000000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'sakl_ssure'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsSure."sakl_ssure"]')
          ParentFont = False
        end
      end
      object MasterData13: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 1080.945580000000000000
        Width = 680.315400000000000000
        RowCount = 0
        object Rich6: TfrxRichView
          AllowVectorExport = True
          Top = 15.118120000000000000
          Width = 680.315400000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235345C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313035357B5C666F6E7474626C7B5C66
            305C666E696C5C66636861727365743136322054696D6573204E657720526F6D
            616E3B7D7B5C66315C666E696C5C6663686172736574313632205461686F6D61
            3B7D7D0D0A7B5C636F6C6F7274626C203B5C726564305C677265656E305C626C
            7565303B5C7265643235355C677265656E3235355C626C75653235353B7D0D0A
            7B5C2A5C67656E657261746F722052696368656432302031302E302E32363130
            307D5C766965776B696E64345C756331200D0A5C706172645C6362706174325C
            6E6F77696463746C7061725C73613130305C716A5C6366315C625C66305C6673
            3230204B5C2764645C2764655C27646453454C205645525C2764644C45525C27
            64644E5C2764645A5C276464204E4552454C45524520414B54415249594F5255
            5A3F5C62305C66315C667331345C7061720D0A7D0D0A00}
        end
      end
    end
    object Page2: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle2: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 272.126037950000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Rich7: TfrxRichView
          AllowVectorExport = True
          Top = 188.976377950000000000
          Width = 699.213050000000000000
          Height = 71.811070000000000000
          StretchMode = smMaxHeight
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235345C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313035357B5C666F6E7474626C7B5C66
            305C666E696C5C66636861727365743136322054696D6573204E657720526F6D
            616E3B7D7B5C66315C666E696C5C6663686172736574302054696D6573204E65
            7720526F6D616E3B7D7B5C66325C666E696C5C66636861727365743020546168
            6F6D613B7D7D0D0A7B5C636F6C6F7274626C203B5C726564305C677265656E30
            5C626C7565303B5C7265643235355C677265656E3235355C626C75653235353B
            7D0D0A7B5C2A5C67656E657261746F722052696368656432302031302E302E32
            363130307D5C766965776B696E64345C756331200D0A5C706172645C63627061
            74325C77696463746C7061725C6366315C66305C667332302020202020202020
            205C62205B66727864734D434465662E226B726D5F756E76616E225D205C6230
            2074617261665C2766645C6631206E64616E2068617A5C66305C2766645C6631
            20726C616E616E2C205C62205B6672786473417964696E6C61746D612E226B69
            73695F737472225D20415944494E4C41544D41204D45544E5C66305C2764645C
            663120205C62302074617261665C66305C2766645C6631206D6361206F6B756E
            6D755C66305C2766655C6631207475722E5C7061720D0A0D0A5C706172645C63
            62706174325C77696463746C7061725C716A5C66302020202020202020415C27
            66655C663120615C66305C2766305C2766645C663120646120615C66305C2765
            375C2766645C6631206B20725C66305C2766645C6631207A616D5C66305C2766
            645C663120207665726D695C66305C2766655C663120206F6C64755C66305C27
            66305C663120756D206B6F6E756C617264615C66305C7E5C6631207665206265
            6C697274696C656E20616D615C66305C2765375C6631206C6172206B61707361
            6D5C66305C2766645C6631206E646120695C66305C2766655C6631206C656E6D
            6573696E652C20616B7461725C66305C2766645C6631206C6D61735C66305C27
            66645C6631206E61206F6E61792076657269796F72756D2E5C7061720D0A0D0A
            5C706172645C66325C667331345C7061720D0A7D0D0A00}
        end
        object Picture2: TfrxPictureView
          AllowVectorExport = True
          Left = 302.362400000000000000
          Width = 75.590551180000000000
          Height = 75.590551180000000000
          DataField = 'krm_logo'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 94.488250000000000000
          Top = 79.370130000000000000
          Width = 510.236550000000000000
          Height = 56.692913385826800000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxdsAydinlatma."kisi_str"] A'#199'IK RIZA BEYANI')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData14: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 393.071120000000000000
        Width = 718.110700000000000000
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'DATATYPELIST'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsDummy."DATATYPELIST"]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 226.771800000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'PURPOSELIST'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsDummy."PURPOSELIST"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 472.441250000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'TRANSFERLOCATIONLIST'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxdsDummy."TRANSFERLOCATIONLIST"]')
          ParentFont = False
        end
      end
      object Header4: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 351.496290000000000000
        Width = 718.110700000000000000
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'Veri Kategorisi')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 226.771800000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #304#351'lenme ve Aktar'#305'lma Amac'#305)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 472.441250000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'Aktar'#305'labilecek Yer')
          ParentFont = False
        end
      end
      object ReportSummary2: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 377.953000000000000000
        Top = 472.441250000000000000
        Width = 718.110700000000000000
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 10.000000000000000000
          Top = 242.858380000000000000
          Width = 94.488250000000000000
          Height = 124.724490000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ''
            'Tarih'
            'Ad'#305' Soyad'#305
            'Kimlik No'
            'Telefon'
            'E-Posta'
            #304'mza')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 104.488250000000000000
          Top = 242.858380000000000000
          Width = 582.047620000000000000
          Height = 124.724490000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ''
            '[frxdsDummy."tarih"]   '
            '[frxdsDummy."ADISOYADI"]'
            ''
            '[frxdsDummy."TELEFON"]'
            '[frxdsDummy."EMAIL"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end>
        end
      end
    end
  end
  object frxdsMCDef: TfrxDBDataset
    UserName = 'frxdsMCDef'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'gc_id=gc_id'
      'code=code'
      'title=title'
      'idy=idy'
      'idt=idt'
      'sdy=sdy'
      'sdt=sdt'
      'active=active'
      'krm_vkn=krm_vkn'
      'krm_vdairesi=krm_vdairesi'
      'krm_email=krm_email'
      'krm_kep=krm_kep'
      'krm_telefon1=krm_telefon1'
      'krm_telefon2=krm_telefon2'
      'krm_adresno=krm_adresno'
      'krm_adres1=krm_adres1'
      'krm_adres2=krm_adres2'
      'vs_tck=vs_tck'
      'vs_ad=vs_ad'
      'vs_soyad=vs_soyad'
      'vs_email=vs_email'
      'vs_kep=vs_kep'
      'vs_telefon1=vs_telefon1'
      'vs_telefon2=vs_telefon2'
      'vs_adresno=vs_adresno'
      'vs_adres1=vs_adres1'
      'vs_adres2=vs_adres2'
      'krm_unvan=krm_unvan'
      'krm_web1=krm_web1'
      'krm_web2=krm_web2'
      'krm_web3=krm_web3'
      'krm_sehir=krm_sehir'
      'krm_logo=krm_logo'
      'krm_fax=krm_fax'
      'krm_mersis=krm_mersis'
      'krm_guid=krm_guid'
      'krm_logo_type=krm_logo_type')
    OpenDataSource = False
    DataSet = MainMod.qMCDef
    BCDToCurrency = False
    DataSetOptions = []
    Left = 420
    Top = 179
  end
  object frxdsMetod: TfrxDBDataset
    UserName = 'frxdsMetod'
    CloseDataSource = False
    FieldAliases.Strings = (
      'metod=metod')
    OpenDataSource = False
    DataSet = qMetod
    BCDToCurrency = False
    DataSetOptions = []
    Left = 535
    Top = 186
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 355
    Top = 53
  end
  object frxdsAydinlatma: TfrxDBDataset
    UserName = 'frxdsAydinlatma'
    CloseDataSource = False
    OpenDataSource = False
    DataSet = qAydinlatma
    BCDToCurrency = False
    DataSetOptions = []
    Left = 420
    Top = 236
  end
  object frxdsDayanak: TfrxDBDataset
    UserName = 'frxdsDayanak'
    CloseDataSource = False
    OpenDataSource = False
    DataSet = qDayanak
    BCDToCurrency = False
    DataSetOptions = []
    Left = 535
    Top = 253
  end
  object frxdsAktarim: TfrxDBDataset
    UserName = 'frxdsAktarim'
    CloseDataSource = False
    OpenDataSource = False
    DataSet = tblAktarim
    BCDToCurrency = False
    DataSetOptions = []
    Left = 420
    Top = 306
  end
  object frxdsAmac: TfrxDBDataset
    UserName = 'frxdsAmac'
    CloseDataSource = False
    OpenDataSource = False
    DataSet = qAmac
    BCDToCurrency = False
    DataSetOptions = []
    Left = 535
    Top = 314
  end
  object frxdsDummy: TfrxDBDataset
    UserName = 'frxdsDummy'
    CloseDataSource = False
    FieldAliases.Strings = (
      'dummy=dummy'
      'tarih=tarih'
      'ipadres=ipadres'
      'DATATYPELIST=DATATYPELIST'
      'PURPOSELIST=PURPOSELIST'
      'TRANSFERLOCATIONLIST=TRANSFERLOCATIONLIST'
      'ADISOYADI=ADISOYADI'
      'TELEFON=TELEFON'
      'EMAIL=EMAIL')
    OpenDataSource = False
    DataSet = tblDummy
    BCDToCurrency = False
    DataSetOptions = []
    Left = 534
    Top = 450
  end
  object frxdsSure: TfrxDBDataset
    UserName = 'frxdsSure'
    CloseDataSource = False
    OpenDataSource = False
    DataSet = qSure
    BCDToCurrency = False
    DataSetOptions = []
    Left = 535
    Top = 381
  end
  object frxdsKatVeriTipi: TfrxDBDataset
    UserName = 'frxdsKatVeriTipi'
    CloseDataSource = False
    OpenDataSource = False
    DataSet = tblKatVeriTipi
    BCDToCurrency = False
    DataSetOptions = []
    Left = 420
    Top = 371
  end
  object tblDummy: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'dummy'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'tarih'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ipadres'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DATATYPELIST'
        DataType = ftString
        Size = 4000
      end
      item
        Name = 'PURPOSELIST'
        DataType = ftString
        Size = 4000
      end
      item
        Name = 'TRANSFERLOCATIONLIST'
        DataType = ftString
        Size = 4000
      end
      item
        Name = 'ADISOYADI'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'TELEFON'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 100
      end>
    Left = 159
    Top = 330
    Data = {
      04000900050064756D6D79010014000000000005007461726968010014000000
      000007006970616472657301001400000000000C0044415441545950454C4953
      540100A00F000000000B00505552504F53454C4953540100A00F000000001400
      5452414E534645524C4F434154494F4E4C4953540100A00F0000000009004144
      49534F594144490100640000000000070054454C45464F4E0100640000000000
      0500454D41494C0100640000000000000000000000}
  end
end
