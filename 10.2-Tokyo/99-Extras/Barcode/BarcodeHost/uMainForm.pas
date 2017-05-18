unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, IPPeerClient, IPPeerServer,
  System.Tether.Manager, System.Tether.AppProfile;

type
  TMainForm = class(TForm)
    ToolBar1: TToolBar;
    edtResult: TEdit;
    lblTitle: TLabel;
    TetheringManager1: TTetheringManager;
    TetheringAppProfile1: TTetheringAppProfile;
    ClearEditButton1: TClearEditButton;
    StyleBook1: TStyleBook;
    butExit: TButton;
    procedure TetheringAppProfile1ResourceReceived(const Sender: TObject;
      const AResource: TRemoteResource);
    procedure ClearEditButton1Click(Sender: TObject);
    procedure butExitClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetClipboard(s: string);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}
{$R *.Macintosh.fmx MACOS}
{$R *.Windows.fmx MSWINDOWS}

uses FMX.Platform;

procedure TMainForm.butExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TMainForm.ClearEditButton1Click(Sender: TObject);
begin
  edtResult.Text := '';
  SetClipboard(edtResult.Text);
end;

procedure TMainForm.SetClipboard(s: string);
var
  Svc: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, Svc) then
    Svc.SetClipboard(s);
end;

procedure TMainForm.TetheringAppProfile1ResourceReceived(const Sender: TObject;
  const AResource: TRemoteResource);
begin
  if AResource.Hint = 'Barcode' then
  begin
    edtResult.Text := AResource.Value.AsString;
    SetClipboard(edtResult.Text);
  end;
end;

end.
