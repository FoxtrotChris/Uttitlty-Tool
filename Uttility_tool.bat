@echo off
color 4
set local
title Utillity Tool
:menu
cls
echo ===========================================
echo      Sytem Stuff Made by Chris
echo ===========================================
echo 1. Show your system information
echo 2. Show your IP Address
echo 3. Start up google chrome
echo 4. Delete Any File (broken)
echo 5. Directory Stuff Idk (broken)
echo 6. Exit
set /p choice="Choose an Option (1-5): "

if %choice%==1 goto sys_info
if %choice%==2 goto ip_info
if %choice%==3 goto chrome_start
if %choice%==4 goto Delete
if %choice%==5 goto dir
if %choice%==6 goto Exit

goto  menu

:sys_info
cls
echo ======================================
echo    Your Goofy System information
echo ======================================
systeminfo | findstr /B /C:"OS" /C:"System Manufacturer" /C:"System Model"
pause
goto menu

:ip_info
cls
echo ===========================================
echo              Your IP Brotha
echo ===========================================
ipconfig | findstr /R /C:"IPv4 Address"
pause
goto menu

:chrome_start
cls
echo ===========================================
echo          Start up Google chrome
echo ===========================================
start chrome.exe
pause
goto menu

:Exit
cls
echo Adios
timeout /t 1 >nul
exit

:dir
cls
REM Function to add timestamp to .txt files

setlocal enabledelayedexpansion
for %%F in (*.txt) do (
    REM Get current date and time in YYYYMMDD_HHMMSS format
    for /f "tokens=1-4 delims=/ " %%A in ('date /t') do set datestamp=%%C%%A%%B
    for /f "tokens=1-2 delims=: " %%A in ('time /t') do set timestamp=%%A%%B
    set newname=%%~nF_!datestamp!_!timestamp!%%~xF

    REM Rename the file
    ren "%%F" "!newname!"

    echo Renamed "%%F" to "!newname!"
)
pause
goto menu
