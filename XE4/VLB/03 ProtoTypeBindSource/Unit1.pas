unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, Data.Bind.GenData,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  FMX.Edit, Data.Bind.ObjectScope, FMX.Objects, System.Rtti,
  System.Bindings.Outputs, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    TrackBar1: TTrackBar;
    Rectangle1: TRectangle;
    PrototypeBindSource1: TPrototypeBindSource;
    SpinBox1: TSpinBox;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkPropertyToField1: TLinkPropertyToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

end.
