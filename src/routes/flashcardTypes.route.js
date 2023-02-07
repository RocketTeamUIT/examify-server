const express = require('express');
const router = express.Router();
const flashcardTypeController = require('../controllers/flashcardTypes.controller');

// Get all flashcard types
router.get('/', flashcardTypeController.getAllFlashcardTypes);

// Create flashcard type
router.post('/create', flashcardTypeController.createFlashcardType);

// Update flashcard type
router.put('/update/:id', flashcardTypeController.updateFlashcardType);

// Delete flashcard type
router.delete('/delete/:id', flashcardTypeController.deleteFlashcardType);

module.exports = router;
