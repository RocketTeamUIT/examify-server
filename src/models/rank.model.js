const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class Rank extends Model {
  // Add associate here...
  static associate(models) {
    Rank.hasMany(models.User, { foreignKey: 'rankId' });
  }
}

Rank.init(
  {
    rankId: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      allowNull: false,
      primaryKey: true,
      field: 'rank_id',
    },

    rankName: {
      type: DataTypes.TEXT,
      field: 'rank_name',
      allowNull: false,
    },

    pointToUnlock: {
      type: DataTypes.INTEGER,
      field: 'point_to_unlock',
      allowNull: false,
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
