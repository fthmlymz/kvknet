unit unVSDepartmanKayit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniEdit, uniBasicGrid, uniDBGrid, uniMemo, uniDBMemo, uniDateTimePicker,
  uniDBDateTimePicker, uniDBComboBox, uniDBEdit, uniMultiItem, uniComboBox, uniDBLookupComboBox,
  uniPageControl, uniLabel, uniButton, uniBitBtn, uniGUIBaseClasses, uniPanel, Data.DB, MemDS, DBAccess, Uni;

type
  TfrmVSDepartmanKayit = class(TUniForm)
    pnlButtons: TUniPanel;
    btnCancel: TUniBitBtn;
    btnPost: TUniBitBtn;
    UniLabel4: TUniLabel;
    lbIDY: TUniLabel;
    UniLabel5: TUniLabel;
    lbIDT: TUniLabel;
    UniLabel6: TUniLabel;
    lbSDY: TUniLabel;
    UniLabel7: TUniLabel;
    lbSDT: TUniLabel;
    PgControl: TUniPageControl;
    pgVeriSahibi: TUniTabSheet;
    UniLabel9: TUniLabel;
    UniLabel34: TUniLabel;
    edKimlikNo: TUniDBEdit;
    UniLabel13: TUniLabel;
    edAd: TUniDBEdit;
    UniLabel18: TUniLabel;
    edTel1: TUniDBEdit;
    edSoyad: TUniDBEdit;
    edTel2: TUniDBEdit;
    UniLabel21: TUniLabel;
    edAdres1: TUniDBEdit;
    edAdres2: TUniDBEdit;
    UniLabel1: TUniLabel;
    edIlce: TUniDBEdit;
    edSehir: TUniDBEdit;
    UniLabel14: TUniLabel;
    edEMail: TUniDBEdit;
    UniLabel15: TUniLabel;
    edKEP: TUniDBEdit;
    UniLabel22: TUniLabel;
    pgEkler: TUniTabSheet;
    grdDocs: TUniDBGrid;
    btnDocsAdd: TUniBitBtn;
    btnDocsDel: TUniBitBtn;
    btnDocsDown: TUniBitBtn;
    UniPanel1: TUniPanel;
    edBsTarih: TUniDBDateTimePicker;
    edBsEvrNo: TUniDBEdit;
    UniLabel10: TUniLabel;
    UniLabel8: TUniLabel;
    UniLabel3: TUniLabel;
    edBsAciklama: TUniDBMemo;
    UniLabel11: TUniLabel;
    pgDept: TUniTabSheet;
    UniLabel23: TUniLabel;
    edDeptDurum: TUniDBComboBox;
    UniLabel24: TUniLabel;
    edDeptAciklama: TUniDBMemo;
    qTmp: TUniQuery;
    qBsvDept: TUniQuery;
    dsBsvDept: TUniDataSource;
    qBsvDoc: TUniQuery;
    qBsvDocid: TIntegerField;
    qBsvDocvsb_id: TIntegerField;
    qBsvDocmc_id: TIntegerField;
    qBsvDocdept_id: TIntegerField;
    qBsvDocidy: TIntegerField;
    qBsvDocidt: TDateTimeField;
    qBsvDocsdy: TIntegerField;
    qBsvDocsdt: TDateTimeField;
    qBsvDocbelge: TBlobField;
    dsBsvDoc: TUniDataSource;
    edKisiGrubu: TUniDBEdit;
    qBasvuru: TUniQuery;
    dsBasvuru: TUniDataSource;
    edDurumu: TUniDBEdit;
    edBsSekli: TUniDBEdit;
    UniLabel2: TUniLabel;
    edKisiDetay: TUniDBMemo;
    UniLabel12: TUniLabel;
    edBSKonu: TUniDBEdit;
    qBsvDocaciklama: TStringField;
    qBsvDocbelge_adi: TStringField;
    qBsvDocdept_name: TStringField;
    qBsvDocekleyen: TStringField;
    btnHelp: TUniBitBtn;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDocsAddClick(Sender: TObject);
    procedure btnDocsDelClick(Sender: TObject);
    procedure btnDocsDownClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    YardimKw : string;
    OldOnay : String;
    BSDId   : Integer;
    procedure PrepareTables;
    procedure CloseTables;
    procedure DelDocControl(Sender: TComponent; Res: Integer);
  public
    function Edit(AID: Integer): Integer;
  end;

