const express = require('express');
const router = express.Router();
const { verifyAccessToken } = require('../utils/jwt_service');
const userController = require('../controllers/users.controller');

// [PUT] /users/change-password -> User change password
router.put('/change-password', verifyAccessToken, userController.changePassword);

// [GET] /users/avatar -> Get avatar user
router.get('/avatar', verifyAccessToken, userController.getAvatar);

// [PUT] /users/avatar -> User change avatar
router.put('/avatar', verifyAccessToken, userController.changeAvatar);

// [GET] /users/banner -> Get banner user
router.get('/banner', verifyAccessToken, userController.getBanner);

// [PUT] /users/banner -> User change banner
router.put('/banner', verifyAccessToken, userController.changeBanner);

// [GET] /users/me
router.get('/me', verifyAccessToken, userController.account);

// [PUT] /users/update-info
router.put('/update-info', verifyAccessToken, userController.updateInfo);

// [PUT] change role
router.put('/change-role', userController.changeRole);

// [GET] /users/statistics
router.get('/statistics', userController.getStatistics);

// [GET] /users/statistics/detail
router.get('/statistics/detail', userController.getDetailStatistics);

// [GET] /users -> get all user
router.get('/', userController.getAllUsers);

module.exports = router;
