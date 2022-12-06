const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class JoinCourse extends Model {
  static associate(models) {
    // add here
  }
}

JoinCourse.init(
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
    modelName: 'JoinCourse',
    tableName: 'join_course',
    timestamps: true,
  },
);

module.exports = JoinCourse;
