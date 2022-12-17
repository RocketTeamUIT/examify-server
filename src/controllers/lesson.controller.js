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
      const { unitId, numericOrder, name, type, videoUrl, videoTime, flashcardSetId, text, description } = req.body;

      const lesson = await db.Lesson.create({
        unitId,
        numericOrder,
        name,
        type,
        videoUrl,
        videoTime,
        flashcardSetId,
        text,
        description,
      });

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
      const { unitId, numericOrder, name, type, videoUrl, videoTime, flashcardSetId, text, description } = req.body;
      await db.Lesson.update(
        { unitId, numericOrder, name, type, videoUrl, videoTime, flashcardSetId, text, description },
        {
          where: {
            id: id,
          },
        },
      );

      res.status(200).json({
        status: 200,
        message: 'updated lesson successful!',
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

  joinLesson: async (req, res, next) => {
    try {
      const userId = req?.payload?.userId;
      const { lessonId } = req.body;

      const joinLesson = await db.JoinLesson.create({
        studentId: userId,
        lessonId,
      });

      res.status(200).json({
        status: 200,
        data: joinLesson,
      });
    } catch (err) {
      console.log(err);
      next(err);
    }
  },

  getSlide: async (req, res, next) => {
    try {
      const { id } = req.params;

      const slides = await db.Slide.findAll({
        attributes: ['sequence', 'text'],
        where: {
          lessonId: id,
        },
        order: [['sequence', 'ASC']],
      });

      res.status(200).json({
        status: 200,
        data: slides,
      });
    } catch (err) {
      console.log(err);
      next(err);
    }
  },
};
