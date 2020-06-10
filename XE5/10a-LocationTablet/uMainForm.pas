unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Sensors, FMX.StdCtrls,
  System.Sensors, FMX.WebBrowser, FMX.Layouts, FMX.Memo, FMX.ListBox;

type
  TLocationDemoForm = class(TForm)
    LocationSensor1: TLocationSensor;
    WebBrowser1: TWebBrowser;
    ListBox1: TListBox;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxItemLatitude: TListBoxItem;
    ListBoxItemLongitude: TListBoxItem;
    ListBoxGroupHeader2: TListBoxGroupHeader;
    ListBoxItemAdminArea: TListBoxItem;
    ListBoxItemCountryCode: TListBoxItem;
    ListBoxItemCountryName: TListBoxItem;
    ListBoxItemFeatureName: TListBoxItem;
    ListBoxItemLocality: TListBoxItem;
    ListBoxItemPostalCode: TListBoxItem;
    ListBoxItemSubAdminArea: TListBoxItem;
    ListBoxItemSubLocality: TListBoxItem;
    ListBoxItemSubThoroughfare: TListBoxItem;
    ListBoxItemThoroughfare: TListBoxItem;
    ListBoxHeader1: TListBoxHeader;
    Layout1: TLayout;
    Switch1: TSwitch;
    Label1: TLabel;
    procedure LocationSensor1LocationChanged(Sender: TObject; const OldLocation,
      NewLocation: TLocationCoord2D);
    procedure Switch1Switch(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FGeocoder: TGeocoder;
    procedure OnGeocodeReverseEvent(const Address: TCivicAddress);
  public
    { Public declarations }
  end;

var
  LocationDemoForm: TLocationDemoForm;

implementation

{$R *.fmx}

procedure TLocationDemoForm.Switch1Switch(Sender: TObject);
begin
  LocationSensor1.Active := Switch1.IsChecked;
end;

procedure TLocationDemoForm.FormCreate(Sender: TObject);
begin
  System.SysUtils.FormatSettings.DecimalSeparator := '.';
end;

procedure TLocationDemoForm.LocationSensor1LocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
var
  URLString: String;
begin
  // Show current location
  ListBoxItemLatitude.ItemData.Detail  := NewLocation.Latitude.ToString;
  ListBoxItemLongitude.ItemData.Detail := NewLocation.Longitude.ToString;

  // Show Map using Google Maps &output=embed'
  URLString := Format(
    'https://maps.google.com/maps?q=%s,%s&output=embed&t=k&z=17',
      [NewLocation.Latitude.ToString, NewLocation.Longitude.ToString]);
  WebBrowser1.Navigate(URLString);

  // Setup an instance of TGeocoder
  if not Assigned(FGeocoder) then
  begin
    if Assigned(TGeocoder.Current) then
      FGeocoder := TGeocoder.Current.Create;
    if Assigned(FGeocoder) then
      FGeocoder.OnGeocodeReverse := OnGeocodeReverseEvent;
  end;

  // Translate location to address
  if Assigned(FGeocoder) and not FGeocoder.Geocoding then
    FGeocoder.GeocodeReverse(NewLocation);
end;

procedure TLocationDemoForm.OnGeocodeReverseEvent(const Address: TCivicAddress);
begin
  ListBoxItemAdminArea.ItemData.Detail       := Address.AdminArea;
  ListBoxItemCountryCode.ItemData.Detail     := Address.CountryCode;
  ListBoxItemCountryName.ItemData.Detail     := Address.CountryName;
  ListBoxItemFeatureName.ItemData.Detail     := Address.FeatureName;
  ListBoxItemLocality.ItemData.Detail        := Address.Locality;
  ListBoxItemPostalCode.ItemData.Detail      := Address.PostalCode;
  ListBoxItemSubAdminArea.ItemData.Detail    := Address.SubAdminArea;
  ListBoxItemSubLocality.ItemData.Detail     := Address.SubLocality;
  ListBoxItemSubThoroughfare.ItemData.Detail := Address.SubThoroughfare;
  ListBoxItemThoroughfare.ItemData.Detail    := Address.Thoroughfare;
end;

end.
