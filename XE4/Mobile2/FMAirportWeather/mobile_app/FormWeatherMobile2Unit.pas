unit FormWeatherMobile2Unit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.TabControl, FMX.StdCtrls,
  System.Actions, FMX.ActnList, FMX.ListView.Types, FMX.ListView, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Fmx.Bind.Navigator,
  FMX.ListBox, FMX.Layouts, FMX.Objects;

type
  TFormWeatherMobile2 = class(TForm)
    TabControlMain: TTabControl;
    TabItemOverview: TTabItem;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    ActionList1: TActionList;
    ChangeTabActionOverview: TChangeTabAction;
    TabItemFavs: TTabItem;
    ChangeTabActionFavs: TChangeTabAction;
    LabelTitle1: TLabel;
    SpeedButtonInfo: TSpeedButton;
    LiveBindingsBindNavigatePrior1: TFMXBindNavigatePrior;
    LiveBindingsBindNavigateNext1: TFMXBindNavigateNext;
    ToolBar4: TToolBar;
    SpeedButtonGoToOverview: TSpeedButton;
    Label2: TLabel;
    ComboBoxCountry: TComboBox;
    Panel1: TPanel;
    ListBoxSel: TListBox;
    ListBoxItem8: TListBoxItem;
    ListBoxItem9: TListBoxItem;
    ComboBoxCity: TComboBox;
    SpeedButtonFavAdd: TSpeedButton;
    SpeedButtonFavDel: TSpeedButton;
    ListBoxFavs: TListBox;
    ListBoxHeader2: TListBoxHeader;
    Label3: TLabel;
    LabelUpdated: TLabel;
    SpeedButtonRefresh: TSpeedButton;
    TabItemPleaseWait: TTabItem;
    ChangeTabActionPleaseWait: TChangeTabAction;
    PanelPleaseWait: TPanel;
    AniIndicator1: TAniIndicator;
    Label4: TLabel;
    ToolBar5: TToolBar;
    Label5: TLabel;
    ListBoxOverview: TListBox;
    procedure ComboBoxCountryChange(Sender: TObject);
    procedure SpeedButtonInfoClick(Sender: TObject);
    procedure SpeedButtonFavDelClick(Sender: TObject);
    procedure SpeedButtonFavAddClick(Sender: TObject);
    procedure SpeedButtonGoToOverviewClick(Sender: TObject);
    procedure SpeedButtonRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure LoadCountries;
    procedure LoadCities;
    procedure RefreshFavorites;
    procedure UpdateWeatherInfo;
    procedure RefreshLastUpdated;
    procedure RefreshOverview;
  public
    { Public declarations }
  end;

var
  FormWeatherMobile2: TFormWeatherMobile2;

implementation

{$R *.fmx}

uses DMWeatherUnit, weather_utils;

procedure TFormWeatherMobile2.ComboBoxCountryChange(Sender: TObject);
begin
  LoadCities;
end;

procedure TFormWeatherMobile2.FormCreate(Sender: TObject);
begin
  TabControlMain.ActiveTab := TabItemOverview;
  DMWeather.GetLastWeather;
  RefreshOverview;
  RefreshLastUpdated;
end;

procedure TFormWeatherMobile2.LoadCities;
var country: string; cities: TStringDynArray; i: integer;
begin
  ComboBoxCity.Clear;
  if ComboBoxCountry.Selected <> nil then
  begin
    country := ComboBoxCountry.Selected.Text;
    cities := DMWeather.GetCityList(country);
    if cities <> nil then
    begin
      for i := 0 to Length(cities)-1 do
        ComboBoxCity.Items.Add(cities[i]);
      Finalize(cities);

      if ComboBoxCity.Items.Count > 0 then
        ComboBoxCity.ItemIndex := 0;
    end;
  end;
end;

procedure TFormWeatherMobile2.LoadCountries;
var countries: TStringDynArray; i: integer;
begin
  ComboBoxCountry.Clear;
  countries := DMWeather.GetCountryList;
  if countries <> nil then
  begin
    for i := 0 to Length(countries)-1 do
      ComboBoxCountry.Items.Add(countries[i]);
    Finalize(countries);

    if ComboBoxCountry.Items.Count > 0 then
      ComboBoxCountry.ItemIndex := 0;
    LoadCities;
  end;
