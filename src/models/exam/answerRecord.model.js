const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../../config/connectDB');

class AnswerRecord extends Model {
  static associate(models) {
    AnswerRecord.belongsTo(models.Question, { foreignKey: 'questionId' });
    AnswerRecord.belongsTo(models.ExamTaking, { foreignKey: 'examTakingId' });
    AnswerRecord.belongsTo(models.Choice, { foreignKey: 'choiceId' });
  }
}

AnswerRecord.init(
  {
    examTakingId: {
      type: DataTypes.INTEGER,
      field: 'exam_taking_id',
      primaryKey: true,
    },

    questionId: {
      type: DataTypes.INTEGER,
      field: 'question_id',
      primaryKey: true,
    },

    choiceId: {
      type: DataTypes.INTEGER,
      field: 'choice_id',
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
    modelName: 'AnswerRecord',
    tableName: 'answer_record',
  },
);

module.exports = AnswerRecord;
