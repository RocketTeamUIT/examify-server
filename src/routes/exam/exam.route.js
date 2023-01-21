const express = require('express');
const router = express.Router();
const examsController = require('../../controllers/exam/exams.controller');
const { checkLogin, verifyAccessToken } = require('../../utils/jwt_service');

// [GET]  /exams   ->   get all exam
router.get('/', checkLogin, examsController.getAllExam);

module.exports = router;
