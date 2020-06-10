unit uSplash;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Objects, FMX.StdCtrls;

type
  TFrmSplash = class(TForm)
    Image1: TImage;
    tmSplash: TTimer;
    procedure tmSplashTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSplash: TFrmSplash = nil;

procedure ShowSplash;
procedure HideSplash;

implementation

{$R *.fmx}

procedure ShowSplash;
begin
  //Only show the splash for Android devices
  if (TOSVersion.Platform<>pfAndroid) then exit;

  if (not assigned(frmSplash)) then frmSplash:=TFrmSplash.Create(application);
  frmSplash.Show;
  frmSplash.tmSplash.Enabled:=false;
  frmSplash.tmSplash.Enabled:=true;
end;

procedure HideSplash;
begin
  if (assigned(frmSplash)) then begin
    frmSplash.Close;
  end;
end;

procedure TFrmSplash.tmSplashTimer(Sender: TObject);
begin
  tmSplash.Enabled:=false;
  HideSplash;
end;

end.
