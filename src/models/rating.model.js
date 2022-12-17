const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class Rating extends Model {
  static associate(models) {
    Rating.belongsTo(models.Course, { foreignKey: 'courseId' });
    // Rating.belongsTo(models.User, { foreignKey: 'studentId' });
  }
}

Rating.init(
  {
    studentId: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      field: 'student_id',
    },

    courseId: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      field: 'course_id',
    },

    rate: {
      type: DataTypes.INTEGER,
      field: 'rate',
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
    modelName: 'Rating',
    tableName: 'rating',
  },
);

module.exports = Rating;
