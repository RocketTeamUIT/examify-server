const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../../config/connectDB');

class Hastag extends Model {
  static associate(models) {
    Hastag.hasMany(models.Question, { foreignKey: 'hastagId' });
  }
}

Hastag.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
      field: 'hashtag_id',
    },

    name: {
      type: DataTypes.STRING,
      field: 'name',
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
    modelName: 'Hastag',
    tableName: 'hashtag',
  },
);

module.exports = Hastag;
