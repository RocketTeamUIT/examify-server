const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class Note extends Model {
  static associate(models) {
    // Add here
  }
}

Note.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
      field: 'note_id',
    },

    studentId: {
      type: DataTypes.INTEGER,
      field: 'student_id',
    },

    lessonId: {
      type: DataTypes.INTEGER,
      field: 'lesson_id',
    },

    note: {
      type: DataTypes.STRING,
      field: 'note',
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
    modelName: 'Note',
    tableName: 'note',
    timestamps: true,
  },
);

module.exports = Note;
