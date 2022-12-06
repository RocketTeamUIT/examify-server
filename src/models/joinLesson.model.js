const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class joinLesson extends Model {
  static associate(models) {
    // add here
  }
}

joinLesson.init(
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
    modelName: 'joinLesson',
    tableName: 'join_lesson',
    timestamps: true,
  },
);

module.exports = joinLesson;
