// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : https://api.jetSMS.com.tr/ws/soapSMS.asmx?WSDL
//  >Import : https://api.jetSMS.com.tr/ws/soapSMS.asmx?WSDL>0
// Encoding : utf-8
// Version  : 1.0
// (13.12.2020 08:37:29 - - $Rev: 86412 $)
// ************************************************************************ //

unit wsJETSMS;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;
  IS_NLBL = $0004;
  IS_REF  = $0080;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:decimal         - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"[Gbl]

  LOKArea              = class;                 { "http://tempuri.org/"[GblCplx] }
  SendSMSResult        = class;                 { "http://tempuri.org/"[GblCplx] }
  ResponseFromHostV2   = class;                 { "http://tempuri.org/"[GblCplx] }
  ResponseGroupId      = class;                 { "http://tempuri.org/"[GblCplx] }
  clsGroups            = class;                 { "http://tempuri.org/"[GblCplx] }
  LOKInput             = class;                 { "http://tempuri.org/"[GblCplx] }
  ReportLOKSMSResult   = class;                 { "http://tempuri.org/"[GblCplx] }
  clsGroupInfo         = class;                 { "http://tempuri.org/"[GblCplx] }
  clsReverse           = class;                 { "http://tempuri.org/"[GblCplx] }
  clsMessage           = class;                 { "http://tempuri.org/"[GblCplx] }
  ACParameter          = class;                 { "http://tempuri.org/"[GblCplx] }
  clsTitles            = class;                 { "http://tempuri.org/"[GblCplx] }
  MessageReport        = class;                 { "http://tempuri.org/"[GblCplx] }
  ReportSMSResult      = class;                 { "http://tempuri.org/"[GblCplx] }
  MessageResponseV2    = class;                 { "http://tempuri.org/"[GblCplx] }
  IYSReportErrorItem   = class;                 { "http://tempuri.org/"[GblCplx] }
  IYSRequestList       = class;                 { "http://tempuri.org/"[GblCplx] }
  IYSResult            = class;                 { "http://tempuri.org/"[GblCplx] }
  Ekstra               = class;                 { "http://tempuri.org/"[GblCplx] }
  Address              = class;                 { "http://tempuri.org/"[GblCplx] }
  ReportFields         = class;                 { "http://tempuri.org/"[GblCplx] }
  ReportSMSDetailedResult = class;              { "http://tempuri.org/"[GblCplx] }
  CreditResult         = class;                 { "http://tempuri.org/"[GblCplx] }
  AttributeValuesResult = class;                { "http://tempuri.org/"[GblCplx] }
  AttributeValue       = class;                 { "http://tempuri.org/"[GblCplx] }
  GroupResult          = class;                 { "http://tempuri.org/"[GblCplx] }
  IYSReportResult      = class;                 { "http://tempuri.org/"[GblCplx] }
  ReportSMSDetailedResult_v3 = class;           { "http://tempuri.org/"[GblCplx] }
  MsisdnBL             = class;                 { "http://tempuri.org/"[GblCplx] }
  ReportSMSDetailedResult_v2 = class;           { "http://tempuri.org/"[GblCplx] }
  CheckBLResult        = class;                 { "http://tempuri.org/"[GblCplx] }

  {$SCOPEDENUMS ON}
  { "http://tempuri.org/"[GblSmpl] }
  enmACParameterTypes = (DT, GI, SI, SMS);

  { "http://tempuri.org/"[GblSmpl] }
  enmGIFormat = (NUMERIC, ALPHANUMERIC, PASSWORD_NUMERIC);

  { "http://tempuri.org/"[GblSmpl] }
  enmOnLengthProblem = (RejectAllPackage, SendOtherMessages, SendAllPackage);

  { "http://tempuri.org/"[GblSmpl] }
  enmGroupInfoType = (GroupName, GroupId);

  { "http://tempuri.org/"[GblSmpl] }
  Gender = (Bilinmiyor, M, F);

  { "http://tempuri.org/"[GblSmpl] }
  BloodGroup = (Bilinmiyor, APozitif, ANegatif, BPozitif, BNegatif, _0Pozitif, _0Negatif, ABPozitif, ABNegaif);

  {$SCOPEDENUMS OFF}

  ArrayOfClsMessage = array of clsMessage;      { "http://tempuri.org/"[GblCplx] }
  ArrayOfACParameter = array of ACParameter;    { "http://tempuri.org/"[GblCplx] }
  ArrayOfClsGroupInfo = array of clsGroupInfo;   { "http://tempuri.org/"[GblCplx] }
  ArrayOfLOKArea = array of LOKArea;            { "http://tempuri.org/"[GblCplx] }


  // ************************************************************************ //
  // XML       : LOKArea, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  LOKArea = class(TRemotable)
  private
    FAreaId: Integer;
    FAreaType: Integer;
  published
    property AreaId:   Integer  read FAreaId write FAreaId;
    property AreaType: Integer  read FAreaType write FAreaType;
  end;

  ArrayOfResponseGroupId = array of ResponseGroupId;   { "http://tempuri.org/"[GblCplx] }
  ArrayOfReportSMSResult = array of ReportSMSResult;   { "http://tempuri.org/"[GblCplx] }


  // ************************************************************************ //
  // XML       : SendSMSResult, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  SendSMSResult = class(TRemotable)
  private
    FErrorCode: string;
    FErrorCode_Specified: boolean;
    FID: string;
    FID_Specified: boolean;
    procedure SetErrorCode(Index: Integer; const Astring: string);
    function  ErrorCode_Specified(Index: Integer): boolean;
    procedure SetID(Index: Integer; const Astring: string);
    function  ID_Specified(Index: Integer): boolean;
  published
    property ErrorCode: string  Index (IS_OPTN) read FErrorCode write SetErrorCode stored ErrorCode_Specified;
    property ID:        string  Index (IS_OPTN) read FID write SetID stored ID_Specified;
  end;



  // ************************************************************************ //
  // XML       : ResponseFromHostV2, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  ResponseFromHostV2 = class(TRemotable)
  private
    FResponseCode: string;
    FResponseCode_Specified: boolean;
    FResponseMessage: string;
    FResponseMessage_Specified: boolean;
    FResponseGroupIdArray: ArrayOfResponseGroupId;
    FResponseGroupIdArray_Specified: boolean;
    procedure SetResponseCode(Index: Integer; const Astring: string);
    function  ResponseCode_Specified(Index: Integer): boolean;
    procedure SetResponseMessage(Index: Integer; const Astring: string);
    function  ResponseMessage_Specified(Index: Integer): boolean;
    procedure SetResponseGroupIdArray(Index: Integer; const AArrayOfResponseGroupId: ArrayOfResponseGroupId);
    function  ResponseGroupIdArray_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property ResponseCode:         string                  Index (IS_OPTN) read FResponseCode write SetResponseCode stored ResponseCode_Specified;
    property ResponseMessage:      string                  Index (IS_OPTN) read FResponseMessage write SetResponseMessage stored ResponseMessage_Specified;
    property ResponseGroupIdArray: ArrayOfResponseGroupId  Index (IS_OPTN) read FResponseGroupIdArray write SetResponseGroupIdArray stored ResponseGroupIdArray_Specified;
  end;



  // ************************************************************************ //
  // XML       : ResponseGroupId, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  ResponseGroupId = class(TRemotable)
  private
    FGsmNumber: string;
    FGsmNumber_Specified: boolean;
    FMessageId: string;
    FMessageId_Specified: boolean;
    FStatus: string;
    FStatus_Specified: boolean;
    procedure SetGsmNumber(Index: Integer; const Astring: string);
    function  GsmNumber_Specified(Index: Integer): boolean;
    procedure SetMessageId(Index: Integer; const Astring: string);
    function  MessageId_Specified(Index: Integer): boolean;
    procedure SetStatus(Index: Integer; const Astring: string);
    function  Status_Specified(Index: Integer): boolean;
  published
    property GsmNumber: string  Index (IS_OPTN) read FGsmNumber write SetGsmNumber stored GsmNumber_Specified;
    property MessageId: string  Index (IS_OPTN) read FMessageId write SetMessageId stored MessageId_Specified;
    property Status:    string  Index (IS_OPTN) read FStatus write SetStatus stored Status_Specified;
  end;



  // ************************************************************************ //
  // XML       : clsGroups, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  clsGroups = class(TRemotable)
  private
    FGroupname: string;
    FGroupname_Specified: boolean;
    FGroupid: Integer;
    procedure SetGroupname(Index: Integer; const Astring: string);
    function  Groupname_Specified(Index: Integer): boolean;
  published
    property Groupname: string   Index (IS_OPTN) read FGroupname write SetGroupname stored Groupname_Specified;
    property Groupid:   Integer  read FGroupid write FGroupid;
  end;



  // ************************************************************************ //
  // XML       : LOKInput, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  LOKInput = class(TRemotable)
  private
    FMaxMsisdnCount: Integer;
    FDayHourInterval: string;
    FDayHourInterval_Specified: boolean;
    FCampaignName: string;
    FCampaignName_Specified: boolean;
    FSendType: string;
    FSendType_Specified: boolean;
    FLokArea: ArrayOfLOKArea;
    FLokArea_Specified: boolean;
    procedure SetDayHourInterval(Index: Integer; const Astring: string);
    function  DayHourInterval_Specified(Index: Integer): boolean;
    procedure SetCampaignName(Index: Integer; const Astring: string);
    function  CampaignName_Specified(Index: Integer): boolean;
    procedure SetSendType(Index: Integer; const Astring: string);
    function  SendType_Specified(Index: Integer): boolean;
    procedure SetLokArea(Index: Integer; const AArrayOfLOKArea: ArrayOfLOKArea);
    function  LokArea_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property MaxMsisdnCount:  Integer         read FMaxMsisdnCount write FMaxMsisdnCount;
    property DayHourInterval: string          Index (IS_OPTN) read FDayHourInterval write SetDayHourInterval stored DayHourInterval_Specified;
    property CampaignName:    string          Index (IS_OPTN) read FCampaignName write SetCampaignName stored CampaignName_Specified;
    property SendType:        string          Index (IS_OPTN) read FSendType write SetSendType stored SendType_Specified;
    property LokArea:         ArrayOfLOKArea  Index (IS_OPTN) read FLokArea write SetLokArea stored LokArea_Specified;
  end;



  // ************************************************************************ //
  // XML       : ReportLOKSMSResult, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  ReportLOKSMSResult = class(TRemotable)
  private
    FStatusId: string;
    FStatusId_Specified: boolean;
    FStatusDetailId: string;
    FStatusDetailId_Specified: boolean;
    FRequestMsisdnCount: string;
    FRequestMsisdnCount_Specified: boolean;
    FLoadedMsisdnCount: string;
    FLoadedMsisdnCount_Specified: boolean;
    FSendedMsisdnCount: string;
    FSendedMsisdnCount_Specified: boolean;
    FDeliveredMsisdnCount: string;
    FDeliveredMsisdnCount_Specified: boolean;
    FPricedMsisdnCount: string;
    FPricedMsisdnCount_Specified: boolean;
    FCatchedMsisdnCount: string;
    FCatchedMsisdnCount_Specified: boolean;
    procedure SetStatusId(Index: Integer; const Astring: string);
    function  StatusId_Specified(Index: Integer): boolean;
    procedure SetStatusDetailId(Index: Integer; const Astring: string);
    function  StatusDetailId_Specified(Index: Integer): boolean;
    procedure SetRequestMsisdnCount(Index: Integer; const Astring: string);
    function  RequestMsisdnCount_Specified(Index: Integer): boolean;
    procedure SetLoadedMsisdnCount(Index: Integer; const Astring: string);
    function  LoadedMsisdnCount_Specified(Index: Integer): boolean;
    procedure SetSendedMsisdnCount(Index: Integer; const Astring: string);
    function  SendedMsisdnCount_Specified(Index: Integer): boolean;
    procedure SetDeliveredMsisdnCount(Index: Integer; const Astring: string);
    function  DeliveredMsisdnCount_Specified(Index: Integer): boolean;
    procedure SetPricedMsisdnCount(Index: Integer; const Astring: string);
    function  PricedMsisdnCount_Specified(Index: Integer): boolean;
    procedure SetCatchedMsisdnCount(Index: Integer; const Astring: string);
    function  CatchedMsisdnCount_Specified(Index: Integer): boolean;
  published
    property StatusId:             string  Index (IS_OPTN) read FStatusId write SetStatusId stored StatusId_Specified;
    property StatusDetailId:       string  Index (IS_OPTN) read FStatusDetailId write SetStatusDetailId stored StatusDetailId_Specified;
    property RequestMsisdnCount:   string  Index (IS_OPTN) read FRequestMsisdnCount write SetRequestMsisdnCount stored RequestMsisdnCount_Specified;
    property LoadedMsisdnCount:    string  Index (IS_OPTN) read FLoadedMsisdnCount write SetLoadedMsisdnCount stored LoadedMsisdnCount_Specified;
    property SendedMsisdnCount:    string  Index (IS_OPTN) read FSendedMsisdnCount write SetSendedMsisdnCount stored SendedMsisdnCount_Specified;
    property DeliveredMsisdnCount: string  Index (IS_OPTN) read FDeliveredMsisdnCount write SetDeliveredMsisdnCount stored DeliveredMsisdnCount_Specified;
    property PricedMsisdnCount:    string  Index (IS_OPTN) read FPricedMsisdnCount write SetPricedMsisdnCount stored PricedMsisdnCount_Specified;
    property CatchedMsisdnCount:   string  Index (IS_OPTN) read FCatchedMsisdnCount write SetCatchedMsisdnCount stored CatchedMsisdnCount_Specified;
  end;



  // ************************************************************************ //
  // XML       : clsGroupInfo, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  clsGroupInfo = class(TRemotable)
  private
    FGroupId: Integer;
    FGroupname: string;
    FGroupname_Specified: boolean;
    FAd: string;
    FAd_Specified: boolean;
    FSoyad: string;
    FSoyad_Specified: boolean;
    FNote: string;
    FNote_Specified: boolean;
    FGsmnumber: string;
    FGsmnumber_Specified: boolean;
    procedure SetGroupname(Index: Integer; const Astring: string);
    function  Groupname_Specified(Index: Integer): boolean;
    procedure SetAd(Index: Integer; const Astring: string);
    function  Ad_Specified(Index: Integer): boolean;
    procedure SetSoyad(Index: Integer; const Astring: string);
    function  Soyad_Specified(Index: Integer): boolean;
    procedure SetNote(Index: Integer; const Astring: string);
    function  Note_Specified(Index: Integer): boolean;
    procedure SetGsmnumber(Index: Integer; const Astring: string);
    function  Gsmnumber_Specified(Index: Integer): boolean;
  published
    property GroupId:   Integer  read FGroupId write FGroupId;
    property Groupname: string   Index (IS_OPTN) read FGroupname write SetGroupname stored Groupname_Specified;
    property Ad:        string   Index (IS_OPTN) read FAd write SetAd stored Ad_Specified;
    property Soyad:     string   Index (IS_OPTN) read FSoyad write SetSoyad stored Soyad_Specified;
    property Note:      string   Index (IS_OPTN) read FNote write SetNote stored Note_Specified;
    property Gsmnumber: string   Index (IS_OPTN) read FGsmnumber write SetGsmnumber stored Gsmnumber_Specified;
  end;



  // ************************************************************************ //
  // XML       : clsReverse, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  clsReverse = class(TRemotable)
  private
    FMessages: ArrayOfClsMessage;
    FMessages_Specified: boolean;
    FUnqkey: string;
    FUnqkey_Specified: boolean;
    procedure SetMessages(Index: Integer; const AArrayOfClsMessage: ArrayOfClsMessage);
    function  Messages_Specified(Index: Integer): boolean;
    procedure SetUnqkey(Index: Integer; const Astring: string);
    function  Unqkey_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property Messages: ArrayOfClsMessage  Index (IS_OPTN) read FMessages write SetMessages stored Messages_Specified;
    property Unqkey:   string             Index (IS_OPTN) read FUnqkey write SetUnqkey stored Unqkey_Specified;
  end;



  // ************************************************************************ //
  // XML       : clsMessage, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  clsMessage = class(TRemotable)
  private
    FMessageId: Integer;
    FNumber: string;
    FNumber_Specified: boolean;
    FStatus: Integer;
    FGroupId: string;
    FGroupId_Specified: boolean;
    FReference: string;
    FReference_Specified: boolean;
    FMessage_: string;
    FMessage__Specified: boolean;
    FSendDate: string;
    FSendDate_Specified: boolean;
    procedure SetNumber(Index: Integer; const Astring: string);
    function  Number_Specified(Index: Integer): boolean;
    procedure SetGroupId(Index: Integer; const Astring: string);
    function  GroupId_Specified(Index: Integer): boolean;
    procedure SetReference(Index: Integer; const Astring: string);
    function  Reference_Specified(Index: Integer): boolean;
    procedure SetMessage_(Index: Integer; const Astring: string);
    function  Message__Specified(Index: Integer): boolean;
    procedure SetSendDate(Index: Integer; const Astring: string);
    function  SendDate_Specified(Index: Integer): boolean;
  published
    property MessageId: Integer  read FMessageId write FMessageId;
    property Number:    string   Index (IS_OPTN) read FNumber write SetNumber stored Number_Specified;
    property Status:    Integer  read FStatus write FStatus;
    property GroupId:   string   Index (IS_OPTN) read FGroupId write SetGroupId stored GroupId_Specified;
    property Reference: string   Index (IS_OPTN) read FReference write SetReference stored Reference_Specified;
    property Message_:  string   Index (IS_OPTN) read FMessage_ write SetMessage_ stored Message__Specified;
    property SendDate:  string   Index (IS_OPTN) read FSendDate write SetSendDate stored SendDate_Specified;
  end;

  ArrayOfString = array of string;              { "http://tempuri.org/"[GblCplx] }


  // ************************************************************************ //
  // XML       : ACParameter, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  ACParameter = class(TRemotable)
  private
    FType_: enmACParameterTypes;
    FDT_DisplayText: string;
    FDT_DisplayText_Specified: boolean;
    FDT_SMSText: string;
    FDT_SMSText_Specified: boolean;
    FGI_Text: string;
    FGI_Text_Specified: boolean;
    FGI_Format: enmGIFormat;
    FSI_Text: string;
    FSI_Text_Specified: boolean;
    FGI_MinLength: Integer;
    FGI_MaxLength: Integer;
    FSI_OptionTextList: ArrayOfString;
    FSI_OptionTextList_Specified: boolean;
    FSI_OptionValueList: ArrayOfString;
    FSI_OptionValueList_Specified: boolean;
    procedure SetDT_DisplayText(Index: Integer; const Astring: string);
    function  DT_DisplayText_Specified(Index: Integer): boolean;
    procedure SetDT_SMSText(Index: Integer; const Astring: string);
    function  DT_SMSText_Specified(Index: Integer): boolean;
    procedure SetGI_Text(Index: Integer; const Astring: string);
    function  GI_Text_Specified(Index: Integer): boolean;
    procedure SetSI_Text(Index: Integer; const Astring: string);
    function  SI_Text_Specified(Index: Integer): boolean;
    procedure SetSI_OptionTextList(Index: Integer; const AArrayOfString: ArrayOfString);
    function  SI_OptionTextList_Specified(Index: Integer): boolean;
    procedure SetSI_OptionValueList(Index: Integer; const AArrayOfString: ArrayOfString);
    function  SI_OptionValueList_Specified(Index: Integer): boolean;
  published
    property Type_:              enmACParameterTypes  read FType_ write FType_;
    property DT_DisplayText:     string               Index (IS_OPTN) read FDT_DisplayText write SetDT_DisplayText stored DT_DisplayText_Specified;
    property DT_SMSText:         string               Index (IS_OPTN) read FDT_SMSText write SetDT_SMSText stored DT_SMSText_Specified;
    property GI_Text:            string               Index (IS_OPTN) read FGI_Text write SetGI_Text stored GI_Text_Specified;
    property GI_Format:          enmGIFormat          read FGI_Format write FGI_Format;
    property SI_Text:            string               Index (IS_OPTN) read FSI_Text write SetSI_Text stored SI_Text_Specified;
    property GI_MinLength:       Integer              read FGI_MinLength write FGI_MinLength;
    property GI_MaxLength:       Integer              read FGI_MaxLength write FGI_MaxLength;
    property SI_OptionTextList:  ArrayOfString        Index (IS_OPTN) read FSI_OptionTextList write SetSI_OptionTextList stored SI_OptionTextList_Specified;
    property SI_OptionValueList: ArrayOfString        Index (IS_OPTN) read FSI_OptionValueList write SetSI_OptionValueList stored SI_OptionValueList_Specified;
  end;

  ArrayOfClsTitles = array of clsTitles;        { "http://tempuri.org/"[GblCplx] }


  // ************************************************************************ //
  // XML       : clsTitles, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  clsTitles = class(TRemotable)
  private
    FChannel: string;
    FChannel_Specified: boolean;
    FMessageTitle: string;
    FMessageTitle_Specified: boolean;
    procedure SetChannel(Index: Integer; const Astring: string);
    function  Channel_Specified(Index: Integer): boolean;
    procedure SetMessageTitle(Index: Integer; const Astring: string);
    function  MessageTitle_Specified(Index: Integer): boolean;
  published
    property Channel:      string  Index (IS_OPTN) read FChannel write SetChannel stored Channel_Specified;
    property MessageTitle: string  Index (IS_OPTN) read FMessageTitle write SetMessageTitle stored MessageTitle_Specified;
  end;

  ArrayOfClsGroups = array of clsGroups;        { "http://tempuri.org/"[GblCplx] }


  // ************************************************************************ //
  // XML       : MessageReport, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  MessageReport = class(TRemotable)
  private
    FGsmNumber: string;
    FGsmNumber_Specified: boolean;
    FStatus: string;
    FStatus_Specified: boolean;
    FSentDate: string;
    FSentDate_Specified: boolean;
    FDeliveredDate: string;
    FDeliveredDate_Specified: boolean;
    FMessageId: string;
    FMessageId_Specified: boolean;
    FResponseCode: string;
    FResponseCode_Specified: boolean;
    FSendRetryCount: string;
    FSendRetryCount_Specified: boolean;
    procedure SetGsmNumber(Index: Integer; const Astring: string);
    function  GsmNumber_Specified(Index: Integer): boolean;
    procedure SetStatus(Index: Integer; const Astring: string);
    function  Status_Specified(Index: Integer): boolean;
    procedure SetSentDate(Index: Integer; const Astring: string);
    function  SentDate_Specified(Index: Integer): boolean;
    procedure SetDeliveredDate(Index: Integer; const Astring: string);
    function  DeliveredDate_Specified(Index: Integer): boolean;
    procedure SetMessageId(Index: Integer; const Astring: string);
    function  MessageId_Specified(Index: Integer): boolean;
    procedure SetResponseCode(Index: Integer; const Astring: string);
    function  ResponseCode_Specified(Index: Integer): boolean;
    procedure SetSendRetryCount(Index: Integer; const Astring: string);
    function  SendRetryCount_Specified(Index: Integer): boolean;
  published
    property GsmNumber:      string  Index (IS_OPTN) read FGsmNumber write SetGsmNumber stored GsmNumber_Specified;
    property Status:         string  Index (IS_OPTN) read FStatus write SetStatus stored Status_Specified;
    property SentDate:       string  Index (IS_OPTN) read FSentDate write SetSentDate stored SentDate_Specified;
    property DeliveredDate:  string  Index (IS_OPTN) read FDeliveredDate write SetDeliveredDate stored DeliveredDate_Specified;
    property MessageId:      string  Index (IS_OPTN) read FMessageId write SetMessageId stored MessageId_Specified;
    property ResponseCode:   string  Index (IS_OPTN) read FResponseCode write SetResponseCode stored ResponseCode_Specified;
    property SendRetryCount: string  Index (IS_OPTN) read FSendRetryCount write SetSendRetryCount stored SendRetryCount_Specified;
  end;



  // ************************************************************************ //
  // XML       : ReportSMSResult, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  ReportSMSResult = class(TRemotable)
  private
    FID: string;
    FID_Specified: boolean;
    FPhone: string;
    FPhone_Specified: boolean;
    FStatus: string;
    FStatus_Specified: boolean;
    FSendDate: string;
    FSendDate_Specified: boolean;
    FDeliveredDate: string;
    FDeliveredDate_Specified: boolean;
    FResponseCode: string;
    FResponseCode_Specified: boolean;
    FSendRetryCount: string;
    FSendRetryCount_Specified: boolean;
    procedure SetID(Index: Integer; const Astring: string);
    function  ID_Specified(Index: Integer): boolean;
    procedure SetPhone(Index: Integer; const Astring: string);
    function  Phone_Specified(Index: Integer): boolean;
    procedure SetStatus(Index: Integer; const Astring: string);
    function  Status_Specified(Index: Integer): boolean;
    procedure SetSendDate(Index: Integer; const Astring: string);
    function  SendDate_Specified(Index: Integer): boolean;
    procedure SetDeliveredDate(Index: Integer; const Astring: string);
    function  DeliveredDate_Specified(Index: Integer): boolean;
    procedure SetResponseCode(Index: Integer; const Astring: string);
    function  ResponseCode_Specified(Index: Integer): boolean;
    procedure SetSendRetryCount(Index: Integer; const Astring: string);
    function  SendRetryCount_Specified(Index: Integer): boolean;
  published
    property ID:             string  Index (IS_OPTN) read FID write SetID stored ID_Specified;
    property Phone:          string  Index (IS_OPTN) read FPhone write SetPhone stored Phone_Specified;
    property Status:         string  Index (IS_OPTN) read FStatus write SetStatus stored Status_Specified;
    property SendDate:       string  Index (IS_OPTN) read FSendDate write SetSendDate stored SendDate_Specified;
    property DeliveredDate:  string  Index (IS_OPTN) read FDeliveredDate write SetDeliveredDate stored DeliveredDate_Specified;
    property ResponseCode:   string  Index (IS_OPTN) read FResponseCode write SetResponseCode stored ResponseCode_Specified;
    property SendRetryCount: string  Index (IS_OPTN) read FSendRetryCount write SetSendRetryCount stored SendRetryCount_Specified;
  end;

  ArrayOfMessageReport = array of MessageReport;   { "http://tempuri.org/"[GblCplx] }


  // ************************************************************************ //
  // XML       : MessageResponseV2, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  MessageResponseV2 = class(TRemotable)
  private
    FResponseCode: string;
    FResponseCode_Specified: boolean;
    FResponseMessage: string;
    FResponseMessage_Specified: boolean;
    FMessageReportArray: ArrayOfMessageReport;
    FMessageReportArray_Specified: boolean;
    procedure SetResponseCode(Index: Integer; const Astring: string);
    function  ResponseCode_Specified(Index: Integer): boolean;
    procedure SetResponseMessage(Index: Integer; const Astring: string);
    function  ResponseMessage_Specified(Index: Integer): boolean;
    procedure SetMessageReportArray(Index: Integer; const AArrayOfMessageReport: ArrayOfMessageReport);
    function  MessageReportArray_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property ResponseCode:       string                Index (IS_OPTN) read FResponseCode write SetResponseCode stored ResponseCode_Specified;
    property ResponseMessage:    string                Index (IS_OPTN) read FResponseMessage write SetResponseMessage stored ResponseMessage_Specified;
    property MessageReportArray: ArrayOfMessageReport  Index (IS_OPTN) read FMessageReportArray write SetMessageReportArray stored MessageReportArray_Specified;
  end;

  ArrayOfIYSReportErrorItem = array of IYSReportErrorItem;   { "http://tempuri.org/"[GblCplx] }


  // ************************************************************************ //
  // XML       : IYSReportErrorItem, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  IYSReportErrorItem = class(TRemotable)
  private
    FErrCode: string;
    FErrCode_Specified: boolean;
    FErrDesc: string;
    FErrDesc_Specified: boolean;
    FErrRecipient: string;
    FErrRecipient_Specified: boolean;
    procedure SetErrCode(Index: Integer; const Astring: string);
    function  ErrCode_Specified(Index: Integer): boolean;
    procedure SetErrDesc(Index: Integer; const Astring: string);
    function  ErrDesc_Specified(Index: Integer): boolean;
    procedure SetErrRecipient(Index: Integer; const Astring: string);
    function  ErrRecipient_Specified(Index: Integer): boolean;
  published
    property ErrCode:      string  Index (IS_OPTN) read FErrCode write SetErrCode stored ErrCode_Specified;
    property ErrDesc:      string  Index (IS_OPTN) read FErrDesc write SetErrDesc stored ErrDesc_Specified;
    property ErrRecipient: string  Index (IS_OPTN) read FErrRecipient write SetErrRecipient stored ErrRecipient_Specified;
  end;

  ArrayOfAddress = array of Address;            { "http://tempuri.org/"[GblCplx] }
  ArrayOfIYSRequestList = array of IYSRequestList;   { "http://tempuri.org/"[GblCplx] }


  // ************************************************************************ //
  // XML       : IYSRequestList, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  IYSRequestList = class(TRemotable)
  private
    Frecipient: string;
    Frecipient_Specified: boolean;
    FrecipientType: string;
    FrecipientType_Specified: boolean;
    Ftype_: string;
    Ftype__Specified: boolean;
    FconsentDate: string;
    FconsentDate_Specified: boolean;
    Fstatus: string;
    Fstatus_Specified: boolean;
    Fsource: string;
    Fsource_Specified: boolean;
    procedure Setrecipient(Index: Integer; const Astring: string);
    function  recipient_Specified(Index: Integer): boolean;
    procedure SetrecipientType(Index: Integer; const Astring: string);
    function  recipientType_Specified(Index: Integer): boolean;
    procedure Settype_(Index: Integer; const Astring: string);
    function  type__Specified(Index: Integer): boolean;
    procedure SetconsentDate(Index: Integer; const Astring: string);
    function  consentDate_Specified(Index: Integer): boolean;
    procedure Setstatus(Index: Integer; const Astring: string);
    function  status_Specified(Index: Integer): boolean;
    procedure Setsource(Index: Integer; const Astring: string);
    function  source_Specified(Index: Integer): boolean;
  published
    property recipient:     string  Index (IS_OPTN) read Frecipient write Setrecipient stored recipient_Specified;
    property recipientType: string  Index (IS_OPTN) read FrecipientType write SetrecipientType stored recipientType_Specified;
    property type_:         string  Index (IS_OPTN) read Ftype_ write Settype_ stored type__Specified;
    property consentDate:   string  Index (IS_OPTN) read FconsentDate write SetconsentDate stored consentDate_Specified;
    property status:        string  Index (IS_OPTN) read Fstatus write Setstatus stored status_Specified;
    property source:        string  Index (IS_OPTN) read Fsource write Setsource stored source_Specified;
  end;



  // ************************************************************************ //
  // XML       : IYSResult, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  IYSResult = class(TRemotable)
  private
    FErrorCode: string;
    FErrorCode_Specified: boolean;
    FID: string;
    FID_Specified: boolean;
    procedure SetErrorCode(Index: Integer; const Astring: string);
    function  ErrorCode_Specified(Index: Integer): boolean;
    procedure SetID(Index: Integer; const Astring: string);
    function  ID_Specified(Index: Integer): boolean;
  published
    property ErrorCode: string  Index (IS_OPTN) read FErrorCode write SetErrorCode stored ErrorCode_Specified;
    property ID:        string  Index (IS_OPTN) read FID write SetID stored ID_Specified;
  end;



  // ************************************************************************ //
  // XML       : Ekstra, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  Ekstra = class(TRemotable)
  private
    FFieldName: string;
    FFieldName_Specified: boolean;
    FFieldValue: string;
    FFieldValue_Specified: boolean;
    procedure SetFieldName(Index: Integer; const Astring: string);
    function  FieldName_Specified(Index: Integer): boolean;
    procedure SetFieldValue(Index: Integer; const Astring: string);
    function  FieldValue_Specified(Index: Integer): boolean;
  published
    property FieldName:  string  Index (IS_OPTN) read FFieldName write SetFieldName stored FieldName_Specified;
    property FieldValue: string  Index (IS_OPTN) read FFieldValue write SetFieldValue stored FieldValue_Specified;
  end;

  ArrayOfEkstra = array of Ekstra;              { "http://tempuri.org/"[GblCplx] }


  // ************************************************************************ //
  // XML       : Address, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  Address = class(TRemotable)
  private
    FGSM_NUMBER: string;
    FGSM_NUMBER_Specified: boolean;
    FADDRESS: string;
    FADDRESS_Specified: boolean;
    FCITY: string;
    FCITY_Specified: boolean;
    FFIRST_NAME: string;
    FFIRST_NAME_Specified: boolean;
    FLAST_NAME: string;
    FLAST_NAME_Specified: boolean;
    FEMAIL: string;
    FEMAIL_Specified: boolean;
    FNOTE: string;
    FNOTE_Specified: boolean;
    FCOUNTRY: string;
    FCOUNTRY_Specified: boolean;
    FBIRTHDATE: string;
    FBIRTHDATE_Specified: boolean;
    FCOMPANY: string;
    FCOMPANY_Specified: boolean;
    FTITLE: string;
    FTITLE_Specified: boolean;
    FGENDER: Gender;
    FTEL_NUMBER: string;
    FTEL_NUMBER_Specified: boolean;
    FFAX_NUMBER: string;
    FFAX_NUMBER_Specified: boolean;
    FBLOOD_GROUP: BloodGroup;
    FIDENTIFICATION_NUMBER: string;
    FIDENTIFICATION_NUMBER_Specified: boolean;
    FEKSTRA: ArrayOfEkstra;
    FEKSTRA_Specified: boolean;
    procedure SetGSM_NUMBER(Index: Integer; const Astring: string);
    function  GSM_NUMBER_Specified(Index: Integer): boolean;
    procedure SetADDRESS(Index: Integer; const Astring: string);
    function  ADDRESS_Specified(Index: Integer): boolean;
    procedure SetCITY(Index: Integer; const Astring: string);
    function  CITY_Specified(Index: Integer): boolean;
    procedure SetFIRST_NAME(Index: Integer; const Astring: string);
    function  FIRST_NAME_Specified(Index: Integer): boolean;
    procedure SetLAST_NAME(Index: Integer; const Astring: string);
    function  LAST_NAME_Specified(Index: Integer): boolean;
    procedure SetEMAIL(Index: Integer; const Astring: string);
    function  EMAIL_Specified(Index: Integer): boolean;
    procedure SetNOTE(Index: Integer; const Astring: string);
    function  NOTE_Specified(Index: Integer): boolean;
    procedure SetCOUNTRY(Index: Integer; const Astring: string);
    function  COUNTRY_Specified(Index: Integer): boolean;
    procedure SetBIRTHDATE(Index: Integer; const Astring: string);
    function  BIRTHDATE_Specified(Index: Integer): boolean;
    procedure SetCOMPANY(Index: Integer; const Astring: string);
    function  COMPANY_Specified(Index: Integer): boolean;
    procedure SetTITLE(Index: Integer; const Astring: string);
    function  TITLE_Specified(Index: Integer): boolean;
    procedure SetTEL_NUMBER(Index: Integer; const Astring: string);
    function  TEL_NUMBER_Specified(Index: Integer): boolean;
    procedure SetFAX_NUMBER(Index: Integer; const Astring: string);
    function  FAX_NUMBER_Specified(Index: Integer): boolean;
    procedure SetIDENTIFICATION_NUMBER(Index: Integer; const Astring: string);
    function  IDENTIFICATION_NUMBER_Specified(Index: Integer): boolean;
    procedure SetEKSTRA(Index: Integer; const AArrayOfEkstra: ArrayOfEkstra);
    function  EKSTRA_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property GSM_NUMBER:            string         Index (IS_OPTN) read FGSM_NUMBER write SetGSM_NUMBER stored GSM_NUMBER_Specified;
    property ADDRESS:               string         Index (IS_OPTN) read FADDRESS write SetADDRESS stored ADDRESS_Specified;
    property CITY:                  string         Index (IS_OPTN) read FCITY write SetCITY stored CITY_Specified;
    property FIRST_NAME:            string         Index (IS_OPTN) read FFIRST_NAME write SetFIRST_NAME stored FIRST_NAME_Specified;
    property LAST_NAME:             string         Index (IS_OPTN) read FLAST_NAME write SetLAST_NAME stored LAST_NAME_Specified;
    property EMAIL:                 string         Index (IS_OPTN) read FEMAIL write SetEMAIL stored EMAIL_Specified;
    property NOTE:                  string         Index (IS_OPTN) read FNOTE write SetNOTE stored NOTE_Specified;
    property COUNTRY:               string         Index (IS_OPTN) read FCOUNTRY write SetCOUNTRY stored COUNTRY_Specified;
    property BIRTHDATE:             string         Index (IS_OPTN) read FBIRTHDATE write SetBIRTHDATE stored BIRTHDATE_Specified;
    property COMPANY:               string         Index (IS_OPTN) read FCOMPANY write SetCOMPANY stored COMPANY_Specified;
    property TITLE:                 string         Index (IS_OPTN) read FTITLE write SetTITLE stored TITLE_Specified;
    property GENDER:                Gender         read FGENDER write FGENDER;
    property TEL_NUMBER:            string         Index (IS_OPTN) read FTEL_NUMBER write SetTEL_NUMBER stored TEL_NUMBER_Specified;
    property FAX_NUMBER:            string         Index (IS_OPTN) read FFAX_NUMBER write SetFAX_NUMBER stored FAX_NUMBER_Specified;
    property BLOOD_GROUP:           BloodGroup     read FBLOOD_GROUP write FBLOOD_GROUP;
    property IDENTIFICATION_NUMBER: string         Index (IS_OPTN) read FIDENTIFICATION_NUMBER write SetIDENTIFICATION_NUMBER stored IDENTIFICATION_NUMBER_Specified;
    property EKSTRA:                ArrayOfEkstra  Index (IS_OPTN) read FEKSTRA write SetEKSTRA stored EKSTRA_Specified;
  end;



  // ************************************************************************ //
  // XML       : ReportFields, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  ReportFields = class(TRemotable)
  private
    FGsmValue: string;
    FGsmValue_Specified: boolean;
    FTextValue: string;
    FTextValue_Specified: boolean;
    FStatusValue: string;
    FStatusValue_Specified: boolean;
    FStatusIdValue: string;
    FStatusIdValue_Specified: boolean;
    FResponseCodeValue: string;
    FResponseCodeValue_Specified: boolean;
    FGroupsValue: string;
    FGroupsValue_Specified: boolean;
    FNameSurnameValue: string;
    FNameSurnameValue_Specified: boolean;
    FNoteValue: string;
    FNoteValue_Specified: boolean;
    FEkstraValue: string;
    FEkstraValue_Specified: boolean;
    FBulkValue: string;
    FBulkValue_Specified: boolean;
    FCidValue: string;
    FCidValue_Specified: boolean;
    FSmppValue: string;
    FSmppValue_Specified: boolean;
    FChannelValue: string;
    FChannelValue_Specified: boolean;
    FTotalSmsValue: string;
    FTotalSmsValue_Specified: boolean;
    FProcessDateValue: string;
    FProcessDateValue_Specified: boolean;
    FProcessTimeValue: string;
    FProcessTimeValue_Specified: boolean;
    FSendDateValue: string;
    FSendDateValue_Specified: boolean;
    FSendTimeValue: string;
    FSendTimeValue_Specified: boolean;
    FDeliverDateValue: string;
    FDeliverDateValue_Specified: boolean;
    FDeliverTimeValue: string;
    FDeliverTimeValue_Specified: boolean;
    FIsDifferValue: string;
    FIsDifferValue_Specified: boolean;
    FCustomerDescValue: string;
    FCustomerDescValue_Specified: boolean;
    FUserValue: string;
    FUserValue_Specified: boolean;
    FTitleValue: string;
    FTitleValue_Specified: boolean;
    FReferansValue: string;
    FReferansValue_Specified: boolean;
    FStatusDescValue: string;
    FStatusDescValue_Specified: boolean;
    FStatusDetailValue: string;
    FStatusDetailValue_Specified: boolean;
    FPricedValue: string;
    FPricedValue_Specified: boolean;
    FProcessNoteValue: string;
    FProcessNoteValue_Specified: boolean;
    FMessageGroupId: string;
    FMessageGroupId_Specified: boolean;
    FMessageId: string;
    FMessageId_Specified: boolean;
    FAbroadValue: string;
    FAbroadValue_Specified: boolean;
    FUniqueIdValue: string;
    FUniqueIdValue_Specified: boolean;
    FReportDateValue: string;
    FReportDateValue_Specified: boolean;
    FIsAlive: string;
    FIsAlive_Specified: boolean;
    procedure SetGsmValue(Index: Integer; const Astring: string);
    function  GsmValue_Specified(Index: Integer): boolean;
    procedure SetTextValue(Index: Integer; const Astring: string);
    function  TextValue_Specified(Index: Integer): boolean;
    procedure SetStatusValue(Index: Integer; const Astring: string);
    function  StatusValue_Specified(Index: Integer): boolean;
    procedure SetStatusIdValue(Index: Integer; const Astring: string);
    function  StatusIdValue_Specified(Index: Integer): boolean;
    procedure SetResponseCodeValue(Index: Integer; const Astring: string);
    function  ResponseCodeValue_Specified(Index: Integer): boolean;
    procedure SetGroupsValue(Index: Integer; const Astring: string);
    function  GroupsValue_Specified(Index: Integer): boolean;
    procedure SetNameSurnameValue(Index: Integer; const Astring: string);
    function  NameSurnameValue_Specified(Index: Integer): boolean;
    procedure SetNoteValue(Index: Integer; const Astring: string);
    function  NoteValue_Specified(Index: Integer): boolean;
    procedure SetEkstraValue(Index: Integer; const Astring: string);
    function  EkstraValue_Specified(Index: Integer): boolean;
    procedure SetBulkValue(Index: Integer; const Astring: string);
    function  BulkValue_Specified(Index: Integer): boolean;
    procedure SetCidValue(Index: Integer; const Astring: string);
    function  CidValue_Specified(Index: Integer): boolean;
    procedure SetSmppValue(Index: Integer; const Astring: string);
    function  SmppValue_Specified(Index: Integer): boolean;
    procedure SetChannelValue(Index: Integer; const Astring: string);
    function  ChannelValue_Specified(Index: Integer): boolean;
    procedure SetTotalSmsValue(Index: Integer; const Astring: string);
    function  TotalSmsValue_Specified(Index: Integer): boolean;
    procedure SetProcessDateValue(Index: Integer; const Astring: string);
    function  ProcessDateValue_Specified(Index: Integer): boolean;
    procedure SetProcessTimeValue(Index: Integer; const Astring: string);
    function  ProcessTimeValue_Specified(Index: Integer): boolean;
    procedure SetSendDateValue(Index: Integer; const Astring: string);
    function  SendDateValue_Specified(Index: Integer): boolean;
    procedure SetSendTimeValue(Index: Integer; const Astring: string);
    function  SendTimeValue_Specified(Index: Integer): boolean;
    procedure SetDeliverDateValue(Index: Integer; const Astring: string);
    function  DeliverDateValue_Specified(Index: Integer): boolean;
    procedure SetDeliverTimeValue(Index: Integer; const Astring: string);
    function  DeliverTimeValue_Specified(Index: Integer): boolean;
    procedure SetIsDifferValue(Index: Integer; const Astring: string);
    function  IsDifferValue_Specified(Index: Integer): boolean;
    procedure SetCustomerDescValue(Index: Integer; const Astring: string);
    function  CustomerDescValue_Specified(Index: Integer): boolean;
    procedure SetUserValue(Index: Integer; const Astring: string);
    function  UserValue_Specified(Index: Integer): boolean;
    procedure SetTitleValue(Index: Integer; const Astring: string);
    function  TitleValue_Specified(Index: Integer): boolean;
    procedure SetReferansValue(Index: Integer; const Astring: string);
    function  ReferansValue_Specified(Index: Integer): boolean;
    procedure SetStatusDescValue(Index: Integer; const Astring: string);
    function  StatusDescValue_Specified(Index: Integer): boolean;
    procedure SetStatusDetailValue(Index: Integer; const Astring: string);
    function  StatusDetailValue_Specified(Index: Integer): boolean;
    procedure SetPricedValue(Index: Integer; const Astring: string);
    function  PricedValue_Specified(Index: Integer): boolean;
    procedure SetProcessNoteValue(Index: Integer; const Astring: string);
    function  ProcessNoteValue_Specified(Index: Integer): boolean;
    procedure SetMessageGroupId(Index: Integer; const Astring: string);
    function  MessageGroupId_Specified(Index: Integer): boolean;
    procedure SetMessageId(Index: Integer; const Astring: string);
    function  MessageId_Specified(Index: Integer): boolean;
    procedure SetAbroadValue(Index: Integer; const Astring: string);
    function  AbroadValue_Specified(Index: Integer): boolean;
    procedure SetUniqueIdValue(Index: Integer; const Astring: string);
    function  UniqueIdValue_Specified(Index: Integer): boolean;
    procedure SetReportDateValue(Index: Integer; const Astring: string);
    function  ReportDateValue_Specified(Index: Integer): boolean;
    procedure SetIsAlive(Index: Integer; const Astring: string);
    function  IsAlive_Specified(Index: Integer): boolean;
  published
    property GsmValue:          string  Index (IS_OPTN) read FGsmValue write SetGsmValue stored GsmValue_Specified;
    property TextValue:         string  Index (IS_OPTN) read FTextValue write SetTextValue stored TextValue_Specified;
    property StatusValue:       string  Index (IS_OPTN) read FStatusValue write SetStatusValue stored StatusValue_Specified;
    property StatusIdValue:     string  Index (IS_OPTN) read FStatusIdValue write SetStatusIdValue stored StatusIdValue_Specified;
    property ResponseCodeValue: string  Index (IS_OPTN) read FResponseCodeValue write SetResponseCodeValue stored ResponseCodeValue_Specified;
    property GroupsValue:       string  Index (IS_OPTN) read FGroupsValue write SetGroupsValue stored GroupsValue_Specified;
    property NameSurnameValue:  string  Index (IS_OPTN) read FNameSurnameValue write SetNameSurnameValue stored NameSurnameValue_Specified;
    property NoteValue:         string  Index (IS_OPTN) read FNoteValue write SetNoteValue stored NoteValue_Specified;
    property EkstraValue:       string  Index (IS_OPTN) read FEkstraValue write SetEkstraValue stored EkstraValue_Specified;
    property BulkValue:         string  Index (IS_OPTN) read FBulkValue write SetBulkValue stored BulkValue_Specified;
    property CidValue:          string  Index (IS_OPTN) read FCidValue write SetCidValue stored CidValue_Specified;
    property SmppValue:         string  Index (IS_OPTN) read FSmppValue write SetSmppValue stored SmppValue_Specified;
    property ChannelValue:      string  Index (IS_OPTN) read FChannelValue write SetChannelValue stored ChannelValue_Specified;
    property TotalSmsValue:     string  Index (IS_OPTN) read FTotalSmsValue write SetTotalSmsValue stored TotalSmsValue_Specified;
    property ProcessDateValue:  string  Index (IS_OPTN) read FProcessDateValue write SetProcessDateValue stored ProcessDateValue_Specified;
    property ProcessTimeValue:  string  Index (IS_OPTN) read FProcessTimeValue write SetProcessTimeValue stored ProcessTimeValue_Specified;
    property SendDateValue:     string  Index (IS_OPTN) read FSendDateValue write SetSendDateValue stored SendDateValue_Specified;
    property SendTimeValue:     string  Index (IS_OPTN) read FSendTimeValue write SetSendTimeValue stored SendTimeValue_Specified;
    property DeliverDateValue:  string  Index (IS_OPTN) read FDeliverDateValue write SetDeliverDateValue stored DeliverDateValue_Specified;
    property DeliverTimeValue:  string  Index (IS_OPTN) read FDeliverTimeValue write SetDeliverTimeValue stored DeliverTimeValue_Specified;
    property IsDifferValue:     string  Index (IS_OPTN) read FIsDifferValue write SetIsDifferValue stored IsDifferValue_Specified;
    property CustomerDescValue: string  Index (IS_OPTN) read FCustomerDescValue write SetCustomerDescValue stored CustomerDescValue_Specified;
    property UserValue:         string  Index (IS_OPTN) read FUserValue write SetUserValue stored UserValue_Specified;
    property TitleValue:        string  Index (IS_OPTN) read FTitleValue write SetTitleValue stored TitleValue_Specified;
    property ReferansValue:     string  Index (IS_OPTN) read FReferansValue write SetReferansValue stored ReferansValue_Specified;
    property StatusDescValue:   string  Index (IS_OPTN) read FStatusDescValue write SetStatusDescValue stored StatusDescValue_Specified;
    property StatusDetailValue: string  Index (IS_OPTN) read FStatusDetailValue write SetStatusDetailValue stored StatusDetailValue_Specified;
    property PricedValue:       string  Index (IS_OPTN) read FPricedValue write SetPricedValue stored PricedValue_Specified;
    property ProcessNoteValue:  string  Index (IS_OPTN) read FProcessNoteValue write SetProcessNoteValue stored ProcessNoteValue_Specified;
    property MessageGroupId:    string  Index (IS_OPTN) read FMessageGroupId write SetMessageGroupId stored MessageGroupId_Specified;
    property MessageId:         string  Index (IS_OPTN) read FMessageId write SetMessageId stored MessageId_Specified;
    property AbroadValue:       string  Index (IS_OPTN) read FAbroadValue write SetAbroadValue stored AbroadValue_Specified;
    property UniqueIdValue:     string  Index (IS_OPTN) read FUniqueIdValue write SetUniqueIdValue stored UniqueIdValue_Specified;
    property ReportDateValue:   string  Index (IS_OPTN) read FReportDateValue write SetReportDateValue stored ReportDateValue_Specified;
    property IsAlive:           string  Index (IS_OPTN) read FIsAlive write SetIsAlive stored IsAlive_Specified;
  end;

  ArrayOfReportSMSDetailedResult = array of ReportSMSDetailedResult;   { "http://tempuri.org/"[GblCplx] }


  // ************************************************************************ //
  // XML       : ReportSMSDetailedResult, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  ReportSMSDetailedResult = class(TRemotable)
  private
    FID: string;
    FID_Specified: boolean;
    FPhone: string;
    FPhone_Specified: boolean;
    FStatus: string;
    FStatus_Specified: boolean;
    FSendDate: string;
    FSendDate_Specified: boolean;
    FDeliveredDate: string;
    FDeliveredDate_Specified: boolean;
    FOriginator: string;
    FOriginator_Specified: boolean;
    FCreateDate: string;
    FCreateDate_Specified: boolean;
    FMessageText: string;
    FMessageText_Specified: boolean;
    FResponseCode: string;
    FResponseCode_Specified: boolean;
    FSendRetryCount: string;
    FSendRetryCount_Specified: boolean;
    procedure SetID(Index: Integer; const Astring: string);
    function  ID_Specified(Index: Integer): boolean;
    procedure SetPhone(Index: Integer; const Astring: string);
    function  Phone_Specified(Index: Integer): boolean;
    procedure SetStatus(Index: Integer; const Astring: string);
    function  Status_Specified(Index: Integer): boolean;
    procedure SetSendDate(Index: Integer; const Astring: string);
    function  SendDate_Specified(Index: Integer): boolean;
    procedure SetDeliveredDate(Index: Integer; const Astring: string);
    function  DeliveredDate_Specified(Index: Integer): boolean;
    procedure SetOriginator(Index: Integer; const Astring: string);
    function  Originator_Specified(Index: Integer): boolean;
    procedure SetCreateDate(Index: Integer; const Astring: string);
    function  CreateDate_Specified(Index: Integer): boolean;
    procedure SetMessageText(Index: Integer; const Astring: string);
    function  MessageText_Specified(Index: Integer): boolean;
    procedure SetResponseCode(Index: Integer; const Astring: string);
    function  ResponseCode_Specified(Index: Integer): boolean;
    procedure SetSendRetryCount(Index: Integer; const Astring: string);
    function  SendRetryCount_Specified(Index: Integer): boolean;
  published
    property ID:             string  Index (IS_OPTN) read FID write SetID stored ID_Specified;
    property Phone:          string  Index (IS_OPTN) read FPhone write SetPhone stored Phone_Specified;
    property Status:         string  Index (IS_OPTN) read FStatus write SetStatus stored Status_Specified;
    property SendDate:       string  Index (IS_OPTN) read FSendDate write SetSendDate stored SendDate_Specified;
    property DeliveredDate:  string  Index (IS_OPTN) read FDeliveredDate write SetDeliveredDate stored DeliveredDate_Specified;
    property Originator:     string  Index (IS_OPTN) read FOriginator write SetOriginator stored Originator_Specified;
    property CreateDate:     string  Index (IS_OPTN) read FCreateDate write SetCreateDate stored CreateDate_Specified;
    property MessageText:    string  Index (IS_OPTN) read FMessageText write SetMessageText stored MessageText_Specified;
    property ResponseCode:   string  Index (IS_OPTN) read FResponseCode write SetResponseCode stored ResponseCode_Specified;
    property SendRetryCount: string  Index (IS_OPTN) read FSendRetryCount write SetSendRetryCount stored SendRetryCount_Specified;
  end;



  // ************************************************************************ //
  // XML       : CreditResult, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  CreditResult = class(TRemotable)
  private
    FErrorCode: string;
    FErrorCode_Specified: boolean;
    FErrorDesc: string;
    FErrorDesc_Specified: boolean;
    FBalance: TXSDecimal;
    FBalanceDateTime: string;
    FBalanceDateTime_Specified: boolean;
    procedure SetErrorCode(Index: Integer; const Astring: string);
    function  ErrorCode_Specified(Index: Integer): boolean;
    procedure SetErrorDesc(Index: Integer; const Astring: string);
    function  ErrorDesc_Specified(Index: Integer): boolean;
    procedure SetBalanceDateTime(Index: Integer; const Astring: string);
    function  BalanceDateTime_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property ErrorCode:       string      Index (IS_OPTN) read FErrorCode write SetErrorCode stored ErrorCode_Specified;
    property ErrorDesc:       string      Index (IS_OPTN) read FErrorDesc write SetErrorDesc stored ErrorDesc_Specified;
    property Balance:         TXSDecimal  read FBalance write FBalance;
    property BalanceDateTime: string      Index (IS_OPTN) read FBalanceDateTime write SetBalanceDateTime stored BalanceDateTime_Specified;
  end;

  ArrayOfAttributeValue = array of AttributeValue;   { "http://tempuri.org/"[GblCplx] }


  // ************************************************************************ //
  // XML       : AttributeValuesResult, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  AttributeValuesResult = class(TRemotable)
  private
    FErrorCode: string;
    FErrorCode_Specified: boolean;
    FErrorDesc: string;
    FErrorDesc_Specified: boolean;
    FValues: ArrayOfAttributeValue;
    FValues_Specified: boolean;
    procedure SetErrorCode(Index: Integer; const Astring: string);
    function  ErrorCode_Specified(Index: Integer): boolean;
    procedure SetErrorDesc(Index: Integer; const Astring: string);
    function  ErrorDesc_Specified(Index: Integer): boolean;
    procedure SetValues(Index: Integer; const AArrayOfAttributeValue: ArrayOfAttributeValue);
    function  Values_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property ErrorCode: string                 Index (IS_OPTN) read FErrorCode write SetErrorCode stored ErrorCode_Specified;
    property ErrorDesc: string                 Index (IS_OPTN) read FErrorDesc write SetErrorDesc stored ErrorDesc_Specified;
    property Values:    ArrayOfAttributeValue  Index (IS_OPTN) read FValues write SetValues stored Values_Specified;
  end;



  // ************************************************************************ //
  // XML       : AttributeValue, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  AttributeValue = class(TRemotable)
  private
    FID: string;
    FID_Specified: boolean;
    FValue: string;
    FValue_Specified: boolean;
    procedure SetID(Index: Integer; const Astring: string);
    function  ID_Specified(Index: Integer): boolean;
    procedure SetValue(Index: Integer; const Astring: string);
    function  Value_Specified(Index: Integer): boolean;
  published
    property ID:    string  Index (IS_OPTN) read FID write SetID stored ID_Specified;
    property Value: string  Index (IS_OPTN) read FValue write SetValue stored Value_Specified;
  end;



  // ************************************************************************ //
  // XML       : GroupResult, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  GroupResult = class(TRemotable)
  private
    FErrorCode: string;
    FErrorCode_Specified: boolean;
    FErrorDesc: string;
    FErrorDesc_Specified: boolean;
    FCount: string;
    FCount_Specified: boolean;
    procedure SetErrorCode(Index: Integer; const Astring: string);
    function  ErrorCode_Specified(Index: Integer): boolean;
    procedure SetErrorDesc(Index: Integer; const Astring: string);
    function  ErrorDesc_Specified(Index: Integer): boolean;
    procedure SetCount(Index: Integer; const Astring: string);
    function  Count_Specified(Index: Integer): boolean;
  published
    property ErrorCode: string  Index (IS_OPTN) read FErrorCode write SetErrorCode stored ErrorCode_Specified;
    property ErrorDesc: string  Index (IS_OPTN) read FErrorDesc write SetErrorDesc stored ErrorDesc_Specified;
    property Count:     string  Index (IS_OPTN) read FCount write SetCount stored Count_Specified;
  end;



  // ************************************************************************ //
  // XML       : IYSReportResult, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  IYSReportResult = class(TRemotable)
  private
    FReportResult: IYSResult;
    FReportResult_Specified: boolean;
    FSuccessCount: Integer;
    FEnqueueCount: Integer;
    FFailCount: Integer;
    FFailRecords: ArrayOfIYSReportErrorItem;
    FFailRecords_Specified: boolean;
    FStatus: Integer;
    FHasError: Boolean;
    procedure SetReportResult(Index: Integer; const AIYSResult: IYSResult);
    function  ReportResult_Specified(Index: Integer): boolean;
    procedure SetFailRecords(Index: Integer; const AArrayOfIYSReportErrorItem: ArrayOfIYSReportErrorItem);
    function  FailRecords_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property ReportResult: IYSResult                  Index (IS_OPTN) read FReportResult write SetReportResult stored ReportResult_Specified;
    property SuccessCount: Integer                    read FSuccessCount write FSuccessCount;
    property EnqueueCount: Integer                    read FEnqueueCount write FEnqueueCount;
    property FailCount:    Integer                    read FFailCount write FFailCount;
    property FailRecords:  ArrayOfIYSReportErrorItem  Index (IS_OPTN) read FFailRecords write SetFailRecords stored FailRecords_Specified;
    property Status:       Integer                    read FStatus write FStatus;
    property HasError:     Boolean                    read FHasError write FHasError;
  end;

  ArrayOfReportFields = array of ReportFields;   { "http://tempuri.org/"[GblCplx] }


  // ************************************************************************ //
  // XML       : ReportSMSDetailedResult_v3, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  ReportSMSDetailedResult_v3 = class(TRemotable)
  private
    FStatus: string;
    FStatus_Specified: boolean;
    FStatusDesc: string;
    FStatusDesc_Specified: boolean;
    FData: ArrayOfReportFields;
    FData_Specified: boolean;
    procedure SetStatus(Index: Integer; const Astring: string);
    function  Status_Specified(Index: Integer): boolean;
    procedure SetStatusDesc(Index: Integer; const Astring: string);
    function  StatusDesc_Specified(Index: Integer): boolean;
    procedure SetData(Index: Integer; const AArrayOfReportFields: ArrayOfReportFields);
    function  Data_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property Status:     string               Index (IS_OPTN) read FStatus write SetStatus stored Status_Specified;
    property StatusDesc: string               Index (IS_OPTN) read FStatusDesc write SetStatusDesc stored StatusDesc_Specified;
    property Data:       ArrayOfReportFields  Index (IS_OPTN) read FData write SetData stored Data_Specified;
  end;



  // ************************************************************************ //
  // XML       : MsisdnBL, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  MsisdnBL = class(TRemotable)
  private
    FMsisdn: string;
    FMsisdn_Specified: boolean;
    FBlacklist: Boolean;
    procedure SetMsisdn(Index: Integer; const Astring: string);
    function  Msisdn_Specified(Index: Integer): boolean;
  published
    property Msisdn:    string   Index (IS_OPTN) read FMsisdn write SetMsisdn stored Msisdn_Specified;
    property Blacklist: Boolean  read FBlacklist write FBlacklist;
  end;



  // ************************************************************************ //
  // XML       : ReportSMSDetailedResult_v2, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  ReportSMSDetailedResult_v2 = class(TRemotable)
  private
    FStatus: string;
    FStatus_Specified: boolean;
    FStatusDesc: string;
    FStatusDesc_Specified: boolean;
    FUrl: string;
    FUrl_Specified: boolean;
    procedure SetStatus(Index: Integer; const Astring: string);
    function  Status_Specified(Index: Integer): boolean;
    procedure SetStatusDesc(Index: Integer; const Astring: string);
    function  StatusDesc_Specified(Index: Integer): boolean;
    procedure SetUrl(Index: Integer; const Astring: string);
    function  Url_Specified(Index: Integer): boolean;
  published
    property Status:     string  Index (IS_OPTN) read FStatus write SetStatus stored Status_Specified;
    property StatusDesc: string  Index (IS_OPTN) read FStatusDesc write SetStatusDesc stored StatusDesc_Specified;
    property Url:        string  Index (IS_OPTN) read FUrl write SetUrl stored Url_Specified;
  end;

  ArrayOfMsisdnBL = array of MsisdnBL;          { "http://tempuri.org/"[GblCplx] }


  // ************************************************************************ //
  // XML       : CheckBLResult, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  CheckBLResult = class(SendSMSResult)
  private
    FMsisdnBlacklistMatch: ArrayOfMsisdnBL;
    FMsisdnBlacklistMatch_Specified: boolean;
    procedure SetMsisdnBlacklistMatch(Index: Integer; const AArrayOfMsisdnBL: ArrayOfMsisdnBL);
    function  MsisdnBlacklistMatch_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property MsisdnBlacklistMatch: ArrayOfMsisdnBL  Index (IS_OPTN) read FMsisdnBlacklistMatch write SetMsisdnBlacklistMatch stored MsisdnBlacklistMatch_Specified;
  end;


  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // soapAction: http://tempuri.org/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : SMSServiceSoap
  // service   : SMSService
  // port      : SMSServiceSoap
  // URL       : http://api.jetsms.com.tr/ws/soapSMS.asmx
  // ************************************************************************ //
  SMSServiceSoap = interface(IInvokable)
  ['{11CF83A4-F2FD-01D8-0F6B-71F055031D1C}']
    function  SendSMSSingle(const user: string; const password: string; const originator: string; const reference: string; const startdate: string; const expiredate: string;
                            const messages: string; const receipents: string; const exclusionstarttime: string; const exclusionexpiretime: string; const channel: string;
                            const blacklistfilter: string; const optinfilter: string; const x: string; const onlengthproblem: enmOnLengthProblem; const sendingrulefilter: string;
                            const domesticfilter: string; const forceEnglish: string; const iysfilter: string): SendSMSResult; stdcall;
    function  SendSMSSeperatorAVS(const user: string; const password: string; const originator: string; const reference: string; const startdate: string; const expiredate: string;
                                  const messagewithsep: string; const receipentwithsep: string; const exclusionstarttime: string; const exclusionexpiretime: string; const channel: string;
                                  const blacklistfilter: string; const optinfilter: string; const x: string; const onlengthproblem: enmOnLengthProblem; const sep: string;
                                  const sendingrulefilter: string; const domesticfilter: string; const forceEnglish: string; const iysfilter: string): SendSMSResult; stdcall;
    function  SendSMS(const user: string; const password: string; const originator: string; const reference: string; const startdate: string; const expiredate: string;
                      const messages: ArrayOfString; const receipents: ArrayOfString; const exclusionstarttime: string; const exclusionexpiretime: string; const channel: string;
                      const blacklistfilter: string; const optinfilter: string; const x: string; const onlengthproblem: enmOnLengthProblem; const sendingrulefilter: string;
                      const domesticfilter: string; const forceEnglish: string; const iysfilter: string): SendSMSResult; stdcall;
    function  SendSMS_V2(const user: string; const password: string; const originator: string; const reference: string; const startdate: string; const expiredate: string;
                         const messages: ArrayOfString; const receipents: ArrayOfString; const messageIds: ArrayOfString; const exclusionstarttime: string; const exclusionexpiretime: string;
                         const channel: string; const blacklistfilter: string; const optinfilter: string; const x: string; const onlengthproblem: enmOnLengthProblem;
                         const sourceMACAddress: string; const sourceLocation: string; const sourceIPAddress: string; const sendingrulefilter: string; const domesticfilter: string;
                         const forceEnglish: string; const iysfilter: string): ResponseFromHostV2; stdcall;
    function  SendSMSBroadcast(const user: string; const password: string; const originator: string; const reference: string; const startdate: string; const expiredate: string;
                               const broadcastMessage: string; const receipents: ArrayOfString; const exclusionstarttime: string; const exclusionexpiretime: string; const channel: string;
                               const blacklistfilter: string; const optinfilter: string; const x: string; const onlengthproblem: enmOnLengthProblem; const sendingrulefilter: string;
                               const domesticfilter: string; const forceEnglish: string; const iysfilter: string): SendSMSResult; stdcall;
    function  SendSMSBroadcast_V2(const user: string; const password: string; const originator: string; const reference: string; const startdate: string; const expiredate: string;
                                  const broadcastMessage: string; const receipents: ArrayOfString; const messageIds: ArrayOfString; const exclusionstarttime: string; const exclusionexpiretime: string;
                                  const channel: string; const blacklistfilter: string; const optinfilter: string; const x: string; const onlengthproblem: enmOnLengthProblem;
                                  const sendingrulefilter: string; const domesticfilter: string; const forceEnglish: string; const iysfilter: string): ResponseFromHostV2; stdcall;
    function  SendSMSToGroup(const user: string; const password: string; const originator: string; const reference: string; const startdate: string; const expiredate: string;
                             const message_: string; const groupinfotype: enmGroupInfoType; const group: ArrayOfString; const exclusionstarttime: string; const exclusionexpiretime: string;
                             const channel: string; const blacklistfilter: string; const optinfilter: string; const x: string; const onlengthproblem: enmOnLengthProblem;
                             const sendingrulefilter: string; const domesticfilter: string; const forceEnglish: string; const iysfilter: string): SendSMSResult; stdcall;
    function  SendTCKNSMS(const user: string; const password: string; const originator: string; const reference: string; const startdate: string; const expiredate: string;
                          const messages: ArrayOfString; const receipents: ArrayOfString; const exclusionstarttime: string; const exclusionexpiretime: string; const blacklistfilter: string;
                          const optinfilter: string; const onlengthproblem: enmOnLengthProblem; const sendingrulefilter: string; const channel: string; const iysfilter: string
                          ): SendSMSResult; stdcall;
    function  SendTCKNSMSBroadcast(const user: string; const password: string; const originator: string; const reference: string; const startdate: string; const expiredate: string;
                                   const broadcastMessage: string; const receipents: ArrayOfString; const exclusionstarttime: string; const exclusionexpiretime: string; const blacklistfilter: string;
                                   const optinfilter: string; const onlengthproblem: enmOnLengthProblem; const sendingrulefilter: string; const channel: string; const iysfilter: string
                                   ): SendSMSResult; stdcall;
    function  SendTCKNSMSToGroup(const user: string; const password: string; const originator: string; const reference: string; const startdate: string; const expiredate: string;
                                 const message_: string; const groupinfotype: enmGroupInfoType; const group: ArrayOfString; const exclusionstarttime: string; const exclusionexpiretime: string;
                                 const blacklistfilter: string; const optinfilter: string; const onlengthproblem: enmOnLengthProblem; const sendingrulefilter: string; const channel: string;
                                 const iysfilter: string): SendSMSResult; stdcall;
    function  SendSMSAdvancedToGroup(const user: string; const password: string; const originator: string; const reference: string; const startdate: string; const expiredate: string;
                                     const message_: string; const messageType: string; const messageHeader: string; const groupinfotype: enmGroupInfoType; const group: ArrayOfString;
                                     const exclusionstarttime: string; const exclusionexpiretime: string; const channel: string; const blacklistfilter: string; const optinfilter: string;
                                     const x: string; const onlengthproblem: enmOnLengthProblem; const sendingrulefilter: string; const domesticfilter: string; const forceEnglish: string;
                                     const iysfilter: string): SendSMSResult; stdcall;
    function  SendSMSAdvanced(const user: string; const password: string; const originator: string; const reference: string; const startdate: string; const expiredate: string;
                              const messages: ArrayOfString; const receipents: ArrayOfString; const messageType: string; const messageHeader: ArrayOfString; const exclusionstarttime: string;
                              const exclusionexpiretime: string; const channel: string; const blacklistfilter: string; const optinfilter: string; const x: string;
                              const onlengthproblem: enmOnLengthProblem; const sendingrulefilter: string; const domesticfilter: string; const forceEnglish: string; const iysfilter: string
                              ): SendSMSResult; stdcall;
    function  ReportSMS(const user: string; const password: string; const groupid: string; const status: string): ArrayOfReportSMSResult; stdcall;
    function  ReportSMS_V2(const user: string; const password: string; const messageIds: ArrayOfString; const status: string): MessageResponseV2; stdcall;
    function  ReportOriginator(const user: string; const password: string): ArrayOfString; stdcall;
    function  ReportOriginatorWithChannel(const user: string; const password: string): ArrayOfClsTitles; stdcall;
    function  ReportQuota(const user: string; const password: string; const channel: string): string; stdcall;
    function  ReportGroups(const user: string; const password: string): ArrayOfClsGroups; stdcall;
    function  ReportGroupNumbers(const user: string; const password: string; const groupinfotype: enmGroupInfoType; const group: ArrayOfString): ArrayOfClsGroupInfo; stdcall;
    function  ReportSMSReverse(const user: string; const password: string): clsReverse; stdcall;
    function  AprroveReverse(const user: string; const password: string; const groupId: string): Boolean; stdcall;
    function  SendMMS(const user: string; const password: string; const originator: string; const reference: string; const startdate: string; const expiredate: string;
                      const receipents: ArrayOfString; const subject: string; const message_: string; const mmsContentDataBase64: string; const mmsContentType: string;
                      const exclusionstarttime: string; const exclusionexpiretime: string; const channel: string; const blacklistfilter: string; const optinfilter: string;
                      const iysfilter: string): SendSMSResult; stdcall;
    function  SendAnindaCevap(const user: string; const password: string; const originator: string; const reference: string; const startdate: string; const expiredate: string;
                              const receipents: ArrayOfString; const blacklistfilter: string; const anindaCevapParameters: ArrayOfACParameter; const anindaCevapSeperator: string; const iysfilter: string
                              ): SendSMSResult; stdcall;
    function  CreateGroup(const user: string; const password: string; const title: string; const desc: string; const msisdnList: ArrayOfString; const isProfiled: Boolean;
                          const isMMS: Boolean; const isLocation: Boolean): SendSMSResult; stdcall;
    function  CreateCampaign(const user: string; const password: string; const title: string; const message_: string; const groupId: Integer; const attributes: string
                             ): SendSMSResult; stdcall;
    function  SendCampaign(const user: string; const password: string; const originator: string; const reference: string; const startdate: string; const expiredate: string;
                           const campaignId: Integer): SendSMSResult; stdcall;
    function  SendLOKCampaign(const user: string; const password: string; const originator: string; const reference: string; const startdate: string; const expiredate: string;
                              const message_: string; const receipents: ArrayOfString; const lokInput: LOKInput): SendSMSResult; stdcall;
    function  ReportLOKSMS(const user: string; const password: string; const processId: string): ReportLOKSMSResult; stdcall;
    function  GetAttributeValues(const user: string; const password: string; const attributeKey: string): AttributeValuesResult; stdcall;
    function  AddMsisdnsToGroup(const user: string; const password: string; const msisdnList: ArrayOfString; const groupId: string): GroupResult; stdcall;
    function  RemoveMsisdnsFromGroup(const user: string; const password: string; const msisdnList: ArrayOfString; const groupId: string): GroupResult; stdcall;
    function  GetBioTLCredit(const user: string; const password: string): CreditResult; stdcall;
    function  GetSMSCredit(const user: string; const password: string; const channel: string): CreditResult; stdcall;
    function  ReportSMSDetail(const user: string; const password: string; const startdate: string; const enddate: string; const gsmnumber: string; const originator: string;
                              const istext: string): ArrayOfReportSMSDetailedResult; stdcall;
    function  ReportSMSDetail_v2(const user: string; const password: string; const filter_startdate: string; const filter_enddate: string; const filter_gsmnumber: string; const filter_originator: string;
                                 const get_text: string): ReportSMSDetailedResult_v2; stdcall;
    function  CheckBlacklist(const user: string; const password: string; const msisdnList: ArrayOfString): CheckBLResult; stdcall;
    function  ReportSMSDetail_v3(const user: string; const password: string; const report_day: string; const report_message_ids: ArrayOfString; const filter_originator: string; const get_text: string;
                                 const last_id: string; const record_count: string): ReportSMSDetailedResult_v3; stdcall;
    function  Optin(const user: string; const password: string; const msisdnList: ArrayOfString; const source: string): SendSMSResult; stdcall;
    function  OptinByTitles(const user: string; const password: string; const msisdnList: ArrayOfString; const optinTitles: ArrayOfString; const source: string): SendSMSResult; stdcall;
    function  Optout(const user: string; const password: string; const msisdnList: ArrayOfString; const source: string): SendSMSResult; stdcall;
    function  OptoutByTitles(const user: string; const password: string; const msisdnList: ArrayOfString; const optinTitles: ArrayOfString; const source: string): SendSMSResult; stdcall;
    function  IYSInsert(const user: string; const password: string; const iyscode: string; const brandcode: string; const _LIYSRequestList: ArrayOfIYSRequestList): IYSResult; stdcall;
    function  IYSReport(const user: string; const password: string; const groupid: string): IYSReportResult; stdcall;
    function  AddOrUpdateMsisdns(const user: string; const password: string; const clsMsisdn: ArrayOfAddress): GroupResult; stdcall;
  end;

function GetSMSServiceSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): SMSServiceSoap;


implementation
  uses System.SysUtils;

function GetSMSServiceSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): SMSServiceSoap;
const
  defWSDL = 'https://api.jetSMS.com.tr/ws/soapSMS.asmx?WSDL';
  defURL  = 'https://api.jetsms.com.tr/ws/soapSMS.asmx';
  defSvc  = 'SMSService';
  defPrt  = 'SMSServiceSoap';
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
    Result := (RIO as SMSServiceSoap);
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


procedure SendSMSResult.SetErrorCode(Index: Integer; const Astring: string);
begin
  FErrorCode := Astring;
  FErrorCode_Specified := True;
end;

function SendSMSResult.ErrorCode_Specified(Index: Integer): boolean;
begin
  Result := FErrorCode_Specified;
end;

procedure SendSMSResult.SetID(Index: Integer; const Astring: string);
begin
  FID := Astring;
  FID_Specified := True;
end;

function SendSMSResult.ID_Specified(Index: Integer): boolean;
begin
  Result := FID_Specified;
end;

destructor ResponseFromHostV2.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FResponseGroupIdArray)-1 do
    System.SysUtils.FreeAndNil(FResponseGroupIdArray[I]);
  System.SetLength(FResponseGroupIdArray, 0);
  inherited Destroy;
