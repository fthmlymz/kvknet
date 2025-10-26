unit unEnvanterChecklistTopluIslem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, DateUtils,
  uniGUIClasses, uniGUIForm, Data.DB, DBAccess, Uni, MemDS, uniPanel, uniButton, uniBitBtn, uniEdit,
  uniMemo, uniDBMemo, uniDBEdit, uniLabel, uniGUIBaseClasses,
  uniBasicGrid, uniDBGrid, VirtualTable, uniDBNavigator, uniCheckBox,
  uniGroupBox, VirtualQuery;

type
  TfrmEnvanterChecklistTopluIslem = class(TUniForm)
    pnlButtons: TUniPanel;
    btnCancel: TUniBitBtn;
    qTmp: TUniQuery;
    dsKontrol: TUniDataSource;
    pnlLog: TUniContainerPanel;
    grd: TUniDBGrid;
    btnListele: TUniBitBtn;
    UniPanel1: TUniPanel;
    UniDBNavigator1: TUniDBNavigator;
    UniGroupBox1: TUniGroupBox;
    UniLabel9: TUniLabel;
    UniLabel1: TUniLabel;
    cbEnvanterAktif: TUniCheckBox;
    cbEnvanterPasif: TUniCheckBox;
    UniGroupBox2: TUniGroupBox;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    cbKontrolAktif: TUniCheckBox;
    cbKontrolPasif: TUniCheckBox;
    tblKontrol: TVirtualTable;
    qKontrol: TVirtualQuery;
    btnEnvanterAc: TUniBitBtn;
    procedure btnListeleClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnEnvanterAcClick(Sender: TObject);
    procedure grdDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
  private
    procedure PrepKontrolKaynakKisiDetay;
  public
    function Exec: Integer;
  end;

function frmEnvanterChecklistTopluIslem: TfrmEnvanterChecklistTopluIslem;

implementation

uses uniGUIApplication, MainModule, McMLib, unErisimYetkiListe, ServerModule;

{$R *.dfm}

function frmEnvanterChecklistTopluIslem: TfrmEnvanterChecklistTopluIslem;
begin
  Result := TfrmEnvanterChecklistTopluIslem(MainMod.GetFormInstance(TfrmEnvanterChecklistTopluIslem));
end;


procedure TfrmEnvanterChecklistTopluIslem.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmEnvanterChecklistTopluIslem.btnEnvanterAcClick(Sender: TObject);
var
  ids: String;
begin
  ids := '';
  tblKontrol.First;
  while not tblKontrol.Eof do
  begin
    ids := ids + tblKontrol.FieldByName('env_id').AsString + ',';
  end;
end;

procedure TfrmEnvanterChecklistTopluIslem.btnListeleClick(Sender: TObject);
begin
  PrepKontrolKaynakKisiDetay;
end;

function TfrmEnvanterChecklistTopluIslem.Exec: Integer;
begin
  ShowModal;
end;

