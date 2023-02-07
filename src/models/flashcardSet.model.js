const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class FlashcardSet extends Model {
  static associate(models) {
    FlashcardSet.hasMany(models.Flashcard, { as: 'flashcards', foreignKey: 'fc_set_id' });
    FlashcardSet.belongsTo(models.FlashcardType, { as: 'fc_type', foreignKey: 'fc_type_id' });
    FlashcardSet.belongsTo(models.User, { as: 'created_by_user', foreignKey: 'created_by' });
    FlashcardSet.hasMany(models.FlashcardSharePermit, { as: 'flashcard_share_permits', foreignKey: 'fc_set_id' });
  }
}

FlashcardSet.init(
  {
    fc_set_id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
    },
    fc_type_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: 'flashcard_type',
        key: 'fc_type_id',
      },
    },
    name: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    description: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    words_count: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue: 0,
    },
    system_belong: {
      type: DataTypes.BOOLEAN,
      allowNull: true,
      defaultValue: false,
    },
    access: {
      type: DataTypes.STRING(16),
      allowNull: true,
    },
    views: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue: 0,
    },
    created_by: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: 'users',
        key: 'user_id',
      },
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
    modelName: 'flashcardSet',
    tableName: 'flashcard_set',
    schema: 'public',
    hasTrigger: true,
    timestamps: true,
    indexes: [
      {
        name: 'flashcard_set_pkey',
        unique: true,
        fields: [{ name: 'fc_set_id' }],
      },
    ],
  },
);

module.exports = FlashcardSet;

// module.exports = function (sequelize, DataTypes) {
//   return sequelize.define(
//     'flashcard_set',
//     {
//       fc_set_id: {
//         autoIncrement: true,
//         type: DataTypes.INTEGER,
//         allowNull: false,
//         primaryKey: true,
//       },
//       fc_type_id: {
//         type: DataTypes.INTEGER,
//         allowNull: true,
//         references: {
//           model: 'flashcard_type',
//           key: 'fc_type_id',
//         },
//       },
//       description: {
//         type: DataTypes.TEXT,
//         allowNull: true,
//       },
//       words_count: {
//         type: DataTypes.INTEGER,
//         allowNull: true,
//         defaultValue: 0,
//       },
//       system_belong: {
//         type: DataTypes.BOOLEAN,
//         allowNull: true,
//         defaultValue: false,
//       },
//       access: {
//         type: DataTypes.STRING(16),
//         allowNull: true,
//       },
//       views: {
//         type: DataTypes.INTEGER,
//         allowNull: true,
//         defaultValue: 0,
//       },
//     },
//     {
//       sequelize,
//       tableName: 'flashcard_set',
//       schema: 'public',
//       hasTrigger: true,
//       timestamps: true,
//       indexes: [
//         {
//           name: 'flashcard_set_pkey',
//           unique: true,
//           fields: [{ name: 'fc_set_id' }],
//         },
//       ],
//     },
//   );
// };
