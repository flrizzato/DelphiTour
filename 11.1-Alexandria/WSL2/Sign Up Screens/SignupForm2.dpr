//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program SignupForm2;

uses
  System.StartUpCopy,
  FMX.Forms,
  uSignupFrame2 in 'uSignupFrame2.pas' {SignupFrame2: TFrame},
  uSignupForm2 in 'uSignupForm2.pas' {Form2Signup};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2Signup, Form2Signup);
  Application.Run;
end.
