unit weather_utils;

interface

uses
  fillables, Data.DB;

type
  TCityCountry = record
    City: string;
    Country: string;
  end;

  TCityCountryDynArray = array of TCityCountry;

  TWeatherRec = record
    Location: string;
    Time: string;
    Wind: string;
    Visibility: string;
    SkyConditions: string;
    Temperature: string;
    DewPoint: string;
    RelativeHumidity: string;
    Pressure: string;
    Status: string;
  end;

  TWeatherInfo = record
    LocName: string;
    LocCode: string;
    LocLatitude: TFillableSingle;
    LocLongitude: TFillableSingle;
    LocAltitude: TFillableSingle;
    Time: string;
    DateTimeUTC: TFillableDateTime;
    Wind: string;
    WindDir: TFillableSingle;
    WindSpeed: TFillableSingle;
    Visibility: string;
    SkyConditions: string;
    TempF: TFillableSingle;
    TempC: TFillableSingle;
    DewPoint: string;
    RelativeHumidity: TFillableSingle;
    PressureHg: TFillableSingle;
    PressurehPa: TFillableSingle;
    Status: string;
  end;

function WeatherRecToInfo(wr: TWeatherRec): TWeatherInfo;
procedure SetSingleField(f: TSingleField; v: TFillableSingle);
procedure SetDateTimeField(f: TDateTimeField; v: TFillableDateTime);

implementation

uses
  System.Types, System.SysUtils, StrUtils, DateUtils;

procedure SetSingleField(f: TSingleField; v: TFillableSingle);
begin
  if f <> nil then
  begin
    if v.IsFilled then
      f.AsFloat := v.Value
    else
      f.Clear;
  end;
end;

procedure SetDateTimeField(f: TDateTimeField; v: TFillableDateTime);
begin
  if f <> nil then
  begin
    if v.IsFilled then
      f.AsDateTime := v.Value
    else
      f.Clear;
  end;
end;

function ConvGeoPos(s: string; NegChar: string): TFillableSingle;
var p: integer;
begin
  Result.IsFilled := s <> '';
  if Result.IsFilled then
  begin
    p := Pos('-',s);
    Result.Value := StrToInt(copy(s,1,p-1));
    s := copy(s,p+1,Length(s));
    Result.Value := Result.Value + StrToInt(copy(s,1,Length(s)-1)) / 100;
    if copy(s,Length(s)-1,1) = NegChar then
      Result.Value := -Result.Value;
  end;
end;

function ConvDateTimeUTC(s: string): TFillableDateTime;
var y,m,d,h,min: word;
begin
  //2013.07.12 1630 UTC
  Result.IsFilled := s <> '';
  if Result.IsFilled then
  begin
    y := StrToInt(copy(s,1,4));
    m := StrToInt(copy(s,6,2));
    d := StrToInt(copy(s,9,2));
    h := StrToInt(copy(s,12,2));
    min := StrToInt(copy(s,14,2));
    Result.Value := EncodeDateTime(y,m,d,h,min,0,0);
  end;
end;

function SaveStrToFloat(s: string): single;
begin
  try
    Result := StrToFloat(s);
  except
    on EConvertError do
    begin
      s := StringReplace(s,'.',',',[]);
      Result := StrToFloat(s);
    end;
  end;
end;