end;

procedure ResponseFromHostV2.SetResponseCode(Index: Integer; const Astring: string);
begin
  FResponseCode := Astring;
  FResponseCode_Specified := True;
end;

function ResponseFromHostV2.ResponseCode_Specified(Index: Integer): boolean;
begin
  Result := FResponseCode_Specified;
end;

procedure ResponseFromHostV2.SetResponseMessage(Index: Integer; const Astring: string);
begin
  FResponseMessage := Astring;
  FResponseMessage_Specified := True;
end;

function ResponseFromHostV2.ResponseMessage_Specified(Index: Integer): boolean;
begin
  Result := FResponseMessage_Specified;
end;

procedure ResponseFromHostV2.SetResponseGroupIdArray(Index: Integer; const AArrayOfResponseGroupId: ArrayOfResponseGroupId);
begin
  FResponseGroupIdArray := AArrayOfResponseGroupId;
  FResponseGroupIdArray_Specified := True;
end;

function ResponseFromHostV2.ResponseGroupIdArray_Specified(Index: Integer): boolean;
begin
  Result := FResponseGroupIdArray_Specified;
end;

procedure ResponseGroupId.SetGsmNumber(Index: Integer; const Astring: string);
begin
  FGsmNumber := Astring;
  FGsmNumber_Specified := True;
