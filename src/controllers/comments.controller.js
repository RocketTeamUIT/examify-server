const db = require('../models/index');

module.exports = {
  getAllCommentOfUser: async (req, res, next) => {
    try {
      const commentList = await db.Comment.findAll();

      res.status(200).json({
        status: 200,
        data: commentList,
        message: 'Get all comment of user',
      });
    } catch (err) {
      console.log(err);
      next(err);
    }
  },
};
