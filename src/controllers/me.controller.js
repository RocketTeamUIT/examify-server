const Op = require('sequelize').Op;
const db = require('../models/index');
const createError = require('http-errors');
const { sequelize } = require('../config/connectDB');

module.exports = {
  getMyCourses: async (req, res, next) => {
    try {
      // Get userId from middleware check login
      const userId = req?.payload?.userId || -1;
      // Query get all course from DB
      const courseList = await db.Course.findAll({
        where: {
          id: {
            [Op.in]: sequelize.literal(`(
                    SELECT course_id 
                    FROM join_course
                    WHERE student_id = ${userId}
                )`),
          },
        },
        attributes: {
          include: [
            [
              sequelize.literal(`(
                SELECT created_at 
                FROM join_course 
                WHERE course_id = "Course".course_id
                AND student_id = ${userId}
                )`),
              'timeJoined',
            ],
          ],
        },
        order: [[sequelize.literal('"timeJoined"'), 'DESC']],
      });

      res.status(200).json({
        status: 200,
        data: courseList,
      });
    } catch (err) {
      console.log(err);
      next(err);
    }
  },
};
