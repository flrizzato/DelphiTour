unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Edit, FMX.StdCtrls,
  FMX.WebBrowser;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    WebBrowser1: TWebBrowser;
    Button1: TButton;
    edtURL: TEdit;
    procedure edtURLKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure edtURLChange(Sender: TObject);
  private
    procedure OpenURL;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  WebBrowser1.GoBack;
end;

procedure TForm1.edtURLChange(Sender: TObject);
begin
  OpenURL;
end;

procedure TForm1.OpenURL;
begin
  WebBrowser1.Navigate(edtURL.Text);
  button1.SetFocus;
end;

procedure TForm1.edtURLKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vKReturn then
   begin
     OpenURL;
   end;
end;

end.
