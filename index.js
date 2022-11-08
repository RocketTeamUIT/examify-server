const express = require("express");
const app = express();
const cors = require("cors");
const pool = require("./config/db");
const route = require("./routes");

// Apply middleware
app.use(cors());
app.use(express.json()); // req.body

// Routes sẽ lọt vào đây
route(app);

// Kiểm tra biến môi trường có PORT chạy server không? Nếu không lấy PORT 5000
const PORT = process.env.PORT || 5000;

// Server chạy với PORT được gán bên trên
app.listen(PORT, () => {
  console.log(`Server has started on port ${PORT}`);
});
