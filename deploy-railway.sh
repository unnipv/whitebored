#!/bin/bash

echo "🚀 Deploying Digital Whiteboard to Railway..."
echo ""

# Check if Railway CLI is installed
if ! command -v railway &> /dev/null; then
    echo "📦 Installing Railway CLI..."
    npm install -g @railway/cli
fi

# Check if user is logged in
if ! railway whoami &> /dev/null; then
    echo "🔐 Please login to Railway..."
    railway login
fi

# Initialize project if needed
if [ ! -f "railway.json" ]; then
    echo "🎯 Initializing Railway project..."
    railway init
fi

# Deploy
echo "🚀 Deploying to Railway..."
railway up

echo ""
echo "✅ Deployment complete!"
echo ""
echo "🌐 Your whiteboard should be available at:"
echo "   https://your-app-name.railway.app"
echo ""
echo "📱 Access URLs:"
echo "   Control: https://your-app-name.railway.app"
echo "   Display: https://your-app-name.railway.app/display"
echo ""
echo "💡 Tip: Bookmark these URLs on your devices!" 