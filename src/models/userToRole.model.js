const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class UserToRole extends Model {
  static associate(models) {
    UserToRole.belongsTo(models.Roles, { foreignKey: 'roleId' });
    // UserToRole.belongsTo(models.User, { foreignKey: 'userId' });
  }
}

UserToRole.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
      field: 'user_to_role_id',
    },

    userId: {
      type: DataTypes.INTEGER,
      field: 'user_id',
    },

    roleId: {
      type: DataTypes.INTEGER,
      field: 'role_id',
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
    modelName: 'UserToRole',
    tableName: 'user_to_role',
  },
);

module.exports = UserToRole;