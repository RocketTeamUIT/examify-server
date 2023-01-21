const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class Like extends Model {
  // Add associate here...
  static associate(models) {
    Like.belongsTo(models.User, { foreignKey: 'userId' });
    Like.belongsTo(models.Comment, { foreignKey: 'commentId' });
  }
}

Like.init(
  {
    userId: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      field: 'user_id',
    },

    commentId: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      field: 'comment_id',
    },

    createdAt: {
      type: DataTypes.DATE,
      field: 'created_at',
    },
  },
  {
    sequelize,
    timestamps: false,
    modelName: 'Like',
    tableName: 'like',
  },
);

module.exports = Like;
