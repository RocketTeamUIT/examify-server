const sequelize = require('../config/connectDB');

// object db contain all Model in project
const db = {
  Rank: require('./rank.model'),
  User: require('./user.model'),
  Course: require('./course.model'),
  Chapter: require('./chapter.model'),
  Unit: require('./unit.model'),
  Lesson: require('./lesson.model'),
  Slide: require('./slide.model'),
  JoinCourse: require('./joinCourse.model'),
  JoinLesson: require('./joinLesson.model'),
  Note: require('./note.model'),
  Roles: require('./roles.model'),
  UserToRole: require('./userToRole.model'),
  Rating: require('./rating.model'),
  Comment: require('./comment.model'),
  Like: require('./like.model'),
};

//Excute function associate of model
Object.keys(db).forEach((modelName) => {
  if (db[modelName].associate) {
    db[modelName].associate(db);
  }
});

// Synchronizing all models at once
sequelize.sequelize
  .sync()
  .then((data) => {
    console.log('All table sync successfully');
  })
  .catch((err) => {
    console.log(err);
    console.log('All table sync failed');
  });

module.exports = db;
