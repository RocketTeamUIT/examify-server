const pool = require('../config/db');
const createError = require('http-errors');

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

  getCourse: async (req, res) => {
    try {
      const { id } = req.params;
      const course = await pool.query('SELECT * FROM course WHERE course_id = $1', [id]);

      res.json(course.rows[0]);
    } catch (err) {
      console.log(err.message);
    }
  },

  getAllCourses: (req, res, next) => {
    try {
      // Get userId from middleware check login
      const { userId } = req.payload || -1;

      // Course query
      pool.query(
        `SELECT *, CASE WHEN TEM.tem_course_id = course.course_id THEN true ELSE false END as is_joined
        FROM course
        LEFT JOIN (
            SELECT course_id AS tem_course_id
            FROM join_course
            WHERE student_id = $1
        ) AS TEM ON course.course_id = TEM.tem_course_id;`,
        [userId],
        (err, result) => {
          if (err) {
            throw createError.InternalServerError("Maybe there's something wrong with our server");
          }

          // Get origin course list from query
          const originCourseList = result.rows;

          // object mapping
          const courseList = originCourseList.map((originCourseItem) => ({
            id: originCourseItem.course_id,
            level: originCourseItem.level,
            isJoin: originCourseItem.is_joined,
            name: originCourseItem.name,
            image: originCourseItem?.image,
            charges: originCourseItem?.charges,
            pointToUnlock: originCourseItem?.point_to_unlock,
            pointReward: originCourseItem?.point_reward,
            quantityRating: originCourseItem?.quantity_rating,
            avgRating: originCourseItem?.avg_rating,
            participants: originCourseItem?.participants,
            price: originCourseItem?.price,
            discount: originCourseItem?.discount,
            totalChapter: originCourseItem?.total_chapter,
            totalLesson: originCourseItem?.total_lesson,
            totalVideoTime: originCourseItem?.total_video_time,
            achieves: originCourseItem?.achieves,
            description: originCourseItem?.description,
          }));

          res.status(200).json({ data: courseList });
        },
      );
    } catch (err) {
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
  updateParticipant: async (req, res, next) => {
    try {
      // Get courseId from req.params
      const { courseId } = req.params;

      // Check exist courseId params
      if (!courseId) {
        throw createError.BadRequest('Missing path parameter');
      }

      // Query update participant up one unit
      pool.query('CALL increase_one_participant_course($1)', [courseId], (err, result) => {
        if (err) {
          throw createError.InternalServerError("Maybe there's something wrong with our server");
        }

        res.status(200).json({
          status: 200,
          message: 'Update pariticipant successfully',
        });
      });
    } catch (err) {
      next(err);
    }
  },
};
