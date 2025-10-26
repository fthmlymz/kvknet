unit unErisimYetkiTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Data.DB, DBAccess, Uni, MemDS, uniPanel, uniButton, uniBitBtn, uniEdit,
  uniMemo, uniDBMemo, uniDBEdit, uniLabel, uniGUIBaseClasses, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniGroupBox, uniRadioGroup, uniDBRadioGroup;

type
  TfrmErisimYetkiTanim = class(TUniForm)
    pnlData: TUniPanel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    edKaynak: TUniEdit;
    pnlButtons: TUniPanel;
    btnCancel: TUniBitBtn;
    btnPost: TUniBitBtn;
    pnlLog: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    lbIDY: TUniLabel;
    lbIDT: TUniLabel;
    lbSDY: TUniLabel;
    lbSDT: TUniLabel;
    qErisim: TUniQuery;
    dsErisim: TUniDataSource;
    UniLabel1: TUniLabel;
    edKisi: TUniEdit;
    UniLabel8: TUniLabel;
    edDept: TUniDBLookupComboBox;
    edTitle: TUniDBLookupComboBox;
    qDept: TUniQuery;
    dsDept: TUniDataSource;
    qTitle: TUniQuery;
    dsTitle: TUniDataSource;
    rgFiziksel: TUniDBRadioGroup;
    rgSanal: TUniRadioGroup;
    cbSanalYetki: TUniComboBox;
    qTmp: TUniQuery;
    btnLog: TUniBitBtn;
    btnHelp: TUniBitBtn;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edDeptChange(Sender: TObject);
    procedure rgSanalChangeValue(Sender: TObject);
    procedure rgSanalAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure btnLogClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    YardimKw : string;
    function CheckSameTitle(DID, TID, KyID, KsID: Integer): Boolean;
    procedure SetPerms;
    procedure GetPerms;
  public
    function Edit(AKaynak, AKisi: String; AID: Integer): Integer;
    function Insert(AKaynak, AKisi: String; KaynakID, KisiID: Integer): Integer;
  end;

function frmErisimYetkiTanim: TfrmErisimYetkiTanim;

implementation

uses uniGUIApplication, MainModule, McMLib, unErisimYetkiListe,
  unRptErisimYetkiLog, unHelpPage;

{$R *.dfm}

function frmErisimYetkiTanim: TfrmErisimYetkiTanim;
begin
  Result := TfrmErisimYetkiTanim(MainMod.GetFormInstance(TfrmErisimYetkiTanim));
end;

procedure TfrmErisimYetkiTanim.btnCancelClick(Sender: TObject);
begin
  qTitle.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmErisimYetkiTanim.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmErisimYetkiTanim.btnLogClick(Sender: TObject);
begin
  RptErisimYetkiLog.Exec(qErisim.FieldByName('id').AsInteger, 0, 0);
//  RptErisimYetkiLog.Exec(0, qErisim.FieldByName('kaynak_id').AsInteger, qErisim.FieldByName('kisi_id').AsInteger);
end;

