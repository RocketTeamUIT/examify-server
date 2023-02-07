const express = require('express');
const router = express.Router();
const setQuestionsController = require('../../controllers/exam/setQuestions.controller');

//  [GET] /setQuestions/belong-to-part/:partId      ->  get all set question belong to a part
router.get('/belong-to-part/:partId', setQuestionsController.getAllSetQuestionInPart);

//  [GET] /setQuestions/:id      -> get a set question
router.get('/:id', setQuestionsController.getSetQuestion);

//  [PUT] /setQuestions/update/:id      -> update a Set Question
router.put('/update/:id', setQuestionsController.updateSetQuestion);

//  [POST] /setQuestions/create      -> create a Set Question
router.post('/create', setQuestionsController.createSetQuestion);

//  [DELETE] /setQuestions/delete/:id      -> delete a Set Question
router.delete('/delete/:id', setQuestionsController.deleteSetQuestion);

module.exports = router;
