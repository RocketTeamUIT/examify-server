const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../../config/connectDB');

class ExamSeries extends Model {
  static associate(models) {
    ExamSeries.hasMany(models.Exam, { foreignKey: 'examSeriesId' });
  }
}

ExamSeries.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
      field: 'exam_series_id',
    },

    name: {
      type: DataTypes.STRING,
      field: 'name',
    },

    totalExam: {
      type: DataTypes.INTEGER,
      field: 'total_exam',
    },

    publicDate: {
      type: DataTypes.DATE,
      field: 'public_date',
    },

    author: {
      type: DataTypes.STRING,
      field: 'author',
    },

    createBy: {
      type: DataTypes.INTEGER,
      field: 'created_by',
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
    modelName: 'ExamSeries',
    tableName: 'exam_series',
  },
);

module.exports = ExamSeries;
