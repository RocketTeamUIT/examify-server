const express = require('express');
const router = express.Router();
const flashcardTypeController = require('../controllers/flashcardTypes.controller');

// Get all flashcard sets
router.get('/', flashcardTypeController.getAllFlashcardTypes);

module.exports = router;
