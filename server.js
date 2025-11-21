'use strict';

const express = require('express');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3001;

// Serve static frontend
app.use(express.static(path.join(__dirname, 'public')));

// Simple interactive API (triggered by button)
app.get('/api/hello', (req, res) => {
  res.json({ message: "Hello from Costa Rica 🚀" });
});

// Health check
app.get('/health', (req, res) => {
  res.json({
    status: "ok",
    timestamp: new Date().toISOString()
  });
});

// Basic API info endpoint
app.get('/api/info', (req, res) => {
  res.json({
    name: "docker_web_app",
    version: "1.0.0"
  });
});

app.listen(PORT, () => {
  console.log(`App running on port ${PORT}`);
});
