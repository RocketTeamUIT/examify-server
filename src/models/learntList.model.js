const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class LearntList extends Model {
  static associate(models) {
    LearntList.belongsTo(models.Flashcard, { as: 'fc', foreignKey: 'fc_id' });
    LearntList.belongsTo(models.User, { as: 'user', foreignKey: 'user_id' });
  }
}

LearntList.init(
  {
    fc_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'flashcard',
        key: 'fc_id',
      },
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'users',
        key: 'user_id',
      },
    },
    createdAt: {
      type: DataTypes.DATE,
      field: 'created_at',
    },
  },
  {
    sequelize,
    modelName: 'learntList',
    tableName: 'learnt_list',
    schema: 'public',
    timestamps: false,
    indexes: [
      {
        name: 'learnt_list_pkey',
        unique: true,
        fields: [{ name: 'fc_id' }, { name: 'user_id' }],
      },
    ],
  },
);

module.exports = LearntList;

// module.exports = function (sequelize, DataTypes) {
//   return sequelize.define(
//     'learnt_list',
//     {
//       fc_id: {
//         type: DataTypes.INTEGER,
//         allowNull: false,
//         primaryKey: true,
//         references: {
//           model: 'flashcard',
//           key: 'fc_id',
//         },
//       },
//       user_id: {
//         type: DataTypes.INTEGER,
//         allowNull: false,
//         primaryKey: true,
//         references: {
//           model: 'users',
//           key: 'user_id',
//         },
//       },
//     },
//     {
//       sequelize,
//       tableName: 'learnt_list',
//       schema: 'public',
//       timestamps: true,
//       indexes: [
//         {
//           name: 'learnt_list_pkey',
//           unique: true,
//           fields: [{ name: 'fc_id' }, { name: 'user_id' }],
//         },
//       ],
//     },
//   );
// };
