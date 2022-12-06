const { Model, DataTypes } = require('sequelize');

const sequelize = require('../config/connectDB');

class Unit extends Model {
  static associations(models) {
    // Add associate here
  }
}

Unit.init({
  id: {
    type: DataTypes.INTEGER,
    field: 'unit_id',
  },

  name: {
    type: DataTypes.STRING,
    field: 'name',
  },
});
