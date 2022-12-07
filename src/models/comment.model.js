const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class Comment extends Model {
  // Add associate here...
  static associate(models) {
    Comment.belongsTo(models.User, { foreignKey: 'userId' });
    Comment.belongsTo(models.Course, { foreignKey: 'courseId' });
    Comment.belongsToMany(models.User, { through: models.Like, foreignKey: 'commentId' });
  }
}

Comment.init(
  {
    commentId: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
      field: 'comment_id',
    },

    userId: {
      type: DataTypes.INTEGER,
      field: 'user_id',
    },

    courseId: {
      type: DataTypes.INTEGER,
      field: 'course_id',
    },

    content: {
      type: DataTypes.STRING,
      field: 'content',
      allowNull: false,
    },

    totalLike: {
      type: DataTypes.INTEGER,
      field: 'total_like',
      defaultValue: 0,
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
    modelName: 'Comment',
    tableName: 'comment',
  },
);

module.exports = Comment;
