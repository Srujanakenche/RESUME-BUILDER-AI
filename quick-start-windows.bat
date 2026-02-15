@echo off
setlocal enabledelayedexpansion

:: AI Resume Builder - Quick Fix and Start Script for Windows
:: This script helps diagnose and fix common configuration issues

color 0B
title AI Resume Builder - Setup and Start

echo.
echo ================================================================
echo    AI RESUME BUILDER - Quick Setup and Start
echo ================================================================
echo.

:: Check if we're in the right directory
if not exist "backend" (
    echo [ERROR] Cannot find 'backend' folder!
    echo Please run this script from the fullstack-resume-builder directory
    echo.
    pause
    exit /b 1
)

:: Check if .env exists in backend
if not exist "backend\.env" (
    echo [WARN] backend\.env file not found!
    echo.
    echo Creating .env from template...
    
    if exist "backend\.env.example" (
        copy "backend\.env.example" "backend\.env" >nul
        echo [OK] Created backend\.env from .env.example
    ) else (
        echo [ERROR] No .env.example found. Creating basic .env...
        (
            echo # Server Configuration
            echo PORT=5001
            echo NODE_ENV=development
            echo.
            echo # Frontend URL
            echo FRONTEND_URL=http://localhost:3000
            echo.
            echo # MongoDB - UPDATE THIS!
            echo MONGO_URI=mongodb://localhost:27017/resume-builder
            echo.
            echo # JWT Secret
            echo JWT_SECRET=your_super_secret_jwt_key_change_this_in_production_2024
            echo.
            echo # OpenAI API Key - UPDATE THIS!
            echo OPENAI_API_KEY=sk-your-openai-api-key-here
        ) > "backend\.env"
        echo [OK] Created basic .env file
    )
    echo.
    echo ================================================================
    echo IMPORTANT: You need to update backend\.env with:
    echo   1. Your OpenAI API key from https://platform.openai.com/api-keys
    echo   2. Your MongoDB connection string
    echo ================================================================
    echo.
    echo Press any key to open .env file for editing...
    pause >nul
    notepad "backend\.env"
    echo.
    echo After updating .env, press any key to continue...
    pause >nul
)

:: Check Node.js installation
echo [INFO] Checking Node.js installation...
node --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Node.js is not installed!
    echo Please install Node.js from https://nodejs.org/
    echo Recommended version: 18.x or higher
    pause
    exit /b 1
)
for /f "tokens=*" %%i in ('node --version') do set NODE_VERSION=%%i
echo [OK] Node.js !NODE_VERSION! detected
echo.

:: Check if backend dependencies are installed
echo [INFO] Checking backend dependencies...
if not exist "backend\node_modules" (
    echo [WARN] Backend dependencies not installed
    echo [INFO] Installing backend dependencies...
    cd backend
    call npm install
    if errorlevel 1 (
        echo [ERROR] Failed to install backend dependencies
        cd ..
        pause
        exit /b 1
    )
    cd ..
    echo [OK] Backend dependencies installed
) else (
    echo [OK] Backend dependencies already installed
)
echo.

:: Check if frontend dependencies are installed
echo [INFO] Checking frontend dependencies...
if not exist "node_modules" (
    echo [WARN] Frontend dependencies not installed
    echo [INFO] Installing frontend dependencies...
    call npm install
    if errorlevel 1 (
        echo [ERROR] Failed to install frontend dependencies
        pause
        exit /b 1
    )
    echo [OK] Frontend dependencies installed
) else (
    echo [OK] Frontend dependencies already installed
)
echo.

:: Configuration validation
echo ================================================================
echo CONFIGURATION CHECK
echo ================================================================
echo.

:: Read and check .env file
set MONGO_CONFIGURED=0
set OPENAI_CONFIGURED=0
set MONGO_HAS_PLACEHOLDER=0
set OPENAI_HAS_PLACEHOLDER=0

