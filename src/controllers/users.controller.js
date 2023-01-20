const pool = require('../config/db');
const createError = require('http-errors');
const { newPasswordValidate } = require('../utils/validation');
const bcrypt = require('bcrypt');
const { getUserInfoService } = require('../services/user.service');

module.exports = {
  account: async (req, res, next) => {
    try {
      // Get userId from access token
      const { id: userId } = req.payload.user;

      // Get User info
      const userInfo = await getUserInfoService(userId);

      res.status(200).json({
        status: 200,
        data: userInfo,
      });
    } catch (err) {
      next(err);
    }
  },
  getAvatar: async (req, res, next) => {
    try {
      // Get userId from access token
      const { id: userId } = req.payload.user;

      // Query get avatar user
      pool.query('SELECT avt FROM users WHERE user_id = $1', [userId], (err, result) => {
        if (err) {
          throw createError.InternalServerError("Maybe there's something wrong with our server");
        }

        const avatarUser = result.rows[0].avt;

        res.status(200).json({
          status: 200,
          data: {
            avatar: avatarUser,
          },
        });
      });
    } catch (err) {
      next(err);
    }
  },
  getBanner: async (req, res, next) => {
    try {
      // Get userId from access token
      const { id: userId } = req.payload.user;

      // Query get banner user
      pool.query('SELECT banner FROM users WHERE user_id = $1', [userId], (err, result) => {
        if (err) {
          throw createError.InternalServerError("Maybe there's something wrong with our server");
        }

        const bannerUser = result.rows[0].banner;

        res.status(200).json({
          status: 200,
          data: {
            banner: bannerUser,
          },
        });
      });
    } catch (err) {
      next(err);
    }
  },
  changeAvatar: async (req, res, next) => {
    try {
      // Get userId from access token
      const { id: userId } = req.payload.user;

      // Get new image url from req
      const newImageUrl = req.body.newImageUrl;

      // Check new image exist
      if (!newImageUrl) {
        throw createError.BadRequest('Missing new image url');
      }

      // Update new img via query
      pool.query('UPDATE users SET avt = $1 WHERE user_id = $2', [newImageUrl, userId], (err, result) => {
        if (err) {
          throw createError.InternalServerError("Maybe there's something wrong with our server");
        }

        res.status(200).json({
          status: 200,
          message: 'Update avatar successfully',
        });
      });
    } catch (err) {
      next(err);
    }
  },
  changeBanner: async (req, res, next) => {
    try {
      // Get userId from access token
      const { id: userId } = req.payload.user;

      // Get new image url from req
      const newImageUrl = req.body.newImageUrl;

      // Check new image exist
      if (!newImageUrl) {
        throw createError.BadRequest('Missing new image url');
      }

      // Update new img via query
      pool.query('UPDATE users SET banner = $1 WHERE user_id = $2', [newImageUrl, userId], (err, result) => {
        if (err) {
          throw createError.InternalServerError("Maybe there's something wrong with our server");
        }

        res.status(200).json({
          status: 200,
          message: 'Update banner successfully',
        });
      });
    } catch (err) {
      next(err);
    }
  },
  updateInfo: async (req, res, next) => {
    try {
      // Get userId from access token
      const { id: userId } = req.payload.user;

      // Get new user info
      const { firstName, lastName, dateOfBirth, phoneNumber, description } = req.body;
      const convertValidDate = new Date(dateOfBirth + 'T00:00:00.000Z'); // Convert valid date with DB

      // Update new user info to DB
      pool.query(
        'UPDATE users SET first_name = $1, last_name = $2, date_of_birth = $3, phone_number = $4, description = $5 WHERE user_id = $6',
        [firstName, lastName, convertValidDate, phoneNumber, description, userId],
        (err, result) => {
          if (err) {
            throw createError.InternalServerError("Maybe there's something wrong with our server");
          }

          res.status(200).json({
            status: 200,
            message: 'Update user info successfully',
          });
        },
      );
    } catch (err) {
      next(err);
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
  getAllUsers: async (req, res) => {
    try {
      const allUsers = await pool.query('SELECT * FROM users');
      res.status(200).json(allUsers.rows);
    } catch (err) {
      console.log(err.message);
    }
  },
};
