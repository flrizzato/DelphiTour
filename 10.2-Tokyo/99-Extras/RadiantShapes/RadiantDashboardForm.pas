{===============================================================================
  RadiantDashboardForm Unit

  Radiant Shapes - Demo Source Unit

  Copyright © 2012-2014 by Raize Software, Inc.  All Rights Reserved.

  Modification History
  ------------------------------------------------------------------------------
  1.0    (29 Oct 2014)
    * Initial release.
===============================================================================}

unit RadiantDashboardForm;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Layouts,
  FMX.Objects,
  FMX.Ani,
  FMX.Effects,
  Radiant.Shapes;

type
  TDashboardNode = ( Server,
                     ConnectionSA, ControllerA, ConnectionA1, DispenserA1, ConnectionA2, DispenserA2, ConnectionA3, DispenserA3,
                     ConnectionSB, ControllerB, ConnectionB1, DispenserB1, ConnectionB2, DispenserB2, ConnectionB3, DispenserB3,
                     ConnectionSC, ControllerC, ConnectionC1, DispenserC1, ConnectionC2, DispenserC2, ConnectionC3, DispenserC3 );

  TDashboardStatus = ( Idle, Active, Error );

  TfrmDashboard = class(TForm)
    hexServer: TRadiantHexagon;
    lytControllerA: TLayout;
    rectConnectionSA: TRadiantRectangle;
    rectConnectionA1: TRadiantRectangle;
    rectConnectionA2: TRadiantRectangle;
    rectConnectionA3: TRadiantRectangle;
    pentControllerA: TRadiantPentagon;
    trapDispenserA1: TRadiantTrapezoid;
    trapDispenserA2: TRadiantTrapezoid;
    trapDispenserA3: TRadiantTrapezoid;
    txtControllerA: TText;
    txtDispenserA1: TText;
    txtDispenserA2: TText;
    txtDispenserA3: TText;
    lytControllerC: TLayout;
    rectConnectionSC: TRadiantRectangle;
    rectConnectionC1: TRadiantRectangle;
    rectConnectionC2: TRadiantRectangle;
    rectConnectionC3: TRadiantRectangle;
    pentControllerC: TRadiantPentagon;
    txtControllerC: TText;
    trapDispenserC1: TRadiantTrapezoid;
    txtDispenserC1: TText;
    trapDispenserC2: TRadiantTrapezoid;
    txtDispenserC2: TText;
    trapDispenserC3: TRadiantTrapezoid;
    txtDispenserC3: TText;
    lytControllerB: TLayout;
    rectConnectionSB: TRadiantRectangle;
    rectConnectionB1: TRadiantRectangle;
    rectConnectionB2: TRadiantRectangle;
    rectConnectionB3: TRadiantRectangle;
    pentControllerB: TRadiantPentagon;
    txtControllerB: TText;
    trapDispenserB1: TRadiantTrapezoid;
    txtDispenserB1: TText;
    trapDispenserB2: TRadiantTrapezoid;
    txtDispenserB2: TText;
    trapDispenserB3: TRadiantTrapezoid;
    txtDispenserB3: TText;
    rectNetwork: TRadiantRectangle;
    NormalFill: TBrushObject;
    HighlightFill: TBrushObject;
    ErrorFill: TBrushObject;
    rectStatus: TRadiantRectangle;
    lytStatus: TLayout;
    chevRight1: TRadiantChevron;
    rectStatusCenter: TRadiantRectangle;
    txtStatus: TText;
    chevRight2: TRadiantChevron;
    chevRight3: TRadiantChevron;
    chevRight4: TRadiantChevron;
    chevLeft4: TRadiantChevron;
    chevLeft3: TRadiantChevron;
    chevLeft2: TRadiantChevron;
    chevLeft1: TRadiantChevron;
    chevLeft5: TRadiantChevron;
    chevRight5: TRadiantChevron;
    lytNetwork: TLayout;
    RadiantRectangle1: TRadiantRectangle;
    lytStatusTitle: TLayout;
    RadiantTriangle1: TRadiantTriangle;
    lytNetworkTitle: TLayout;
    RadiantRectangle2: TRadiantRectangle;
    RadiantTriangle2: TRadiantTriangle;
    Text1: TText;
    Text3: TText;
    tmrError: TTimer;
    tmrSimulate: TTimer;
    ErrorBalloon: TRadiantCallout;
    txtErrorMessage: TText;
    sqrSimulate: TRadiantSquare;
    xCheckMark: TRadiantX;
    Text2: TText;
    procedure FormCreate(Sender: TObject);
    procedure tmrErrorTimer(Sender: TObject);
    procedure tmrSimulateTimer(Sender: TObject);
    procedure AcknowledgeErrorClick(Sender: TObject);
    procedure sqrSimulateClick(Sender: TObject);
  private
    FSimulate: Boolean;
    FSimulationCycle: Integer;
    FSimulateErrorTrigger: Integer;
    FErrorCycle: Integer;

    procedure ColorAllNodes( Brush: TBrush; OutlineColor: TAlphaColor );
    procedure ColorNode( Node: TDashboardNode; Brush: TBrush; OutlineColor: TAlphaColor );
    procedure ColorPath( Controller, Dispenser: TDashboardNode; Brush: TBrush; OutlineColor: TAlphaColor );

    function NodePosition( Node: TDashboardNode ): TPointF;

    procedure UpdateStatus( Status: TDashboardStatus );
  public
  end;

