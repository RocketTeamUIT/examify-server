const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../../config/connectDB');

class Choice extends Model {
  static associate(models) {
    Choice.belongsTo(models.Question, { foreignKey: 'questionId' });
    Choice.hasMany(models.AnswerRecord, { foreignKey: 'choiceId' });
  }
}

Choice.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
      field: 'choice_id',
    },

    questionId: {
      type: DataTypes.INTEGER,
      field: 'question_id',
    },

    orderChoice: {
      type: DataTypes.INTEGER,
      field: 'order_choice',
    },

    name: {
      type: DataTypes.STRING,
      field: 'name',
    },

    key: {
      type: DataTypes.BOOLEAN,
      field: 'key',
    },

    createAt: {
      type: DataTypes.DATE,
      field: 'created_at',
    },

    updateAt: {
      type: DataTypes.DATE,
      field: 'updated_at',
    },
  },
  {
    sequelize,
    modelName: 'Choice',
    tableName: 'choice',
  },
);

module.exports = Choice;
