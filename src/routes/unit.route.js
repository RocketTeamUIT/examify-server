const express = require('express');
const router = express.Router();
const unitController = require('../controllers/units.controller');
const { checkLogin, verifyAccessToken } = require('../utils/jwt_service');

// [GET] /units/:id -> get a unit
router.get('/:id', unitController.getUnit);

// [POST] /units -> create new unit
router.post('/', unitController.createNewUnit);

// [DELETE] /units/:id -> delete a unit
router.delete('/:id', unitController.deleteUnit);

// [UPDATE] /units/:id -> update a unit
router.put('/:id', unitController.updateUnit);

module.exports = router;
