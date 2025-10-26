object frmPDFForm: TfrmPDFForm
  Left = 0
  Top = 0
  ClientHeight = 688
  ClientWidth = 891
  Caption = 'UniPDFForm'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  TextHeight = 15
  object UniURLFrame1: TUniURLFrame
    Left = 0
    Top = 0
    Width = 891
    Height = 688
    Hint = ''
    Align = alClient
    TabOrder = 0
    ParentColor = False
    Color = clBtnFace
  end
  object dsdata: TUniDataSource
    DataSet = qdata
    Left = 431
    Top = 165
  end
  object qdata: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      
        'SELECT ct.category_name , d.*, '#39#39' btn, '#39#39'btn2 FROM def_data_docu' +
        'ment d'
      'LEFT JOIN def_data_document_category ct on ct.id=d.category_id'
      'where d.mc_id = 2')
    Left = 392
    Top = 165
  end
end
