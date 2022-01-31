@echo off
call "D:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\VC\Auxiliary\Build\vcvarsall.bat" x86
"C:\Games\kursach\SVN-2021\Debug\SVN-2021.exe" -in:"C:\Games\kursach\SVN-2021\test.txt" -log:"C:\Games\kursach\SVN-2021\log.txt"
ml /c /coff /Zi "C:\Games\kursach\Generation\Generation\Gen.asm"
pause
link /OPT:NOREF /DEBUG /SUBSYSTEM:CONSOLE libucrt.lib Gen.obj
Gen.exe
pause