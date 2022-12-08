const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class Rank extends Model {
  static associate(models) {
    // Rank.hasMany(models.User, {foreignKey: 'rankId'})
  }
}

Rank.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
      field: 'rank_id',
    },

    rankName: {
      type: DataTypes.STRING,
      field: 'rank_name',
    },

    pointToUnlock: {
      type: DataTypes.INTEGER,
      field: 'point_to_unlock',
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
    modelName: 'Rank',
    tableName: 'rank',
  },
);

module.exports = Rank;
