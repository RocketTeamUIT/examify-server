const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class Unit extends Model {
  static associate(models) {
    Unit.belongsTo(models.Chapter, { foreignKey: 'chapterId' });
    Unit.hasMany(models.Lesson, { foreignKey: 'unitId', as: 'lessonList' });
  }
}

Unit.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
      field: 'unit_id',
    },

    chapterId: {
      type: DataTypes.INTEGER,
      field: 'chapter_id',
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
    modelName: 'Unit',
    tableName: 'unit',
  },
);

module.exports = Unit;
