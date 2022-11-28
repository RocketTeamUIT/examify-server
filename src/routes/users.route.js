const express = require('express');
const router = express.Router();
const { verifyAccessToken } = require('../utils/jwt_service');
const userController = require('../controllers/users.controller');

// [POST] /users/register -> create new user
router.post('/register', userController.register);

// [POST] /users/login -> User login
router.post('/login', userController.login);

// [DELETE] /users/logout
router.delete('/logout', userController.logout);

// [POST] /users/refresh-token
router.post('/refresh-token', userController.refreshToken);

// [GET] /users -> get all user
router.get('/', userController.getAllUsers);

// [GET] /users/getlists || Test API
router.get('/getlist', verifyAccessToken, userController.getList);

module.exports = router;