end;

function ResponseGroupId.GsmNumber_Specified(Index: Integer): boolean;
begin
  Result := FGsmNumber_Specified;
end;

procedure ResponseGroupId.SetMessageId(Index: Integer; const Astring: string);
begin
  FMessageId := Astring;
  FMessageId_Specified := True;
end;

function ResponseGroupId.MessageId_Specified(Index: Integer): boolean;
begin
  Result := FMessageId_Specified;
end;

procedure ResponseGroupId.SetStatus(Index: Integer; const Astring: string);
begin
  FStatus := Astring;
  FStatus_Specified := True;
end;

function ResponseGroupId.Status_Specified(Index: Integer): boolean;
begin
  Result := FStatus_Specified;
end;

procedure clsGroups.SetGroupname(Index: Integer; const Astring: string);
begin
  FGroupname := Astring;
  FGroupname_Specified := True;
end;

function clsGroups.Groupname_Specified(Index: Integer): boolean;
begin
  Result := FGroupname_Specified;
end;

destructor LOKInput.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FLokArea)-1 do
    System.SysUtils.FreeAndNil(FLokArea[I]);
  System.SetLength(FLokArea, 0);
  inherited Destroy;
end;

procedure LOKInput.SetDayHourInterval(Index: Integer; const Astring: string);
begin
  FDayHourInterval := Astring;
  FDayHourInterval_Specified := True;
