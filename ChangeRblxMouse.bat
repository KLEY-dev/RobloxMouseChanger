@echo off

title Roblox Mouse Changer

::start menu
:start
cls
::default rblx folder
set scriptpath=%~dp0
::"%scriptpath%"

::change here if you have diffrent rblx location
set version=C:\Users\%USERNAME%\AppData\Local\Roblox\Versions\

C:
cd %version%

::user chose dictionary
for /D %%s in (*) do (

::if exist then it is rblx folder
if exist %%s\RobloxPlayerLauncher.exe (
set rblxfolder=%%s
)

)


color F

echo:

:: set paths
set crosshair=%version%\%rblxfolder%\content\textures
set cursor=%crosshair%\Cursors\KeyboardMouse
set clientSettings=%version%\%rblxfolder%


if "%1"=="auto" goto automatic

:menu
cls
echo:

::number to iterate files
set /A number=9

:: display settings
echo versions folder: %version%
echo rblx folder: %rblxfolder%


echo:

::color--[[
md tempFolder
cd tempFolder
echo .>"[0] Change fps limit"
findstr /A:0B /S "." "[0] Change fps limit"
echo .>"[1] Change cursor"
findstr /A:0B /S "." "[1] Change cursor"
echo .>"[2] Change crosshair"
findstr /A:0B /S "." "[2] Change crosshair"
echo .>"[3] Change all automaticly"
findstr /A:02 /S "." "[3] Change all automaticly"
echo .>"[4] Default"
findstr /A:08 /S "." "[4] Default"
echo .>"[5] Auto run on startup"
findstr /A:08 /S "." "[5] Auto run on startup"
echo .>"[6] Leave"
findstr /A:0C /S "." "[6] Leave"
echo:
 
cd ..
rd /S /Q tempFolder
::]]--color



::choice menu
set /p choice="number of option: "
if %choice%==0 goto fpsmax
if %choice%==1 goto cursor
if %choice%==2 goto crosshair
if %choice%==3 goto automatic
if %choice%==4 goto default
if %choice%==5 goto autorun
if %choice%==6 goto leave

::if user write something diffrent
echo:
echo:
::color--[[
md tempFolder
cd tempFolder

echo .>"Wrong Choice"
findstr /A:0C /S "." "Wrong Choice"
cd ..
rd /S /Q tempFolder
::]]--color

echo:
pause
goto menu






:crosshair
cls
echo:

setlocal ENABLEDELAYEDEXPANSION
::return folder name with number
for /D %%s in ("%scriptpath%crosshairs\*") do (
set /a number=number+1

for %%a in ("%%s") do set file!number!=[!number!] %%~nxa
for %%a in ("%%s") do echo [!number!] %%~nxa
)
echo:
set /p choice="number of crosshair: "
set file=!file%choice%!

:: if plr give wrong number
set file=%file:~5%
if %file%==~5 (
echo:
echo:

md tempFolder
cd tempFolder

echo .>"Wrong Choice"
findstr /A:0C /S "." "Wrong Choice"
cd ..
rd /S /Q tempFolder

echo:
pause
goto menu
)

cls

echo:

:: replace file
xcopy /Y /F "%scriptpath%crosshairs\%file%\MouseLockedCursor.png" %crosshair%\MouseLockedCursor.png

echo:
::color--[[
md tempFolder
cd tempFolder

echo .>"Change crosshair to %file% successful"
findstr /A:02 /S "." "Change crosshair to %file% successful"

cd ..
rd /S /Q tempFolder
::]]--color

endlocal


echo:
echo:
pause
goto menu







:cursor
cls
echo:

setlocal ENABLEDELAYEDEXPANSION
::return folder name with number
for /D %%s in ("%scriptpath%cursors\*") do (
set /a number=number+1

for %%a in ("%%s") do set file!number!=[!number!] %%~nxa
for %%a in ("%%s") do echo [!number!] %%~nxa
)
echo:
set /p choice="number of cursor: "
set file=!file%choice%!

:: if plr give wrong number
set file=%file:~5%
if %file%==~5 (
echo:
echo:

md tempFolder
cd tempFolder

echo .>"Wrong Choice"
findstr /A:0C /S "." "Wrong Choice"
cd ..
rd /S /Q tempFolder

echo:
pause
goto menu
)

cls

echo:

