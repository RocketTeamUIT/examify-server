const authRouter = require('./auth.route');
const usersRouter = require('./users.route');
const coursesRouter = require('./courses.route');
const chapterRouter = require('./chapter.route');
const unitRouter = require('./unit.route');
const lessonRouter = require('./lesson.route');
const commentsRouter = require('./comments.route');
const testRouter = require('./test.route');
const meRouter = require('./me.router');
const noteRouter = require('./note.route');
const ratingRouter = require('./rating.route');
const flashcardTypeRouter = require('./flashcardTypes.route');
const flashcardSetRouter = require('./flashcardSets.route');
const flashcardRouter = require('./flashcards.route');
// Exam
const examRouter = require('./exam/exam.route');

function route(app) {
  app.use('/auth', authRouter);
  app.use('/users', usersRouter);
  app.use('/courses', coursesRouter);
  app.use('/chapters', chapterRouter);
  app.use('/units', unitRouter);
  app.use('/lessons', lessonRouter);
  app.use('/notes', noteRouter);
  app.use('/comments', commentsRouter);
  app.use('/rating', ratingRouter);
  app.use('/test', testRouter);
  app.use('/me', meRouter);
  // Flashcard
  app.use('/flashcard-types', flashcardTypeRouter);
  app.use('/flashcard-sets', flashcardSetRouter);
  app.use('/flashcards', flashcardRouter);
  // Exam
  app.use('/exams', examRouter);
}

module.exports = route;
