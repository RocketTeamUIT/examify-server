const Op = require('sequelize');
const db = require('../models/index');
const pool = require('../config/db');
const createError = require('http-errors');
const { sequelize } = require('../config/connectDB');

module.exports = {
  unitInCompleted: async (req, res) => {
    try {
      const { id, uid } = req.params;
      // get the list of units that the user has not completed
      const listUnit = await pool.query(
        `SELECT unit.unit_id, unit.name
        FROM unit 
            LEFT JOIN lesson ON unit.unit_id = lesson.unit_id
            INNER JOIN join_lesson ON lesson.lesson_id = join_lesson.lesson_id
        WHERE student_id = $1 
        AND unit.unit_id IN (
            SELECT unit_id
            FROM unit
            WHERE unit.chapter_id IN(
                SELECT chapter_id
                FROM chapter
                WHERE chapter.course_id = $2
            )
        )
        GROUP BY unit.unit_id
        HAVING unit.total_lesson > COUNT(*)`,
        [uid, id],
      );

      var unfinishedLesson = listUnit.rows.reduce((acc, curr) => {
        acc.push({
          id: curr.unit_id,
          nameUnit: curr.unit_id,
        });
        return acc;
      }, []);

      // get list lesson for each unit
      await Promise.all(
        unfinishedLesson.map(async (unit) => {
          listLesson = await pool.query(
            `SELECT lesson_id, name, type
                  FROM lesson
                  WHERE lesson.unit_id = $1
                  AND lesson_id NOT IN(
                      SELECT lesson_id
                      FROM join_lesson
                      WHERE student_id = $2
                  )`,
            [unit.id, uid],
          );
          // add field lesson array for each unit
          unit.lessons = listLesson.rows.reduce((acc, curr) => {
            acc.push({
              id: curr.lesson_id,
              nameLesson: curr.name,
              type: curr.type,
            });
            return acc;
          }, []);
        }),
      );

      res.json(unfinishedLesson);
    } catch (err) {
      console.log(err.message);
    }
  },

  lessonQntInWeek: async (req, res) => {
    try {
      const { id, uid } = req.params;
      const learned = {
        videoLessonQnt: 0,
        textLessonQnt: 0,
        flashcardLessonQnt: 0,
      };

      const data = await pool.query(
        `SELECT type, COUNT (*)
        FROM join_lesson AS JLS LEFT JOIN lesson
        ON JLS.lesson_id = lesson.lesson_id
        WHERE JLS.student_id = $1 
        AND JLS.created_at >= NOW() - INTERVAL '7 day'
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
        [uid, id],
      );

      data.rows.map((data) => {
        if (data.type === 1) {
          learned.videoLessonQnt = data.count;
        } else if (data.type === 2) {
          learned.textLessonQnt = data.count;
        } else if (data.type === 3) {
          learned.flashcardLessonQnt = data.count;
        }
      });

      res.json(learned);
    } catch (err) {
      console.log(err.message);
    }
  },

  getCourse: async (req, res, next) => {
    try {
      let { id } = req.params;
      // let { userId } = req.payload;
      let userId = 4;
      let depth = req.query.depth || '1';
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
            },
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
            },
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
            },
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

      res.status(200).json({ data: course });
    } catch (err) {
      next(err);
    }
  },

  getAllCourses: async (req, res, next) => {
    try {
      // Get userId from middleware check login
      const { userId } = req.payload || -1;
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
      });

      res.status(200).json({ data: courseList });
    } catch (err) {
      console.log(err);
      next(err);
    }
  },

  createNewCourse: async (req, res) => {
    try {
      const { name, description, participants } = req.body;
      console.log(req.body);
      const newCourse = await pool.query(
        'INSERT INTO course (name, description, participants) VALUES($1, $2, $3) RETURNING *',
        [name, description, participants],
      );

      res.json(newCourse.rows[0]);
    } catch (err) {
      console.log(err.message);
    }
  },

  deleteCourse: async (req, res) => {
    try {
      const { id } = req.params;
      const deleteCourse = await pool.query('DELETE FROM course WHERE course_id = $1', [id]);
      res.json('Course was deleted!');
    } catch (err) {
      console.log(err.message);
    }
  },

  updateCourse: async (req, res) => {
    try {
      const { id } = req.params;
      const { name, description, participants } = req.body;
      const updateCourse = await pool.query(
        'UPDATE course SET name = $1, description = $2, participants = $3 WHERE course_id = $4',
        [name, description, participants, id],
      );

      res.json('Course was updated!');
    } catch (err) {
      console.log(err.message);
    }
  },
};
