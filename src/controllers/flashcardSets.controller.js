const { Op } = require('sequelize');
const { sequelize } = require('../config/connectDB');
const db = require('../models/index');

module.exports = {
  getAllFlashcardSets: async (req, res, next) => {
    try {
      const { typeId } = req.params;

      const options = {
        where: { access: 'public' },
      };

      if (typeId !== undefined) {
        options.where = {
          ...options.where,
          fc_type_id: typeId,
        };
      }

      const flashcardSets = await db.FlashcardSet.findAll(options);
      res.status(200).json({
        status: 200,
        data: flashcardSets,
      });
    } catch (error) {
      next(error);
    }
  },

  getFlashcardSetsByType: async (req, res, next) => {
    try {
      const flashcardSetsByType = await db.FlashcardType.findAll({
        include: [
          {
            model: db.FlashcardSet,
            as: 'fc_set',
            required: false,
            separate: true,
            order: [['fc_set_id', 'ASC']],
          },
        ],
      });

      res.status(200).json({
        data: flashcardSetsByType,
      });
    } catch (error) {
      next(error);
    }
  },

  // Get user's flashcard sets
  getMyFlashcard: async (req, res, next) => {
    try {
      const userId = req?.payload?.user?.id || -1;
      console.log('ABCEFAEF: ', userId);
      const flashcardSets = await db.FlashcardSet.findAll({
        where: {
          created_by: userId,
        },
      });

      res.status(200).json({
        data: flashcardSets,
      });
    } catch (error) {
      next(error);
    }
  },

  // Get flashcard set detail
  getFlashcardSetDetail: async (req, res, next) => {
    try {
      const userId = req?.payload?.user?.id || -1;
      const { id } = req.params;
      let flashcardSetDetail = await db.FlashcardSet.findOne({
        where: {
          fc_set_id: id,
          [Op.and]: [sequelize.literal(`check_flashcard_permission(${userId}, ${id}) = TRUE`)],
        },
        attributes: Object.keys(db.FlashcardSet.getAttributes()).concat([
          [
            sequelize.cast(
              sequelize.literal(
                `(SELECT COUNT(*) FROM flashcard f LEFT JOIN learnt_list ll ON f.fc_id = ll.fc_id WHERE f.fc_set_id = "flashcardSet".fc_set_id AND ll.user_id = ${userId})`,
              ),
              'INT',
            ),
            'learnt_count',
          ],
        ]),
        include: [
          {
            model: db.FlashcardType,
            as: 'fc_type',
            attributes: ['type'],
          },
        ],
      });

      if (flashcardSetDetail) {
        if (flashcardSetDetail.created_by === userId) {
          flashcardSetDetail.dataValues.isOwner = true;
        } else {
          flashcardSetDetail.dataValues.isOwner = false;
        }
      } else {
        flashcardSetDetail = {};
      }

      res.status(200).json({
        data: flashcardSetDetail,
      });
    } catch (error) {
      next(error);
    }
  },

  // Student creates flashcard set
  createFlashcardSet: async (req, res, next) => {
    try {
      const userId = req?.payload?.user?.id || -1;
      const { name, description, access } = req.body;
      const newFlashcardSet = await db.FlashcardSet.create({
        name,
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
      const userId = req?.payload?.user?.id || -1;
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

  getFlashcardShare: async (req, res, next) => {
    try {
      const id = req.params.id || -1;
      const result = await db.FlashcardSharePermit.findAll({
        attributes: Object.keys(db.FlashcardSharePermit.getAttributes()).concat([
          [sequelize.col('user.user_id'), 'id'],
          [sequelize.col('mail'), 'email'],
          [sequelize.col('avt'), 'avt'],
          [sequelize.col('first_name'), 'firstName'],
          [sequelize.col('last_name'), 'lastName'],
        ]),
        where: {
          fc_set_id: id,
        },
        include: [
          {
            model: db.User,
            as: 'user',
            required: false,
            attributes: [],
          },
        ],
      });
      res.status(200).json({
        data: result,
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
      const { set_id, user_id } = req.query;
      await db.FlashcardSharePermit.destroy({
        where: { fc_set_id: set_id, user_id: user_id },
      });
      res.status(200).json({
        message: 'Removed person from flashcard share list successfully',
      });
    } catch (error) {
      next(error);
    }
  },

  searchSharePerson: async (req, res, next) => {
    try {
      const { value, flashcardSetId } = req.query;
      const result = await db.User.findAll({
        where: {
          [Op.or]: [
            {
              email: {
                [Op.like]: `%${value}%`,
              },
            },
            {
              firstName: {
                [Op.like]: `%${value}%`,
              },
            },
            {
              lastName: {
                [Op.like]: `%${value}%`,
              },
            },
          ],
          [Op.and]: [
            sequelize.literal(
              `NOT EXISTS (SELECT 1 FROM flashcard_share_permit fp WHERE fp.user_id = "User".user_id AND fp.fc_set_id = ${flashcardSetId})`,
            ),
          ],
        },

        limit: 8,
      });

      res.status(200).json({
        data: result,
      });
    } catch (error) {
      next(error);
    }
  },
};
