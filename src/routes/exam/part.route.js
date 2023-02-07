const express = require('express');
const router = express.Router();
const partsController = require('../../controllers/exam/parts.controller');

// get all part belong to an exam
router.get('/belong-to-exam/:examId', partsController.getAllPartInExam);

// get a part
router.get('/:id', partsController.getPart);

// update a part
router.put('/update/:id', partsController.updatePart);

// create a part
router.post('/create', partsController.createPart);

// delete a part
router.delete('/delete/:id', partsController.deletePart);

module.exports = router;
