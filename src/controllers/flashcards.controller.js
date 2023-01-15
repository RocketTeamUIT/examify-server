const { sequelize } = require('../config/connectDB');
const db = require('../models/index');
const Op = require('sequelize').Op;

module.exports = {
  getAllFlashcardInSet: async (req, res, next) => {
    try {
      const { flashcardSetId } = req.params;
      const flashcards = await db.Flashcard.findAll({
        where: {
          fc_set_id: flashcardSetId,
        },
      });
      res.status(200).json({
        status: 200,
        data: flashcards,
      });
    } catch (error) {
      next(error);
    }
  },

  // Student creates flashcard set
  createFlashcard: async (req, res, next) => {
    try {
      const userId = req?.payload?.userId || -1;
      const { flashcardSetId, word, meaning, typeOfWord, pronounce, example, note, image } = req.body;

      const newFlashcard = await db.Flashcard.create({
        fc_set_id: flashcardSetId,
        word,
        meaning,
        type_of_word: typeOfWord,
        pronounce,
        example,
        note,
        image,
        created_by: userId,
      });
      res.status(201).json({
        data: newFlashcard,
      });
    } catch (error) {
      next(error);
    }
  },

  updateFlashcard: async (req, res, next) => {
    try {
      const { id } = req.params;
      const { word, meaning, typeOfWord, pronounce, example, note, image } = req.body;
      await db.Flashcard.update(
        {
          word,
          meaning,
          type_of_word: typeOfWord,
          pronounce,
          example,
          note,
          image,
        },
        {
          where: {
            fc_id: id,
          },
        },
      );
      res.status(200).json({
        message: 'Flashcard updated successfully!',
      });
    } catch (error) {
      next(error);
    }
  },

  deleteFlashcard: async (req, res, next) => {
    try {
      const { id } = req.params;
      await db.Flashcard.destroy({
        where: {
          fc_id: id,
        },
      });
      res.status(200).json({
        message: 'Flashcard deleted successfully',
      });
    } catch (error) {
      next(error);
    }
  },

  getPracticeFlashcard: async (req, res, next) => {
    try {
      const userId = req?.payload?.userId || -1;
      const { flashcardSetId } = req.params;
      const flashcard = await db.Flashcard.findAll({
        where: {
          fc_set_id: flashcardSetId,
          [Op.and]: sequelize.literal(
            `(flashcard.fc_id NOT IN (SELECT ll.fc_id FROM learnt_list ll WHERE ll.fc_id = flashcard.fc_id AND ll.user_id = ${userId}))`,
          ),
        },
        order: sequelize.literal('random()'),
        limit: 1,
      });
      res.status(200).json({
        data: flashcard,
      });
    } catch (error) {
      next(error);
    }
  },

  markFlashcardAsLearnt: async (req, res, next) => {
    try {
      const userId = req?.payload?.userId || -1;
      const { id } = req.params;
      await db.LearntList.create({
        fc_id: id,
        user_id: userId,
      });
      res.status(201).json({
        message: 'Marked flashcard as learnt successfully',
      });
    } catch (error) {
      next(error);
    }
  },

  markFlashcardAsUnlearnt: async (req, res, next) => {
    try {
      const userId = req?.payload?.userId || -1;
      const { id } = req.params;
      await db.LearntList.destroy({
        where: {
          fc_id: id,
          user_id: userId,
        },
      });
      res.status(200).json({
        message: 'Un-mark flashcard successfully',
      });
    } catch (error) {
      next(error);
    }
  },
};
