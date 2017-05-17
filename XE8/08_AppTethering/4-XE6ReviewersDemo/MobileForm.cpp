//---------------------------------------------------------------------------

#include <fmx.h>
#pragma hdrstop

#include "MobileForm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TForm4 *Form4;
//---------------------------------------------------------------------------
__fastcall TForm4::TForm4(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm4::Button1Click(TObject *Sender)
{
   ShowMessage ("Hello, World");
}
//---------------------------------------------------------------------------
void __fastcall TForm4::Button3Click(TObject *Sender)
{
  TetheringAppProfile1->RunRemoteAction(
	TetheringManager1->RemoteProfiles->First(),
	"Action1");
}
//---------------------------------------------------------------------------
void __fastcall TForm4::TetheringManager1EndAutoConnect(TObject *Sender)
{
  Button3->Enabled = True;
  Button2->Text = TetheringManager1->RemoteProfiles->First().ProfileGroup;
}
//---------------------------------------------------------------------------

void __fastcall TForm4::Button2Click(TObject *Sender)
{
   TetheringManager1->AutoConnect();
}
//---------------------------------------------------------------------------