end;

function LOKInput.DayHourInterval_Specified(Index: Integer): boolean;
begin
  Result := FDayHourInterval_Specified;
end;

procedure LOKInput.SetCampaignName(Index: Integer; const Astring: string);
begin
  FCampaignName := Astring;
  FCampaignName_Specified := True;
end;

function LOKInput.CampaignName_Specified(Index: Integer): boolean;
begin
  Result := FCampaignName_Specified;
end;

procedure LOKInput.SetSendType(Index: Integer; const Astring: string);
begin
  FSendType := Astring;
  FSendType_Specified := True;
end;

function LOKInput.SendType_Specified(Index: Integer): boolean;
begin
  Result := FSendType_Specified;
end;

procedure LOKInput.SetLokArea(Index: Integer; const AArrayOfLOKArea: ArrayOfLOKArea);
begin
  FLokArea := AArrayOfLOKArea;
  FLokArea_Specified := True;
end;

function LOKInput.LokArea_Specified(Index: Integer): boolean;
begin
  Result := FLokArea_Specified;
end;

procedure ReportLOKSMSResult.SetStatusId(Index: Integer; const Astring: string);
begin
  FStatusId := Astring;
  FStatusId_Specified := True;
end;

function ReportLOKSMSResult.StatusId_Specified(Index: Integer): boolean;
begin
  Result := FStatusId_Specified;
end;

procedure ReportLOKSMSResult.SetStatusDetailId(Index: Integer; const Astring: string);
begin
  FStatusDetailId := Astring;
  FStatusDetailId_Specified := True;
end;

function ReportLOKSMSResult.StatusDetailId_Specified(Index: Integer): boolean;
begin
  Result := FStatusDetailId_Specified;
end;

procedure ReportLOKSMSResult.SetRequestMsisdnCount(Index: Integer; const Astring: string);
begin
  FRequestMsisdnCount := Astring;
  FRequestMsisdnCount_Specified := True;
end;

function ReportLOKSMSResult.RequestMsisdnCount_Specified(Index: Integer): boolean;
begin
  Result := FRequestMsisdnCount_Specified;
end;

procedure ReportLOKSMSResult.SetLoadedMsisdnCount(Index: Integer; const Astring: string);
begin
  FLoadedMsisdnCount := Astring;
  FLoadedMsisdnCount_Specified := True;
end;

function ReportLOKSMSResult.LoadedMsisdnCount_Specified(Index: Integer): boolean;
begin
  Result := FLoadedMsisdnCount_Specified;
end;

procedure ReportLOKSMSResult.SetSendedMsisdnCount(Index: Integer; const Astring: string);
begin
  FSendedMsisdnCount := Astring;
  FSendedMsisdnCount_Specified := True;
end;

function ReportLOKSMSResult.SendedMsisdnCount_Specified(Index: Integer): boolean;
begin
  Result := FSendedMsisdnCount_Specified;
end;

procedure ReportLOKSMSResult.SetDeliveredMsisdnCount(Index: Integer; const Astring: string);
begin
  FDeliveredMsisdnCount := Astring;
  FDeliveredMsisdnCount_Specified := True;
end;

function ReportLOKSMSResult.DeliveredMsisdnCount_Specified(Index: Integer): boolean;
begin
  Result := FDeliveredMsisdnCount_Specified;
end;

procedure ReportLOKSMSResult.SetPricedMsisdnCount(Index: Integer; const Astring: string);
begin
  FPricedMsisdnCount := Astring;
  FPricedMsisdnCount_Specified := True;
end;

function ReportLOKSMSResult.PricedMsisdnCount_Specified(Index: Integer): boolean;
begin
  Result := FPricedMsisdnCount_Specified;
end;

procedure ReportLOKSMSResult.SetCatchedMsisdnCount(Index: Integer; const Astring: string);
begin
  FCatchedMsisdnCount := Astring;
  FCatchedMsisdnCount_Specified := True;
end;

function ReportLOKSMSResult.CatchedMsisdnCount_Specified(Index: Integer): boolean;
begin
  Result := FCatchedMsisdnCount_Specified;
end;

procedure clsGroupInfo.SetGroupname(Index: Integer; const Astring: string);
begin
  FGroupname := Astring;
  FGroupname_Specified := True;
end;

function clsGroupInfo.Groupname_Specified(Index: Integer): boolean;
begin
  Result := FGroupname_Specified;
end;

procedure clsGroupInfo.SetAd(Index: Integer; const Astring: string);
begin
  FAd := Astring;
  FAd_Specified := True;
end;

function clsGroupInfo.Ad_Specified(Index: Integer): boolean;
begin
  Result := FAd_Specified;
end;

procedure clsGroupInfo.SetSoyad(Index: Integer; const Astring: string);
begin
  FSoyad := Astring;
  FSoyad_Specified := True;
end;

function clsGroupInfo.Soyad_Specified(Index: Integer): boolean;
begin
  Result := FSoyad_Specified;
end;

procedure clsGroupInfo.SetNote(Index: Integer; const Astring: string);
begin
  FNote := Astring;
  FNote_Specified := True;
end;

function clsGroupInfo.Note_Specified(Index: Integer): boolean;
begin
  Result := FNote_Specified;
end;

procedure clsGroupInfo.SetGsmnumber(Index: Integer; const Astring: string);
begin
  FGsmnumber := Astring;
  FGsmnumber_Specified := True;
end;

function clsGroupInfo.Gsmnumber_Specified(Index: Integer): boolean;
begin
  Result := FGsmnumber_Specified;
end;

destructor clsReverse.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FMessages)-1 do
    System.SysUtils.FreeAndNil(FMessages[I]);
  System.SetLength(FMessages, 0);
  inherited Destroy;
end;

procedure clsReverse.SetMessages(Index: Integer; const AArrayOfClsMessage: ArrayOfClsMessage);
begin
  FMessages := AArrayOfClsMessage;
  FMessages_Specified := True;
end;

function clsReverse.Messages_Specified(Index: Integer): boolean;
begin
  Result := FMessages_Specified;
end;

procedure clsReverse.SetUnqkey(Index: Integer; const Astring: string);
begin
  FUnqkey := Astring;
  FUnqkey_Specified := True;
end;

function clsReverse.Unqkey_Specified(Index: Integer): boolean;
begin
  Result := FUnqkey_Specified;
end;

procedure clsMessage.SetNumber(Index: Integer; const Astring: string);
begin
  FNumber := Astring;
  FNumber_Specified := True;
end;

function clsMessage.Number_Specified(Index: Integer): boolean;
begin
  Result := FNumber_Specified;
end;

procedure clsMessage.SetGroupId(Index: Integer; const Astring: string);
begin
  FGroupId := Astring;
  FGroupId_Specified := True;
end;

function clsMessage.GroupId_Specified(Index: Integer): boolean;
begin
  Result := FGroupId_Specified;
end;

procedure clsMessage.SetReference(Index: Integer; const Astring: string);
begin
  FReference := Astring;
  FReference_Specified := True;
end;

function clsMessage.Reference_Specified(Index: Integer): boolean;
begin
  Result := FReference_Specified;
end;

procedure clsMessage.SetMessage_(Index: Integer; const Astring: string);
begin
  FMessage_ := Astring;
  FMessage__Specified := True;
end;

function clsMessage.Message__Specified(Index: Integer): boolean;
begin
  Result := FMessage__Specified;
end;

procedure clsMessage.SetSendDate(Index: Integer; const Astring: string);
begin
  FSendDate := Astring;
  FSendDate_Specified := True;
end;

function clsMessage.SendDate_Specified(Index: Integer): boolean;
begin
  Result := FSendDate_Specified;
end;

procedure ACParameter.SetDT_DisplayText(Index: Integer; const Astring: string);
begin
  FDT_DisplayText := Astring;
  FDT_DisplayText_Specified := True;
end;

function ACParameter.DT_DisplayText_Specified(Index: Integer): boolean;
begin
  Result := FDT_DisplayText_Specified;
end;

procedure ACParameter.SetDT_SMSText(Index: Integer; const Astring: string);
begin
  FDT_SMSText := Astring;
  FDT_SMSText_Specified := True;
end;

function ACParameter.DT_SMSText_Specified(Index: Integer): boolean;
begin
  Result := FDT_SMSText_Specified;
end;

procedure ACParameter.SetGI_Text(Index: Integer; const Astring: string);
begin
  FGI_Text := Astring;
  FGI_Text_Specified := True;
end;

function ACParameter.GI_Text_Specified(Index: Integer): boolean;
begin
  Result := FGI_Text_Specified;
end;

procedure ACParameter.SetSI_Text(Index: Integer; const Astring: string);
begin
  FSI_Text := Astring;
  FSI_Text_Specified := True;
end;

function ACParameter.SI_Text_Specified(Index: Integer): boolean;
begin
  Result := FSI_Text_Specified;
end;

procedure ACParameter.SetSI_OptionTextList(Index: Integer; const AArrayOfString: ArrayOfString);
begin
  FSI_OptionTextList := AArrayOfString;
  FSI_OptionTextList_Specified := True;
end;

function ACParameter.SI_OptionTextList_Specified(Index: Integer): boolean;
begin
  Result := FSI_OptionTextList_Specified;
end;

procedure ACParameter.SetSI_OptionValueList(Index: Integer; const AArrayOfString: ArrayOfString);
begin
  FSI_OptionValueList := AArrayOfString;
  FSI_OptionValueList_Specified := True;
end;

function ACParameter.SI_OptionValueList_Specified(Index: Integer): boolean;
begin
  Result := FSI_OptionValueList_Specified;
end;

procedure clsTitles.SetChannel(Index: Integer; const Astring: string);
begin
  FChannel := Astring;
  FChannel_Specified := True;
end;

function clsTitles.Channel_Specified(Index: Integer): boolean;
begin
  Result := FChannel_Specified;
end;

procedure clsTitles.SetMessageTitle(Index: Integer; const Astring: string);
begin
  FMessageTitle := Astring;
  FMessageTitle_Specified := True;
end;

function clsTitles.MessageTitle_Specified(Index: Integer): boolean;
begin
  Result := FMessageTitle_Specified;
end;

procedure MessageReport.SetGsmNumber(Index: Integer; const Astring: string);
begin
  FGsmNumber := Astring;
  FGsmNumber_Specified := True;
end;

function MessageReport.GsmNumber_Specified(Index: Integer): boolean;
begin
  Result := FGsmNumber_Specified;
end;

procedure MessageReport.SetStatus(Index: Integer; const Astring: string);
begin
  FStatus := Astring;
  FStatus_Specified := True;
