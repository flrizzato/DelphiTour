/// In this demo, we see how a simple object can be linked to using
///  Visual LiveBindings.
/// To get best understanding at design time, select from the
///  menu "View" > "LiveBindings Designer"
unit frmFoo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, Data.Bind.GenData,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Editors, Data.Bind.Components,
  FMX.Edit, Data.Bind.ObjectScope, System.Bindings.Outputs, RTTI, FMX.StdCtrls;

type
  /// TFoo is a simple class with two writable properties and one read only property.
  ///  Properties don't have to be published, Public is fine.
  TFoo = class
  private
    FFooString: string;
    FFooInteger: Integer;
    function GetAsString: string;
  public
    constructor Create(aFooString : string; aFooInteger : Integer);
    property FooString: string read FFooString write FFooString;
    property FooInteger: Integer read FFooInteger write FFooInteger;
    property AsString: string read GetAsString;
  end;

  TFormFoo = class(TForm)
    PrototypeBindSource1: TPrototypeBindSource;
    BindingsList1: TBindingsList;
    EditFooString: TEdit;
    Label1: TLabel;
    LinkControlToField1: TLinkControlToField;
    SpinBoxFooInteger: TSpinBox;
    Label2: TLabel;
    LinkControlToField2: TLinkControlToField;
    EditAsString: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    LinkControlToField3: TLinkControlToField;
    LinkPropertyToField1: TLinkPropertyToField;
    procedure LinkToObject(Sender: TObject;
      var ABindSourceAdapter: TBindSourceAdapter);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFoo: TFormFoo;

implementation

{$R *.fmx}

procedure TFormFoo.LinkToObject(Sender: TObject;
  var ABindSourceAdapter: TBindSourceAdapter);
begin
  ABindSourceAdapter := TObjectBindSourceAdapter<TFoo>.Create(Self, TFoo.Create('Hello World',42), True);
end;

{ TFoo }

constructor TFoo.Create(aFooString: string; aFooInteger : Integer);
begin
  inherited Create;
  FooString := aFooString;
  FooInteger := aFooInteger;
end;

function TFoo.GetAsString: string;
begin
  Result := Format('%s [%d]',[FooString, FooInteger]);
end;

end.
