@echo off
title HLL Overlay Server
cd /d "%~dp0"
echo.

:: Check if installer left a python path hint
set PYTHON_EXE=python
if exist "%~dp0python_path.txt" (
    set /p PYTHON_EXE=<"%~dp0python_path.txt"
)

:: Add common Python locations to PATH as fallback
set "PATH=%LOCALAPPDATA%\Programs\Python\Python313;%LOCALAPPDATA%\Programs\Python\Python313\Scripts;%PATH%"
set "PATH=%LOCALAPPDATA%\Programs\Python\Python312;%LOCALAPPDATA%\Programs\Python\Python312\Scripts;%PATH%"
set "PATH=%LOCALAPPDATA%\Programs\Python\Python311;%LOCALAPPDATA%\Programs\Python\Python311\Scripts;%PATH%"
set "PATH=%LOCALAPPDATA%\Programs\Python\Python310;%LOCALAPPDATA%\Programs\Python\Python310\Scripts;%PATH%"
set "PATH=C:\Python313;C:\Python312;C:\Python311;C:\Python310;%PATH%"

:: Check if Python is installed
"%PYTHON_EXE%" --version >nul 2>&1
if errorlevel 1 (
python --version >nul 2>&1
if errorlevel 1 (
if errorlevel 1 (
    echo  ============================================================
    echo   ERROR: Python not found!
    echo  ============================================================
    echo.
    echo   HOW TO INSTALL PYTHON:
    echo.
    echo   1. Open your browser and go to:
    echo      https://www.python.org/downloads/
    echo.
    echo   2. Click the big yellow "Download Python" button
    echo.
    echo   3. Run the installer that downloads
    echo.
    echo   4. IMPORTANT: On the first screen of the installer,
    echo      tick the box that says "Add Python to PATH"
    echo      before clicking Install Now
    echo.
    echo   5. Once installed, close this window and
    echo      double-click start.bat again
    echo.
    echo  ============================================================
    pause
    exit
)

echo  ============================================================
echo   HLL OVERLAY SERVER
echo  ============================================================
echo   Hub:  http://localhost:3000
echo   Keep this window open while streaming.
echo  ============================================================
echo.

:: Start server then open browser after short delay
start /b cmd /c "timeout /t 2 /nobreak >nul && start "" http://localhost:3000"
"%PYTHON_EXE%" DO_NOT_EDIT_server.py
if errorlevel 1 python DO_NOT_EDIT_server.py
pause
