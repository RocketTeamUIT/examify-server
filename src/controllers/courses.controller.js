const Op = require('sequelize').Op;
const db = require('../models/index');
const pool = require('../config/db');
const createError = require('http-errors');
const { sequelize } = require('../config/connectDB');

module.exports = {
  searchCourse: async (req, res, next) => {
    try {
      const userId = req?.payload?.user?.id || -1;
      const key = req?.query?.key;
      // limit == null: get all result
      const limit = req?.query?.limit || null;

      const courseList = await db.Course.findAll({
        attributes: {
          include: [
            [
              // Query add field "isJoin" to check user is joined course
              sequelize.literal(`(SELECT * FROM check_join_course(${userId}, "Course".course_id))`),
              'isJoin',
            ],
          ],
        },
        where: {
          [Op.or]: [{ name: { [Op.iLike]: `%${key}%` } }, { level: { [Op.iLike]: `%${key}%` } }],
        },
        limit: limit,
      });

      res.status(200).json({
        status: 200,
        data: courseList,
      });
    } catch (err) {
      next(err);
    }
  },

  enrrollChargesCourse: async (req, res, next) => {
    try {
      const { id } = req.params;
      const userId = req?.payload?.user?.id;

      const data = await pool.query(`SELECT fn_enroll_course_charges(${userId}, ${id}) AS joined`);

      let joined = data.rows[0]['joined'];

      if (joined === true) {
        res.status(200).json({
          status: 200,
          message: 'user enroll course success!',
          data: {
            enroll: true,
          },
        });
      } else {
        res.status(200).json({
          status: 200,
          message: 'This is not a charges course',
          data: {
            enroll: false,
          },
        });
      }
    } catch (err) {
      next(err);
    }
  },

  enrrollCourse: async (req, res, next) => {
    try {
      const { id } = req.params;
      const userId = req?.payload?.user?.id || -1;

      const data = await pool.query(`
        SELECT fn_enroll_course(${userId}, ${Number(id)}) AS joined
      `);

      let joined = data.rows[0]['joined'];

      if (joined === true) {
        res.status(200).json({
          status: 200,
          message: 'user enroll course success!',
          data: {
            enroll: true,
          },
        });
      } else {
        res.status(200).json({
          status: 200,
          message: 'accumulated points are not enough to enroll course',
          data: {
            enroll: false,
          },
        });
      }
    } catch (err) {
      console.log(err);
      next(err);
    }
  },

  unitInCompleted: async (req, res, next) => {
    try {
      const { id } = req.params;
      const userId = req?.payload?.user?.id || -1;
      const listInCompeleted = await db.Unit.findAll({
        attributes: ['id', 'name'],
        // Get unitId that user is not completed
        where: {
          id: {
            [Op.in]: sequelize.literal(`
          (
            SELECT unit.unit_id
            FROM unit
              LEFT JOIN lesson ON unit.unit_id = lesson.unit_id
              INNER JOIN join_lesson ON lesson.lesson_id = join_lesson.lesson_id
            WHERE student_id = ${userId}
            AND unit.unit_id IN (
              SELECT unit_id
              FROM unit
              WHERE unit.chapter_id IN(
                SELECT chapter_id
                FROM chapter
                WHERE chapter.course_id = ${id}
              )
            )
            GROUP BY unit.unit_id
            HAVING unit.total_lesson > COUNT(*)
          )`),
          },
        },
        // Get Lesson that user is not completed
        include: {
          model: db.Lesson,
          as: 'lessonList',
          attributes: ['id', 'name', 'type'],
          where: {
            id: {
              [Op.notIn]: sequelize.literal(`
              (
                  SELECT lesson_id
                  FROM join_lesson
                  WHERE student_id = ${userId}
              )`),
            },
          },
        },
      });

      res.status(200).json({
        status: 200,
        data: listInCompeleted,
      });
    } catch (err) {
      console.log(err.message);
      next(err);
    }
  },

  lessonQntInWeek: async (req, res, next) => {
    try {
      const { id } = req.params;
      const userId = req?.payload?.user?.id || -1;
      const learned = {
        videoLessonQnt: 0,
        textLessonQnt: 0,
        flashcardLessonQnt: 0,
      };

      const data = await pool.query(
        `SELECT type, COUNT(*) AS "quantityLearned"
        FROM join_lesson AS JLS LEFT JOIN lesson
        ON JLS.lesson_id = lesson.lesson_id
        WHERE JLS.student_id = $1 
        AND JLS.created_at >= (SELECT fn_monday_nearly())
        AND JLS.lesson_id IN(
            SELECT lesson_id
            FROM lesson
            WHERE lesson.unit_id IN(
            SELECT unit_id
            FROM unit
            WHERE unit.chapter_id IN(
                SELECT chapter_id
                FROM chapter
                WHERE course_id = $2 )))
        GROUP BY type;`,
        [userId, id],
      );

      data.rows.map((data) => {
        if (data.type === 1) {
          learned.videoLessonQnt = data.quantityLearned;
        } else if (data.type === 2) {
          learned.textLessonQnt = data.quantityLearned;
        } else if (data.type === 3) {
          learned.flashcardLessonQnt = data.quantityLearned;
        }
      });

      res.status(200).json({
        status: 200,
        data: learned,
      });
    } catch (err) {
      console.log(err.message);
      next(err);
    }
  },

  getCourse: async (req, res, next) => {
    try {
      let { id } = req.params;
      const userId = req?.payload?.user?.id || -1;
      let depth = req?.query?.depth || '1';
      let course = {};

      // Note:
      // statusLearned = null: not learned any lesson
      // statusLearned = 1: learned but not completed
      // statusLearned = 2: completed

      switch (depth) {
        // depth = 1:
        case '1':
          // Query get course
          course = await db.Course.findOne({
            attributes: {
              exclude: ['createBy', 'createdAt', 'updatedAt'],
              include: [
                [
                  // Query add field "isJoin" to check user is joined course
                  sequelize.literal(`(SELECT * FROM check_join_course(${userId}, "Course".course_id))`),
                  'isJoin',
                ],
              ],
            },
            where: {
              id: id,
            },
          });
          break;

        // depth = 2:
        case '2':
          // Query get course
          course = await db.Course.findOne({
            attributes: {
              exclude: ['createBy', 'createdAt', 'updatedAt'],
              include: [
                [
                  // Query add field "isJoin" to check user is joined course
                  sequelize.literal(`(SELECT * FROM check_join_course(${userId}, "Course".course_id))`),
                  'isJoin',
                ],
              ],
            },
            order: [[{ model: db.Chapter, as: 'chapterList' }, 'numeric_order', 'ASC']],
            where: {
              id: id,
            },
            // Include Chapter
            include: [
              {
                model: db.Chapter,
                as: 'chapterList',
                attributes: {
                  exclude: ['courseId', 'createdAt', 'updatedAt'],
                  // add field statusLearned for Chapter
                  include: [
                    [
                      sequelize.literal(
                        `(SELECT * FROM get_status_learned_chapter(${userId}, "chapterList".chapter_id))`,
                      ),
                      'statusLearned',
                    ],
                  ],
                },
              },
            ],
          });
          break;

        // depth = 3:
        case '3':
          // Query get course
          course = await db.Course.findOne({
            attributes: {
              exclude: ['createBy', 'createdAt', 'updatedAt'],
              include: [
                [
                  // Query add field "isJoin" to check user is joined course
                  sequelize.literal(`(SELECT * FROM check_join_course(${userId}, "Course".course_id))`),
                  'isJoin',
                ],
              ],
            },
            order: [
              [{ model: db.Chapter, as: 'chapterList' }, 'numeric_order', 'ASC'],
              [{ model: db.Chapter, as: 'chapterList' }, { model: db.Unit, as: 'unitList' }, 'numeric_order', 'ASC'],
            ],
            where: {
              id: id,
            },
            // Include Chapter
            include: [
              {
                model: db.Chapter,
                as: 'chapterList',
                attributes: {
                  exclude: ['courseId', 'createdAt', 'updatedAt'],
                  // add field statusLearned for Chapter
                  include: [
                    [
                      sequelize.literal(
                        `(SELECT * FROM get_status_learned_chapter(${userId}, "chapterList".chapter_id))`,
                      ),
                      'statusLearned',
                    ],
                  ],
                },
                // Include Unit
                include: [
                  {
                    model: db.Unit,
                    as: 'unitList',
                    attributes: {
                      exclude: ['chapterId', 'createdAt', 'updatedAt'],
                      include: [
                        [
                          // add field statusLearned for Unit
                          sequelize.literal(
                            `(SELECT * FROM get_status_learned_unit(${userId}, "chapterList->unitList".unit_id))`,
                          ),
                          'statusLearned',
                        ],
                      ],
                    },
                  },
                ],
              },
            ],
          });
          break;

        // depth = 4:
        case '4':
          // Query get course
          course = await db.Course.findOne({
            attributes: {
              exclude: ['createBy', 'createdAt', 'updatedAt'],
              include: [
                [
                  // Query add field "isJoin" to check user is joined course
                  sequelize.literal(`(SELECT * FROM check_join_course(${userId}, "Course".course_id))`),
                  'isJoin',
                ],
              ],
            },
            order: [
              [{ model: db.Chapter, as: 'chapterList' }, 'numeric_order', 'ASC'],
              [{ model: db.Chapter, as: 'chapterList' }, { model: db.Unit, as: 'unitList' }, 'numeric_order', 'ASC'],
              [
                { model: db.Chapter, as: 'chapterList' },
                { model: db.Unit, as: 'unitList' },
                { model: db.Lesson, as: 'lessonList' },
                'numeric_order',
                'ASC',
              ],
            ],
            where: {
              id: id,
            },
            // Include Chapter
            include: [
              {
                model: db.Chapter,
                as: 'chapterList',
                attributes: {
                  exclude: ['courseId', 'createdAt', 'updatedAt'],
                  // add field statusLearned for Chapter
                  include: [
                    [
                      sequelize.literal(
                        `(SELECT * FROM get_status_learned_chapter(${userId}, "chapterList".chapter_id))`,
                      ),
                      'statusLearned',
                    ],
                  ],
                },
                // Include Unit
                include: [
                  {
                    model: db.Unit,
                    as: 'unitList',
                    attributes: {
                      exclude: ['chapterId', 'createdAt', 'updatedAt'],
                      include: [
                        [
                          // add field statusLearned for Unit
                          sequelize.literal(
                            `(SELECT * FROM get_status_learned_unit(${userId}, "chapterList->unitList".unit_id))`,
                          ),
                          'statusLearned',
                        ],
                      ],
                    },
                    // Include Lesson
                    include: [
                      {
                        model: db.Lesson,
                        as: 'lessonList',
                        attributes: {
                          exclude: ['unitId'],
                          include: [
                            // add field completed = true or false for Lesson
                            [
                              sequelize.literal(
                                `(SELECT * FROM check_completed_lesson(${userId}, "chapterList->unitList->lessonList".lesson_id))`,
                              ),
                              'completed',
                            ],
                          ],
                        },
                      },
                    ],
                  },
                ],
              },
            ],
          });
          break;

        default:
          console.log("Don't have depth equal to " + depth);
          next(createError.NotFound("Don't have depth equal to " + depth));
      }

      res.status(200).json({
        status: 200,
        data: course,
      });
    } catch (err) {
      next(err);
    }
  },

  getAllCourses: async (req, res, next) => {
    try {
      // Get userId from middleware check login
      const userId = req?.payload?.user?.id || -1;
      // Query get all course from DB
      const courseList = await db.Course.findAll({
        attributes: {
          include: [
            [
              // Query add field "isJoin" to check user is joined course
              sequelize.literal(`(SELECT * FROM check_join_course(${userId}, "Course".course_id))`),
              'isJoin',
            ],
          ],
        },
        order: [['total_chapter', 'desc']],
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

  getCoursePopular: async (req, res, next) => {
    try {
      // Get userId from middleware check login
      const userId = req?.payload?.user?.id || -1;
      // Get limit from query parameter
      const limit = req?.query?.limit || 4;

      const courseList = await db.Course.findAll({
        attributes: {
          include: [
            [
              // Query add field "isJoin" to check user is joined course
              sequelize.literal(`(SELECT * FROM check_join_course(${userId}, "Course".course_id))`),
              'isJoin',
            ],
          ],
        },
        order: [[sequelize.literal('participants'), 'DESC']],
        limit: limit,
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

  createNewCourse: async (req, res, next) => {
    try {
      const {
        name,
        image,
        level,
        charges,
        pointToUnlock,
        pointReward,
        price,
        discount,
        achieves,
        description,
        createBy,
      } = req.body;

      const course = await db.Course.create({
        name,
        image,
        level,
        charges,
        pointToUnlock,
        pointReward,
        price,
        discount,
        achieves,
        description,
        createBy,
      });

      res.status(200).json({
        status: 200,
        data: course,
      });
    } catch (err) {
      next(err);
    }
  },

  updateCourse: async (req, res, next) => {
    try {
      const { id } = req.params;
      const { name, image, level, charges, pointToUnlock, pointReward, price, discount, achieves, description } =
        req.body;

      await db.Course.update(
        {
          name,
          image,
          level,
          charges,
          pointToUnlock,
          pointReward,
          price,
          discount,
          achieves,
          description,
        },
        {
          where: {
            id: id,
          },
        },
      );

      res.status(200).json({
        status: 200,
        message: 'Updated course successful!',
      });
    } catch (err) {
      next(err);
    }
  },

  deleteCourse: async (req, res, next) => {
    try {
      const { id } = req.params;
      await pool.query(`SELECT fn_delete_course(${id})`);

      res.status(200).json({
        status: 200,
        message: 'Deleted course successful!',
      });
    } catch (err) {
      next(err);
    }
  },

  getStatistics: async (req, res, next) => {
    try {
      const join_count = await db.JoinCourse.count();
      const learnt_count = (
        await pool.query(
          'select c.course_id, jl.student_id, count(*) learnt_count from course c, chapter ch, unit u, lesson l, join_lesson jl where c.course_id = ch.course_id and ch.chapter_id = u.chapter_id and u.unit_id = l.unit_id and l.lesson_id = jl.lesson_id group by c.course_id, jl.student_id having count(*) = c.total_lesson;',
        )
      ).rowCount;
      const avg_rating_query = await db.Course.findOne({
        attributes: [[sequelize.fn('avg', sequelize.col('avg_rating')), 'avg_rating']],
        where: {
          avg_rating: {
            [Op.not]: 0,
          },
        },
      });
      const avg_rating = Math.round(parseFloat(avg_rating_query.toJSON().avg_rating) * 10) / 10;
      const rating_count = await db.Rating.count();
      const popular = await db.Course.findAll({
        order: [
          ['participants', 'DESC'],
          ['avg_rating', 'DESC'],
        ],
        limit: 5,
      });

      res.status(200).json({
        status: 200,
        data: {
          join_count,
          learnt_count,
          avg_rating,
          rating_count,
          popular,
        },
      });
    } catch (err) {
      next(err);
    }
  },

  getCourseStatistics: async (req, res, next) => {
    try {
      const id = req.params.id || -1;
      const year = req.query.year || new Date().getFullYear();

      const months = await pool.query(
        `SELECT COUNT(*) join_count, DATE_PART('month', created_at) as month FROM join_course WHERE course_id = ${id} AND DATE_PART('year', created_at) = ${year} GROUP BY DATE_PART('month', created_at)`,
      );

      const completed_months = await pool.query(
        `SELECT COUNT(*) completed_count, learnt_month as month FROM (select student_id, count(*) learnt_count, MAX(DATE_PART('month', jl.created_at)) learnt_month from chapter ch, unit u, lesson l, join_lesson jl where ch.course_id = ${id} and ch.chapter_id = u.chapter_id and u.unit_id = l.unit_id and l.lesson_id = jl.lesson_id AND DATE_PART('year', jl.created_at) = ${year} group by student_id having count(*) = (SELECT total_lesson FROM course WHERE course_id = ${id})) as TEMP GROUP BY month;`,
      );

      const rating = await pool.query(
        `select avg(rate) avg_rating, count(*) rating_count from rating where date_part('year', updated_at) = ${year} and course_id = ${id}`,
      );

      const result = {};
      result.months = Array(12)
        .fill(0)
        .map((_, i) => i + 1)
        .map((month) => ({
          month,
          join_count: parseInt(months.rows.find((value) => String(value.month) === String(month))?.join_count || 0),
          completed_count: parseInt(
            completed_months.rows.find((value) => String(value.month) === String(month))?.completed_count || 0,
          ),
        }));

      result.total_join_count = result.months.reduce((prev, curr) => {
        return prev + curr.join_count;
      }, 0);
      result.total_completed_count = result.months.reduce((prev, curr) => {
        return prev + curr.completed_count;
      }, 0);
      result.avg_rating = Math.round(parseInt(rating.rows[0]?.avg_rating || 0) * 10) / 10;
      result.rating_count = rating.rows[0]?.rating_count || 0;

      res.status(200).json({
        status: 200,
        data: result,
      });
    } catch (err) {
      next(err);
    }
  },
};
