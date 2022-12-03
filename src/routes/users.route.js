const express = require('express');
const router = express.Router();
const { verifyAccessToken } = require('../utils/jwt_service');
const userController = require('../controllers/users.controller');

// [POST] /users/register -> create new user
router.post('/register', userController.register);

// [POST] /users/login -> User login
router.post('/login', userController.login);

// [PUT] /users/change-password -> User change password
router.put('/change-password', verifyAccessToken, userController.changePassword);

// [PUT] /users/avatar -> User change avatar
router.put('/avatar', verifyAccessToken, userController.changeAvatar);

// [PUT] /users/banner -> User change banner
router.put('/banner', verifyAccessToken, userController.changeBanner);

// [DELETE] /users/logout
router.delete('/logout', verifyAccessToken, userController.logout);

// [POST] /users/refresh-token
router.post('/refresh-token', userController.refreshToken);

// [GET] /users/me
router.get('/me', verifyAccessToken, userController.account);

// [PUT] /users/update-info
router.put('/update-info', verifyAccessToken, userController.updateInfo);

// [GET] /users -> get all user
router.get('/', userController.getAllUsers);

// [GET] /users/getlists || Test API
router.get('/getlist', verifyAccessToken, userController.getList);

module.exports = router;
