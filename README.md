# Digital Whiteboard for Samsung Tab E

Transform your Samsung Tab E into a smart utility display that shows your to-do list and acts as a digital whiteboard, controlled remotely from your phone and laptop.

## Features

- **Whiteboard Mode**: Full-screen drawing canvas with real-time synchronization
- **Todo List Mode**: Clean, organized task display with priority indicators
- **Remote Control**: Control from any device with a web browser
- **Real-time Sync**: Draw on your phone, see it instantly on the tablet
- **Priority System**: High, medium, and low priority tasks with color coding
- **Theme Control**: Switch between light, dark, blue, and green themes
- **Touch Support**: Works on phones, tablets, and desktops

## Quick Start (Local)

1. **Install dependencies**: `npm install`
2. **Start server**: `npm start`
3. **Samsung Tab E**: Navigate to `http://YOUR_IP:3000/display`
4. **Phone/Laptop**: Navigate to `http://YOUR_IP:3000`

## Deploy to Railway (Free 24/7 Hosting)

For always-on access from anywhere:

1. **Push to GitHub**: Create a repository with this code
2. **Deploy to Railway**:
   - Go to [railway.app](https://railway.app)
   - Sign up with GitHub
   - Click "New Project" → "Deploy from GitHub repo"
   - Select your repository
   - Railway automatically deploys!

3. **Access URLs**:
   - **Control**: `https://your-app.railway.app`
   - **Display**: `https://your-app.railway.app/display`

### Samsung Tab E Setup
1. Bookmark: `https://your-app.railway.app/display`
2. Enable full-screen mode
3. Disable screen timeout
4. Set as homepage for auto-loading

## Usage Guide

### Getting Started
1. Start the server on your computer
2. Open the display page on your Samsung Tab E
3. Open the control page on your phone or laptop
4. You should see "Connected" status on both devices

### Whiteboard Mode
- **Drawing**: Select colors and brush sizes, then draw on the canvas
- **Real-time Sync**: Your drawings appear instantly on the tablet
- **Clear**: Use the "Clear Whiteboard" button to erase everything

### Todo List Mode
- **Add Tasks**: Type a task, select priority, and click "Add Task"
- **Complete Tasks**: Check the checkbox to mark tasks as complete
- **Delete Tasks**: Click the "Delete" button to remove tasks
- **Priority Colors**: 
  - 🔴 Red: High priority
  - 🟡 Orange: Medium priority
  - 🟢 Green: Low priority

### Theme Control
Switch between different display themes:
- **Light**: White background, black text
- **Dark**: Dark background, white text
- **Blue**: Blue background, white text
- **Green**: Green background, white text

## Network Configuration

### Same WiFi Network
All devices must be on the same WiFi network. The server runs on your computer and serves both the control and display interfaces.

### Port Configuration
The default port is 3000. To change it:
```bash
PORT=8080 npm start
```

### Firewall Settings
Make sure your computer's firewall allows incoming connections on port 3000 (or your chosen port).

## Advanced Setup

### Auto-start on Boot (Optional)
To automatically start the server when your computer boots:

#### Windows
1. Create a batch file `start-whiteboard.bat`:
   ```batch
   cd /d "C:\path\to\your\whiteboard\project"
   npm start
   ```
2. Add this batch file to your Windows startup folder

#### Mac/Linux
1. Create a shell script `start-whiteboard.sh`:
   ```bash
   #!/bin/bash
   cd /path/to/your/whiteboard/project
   npm start
   ```
2. Make it executable: `chmod +x start-whiteboard.sh`
3. Add to your system's startup applications

### Tablet Kiosk Mode (Optional)
For a more dedicated display experience:

1. **Install a kiosk browser** on your Samsung Tab E
2. **Set the display URL** as the homepage
3. **Enable auto-start** when the tablet boots
4. **Disable navigation bars** and other UI elements

### Alternative OS Options
While this works great with Lineage OS, you could also consider:
- **Ubuntu Touch**: For a full Linux experience
- **PostmarketOS**: Lightweight Linux for mobile devices
- **Keep Android**: The web app works fine with standard Android browsers too

## Troubleshooting

### Connection Issues
- **Check IP Address**: Make sure you're using the correct IP address
- **Firewall**: Ensure your computer's firewall isn't blocking the connection
- **Network**: Verify all devices are on the same WiFi network
- **Port**: Try a different port if 3000 is already in use

### Performance Issues
- **Close Other Apps**: Close unnecessary apps on the tablet for better performance
- **Reduce Drawing Complexity**: Very detailed drawings may cause lag
- **Check WiFi Signal**: Weak WiFi can cause delays in synchronization

### Browser Compatibility
- **Modern Browsers**: Works best with Chrome, Firefox, Safari, Edge
- **JavaScript**: Ensure JavaScript is enabled
- **WebSocket Support**: Required for real-time features

## Technical Details

### Architecture
- **Backend**: Node.js with Express and Socket.IO
- **Frontend**: Vanilla HTML, CSS, and JavaScript
- **Communication**: WebSocket for real-time synchronization
- **Storage**: In-memory (resets when server restarts)

### File Structure
```
whitebored/
├── server.js              # Main server file
├── package.json           # Dependencies and scripts
├── public/
│   ├── display.html       # Tablet display interface
│   └── control.html       # Phone/laptop control interface
└── README.md             # This file
```

### API Endpoints
- `GET /` - Control interface
- `GET /display` - Display interface
- `GET /api/state` - Current state (JSON)
- WebSocket events for real-time communication

## Contributing

Feel free to enhance this project! Some ideas:
- **Persistent Storage**: Add database support to save drawings and todos
- **User Authentication**: Support multiple users/rooms
- **Voice Control**: Add voice commands for hands-free operation
- **Calendar Integration**: Sync with Google Calendar or other services
- **Drawing Tools**: Add shapes, text, and more advanced drawing features

## License

MIT License - Feel free to use and modify as needed!

---

**Enjoy your new digital whiteboard! 🎨📝** 