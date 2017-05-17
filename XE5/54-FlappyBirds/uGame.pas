unit uGame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  System.Generics.Collections,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Effects, FMX.StdCtrls, Math, FMX.Ani, FMX.Filter.Effects, FMX.Layouts,System.IOUtils,
  System.IniFiles, FMX.Platform, Interfaces.Controller.GUI;

type
  TGameForm = class(TForm, Interfaces.Controller.GUI.IAppGUI)
    BackGroundImage: TImage;
    BirdSprite: TImage;
    ScoreLBL: TLabel;
    GlowEffect1: TGlowEffect;
    Ground: TRectangle;
    GroundB: TImage;
    GroundA: TImage;
    GetReadyLayout: TLayout;
    FBird1: TImage;
    FBird2: TImage;
    GroundBar: TImage;
    GameOverLayout: TLayout;
    GameOverLBL: TLabel;
    GOFloat: TFloatAnimation;
    Rectangle3: TRectangle;
    Label2: TLabel;
    Label4: TLabel;
    GOScoreLBL: TLabel;
    BestScoreLBL: TLabel;
    Layout1: TLayout;
    OKBTN: TButton;
    ReplayBTN: TButton;
    FBird3: TImage;
    BigPipe: TLayout;
    TopPipe: TRectangle;
    TopPipeCap: TRectangle;
    Arc1: TArc;
    Arc2: TArc;
    GetReadyLBL: TLabel;
    FloatAnimation1: TFloatAnimation;
    GlowEffect3: TGlowEffect;
    Image2: TImage;
    MonochromeEffect1: TMonochromeEffect;
    Pie1: TPie;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Rectangle2: TRectangle;
    procedure FormCreate(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure GetReadyLayoutClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ReplayBTNClick(Sender: TObject);
    procedure OKBTNClick(Sender: TObject);
  private
    FController: IAppController;
    type
     TOnCreateGUI = reference to procedure(const AGUI: IAppGUI);
    class var
     FOnCreateGUI: TOnCreateGUI;
  protected
    procedure RegisterController(const AController: IAppController);
    function GetGamePanelWidth: Integer;
    function GetGamePanelHeight: Integer;
    function GetHRatio: Integer;
    procedure ResetGame;
    procedure GameOver(AScore, ABestScore: Integer);
    procedure AddPipe(APipe: TPipe);
    procedure RemovePipe(APipe: TPipe);
    procedure MovePipe(APipe: TPipe);
    procedure SetBird(ABird: TBird);
    procedure SetScore(AScore: Integer);
  public
    IniFileName: String;
    BG_WRatio: Integer;
    BG_HRatio: Integer;
    procedure Run;
    function GetScreenScale: Single;
    class property OnCreateGUI: TOnCreateGUI read FOnCreateGUI write FOnCreateGUI;
  end;

var
  GameForm: TGameForm;

implementation

{$R *.fmx}

uses uMenu;

function TGameForm.GetScreenScale: Single;
var
  ScreenSvc: IFMXScreenService;
begin
  Result := 1;
  if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, IInterface(ScreenSvc)) then
  begin
    Result := ScreenSvc.GetScreenScale;
  end;
end;

procedure TGameForm.RegisterController(const AController: IAppController);
begin
 FController:= AController;
end;

procedure TGameForm.FormCreate(Sender: TObject);
begin
 if Assigned(FOnCreateGUI) then
  FOnCreateGUI(Self);

 GOFloat.StopValue := 0;
 GOFloat.StartValue := GameForm.Height;
 GameOverLayout.Position.Y := GameForm.Height;
 IniFileName := System.IOUtils.TPath.GetDocumentsPath + System.SysUtils.PathDelim + 'Scores.dat';
end;

procedure TGameForm.FormHide(Sender: TObject);
begin
 MenuForm.Show;
end;

procedure TGameForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
 FController.Tapped;
end;

procedure TGameForm.FormShow(Sender: TObject);
begin
{if JustOnce=False then
 begin
   try
     IniFile := TMemIniFile.Create(IniFileName);
     BestScore := IniFile.ReadInteger('Settings','Best',0);
     IniFile.Free;
     BestScoreLBL.Text := IntToStr(BestScore);
   except on E: Exception do
    begin
      //E.Message;
    end;
   end;
   JustOnce := True;
 end;}
end;

procedure TGameForm.ReplayBTNClick(Sender: TObject);
begin
 GameOverLayout.Position.Y := GameForm.Height;
 GameOverLayout.Visible:= false;
 GetReadyLayout.Visible:= true;
 FController.Replay;
end;

procedure TGameForm.GetReadyLayoutClick(Sender: TObject);
var FormScale: Single;
begin
 FormScale:= GetScreenScale;
 BG_WRatio:= 1;//Trunc(FormScale);
 BG_HRatio:= 1;//Trunc(FormScale);
 GetReadyLayout.Visible:= False;
 ScoreLBL.Visible:= True;
 FController.StartGame;
end;

procedure TGameForm.OKBTNClick(Sender: TObject);
begin
 GameOverLayout.Position.Y := GameForm.Height;
 GameOverLayout.Visible := False;
 GameForm.Close;
 MenuForm.Show;
end;

procedure TGameForm.Run;
begin
 GameOverLayout.Visible:= false;
 GetReadyLayout.Visible:= true;
end;

function TGameForm.GetGamePanelWidth: Integer;
begin
 Result:= GameForm.Width;
end;

function TGameForm.GetGamePanelHeight: Integer;
begin
 Result:= GameForm.Height;
end;

function TGameForm.GetHRatio: Integer;
begin
 Result:= BG_HRatio;
end;

procedure TGameForm.ResetGame;
begin
 Application.ProcessMessages;
end;

procedure TGameForm.GameOver(AScore, ABestScore: Integer);
begin
 GOScoreLBL.Text:= IntToStr(AScore);
 BestScoreLbl.Text:= IntToStr(ABestScore);
 GameOverLayout.BringToFront;
 GameOverLayout.Visible:= true;
 ScoreLBL.Visible:= false;
 GOFloat.Enabled := True;
end;

procedure TGameForm.AddPipe(APipe: TPipe);
var R: TLayout;
begin
// GameForm.BeginUpdate;
 R:= TLayout(BigPipe.Clone(Self));
 R.Parent:= GameForm;
 R.Visible:= True;
 R.Position.X:= APipe.X;
 R.Position.Y:= APipe.Y;
 R.RotationAngle:= APipe.Angle;
 R.Tag:= APipe.Tag;
 APipe.Layout:= R;

 Ground.BringToFront;
 GroundBar.BringToFront;
 ScoreLBL.BringToFront;
// GameForm.EndUpdate;
end;

procedure TGameForm.RemovePipe(APipe: TPipe);
begin
 APipe.Layout.DisposeOf;
end;

procedure TGameForm.MovePipe(APipe: TPipe);
begin
// GameForm.BeginUpdate;
 if Assigned(APipe.Layout) then
  APipe.Layout.Position.X:= APipe.X;
// GameForm.EndUpdate;
end;

procedure TGameForm.SetBird(ABird: TBird);
begin
 BirdSprite.Position.X:= ABird.X;
 BirdSprite.Position.Y:= ABird.Y;
 BirdSprite.RotationAngle:= ABird.Angle;
 if ABird.Flap then
  BirdSprite.Bitmap.Assign(FBird1.Bitmap)
 else
  BirdSprite.Bitmap.Assign(FBird2.Bitmap);
end;

procedure TGameForm.SetScore(AScore: Integer);
begin
 ScoreLBL.Text:= IntToStr(AScore);
end;

end.

