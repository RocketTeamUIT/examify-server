const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class JoinLesson extends Model {
  static associate(models) {
    JoinLesson.belongsTo(models.Lesson, { foreignKey: 'lessonId' });
    JoinLesson.belongsTo(models.User, { foreignKey: 'studentId' });
  }
}

JoinLesson.init(
  {
    studentId: {
      type: DataTypes.INTEGER,
      field: 'student_id',
    },

    lessonId: {
      type: DataTypes.INTEGER,
      field: 'lesson_id',
    },

    createdAt: {
      type: DataTypes.DATE,
      field: 'created_at',
    },
  },
  {
    sequelize,
    modelName: 'JoinLesson',
    tableName: 'join_lesson',
    timestamps: false,
  },
);

module.exports = JoinLesson;
