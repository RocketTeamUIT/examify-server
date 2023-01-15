const db = require('../models/index');

module.exports = {
  getAllFlashcardSets: async (req, res, next) => {
    try {
      const flashcardSets = await db.FlashcardSet.findAll({});
      res.status(200).json({
        status: 200,
        data: flashcardSets,
      });
    } catch (error) {
      next(error);
    }
  },

  // Student creates flashcard set
  createFlashcardSet: async (req, res, next) => {
    try {
      const userId = req?.payload?.userId || -1;
      const { description, access } = req.body;
      const newFlashcardSet = await db.FlashcardSet.create({
        description,
        access,
        created_by: userId,
      });
      res.status(201).json({
        data: newFlashcardSet,
      });
    } catch (error) {
      next(error);
    }
  },

  // Teaching staff / admin create flashcard set
  createSystemFlashcardSet: async (req, res, next) => {
    try {
      const userId = req?.payload?.userId || -1;
      const { description, flashcardTypeId } = req.body;
      const newSystemFlashcardSet = await db.FlashcardSet.create({
        description,
        fc_type_id: flashcardTypeId,
        system_belong: true,
        access: 'public',
        created_by: userId,
      });
      res.status(201).json({
        data: newSystemFlashcardSet,
      });
    } catch (error) {
      next(error);
    }
  },

  updateFlashcardSet: async (req, res, next) => {
    try {
      const { id } = req.params;
      const { description, access } = req.body;
      await db.FlashcardSet.update(
        {
          description,
          access,
        },
        {
          where: {
            fc_set_id: id,
          },
        },
      );
      res.status(200).json({
        message: 'Flashcard set updated successfully!',
      });
    } catch (error) {
      next(error);
    }
  },

  deleteFlashcardSet: async (req, res, next) => {
    try {
      const { id } = req.params;
      await db.FlashcardSet.destroy({
        where: {
          fc_set_id: id,
        },
      });
      res.status(200).json({
        message: 'Flashcard Set deleted successfully',
      });
    } catch (error) {
      next(error);
    }
  },

  addFlashcardShare: async (req, res, next) => {
    try {
      const { flashcardSetId, userId } = req.body;
      await db.FlashcardSharePermit.create({
        fc_set_id: flashcardSetId,
        user_id: userId,
      });
      res.status(201).json({
        message: 'Added person to flashcard share list successfully',
      });
    } catch (error) {
      next(error);
    }
  },

  removeFlashcardShare: async (req, res, next) => {
    try {
      const { flashcardSetId, userId } = req.body;
      await db.FlashcardSharePermit.destroy({
        where: { fc_set_id: flashcardSetId, user_id: userId },
      });
      res.status(200).json({
        message: 'Removed person from flashcard share list successfully',
      });
    } catch (error) {
      next(error);
    }
  },
};
