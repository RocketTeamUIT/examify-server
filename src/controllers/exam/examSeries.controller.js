const { sequelize } = require('../../config/connectDB');
const db = require('../../models/index');

module.exports = {
  getAllExamSeries: async (req, res, next) => {
    try {
      const listSeriesData = await db.ExamSeries.findAll({
        order: [['id', 'ASC']],
      });

      res.status(200).json({
        status: 200,
        data: listSeriesData,
      });
    } catch (err) {
      next(err);
    }
  },

  getExamSeries: async (req, res, next) => {
    try {
      const examSeriesId = req?.params?.id;

      const examSeriesData = await db.ExamSeries.findOne({
        where: {
          id: examSeriesId,
        },
      });

      res.status(200).json({
        status: 200,
        data: examSeriesData,
      });
    } catch (err) {
      next(err);
    }
  },

  createExamSeries: async (req, res, next) => {
    try {
      const { name, author, createBy } = req.body;

      const newSeries = await db.ExamSeries.create({
        name,
        author,
        createBy,
      });

      res.status(200).json({
        status: 200,
        message: 'created an exam series success!',
        data: newSeries,
      });
    } catch (err) {
      next(err);
    }
  },

  updateExamSeries: async (req, res, next) => {
    try {
      const examSeriesId = req?.params?.id;
      const { name, author } = req.body;

      await db.ExamSeries.update(
        {
          name,
          author,
        },
        {
          where: {
            id: examSeriesId,
          },
        },
      );

      res.status(200).json({
        status: 200,
        message: 'updated an exam series success!',
      });
    } catch (err) {
      next(err);
    }
  },

  deleteExamSeries: async (req, res, next) => {
    try {
      const examSeriesId = req?.params?.id;

      await db.ExamSeries.destroy({
        where: {
          id: examSeriesId,
        },
      });

      res.status(200).json({
        status: 200,
        message: 'deleted an exam series success!',
      });
    } catch (err) {
      next(err);
    }
  },
};
