#!/bin/bash

# Digital Whiteboard Public Internet Access Script
echo "🌐 Starting Digital Whiteboard with Public Internet Access..."
echo ""

# Check if ngrok is installed
if ! command -v ngrok &> /dev/null; then
    echo "❌ ngrok is not installed. Please install it first:"
    echo "   brew install ngrok"
    exit 1
fi

# Start the Node.js server in background
echo "🎨 Starting local server..."
npm start &
SERVER_PID=$!

# Wait for server to start
sleep 3

# Start ngrok tunnel
echo "🚀 Creating public tunnel..."
echo "⏳ Please wait while ngrok establishes connection..."
echo ""

# Start ngrok and capture the output
ngrok http 3000 --log=stdout > ngrok.log 2>&1 &
NGROK_PID=$!

# Wait for ngrok to establish connection
sleep 5

# Extract the public URL from ngrok
PUBLIC_URL=$(curl -s http://localhost:4040/api/tunnels | grep -o '"public_url":"[^"]*' | grep https | cut -d'"' -f4)

if [ -z "$PUBLIC_URL" ]; then
    echo "❌ Failed to get ngrok URL. Checking ngrok status..."
    echo "Please check ngrok.log for details"
    kill $SERVER_PID $NGROK_PID 2>/dev/null
    exit 1
fi

echo "✅ Public URLs available:"
echo "   🌐 Control Interface: $PUBLIC_URL"
echo "   📱 Display Interface: $PUBLIC_URL/display.html"
echo ""
echo "📋 Share these URLs with anyone, anywhere!"
echo "   • Control from any device: $PUBLIC_URL"
echo "   • Display on tablet: $PUBLIC_URL/display.html"
echo ""
echo "🔒 Security Note: These URLs are public but temporary"
echo "💡 Tip: Bookmark the display URL on your tablet"
echo ""
echo "Press Ctrl+C to stop both server and tunnel"
echo "=============================================="

# Function to cleanup on exit
cleanup() {
    echo ""
    echo "🛑 Stopping server and tunnel..."
    kill $SERVER_PID $NGROK_PID 2>/dev/null
    rm -f ngrok.log
    exit 0
}

# Set trap to cleanup on Ctrl+C
trap cleanup SIGINT

# Keep script running
wait 