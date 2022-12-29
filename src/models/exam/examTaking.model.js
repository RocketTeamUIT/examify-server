const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../../config/connectDB');

class ExamTaking extends Model {
  static associate(models) {
    ExamTaking.belongsTo(models.User, { foreignKey: 'userId' });
    ExamTaking.belongsTo(models.Exam, { foreignKey: 'examId' });
    ExamTaking.hasMany(models.AnswerRecord, { foreignKey: 'examTakingId' });
  }
}

ExamTaking.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
      field: 'exam_taking_id',
    },

    examId: {
      type: DataTypes.INTEGER,
      field: 'exam_id',
    },

    userId: {
      type: DataTypes.INTEGER,
      field: 'user_id',
    },

    timeFinished: {
      type: DataTypes.INTEGER,
      field: 'time_finished',
    },

    numsOfCorrectQn: {
      type: DataTypes.INTEGER,
      field: 'nums_of_correct_qn',
    },

    totalQuestion: {
      type: DataTypes.INTEGER,
      field: 'total_question',
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
    modelName: 'ExamTaking',
    tableName: 'exam_taking',
  },
);

module.exports = ExamTaking;
