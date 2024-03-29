const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../../config/connectDB');

class Exam extends Model {
  static associate(models) {
    Exam.belongsTo(models.ExamSeries, { foreignKey: 'examSeriesId' });
    Exam.hasMany(models.ExamTaking, { foreignKey: 'examId', as: 'historyTaking' });
    Exam.hasMany(models.Part, { foreignKey: 'examId', as: 'parts' });
  }
}

Exam.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
      field: 'exam_id',
    },

    examSeriesId: {
      type: DataTypes.INTEGER,
      field: 'exam_series_id',
    },

    name: {
      type: DataTypes.STRING,
      field: 'name',
    },

    totalPart: {
      type: DataTypes.INTEGER,
      field: 'total_part',
    },

    totalQuestion: {
      type: DataTypes.INTEGER,
      field: 'total_question',
    },

    totalComment: {
      type: DataTypes.INTEGER,
      field: 'total_comment',
    },

    numsJoin: {
      type: DataTypes.INTEGER,
      field: 'nums_join',
    },

    pointReward: {
      type: DataTypes.INTEGER,
      field: 'point_reward',
    },

    hashtag: {
      type: DataTypes.ARRAY(sequelize.Sequelize.TEXT),
      field: 'hashtag',
    },

    isFullExplanation: {
      type: DataTypes.BOOLEAN,
      field: 'is_full_explanation',
    },

    duration: {
      type: DataTypes.INTEGER,
      field: 'duration',
    },

    audio: {
      type: DataTypes.STRING,
      field: 'audio',
    },

    fileDownload: {
      type: DataTypes.STRING,
      field: 'file_download',
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
    modelName: 'Exam',
    tableName: 'exam',
  },
);

module.exports = Exam;
