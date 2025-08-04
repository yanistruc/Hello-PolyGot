@echo off
setlocal enabledelayedexpansion

where python >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Python introuvable dans le PATH
    exit /b 1
)

where node >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Node.js introuvable dans le PATH
    exit /b 1
)

python languages\hello_python.py
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Erreur lors de l'exécution de hello_python.py
    exit /b 1
)

node languages\hello_javascript.js
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Erreur lors de l'exécution de hello_javascript.js
    exit /b 1
)

pause
