@echo off
:start
echo ### IPv4 SETTINGS CHANGE ###
echo 1. SWITCH TO RGI
echo 2. SWITCH TO NORMAL
echo 3. EXIT
set /p choice=Enter your choice:
if %choice%==1 goto rgi
if %choice%==2 goto normal
if %choice%==3 goto end
echo %choice% is not valid, try again
echo.
goto start

:rgi
echo Applying IPv4 settings for RGI...
netsh interface ip set address "Wi-Fi" static *addr here* *mask here* *gateway here* 1
netsh interface ip set dns "Wi-Fi" static *dns here*
netsh int ip show config "Wi-Fi"
goto end

:normal
echo Applying IPv4 settings for normal internet access...
netsh interface ip set address "Wi-Fi" dhcp
netsh interface ip set dns "Wi-Fi" dhcp
netsh int ip show config "Wi-Fi"
goto end

:end
echo Goodbye!
pause