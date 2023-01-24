const { sequelize } = require('../config/connectDB');
const db = require('../models/index');

module.exports = {
  getAllFlashcardTypes: async (req, res, next) => {
    try {
      const flashcardTypes = await db.FlashcardType.findAll({
        order: [['fc_type_id', 'ASC']],
      });
      res.status(200).json({
        data: flashcardTypes,
      });
    } catch (error) {
      next(error);
    }
  },

  // Student creates flashcard set
  createFlashcardType: async (req, res, next) => {
    try {
      const { type, description } = req.body;
      const newFlashcardType = await db.FlashcardType.create({
        type,
        description,
      });
      res.status(201).json({
        data: newFlashcardType,
      });
    } catch (error) {
      next(error);
    }
  },

  updateFlashcardType: async (req, res, next) => {
    try {
      const { id } = req.params;
      const { type, description } = req.body;
      await db.FlashcardType.update(
        {
          type,
          description,
        },
        {
          where: {
            fc_type_id: id,
          },
        },
      );
      res.status(200).json({
        message: 'Flashcard type updated successfully!',
      });
    } catch (error) {
      next(error);
    }
  },

  deleteFlashcardType: async (req, res, next) => {
    try {
      const { id } = req.params;
      await db.FlashcardType.destroy({
        where: {
          fc_type_id: id,
        },
      });
      res.status(200).json({
        message: 'Flashcard type deleted successfully',
      });
    } catch (error) {
      next(error);
    }
  },
};
