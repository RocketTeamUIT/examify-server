const express = require('express');
const app = express();
const cors = require('cors');
const cookieParser = require('cookie-parser');
const route = require('./src/routes');
const createError = require('http-errors');
const { connectDB } = require('./src/config/connectDB');

// Apply middleware
app.use(
  cors({
    origin: ['http://localhost:3000', 'http://localhost:4000'],
    credentials: true,
  }),
);
app.use(express.json()); // req.body
app.use(cookieParser()); // Allow server read cookie
app.use(express.urlencoded({ extended: true }));

// Connect sequelize with pg
connectDB();

// Routes sẽ lọt vào đây
route(app);

// Handle error
app.use((req, res, next) => {
  next(createError.NotFound('This route does not exist.'));
});

app.use((err, req, res, next) => {
  res.status(err.status || 500).json({
    status: err.status || 500,
    error: createError[err.status || 500].name,
    message: err.message,
  });
});

// Kiểm tra biến môi trường có PORT chạy server không? Nếu không lấy PORT 5000
const PORT = process.env.PORT || 5000;
// Server chạy với PORT được gán bên trên
app.listen(PORT, '0.0.0.0');
