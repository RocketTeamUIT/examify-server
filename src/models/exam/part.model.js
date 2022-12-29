const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../../config/connectDB');

class Part extends Model {
  static associate(models) {
    Part.belongsTo(models.Exam, { foreignKey: 'examId' });
    Part.hasMany(models.SetQuestion, { foreignKey: 'partId' });
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
      type: DataTypes.ABSTRACT,
      field: 'exam_id',
    },

    name: {
      type: DataTypes.ABSTRACT,
      field: 'name',
    },

    totalQuestion: {
      type: DataTypes.ABSTRACT,
      field: 'total_question',
    },

    numberOfExplaination: {
      type: DataTypes.ABSTRACT,
      field: 'number_of_explanation',
    },

    numericOrder: {
      type: DataTypes.INTEGER,
      field: 'numeric_order',
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
    modelName: 'Part',
    tableName: 'part',
  },
);

module.exports = Part;
