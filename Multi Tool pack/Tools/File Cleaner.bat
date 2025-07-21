@echo off
title Express Clean by bas
setlocal enabledelayedexpansion
chcp 65001 >nul

REM -- Set ANSI Escape Sequence Variable --
for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
cls

REM -- Main Title --
echo %ESC%[1;92m==============================%ESC%[0m
echo %ESC%[1;96m       EXPRESS CLEAN v1       %ESC%[0m
echo %ESC%[1;92m==============================%ESC%[0m
echo.

:menu
echo %ESC%[92m[1]%ESC%[0m %ESC%[1mDelete Temporary Files%ESC%[0m
echo %ESC%[92m[2]%ESC%[0m %ESC%[1mClear Recycle Bin%ESC%[0m
echo %ESC%[92m[3]%ESC%[0m %ESC%[1mRemove System Logs%ESC%[0m
echo %ESC%[92m[4]%ESC%[0m %ESC%[1mRun Windows Disk Cleanup%ESC%[0m
echo %ESC%[91m[Q]%ESC%[0m %ESC%[1mQuit%ESC%[0m
echo.

set /p choice=" %ESC%[1;93mSelect an option (1-4, Q): %ESC%[0m"
if /I "%choice%"=="1" goto TempFiles
if /I "%choice%"=="2" goto RecycleBin
if /I "%choice%"=="3" goto SystemLogs
if /I "%choice%"=="4" goto DiskCleanup
if /I "%choice%"=="Q" exit
goto menu

:TempFiles
echo.
echo %ESC%[93m[~] Deleting user temporary files...%ESC%[0m
del /f /s /q "%TEMP%\*" >nul 2>&1
del /f /s /q "%TMP%\*" >nul 2>&1
echo %ESC%[93m[~] Deleting system temporary files...%ESC%[0m
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1
echo %ESC%[92m[✓] Temporary files deleted.%ESC%[0m
pause
goto menu

:RecycleBin
echo.
echo %ESC%[93m[~] Emptying Recycle Bin...%ESC%[0m
powershell.exe -noprofile -command "Clear-RecycleBin -Force"
echo %ESC%[92m[✓] Recycle Bin emptied.%ESC%[0m
pause
goto menu

:SystemLogs
echo.
echo %ESC%[93m[~] Removing system logs...%ESC%[0m
del /f /s /q "C:\Windows\Logs\*" >nul 2>&1
del /f /s /q "C:\Windows\System32\LogFiles\*" >nul 2>&1
echo %ESC%[92m[✓] System logs removed.%ESC%[0m
pause
goto menu

:DiskCleanup
echo.
echo %ESC%[93m[~] Launching Windows Disk Cleanup...%ESC%[0m
start cleanmgr
pause
goto menu
