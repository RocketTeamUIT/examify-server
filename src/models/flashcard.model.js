const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class Flashcard extends Model {
  static associate(models) {
    Flashcard.hasMany(models.LearntList, { as: 'learnt_lists', foreignKey: 'fc_id' });
    Flashcard.belongsTo(models.FlashcardSet, { as: 'fc_set', foreignKey: 'fc_set_id' });
    Flashcard.belongsTo(models.User, { as: 'created_by_user', foreignKey: 'created_by' });
    Flashcard.belongsToMany(models.User, {
      as: 'user_id_users',
      through: models.LearntList,
      foreignKey: 'fc_id',
      otherKey: 'user_id',
    });
  }
}

Flashcard.init(
  {
    fc_id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
    },
    fc_set_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: 'flashcard_set',
        key: 'fc_set_id',
      },
    },
    word: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    meaning: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    type_of_word: {
      type: DataTypes.STRING(15),
      allowNull: false,
    },
    pronounce: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    audio: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    example: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    note: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    image: {
      type: DataTypes.TEXT,
      allowNull: true,
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
    modelName: 'flashcard',
    tableName: 'flashcard',
    schema: 'public',
    hasTrigger: true,
    timestamps: true,
    indexes: [
      {
        name: 'flashcard_pkey',
        unique: true,
        fields: [{ name: 'fc_id' }],
      },
    ],
  },
);

module.exports = Flashcard;

// module.exports = function (sequelize, DataTypes) {
//   return sequelize.define(
//     'flashcard',
//     {
//       fc_id: {
//         autoIncrement: true,
//         type: DataTypes.INTEGER,
//         allowNull: false,
//         primaryKey: true,
//       },
//       fc_set_id: {
//         type: DataTypes.INTEGER,
//         allowNull: true,
//         references: {
//           model: 'flashcard_set',
//           key: 'fc_set_id',
//         },
//       },
//       word: {
//         type: DataTypes.TEXT,
//         allowNull: false,
//       },
//       meaning: {
//         type: DataTypes.TEXT,
//         allowNull: false,
//       },
//       type_of_word: {
//         type: DataTypes.STRING(15),
//         allowNull: false,
//       },
//       pronounce: {
//         type: DataTypes.TEXT,
//         allowNull: true,
//       },
//       example: {
//         type: DataTypes.TEXT,
//         allowNull: true,
//       },
//       note: {
//         type: DataTypes.TEXT,
//         allowNull: true,
//       },
//       image: {
//         type: DataTypes.TEXT,
//         allowNull: true,
//       },
//     },
//     {
//       sequelize,
//       tableName: 'flashcard',
//       schema: 'public',
//       hasTrigger: true,
//       timestamps: true,
//       indexes: [
//         {
//           name: 'flashcard_pkey',
//           unique: true,
//           fields: [{ name: 'fc_id' }],
//         },
//       ],
//     },
//   );
// };
