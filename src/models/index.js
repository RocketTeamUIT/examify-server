// object db contain all Model in project
const db = {
  Course: require('./course.model'),
  Chapter: require('./chapter.model'),
  Unit: require('./unit.model'),
  Lesson: require('./lesson.model'),
};

//Excute function associate of model
Object.keys(db).forEach((modelName) => {
  if (db[modelName].associate) {
    db[modelName].associate(db);
  }
});

module.exports = db;
