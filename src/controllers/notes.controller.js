const Op = require('sequelize').Op;
const db = require('../models/index');
const createError = require('http-errors');
const { sequelize } = require('../config/connectDB');
const { where } = require('sequelize');

module.exports = {
  getNote: async (req, res, next) => {
    try {
      const userId = req?.payload?.userId || -1;
      const { id } = req.params;
      const note = await db.Note.findOne({
        attributes: {
          exclude: ['studentId', 'lessonId'],
        },
        where: {
          id: id,
          studentId: userId,
        },
      });
      res.status(200).json({
        status: 200,
        data: note,
      });
    } catch (err) {
      console.log(err);
      next(err);
    }
  },

  getAllNoteInCourse: async (req, res, next) => {
    try {
      const userId = req?.payload?.userId || -1;
      const { courseId } = req?.params;
      const notes = await db.Note.findAll({
        attributes: ['id', 'note', 'createdAt', 'updatedAt'],
        where: {
          id: {
            [Op.in]: sequelize.literal(`(
                    SELECT note_id
                    FROM note
                    INNER JOIN lesson ON note.lesson_id = lesson.lesson_id
                    INNER JOIN unit ON lesson.unit_id = unit.unit_id
                    INNER JOIN chapter ON unit.chapter_id = chapter.chapter_id
                    WHERE chapter.course_id = ${courseId}
                    AND student_id = ${userId}
                )`),
          },
        },
        order: [[sequelize.literal('created_at'), 'DESC']],
      });

      res.status(200).json({
        status: 200,
        data: notes,
      });
    } catch (err) {
      console.log(err);
      next(err);
    }
  },

  getAllNoteInChapter: async (req, res, next) => {
    try {
      const userId = req?.payload?.userId || -1;
      const { chapterId } = req?.params;
      const notes = await db.Note.findAll({
        attributes: ['id', 'note', 'createdAt', 'updatedAt'],
        where: {
          id: {
            [Op.in]: sequelize.literal(`(
                      SELECT note_id
                      FROM note
                      INNER JOIN lesson ON note.lesson_id = lesson.lesson_id
                      INNER JOIN unit ON lesson.unit_id = unit.unit_id
                      WHERE unit.chapter_id = ${chapterId}
                      AND student_id = ${userId}
                  )`),
          },
        },
        order: [[sequelize.literal('created_at'), 'DESC']],
      });

      res.status(200).json({
        status: 200,
        data: notes,
      });
    } catch (err) {
      console.log(err);
      next(err);
    }
  },

  getAllNoteInUnit: async (req, res, next) => {
    try {
      const userId = req?.payload?.userId || -1;
      const { unitId } = req?.params;
      const notes = await db.Note.findAll({
        attributes: ['id', 'note', 'createdAt', 'updatedAt'],
        where: {
          id: {
            [Op.in]: sequelize.literal(`(
                      SELECT note_id
                      FROM note
                      INNER JOIN lesson ON note.lesson_id = lesson.lesson_id
                      WHERE lesson.unit_id = ${unitId}
                      AND student_id = ${userId}
                  )`),
          },
        },
        order: [[sequelize.literal('created_at'), 'DESC']],
      });

      res.status(200).json({
        status: 200,
        data: notes,
      });
    } catch (err) {
      console.log(err);
      next(err);
    }
  },

  getAllNoteInLesson: async (req, res, next) => {
    try {
      const userId = req?.payload?.userId || -1;
      const { lessonId } = req?.params;
      const notes = await db.Note.findAll({
        attributes: ['id', 'note', 'createdAt', 'updatedAt'],
        where: {
          lessonId: lessonId,
          studentId: userId,
        },
        order: [[sequelize.literal('created_at'), 'DESC']],
      });

      res.status(200).json({
        status: 200,
        data: notes,
      });
    } catch (err) {
      console.log(err);
      next(err);
    }
  },

  createNote: async (req, res, next) => {
    try {
      const userId = req?.payload?.userId || -1;
      const { note, lessonId } = req.body;
      const newNote = await db.Note.create({
        studentId: userId,
        lessonId,
        note,
      });
      res.status(200).json({
        status: 200,
        data: newNote,
      });
    } catch (err) {
      console.log(err);
      next(err);
    }
  },

  updateNote: async (req, res, next) => {
    try {
      const userId = req?.payload?.userId || -1;
      const { id } = req.params;
      const { note } = req.body;
      await db.Note.update(
        {
          note,
        },
        {
          where: {
            id: id,
            studentId: userId,
          },
        },
      );
      res.status(200).json({
        status: 200,
        message: 'updated note is success!',
      });
    } catch (err) {
      console.log(err);
      next(err);
    }
  },

  deleteNote: async (req, res, next) => {
    try {
      const userId = req?.payload?.userId || -1;
      const { id } = req.params;
      await db.Note.destroy({
        where: {
          id: id,
          studentId: userId,
        },
      });
      res.status(200).json({
        status: 200,
        message: 'deleted note is success!',
      });
    } catch (err) {
      console.log(err);
      next(err);
    }
  },
};
