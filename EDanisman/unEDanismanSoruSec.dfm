object frmEDanismanSoruSec: TfrmEDanismanSoruSec
  Left = 0
  Top = 0
  ClientHeight = 372
  ClientWidth = 634
  Caption = 'E-Dan'#305#351'man Soru Listesi'
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  TextHeight = 15
  object pnlData: TUniPanel
    Left = 0
    Top = 0
    Width = 634
    Height = 324
    Hint = ''
    Align = alClient
    TabOrder = 0
    Caption = ''
    object UniDBGrid1: TUniDBGrid
      Left = 1
      Top = 1
      Width = 632
      Height = 322
      Hint = ''
      DataSource = dsSoru
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.Paged = False
      LoadMask.Message = 'Loading data...'
      Align = alClient
      TabOrder = 1
      OnColumnFilter = UniDBGrid1ColumnFilter
      Columns = <
        item
          FieldName = 'id'
          Filtering.Editor = edfId
          Title.Alignment = taCenter
          Title.Caption = 'Ref. No'
          Width = 75
          Font.OverrideDefaults = [ovFontHeight]
          Alignment = taCenter
          Sortable = True
        end
        item
          FieldName = 'active'
          Filtering.Editor = cbfAktif
          Title.Alignment = taCenter
          Title.Caption = 'Aktif'
          Width = 60
          Font.OverrideDefaults = [ovFontHeight]
          Alignment = taCenter
          Sortable = True
          CheckBoxField.FieldValues = 'E;H'
          CheckBoxField.DisplayValues = 'Evet;Hay'#305'r'
        end
        item
          FieldName = 'soru_no'
          Filtering.Editor = edfSoruNo
          Title.Alignment = taCenter
          Title.Caption = 'Soru No'
          Width = 75
          Font.OverrideDefaults = [ovFontHeight]
          Sortable = True
          DisplayMemo = True
        end
        item
          FieldName = 'soru_metni'
          Filtering.Editor = edfSoruMetin
          Title.Alignment = taCenter
          Title.Caption = 'Soru Metni'
          Width = 500
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end>
    end
    object hpnFiltre: TUniHiddenPanel
      Left = 51
      Top = 60
      Width = 160
      Height = 202
      Hint = ''
      Visible = True
      object edfId: TUniNumberEdit
        Left = 21
        Top = 21
        Width = 121
        Hint = ''
        TabOrder = 1
        DecimalSeparator = ','
      end
      object cbfAktif: TUniComboBox
        Left = 21
        Top = 49
        Width = 103
        Hint = ''
        Text = 'cbfAktif'
        TabOrder = 2
        IconItems = <>
      end
      object edfSoruNo: TUniEdit
        Left = 21
        Top = 77
        Width = 121
        Hint = ''
        Text = ''
        TabOrder = 3
      end
      object edfSoruMetin: TUniEdit
        Left = 21
        Top = 105
        Width = 121
        Hint = ''
        Text = ''
        TabOrder = 4
      end
    end
  end
  object pnlButtons: TUniPanel
    Left = 0
    Top = 324
    Width = 634
    Height = 48
    Hint = ''
    Align = alBottom
    TabOrder = 1
    Caption = ''
    DesignSize = (
      634
      48)
    object btnCancel: TUniBitBtn
      Left = 530
      Top = 6
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
    object btnOk: TUniBitBtn
      Left = 428
      Top = 6
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Tamam'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 1
      Images = MainMod.PrjImgList
      ImageIndex = 14
      OnClick = btnOkClick
    end
  end
  object qSoru: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user')
    Left = 229
    Top = 166
  end
  object dsSoru: TUniDataSource
    DataSet = qSoru
    Left = 279
    Top = 165
  end
end
