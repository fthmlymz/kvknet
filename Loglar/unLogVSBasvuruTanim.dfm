object frmLogVSBasvuruTanim: TfrmLogVSBasvuruTanim
  Left = 0
  Top = 0
  ClientHeight = 542
  ClientWidth = 1035
  Caption = 'Log-[Veri Sahibi Basvuru Tanim]'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -12
  OnCreate = UniFormCreate
  TextHeight = 15
  object pnlNav: TUniPanel
    Left = 0
    Top = 450
    Width = 1035
    Height = 92
    Hint = ''
    Align = alBottom
    TabOrder = 0
    BorderStyle = ubsNone
    Caption = ''
    DesignSize = (
      1035
      92)
    object edTarih1: TUniDateTimePicker
      Left = 118
      Top = 16
      Width = 225
      Height = 23
      Hint = ''
      DateTime = 45041.678980219910000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      Kind = tUniDateTime
      TabOrder = 1
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
    end
    object edTarih2: TUniDateTimePicker
      Left = 118
      Top = 54
      Width = 225
      Height = 23
      Hint = ''
      DateTime = 45041.678980219910000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      Kind = tUniDateTime
      TabOrder = 2
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
    end
    object btnPrepare: TUniBitBtn
      Left = 825
      Top = 28
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Haz'#305'rla'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 3
      Images = MainMod.PrjImgList
      ImageIndex = 15
      OnClick = btnPrepareClick
    end
    object btnCancel: TUniBitBtn
      Left = 927
      Top = 28
      Width = 96
      Height = 36
      Hint = ''
      Caption = 'Kapat'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 4
      Images = MainMod.PrjImgList
      ImageIndex = 5
      OnClick = btnCancelClick
    end
    object UniLabel3: TUniLabel
      Left = 12
      Top = 20
      Width = 100
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = #304#351'lem Zaman'#305'-I'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 5
    end
    object UniLabel1: TUniLabel
      Left = 12
      Top = 58
      Width = 100
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = #304#351'lem Zaman'#305'-II'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 6
    end
    object UniLabel2: TUniLabel
      Left = 370
      Top = 20
      Width = 85
      Height = 13
      Hint = ''
      AutoSize = False
      Caption = 'I:Ekleme'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 7
    end
    object UniLabel4: TUniLabel
      Left = 370
      Top = 39
      Width = 85
      Height = 13
      Hint = ''
      AutoSize = False
      Caption = 'U:De'#287'i'#351'tirme'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 8
    end
    object UniLabel5: TUniLabel
      Left = 370
      Top = 58
      Width = 85
      Height = 13
      Hint = ''
      AutoSize = False
      Caption = 'D:Silme'
      ParentFont = False
      Font.Color = clDefault
      Font.OverrideDefaults = [ovFontHeight]
      TabOrder = 9
    end
  end
  object pnlLog: TUniPanel
    Left = 0
    Top = 0
    Width = 1035
    Height = 450
    Hint = ''
    Align = alClient
    TabOrder = 1
    BorderStyle = ubsNone
    Caption = ''
    object UniDBGrid1: TUniDBGrid
      Left = 0
      Top = 0
      Width = 1035
      Height = 450
      Hint = ''
      DataSource = dLog
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Font.Height = -12
      Font.OverrideDefaults = [ovFontHeight]
      ParentFont = False
      TabOrder = 1
      Columns = <
        item
          FieldName = 'log_id'
          Title.Caption = 'Kay'#305't No'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 75
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'log_tarih'
          Title.Caption = 'Kay'#305't Tarihi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'log_islem'
          Title.Caption = 'Kay'#305't T'#252'r'#252
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 80
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'log_user_name'
          Title.Caption = 'Kullan'#305'c'#305' Ad'#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
          ReadOnly = True
          DisplayMemo = True
        end
        item
          FieldName = 'log_kullanici_ip'
          Title.Caption = 'IP No'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 100
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'durum'
          Title.Caption = 'Durum'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'adi'
          Title.Caption = 'Ad'#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'soyadi'
          Title.Caption = 'Soyad'#305
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'kimlik_no'
          Title.Caption = 'Kimlik No'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'tel1'
          Title.Caption = 'Tel'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'tel2'
          Title.Caption = 'Tel 2'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'adres1'
          Title.Caption = 'Adres'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'adres2'
          Title.Caption = 'Adres 2'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'ilce'
          Title.Caption = #304'l'#231'e'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'sehir'
          Title.Caption = #350'ehir'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'email'
          Title.Caption = 'E-Mail'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'kep'
          Title.Caption = 'Kep'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'basvuru_tarihi'
          Title.Caption = 'Ba'#351'vuru Tarihi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'basvuru_sekli'
          Title.Caption = 'Ba'#351'vuru '#350'ekli'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'cevap_tarihi'
          Title.Caption = 'Cevap Tarihi'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'cevap_sekli'
          Title.Caption = 'Cevap '#350'ekli'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'basvuru_konu'
          Title.Caption = 'Ba'#351'vuru Konu'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'basvuru_dept_id'
          Title.Caption = 'Ba'#351'vuru Depart ID'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'cevap_sekli_talep'
          Title.Caption = 'Cevap '#350'ekli Talep'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end
        item
          FieldName = 'uyruk'
          Title.Caption = 'Uyruk'
          Title.Font.OverrideDefaults = [ovFontHeight]
          Width = 150
          Font.OverrideDefaults = [ovFontHeight]
          DisplayMemo = True
        end>
    end
  end
  object qLog: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT ld.*,ud.user_name log_user_name'
      'FROM kvknet_log.log_data_vsbasvuru ld '
      'LEFT JOIN public.usr_user ud ON ud.id = ld.log_kullanici_id'
      'WHERE 1=2')
    Active = True
    Left = 456
    Top = 135
  end
  object dLog: TUniDataSource
    AutoEdit = False
    DataSet = qLog
    Left = 489
    Top = 135
  end
end
