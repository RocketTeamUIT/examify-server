const express = require('express');
const pool = require('../config/db');
const router = express.Router();
const createError = require('http-errors');
const { userValidate } = require('../utils/validation');

// [POST] /users/register -> create new user
router.post('/register', async (req, res, next) => {
  try {
    console.log('register function');
    const { email, firstname, lastname, password, passwordConfirmation } = req.body;

    // Validate fields
    const { error } = userValidate(req.body);
    if (error) {
      throw createError(error.details[0].message);
    }

    // Check email exits
    const isExist = await pool.query('SELECT * FROM users WHERE mail = $1', [email]);
    if (isExist.rows.length > 0) {
      throw createError.Conflict('This email is registered');
    }

    // Create new user
    const newUser = await pool.query(
      'INSERT INTO users (mail, password, first_name, last_name) VALUES($1, $2, $3, $4) RETURNING *',
      [email, password, firstname, lastname],
    );

    return res.json({
      status: 200,
      elements: newUser.rows[0],
    });
  } catch (err) {
    next(err);
  }
});

// [GET] /users -> get all user
router.get('/', async (req, res) => {
  try {
    const allUsers = await pool.query('SELECT * FROM users');
    res.json(allUsers.rows);
  } catch (err) {
    console.log(err.message);
  }
});

module.exports = router;
