unit unSQLLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniMemo, uniButton, uniBitBtn,
  uniPanel;

type
  TfrmSQLLog = class(TUniForm)
    LogMemo: TUniMemo;
    pnlButtons: TUniPanel;
    btnCancel: TUniBitBtn;
    procedure btnCancelClick(Sender: TObject);
  private
  public
    procedure LoadLogFile(const AFileName: string);
  end;

function frmSQLLog: TfrmSQLLog;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmSQLLog: TfrmSQLLog;
begin
  Result := TfrmSQLLog(mainmod.GetFormInstance(TfrmSQLLog));
end;

procedure TfrmSQLLog.btnCancelClick(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TfrmSQLLog.LoadLogFile(const AFileName: string);
begin
  if FileExists(AFileName) then
    LogMemo.Lines.LoadFromFile(AFileName)
  else
    LogMemo.Lines.Text := 'Log dosyasý bulunamadý.';
end;

end.
