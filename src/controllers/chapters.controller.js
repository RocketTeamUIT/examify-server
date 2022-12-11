const Op = require('sequelize');
const db = require('../models/index');
const createError = require('http-errors');
const { sequelize } = require('../config/connectDB');

module.exports = {
  getChapter: async (req, res, next) => {
    try {
      let { id } = req.params;
      const userId = req?.payload?.userId || -1;
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
          next(createError.NotFound("Don't have depth equal to " + depth));
      }

      res.status(200).json({
        status: 200,
        data: chapter,
      });
    } catch (err) {
      next(err);
    }
  },

  createNewChapter: async (req, res) => {},

  deleteChapter: async (req, res) => {},

  updateChapter: async (req, res) => {},
};
