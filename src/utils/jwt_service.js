const JWT = require('jsonwebtoken');
const createError = require('http-errors');
const pool = require('../config/db');

const signAccessToken = async (userId) => {
  return new Promise((resolve, reject) => {
    // Payload
    const payload = {
      userId,
    };

    // Secret
    const secret = process.env.ACCESS_TOKEN_SECRET;

    // Options
    const options = {
      expiresIn: '1h',
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
    return next(createError.Unauthorized());
  }

  // Get token from header
  const authHeader = req.headers['authorization'];
  const bearerToken = authHeader.split(' ');
  const token = bearerToken[1];

  // start verify token
  JWT.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, payload) => {
    if (err) {
      if (err.name === 'JsonWebTokenError') {
        return next(createError.Unauthorized());
      }
      return next(createError.Unauthorized(err.message));
    }
    req.payload = payload;
    next();
  });
};

const signRefreshToken = async (userId) => {
  return new Promise((resolve, reject) => {
    // Payload
    const payload = {
      userId,
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
      pool.query('UPDATE users SET refresh_token = $1 WHERE user_id = $2', [token, userId], (err, result) => {
        if (err) {
          return reject(createError.InternalServerError());
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
      pool.query('SELECT refresh_token FROM users WHERE user_id = $1', [payload.userId], (err, result) => {
        if (err) reject(createError.InternalServerError());

        // Check if the RF sent by user matches the RF that exists in the db?
        if (refreshToken === result.rows[0].refresh_token) {
          resolve(payload);
        }

        return reject(createError.Unauthorized());
      });
    });
  });
};

module.exports = {
  signAccessToken,
  verifyAccessToken,
  signRefreshToken,
  verifyRefreshToken,
};
