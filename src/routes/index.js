const usersRouter = require('./users.route');
const coursesRouter = require('./courses.route');
const chapterRouter = require('./chapter.route');
const testRouter = require('./test.route');

function route(app) {
  app.use('/users', usersRouter);
  app.use('/courses', coursesRouter);
  app.use('/chapters', chapterRouter);
  app.use('/test', testRouter);
}

module.exports = route;
