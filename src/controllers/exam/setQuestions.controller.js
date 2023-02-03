const db = require('../../models/index');
const { sequelize } = require('../../config/connectDB');

module.exports = {
  getAllSetQuestionInPart: async (req, res, next) => {
    try {
      const partId = req?.params?.partId;

      const listSetQuestion = await db.SetQuestion.findAll({
        where: {
          partId,
        },
        order: [['numericOrder', 'ASC']],
      });

      res.status(200).json({
        status: 200,
        data: listSetQuestion,
      });
    } catch (err) {
      next(err);
    }
  },

  getSetQuestion: async (req, res, next) => {
    try {
      const setQuestionId = req?.params?.id;

      const setQuestion = await db.SetQuestion.findOne({
        where: {
          id: setQuestionId,
        },
      });

      res.status(200).json({
        status: 200,
        data: setQuestion,
      });
    } catch (err) {
      next(err);
    }
  },

  updateSetQuestion: async (req, res, next) => {
    try {
      const setQuestionId = req?.params?.id;

      const { partId, title, audio, numericOrder } = req.body;

      await db.SetQuestion.update(
        {
          partId,
          title,
          audio,
          numericOrder,
        },
        {
          where: {
            id: setQuestionId,
          },
        },
      );

      res.status(200).json({
        status: 200,
        message: 'Updated set question success!',
      });
    } catch (err) {
      next(err);
    }
  },

  createSetQuestion: async (req, res, next) => {
    try {
      const { partId, title, audio } = req.body;

      const maxNumOrder = await sequelize.query(`
        SELECT numeric_order AS "max_num" 
        FROM set_question 
        WHERE part_id = ${partId} 
        ORDER BY numeric_order DESC
        LIMIT 1`);

      let numericOrder;
      if (maxNumOrder[0][0]) numericOrder = ++maxNumOrder[0][0].max_num;
      else numericOrder = 1;

      const newSetQuestion = await db.SetQuestion.create({
        partId,
        title,
        audio,
        numericOrder,
      });

      res.status(200).json({
        status: 200,
        message: 'Created set question success!',
        data: newSetQuestion,
      });
    } catch (err) {
      next(err);
    }
  },

  deleteSetQuestion: async (req, res, next) => {
    try {
      const setQuestionId = req?.params?.id;

      await sequelize.query(`SELECT fn_delete_set_question(${setQuestionId})`);

      res.status(200).json({
        status: 200,
        message: 'Deleted set question success!',
      });
    } catch (err) {
      next(err);
    }
  },
};
