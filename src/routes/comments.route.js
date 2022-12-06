const express = require('express');
const router = express.Router();
const { verifyAccessToken } = require('../utils/jwt_service');
const commentController = require('../controllers/comments.controller');

// [GET] comments/courses/:course-id -> Get all comments of a user
router.get('/courses/:courseId', commentController.getAllCommentOfUser);

module.exports = router;
