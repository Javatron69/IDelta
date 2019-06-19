@echo off
title IDelta by DevDelta
color 0f

:: ================[ VARS ]================

:: Location to be checked (launcherMFolder)
set checkFor=%appdata%\.minecraft\mods\1.7.10\CodeChickenLib-1.7.10-1.1.1.99-universal.jar

:: File to be moved
set file=XRay.jar
:: Location for %file% to be moved
set injectLocation=%appdata%\.minecraft\mods\XRay.jar

:: Delay between %checkFor% deletion and %file% injection
:: (change it depending on your download speed & launcher speed)
set waitDelay=2


:: ================[ CODE ]================

if exist %checkFor% (
    goto :stage1
) else (
    echo Error with your installation.
	pause
	exit
)

:stage1

del /f %injectLocation%

:stage2
cls
if exist %checkFor% (
	echo Wating for deletion.
    goto :stage2
)
cls
echo Found.

PING localhost -n %waitDelay% >nul

echo xc process started
xcopy %file% %injectLocation%*
echo Done.
pause

:: ==============[ END CODE ]==============