const { sequelize } = require('../config/connectDB');
const db = require('../models/index');

module.exports = {
  getAllFlashcardTypes: async (req, res, next) => {
    try {
      const flashcardTypes = await db.FlashcardType.findAll();
      res.status(200).json({
        data: flashcardTypes,
      });
    } catch (error) {
      next(error);
    }
  },
};
