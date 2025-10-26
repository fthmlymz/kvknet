unit UriskListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniButton, uniBitBtn, uniLabel, uniEdit,
  uniMultiItem, uniComboBox, uniGUIBaseClasses, uniPanel, uniBasicGrid,
  uniDBGrid, Data.DB, DBAccess, Uni, MemDS, System.Actions, Vcl.ActnList;

type
  TfrmRistListe = class(TUniFrame)
    pnlTop: TUniPanel;
    edSrcType: TUniComboBox;
    edSrcText: TUniEdit;
    UniLabel1: TUniLabel;
    btnSearch: TUniBitBtn;
    btnClose: TUniBitBtn;
    btnAdd: TUniBitBtn;
    btnEdit: TUniBitBtn;
    UniLabel2: TUniLabel;
    btnHelp: TUniBitBtn;
    UniDBGrid1: TUniDBGrid;
    dsriskliste: TUniDataSource;
    qriskliste: TUniQuery;
    ActList: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actSearch: TAction;
    actClose: TAction;
    lbKayitSayisi: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure edSrcTypeChange(Sender: TObject);
    procedure edSrcTextAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
  private
    { Private declarations }
  public
    procedure NewSQL;
    PROCEDURE ManageSettings;
  end;

implementation

{$R *.dfm}

uses MainModule, McMLib, Main, unHelpPage, UnRiskTanim;



procedure TfrmRistListe.actAddExecute(Sender: TObject);
begin
  if frmRiskTanim.Exec(0,Etekleme) = mrOk then RefreshQuery(qriskliste);
  ManageSettings;
end;

procedure TfrmRistListe.btnCloseClick(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrmRistListe.btnEditClick(Sender: TObject);
begin
  if qriskliste.IsEmpty then exit;

    if frmRiskTanim.Exec(qriskliste.FieldByName('id').AsInteger,EtTekDegistirme) = mrOk then RefreshQuery(qriskliste);
      ManageSettings;
end;

procedure TfrmRistListe.btnHelpClick(Sender: TObject);
begin
 // frmHelpPage.Exec('RislListe');
end;

procedure TfrmRistListe.btnSearchClick(Sender: TObject);
begin
 NewSQL;
end;

procedure TfrmRistListe.edSrcTextAjaxEvent(Sender: TComponent;
  EventName: string; Params: TUniStrings);
begin
if EventName = 'doSearch' then NewSQL;
end;

procedure TfrmRistListe.edSrcTypeChange(Sender: TObject);
begin
 NewSQL;
end;

procedure TfrmRistListe.ManageSettings;
begin
  actAdd.Enabled    := MainMod.LoginInfo.Yetkiler[195] and (qriskliste.State = dsBrowse);
  actEdit.Enabled   := MainMod.LoginInfo.Yetkiler[196] and (qriskliste.State = dsBrowse) and (qriskliste.FieldByName('id').AsInteger > 0);

  actClose.Enabled  := not DataEditing(qriskliste);
end;

procedure TfrmRistListe.NewSQL;
var
	SQLStr,
  SrcText,
	WhereStr : string;
begin
	SQLStr   := ' SELECT * FROM def_data_risk_tanim t ';

	WhereStr 	:= 't.mc_id = ' + IntToStr(MainMod.MCID) + ' AND ';

  if edSrcText.Text <> '' then
  begin
    SrcText := StringReplace(edSrcText.Text, '*', '%', [rfReplaceAll]);
    case edSrcType.ItemIndex of
      1 : WhereStr := WhereStr + 't.risk::varchar LIKE ''%'  + SrcText  + '%'' AND ';
		end;
	end;
	if Trim(WhereStr) <> '' then System.Delete(WhereStr, Length(WhereStr) - 3, 4);
	if Trim(WhereStr) <> '' then SQLStr := SQLStr + 'WHERE ' + WhereStr;
	SQLStr := SQLStr + ' ORDER BY t.risk';
	QueryOpen(qriskliste, SQLStr);

  ManageSettings;
  lbKayitSayisi.Text := IntToStr(qriskliste.RecordCount) + ' Kayýt Listelendi...';

end;

procedure TfrmRistListe.UniFrameCreate(Sender: TObject);
begin
  NewSQL;
  ManageSettings;
  edSrcText.SetFocus;
end;
initialization
  RegisterClass(TfrmRistListe);

end.