procedure TfrmEnvanterChecklistTopluIslem.grdDrawColumnCell(Sender: TObject;
  ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if (ACol = 0) or (ACol = 1) then
  begin
    if qKontrol.FieldByName('durum').AsInteger = 1 then Attribs.Color := $00E1E1FF; // Sadece Envanter
    if qKontrol.FieldByName('durum').AsInteger = 2 then Attribs.Color := clInfoBk;  // Sadece Kontrol
    if qKontrol.FieldByName('durum').AsInteger = 3 then                             // Hepsi
    begin
      if qKontrol.FieldByName('chl_kilitli').AsString = 'E' then
        Attribs.Color := clInfoBk
      else
        Attribs.Color := $E0E0C0;
    end;
  end;
end;

procedure TfrmEnvanterChecklistTopluIslem.PrepKontrolKaynakKisiDetay;
var
  Found : Boolean;
  SayEnv ,
  SayKnt ,
  SayHep : Integer;
  actSql : String;
begin
  SayEnv := 0;
  SayKnt := 0;
  SayHep := 0;
  if tblKontrol.Active = false then
    tblKontrol.Active := true;
  tblKontrol.DisableControls;
  tblKontrol.First;
  while not tblKontrol.EOF do tblKontrol.Delete;

  actSql := '';
  if cbEnvanterAktif.Checked then
  begin
    if cbEnvanterPasif.Checked = false then
    begin
      actSql := 'env.active = ''E'' AND ';
    end;
  end
  else
  begin
    if cbEnvanterPasif.Checked then
    begin
      actSql := 'env.active = ''H'' AND ';
    end
    else
    begin
      cbEnvanterAktif.Checked := true;
      cbEnvanterPasif.Checked := true;
    end;
  end;

  QueryOpen(qTmp, 'SELECT DISTINCT env.id env_id, kaynak as kaynak_str, kisi as kisi_str, env.active env_active ' +
                  'FROM data_envanter env LEFT JOIN def_data_kaynak ky ON env.kaynak_id=ky.id LEFT JOIN def_data_kisi ks on env.kisi_id=ks.id ' +
                  'WHERE ' + actSql + ' env.main_id = 0 AND env.mc_id = ' +
                  IntToStr(MainMod.MCID) + ' ORDER BY 2, 1');
  while not qTmp.EOF do
  begin
    tblKontrol.Append;
    tblKontrol.FieldByName('kaynak_str').AsString := qTmp.FieldByName('kaynak_str').AsString;
    tblKontrol.FieldByName('kisi_str').AsString   := qTmp.FieldByName('kisi_str').AsString;
    tblKontrol.FieldByName('env_id').AsInteger    := qTmp.FieldByName('env_id').AsInteger;
    tblKontrol.FieldByName('env_var').AsString    := 'E';
    tblKontrol.FieldByName('chl_var').AsString    := 'H';
    tblKontrol.FieldByName('env_active').AsString := qTmp.FieldByName('env_active').AsString;
    tblKontrol.FieldByName('durum').AsInteger     := 1;
    tblKontrol.Post;
    SayEnv := SayEnv + 1;

    qTmp.Next;
  end;

  actSql := '';
  if cbKontrolAktif.Checked then
  begin
    if cbKontrolPasif.Checked = false then
    begin
      actSql := 'cl.active = ''E'' AND ';
    end;
  end
  else
  begin
    if cbKontrolPasif.Checked then
    begin
      actSql := 'cl.active = ''H'' AND ';
    end
    else
    begin
      cbKontrolAktif.Checked := true;
      cbKontrolPasif.Checked := true;
    end;
  end;

  QueryOpen(qTmp, 'SELECT DISTINCT cl.id chl_id, ky.kaynak as kaynak_str, ks.kisi as kisi_str, cl.active chl_active, cl.kilitli chl_kilitli ' +
                  'FROM data_checklist cl LEFT JOIN def_data_kaynak ky ON cl.kaynak_id=ky.id LEFT JOIN def_data_kisi ks on cl.kisi_id=ks.id ' +
                  'WHERE ' + actSql + ' cl.mc_id = ' +
                  IntToStr(MainMod.MCID) + ' ORDER BY 1, 2');
  while not qTmp.EOF do
  begin
    Found := False;
    tblKontrol.First;
    while not tblKontrol.EOF do
    begin
      if (qTmp.FieldByName('kaynak_str').AsString = tblKontrol.FieldByName('kaynak_str').AsString) and
         (qTmp.FieldByName('kisi_str').AsString = tblKontrol.FieldByName('kisi_str').AsString) then
      begin
        tblKontrol.Edit;
        tblKontrol.FieldByName('chl_var').AsString     := 'E';
        tblKontrol.FieldByName('chl_active').AsString  := qTmp.FieldByName('chl_active').AsString;
        tblKontrol.FieldByName('chl_kilitli').AsString := qTmp.FieldByName('chl_kilitli').AsString;
        tblKontrol.FieldByName('chl_id').AsInteger     := qTmp.FieldByName('chl_id').AsInteger;
        tblKontrol.FieldByName('durum').AsInteger      := 3;
        tblKontrol.Post;
        SayHep := SayHep + 1;
        SayEnv := SayEnv - 1;
        Found := True;
        Break;
      end;

      tblKontrol.Next;
    end;

    if not Found then
    begin
      tblKontrol.Append;
      tblKontrol.FieldByName('kaynak_str').AsString  := qTmp.FieldByName('kaynak_str').AsString;
      tblKontrol.FieldByName('kisi_str').AsString    := qTmp.FieldByName('kisi_str').AsString;
      tblKontrol.FieldByName('env_var').AsString     := 'H';
      tblKontrol.FieldByName('chl_var').AsString     := 'E';
      tblKontrol.FieldByName('chl_active').AsString  := qTmp.FieldByName('chl_active').AsString;
      tblKontrol.FieldByName('chl_kilitli').AsString := qTmp.FieldByName('chl_kilitli').AsString;
      tblKontrol.FieldByName('chl_id').AsInteger     := qTmp.FieldByName('chl_id').AsInteger;
      tblKontrol.FieldByName('durum').AsInteger      := 2;
      tblKontrol.Post;
      SayKnt := SayKnt + 1;
    end;

    qTmp.Next;
  end;

  tblKontrol.EnableControls;
  qKontrol.Close;
  qKontrol.Open;

//  serKontrol.Clear;
//  serKontrol.Add(SayEnv, IntToStr(SayEnv));
//  serKontrol.Add(SayKnt, IntToStr(SayKnt));
//  serKontrol.Add(SayHep, IntToStr(SayHep));
end;

end.
