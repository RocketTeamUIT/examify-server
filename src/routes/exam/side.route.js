const express = require('express');
const router = express.Router();
const sidesController = require('../../controllers/exam/sides.controller');

//  [GET] /sides/belong-to-set-question/:setQuestionId      ->  get all side belong to a set question
router.get('/belong-to-set-question/:setQuestionId', sidesController.getAllSideInSetQsn);

//  [GET] /sides/:id      -> get a Side
router.get('/:id', sidesController.getSide);

//  [PUT] /sides/update/:id      -> update a Side
router.put('/update/:id', sidesController.updateSide);

//  [POST] /sides/create      -> create a Side
router.post('/create', sidesController.createSide);

//  [DELETE] /sides/delete/:id      -> delete a Side
router.delete('/delete/:id', sidesController.deleteSide);

module.exports = router;
