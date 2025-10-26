unit unUnvanTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniButton, uniBitBtn, uniEdit, uniMemo, uniDBMemo, uniDBEdit,
  uniLabel, uniGUIBaseClasses, uniCheckBox, uniDBCheckBox, Data.DB, DBAccess, Uni, MemDS;

type
  TfrmUnvanTanim = class(TUniForm)
    pnlData: TUniPanel;
    UniLabel2: TUniLabel;
    Aktif: TUniLabel;
    edUnvan: TUniDBEdit;
    UniLabel3: TUniLabel;
    edDept: TUniEdit;
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
    edActive: TUniDBCheckBox;
    qTitle: TUniQuery;
    dsTitle: TUniDataSource;
    qTmp: TUniQuery;
    btnHelp: TUniBitBtn;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    DepartmanId :integer;
    YardimKw : string;
    function CheckSameTitle(ATitle: String): Boolean;
  public
    function Edit(TID: Integer; AText: String): Integer;
    function Insert(DID: Integer; AText: String): Integer;
  end;

function frmUnvanTanim: TfrmUnvanTanim;

implementation

uses uniGUIApplication, MainModule, McMLib, unUnvanListe, unHelpPage;

{$R *.dfm}

function frmUnvanTanim: TfrmUnvanTanim;
begin
  Result := TfrmUnvanTanim(MainMod.GetFormInstance(TfrmUnvanTanim));
end;

procedure TfrmUnvanTanim.btnCancelClick(Sender: TObject);
begin
  qTitle.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmUnvanTanim.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmUnvanTanim.btnPostClick(Sender: TObject);
begin
  if qTitle.FieldByName('title').AsString = '' then
  begin
    MessageDlg('Ünvan belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edUnvan.SetFocus;
    Exit;
  end;
  if CheckSameTitle(qTitle.FieldByName('title').AsString) then
  begin
    MessageDlg('Ayný Ünvan daha önce tanýmlanmýþ. Tekrar tanýmlanamaz. Lütfen kontrol ediniz.', mtError, [mbOk]);
    Exit;
  end;
  
  if qTitle.FieldByName('active').AsString = '' then
  begin
    MessageDlg('Ünvan Durumu belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edActive.SetFocus;
    Exit;
  end;

  if qTitle.State in [dsInsert] then
  begin
    qTitle.FieldByName('id').AsInteger      := MainMod.GetSeq('sq_sys_titledef_id');
    qTitle.FieldByName('mc_id').AsInteger   := MainMod.MCID;
    qTitle.FieldByName('idy').AsInteger     := MainMod.LoginInfo.ID;
    qTitle.FieldByName('idt').AsDateTime    := Now;
  end;
  qTitle.FieldByName('sdy').AsInteger       := MainMod.LoginInfo.ID;
  qTitle.FieldByName('sdt').AsDateTime      := Now;
  qTitle.Post;
  ModalResult := mrOk;
end;

function TfrmUnvanTanim.CheckSameTitle(ATitle: String): Boolean;
begin
  Result := False;
  QueryOpen(qTmp, 'SELECT * FROM sys_titledef WHERE active = ''E'' AND mc_id = ' +
     IntToStr(MainMod.MCID) + ' AND title = ''' + ATitle + ''' ' +
     ' and dept_id= ' + IntToStr(DepartmanId) + ' and id <> '+
     inttostr( strtointdef( qTitle.FieldByName('id').AsString,0)) );
  if qTmp.FieldByName('id').AsInteger > 0 then Result := True;
end;

function TfrmUnvanTanim.Edit(TID: Integer; AText: String): Integer;
begin
  edDept.Text := AText;

  QueryOpen(mainmod.qTmp, ' SELECT id FROM sys_deptdef where  mc_id=' +
    inttostr(mainmod.MCID)+ ' and title =' + QuotedStr(AText)  ) ;


  DepartmanId := StrToIntDef(mainmod.qTmp.FieldByName('id').AsString,0);

  QueryOpen(qTitle, 'SELECT * FROM sys_titledef WHERE id = ' + IntToStr(TID));
  qTitle.Edit;
  ActiveControl := edUnvan;
  YardimKw := 'UnvanTanimDegistirme';
  Result := ShowModal;
end;

function TfrmUnvanTanim.Insert(DID: Integer; AText: String): Integer;
begin
  edDept.Text := AText;
  QueryOpen(qTitle, 'SELECT * FROM sys_titledef WHERE id = 0');
  qTitle.Insert;
  qTitle.FieldByName('active').AsString   := 'E';
  qTitle.FieldByName('dept_id').AsInteger := DID;
  ActiveControl := edUnvan;
  YardimKw := 'UnvanTanimYeniKayit';
  Result := ShowModal;
end;

procedure TfrmUnvanTanim.UniFormBeforeShow(Sender: TObject);
begin
  lbIDY.Caption := MainMod.KullaniciGetir(qTitle.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(qTitle.FieldByName('sdy').AsString);
  if qTitle.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qTitle.FieldByName('idt').AsDateTime);
  if qTitle.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qTitle.FieldByName('sdt').AsDateTime);
end;

end.