function frmVSDepartmanKayit: TfrmVSDepartmanKayit;

implementation

uses uniGUIApplication, MainModule, ServerModule, McMLib,
     unVSBasvuruDokumanKayit, unHelpPage;

{$R *.dfm}

function frmVSDepartmanKayit: TfrmVSDepartmanKayit;
begin
  Result := TfrmVSDepartmanKayit(MainMod.GetFormInstance(TfrmVSDepartmanKayit));
end;

procedure TfrmVSDepartmanKayit.btnCancelClick(Sender: TObject);
begin
  qBsvDept.Cancel;
  qBsvDoc.CancelUpdates;
  ModalResult := mrCancel;
end;

procedure TfrmVSDepartmanKayit.btnDocsAddClick(Sender: TObject);
begin
  frmVSBasvuruDokumanKayit.Exec(qBsvDoc, 0, qBsvDept.FieldByName('vsb_id').AsInteger, qBsvDept.FieldByName('dept_id').AsInteger);
end;

procedure TfrmVSDepartmanKayit.btnDocsDelClick(Sender: TObject);
var
  Msg : String;
begin
  if not MainMod.LoginInfo.Yetkiler[115] then
  begin
    MessageDlg('Doküman silme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if qBsvDoc.FieldByName('id').AsInteger < 1 then Exit;
  if qBsvDoc.FieldByName('dept_id').AsInteger <> qBsvDept.FieldByName('id').AsInteger then
  begin
    MessageDlg('Seçmiþ olduðunuz doküman sizin departmanýnýz tarafýndan eklenmemiþ, baþka bir departmana ait. Silemezsiniz.', mtError, [mbOk]);
    Exit;
  end;

  Msg := 'Listeden seçili dokümaný çýkartmak istediðinizden emin misiniz?';
  MessageDlg(Msg, mtConfirmation, mbYesNo, DelDocControl);
end;

procedure TfrmVSDepartmanKayit.btnDocsDownClick(Sender: TObject);
var
  AStream : TMemoryStream;
begin
  if not MainMod.LoginInfo.Yetkiler[116] then
  begin
    MessageDlg('Ýlgili Kiþi Baþvuru Formlarýndan, Doküman indirme yetkiniz yok.', mtError, [mbOk]);
    Exit;
  end;

  if qBsvDoc.FieldByName('id').AsInteger < 1 then Exit;

  AStream := TMemoryStream.Create;
  try
    TBlobField(qBsvDoc.FieldByName('belge')).SaveToStream(AStream);
    UniSession.SendStream(AStream, qBsvDoc.FieldByName('belge_adi').AsString);
  finally
    AStream.Free;
  end;
end;

procedure TfrmVSDepartmanKayit.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmVSDepartmanKayit.btnPostClick(Sender: TObject);
var
  CanMail : Boolean;
begin
//  to do : Bu deðerlendirilecek
//  if qBsvDept.FieldByName('onay').AsString = 'ONAYLANDI' then
//  begin
//    if Length(qBsvDept.FieldByName('aciklama').AsString) < 100 then
//    begin
//      MessageDlg('Departman görüþü veya deðerlendirmesi olarak en az 100 karakter bilgi girmelisiniz.', mtError, [mbOk]);
//      PgControl.ActivePage := pgDept;
//      edDeptAciklama.SetFocus;
//      Exit;
//    end;
//  end;

  CanMail := (qBsvDept.FieldByName('onay').AsString <> OldOnay) and (qBsvDept.FieldByName('onay').AsString = 'ONAYLANDI');

  qBsvDept.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  qBsvDept.FieldByName('sdt').AsDateTime     := Now;
  qBsvDept.Post;

  try
    MainMod.DBMain.StartTransaction;
    qBsvDoc.ApplyUpdates();
    qBsvDoc.CommitUpdates;
    MainMod.DBMain.Commit;
  except
    qBsvDoc.CancelUpdates;
    MainMod.DBMain.Rollback;
  end;

  if CanMail then
  begin
    // to do : Veri Temsilcisine Mail gönder
  end;

  ModalResult := mrOk;
end;

procedure TfrmVSDepartmanKayit.CloseTables;
begin
  qTmp.Close;
  qBsvDoc.Close;
  qBasvuru.Close;
  qBsvDept.Close;
end;

procedure TfrmVSDepartmanKayit.DelDocControl(Sender: TComponent; Res: Integer);
begin
  if Res <> mrYes then Exit;

  qBsvDoc.Delete;
end;

function TfrmVSDepartmanKayit.Edit(AID: Integer): Integer;
begin
  BSDId := AID;
  PrepareTables;
  OldOnay := qBsvDept.FieldByName('onay').AsString;
  qBsvDept.Edit;
  YardimKw := 'VSDepartmanDegistirme';
  Result := ShowModal;
  CloseTables;
end;

procedure TfrmVSDepartmanKayit.PrepareTables;
begin
  QueryOpen(qBsvDept, 'SELECT * FROM data_vsbasvuru_dept WHERE id = ' + IntToStr(BSDId) + ' ORDER BY id');
  QueryOpen(qBsvDoc,
    'SELECT bsd.*, ' +
    ' (case when COALESCE(dp.main_dept_id,0) > 0 THEN  dp.title||'' (''||dp_main.title||'') '' else dp.title end)::character varying(410) AS dept_name, ' +
//    ' dp.title as dept_name, ' +
    ' us.full_name as ekleyen ' +
    'FROM data_vsbasvuru_docs bsd ' +
    '  LEFT JOIN sys_deptdef dp ON dp.id = bsd.dept_id ' +
    '  LEFT JOIN sys_deptdef dp_main on dp_main.id = dp.main_dept_id ' +
    '  LEFT JOIN usr_user us ON us.id = bsd.idy ' +
    'WHERE bsd.mc_id = ' + IntToStr(MainMod.MCID) + ' AND bsd.vsb_id = ' +
    qBsvDept.FieldByName('vsb_id').AsString + ' ORDER BY bsd.id');
  QueryOpen(qBasvuru, 'SELECT bsv.*, kg.kisi AS kisi_grubu ' +
                      'FROM data_vsbasvuru bsv ' +
                      '  LEFT JOIN def_data_kisi kg ON kg.id = bsv.kg_id ' +
                      'WHERE bsv.mc_id = ' + IntToStr(MainMod.MCID) + ' AND bsv.id = ' +
                      qBsvDept.FieldByName('vsb_id').AsString + ' ORDER BY bsv.id');
end;

procedure TfrmVSDepartmanKayit.UniFormBeforeShow(Sender: TObject);
begin
  PgControl.ActivePage := pgDept;
  lbIDY.Caption := MainMod.KullaniciGetir(qBsvDept.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(qBsvDept.FieldByName('sdy').AsString);

  if dsBsvDept.State = dsEdit then
  begin
    if lbIDY.Text = '' then lbIDY.Text := 'SÝSTEM';
    if lbSDY.Text = '' then lbSDY.Text := 'SÝSTEM';
  end;

  if qBsvDept.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qBsvDept.FieldByName('idt').AsDateTime);
  if qBsvDept.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qBsvDept.FieldByName('sdt').AsDateTime);
end;

end.
