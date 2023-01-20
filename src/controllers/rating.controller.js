const db = require('../models/index');
const sequelize = require('../config/connectDB');

module.exports = {
  getRatingCourse: async (req, res, next) => {
    try {
      const userId = req?.payload?.user?.id || -1;
      const { courseId } = req.params;

      const rated = await db.Rating.findOne({
        attributes: {
          exclude: ['createdAt', 'updatedAt'],
        },
        where: {
          courseId: courseId,
          studentId: userId,
        },
      });

      res.status(200).json({
        status: 200,
        data: rated,
      });
    } catch (err) {
      next(err);
    }
  },

  ratingCourse: async (req, res, next) => {
    try {
      const userId = req?.payload?.user?.id || -1;
      const { courseId } = req.params;
      const { rate } = req.body;

      await db.Rating.create({
        studentId: userId,
        courseId: courseId,
        rate: rate,
      });

      res.status(200).json({
        status: 200,
        message: 'successful course rating!',
      });
    } catch (err) {
      next(err);
    }
  },

  changeRating: async (req, res, next) => {
    try {
      const userId = req?.payload?.user?.id || -1;
      const { courseId } = req.params;
      const { rate } = req.body;

      await db.Rating.update(
        { rate },
        {
          where: {
            studentId: userId,
            courseId: courseId,
          },
        },
      );

      res.status(200).json({
        status: 200,
        message: 'updated rating course successful!',
      });
    } catch (err) {
      next(err);
    }
  },

  clearRating: async (req, res, next) => {
    try {
      const userId = req?.payload?.user?.id || -1;
      const { courseId } = req.params;

      await db.Rating.destroy({
        where: {
          studentId: userId,
          courseId: courseId,
        },
      });

      res.status(200).json({
        status: 200,
        message: 'deleted rating course successful!',
      });
    } catch (err) {
      next(err);
    }
  },
};
