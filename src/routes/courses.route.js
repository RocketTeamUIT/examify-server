const express = require('express');
const router = express.Router();
const courseController = require('../controllers/courses.controller');
const { checkLogin, verifyAccessToken } = require('../utils/jwt_service');

// [GET] /courses/popular?limit=    -> Get top courses popular
router.get('/popular', checkLogin, courseController.getCoursePopular);

// GET /courses/:id/unfinished-lesson
router.get('/:id/unfinished-lesson', verifyAccessToken, courseController.unitInCompleted);

// [GET] /courses/:id/learned-in-week   -> Get quantity lesson user learned in week
router.get('/:id/learned-in-week', verifyAccessToken, courseController.lessonQntInWeek);

// [GET] /courses/:id -> get a course
router.get('/:id', checkLogin, courseController.getCourse);

// [GET] /courses -> get all courses
router.get('/', checkLogin, courseController.getAllCourses);

// [POST] /courses -> create new course
router.post('/', courseController.createNewCourse);

// [DELETE] /courses/:id -> delete a course
router.delete('/:id', courseController.deleteCourse);

// [PUT] /courses/:id -> update a course
router.put('/:id', courseController.updateCourse);

// [PUT] /courses/update-participant/:course-id
router.put('/:courseId/update-participant', verifyAccessToken, courseController.updateParticipant);

module.exports = router;
