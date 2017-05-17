program FMWeather1;

uses
  System.StartUpCopy,
  FMX.Forms,
  FormWeatherMobile1Unit in 'FormWeatherMobile1Unit.pas' {FormWeatherMobile1},
  DMWeatherUnit in '..\shared_code\DMWeatherUnit.pas' {DMWeather: TDataModule},
  fillables in '..\shared_code\fillables.pas',
  proxy_country in '..\shared_code\proxy_country.pas',
  proxy_globalweather in '..\shared_code\proxy_globalweather.pas',
  weather_utils in '..\shared_code\weather_utils.pas',
  xmlbinding_countries in '..\shared_code\xmlbinding_countries.pas',
  xmlbinding_countrycities in '..\shared_code\xmlbinding_countrycities.pas',
  xmlbinding_weather in '..\shared_code\xmlbinding_weather.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMWeather, DMWeather);
  Application.CreateForm(TFormWeatherMobile1, FormWeatherMobile1);
  Application.Run;
end.
