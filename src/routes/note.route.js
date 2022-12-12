const express = require('express');
const router = express.Router();
const noteController = require('../controllers/notes.controller');
const { checkLogin, verifyAccessToken } = require('../utils/jwt_service');

// [GET] /notes/:id -> get a note
router.get('/:id', noteController.getNote);

// [GET] /notes/note-in-courses/?courseID="id" -> get all note in courses
router.get('/note-in-courses/:courseId', noteController.getAllNoteInCourse);

// [GET] /notes/note-in-chapters/?chapterID="id"  -> get all note in chapters
router.get('/note-in-chapters/:chapterId', noteController.getAllNoteInChapter);

// [GET] /notes/note-in-units/?unitID="id" -> get all note in units
router.get('/note-in-units/:unitId', noteController.getAllNoteInUnit);

// [GET] /notes/note-in-lessons/?lessonID="id" -> get all note in lessons
router.get('/note-in-lessons/:lessonId', noteController.getAllNoteInLesson);

// [POST] /notes/create
router.post('/create', noteController.createNote);

// [UPDATE] /notes/update/:id -> update a note
router.put('/update/:id', noteController.updateNote);

// [DELETE] /notes/delete/:id -> delete a note
router.delete('/delete/:id', noteController.deleteNote);

module.exports = router;
