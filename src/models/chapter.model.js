const { Model, DataTypes } = require('sequelize');
// One a connection
const { sequelize } = require('../config/connectDB');

class Chapter extends Model {
  static associate(models) {
    Chapter.belongsTo(models.Course, { foreignKey: 'courseId' });
    Chapter.hasMany(models.Unit, { foreignKey: 'chapterId', as: 'unitList' });
  }
}

Chapter.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
      field: 'chapter_id',
    },

    courseId: {
      type: DataTypes.INTEGER,
      field: 'course_id',
    },

    numericOrder: {
      type: DataTypes.INTEGER,
      field: 'numeric_order',
    },

    name: {
      type: DataTypes.STRING,
      field: 'name',
    },

    totalLesson: {
      type: DataTypes.INTEGER,
      field: 'total_lesson',
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
    modelName: 'Chapter',
    tableName: 'chapter',
  },
);

module.exports = Chapter;
