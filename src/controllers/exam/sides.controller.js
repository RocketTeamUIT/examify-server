const db = require('../../models/index');
const { sequelize } = require('../../config/connectDB');

module.exports = {
  getAllSideInSetQsn: async (req, res, next) => {
    try {
      const setQuestionId = req?.params?.setQuestionId;

      const listSide = await db.Side.findAll({
        where: {
          setQuestionId,
        },
        order: [['seq', 'ASC']],
      });

      res.status(200).json({
        status: 200,
        data: listSide,
      });
    } catch (err) {
      next(err);
    }
  },

  getSide: async (req, res, next) => {
    try {
      const sideId = req?.params?.id;
      const sideData = await db.Side.findOne({
        where: {
          id: sideId,
        },
      });

      res.status(200).json({
        status: 200,
        data: sideData,
      });
    } catch (err) {
      next(err);
    }
  },

  updateSide: async (req, res, next) => {
    try {
      const sideId = await req?.params?.id;
      const { setQuestionId, paragraph, numericOrder } = req.body;

      await db.Side.update(
        {
          setQuestionId,
          paragraph,
          numericOrder,
        },
        {
          where: {
            id: sideId,
          },
        },
      );

      res.status(200).json({
        status: 200,
        message: 'Updated a side success!',
      });
    } catch (err) {
      next(err);
    }
  },

  createSide: async (req, res, next) => {
    try {
      const { setQuestionId, paragraph } = req.body;

      const maxNumOrder = await sequelize.query(`
        SELECT seq AS "max_num" 
        FROM side 
        WHERE set_question_id = ${setQuestionId} 
        ORDER BY seq DESC
        LIMIT 1`);

      const numericOrder = ++maxNumOrder[0][0].max_num;

      const newSide = await db.Side.create({
        setQuestionId,
        paragraph,
        numericOrder,
      });

      res.status(200).json({
        status: 200,
        message: 'Created new Side success!',
        data: newSide,
      });
    } catch (err) {
      next(err);
    }
  },

  deleteSide: async (req, res, next) => {
    try {
      const sideId = await req?.params?.id;

      await sequelize.query(`DELETE FROM side WHERE side_id = ${sideId}`);

      res.status(200).json({
        status: 200,
        message: 'deleted a side success!',
      });
    } catch (err) {
      next(err);
    }
  },
};