end;

function MessageReport.Status_Specified(Index: Integer): boolean;
begin
  Result := FStatus_Specified;
end;

procedure MessageReport.SetSentDate(Index: Integer; const Astring: string);
begin
  FSentDate := Astring;
  FSentDate_Specified := True;
end;

function MessageReport.SentDate_Specified(Index: Integer): boolean;
begin
  Result := FSentDate_Specified;
end;

procedure MessageReport.SetDeliveredDate(Index: Integer; const Astring: string);
begin
  FDeliveredDate := Astring;
  FDeliveredDate_Specified := True;
end;

function MessageReport.DeliveredDate_Specified(Index: Integer): boolean;
begin
  Result := FDeliveredDate_Specified;
end;

procedure MessageReport.SetMessageId(Index: Integer; const Astring: string);
begin
  FMessageId := Astring;
  FMessageId_Specified := True;
end;

function MessageReport.MessageId_Specified(Index: Integer): boolean;
begin
  Result := FMessageId_Specified;
end;

procedure MessageReport.SetResponseCode(Index: Integer; const Astring: string);
begin
  FResponseCode := Astring;
  FResponseCode_Specified := True;
end;

function MessageReport.ResponseCode_Specified(Index: Integer): boolean;
begin
  Result := FResponseCode_Specified;
end;

procedure MessageReport.SetSendRetryCount(Index: Integer; const Astring: string);
begin
  FSendRetryCount := Astring;
  FSendRetryCount_Specified := True;
end;

function MessageReport.SendRetryCount_Specified(Index: Integer): boolean;
begin
  Result := FSendRetryCount_Specified;
end;

procedure ReportSMSResult.SetID(Index: Integer; const Astring: string);
begin
  FID := Astring;
  FID_Specified := True;
end;

function ReportSMSResult.ID_Specified(Index: Integer): boolean;
begin
  Result := FID_Specified;
end;

procedure ReportSMSResult.SetPhone(Index: Integer; const Astring: string);
begin
  FPhone := Astring;
  FPhone_Specified := True;
end;

function ReportSMSResult.Phone_Specified(Index: Integer): boolean;
begin
  Result := FPhone_Specified;
end;

procedure ReportSMSResult.SetStatus(Index: Integer; const Astring: string);
begin
  FStatus := Astring;
  FStatus_Specified := True;
end;

function ReportSMSResult.Status_Specified(Index: Integer): boolean;
begin
  Result := FStatus_Specified;
end;

procedure ReportSMSResult.SetSendDate(Index: Integer; const Astring: string);
begin
  FSendDate := Astring;
  FSendDate_Specified := True;
end;

function ReportSMSResult.SendDate_Specified(Index: Integer): boolean;
begin
  Result := FSendDate_Specified;
end;

procedure ReportSMSResult.SetDeliveredDate(Index: Integer; const Astring: string);
begin
  FDeliveredDate := Astring;
  FDeliveredDate_Specified := True;
end;

function ReportSMSResult.DeliveredDate_Specified(Index: Integer): boolean;
begin
  Result := FDeliveredDate_Specified;
end;

procedure ReportSMSResult.SetResponseCode(Index: Integer; const Astring: string);
begin
  FResponseCode := Astring;
  FResponseCode_Specified := True;
end;

function ReportSMSResult.ResponseCode_Specified(Index: Integer): boolean;
begin
  Result := FResponseCode_Specified;
end;

procedure ReportSMSResult.SetSendRetryCount(Index: Integer; const Astring: string);
begin
  FSendRetryCount := Astring;
  FSendRetryCount_Specified := True;
end;

function ReportSMSResult.SendRetryCount_Specified(Index: Integer): boolean;
begin
  Result := FSendRetryCount_Specified;
end;

destructor MessageResponseV2.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FMessageReportArray)-1 do
    System.SysUtils.FreeAndNil(FMessageReportArray[I]);
  System.SetLength(FMessageReportArray, 0);
  inherited Destroy;
end;

procedure MessageResponseV2.SetResponseCode(Index: Integer; const Astring: string);
begin
  FResponseCode := Astring;
  FResponseCode_Specified := True;
end;

function MessageResponseV2.ResponseCode_Specified(Index: Integer): boolean;
begin
  Result := FResponseCode_Specified;
end;

procedure MessageResponseV2.SetResponseMessage(Index: Integer; const Astring: string);
begin
  FResponseMessage := Astring;
  FResponseMessage_Specified := True;
end;

function MessageResponseV2.ResponseMessage_Specified(Index: Integer): boolean;
begin
  Result := FResponseMessage_Specified;
end;

procedure MessageResponseV2.SetMessageReportArray(Index: Integer; const AArrayOfMessageReport: ArrayOfMessageReport);
begin
  FMessageReportArray := AArrayOfMessageReport;
  FMessageReportArray_Specified := True;
end;

function MessageResponseV2.MessageReportArray_Specified(Index: Integer): boolean;
begin
  Result := FMessageReportArray_Specified;
end;

procedure IYSReportErrorItem.SetErrCode(Index: Integer; const Astring: string);
begin
  FErrCode := Astring;
  FErrCode_Specified := True;
end;

function IYSReportErrorItem.ErrCode_Specified(Index: Integer): boolean;
begin
  Result := FErrCode_Specified;
end;

procedure IYSReportErrorItem.SetErrDesc(Index: Integer; const Astring: string);
begin
  FErrDesc := Astring;
  FErrDesc_Specified := True;
end;

function IYSReportErrorItem.ErrDesc_Specified(Index: Integer): boolean;
begin
  Result := FErrDesc_Specified;
end;

procedure IYSReportErrorItem.SetErrRecipient(Index: Integer; const Astring: string);
begin
  FErrRecipient := Astring;
  FErrRecipient_Specified := True;
end;

function IYSReportErrorItem.ErrRecipient_Specified(Index: Integer): boolean;
begin
  Result := FErrRecipient_Specified;
end;

procedure IYSRequestList.Setrecipient(Index: Integer; const Astring: string);
begin
  Frecipient := Astring;
  Frecipient_Specified := True;
end;

function IYSRequestList.recipient_Specified(Index: Integer): boolean;
begin
  Result := Frecipient_Specified;
end;

procedure IYSRequestList.SetrecipientType(Index: Integer; const Astring: string);
begin
  FrecipientType := Astring;
  FrecipientType_Specified := True;
end;

function IYSRequestList.recipientType_Specified(Index: Integer): boolean;
begin
  Result := FrecipientType_Specified;
end;

procedure IYSRequestList.Settype_(Index: Integer; const Astring: string);
begin
  Ftype_ := Astring;
  Ftype__Specified := True;
end;

function IYSRequestList.type__Specified(Index: Integer): boolean;
begin
  Result := Ftype__Specified;
end;

procedure IYSRequestList.SetconsentDate(Index: Integer; const Astring: string);
begin
  FconsentDate := Astring;
  FconsentDate_Specified := True;
end;

function IYSRequestList.consentDate_Specified(Index: Integer): boolean;
begin
  Result := FconsentDate_Specified;
end;

procedure IYSRequestList.Setstatus(Index: Integer; const Astring: string);
begin
  Fstatus := Astring;
  Fstatus_Specified := True;
end;

function IYSRequestList.status_Specified(Index: Integer): boolean;
begin
  Result := Fstatus_Specified;
end;

procedure IYSRequestList.Setsource(Index: Integer; const Astring: string);
begin
  Fsource := Astring;
  Fsource_Specified := True;
end;

function IYSRequestList.source_Specified(Index: Integer): boolean;
begin
  Result := Fsource_Specified;
end;

procedure IYSResult.SetErrorCode(Index: Integer; const Astring: string);
begin
  FErrorCode := Astring;
  FErrorCode_Specified := True;
end;

function IYSResult.ErrorCode_Specified(Index: Integer): boolean;
begin
  Result := FErrorCode_Specified;
end;

procedure IYSResult.SetID(Index: Integer; const Astring: string);
begin
  FID := Astring;
  FID_Specified := True;
end;

function IYSResult.ID_Specified(Index: Integer): boolean;
begin
  Result := FID_Specified;
end;

procedure Ekstra.SetFieldName(Index: Integer; const Astring: string);
begin
  FFieldName := Astring;
  FFieldName_Specified := True;
end;

function Ekstra.FieldName_Specified(Index: Integer): boolean;
begin
  Result := FFieldName_Specified;
end;

procedure Ekstra.SetFieldValue(Index: Integer; const Astring: string);
begin
  FFieldValue := Astring;
  FFieldValue_Specified := True;
end;

function Ekstra.FieldValue_Specified(Index: Integer): boolean;
begin
  Result := FFieldValue_Specified;
end;

destructor Address.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FEKSTRA)-1 do
    System.SysUtils.FreeAndNil(FEKSTRA[I]);
  System.SetLength(FEKSTRA, 0);
  inherited Destroy;
end;

procedure Address.SetGSM_NUMBER(Index: Integer; const Astring: string);
begin
  FGSM_NUMBER := Astring;
  FGSM_NUMBER_Specified := True;
end;

function Address.GSM_NUMBER_Specified(Index: Integer): boolean;
begin
  Result := FGSM_NUMBER_Specified;
end;

procedure Address.SetADDRESS(Index: Integer; const Astring: string);
begin
  FADDRESS := Astring;
  FADDRESS_Specified := True;
end;

function Address.ADDRESS_Specified(Index: Integer): boolean;
begin
  Result := FADDRESS_Specified;
end;

procedure Address.SetCITY(Index: Integer; const Astring: string);
begin
  FCITY := Astring;
  FCITY_Specified := True;
end;

function Address.CITY_Specified(Index: Integer): boolean;
begin
  Result := FCITY_Specified;
end;

procedure Address.SetFIRST_NAME(Index: Integer; const Astring: string);
begin
  FFIRST_NAME := Astring;
  FFIRST_NAME_Specified := True;
end;

function Address.FIRST_NAME_Specified(Index: Integer): boolean;
begin
  Result := FFIRST_NAME_Specified;
end;

procedure Address.SetLAST_NAME(Index: Integer; const Astring: string);
begin
  FLAST_NAME := Astring;
  FLAST_NAME_Specified := True;
end;

function Address.LAST_NAME_Specified(Index: Integer): boolean;
begin
  Result := FLAST_NAME_Specified;
end;

procedure Address.SetEMAIL(Index: Integer; const Astring: string);
begin
  FEMAIL := Astring;
  FEMAIL_Specified := True;
end;

function Address.EMAIL_Specified(Index: Integer): boolean;
begin
  Result := FEMAIL_Specified;
end;

procedure Address.SetNOTE(Index: Integer; const Astring: string);
begin
  FNOTE := Astring;
  FNOTE_Specified := True;
end;

function Address.NOTE_Specified(Index: Integer): boolean;
begin
  Result := FNOTE_Specified;
end;

procedure Address.SetCOUNTRY(Index: Integer; const Astring: string);
begin
  FCOUNTRY := Astring;
  FCOUNTRY_Specified := True;
end;

function Address.COUNTRY_Specified(Index: Integer): boolean;
begin
  Result := FCOUNTRY_Specified;
end;

procedure Address.SetBIRTHDATE(Index: Integer; const Astring: string);
begin
  FBIRTHDATE := Astring;
  FBIRTHDATE_Specified := True;
end;

function Address.BIRTHDATE_Specified(Index: Integer): boolean;
begin
  Result := FBIRTHDATE_Specified;
end;

procedure Address.SetCOMPANY(Index: Integer; const Astring: string);
begin
  FCOMPANY := Astring;
  FCOMPANY_Specified := True;
end;

function Address.COMPANY_Specified(Index: Integer): boolean;
begin
  Result := FCOMPANY_Specified;
end;

procedure Address.SetTITLE(Index: Integer; const Astring: string);
begin
  FTITLE := Astring;
  FTITLE_Specified := True;
end;

function Address.TITLE_Specified(Index: Integer): boolean;
begin
  Result := FTITLE_Specified;
end;

procedure Address.SetTEL_NUMBER(Index: Integer; const Astring: string);
begin
  FTEL_NUMBER := Astring;
  FTEL_NUMBER_Specified := True;
end;

function Address.TEL_NUMBER_Specified(Index: Integer): boolean;
begin
  Result := FTEL_NUMBER_Specified;
end;

procedure Address.SetFAX_NUMBER(Index: Integer; const Astring: string);
begin
  FFAX_NUMBER := Astring;
  FFAX_NUMBER_Specified := True;
end;

function Address.FAX_NUMBER_Specified(Index: Integer): boolean;
begin
  Result := FFAX_NUMBER_Specified;
end;

procedure Address.SetIDENTIFICATION_NUMBER(Index: Integer; const Astring: string);
begin
  FIDENTIFICATION_NUMBER := Astring;
  FIDENTIFICATION_NUMBER_Specified := True;
end;

function Address.IDENTIFICATION_NUMBER_Specified(Index: Integer): boolean;
begin
  Result := FIDENTIFICATION_NUMBER_Specified;
end;

procedure Address.SetEKSTRA(Index: Integer; const AArrayOfEkstra: ArrayOfEkstra);
begin
  FEKSTRA := AArrayOfEkstra;
  FEKSTRA_Specified := True;
end;

function Address.EKSTRA_Specified(Index: Integer): boolean;
begin
  Result := FEKSTRA_Specified;
end;

procedure ReportFields.SetGsmValue(Index: Integer; const Astring: string);
begin
  FGsmValue := Astring;
  FGsmValue_Specified := True;
end;

function ReportFields.GsmValue_Specified(Index: Integer): boolean;
begin
  Result := FGsmValue_Specified;
end;

procedure ReportFields.SetTextValue(Index: Integer; const Astring: string);
begin
  FTextValue := Astring;
  FTextValue_Specified := True;
end;

function ReportFields.TextValue_Specified(Index: Integer): boolean;
begin
  Result := FTextValue_Specified;
end;

procedure ReportFields.SetStatusValue(Index: Integer; const Astring: string);
begin
  FStatusValue := Astring;
  FStatusValue_Specified := True;
end;

function ReportFields.StatusValue_Specified(Index: Integer): boolean;
begin
  Result := FStatusValue_Specified;
end;

procedure ReportFields.SetStatusIdValue(Index: Integer; const Astring: string);
begin
  FStatusIdValue := Astring;
  FStatusIdValue_Specified := True;
end;

function ReportFields.StatusIdValue_Specified(Index: Integer): boolean;
begin
  Result := FStatusIdValue_Specified;
end;

procedure ReportFields.SetResponseCodeValue(Index: Integer; const Astring: string);
begin
  FResponseCodeValue := Astring;
  FResponseCodeValue_Specified := True;
end;

function ReportFields.ResponseCodeValue_Specified(Index: Integer): boolean;
begin
  Result := FResponseCodeValue_Specified;
end;

procedure ReportFields.SetGroupsValue(Index: Integer; const Astring: string);
begin
  FGroupsValue := Astring;
  FGroupsValue_Specified := True;
end;

function ReportFields.GroupsValue_Specified(Index: Integer): boolean;
begin
  Result := FGroupsValue_Specified;
end;

procedure ReportFields.SetNameSurnameValue(Index: Integer; const Astring: string);
begin
  FNameSurnameValue := Astring;
  FNameSurnameValue_Specified := True;
end;

function ReportFields.NameSurnameValue_Specified(Index: Integer): boolean;
begin
  Result := FNameSurnameValue_Specified;
end;

procedure ReportFields.SetNoteValue(Index: Integer; const Astring: string);
begin
  FNoteValue := Astring;
  FNoteValue_Specified := True;
end;

function ReportFields.NoteValue_Specified(Index: Integer): boolean;
begin
  Result := FNoteValue_Specified;
end;

procedure ReportFields.SetEkstraValue(Index: Integer; const Astring: string);
begin
  FEkstraValue := Astring;
  FEkstraValue_Specified := True;
end;

function ReportFields.EkstraValue_Specified(Index: Integer): boolean;
begin
  Result := FEkstraValue_Specified;
end;

procedure ReportFields.SetBulkValue(Index: Integer; const Astring: string);
begin
  FBulkValue := Astring;
  FBulkValue_Specified := True;
end;

function ReportFields.BulkValue_Specified(Index: Integer): boolean;
begin
  Result := FBulkValue_Specified;
end;

procedure ReportFields.SetCidValue(Index: Integer; const Astring: string);
begin
  FCidValue := Astring;
  FCidValue_Specified := True;
end;

function ReportFields.CidValue_Specified(Index: Integer): boolean;
begin
  Result := FCidValue_Specified;
end;

procedure ReportFields.SetSmppValue(Index: Integer; const Astring: string);
begin
  FSmppValue := Astring;
  FSmppValue_Specified := True;
end;

function ReportFields.SmppValue_Specified(Index: Integer): boolean;
begin
  Result := FSmppValue_Specified;
end;

procedure ReportFields.SetChannelValue(Index: Integer; const Astring: string);
begin
  FChannelValue := Astring;
  FChannelValue_Specified := True;
end;

function ReportFields.ChannelValue_Specified(Index: Integer): boolean;
begin
  Result := FChannelValue_Specified;
end;

procedure ReportFields.SetTotalSmsValue(Index: Integer; const Astring: string);
begin
  FTotalSmsValue := Astring;
  FTotalSmsValue_Specified := True;
end;

function ReportFields.TotalSmsValue_Specified(Index: Integer): boolean;
begin
  Result := FTotalSmsValue_Specified;
end;

procedure ReportFields.SetProcessDateValue(Index: Integer; const Astring: string);
begin
  FProcessDateValue := Astring;
  FProcessDateValue_Specified := True;
end;

function ReportFields.ProcessDateValue_Specified(Index: Integer): boolean;
begin
  Result := FProcessDateValue_Specified;
end;

