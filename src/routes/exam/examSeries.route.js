const express = require('express');
const router = express.Router();
const examSeriesController = require('../../controllers/exam/examSeries.controller');

// [GET] /examSeries/ -> get all examSeries
router.get('/', examSeriesController.getAllExamSeries);

// [GET] /examSeries/:id -> get a examSeries
router.get('/:id', examSeriesController.getExamSeries);

// [GET] /examSeries/create/:id -> create a examSeries
router.post('/create', examSeriesController.createExamSeries);

// [GET] /examSeries/update/:id -> update a examSeries
router.put('/update/:id', examSeriesController.updateExamSeries);

// [GET] /examSeries/delete/:id -> delete a examSeries
router.delete('/delete/:id', examSeriesController.deleteExamSeries);

module.exports = router;
