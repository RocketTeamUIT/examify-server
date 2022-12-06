// const sequelize = require('../config/connectDB');

// object db contain all Model in project
const db = {
  Course: require('./course'),
  Chapter: require('./chapter'),
};

//Excute function associate of model
Object.keys(db).forEach((modelName) => {
  if (db[modelName].associate) {
    db[modelName].associate(db);
  }
});

module.exports = db;
