@echo off
setlocal

:menu
cls
echo *** IP Geolocation Lookup ***
set /p ipAddress=Enter the IP address (or leave empty for your own IP): 

REM If the user does not enter an IP, use their own public IP
if "%ipAddress%"=="" (
    set "ipAddress="
)

echo Looking up location for IP: %ipAddress%
echo.

REM Call PowerShell to get geolocation information from ipinfo.io
powershell -Command "try { $response = Invoke-RestMethod -Uri 'https://ipinfo.io/%ipAddress%' -UseBasicParsing; $response | Format-List } catch { Write-Host 'Error retrieving geolocation data' }"

pause
goto menu
