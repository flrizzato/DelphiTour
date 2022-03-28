//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uSignupFrame3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Layouts;

type
  TSignupFrame3 = class(TFrame)
    VertScrollBox1: TVertScrollBox;
    BackgroundRect: TRectangle;
    LogoLayout: TLayout;
    LogoCenterLayout: TLayout;
    TitleLogoText: TText;
    LogoBackgroundRect: TRectangle;
    BackgroundGradientRect: TRectangle;
    SubtitleLogoText: TText;
    FormLayout: TLayout;
    UsernameEdit: TEdit;
    EmailEdit: TEdit;
    PasswordEdit: TEdit;
    RepeatPasswordEdit: TEdit;
    CreateAccountLayout: TLayout;
    OutlineRectangle: TRectangle;
    CreateAccountText: TText;
    CreateAccountRectBTN: TRectangle;
    LogoImage: TImage;
    procedure CreateAccountRectBTNClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TSignupFrame3.CreateAccountRectBTNClick(Sender: TObject);
begin
// Create Account Button Press Event
end;

end.
