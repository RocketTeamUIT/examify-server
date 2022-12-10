const express = require('express');
const router = express.Router();
const testController = require('../controllers/test.controller');
const db = require('../models/index');

// [GET] /test
router.get('/', (req, res) => {
  res.json('This is test');
});

// [GET] /test2
router.get('/2', async (req, res) => {
  try {
    const rankList = await db.Rank.findAll({
      include: [
        {
          model: db.User,
        },
      ],
    });

    res.status(200).json({
      status: 200,
      data: rankList,
      message: 'This is a test message',
    });
  } catch (err) {
    console.log(err);
  }
});

module.exports = router;
