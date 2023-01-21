const Op = require('sequelize');
const db = require('../../models/index');
const pool = require('../../config/db');
const createError = require('http-errors');
const { sequelize } = require('../../config/connectDB');

module.exports = {
  getAllExam: async (req, res, next) => {
    try {
      const userId = req?.payload?.user?.id || -1;

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
};
