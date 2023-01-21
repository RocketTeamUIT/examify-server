const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class UserToRole extends Model {
  static associate(models) {
    UserToRole.belongsTo(models.Roles, { foreignKey: 'roleId' });
    UserToRole.belongsTo(models.User, { foreignKey: 'userId' });
  }
}

UserToRole.init(
  {
    userId: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      field: 'user_id',
    },

    roleId: {
      type: DataTypes.INTEGER,
      primaryKey: true,
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
