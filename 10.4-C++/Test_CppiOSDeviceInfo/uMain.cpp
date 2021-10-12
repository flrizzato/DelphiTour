//---------------------------------------------------------------------------

#include <fmx.h>

#include <iOSapi.UIkit.hpp>  // iOS Device information

#pragma hdrstop

#include "uMain.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TForm2 *Form2;
//---------------------------------------------------------------------------
__fastcall TForm2::TForm2(TComponent* Owner)
	: TForm(Owner)
{
}

//---------------------------------------------------------------------------

void __fastcall TForm2::btnGetDeviceInfoClick(TObject *Sender)
{
	_di_UIDevice device = TUIDevice::Wrap(TUIDevice::OCClass->currentDevice());

	lbOSName->Text = lbOSName->Text.sprintf(L"OS Name: %s", device->systemName()->UTF8String());

	lbOSVersion->Text = lbOSVersion->Text.sprintf(L"OS Version: %s", device->systemVersion()->UTF8String());

	lbDeviceType->Text = lbDeviceType->Text.sprintf(L"Device Type: %s", device->model()->UTF8String());
}
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------


