const JWT = require('jsonwebtoken');

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

module.exports = {
  signAccessToken,
};
