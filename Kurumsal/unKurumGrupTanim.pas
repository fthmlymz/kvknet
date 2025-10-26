unit unKurumGrupTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Data.DB, DBAccess, Uni,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uniMultiItem, uniComboBox, uniDBComboBox,
  uniEdit, uniDBEdit, uniLabel, uniButton, uniBitBtn, uniGUIBaseClasses, uniPanel, uniCheckBox, uniDBCheckBox;

type
  TfrmKurumGrupTanim = class(TUniForm)
    btnEdit: TUniBitBtn;
    btnPost: TUniBitBtn;
    btnCancel: TUniBitBtn;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    edCode: TUniDBEdit;
    edTitle: TUniDBEdit;
    dsGCDef: TUniDataSource;
    pnlLog: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    lbIDY: TUniLabel;
    lbIDT: TUniLabel;
    lbSDY: TUniLabel;
    lbSDT: TUniLabel;
    pnlButtons: TUniPanel;
    UniPanel1: TUniPanel;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    Data : TUniQuery;
    procedure ManageSettings;
  public
  end;

function frmKurumGrupTanim: TfrmKurumGrupTanim;

implementation

uses
  uniGUIApplication, MainModule, McMLib;

{$R *.dfm}

function frmKurumGrupTanim: TfrmKurumGrupTanim;
begin
  Result := TfrmKurumGrupTanim(MainMod.GetFormInstance(TfrmKurumGrupTanim));
end;

{ TfrmKurumGrupTanim }

procedure TfrmKurumGrupTanim.btnCancelClick(Sender: TObject);
begin
  if btnCancel.Caption = 'Ýptal' then
  begin
    Data.Cancel;
    ManageSettings;
  end
  else
  begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmKurumGrupTanim.btnEditClick(Sender: TObject);
begin
  if Data.FieldByName('active').AsString <> 'E' then
  begin
    if not MainMod.LoginInfo.Yetkiler[5] then
    begin
      MessageDlg('Deðiþtirmek istediðiniz kayýt PASÝF yapýlmýþ. Bu kaydý deðiþtirme yetkiniz yok.', mtError, [mbOk]);
      Exit;
    end;
  end;

  Data.Edit;
  ManageSettings;
  edTitle.SetFocus;
end;

procedure TfrmKurumGrupTanim.btnPostClick(Sender: TObject);
begin
  Data.FieldByName('sdy').AsInteger  := MainMod.LoginInfo.ID;
  Data.FieldByName('sdt').AsDateTime := Now;
  Data.Post;
  ManageSettings;
end;

procedure TfrmKurumGrupTanim.ManageSettings;
begin
  // btnEdit.Enabled     := MainMod.LoginInfo.Yetkiler[2] and (Data.State = dsBrowse) and (Data.FieldByName('id').AsInteger > 0);
  btnPost.Enabled     := DataEditing(Data);

  if btnPost.Enabled then
  begin
    btnCancel.Caption := 'Ýptal';
//    btnCancel.ImageIndex := 2;
  end
  else
  begin
    btnCancel.Caption := 'Kapat';
//    btnCancel.ImageIndex := 3;
  end;
end;

procedure TfrmKurumGrupTanim.UniFormBeforeShow(Sender: TObject);
begin
  Data := MainMod.qGCDef;
  ManageSettings;
  lbIDY.Caption := MainMod.KullaniciGetir(Data.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(Data.FieldByName('sdy').AsString);

  if lbIDY.Text = '' then lbIDY.Text := 'SÝSTEM';
  if lbSDY.Text = '' then lbSDY.Text := 'SÝSTEM';

  if Data.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', Data.FieldByName('idt').AsDateTime);
  if Data.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', Data.FieldByName('sdt').AsDateTime);
end;

end.
