const pool = require('../config/db');
const createError = require('http-errors');
const { registerValidate, loginValidate } = require('../utils/validation');
const bcrypt = require('bcrypt');
const { signAccessToken, signRefreshToken, verifyRefreshToken } = require('../utils/jwt_service');
const db = require('../models');

module.exports = {
  register: async (req, res, next) => {
    try {
      const email = req.body.email.toLowerCase(); // email lowercase
      const { firstname, lastname, password } = req.body;

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

      return res.status(201).json({
        status: 201,
        elements: newUser,
      });
    } catch (err) {
      next(err);
    }
  },
  login: async (req, res, next) => {
    try {
      const email = req.body.email.toLowerCase(); // email lowercase
      const password = req.body.password;

      // Validate fields
      const { error } = loginValidate(req.body);
      if (error) {
        throw createError(error.details[0].message);
      }

      // Check email exists
      const user = await db.User.findOne({
        where: {
          mail: email,
        },
        include: [
          {
            model: db.Roles,
            as: 'role',
            attributes: ['roleName'],
          },
        ],
        attributes: ['id', 'email', 'password', 'firstName', 'lastName'],
        nest: true,
        raw: true,
      });

      if (user === null) {
        throw createError.NotFound('User not register');
      }

      // Unhash & check password
      const hashPassword = user.password;
      const isValid = await bcrypt.compare(password, hashPassword);
      if (!isValid) {
        throw createError.Unauthorized('Wrong password');
      }

      // Refactor user object
      user.role = user.role.roleName;
      delete user['password'];

      // Create access token & refresh token
      const accessToken = await signAccessToken(user);
      const refreshToken = await signRefreshToken(user);

      // Store refresh token in cookie
      res.cookie('refreshToken', refreshToken, {
        httpOnly: true,
        secure: false,
        path: '/',
        sameSite: 'None',
        maxAge: 60 * 60 * 24 * 3600 * 1000,
      });

      res.status(200).json({
        status: 200,
        user,
        accessToken,
      });
    } catch (err) {
      next(err);
    }
  },
  logout: async (req, res, next) => {
    try {
      // Take refresh token from cookie of user
      const { refreshToken } = req.cookies;

      // Check refresh token exists
      if (!refreshToken) {
        throw createError.BadRequest('No refresh token in cookies');
      }

      // Verify refresh token & remove refresh token in DB
      const { user } = await verifyRefreshToken(refreshToken);
      pool.query('UPDATE users SET refresh_token = $1 WHERE user_id = $2', ['', user.id], (err, result) => {
        if (err) {
          throw createError.InternalServerError("Maybe there's something wrong with our server");
        }

        // Clear cookie
        res.clearCookie('refreshToken');

        res.status(200).json({
          status: 200,
          message: 'Logout!',
        });
      });
    } catch (error) {
      next(error);
    }
  },
  refreshToken: async (req, res, next) => {
    try {
      // Take refresh token from cookie of user
      const { refreshToken } = req.cookies;

      // Check refresh token exists
      if (!refreshToken) throw createError.BadRequest('No refresh token in cookies');

      // Check proper user
      const { user } = await verifyRefreshToken(refreshToken);

      // Create new access token & refresh token, then send it to user
      const accessToken = await signAccessToken(user);
      const refToken = await signRefreshToken(user);

      // Store refresh token in cookie
      res.cookie('refreshToken', refToken, {
        httpOnly: true,
        secure: false,
        path: '/',
        sameSite: 'None',
        maxAge: 60 * 60 * 24 * 3600 * 1000,
      });

      res.status(200).json({
        status: 200,
        accessToken,
      });
    } catch (error) {
      next(error);
    }
  },
};
