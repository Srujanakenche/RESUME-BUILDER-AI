@echo off
cls
echo ========================================
echo   AI Resume Builder - Full Stack
echo ========================================
echo.

REM Check if Node.js is installed
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Node.js is not installed!
    echo Please install from: https://nodejs.org/
    pause
    exit /b 1
)

REM Check if MongoDB is running
echo Checking MongoDB...
netstat -an | find "27017" >nul
if %errorlevel% neq 0 (
    echo.
    echo [WARNING] MongoDB might not be running on port 27017
    echo.
    echo If using local MongoDB, start it with: mongod
    echo If using MongoDB Atlas, make sure your connection string is correct in backend/.env
    echo.
    echo Press any key to continue anyway...
    pause >nul
)

echo.
echo ========================================
echo   Step 1: Setting up Backend
echo ========================================
echo.

cd backend

REM Check if .env exists
if not exist ".env" (
    echo Creating .env file...
    copy .env.example .env >nul
    echo.
    echo [IMPORTANT] Please edit backend/.env and add:
    echo - Your MongoDB connection string
    echo - Your JWT secret
    echo - Your OpenAI API key
    echo.
    pause
)

REM Install backend dependencies
if not exist "node_modules\" (
    echo Installing backend dependencies...
    call npm install
    echo.
)

echo Starting backend server...
start "Resume Builder Backend" cmd /k "npm run dev"

echo.
echo Backend started! Check the new window.
timeout /t 3 /nobreak >nul

cd ..

echo.
echo ========================================
echo   Step 2: Setting up Frontend
echo ========================================
echo.

REM Check if .env.local exists
if not exist ".env.local" (
    echo Creating .env.local file...
    copy .env.local.example .env.local >nul
    echo.
)

REM Install frontend dependencies
if not exist "node_modules\" (
    echo Installing frontend dependencies...
    call npm install
    echo.
)

echo Starting frontend server...
echo.
echo ========================================
echo   🚀 Starting Application
echo ========================================
echo.
echo Frontend will be available at: http://localhost:3000
echo Backend API at: http://localhost:5001
echo.
echo Press Ctrl+C to stop the servers
echo.

timeout /t 3 /nobreak >nul
start http://localhost:3000

call npm run dev