function WeatherRecToInfo(wr: TWeatherRec): TWeatherInfo;
var s,s1: string; pos1: integer;
begin
  s := wr.Location;
  pos1 := Pos('(',s);
  Result.LocName := trim(copy(s,1,pos1-1));
  s := copy(s, pos1+1, Length(s));
  pos1 := Pos(')',s);
  Result.LocCode := copy(s,1,pos1-1);

  s := trim(copy(s,pos1+1,Length(s)));
  Pos1 := Pos(' ',s);
  Result.LocLatitude := ConvGeoPos(copy(s,1,Pos1-1),'S');

  s := trim(copy(s,pos1+1,Length(s)));
  Pos1 := Pos(' ',s);
  Result.LocLongitude := ConvGeoPos(copy(s,1,Pos1-1),'W');

  s := trim(copy(s,pos1+1,Length(s)));
  if Length(s) > 0 then
  begin
    Result.LocAltitude.IsFilled := True;
    Result.LocAltitude.Value := StrToFloat(copy(s,1,Length(s)-1));
  end
  else
    Result.LocAltitude.IsFilled := False;

  Result.Time := wr.Time;

  s := wr.Time;
  if s <> '' then
  begin
    Pos1 := Pos('/',s);
    if Pos1 > 0 then
    begin
      s := trim(copy(s,pos1+1,Length(s)));
      Result.DateTimeUTC := ConvDateTimeUTC(s);
    end
    else
      Result.DateTimeUTC.IsFilled := False;
  end
  else
    Result.DateTimeUTC.IsFilled := False;


  Result.Wind := wr.Wind;

  if wr.Wind <> '' then
  begin
    s := wr.Wind;

    if Pos('degrees',s) > 0 then
    begin
      pos1 := Pos('(',s);
      if pos1 > 0 then
      begin
        s := copy(s,pos1+1,Length(s));
        pos1 := Pos(' ',s);
        Result.WindDir.Value := StrToFloat(copy(s,1,Pos1-1));
        Result.WindDir.IsFilled := true;
      end
      else
        Result.WindDir.IsFilled := false;
    end
    else
      Result.WindDir.IsFilled := false;

    pos1 := Pos('at',s);
    if pos1 > 0 then
    begin
      s := trim(copy(s,pos1+3,Length(s)));
      pos1 := Pos(' ',s);
      Result.WindSpeed.Value := StrToFloat(copy(s,1,Pos1-1));
      Result.WindSpeed.IsFilled := True;
    end
    else
      Result.WindSpeed.IsFilled := False;

  end
  else
  begin
    Result.WindDir.IsFilled := false;
    Result.WindSpeed.IsFilled := false;
  end;

  Result.Visibility := wr.Visibility;
  Result.SkyConditions := wr.SkyConditions;

  s := trim(wr.Temperature);
  if s <> '' then
  begin
    Pos1 := Pos('F',s);
    if Pos1 > 0 then
    begin
      Result.TempF.Value := StrToFloat(copy(s,1,Pos1-1));
      Result.TempF.IsFilled := True;
    end
    else
      Result.TempF.IsFilled := False;

    Pos1 := Pos('(',s);
    if Pos1 > 0 then
    begin
      s := trim(copy(s,pos1+1,Length(s)));
      Pos1 := Pos(' ',s);
      s := copy(s,1,Pos1-1);
//      s := StringReplace(s,'.',',',[]);
//      Result.TempC.Value := StrToFloat(s);
      Result.TempC.Value := SaveStrToFloat(s);
      Result.TempC.IsFilled := True;
    end
    else
      Result.TempC.IsFilled := False;

  end
  else
  begin
    Result.TempF.IsFilled := False;
    Result.TempC.IsFilled := False;
  end;

  Result.DewPoint := wr.DewPoint;

  s := trim(wr.RelativeHumidity);
  if s <> '' then
  begin
    Pos1 := Pos('%',s);
    if Pos1 > 0 then
    begin
      s := copy(s,1,Pos1-1);
//      s := StringReplace(s,'.',',',[]);
//      Result.RelativeHumidity.Value := StrToFloat(s);
      Result.RelativeHumidity.Value := SaveStrToFloat(s);
      Result.RelativeHumidity.IsFilled := True;
    end
    else
      Result.RelativeHumidity.IsFilled := False;
  end
  else
    Result.RelativeHumidity.IsFilled := False;

  s := trim(wr.Pressure);
  if s <> '' then
  begin
    Pos1 := Pos(' ',s);
    if Pos1 > 0 then
    begin
      s1 := copy(s,1,Pos1-1);
//      s1 := StringReplace(s1,'.',',',[]);
//      Result.PressureHg.Value := StrToFloat(s1);
      Result.PressureHg.Value := SaveStrToFloat(s1);

      Result.PressureHg.IsFilled := True;
    end
    else
      Result.PressureHg.IsFilled := False;

    Pos1 := Pos('(',s);
    if Pos1 > 0 then
    begin
      s := trim(copy(s,pos1+1,Length(s)));
      Pos1 := Pos(' ',s);
      s := copy(s,1,Pos1-1);
//      s := StringReplace(s,'.',',',[]);
//      Result.PressurehPa.Value := StrToFloat(s);
      Result.PressurehPa.Value := SaveStrToFloat(s);

      Result.PressurehPa.IsFilled := True;

    end
    else
      Result.PressurehPa.IsFilled := False;

  end
  else
  begin
    Result.PressureHg.IsFilled := False;
    Result.PressurehPa.IsFilled := False;
  end;

  Result.Status := wr.Status
end;

end.
