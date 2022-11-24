const express = require('express');
const pool = require('../config/db');
const router = express.Router();

// [GET] /course/:id -> get a course
router.get('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const course = await pool.query('SELECT * FROM course WHERE course_id = $1', [id]);

    res.json(course.rows[0]);
  } catch (err) {
    console.log(err.message);
  }
});

// [GET] /course -> get all courses
router.get('/', async (req, res) => {
  try {
    const allCourses = await pool.query('SELECT * FROM course');
    res.json(allCourses.rows);
  } catch (err) {
    console.log(err.message);
  }
});

// [POST] /course -> create new course
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

// [DELETE] /course/:id -> delete a course
router.delete('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const deleteCourse = await pool.query('DELETE FROM course WHERE course_id = $1', [id]);
    res.json('Course was deleted!');
  } catch (err) {
    console.log(err.message);
  }
});

// [UPDATE] /course/:id -> update a course
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
