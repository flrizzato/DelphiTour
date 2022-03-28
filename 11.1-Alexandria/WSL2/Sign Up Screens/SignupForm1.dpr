//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program SignupForm1;

uses
  System.StartUpCopy,
  FMX.Forms,
  uSignupForm1 in 'uSignupForm1.pas' {Form1Signup},
  uSignupFrame1 in 'uSignupFrame1.pas' {SignupFrame1: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1Signup, Form1Signup);
  Application.Run;
end.
