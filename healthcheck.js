#!/usr/bin/env node

const http = require('http');

const options = {
  hostname: 'localhost',
  port: process.env.PORT || 3000,
  path: '/api/state',
  method: 'GET',
  timeout: 2000
};

const req = http.request(options, (res) => {
  if (res.statusCode === 200) {
    console.log('Health check passed');
    process.exit(0);
  } else {
    console.log('Health check failed - status:', res.statusCode);
    process.exit(1);
  }
});

req.on('error', (err) => {
  console.log('Health check failed - error:', err.message);
  process.exit(1);
});

req.on('timeout', () => {
  console.log('Health check failed - timeout');
  req.destroy();
  process.exit(1);
});

req.end(); 