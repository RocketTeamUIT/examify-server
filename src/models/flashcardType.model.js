const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class FlashcardType extends Model {
  static associate(models) {
    FlashcardType.hasMany(models.FlashcardSet, { as: 'fc_set', foreignKey: 'fc_type_id' });
  }
}

FlashcardType.init(
  {
    fc_type_id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
    },
    type: {
      type: DataTypes.STRING(50),
      allowNull: false,
    },
    description: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    sets_count: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue: 0,
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
    modelName: 'flashcardType',
    tableName: 'flashcard_type',
    schema: 'public',
    hasTrigger: true,
    timestamps: true,
    indexes: [
      {
        name: 'flashcard_type_pkey',
        unique: true,
        fields: [{ name: 'fc_type_id' }],
      },
    ],
  },
);

module.exports = FlashcardType;

// module.exports = function (sequelize, DataTypes) {
//   return sequelize.define(
//     'flashcard_type',
//     {
//       fc_type_id: {
//         autoIncrement: true,
//         type: DataTypes.INTEGER,
//         allowNull: false,
//         primaryKey: true,
//       },
//       type: {
//         type: DataTypes.STRING(50),
//         allowNull: false,
//       },
//       description: {
//         type: DataTypes.TEXT,
//         allowNull: true,
//       },
//       sets_count: {
//         type: DataTypes.INTEGER,
//         allowNull: true,
//         defaultValue: 0,
//       },
//     },
//     {
//       sequelize,
//       tableName: 'flashcard_type',
//       schema: 'public',
//       hasTrigger: true,
//       timestamps: true,
//       indexes: [
//         {
//           name: 'flashcard_type_pkey',
//           unique: true,
//           fields: [{ name: 'fc_type_id' }],
//         },
//       ],
//     },
//   );
// };
