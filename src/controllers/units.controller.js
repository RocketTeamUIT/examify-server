const Op = require('sequelize');
const db = require('../models/index');
const createError = require('http-errors');
const { sequelize } = require('../config/connectDB');

module.exports = {
  getUnit: async (req, res, next) => {
    try {
      let { id } = req.params;
      // let { userId } = req.payload;
      let userId = 4;
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

      res.status(200).json({ data: unit });
    } catch (err) {
      next(err);
    }
  },

  createNewUnit: async (req, res, next) => {},

  deleteUnit: async (req, res, next) => {},

  updateUnit: async (req, res, next) => {},
};
