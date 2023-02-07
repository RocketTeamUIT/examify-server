const express = require('express');
const router = express.Router();
const { verifyAccessToken } = require('../utils/jwt_service');
const authController = require('../controllers/auth.controller');

// [POST] /users/register -> create new user
router.post('/register', authController.register);

// [POST] /users/login -> User login
router.post('/login', authController.login);

// [DELETE] /users/logout
router.delete('/logout', verifyAccessToken, authController.logout);

// [POST] /users/refresh-token
router.post('/refresh-token', authController.refreshToken);

module.exports = router;
