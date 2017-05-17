unit FormWeatherMobile1Unit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.TabControl, FMX.StdCtrls,
  System.Actions, FMX.ActnList, FMX.ListView.Types, FMX.ListView, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Fmx.Bind.Navigator,
  FMX.ListBox, FMX.Layouts, FMX.Objects;

type
  TFormWeatherMobile1 = class(TForm)
    TabControlMain: TTabControl;
    TabItemOverview: TTabItem;
    TabItemDetail: TTabItem;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    ActionList1: TActionList;
    ChangeTabActionDetail: TChangeTabAction;
    ChangeTabActionOverview: TChangeTabAction;
    TabItemFavs: TTabItem;
    ChangeTabActionFavs: TChangeTabAction;
    ListViewOverview: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    LabelTitle1: TLabel;
    SpeedButtonInfo: TSpeedButton;
    SpeedButtonDown: TSpeedButton;
    SpeedButtonUp: TSpeedButton;
    LiveBindingsBindNavigatePrior1: TFMXBindNavigatePrior;
    LiveBindingsBindNavigateNext1: TFMXBindNavigateNext;
    ToolBar3: TToolBar;
    SpeedButtonBackToOverview: TSpeedButton;
    ListBoxDetail: TListBox;
    ListBoxHeader1: TListBoxHeader;
    ListBoxItem1: TListBoxItem;
    Label1: TLabel;
    LabelLocation: TLabel;
    LabelTempC: TLabel;
    ListBoxItem2: TListBoxItem;
    LabelPressurehPa: TLabel;
    ListBoxItem3: TListBoxItem;
    LabelHumidity: TLabel;
    ListBoxItem4: TListBoxItem;
    LabelWindDir: TLabel;
    ListBoxItem5: TListBoxItem;
    LabelWindSpeed: TLabel;
    ListBoxItem6: TListBoxItem;
    LabelVisibility: TLabel;
    ListBoxItem7: TListBoxItem;
    LabelSkyConditions: TLabel;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    LinkPropertyToFieldText4: TLinkPropertyToField;
    LinkPropertyToFieldText5: TLinkPropertyToField;
    LinkPropertyToFieldText6: TLinkPropertyToField;
    LinkPropertyToFieldText7: TLinkPropertyToField;
    LinkPropertyToFieldText8: TLinkPropertyToField;
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
    ListBoxItem10: TListBoxItem;
    LabelTime: TLabel;
    LinkPropertyToFieldText9: TLinkPropertyToField;
    TabItemPleaseWait: TTabItem;
    ChangeTabActionPleaseWait: TChangeTabAction;
    PanelPleaseWait: TPanel;
    AniIndicator1: TAniIndicator;
    Label4: TLabel;
    ToolBar5: TToolBar;
    Label5: TLabel;
    procedure ListViewOverviewItemClick(const Sender: TObject;
      const AItem: TListViewItem);
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
  public
    { Public declarations }
  end;

var
  FormWeatherMobile1: TFormWeatherMobile1;

implementation

{$R *.fmx}

uses DMWeatherUnit, weather_utils;

procedure TFormWeatherMobile1.ComboBoxCountryChange(Sender: TObject);
begin
  LoadCities;
end;

procedure TFormWeatherMobile1.FormCreate(Sender: TObject);
begin
  TabControlMain.ActiveTab := TabItemOverview;
  DMWeather.GetLastWeather;
  LinkListControlToField1.FillList;
  RefreshLastUpdated;
end;

procedure TFormWeatherMobile1.ListViewOverviewItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  ChangeTabActionDetail.ExecuteTarget(self);
end;

procedure TFormWeatherMobile1.LoadCities;
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

procedure TFormWeatherMobile1.LoadCountries;
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

procedure TFormWeatherMobile1.RefreshFavorites;
var favs: TCityCountryDynArray; i: integer;
begin
  ListBoxFavs.Clear;
  favs := DMWeather.FavoritesGet;
  if favs <> nil then
  for i := 0 to Length(favs)-1 do
    ListBoxFavs.Items.Add(' ' + favs[i].City + ' (' + favs[i].Country + ')');
end;

procedure TFormWeatherMobile1.RefreshLastUpdated;
begin
  LabelUpdated.Text := 'Updated: ' + DMWeather.LastUpdated.ToString;
end;

procedure TFormWeatherMobile1.SpeedButtonFavAddClick(Sender: TObject);
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

procedure TFormWeatherMobile1.SpeedButtonFavDelClick(Sender: TObject);
begin
  if ListBoxFavs.Selected <> nil then
  begin
    if DMWeather.FavoritesDel(ListBoxFavs.Selected.Index+1) then
      RefreshFavorites;
  end;
end;

procedure TFormWeatherMobile1.SpeedButtonGoToOverviewClick(Sender: TObject);
begin
  UpdateWeatherInfo;
//  ChangeTabActionOverview.ExecuteTarget(self);
end;

procedure TFormWeatherMobile1.SpeedButtonInfoClick(Sender: TObject);
begin
  LoadCountries;
  RefreshFavorites;
  ChangeTabActionFavs.ExecuteTarget(self);
end;

procedure TFormWeatherMobile1.SpeedButtonRefreshClick(Sender: TObject);
begin
  UpdateWeatherInfo;
end;

procedure TFormWeatherMobile1.UpdateWeatherInfo;
begin
  ChangeTabActionPleaseWait.ExecuteTarget(self);
  try
    DMWeather.UpdateWeather;
    LinkListControlToField1.FillList;
    RefreshLastUpdated;
  finally
    ChangeTabActionOverview.ExecuteTarget(self);
  end;
end;

end.
