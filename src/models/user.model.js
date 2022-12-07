const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class User extends Model {
  // Add associate here...
  static associate(models) {
    User.belongsTo(models.Rank, { foreignKey: 'rankId' });
    User.belongsToMany(models.Course, { through: models.Comment, foreignKey: 'userId' });
    User.belongsToMany(models.Comment, { through: models.Like, foreignKey: 'userId' });
  }
}

User.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
      field: 'user_id',
    },

    email: {
      type: DataTypes.STRING,
      field: 'mail',
      allowNull: false,
      validate: {
        isEmail: true,
      },
    },

    password: {
      type: DataTypes.TEXT,
      field: 'password',
      allowNull: false,
    },

    firstName: {
      type: DataTypes.STRING,
      field: 'first_name',
      allowNull: false,
    },

    lastName: {
      type: DataTypes.INTEGER,
      field: 'last_name',
      allowNull: false,
    },

    dateOfBirth: {
      type: DataTypes.DATE,
      field: 'date_of_birth',
    },

    phoneNumber: {
      type: DataTypes.STRING,
      field: 'phone_number',
    },

    avt: {
      type: DataTypes.TEXT,
      field: 'avt',
      defaultValue:
        'https://media.istockphoto.com/id/1223671392/vector/default-profile-picture-avatar-photo-placeholder-vector-illustration.jpg?s=170667a&w=0&k=20&c=m-F9Doa2ecNYEEjeplkFCmZBlc5tm1pl1F7cBCh9ZzM=',
    },

    banner: {
      type: DataTypes.TEXT,
      field: 'banner',
      defaultValue:
        'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAX8AAACECAMAAABPuNs7AAAACVBMVEWAgICLi4uUlJSuV9pqAAABI0lEQVR4nO3QMQEAAAjAILV/aGPwjAjMbZybnTjbP9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b/Vv9W/1b+1cxvnHi9hBAfkOyqGAAAAAElFTkSuQmCC',
    },

    description: {
      type: DataTypes.TEXT,
      field: 'description',
    },

    rankId: {
      type: DataTypes.INTEGER,
      field: 'rank_id',
      defaultValue: 1,
    },

    accumulatedPoint: {
      type: DataTypes.INTEGER,
      field: 'accumulated_point',
      defaultValue: 0,
    },

    refreshToken: {
      type: DataTypes.TEXT,
      field: 'refresh_token',
      defaultValue: '',
    },

    createdAt: {
      type: DataTypes.DATE,
      field: 'created_at',
    },

    updatedAt: {
      type: DataTypes.DATE,
      field: 'updated_at',
    },
  },
  {
    sequelize,
    modelName: 'User',
    tableName: 'users',
  },
);

module.exports = User;
