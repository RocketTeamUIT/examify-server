const Op = require('sequelize').Op;
const db = require('../../models/index');
const pool = require('../../config/db');
const createError = require('http-errors');
const { sequelize } = require('../../config/connectDB');
const { where } = require('sequelize');

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
      const { examId, partIds } = req.body;

      // task create an exam taking
      let createExamTaking = new Promise(async function (resolve) {
        const examTaking = await db.ExamTaking.create({ examId, userId });
        resolve(examTaking.id);
      });

      // task calculate total question belongs to list part
      let getTotalQuestion = new Promise(async function (resolve) {
        const totalQuestion = await db.Question.count({
          include: {
            model: db.SetQuestion,
            where: {
              partId: {
                [Op.in]: partIds,
              },
            },
          },
        });
        resolve(totalQuestion);
      });

      await Promise.all([createExamTaking, getTotalQuestion]).then(([examTakingId, totalQuestion]) => {
        // create list part option
        db.PartOption.bulkCreate(
          partIds.map((partId) => ({
            examTakingId: examTakingId,
            partId,
          })),
        );

        // update total question in examTaking
        db.ExamTaking.update(
          {
            totalQuestion,
          },
          {
            where: {
              id: examTakingId,
            },
          },
        );

        res.status(200).json({
          status: 200,
          message: 'create new examTaking successfully!',
          data: {
            examTakingId,
          },
        });
      });
    } catch (err) {
      next(err);
    }
  },

  getExamTaking: async (req, res, next) => {
    try {
      const examTakingId = req.params?.id;

      // get name exam and exam series
      const examName = await sequelize.query(`
        SELECT exam.name AS exam, exam_series.name AS examSeries
        FROM exam_taking, exam, exam_series
        WHERE exam_taking.exam_id = exam.exam_id
        AND exam.exam_series_id = exam_series.exam_series_id 
        AND exam_taking.exam_taking_id = 1`);

      // get list part id
      let listPartId = await db.PartOption.findAll({
        where: {
          examTakingId,
        },
        attributes: ['partId'],
      });

      listPartId = listPartId.map((object) => object.partId);

      // get content of exam
      const contentTaking = await db.Part.findAll({
        where: {
          id: {
            [Op.in]: listPartId,
          },
        },
        attributes: ['id', ['name', 'part']],
        include: [
          {
            model: db.SetQuestion,
            as: 'setQuestionList',
            attributes: ['id', 'title', 'audio'],
            include: [
              // include model Side
              {
                model: db.Side,
                as: 'side',
                attributes: ['seq', ['paragraph', 'content']],
              },
              // include model Question
              {
                model: db.Question,
                as: 'questionList',
                attributes: ['id', ['order_qn', 'seq'], 'name'],
                include: [
                  // include model Choice
                  {
                    model: db.Choice,
                    as: 'choiceList',
                    attributes: ['id', ['order_choice', 'seq'], ['name', 'content']],
                  },
                ],
              },
            ],
          },
        ],
        order: [
          // order in model Part
          [['numeric_order', 'ASC']],
          // order in model setQuestion
          [{ model: db.SetQuestion, as: 'setQuestionList' }, 'numeric_order', 'ASC'],
          // order in model Side
          [{ model: db.SetQuestion, as: 'setQuestionList' }, { model: db.Side, as: 'side' }, 'seq', 'ASC'],
          // order in model Question
          [
            { model: db.SetQuestion, as: 'setQuestionList' },
            { model: db.Question, as: 'questionList' },
            'order_qn',
            'ASC',
          ],
          // order in model Choice
          [
            { model: db.SetQuestion, as: 'setQuestionList' },
            { model: db.Question, as: 'questionList' },
            { model: db.Choice, as: 'choiceList' },
            'order_choice',
            'ASC',
          ],
        ],
      });

      res.status(200).json({
        status: 200,
        data: {
          ...examName[0][0],
          contentTaking,
        },
      });
    } catch (err) {
      next(err);
    }
  },
};
