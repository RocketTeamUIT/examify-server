const Joi = require('joi');

const userValidate = (data) => {
  const userSchema = Joi.object({
    email: Joi.string().trim().email().lowercase().required(),
    firstname: Joi.string().trim().required(),
    lastname: Joi.string().trim().required(),
    password: Joi.string().trim().min(8).max(100).required(),
    passwordConfirmation: Joi.string().trim().min(8).max(100).required(),
  });

  return userSchema.validate(data);
};

module.exports = {
  userValidate,
};
