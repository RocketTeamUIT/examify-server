const { Op } = require('sequelize');
const { sequelize } = require('../config/connectDB');
const pool = require('../config/db');
const { FlashcardSet, LearntList } = require('../models/index');
const db = require('../models/index');

module.exports = {
  getAllFlashcardSets: async (req, res, next) => {
    try {
      const flashcardSets = await db.FlashcardSet.findAll({
        attributes: Object.keys(db.FlashcardSet.getAttributes()).concat([[sequelize.col('type'), 'type']]),
        include: [
          {
            model: db.FlashcardType,
            as: 'fc_type',
            required: false,
            attributes: [],
          },
        ],
        order: [['fc_set_id', 'ASC']],
      });
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
      const flashcardSets = await db.FlashcardSet.findAll({
        where: {
          created_by: userId,
        },
      });
      const recent = await sequelize.query(
        `
        SELECT DISTINCT fs.fc_set_id, fs.fc_type_id, type, name, fs.description, words_count, system_belong, access, views, fs.created_by, fs.created_at, fs.updated_at, user_id, MAX(ll.created_at) learnt_time, 
        (SELECT COUNT(*) learnt_count FROM flashcard_set fs2, flashcard f2, learnt_list ll2 WHERE fs2.fc_set_id = f2.fc_set_id AND f2.fc_id = ll2.fc_id AND user_id = ${userId} AND fs2.fc_set_id = fs.fc_set_id) 
        FROM flashcard_set fs LEFT JOIN flashcard_type ft ON ft.fc_type_id = fs.fc_type_id 
        INNER JOIN flashcard f ON f.fc_set_id = fs.fc_set_id 
        INNER JOIN learnt_list ll ON ll.fc_id = f.fc_id AND user_id = ${userId}
        GROUP BY fs.fc_set_id, fs.fc_type_id, type, name, fs.description, words_count, system_belong, access, views, fs.created_by, fs.created_at, fs.updated_at, user_id
        ORDER BY MAX(ll.created_at) DESC
        LIMIT 8
        `,
      );

      res.status(200).json({
        data: {
          sets: flashcardSets,
          recent: recent[0],
        },
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
      const { addView } = req.query;
      const where = {
        fc_set_id: id,
      };
      if (userId !== -1) {
        where[Op.and] = [sequelize.literal(`check_flashcard_permission(${userId}, ${id}) = TRUE`)];
      }
      let flashcardSetDetail = await db.FlashcardSet.findOne({
        where,
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

      if (addView) {
        await db.FlashcardSet.update(
          {
            views: sequelize.literal('views + 1'),
          },
          {
            where: {
              fc_set_id: id,
            },
          },
        );
      }

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
      const { name, description, flashcardTypeId } = req.body;
      const newSystemFlashcardSet = await db.FlashcardSet.create({
        name: name,
        description,
        fc_type_id: flashcardTypeId,
        system_belong: true,
        access: 'public',
        created_by: userId,
      });
      const type = await db.FlashcardType.findOne({
        attributes: ['type'],
        where: {
          fc_type_id: flashcardTypeId,
        },
      });
      const result = newSystemFlashcardSet.toJSON();
      result.type = type.type;
      res.status(201).json({
        data: result,
      });
    } catch (error) {
      next(error);
    }
  },

  updateFlashcardSet: async (req, res, next) => {
    try {
      const { id } = req.params;
      const { description, access, flashcardTypeId, name } = req.body;
      const updateValues = {
        name,
        description,
        access,
      };
      if (flashcardTypeId) updateValues.fc_type_id = flashcardTypeId;
      await db.FlashcardSet.update(updateValues, {
        where: {
          fc_set_id: id,
        },
      });
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

  getStatistics: async (req, res, next) => {
    try {
      const views = await db.FlashcardSet.findOne({
        attributes: [[sequelize.fn('sum', sequelize.col('views')), 'total_views']],
      });
      const learnt_sets = await pool.query(
        `select fs.fc_set_id, user_id, count(*) learnt_words FROM learnt_list ll, flashcard f, flashcard_set fs WHERE ll.fc_id = f.fc_id AND f.fc_set_id = fs.fc_set_id GROUP BY fs.fc_set_id, user_id HAVING count(*) = (SELECT COUNT(*) FROM flashcard f2 WHERE f2.fc_set_id = fs.fc_set_id)`,
      );
      const learnt_words = await db.LearntList.findOne({
        attributes: [[sequelize.fn('COUNT', sequelize.col('*')), 'learnt_words']],
      });
      const flashcards_count = await db.Flashcard.findOne({
        attributes: [[sequelize.fn('COUNT', sequelize.col('*')), 'flashcards_count']],
      });
      const popular = await db.FlashcardSet.findAll({
        attributes: Object.keys(db.FlashcardSet.getAttributes()).concat([
          [
            sequelize.cast(
              sequelize.literal(
                '(SELECT COUNT(*) FROM learnt_list ll INNER JOIN flashcard f ON ll.fc_id = f.fc_id AND "flashcardSet".fc_set_id = f.fc_set_id)',
              ),
              'INT',
            ),
            'learnt_count',
          ],
        ]),
        order: [['views', 'DESC']],
        limit: 5,
      });

      const result = {
        ...views.toJSON(),
        ...learnt_words.toJSON(),
        ...flashcards_count.toJSON(),
        popular: popular,
        learnt_count: learnt_sets.rowCount,
      };

      res.status(200).json({
        data: result,
      });
    } catch (error) {
      next(error);
    }
  },

  getSetStatistics: async (req, res, next) => {
    const id = req.params.id || -1;
    const year = req.query.year || new Date().getFullYear();

    try {
      const count = await pool.query(
        `select count(*) count, views, 
        (SELECT COUNT(*) learnt_count FROM learnt_list ll INNER JOIN flashcard f2 ON ll.fc_id = f2.fc_id AND f2.fc_set_id = ${id} AND date_part('year', ll.created_at) = ${year}) 
        from flashcard_set fs, flashcard f where fs.fc_set_id = f.fc_set_id and fs.fc_set_id = ${id} group by views`,
      );

      const months = await pool.query(
        `select date_part('month', ll.created_at) as month, count(*) learnt_count from learnt_list ll, flashcard f where ll.fc_id = f.fc_id and date_part('year', ll.created_at) = ${year} and fc_set_id = ${id} group by date_part('month', ll.created_at);`,
      );

      const users_count = await pool.query(
        `select count(distinct user_id) users_count from learnt_list ll, flashcard f where f.fc_id = ll.fc_id AND date_part('year', ll.created_at) = ${year} and fc_set_id = ${id};`,
      );

      const users_learnt_count = await pool.query(
        `select 1 users_count FROM learnt_list ll, flashcard f WHERE ll.fc_id = f.fc_id AND f.fc_set_id = ${id} AND date_part('year', ll.created_at) = ${year} GROUP BY user_id HAVING count(*) = (SELECT COUNT(*) FROM flashcard f2 WHERE f2.fc_set_id = ${id});`,
      );

      const result = {};
      result.months = Array(12)
        .fill(0)
        .map((_, i) => i + 1)
        .map((month) => ({
          month,
          learnt_count: parseInt(months.rows.find((value) => String(value.month) === String(month))?.learnt_count || 0),
        }));

      result.count = parseInt(count.rows[0]?.count || 0);
      result.views = parseInt(count.rows[0]?.views || 0);
      result.learnt_count = parseInt(count.rows[0]?.learnt_count || 0);
      result.users_count = parseInt(users_count.rows[0]?.users_count || 0);
      result.users_learnt_count = parseInt(users_learnt_count.rowCount || 0);

      res.status(200).json({
        data: result,
      });
    } catch (error) {
      next(error);
    }
  },
};
