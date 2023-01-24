const express = require('express');
const router = express.Router();
const examsController = require('../../controllers/exam/exams.controller');
const { checkLogin, verifyAccessToken } = require('../../utils/jwt_service');

// [GET] /exams/:id     -> get detail an exam
router.get('/:id', checkLogin, examsController.getDetailExam);

// [GET]  /exams   ->   get all exam
router.get('/', checkLogin, examsController.getAllExam);

// [POST] /exams/taking
router.post('/taking', verifyAccessToken, examsController.examTaking);

module.exports = router;
