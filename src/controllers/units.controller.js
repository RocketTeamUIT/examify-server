const Op = require('sequelize');
const db = require('../models/index');
const pool = require('../config/db');
const createError = require('http-errors');
const { sequelize } = require('../config/connectDB');
const { where } = require('sequelize');

module.exports = {
  getUnit: async (req, res, next) => {
    try {
      let { id } = req.params;
      const userId = req?.payload?.user?.id || -1;
      let depth = req.query.depth || '1';
      let unit = {};

      switch (depth) {
        // depth = 1:
        case '1':
          unit = await db.Unit.findOne({
            attributes: {
              exclude: ['chapterId', 'createdAt', 'updatedAt'],
              // add field statusLearned for Unit
              include: [
                [
                  sequelize.literal(`(SELECT * FROM get_status_learned_unit(${userId}, "Unit".unit_id))`),
                  'statusLearned',
                ],
              ],
            },
            where: {
              id: id,
            },
          });
          break;

        case '2':
          // depth = 2:
          unit = await db.Unit.findOne({
            attributes: {
              exclude: ['chapterId', 'createdAt', 'updatedAt'],
              // add field statusLearned for Unit
              include: [
                [
                  sequelize.literal(`(SELECT * FROM get_status_learned_unit(${userId}, "Unit".unit_id))`),
                  'statusLearned',
                ],
              ],
            },
            where: {
              id: id,
            }, // Include Lesson
            include: [
              {
                model: db.Lesson,
                as: 'lessonList',
                attributes: {
                  exclude: ['unitId'],
                  include: [
                    // add field completed = true or false for Lesson
                    [
                      sequelize.literal(`(SELECT * FROM check_completed_lesson(${userId}, "lessonList".lesson_id))`),
                      'completed',
                    ],
                  ],
                },
              },
            ],
          });
          break;

        default:
          console.log("Don't have depth equal to " + depth);
          next(createError.NotFound("Don't have depth equal to " + depth));
      }

      res.status(200).json({
        status: 200,
        data: unit,
      });
    } catch (err) {
      next(err);
    }
  },

  createNewUnit: async (req, res, next) => {
    try {
      const { chapterId, numericOrder, name } = req.body;
      const unit = await db.Unit.create({ chapterId, numericOrder, name });

      res.status(200).json({
        status: 200,
        data: unit,
      });
    } catch (err) {
      next(err);
    }
  },

  updateUnit: async (req, res, next) => {
    try {
      const { id } = req.params;
      const { chapterId, numericOrder, name } = req.body;
      await db.Unit.update(
        { chapterId, numericOrder, name },
        {
          where: {
            id: id,
          },
        },
      );

      res.status(200).json({
        status: 200,
        message: 'Updated unit successful!',
      });
    } catch (err) {
      next(err);
    }
  },

  deleteUnit: async (req, res, next) => {
    try {
      const { id } = req.params;
      await pool.query(`SELECT fn_delete_unit(${id})`);

      res.status(200).json({
        status: 200,
        message: 'Deleted unit successful!',
      });
    } catch (err) {
      next(err);
    }
  },
};
