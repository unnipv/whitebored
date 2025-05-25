#!/bin/bash

# Digital Whiteboard Startup Script
echo "🎨 Starting Digital Whiteboard Server..."
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js first."
    echo "   Visit: https://nodejs.org/"
    exit 1
fi

# Check if dependencies are installed
if [ ! -d "node_modules" ]; then
    echo "📦 Installing dependencies..."
    npm install
    echo ""
fi

# Get local IP address
echo "🌐 Network Information:"
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    LOCAL_IP=$(ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}' | head -1)
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    LOCAL_IP=$(hostname -I | awk '{print $1}')
else
    # Windows/Other
    LOCAL_IP="localhost"
fi

echo "   Local IP: $LOCAL_IP"
echo "   Port: 3000"
echo ""
echo "📱 Access URLs:"
echo "   Control Interface (Phone/Laptop): http://$LOCAL_IP:3000"
echo "   Display Interface (Samsung Tab E): http://$LOCAL_IP:3000/display"
echo ""
echo "🚀 Starting server..."
echo "   Press Ctrl+C to stop"
echo ""

# Start the server
npm start 