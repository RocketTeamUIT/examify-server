const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class FlashcardSharePermit extends Model {
  static associate(models) {
    FlashcardSharePermit.belongsTo(models.FlashcardSet, { as: 'fc_set', foreignKey: 'fc_set_id' });
    FlashcardSharePermit.belongsTo(models.User, { as: 'user', foreignKey: 'user_id' });
  }
}

FlashcardSharePermit.init(
  {
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'users',
        key: 'user_id',
      },
    },
    fc_set_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'flashcard_set',
        key: 'fc_set_id',
      },
    },
    createdAt: {
      type: DataTypes.DATE,
      field: 'created_at',
    },
  },
  {
    sequelize,
    tableName: 'flashcard_share_permit',
    schema: 'public',
    timestamps: false,
  },
);

module.exports = FlashcardSharePermit;

// module.exports = function (sequelize, DataTypes) {
//   return sequelize.define(
//     'flashcard_share_permit',
//     {
//       user_id: {
//         type: DataTypes.INTEGER,
//         allowNull: true,
//         references: {
//           model: 'users',
//           key: 'user_id',
//         },
//       },
//       fc_set_id: {
//         type: DataTypes.INTEGER,
//         allowNull: true,
//         references: {
//           model: 'flashcard_set',
//           key: 'fc_set_id',
//         },
//       },
//     },
//     {
//       sequelize,
//       tableName: 'flashcard_share_permit',
//       schema: 'public',
//       timestamps: true,
//     },
//   );
// };
