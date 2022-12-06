// object db contain all Model in project
const db = {
  Course: require('./course.model'),
  Chapter: require('./chapter.model'),
  Unit: require('./unit.model'),
  Lesson: require('./lesson.model'),
  Slide: require('./slide.model'),
  JoinCourse: require('./joinCourse.model'),
  JoinLesson: require('./joinLesson.model'),
  Note: require('./note.model'),
  Rank: require('./rank.model'),
  Roles: require('./roles.model'),
  UserToRole: require('./userToRole.model'),
  Rating: require('./rating.model'),
  // Comment: require('./comment.model'),
  // User: require('./user.model'),
};

//Excute function associate of model
Object.keys(db).forEach((modelName) => {
  if (db[modelName].associate) {
    db[modelName].associate(db);
  }
});

module.exports = db;
