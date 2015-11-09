set name=MyStrategy

if not exist %name%.pas (
    echo Unable to find %name%.pas > compilation.log
    exit 1
)

del /F /Q %name%.exe

dcc32 -Q -DONLINE_JUDGE -cc Runner.dpr 1>compilation.log

if exist Runner.exe (
    move /Y Runner.exe %name%.exe
)
