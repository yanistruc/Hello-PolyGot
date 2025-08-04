@echo off
setlocal enabledelayedexpansion

where python >nul 2>nul
if %ERRORLEVEL% neq 0 exit /b 1

where node >nul 2>nul
if %ERRORLEVEL% neq 0 exit /b 1

python languages\hello_python.py
if %ERRORLEVEL% neq 0 exit /b 1

node languages\hello_javascript.js
if %ERRORLEVEL% neq 0 exit /b 1

start "" languages\hello_html.html

pause