:: replace files
xcopy /Y /F "%scriptpath%cursors\%file%\ArrowCursor.png" %cursor%\ArrowCursor.png
xcopy /Y /F "%scriptpath%cursors\%file%\ArrowFarCursor.png" %cursor%\ArrowFarCursor.png
xcopy /Y /F "%scriptpath%cursors\%file%\IBeamCursor.png" %cursor%\IBeamCursor.png

echo:
::color--[[
md tempFolder
cd tempFolder

echo .>"Change cursor to %file% successful"
findstr /A:02 /S "." "Change cursor to %file% successful"

cd ..
rd /S /Q tempFolder
::]]--color

endlocal


echo:
echo:
pause
goto menu


:fpsmax
cls
echo:

::color--[[
md tempFolder
cd tempFolder
echo .>"Type fps number"
findstr /A:02 /S "." "Type fps number"
echo:
 
cd ..
rd /S /Q tempFolder
::]]--color


set /p fps=
set jsonData={"DFIntTaskSchedulerTargetFps": %fps%}


:: check if it is number
set /a varCheck=%fps%
if %varCheck% == %fps% (goto correctfpsnumber) else (goto wrongfpsnumber)

:wrongfpsnumber
::color--[[
md tempFolder
cd tempFolder
echo .>"Wrong number error"
findstr /A:0C /S "." "Wrong number error"
echo:
 
cd ..
rd /S /Q tempFolder
::]]--color

echo:

timeout 2 > nul
goto menu

:correctfpsnumber
cls
echo:
echo xd zcas zxgvasdg > "%scriptpath%ClientSettings\ClientAppSettings.json"

echo %jsonData% > "%scriptpath%ClientSettings\ClientAppSettings.json"
xcopy /Y /E /s /i "%scriptpath%ClientSettings" "%clientSettings%\ClientSettings"

echo:

::color--[[
md tempFolder
cd tempFolder

echo .>"Change fps limit to %fps% successful""
findstr /A:02 /S "." "Change fps limit to %fps% successful"

cd ..
rd /S /Q tempFolder
::]]--color

echo:
echo:
pause
goto menu

:default
cls
echo:

:: replace files
xcopy /Y /F "%scriptpath%cursors\default\ArrowCursor.png" %cursor%\ArrowCursor.png
xcopy /Y /F "%scriptpath%cursors\default\ArrowFarCursor.png" %cursor%\ArrowFarCursor.png
xcopy /Y /F "%scriptpath%cursors\default\IBeamCursor.png" %cursor%\IBeamCursor.png

xcopy /Y /F "%scriptpath%crosshairs\default\MouseLockedCursor.png" %crosshair%\MouseLockedCursor.png
xcopy /Y/E /s /i "%scriptpath%ClientSettings" "%clientSettings%\ClientSettings"

echo:

::color--[[
md tempFolder
cd tempFolder

echo .>"Return to default mouse successful"
findstr /A:02 /S "." "Return to default mouse successful"

cd ..
rd /S /Q tempFolder
::]]--color

echo:
echo:
pause
goto menu






:automatic
cls
echo:

:: replace files
xcopy /Y /F "%scriptpath%cursors\auto\ArrowCursor.png" %cursor%\ArrowCursor.png
xcopy /Y /F "%scriptpath%cursors\auto\ArrowFarCursor.png" %cursor%\ArrowFarCursor.png
xcopy /Y /F "%scriptpath%cursors\auto\IBeamCursor.png" %cursor%\IBeamCursor.png

xcopy /Y /F "%scriptpath%crosshairs\auto\MouseLockedCursor.png" %crosshair%\MouseLockedCursor.png

xcopy /Y /E /s /i "%scriptpath%ClientSettings" "%clientSettings%\ClientSettings"
echo:

::color--[[
md tempFolder
cd tempFolder

echo .>"Automatic change successful"
findstr /A:02 /S "." "Automatic change successful"

cd ..
rd /S /Q tempFolder
::]]--color

echo:
echo:

if "%1"=="auto" goto leave

pause
goto menu


:autorun
cls
cd %scriptpath%

echo:

echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\RobloxMouseChangerAutoRunner.lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "%scriptpath%\AutoChange.vbs" >> CreateShortcut.vbs
echo oLink.WorkingDirectory = "%scriptpath%" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs

echo:

::color--[[
md tempFolder
cd tempFolder
echo .>"Remember to run this again if you change this folder path"
findstr /A:02 /S "." "Remember to run this again if you change this folder path"
echo:
 
cd ..
rd /S /Q tempFolder
::]]--color

cd %version%

pause
goto menu


:leave
cls
color C
echo Thx for using this program :)


timeout 1 > nul
exit

pause > nul
