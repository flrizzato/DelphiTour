unit uMainFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent, FMX.Objects,
  System.Threading, uMainDM;

type
  TMainFrame = class(TFrame)
    ToolBar1: TToolBar;
    edtURL: TEdit;
    butStart: TButton;
    imgMonitor: TImage;
    procedure butStartClick(Sender: TObject);
  private
    { Private declarations }
    aMainDM: TMainDM;
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

{ TFrame1 }

procedure TMainFrame.butStartClick(Sender: TObject);
begin
  if not Assigned(aMainDM) then
    aMainDM := TMainDM.Create(Self);

  if not aMainDM.IsActive then
  begin
    butStart.Text := 'Stop';
    aMainDM.StartVideoStream(edtURL.Text, imgMonitor);
  end
  else
  begin
    butStart.Text := 'Start';
    aMainDM.StopVideoStream;
  end;
end;

end.
