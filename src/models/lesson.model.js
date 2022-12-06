const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class Lesson extends Model {
  static associate(models) {
    Lesson.belongsTo(models.Unit, { foreignKey: 'unitId' });
    // add associate for Slide
    // add associate for Note
    // add associate for JoinLesson
  }
}

Lesson.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: 'true',
      field: 'lesson_id',
    },

    unitId: {
      type: DataTypes.INTEGER,
      field: 'unit_id',
    },

    name: {
      type: DataTypes.STRING,
      field: 'name',
    },

    type: {
      type: DataTypes.INTEGER,
      field: 'type',
    },

    videoUrl: {
      type: DataTypes.STRING,
      field: 'video_url',
    },

    flashcardSetId: {
      type: DataTypes.INTEGER,
      field: 'flashcard_set_id',
    },

    text: {
      type: DataTypes.STRING,
      field: 'text',
    },

    description: {
      type: DataTypes.STRING,
      field: 'description',
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
    modelName: 'Lesson',
    tableName: 'lesson',
    timestamps: true,
  },
);

module.exports = Lesson;
