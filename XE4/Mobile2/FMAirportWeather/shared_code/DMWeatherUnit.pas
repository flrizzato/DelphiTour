unit DMWeatherUnit;

interface

uses
  FMX.Platform,
  System.SysUtils, System.Classes, Xml.xmldom, Xml.XMLIntf, Xml.adomxmldom,
  Xml.XMLDoc, weather_utils, Data.DB, Datasnap.DBClient, System.Types, fillables;

type
  TDMWeather = class(TDataModule)
    cdsCountry: TClientDataSet;
    cdsCountryCountry: TStringField;
    cdsCities: TClientDataSet;
    cdsCitiesCity: TStringField;
    cdsCitiesCountry: TStringField;
    cdsFavorites: TClientDataSet;
    cdsFavoritesCountry: TStringField;
    cdsFavoritesCity: TStringField;
    cdsWeather: TClientDataSet;
    cdsWeatherLocName: TStringField;
    cdsWeatherLocCode: TStringField;
    cdsWeatherLocLatitude: TSingleField;
    cdsWeatherLocLongitude: TSingleField;
    cdsWeatherLocAltitude: TSingleField;
    cdsWeatherTime: TDateTimeField;
    cdsWeatherWindDir: TSingleField;
    cdsWeatherWind: TStringField;
    cdsWeatherWindSpeed: TSingleField;
    cdsWeatherVisibility: TStringField;
    cdsWeatherSkyConditions: TStringField;
    cdsWeatherTempF: TSingleField;
    cdsWeatherTempC: TSingleField;
    cdsWeatherDewPoint: TStringField;
    cdsWeatherRelativeHumidity: TSingleField;
    cdsWeatherPressureHg: TSingleField;
    cdsWeatherPressurehPa: TSingleField;
    cdsWeatherStatus: TStringField;
    cdsWeatherCity: TStringField;
    cdsWeatherCountry: TStringField;
    cdsStatus: TClientDataSet;
    cdsStatusLastUpdated: TDateTimeField;
    procedure DataModuleCreate(Sender: TObject);
  private
    FLastUpdated: TFillableDateTime;
    procedure GetCountriesFromWS(strs: TStrings);
    procedure GetCitiesFromWS(country: string; strs: TStrings);
    function GetLastUpdated: TFillableDateTime;
    function GetPath: string;
  public
    procedure GetCountries(strs: TStrings);
    function GetCountryList: TStringDynArray;
    function GetCityList(country: string): TStringDynArray;
    procedure GetCities(country: string; strs: TStrings);

    function GetWeatherXML(city, country: string): string; // to be moved to private
    function GetWeatherRec(city, country: string; var wr: TWeatherRec): boolean;
    function GetWeatherInfo(cc: TCityCountry; var info: TWeatherInfo): boolean;

    procedure FavoritesUpdate;
    function FavoritesGet: TCityCountryDynArray;
    function FavoritesAdd(cc: TCityCountry): boolean;
    function FavoritesDelete(cc: TCityCountry): boolean;
    function FavoritesDel(index: integer): boolean;

    procedure GetLastWeather;
    procedure UpdateWeather;
    procedure LastUpdatedInfoLoad; // reads last updated info
    procedure LastUpdateInfoStore; // updates last updated info to current time

    property LastUpdated: TFillableDateTime read GetLastUpdated;
  end;

var
  DMWeather: TDMWeather;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses proxy_country, xmlbinding_countries, xmlbinding_countrycities,
  proxy_globalweather, xmlbinding_weather;

{$R *.dfm}

const
  COUNTRY_FILENAME = 'countries.xml';
  CITY_FILENAME = 'cities.xml';
  FAVORITES_FILENAME = 'favorites.xml';
  WEATHER_FILENAME = 'weather.xml';
  STATUS_FILENAME = 'status.xml';

{ TDMWeather }

procedure TDMWeather.DataModuleCreate(Sender: TObject);
begin
  FLastUpdated.IsFilled := False;
end;

