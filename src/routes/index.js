const usersRouter = require('./users');
const coursesRouter = require('./courses');
const testRouter = require('./test');

function route(app) {
  app.use('/users', usersRouter);
  app.use('/courses', coursesRouter);
  app.use('/test', testRouter);
}

module.exports = route;
