const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class JoinCourse extends Model {
  static associate(models) {
    JoinCourse.belongsTo(models.Course, { foreignKey: 'courseId' });
    // JoinCourse.belongsTo(models.User, { foreignKey: 'studentId' });
  }
}

JoinCourse.init(
  {
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
  },
);

module.exports = JoinCourse;
