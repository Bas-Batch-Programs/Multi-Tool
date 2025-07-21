@echo off
title Multi Tool by Bas
echo RUN AS ADMIN skip if already did
pause
chcp 65001 >nul

:: Enable ANSI escape codes
reg query HKCU\Console /v VirtualTerminalLevel >nul 2>&1 || reg add HKCU\Console /v VirtualTerminalLevel /t REG_DWORD /d 1 /f >nul

:: Save original directory
set "ORIG_DIR=%~dp0"
set "TOOLS_DIR=%ORIG_DIR%Tools"

:menu
cls
call :banner

<nul set /p="[38;5;39m"
echo  [1] Wifi Info: Uses netsh to show details about the network your connected to 
<nul set /p="[38;5;208m"
echo  [2] Wifi Reclaimer: Uses profiles to get passwords you were ever connected to  
<nul set /p="[38;5;196m"
echo  [3] Express Clean: Uses commands and Windows built-in cleaner 
<nul set /p="[38;5;39m"
echo  [4] Exit
<nul set /p="[0m"
echo.

set /p input=[1;93mChoose an Option: [0m

if "%input%"=="1" (
echo Copyright By Bas DO NOT republish!
timeout /t 3 >nul
    call :runTool "Network Info.bat"
) else if "%input%"=="2" (
echo Copyright By Bas DO NOT republish!
timeout /t 3 >nul
    call :runTool "Password Reclaimer.bat"
) else if "%input%"=="3" (
echo Copyright By Bas DO NOT republish!
timeout /t 3 >nul
    call :runTool "File Cleaner.bat"
) else if "%input%"=="4" (
    echo Exiting...
    timeout /t 2 >nul
    exit /b
) else (
    echo Invalid option. Try again.
    timeout /t 1 >nul
    goto menu
)

:: Run a tool by filename
:runTool
cls
echo Running %~1...
if exist "%TOOLS_DIR%\%~1" (
    pushd "%TOOLS_DIR%"
    call "%~1"
    popd
) else (
    echo File not found: %~1 in Tools folder.
    timeout /t 2 >nul
)
goto menu

:: Banner
:banner
echo(
call :colorline 196 "██████╗  ██████╗ ██████╗ ████████╗ █████╗ ██████╗  █████╗  ██████╗██╗  ██╗"
call :colorline 202 "██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗██╔════╝██║ ██╔╝"
call :colorline 208 "██████╔╝██║   ██║██████╔╝   ██║   ███████║██████╔╝███████║██║     █████╔╝ "
call :colorline 214 "██╔═══╝ ██║   ██║██╔══██╗   ██║   ██╔══██║██╔═══╝ ██╔══██║██║     ██╔═██╗ "
call :colorline 220 "██║     ╚██████╔╝██║  ██║   ██║   ██║  ██║██║     ██║  ██║╚██████╗██║  ██╗"
call :colorline 226 "╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝  by Bas"
echo(
goto :eof

:colorline
<nul set /p="[38;5;%1m"
echo %~2
<nul set /p="[0m"
goto :eof