end;

procedure TFormWeatherMobile2.RefreshFavorites;
var favs: TCityCountryDynArray; i: integer;
begin
  ListBoxFavs.Clear;
  favs := DMWeather.FavoritesGet;
  if favs <> nil then
  for i := 0 to Length(favs)-1 do
    ListBoxFavs.Items.Add(' ' + favs[i].City + ' (' + favs[i].Country + ')');
end;

procedure TFormWeatherMobile2.RefreshLastUpdated;
begin
  LabelUpdated.Text := 'Updated: ' + DMWeather.LastUpdated.ToString;
end;

procedure TFormWeatherMobile2.RefreshOverview;
var location, aTime, tempC, pressurehPa, humidity, windDir, windSpeed, visibility, skyConditions : string;
  listItem: TListBoxItem; textLocation, textTime, textTempC, textPressure, textHumidity, textWindDirVal, textWindDirLab, textWindSpeed, textVisibility, textSkyConditions: TText;
begin
  ListBoxOverview.Clear;
  if DMWeather.cdsWeather.Active then
  begin
    DMWeather.cdsWeather.First;
    while not DMWeather.cdsWeather.Eof do
    begin
      location := DMWeather.cdsWeatherLocName.AsString;
      aTime := DMWeather.cdsWeatherTime.AsString;
      tempC := DMWeather.cdsWeatherTempC.AsString;
      pressurehPa := DMWeather.cdsWeatherPressurehPa.AsString;
      humidity := DMWeather.cdsWeatherRelativeHumidity.AsString;
      windDir := DMWeather.cdsWeatherWindDir.AsString;
      windSpeed := DMWeather.cdsWeatherWindSpeed.AsString;
      visibility := DMWeather.cdsWeatherVisibility.AsString;
      skyConditions := DMWeather.cdsWeatherSkyConditions.AsString;

      listItem := TListBoxItem.Create(ListBoxOverview);
      listItem.Parent := ListBoxOverview;
      listItem.Height := 75;

      textLocation := TText.Create(ListBoxOverview);
      textLocation.Parent := listItem;
      textLocation.Position.X := 4;
      textLocation.Position.Y := 2;
      textLocation.Width := 180;
      textLocation.Text := location;
      textLocation.Font.Size := 16;
      textLocation.HorzTextAlign := TTextAlign.taLeading;
      textLocation.VertTextAlign := TTextAlign.taLeading;

      textTime := TText.Create(ListBoxOverview);
      textTime.Parent := listItem;
      textTime.Position.X := 190;
      textTime.Position.Y := 6;
      textTime.Width := 190;
      textTime.Text := 'time: ' + aTime;
      textTime.Font.Size := 10;
      textTime.HorzTextAlign := TTextAlign.taLeading;
      textTime.VertTextAlign := TTextAlign.taLeading;


      textTempC := TText.Create(ListBoxOverview);
      textTempC.Parent := listItem;
      textTempC.Position.X := 4;
      textTempC.Position.Y := 25;
      textTempC.Width := 90;
      textTempC.Text := 'temp: ' + tempC + '°C';
      textTempC.Font.Size := 10;
      textTempC.HorzTextAlign := TTextAlign.taLeading;
      textTempC.VertTextAlign := TTextAlign.taLeading;

      textHumidity := TText.Create(ListBoxOverview);
      textHumidity.Parent := listItem;
      textHumidity.Position.X := 4;
      textHumidity.Position.Y := 40;
      textHumidity.Width := 100;
      textHumidity.Text := 'humidity: ' + humidity + '%';
      textHumidity.Font.Size := 10;
      textHumidity.HorzTextAlign := TTextAlign.taLeading;
      textHumidity.VertTextAlign := TTextAlign.taLeading;

      textPressure := TText.Create(ListBoxOverview);
      textPressure.Parent := listItem;
      textPressure.Position.X := 4;
      textPressure.Position.Y := 55;
      textPressure.Width := 110;
      textPressure.Text := 'pressure: ' + pressurehPa + 'hPa';
      textPressure.Font.Size := 10;
      textPressure.HorzTextAlign := TTextAlign.taLeading;
      textPressure.VertTextAlign := TTextAlign.taLeading;

      textWindSpeed := TText.Create(ListBoxOverview);
      textWindSpeed.Parent := listItem;
      textWindSpeed.Position.X := 110;
      textWindSpeed.Position.Y := 55;
      textWindSpeed.Width := 150;
      textWindSpeed.Text := 'wind speed: ' + windSpeed + ' MPH';
      textWindSpeed.Font.Size := 10;
      textWindSpeed.HorzTextAlign := TTextAlign.taLeading;
      textWindSpeed.VertTextAlign := TTextAlign.taLeading;

      textVisibility := TText.Create(ListBoxOverview);
      textVisibility.Parent := listItem;
      textVisibility.Position.X := 110;
      textVisibility.Position.Y := 25;
      textVisibility.Width := 190;
      textVisibility.Text := 'visibility: ' + visibility;
      textVisibility.Font.Size := 10;
      textVisibility.HorzTextAlign := TTextAlign.taLeading;
      textVisibility.VertTextAlign := TTextAlign.taLeading;

      textSkyConditions := TText.Create(ListBoxOverview);
      textSkyConditions.Parent := listItem;
      textSkyConditions.Position.X := 110;
      textSkyConditions.Position.Y := 40;
      textSkyConditions.Width := 190;
      textSkyConditions.Text := 'sky conditions: ' + skyConditions;
      textSkyConditions.Font.Size := 10;
      textSkyConditions.HorzTextAlign := TTextAlign.taLeading;
      textSkyConditions.VertTextAlign := TTextAlign.taLeading;

      textWindDirLab := TText.Create(ListBoxOverview);
      textWindDirLab.Parent := listItem;
      textWindDirLab.Position.X := 270;
      textWindDirLab.Position.Y := 25;
      textWindDirLab.Width := 150;
      textWindDirLab.Text := 'wind dir:';
      textWindDirLab.Font.Size := 10;
      textWindDirLab.HorzTextAlign := TTextAlign.taLeading;
      textWindDirLab.VertTextAlign := TTextAlign.taLeading;

      textWindDirVal := TText.Create(ListBoxOverview);
      textWindDirVal.Parent := listItem;
      textWindDirVal.Position.X := 270;
      textWindDirVal.Position.Y := 45;
      textWindDirVal.Width := 150;
      textWindDirVal.Text := windDir + '°';
      textWindDirVal.Font.Size := 14;
      textWindDirVal.HorzTextAlign := TTextAlign.taLeading;
      textWindDirVal.VertTextAlign := TTextAlign.taLeading;


      DMWeather.cdsWeather.Next;
    end;
  end;