var
  frmDashboard: TfrmDashboard;

implementation

{$R *.fmx}


const
  NormalOutline: TAlphaColor = $FF2BA8F4;
  HighlightOutline: TAlphaColor = TAlphaColors.Lime;
  ErrorOutline: TAlphaColor = $FFFF3333;

  StatusDesc: array[ TDashboardStatus ] of string =
    ( 'Idle', 'Active', 'Error' );



procedure TfrmDashboard.FormCreate(Sender: TObject);
begin
  FErrorCycle := 1;
  FSimulationCycle := 0;
  ErrorBalloon.Visible := False;
end;


procedure TfrmDashboard.ColorAllNodes( Brush: TBrush; OutlineColor: TAlphaColor );
var
  Node: TDashboardNode;
begin
  for Node := Low( TDashboardNode ) to High( TDashboardNode ) do
    ColorNode( Node, Brush, OutlineColor );
end;


procedure TfrmDashboard.ColorNode( Node: TDashboardNode; Brush: TBrush; OutlineColor: TAlphaColor );
begin
  case Node of
    Server:
    begin
      hexServer.Fill := Brush;
      hexServer.Stroke.Color := OutlineColor;
    end;
    ConnectionSA:
    begin
      rectConnectionSA.Fill := Brush;
      rectConnectionSA.Stroke.Color := OutlineColor;
    end;
    ControllerA:
    begin
      pentControllerA.Fill := Brush;
      pentControllerA.Stroke.Color := OutlineColor;
      txtControllerA.TextSettings.FontColor := OutlineColor;
    end;
    ConnectionA1:
    begin
      rectConnectionA1.Fill := Brush;
      rectConnectionA1.Stroke.Color := OutlineColor;
    end;
    DispenserA1:
    begin
      trapDispenserA1.Fill := Brush;
      trapDispenserA1.Stroke.Color := OutlineColor;
      txtDispenserA1.TextSettings.FontColor := OutlineColor;
    end;
    ConnectionA2:
    begin
      rectConnectionA2.Fill := Brush;
      rectConnectionA2.Stroke.Color := OutlineColor;
    end;
    DispenserA2:
    begin
      trapDispenserA2.Fill := Brush;
      trapDispenserA2.Stroke.Color := OutlineColor;
      txtDispenserA2.TextSettings.FontColor := OutlineColor;
    end;
    ConnectionA3:
    begin
      rectConnectionA3.Fill := Brush;
      rectConnectionA3.Stroke.Color := OutlineColor;
    end;
    DispenserA3:
    begin
      trapDispenserA3.Fill := Brush;
      trapDispenserA3.Stroke.Color := OutlineColor;
      txtDispenserA3.TextSettings.FontColor := OutlineColor;
    end;
    ConnectionSB:
    begin
      rectConnectionSB.Fill := Brush;
      rectConnectionSB.Stroke.Color := OutlineColor;
    end;
    ControllerB:
    begin
      pentControllerB.Fill := Brush;
      pentControllerB.Stroke.Color := OutlineColor;
      txtControllerB.TextSettings.FontColor := OutlineColor;
    end;
    ConnectionB1:
    begin
      rectConnectionB1.Fill := Brush;
      rectConnectionB1.Stroke.Color := OutlineColor;
    end;
    DispenserB1:
    begin
      trapDispenserB1.Fill := Brush;
      trapDispenserB1.Stroke.Color := OutlineColor;
      txtDispenserB1.TextSettings.FontColor := OutlineColor;
    end;
    ConnectionB2:
    begin
      rectConnectionB2.Fill := Brush;
      rectConnectionB2.Stroke.Color := OutlineColor;
    end;
    DispenserB2:
    begin
      trapDispenserB2.Fill := Brush;
      trapDispenserB2.Stroke.Color := OutlineColor;
      txtDispenserB2.TextSettings.FontColor := OutlineColor;
    end;
    ConnectionB3:
    begin
      rectConnectionB3.Fill := Brush;
      rectConnectionB3.Stroke.Color := OutlineColor;
    end;
    DispenserB3:
    begin
      trapDispenserB3.Fill := Brush;
      trapDispenserB3.Stroke.Color := OutlineColor;
      txtDispenserB3.TextSettings.FontColor := OutlineColor;
    end;
    ConnectionSC:
    begin
      rectConnectionSC.Fill := Brush;
      rectConnectionSC.Stroke.Color := OutlineColor;
    end;
    ControllerC:
    begin
      pentControllerC.Fill := Brush;
      pentControllerC.Stroke.Color := OutlineColor;
      txtControllerC.TextSettings.FontColor := OutlineColor;
    end;
    ConnectionC1:
    begin
      rectConnectionC1.Fill := Brush;
      rectConnectionC1.Stroke.Color := OutlineColor;
    end;
    DispenserC1:
    begin
      trapDispenserC1.Fill := Brush;
      trapDispenserC1.Stroke.Color := OutlineColor;
      txtDispenserC1.TextSettings.FontColor := OutlineColor;
    end;
    ConnectionC2:
    begin
      rectConnectionC2.Fill := Brush;
      rectConnectionC2.Stroke.Color := OutlineColor;
    end;
    DispenserC2:
    begin
      trapDispenserC2.Fill := Brush;
      trapDispenserC2.Stroke.Color := OutlineColor;
      txtDispenserC2.TextSettings.FontColor := OutlineColor;
    end;
    ConnectionC3:
    begin
      rectConnectionC3.Fill := Brush;
      rectConnectionC3.Stroke.Color := OutlineColor;
    end;
    DispenserC3:
    begin
      trapDispenserC3.Fill := Brush;
      trapDispenserC3.Stroke.Color := OutlineColor;
      txtDispenserC3.TextSettings.FontColor := OutlineColor;
    end;
  end;
