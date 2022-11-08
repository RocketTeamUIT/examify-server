const express = require('express');
const router = express.Router();

// [GET] /course
router.get('/', async (req, res) => {
  res.json('alo2');
});

// [POST] /course
router.post('/', (req, res) => {
  res.json('alo3');
});

module.exports = router;
