const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../../config/connectDB');

class Question extends Model {
  static associate(models) {
    Question.belongsTo(models.SetQuestion, { foreignKey: 'setQuestionId' });
    Question.belongsTo(models.Hashtag, { foreignKey: 'hastagId' });
    Question.hasMany(models.Choice, { foreignKey: 'questionId' });
    Question.hasMany(models.AnswerRecord, { foreignKey: 'questionId' });
  }
}

Question.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
      field: 'question_id',
    },

    setQuestionId: {
      type: DataTypes.INTEGER,
      field: 'set_question_id',
    },

    hastagId: {
      type: DataTypes.INTEGER,
      field: 'hashtag_id',
    },

    name: {
      type: DataTypes.STRING,
      field: 'name',
    },

    explain: {
      type: DataTypes.STRING,
      field: 'explain',
    },

    order: {
      type: DataTypes.INTEGER,
      field: 'order_qn',
    },

    level: {
      type: DataTypes.INTEGER,
      field: 'level',
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
    modelName: 'Question',
    tableName: 'question',
  },
);

module.exports = Question;