end;


procedure TfrmDashboard.ColorPath( Controller, Dispenser: TDashboardNode; Brush: TBrush; OutlineColor: TAlphaColor );
begin
  hexServer.Fill := Brush;
  hexServer.Stroke.Color := OutlineColor;

  if Controller = ControllerA then
  begin
    rectConnectionSA.Fill := Brush;
    rectConnectionSA.Stroke.Color := OutlineColor;
    pentControllerA.Fill := Brush;
    pentControllerA.Stroke.Color := OutlineColor;
    txtControllerA.TextSettings.FontColor := OutlineColor;

    case Dispenser of
      DispenserA1:
      begin
        rectConnectionA1.Fill := Brush;
        rectConnectionA1.Stroke.Color := OutlineColor;
        trapDispenserA1.Fill := Brush;
        trapDispenserA1.Stroke.Color := OutlineColor;
        txtDispenserA1.TextSettings.FontColor := OutlineColor;
      end;
      DispenserA2:
      begin
        rectConnectionA2.Fill := Brush;
        rectConnectionA2.Stroke.Color := OutlineColor;
        trapDispenserA2.Fill := Brush;
        trapDispenserA2.Stroke.Color := OutlineColor;
        txtDispenserA2.TextSettings.FontColor := OutlineColor;
      end;
      DispenserA3:
      begin
        rectConnectionA3.Fill := Brush;
        rectConnectionA3.Stroke.Color := OutlineColor;
        trapDispenserA3.Fill := Brush;
        trapDispenserA3.Stroke.Color := OutlineColor;
        txtDispenserA3.TextSettings.FontColor := OutlineColor;
      end;
    end;
  end
  else if Controller = ControllerB then
  begin
    rectConnectionSB.Fill := Brush;
    rectConnectionSB.Stroke.Color := OutlineColor;
    pentControllerB.Fill := Brush;
    pentControllerB.Stroke.Color := OutlineColor;
    txtControllerB.TextSettings.FontColor := OutlineColor;

    case Dispenser of
      DispenserB1:
      begin
        rectConnectionB1.Fill := Brush;
        rectConnectionB1.Stroke.Color := OutlineColor;
        trapDispenserB1.Fill := Brush;
        trapDispenserB1.Stroke.Color := OutlineColor;
        txtDispenserB1.TextSettings.FontColor := OutlineColor;
      end;
      DispenserB2:
      begin
        rectConnectionB2.Fill := Brush;
        rectConnectionB2.Stroke.Color := OutlineColor;
        trapDispenserB2.Fill := Brush;
        trapDispenserB2.Stroke.Color := OutlineColor;
        txtDispenserB2.TextSettings.FontColor := OutlineColor;
      end;
      DispenserB3:
      begin
        rectConnectionB3.Fill := Brush;
        rectConnectionB3.Stroke.Color := OutlineColor;
        trapDispenserB3.Fill := Brush;
        trapDispenserB3.Stroke.Color := OutlineColor;
        txtDispenserB3.TextSettings.FontColor := OutlineColor;
      end;
    end;
  end
  else if Controller = ControllerC then
  begin
    rectConnectionSC.Fill := Brush;
    rectConnectionSC.Stroke.Color := OutlineColor;
    pentControllerC.Fill := Brush;
    pentControllerC.Stroke.Color := OutlineColor;
    txtControllerC.TextSettings.FontColor := OutlineColor;

    case Dispenser of
      DispenserC1:
      begin
        rectConnectionC1.Fill := Brush;
        rectConnectionC1.Stroke.Color := OutlineColor;
        trapDispenserC1.Fill := Brush;
        trapDispenserC1.Stroke.Color := OutlineColor;
        txtDispenserC1.TextSettings.FontColor := OutlineColor;
      end;
      DispenserC2:
      begin
        rectConnectionC2.Fill := Brush;
        rectConnectionC2.Stroke.Color := OutlineColor;
        trapDispenserC2.Fill := Brush;
        trapDispenserC2.Stroke.Color := OutlineColor;
        txtDispenserC2.TextSettings.FontColor := OutlineColor;
      end;
      DispenserC3:
      begin
        rectConnectionC3.Fill := Brush;
        rectConnectionC3.Stroke.Color := OutlineColor;
        trapDispenserC3.Fill := Brush;
        trapDispenserC3.Stroke.Color := OutlineColor;
        txtDispenserC3.TextSettings.FontColor := OutlineColor;
      end;
    end;
  end;
