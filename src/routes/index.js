const usersRouter = require('./users.route');
const coursesRouter = require('./courses.route');
const chapterRouter = require('./chapter.route');
const unitRouter = require('./unit.route');
const lessonRouter = require('./lesson.route');
const commentsRouter = require('./comments.route');
const testRouter = require('./test.route');
const meRouter = require('./me.router');
const noteRouter = require('./note.route');

function route(app) {
  app.use('/users', usersRouter);
  app.use('/courses', coursesRouter);
  app.use('/chapters', chapterRouter);
  app.use('/units', unitRouter);
  app.use('/lessons', lessonRouter);
  app.use('/notes', noteRouter);
  app.use('/comments', commentsRouter);
  app.use('/test', testRouter);
  app.use('/me', meRouter);
}

module.exports = route;
