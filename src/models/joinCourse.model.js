const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class joinCourse extends Model {
  static associate(models) {
    // add here
  }
}

joinCourse.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
      field: 'join_course_id',
    },

    studentId: {
      type: DataTypes.INTEGER,
      field: 'student_id',
    },

    courseId: {
      type: DataTypes.INTEGER,
      field: 'course_id',
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
    modelName: 'joinCourse',
    tableName: 'join_course',
    timestamps: true,
  },
);

module.exports = joinCourse;
