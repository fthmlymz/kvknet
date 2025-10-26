unit unDuyuruDetay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniButton, uniBitBtn, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses,
  uniMemo, uniDBMemo, Data.DB, DBAccess, Uni, MemDS, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDateTimePicker, uniDBDateTimePicker, uniHTMLMemo,
  uniDBLookupComboBox, uniHTMLFrame;

type
  TfrmDuyuruDetay = class(TUniForm)
    pnlData: TUniPanel;
    qDuyuru: TUniQuery;
    dsDuyuru: TUniDataSource;
    btnClose: TUniBitBtn;
    htmlFrame: TUniHTMLFrame;
    procedure btnCloseClick(Sender: TObject);
  private
  public
    function Exec(AID: Integer): Integer;
  end;

function frmDuyuruDetay: TfrmDuyuruDetay;

implementation

uses uniGUIApplication, MainModule, McMLib;

{$R *.dfm}

function frmDuyuruDetay: TfrmDuyuruDetay;
begin
  Result := TfrmDuyuruDetay(MainMod.GetFormInstance(TfrmDuyuruDetay));
end;

procedure TfrmDuyuruDetay.btnCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

function TfrmDuyuruDetay.Exec(AID: Integer): Integer;
begin
  QueryOpen(qDuyuru, 'SELECT * FROM sys_news WHERE id = ' + IntToStr(AID));
  htmlFrame.HTML.Text := '<div style="text-align: center;"><b>' + qDuyuru.FieldByName('title').AsString + '<b></div><br/><br/>' +
                         qDuyuru.FieldByName('description').AsString;
  Result := ShowModal;
end;

end.
