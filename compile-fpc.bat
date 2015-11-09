set name=MyStrategy

if not exist %name%.pas (
    echo Unable to find %name%.pas > compilation.log
    exit 1
)

del /F /Q %name%.exe

fpc.exe -dONLINE_JUDGE -Cs67107839 -Mdelphi -XS Runner.dpr -o%name%.exe 1>compilation.log

if exist Runner.exe (
    move /Y Runner.exe %name%.exe
)
