const express = require('express');
const router = express.Router();
const unitController = require('../controllers/units.controller');
const { checkLogin, verifyAccessToken } = require('../utils/jwt_service');

// [GET] /units/:id -> get a unit
router.get('/:id', checkLogin, unitController.getUnit);

// [POST] /units/create -> create new unit
router.post('/create', unitController.createNewUnit);

// [DELETE] /units/delete/:id -> delete a unit
router.delete('/delete/:id', unitController.deleteUnit);

// [UPDATE] /units/update/:id -> update a unit
router.put('/update/:id', unitController.updateUnit);

module.exports = router;
