const express = require('express');
const router = express.Router();
const { verifyAccessToken, checkLogin } = require('../utils/jwt_service');
const commentController = require('../controllers/comments.controller');

// [GET] comments/courses/:courseId -> Get all comments of a user
router.get('/courses/:courseId', checkLogin, commentController.getAllCommentOfUser);

// [POST] comments/:commentId/like -> Like a comment
router.post('/:commentId/like', verifyAccessToken, commentController.userLike);

// [DELETE] comments/:commentId/unlike -> Unlike a comment
router.post('/:commentId/unlike', verifyAccessToken, commentController.userUnlike);

module.exports = router;
