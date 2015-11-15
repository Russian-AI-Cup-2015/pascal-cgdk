set name=MyStrategy

if not exist %name%.pas (
    echo Unable to find %name%.pas > compilation.log
    exit 1
)

del /F /Q %name%.exe

if "%DELPHI7_HOME%" == "" (
    dcc32 -Q -DONLINE_JUDGE -cc Runner.dpr 1>compilation.log
) else (
    "%DELPHI7_HOME%\Bin\dcc32" -Q "-U%DELPHI7_HOME%\Bin" "-I%DELPHI7_HOME%\Bin" -DONLINE_JUDGE -cc Runner.dpr 1>compilation.log
)

if exist Runner.exe (
    move /Y Runner.exe %name%.exe
)