procedure ReportFields.SetProcessTimeValue(Index: Integer; const Astring: string);
begin
  FProcessTimeValue := Astring;
  FProcessTimeValue_Specified := True;
end;

function ReportFields.ProcessTimeValue_Specified(Index: Integer): boolean;
begin
  Result := FProcessTimeValue_Specified;
end;

procedure ReportFields.SetSendDateValue(Index: Integer; const Astring: string);
begin
  FSendDateValue := Astring;
  FSendDateValue_Specified := True;
end;

function ReportFields.SendDateValue_Specified(Index: Integer): boolean;
begin
  Result := FSendDateValue_Specified;
end;

procedure ReportFields.SetSendTimeValue(Index: Integer; const Astring: string);
begin
  FSendTimeValue := Astring;
  FSendTimeValue_Specified := True;
end;

function ReportFields.SendTimeValue_Specified(Index: Integer): boolean;
begin
  Result := FSendTimeValue_Specified;
end;

procedure ReportFields.SetDeliverDateValue(Index: Integer; const Astring: string);
begin
  FDeliverDateValue := Astring;
  FDeliverDateValue_Specified := True;
end;

function ReportFields.DeliverDateValue_Specified(Index: Integer): boolean;
begin
  Result := FDeliverDateValue_Specified;
end;

procedure ReportFields.SetDeliverTimeValue(Index: Integer; const Astring: string);
begin
  FDeliverTimeValue := Astring;
  FDeliverTimeValue_Specified := True;
end;

function ReportFields.DeliverTimeValue_Specified(Index: Integer): boolean;
begin
  Result := FDeliverTimeValue_Specified;
end;

procedure ReportFields.SetIsDifferValue(Index: Integer; const Astring: string);
begin
  FIsDifferValue := Astring;
  FIsDifferValue_Specified := True;
end;

function ReportFields.IsDifferValue_Specified(Index: Integer): boolean;
begin
  Result := FIsDifferValue_Specified;
end;

procedure ReportFields.SetCustomerDescValue(Index: Integer; const Astring: string);
begin
  FCustomerDescValue := Astring;
  FCustomerDescValue_Specified := True;
end;

function ReportFields.CustomerDescValue_Specified(Index: Integer): boolean;
begin
  Result := FCustomerDescValue_Specified;
end;

procedure ReportFields.SetUserValue(Index: Integer; const Astring: string);
begin
  FUserValue := Astring;
  FUserValue_Specified := True;
end;

function ReportFields.UserValue_Specified(Index: Integer): boolean;
begin
  Result := FUserValue_Specified;
end;

procedure ReportFields.SetTitleValue(Index: Integer; const Astring: string);
begin
  FTitleValue := Astring;
  FTitleValue_Specified := True;
end;

function ReportFields.TitleValue_Specified(Index: Integer): boolean;
begin
  Result := FTitleValue_Specified;
end;

procedure ReportFields.SetReferansValue(Index: Integer; const Astring: string);
begin
  FReferansValue := Astring;
  FReferansValue_Specified := True;
end;

function ReportFields.ReferansValue_Specified(Index: Integer): boolean;
begin
  Result := FReferansValue_Specified;
end;

procedure ReportFields.SetStatusDescValue(Index: Integer; const Astring: string);
begin
  FStatusDescValue := Astring;
  FStatusDescValue_Specified := True;
end;

function ReportFields.StatusDescValue_Specified(Index: Integer): boolean;
begin
  Result := FStatusDescValue_Specified;
end;

procedure ReportFields.SetStatusDetailValue(Index: Integer; const Astring: string);
begin
  FStatusDetailValue := Astring;
  FStatusDetailValue_Specified := True;
end;

function ReportFields.StatusDetailValue_Specified(Index: Integer): boolean;
begin
  Result := FStatusDetailValue_Specified;
end;

procedure ReportFields.SetPricedValue(Index: Integer; const Astring: string);
begin
  FPricedValue := Astring;
  FPricedValue_Specified := True;
end;

function ReportFields.PricedValue_Specified(Index: Integer): boolean;
begin
  Result := FPricedValue_Specified;
end;

procedure ReportFields.SetProcessNoteValue(Index: Integer; const Astring: string);
begin
  FProcessNoteValue := Astring;
  FProcessNoteValue_Specified := True;
end;

function ReportFields.ProcessNoteValue_Specified(Index: Integer): boolean;
begin
  Result := FProcessNoteValue_Specified;
end;

procedure ReportFields.SetMessageGroupId(Index: Integer; const Astring: string);
begin
  FMessageGroupId := Astring;
  FMessageGroupId_Specified := True;
end;

function ReportFields.MessageGroupId_Specified(Index: Integer): boolean;
begin
  Result := FMessageGroupId_Specified;
end;

procedure ReportFields.SetMessageId(Index: Integer; const Astring: string);
begin
  FMessageId := Astring;
  FMessageId_Specified := True;
end;

function ReportFields.MessageId_Specified(Index: Integer): boolean;
begin
  Result := FMessageId_Specified;
end;

procedure ReportFields.SetAbroadValue(Index: Integer; const Astring: string);
begin
  FAbroadValue := Astring;
  FAbroadValue_Specified := True;
end;

function ReportFields.AbroadValue_Specified(Index: Integer): boolean;
begin
  Result := FAbroadValue_Specified;
end;

procedure ReportFields.SetUniqueIdValue(Index: Integer; const Astring: string);
begin
  FUniqueIdValue := Astring;
  FUniqueIdValue_Specified := True;
end;

function ReportFields.UniqueIdValue_Specified(Index: Integer): boolean;
begin
  Result := FUniqueIdValue_Specified;
end;

procedure ReportFields.SetReportDateValue(Index: Integer; const Astring: string);
begin
  FReportDateValue := Astring;
  FReportDateValue_Specified := True;
end;

function ReportFields.ReportDateValue_Specified(Index: Integer): boolean;
begin
  Result := FReportDateValue_Specified;
end;

procedure ReportFields.SetIsAlive(Index: Integer; const Astring: string);
begin
  FIsAlive := Astring;
  FIsAlive_Specified := True;
end;

function ReportFields.IsAlive_Specified(Index: Integer): boolean;
begin
  Result := FIsAlive_Specified;
end;

procedure ReportSMSDetailedResult.SetID(Index: Integer; const Astring: string);
begin
  FID := Astring;
  FID_Specified := True;
end;

function ReportSMSDetailedResult.ID_Specified(Index: Integer): boolean;
begin
  Result := FID_Specified;
end;

procedure ReportSMSDetailedResult.SetPhone(Index: Integer; const Astring: string);
begin
  FPhone := Astring;
  FPhone_Specified := True;
end;

function ReportSMSDetailedResult.Phone_Specified(Index: Integer): boolean;
begin
  Result := FPhone_Specified;
end;

procedure ReportSMSDetailedResult.SetStatus(Index: Integer; const Astring: string);
begin
  FStatus := Astring;
  FStatus_Specified := True;
end;

function ReportSMSDetailedResult.Status_Specified(Index: Integer): boolean;
begin
  Result := FStatus_Specified;
end;

procedure ReportSMSDetailedResult.SetSendDate(Index: Integer; const Astring: string);
begin
  FSendDate := Astring;
  FSendDate_Specified := True;
end;

function ReportSMSDetailedResult.SendDate_Specified(Index: Integer): boolean;
begin
  Result := FSendDate_Specified;
end;

procedure ReportSMSDetailedResult.SetDeliveredDate(Index: Integer; const Astring: string);
begin
  FDeliveredDate := Astring;
  FDeliveredDate_Specified := True;
end;

function ReportSMSDetailedResult.DeliveredDate_Specified(Index: Integer): boolean;
begin
  Result := FDeliveredDate_Specified;
end;

procedure ReportSMSDetailedResult.SetOriginator(Index: Integer; const Astring: string);
begin
  FOriginator := Astring;
  FOriginator_Specified := True;
end;

function ReportSMSDetailedResult.Originator_Specified(Index: Integer): boolean;
begin
  Result := FOriginator_Specified;
end;

procedure ReportSMSDetailedResult.SetCreateDate(Index: Integer; const Astring: string);
begin
  FCreateDate := Astring;
  FCreateDate_Specified := True;
end;

function ReportSMSDetailedResult.CreateDate_Specified(Index: Integer): boolean;
begin
  Result := FCreateDate_Specified;
end;

procedure ReportSMSDetailedResult.SetMessageText(Index: Integer; const Astring: string);
begin
  FMessageText := Astring;
  FMessageText_Specified := True;
end;

function ReportSMSDetailedResult.MessageText_Specified(Index: Integer): boolean;
begin
  Result := FMessageText_Specified;
end;

procedure ReportSMSDetailedResult.SetResponseCode(Index: Integer; const Astring: string);
begin
  FResponseCode := Astring;
  FResponseCode_Specified := True;
end;

function ReportSMSDetailedResult.ResponseCode_Specified(Index: Integer): boolean;
begin
  Result := FResponseCode_Specified;
end;

procedure ReportSMSDetailedResult.SetSendRetryCount(Index: Integer; const Astring: string);
begin
  FSendRetryCount := Astring;
  FSendRetryCount_Specified := True;
end;

function ReportSMSDetailedResult.SendRetryCount_Specified(Index: Integer): boolean;
begin
  Result := FSendRetryCount_Specified;
end;

destructor CreditResult.Destroy;
begin
  System.SysUtils.FreeAndNil(FBalance);
  inherited Destroy;
end;

procedure CreditResult.SetErrorCode(Index: Integer; const Astring: string);
begin
  FErrorCode := Astring;
  FErrorCode_Specified := True;
end;

function CreditResult.ErrorCode_Specified(Index: Integer): boolean;
begin
  Result := FErrorCode_Specified;
end;

procedure CreditResult.SetErrorDesc(Index: Integer; const Astring: string);
begin
  FErrorDesc := Astring;
  FErrorDesc_Specified := True;
end;

function CreditResult.ErrorDesc_Specified(Index: Integer): boolean;
begin
  Result := FErrorDesc_Specified;
end;

procedure CreditResult.SetBalanceDateTime(Index: Integer; const Astring: string);
begin
  FBalanceDateTime := Astring;
  FBalanceDateTime_Specified := True;
end;

function CreditResult.BalanceDateTime_Specified(Index: Integer): boolean;
begin
  Result := FBalanceDateTime_Specified;
end;

destructor AttributeValuesResult.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FValues)-1 do
    System.SysUtils.FreeAndNil(FValues[I]);
  System.SetLength(FValues, 0);
  inherited Destroy;
end;

procedure AttributeValuesResult.SetErrorCode(Index: Integer; const Astring: string);
begin
  FErrorCode := Astring;
  FErrorCode_Specified := True;
end;

function AttributeValuesResult.ErrorCode_Specified(Index: Integer): boolean;
begin
  Result := FErrorCode_Specified;
end;

procedure AttributeValuesResult.SetErrorDesc(Index: Integer; const Astring: string);
begin
  FErrorDesc := Astring;
  FErrorDesc_Specified := True;
end;

function AttributeValuesResult.ErrorDesc_Specified(Index: Integer): boolean;
begin
  Result := FErrorDesc_Specified;
end;

procedure AttributeValuesResult.SetValues(Index: Integer; const AArrayOfAttributeValue: ArrayOfAttributeValue);
begin
  FValues := AArrayOfAttributeValue;
  FValues_Specified := True;
end;

function AttributeValuesResult.Values_Specified(Index: Integer): boolean;
begin
  Result := FValues_Specified;
end;

procedure AttributeValue.SetID(Index: Integer; const Astring: string);
begin
  FID := Astring;
  FID_Specified := True;
end;

function AttributeValue.ID_Specified(Index: Integer): boolean;
begin
  Result := FID_Specified;
end;

procedure AttributeValue.SetValue(Index: Integer; const Astring: string);
begin
  FValue := Astring;
  FValue_Specified := True;
end;

function AttributeValue.Value_Specified(Index: Integer): boolean;
begin
  Result := FValue_Specified;
end;

procedure GroupResult.SetErrorCode(Index: Integer; const Astring: string);
begin
  FErrorCode := Astring;
  FErrorCode_Specified := True;
end;

function GroupResult.ErrorCode_Specified(Index: Integer): boolean;
begin
  Result := FErrorCode_Specified;
end;

procedure GroupResult.SetErrorDesc(Index: Integer; const Astring: string);
begin
  FErrorDesc := Astring;
  FErrorDesc_Specified := True;
end;

function GroupResult.ErrorDesc_Specified(Index: Integer): boolean;
begin
  Result := FErrorDesc_Specified;
end;

procedure GroupResult.SetCount(Index: Integer; const Astring: string);
begin
  FCount := Astring;
  FCount_Specified := True;
end;

function GroupResult.Count_Specified(Index: Integer): boolean;
begin
  Result := FCount_Specified;
end;

destructor IYSReportResult.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FFailRecords)-1 do
    System.SysUtils.FreeAndNil(FFailRecords[I]);
  System.SetLength(FFailRecords, 0);
  System.SysUtils.FreeAndNil(FReportResult);
  inherited Destroy;
end;

procedure IYSReportResult.SetReportResult(Index: Integer; const AIYSResult: IYSResult);
begin
  FReportResult := AIYSResult;
  FReportResult_Specified := True;
end;

function IYSReportResult.ReportResult_Specified(Index: Integer): boolean;
begin
  Result := FReportResult_Specified;
end;

procedure IYSReportResult.SetFailRecords(Index: Integer; const AArrayOfIYSReportErrorItem: ArrayOfIYSReportErrorItem);
begin
  FFailRecords := AArrayOfIYSReportErrorItem;
  FFailRecords_Specified := True;
end;

function IYSReportResult.FailRecords_Specified(Index: Integer): boolean;
begin
  Result := FFailRecords_Specified;
end;

destructor ReportSMSDetailedResult_v3.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FData)-1 do
    System.SysUtils.FreeAndNil(FData[I]);
  System.SetLength(FData, 0);
  inherited Destroy;
end;

procedure ReportSMSDetailedResult_v3.SetStatus(Index: Integer; const Astring: string);
begin
  FStatus := Astring;
  FStatus_Specified := True;
end;

function ReportSMSDetailedResult_v3.Status_Specified(Index: Integer): boolean;
begin
  Result := FStatus_Specified;
end;

procedure ReportSMSDetailedResult_v3.SetStatusDesc(Index: Integer; const Astring: string);
begin
  FStatusDesc := Astring;
  FStatusDesc_Specified := True;
end;

function ReportSMSDetailedResult_v3.StatusDesc_Specified(Index: Integer): boolean;
begin
  Result := FStatusDesc_Specified;
end;

procedure ReportSMSDetailedResult_v3.SetData(Index: Integer; const AArrayOfReportFields: ArrayOfReportFields);
begin
  FData := AArrayOfReportFields;
  FData_Specified := True;
end;

function ReportSMSDetailedResult_v3.Data_Specified(Index: Integer): boolean;
begin
  Result := FData_Specified;
end;

procedure MsisdnBL.SetMsisdn(Index: Integer; const Astring: string);
begin
  FMsisdn := Astring;
  FMsisdn_Specified := True;
end;

function MsisdnBL.Msisdn_Specified(Index: Integer): boolean;
begin
  Result := FMsisdn_Specified;
end;

procedure ReportSMSDetailedResult_v2.SetStatus(Index: Integer; const Astring: string);
begin
  FStatus := Astring;
  FStatus_Specified := True;
end;

function ReportSMSDetailedResult_v2.Status_Specified(Index: Integer): boolean;
begin
  Result := FStatus_Specified;
end;

procedure ReportSMSDetailedResult_v2.SetStatusDesc(Index: Integer; const Astring: string);
begin
  FStatusDesc := Astring;
  FStatusDesc_Specified := True;
end;

function ReportSMSDetailedResult_v2.StatusDesc_Specified(Index: Integer): boolean;
begin
  Result := FStatusDesc_Specified;
end;

procedure ReportSMSDetailedResult_v2.SetUrl(Index: Integer; const Astring: string);
begin
  FUrl := Astring;
  FUrl_Specified := True;
end;

function ReportSMSDetailedResult_v2.Url_Specified(Index: Integer): boolean;
begin
  Result := FUrl_Specified;
end;

destructor CheckBLResult.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FMsisdnBlacklistMatch)-1 do
    System.SysUtils.FreeAndNil(FMsisdnBlacklistMatch[I]);
  System.SetLength(FMsisdnBlacklistMatch, 0);
  inherited Destroy;
end;

procedure CheckBLResult.SetMsisdnBlacklistMatch(Index: Integer; const AArrayOfMsisdnBL: ArrayOfMsisdnBL);
begin
  FMsisdnBlacklistMatch := AArrayOfMsisdnBL;
  FMsisdnBlacklistMatch_Specified := True;
end;

function CheckBLResult.MsisdnBlacklistMatch_Specified(Index: Integer): boolean;
begin
  Result := FMsisdnBlacklistMatch_Specified;
end;

