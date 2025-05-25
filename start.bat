@echo off
title Digital Whiteboard Server

echo 🎨 Starting Digital Whiteboard Server...
echo.

REM Check if Node.js is installed
node --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Node.js is not installed. Please install Node.js first.
    echo    Visit: https://nodejs.org/
    pause
    exit /b 1
)

REM Check if dependencies are installed
if not exist "node_modules" (
    echo 📦 Installing dependencies...
    npm install
    echo.
)

REM Get local IP address
echo 🌐 Network Information:
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4 Address"') do (
    set LOCAL_IP=%%a
    goto :found_ip
)
:found_ip
set LOCAL_IP=%LOCAL_IP: =%

echo    Local IP: %LOCAL_IP%
echo    Port: 3000
echo.
echo 📱 Access URLs:
echo    Control Interface (Phone/Laptop): http://%LOCAL_IP%:3000
echo    Display Interface (Samsung Tab E): http://%LOCAL_IP%:3000/display
echo.
echo 🚀 Starting server...
echo    Press Ctrl+C to stop
echo.

REM Start the server
npm start

pause 