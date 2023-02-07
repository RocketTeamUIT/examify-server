const { Sequelize } = require('sequelize');

// dotenv package cho phép dùng biến môi trường được khai báo trong .env
require('dotenv').config();

const sequelize = new Sequelize(process.env.CONNECTION_STRING);

let connectDB = async () => {
  try {
    await sequelize.authenticate();
    console.log('Connection has been established successfully.');
  } catch (error) {
    console.error('Unable to connect to the database:', error);
  }
};

module.exports = { connectDB, sequelize };
