unit unSYSAyarlar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Uni,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uniLabel, uniPanel, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniEdit, uniDBEdit, Data.DB, DBAccess;

type
  TfrmsysAyarlarTanim = class(TUniForm)
    pnlData: TUniPanel;
    pnlButtons: TUniPanel;
    btnCancel: TUniBitBtn;
    btnPost: TUniBitBtn;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel9: TUniLabel;
    UniLabel11: TUniLabel;
    edModule: TUniDBEdit;
    edSubModule: TUniDBEdit;
    edParam: TUniDBEdit;
    edDesc: TUniDBEdit;
    UniLabel3: TUniLabel;
    UniLabel8: TUniLabel;
    UniLabel10: TUniLabel;
    edVal1: TUniDBEdit;
    edVal2: TUniDBEdit;
    edVal3: TUniDBEdit;
    dsParam: TUniDataSource;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    Data : TUniQuery;
  public
    function Edit: Integer;
    function Insert: Integer;
  end;

function frmsysAyarlarTanim: TfrmsysAyarlarTanim;

implementation

uses uniGUIApplication, MainModule, McMLib, unsysAyarlarListe;

{$R *.dfm}

function frmsysAyarlarTanim: TfrmsysAyarlarTanim;
begin
  Result := TfrmsysAyarlarTanim(MainMod.GetFormInstance(TfrmsysAyarlarTanim));
end;

procedure TfrmsysAyarlarTanim.btnCancelClick(Sender: TObject);
begin
  Data.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmsysAyarlarTanim.btnPostClick(Sender: TObject);
begin
  if Data.FieldByName('val1').AsString = '' then
  begin
    MessageDlg('Parametre için en az 1.DEÐER belirtilmelidir. Lütfen kontrol ediniz.', mtError, [mbOk]);
    edVal1.SetFocus;
    Exit;
  end;

  Data.Post;
  ModalResult := mrOk;
end;

function TfrmsysAyarlarTanim.Edit: Integer;
begin
  Data := MainMod.qsysParam;
  Data.Edit;
  ActiveControl := edVal1;
  Result := ShowModal;
end;

function TfrmsysAyarlarTanim.Insert: Integer;
begin
  Data := MainMod.qsysParam;
  Data.Insert;
  ActiveControl := edVal1;
  Result := ShowModal;
end;

procedure TfrmsysAyarlarTanim.UniFormBeforeShow(Sender: TObject);
begin
  //
end;

end.
