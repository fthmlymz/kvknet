unit unErisimYetkiListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniBasicGrid, uniDBGrid, uniDBTreeGrid, uniSplitter,
  uniGUIBaseClasses, uniPanel, System.Actions, Vcl.ActnList, uniButton, uniBitBtn, Data.DB,
  DBAccess, Uni, MemDS, uniLabel;

type
  TfrErisimYetkiListe = class(TUniFrame)
    UniPanel2: TUniPanel;
    UniPanel3: TUniPanel;
    UniSplitter1: TUniSplitter;
    grdMain: TUniDBTreeGrid;
    UniPanel1: TUniPanel;
    grdErisim: TUniDBGrid;
    pnlButtons: TUniPanel;
    btnAdd: TUniBitBtn;
    btnEdit: TUniBitBtn;
    btnDelete: TUniBitBtn;
    btnClose: TUniBitBtn;
    ActList: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actClose: TAction;
    qMain: TUniQuery;
    dsMain: TUniDataSource;
    qErisim: TUniQuery;
    dsErisim: TUniDataSource;
    UniPanel4: TUniPanel;
    UniLabel2: TUniLabel;
    UniLabel1: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    btnLog: TUniBitBtn;
    btnHelp: TUniBitBtn;
    procedure UniFrameCreate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure qMainAfterScroll(DataSet: TDataSet);
    procedure pnlButtonsAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure UniPanel3AjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure btnLogClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    DataLoading : Boolean;
    procedure DeleteControl(Sender: TComponent; Res: Integer);
    procedure NewSQL;
    procedure ManageSettings;
  public
  end;

implementation

{$R *.dfm}

uses MainModule, McMLib, Main, unErisimYetkiTanim, unRptErisimYetkiLog,
     unHelpPage;

procedure TfrErisimYetkiListe.actAddExecute(Sender: TObject);
begin
  if frmErisimYetkiTanim.Insert(qMain.FieldByName('kaynak_str').AsString, qMain.FieldByName('kisi_str').AsString,
                                qMain.FieldByName('kaynak_id').AsInteger, qMain.FieldByName('kisi_id').AsInteger) = mrOk then RefreshQuery(qErisim);
  ManageSettings;
end;

procedure TfrErisimYetkiListe.actCloseExecute(Sender: TObject);
begin
  MainForm.PgControl.ActivePage.Close;
end;

procedure TfrErisimYetkiListe.actDeleteExecute(Sender: TObject);
begin
  MessageDlg('Seçili eriþim yetki tanýmýný silmek istediðinizden emin misiniz?'#13, mtConfirmation, mbYesNo, DeleteControl);
end;

procedure TfrErisimYetkiListe.actEditExecute(Sender: TObject);
begin
  if qErisim.FieldByName('id').AsInteger < 1 then Exit;

  if frmErisimYetkiTanim.Edit(qMain.FieldByName('kaynak_str').AsString, qMain.FieldByName('kisi_str').AsString,
                              qErisim.FieldByName('id').AsInteger) = mrOk then RefreshQuery(qErisim);
  ManageSettings;
end;

procedure TfrErisimYetkiListe.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec('ErisimYetkiListe');
end;

procedure TfrErisimYetkiListe.btnLogClick(Sender: TObject);
begin
  RptErisimYetkiLog.Exec(0, qErisim.FieldByName('kaynak_id').AsInteger, qErisim.FieldByName('kisi_id').AsInteger);
end;

procedure TfrErisimYetkiListe.DeleteControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  qErisim.Delete;
  ManageSettings;
end;

procedure TfrErisimYetkiListe.ManageSettings;
begin
  actAdd.Enabled    := MainMod.LoginInfo.Yetkiler[41] and (qErisim.State = dsBrowse);
  actEdit.Enabled   := MainMod.LoginInfo.Yetkiler[42] and (qErisim.State = dsBrowse) and (qErisim.FieldByName('id').AsInteger > 0);
  actDelete.Enabled := MainMod.LoginInfo.Yetkiler[43] and (qErisim.State = dsBrowse) and (qErisim.FieldByName('id').AsInteger > 0);
  btnlog.Enabled    := MainMod.LoginInfo.Yetkiler[102];

  actClose.Enabled  := not DataEditing(qErisim);
end;

procedure TfrErisimYetkiListe.NewSQL;
begin
  qErisim.Close;
  qErisim.ParamByName('pMCID').AsInteger   := MainMod.MCID;
  qErisim.ParamByName('pKaynak').AsInteger := qMain.FieldByName('kaynak_id').AsInteger;
  qErisim.ParamByName('pKisi').AsInteger   := qMain.FieldByName('kisi_id').AsInteger;
  qErisim.Open;
  ManageSettings;
end;

procedure TfrErisimYetkiListe.pnlButtonsAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
var
  Base : Integer;
  NewW : Integer;
begin
  if EventName = 'doResize' then
  begin
    Base := pnlButtons.Width - 25;
    NewW := Trunc(Base * 0.35);
    if NewW < 250 then NewW := 250;
    grdErisim.Columns[0].Width := NewW;
    NewW := Trunc(Base * 0.35);
    if NewW < 250 then NewW := 250;
    grdErisim.Columns[1].Width := NewW;
    NewW := Trunc(Base * 0.15);
    if NewW < 100 then NewW := 100;
    grdErisim.Columns[2].Width := NewW;
    NewW := Trunc(Base * 0.15);
    if NewW < 100 then NewW := 100;
    grdErisim.Columns[3].Width := NewW;
  end;
end;

procedure TfrErisimYetkiListe.qMainAfterScroll(DataSet: TDataSet);
begin
  if DataLoading then Exit;

  NewSQL;
  ManageSettings;
end;

procedure TfrErisimYetkiListe.UniFrameCreate(Sender: TObject);
begin
  DataLoading := True;
  QueryOpen(qMain, 'SELECT env.kaynak_id, ky.kaynak AS kaynak_str, kisi_id, ks.kisi AS kisi_str ' +
                   'FROM data_envanter env ' +
                   '  LEFT JOIN def_data_kaynak ky ON env.kaynak_id = ky.id ' +
                   '  LEFT JOIN def_data_kisi ks ON env.kisi_id = ks.id ' +
                   'WHERE env.mc_id = ' + IntToStr(MainMod.MCID) + ' ' +
                   'GROUP BY env.kaynak_id, ky.kaynak, env.kisi_id, ks.kisi ' +
                   'ORDER BY ks.kisi, ky.kaynak ');
  grdMain.FullExpand;
  DataLoading := False;
  NewSQL;
  ManageSettings;
  grdMain.SetFocus;
end;

procedure TfrErisimYetkiListe.UniPanel3AjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doResize' then
  begin
    grdMain.Columns[0].Width := UniPanel3.Width - 5;
  end;
end;

initialization
  RegisterClass(TfrErisimYetkiListe);

end.

