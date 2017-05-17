unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, Fmx.Bind.Grid,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  FMX.Layouts, Fmx.Bind.Navigator, Data.Bind.Grid, FMX.Grid, Data.Bind.DBScope,
  Data.DB, Datasnap.DBClient, System.Rtti, System.Bindings.Outputs;

type
  TForm3 = class(TForm)
    ClientDataSet1: TClientDataSet;
    BindSourceDB1: TBindSourceDB;
    GridBindSourceDB1: TGrid;
    LinkGridToDataSource1: TLinkGridToDataSource;
    NavigatorBindSourceDB1: TBindNavigator;
    BindingsList1: TBindingsList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}

end.
