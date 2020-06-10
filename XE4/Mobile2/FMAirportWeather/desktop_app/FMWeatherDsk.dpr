program FMWeatherDsk;

uses
  FMX.Forms,
  FormWeatherDskUnit in 'FormWeatherDskUnit.pas' {FormWeatherDsk},
  proxy_country in '..\shared_code\proxy_country.pas',
  DMWeatherUnit in '..\shared_code\DMWeatherUnit.pas' {DMWeather: TDataModule},
  xmlbinding_countries in '..\shared_code\xmlbinding_countries.pas',
  proxy_globalweather in '..\shared_code\proxy_globalweather.pas',
  xmlbinding_countrycities in '..\shared_code\xmlbinding_countrycities.pas',
  xmlbinding_weather in '..\shared_code\xmlbinding_weather.pas',
  weather_utils in '..\shared_code\weather_utils.pas',
  fillables in '..\shared_code\fillables.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMWeather, DMWeather);
  Application.CreateForm(TFormWeatherDsk, FormWeatherDsk);
  Application.Run;
end.
