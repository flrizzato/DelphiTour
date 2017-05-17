unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Bind.GenData, Vcl.Bind.Editors,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.ObjectScope, Vcl.ExtCtrls, Vcl.StdCtrls, System.Rtti,
  System.Bindings.Outputs;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    LabeledEdit1: TLabeledEdit;
    PrototypeBindSource1: TPrototypeBindSource;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Data.Bind.Components.RegisterValuePropertyName(
    TArray<TClass>.Create(TLabeledEdit), 'Text', 'DFM', [vpTrack, vpObservable]);


  with TLinkControlToField.Create(Self) do begin
    Category := 'Quick Bindings';
    DataSource := PrototypeBindSource1;
    FieldName := 'IntField1';
    Control := LabeledEdit1;
    Track := True;
  end
end;

end.
