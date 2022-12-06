const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class Slide extends Model {
  static associate(models) {
    // Add here
  }
}

Slide.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
      field: 'slide_id',
    },

    sequence: {
      type: DataTypes.INTEGER,
      unique: true,
      field: 'sequence',
    },

    lessonId: {
      type: {
        type: DataTypes.INTEGER,
        field: 'lesson_id',
      },
    },

    text: {
      type: DataTypes.STRING,
      field: 'text',
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
    modelName: 'Slide',
    tableName: 'slide',
    timestamps: true,
  },
);

module.exports = Slide;
