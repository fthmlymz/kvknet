unit unRiskUtls;

interface
 uses SysUtils,UITypes,Vcl.Graphics;
type
  TriskHesapMetod = (RhmLTipiMatris=1, RhmFMEA,  RhmFineKinney);
  // ltipimatris
  TRiskOlasilik = (roCokDusuk = 1, roDusuk, roOrta, roYuksek, roCokYuksek);
  TRiskEtki =(ReCokdusuk=1,ReDusuk,ReOrta,ReYuksek,ReCokYuksek)  ;
  // RhmFMEA
  TriskFarkedilebilirlik = (rfCokyuksek=1,rfyuksek,rforta,rfdusuk,rfcokdusuk);

  // FineKinney
  TRiskEtkiFk = (ReFkOnemsiz=1,ReFkKucuk,ReFkOrta,ReFkBuyuk,ReFkCokbuyuk, ReFkKritik );
  TRiskOlasilikFk = (RoFkBeklenmez=1,RoFkBeklenmezFakatMumkun,RoFkMumkunFakatDusuk, RoFkOlasi, RoFkYuksek, RoFkKesin );
  TRiskFrekansFk = ( RfFkCokSeyrek=1 ,  RfFkSeyrek, RfFkSikDegil, RfFkArasira,RfFkSik,  RfFkSurekli  );
  ///
  TRiskDurum = (rdAcik = 1, rdKapali, rdSuruyor);
  TriskKategoriler =(KOperasyonel=1,KbilgiIslem,kYasal);
  TPeriyotBirimi = (PbGun, PbHafta, Pbay, PbYil);
  TRiskTedbirDurum = (RtdYapilacak=1, RtdYapildi, RtdIptal);

  TRiskSeviyesi = (rsDusuk, rsKabulEdilebilir, rsOrta, rsYuksek, rsKritik);

  function GetRiskSeviyesi(var RiskSkorustr:string; RiskSkoru: Double ; RiskHesapMetot : TriskHesapMetod ): TRiskSeviyesi;
  function yuvarla(sayi: real):integer;

  const
  //finekinney
  NriskEtkiFk : array[TRiskEtkiFk] of integer =(1,3,5,10,15,100);
  NRiskOlasilikFk : array[TRiskOlasilikFk] of Double =(0.2,0.5,1,3,6,10);
  NRiskFrekansFk :array[TRiskFrekansFk] of Double =(0.5,1,2,3,6,10);


  SRiskEtkiFk: array[TRiskEtkiFk] of string = (
    '1 - ÷NEMS›Z (H›«B›R ETK› YOK, OPERASYON ETK›LENMEZ)',
    '3 - K‹«‹K (GE«›C› H›ZMET KES›NT›S›, M›N›MAL VER› KAYBI)',
    '5 - ORTA (KISA S‹REL› H›ZMET KAYBI, K‹«‹K B›R VER› ›HLAL›)',
    '10 - B‹Y‹K (S›STEMLER›N DURMASI, HASSAS VER›LER›N KAYBI)',
    '15 - «OK B‹Y‹K (÷NEML› ›ﬁ S‹RE«LER›N›N DURMASI, M‹ﬁTER› ETK›S›)',
    '100 - KR›T›K (B‹Y‹K VER› ›HLAL›, ›T›BAR KAYBI, CEZA› YAPTIRIM R›SK›)'
);

  SRiskOlasilikFk: array[TRiskOlasilikFk] of string = (
    '0.2 - BEKLENMEZ', '0.5 - BEKLENMEZ FAKAT M‹MK‹N', '1 - M‹MK‹N FAKAT D‹ﬁ‹K', '3 - OLASI', '6 - Y‹KSEK', '10 - KES›N');

  SRiskFrekansFk: array[TRiskFrekansFk] of string = (
    '0.5 - «OK SEYREK (YILDA B›R VEYA DAHA SEYREK)',
    '1 - SEYREK (YILDA B›RKA« DEFA)',
    '2 - SIK DE–›L (AYDA B›R VEYA B›RKA« DEFA)',
    '3 - ARA SIRA (HAFTADA B›R VEYA B›RKA« DEFA)',
    '6 - SIK (G‹NDE B›R VEYA B›RKA« DEFA)',
    '10 - HEMEN S‹REKL› TEKRAR'
);


  //  fmea

  SRiskFarkedilebilirlik: array[TRiskFarkedilebilirlik] of string = (
    '1 - «OK Y‹KSEK HEMEN FARK ED›L›R',
    '2 - Y‹KSEK GENELDE FARK ED›L›R',
    '3 - ORTA «O–U DURUMDA FARK ED›L›R',
    '4 - D‹ﬁ‹K NAD›REN FARK ED›L›R',
    '5 - «OK D‹ﬁ‹K H›« FARK ED›LMEZ'
);
  //
  SRiskHesapMetod: array[TRiskHesapMetod] of string = ('L T›P› MATR›S', 'FMEA', 'FINE-KINNEY');
  SriskOlasilik : array[TRiskOlasilik] of string = ('1 - «OK D‹ﬁ‹K OLASILIK','2 - D‹ﬁ‹K OLASILIK','3 - ORTA OLASILIK','4 - Y‹KSEK OLASILIK','5 - «OK Y‹KSEK OLASILIK');
  SRiskEtki : array[TRiskEtki] of string =('1 - «OK D‹ﬁ‹K ETK›','2 - D‹ﬁ‹K ETK›','3 - ORTA ETK›','4 - Y‹KSEK ETK›','5 - «OK Y‹KSEK ETK›') ;
  SriskDurum : array[TRiskDurum] of string =('A«IK','KAPALI','DEVAM ED›YOR');
  SRiskKategoriler: array[TRiskKategoriler] of string = ('OPERASYONEL', 'B›LG› G‹VENL›–›', 'YASAL');
  SPeriyotBirimi: array[TPeriyotBirimi] of string = ('G‹N', 'HAFTA', 'AY','YIL');
  SRiskTedbirDurum : array[TRiskTedbirDurum] of string =('YAPILACAK', 'YAPILDI','›PTAL ED›LD›');
  sRiskSeviyesi : array[TRiskSeviyesi] of string = ('D‹ﬁ‹K R›SK','KABUL ED›LEB›L›R R›SK','ORTA R›SK','Y‹KSEK R›SK','KR›T›K R›SK') ;

  CRiskColors: array[TRiskSeviyesi] of TColor = ( clGreen,    clLime,     clYellow,   $004080FF,  $000000FF    );
