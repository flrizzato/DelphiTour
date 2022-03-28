//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program SignupForm3;

uses
  System.StartUpCopy,
  FMX.Forms,
  uSignupFrame3 in 'uSignupFrame3.pas' {SignupFrame3: TFrame},
  uSignupForm3 in 'uSignupForm3.pas' {Form3Signup};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm3Signup, Form3Signup);
  Application.Run;
end.
