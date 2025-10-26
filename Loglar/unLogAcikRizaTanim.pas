unit unLogAcikRizaTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniDateTimePicker,
  uniBasicGrid, uniDBGrid, Data.DB, DBAccess, Uni, MemDS, uniButton, uniBitBtn,
  uniLabel, DateUtils;

type
  TfrmLogAcikRizaTanim = class(TUniForm)
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

function frmLogAcikRizaTanim: TfrmLogAcikRizaTanim;

implementation

{$R *.dfm}

uses
  MainModule, McMLib, uniGUIApplication, unHelpPage;

function frmLogAcikRizaTanim: TfrmLogAcikRizaTanim;
begin
  Result := TfrmLogAcikRizaTanim(MainMod.GetFormInstance(TfrmLogAcikRizaTanim));
end;

procedure TfrmLogAcikRizaTanim.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrClose;
end;

procedure TfrmLogAcikRizaTanim.btnPrepareClick(Sender: TObject);
begin
  NewSql;
end;

function TfrmLogAcikRizaTanim.Exec(p_id: integer): Integer;
begin
  Id := p_id;
  NewSql;
  ShowModal;
end;

procedure TfrmLogAcikRizaTanim.NewSql;
var
	SqLStr,
  SrcText,
	WhereStr : string;
begin
  SqLStr := 'SELECT ld.*,ud.user_name log_user_name '+
  ' FROM kvknet_log.log_data_acikriza ld ' +
  ' LEFT JOIN public.usr_user ud ON ud.id = ld.log_kullanici_id WHERE ' +
  ' ld.mc_id = ' + IntToStr(MainMod.MCID) + ' AND ' ;
  WhereStr := ' ld.id = ' + IntToStr(Id) + ' AND ' +
  ' ld.log_tarih >= to_timestamp(''' + formatdatetime('ddmmyyyyhhnnss', edTarih1.DateTime) + ''', ''DDMMYYYYHH24MISS'') ' +
  ' AND ld.log_tarih <= to_timestamp(''' + formatdatetime('ddmmyyyyhhnnss', edTarih2.DateTime) + ''', ''DDMMYYYYHH24MISS'')';

  SqLStr := SqLStr + ' ' + WhereStr;
  SqLStr := SqLStr + ' ORDER BY ld.log_tarih';
  QueryOpen(qLog,SqLStr);
end;

procedure TfrmLogAcikRizaTanim.UniFormCreate(Sender: TObject);
begin
  edTarih1.DateTime := StartOfTheDay(Now);
  edTarih2.DateTime := EndOfTheDay(Now);
end;

end.
