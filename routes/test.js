const express = require('express');
const router = express.Router();

// [GET] /test
router.get('/', (req, res) => {
  res.json('This is test');
});

module.exports = router;
