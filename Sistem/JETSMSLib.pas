unit JETSMSLib;

interface

uses System.SysUtils, Soap.InvokeRegistry, Soap.Rio, Soap.SOAPHTTPClient,Soap.XSBuiltIns, wsJETSMS,
  System.Classes;

function StrToArrayOfStr(AStr: String): ArrayOfString;

function JetSMSService: SMSServiceSOAP;
function SendSMS(var Msg: String; Rcpnt: String; Fast: Boolean; UName: String; UPwd: String; Origin:String; addr:string): Boolean;
function SendSMSA(MsgA: TStringList; RcptA: TStringList; idA: TStringList; Fast:Boolean; UName: String; UPwd: String; Origin:String; addr:string): TStringList;

implementation

//const
// Aryom Koru Kullanýcý Bilgileri
//  UName   : String = 'Atakang';
//  UPwd    : String = 'Tk-34586';
//  NTitle  : String = 'ARYOM KORU';
//  FTitle  : String = 'FASTSMSTEST';

// Aryom Yazýlým Kullanýcý Bilgileri
//  UName   : String = 'aryomapi';
//  UPwd    : String = '9637-krV';
//  NTitle  : String = 'KVKNET';
//  FTitle  : String = 'KVKNET';

// Aryom Yazýlým Kullanýcý Bilgileri
//  UName   : String = 'aryomyazilim';
//  UPwd    : String = '5369-kYR';
//  NTitle  : String = 'KVKNET';
//  FTitle  : String = 'KVKNET';

function StrToArrayOfStr(AStr: String): ArrayOfString;
var
  MyPos ,
  Sayac : Integer;
  Tmp   : String;
begin
  Sayac := 0;
  AStr  := Trim(AStr);

  if AStr = '' then
  begin
    SetLength(Result, Sayac);
    Exit;
  end;

  while AStr <> '' do
  begin
    MyPos := Pos(';', AStr);
    if MyPos > 0 then
    begin
      Tmp := Trim(Copy(AStr, 1, MyPos - 1));
      System.Delete(AStr, 1, MyPos);
    end
    else
    begin
      Tmp  := Trim(AStr);
      AStr := '';
    end;

    if Tmp <> '' then
    begin
      Sayac := Sayac + 1;
      SetLength(Result, Sayac);
      Result[Sayac - 1] := Tmp;
    end;
  end;
end;

function JetSMSService: SMSServiceSOAP;
var
  MyRio   : THTTPRIO;
begin
  MyRio := THTTPRIO.Create(nil);
  // MyRio.OnAfterExecute  := AfterExec;
  // MyRio.OnBeforeExecute := BeforeExec;
  MyRio.HTTPWebNode.ConnectTimeout := 120000;
  MyRio.HTTPWebNode.ReceiveTimeout := 120000;
  MyRio.HTTPWebNode.GetHTTPReqResp.UserName := '';
  MyRio.HTTPWebNode.GetHTTPReqResp.Password := '';
  MyRio.HTTPWebNode.UseUTF8InHeader := True;

  Result := GetSMSServiceSoap(False, '', MyRio);
end;

function SendSMS(var Msg: String; Rcpnt: String; Fast: Boolean; UName: String; UPwd: String; Origin:String; addr:string): Boolean;
var
  i       : Integer;
  Hizli   : String;
  Servis  : SMSServiceSOAP;
  Cevap   : ResponseFromHostV2;
  RcpList : ArrayOfString;
  MsgList : ArrayOfString;
begin
  Result  := False;
  RcpList := StrToArrayOfStr(Rcpnt);
  SetLength(MsgList, Length(RcpList));
  for i := 0 to Length(MsgList) - 1 do MsgList[i] := Msg;
  if Fast then
  begin
    Hizli  := 'VFFAST';
  end
  else
  begin
    Hizli  := '';
  end;

  Servis  := JetSMSService;

  try
    Cevap := Servis.SendSMS_V2(UName, UPwd, Origin, '', '', '', MsgList, RcpList, [], '', '', Hizli, '', '', '', enmOnLengthProblem.SendAllPackage, '', '', '', '', '', '', '');
    if Cevap <> nil then
    begin
      if Cevap.ResponseCode = '00' then
      begin
        Msg := '';
        for i := Low(Cevap.ResponseGroupIdArray) to High(Cevap.ResponseGroupIdArray) do
        begin
          Msg := Msg + Cevap.ResponseGroupIdArray[i].MessageId + ':' + Cevap.ResponseGroupIdArray[i].Status + ';';
        end;

        if Msg <> '' then System.Delete(Msg, Length(Msg), 1);
        Result := True;
      end
      else
      begin
        Msg := 'SMS ÝÞLEM HATASI..! ' + Cevap.ResponseCode + ': ' + Cevap.ResponseMessage;
      end;
    end
    else
    begin
      Msg := 'SMS SERVÝS HATASI..! Kontrol Hatasý : Cevap "NULL" döndü..';
    end;
  except on E: Exception do
    begin
      Msg := 'SMS SERVÝS HATASI..! Kontrol Hatasý : ' + E.Message;
    end;
  end;
end;

function SendSMSA(MsgA: TStringList; RcptA: TStringList; idA: TStringList; Fast:Boolean; UName: String; UPwd: String; Origin:String; addr:string): TStringList;
var
  i       : Integer;
  Hizli   : String;
  Servis  : SMSServiceSOAP;
  Cevap   : ResponseFromHostV2;
  RcpList : ArrayOfString;
  MsgList : ArrayOfString;
  IdList  : ArrayOfString;
  rsltA: TStringList;
begin
  rsltA := tstringlist.Create;
  result := rsltA;
  if (msga.Count <> rcpta.Count) or (msga.Count <> ida.Count) then
  begin
    rsltA.Add('HATA: Alýcý sayýsý ile mesaj sayýsý eþit olmalý!');
    exit;
  end;

  SetLength(rcpList, rcpta.Count);
  SetLength(MsgList, msga.Count);
  SetLength(idList, ida.Count);
  for i := 0 to Length(MsgList) - 1 do
  begin
    rcpList[i] := rcptA[i];
    MsgList[i] := MsgA[i];
    idList[i] := idA[i];
  end;
  if Fast then
  begin
    Hizli  := 'VFFAST';
  end
  else
  begin
    Hizli  := '';
  end;

  Servis  := JetSMSService;

  try
    Cevap := Servis.SendSMS_V2(UName, UPwd, Origin, '', '', '', MsgList, RcpList, idList, '', '', Hizli, '', '', '', enmOnLengthProblem.SendAllPackage, '', '', '', '', '', '', '');
    if Cevap <> nil then
    begin
      if Cevap.ResponseCode = '00' then
      begin
        for i := Low(Cevap.ResponseGroupIdArray) to High(Cevap.ResponseGroupIdArray) do
        begin
          rsltA.Add(Cevap.ResponseGroupIdArray[i].MessageId + ':' + Cevap.ResponseGroupIdArray[i].Status);
        end;

      end
      else
      begin
        rsltA.add('HATA: SMS ÝÞLEM HATASI..! ' + Cevap.ResponseCode + ': ' + Cevap.ResponseMessage);
      end;
    end
    else
    begin
      rsltA.add('HATA: SMS SERVÝS HATASI..! Kontrol Hatasý : Cevap "NULL" döndü..');
    end;
  except on E: Exception do
    begin
      rsltA.add('HATA: SMS SERVÝS HATASI..! Kontrol Hatasý : ' + E.Message);
    end;
  end;

  result := rsltA;
end;

end.
