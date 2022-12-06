const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class Rating extends Model {
  static associate(models) {
    // Add here
  }
}

Rating.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
      field: 'rating_id',
    },

    studentId: {
      type: DataTypes.INTEGER,
      field: 'student_id',
    },

    courseId: {
      type: DataTypes.INTEGER,
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
    timestamps: true,
  },
);

module.exports = Rating;
