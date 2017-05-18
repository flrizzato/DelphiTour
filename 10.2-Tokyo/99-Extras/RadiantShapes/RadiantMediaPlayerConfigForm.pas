{===============================================================================
  RadiantMediaPlayerConfigForm Unit

  Radiant Shapes - Demo Source Unit

  Copyright © 2012-2014 by Raize Software, Inc.  All Rights Reserved.

  Modification History
  ------------------------------------------------------------------------------
  1.0    (29 Oct 2014)
    * Initial release.
===============================================================================}

unit RadiantMediaPlayerConfigForm;

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
  FMX.Controls.Presentation,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Colors,
  FMX.Objects,
  FMX.TabControl,
  FMX.Layouts,
  Radiant.Shapes;

type
  TfrmConfiguration = class(TForm)
    btnOK: TButton;
    btnCancel: TButton;
    cbxButtonColor: TComboColorBox;
    cbxHighlightColor: TComboColorBox;
    optStockColors: TRadioButton;
    optCustomColors: TRadioButton;
    Label2: TLabel;
    Label3: TLabel;
    lytStockColors: TLayout;
    optColorScheme1: TRadioButton;
    optColorScheme2: TRadioButton;
    lytCustomColors: TLayout;
    rectScheme1Color: TRadiantRectangle;
    rectScheme1Highlight: TRadiantRectangle;
    rectScheme2Color: TRadiantRectangle;
    rectScheme2Highlight: TRadiantRectangle;
    optColorScheme3: TRadioButton;
    rectScheme3Color: TRadiantRectangle;
    rectScheme3Highlight: TRadiantRectangle;
    optColorScheme4: TRadioButton;
    rectScheme4Color: TRadiantRectangle;
    rectScheme4Highlight: TRadiantRectangle;
    procedure optStockColorsChange(Sender: TObject);
    procedure optCustomColorsChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SelectedButtonColor: TAlphaColor;
    SelectedHighlightColor: TAlphaColor;
  end;

var
  frmConfiguration: TfrmConfiguration;

implementation

{$R *.fmx}

uses
  RadiantMediaPlayerForm; // For style book reference

procedure TfrmConfiguration.btnOKClick(Sender: TObject);
begin
  if optStockColors.IsChecked then
  begin
    if optColorScheme1.IsChecked then
    begin
      SelectedButtonColor := rectScheme1Color.Fill.Color;
      SelectedHighlightColor := rectScheme1Highlight.Fill.Color;
    end
    else if optColorScheme2.IsChecked then
    begin
      SelectedButtonColor := rectScheme2Color.Fill.Color;
      SelectedHighlightColor := rectScheme2Highlight.Fill.Color;
    end
    else if optColorScheme3.IsChecked then
    begin
      SelectedButtonColor := rectScheme3Color.Fill.Color;
      SelectedHighlightColor := rectScheme3Highlight.Fill.Color;
    end
    else
    begin
      SelectedButtonColor := rectScheme4Color.Fill.Color;
      SelectedHighlightColor := rectScheme4Highlight.Fill.Color;
    end;
  end
  else // optCustomColors
  begin
    SelectedButtonColor := cbxButtonColor.Color;
    SelectedHighlightColor := cbxHighlightColor.Color;
  end;
end;


procedure TfrmConfiguration.optStockColorsChange(Sender: TObject);
begin
  lytCustomColors.Enabled := False;
  lytStockColors.Enabled := True;
end;

procedure TfrmConfiguration.optCustomColorsChange(Sender: TObject);
begin
  lytStockColors.Enabled := False;
  lytCustomColors.Enabled := True;
end;


end.