implementation

function GetRiskSeviyesi(var RiskSkorustr:string; RiskSkoru: Double ; RiskHesapMetot : TriskHesapMetod ): TRiskSeviyesi;
begin
  if TriskHesapMetod( RiskHesapMetot) = RhmLTipiMatris then
    begin
      if (RiskSkoru < 5) then
        begin
        Result := rsDusuk ;
        RiskSkorustr := sRiskSeviyesi[rsDusuk];
        end
      else if (RiskSkoru >= 5) and (RiskSkoru <= 10) then
        begin
        Result := rsKabulEdilebilir ;
        RiskSkorustr := sRiskSeviyesi[rsKabulEdilebilir];
        end
      else if (RiskSkoru >= 11) and (RiskSkoru <= 15) then
        begin
        Result := rsOrta  ;
        RiskSkorustr := sRiskSeviyesi[rsOrta];
        end
      else if (RiskSkoru >= 16) and (RiskSkoru <= 20) then
        begin
        Result := rsYuksek ;
        RiskSkorustr := sRiskSeviyesi[rsYuksek];
        end
      else if (RiskSkoru > 20) then
        begin
        Result := rsKritik ;
        RiskSkorustr := sRiskSeviyesi[rsKritik];
        end;

    end
    else if TriskHesapMetod( RiskHesapMetot) = RhmFMEA then
    begin
    if (RiskSkoru < 25) then
        begin
        Result := rsDusuk ;
        RiskSkorustr := sRiskSeviyesi[rsDusuk];
        end
      else if (RiskSkoru >= 25) and (RiskSkoru <= 50) then
        begin
        Result := rsKabulEdilebilir ;
        RiskSkorustr := sRiskSeviyesi[rsKabulEdilebilir];
        end
      else if (RiskSkoru >= 50) and (RiskSkoru <= 75) then
        begin
        Result := rsOrta  ;
        RiskSkorustr := sRiskSeviyesi[rsOrta];
        end
      else if (RiskSkoru >= 75) and (RiskSkoru <= 100) then
        begin
        Result := rsYuksek ;
        RiskSkorustr := sRiskSeviyesi[rsYuksek];
        end
      else if (RiskSkoru > 100) then
        begin
        Result := rsKritik ;
        RiskSkorustr := sRiskSeviyesi[rsKritik];
        end;
    end
    else if TriskHesapMetod( RiskHesapMetot) = RhmFineKinney then
    begin

      if  (RiskSkoru < 200) then
        begin
        Result := rsDusuk ;
        RiskSkorustr := sRiskSeviyesi[rsDusuk];
        end
      else if (RiskSkoru >= 200) and (RiskSkoru < 400 ) then
        begin
        Result := rsKabulEdilebilir ;
        RiskSkorustr := sRiskSeviyesi[rsKabulEdilebilir];
        end
      else if (RiskSkoru >= 400) and (RiskSkoru < 600) then
        begin
        Result := rsOrta  ;
        RiskSkorustr := sRiskSeviyesi[rsOrta];
        end
      else if (RiskSkoru >= 600) and (RiskSkoru < 800) then
        begin
        Result := rsYuksek ;
        RiskSkorustr := sRiskSeviyesi[rsYuksek];
        end
      else if (RiskSkoru > 800)  then
        begin
        Result := rsKritik ;
        RiskSkorustr := sRiskSeviyesi[rsKritik];
        end;
    end;

end;

function yuvarla(sayi: real):integer;
var
  tam, ondalik: integer;
begin
  tam:=trunc(sayi);
  ondalik:=trunc(frac(sayi)*10);
  if ondalik>=5 then
    result:=tam+1
  else
    result:=tam;
end;

end.
