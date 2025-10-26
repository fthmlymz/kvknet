unit unLogVSBasvuruTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniDateTimePicker,
  uniBasicGrid, uniDBGrid, Data.DB, DBAccess, Uni, MemDS, uniButton, uniBitBtn,
  uniLabel, DateUtils;

type
  TfrmLogVSBasvuruTanim = class(TUniForm)
    pnlNav: TUniPanel;
    edTarih1: TUniDateTimePicker;
    edTarih2: TUniDateTimePicker;
    pnlLog: TUniPanel;
    UniDBGrid1: TUniDBGrid;
    qLog: TUniQuery;
    dLog: TUniDataSource;
    btnPrepare: TUniBitBtn;
    btnCancel: TUniBitBtn;
    UniLabel3: TUniLabel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure btnPrepareClick(Sender: TObject);
  private
    { Private declarations }
    Id: Integer;
    procedure NewSql;
  public
    { Public declarations }
    function Exec(p_id: integer): Integer;
  end;

function frmLogVSBasvuruTanim: TfrmLogVSBasvuruTanim;

implementation

{$R *.dfm}

uses
  MainModule, McMLib, uniGUIApplication, unHelpPage;

function frmLogVSBasvuruTanim: TfrmLogVSBasvuruTanim;
begin
  Result := TfrmLogVSBasvuruTanim(MainMod.GetFormInstance(TfrmLogVSBasvuruTanim));
end;

procedure TfrmLogVSBasvuruTanim.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrClose;
end;

procedure TfrmLogVSBasvuruTanim.btnPrepareClick(Sender: TObject);
begin
  NewSql;
end;

function TfrmLogVSBasvuruTanim.Exec(p_id: integer): Integer;
begin
  Id := p_id;
  NewSql;
  ShowModal;
end;

procedure TfrmLogVSBasvuruTanim.NewSql;
var
	SqLStr,
  SrcText,
	WhereStr : string;
begin
  SqLStr := 'SELECT ld.*,ud.user_name log_user_name '+
  ' FROM kvknet_log.log_data_vsbasvuru ld ' +
  ' LEFT JOIN public.usr_user ud ON ud.id = ld.log_kullanici_id WHERE ';

 //'ld.mc_id = ' + IntToStr(MainMod.MCID) + ' AND ' +
  WhereStr := ' ld.id = ' + IntToStr(Id) + ' AND ' +
  ' ld.log_tarih >= to_timestamp(''' + formatdatetime('ddmmyyyyhhnnss', edTarih1.DateTime) + ''', ''DDMMYYYYHH24MISS'') ' +
  ' AND ld.log_tarih <= to_timestamp(''' + formatdatetime('ddmmyyyyhhnnss', edTarih2.DateTime) + ''', ''DDMMYYYYHH24MISS'')';

  SqLStr := SqLStr + ' ' + WhereStr;
  SqLStr := SqLStr + ' ORDER BY ld.log_tarih';
  QueryOpen(qLog,SqLStr);
end;

procedure TfrmLogVSBasvuruTanim.UniFormCreate(Sender: TObject);
begin
  edTarih1.DateTime := StartOfTheDay(Now);
  edTarih2.DateTime := EndOfTheDay(Now);
end;

end.
