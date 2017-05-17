unit uRecentLocations;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.ListView.Types,
  FMX.ListView, FMX.StdCtrls, System.Sensors, System.Sensors.Components;

type
  TfrmRecentLocations = class(TForm)
    lvLocations: TListView;
    imLocation: TImageControl;
    lsLocation: TLocationSensor;
    procedure FormCreate(Sender: TObject);
    procedure lsLocationLocationChanged(Sender: TObject; const OldLocation,
      NewLocation: TLocationCoord2D);
    procedure FormShow(Sender: TObject);
    procedure lvLocationsChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure fillListView;
    procedure selectItem;
  end;

var
  frmRecentLocations: TfrmRecentLocations=nil;

procedure ShowRecentLocations;

implementation

{$R *.fmx}

uses main;

procedure ShowRecentLocations;
begin
  if (not assigned(frmRecentLocations)) then begin
    frmRecentLocations:=TfrmRecentLocations.Create(application);
  end;
  frmRecentLocations.Show;
end;

procedure TfrmRecentLocations.fillListView;
var
  li: TListViewItem;
  procedure AddNewLocation(const location: string);
  begin
    li:=lvLocations.Items.Add;
    li.Text:=location;

  end;
begin
  li:=lvLocations.Items.Add;
  li.Bitmap.Assign(imLocation.Bitmap);
  li.Tag:=1;
  li.Text:='CERCA DE DONDE ESTOY';

  li:=lvLocations.Items.Add;
  li.Tag:=2;
  li.Text:='Seleccionar una provincia';

  AddNewLocation('Alicante, Elche/elx, Kelme / Universidad');
  AddNewLocation('Alicante, Elche/elx, El Altet');
  AddNewLocation('Alicante, Elche/elx, Matola');
  AddNewLocation('Alicante, Elche/elx, Centro');
  AddNewLocation('Alicante/Alacant');
  AddNewLocation('Alicante, Elche/elx, Alzabares');
  AddNewLocation('Alicante, Elche/elx, Estado Martínez Valero');
  AddNewLocation('El Altet / Arenales del sol');
  AddNewLocation('Santa Pola / Gran Alacant');



end;

procedure TfrmRecentLocations.FormCreate(Sender: TObject);
begin
  fillListView;
end;

procedure TfrmRecentLocations.FormShow(Sender: TObject);
begin
  lsLocation.Active:=false;
  lvLocations.itemindex:=-1;
end;

procedure TfrmRecentLocations.lsLocationLocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
begin
  showmessage(floattostr(newlocation.Latitude)+' '+floattostr(newlocation.Longitude));
end;

procedure TfrmRecentLocations.lvLocationsChange(Sender: TObject);
begin
  selectItem;
end;

procedure TfrmRecentLocations.selectItem;
var
  li: TListViewItem;
begin
  li:=lvLocations.Selected;
  if (assigned(li)) then begin

    case li.Tag of
      0: begin
        mainform.edLocation.Text:=li.Text;
        close;
        end;
      1: begin
         lsLocation.Active:=true;
        //location
      end;
      2: begin
        //provinces
      end;
    end;
  end;
end;

end.
