unit unPDFForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniURLFrame, Data.DB, MemDS,
  DBAccess, Uni;

type
  TfrmPDFForm = class(TUniForm)
    UniURLFrame1: TUniURLFrame;
    dsdata: TUniDataSource;
    qdata: TUniQuery;
    procedure UniFormDestroy(Sender: TObject);
  private
    AStream: TMemoryStream;
    TmpName, FUrl, FileName, FileExt: String;
  public
//    function showpdf(Aurl, Atitle : string): integer;
    function showpdf(ids : string): integer; overload;
    function showpdf(Atable : TDataSet): integer; overload;

  end;

function frmPDFForm: TfrmPDFForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication,ServerModule,McMLib;

function frmPDFForm: TfrmPDFForm;
begin
  Result := TfrmPDFForm(mainmod.GetFormInstance(TfrmPDFForm));
end;


function TfrmPDFForm.showpdf(ids : string): integer;
begin
  QueryOpen( qdata,'select * from data_ihlal_dokuman where mc_id=' + inttostr(mainmod.MCID) +
  ' and id='+ ids);


  FileName := qdata.FieldByName('dosya_adi').AsString;
  Caption := FileName;
  FileExt := LowerCase(ExtractFileExt(FileName));

  if FileExt <> '.pdf' then
  begin
    Exit;
  end;

    AStream := TMemoryStream.Create;
      TmpName := ServerMod.NewCacheFileUrl(False, 'pdf', '', '', FUrl, True);
      TBlobField(qdata.FieldByName('file')).SaveToStream(AStream);
      AStream.Position := 0;
      AStream.SaveToFile(TmpName);
      UniURLFrame1.URL := FUrl;
  result := ShowModal;
end;

function TfrmPDFForm.showpdf(Atable : TDataSet): integer;
begin
//  QueryOpen( qdata,'select * from data_ihlal_dokuman where mc_id=' + inttostr(mainmod.MCID) +
//  ' and id='+ ids);


  FileName := Atable.FieldByName('dosya_adi').AsString;
  Caption := FileName;
  FileExt := LowerCase(ExtractFileExt(FileName));

  if FileExt <> '.pdf' then
  begin
    Exit;
  end;

    AStream := TMemoryStream.Create;
      TmpName := ServerMod.NewCacheFileUrl(False, 'pdf', '', '', FUrl, True);
      TBlobField(Atable.FieldByName('file')).SaveToStream(AStream);
      AStream.Position := 0;
      AStream.SaveToFile(TmpName);
      UniURLFrame1.URL := FUrl;
  result := ShowModal;
end;

//function TfrmPDFForm.showpdf(Aurl, Atitle : string): integer;
//begin
//
// Caption := Atitle;
// UniURLFrame1.URL := Aurl;
//result := ShowModal;
//end;

procedure TfrmPDFForm.UniFormDestroy(Sender: TObject);
begin
 UniURLFrame1.URL := '';
 if Assigned(AStream) then
      AStream.Free;
end;

end.
