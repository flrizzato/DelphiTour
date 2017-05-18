unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, uBlueChat,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox,
  FMX.StdCtrls, FMX.ScrollBox, FMX.Memo, FMX.Controls.Presentation,
  FMX.Edit;

type
  TMainForm = class(TForm)
    ToolBar1: TToolBar;
    memMessageLog: TMemo;
    btnFindDevices: TButton;
    cmbDevices: TComboBox;
    ToolBar2: TToolBar;
    btnSendMessage: TButton;
    edtMessageSend: TEdit;
    btnStartRead: TButton;
    procedure btnFindDevicesClick(Sender: TObject);
    procedure btnSendMessageClick(Sender: TObject);
    procedure cmbDevicesClosePopup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnStartReadClick(Sender: TObject);
  private
    { Private declarations }
    fBTSend: TBlueChatWriter;
    fBTRead: TBlueChatReader;
    procedure OnNewText(const Sender: TObject; const AText: string;
      const aDeviceName: string);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

uses System.Bluetooth;

procedure TMainForm.btnFindDevicesClick(Sender: TObject);
var
  i: integer;
  aBlueDevices: TBluetoothDeviceList;
begin
  aBlueDevices := TBluetoothManager.Current.CurrentAdapter.PairedDevices;

  cmbDevices.BeginUpdate;
  try
    cmbDevices.Items.Clear;
    for i := 0 to aBlueDevices.Count - 1 do
      cmbDevices.Items.Add(aBlueDevices.Items[i].DeviceName);
  finally
    cmbDevices.EndUpdate;
  end;
end;

procedure TMainForm.btnSendMessageClick(Sender: TObject);
begin
  if fBTSend = nil then
    fBTSend := TBlueChatWriter.Create(Self);

  fBTSend.DeviceName := cmbDevices.Selected.Text;

  if fBTSend.SendMessage(edtMessageSend.Text) then
    memMessageLog.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - You: ' +
      edtMessageSend.Text);
end;

procedure TMainForm.cmbDevicesClosePopup(Sender: TObject);
begin
  btnSendMessage.Enabled := not cmbDevices.Selected.Text.IsEmpty;
  btnStartRead.Enabled := not cmbDevices.Selected.Text.IsEmpty;
end;

procedure TMainForm.btnStartReadClick(Sender: TObject);
begin
  if fBTRead = nil then
  begin
    fBTRead := TBlueChatReader.Create(Self);
    fBTRead.OnTextReceived := OnNewText;
  end
  else
  begin
    fBTRead.StopReader;
  end;

  fBTRead.DeviceName := cmbDevices.Selected.Text;
  fBTRead.StartReader;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  fBTSend := nil;
  fBTRead := nil;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fBTSend);
  FreeAndNil(fBTRead);
end;

procedure TMainForm.OnNewText(const Sender: TObject;
  const AText, aDeviceName: string);
begin
  TThread.Synchronize(nil,
    procedure
    begin
      memMessageLog.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' +
        aDeviceName + ': ' + AText);
      memMessageLog.GoToTextEnd;
    end);
end;

end.
