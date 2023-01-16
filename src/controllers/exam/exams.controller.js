const Op = require('sequelize');
const db = require('../../models/index');
const pool = require('../../config/db');
const createError = require('http-errors');
const { sequelize } = require('../../config/connectDB');

module.exports = {
  getAllExam: async (req, res, next) => {
    try {
      const userId = req?.payload?.userId || -1;

      const listExam = await db.Exam.findAll({
        attributes: {
          include: [
            [
              // Query add field "isJoin" to check user is joined course
              sequelize.literal(`(
                SELECT CASE WHEN COUNT(*) > 0 THEN true ELSE false END
                FROM exam_taking
                WHERE user_id = ${userId}
                AND exam_id = "Exam".exam_id
              )`),
              'isJoin',
            ],
          ],
        },
      });

      res.status(200).json({
        status: 200,
        data: listExam,
      });
    } catch (err) {
      next(err);
    }
  },

  getDetailExam: async (req, res, next) => {
    try {
      const userId = req?.payload?.userId || -1;
      const { id } = req.params;

      const exam = await db.Exam.findOne({
        where: {
          id: id,
        },
        include: [
          {
            model: db.ExamTaking,
            as: 'historyTaking',
            where: {
              userId: userId,
            },
            required: false,
            attributes: {
              exclude: ['examId', 'userId'],
              include: [
                [
                  sequelize.literal(`(
                  SELECT array_agg(name)
                  FROM part_option, part, exam_taking
                  WHERE part_option.part_id = part.part_id
                  AND part_option.exam_taking_id = exam_taking.exam_taking_id
                  AND part_option.exam_taking_id = "historyTaking".exam_taking_id
                )`),
                  'PartOptions',
                ],
              ],
            },
          },
          {
            model: db.Part,
            as: 'parts',
            attributes: {
              exclude: ['examId', 'totalQuestion', 'numberOfExplaination', 'numericOrder', 'createdAt', 'updatedAt'],
              include: [
                [
                  sequelize.literal(`(
                    SELECT array_agg(hashtag.name)
                    FROM part LEFT JOIN set_question ON part.part_id = set_question.part_id
                    LEFT JOIN question ON set_question.set_question_id = question.set_question_id
                    LEFT JOIN hashtag ON question.hashtag_id = hashtag.hashtag_id
                    WHERE part.part_id = "parts".part_id
                )`),
                  'listHashtag',
                ],
              ],
            },
            order: [['numericOrder', 'ASC']],
          },
        ],
      });

      res.status(200).json({
        status: 200,
        data: exam,
      });
    } catch (err) {
      next(err);
    }
  },

  examTaking: async (req, res, next) => {
    try {
      const userId = req?.payload?.userId || -1;
      const { examId, timeFinished, partIds } = req.body;

      const examTaking = await db.ExamTaking.create({ examId, userId, timeFinished });

      await db.PartOption.bulkCreate(
        partIds.map((partId) => ({
          examTakingId: examTaking.id,
          partId,
        })),
      );

      res.status(200).json({
        status: 200,
        message: 'create new examTaking successfully!',
        data: {
          examTakingId: examTaking.id,
        },
      });
    } catch (err) {
      next(err);
    }
  },
};
