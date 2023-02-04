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

  getExam: async (req, res, next) => {
    try {
      const userId = req?.payload?.user?.id || -1;
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

  getDetailExam: async (req, res, next) => {
    try {
      const examId = req?.params?.id;

      const examData = await db.Exam.findOne({
        where: {
          id: examId,
        },
        include: [
          {
            model: db.Part,
            as: 'parts',
            include: [
              {
                model: db.SetQuestion,
                as: 'setQuestionList',
                include: [
                  {
                    model: db.Question,
                    as: 'setQuestion',
                    include: [
                      {
                        model: db.Choice,
                        as: 'choiceList',
                      },
                      {
                        model: db.Hashtag,
                        as: 'hashtag',
                      },
                    ],
                  },
                  {
                    model: db.Side,
                    as: 'side',
                  },
                ],
              },
            ],
          },
        ],
        order: [
          // order in model Part
          [{ model: db.Part, as: 'parts' }, 'numeric_order', 'ASC'],
          // order in model setQuestion
          [{ model: db.Part, as: 'parts' }, { model: db.SetQuestion, as: 'setQuestionList' }, 'numeric_order', 'ASC'],
          // order in model Side
          [
            { model: db.Part, as: 'parts' },
            { model: db.SetQuestion, as: 'setQuestionList' },
            { model: db.Side, as: 'side' },
            'seq',
            'ASC',
          ],
          // order in model Question
          [
            { model: db.Part, as: 'parts' },
            { model: db.SetQuestion, as: 'setQuestionList' },
            { model: db.Question, as: 'setQuestion' },
            'order_qn',
            'ASC',
          ],
          // order in model Choice
          [
            { model: db.Part, as: 'parts' },
            { model: db.SetQuestion, as: 'setQuestionList' },
            { model: db.Question, as: 'setQuestion' },
            { model: db.Choice, as: 'choiceList' },
            'order_choice',
            'ASC',
          ],
        ],
      });

      res.status(200).json({
        status: 200,
        data: examData,
      });
    } catch (err) {
      next(err);
    }
  },

  createExam: async (req, res, next) => {
    try {
      const { name, examSeriesId, pointReward, duration, isFullExplanation, hashtag, audio, fileDownload } = req.body;

      const newExam = await db.Exam.create({
        name,
        examSeriesId,
        pointReward,
        duration,
        isFullExplanation,
        hashtag,
        audio,
        fileDownload,
      });

      res.status(200).json({
        status: 200,
        message: 'created new an exam success!',
        data: newExam,
      });
    } catch (err) {
      next(err);
    }
  },

  updateExam: async (req, res, next) => {
    try {
      const examId = req?.params?.id;
      const { name, examSeriesId, pointReward, duration, isFullExplanation, hashtag, audio, fileDownload } = req.body;

      await db.Exam.update(
        {
          name,
          examSeriesId,
          pointReward,
          duration,
          isFullExplanation,
          hashtag,
          audio,
          fileDownload,
        },
        {
          where: {
            id: examId,
          },
        },
      );

      res.status(200).json({
        status: 200,
        data: 'updated an exam success!',
      });
    } catch (err) {
      next(err);
    }
  },

  deleteExam: async (req, res, next) => {
    try {
      const examId = req?.params?.id;

      await sequelize.query(`SELECT fn_delete_exam(${examId})`);

      res.status(200).json({
        status: 200,
        data: 'deleted an exam success!',
      });
    } catch (err) {
      next(err);
    }
  },

  examTaking: async (req, res, next) => {
    try {
      const userId = req?.payload?.user?.id || -1;
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
        SELECT exam.name AS "examName", exam_series.name AS "examSeriesName", audio
        FROM exam_taking, exam, exam_series
        WHERE exam_taking.exam_id = exam.exam_id
        AND exam.exam_series_id = exam_series.exam_series_id 
        AND exam_taking.exam_taking_id = ${examTakingId}`);

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
                as: 'setQuestion',
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
            { model: db.Question, as: 'setQuestion' },
            'order_qn',
            'ASC',
          ],
          // order in model Choice
          [
            { model: db.SetQuestion, as: 'setQuestionList' },
            { model: db.Question, as: 'setQuestion' },
            { model: db.Choice, as: 'choiceList' },
            'order_choice',
            'ASC',
          ],
        ],
      });

      res.status(200).json({
        status: 200,
        ...examName[0][0],
        data: contentTaking,
      });
    } catch (err) {
      next(err);
    }
  },

  saveAnswer: async (req, res, next) => {
    try {
      const userId = req?.payload?.user?.id;
      const examTakingId = req?.params?.id;
      const { timeFinished, listAnswer } = req.body;

      if (!userId) {
        throw createError.NotFound('Unidentified user');
      }

      // Score the answer
      const numsOfCorrectQn = await db.Choice.count({
        where: {
          id: {
            [Op.in]: listAnswer.map((answer) => answer.choiceId),
          },
          key: true,
        },
      });

      // create multiple answer record
      try {
        await db.AnswerRecord.bulkCreate(
          listAnswer.map((answer) => ({
            examTakingId,
            ...answer,
          })),
        );
      } catch (err) {
        throw createError[400](err.name);
      }

      // update exam taking
      db.ExamTaking.update(
        {
          timeFinished,
          numsOfCorrectQn,
        },
        {
          where: {
            id: examTakingId,
          },
        },
      );

      res.status(200).json({
        status: 200,
        message: 'Answer list has been recorded!',
      });
    } catch (err) {
      next(err);
    }
  },

  getResultExam: async (req, res, next) => {
    try {
      const examTakingId = req?.params?.examTakingId;

      // get name exam and exam series
      const examName = await sequelize.query(`
        SELECT exam.name AS "examName", exam_series.name AS "examSeriesName"
        FROM exam_taking, exam, exam_series
        WHERE exam_taking.exam_id = exam.exam_id
        AND exam.exam_series_id = exam_series.exam_series_id
        AND exam_taking.exam_taking_id = ${examTakingId}`);

      // get info of examtaking
      const examTakingInfo = await db.ExamTaking.findOne({
        where: {
          id: examTakingId,
        },
        attributes: [['time_finished', 'duration'], ['updated_at', 'date'], 'totalQuestion', 'numsOfCorrectQn'],
      });

      // get list partId
      let listPartId = await db.PartOption.findAll({
        where: {
          examTakingId,
        },
        attributes: ['partId'],
      });

      listPartId = listPartId.map((object) => object.partId);
      console.log('check: ', listPartId);

      // get content and result of exam
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
                as: 'setQuestion',
                attributes: {
                  exclude: ['setQuestionId', 'hashtagId', 'level', 'createdAt', 'updatedAt'],
                  include: [
                    [
                      sequelize.literal(
                        `(SELECT check_answer(${examTakingId}, "setQuestionList->setQuestion"."question_id" ))`,
                      ),
                      'userAnswer',
                    ],
                    [
                      sequelize.literal(
                        `(SELECT choice_id FROM answer_record WHERE exam_taking_id = ${examTakingId} and question_id = "setQuestionList->setQuestion"."question_id")`,
                      ),
                      'userChoiceId',
                    ],
                  ],
                },
                include: [
                  // include model Choice
                  {
                    model: db.Choice,
                    as: 'choiceList',
                    attributes: ['id', ['order_choice', 'seq'], ['name', 'content'], 'key'],
                  },
                  // include model hashtag
                  {
                    model: db.Hashtag,
                    as: 'hashtag',
                    attributes: ['name'],
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
            { model: db.Question, as: 'setQuestion' },
            'order_qn',
            'ASC',
          ],
          // order in model Choice
          [
            { model: db.SetQuestion, as: 'setQuestionList' },
            { model: db.Question, as: 'setQuestion' },
            { model: db.Choice, as: 'choiceList' },
            'order_choice',
            'ASC',
          ],
        ],
      });

      res.status(200).json({
        status: 200,
        ...examName[0][0],
        duration: examTakingInfo.dataValues.duration,
        date: examTakingInfo.dataValues.date,
        result: {
          total: examTakingInfo.dataValues.totalQuestion,
          correct: examTakingInfo.dataValues.numsOfCorrectQn,
        },
        data: contentTaking,
      });
    } catch (err) {
      next(err);
    }
  },

  getExamTaking2: async (req, res, next) => {
    try {
      const { examId, partIds } = req.query;

      const examInfo = await db.Exam.findOne({
        where: {
          id: examId,
        },
        attributes: [['name', 'examName'], 'audio'],
        include: [
          {
            model: db.ExamSeries,
          },
        ],
        raw: true,
        nest: true,
      });

      const questionListGrByPart = await db.Part.findAll({
        where: {
          id: {
            [Op.in]: partIds,
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
                as: 'setQuestion',
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
            { model: db.Question, as: 'setQuestion' },
            'order_qn',
            'ASC',
          ],
          // order in model Choice
          [
            { model: db.SetQuestion, as: 'setQuestionList' },
            { model: db.Question, as: 'setQuestion' },
            { model: db.Choice, as: 'choiceList' },
            'order_choice',
            'ASC',
          ],
        ],
      });

      // Refactor object
      const info = { ...examInfo, examSeriesName: examInfo.ExamSery.name };
      delete info['ExamSery'];

      res.status(200).json({
        status: 200,
        ...info,
        data: questionListGrByPart,
      });
    } catch (err) {
      next(err);
    }
  },

  // getAllExamTaking: async (req, res, next) => {
  //   try {
  //     const userId = req?.payload?.user?.id || 1;

  //     const historyTaking = await db.ExamTaking.findAll({
  //       where: {
  //         userId,
  //       },
  //       include: [
  //         {
  //           model: db.Exam,
  //           as: 'exam',
  //           attributes: ['id', 'name'],
  //         },

  //         [db.PartOption.Part],
  //       ],
  //     });

  //     res.status(200).json({
  //       status: 200,
  //       data: historyTaking,
  //     });
  //   } catch (err) {
  //     next(err);
  //   }
  // },

  getStatistics: async (req, res, next) => {
    try {
      const exams_count = await db.Exam.count();
      const taking_count = await db.ExamTaking.count();
      const favorite_parts = await pool.query(
        'select name, CAST(count(po.part_id) as INT) from part p left join part_option po on p.part_id = po.part_id group by name order by CAST(count(po.part_id) as INT) desc, name asc limit 3;',
      );
      const average = await db.ExamTaking.findOne({
        attributes: [
          [sequelize.fn('AVG', sequelize.col('time_finished')), 'average_time'],
          [sequelize.fn('AVG', sequelize.col('nums_of_correct_qn')), 'average_correct_num'],
          [sequelize.fn('AVG', sequelize.col('total_question')), 'average_total_question'],
        ],
      });

      const popular_exams = await pool.query(
        'SELECT e.exam_id, name, CAST(COUNT(et.exam_taking_id) as INT) taking_count, CAST(COUNT(DISTINCT et.user_id) as INT) participants_count FROM exam e LEFT JOIN exam_taking et ON e.exam_id = et.exam_id GROUP BY e.exam_id, name ORDER BY taking_count DESC LIMIT 5',
      );

      const averageData = average.toJSON();

      res.status(200).json({
        status: 200,
        data: {
          exams_count,
          taking_count,
          favorite_parts: favorite_parts.rows,
          average: {
            time: averageData.average_time,
            score: Number(averageData.average_correct_num) / (Number(averageData.average_total_question) || 1),
          },
          popular_exams: popular_exams.rows,
        },
        message: 'Answer list has been recorded!',
      });
    } catch (err) {
      next(err);
    }
  },

  getExamStatistics: async (req, res, next) => {
    try {
      const id = req.params.id || -1;
      const year = req.query.year || new Date().getFullYear();
      const result = {};

      const exam_takings = await pool.query(
        'SELECT CAST(EXTRACT(MONTH FROM created_at) AS INT) AS month, CAST(COUNT(*) AS INT) taking_count, CAST(COUNT(DISTINCT user_id) AS INT) users_count FROM exam_taking WHERE exam_id = $1 AND EXTRACT(YEAR FROM created_at) = $2 GROUP BY month',
        [id, year],
      );
      const part_options = await pool.query(
        'SELECT CAST(EXTRACT(MONTH FROM po.created_at) AS INT) AS month, p.name, CAST(COUNT(po.created_at) AS INT) taking_count FROM exam_taking et, part p, part_option po WHERE po.exam_taking_id = et.exam_taking_id AND po.part_id = p.part_id AND et.exam_id = $1 AND EXTRACT(YEAR FROM po.created_at) = $2 GROUP BY month, p.name',
        [id, year],
      );
      const average = await db.ExamTaking.findOne({
        attributes: [
          [sequelize.fn('AVG', sequelize.col('time_finished')), 'average_time'],
          [sequelize.fn('AVG', sequelize.col('nums_of_correct_qn')), 'average_correct_num'],
          [sequelize.fn('AVG', sequelize.col('total_question')), 'average_total_question'],
        ],
        where: {
          examId: id,
          [Op.and]: [sequelize.literal(`EXTRACT(YEAR FROM created_at) = ${year}`)],
        },
      });

      const averageData = average.toJSON();

      const total_exam_takings = exam_takings.rows.reduce((prev, curr) => {
        return prev + Number(curr.taking_count);
      }, 0);

      const total_users = exam_takings.rows.reduce((prev, curr) => {
        return prev + Number(curr.users_count);
      }, 0);

      result.months = Array(12)
        .fill(0)
        .map((_, i) => i + 1)
        .map((month) => ({
          month,
          taking_count: 0,
          ...exam_takings.rows.find((item) => String(item.month) === String(month)),
        }));

      Array(7)
        .fill('')
        .map((_, i) => 'Part ' + (i + 1))
        .forEach((part) => {
          result[part] = Array(12)
            .fill(0)
            .map((_, i) => i + 1)
            .reduce(
              (prev, curr) => ({
                ...prev,
                [curr]: 0,
              }),
              {},
            );
        });

      part_options.rows.forEach((row) => {
        result[row.name] = {
          ...result[row.name],
          [row.month]: row.taking_count,
        };
      });

      const favorite_part = await pool.query(
        'SELECT name, CAST(COUNT(*) AS INT) parts_count FROM exam_taking et, part_option po, part p WHERE et.exam_taking_id = po.exam_taking_id AND po.part_id = p.part_id AND et.exam_id = $1 AND EXTRACT(YEAR FROM et.created_at) = $2 GROUP BY p.name ORDER BY parts_count DESC, name ASC LIMIT 1',
        [id, year],
      );

      res.status(200).json({
        status: 200,
        data: {
          ...result,
          total_exam_takings,
          total_users,
          favorite_part: favorite_part.rows[0],
          average: {
            time: averageData.average_time,
            score: Number(averageData.average_correct_num) / (Number(averageData.average_total_question) || 1),
          },
        },
      });
    } catch (err) {
      next(err);
    }
  },
};
