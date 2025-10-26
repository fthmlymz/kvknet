unit unKVKKMetodTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Data.DB, MemDS, DBAccess, Uni, uniPanel, uniButton, uniBitBtn, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniCheckBox, uniDBCheckBox, uniEdit, uniDBEdit, uniLabel,
  uniGUIBaseClasses, uniMemo, uniDBMemo;

type
  TfrmKVKKMetodTanim = class(TUniForm)
    dsMetod: TUniDataSource;
    qTmp: TUniQuery;
    pnlData: TUniPanel;
    UniLabel3: TUniLabel;
    edMetod: TUniDBEdit;
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
    qMetod: TUniQuery;
    btnHelp: TUniBitBtn;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure qMetodBeforePost(DataSet: TDataSet);
  private
    YardimKw : string;
  public
    function Exec(AID, AOp: Integer): Integer;
  end;

function frmKVKKMetodTanim: TfrmKVKKMetodTanim;

implementation

uses uniGUIApplication, MainModule, McMLib, unDepartmanListe, unHelpPage;

{$R *.dfm}

function frmKVKKMetodTanim: TfrmKVKKMetodTanim;
begin
  Result := TfrmKVKKMetodTanim(MainMod.GetFormInstance(TfrmKVKKMetodTanim));
end;

procedure TfrmKVKKMetodTanim.btnCancelClick(Sender: TObject);
begin
  qMetod.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmKVKKMetodTanim.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmKVKKMetodTanim.btnPostClick(Sender: TObject);
begin
  if qMetod.FieldByName('metod').AsString = '' then
  begin
    MessageDlg('Metod Tanýmý belirtilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edMetod.SetFocus;
    Exit;
  end;

  QueryOpen(MainMod.qTmp, 'SELECT COUNT(id) FROM def_data_metod WHERE mc_id = ' + IntToStr(MainMod.MCID) + ' AND id<>' + IntToStr(qMetod.fieldbyname('id').AsInteger) + ' AND metod=''' + qMetod.fieldbyname('metod').AsString + '''');
  if MainMod.qTmp.Fields[0].AsInteger > 0 then
  begin
    MessageDlg('Bu isimde farklý bir metod tanýmý bulunmaktadýr.', mtError, [mbOk]);
    Exit;
  end;

  if qMetod.State in [dsInsert] then
  begin
    qMetod.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_def_data_metod_id');
    qMetod.FieldByName('mc_id').AsInteger  := MainMod.MCID;
    qMetod.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    qMetod.FieldByName('idt').AsDateTime   := Now;

  end;
  qMetod.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  qMetod.FieldByName('sdt').AsDateTime     := Now;
  qMetod.Post;
  ModalResult := mrOk;
end;

function TfrmKVKKMetodTanim.Exec(AID, AOp: Integer): Integer;
begin
  if AOp = 0 then // Insert
  begin
    QueryOpen(qMetod, 'SELECT * FROM def_data_metod WHERE id = 0');
    qMetod.Insert;
    //todo
    qMetod.FieldByName('saklama').AsString  := 'H';
    qMetod.FieldByName('toplama').AsString  := 'H';
    qMetod.FieldByName('paylasma').AsString := 'H';
    YardimKw := 'MetodYeniKayit';
  end
  else // Edit
  begin
    QueryOpen(qMetod, 'SELECT * FROM def_data_metod WHERE id = ' + IntToStr(AID));
    qMetod.Edit;
    YardimKw := 'MetodDegistirme';
  end;

  ActiveControl := edMetod;
  Result := ShowModal;
end;

procedure TfrmKVKKMetodTanim.qMetodBeforePost(DataSet: TDataSet);
var
    ToplamaChange   : boolean;
    SaklamaChange   : boolean;
    PaylasmaChange  : boolean;
begin
  ToplamaChange := qMetod.FieldByName('toplama').NewValue <> qMetod.FieldByName('toplama').OldValue;
  SaklamaChange := qMetod.FieldByName('saklama').NewValue <> qMetod.FieldByName('saklama').OldValue;
  PaylasmaChange := qMetod.FieldByName('paylasma').NewValue <> qMetod.FieldByName('paylasma').OldValue;

  if (ToplamaChange) and (qMetod.State = dsEdit) then
    begin
      QueryOpen(qtmp,'SELECT * FROM data_envanter where  '+qMetod.FieldByName('id').AsString+'=any(string_to_array(topl_metod_ids, '','')::int[])') ;
      if qtmp.RecordCount>0 then
      begin
       if MessageDlg('Metoda ait ''Toplama'' parametresi birden fazla envanteri etkileyecektir. Yinede deðiþtirmek istiyor musunuz ?',mtConfirmation,mbYesNo) <> mrYes then
          Abort;
      end;
    end;
  if (SaklamaChange) and (qMetod.State = dsEdit) then
    begin
      QueryOpen(qtmp,'SELECT * FROM data_envanter where  '+qMetod.FieldByName('id').AsString+'=any(string_to_array(sakl_metod_ids, '','')::int[])') ;
      if qtmp.RecordCount>0 then
      begin
       if MessageDlg('Metoda ait ''Saklama'' parametresi birden fazla envanteri etkileyecektir. Yinede deðiþtirmek istiyor musunuz ?',mtConfirmation,mbYesNo) <> mrYes then
          Abort;
      end;
    end;
    if (PaylasmaChange) and (qMetod.State = dsEdit) then
    begin
      QueryOpen(qtmp,'SELECT * FROM data_envanter where  '+qMetod.FieldByName('id').AsString+'=any(string_to_array(payl_metod_ids, '','')::int[])') ;
      if qtmp.RecordCount>0 then
      begin
       if MessageDlg('Metoda ait ''Paylaþma'' parametresi birden fazla envanteri etkileyecektir. Yinede deðiþtirmek istiyor musunuz ?',mtConfirmation,mbYesNo) <> mrYes then
          Abort;
      end;
    end;

end;

procedure TfrmKVKKMetodTanim.UniFormBeforeShow(Sender: TObject);
begin
  lbIDY.Caption := MainMod.KullaniciGetir(qMetod.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(qMetod.FieldByName('sdy').AsString);

  if dsMetod.State = dsEdit then
  begin
    if lbIDY.Text = '' then lbIDY.Text := 'SÝSTEM';
    if lbSDY.Text = '' then lbSDY.Text := 'SÝSTEM';
  end;

  if qMetod.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qMetod.FieldByName('idt').AsDateTime);
  if qMetod.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qMetod.FieldByName('sdt').AsDateTime);
end;

end.
