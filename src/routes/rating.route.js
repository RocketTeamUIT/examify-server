const express = require('express');
const router = express.Router();
const ratingControlller = require('../controllers/rating.controller');
const { checkLogin, verifyAccessToken } = require('../utils/jwt_service');

// [GET] /rating/:courseId
router.get('/:courseId', verifyAccessToken, ratingControlller.getRatingCourse);

// [POST] /rating/:courseId
router.post('/:courseId', verifyAccessToken, ratingControlller.ratingCourse);

// [PUT] /rating/:courseId
router.put('/:courseId', verifyAccessToken, ratingControlller.changeRating);

// [DELETE] /rating/:courseId
router.delete('/:courseId', verifyAccessToken, ratingControlller.clearRating);

module.exports = router;
