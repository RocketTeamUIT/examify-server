const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class Roles extends Model {
  static associate(models) {
    Roles.hasMany(models.UserToRole, { foreignKey: 'roleId' });
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
  },
);

module.exports = Roles;
