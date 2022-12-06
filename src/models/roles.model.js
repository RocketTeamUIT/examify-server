const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class Roles extends Model {
  static associate(models) {
    // Add here
  }
}

Roles.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
      field: 'role_id',
    },

    roleName: {
      type: DataTypes.STRING,
      field: 'role_name',
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
    modelName: 'Roles',
    tableName: 'roles',
    timestamps: true,
  },
);

module.exports = Roles;
