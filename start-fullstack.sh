#!/bin/bash

echo "========================================"
echo "  AI Resume Builder - Full Stack"
echo "========================================"
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "[ERROR] Node.js is not installed!"
    echo "Please install from: https://nodejs.org/"
    exit 1
fi

# Check MongoDB
echo "Checking MongoDB..."
if ! nc -z localhost 27017 2>/dev/null; then
    echo ""
    echo "[WARNING] MongoDB might not be running on port 27017"
    echo ""
    echo "If using local MongoDB, start it with: mongod"
    echo "If using MongoDB Atlas, make sure your connection string is correct in backend/.env"
    echo ""
    read -p "Press Enter to continue anyway..."
fi

echo ""
echo "========================================"
echo "  Step 1: Setting up Backend"
echo "========================================"
echo ""

cd backend

# Check if .env exists
if [ ! -f ".env" ]; then
    echo "Creating .env file..."
    cp .env.example .env
    echo ""
    echo "[IMPORTANT] Please edit backend/.env and add:"
    echo "- Your MongoDB connection string"
    echo "- Your JWT secret"
    echo "- Your OpenAI API key"
    echo ""
    read -p "Press Enter to continue..."
fi

# Install backend dependencies
if [ ! -d "node_modules" ]; then
    echo "Installing backend dependencies..."
    npm install
    echo ""
fi

echo "Starting backend server in background..."
npm run dev &
BACKEND_PID=$!

sleep 3
cd ..

echo ""
echo "========================================"
echo "  Step 2: Setting up Frontend"
echo "========================================"
echo ""

# Check if .env.local exists
if [ ! -f ".env.local" ]; then
    echo "Creating .env.local file..."
    cp .env.local.example .env.local
    echo ""
fi

# Install frontend dependencies
if [ ! -d "node_modules" ]; then
    echo "Installing frontend dependencies..."
    npm install
    echo ""
fi

echo "Starting frontend server..."
echo ""
echo "========================================"
echo "  🚀 Application Running"
echo "========================================"
echo ""
echo "Frontend: http://localhost:3000"
echo "Backend: http://localhost:5001"
echo ""
echo "Press Ctrl+C to stop both servers"
echo ""

# Open browser (macOS)
if [[ "$OSTYPE" == "darwin"* ]]; then
    sleep 3 && open http://localhost:3000 &
fi

# Open browser (Linux with xdg-open)
if command -v xdg-open &> /dev/null; then
    sleep 3 && xdg-open http://localhost:3000 &
fi

# Trap Ctrl+C to kill both processes
trap "kill $BACKEND_PID; exit" INT

npm run dev
