unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.WebBrowser;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    WebBrowser1: TWebBrowser;
    edtURL: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Button1: TButton;
    Button2: TButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  WebBrowser1.Navigate('www.embarcadero.com');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  WebBrowser1.Navigate(edtURL.Text);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  WebBrowser1.GoBack;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  WebBrowser1.GoForward;
end;

end.
