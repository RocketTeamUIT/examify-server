const Joi = require('joi');

const registerValidate = (data) => {
  const userSchema = Joi.object({
    email: Joi.string().trim().email().lowercase().required(),
    firstname: Joi.string().trim().required(),
    lastname: Joi.string().trim().required(),
    password: Joi.string().trim().min(8).max(100).required(),
    passwordConfirmation: Joi.ref('password'),
  });

  return userSchema.validate(data);
};

const loginValidate = (data) => {
  const userSchema = Joi.object({
    email: Joi.string().trim().email().lowercase().required(),
    password: Joi.string().trim().min(8).max(100).required(),
  });

  return userSchema.validate(data);
};

const newPasswordValidate = (data) => {
  const userSchema = Joi.object({
    oldPassword: Joi.string(),
    newPassword: Joi.string().trim().min(8).max(100).required(),
  });

  return userSchema.validate(data);
};

module.exports = {
  registerValidate,
  loginValidate,
  newPasswordValidate,
};
