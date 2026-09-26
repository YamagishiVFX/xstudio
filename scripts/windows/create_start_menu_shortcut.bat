@echo off
setlocal

set "APP_DIR=%~dp0"
set "EXE_PATH=%APP_DIR%bin\xstudio.exe"
set "SHORTCUT_PATH=%APPDATA%\Microsoft\Windows\Start Menu\Programs\xSTUDIO.lnk"

if not exist "%EXE_PATH%" (
    echo xstudio.exe not found at "%EXE_PATH%".
    pause
    exit /b 1
)

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "$s = (New-Object -ComObject WScript.Shell).CreateShortcut('%SHORTCUT_PATH%');" ^
    "$s.TargetPath = '%EXE_PATH%';" ^
    "$s.WorkingDirectory = '%APP_DIR%bin';" ^
    "$s.IconLocation = '%EXE_PATH%';" ^
    "$s.Save()"

if %ERRORLEVEL% EQU 0 (
    echo Start Menu shortcut for xSTUDIO created.
) else (
    echo Failed to create Start Menu shortcut.
)

pause
