@echo off
setlocal enabledelayedexpansion

REM Get the directory where this script is located
set "SCRIPT_DIR=%~dp0"
set "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"

REM Default argument if none provided
set "ARG=%~1"
if "%ARG%"=="" set "ARG="

REM Build the Docker image if it doesn't exist
docker build -t nutty-b64-converter "%SCRIPT_DIR%"

REM Create a temporary file to capture output
set "TEMP_FILE=%TEMP%\nutty-b64-output.txt"
set "CLIPBOARD_FILE=%TEMP%\nutty-b64-clipboard.txt"

REM Create temporary directory for clipboard file
set "CLIPBOARD_DIR=%TEMP%\nutty-b64-clipboard"
mkdir "%CLIPBOARD_DIR%" 2>nul

REM Run the container with volume mounts and capture output
docker run --rm ^
    -e CONTAINER_FILE_OUTPUT=1 ^
    -v "%SCRIPT_DIR%\lua:/app/lua" ^
    -v "%SCRIPT_DIR%\base64url:/app/base64url" ^
    -v "%CLIPBOARD_DIR%:/app/clipboard" ^
    nutty-b64-converter luatob64 %ARG% > "%TEMP_FILE%" 2>&1

REM Check if clipboard file was created and copy its content
if exist "%CLIPBOARD_DIR%\clipboard-content.txt" (
    powershell -Command "Set-Clipboard -Value (Get-Content '%CLIPBOARD_DIR%\clipboard-content.txt' -Raw)"
    echo Copied to clipboard successfully
    del "%CLIPBOARD_DIR%\clipboard-content.txt" 2>nul
) else (
    echo No clipboard content file found
)

REM Display the output (excluding clipboard status)
powershell -Command ^
    "$content = Get-Content '%TEMP_FILE%' -Raw;" ^
    "if ($content) {" ^
    "    $lines = $content -split '`n';" ^
    "    foreach ($line in $lines) {" ^
    "        if ($line -ne 'CLIPBOARD_FILE_WRITTEN') { Write-Host $line }" ^
    "    }" ^
    "} else {" ^
    "    Write-Host 'No content in output file'" ^
    "}"

REM If DEBUG environment variable is set, show full output
if "%DEBUG%"=="1" (
    echo.
    echo === Full Raw Output ===
    type "%TEMP_FILE%"
    echo.
    echo === Clipboard File Content ===
    if exist "%CLIPBOARD_DIR%\clipboard-content.txt" (
        type "%CLIPBOARD_DIR%\clipboard-content.txt"
    ) else (
        echo No clipboard file found
    )
)

REM Clean up temp files and directories
del "%TEMP_FILE%" 2>nul
del "%CLIPBOARD_FILE%" 2>nul
rmdir "%CLIPBOARD_DIR%" 2>nul
