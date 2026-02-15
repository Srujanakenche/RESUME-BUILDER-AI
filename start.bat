@echo off
cls
echo ========================================
echo   AI Resume Builder - Setup and Start
echo ========================================
echo.

REM Check if Node.js is installed
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Node.js is not installed!
    echo.
    echo Please install Node.js from: https://nodejs.org/
    echo Download the LTS version and install it.
    echo.
    pause
    exit /b 1
)

echo [OK] Node.js is installed
node --version
npm --version
echo.

REM Check if node_modules exists
if not exist "node_modules\" (
    echo [INSTALL] Installing dependencies...
    echo This may take a few minutes on first run.
    echo.
    call npm install
    if %errorlevel% neq 0 (
        echo.
        echo [ERROR] Failed to install dependencies!
        echo.
        pause
        exit /b 1
    )
    echo.
    echo [OK] Dependencies installed successfully!
    echo.
) else (
    echo [OK] Dependencies already installed
    echo.
)

REM Check if .env.local exists
if not exist ".env.local" (
    echo [SETUP] Creating .env.local file...
    copy .env.local.example .env.local >nul
    echo [OK] .env.local created
    echo.
    echo NOTE: AI features are optional. The app works without an API key.
    echo To enable AI features, add your OpenAI key to .env.local
    echo.
)

echo ========================================
echo   Starting Development Server
echo ========================================
echo.
echo Server will start at: http://localhost:3000
echo.
echo Press Ctrl+C to stop the server
echo.

REM Start the dev server
call npm run dev
