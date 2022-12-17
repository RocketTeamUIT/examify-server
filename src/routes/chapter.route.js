const express = require('express');
const router = express.Router();
const chapterController = require('../controllers/chapters.controller');
const { checkLogin, verifyAccessToken } = require('../utils/jwt_service');

// [GET] /chapters/:id -> get a chapter
router.get('/:id', checkLogin, chapterController.getChapter);

// [POST] /chapters/create -> create new chapter
router.post('/create', chapterController.createNewChapter);

// [DELETE] /chapters/delete/:id -> delete a chapter
router.delete('/delete/:id', chapterController.deleteChapter);

// [UPDATE] /chapters/update/:id -> update a chapter
router.put('/update/:id', chapterController.updateChapter);

module.exports = router;
