const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../../config/connectDB');

class Part extends Model {
  static associate(models) {
    Part.belongsTo(models.Exam, { foreignKey: 'examId' });
    Part.hasMany(models.SetQuestion, { foreignKey: 'partId', as: 'setQuestionList' });
    Part.hasMany(models.PartOption, { foreignKey: 'partId' });
  }
}

Part.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
      field: 'part_id',
    },

    examId: {
      type: DataTypes.INTEGER,
      field: 'exam_id',
    },

    name: {
      type: DataTypes.STRING,
      field: 'name',
    },

    totalQuestion: {
      type: DataTypes.INTEGER,
      field: 'total_question',
    },

    numberOfExplaination: {
      type: DataTypes.INTEGER,
      field: 'number_of_explanation',
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
    modelName: 'Part',
    tableName: 'part',
  },
);

module.exports = Part;
