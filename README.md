# Digital Whiteboard for Samsung Tab E

Transform your Samsung Tab E (with Lineage OS) into a utility display showing a to-do list and digital whiteboard, controlled remotely from your phone/laptop via web app.

## Features

- **Real-time whiteboard drawing** with multiple colors and brush sizes
- **Todo list management** with priority levels (High, Medium, Low)
- **Dual interface**: Control from phone/laptop, display on tablet
- **Theme switching** (Light, Dark, Blue, Green)
- **Touch support** for tablet interaction
- **Auto-save** functionality with file-based persistence
- **Responsive design** optimized for tablet displays

## Quick Start

### Prerequisites
- Node.js (v14 or higher)
- Samsung Tab E with Lineage OS (or any Android tablet)
- All devices on the same local network

### Installation

1. **Clone the repository**:
   ```bash
   git clone <your-repo-url>
   cd whitebored
   ```

2. **Install dependencies**:
   ```bash
   npm install
   ```

3. **Start the server**:
   ```bash
   npm start
   ```

4. **Access the interfaces**:
   - **Control Interface** (phone/laptop): `http://YOUR_MAC_IP:3000`
   - **Display Interface** (tablet): `http://YOUR_MAC_IP:3000/display.html`

### Finding Your Mac's IP Address

```bash
# On macOS
ifconfig | grep "inet " | grep -v 127.0.0.1

# Or use System Preferences > Network
```

## Usage

### Setting Up Your Tablet
1. Open a web browser on your Samsung Tab E
2. Navigate to `http://YOUR_MAC_IP:3000/display.html`
3. **Recommended**: Add to home screen for full-screen experience
4. Keep the tablet plugged in and set screen timeout to "Never"

### Control Interface
- **Mode Switching**: Toggle between Whiteboard and Todo modes
- **Drawing**: Select colors, brush sizes, and draw on the canvas
- **Todo Management**: Add tasks with priority levels, mark complete, delete
- **Themes**: Change display appearance

## Local Network Setup

### For Best Performance:
- Connect all devices to the same WiFi network
- Use 5GHz WiFi if available for better performance
- Consider using ethernet for your Mac if possible

### Firewall Settings (macOS):
If you can't connect from other devices:
1. Go to System Preferences > Security & Privacy > Firewall
2. Click "Firewall Options"
3. Allow incoming connections for Node.js or disable firewall temporarily

## Raspberry Pi Migration (Recommended)

For a dedicated 24/7 solution, consider moving to a Raspberry Pi:

### Recommended Hardware:
- **Raspberry Pi 5 (8GB)** - Latest and most powerful
- **64GB MicroSD Card (Class 10)**
- **Official Pi 5 Power Supply**
- **Case with cooling**

### Benefits:
- Always-on operation (low power ~5-10W)
- Local network speed
- Dedicated device
- Cost-effective long-term solution

## File Structure

```
whitebored/
├── server.js              # Main server file
├── package.json           # Dependencies and scripts
├── public/
│   ├── control.html       # Control interface
│   ├── display.html       # Display interface
│   └── style.css          # Shared styles
├── whiteboard-data.json   # Auto-generated data file
└── README.md
```

## Troubleshooting

### Connection Issues
- Ensure all devices are on the same network
- Check firewall settings on your Mac
- Verify the IP address is correct
- Try restarting the server: `npm start`

### Performance Issues
- Use 5GHz WiFi for better performance
- Close other applications on the tablet
- Ensure tablet is plugged in to prevent CPU throttling

### Data Persistence
- Data is automatically saved to `whiteboard-data.json`
- Backup this file to preserve your drawings and todos
- File is saved every 30 seconds automatically

## Development

### Available Scripts
- `npm start` - Start the production server
- `npm run dev` - Start with nodemon for development

### Port Configuration
Default port is 3000. To change:
```bash
PORT=8080 npm start
```

## License

MIT License - feel free to modify and use for your projects!

---

**Enjoy your new digital whiteboard! 🎨📝** 