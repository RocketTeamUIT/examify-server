const express = require('express');
const pool = require('../config/db');
const router = express.Router();

// [GET] /courses/:id/learned-in-week
router.get('/:id/learned-in-week/:uid', async (req, res) => {
  try {
    const { id, uid } = req.params;
    const learned = {
      videoLessonQnt: 0,
      textLessonQnt: 0,
      flashcardLessonQnt: 0,
    };

    const data = await pool.query(
      `
      SELECT type, COUNT (*)
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
      GROUP BY type;
      `,
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
});

// [GET] /courses/:id -> get a course
router.get('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const course = await pool.query('SELECT * FROM course WHERE course_id = $1', [id]);

    res.json(course.rows[0]);
  } catch (err) {
    console.log(err.message);
  }
});

// [GET] /courses -> get all courses
router.get('/', async (req, res) => {
  try {
    const allCourses = await pool.query('SELECT * FROM course');
    res.json(allCourses.rows);
  } catch (err) {
    console.log(err.message);
  }
});

// [POST] /courses -> create new course
router.post('/', async (req, res) => {
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
});

// [DELETE] /courses/:id -> delete a course
router.delete('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const deleteCourse = await pool.query('DELETE FROM course WHERE course_id = $1', [id]);
    res.json('Course was deleted!');
  } catch (err) {
    console.log(err.message);
  }
});

// [UPDATE] /courses/:id -> update a course
router.put('/:id', async (req, res) => {
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
});

module.exports = router;
