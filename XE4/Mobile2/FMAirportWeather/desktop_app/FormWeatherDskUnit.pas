unit FormWeatherDskUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs,
  FMX.StdCtrls, FMX.Layouts, FMX.ListBox, FMX.Memo, weather_utils;

type
  TFormWeatherDsk = class(TForm)
    ButtonCountries: TButton;
    Panel1: TPanel;
    ListBoxCountries: TListBox;
    Panel2: TPanel;
    ButtonCities: TButton;
    ListBoxCities: TListBox;
    Panel3: TPanel;
    ButtonGetWeather: TButton;
    Memo1: TMemo;
    Panel4: TPanel;
    Panel5: TPanel;
    ListBoxFavs: TListBox;
    ButtonFavsGet: TButton;
    Label1: TLabel;
    ButtonFavsAdd: TButton;
    ButtonFavsDelete: TButton;
    procedure ButtonCountriesClick(Sender: TObject);
    procedure ButtonCitiesClick(Sender: TObject);
    procedure ButtonGetWeatherClick(Sender: TObject);
    procedure ListBoxCitiesChange(Sender: TObject);
    procedure ListBoxCountriesChange(Sender: TObject);
    procedure ButtonFavsGetClick(Sender: TObject);
    procedure ButtonFavsAddClick(Sender: TObject);
    procedure ButtonFavsDeleteClick(Sender: TObject);
  private
    procedure RefreshFavs;
    procedure Log(s: string);
    procedure ShowWeatherInfo(info: TWeatherInfo);
  public
    { Public declarations }
  end;

var
  FormWeatherDsk: TFormWeatherDsk;

implementation

{$R *.fmx}

uses DMWeatherUnit;

procedure TFormWeatherDsk.ListBoxCitiesChange(Sender: TObject);
begin
//  Memo1.Lines.Clear;
end;

procedure TFormWeatherDsk.ListBoxCountriesChange(Sender: TObject);
begin
//  Memo1.Lines.Clear;
  ListBoxCities.Clear;
end;

procedure TFormWeatherDsk.Log(s: string);
begin
  Memo1.Lines.Add(s);
end;

procedure TFormWeatherDsk.RefreshFavs;
var aFavs: TCityCountryDynArray; i: integer;
begin
  aFavs := DMWeather.FavoritesGet;

  ListBoxFavs.Clear;
  ListBoxFavs.BeginUpdate;
  try
    for i := 0 to Length(aFavs)-1 do
      ListBoxFavs.Items.Add(aFavs[i].City + ' (' + aFavs[i].Country + ')')
  finally
    ListBoxFavs.EndUpdate;
  end;
end;

procedure TFormWeatherDsk.ButtonCitiesClick(Sender: TObject);
var country: string; cities: TStringDynArray; i: integer;
begin
  if ListBoxCountries.Selected <> nil then
  begin
    ListBoxCities.Clear;
    country := ListBoxCountries.Selected.Text;
    ListBoxCities.BeginUpdate;
    try
      cities := DMWeather.GetCityList(country);
      for i := 0 to Length(cities)-1 do
        ListBoxCities.Items.Add(cities[i]);
      Finalize(cities);
    finally
      ListBoxCities.EndUpdate;
    end;
    ListBoxCities.Repaint;
  end;
end;

procedure TFormWeatherDsk.ButtonCountriesClick(Sender: TObject);
var clist: TStringDynArray; i: integer;
begin
  clist:= DMWeather.GetCountryList;
  ListBoxCountries.Clear;
  ListBoxCountries.BeginUpdate;
  try
    for i := 0 to Length(cList)-1 do
      ListBoxCountries.Items.Add(cList[i]);
    Finalize(clist);
  finally
    ListBoxCountries.EndUpdate;
  end;
end;

procedure TFormWeatherDsk.ButtonFavsAddClick(Sender: TObject);
var cc: TCityCountry;
begin
  if (ListBoxCountries.Selected <> nil) and (ListBoxCities.Selected <> nil) then
  begin
    cc.City := ListBoxCities.Selected.Text;
    cc.Country := ListBoxCountries.Selected.Text;
    if DMWeather.FavoritesAdd(cc) then
      RefreshFavs;
  end;
end;

procedure TFormWeatherDsk.ButtonFavsDeleteClick(Sender: TObject);
var cc: TCityCountry; i: integer;
begin
  if ListBoxFavs.Selected <> nil then
  begin
    i := ListBoxFavs.Selected.Index;
//    cc.City := DMWeather.Favorites[i].City;
//    cc.Country := DMWeather.Favorites[i].Country;
    if DMWeather.FavoritesDel(i) then
      RefreshFavs;
  end;
end;

procedure TFormWeatherDsk.ButtonFavsGetClick(Sender: TObject);
begin
  RefreshFavs;
end;

procedure TFormWeatherDsk.ShowWeatherInfo(info: TWeatherInfo);
begin
  Log('Location: ' + info.LocName);
  Log('Code: ' + info.LocCode);
  Log('Latitude: ' + info.LocLatitude.ToString);
  Log('Longitude: ' + info.LocLongitude.ToString);
  Log('Altitude: ' + info.LocAltitude.ToString);
  Log('Time: ' + info.Time);
  Log('DateTimeUTC: ' + info.DateTimeUTC.ToString);
  Log('Wind: ' + info.Wind);
  Log('Wind Dir: ' + info.WindDir.ToString);
  Log('Wind Speed: ' + info.WindSpeed.ToString);
  Log('Visibility: ' + info.Visibility);
  Log('SkyConditions: ' + info.SkyConditions);
  Log('TempF: ' + info.TempF.ToString);
  Log('TempC: ' + info.TempC.ToString);
  Log('Dew Point: ' + info.DewPoint);
  Log('Relative Humidity: ' + info.RelativeHumidity.ToString);
  Log('Pressure Hg: ' + info.PressureHg.ToString);
  Log('Pressure hPa: ' + info.PressurehPa.ToString);
  Log('Status: ' + info.Status);
  Log('==================================');
end;

procedure TFormWeatherDsk.ButtonGetWeatherClick(Sender: TObject);
var i: integer; city, country: string; w: TWeatherRec; info: TWeatherInfo;
  aFavs: TCityCountryDynArray;
begin
  DMWeather.UpdateWeather;

  Memo1.Lines.Clear;
  Log('==================================');
  Log('Last updated: ' + DateTimeToStr(Now));
  Log('==================================');

  aFavs := DMWeather.FavoritesGet;
  try
    for i := 0 to Length(aFavs)-1 do
    begin
      if DMWeather.GetWeatherInfo(aFavs[i],info) then
        ShowWeatherInfo(info)
      else
      begin
        Log('Data not found for "' + aFavs[i].city + '"');
        Log('==================================');
      end;
    end;
  finally
    Finalize(aFavs);
  end;

//  ShowMessage(IntToStr(DMWeather.cdsWeather.RecordCount));

end;

end.
