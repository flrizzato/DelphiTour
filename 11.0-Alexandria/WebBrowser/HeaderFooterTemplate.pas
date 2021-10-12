unit HeaderFooterTemplate;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Colors, FMX.WebBrowser;

type
  THeaderFooterForm = class(TForm)
    Header: TToolBar;
    Footer: TToolBar;
    HeaderLabel: TLabel;
    WebBrowser1: TWebBrowser;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    StyleBook1: TStyleBook;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HeaderFooterForm: THeaderFooterForm;

implementation

{$R *.fmx}

procedure THeaderFooterForm.Button1Click(Sender: TObject);
begin
  WebBrowser1.Navigate(TButton(Sender).Hint);
end;

procedure THeaderFooterForm.Button4Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
