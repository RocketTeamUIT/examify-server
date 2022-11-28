const usersRouter = require('./users.route');
const coursesRouter = require('./courses');
const testRouter = require('./test.route');

function route(app) {
  app.use('/users', usersRouter);
  app.use('/courses', coursesRouter);
  app.use('/test', testRouter);
}

module.exports = route;
