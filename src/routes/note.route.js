const express = require('express');
const router = express.Router();
const noteController = require('../controllers/notes.controller');
const { checkLogin, verifyAccessToken } = require('../utils/jwt_service');

// [GET] /notes/:id -> get a note
router.get('/:id', verifyAccessToken, noteController.getNote);

// [GET] /notes/note-in-courses/:courseId -> get all note in courses
router.get('/note-in-courses/:courseId', verifyAccessToken, noteController.getAllNoteInCourse);

// [GET] /notes/note-in-chapters/:chapterId  -> get all note in chapters
router.get('/note-in-chapters/:chapterId', verifyAccessToken, noteController.getAllNoteInChapter);

// [GET] /notes/note-in-units/:unitId -> get all note in units
router.get('/note-in-units/:unitId', verifyAccessToken, noteController.getAllNoteInUnit);

// [GET] /notes/note-in-lessons/:lessonId -> get all note in lessons
router.get('/note-in-lessons/:lessonId', verifyAccessToken, noteController.getAllNoteInLesson);

// [POST] /notes/create
router.post('/create', verifyAccessToken, noteController.createNote);

// [UPDATE] /notes/update/:id -> update a note
router.put('/update/:id', verifyAccessToken, noteController.updateNote);

// [DELETE] /notes/delete/:id -> delete a note
router.delete('/delete/:id', verifyAccessToken, noteController.deleteNote);

module.exports = router;
