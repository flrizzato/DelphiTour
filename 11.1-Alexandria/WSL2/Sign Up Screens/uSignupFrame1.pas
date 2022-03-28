//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uSignupFrame1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Effects, FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Layouts;

type
  TSignupFrame1 = class(TFrame)
    VertScrollBox1: TVertScrollBox;
    LogoBackgroundRect: TRectangle;
    LogoCenterLayout: TLayout;
    LogoText: TText;
    FormLayout: TLayout;
    FormBackgroundRect: TRectangle;
    NameEdit: TEdit;
    EmailEdit: TEdit;
    ConfirmPasswordEdit: TEdit;
    PasswordEdit: TEdit;
    SignupButton: TButton;
    FormShadowEffect: TShadowEffect;
    FooterSpaceLayout: TLayout;
    LogoImage: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
