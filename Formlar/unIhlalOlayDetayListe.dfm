object frmIhlalOlayDetayListe: TfrmIhlalOlayDetayListe
  Left = 0
  Top = 0
  Width = 1116
  Height = 314
  Layout = 'border'
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  TabOrder = 0
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 33
    Width = 1116
    Height = 281
    Hint = ''
    ClientEvents.ExtEvents.Strings = (
      
        'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10'   sender.vi' +
        'ew.rowExpander.collapseRow = function(rowIdx) {'#13#10'        var row' +
        'Node = this.view.getNode(rowIdx),'#13#10'            row = Ext.get(row' +
        'Node),'#13#10'            nextBd = Ext.get(row).down(this.rowBodyTrSel' +
        'ector),'#13#10'            record = this.view.getRecord(rowNode),'#13#10'   ' +
        '         grid = this.getCmp();'#13#10'        if (!row.hasCls(this.row' +
        'CollapsedCls)) {'#13#10'            row.addCls(this.rowCollapsedCls);'#13 +
        #10'            nextBd.addCls(this.rowBodyHiddenCls);'#13#10'            ' +
        'this.recordsExpanded[record.internalId] = false;'#13#10'            th' +
        'is.view.fireEvent('#39'collapsebody'#39', rowNode, record, nextBd.dom);'#13 +
        #10'        }'#13#10'    };'#13#10'}')
    DataSource = dsdata
    ReadOnly = True
    LoadMask.Message = 'Veriler y'#252'kleniyor..'
    ForceFit = True
    Align = alClient
    TabOrder = 0
    RowWidget.AlignmentControl = uniAlignmentClient
    RowWidget.Layout = 'fit'
    RowWidget.Enabled = True
    Columns = <
      item
        FieldName = 'surec'
        Title.Caption = #304'hlalden Etkilenen S'#252're'#231
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 904
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
      end
      item
        FieldName = 'kaynak'
        Title.Caption = #304'hlalden Etkilenen Kaynak'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 604
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
      end
      item
        FieldName = 'kisi'
        Title.Caption = #304'hlalden Etkilenen Ki'#351'i Grubu'
        Title.Font.OverrideDefaults = [ovFontHeight]
        Width = 604
        Font.OverrideDefaults = [ovFontHeight]
        ReadOnly = True
      end>
  end
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 1116
    Height = 33
    Hint = ''
    Align = alTop
    ParentFont = False
    Font.Height = -13
    Font.Style = [fsBold]
    TabOrder = 1
    Caption = #304'hlalden Etkilenen Veriler'
  end
  object qdata: TUniQuery
    Connection = MainMod.DBMain
    SQL.Strings = (
      'SELECT DISTINCT'
      #9'i.ihlal_icerigi,'
      #9'i.baslangic_tarihi,'
      #9'i.bitis_tarihi,'
      #9'i.tespit_tarihi,'
      #9'es.ihlal_id,'
      #9's.surec,'
      #9'K.kaynak,'
      #9'es.surec_id,'
      #9'es.kaynak_ids,'
      #9'e.kisi_id,'
      #9'kis.kisi '
      'FROM'
      #9'def_data_ihlal_surec_eslesme es,'
      #9'def_data_surec s,'
      #9'def_data_kaynak K,'
      #9'def_data_ihlal i,'
      #9'data_envanter e ,'
      #9'def_data_kisi kis'
      'WHERE'
      #9'i.mc_id = 4 '
      #9'AND i.ID = es.ihlal_id '
      #9'AND s."id" = es.surec_id '
      
        #9'AND K.ID = ANY ( string_to_array( es.kaynak_ids, '#39','#39' ) :: INT [' +
        '] ) '
      #9'AND e.mc_id = i.mc_id  and e.active='#39'E'#39' AND E.main_id>0'
      #9'AND e.surec_id = es.surec_id'
      #9'and kis.id=e.kisi_id')
    CachedUpdates = True
    Left = 296
    Top = 216
  end
  object dsdata: TUniDataSource
    DataSet = qdata
    Left = 344
    Top = 216
  end
end