for /f "usebackq tokens=1,* delims==" %%a in ("backend\.env") do (
    set "line=%%a"
    set "value=%%b"
    
    if "!line!"=="MONGO_URI" (
        if not "!value!"=="" (
            set MONGO_CONFIGURED=1
            echo !value! | findstr /C:"<db_password>" >nul
            if not errorlevel 1 set MONGO_HAS_PLACEHOLDER=1
        )
    )
    
    if "!line!"=="OPENAI_API_KEY" (
        if not "!value!"=="" (
            set OPENAI_CONFIGURED=1
            echo !value! | findstr /C:"sk-your-openai-api-key-here" >nul
            if not errorlevel 1 set OPENAI_HAS_PLACEHOLDER=1
        )
    )
)

set ISSUES=0

if !MONGO_CONFIGURED!==1 (
    if !MONGO_HAS_PLACEHOLDER!==1 (
        echo [WARN] MongoDB URI contains placeholder ^<db_password^>
        echo        Replace it with your actual MongoDB password
        set /a ISSUES+=1
    ) else (
        echo [OK] MongoDB URI configured
    )
) else (
    echo [WARN] MongoDB URI not found in .env
    set /a ISSUES+=1
)

if !OPENAI_CONFIGURED!==1 (
    if !OPENAI_HAS_PLACEHOLDER!==1 (
        echo [WARN] OpenAI API key is placeholder value
        echo        Get your key from https://platform.openai.com/api-keys
        set /a ISSUES+=1
    ) else (
        echo [OK] OpenAI API key configured
    )
) else (
    echo [WARN] OpenAI API key not found in .env
    set /a ISSUES+=1
)

echo.

if !ISSUES! GTR 0 (
    echo ================================================================
    echo [WARN] Found !ISSUES! configuration issue(s)
    echo ================================================================
    echo.
    echo You can:
    echo   1. Continue anyway (some features may not work)
    echo   2. Edit .env file now
    echo   3. Exit and fix manually
    echo.
    choice /C 123 /N /M "Choose [1/2/3]: "
    
    if errorlevel 3 exit /b 0
    if errorlevel 2 (
        notepad "backend\.env"
        echo.
        echo After updating .env, press any key to continue...
        pause >nul
    )
)

:: Kill any existing processes on ports 3000 and 5001
echo.
echo [INFO] Checking for processes using ports 3000 and 5001...

for /f "tokens=5" %%a in ('netstat -ano ^| findstr ":3000" ^| findstr "LISTENING"') do (
    echo [INFO] Killing process on port 3000 (PID: %%a^)
    taskkill /F /PID %%a >nul 2>&1
)

for /f "tokens=5" %%a in ('netstat -ano ^| findstr ":5001" ^| findstr "LISTENING"') do (
    echo [INFO] Killing process on port 5001 (PID: %%a^)
    taskkill /F /PID %%a >nul 2>&1
)

echo.
echo ================================================================
echo STARTING SERVICES
echo ================================================================
echo.

:: Start backend
echo [INFO] Starting backend server on port 5001...
start "Backend Server" cmd /k "cd backend && npm start"
timeout /t 3 /nobreak >nul

:: Start frontend
echo [INFO] Starting frontend server on port 3000...
start "Frontend Server" cmd /k "npm run dev"

echo.
echo ================================================================
echo [OK] Services starting!
echo ================================================================
echo.
echo Backend:  http://localhost:5001
echo Frontend: http://localhost:3000
echo.
echo Two command windows should have opened:
echo   1. Backend Server (port 5001)
echo   2. Frontend Server (port 3000)
echo.
echo Wait 10-15 seconds for services to fully start, then:
echo   - Visit http://localhost:3000 in your browser
echo   - Try the resume builder features
echo.
echo If you see "AI temporarily unavailable":
echo   1. Check if backend server started successfully
echo   2. Verify your .env configuration
echo   3. See AI_CONNECTION_FIX.md for detailed help
echo.
echo Press any key to exit this window...
pause >nul
