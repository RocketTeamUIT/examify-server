const { Op, Sequelize } = require('sequelize');
const db = require('../models/index');
const connectDB = require('../config/connectDB');
const createError = require('http-errors');

module.exports = {
  getUserInfoService: async (userId) => {
    try {
      const user = await db.User.findOne({
        where: {
          id: userId,
        },
        include: [
          {
            model: db.Rank,
            as: 'rank',
            attributes: ['rankId', 'rankName'],
          },
        ],
        attributes: {
          exclude: ['password', 'rankId', 'refreshToken', 'createdAt', 'updatedAt'],
        },
        nest: true,
        raw: true,
      });
      const joinedCourses = await db.JoinCourse.count({
        where: {
          studentId: userId,
        },
        raw: true,
      });

      user.joinedCourses = joinedCourses;
      user.ownFlashcard = 0;
      user.userId = user.id; //Change name property
      delete user.id;

      return Promise.resolve(user);
    } catch (err) {
      throw err;
    }
  },
};
