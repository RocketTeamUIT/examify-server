const createHttpError = require('http-errors');
const { sequelize } = require('../config/connectDB');
const db = require('../models/index');
const Op = require('sequelize').Op;

module.exports = {
  getFlashcardsInSet: async (req, res, next) => {
    try {
      const userId = req?.payload?.user?.id || -1;
      const role = req?.payload?.user?.role || '';
      const { flashcardSetId } = req.params;
      const page = req.query.page || 1;

      const options = {
        where: {
          fc_set_id: flashcardSetId,
        },
      };

      if (role !== 'Admin' && role !== 'Teaching Staff') {
        options.where = {
          ...options.where,
          [Op.and]: [sequelize.literal(`check_flashcard_permission(${userId}, ${flashcardSetId}) = TRUE`)],
        };
      }

      if (page > 0 && role !== 'Admin' && role !== 'Teaching Staff') {
        (options.limit = 10), (options.offset = (page - 1) * 10);
      }

      const flashcards = await db.Flashcard.findAll({
        ...options,
        attributes: Object.keys(db.Flashcard.getAttributes()).concat([
          [
            sequelize.literal(
              `(SELECT true FROM learnt_list ll WHERE ll.fc_id = "flashcard".fc_id AND user_id = ${userId})`,
            ),
            'learnt',
          ],
        ]),
        include: [
          {
            model: db.LearntList,
            as: 'learnt_lists',
            required: false,
          },
        ],
        order: [['fc_id', 'ASC']],
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
      const userId = req?.payload?.user?.id || -1;
      const { flashcardSetId, word, meaning, typeOfWord, pronounce, example, note, image, audio } = req.body;

      const newFlashcard = await db.Flashcard.create({
        fc_set_id: flashcardSetId,
        word,
        meaning,
        type_of_word: typeOfWord,
        pronounce,
        example,
        note,
        image,
        audio,
        created_by: userId,
      });
      res.status(201).json({
        data: newFlashcard,
      });
    } catch (error) {
      next(error);
    }
  },

  //
  createMultipleFlashcard: async (req, res, next) => {
    try {
      const userId = req?.payload?.user?.id || -1;
      if (!Array.isArray(req.body)) {
        next(createHttpError.BadRequest);
        return;
      }
      const formattedList = req.body.map((item) => {
        const { flashcardSetId, typeOfWord, ...rest } = item;
        return {
          ...rest,
          fc_set_id: flashcardSetId,
          type_of_word: typeOfWord,
          created_by: userId,
        };
      });

      await db.Flashcard.bulkCreate(formattedList);
      res.status(201).json({
        message: 'Added flashcards successfully',
      });
    } catch (error) {
      next(error);
    }
  },

  updateFlashcard: async (req, res, next) => {
    try {
      const { id } = req.params;
      const { word, meaning, typeOfWord, pronounce, example, note, image, audio } = req.body;
      await db.Flashcard.update(
        {
          word,
          meaning,
          type_of_word: typeOfWord,
          pronounce,
          audio,
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
      const userId = req?.payload?.user?.id || -1;
      const { flashcardSetId } = req.params;
      const flashcard = await db.Flashcard.findOne({
        where: {
          fc_set_id: flashcardSetId,
          [Op.and]: sequelize.literal(
            `(flashcard.fc_id NOT IN (SELECT ll.fc_id FROM learnt_list ll WHERE ll.fc_id = flashcard.fc_id AND ll.user_id = ${userId}))`,
          ),
        },
        order: sequelize.literal('random()'),
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
      const userId = req?.payload?.user?.id || -1;
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
      const userId = req?.payload?.user?.id || -1;
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
