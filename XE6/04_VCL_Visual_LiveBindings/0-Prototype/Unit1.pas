unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Bind.GenData, Data.Bind.GenData,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.Bind.Components, Data.Bind.Grid, Vcl.Grids, Data.Bind.ObjectScope;

type
  TForm1 = class(TForm)
    PrototypeBindSource1: TPrototypeBindSource;
    StringGrid1: TStringGrid;
    BindingsList1: TBindingsList;
    LinkGridToDataSourcePrototypeBindSource1: TLinkGridToDataSource;
    ImageBitmap1: TImage;
    LinkControlToFieldBitmap1: TLinkControlToField;
    Edit1: TEdit;
    LinkControlToField1: TLinkControlToField;
    LinkPropertyToFieldColor: TLinkPropertyToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
