unit unKVKKAmacTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Data.DB, MemDS, DBAccess, Uni, uniPanel, uniButton, uniBitBtn, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniCheckBox, uniDBCheckBox, uniEdit, uniDBEdit, uniLabel,
  uniGUIBaseClasses, uniMemo, uniDBMemo;

type
  TfrmKVKKAmacTanim = class(TUniForm)
    dsAmac: TUniDataSource;
    qTmp: TUniQuery;
    pnlData: TUniPanel;
    UniLabel3: TUniLabel;
    edAmac: TUniDBEdit;
    UniLabel8: TUniLabel;
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
    edDesc: TUniDBMemo;
    UniDBCheckBox1: TUniDBCheckBox;
    UniDBCheckBox2: TUniDBCheckBox;
    UniDBCheckBox3: TUniDBCheckBox;
    qAmac: TUniQuery;
    btnHelp: TUniBitBtn;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure qAmacBeforePost(DataSet: TDataSet);
  private
    YardimKw : string;
  public
    function Exec(AID, AOp: Integer): Integer;
  end;

function frmKVKKAmacTanim: TfrmKVKKAmacTanim;

implementation

uses uniGUIApplication, MainModule, McMLib, unDepartmanListe, unHelpPage;

{$R *.dfm}

function frmKVKKAmacTanim: TfrmKVKKAmacTanim;
begin
  Result := TfrmKVKKAmacTanim(MainMod.GetFormInstance(TfrmKVKKAmacTanim));
end;

procedure TfrmKVKKAmacTanim.btnCancelClick(Sender: TObject);
begin
  qAmac.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmKVKKAmacTanim.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmKVKKAmacTanim.btnPostClick(Sender: TObject);
begin
  if qAmac.FieldByName('amac').AsString = '' then
  begin
    MessageDlg('Amaç Tanýmý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edAmac.SetFocus;
    Exit;
  end;

  QueryOpen(MainMod.qTmp, 'SELECT COUNT(id) FROM def_data_amac WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' AND id<>' + IntToStr(qAmac.fieldbyname('id').AsInteger) + ' AND amac=''' + qAmac.fieldbyname('amac').AsString + '''');
  if MainMod.qTmp.Fields[0].AsInteger > 0 then
  begin
    MessageDlg('Bu isimde farklý bir amaç tanýmý bulunmaktadýr.', mtError, [mbOk]);
    Exit;
  end;

  if qAmac.State in [dsInsert] then
  begin
    qAmac.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_def_data_amac_id');
    qAmac.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    qAmac.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    qAmac.FieldByName('idt').AsDateTime   := Now;
  end;
  qAmac.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  qAmac.FieldByName('sdt').AsDateTime     := Now;
  qAmac.Post;
  ModalResult := mrOk;
end;

function TfrmKVKKAmacTanim.Exec(AID, AOp: Integer): Integer;
begin
  if AOp = 0 then // Insert
  begin
    QueryOpen(qAmac, 'SELECT * FROM def_data_amac WHERE id = 0');
    qAmac.Insert;
    qAmac.FieldByName('toplama').AsString  := 'H';
    qAmac.FieldByName('saklama').AsString  := 'H';
    qAmac.FieldByName('paylasma').AsString := 'H';
    YardimKw := 'AmacYeniKayit';
  end
  else // Edit
  begin
    QueryOpen(qAmac, 'SELECT * FROM def_data_amac WHERE id = ' + IntToStr(AID));
    qAmac.Edit;
    YardimKw := 'AmacDegistirme';
  end;

  ActiveControl := edAmac;
  Result := ShowModal;
end;

procedure TfrmKVKKAmacTanim.qAmacBeforePost(DataSet: TDataSet);
var
    ToplamaChange   : boolean;
    SaklamaChange   : boolean;
    PaylasmaChange  : boolean;
begin
  ToplamaChange := qAmac.FieldByName('toplama').NewValue <> qAmac.FieldByName('toplama').OldValue;
  SaklamaChange := qAmac.FieldByName('saklama').NewValue <> qAmac.FieldByName('saklama').OldValue;
  PaylasmaChange := qAmac.FieldByName('paylasma').NewValue <> qAmac.FieldByName('paylasma').OldValue;

  if (ToplamaChange) and (qAmac.State = dsEdit) then
    begin
      QueryOpen(qtmp,'SELECT * FROM data_envanter where  '+qAmac.FieldByName('id').AsString+'=any(string_to_array(topl_amac_ids, '','')::int[])') ;
      if qtmp.RecordCount>0 then
      begin
       if MessageDlg('Amaca ait ''Toplama'' parametresi birden fazla envanteri etkileyecektir. Yinede deðiþtirmek istiyor musunuz ?',mtConfirmation,mbYesNo) <> mrYes then
          Abort;
      end;
    end;
  if (SaklamaChange) and (qAmac.State = dsEdit) then
    begin
      QueryOpen(qtmp,'SELECT * FROM data_envanter where  '+qAmac.FieldByName('id').AsString+'=any(string_to_array(sakl_amac_ids, '','')::int[])') ;
      if qtmp.RecordCount>0 then
      begin
       if MessageDlg('Amaca ait ''Saklama'' parametresi birden fazla envanteri etkileyecektir. Yinede deðiþtirmek istiyor musunuz ?',mtConfirmation,mbYesNo) <> mrYes then
          Abort;
      end;
    end;
    if (PaylasmaChange) and (qAmac.State = dsEdit) then
    begin
      QueryOpen(qtmp,'SELECT * FROM data_envanter where  '+qAmac.FieldByName('id').AsString+'=any(string_to_array(payl_amac_ids, '','')::int[])') ;
      if qtmp.RecordCount>0 then
      begin
       if MessageDlg('Amaca ait ''Paylaþma'' parametresi birden fazla envanteri etkileyecektir. Yinede deðiþtirmek istiyor musunuz ?',mtConfirmation,mbYesNo) <> mrYes then
          Abort;
      end;
    end;
end;

procedure TfrmKVKKAmacTanim.UniFormBeforeShow(Sender: TObject);
begin
  lbIDY.Caption := MainMod.KullaniciGetir(qAmac.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(qAmac.FieldByName('sdy').AsString);

  if dsAmac.State = dsEdit then
  begin
    if lbIDY.Text = '' then lbIDY.Text := 'SÝSTEM';
    if lbSDY.Text = '' then lbSDY.Text := 'SÝSTEM';
  end;
  if qAmac.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qAmac.FieldByName('idt').AsDateTime);
  if qAmac.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qAmac.FieldByName('sdt').AsDateTime);
end;

end.
