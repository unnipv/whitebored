const express = require('express');
const http = require('http');
const socketIo = require('socket.io');
const cors = require('cors');
const bodyParser = require('body-parser');
const path = require('path');
const fs = require('fs');

const app = express();
const server = http.createServer(app);
const io = socketIo(server, {
  cors: {
    origin: "*",
    methods: ["GET", "POST"]
  }
});

// Middleware
app.use(cors());
app.use(bodyParser.json());
app.use(express.static('public'));

// Store current state
let whiteboardState = {
  drawings: [],
  todos: [],
  currentMode: 'todo', // 'whiteboard' or 'todo'
  backgroundColor: '#ffffff',
  textColor: '#000000'
};

// Simple file-based persistence (optional)
const DATA_FILE = 'whiteboard-data.json';

// Load saved state on startup
function loadState() {
  try {
    if (fs.existsSync(DATA_FILE)) {
      const data = fs.readFileSync(DATA_FILE, 'utf8');
      whiteboardState = { ...whiteboardState, ...JSON.parse(data) };
      console.log('📂 Loaded saved whiteboard state');
    }
  } catch (error) {
    console.log('⚠️ Could not load saved state:', error.message);
  }
}

// Save state to file
function saveState() {
  try {
    fs.writeFileSync(DATA_FILE, JSON.stringify(whiteboardState, null, 2));
  } catch (error) {
    console.log('⚠️ Could not save state:', error.message);
  }
}

// Load state on startup
loadState();

// Auto-save every 30 seconds
setInterval(saveState, 30000);

// Routes
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'control.html'));
});

app.get('/display', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'display.html'));
});

app.get('/api/state', (req, res) => {
  res.json(whiteboardState);
});

// Socket.IO connection handling
io.on('connection', (socket) => {
  console.log('Client connected:', socket.id);
  
  // Send current state to newly connected client
  socket.emit('state-update', whiteboardState);
  
  // Handle drawing events
  socket.on('draw', (data) => {
    whiteboardState.drawings.push(data);
    socket.broadcast.emit('draw', data);
  });
  
  // Handle clear whiteboard
  socket.on('clear-whiteboard', () => {
    whiteboardState.drawings = [];
    io.emit('clear-whiteboard');
  });
  
  // Handle todo operations
  socket.on('add-todo', (todo) => {
    const newTodo = {
      id: Date.now(),
      text: todo.text,
      completed: false,
      priority: todo.priority || 'medium',
      createdAt: new Date().toISOString()
    };
    whiteboardState.todos.push(newTodo);
    io.emit('todos-update', whiteboardState.todos);
  });
  
  socket.on('toggle-todo', (todoId) => {
    const todo = whiteboardState.todos.find(t => t.id === todoId);
    if (todo) {
      todo.completed = !todo.completed;
      io.emit('todos-update', whiteboardState.todos);
    }
  });
  
  socket.on('delete-todo', (todoId) => {
    whiteboardState.todos = whiteboardState.todos.filter(t => t.id !== todoId);
    io.emit('todos-update', whiteboardState.todos);
  });
  
  // Handle mode switching
  socket.on('change-mode', (mode) => {
    whiteboardState.currentMode = mode;
    io.emit('mode-change', mode);
  });
  
  // Handle theme changes
  socket.on('change-theme', (theme) => {
    whiteboardState.backgroundColor = theme.backgroundColor;
    whiteboardState.textColor = theme.textColor;
    io.emit('theme-change', theme);
  });
  
  socket.on('disconnect', () => {
    console.log('Client disconnected:', socket.id);
  });
});

const PORT = process.env.PORT || 3000;

server.listen(PORT, '0.0.0.0', () => {
  console.log(`🎨 Digital Whiteboard server running on port ${PORT}`);
  console.log(`📱 Control interface: http://localhost:${PORT}`);
  console.log(`🖥️  Display interface: http://localhost:${PORT}/display`);
}); 