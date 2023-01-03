const Pool = require('pg').Pool;

// dotenv package cho phép dùng biến môi trường được khai báo trong .env
require('dotenv').config();

const pool = new Pool({
  user: process.env.PG_USER,
  password: process.env.PG_PASSWORD,
  host: process.env.PG_HOST,
  port: Number(process.env.PG_PORT),
  database: process.env.PG_DATABASE,
});

module.exports = pool;
