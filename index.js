const express = require('express');
const app = express();
const cors = require('cors');
const route = require('./src/routes');
const createError = require('http-errors');

// Apply middleware
app.use(cors());
app.use(express.json()); // req.body

// Routes sẽ lọt vào đây
route(app);

// Handle error
app.use((req, res, next) => {
  next(createError.NotFound('This route does not exist.'));
});

app.use((err, req, res, next) => {
  res.json({
    status: err.status || 500,
    message: err.message,
  });
});

// Kiểm tra biến môi trường có PORT chạy server không? Nếu không lấy PORT 5000
const PORT = process.env.PORT || 5000;

// Server chạy với PORT được gán bên trên
app.listen(PORT, () => {
  console.log(`Server has started on port ${PORT}`);
});
