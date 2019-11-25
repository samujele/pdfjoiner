set file_path=%USERPROFILE%\Desktop\PRIJEPISI\
set cmd_path=%~dp0
set sourcedir=%~dp0
set targetdir=%userprofile%\Desktop\Prijepisi\Exe\
set txtdir=%file_path%Txt\
set exedir=%targetdir%
set cmd_path=%targetdir%

if not exist %targetdir% mkdir %targetdir%

xcopy "%sourcedir%*.*" %targetdir% /i /d /y /e

xcopy "%cmd_path%pdfjoin.cmd.lnk" %APPDATA%\Microsoft\Windows\SendTo /i /d /y /e


for /F "tokens=1,2,3 delims=_" %%i in ('PowerShell -Command "& {Get-Date -format "MM_dd_yyyy"}"') do (
    set MONTH=%%i
    set DAY=%%j
    set YEAR=%%k
)
echo %DAY%.%MONTH%.%YEAR%.

set mydate=%DAY%.%MONTH%.%YEAR%.
set myshortdate=%DAY%%MONTH%%YEAR%


FOR /f "tokens=1,2,3,4,5 delims= " %%A in ('echo y ^| time ^| findstr /R "current"') do (
set time=%%E
)

SET time=%time:,=%

SET time=%time::=%

SET time

SET output=pdfjoin_on_%myshortdate%%time%.pdf

echo %output%

echo %*

echo y | "%cmd_path%pdftk.exe" %*  cat output "%file_path%%output%"