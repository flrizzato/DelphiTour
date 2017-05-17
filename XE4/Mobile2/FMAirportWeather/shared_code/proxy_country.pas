// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://www.webservicex.net/country.asmx?WSDL
//  >Import : http://www.webservicex.net/country.asmx?WSDL>0
// Encoding : utf-8
// Version  : 1.0
// (11-7-2013 12:40:40 - - $Rev: 56641 $)
// ************************************************************************ //

unit proxy_country;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_REF  = $0080;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]


  string_         =  type string;      { "http://www.webserviceX.NET"[GblElm] }

  // ************************************************************************ //
  // Namespace : http://www.webserviceX.NET
  // soapAction: http://www.webserviceX.NET/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : countrySoap
  // service   : country
  // port      : countrySoap
  // URL       : http://www.webservicex.net/country.asmx
  // ************************************************************************ //
  countrySoap = interface(IInvokable)
  ['{8DBC1A5E-EE9E-A914-A471-25BEA58B2E1A}']
    function  GetCountryByCountryCode(const CountryCode: string): string; stdcall;
    function  GetISD(const CountryName: string): string; stdcall;
    function  GetCountries: string; stdcall;
    function  GetCurrencyCodeByCurrencyName(const CurrencyName: string): string; stdcall;
    function  GetISOCountryCodeByCountyName(const CountryName: string): string; stdcall;
    function  GetCurrencyCode: string; stdcall;
    function  GetCountryByCurrencyCode(const CurrencyCode: string): string; stdcall;
    function  GetCurrencies: string; stdcall;
    function  GetCurrencyByCountry(const CountryName: string): string; stdcall;
    function  GetGMTbyCountry(const CountryName: string): string; stdcall;
  end;


  // ************************************************************************ //
  // Namespace : http://www.webserviceX.NET
  // style     : ????
  // use       : ????
  // binding   : countryHttpGet
  // service   : country
  // port      : countryHttpGet
  // ************************************************************************ //
  countryHttpGet = interface(IInvokable)
  ['{E36434B5-F36E-87BE-D2D7-4470D2165E2C}']
    function  GetCountryByCountryCode(const CountryCode: string): string_; stdcall;
    function  GetISD(const CountryName: string): string_; stdcall;
    function  GetCountries: string_; stdcall;
    function  GetCurrencyCodeByCurrencyName(const CurrencyName: string): string_; stdcall;
    function  GetISOCountryCodeByCountyName(const CountryName: string): string_; stdcall;
    function  GetCurrencyCode: string_; stdcall;
    function  GetCountryByCurrencyCode(const CurrencyCode: string): string_; stdcall;
    function  GetCurrencies: string_; stdcall;
    function  GetCurrencyByCountry(const CountryName: string): string_; stdcall;
    function  GetGMTbyCountry(const CountryName: string): string_; stdcall;
  end;


  // ************************************************************************ //
  // Namespace : http://www.webserviceX.NET
  // style     : ????
  // use       : ????
  // binding   : countryHttpPost
  // service   : country
  // port      : countryHttpPost
  // ************************************************************************ //
  countryHttpPost = interface(IInvokable)
  ['{1317FE8B-47F8-D4EE-CED1-E378E3CA808D}']
    function  GetCountryByCountryCode(const CountryCode: string): string_; stdcall;
    function  GetISD(const CountryName: string): string_; stdcall;
    function  GetCountries: string_; stdcall;
    function  GetCurrencyCodeByCurrencyName(const CurrencyName: string): string_; stdcall;
    function  GetISOCountryCodeByCountyName(const CountryName: string): string_; stdcall;
    function  GetCurrencyCode: string_; stdcall;
    function  GetCountryByCurrencyCode(const CurrencyCode: string): string_; stdcall;
    function  GetCurrencies: string_; stdcall;
    function  GetCurrencyByCountry(const CountryName: string): string_; stdcall;
    function  GetGMTbyCountry(const CountryName: string): string_; stdcall;
  end;

function GetcountrySoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): countrySoap;
function GetcountryHttpGet(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): countryHttpGet;
function GetcountryHttpPost(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): countryHttpPost;


implementation
  uses SysUtils;

function GetcountrySoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): countrySoap;
const
  defWSDL = 'http://www.webservicex.net/country.asmx?WSDL';
  defURL  = 'http://www.webservicex.net/country.asmx';
  defSvc  = 'country';
  defPrt  = 'countrySoap';
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
    Result := (RIO as countrySoap);
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


function GetcountryHttpGet(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): countryHttpGet;
const
  defWSDL = 'http://www.webservicex.net/country.asmx?WSDL';
  defURL  = '';
  defSvc  = 'country';
  defPrt  = 'countryHttpGet';
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
    Result := (RIO as countryHttpGet);
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


function GetcountryHttpPost(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): countryHttpPost;
const
  defWSDL = 'http://www.webservicex.net/country.asmx?WSDL';
  defURL  = '';
  defSvc  = 'country';
  defPrt  = 'countryHttpPost';
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
    Result := (RIO as countryHttpPost);
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
  { countrySoap }
  InvRegistry.RegisterInterface(TypeInfo(countrySoap), 'http://www.webserviceX.NET', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(countrySoap), 'http://www.webserviceX.NET/%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(countrySoap), ioDocument);
  { countrySoap.GetCountryByCountryCode }
  InvRegistry.RegisterMethodInfo(TypeInfo(countrySoap), 'GetCountryByCountryCode', '',
                                 '[ReturnName="GetCountryByCountryCodeResult"]', IS_OPTN);
  { countrySoap.GetISD }
  InvRegistry.RegisterMethodInfo(TypeInfo(countrySoap), 'GetISD', '',
                                 '[ReturnName="GetISDResult"]', IS_OPTN);
  { countrySoap.GetCountries }
  InvRegistry.RegisterMethodInfo(TypeInfo(countrySoap), 'GetCountries', '',
                                 '[ReturnName="GetCountriesResult"]', IS_OPTN);
  { countrySoap.GetCurrencyCodeByCurrencyName }
  InvRegistry.RegisterMethodInfo(TypeInfo(countrySoap), 'GetCurrencyCodeByCurrencyName', '',
                                 '[ReturnName="GetCurrencyCodeByCurrencyNameResult"]', IS_OPTN);
  { countrySoap.GetISOCountryCodeByCountyName }
  InvRegistry.RegisterMethodInfo(TypeInfo(countrySoap), 'GetISOCountryCodeByCountyName', '',
                                 '[ReturnName="GetISOCountryCodeByCountyNameResult"]', IS_OPTN);
  { countrySoap.GetCurrencyCode }
  InvRegistry.RegisterMethodInfo(TypeInfo(countrySoap), 'GetCurrencyCode', '',
                                 '[ReturnName="GetCurrencyCodeResult"]', IS_OPTN);
  { countrySoap.GetCountryByCurrencyCode }
  InvRegistry.RegisterMethodInfo(TypeInfo(countrySoap), 'GetCountryByCurrencyCode', '',
                                 '[ReturnName="GetCountryByCurrencyCodeResult"]', IS_OPTN);
  { countrySoap.GetCurrencies }
  InvRegistry.RegisterMethodInfo(TypeInfo(countrySoap), 'GetCurrencies', '',
                                 '[ReturnName="GetCurrenciesResult"]', IS_OPTN);
  { countrySoap.GetCurrencyByCountry }
  InvRegistry.RegisterMethodInfo(TypeInfo(countrySoap), 'GetCurrencyByCountry', '',
                                 '[ReturnName="GetCurrencyByCountryResult"]', IS_OPTN);
  { countrySoap.GetGMTbyCountry }
  InvRegistry.RegisterMethodInfo(TypeInfo(countrySoap), 'GetGMTbyCountry', '',
                                 '[ReturnName="GetGMTbyCountryResult"]', IS_OPTN);
  { countryHttpGet }
  InvRegistry.RegisterInterface(TypeInfo(countryHttpGet), 'http://www.webserviceX.NET', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(countryHttpGet), '');
  { countryHttpPost }
  InvRegistry.RegisterInterface(TypeInfo(countryHttpPost), 'http://www.webserviceX.NET', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(countryHttpPost), '');
  RemClassRegistry.RegisterXSInfo(TypeInfo(string_), 'http://www.webserviceX.NET', 'string_', 'string');

end.