procedure TfrmErisimYetkiTanim.btnPostClick(Sender: TObject);
begin
//  if qErisim.FieldByName('dept_id').AsInteger < 1 then
  if edDept.Text = '' then
  begin
    MessageDlg('Departman belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);

    Exit;
  end;
//  if qErisim.FieldByName('title_id').AsInteger < 1 then
  if edTitle.Text = '' then
  begin
    MessageDlg('Ünvan belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    Exit;

  end;
  GetPerms;


  if qErisim.State in [dsInsert] then
  begin
    if CheckSameTitle(qErisim.FieldByName('dept_id').AsInteger, qErisim.FieldByName('title_id').AsInteger,
                      qErisim.FieldByName('kaynak_id').AsInteger, qErisim.FieldByName('kisi_id').AsInteger) then
    begin
      MessageDlg('Ayný Ünvan için daha önce yetki tanýmlanmýþ. Tekrar tanýmlanamaz. Lütfen kontrol ediniz.', mtError, [mbOk]);
      Exit;
    end;
    qErisim.FieldByName('id').AsInteger         := MainMod.GetSeq('sq_data_access_id');
    qErisim.FieldByName('mc_id').AsInteger      := MainMod.MCID;
    qErisim.FieldByName('idy').AsInteger        := MainMod.LoginInfo.ID;
    qErisim.FieldByName('idt').AsDateTime       := Now;
  end;
  qErisim.FieldByName('sdy').AsInteger          := MainMod.LoginInfo.ID;
  qErisim.FieldByName('sdt').AsDateTime         := Now;
  qErisim.Post;
  ModalResult := mrOk;
end;

function TfrmErisimYetkiTanim.CheckSameTitle(DID, TID, KyID, KsID: Integer): Boolean;
begin
  Result := False;
  QueryOpen(qTmp, 'SELECT * FROM data_access WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' AND dept_id = ' + IntToStr(DID) +
                  ' AND title_id = ' + IntToStr(TID) + ' AND kaynak_id = ' + IntToStr(KyID) + ' AND kisi_id = ' + IntToStr(KsID));
  if qTmp.FieldByName('id').AsInteger > 0 then Result := True;
end;

procedure TfrmErisimYetkiTanim.edDeptChange(Sender: TObject);
var
  sTmp : String;
begin
  if not DataEditing(qErisim) then Exit;

  sTmp := qErisim.FieldByName('dept_id').AsString;
  if sTmp = '' then sTmp := '0';
  QueryOpen(qTitle, 'SELECT id, title FROM sys_titledef WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) +
                    ' AND dept_id = ' + sTmp + ' ORDER BY title');

  edTitle.ItemIndex := -1;
end;

function TfrmErisimYetkiTanim.Edit(AKaynak, AKisi: String; AID: Integer): Integer;
begin
  edKaynak.Text := AKaynak;
  edKisi.Text   := AKisi;
//  edDept.ReadOnly  := true;
//  edTitle.ReadOnly := true;

  QueryOpen(qErisim, 'SELECT * FROM data_access WHERE id = ' + IntToStr(AID));


  QueryOpen(qDept,  'SELECT dp.id,' +
                    ' (case when coalesce(dp.main_dept_id,0) > 0 then dp.title||'' (''||dp_main.title||'') '' ' +
                    ' else dp.title end)::varchar(450) as title ' +
                    ' FROM sys_deptdef dp left join sys_deptdef dp_main on dp_main.id = dp.main_dept_id ' +
                    ' WHERE dp.active = ''E'' AND dp.mc_id = ' +
                    IntToStr(MainMod.MCID) + ' ORDER BY dp.title');

  qErisim.Edit;
  edDeptChange(edDept);
  SetPerms;
  ActiveControl := edDept;
  YardimKw := 'ErisimYetkiDegistirme';
  Result := ShowModal;
end;

procedure TfrmErisimYetkiTanim.GetPerms;
begin
  if rgSanal.ItemIndex <= 0 then
  begin
    qErisim.FieldByName('perms').AsString := 'YOK';
  end
  else if rgSanal.ItemIndex = 1 then
  begin
    if cbSanalYetki.ItemIndex = 0 then qErisim.FieldByName('perms').AsString := 'G';
    if cbSanalYetki.ItemIndex = 1 then qErisim.FieldByName('perms').AsString := 'G-D';
    if cbSanalYetki.ItemIndex = 2 then qErisim.FieldByName('perms').AsString := 'G-D-S';
  end;
end;

function TfrmErisimYetkiTanim.Insert(AKaynak, AKisi: String; KaynakID, KisiID: Integer): Integer;
begin
  edKaynak.Text := AKaynak;
  edKisi.Text   := AKisi;
//  edDept.ReadOnly  := false;
//  edTitle.ReadOnly := false;

  QueryOpen(qErisim, 'SELECT * FROM data_access WHERE id = 0');

  QueryOpen(qDept,  'SELECT dp.id,' +
                    ' (case when coalesce(dp.main_dept_id,0) > 0 then dp.title||'' (''||dp_main.title||'') '' ' +
                    ' else dp.title end)::varchar(450) as title ' +
                    ' FROM sys_deptdef dp left join sys_deptdef dp_main on dp_main.id = dp.main_dept_id ' +
                    ' WHERE dp.active = ''E'' AND dp.mc_id = ' +
                    IntToStr(MainMod.MCID) + ' ORDER BY dp.title');

//  QueryOpen(qDept, 'SELECT id, title FROM sys_deptdef WHERE active = ''E'' AND mc_id = ' + IntToStr(MainMod.MCID) + ' ORDER BY title');

  qErisim.Insert;
  qErisim.FieldByName('kaynak_id').AsInteger := KaynakID;
  qErisim.FieldByName('kisi_id').AsInteger   := KisiID;
  qErisim.FieldByName('permf').AsString      := 'YOK';
  qErisim.FieldByName('perms').AsString      := 'YOK';
  edDeptChange(edDept);
  SetPerms;
  ActiveControl := edDept;
  YardimKw := 'ErisimYetkiYeniKayit';
  Result := ShowModal;
end;

procedure TfrmErisimYetkiTanim.rgSanalAjaxEvent(Sender: TComponent; EventName: string;
  Params: TUniStrings);
begin
  if EventName = 'doChange' then
  begin
    cbSanalYetki.Enabled := rgSanal.ItemIndex = 1;
  end;
end;

procedure TfrmErisimYetkiTanim.rgSanalChangeValue(Sender: TObject);
begin
  cbSanalYetki.Enabled := rgSanal.ItemIndex = 1;
end;

procedure TfrmErisimYetkiTanim.SetPerms;
begin
  if qErisim.FieldByName('perms').AsString = 'YOK' then
  begin
    rgSanal.ItemIndex := 0;
    cbSanalYetki.ItemIndex := 0;
  end
  else
  begin
    rgSanal.ItemIndex := 1;
    if qErisim.FieldByName('perms').AsString = 'G' then cbSanalYetki.ItemIndex := 0;
    if qErisim.FieldByName('perms').AsString = 'G-D' then cbSanalYetki.ItemIndex := 1;
    if qErisim.FieldByName('perms').AsString = 'G-D-S' then cbSanalYetki.ItemIndex := 2;
  end;
  rgSanalChangeValue(rgSanal);
end;

procedure TfrmErisimYetkiTanim.UniFormBeforeShow(Sender: TObject);
begin
  lbIDY.Caption := MainMod.KullaniciGetir(qErisim.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(qErisim.FieldByName('sdy').AsString);

  if dsErisim.State = dsEdit then
  begin
    if lbIDY.Text = '' then lbIDY.Text := 'SÝSTEM';
    if lbSDY.Text = '' then lbSDY.Text := 'SÝSTEM';
  end;

  if qErisim.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qErisim.FieldByName('idt').AsDateTime);
  if qErisim.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qErisim.FieldByName('sdt').AsDateTime);
  btnlog.Enabled := MainMod.LoginInfo.Yetkiler[102];
end;

end.
