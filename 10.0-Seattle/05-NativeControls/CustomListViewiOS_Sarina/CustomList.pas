unit CustomList;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.StdCtrls, FMX.Controls.Presentation, FMX.ListView,
  FMX.Objects, IPPeerClient, REST.Backend.ServiceTypes, REST.Backend.MetaTypes,
  System.JSON, REST.Backend.KinveyServices, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, REST.Response.Adapter, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Backend.BindSource,
  REST.Backend.ServiceComponents, REST.Backend.KinveyProvider, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.DBScope, System.ImageList, FMX.ImgList,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base;

type
  TCustomList1 = class(TForm)
    ListView1: TListView;
    ToolBar1: TToolBar;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    KinveyProvider1: TKinveyProvider;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    BackendQuery1: TBackendQuery;
    FDMemTable1: TFDMemTable;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    ImageList1: TImageList;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustomList1: TCustomList1;

implementation

{$R *.fmx}
{$R *.iPhone47in.fmx IOS}

procedure TCustomList1.FormCreate(Sender: TObject);
begin
  Backendquery1.Execute;
end;

end.
