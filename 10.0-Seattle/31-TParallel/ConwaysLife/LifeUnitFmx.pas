unit LifeUnitFmx;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, LifeEngine, FMX.Controls.Presentation;

const
  BoardSize: TSize = (cx: 500; cy: 500);

type
  TForm5 = class(TForm)
    PaintBox1: TPaintBox;
    HorzScrollBar: TScrollBar;
    VertScrollBar: TScrollBar;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    Parallel: TCheckBox;
    StartStop: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject; Canvas: TCanvas);
    procedure Button2Click(Sender: TObject);
    procedure ParallelChange(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure HorzScrollBarChange(Sender: TObject);
    procedure VertScrollBarChange(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure StartStopClick(Sender: TObject);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
  private
    var
      FLifeEngine: TLifeEngine;
      FLifeBoard: TLifeBoard;
      FGensPerSecond, FMaxGensPerSecond: Double;
      FViewOffset, FViewSize: TPoint;
    procedure LifeEngineUpdate(Sender: TObject);
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses
  System.Math;

{$R *.fmx}

procedure TForm5.Button2Click(Sender: TObject);
begin
  if not FLifeEngine.Running then
  begin
    FLifeEngine.Clear;
    FLifeBoard := FLifeEngine.LifeBoard;
    FormResize(Sender);
    PaintBox1.InvalidateRect(PaintBox1.BoundsRect);
  end;
end;

procedure TForm5.Button3Click(Sender: TObject);
begin
  HorzScrollBar.Value := (Length(FLifeBoard) - FViewSize.X) / 2;
  VertScrollBar.Value := (Length(FLifeBoard[0]) - FViewSize.Y) / 2;
end;

procedure TForm5.Button4Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    FLifeEngine.LoadPattern(OpenDialog1.FileName);
end;

procedure TForm5.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if FLifeEngine.Running then
    FLifeEngine.Stop;
  CanClose := not FLifeEngine.Running;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  FLifeEngine := TLifeEngine.Create(BoardSize);
  FLifeEngine.OnUpdate := LifeEngineUpdate;
  FLifeBoard := FLifeEngine.LifeBoard;
  FLifeEngine.UpdateRate := 30;
  FormResize(Sender);
  LifeEngineUpdate(Sender);
end;

procedure TForm5.FormDestroy(Sender: TObject);
begin
  FLifeEngine.Free;
end;

procedure TForm5.FormResize(Sender: TObject);
begin
  PaintBox1.Width := ClientWidth - (600 - 561);
  PaintBox1.Height := ClientHeight - (400 - 289);
  HorzScrollBar.Width := PaintBox1.Width;
  HorzScrollBar.Position.Y := PaintBox1.Position.Y + PaintBox1.Height + 8;
  VertScrollBar.Height := PaintBox1.Height;
  VertScrollBar.Position.X := PaintBox1.Position.X + PaintBox1.Width + 8;
  FViewSize := TPoint.Create(Trunc(PaintBox1.Width - 10) div 10, Trunc(PaintBox1.Height - 10) div 10);
  HorzScrollBar.Max := Length(FLifeBoard){ - FViewSize.X};
  HorzScrollBar.ViewportSize := FViewSize.X;
  VertScrollBar.Max := Length(FLifeBoard[0]){ - FViewSize.Y};
  VertScrollBar.ViewportSize := FViewSize.Y;
end;

procedure TForm5.HorzScrollBarChange(Sender: TObject);
begin
  FViewOffset.X := Trunc(HorzScrollBar.Value);
  PaintBox1.InvalidateRect(PaintBox1.BoundsRect);
end;

procedure TForm5.LifeEngineUpdate(Sender: TObject);
begin
  FLifeBoard := FLifeEngine.LifeBoard;
  FGensPerSecond := FLifeEngine.GensPerSecond;
  FMaxGensPerSecond := FLifeEngine.MaxGensPerSecond;
  Label1.Text := Format('%f Generations Per Second', [FGensPerSecond]);
  Label2.Text := Format('%f Max Generations Per Second', [FMaxGensPerSecond]);
  Label4.Text := Format('%d Total Generations', [FLifeEngine.GenerationCount]);
  PaintBox1.InvalidateRect(PaintBox1.BoundsRect);
end;

procedure TForm5.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
var
  Row, Column: Integer;
begin
  if not FLifeEngine.Running and (Button = TMouseButton.mbLeft) then
  begin
    Row := Trunc(Y) div 10;
    Column := Trunc(X) div 10;
    if (Row >= 0) and (Row <= FViewSize.Y) and
      (Column >= 0) and (Column <= FViewSize.X) then
    begin
      FLifeBoard[FViewOffset.X + Column, FViewOffset.Y + Row] :=
        FLifeBoard[FViewOffset.X + Column, FViewOffset.Y + Row] xor 1;
      PaintBox1.InvalidateRect(TRectF.Create(Column + 10, Row * 10, Column * 10 + 11, Row * 10 + 11));
    end;
    Label3.Text := Format('%d, %d', [FViewOffset.X + Column, FViewOffset.Y + Row]);
  end;
end;

procedure TForm5.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
begin
  Label3.Text := Format('%d, %d', [FViewOffset.X + Trunc(X) div 10, FViewOffset.Y + Trunc(Y) div 10]);
end;

procedure TForm5.PaintBox1Paint(Sender: TObject; Canvas: TCanvas);
var
  I, J: Integer;
begin
  PaintBox1.Canvas.Stroke.Color := TAlphaColorRec.Black;
  PaintBox1.Canvas.Stroke.Kind := TBrushKind.bkSolid;
  PaintBox1.Canvas.StrokeThickness := 1.0;
  PaintBox1.Canvas.Fill.Color := TAlphaColorRec.Black;
  PaintBox1.Canvas.Stroke.Kind := TBrushKind.bkSolid;
  PaintBox1.Canvas.StrokeDash := TStrokeDash.sdSolid;
  PaintBox1.Canvas.StrokeCap := TStrokeCap.scFlat;
  PaintBox1.Canvas.StrokeJoin := TStrokeJoin.sjMiter;
  if Length(FLifeBoard) > 0 then
    for I := 0 to FViewSize.X - 1 do
      for J := 0 to FViewSize.Y - 1 do
      begin
        if FLifeBoard[Min(FViewOffset.X + I, High(FLifeBoard)), Min(FViewOffset.Y + J, High(FLifeBoard[0]))] <> 0 then
          with PaintBox1.Canvas do
          begin
            FillRect(TRectF.Create(I * 10, J * 10, I * 10 + 11, J * 10 + 11), 0.0, 0.0, [TCorner.crTopLeft..TCorner.crBottomRight], 1.0, TCornerType.ctRound);
          end else
          with PaintBox1.Canvas do
          begin
            DrawRect(TRectF.Create(I * 10, J * 10, I * 10 + 11, J * 10 + 11), 0.0, 0.0, [TCorner.crTopLeft..TCorner.crBottomRight], 1.0, TCornerType.ctRound);
          end;
      end;
end;

procedure TForm5.ParallelChange(Sender: TObject);
begin
  if FLifeEngine <> nil then
    FLifeEngine.Parallel := Parallel.IsChecked;
end;

procedure TForm5.StartStopClick(Sender: TObject);
begin
  if not FLifeEngine.Running then
  begin
    FLifeEngine.Start;
    StartStop.Text := 'Stop';
  end else
  begin
    FLifeEngine.Stop;
    StartStop.Text := 'Start';
  end;
end;

procedure TForm5.VertScrollBarChange(Sender: TObject);
begin
  FViewOffset.Y := Trunc(VertScrollBar.Value);
  PaintBox1.InvalidateRect(PaintBox1.BoundsRect);
end;

end.
