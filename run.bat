@echo off
setlocal enabledelayedexpansion

where python >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo Python introuvable !
    exit /b 1
)

where node >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo Node.js introuvable !
    exit /b 1
)

where gcc >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo GCC introuvable !
    exit /b 1
)

where ruby >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo Ruby introuvable !
    exit /b 1
)

python languages\hello_python.py
if %ERRORLEVEL% neq 0 (
    echo Erreur lors de l'execution de hello_python.py
    exit /b 1
)

node languages\hello_javascript.js
if %ERRORLEVEL% neq 0 (
    echo Erreur lors de l'execution de hello_javascript.js
    exit /b 1
)

gcc.exe languages\hello_c.c -o languages\hello_c.exe
if %ERRORLEVEL% neq 0 (
    echo Erreur lors de la compilation de hello_c.c
    exit /b 1
)

languages\hello_c.exe
if %ERRORLEVEL% neq 0 (
    echo Erreur lors de l'execution de hello_c.exe
    exit /b 1
)

bash.exe languages/hello_bash.sh

ruby languages\hello_ruby.rb
if %ERRORLEVEL% neq 0 (
    echo Erreur lors de l'execution de hello_ruby.rb
    exit /b 1
)


npx electron .
if %ERRORLEVEL% neq 0 (
    echo Erreur lors du lancement d'Electron
    exit /b 1
)
