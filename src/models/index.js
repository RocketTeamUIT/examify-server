// const sequelize = require('../config/connectDB');

// object db contain all Model in project
const db = {
  Rank: require('./rank.model'),
  User: require('./user.model'),
  Course: require('./course.model'),
  Chapter: require('./chapter.model'),
};

//Excute function associate of model
Object.keys(db).forEach((modelName) => {
  if (db[modelName].associate) {
    db[modelName].associate(db);
  }
});

module.exports = db;
