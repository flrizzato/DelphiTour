//---------------------------------------------------------------------------

#include <fmx.h>
#pragma hdrstop

#include <sysiterator.h>
#include <algorithm>
#include "STLIter_Form.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
	System::DynamicArray<int> a({10,20,30,40,50});

	System::DynamicArray<int>::iterator iter = a.begin();
	iter[0] = -30;

	Memo1->Lines->Add ("Initial");
	// Lambdas support is Clang-only
	// We can use functors in BCC
	std::for_each(a.begin(),a.end(),[this](int value){
		Memo1->Lines->Add (IntToStr (value));
	});

	std::random_shuffle(a.begin(),a.end());
	// std::sort(a.begin(),a.end());

    Memo1->Lines->Add ("");
	Memo1->Lines->Add ("Shuffled");
	std::for_each(a.begin(),a.end(),[this](int value){
		Memo1->Lines->Add (IntToStr (value));
	});
}
//---------------------------------------------------------------------------
