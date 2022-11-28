const express = require('express');
const pool = require('../config/db');
const router = express.Router();
const createError = require('http-errors');
const { registerValidate, loginValidate } = require('../utils/validation');
const bcrypt = require('bcrypt');
const { signAccessToken, verifyAccessToken, signRefreshToken, verifyRefreshToken } = require('../utils/jwt_service');

// [POST] /users/register -> create new user
router.post('/register', async (req, res, next) => {
  try {
    const email = req.body.email.toLowerCase(); // email lowercase
    const { firstname, lastname, password, passwordConfirmation } = req.body;

    // Validate fields
    const { error } = registerValidate(req.body);
    if (error) {
      throw createError(error.details[0].message);
    }

    // Check email exits
    const isExist = await pool.query('SELECT * FROM users WHERE mail = $1', [email]);
    if (isExist.rows.length > 0) {
      throw createError.Conflict('This email is registered');
    }

    // Hash password
    const salt = await bcrypt.genSalt(10);
    const hashPassword = await bcrypt.hash(password, salt);

    // Create new user
    const createUserFromQuery = await pool.query(
      'INSERT INTO users (mail, password, first_name, last_name) VALUES($1, $2, $3, $4) RETURNING *',
      [email, hashPassword, firstname, lastname],
    );
    const newUser = createUserFromQuery.rows[0];

    return res.json({
      status: 200,
      elements: newUser,
    });
  } catch (err) {
    next(err);
  }
});

// [POST] /users/login -> User login
router.post('/login', async (req, res, next) => {
  try {
    const email = req.body.email.toLowerCase(); // email lowercase
    const password = req.body.password;

    // Validate fields
    const { error } = loginValidate(req.body);
    if (error) {
      throw createError(error.details[0].message);
    }

    // Check email exits
    const isExist = await pool.query('SELECT * FROM users WHERE mail = $1', [email]);
    if (isExist.rows.length === 0) {
      throw createError.NotFound('User not register');
    }

    // Unhash & check password
    const passwordFromDb = await pool.query('SELECT password FROM users WHERE mail = $1', [email]);
    const hashPassword = passwordFromDb.rows[0].password;
    const isValid = await bcrypt.compare(password, hashPassword);
    if (!isValid) {
      throw createError.Unauthorized('Wrong password');
    }

    // Create access token & refresh token
    const accessToken = await signAccessToken(isExist.rows[0].user_id);
    const refreshToken = await signRefreshToken(isExist.rows[0].user_id);

    res.json({
      accessToken,
      refreshToken,
    });
  } catch (err) {
    next(err);
  }
});

// [POST] /users/logout
router.delete('/logout', async (req, res, next) => {
  try {
    const { refreshToken } = req.body;

    // Check refresh token exists
    if (!refreshToken) {
      throw createError.BadRequest();
    }

    // Verify refresh token & remove refresh token in DB
    const { userId } = await verifyRefreshToken(refreshToken);
    pool.query('UPDATE users SET refresh_token = $1 WHERE user_id = $2', ['', userId], (err, result) => {
      if (err) {
        throw createError.InternalServerError();
      }

      res.json({
        status: 200,
        message: 'Logout!',
      });
    });
  } catch (error) {
    next(error);
  }
});

// [POST] /users/refresh-token
router.post('/refresh-token', async (req, res, next) => {
  try {
    const { refreshToken } = req.body;

    // Check refresh token exists
    if (!refreshToken) throw createError.BadRequest();

    // Check proper user
    const { userId } = await verifyRefreshToken(refreshToken);

    // Create new access token & refresh token, then send it to user
    const accessToken = await signAccessToken(userId);
    const refToken = await signRefreshToken(userId);

    res.json({
      accessToken,
      refreshToken: refToken,
    });
  } catch (error) {
    next(error);
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

// [GET] /users/getlists || Test API
router.get('/getlist', verifyAccessToken, (req, res, next) => {
  const userList = [
    {
      emai: 'tuannt02@gmail.com',
    },
    {
      email: 'bladehotboy@gmail.com',
    },
    {
      email: '20522122@gm.uit.edu.vn',
    },
  ];

  res.json(userList);
});

module.exports = router;
