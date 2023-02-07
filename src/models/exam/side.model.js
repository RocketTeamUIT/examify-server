const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../../config/connectDB');

class Side extends Model {
  static associate(models) {
    Side.belongsTo(models.SetQuestion, { foreignKey: 'setQuestionId' });
  }
}

Side.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
      field: 'side_id',
    },

    setQuestionId: {
      type: DataTypes.INTEGER,
      field: 'set_question_id',
    },

    paragraph: {
      type: DataTypes.STRING,
      field: 'paragraph',
    },

    numericOrder: {
      type: DataTypes.INTEGER,
      field: 'seq',
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
    modelName: 'Side',
    tableName: 'side',
  },
);

module.exports = Side;
