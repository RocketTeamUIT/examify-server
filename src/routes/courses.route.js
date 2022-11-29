const express = require('express');
const router = express.Router();
const courseController = require('../controllers/courses.controller');

// [GET] /courses/:id/learned-in-week   -> Get quantity lesson user learned in week
router.get('/:id/learned-in-week/:uid', courseController.lessonQntInWeek);

// [GET] /courses/:id -> get a course
router.get('/:id', courseController.getCourse);

// [GET] /courses -> get all courses
router.get('/', courseController.getAllCourses);

// [POST] /courses -> create new course
router.post('/', courseController.createNewCourse);

// [DELETE] /courses/:id -> delete a course
router.delete('/:id', courseController.deleteCourse);

// [UPDATE] /courses/:id -> update a course
router.put('/:id', courseController.updateCourse);

module.exports = router;
