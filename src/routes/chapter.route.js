const express = require('express');
const router = express.Router();
const chapterController = require('../controllers/chapters.controller');
const { checkLogin, verifyAccessToken } = require('../utils/jwt_service');

// [GET] /chapters/:id -> get a chapter
router.get('/:id', checkLogin, chapterController.getChapter);

// [POST] /chapters -> create new chapter
router.post('/', chapterController.createNewChapter);

// [DELETE] /chapters/:id -> delete a chapter
router.delete('/:id', chapterController.deleteChapter);

// [UPDATE] /chapters/:id -> update a chapter
router.put('/:id', chapterController.updateChapter);

module.exports = router;
