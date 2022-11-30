const pool = require('../config/db');

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

  getAllCourses: async (req, res) => {
    try {
      const { uid } = req.params;
      const data = await pool.query('SELECT * FROM course');

      var courses = [];

      await Promise.all(
        data.rows.map(async (course) => {
          const data = await pool.query(
            `SELECT *
            FROM join_course
            WHERE student_id = $1
            AND course_id = $2`,
            [uid, course.course_id],
          );

          const isJoin = data.rowCount > 0 ? true : false;

          courses.push({
            id: course?.course_id,
            level: course?.level,
            isJoin: isJoin,
            name: course?.name,
            image: course?.image,
            charges: course?.charges,
            pointToUnlock: course?.point_to_unlock,
            pointReward: course?.point_reward,
            quantityRating: course?.quantity_rating,
            avgRating: course?.avg_rating,
            participants: course?.participants,
            price: course?.price,
            discount: course?.discount,
            totalChapter: course?.total_chapter,
            totalLesson: course?.total_lesson,
            totalVideoTime: course?.total_video_time,
            achieves: course?.achieves,
            description: course?.description,
            createAt: course?.created_at,
            updateAt: course?.updated_at,
          });
        }),
      );

      res.json(courses);

      //   res.json(allCourses);
    } catch (err) {
      console.log(err.message);
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
