const express = require('express');
const router = express.Router();
const { verifyAccessToken, checkLogin } = require('../utils/jwt_service');
const commentController = require('../controllers/comments.controller');

// [GET] comments/:commentId -> Get a comment
router.get('/:commentId', checkLogin, commentController.getOneComment);

// [GET] comments/courses/:courseId -> Get all comments of a user
router.get('/courses/:courseId', checkLogin, commentController.getAllCommentOfUser);

// [POST] comments/:commentId/like -> Like a comment
router.post('/:commentId/like', verifyAccessToken, commentController.userLike);

// [DELETE] comments/:commentId/unlike -> Unlike a comment
router.post('/:commentId/unlike', verifyAccessToken, commentController.userUnlike);

// [POST] comments/create -> Create a new comment
router.post('/create', verifyAccessToken, commentController.createNewComment);

// [PUT] comments/:commentId -> Update content of comment
router.put('/:commentId', verifyAccessToken, commentController.updateContentComment);

module.exports = router;
