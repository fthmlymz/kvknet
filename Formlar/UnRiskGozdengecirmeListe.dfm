object frmRiskGozdengecirmeListe: TfrmRiskGozdengecirmeListe
  Left = 0
  Top = 0
  ClientHeight = 441
  ClientWidth = 863
  Caption = 'Risk G'#246'zden Ge'#231'irme Listesi'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  TextHeight = 15
  object pnlbutton: TUniPanel
    Left = 0
    Top = 0
    Width = 863
    Height = 45
    Hint = ''
    Align = alTop
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 0
    BorderStyle = ubsNone
    ShowCaption = False
    Caption = ''
    object btnGoster: TUniBitBtn
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 96
      Height = 39
      Hint = ''
      Caption = 'G'#246'ster'
      Align = alLeft
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
      Images = MainMod.PrjImgList
      ImageIndex = 2
      OnClick = btnGosterClick
    end
    object Btnexit: TUniBitBtn
      AlignWithMargins = True
      Left = 105
      Top = 3
      Width = 96
      Height = 39
      Hint = ''
      Caption = #199#305'k'
      Align = alLeft
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 2
      Images = MainMod.PrjImgList
      ImageIndex = 2
      OnClick = BtnexitClick
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 45
    Width = 863
    Height = 396
    Hint = ''
    ReadOnly = True
    LoadMask.Message = 'Loading data...'
    ForceFit = True
    Align = alClient
    TabOrder = 1
    Columns = <
      item
        FieldName = 'id'
        Title.Caption = 'Ref.No.'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 100
        Font.OverrideDefaults = [ovFontHeight]
      end
      item
        FieldName = 'sdurum'
        Title.Caption = 'Durum'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 100
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        DisplayMemo = True
      end
      item
        FieldName = 'risk'
        Title.Caption = 'Risk'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 300
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end
      item
        FieldName = 'aciklama'
        Title.Caption = 'A'#231#305'klama'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 300
        Visible = False
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end
      item
        FieldName = 'skategori'
        Title.Caption = 'Risk Kategorisi'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 300
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        DisplayMemo = True
      end
      item
        FieldName = 'seviye'
        Title.Caption = 'Risk Seviyesi'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 80
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end
      item
        FieldName = 'sseviye'
        Title.Caption = 'sseviye'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 150
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end
      item
        FieldName = 'solasilik'
        Title.Caption = 'Risk olas'#305'l'#305#287#305
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 300
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        DisplayMemo = True
      end
      item
        FieldName = 'setki'
        Title.Caption = 'Riskin Etkisi'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 300
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
        DisplayMemo = True
      end
      item
        FieldName = 'sfrekans'
        Title.Caption = 'Frekans'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 150
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end
      item
        FieldName = 'sfarkedilebilirlik'
        Title.Caption = 'Farkedilebilirlik'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 150
        Font.OverrideDefaults = [ovFontHeight]
        DisplayMemo = True
      end>
  end
  object pnlliste: TUniPanel
    Left = 0
    Top = 45
    Width = 863
    Height = 396
    Hint = ''
    Align = alClient
    ParentFont = False
    Font.OverrideDefaults = [ovFontHeight]
    TabOrder = 2
    ShowCaption = False
    Caption = ''
    object UniDBGrid2: TUniDBGrid
      Left = 1
      Top = 1
      Width = 861
      Height = 394
      Hint = ''
      DataSource = dsdata
      ReadOnly = True
      LoadMask.Message = 'Loading data...'
      ForceFit = True
      Align = alClient
      TabOrder = 1
      Columns = <
        item
          FieldName = 'risk_id'
          Title.Caption = 'Referans No'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'gozden_gecirme_tar'
          Title.Caption = 'G'#246'zden Ge'#231'irme Tar.'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'surecler'
          Title.Caption = 'S'#252're'#231'ler'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 300
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
          DisplayMemo = True
        end
        item
          FieldName = 'risk'
          Title.Caption = 'Risk'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 300
          Font.OverrideDefaults = [ovFontHeight]
        end
        item
          FieldName = 'tedbir'
          Title.Caption = 'Tedbir'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 300
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
        end>
    end
  end
  object dsdata: TUniDataSource
    DataSet = qdata
    Left = 344
    Top = 216
  end
  object qdata: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      
        'select  r.id risk_id, string_agg(s.surec, '#39','#39') surecler  ,r.risk' +
        ',rt.tedbir,r.gozden_gecirme_tar from '
      'def_data_riskgd r'
      
        'left join def_data_risk_tedbirgd rt on rt.risk_id= r.id and rt.g' +
        'ozdengecirme_id=r.gozdengecirme_id and rt.mc_id=r.mc_id'
      
        'left join def_data_risk_surec_eslesmegd re on re.risk_id = r.id ' +
        'and rt.gozdengecirme_id=r.gozdengecirme_id and re.mc_id=r.mc_id'
      
        'left join def_data_surec s on s.id = re.surec_id and re.mc_id=r.' +
        'mc_id'
      'where r.mc_id=4 and r.id= 4'
      'group by r.id ,r.risk,rt.tedbir,r.gozden_gecirme_tar')
    Left = 296
    Top = 216
  end
end
