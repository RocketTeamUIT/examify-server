const Op = require('sequelize');
const db = require('../models/index');
const pool = require('../config/db');
const createError = require('http-errors');
const { sequelize } = require('../config/connectDB');

module.exports = {
  getChapter: async (req, res, next) => {
    try {
      let { id } = req.params;
      const userId = req?.payload?.user?.id || -1;
      let depth = req.query.depth || '1';
      let chapter = {};

      // Note:
      // statusLearned = null: not learned any lesson
      // statusLearned = 1: learned but not completed
      // statusLearned = 2: completed

      switch (depth) {
        // depth = 1:
        case '1':
          // Query get chapter
          chapter = await db.Chapter.findOne({
            attributes: {
              exclude: ['courseId', 'createdAt', 'updatedAt'],
              // add field statusLearned for Chapter
              include: [
                [
                  sequelize.literal(`(SELECT * FROM get_status_learned_chapter(${userId}, "Chapter".chapter_id))`),
                  'statusLearned',
                ],
              ],
            },
            where: {
              id: id,
            },
          });
          break;

        // depth = 2:
        case '2':
          // Query get chapter
          chapter = await db.Chapter.findOne({
            attributes: {
              exclude: ['courseId', 'createdAt', 'updatedAt'],
              // add field statusLearned for Chapter
              include: [
                [
                  sequelize.literal(`(SELECT * FROM get_status_learned_chapter(${userId}, "Chapter".chapter_id))`),
                  'statusLearned',
                ],
              ],
            },
            where: {
              id: id,
            },
            // Include Unit
            include: [
              {
                model: db.Unit,
                as: 'unitList',
                attributes: {
                  exclude: ['chapterId', 'createdAt', 'updatedAt'],
                  include: [
                    [
                      // add field statusLearned for Unit
                      sequelize.literal(`(SELECT * FROM get_status_learned_unit(${userId}, "unitList".unit_id))`),
                      'statusLearned',
                    ],
                  ],
                },
              },
            ],
          });
          break;

        // depth = 3:
        case '3':
          // Query get chapter
          chapter = await db.Chapter.findOne({
            attributes: {
              exclude: ['courseId', 'createdAt', 'updatedAt'],
              // add field statusLearned for Chapter
              include: [
                [
                  sequelize.literal(`(SELECT * FROM get_status_learned_chapter(${userId}, "Chapter".chapter_id))`),
                  'statusLearned',
                ],
              ],
            },
            where: {
              id: id,
            },
            // Include Unit
            include: [
              {
                model: db.Unit,
                as: 'unitList',
                attributes: {
                  exclude: ['chapterId', 'createdAt', 'updatedAt'],
                  include: [
                    [
                      // add field statusLearned for Unit
                      sequelize.literal(`(SELECT * FROM get_status_learned_unit(${userId}, "unitList".unit_id))`),
                      'statusLearned',
                    ],
                  ],
                },
                // Include Lesson
                include: [
                  {
                    model: db.Lesson,
                    as: 'lessonList',
                    attributes: {
                      exclude: ['unitId'],
                      include: [
                        // add field completed = true or false for Lesson
                        [
                          sequelize.literal(
                            `(SELECT * FROM check_completed_lesson(${userId}, "unitList->lessonList".lesson_id))`,
                          ),
                          'completed',
                        ],
                      ],
                    },
                  },
                ],
              },
            ],
          });
          break;

        default:
          console.log("Don't have depth equal to " + depth);
          return next(createError.NotFound("Don't have depth equal to " + depth));
      }

      res.status(200).json({
        status: 200,
        data: chapter,
      });
    } catch (err) {
      next(err);
    }
  },

  createNewChapter: async (req, res, next) => {
    try {
      const { courseId, numericOrder, name } = req.body;
      const chapter = await db.Chapter.create({ courseId, numericOrder, name });

      res.status(200).json({
        status: 200,
        data: chapter,
      });
    } catch (err) {
      next(err);
    }
  },

  updateChapter: async (req, res, next) => {
    try {
      const { id } = req.params;
      const { courseId, numericOrder, name } = req.body;
      await db.Chapter.update(
        { courseId, numericOrder, name },
        {
          where: {
            id: id,
          },
        },
      );

      res.status(200).json({
        status: 200,
        message: 'Updated chapter successful!',
      });
    } catch (err) {
      next(err);
    }
  },

  deleteChapter: async (req, res, next) => {
    try {
      const { id } = req.params;
      await pool.query(`SELECT fn_delete_chapter(${id})`);

      res.status(200).json({
        status: 200,
        message: 'Deleted chapter successful!',
      });
    } catch (err) {
      next(err);
    }
  },
};
