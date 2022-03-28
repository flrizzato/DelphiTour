//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uSignupFrame2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Layouts;

type
  TSignupFrame2 = class(TFrame)
    VertScrollBox1: TVertScrollBox;
    BackgroundRect: TRectangle;
    LogoutLayout: TLayout;
    CenterLogoLayout: TLayout;
    LogoText: TText;
    FormLayout: TLayout;
    UsernameEdit: TEdit;
    EmailEdit: TEdit;
    PasswordEdit: TEdit;
    RepeatPasswordEdit: TEdit;
    SignupLayout: TLayout;
    SigninLayout: TLayout;
    AlreadyAccountText: TText;
    SignupRectBTN: TRectangle;
    SignUpButtonText: TText;
    SignInTextBTN: TText;
    BackgroundImage: TImage;
    CenterSigninLayout: TLayout;
    Image1: TImage;
    procedure SignupRectBTNClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TSignupFrame2.SignupRectBTNClick(Sender: TObject);
begin
// Signup Button Press Event
end;

end.
