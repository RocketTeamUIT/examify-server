const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class User extends Model {
  // Add associate here...
  static associate(models) {
    User.belongsTo(models.Rank, { foreignKey: 'rankId' });
  }
}

User.init(
  {
    userId: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      allowNull: false,
      primaryKey: true,
      field: 'user_id',
    },

    email: {
      type: DataTypes.STRING,
      field: 'mail',
    },

    password: {
      type: DataTypes.TEXT,
      field: 'password',
    },

    firstName: {
      type: DataTypes.STRING,
      field: 'first_name',
    },

    lastName: {
      type: DataTypes.INTEGER,
      field: 'last_name',
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
    },

    banner: {
      type: DataTypes.TEXT,
      field: 'banner',
    },

    description: {
      type: DataTypes.TEXT,
      field: 'description',
    },

    rankId: {
      type: DataTypes.INTEGER,
      field: 'rank_id',
    },

    accumulatedPoint: {
      type: DataTypes.INTEGER,
      field: 'accumulated_point',
    },

    refreshToken: {
      type: DataTypes.TEXT,
      field: 'refresh_token',
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
    timestamps: true,
    modelName: 'User',
    tableName: 'users',
  },
);

module.exports = User;
