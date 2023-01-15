const express = require('express');
const router = express.Router();
const flashcardSetController = require('../controllers/flashcardSets.controller');
const { verifyAccessToken } = require('../utils/jwt_service');

// Get all flashcard sets
router.get('/', flashcardSetController.getAllFlashcardSets);

// Create flashcard set
router.post('/create', verifyAccessToken, flashcardSetController.createFlashcardSet);

// Create system flashcard set
router.post('/create-system', verifyAccessToken, flashcardSetController.createSystemFlashcardSet);

// Update flashcard set
router.patch('/update/:id', verifyAccessToken, flashcardSetController.updateFlashcardSet);

// Update flashcard set
router.delete('/delete/:id', verifyAccessToken, flashcardSetController.deleteFlashcardSet);

// Add to share list
router.post('/share', verifyAccessToken, flashcardSetController.addFlashcardShare);

// Remove from share list
router.delete('/share', verifyAccessToken, flashcardSetController.removeFlashcardShare);

module.exports = router;
