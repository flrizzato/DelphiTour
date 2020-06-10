//---------------------------------------------------------------------------
// Copyright (c) 2016 Embarcadero Technologies, Inc. All rights reserved.  
//
// This software is the copyrighted property of Embarcadero Technologies, Inc. 
// ("Embarcadero") and its licensors. You may only use this software if you 
// are an authorized licensee of Delphi, C++Builder or RAD Studio 
// (the "Embarcadero Products").  This software is subject to Embarcadero's 
// standard software license and support agreement that accompanied your 
// purchase of the Embarcadero Products and is considered a Redistributable, 
// as such term is defined thereunder. Your use of this software constitutes 
// your acknowledgement of your agreement to the foregoing software license 
// and support agreement. 
//---------------------------------------------------------------------------
unit MainFrm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.MultiView, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, FMX.Edit, FMX.EditBox,
  FMX.SpinBox, Data.Bind.Components;

type
  TForm3 = class(TForm)
    MultiView1: TMultiView;
    butConfig: TSpeedButton;
    butOP1: TSpeedButton;
    butOP3: TSpeedButton;
    butOP4: TSpeedButton;
    butOP2: TSpeedButton;
    StyleBook1: TStyleBook;
    TrackBar1: TTrackBar;
    ProgressBar1: TProgressBar;
    BindingsList1: TBindingsList;
    LinkControlToPropertyValue: TLinkControlToProperty;
    Switch1: TSwitch;
    SpinBox1: TSpinBox;
    CheckBox1: TCheckBox;
    procedure CloseNavigationPane(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}

procedure TForm3.CloseNavigationPane(Sender: TObject);
begin
  MultiView1.HideMaster;
end;

end.
