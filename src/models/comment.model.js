const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class Comment extends Model {
  // Add associate here...
  static associate(models) {}
}

Comment.init(
  {
    commentId: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      allowNull: false,
      primaryKey: true,
      field: 'comment_id',
    },

    studentId: {
      type: DataTypes.INTEGER,
      field: 'student_id',
    },

    courseId: {
      type: DataTypes.INTEGER,
      field: 'course_id',
    },

    content: {
      type: DataTypes.STRING,
      field: 'content',
    },

    totalLike: {
      type: DataTypes.INTEGER,
      field: 'total_like',
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
    modelName: 'Comment',
    tableName: 'comment',
  },
);

module.exports = Comment;
