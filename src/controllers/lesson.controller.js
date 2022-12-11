const Op = require('sequelize');
const db = require('../models/index');
const createError = require('http-errors');
const { sequelize } = require('../config/connectDB');
const { where } = require('sequelize');

module.exports = {
  getLesson: async (req, res, next) => {
    try {
      const { id } = req.params;
      const userId = req?.payload?.userId || -1;
      const lesson = await db.Lesson.findOne({
        where: { id: id },
        attributes: {
          exclude: ['unitId'],
          include: [
            // add field completed = true or false for Lesson
            [sequelize.literal(`(SELECT * FROM check_completed_lesson(${userId}, "Lesson".lesson_id))`), 'completed'],
          ],
        },
      });

      res.status(200).json({
        status: 200,
        data: lesson,
      });
    } catch (err) {
      next(err);
    }
  },

  createNewLesson: async (req, res, next) => {
    try {
      const { unitId, name, type, videoUrl, flashcardSetId, text, description } = req.body;

      const lesson = await db.Lesson.create({ unitId, name, type, videoUrl, flashcardSetId, text, description });

      res.status(200).json({
        status: 200,
        data: lesson,
      });
    } catch (err) {
      console.log(err);
      next(err);
    }
  },

  updateLesson: async (req, res, next) => {
    try {
      const { id } = req.params;
      const { unitId, name, type, videoUrl, flashcardSetId, text, description } = req.body;
      const lesson = await db.Lesson.update(
        { unitId, name, type, videoUrl, flashcardSetId, text, description },
        {
          where: {
            id: id,
          },
        },
      );

      res.status(200).json({
        status: 200,
        data: lesson,
      });
    } catch (err) {
      console.log(err);
      next(err);
    }
  },

  deleteLesson: async (req, res, next) => {
    try {
      const { id } = req.params;

      await db.Lesson.destroy({
        where: {
          id: id,
        },
      });

      res.status(200).json({
        status: 200,
        messsage: 'deleted lesson is success!',
      });
    } catch (err) {
      console.log(err);
      next(err);
    }
  },
};
