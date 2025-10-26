unit unSurumNot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniButton, uniBitBtn, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses,
  uniMemo, uniDBMemo, Data.DB, DBAccess, Uni, MemDS, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDateTimePicker, uniDBDateTimePicker, uniHTMLMemo,
  uniDBLookupComboBox, uniURLFrame;

type
  TfrmSurumNot = class(TUniForm)
    pnlData: TUniPanel;
    pnlButtons: TUniPanel;
    btnCancel: TUniBitBtn;
    uFrame: TUniURLFrame;
    UniHTMLMemo1: TUniHTMLMemo;
    procedure btnCancelClick(Sender: TObject);
  private

  public
    function Exec(VersionNo: string): Integer;
  end;

function frmSurumNot: TfrmSurumNot;

implementation

uses uniGUIApplication, MainModule, McMLib, unHelpPage;



{$R *.dfm}

function frmSurumNot: TfrmSurumNot;
begin
  Result := TfrmSurumNot(MainMod.GetFormInstance(TfrmSurumNot));
end;


procedure TfrmSurumNot.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

function TfrmSurumNot.Exec(VersionNo: string): Integer;
begin

 // uFrame.Visible :=false;
//  UniHTMLMemo1.ShowToolbar := false;
  uFrame.URL := 'https://aryomteknoloji.com/surum/kvknet/' +VersionNo + '.html';
  Result := ShowModal;
end;


end.
