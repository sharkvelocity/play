@echo off
TITLE Driver Backup Tool
echo Checking for administrator rights...

net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo Error: Please right-click this file and choose "Run as administrator".
    pause
    exit /b
)

:: Sets the destination folder dynamically to the current user's desktop
set "DEST=%USERPROFILE%\Desktop\DRIVERS_BAK"

echo Creating backup folder on Desktop...
if not exist "%DEST%" mkdir "%DEST%"

echo Exporting relevant third-party drivers...
dism /online /export-driver /destination:"%DEST%"

echo.
echo Backup complete! Your drivers are saved in %DEST%
pause
