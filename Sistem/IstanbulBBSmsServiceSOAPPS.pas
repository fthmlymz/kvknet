// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : D:\Klasör\Kod\SmsServiceSOAPPS.xml
//  >Import : D:\Klasör\Kod\SmsServiceSOAPPS.xml>0
// Encoding : UTF-8
// Version  : 1.0
// (30.03.2022 15:42:48 - - $Rev: 86412 $)
// ************************************************************************ //

unit IstanbulBBSmsServiceSOAPPS;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:grupMesajGonder - "http://impl.service.v4.sms.ibb.gov.tr/"[Lit][]
  // !:TopluSmsGonderResponse - "http://impl.service.v4.sms.ibb.gov.tr/"[Lit][]
  // !:grupMesajGonderResponse - "http://impl.service.v4.sms.ibb.gov.tr/"[Lit][]
  // !:MesajIptalResponse - "http://impl.service.v4.sms.ibb.gov.tr/"[Lit][]
  // !:MesajIptal      - "http://impl.service.v4.sms.ibb.gov.tr/"[Lit][]
  // !:MesajGonderResponse - "http://impl.service.v4.sms.ibb.gov.tr/"[Lit][]
  // !:MesajGonder     - "http://impl.service.v4.sms.ibb.gov.tr/"[Lit][]
  // !:MesajDurumSorgula - "http://impl.service.v4.sms.ibb.gov.tr/"[Lit][]
  // !:TopluSmsGonder  - "http://impl.service.v4.sms.ibb.gov.tr/"[Lit][]
  // !:MesajDurumSorgulaResponse - "http://impl.service.v4.sms.ibb.gov.tr/"[Lit][]


  // ************************************************************************ //
  // Namespace : http://impl.service.v4.sms.ibb.gov.tr/
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : SmsV4ServicePortBinding
  // service   : SmsV4Service
  // port      : SmsV4ServicePort
  // URL       : https://osb-mwwebgate.ibb.gov.tr:443/Internal/Sms/SmsService/ProxyService/SmsServiceSOAPPS
  // ************************************************************************ //
  SmsServiceImpl = interface(IInvokable)
  ['{62830930-49A0-0814-A804-B456F968AD9D}']

    // Cannot unwrap: 
    //     - Input part does not refer to an element
    //     - Output part does not refer to an element
    function  MesajGonder(const parameters: MesajGonder): MesajGonderResponse; stdcall;

    // Cannot unwrap: 
    //     - Input part does not refer to an element
    //     - Output part does not refer to an element
    function  MesajDurumSorgula(const parameters: MesajDurumSorgula): MesajDurumSorgulaResponse; stdcall;

    // Cannot unwrap: 
    //     - Input part does not refer to an element
    //     - Output part does not refer to an element
    function  TopluSmsGonder(const parameters: TopluSmsGonder): TopluSmsGonderResponse; stdcall;

    // Cannot unwrap: 
    //     - Input part does not refer to an element
    //     - Output part does not refer to an element
    function  grupMesajGonder(const parameters: grupMesajGonder): grupMesajGonderResponse; stdcall;

    // Cannot unwrap: 
    //     - Input part does not refer to an element
    //     - Output part does not refer to an element
    function  MesajIptal(const parameters: MesajIptal): MesajIptalResponse; stdcall;
  end;

function GetSmsServiceImpl(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): SmsServiceImpl;


implementation
  uses System.SysUtils;

function GetSmsServiceImpl(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): SmsServiceImpl;
const
  defWSDL = 'D:\Klasör\Kod\SmsServiceSOAPPS.xml';
  defURL  = 'https://osb-mwwebgate.ibb.gov.tr:443/Internal/Sms/SmsService/ProxyService/SmsServiceSOAPPS';
  defSvc  = 'SmsV4Service';
  defPrt  = 'SmsV4ServicePort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as SmsServiceImpl);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  { SmsServiceImpl }
  InvRegistry.RegisterInterface(TypeInfo(SmsServiceImpl), 'http://impl.service.v4.sms.ibb.gov.tr/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SmsServiceImpl), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(SmsServiceImpl), ioDocument);
  InvRegistry.RegisterInvokeOptions(TypeInfo(SmsServiceImpl), ioLiteral);

end.