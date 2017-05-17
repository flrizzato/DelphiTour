unit FormWeatherMobile3Unit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.TabControl, FMX.StdCtrls,
  System.Actions, FMX.ActnList, FMX.ListView.Types, FMX.ListView, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Fmx.Bind.Navigator,
  FMX.ListBox, FMX.Layouts, FMX.Objects;

type
  TFormWeatherMobile3 = class(TForm)
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
    Label4: TLabel;
    ToolBar5: TToolBar;
    Label5: TLabel;
    ListBoxOverview: TListBox;
    AniIndicator2: TAniIndicator;
    StyleBook1: TStyleBook;
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
  FormWeatherMobile3: TFormWeatherMobile3;

implementation

{$R *.fmx}

uses DMWeatherUnit, weather_utils;

procedure TFormWeatherMobile3.ComboBoxCountryChange(Sender: TObject);
begin
  LoadCities;
end;

procedure TFormWeatherMobile3.FormCreate(Sender: TObject);
begin
  TabControlMain.ActiveTab := TabItemOverview;
  DMWeather.GetLastWeather;
  RefreshOverview;
  RefreshLastUpdated;
end;

procedure TFormWeatherMobile3.LoadCities;
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

procedure TFormWeatherMobile3.LoadCountries;
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

procedure TFormWeatherMobile3.RefreshFavorites;
var favs: TCityCountryDynArray; i: integer;
begin
  ListBoxFavs.Clear;
  favs := DMWeather.FavoritesGet;
  if favs <> nil then
  for i := 0 to Length(favs)-1 do
    ListBoxFavs.Items.Add(' ' + favs[i].City + ' (' + favs[i].Country + ')');
end;

procedure TFormWeatherMobile3.RefreshLastUpdated;
begin
  LabelUpdated.Text := 'Updated: ' + DMWeather.LastUpdated.ToString;
end;

procedure TFormWeatherMobile3.RefreshOverview;
var location, aTime, tempC, pressurehPa, humidity, windDir, windSpeed, visibility, skyConditions : string;
  listItem: TListBoxItem; txt: TText;
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

      listItem.StyleLookup := 'weatheritem';

      txt := listItem.FindStyleResource('txtlocation') as TText;
      if Assigned(txt) then
        txt.Text := location;

      txt := listItem.FindStyleResource('txttime') as TText;
      if Assigned(txt) then
        txt.Text := 'time: ' + aTime;

      txt := listItem.FindStyleResource('txttempc') as TText;
      if Assigned(txt) then
        txt.Text := 'temp: ' + tempC + '°C';

      txt := listItem.FindStyleResource('txthumidity') as TText;
      if Assigned(txt) then
        txt.Text := 'humidity: ' + humidity + '%';

      txt := listItem.FindStyleResource('txtpressurehpa') as TText;
      if Assigned(txt) then
        txt.Text := 'pressure: ' + pressurehPa + 'hPa';

      txt := listItem.FindStyleResource('txtwindspeed') as TText;
      if Assigned(txt) then
        txt.Text := 'wind speed: ' + windSpeed + ' MPH';

      txt := listItem.FindStyleResource('txtvisibility') as TText;
      if Assigned(txt) then
        txt.Text := 'visibility: ' + visibility;

      txt := listItem.FindStyleResource('txtskyconditions') as TText;
      if Assigned(txt) then
        txt.Text := 'sky conditions: ' + skyConditions;

      txt := listItem.FindStyleResource('txtwinddirval') as TText;
      if Assigned(txt) then
        txt.Text := windDir + '°';

      DMWeather.cdsWeather.Next;
    end;
  end;
end;

procedure TFormWeatherMobile3.SpeedButtonFavAddClick(Sender: TObject);
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

procedure TFormWeatherMobile3.SpeedButtonFavDelClick(Sender: TObject);
begin
  if ListBoxFavs.Selected <> nil then
  begin
    if DMWeather.FavoritesDel(ListBoxFavs.Selected.Index+1) then
      RefreshFavorites;
  end;
end;

procedure TFormWeatherMobile3.SpeedButtonGoToOverviewClick(Sender: TObject);
begin
  UpdateWeatherInfo;
end;

procedure TFormWeatherMobile3.SpeedButtonInfoClick(Sender: TObject);
begin
  LoadCountries;
  RefreshFavorites;
  ChangeTabActionFavs.ExecuteTarget(self);
end;

procedure TFormWeatherMobile3.SpeedButtonRefreshClick(Sender: TObject);
begin
  UpdateWeatherInfo;

end;

procedure TFormWeatherMobile3.UpdateWeatherInfo;
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
