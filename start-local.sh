#!/bin/bash

# Digital Whiteboard Local Startup Script
echo "🎨 Starting Digital Whiteboard Server..."

# Get local IP address
LOCAL_IP=$(ifconfig | grep "inet " | grep -v 127.0.0.1 | head -1 | awk '{print $2}')

echo "📡 Server will be available at:"
echo "   Control Interface: http://$LOCAL_IP:3000"
echo "   Display Interface: http://$LOCAL_IP:3000/display.html"
echo ""
echo "📱 On your Samsung Tab E, navigate to:"
echo "   http://$LOCAL_IP:3000/display.html"
echo ""
echo "🖥️  On your phone/laptop, navigate to:"
echo "   http://$LOCAL_IP:3000"
echo ""
echo "Press Ctrl+C to stop the server"
echo "----------------------------------------"

# Start the Node.js server
npm start 