initialization
  { SMSServiceSoap }
  InvRegistry.RegisterInterface(TypeInfo(SMSServiceSoap), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SMSServiceSoap), 'http://tempuri.org/%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(SMSServiceSoap), ioDocument);
  { SMSServiceSoap.SendSMSSingle }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'SendSMSSingle', '',
                                 '[ReturnName="SendSMSSingleResult"]', IS_OPTN);
  { SMSServiceSoap.SendSMSSeperatorAVS }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'SendSMSSeperatorAVS', '',
                                 '[ReturnName="SendSMSSeperatorAVSResult"]', IS_OPTN);
  { SMSServiceSoap.SendSMS }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'SendSMS', '',
                                 '[ReturnName="SendSMSResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'SendSMS', 'messages', '',
                                '[ArrayItemName="string"]');
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'SendSMS', 'receipents', '',
                                '[ArrayItemName="string"]');
  { SMSServiceSoap.SendSMS_V2 }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'SendSMS_V2', '',
                                 '[ReturnName="SendSMS_V2Result"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'SendSMS_V2', 'messages', '',
                                '[ArrayItemName="string"]');
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'SendSMS_V2', 'receipents', '',
                                '[ArrayItemName="string"]');
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'SendSMS_V2', 'messageIds', '',
                                '[ArrayItemName="string"]');
  { SMSServiceSoap.SendSMSBroadcast }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'SendSMSBroadcast', '',
                                 '[ReturnName="SendSMSBroadcastResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'SendSMSBroadcast', 'receipents', '',
                                '[ArrayItemName="string"]');
  { SMSServiceSoap.SendSMSBroadcast_V2 }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'SendSMSBroadcast_V2', '',
                                 '[ReturnName="SendSMSBroadcast_V2Result"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'SendSMSBroadcast_V2', 'receipents', '',
                                '[ArrayItemName="string"]');
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'SendSMSBroadcast_V2', 'messageIds', '',
                                '[ArrayItemName="string"]');
  { SMSServiceSoap.SendSMSToGroup }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'SendSMSToGroup', '',
                                 '[ReturnName="SendSMSToGroupResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'SendSMSToGroup', 'message_', 'message', '');
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'SendSMSToGroup', 'group', '',
                                '[ArrayItemName="string"]');
  { SMSServiceSoap.SendTCKNSMS }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'SendTCKNSMS', '',
                                 '[ReturnName="SendTCKNSMSResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'SendTCKNSMS', 'messages', '',
                                '[ArrayItemName="string"]');
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'SendTCKNSMS', 'receipents', '',
                                '[ArrayItemName="string"]');
  { SMSServiceSoap.SendTCKNSMSBroadcast }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'SendTCKNSMSBroadcast', '',
                                 '[ReturnName="SendTCKNSMSBroadcastResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'SendTCKNSMSBroadcast', 'receipents', '',
                                '[ArrayItemName="string"]');
  { SMSServiceSoap.SendTCKNSMSToGroup }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'SendTCKNSMSToGroup', '',
                                 '[ReturnName="SendTCKNSMSToGroupResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'SendTCKNSMSToGroup', 'message_', 'message', '');
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'SendTCKNSMSToGroup', 'group', '',
                                '[ArrayItemName="string"]');
  { SMSServiceSoap.SendSMSAdvancedToGroup }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'SendSMSAdvancedToGroup', '',
                                 '[ReturnName="SendSMSAdvancedToGroupResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'SendSMSAdvancedToGroup', 'message_', 'message', '');
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'SendSMSAdvancedToGroup', 'group', '',
                                '[ArrayItemName="string"]');
  { SMSServiceSoap.SendSMSAdvanced }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'SendSMSAdvanced', '',
                                 '[ReturnName="SendSMSAdvancedResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'SendSMSAdvanced', 'messages', '',
                                '[ArrayItemName="string"]');
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'SendSMSAdvanced', 'receipents', '',
                                '[ArrayItemName="string"]');
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'SendSMSAdvanced', 'messageHeader', '',
                                '[ArrayItemName="string"]');
  { SMSServiceSoap.ReportSMS }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'ReportSMS', '',
                                 '[ReturnName="ReportSMSResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'ReportSMS', 'ReportSMSResult', '',
                                '[ArrayItemName="ReportSMSResult"]');
  { SMSServiceSoap.ReportSMS_V2 }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'ReportSMS_V2', '',
                                 '[ReturnName="ReportSMS_V2Result"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'ReportSMS_V2', 'messageIds', '',
                                '[ArrayItemName="string"]');
  { SMSServiceSoap.ReportOriginator }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'ReportOriginator', '',
                                 '[ReturnName="ReportOriginatorResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'ReportOriginator', 'ReportOriginatorResult', '',
                                '[ArrayItemName="string"]');
  { SMSServiceSoap.ReportOriginatorWithChannel }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'ReportOriginatorWithChannel', '',
                                 '[ReturnName="ReportOriginatorWithChannelResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'ReportOriginatorWithChannel', 'ReportOriginatorWithChannelResult', '',
                                '[ArrayItemName="clsTitles"]');
  { SMSServiceSoap.ReportQuota }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'ReportQuota', '',
                                 '[ReturnName="ReportQuotaResult"]', IS_OPTN);
  { SMSServiceSoap.ReportGroups }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'ReportGroups', '',
                                 '[ReturnName="ReportGroupsResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'ReportGroups', 'ReportGroupsResult', '',
                                '[ArrayItemName="clsGroups"]');
  { SMSServiceSoap.ReportGroupNumbers }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'ReportGroupNumbers', '',
                                 '[ReturnName="ReportGroupNumbersResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'ReportGroupNumbers', 'group', '',
                                '[ArrayItemName="string"]');
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'ReportGroupNumbers', 'ReportGroupNumbersResult', '',
                                '[ArrayItemName="clsGroupInfo"]');
  { SMSServiceSoap.ReportSMSReverse }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'ReportSMSReverse', '',
                                 '[ReturnName="ReportSMSReverseResult"]', IS_OPTN);
  { SMSServiceSoap.AprroveReverse }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'AprroveReverse', '',
                                 '[ReturnName="AprroveReverseResult"]');
  { SMSServiceSoap.SendMMS }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'SendMMS', '',
                                 '[ReturnName="SendMMSResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'SendMMS', 'receipents', '',
                                '[ArrayItemName="string"]');
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'SendMMS', 'message_', 'message', '');
  { SMSServiceSoap.SendAnindaCevap }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'SendAnindaCevap', '',
                                 '[ReturnName="SendAnindaCevapResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'SendAnindaCevap', 'receipents', '',
                                '[ArrayItemName="string"]');
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'SendAnindaCevap', 'anindaCevapParameters', '',
                                '[ArrayItemName="ACParameter"]');
  { SMSServiceSoap.CreateGroup }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'CreateGroup', '',
                                 '[ReturnName="CreateGroupResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'CreateGroup', 'msisdnList', '',
                                '[ArrayItemName="string"]');
  { SMSServiceSoap.CreateCampaign }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'CreateCampaign', '',
                                 '[ReturnName="CreateCampaignResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'CreateCampaign', 'message_', 'message', '');
  { SMSServiceSoap.SendCampaign }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'SendCampaign', '',
                                 '[ReturnName="SendCampaignResult"]', IS_OPTN);
  { SMSServiceSoap.SendLOKCampaign }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'SendLOKCampaign', '',
                                 '[ReturnName="SendLOKCampaignResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'SendLOKCampaign', 'message_', 'message', '');
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'SendLOKCampaign', 'receipents', '',
                                '[ArrayItemName="string"]');
  { SMSServiceSoap.ReportLOKSMS }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'ReportLOKSMS', '',
                                 '[ReturnName="ReportLOKSMSResult"]', IS_OPTN);
  { SMSServiceSoap.GetAttributeValues }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'GetAttributeValues', '',
                                 '[ReturnName="GetAttributeValuesResult"]', IS_OPTN);
  { SMSServiceSoap.AddMsisdnsToGroup }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'AddMsisdnsToGroup', '',
                                 '[ReturnName="AddMsisdnsToGroupResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'AddMsisdnsToGroup', 'msisdnList', '',
                                '[ArrayItemName="string"]');
  { SMSServiceSoap.RemoveMsisdnsFromGroup }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'RemoveMsisdnsFromGroup', '',
                                 '[ReturnName="RemoveMsisdnsFromGroupResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'RemoveMsisdnsFromGroup', 'msisdnList', '',
                                '[ArrayItemName="string"]');
  { SMSServiceSoap.GetBioTLCredit }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'GetBioTLCredit', '',
                                 '[ReturnName="GetBioTLCreditResult"]', IS_OPTN);
  { SMSServiceSoap.GetSMSCredit }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'GetSMSCredit', '',
                                 '[ReturnName="GetSMSCreditResult"]', IS_OPTN);
  { SMSServiceSoap.ReportSMSDetail }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'ReportSMSDetail', '',
                                 '[ReturnName="ReportSMSDetailResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'ReportSMSDetail', 'ReportSMSDetailResult', '',
                                '[ArrayItemName="ReportSMSDetailedResult"]');
  { SMSServiceSoap.ReportSMSDetail_v2 }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'ReportSMSDetail_v2', '',
                                 '[ReturnName="ReportSMSDetail_v2Result"]', IS_OPTN);
  { SMSServiceSoap.CheckBlacklist }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'CheckBlacklist', '',
                                 '[ReturnName="CheckBlacklistResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'CheckBlacklist', 'msisdnList', '',
                                '[ArrayItemName="string"]');
  { SMSServiceSoap.ReportSMSDetail_v3 }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'ReportSMSDetail_v3', '',
                                 '[ReturnName="ReportSMSDetail_v3Result"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'ReportSMSDetail_v3', 'report_message_ids', '',
                                '[ArrayItemName="string"]');
  { SMSServiceSoap.Optin }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'Optin', '',
                                 '[ReturnName="OptinResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'Optin', 'msisdnList', '',
                                '[ArrayItemName="string"]');
  { SMSServiceSoap.OptinByTitles }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'OptinByTitles', '',
                                 '[ReturnName="OptinByTitlesResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'OptinByTitles', 'msisdnList', '',
                                '[ArrayItemName="string"]');
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'OptinByTitles', 'optinTitles', '',
                                '[ArrayItemName="string"]');
  { SMSServiceSoap.Optout }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'Optout', '',
                                 '[ReturnName="OptoutResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'Optout', 'msisdnList', '',
                                '[ArrayItemName="string"]');
  { SMSServiceSoap.OptoutByTitles }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'OptoutByTitles', '',
                                 '[ReturnName="OptoutByTitlesResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'OptoutByTitles', 'msisdnList', '',
                                '[ArrayItemName="string"]');
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'OptoutByTitles', 'optinTitles', '',
                                '[ArrayItemName="string"]');
  { SMSServiceSoap.IYSInsert }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'IYSInsert', '',
                                 '[ReturnName="IYSInsertResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'IYSInsert', '_LIYSRequestList', '',
                                '[ArrayItemName="IYSRequestList"]');
  { SMSServiceSoap.IYSReport }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'IYSReport', '',
                                 '[ReturnName="IYSReportResult"]', IS_OPTN);
  { SMSServiceSoap.AddOrUpdateMsisdns }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSServiceSoap), 'AddOrUpdateMsisdns', '',
                                 '[ReturnName="AddOrUpdateMsisdnsResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSServiceSoap), 'AddOrUpdateMsisdns', 'clsMsisdn', '',
                                '[ArrayItemName="Address"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfClsMessage), 'http://tempuri.org/', 'ArrayOfClsMessage');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfACParameter), 'http://tempuri.org/', 'ArrayOfACParameter');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfClsGroupInfo), 'http://tempuri.org/', 'ArrayOfClsGroupInfo');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfLOKArea), 'http://tempuri.org/', 'ArrayOfLOKArea');
  RemClassRegistry.RegisterXSClass(LOKArea, 'http://tempuri.org/', 'LOKArea');
  RemClassRegistry.RegisterXSInfo(TypeInfo(enmACParameterTypes), 'http://tempuri.org/', 'enmACParameterTypes');
  RemClassRegistry.RegisterXSInfo(TypeInfo(enmGIFormat), 'http://tempuri.org/', 'enmGIFormat');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfResponseGroupId), 'http://tempuri.org/', 'ArrayOfResponseGroupId');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfReportSMSResult), 'http://tempuri.org/', 'ArrayOfReportSMSResult');
  RemClassRegistry.RegisterXSClass(SendSMSResult, 'http://tempuri.org/', 'SendSMSResult');
  RemClassRegistry.RegisterXSClass(ResponseFromHostV2, 'http://tempuri.org/', 'ResponseFromHostV2');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ResponseFromHostV2), 'ResponseGroupIdArray', '[ArrayItemName="ResponseGroupId"]');
  RemClassRegistry.RegisterXSClass(ResponseGroupId, 'http://tempuri.org/', 'ResponseGroupId');
  RemClassRegistry.RegisterXSClass(clsGroups, 'http://tempuri.org/', 'clsGroups');
  RemClassRegistry.RegisterXSClass(LOKInput, 'http://tempuri.org/', 'LOKInput');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(LOKInput), 'LokArea', '[ArrayItemName="LOKArea"]');
  RemClassRegistry.RegisterXSClass(ReportLOKSMSResult, 'http://tempuri.org/', 'ReportLOKSMSResult');
  RemClassRegistry.RegisterXSClass(clsGroupInfo, 'http://tempuri.org/', 'clsGroupInfo');
  RemClassRegistry.RegisterXSClass(clsReverse, 'http://tempuri.org/', 'clsReverse');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(clsReverse), 'Messages', '[ArrayItemName="clsMessage"]');
  RemClassRegistry.RegisterXSClass(clsMessage, 'http://tempuri.org/', 'clsMessage');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(clsMessage), 'Message_', '[ExtName="Message"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfString), 'http://tempuri.org/', 'ArrayOfString');
  RemClassRegistry.RegisterXSClass(ACParameter, 'http://tempuri.org/', 'ACParameter');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ACParameter), 'Type_', '[ExtName="Type"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ACParameter), 'SI_OptionTextList', '[ArrayItemName="string"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ACParameter), 'SI_OptionValueList', '[ArrayItemName="string"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfClsTitles), 'http://tempuri.org/', 'ArrayOfClsTitles');
  RemClassRegistry.RegisterXSClass(clsTitles, 'http://tempuri.org/', 'clsTitles');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfClsGroups), 'http://tempuri.org/', 'ArrayOfClsGroups');
  RemClassRegistry.RegisterXSClass(MessageReport, 'http://tempuri.org/', 'MessageReport');
  RemClassRegistry.RegisterXSClass(ReportSMSResult, 'http://tempuri.org/', 'ReportSMSResult');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfMessageReport), 'http://tempuri.org/', 'ArrayOfMessageReport');
  RemClassRegistry.RegisterXSClass(MessageResponseV2, 'http://tempuri.org/', 'MessageResponseV2');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(MessageResponseV2), 'MessageReportArray', '[ArrayItemName="MessageReport"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfIYSReportErrorItem), 'http://tempuri.org/', 'ArrayOfIYSReportErrorItem');
  RemClassRegistry.RegisterXSClass(IYSReportErrorItem, 'http://tempuri.org/', 'IYSReportErrorItem');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfAddress), 'http://tempuri.org/', 'ArrayOfAddress');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfIYSRequestList), 'http://tempuri.org/', 'ArrayOfIYSRequestList');
  RemClassRegistry.RegisterXSClass(IYSRequestList, 'http://tempuri.org/', 'IYSRequestList');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(IYSRequestList), 'type_', '[ExtName="type"]');
  RemClassRegistry.RegisterXSClass(IYSResult, 'http://tempuri.org/', 'IYSResult');
  RemClassRegistry.RegisterXSClass(Ekstra, 'http://tempuri.org/', 'Ekstra');
  RemClassRegistry.RegisterXSInfo(TypeInfo(enmOnLengthProblem), 'http://tempuri.org/', 'enmOnLengthProblem');
  RemClassRegistry.RegisterXSInfo(TypeInfo(enmGroupInfoType), 'http://tempuri.org/', 'enmGroupInfoType');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfEkstra), 'http://tempuri.org/', 'ArrayOfEkstra');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Gender), 'http://tempuri.org/', 'Gender');
  RemClassRegistry.RegisterXSInfo(TypeInfo(BloodGroup), 'http://tempuri.org/', 'BloodGroup');
  RemClassRegistry.RegisterXSClass(Address, 'http://tempuri.org/', 'Address');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(Address), 'EKSTRA', '[ArrayItemName="Ekstra"]');
  RemClassRegistry.RegisterXSClass(ReportFields, 'http://tempuri.org/', 'ReportFields');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfReportSMSDetailedResult), 'http://tempuri.org/', 'ArrayOfReportSMSDetailedResult');
  RemClassRegistry.RegisterXSClass(ReportSMSDetailedResult, 'http://tempuri.org/', 'ReportSMSDetailedResult');
  RemClassRegistry.RegisterXSClass(CreditResult, 'http://tempuri.org/', 'CreditResult');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfAttributeValue), 'http://tempuri.org/', 'ArrayOfAttributeValue');
  RemClassRegistry.RegisterXSClass(AttributeValuesResult, 'http://tempuri.org/', 'AttributeValuesResult');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(AttributeValuesResult), 'Values', '[ArrayItemName="AttributeValue"]');
  RemClassRegistry.RegisterXSClass(AttributeValue, 'http://tempuri.org/', 'AttributeValue');
  RemClassRegistry.RegisterXSClass(GroupResult, 'http://tempuri.org/', 'GroupResult');
  RemClassRegistry.RegisterXSClass(IYSReportResult, 'http://tempuri.org/', 'IYSReportResult');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(IYSReportResult), 'FailRecords', '[ArrayItemName="IYSReportErrorItem"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfReportFields), 'http://tempuri.org/', 'ArrayOfReportFields');
  RemClassRegistry.RegisterXSClass(ReportSMSDetailedResult_v3, 'http://tempuri.org/', 'ReportSMSDetailedResult_v3');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ReportSMSDetailedResult_v3), 'Data', '[ArrayItemName="ReportFields"]');
  RemClassRegistry.RegisterXSClass(MsisdnBL, 'http://tempuri.org/', 'MsisdnBL');
  RemClassRegistry.RegisterXSClass(ReportSMSDetailedResult_v2, 'http://tempuri.org/', 'ReportSMSDetailedResult_v2');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfMsisdnBL), 'http://tempuri.org/', 'ArrayOfMsisdnBL');
  RemClassRegistry.RegisterXSClass(CheckBLResult, 'http://tempuri.org/', 'CheckBLResult');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(CheckBLResult), 'MsisdnBlacklistMatch', '[ArrayItemName="MsisdnBL"]');

end.