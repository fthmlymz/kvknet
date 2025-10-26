unit unHelpPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniHTMLFrame, Data.DB,
  DBAccess, Uni, MemDS;

type
  TfrmHelpPage = class(TUniForm)
    UniHTMLFrame1: TUniHTMLFrame;
    qHelp: TUniQuery;
    dsHelp: TUniDataSource;
  private
    number      :String;
    formName    :String;
    formTitle   :String;
    description : String;
    videoID     : String;
    function LoadVariables : Boolean;
    function VideoLinkHTML : String;
    function VideoEmbedHTML: String;
    { Private declarations }
  public
    function Exec(formName: String): Integer;
    function ExecById(id: integer): Integer;
    { Public declarations }
  end;

function frmHelpPage: TfrmHelpPage;

implementation

uses
  uniGUIApplication, MainModule, mcmlib;

{$R *.dfm}

function frmHelpPage: TfrmHelpPage;
begin
  Result := TfrmHelpPage(MainMod.GetFormInstance(TfrmHelpPage));
end;

{ TUniForm1 }

function TfrmHelpPage.Exec(formName: String): Integer;
begin
  queryOpen(qHelp, 'select * from sys_help where formname=''' + formname + '''');

  if (qHelp.FieldByName('formname').AsString = formname) then
  begin
    frmHelpPage.formName    := qHelp.FieldByName('formname').AsString;
    frmHelpPage.number      := qHelp.FieldByName('number').AsString;
    frmHelpPage.formtitle   := qHelp.FieldByName('title').AsString;
    frmHelpPage.description := qHelp.FieldByName('description').AsString;
//    frmHelpPage.videoID     := qHelp.FieldByName('video_id').AsString;
  end
  else
  begin
    frmHelpPage.formName    := formname;
    frmHelpPage.number      := '';
    frmHelpPage.formtitle   := '';
    frmHelpPage.description := 'Bu form i�in yard�m sayfas� hen�z tamamlanmam��.';
//    frmHelpPage.videoID     := '';
  end;

  Caption := 'KVKNET Yard�m - ' + number + ' ' + formTitle;
  uniHTMLFrame1.HTML.Add('<HTML><BODY>');
  uniHTMLFrame1.HTML.Add(description);
//  uniHTMLFrame1.HTML.Add('<p style="font-size:14px;font-weight:bold;text-align:justified;">' + description + '</p>');
//  if videoid <> '' then
//  begin
//    uniHTMLFrame1.HTML.Add(videoEmbedHTML);
//    uniHTMLFrame1.HTML.Add(videoLinkHTML);
//  end;
  uniHTMLFrame1.HTML.Add('</BODY></HTML>');
  result := ShowModal;
end;


function TfrmHelpPage.ExecById(ID: Integer): Integer;
begin
  queryOpen(qHelp, 'select * from sys_help where id=' + IntToStr(id));

  frmHelpPage.formName    := qHelp.FieldByName('formname').AsString;
  frmHelpPage.number      := qHelp.FieldByName('number').AsString;
  frmHelpPage.formtitle   := qHelp.FieldByName('title').AsString;
  frmHelpPage.description := qHelp.FieldByName('description').AsString;
//  frmHelpPage.videoID     := qHelp.FieldByName('video_id').AsString;

  Caption := 'KVKNET Yard�m - ' + number + ' ' + formTitle;
  uniHTMLFrame1.HTML.Add('<HTML><BODY>');
  uniHTMLFrame1.HTML.Add(description);
  uniHTMLFrame1.HTML.Add('</BODY></HTML>');
  result := ShowModal;
end;

function TfrmHelpPage.LoadVariables: Boolean;
begin
  result := true;
  if formName='EnvanterListe' then
  begin
    formTitle := 'Envanter';
    description := 'Ki�isel Veri Envanteri ve ili�kili verilerin girildi�i ve raporlanabildi�i formdur.';
    videoID := 'kVaX6qKjhdE';
    result := true;
  end
  else
  if formName='FirmaTanim' then
  begin
    formTitle := 'Veri Sorumlusu Bilgileri';
    description := 'Firma Bilgileri ve firma logosu, ilgili i�lemlerde kullan�lmas� ve dok�man �ablonlar�n�n doldurulmas� amac�yla burda saklanmaktad�r.';
    videoID := 'v2ji2EfNYfE';
    result := true;
  end
  else
  begin
    description := 'Bu yard�m ba�l���nda hen�z i�erik tamamlanmam��t�r.';
    result := false;
  end;

{
EnvanterTanim
AcikRizaKayitListe
AcikRizaKayitTanim
AydinlatmaSablonListe
AydinlatmaSablonTanim
CheckListListe
CheckkListTanim

}

end;

function TfrmHelpPage.VideoEmbedHTML: String;
begin
  result := '<center><p><iframe id="ytplayer" type="text/html" ' +
            'src="https://www.youtube.com/embed/' + videoID + '?autoplay=0&rel=0"' +
            'width="560" height="315" ' +
            'title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; ' +
            'clipboard-write; encrypted-media; gyroscope; picture-in-picture"></iframe></p></center>';
end;

function TfrmHelpPage.VideoLinkHTML: String;
begin
  result := '<center><p style="font-size:10px"><a href="https://www.youtube.com/watch?v=' + videoID + '" target="_blank">Videoyu ayr� pencerede izlemek i�in t�klay�n�z.</a></p><center>';
end;

end.