end;


function TfrmDashboard.NodePosition( Node: TDashboardNode ): TPointF;
begin
  case Node of
    ControllerA: Result := PointF( 295, 300 );
    DispenserA1: Result := PointF( 365, 280 );
    DispenserA2: Result := PointF( 295, 230 );
    DispenserA3: Result := PointF( 220, 280 );
    ControllerB: Result := PointF( 160, 540 );
    DispenserB1: Result := PointF( 105, 490 );
    DispenserB2: Result := PointF( 90, 580 );
    DispenserB3: Result := PointF( 175, 615 );
    ControllerC: Result := PointF( 430, 540 );
    DispenserC1: Result := PointF( 415, 615 );
    DispenserC2: Result := PointF( 500, 580 );
    DispenserC3: Result := PointF( 490, 490 );
  end;
  Result.X := Result.X - ErrorBalloon.Width / 2;
  Result.Y := Result.Y - ErrorBalloon.Height + 5;
end;



procedure TfrmDashboard.UpdateStatus( Status: TDashboardStatus );
var
  Brush: TBrush;
  OutlineColor: TAlphaColor;

  procedure ColorChevrons( Chevron1, Chevron2: TRadiantChevron; Brush: TBrush; OutlineColor: TAlphaColor );
  begin
    Chevron1.Fill := Brush;
    Chevron1.Stroke.Color := OutlineColor;
    Chevron1.Opacity := 1.0;

    Chevron2.Fill := Brush;
    Chevron2.Stroke.Color := OutlineColor;
    Chevron2.Opacity := 1.0;
  end;

