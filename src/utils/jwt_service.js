const JWT = require('jsonwebtoken');
const createError = require('http-errors');
const pool = require('../config/db');

const signAccessToken = async (user) => {
  return new Promise((resolve, reject) => {
    // Payload
    const payload = {
      user,
    };

    // Secret
    const secret = process.env.ACCESS_TOKEN_SECRET;

    // Options
    const options = {
      expiresIn: '1d',
    };

    // Sign
    JWT.sign(payload, secret, options, (err, token) => {
      if (err) reject(err);
      resolve(token);
    });
  });
};

// Middleware
const verifyAccessToken = (req, res, next) => {
  if (!req.headers['authorization']) {
    return next(createError.Unauthorized('Header does not include Authorization field'));
  }

  // Get token from header
  const authHeader = req.headers['authorization'];
  const bearerToken = authHeader.split(' ');
  const token = bearerToken[1];

  // start verify token
  JWT.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, payload) => {
    if (err) {
      if (err.name === 'JsonWebTokenError') {
        return next(createError.Unauthorized(err.message));
      }
      return next(createError.Unauthorized(err.message));
    }
    req.payload = payload;
    next();
  });
};

// (Required) Previous Middleware: verifyAccessToken
const verifyAdminAccessToken = (req, res, next) => {
  if (req.payload.user.role === 'Admin') next();
  else {
    return next(createError.Unauthorized('No permisson to access this resource'));
  }
};

// Check if login
// This middleware allow we check if user login.
const checkLogin = (req, res, next) => {
  // Check if token in header
  if (!req.headers['authorization']) {
    return next();
  }

  // Get token from header
  const authHeader = req.headers['authorization'];
  const bearerToken = authHeader.split(' ');
  const token = bearerToken[1];

  // Check valid token
  JWT.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, payload) => {
    if (err) {
      return next();
    }
    req.payload = payload;
    next();
  });
};

const signRefreshToken = async (user) => {
  return new Promise((resolve, reject) => {
    // Payload
    const payload = {
      user,
    };

    // Secret
    const secret = process.env.REFRESH_TOKEN_SECRET;

    // Options
    const options = {
      expiresIn: '1y',
    };

    // Sign
    JWT.sign(payload, secret, options, (err, token) => {
      if (err) reject(err);

      // Save refresh token to DB
      pool.query('UPDATE users SET refresh_token = $1 WHERE user_id = $2', [token, user.id], (err, result) => {
        if (err) {
          return reject(createError.InternalServerError("Maybe there's something wrong with our server"));
        }
      });

      resolve(token);
    });
  });
};

const verifyRefreshToken = async (refreshToken) => {
  return new Promise((resolve, reject) => {
    JWT.verify(refreshToken, process.env.REFRESH_TOKEN_SECRET, (err, payload) => {
      if (err) {
        return reject(err);
      }

      // Get refresh token from db
      pool.query('SELECT refresh_token FROM users WHERE user_id = $1', [payload.user.id], (err, result) => {
        if (err) reject(createError.InternalServerError("Maybe there's something wrong with our server"));

        // Check if the RF sent by user matches the RF that exists in the db?
        if (refreshToken === result.rows[0]?.refresh_token) {
          resolve(payload);
        }

        return reject(createError.Unauthorized('Invalid refresh token'));
      });
    });
  });
};

module.exports = {
  signAccessToken,
  verifyAccessToken,
  verifyAdminAccessToken,
  signRefreshToken,
  verifyRefreshToken,
  checkLogin,
};
