unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  Vcl.Bind.Editors, Vcl.StdCtrls, Data.Bind.Components, System.Rtti,
  System.Bindings.Outputs;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BindingsList1: TBindingsList;
    LinkControlToProperty1: TLinkControlToProperty;
    CheckBox1: TCheckBox;
    LinkControlToProperty2: TLinkControlToProperty;
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
