unit unIhlalOlayDetayListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, Data.DB, DBAccess, Uni, MemDS, uniGUIBaseClasses,
  uniBasicGrid, uniDBGrid, uniPanel;

type
  tSorguType =(stEtkilenenKisi,stEtkilenenKaynak,stetkilenenSurec) ;
  TfrmIhlalOlayDetayListe = class(TUniFrame)
    qdata: TUniQuery;
    dsdata: TUniDataSource;
    UniDBGrid1: TUniDBGrid;
    UniPanel1: TUniPanel;
  private
    { Private declarations }
  public
   procedure newsql(AIhlalId:integer);
   function EtkilenenKayit(Asrctext:string;AsorguType:tSorguType): string;

  end;
 var
  FonksilonSql:string = ' select string_agg(ihlal_id::VARCHAR, '','') ids from ' +
  ' (SELECT es.ihlal_id ' +
  ' FROM ' +
  ' def_data_ihlal_surec_eslesme es, ' +
  ' def_data_surec s, ' +
  ' def_data_kaynak K, ' +
  ' def_data_ihlal i, ' +
  ' data_envanter e , ' +
  ' def_data_kisi kis ' +
  ' WHERE ' +
  ' i.mc_id = %s '+
  ' AND i.ID = es.ihlal_id ' +
  ' AND s.id = es.surec_id ' +
  ' AND K.ID = ANY ( string_to_array( es.kaynak_ids, '','' ) :: INT [] ) ' +
  ' AND e.mc_id = i.mc_id  and e.active=''E'' AND E.main_id>0 ' +
  ' AND e.surec_id = es.surec_id ' +
  ' and kis.id=e.kisi_id %s ' +
  ' GROUP BY es.ihlal_id ) ' ;

implementation

{$R *.dfm}

 uses McMLib,MainModule;

{ TfrmIhlalOlayDetayListe }

function TfrmIhlalOlayDetayListe.EtkilenenKayit(Asrctext:string;AsorguType:tSorguType): string;
var
where:string;
begin
  result := '';
  if AsorguType = stetkilenenSurec then
      where :=  ' and s.surec like '+QuotedStr('%'+Asrctext+'%')
  else if AsorguType=stEtkilenenKisi then
      where := ' and kis.kisi liKe '+QuotedStr('%'+Asrctext+'%')
  else if AsorguType=stEtkilenenKaynak then
      where := ' and k.kaynak like '+QuotedStr('%'+Asrctext+'%');

  QueryOpen(mainmod.qTmp,format(FonksilonSql,[IntToStr(mainmod.MCID),where]));
  if not mainmod.qTmp.IsEmpty then
    result := mainmod.qTmp.FieldByName('ids').AsString;
end;

procedure TfrmIhlalOlayDetayListe.newsql(AIhlalId:integer);
var
	SQLStr :string  ;
  WhereStr : string;
begin

	SQLStr   := ' SELECT DISTINCT ' +
  ' i.ihlal_icerigi, ' +
  ' i.baslangic_tarihi, ' +
  ' i.bitis_tarihi, ' +
  ' i.tespit_tarihi, ' +
  ' es.ihlal_id, ' +
  ' s.surec, ' +
  ' K.kaynak, ' +
  ' es.surec_id, ' +
  ' es.kaynak_ids, ' +
  ' e.kisi_id, ' +
  ' kis.kisi ' +
  ' FROM ' +
  ' def_data_ihlal_surec_eslesme es, ' +
  ' def_data_surec s, ' +
  ' def_data_kaynak K, ' +
  ' def_data_ihlal i, ' +
  ' data_envanter e , ' +
  ' def_data_kisi kis ' +
  ' WHERE ' +
  ' i.mc_id = ' + IntToStr(MainMod.MCID) +
  ' AND i.ID = es.ihlal_id ' +
  ' AND s.id = es.surec_id ' +
  ' AND K.ID = ANY ( string_to_array( es.kaynak_ids, '','' ) :: INT [] ) ' +
  ' AND e.mc_id = i.mc_id  and e.active=''E'' AND E.main_id>0 ' +
  ' AND e.surec_id = es.surec_id ' +
  ' and kis.id=e.kisi_id  and es.ihlal_id='+inttostr(AIhlalId)   ;

  QueryOpen(qdata,SQLStr) ;


end;

initialization
RegisterClass(TfrmIhlalOlayDetayListe);
end.
