unit unHelpTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniButton, uniBitBtn, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses,
  uniMemo, uniDBMemo, Data.DB, DBAccess, Uni, MemDS, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDateTimePicker, uniDBDateTimePicker, uniHTMLMemo,
  uniDBLookupComboBox;

type
  TfrmHelpTanim = class(TUniForm)
    pnlData: TUniPanel;
    UniLabel9: TUniLabel;
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
    qHelp: TUniQuery;
    dsHelp: TUniDataSource;
    qTmp: TUniQuery;
    UniLabel2: TUniLabel;
    edTitle: TUniDBMemo;
    btnPreview: TUniBitBtn;
    UniLabel3: TUniLabel;
    edFormAdi: TUniDBComboBox;
    UniLabel8: TUniLabel;
    edHtml: TUniHTMLMemo;
    UniDBEdit1: TUniDBEdit;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
  private
    procedure ManageSettings;
  public
    function Exec(AID, AOp: Integer): Integer;
  end;

function frmHelpTanim: TfrmHelpTanim;

implementation

uses uniGUIApplication, MainModule, McMLib, unHelpPage;

{$R *.dfm}

function frmHelpTanim: TfrmHelpTanim;
begin
  Result := TfrmHelpTanim(MainMod.GetFormInstance(TfrmHelpTanim));
end;

procedure TfrmHelpTanim.btnCancelClick(Sender: TObject);
begin
  qHelp.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmHelpTanim.btnPostClick(Sender: TObject);
var
  sTmp : String;
begin
  qHelp.FieldByName('description').AsString := edhtml.Text;

  if qHelp.FieldByName('title').AsString = '' then
  begin
    MessageDlg('Yardým baþlýðý girilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edTitle.SetFocus;
    Exit;
  end;
  if qHelp.FieldByName('description').AsString = '' then
  begin
    MessageDlg('Yardým detayý (metni) girilmemiþ. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edHtml.SetFocus;
    Exit;
  end;

  if qHelp.FieldByName('formname').AsString <> '' then
  begin
    queryOpen(qtmp, 'select id, formname from sys_help where formname=''' +
                    qHelp.FieldByName('formname').AsString +
                    ''' and id<>' + IntToStr(qHelp.FieldByName('id').AsInteger));
    if (qHelp.FieldByName('id').AsString <> qTmp.FieldByName('id').AsString)
        and (qHelp.FieldByName('formname').AsString = qTmp.FieldByName('formname').AsString)
       then
    begin
      MessageDlg('Bu form için daha önce kaydedilmiþ yardým sayfasý bulunmakta.  Lütfen kontrol ediniz.', mtError, [mbOk]);
      edFormAdi.SetFocus;
      Exit;
    end;
  end;

  if qHelp.State in [dsInsert] then
  begin
    qHelp.FieldByName('id').AsInteger     := MainMod.GetSeq('sq_sys_help_id');
    qHelp.FieldByName('idy').AsInteger    := MainMod.LoginInfo.ID;
    qHelp.FieldByName('idt').AsDateTime   := Now;
  end;
  qHelp.FieldByName('sdy').AsInteger      := MainMod.LoginInfo.ID;
  qHelp.FieldByName('sdt').AsDateTime     := Now;
  qHelp.Post;
  ModalResult := mrOk;
end;

procedure TfrmHelpTanim.btnPreviewClick(Sender: TObject);
begin
  frmHelpPage.ExecById(qHelp.FieldByName('id').AsInteger);
end;

function TfrmHelpTanim.Exec(AID, AOp: Integer): Integer;
begin
  if AOp = 0 then // Insert
  begin
    QueryOpen(qHelp, 'SELECT * FROM sys_help WHERE id = 0');
    qHelp.Insert;
  end
  else // Edit
  begin
    QueryOpen(qHelp, 'SELECT * FROM sys_help WHERE id = ' + IntToStr(AID));
    qHelp.Edit;
  end;
  Result := ShowModal;
end;

procedure TfrmHelpTanim.ManageSettings;
begin

end;

procedure TfrmHelpTanim.UniFormBeforeShow(Sender: TObject);
begin
  edhtml.Text := qHelp.FieldByName('description').AsString;

  lbIDY.Caption := MainMod.KullaniciGetir(qHelp.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(qHelp.FieldByName('sdy').AsString);
  if qHelp.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qHelp.FieldByName('idt').AsDateTime);
  if qHelp.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qHelp.FieldByName('sdt').AsDateTime);
end;

end.