begin
  case Status of
    TDashboardStatus.Active:
    begin
      Brush := HighlightFill.Brush;
      OutlineColor := HighlightOutline;
    end;

    TDashboardStatus.Error:
    begin
      Brush := ErrorFill.Brush;
      OutlineColor := ErrorOutline;
    end;

  else
    Brush := NormalFill.Brush;
    OutlineColor := NormalOutline;
  end;

  rectStatusCenter.Fill := Brush;
  rectStatusCenter.Stroke.Color := OutlineColor;

  ColorChevrons( chevLeft1, chevRight1, Brush, OutlineColor );
  ColorChevrons( chevLeft2, chevRight2, Brush, OutlineColor );
  ColorChevrons( chevLeft3, chevRight3, Brush, OutlineColor );
  ColorChevrons( chevLeft4, chevRight4, Brush, OutlineColor );
  ColorChevrons( chevLeft5, chevRight5, Brush, OutlineColor );
  txtStatus.TextSettings.FontColor := OutlineColor;

  txtStatus.Text := StatusDesc[ Status ];

  tmrError.Enabled := Status = TDashboardStatus.Error;
end;



procedure TfrmDashboard.tmrErrorTimer(Sender: TObject);

  procedure DimChevrons( Chevron1, Chevron2: TRadiantChevron; Opacity: Single );
  begin
    Chevron1.Opacity := Opacity;
    Chevron2.Opacity := Opacity;
  end;

begin
  case FErrorCycle of
    1: DimChevrons( chevLeft1, chevRight1, 0.4 );
    2: DimChevrons( chevLeft2, chevRight2, 0.4 );
    3: DimChevrons( chevLeft3, chevRight3, 0.4 );
    4: DimChevrons( chevLeft4, chevRight4, 0.4 );
    5: DimChevrons( chevLeft5, chevRight5, 0.4 );
  end;

  Inc( FErrorCycle );
  if FErrorCycle > 5 then
    FErrorCycle := 1;

  case FErrorCycle of
    1: DimChevrons( chevLeft1, chevRight1, 1.0 );
    2: DimChevrons( chevLeft2, chevRight2, 1.0 );
    3: DimChevrons( chevLeft3, chevRight3, 1.0 );
    4: DimChevrons( chevLeft4, chevRight4, 1.0 );
    5: DimChevrons( chevLeft5, chevRight5, 1.0 );
  end;
end;


procedure TfrmDashboard.tmrSimulateTimer(Sender: TObject);
var
  ErrorNode: Integer;
  P: TPointF;
