@echo off
setlocal ENABLEDELAYEDEXPANSION

:: CHECK FOR ADMIN PRIVILEGES
dism >nul 2>&1 || ( echo This script must be Run as Administrator. && pause && exit /b 1 )

:: DISABLE PRINTING DEVICES
devcon disable "=Printer" >nul 2>&1
devcon disable "=PrintQueue" >nul 2>&1

:: DISABLE PRINTING SERVICES
sc config Spooler start=disabled >nul 2>&1

:: DISABLE PRINTING FEATURES
dism /online /Disable-Feature /FeatureName:Printing-Foundation-InternetPrinting-Client >nul 2>&1
dism /online /Disable-Feature /FeatureName:Printing-Foundation-Features >nul 2>&1

echo Printing has been disabled.
pause

exit /b 0
