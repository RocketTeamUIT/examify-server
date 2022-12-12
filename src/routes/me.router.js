const express = require('express');
const router = express.Router();
const meController = require('../controllers/me.controller');
const { checkLogin, verifyAccessToken } = require('../utils/jwt_service');

// [GET] /me/courses -> get all my courses
router.get('/courses', checkLogin, meController.getMyCourses);

module.exports = router;