begin
  // Simulate Network Activity
  ColorAllNodes( NormalFill.Brush, NormalOutline );

  Inc( FSimulateErrorTrigger );
  if FSimulateErrorTrigger mod 14 = 0 then
  begin
    tmrSimulate.Enabled := False;
    UpdateStatus( TDashboardStatus.Error );

    ErrorNode := Random( 12 ) + 1;
    case ErrorNode of
      1: ColorNode( ControllerA, ErrorFill.Brush, ErrorOutline );
      2: ColorNode( DispenserA1, ErrorFill.Brush, ErrorOutline );
      3: ColorNode( DispenserA2, ErrorFill.Brush, ErrorOutline );
      4: ColorNode( DispenserA3, ErrorFill.Brush, ErrorOutline );
      5: ColorNode( ControllerB, ErrorFill.Brush, ErrorOutline );
      6: ColorNode( DispenserB1, ErrorFill.Brush, ErrorOutline );
      7: ColorNode( DispenserB2, ErrorFill.Brush, ErrorOutline );
      8: ColorNode( DispenserB3, ErrorFill.Brush, ErrorOutline );
      9: ColorNode( ControllerC, ErrorFill.Brush, ErrorOutline );
      10: ColorNode( DispenserC1, ErrorFill.Brush, ErrorOutline );
      11: ColorNode( DispenserC2, ErrorFill.Brush, ErrorOutline );
      12: ColorNode( DispenserC3, ErrorFill.Brush, ErrorOutline );
    end;

    case ErrorNode of
      1: P := NodePosition( ControllerA );
      2: P := NodePosition( DispenserA1 );
      3: P := NodePosition( DispenserA2 );
      4: P := NodePosition( DispenserA3 );
      5: P := NodePosition( ControllerB );
      6: P := NodePosition( DispenserB1 );
      7: P := NodePosition( DispenserB2 );
      8: P := NodePosition( DispenserB3 );
      9: P := NodePosition( ControllerC );
      10: P := NodePosition( DispenserC1 );
      11: P := NodePosition( DispenserC2 );
      12: P := NodePosition( DispenserC3 );
    end;

    case Random( 5 ) of
      0: txtErrorMessage.Text := 'Paper Jam';
      1: txtErrorMessage.Text := 'Out of Paper';
      2: txtErrorMessage.Text := 'No Power';
      3: txtErrorMessage.Text := 'Scanner Error';
      4: txtErrorMessage.Text := 'No Response';
    end;

    ErrorBalloon.Position.Point := P;
    ErrorBalloon.Visible := True;
  end
  else // Active
  begin
    tmrSimulate.Interval := 200 + Random( 500 );
    UpdateStatus( TDashboardStatus.Active );
    Inc( FSimulationCycle );
    if FSimulationCycle > 9 then
      FSimulationCycle := 1;

    case FSimulationCycle of
      1: ColorPath( ControllerB, DispenserB2, HighlightFill.Brush, HighlightOutline );
      2: ColorPath( ControllerA, DispenserA1, HighlightFill.Brush, HighlightOutline );
      3: ColorPath( ControllerC, DispenserC2, HighlightFill.Brush, HighlightOutline );
      4: ColorPath( ControllerA, DispenserA3, HighlightFill.Brush, HighlightOutline );
      5: ColorPath( ControllerB, DispenserB1, HighlightFill.Brush, HighlightOutline );
      6: ColorPath( ControllerA, DispenserA2, HighlightFill.Brush, HighlightOutline );
      7: ColorPath( ControllerC, DispenserC3, HighlightFill.Brush, HighlightOutline );
      8: ColorPath( ControllerB, DispenserB3, HighlightFill.Brush, HighlightOutline );
      9: ColorPath( ControllerC, DispenserC1, HighlightFill.Brush, HighlightOutline );
    end;
  end;
end;


procedure TfrmDashboard.sqrSimulateClick( Sender: TObject );
begin
  FSimulate := not FSimulate;
  xCheckMark.Visible := FSimulate;
  tmrSimulate.Enabled := FSimulate;

  if not FSimulate then
  begin
    UpdateStatus( TDashboardStatus.Idle );
    ColorAllNodes( NormalFill.Brush, NormalOutline );
    ErrorBalloon.Visible := False;
  end;
end;


procedure TfrmDashboard.AcknowledgeErrorClick( Sender: TObject );
begin
  tmrSimulate.Enabled := True;
  ErrorBalloon.Visible := False;
end;


end.
