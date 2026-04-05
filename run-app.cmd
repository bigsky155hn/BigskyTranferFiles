@echo off
setlocal

set "APP_EXE=%~dp0publish\BigskyTranferFiles\BigskyTranferFiles.exe"

if not exist "%APP_EXE%" (
    echo App not found: %APP_EXE%
    echo Ensure the published package exists in publish\BigskyTranferFiles.
    exit /b 1
)

start "" "%APP_EXE%"
