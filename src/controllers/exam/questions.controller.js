const db = require('../../models/index');
const { sequelize } = require('../../config/connectDB');

module.exports = {
  getAllQuestionInSetQsn: async (req, res, next) => {
    try {
      const setQuestionId = req?.params?.setQuestionId;

      const listQuestion = await db.Question.findAll({
        where: {
          setQuestionId,
        },
        include: [
          {
            model: db.Choice,
            as: 'choiceList',
          },
        ],
        order: [['order', 'ASC']],
      });

      const formattedQuestionData = listQuestion.map((item) => {
        const { choiceList, ...jsonItem } = item.toJSON();
        return {
          ...jsonItem,
          choices: choiceList,
        };
      });

      res.status(200).json({
        status: 200,
        data: formattedQuestionData,
      });
    } catch (err) {
      next(err);
    }
  },

  getQuestion: async (req, res, next) => {
    try {
      const questionId = req?.params?.id;

      const questionData = await db.Question.findOne({
        where: {
          id: questionId,
        },
        include: [
          {
            model: db.Choice,
            as: 'choiceList',
          },
        ],
      });

      res.status(200).json({
        status: 200,
        data: questionData,
      });
    } catch (err) {
      next(err);
    }
  },

  updateQuestion: async (req, res, next) => {
    const questionId = req?.params?.id;
    const { setQuestionId, name, level, hashtagId, explain, choices, numericOrder } = req.body;

    // update question infor
    await db.Question.update(
      {
        setQuestionId,
        name,
        level,
        hashtagId,
        explain,
        order: numericOrder,
      },
      {
        where: {
          id: questionId,
        },
      },
    );

    // update choices of question
    if (choices)
      await db.Choice.bulkCreate(
        choices.map((choice, index) => ({
          id: choice.id,
          name: choice.name,
          key: choice.key,
          orderChoice: ++index,
        })),
        {
          updateOnDuplicate: ['name', 'key'],
        },
      );

    try {
      res.status(200).json({
        status: 200,
        data: 'Updated question success!',
      });
    } catch (err) {
      next(err);
    }
  },

  createQuestion: async (req, res, next) => {
    const { setQuestionId, name, level, hashtagId, explain, choices } = req.body;

    const maxNumOrder = await sequelize.query(`
        SELECT order_qn AS "max_num" 
        FROM question 
        WHERE set_question_id = ${setQuestionId} 
        ORDER BY order_qn DESC
        LIMIT 1`);

    let numericOrder;
    if (maxNumOrder[0][0]) numericOrder = ++maxNumOrder[0][0].max_num;
    else numericOrder = 1;

    // create Question
    const newQuestion = await db.Question.create({
      setQuestionId,
      name,
      level,
      hashtagId,
      explain,
      order: numericOrder,
    });

    // create bulk Choice refer to Question
    const newListChoice = await db.Choice.bulkCreate(
      choices.map((choice, index) => ({
        questionId: newQuestion.dataValues.id,
        name: choice.name,
        key: choice.key,
        orderChoice: ++index,
      })),
    );

    // nested return data
    newQuestion.dataValues.newChoices = newListChoice;

    try {
      res.status(200).json({
        status: 200,
        newQuestion,
      });
    } catch (err) {
      next(err);
    }
  },

  deleteQuestion: async (req, res, next) => {
    try {
      const questionId = req?.params?.id;

      await sequelize.query(`SELECT fn_delete_question(${questionId})`);

      res.status(200).json({
        status: 200,
        data: 'Deleted a question success!',
      });
    } catch (err) {
      next(err);
    }
  },
};
