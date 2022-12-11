const express = require('express');
const router = express.Router();
const lessonController = require('../controllers/lesson.controller');
const { checkLogin, verifyAccessToken } = require('../utils/jwt_service');

// [GET] /lessons/:id -> get a lesson
router.get('/:id', checkLogin, lessonController.getLesson);

// [POST] /lessons/create -> create new lesson
router.post('/create', lessonController.createNewLesson);

// [DELETE] /lessons/delete/:id -> delete a lesson
router.delete('/delete/:id', lessonController.deleteLesson);

// [UPDATE] /lessons/update/:id -> update a lesson
router.put('/update/:id', lessonController.updateLesson);

module.exports = router;
