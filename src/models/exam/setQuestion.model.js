const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../../config/connectDB');

class SetQuestion extends Model {
  static associate(models) {
    SetQuestion.belongsTo(models.Part, { foreignKey: 'partId' });
    SetQuestion.hasMany(models.Side, { foreignKey: 'setQuestionId', as: 'side' });
    SetQuestion.hasMany(models.Question, { foreignKey: 'setQuestionId', as: 'questionList' });
  }
}

SetQuestion.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
      field: 'set_question_id',
    },

    partId: {
      type: DataTypes.INTEGER,
      field: 'part_id',
    },

    title: {
      type: DataTypes.STRING,
      field: 'title',
    },

    audio: {
      type: DataTypes.STRING,
      field: 'audio',
    },

    numericOrder: {
      type: DataTypes.INTEGER,
      field: 'numeric_order',
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
    modelName: 'SetQuestion',
    tableName: 'set_question',
  },
);

module.exports = SetQuestion;
