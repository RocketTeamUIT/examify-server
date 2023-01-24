const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../../config/connectDB');

class PartOption extends Model {
  static associate(models) {
    PartOption.belongsTo(models.ExamTaking, { foreignKey: 'examTakingId' });
    PartOption.belongsTo(models.Part, { foreignKey: 'partId' });
  }
}

PartOption.init(
  {
    examTakingId: {
      type: DataTypes.INTEGER,
      field: 'exam_taking_id',
      primaryKey: true,
    },

    partId: {
      type: DataTypes.INTEGER,
      field: 'part_id',
      primaryKey: true,
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
    modelName: 'PartOption',
    tableName: 'part_option',
  },
);

module.exports = PartOption;
