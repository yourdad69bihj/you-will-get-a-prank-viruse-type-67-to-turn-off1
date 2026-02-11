@echo off
title DADDY FOLDER FLOOD
color 0c
setlocal enabledelayedexpansion

:: SETTINGS
set "dt=%userprofile%\Desktop"
set "fname=daddy"

:start
cls
echo =========================================
echo       JORDAN'S DADDY FLOOD ACTIVE
echo =========================================
echo.
echo [!] 1000 FOLDERS GENERATING...
echo [!] ENTER 67 TO DELETE ALL FOLDERS
echo.

:: START THE FLOOD
for /L %%i in (1,1,1000) do (
    mkdir "%dt%\%fname%_%%i" >nul 2>&1
)

:input_wait
set /p userinput="STOP & DELETE KEY: "

if "%userinput%"=="67" (
    goto nuke
) else (
    echo [!] WRONG KEY - FOLDERS REMAIN.
    goto input_wait
)

:nuke
cls
echo [!] CLEANING UP DESKTOP...
echo.
cd /d "%dt%"

:: DELETES EVERY FOLDER STARTING WITH 'daddy'
for /d %%G in ("%fname%_*") do (
    rd /s /q "%%G"
    echo Deleted: %%G
)

echo.
echo =========================================
echo       DESKTOP CLEANED SUCCESSFULLY
echo =========================================
pause
exit