end;

procedure TFormWeatherMobile2.SpeedButtonFavAddClick(Sender: TObject);
var cc: TCityCountry;
begin
  if (ComboBoxCountry.Selected <> nil) and (ComboBoxCity.Selected <> nil) then
  begin
    cc.Country := ComboBoxCountry.Selected.Text;
    cc.City := ComboBoxCity.Selected.Text;
    if DMWeather.FavoritesAdd(cc) then
      RefreshFavorites;
  end;
end;

procedure TFormWeatherMobile2.SpeedButtonFavDelClick(Sender: TObject);
begin
  if ListBoxFavs.Selected <> nil then
  begin
    if DMWeather.FavoritesDel(ListBoxFavs.Selected.Index+1) then
      RefreshFavorites;
  end;
end;

procedure TFormWeatherMobile2.SpeedButtonGoToOverviewClick(Sender: TObject);
begin
  UpdateWeatherInfo;
end;

procedure TFormWeatherMobile2.SpeedButtonInfoClick(Sender: TObject);
begin
  LoadCountries;
  RefreshFavorites;
  ChangeTabActionFavs.ExecuteTarget(self);
end;

procedure TFormWeatherMobile2.SpeedButtonRefreshClick(Sender: TObject);
begin
  UpdateWeatherInfo;

end;

procedure TFormWeatherMobile2.UpdateWeatherInfo;
begin
  ChangeTabActionPleaseWait.ExecuteTarget(self);
  try
    DMWeather.UpdateWeather;
    RefreshOverview;
    RefreshLastUpdated;
  finally
    ChangeTabActionOverview.ExecuteTarget(self);
  end;
end;

end.
