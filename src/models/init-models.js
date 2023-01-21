var DataTypes = require('sequelize').DataTypes;
var _flashcard_share_permit = require('./flashcard_share_permit');

function initModels(sequelize) {
  var flashcard_share_permit = _flashcard_share_permit(sequelize, DataTypes);

  flashcard_share_permit.belongsTo(flashcard_set, { as: 'fc_set', foreignKey: 'fc_set_id' });
  flashcard_share_permit.belongsTo(users, { as: 'user', foreignKey: 'user_id' });
  flashcard_set.hasMany(flashcard_share_permit, { as: 'flashcard_share_permits', foreignKey: 'fc_set_id' });
  users.hasMany(flashcard_share_permit, { as: 'flashcard_share_permits', foreignKey: 'user_id' });

  return {
    flashcard_share_permit,
  };
}
module.exports = initModels;
module.exports.initModels = initModels;
module.exports.default = initModels;
