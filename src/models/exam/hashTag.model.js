const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../../config/connectDB');

class Hashtag extends Model {
  static associate(models) {
    Hashtag.hasMany(models.Question, { foreignKey: 'hashtagId' });
  }
}

Hashtag.init(
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
    modelName: 'Hashtag',
    tableName: 'hashtag',
  },
);

module.exports = Hashtag;
