//---------------------------------------------------------------------------

#ifndef uMainH
#define uMainH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <FMX.Controls.hpp>
#include <FMX.Forms.hpp>
#include <FMX.Controls.Presentation.hpp>
#include <FMX.StdCtrls.hpp>
#include <FMX.Types.hpp>
#include <FMX.Memo.hpp>
#include <FMX.ScrollBox.hpp>
//---------------------------------------------------------------------------
class TForm2 : public TForm
{
__published:	// IDE-managed Components
	TButton *btnForLoop;
	TToolBar *ToolBar1;
	TLabel *Label1;
	TButton *btnParallelLoop;
	TMemo *Memo1;
    bool __fastcall IsPrime(int N);
	void __fastcall btnForLoopClick(TObject *Sender);
	void __fastcall btnParallelLoopClick(TObject *Sender);
private:	// User declarations
	void __fastcall MyIteratorEvent(TObject* Sender, int AIndex);
public:		// User declarations
	__fastcall TForm2(TComponent* Owner);
    int Tot;
};
//---------------------------------------------------------------------------
extern PACKAGE TForm2 *Form2;
//---------------------------------------------------------------------------
#endif
