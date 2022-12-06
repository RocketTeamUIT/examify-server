const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class JoinLesson extends Model {
  static associate(models) {
    // add here
  }
}

JoinLesson.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
      field: 'join_lesson_id',
    },

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

    updatedAt: {
      type: DataTypes.DATE,
      field: 'updated_at',
    },
  },
  {
    sequelize,
    modelName: 'JoinLesson',
    tableName: 'join_lesson',
    timestamps: true,
  },
);

module.exports = JoinLesson;
