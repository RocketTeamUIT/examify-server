const express = require('express');
const router = express.Router();
const questionsController = require('../../controllers/exam/questions.controller');

//  [GET]   /questions/belong-to-set-question/:setQuestionId       -> get all question belong to an set question
router.get('/belong-to-set-question/:setQuestionId', questionsController.getAllQuestionInSetQsn);

//  [GET]   /questions/:id       -> get a question
router.get('/:id', questionsController.getQuestion);

//  [PUT]  /questions/update/:id      -> update a question
router.put('/update/:id', questionsController.updateQuestion);

//  [POST]  /questions/create      -> create a question
router.post('/create', questionsController.createQuestion);

//  [DELETE]  /questions/delete/:id      -> delete a question
router.delete('/delete/:id', questionsController.deleteQuestion);

module.exports = router;
