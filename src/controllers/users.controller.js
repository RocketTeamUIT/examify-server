const pool = require('../config/db');
const createError = require('http-errors');
const { newPasswordValidate } = require('../utils/validation');
const bcrypt = require('bcrypt');
const db = require('../models/index');
const { getUserInfoService } = require('../services/user.service');
const { sequelize } = require('../config/connectDB');

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
      const allUsers = await pool.query(
        'SELECT u.user_id, mail, first_name, last_name, date_of_birth, phone_number, avt, banner, description, u.rank_id, rank_name, accumulated_point, rank_point, u.created_at, u.updated_at, role_name, utr.role_id FROM users u LEFT JOIN user_to_role utr ON u.user_id = utr.user_id LEFT JOIN roles r ON utr.role_id = r.role_id LEFT JOIN rank ra ON u.rank_id = ra.rank_id',
      );
      getStatistics: async (req, res, next) => {
        try {
          const join_count = await db.JoinCourse.count();
          const learnt_count = (
            await pool.query(
              'select c.course_id, jl.student_id, count(*) learnt_count from course c, chapter ch, unit u, lesson l, join_lesson jl where c.course_id = ch.course_id and ch.chapter_id = u.chapter_id and u.unit_id = l.unit_id and l.lesson_id = jl.lesson_id group by c.course_id, jl.student_id having count(*) = c.total_lesson;',
            )
          ).rowCount;
          const avg_rating_query = await db.Course.findOne({
            attributes: [[sequelize.fn('avg', sequelize.col('avg_rating')), 'avg_rating']],
            where: {
              avg_rating: {
                [Op.not]: 0,
              },
            },
          });
          const avg_rating = Math.round(parseFloat(avg_rating_query.toJSON().avg_rating) * 10) / 10;
          const rating_count = await db.Rating.count();
          const popular = await db.Course.findAll({
            order: [
              ['participants', 'DESC'],
              ['avg_rating', 'DESC'],
            ],
            limit: 5,
          });

          res.status(200).json({
            status: 200,
            data: {
              join_count,
              learnt_count,
              avg_rating,
              rating_count,
              popular,
            },
          });
        } catch (err) {
          next(err);
        }
      },
        res.status(200).json(allUsers.rows);
    } catch (err) {
      console.log(err.message);
    }
  },

  changeRole: async (req, res) => {
    try {
      const { user_id, role_id } = req.body;
      await pool.query('UPDATE user_to_role SET role_id = $1 WHERE user_id = $2', [role_id, user_id]);
      res.status(200).json({ message: 'Success' });
    } catch (err) {
      console.log(err.message);
    }
  },

  getStatistics: async (req, res, next) => {
    try {
      const total_users = await db.User.count();
      const total_new_users = await pool.query(
        `SELECT user_id FROM users WHERE CURRENT_TIMESTAMP - INTERVAL '30 DAY' <= created_at AND created_at <= CURRENT_TIMESTAMP;`,
      );
      const total_active_users = await pool.query(
        "SELECT * FROM users WHERE updated_at > CURRENT_TIMESTAMP - INTERVAL '7 DAY'",
      );
      const total_rank_point = await db.User.findOne({
        attributes: [[sequelize.cast(sequelize.fn('SUM', sequelize.col('rank_point')), 'INT'), 'total_rank_point']],
      });

      const popular = await db.User.findAll({
        attributes: Object.keys(db.User.getAttributes()).concat([[sequelize.col('rank_name'), 'rankName']]),
        include: [{ as: 'rank', attributes: [], model: db.Rank }],
        limit: 5,
        order: [['rankPoint', 'DESC']],
      });

      res.status(200).json({
        status: 200,
        data: {
          total_users,
          total_new_users: total_new_users.rowCount,
          total_active_users: total_active_users.rowCount,
          total_rank_point: total_rank_point.toJSON().total_rank_point,
          popular,
        },
      });
    } catch (err) {
      next(err);
    }
  },

  getDetailStatistics: async (req, res, next) => {
    try {
      const { year } = req.query;
      const new_users = await pool.query(
        `SELECT EXTRACT(MONTH FROM created_at) as month, COUNT(*) new_count, SUM(rank_point) rank_point FROM users WHERE EXTRACT(YEAR FROM created_at) = ${year} GROUP BY EXTRACT(MONTH FROM created_at)`,
      );
      const active_users = await pool.query(
        `SELECT EXTRACT(MONTH FROM updated_at) as month, COUNT(*) active_count FROM users WHERE EXTRACT(YEAR FROM updated_at) = ${year} GROUP BY EXTRACT(MONTH FROM updated_at)`,
      );

      const total_new_users = new_users.rows.reduce((prev, curr) => prev + Number(curr.new_count), 0);
      const total_active_users = active_users.rows.reduce((prev, curr) => prev + Number(curr.active_count), 0);

      const result = {};
      result.months = Array(12)
        .fill(0)
        .map((_, i) => i + 1)
        .map((month) => ({
          month,
          new_count: parseInt(new_users.rows.find((item) => String(item.month) === String(month))?.new_count || 0),
          active_count: parseInt(
            active_users.rows.find((item) => String(item.month) === String(month))?.active_count || 0,
          ),
        }));

      res.status(200).json({
        status: 200,
        data: {
          ...result,
          total_new_users,
          total_active_users,
        },
      });
    } catch (err) {
      next(err);
    }
  },
};
