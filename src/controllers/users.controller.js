const pool = require('../config/db');
const createError = require('http-errors');
const { registerValidate, loginValidate, newPasswordValidate } = require('../utils/validation');
const bcrypt = require('bcrypt');
const { signAccessToken, signRefreshToken, verifyRefreshToken } = require('../utils/jwt_service');

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

      return res.status(200).json({
        status: 200,
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

      // Store refresh token in cookie
      res.cookie('refreshToken', refreshToken, {
        httpOnly: true,
        secure: false,
        path: '/',
        sameSite: 'strict',
      });

      res.status(200).json({
        status: 200,
        user: {
          userId: isExist.rows[0].user_id,
          email: isExist.rows[0].mail,
          firstName: isExist.rows[0].first_name,
          lastName: isExist.rows[0].last_name,
        },
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
      const { userId } = await verifyRefreshToken(refreshToken);
      pool.query('UPDATE users SET refresh_token = $1 WHERE user_id = $2', ['', userId], (err, result) => {
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
  changePassword: async (req, res, next) => {
    try {
      // Get old password & new password
      const { oldPassword, newPassword } = req.body;

      // Check old password != new password (Temp, then upgrade later)
      if (oldPassword === newPassword) {
        return next(createError.Conflict('New password must be different from old password'));
      }

      // Check valid new password
      const { error } = newPasswordValidate(req.body);
      if (error) {
        throw createError(error.details[0].message);
      }

      // Get userID
      const { userId } = req.payload;

      // Check if the old password is the same as the existing password in the db?
      const passwordFromDb = await pool.query('SELECT password FROM users WHERE user_id = $1', [userId]);
      const hashPassword = passwordFromDb.rows[0].password;
      const isValid = await bcrypt.compare(oldPassword, hashPassword); // Unhash & check
      if (!isValid) {
        throw createError.Conflict('Old password is not correct');
      }

      // Hash new password
      const salt = await bcrypt.genSalt(10);
      const hashNewPassword = await bcrypt.hash(newPassword, salt);

      // Update new password
      const queryUpdateNewPassword = pool.query(
        'UPDATE users SET password = $1 WHERE user_id = $2',
        [hashNewPassword, userId],
        (err, result) => {
          if (err) {
            throw createError.InternalServerError("Maybe there's something wrong with our server");
          }

          return res.status(200).json({
            status: 200,
            message: 'Change password successfully',
          });
        },
      );
    } catch (err) {
      next(err);
    }
  },
  refreshToken: async (req, res, next) => {
    try {
      // Take refresh token from cookie of user
      const { refreshToken } = req.cookies;

      // Check refresh token exists
      if (!refreshToken) throw createError.BadRequest('No refresh token in cookies');

      // Check proper user
      const { userId } = await verifyRefreshToken(refreshToken);

      // Create new access token & refresh token, then send it to user
      const accessToken = await signAccessToken(userId);
      const refToken = await signRefreshToken(userId);

      // Store refresh token in cookie
      res.cookie('refreshToken', refreshToken, {
        httpOnly: true,
        secure: false,
        path: '/',
        sameSite: 'strict',
      });

      res.status(200).json({
        status: 200,
        accessToken,
        refreshToken: refToken,
      });
    } catch (error) {
      next(error);
    }
  },
  getAllUsers: async (req, res) => {
    try {
      const allUsers = await pool.query('SELECT * FROM users');
      res.status(200).json(allUsers.rows);
    } catch (err) {
      console.log(err.message);
    }
  },
  getList: (req, res, next) => {
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
  },
};
