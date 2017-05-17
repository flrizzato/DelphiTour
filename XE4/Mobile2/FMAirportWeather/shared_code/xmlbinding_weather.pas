
{***************************************************************************************}
{                                                                                       }
{                                   XML Data Binding                                    }
{                                                                                       }
{         Generated on: 11-7-2013 13:33:36                                              }
{       Generated from: Z:\pg\Documents\pgdemos\FMWeather\src\sample_data\weather.xml   }
{   Settings stored in: Z:\pg\Documents\pgdemos\FMWeather\src\sample_data\weather.xdb   }
{                                                                                       }
{***************************************************************************************}

unit xmlbinding_weather;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLCurrentWeatherType = interface;

{ IXMLCurrentWeatherType }

  IXMLCurrentWeatherType = interface(IXMLNode)
    ['{D9CDE60B-5AA9-46E5-A0DA-DD33CC3EEC5C}']
    { Property Accessors }
    function Get_Location: UnicodeString;
    function Get_Time: UnicodeString;
    function Get_Wind: UnicodeString;
    function Get_Visibility: UnicodeString;
    function Get_SkyConditions: UnicodeString;
    function Get_Temperature: UnicodeString;
    function Get_DewPoint: UnicodeString;
    function Get_RelativeHumidity: UnicodeString;
    function Get_Pressure: UnicodeString;
    function Get_Status: UnicodeString;
    procedure Set_Location(Value: UnicodeString);
    procedure Set_Time(Value: UnicodeString);
    procedure Set_Wind(Value: UnicodeString);
    procedure Set_Visibility(Value: UnicodeString);
    procedure Set_SkyConditions(Value: UnicodeString);
    procedure Set_Temperature(Value: UnicodeString);
    procedure Set_DewPoint(Value: UnicodeString);
    procedure Set_RelativeHumidity(Value: UnicodeString);
    procedure Set_Pressure(Value: UnicodeString);
    procedure Set_Status(Value: UnicodeString);
    { Methods & Properties }
    property Location: UnicodeString read Get_Location write Set_Location;
    property Time: UnicodeString read Get_Time write Set_Time;
    property Wind: UnicodeString read Get_Wind write Set_Wind;
    property Visibility: UnicodeString read Get_Visibility write Set_Visibility;
    property SkyConditions: UnicodeString read Get_SkyConditions write Set_SkyConditions;
    property Temperature: UnicodeString read Get_Temperature write Set_Temperature;
    property DewPoint: UnicodeString read Get_DewPoint write Set_DewPoint;
    property RelativeHumidity: UnicodeString read Get_RelativeHumidity write Set_RelativeHumidity;
    property Pressure: UnicodeString read Get_Pressure write Set_Pressure;
    property Status: UnicodeString read Get_Status write Set_Status;
  end;

{ Forward Decls }

  TXMLCurrentWeatherType = class;

{ TXMLCurrentWeatherType }

  TXMLCurrentWeatherType = class(TXMLNode, IXMLCurrentWeatherType)
  protected
    { IXMLCurrentWeatherType }
    function Get_Location: UnicodeString;
    function Get_Time: UnicodeString;
    function Get_Wind: UnicodeString;
    function Get_Visibility: UnicodeString;
    function Get_SkyConditions: UnicodeString;
    function Get_Temperature: UnicodeString;
    function Get_DewPoint: UnicodeString;
    function Get_RelativeHumidity: UnicodeString;
    function Get_Pressure: UnicodeString;
    function Get_Status: UnicodeString;
    procedure Set_Location(Value: UnicodeString);
    procedure Set_Time(Value: UnicodeString);
    procedure Set_Wind(Value: UnicodeString);
    procedure Set_Visibility(Value: UnicodeString);
    procedure Set_SkyConditions(Value: UnicodeString);
    procedure Set_Temperature(Value: UnicodeString);
    procedure Set_DewPoint(Value: UnicodeString);
    procedure Set_RelativeHumidity(Value: UnicodeString);
    procedure Set_Pressure(Value: UnicodeString);
    procedure Set_Status(Value: UnicodeString);
  end;

