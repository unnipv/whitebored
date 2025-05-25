# Digital Whiteboard for Samsung Tab E

Transform your Samsung Tab E into a smart utility display that shows your to-do list and acts as a digital whiteboard, controlled remotely from your phone and laptop.

## Features

### 🖥️ Display Modes
- **Whiteboard Mode**: Full-screen drawing canvas with real-time synchronization
- **Todo List Mode**: Clean, organized task display with priority indicators

### 📱 Remote Control
- **Web-based Control**: Access from any device with a web browser
- **Real-time Drawing**: Draw on your phone/laptop and see it instantly on the tablet
- **Todo Management**: Add, complete, and delete tasks remotely
- **Theme Control**: Switch between light, dark, blue, and green themes

### ✨ Smart Features
- **Priority System**: High, medium, and low priority tasks with color coding
- **Auto-sorting**: Tasks automatically sorted by completion status and priority
- **Touch Support**: Full touch support for mobile devices
- **Screen Wake Lock**: Keeps the tablet screen awake (when supported)
- **Responsive Design**: Works on phones, tablets, and desktops

## Setup Instructions

### Prerequisites
- Node.js (version 14 or higher)
- Your Samsung Tab E with Lineage OS (or any Android browser)
- All devices connected to the same WiFi network

### Installation

1. **Clone or download this project** to your computer
2. **Install dependencies**:
   ```bash
   npm install
   ```

3. **Start the server**:
   ```bash
   npm start
   ```
   
   For development with auto-restart:
   ```bash
   npm run dev
   ```

4. **Find your computer's IP address**:
   - **Windows**: Open Command Prompt and run `ipconfig`
   - **Mac/Linux**: Open Terminal and run `ifconfig` or `ip addr show`
   - Look for your local IP address (usually starts with 192.168.x.x or 10.x.x.x)

### Device Setup

#### Samsung Tab E (Display)
1. Open the web browser on your tablet
2. Navigate to: `http://YOUR_COMPUTER_IP:3000/display`
3. Bookmark this page for easy access
4. **Optional**: Set the browser to full-screen mode
5. **Optional**: Disable screen timeout in Android settings

#### Phone/Laptop (Control)
1. Open a web browser
2. Navigate to: `http://YOUR_COMPUTER_IP:3000`
3. Bookmark this page for easy access

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