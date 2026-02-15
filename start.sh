#!/bin/bash

echo "🎨 AI Resume Builder - Setup & Start"
echo "===================================="
echo ""

# Check if node_modules exists
if [ ! -d "node_modules" ]; then
    echo "📦 Installing dependencies..."
    npm install
    echo ""
fi

# Check if .env.local exists
if [ ! -f ".env.local" ]; then
    echo "⚙️  Creating .env.local file..."
    cp .env.local.example .env.local
    echo "✅ .env.local created! You can add your OpenAI API key later."
    echo ""
fi

echo "🚀 Starting development server..."
echo "📍 Open http://localhost:3000 in your browser"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

npm run dev
