const express = require('express');
const router = express.Router();
const courseController = require('../controllers/courses.controller');
const { checkLogin, verifyAccessToken } = require('../utils/jwt_service');

// GET /courses/:id/unfinished-lesson
router.get('/:id/unfinished-lesson/:uid', courseController.unitInCompleted);

// [GET] /courses/:id/learned-in-week   -> Get quantity lesson user learned in week
router.get('/:id/learned-in-week/:uid', courseController.lessonQntInWeek);

// [GET] /courses/:id -> get a course
router.get('/:id', courseController.getCourse);

// [GET] /courses -> get all courses
router.get('/', checkLogin, courseController.getAllCourses);

// [POST] /courses -> create new course
router.post('/', courseController.createNewCourse);

// [DELETE] /courses/:id -> delete a course
router.delete('/:id', courseController.deleteCourse);

// [UPDATE] /courses/:id -> update a course
router.put('/:id', courseController.updateCourse);

module.exports = router;
