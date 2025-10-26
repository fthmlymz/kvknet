unit UnIhlalOlayiBildirimTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniButton, uniBitBtn,
  uniLabel, VirtualTable, Data.DB, DBAccess, Uni, MemDS,McMLib,
  uniDateTimePicker, uniDBDateTimePicker, uniEdit, uniDBEdit, uniMultiItem,
  uniComboBox, uniDBComboBox, uniMemo, uniDBMemo, uniListBox,strutils,math,
  uniBasicGrid, uniDBGrid, VirtualQuery, uniCheckBox, uniDBCheckBox,
  uniScrollBox, uniSpeedButton, uniFileUpload;

type
  TfrmIhlalOlayiBildirimTanim = class(TUniForm)
    qdata: TUniQuery;
    dsdata: TUniDataSource;
    UniLabel15: TUniLabel;
    edihlal: TUniEdit;
    btnihlalbul: TUniBitBtn;
    vqdata: TVirtualTable;
    edbildirimtarihi: TUniDBDateTimePicker;
    edtarih: TUniLabel;
    mmBildirimYontemi: TUniDBMemo;
    UniLabel29: TUniLabel;
    UniLabel1: TUniLabel;
    mmgecbildirimneden: TUniDBMemo;
    UniLabel2: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    UniLabel3: TUniLabel;
    UniDBMemo1: TUniDBMemo;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniDBCheckBox2: TUniDBCheckBox;
    UniDBCheckBox3: TUniDBCheckBox;
    pnlButtons: TUniPanel;
    pnllog: TUniPanel;
    UniLabel10: TUniLabel;
    UniLabel11: TUniLabel;
    UniLabel12: TUniLabel;
    UniLabel9: TUniLabel;
    lbIDT: TUniLabel;
    lbIDY: TUniLabel;
    lbSDT: TUniLabel;
    lbSDY: TUniLabel;
    pnlbutton: TUniPanel;
    btnCancel: TUniBitBtn;
    btnHelp: TUniBitBtn;
    btnPost: TUniBitBtn;
    qTmp: TUniQuery;
    UniDBMemo2: TUniDBMemo;
    UniLabel6: TUniLabel;
    UniPanel2: TUniPanel;
    scrooldata: TUniScrollBox;
    UniLabel38: TUniLabel;
    edbildirimyontem: TUniDBEdit;
    btilgilikisidosya: TUniSpeedButton;
    btbildirimevrak: TUniSpeedButton;
    UniLabel7: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniSpeedButton1: TUniSpeedButton;
    UniSpeedButton2: TUniSpeedButton;
    UniLabel8: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniSpeedButton4: TUniSpeedButton;
    UniSpeedButton5: TUniSpeedButton;
    UniDBMemo3: TUniDBMemo;
    UniDBMemo4: TUniDBMemo;
    vqbildirimyontemi: TVirtualTable;
    dsbildirimyontemi: TUniDataSource;
    vqyurticibildirim: TVirtualTable;
    dsyurticibildirim: TUniDataSource;
    vqyurtdisibildirim: TVirtualTable;
    dsyurtdisibildirim: TUniDataSource;
    FileUp: TUniFileUpload;
    cpdata: TUniContainerPanel;
    procedure btnihlalbulClick(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure FileUpCompleted(Sender: TObject; AStream: TFileStream);
    procedure btilgilikisidosyaClick(Sender: TObject);
    procedure UniSpeedButton1Click(Sender: TObject);
    procedure UniSpeedButton4Click(Sender: TObject);
    procedure btbildirimevrakClick(Sender: TObject);
    procedure UniSpeedButton2Click(Sender: TObject);
    procedure UniSpeedButton5Click(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
  private
    YardimKw : string;
    EylemTipi :  TEylemTipi;
    MultiChange : boolean;
    konu : string;

    Fihlal_id: integer;
    Fihlal_str: string;

    function verikontrol(var Msg:string):boolean;
    procedure Setihlal_id(const Value: integer);
    property ihlal_id: integer read Fihlal_id write Setihlal_id;
    property ihlal_str: string read Fihlal_str write Fihlal_str;
  public
     function Exec(AIds: string='0'; AeylemTipi : TEylemTipi=Etekleme  ): integer;
  end;

function frmIhlalOlayiBildirimTanim: TfrmIhlalOlayiBildirimTanim;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication,  unSecimForm,  unHelpPage, UnIhlalOlayiTanim,
  unPDFForm;

function frmIhlalOlayiBildirimTanim: TfrmIhlalOlayiBildirimTanim;
begin
  Result := TfrmIhlalOlayiBildirimTanim(mainmod.GetFormInstance(TfrmIhlalOlayiBildirimTanim));
end;

procedure TfrmIhlalOlayiBildirimTanim.btnCancelClick(Sender: TObject);
begin
  qdata.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmIhlalOlayiBildirimTanim.btnHelpClick(Sender: TObject);
begin
  frmHelpPage.Exec(YardimKw);
end;

procedure TfrmIhlalOlayiBildirimTanim.btnihlalbulClick(Sender: TObject);
var
  ACount: Integer;
  i: Integer;
  aSql: String;
begin


  aSql := ' select i.id, i.ihlal_icerigi from def_data_ihlal i ' +
  ' where i.kisisel_veri_ihlali=''E'' and i.mc_id = '+inttostr(MainMod.MCID)+ ' and id<>'+
  ifthen(qdata.FieldByName('ihlal_id').IsNull, '0',qdata.FieldByName('ihlal_id').AsString)+
  ' and not EXISTS (select 1 from def_data_ihlal_bildirim b where b.mc_id='+inttostr(mainmod.MCID)+'  and b.ihlal_id=i.id)  ' ;

  Acount := frmSecimForm.Select('Bildirimi Yapýlacak Ýhlal olayýný seçiniz','Ýhlal Olaylarý',
                                'id','Sira No','ihlal_icerigi','Ýhlal',aSql,false );


  for i := 0 to ACount - 1 do
  begin
    frmSecimForm.qList.GotoBookmark(frmSecimForm.grdList.SelectedRows[i]) ;
    ihlal_Id :=  frmSecimForm.qList.FieldByName('id').AsInteger;
  end;




end;

procedure TfrmIhlalOlayiBildirimTanim.btnPostClick(Sender: TObject);
var
  XForm: TUniForm;
  I: Integer;
  msg : string;
  NotDelSurecID : string;
begin

//  if not verikontrol(msg) then
//  begin
//    MessageDlg(msg,mtConfirmation,[mbYes]);
//    exit;
//  end;

  if EylemTipi=Etekleme then
    qdata.Append
  else if EylemTipi = EtTekDegistirme then
    qdata.Edit;

    for I := 0 to qdata.Fields.Count -1 do
    begin
         if qdata.Fields[i].FieldName= 'id' then
            qdata.Fields[i].Value := ifthen(EylemTipi=Etekleme , MainMod.GetSeq('sq_def_data_ihlal_bildirim_id'),vqdata.Fields[i].AsInteger )
          else if qdata.Fields[i].FieldName = 'mc_id' then
            qdata.Fields[i].Value := MainMod.MCID
          else if qdata.Fields[i].FieldName= 'sdy' then
            qdata.Fields[i].Value := mainmod.LoginInfo.ID
          else if qdata.Fields[i].FieldName= 'sdt' then
             qdata.Fields[i].Value := now
          else if (EylemTipi=Etekleme) and (  qdata.Fields[i].FieldName= 'idy') then
            qdata.Fields[i].Value := mainmod.LoginInfo.ID
          else if (EylemTipi=Etekleme) and ( qdata.Fields[i].FieldName = 'idt') then
             qdata.Fields[i].Value := now
          else if qdata.Fields[i].FieldName = 'ihlal_id' then
            qdata.Fields[i].Value := ihlal_id
          else
            qdata.Fields[i].Value := vqdata.Fields[i].Value;
    end;
    qdata.Post;

    if vqbildirimyontemi.RecordCount > 0 then
    begin
     QueryOpen(qtmp,'select * from data_ihlal_dokuman where mc_id='+
     inttostr(mainmod.MCID)+' and ihlal_id='+ qdata.FieldByName('ihlal_id').AsString +
      ' and konu='+QuotedStr('ÝLGÝLÝ KÝÞÝ BÝLDÝRÝM EVRAK'));
      if not qTmp.IsEmpty then
      begin
       qTmp.Edit;
       qTmp.FieldByName('dosya_adi').AsString := vqbildirimyontemi.FieldByName('dosya_adi').AsString;
       qTmp.FieldByName('file').Value :=  vqbildirimyontemi.FieldByName('file').value;
       qTmp.Post;
      end else
      begin
       qTmp.Append;
       qTmp.FieldByName('id').AsInteger :=  MainMod.GetSeq('sq_data_ihlal_dokuman_id');
       qTmp.FieldByName('mc_id').AsInteger := mainmod.MCID;
       qTmp.FieldByName('konu').AsString := 'ÝLGÝLÝ KÝÞÝ BÝLDÝRÝM EVRAK';
       qTmp.FieldByName('ihlal_id').AsInteger := qdata.FieldByName('ihlal_id').AsInteger;
       qTmp.FieldByName('dosya_adi').AsString := vqbildirimyontemi.FieldByName('dosya_adi').AsString;
       qTmp.FieldByName('file').Value :=  vqbildirimyontemi.FieldByName('file').value;
       qTmp.Post;
      end;
    end;

    if vqyurticibildirim.RecordCount > 0 then
    begin
     QueryOpen(qtmp,'select * from data_ihlal_dokuman where mc_id='+
     inttostr(mainmod.MCID)+' and ihlal_id='+ qdata.FieldByName('ihlal_id').AsString +
      ' and konu='+QuotedStr('YURT ÝÇÝ BÝLDÝRÝM EVRAK'));
      if not qTmp.IsEmpty then
      begin
       qTmp.Edit;
       qTmp.FieldByName('dosya_adi').AsString := vqyurticibildirim.FieldByName('dosya_adi').AsString;
       qTmp.FieldByName('file').Value :=  vqyurticibildirim.FieldByName('file').value;
       qTmp.Post;
      end else
      begin
       qTmp.Append;
       qTmp.FieldByName('id').AsInteger :=  MainMod.GetSeq('sq_data_ihlal_dokuman_id');
       qTmp.FieldByName('mc_id').AsInteger := mainmod.MCID;
       qTmp.FieldByName('konu').AsString := 'YURT ÝÇÝ BÝLDÝRÝM EVRAK';
       qTmp.FieldByName('ihlal_id').AsInteger := qdata.FieldByName('ihlal_id').AsInteger;
       qTmp.FieldByName('dosya_adi').AsString := vqyurticibildirim.FieldByName('dosya_adi').AsString;
       qTmp.FieldByName('file').Value :=  vqyurticibildirim.FieldByName('file').value;
       qTmp.Post;
      end;
    end;

    if vqyurtdisibildirim.RecordCount > 0 then
    begin
     QueryOpen(qtmp,'select * from data_ihlal_dokuman where mc_id='+
     inttostr(mainmod.MCID)+' and ihlal_id='+ qdata.FieldByName('ihlal_id').AsString +
      ' and konu='+QuotedStr('YURT DIÞI BÝLDÝRÝM EVRAK'));
      if not qTmp.IsEmpty then
      begin
       qTmp.Edit;
       qTmp.FieldByName('dosya_adi').AsString := vqyurtdisibildirim.FieldByName('dosya_adi').AsString;
       qTmp.FieldByName('file').Value :=  vqyurtdisibildirim.FieldByName('file').value;
       qTmp.Post;
      end else
      begin
       qTmp.Append;
       qTmp.FieldByName('id').AsInteger :=  MainMod.GetSeq('sq_data_ihlal_dokuman_id');
       qTmp.FieldByName('mc_id').AsInteger := mainmod.MCID;
       qTmp.FieldByName('konu').AsString := 'YURT DIÞI BÝLDÝRÝM EVRAK';
       qTmp.FieldByName('ihlal_id').AsInteger := qdata.FieldByName('ihlal_id').AsInteger;
       qTmp.FieldByName('dosya_adi').AsString := vqyurtdisibildirim.FieldByName('dosya_adi').AsString;
       qTmp.FieldByName('file').Value :=  vqyurtdisibildirim.FieldByName('file').value;
       qTmp.Post;
      end;
    end;

   ModalResult := mrOk;


end;

function TfrmIhlalOlayiBildirimTanim.Exec(AIds: string;
  AeylemTipi: TEylemTipi): integer;
begin
  YardimKw := 'ÝhlalOlayiBildirim';
  EylemTipi := AeylemTipi;
  MultiChange := pos(',',AIds)>0;

  QueryOpen(qdata, 'select * from def_data_ihlal_bildirim where mc_id='+inttostr(MainMod.MCID)+' and id in ('+AIds+')');
  CopyFieldsFromQueryToVirtualTable(qdata,vqdata,not MultiChange);

  Fihlal_id := vqdata.FieldByName('ihlal_id').AsInteger;

  dsdata.DataSet := vqdata;
  if (EylemTipi = Etekleme ) or (MultiChange) then
    vqdata.Insert
  else
    vqdata.Edit;
  ihlal_id := vqdata.FieldByName('ihlal_id').AsInteger;


   if qdata.RecordCount>0 then
    begin
      QueryOpen(qTmp,'select * from data_ihlal_dokuman where konu= ''ÝLGÝLÝ KÝÞÝ BÝLDÝRÝM EVRAK'' and mc_id=' +
      inttostr(MainMod.MCID) + ' and ihlal_id=' + qdata.FieldByName('ihlal_id').AsString);
      CopyFieldsFromQueryToVirtualTable(qTmp,vqbildirimyontemi,not MultiChange);

      QueryOpen(qTmp,'select * from data_ihlal_dokuman where konu= ''YURT ÝÇÝ BÝLDÝRÝM EVRAK'' and mc_id=' +
      inttostr(MainMod.MCID) + ' and ihlal_id=' + qdata.FieldByName('ihlal_id').AsString);
      CopyFieldsFromQueryToVirtualTable(qTmp,vqyurticibildirim,not MultiChange);

      QueryOpen(qTmp,'select * from data_ihlal_dokuman where konu= ''YURT DIÞI BÝLDÝRÝM EVRAK'' and mc_id=' +
      inttostr(MainMod.MCID) + ' and ihlal_id=' + qdata.FieldByName('ihlal_id').AsString);
      CopyFieldsFromQueryToVirtualTable(qTmp,vqyurtdisibildirim,not MultiChange);

    end;

    vqbildirimyontemi.Open;
    vqyurticibildirim.Open;
    vqyurtdisibildirim.Open;

//    frmIhlalOlayi.Parent :=  frmpanel;
//  frmIhlalOlayi.vqdata.Cancel;
//  PaneldeOkunurYap(frmIhlalOlayi.UniPanel2,true);
//  PaneldeOkunurYap(frmIhlalOlayi.UniPanel1,true);
//  frmIhlalOlayi.UniPanel3.Visible := false;
//  frmIhlalOlayi.pnlButtons.Visible := false;
//
//  frmIhlalOlayi.Exec('1',EtTekDegistirme);

  result := ShowModal;


end;

procedure TfrmIhlalOlayiBildirimTanim.FileUpCompleted(Sender: TObject;
  AStream: TFileStream);
var
  ms : TMemoryStream;
   Ext: string;
begin
 if konu = 'ÝLGÝLÝ KÝÞÝ BÝLDÝRÝM EVRAK' then
 begin
  if not (dsbildirimyontemi.DataSet.State in [dsEdit,dsInsert])  then
    if dsbildirimyontemi.DataSet.RecordCount = 0 then
      dsbildirimyontemi.DataSet.Insert
      else
      dsbildirimyontemi.DataSet.Edit;

  Ext := LowerCase(ExtractFileExt(AStream.FileName)); // Dosya uzantýsýný al

  if not (Ext = '.pdf') then
  begin
    ShowMessage('Geçersiz dosya türü! Sadece PDF yükleyebilirsiniz.');
    Exit;
  end;

  ms := TMemoryStream.Create;
   try
      ms.LoadFromFile(AStream.FileName);
      ms.Position := 0;
      TBlobField( dsbildirimyontemi.DataSet.FieldByName('file')).LoadFromStream(ms);
      dsbildirimyontemi.DataSet.FieldByName('id').AsInteger := 0;
      dsbildirimyontemi.DataSet.FieldByName('dosya_adi').AsString := FileUp.FileName;//ExtractFileName(AStream.FileName);
      dsbildirimyontemi.DataSet.FieldByName('konu').AsString := 'ÝLGÝLÝ KÝÞÝ BÝLDÝRÝM EVRAK';
      dsbildirimyontemi.DataSet.FieldByName('mc_id').AsInteger := mainmod.MCID;
      dsbildirimyontemi.DataSet.Post;
   finally
     ms.Free;
   end;
 end else
 if konu = 'YURT ÝÇÝ BÝLDÝRÝM EVRAK'  then
 begin
  if not (dsyurticibildirim.DataSet.State in [dsEdit,dsInsert])  then
    if dsyurticibildirim.DataSet.RecordCount = 0 then
      dsyurticibildirim.DataSet.Insert
      else
      dsyurticibildirim.DataSet.Edit;

  Ext := LowerCase(ExtractFileExt(AStream.FileName)); // Dosya uzantýsýný al

  if not (Ext = '.pdf') then
  begin
    ShowMessage('Geçersiz dosya türü! Sadece PDF yükleyebilirsiniz.');
    Exit;
  end;

  ms := TMemoryStream.Create;
   try
      ms.LoadFromFile(AStream.FileName);
      ms.Position := 0;
      TBlobField(dsyurticibildirim.DataSet.FieldByName('file')).LoadFromStream(ms);
      dsyurticibildirim.DataSet.FieldByName('id').AsInteger := 0;
      dsyurticibildirim.DataSet.FieldByName('dosya_adi').AsString := FileUp.FileName;//ExtractFileName(AStream.FileName);
      dsyurticibildirim.DataSet.FieldByName('konu').AsString := 'YURT ÝÇÝ BÝLDÝRÝM EVRAK';
      dsyurticibildirim.DataSet.FieldByName('mc_id').AsInteger := mainmod.MCID;
      dsyurticibildirim.DataSet.Post;
   finally
     ms.Free;
   end;
 end else
 if konu = 'YURT DIÞI BÝLDÝRÝM EVRAK'  then
 begin
  if not (dsyurtdisibildirim.DataSet.State in [dsEdit,dsInsert])  then
    if dsyurtdisibildirim.DataSet.RecordCount = 0 then
      dsyurtdisibildirim.DataSet.Insert
      else
      dsyurtdisibildirim.DataSet.Edit;
  Ext := LowerCase(ExtractFileExt(AStream.FileName)); // Dosya uzantýsýný al
  if not (Ext = '.pdf') then
  begin
    ShowMessage('Geçersiz dosya türü! Sadece PDF yükleyebilirsiniz.');
    Exit;
  end;
  ms := TMemoryStream.Create;
   try
      ms.LoadFromFile(AStream.FileName);
      ms.Position := 0;
      TBlobField(dsyurtdisibildirim.DataSet.FieldByName('file')).LoadFromStream(ms);
      dsyurtdisibildirim.DataSet.FieldByName('id').AsInteger := 0;
      dsyurtdisibildirim.DataSet.FieldByName('dosya_adi').AsString := FileUp.FileName;//ExtractFileName(AStream.FileName);
      dsyurtdisibildirim.DataSet.FieldByName('konu').AsString := 'YURT DIÞI BÝLDÝRÝM EVRAK';
      dsyurtdisibildirim.DataSet.FieldByName('mc_id').AsInteger := mainmod.MCID;
      dsyurtdisibildirim.DataSet.Post;
   finally
     ms.Free;
   end;
 end
end;

procedure TfrmIhlalOlayiBildirimTanim.Setihlal_id(const Value: integer);
begin
  Fihlal_id := Value;
  QueryOpen(mainmod.qTmp,'select id, ihlal_icerigi from def_data_ihlal where mc_id='
            + inttostr(MainMod.MCID)+' and id ='+inttostr(ihlal_id)) ;
  Fihlal_str := mainmod.qTmp.FieldByName('ihlal_icerigi').AsString;

  edihlal.Text := Fihlal_str;



end;

procedure TfrmIhlalOlayiBildirimTanim.UniFormBeforeShow(Sender: TObject);
begin
  scrooldata.Top := 0 ;
  scrooldata.Left:= 0 ;
  lbIDY.Caption := MainMod.KullaniciGetir(qdata.FieldByName('idy').AsString);
  lbSDY.Caption := MainMod.KullaniciGetir(qdata.FieldByName('sdy').AsString);

  if (EylemTipi = EtTekDegistirme ) or ( EylemTipi =EtTopluDegistirme ) then
  begin
    if lbIDY.Text = '' then lbIDY.Text := 'SÝSTEM';
    if lbSDY.Text = '' then lbSDY.Text := 'SÝSTEM';
  end;

  if qdata.FieldByName('idt').AsString = '' then lbIDT.Caption := ''
   else lbIDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qdata.FieldByName('idt').AsDateTime);
  if qdata.FieldByName('sdt').AsString = '' then lbSDT.Caption := ''
   else lbSDT.Caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', qdata.FieldByName('sdt').AsDateTime);

end;

procedure TfrmIhlalOlayiBildirimTanim.UniFormResize(Sender: TObject);
var
  CenterLeft, CenterTop: Integer;
begin

  CenterLeft := (cpdata.Width - ScroolData.Width) div 2;
  //CenterTop := (ContainerPanel.Height - ScrollData.Height) div 2;
  ScroolData.Left := CenterLeft;
  //ScroolData.Top := CenterTop;

end;

procedure TfrmIhlalOlayiBildirimTanim.UniSpeedButton1Click(Sender: TObject);
begin
 konu := 'YURT ÝÇÝ BÝLDÝRÝM EVRAK' ;
 if  dsdata.DataSet.State in [dsEdit,dsInsert] then
  FileUp.Execute;
end;

procedure TfrmIhlalOlayiBildirimTanim.UniSpeedButton2Click(Sender: TObject);
begin
if vqyurticibildirim.RecordCount>0 then
  frmPDFForm.showpdf(vqyurticibildirim);
end;

procedure TfrmIhlalOlayiBildirimTanim.UniSpeedButton4Click(Sender: TObject);
begin
 konu := 'YURT DIÞI BÝLDÝRÝM EVRAK' ;
 if  dsdata.DataSet.State in [dsEdit,dsInsert] then
  FileUp.Execute;
end;

procedure TfrmIhlalOlayiBildirimTanim.UniSpeedButton5Click(Sender: TObject);
begin
if vqyurticibildirim.RecordCount>0 then
  frmPDFForm.showpdf(vqyurticibildirim);
end;

procedure TfrmIhlalOlayiBildirimTanim.btbildirimevrakClick(Sender: TObject);
begin
if vqbildirimyontemi.RecordCount>0 then
  frmPDFForm.showpdf(vqbildirimyontemi);
end;

procedure TfrmIhlalOlayiBildirimTanim.btilgilikisidosyaClick(Sender: TObject);
begin
 konu := 'ÝLGÝLÝ KÝÞÝ BÝLDÝRÝM EVRAK' ;
 if  dsdata.DataSet.State in [dsEdit,dsInsert] then
  FileUp.Execute;
end;

function TfrmIhlalOlayiBildirimTanim.verikontrol(var Msg: string): boolean;
begin
Msg :='';
  result := true;
  if  ihlal_id<=0 then
    msg := 'Bir ihlal olayý seçmelisiniz'
  else if  vqdata.FieldByName('bildirim_tarihi').AsDateTime = 0 then
    msg := 'Bildirim tarihi belirlemeniz gerekmektedir'
  else if Vqdata.FieldByName('bildirim_yontemi').AsString='' then
    msg := 'Bildirim yöntemi seçmelisiniz'
  else if Vqdata.FieldByName('bilgi_alma_yontemi').AsDateTime=0 then
    msg := 'Ýlgili kiþilerin veri ihlali ile ilgili bilgi almalarýný saðlayacak iletiþim yollarýný belirtmelisiniz.'
  else
  begin

  QueryOpen(qTmp,'select * from def_data_ihlal where id=' +inttostr(ihlal_id));
  if (vqdata.FieldByName('bildirim_tarihi').AsDateTime - qTmp.FieldByName('tespit_tarihi').AsDateTime) * 24 >72  then
     if vqdata.FieldByName('gec_bildirim_nedeni').AsString ='' then
        Msg := 'Ýhlal bildirimini tespit tarihinden 72 saatten sonra yapýyorsunuz. Geçikme nedeni girmelisiniz ';
  end;

    result := Msg='';

end;

end.
