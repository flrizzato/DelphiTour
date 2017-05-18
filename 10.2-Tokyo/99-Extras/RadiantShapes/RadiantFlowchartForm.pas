{===============================================================================
  RadiantFlowchartForm Unit

  Radiant Shapes - Demo Source Unit

  Copyright © 2012-2014 by Raize Software, Inc.  All Rights Reserved.

  Modification History
  ------------------------------------------------------------------------------
  1.0    (29 Oct 2014)
    * Initial release.
===============================================================================}

unit RadiantFlowchartForm;

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
  FMX.Objects,
  FMX.Layouts,
  Radiant.Shapes;

type
  TfrmFlowchart = class(TForm)
    RadiantCapsule1: TRadiantCapsule;
    Text1: TText;
    RadiantLine1: TRadiantLine;
    RadiantDiamond1: TRadiantDiamond;
    RadiantParallelogram1: TRadiantParallelogram;
    RadiantRectangle2: TRadiantRectangle;
    RadiantCapsule2: TRadiantCapsule;
    RadiantRectangle3: TRadiantRectangle;
    Text2: TText;
    Text4: TText;
    Text5: TText;
    Text6: TText;
    Text7: TText;
    RadiantDiamond2: TRadiantDiamond;
    Text8: TText;
    RadiantLine3: TRadiantLine;
    RadiantLine4: TRadiantLine;
    RadiantLine6: TRadiantLine;
    Text9: TText;
    Text10: TText;
    RadiantLine11: TRadiantLine;
    Text11: TText;
    RadiantLine8: TRadiantLine;
    Text12: TText;
    txtTitle: TText;
    lytFlowchart: TLayout;
    RadiantDiamond3: TRadiantDiamond;
    Text13: TText;
    RadiantRectangle4: TRadiantRectangle;
    Text14: TText;
    RadiantLine9: TRadiantLine;
    RadiantLine12: TRadiantLine;
    RadiantLine13: TRadiantLine;
    Text15: TText;
    RadiantRectangle5: TRadiantRectangle;
    Text16: TText;
    RadiantLine16: TRadiantLine;
    RadiantRectangle1: TRadiantRectangle;
    Text3: TText;
    RadiantLine5: TRadiantLine;
    RadiantLine7: TRadiantLine;
    RadiantLine10: TRadiantLine;
    Text17: TText;
    procedure FormCreate(Sender: TObject);
    procedure lytFlowchartResize(Sender: TObject);
  private
    { Private declarations }
    FOriginalWidth: Single;
    FOriginalHeight: Single;
    FOriginalFontSize: Single;
  public
    { Public declarations }
  end;

var
  frmFlowchart: TfrmFlowchart;

implementation

{$R *.fmx}

uses
  Math;

procedure TfrmFlowchart.FormCreate(Sender: TObject);
var
  C: TControl;
begin
  FOriginalWidth := lytFlowchart.Width;
  FOriginalHeight := lytFlowchart.Height;
  FOriginalFontSize := Text1.Font.Size;

  for C in lytFlowchart.Controls do
    C.Align := TAlignLayout.Scale;
end;


procedure TfrmFlowchart.lytFlowchartResize(Sender: TObject);
var
  I, K: Integer;
  C, CC: TControl;
  ScaleFactor, FontSize: Single;
begin
  ScaleFactor := Min( lytFlowchart.Width / FOriginalWidth, lytFlowchart.Height / FOriginalHeight );
  FontSize := FOriginalFontSize * ScaleFactor;

  for I := 0 to lytFlowchart.ControlsCount - 1 do
  begin
    C := lytFlowchart.Controls[ I ];
    for K := 0 to C.ControlsCount - 1 do
    begin
      CC := C.Controls[ K ];
      if CC is TText then
      begin
        TText( CC ).TextSettings.Font.Size := FontSize;
      end;
    end;
  end;
end;

end.
