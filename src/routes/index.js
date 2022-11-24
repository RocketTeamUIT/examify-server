const coursesRouter = require('./course');
const testRouter = require('./test');

function route(app) {
  app.use('/course', coursesRouter);
  app.use('/test', testRouter);
}

module.exports = route;
