unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Bind.GenData, Vcl.Bind.Editors,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components, Vcl.StdCtrls,
  Data.Bind.ObjectScope, System.Rtti, System.Bindings.Outputs;

type
  TForm1 = class(TForm)
    PrototypeBindSource1: TPrototypeBindSource;
    Edit1: TEdit;
    editOutput: TEdit;
    cbFormat: TComboBox;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToEditOutput: TLinkControlToField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure cbFormatChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.cbFormatChange(Sender: TObject);
begin
  LinkControlToEditOutput.CustomFormat := cbFormat.Text;
end;

end.