{ Global Functions }

function GetCurrentWeather(Doc: IXMLDocument): IXMLCurrentWeatherType;
function LoadCurrentWeather(const FileName: string): IXMLCurrentWeatherType;
function NewCurrentWeather: IXMLCurrentWeatherType;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function GetCurrentWeather(Doc: IXMLDocument): IXMLCurrentWeatherType;
begin
  Result := Doc.GetDocBinding('CurrentWeather', TXMLCurrentWeatherType, TargetNamespace) as IXMLCurrentWeatherType;
end;

function LoadCurrentWeather(const FileName: string): IXMLCurrentWeatherType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('CurrentWeather', TXMLCurrentWeatherType, TargetNamespace) as IXMLCurrentWeatherType;
end;

function NewCurrentWeather: IXMLCurrentWeatherType;
begin
  Result := NewXMLDocument.GetDocBinding('CurrentWeather', TXMLCurrentWeatherType, TargetNamespace) as IXMLCurrentWeatherType;
end;

{ TXMLCurrentWeatherType }

function TXMLCurrentWeatherType.Get_Location: UnicodeString;
begin
  Result := ChildNodes['Location'].Text;
end;

procedure TXMLCurrentWeatherType.Set_Location(Value: UnicodeString);
begin
  ChildNodes['Location'].NodeValue := Value;
end;

function TXMLCurrentWeatherType.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLCurrentWeatherType.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

function TXMLCurrentWeatherType.Get_Wind: UnicodeString;
begin
  Result := ChildNodes['Wind'].Text;
end;

procedure TXMLCurrentWeatherType.Set_Wind(Value: UnicodeString);
begin
  ChildNodes['Wind'].NodeValue := Value;
end;

function TXMLCurrentWeatherType.Get_Visibility: UnicodeString;
begin
  Result := ChildNodes['Visibility'].Text;
end;

procedure TXMLCurrentWeatherType.Set_Visibility(Value: UnicodeString);
begin
  ChildNodes['Visibility'].NodeValue := Value;
end;

function TXMLCurrentWeatherType.Get_SkyConditions: UnicodeString;
begin
  Result := ChildNodes['SkyConditions'].Text;
end;

procedure TXMLCurrentWeatherType.Set_SkyConditions(Value: UnicodeString);
begin
  ChildNodes['SkyConditions'].NodeValue := Value;
end;

function TXMLCurrentWeatherType.Get_Temperature: UnicodeString;
begin
  Result := ChildNodes['Temperature'].Text;
end;

procedure TXMLCurrentWeatherType.Set_Temperature(Value: UnicodeString);
begin
  ChildNodes['Temperature'].NodeValue := Value;
end;

function TXMLCurrentWeatherType.Get_DewPoint: UnicodeString;
begin
  Result := ChildNodes['DewPoint'].Text;
end;

procedure TXMLCurrentWeatherType.Set_DewPoint(Value: UnicodeString);
begin
  ChildNodes['DewPoint'].NodeValue := Value;
end;

function TXMLCurrentWeatherType.Get_RelativeHumidity: UnicodeString;
begin
  Result := ChildNodes['RelativeHumidity'].Text;
end;

procedure TXMLCurrentWeatherType.Set_RelativeHumidity(Value: UnicodeString);
begin
  ChildNodes['RelativeHumidity'].NodeValue := Value;
end;

function TXMLCurrentWeatherType.Get_Pressure: UnicodeString;
begin
  Result := ChildNodes['Pressure'].Text;
end;

procedure TXMLCurrentWeatherType.Set_Pressure(Value: UnicodeString);
begin
  ChildNodes['Pressure'].NodeValue := Value;
end;

function TXMLCurrentWeatherType.Get_Status: UnicodeString;
begin
  Result := ChildNodes['Status'].Text;
end;

procedure TXMLCurrentWeatherType.Set_Status(Value: UnicodeString);
begin
  ChildNodes['Status'].NodeValue := Value;
end;

end.