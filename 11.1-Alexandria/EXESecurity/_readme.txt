To understand why DEP, ASLR and related stuff are important:
https://heimdalsecurity.com/blog/dep-data-execution-prevention-windows/
https://www.techtarget.com/searchsecurity/definition/address-space-layout-randomization-ASLR
https://heimdalsecurity.com/blog/what-is-buffer-overflow/

How to verify your binary flags:
https://github.com/NetSPI/PESecurity

Testing:
PS C:\DelphiTour\11.1\EXESecurity\AlienInvasion-1.11\Win64\Release> Import-Module ..\..\..\Get-PESecurity.psm1
PS C:\DelphiTour\11.1\EXESecurity\AlienInvasion-1.11\Win64\Release> Get-PESecurity -file .\AlienInvasion.exe


FileName         : C:\DelphiTour\11.1\EXESecurity\AlienInvasion-1.11\Win64\Release\AlienInvasion.exe
ARCH             : AMD64
DotNET           : False
ASLR             : True
DEP              : True
Authenticode     : False
StrongNaming     : N/A
SafeSEH          : N/A
ControlFlowGuard : False
HighentropyVA    : True