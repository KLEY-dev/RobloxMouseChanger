@echo off

set crosshair=C:\Users\%USERNAME%\AppData\Local\Roblox\Versions\version-da93e2c4e15845b1\content\textures
set mouse=%crosshair%\Cursors\KeyboardMouse

:start
cls
echo:
md tempFolder
cd tempFolder
echo .>"[1] Change cursor"
findstr /A:0B /S "." "[1] Change cursor"
echo .>"[2] Change crosshair"
findstr /A:0B /S "." "[2] Change crosshair"
echo .>"[3] Change all automaticly"
findstr /A:02 /S "." "[3] Change all automaticly"
echo:
 
cd ..
rd /S /Q tempFolder


timeout 1 > nul
set /p wybor="number of option: "
if %wybor%==1 goto start
if %wybor%==3 goto automatic


echo:
echo:
echo:
md tempFolder
cd tempFolder

echo .>"Something went wrong"
findstr /A:0C /S "." "Something went wrong
cd ..
rd /S /Q tempFolder

timeout 5
goto start




:automatic
cls
xcopy /Y /F cursors\auto\ArrowCursor.png %mouse%\ArrowCursor.png
xcopy /Y /F cursors\auto\ArrowFarCursor.png %mouse%\ArrowFarCursor.png
xcopy /Y /F cursors\auto\IBeamCursor.png %mouse%\IBeamCursor.png

xcopy /Y /F crosshairs\auto\MouseLockedCursor.png %crosshair%\MouseLockedCursor.png

echo:
md tempFolder
cd tempFolder

echo .>"Automatic change successful"
findstr /A:02 /S "." "Automatic change successful
cd ..
rd /S /Q tempFolder



pause > nul
