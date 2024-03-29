const express = require('express');
const router = express.Router();
const courseController = require('../controllers/courses.controller');
const { checkLogin, verifyAccessToken, verifyAdminAccessToken } = require('../utils/jwt_service');

// [GET] /courses/search?key= &limit=
router.get('/search', checkLogin, courseController.searchCourse);

// [GET] /courses/popular?limit=    -> Get top courses popular
router.get('/popular', checkLogin, courseController.getCoursePopular);

// [GET] get overall statistics of courses
router.get('/statistics', courseController.getStatistics);

// Get detail statistics
router.get('/statistics/:id', courseController.getCourseStatistics);

// [POST] /courses/:id/enroll
router.post('/:id/enroll', verifyAccessToken, courseController.enrrollCourse);

// [POST] /courses/:id/enroll-charges
router.post('/:id/enroll-charges', verifyAccessToken, courseController.enrrollChargesCourse);

// GET /courses/:id/unfinished-lesson
router.get('/:id/unfinished-lesson', verifyAccessToken, courseController.unitInCompleted);

// [GET] /courses/:id/learned-in-week   -> Get quantity lesson user learned in week
router.get('/:id/learned-in-week', verifyAccessToken, courseController.lessonQntInWeek);

// [GET] /courses/:id -> get a course
router.get('/:id', checkLogin, courseController.getCourse);

// [GET] /courses -> get all courses
router.get('/', checkLogin, courseController.getAllCourses);

// [POST] /courses -> create new course
router.post('/create', courseController.createNewCourse);

// [DELETE] /courses/:id -> delete a course
router.delete('/delete/:id', verifyAccessToken, verifyAdminAccessToken, courseController.deleteCourse);

// [PUT] /courses/:id -> update a course
router.put('/update/:id', courseController.updateCourse);

module.exports = router;
