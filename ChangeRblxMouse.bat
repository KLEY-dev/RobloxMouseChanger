@echo off

::start menu
:start
cls
::default rblx folder
SET scriptpath=%~dp0
::"%mypath:~0,-1%"
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



:menu
cls
echo:

:: display settings
echo versions folder: %version%
echo rblx folder: %rblxfolder%
echo crosshair path: %crosshair%
echo cursor path: %cursor%


echo:

::color--[[
md tempFolder
cd tempFolder
echo .>"[1] Change cursor"
findstr /A:0B /S "." "[1] Change cursor"
echo .>"[2] Change crosshair"
findstr /A:0B /S "." "[2] Change crosshair"
echo .>"[3] Change all automaticly"
findstr /A:02 /S "." "[3] Change all automaticly"
echo .>"[4] Leave"
findstr /A:0C /S "." "[4] Leave"
echo:
 
cd ..
rd /S /Q tempFolder
::]]--color



::choice menu
set /p choice="number of option: "
if %choice%==3 goto automatic
if %choice%==4 goto leave

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




:automatic
cls
echo:

:: replace files
xcopy /Y /F "%scriptpath%cursors\auto\ArrowCursor.png" %cursor%\ArrowCursor.png
xcopy /Y /F "%scriptpath%cursors\auto\ArrowFarCursor.png" %cursor%\ArrowFarCursor.png
xcopy /Y /F "%scriptpath%cursors\auto\IBeamCursor.png" %cursor%\IBeamCursor.png

xcopy /Y /F "%scriptpath%crosshairs\auto\MouseLockedCursor.png" %crosshair%\MouseLockedCursor.png

echo:

::color--[[
md tempFolder
cd tempFolder

echo .>"Automatic change successful"
findstr /A:02 /S "." "Automatic change successful

cd ..
rd /S /Q tempFolder
::]]--color

echo:
echo:
pause
goto menu


:leave
cls
color C
echo Thx for using this program.
timeout 1 > nul
exit

pause > nul
