const Op = require('sequelize').Op;
const db = require('../../models/index');
const pool = require('../../config/db');
const createError = require('http-errors');
const { sequelize } = require('../../config/connectDB');
const { where } = require('sequelize');

module.exports = {
  getAllPartInExam: async (req, res, next) => {
    try {
      const examId = req?.params?.examId;

      const listPartData = await db.Part.findAll({
        where: {
          examId,
        },
        order: [['numericOrder', 'ASC']],
      });

      res.status(200).json({
        status: 200,
        data: listPartData,
      });
    } catch (err) {
      next(err);
    }
  },

  getPart: async (req, res, next) => {
    try {
      const partId = req?.params?.id;
      const partData = await db.Part.findOne({
        where: {
          id: partId,
        },
      });

      res.status(200).json({
        status: 200,
        data: partData,
      });
    } catch (err) {
      next(err);
    }
  },

  updatePart: async (req, res, next) => {
    try {
      const partId = await req?.params?.id;
      const { examId, name, numericOrder } = req.body;

      await db.Part.update(
        {
          examId,
          name,
          numericOrder,
        },
        {
          where: {
            id: partId,
          },
        },
      );

      res.status(200).json({
        status: 200,
        message: 'Updated Part success!',
      });
    } catch (err) {
      next(err);
    }
  },

  createPart: async (req, res, next) => {
    try {
      const { examId, name } = req.body;

      const maxNumOrder = await sequelize.query(`
        SELECT numeric_order AS "max_num" 
        FROM part 
        WHERE exam_id = 1 
        ORDER BY numeric_order DESC
        LIMIT 1`);

      const numericOrder = ++maxNumOrder[0][0].max_num;

      const newPart = await db.Part.create({
        examId,
        name,
        numericOrder,
      });

      res.status(200).json({
        status: 200,
        message: 'Created a new Part success!',
        data: newPart,
      });
    } catch (err) {
      next(err);
    }
  },
