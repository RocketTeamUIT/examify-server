const express = require('express');
const router = express.Router();
const examsController = require('../../controllers/exam/exams.controller');
const { checkLogin, verifyAccessToken } = require('../../utils/jwt_service');

// [GET] /exams/result/:examTakingId   -> get result of exam taking
router.get('/result/:examTakingId', verifyAccessToken, examsController.getResultExam);

// [POST] /exams/finished-taking/:id    -> finished an exam taking
router.post('/finished-taking/:id', verifyAccessToken, examsController.saveAnswer);

// [GET] /exams/exam-taking/:id    -> get content of exam
router.get('/exam-taking/:id', examsController.getExamTaking);
router.get('/exam-takingg/:id', examsController.getExamTaking2);

router.get('/statistics', examsController.getStatistics);

router.get('/statistics/:id', examsController.getExamStatistics);

// [GET] /exams/:id     -> get an exam
router.get('/:id', checkLogin, examsController.getExam); /* query only information of exam*/

// [GET] /exams/detail/:id  -> get detail an exam
router.get('/detail/:id', examsController.getDetailExam); /* query nested multiple child model*/

// [GET]  /exams   ->   get all exam
router.get('/', checkLogin, examsController.getAllExam);

// [POST] /exams/create -> create an exam
router.post('/create', examsController.createExam);

// [POST] /exams/taking     -> taking an exam
router.post('/taking', verifyAccessToken, examsController.examTaking);

// [PUT] /exams/update/:id  -> update an exam
router.put('/update/:id', examsController.updateExam);

// [DELETE] /exams/delete/:id   -> delete an exam
router.delete('/delete/:id', examsController.deleteExam);

// [POST] /exams/submit
router.post('/submit', verifyAccessToken, examsController.submitExam);

module.exports = router;
