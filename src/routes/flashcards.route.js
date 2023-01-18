const express = require('express');
const router = express.Router();
const flashcardController = require('../controllers/flashcards.controller');
const { verifyAccessToken, checkLogin } = require('../utils/jwt_service');

// Get all flashcards in set
router.get('/get-from-set/:flashcardSetId', checkLogin, flashcardController.getFlashcardsInSet);

// Create flashcard
router.post('/create', verifyAccessToken, flashcardController.createFlashcard);

// Create multiple flashcard
router.post('/create-bulk', verifyAccessToken, flashcardController.createMultipleFlashcard);

// Update flashcard
router.put('/update/:id', verifyAccessToken, flashcardController.updateFlashcard);

// Delete flashcard
router.delete('/delete/:id', verifyAccessToken, flashcardController.deleteFlashcard);

// Get random practice flashcard
router.get('/practice/:flashcardSetId', verifyAccessToken, flashcardController.getPracticeFlashcard);

// Mark as learnt
router.post('/mark-learnt/:id', verifyAccessToken, flashcardController.markFlashcardAsLearnt);

// Mark as unlearnt
router.delete('/mark-learnt/:id', verifyAccessToken, flashcardController.markFlashcardAsUnlearnt);

module.exports = router;
