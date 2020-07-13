// ---------------------------------------------------------------------------

#include <fmx.h>

#include <System.Threading.hpp>    // TParallel::For
#include <System.Diagnostics.hpp>  // System::Diagnostics::TStopwatch
#include <System.SyncObjs.hpp>     // TInterlocked::Increment

#pragma hdrstop

#include "uMain.h"
// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TForm2 *Form2;

// ---------------------------------------------------------------------------
__fastcall TForm2::TForm2(TComponent* Owner) : TForm(Owner) {
}

// ---------------------------------------------------------------------------
bool __fastcall TForm2::IsPrime(int N) {
	int Test, k;
	bool aPrime;
	if (N <= 3) {
		return N > 1;
	}
	else if (((N % 2) == 0) || ((N % 3) == 0)) {
		return false;
	}
	else {
		aPrime = true;
		k = (int)sqrt(N);
		Test = 5;
		while (Test <= k) {
			if (((N % Test) == 0) || ((N % (Test + 2)) == 0)) {
				aPrime = false;
				break; // jump out of the for loop
			}
			Test = Test + 6;
		}
		return aPrime;
	}
}

void __fastcall TForm2::btnForLoopClick(TObject *Sender) {
	int Max = 5000000; // 5 Million
	Tot = 0;
	System::Diagnostics::TStopwatch sw =
		System::Diagnostics::TStopwatch::Create();
	sw.Start();
	for (int I = 1; I <= Max; I++) {
		if (IsPrime(I)) {
			Tot++;
		}
	}
	sw.Stop();
	Memo1->Lines->Add
		(String().sprintf
		(L"Sequential For loop. Time (in milliseconds): %lld, Primes found: %lld",
		sw.ElapsedMilliseconds, Tot));
}

// ---------------------------------------------------------------------------
// Parallel For Iterator Event Proc
void __fastcall TForm2::MyIteratorEvent(TObject* Sender, int AIndex) {
	// The Iterator Event implementation code is as follows.
	// In C++ you create an Iterator event function or C++11 lambda and
	// pass that as part of the TParallel::For loop call.
	//
	// Within parallel loops, you must transform your operations into thread-safe operations.
	// Here we use a member of the RTL System.SyncObjs header, the TInterlocked method.
	if (IsPrime(AIndex)) {
		TInterlocked::Increment(Tot);
	}
}

// Button event handler that finds prime numbers using the Parallel::For method
void __fastcall TForm2::btnParallelLoopClick(TObject *Sender) {
	int Max = 5000000; // 5 Million
	Tot = 0;
	System::Diagnostics::TStopwatch sw =
		System::Diagnostics::TStopwatch::Create();
	sw.Start();

	// In C++, the IsPrime function passes to the TParallel.For as an Iterator Event.
	TParallel::For(NULL, 1, Max, MyIteratorEvent);

	// Second option is to use a C++11 Lambda for the Parallel::For

/*
    	TParallel::For(NULL, 1, Max, System::Sysutils::_di_TProc__1<int>(
    		// [this] (int AIndex) {
    		[&](int AIndex) {
    		if (IsPrime(AIndex)) {TInterlocked::Increment(Tot);};}));
*/

	sw.Stop();
	Memo1->Lines->Add
		(String().sprintf
		(L"Parallel For loop.      Time (in milliseconds): %lld, Primes found: %lld",
		sw.ElapsedMilliseconds, Tot));
}
// ---------------------------------------------------------------------------
