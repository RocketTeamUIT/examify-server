const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class User extends Model {
  // Add associate here...
  static associate(models) {
    User.belongsTo(models.Rank, { foreignKey: 'rankId', as: 'rank' });
    User.belongsToMany(models.Course, { through: models.Comment, foreignKey: 'userId' });
    User.belongsToMany(models.Comment, { through: models.Like, foreignKey: 'userId' });
    User.hasMany(models.LearntList, { as: 'learnt_lists', foreignKey: 'user_id' });
    User.hasMany(models.Flashcard, { as: 'flashcards', foreignKey: 'created_by' });
    User.hasMany(models.FlashcardSet, { as: 'flashcard_sets', foreignKey: 'created_by' });
    User.belongsToMany(models.Flashcard, {
      as: 'fc_id_flashcards',
      through: models.LearntList,
      foreignKey: 'user_id',
      otherKey: 'fc_id',
    });
    User.hasMany(models.FlashcardSharePermit, { as: 'flashcard_share_permits', foreignKey: 'user_id' });
    User.belongsToMany(models.Roles, { through: models.UserToRole, foreignKey: 'userId', as: 'role' });
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
      type: DataTypes.STRING,
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
      defaultValue: '',
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

    rankPoint: {
      type: DataTypes.INTEGER,
      field: 'rank_point',
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
