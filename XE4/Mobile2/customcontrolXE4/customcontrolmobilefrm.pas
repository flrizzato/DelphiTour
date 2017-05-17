unit customcontrolmobilefrm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, fmx.customcontrol;

type
  TForm15 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;

implementation

{$R *.fmx}

procedure TForm15.FormCreate(Sender: TObject);
var
  C: TMyControl;
begin
  C := TMyControl.Create(Self);
  C.Parent := Self;
end;

end.
