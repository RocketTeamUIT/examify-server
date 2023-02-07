const Pool = require('pg').Pool;

// dotenv package cho phép dùng biến môi trường được khai báo trong .env
require('dotenv').config();

const pool = new Pool(process.env.CONNECTION_STRING);

module.exports = pool;