function TDMWeather.FavoritesAdd(cc: TCityCountry): boolean;
var rec_exists: boolean;
begin
  Result := False;
  if (cc.City <> '') and (cc.Country <> '') then
  begin
    rec_exists := False;

    if FileExists(GetPath + FAVORITES_FILENAME) then
    begin
      cdsFavorites.LoadFromFile(GetPath + FAVORITES_FILENAME);
      cdsFavorites.Filter := 'Country = ''' + cc.Country + ''' and City = ''' + cc.City + '''';
      cdsFavorites.Filtered := True;
      cdsFavorites.Active := True;
      rec_exists := cdsFavorites.RecordCount > 0;
    end
    else
    begin
      cdsFavorites.CreateDataSet;
      cdsFavorites.Active := True;
    end;

    cdsFavorites.Filtered := False;

    if not rec_exists then
    begin
      cdsFavorites.Append;
      cdsFavoritesCountry.AsString := cc.Country;
      cdsFavoritesCity.AsString := cc.City;
      cdsFavorites.Post;
      cdsFavorites.MergeChangeLog;
      cdsFavorites.SaveToFile(GetPath + FAVORITES_FILENAME);
      Result := True;
    end;
    cdsFavorites.Active := False;
  end;
end;

function TDMWeather.FavoritesDel(index: integer): boolean;
begin
  Result := False;
  if index > 0 then
  begin
    if FileExists(GetPath + FAVORITES_FILENAME) then
    begin
      cdsFavorites.LoadFromFile(GetPath + FAVORITES_FILENAME);
      cdsFavorites.Active := True;
      if index <= cdsFavorites.RecordCount then
      begin
        cdsFavorites.RecNo := index;
        cdsFavorites.Delete;
        cdsFavorites.MergeChangeLog;
        cdsFavorites.SaveToFile(GetPath + FAVORITES_FILENAME);
        Result := True;
      end;
    end;
  end;
end;

function TDMWeather.FavoritesDelete(cc: TCityCountry): boolean;
begin
  Result := False;
  if (cc.City <> '') and (cc.Country <> '') then
  begin
    if FileExists(GetPath + FAVORITES_FILENAME) then
    begin
      cdsFavorites.LoadFromFile(GetPath + FAVORITES_FILENAME);
      cdsFavorites.Filter := 'Country = ''' + cc.Country + ''' and City = ''' + cc.City + '''';
      cdsFavorites.Filtered := True;
      cdsFavorites.Active := True;
      if cdsFavorites.RecordCount > 0 then
      begin
        cdsFavorites.Delete;
        cdsFavorites.MergeChangeLog;
        cdsFavorites.SaveToFile(GetPath + FAVORITES_FILENAME);
        Result := True;
      end;
      cdsFavorites.Filtered := False;
      cdsFavorites.Active := False;
    end
  end;
end;

function TDMWeather.FavoritesGet: TCityCountryDynArray;
var aCount, i: integer;
begin
  if FileExists(GetPath + FAVORITES_FILENAME) then
  begin
    cdsFavorites.LoadFromFile(GetPath + FAVORITES_FILENAME);
    cdsFavorites.Active := True;
    aCount := cdsFavorites.RecordCount;
    SetLength(Result, aCount);
    if aCount > 0 then
    for i := 0 to aCount-1 do
    begin
      Result[i].City := cdsFavoritesCity.AsString;
      Result[i].Country := cdsFavoritesCountry.AsString;
      cdsFavorites.Next;
    end;
    cdsFavorites.Active := False;
  end
  else
    SetLength(Result,0);
end;

procedure TDMWeather.FavoritesUpdate;
begin
  if FileExists(GetPath + FAVORITES_FILENAME) then
  begin
    cdsFavorites.Active := False;
    cdsFavorites.LoadFromFile(GetPath + FAVORITES_FILENAME);
  end
  else
    cdsFavorites.CreateDataSet;
  cdsFavorites.Active := True;
end;

procedure TDMWeather.GetCities(country: string; strs: TStrings);
var i: integer; localdata_exists: boolean;
begin
  localdata_exists := False;

  if FileExists(GetPath + CITY_FILENAME) then
  begin
    cdsCities.LoadFromFile(GetPath + CITY_FILENAME);
    cdsCities.Filter := 'Country = ''' + country + '''';
    cdsCities.Filtered := True;
    cdsCities.Active := True;
    localdata_exists := cdsCities.RecordCount > 0;
  end;

  if localdata_exists then
  begin
    strs.Clear;
    while not cdsCities.Eof do
    begin
      strs.Add(cdsCitiesCity.AsString);
      cdsCities.Next;
    end;
    cdsCities.Active := False;
  end
  else
  begin
    // no local data, load from web service and update local file
    GetCitiesFromWS(country, strs);

    if not FileExists(GetPath + CITY_FILENAME) then
      cdsCities.CreateDataSet;

    cdsCities.Filtered := False;
    cdsCities.Active := True;
    if strs.Count > 0 then
    for i := 0 to strs.Count-1 do
    begin
      cdsCities.Append;
      cdsCitiesCity.AsString := strs[i];
      cdsCitiesCountry.AsString := country;
      cdsCities.Post;
    end
    else // no cities, but we want to add an empty record, so we do not retrieve cities from a web service again
    begin
      cdsCities.Append;
      cdsCitiesCity.AsString := '';
      cdsCitiesCountry.AsString := country;
      cdsCities.Post;
    end;

    cdsCities.MergeChangeLog;
    cdsCities.SaveToFile(GetPath + CITY_FILENAME);
    cdsCities.Active := False;
  end;
end;

procedure TDMWeather.GetCitiesFromWS(country: string; strs: TStrings);
var s: string; i: integer; xmldoc: TXMLDocument;
  cities: xmlbinding_countrycities.IXMLNewDataSetType;
begin
  if strs <> nil then
  begin
    strs.Clear;

    s := GetGlobalWeatherSoap.GetCitiesByCountry(country);

    xmldoc := TXMLDocument.Create(nil);
    try
      xmldoc.DOMVendor := GetDOMVendor('ADOM XML v4');
      xmldoc.XML.Add(s);
      cities := xmlbinding_countrycities.GetNewDataSet(xmldoc);
      if cities <> nil then
      for i := 0 to cities.Count-1 do
        strs.Add(cities[i].City);
    finally
  //    xmldoc.Free;
    end;
  end;
end;

function TDMWeather.GetCityList(country: string): TStringDynArray;
var cs: TStringList; i: Integer;
begin
  cs := TStringList.Create;
  try
    GetCities(country, cs);
    SetLength(Result, cs.Count);
    for i := 0 to cs.Count-1 do
      Result[i] := cs[i];
  finally
    cs.Free;
  end;
end;

procedure TDMWeather.GetLastWeather;
begin
  if FileExists(GetPath + WEATHER_FILENAME) then
  begin
    cdsWeather.Active := False;
    cdsWeather.LoadFromFile(GetPath + WEATHER_FILENAME);
    cdsWeather.Active := True;
    LastUpdatedInfoLoad;
  end;
end;

procedure TDMWeather.UpdateWeather;
var favs: TCityCountryDynArray; i: integer; info: TWeatherInfo;
begin
  cdsWeather.Active := False;
  cdsWeather.CreateDataSet;
  cdsWeather.Active := True;

//  FavoritesUpdate;

  favs := FavoritesGet;
  try
    for i := 0 to Length(favs)-1 do
    begin
      if GetWeatherInfo(favs[i],info) then
      begin
        cdsWeather.Append;
        cdsWeatherCity.AsString := favs[i].City;
        cdsWeatherCountry.AsString := favs[i].Country;
        cdsWeatherLocName.AsString := info.LocName;
        cdsWeatherLocCode.AsString := info.LocCode;
        SetSingleField(cdsWeatherLocLatitude, info.LocLatitude);
        SetSingleField(cdsWeatherLocLongitude, info.LocLongitude);
        SetSingleField(cdsWeatherLocAltitude, info.LocAltitude);
        SetDateTimeField(cdsWeatherTime, info.DateTimeUTC);
        cdsWeatherWind.AsString := info.Wind;
        SetSingleField(cdsWeatherWindDir, info.WindDir);
        SetSingleField(cdsWeatherWindSpeed, info.WindSpeed);
        cdsWeatherVisibility.AsString := info.Visibility;
        cdsWeatherSkyConditions.AsString := info.SkyConditions;
        SetSingleField(cdsWeatherTempF, info.TempF);
        SetSingleField(cdsWeatherTempC, info.TempC);
        cdsWeatherDewPoint.AsString := info.DewPoint;
        SetSingleField(cdsWeatherRelativeHumidity, info.RelativeHumidity);
        SetSingleField(cdsWeatherPressureHg, info.PressureHg);
        SetSingleField(cdsWeatherPressurehPa, info.PressurehPa);
        cdsWeatherStatus.AsString := info.Status;
        cdsWeather.Post;
      end;
    end;
    cdsWeather.MergeChangeLog;
    if cdsWeather.RecordCount > 0 then
    begin
      cdsWeather.SaveToFile(GetPath + WEATHER_FILENAME);
      LastUpdateInfoStore;
    end
    else
    begin
      // in case there is problem getting new weather, load from file if exists
      GetLastWeather;
    end;
  finally
    Finalize(favs);
  end;
end;

procedure TDMWeather.GetCountries(strs: TStrings);
var localdata_exists: boolean; i: integer;
begin
  localdata_exists := False;

  if FileExists(GetPath + COUNTRY_FILENAME) then
  begin
    cdsCountry.LoadFromFile(GetPath + COUNTRY_FILENAME);
    cdsCountry.Active := True;

    localdata_exists := cdsCountry.RecordCount > 0;
  end;

  if localdata_exists then
  begin
    strs.Clear;
    while not cdsCountry.Eof do
    begin
      strs.Add(cdsCountryCountry.AsString);
      cdsCountry.Next;
    end;
    cdsCountry.Active := False;
  end
  else
  begin
    // no local data, load from web service and update local file
    GetCountriesFromWS(strs);
    cdsCountry.CreateDataSet;
    cdsCountry.Active := True;
    for i := 0 to strs.Count-1 do
    begin
      cdsCountry.Append;
      cdsCountryCountry.AsString := strs[i];
      cdsCountry.Post;
    end;
    cdsCountry.MergeChangeLog;
    cdsCountry.SaveToFile(GetPath + COUNTRY_FILENAME);
    cdsCountry.Active := False;
  end;
end;

procedure TDMWeather.GetCountriesFromWS(strs: TStrings);
var s: string; i: integer; xmldoc: TXMLDocument;
  countries: xmlbinding_countries.IXMLNewDataSetType;
begin
  if strs <> nil then
  begin
    strs.Clear;

    s := GetCountrySOAP.GetCountries;

    xmldoc := TXMLDocument.Create(nil);
    try
      xmldoc.DOMVendor := GetDOMVendor('ADOM XML v4');
      xmldoc.XML.Add(s);
      countries := xmlbinding_countries.GetNewDataSet(xmldoc);
      if countries <> nil then
      for i := 0 to countries.Count-1 do
        strs.Add(countries[i].Name);
    finally
  //    xmldoc.Free;
    end;
  end;
end;

function TDMWeather.GetCountryList: TStringDynArray;
var cs: TStringList;
  i: Integer;
begin
  cs := TStringList.Create;
  try
    GetCountries(cs);
    SetLength(Result,cs.Count);
    for i := 0 to cs.Count-1 do
      Result[i] := cs[i];
  finally
    cs.Free;
  end;
end;

function TDMWeather.GetLastUpdated: TFillableDateTime;
begin
  LastUpdatedInfoLoad;
  Result := FLastUpdated;
end;

function TDMWeather.GetPath: string;
begin
{$IFDEF IOS}
  Result := GetHomePath + PathDelim + 'Documents' + PathDelim;
{$ELSE}
{$IFDEF MACOS}
  Result := '';
{$ENDIF MACOS}
{$ENDIF IOS}
{$IFDEF MSWINDOWS}
  Result := '';
{$ENDIF}
end;

function TDMWeather.GetWeatherXML(city, country: string): string;
begin
  Result := GetGlobalWeatherSoap.GetWeather(city, country);
end;

procedure TDMWeather.LastUpdatedInfoLoad;
begin
  FLastUpdated.IsFilled := False;
  if FileExists(GetPath + STATUS_FILENAME) then
  begin
    cdsStatus.Active := False;
    cdsStatus.LoadFromFile(GetPath + STATUS_FILENAME);
    cdsStatus.Active := True;
    if cdsStatus.RecordCount > 0 then
    begin
      FLastUpdated.IsFilled := True;
      FLastUpdated.Value := cdsStatusLastUpdated.AsDateTime;
    end;
  end;
end;

procedure TDMWeather.LastUpdateInfoStore;
begin
  cdsStatus.Active := False;
  cdsStatus.CreateDataSet;
  cdsStatus.Active := True;
  cdsStatus.Append;
  FLastUpdated.Value := Now;
  FLastUpdated.IsFilled := True;
  cdsStatusLastUpdated.AsDateTime := FLastUpdated.Value;
  cdsStatus.Post;
  cdsStatus.MergeChangeLog;
  cdsStatus.SaveToFile(GetPath + STATUS_FILENAME);
end;

function TDMWeather.GetWeatherInfo(cc: TCityCountry;
  var info: TWeatherInfo): boolean;
var wr: TWeatherRec;
begin
  Result := GetWeatherRec(cc.City, cc.Country, wr);
  if Result then
    info := WeatherRecToInfo(wr);
end;

function TDMWeather.GetWeatherRec(city, country: string; var wr: TWeatherRec): boolean;
var s: string; i: integer; xmldoc: TXMLDocument;
  cw: IXMLCurrentWeatherType;

begin
  s := GetWeatherXML(city, country);
  Result := SameStr(copy(s,1,5), '<?xml');

  if Result then
  begin

    s := StringReplace(s, 'utf-16', 'utf-8', [rfIgnoreCase]);

    xmldoc := TXMLDocument.Create(nil);
    try
      xmldoc.DOMVendor := GetDOMVendor('ADOM XML v4');
      xmldoc.XML.Add(s);
      cw := GetCurrentWeather(xmldoc);
      if cw <> nil then
      begin
        wr.Location := cw.Location;
        wr.Time := cw.Time;
        wr.Wind := cw.Wind;
        wr.Visibility := cw.Visibility;
        wr.SkyConditions := cw.SkyConditions;
        wr.Temperature := cw.Temperature;
        wr.RelativeHumidity := cw.RelativeHumidity;
        wr.Pressure := cw.Pressure;
        wr.Status := cw.Status;
      end;
    finally
  //    xmldoc.Free;
    end;
  end;
end;

end.
