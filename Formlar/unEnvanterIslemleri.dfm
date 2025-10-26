object frEnvanterIslemleri: TfrEnvanterIslemleri
  Left = 0
  Top = 0
  ClientHeight = 441
  ClientWidth = 624
  Caption = 'frEnvanterIslemleri'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  TextHeight = 15
  object tblCatVT: TVirtualTable
    FieldDefs = <
      item
        Name = 'cat_id'
        DataType = ftInteger
      end
      item
        Name = 'cat_str'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'cat_info'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'cat_vt'
        DataType = ftString
        Size = 2000
      end>
    Left = 275
    Top = 211
    Data = {
      0400040006006361745F6964030000000000000007006361745F737472010064
      000000000008006361745F696E666F0100F4010000000006006361745F767401
      00D00700000000000000000000}
  end
  object qCatVT: TVirtualQuery
    IndexFieldNames = 'cat_str'
    SourceDataSets = <
      item
        DataSet = tblCatVT
      end>
    SQL.Strings = (
      'SELECT * FROM tblCatVT')
    Left = 329
    Top = 211
  end
  object qKisi: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      
        'SELECT DISTINCT (env.kisi_id), ks.kisi AS kisi_str, ks.descripti' +
        'on, '
      'string_agg(vt.veri_tipi,'#39', '#39')::varchar as veritipi_str'
      'FROM data_envanter env'
      'LEFT JOIN def_data_kisi ks ON ks.id = env.kisi_id'
      'LEFT JOIN def_data_veritipi vt ON vt.id = env.veritipi_id  '
      'WHERE env.active = '#39'E'#39' AND env.mc_id = 2'
      'GROUP by kisi_id, ks.kisi, ks.description'
      'ORDER BY env.kisi_id'
      '')
    Left = 374
    Top = 211
  end
  object tblSure: TVirtualTable
    FieldDefs = <
      item
        Name = 'cat_id'
        DataType = ftInteger
      end
      item
        Name = 'cat_str'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'data_str'
        DataType = ftString
        Size = 300
      end>
    Left = 424
    Top = 211
    Data = {
      0400030006006361745F6964030000000000000007006361745F73747201002C
      01000000000800646174615F73747201002C0100000000000000000000}
  end
  object qSure: TVirtualQuery
    SourceDataSets = <
      item
        DataSet = tblSure
      end>
    SQL.Strings = (
      'SELECT * FROM tblAmac')
    Left = 436
    Top = 211
  end
  object qdayanak: TUniQuery
    Connection = MainMod.DBMain
    Left = 436
    Top = 176
  end
  object qamac: TUniQuery
    Connection = MainMod.DBMain
    Left = 436
    Top = 232
  end
  object qTmp: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    Left = 116
    Top = 211
  end
  object qTmp2: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT * FROM usr_user'
      'WHERE active = '#39'E'#39)
    Left = 161
    Top = 211
  end
  object tblKisiVT: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'kisi_id'
        DataType = ftInteger
      end
      item
        Name = 'kisi_str'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'kisi_vt'
        DataType = ftString
        Size = 2000
      end>
    Left = 211
    Top = 280
    Data = {
      0400030007006B6973695F6964030000000000000008006B6973695F73747201
      0064000000000007006B6973695F76740100D00700000000000000000000}
  end
  object qKisiVT: TVirtualQuery
    IndexFieldNames = 'kisi_str'
    SourceDataSets = <
      item
        DataSet = tblKisiVT
      end>
    SQL.Strings = (
      'SELECT * FROM tblKisiVT')
    Left = 265
    Top = 280
  end
  object tblTaraf: TVirtualTable
    FieldDefs = <
      item
        Name = 'taraf_id'
        DataType = ftInteger
      end
      item
        Name = 'taraf_str'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'taraf_info'
        DataType = ftString
        Size = 500
      end>
    Left = 211
    Top = 325
    Data = {
      04000300080074617261665F69640300000000000000090074617261665F7374
      7201006400000000000A0074617261665F696E666F0100F40100000000000000
      000000}
  end
  object qTaraf: TVirtualQuery
    IndexFieldNames = 'taraf_str'
    SourceDataSets = <
      item
        DataSet = tblTaraf
      end>
    SQL.Strings = (
      'SELECT * FROM tblTaraf')
    Left = 265
    Top = 325
  end
end
