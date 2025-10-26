unit unKVKKOnemDereceSec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Data.DB, MemDS, DBAccess, Uni, uniButton, uniBitBtn, uniPanel, uniGUIBaseClasses,
  uniBasicGrid, uniDBGrid, uniEdit;

type
  TfrmKVKKOnemDereceSec = class(TUniForm)
    grdList: TUniDBGrid;
    dsTanim: TUniDataSource;
    qTanim: TUniQuery;
    UniPanel1: TUniPanel;
    btnSelect: TUniBitBtn;
    btnCancel: TUniBitBtn;
    edSrcText: TUniEdit;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure grdListDblClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
  private
    procedure NewSQL;
  public
    GizliKriter : String;
    function Select(AMultiSelect: Boolean = False): Integer;
  end;

function frmKVKKOnemDereceSec: TfrmKVKKOnemDereceSec;

implementation

uses uniGUIApplication, MainModule, McMLib;

{$R *.dfm}

function frmKVKKOnemDereceSec: TfrmKVKKOnemDereceSec;
begin
  Result := TfrmKVKKOnemDereceSec(MainMod.GetFormInstance(TfrmKVKKOnemDereceSec));
end;

procedure TfrmKVKKOnemDereceSec.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmKVKKOnemDereceSec.btnSelectClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmKVKKOnemDereceSec.edSrcTextAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
  if EventName = 'doSearch' then NewSQL;
end;

procedure TfrmKVKKOnemDereceSec.grdListDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmKVKKOnemDereceSec.NewSQL;
var
  SQLStr : String;
  SrcText : string;
begin
  if not GuvenliGirisMi(edSrcText.Text) then
  begin
    MessageDlg('Geçersiz giriþ! Lütfen özel karakterler veya SQL komutlarý kullanmayýn.',mtConfirmation,[mbYes]) ;
    exit;
  end;

  SQLStr := 'SELECT * FROM def_data_onemderece WHERE mc_id =:mc_id AND ';
  if GizliKriter <> '' then SQLStr := SQLStr + GizliKriter + ' AND ';
  if edSrcText.Text <> '' then
  begin
    if edSrcText.Text[1] = '*' then
      SrcText := StringReplace(Copy(edSrcText.Text, 2, Length(edSrcText.Text)), '*', '%', [rfReplaceAll])
    else
      SrcText := '%' + edSrcText.Text + '%';
    SQLStr := SQLStr + 'onemderece LIKE :SrcText AND ';
  end;

	System.Delete(SQLStr, Length(SQLStr) - 3, 4);
  SQLStr := SQLStr + ' ORDER BY onemderece';
//  QueryOpen(qTanim, SQLStr);
  qTanim.SQL.Text := SQLStr ;
  qTanim.ParamByName('mc_id').AsString := inttostr(mainmod.MCID);
  if qTanim.FindParam('SrcText') <> nil then
    qTanim.ParamByName('SrcText').AsString := SrcText;
  qTanim.Open;
end;

function TfrmKVKKOnemDereceSec.Select(AMultiSelect: Boolean = False): Integer;
begin
  Result := -1;
  if AMultiSelect then grdList.Options := grdList.Options + [dgMultiSelect, dgCheckSelect,dgDontShowSelected];
  ShowModal;
  if ModalResult = mrOk then Result := grdList.SelectedRows.Count;
  GizliKriter := '';
end;

procedure TfrmKVKKOnemDereceSec.UniFormBeforeShow(Sender: TObject);
begin
  edSrcText.Text := '';
  NewSQL;
  ActiveControl := edSrcText;
end;

end.
