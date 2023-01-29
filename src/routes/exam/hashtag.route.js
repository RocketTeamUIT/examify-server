const express = require('express');
const router = express.Router();
const hashtagsController = require('../../controllers/exam/hashtags.controller');

// [GET] /hashtags -> get all hashtag
router.get('/', hashtagsController.getAllHashtag);

// [GET] /hashtags/:id  -> get a hashtag
router.get('/:id', hashtagsController.getHashtag);

// [POST] /hashtags/create -> create a hashtag
router.post('/create', hashtagsController.createHashtag);

// [PUT] /hashtags/:id -> update a hashtag
router.put('/update/:id', hashtagsController.updateHashtag);

// [DELETE] /hashtags/:id -> delete a hashtag
router.delete('/delete/:id', hashtagsController.deleteHashtag);

module.exports = router;
