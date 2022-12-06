module.exports = {
  getAllCommentOfUser: async (req, res, next) => {
    try {
      res.status(200).json({
        status: 200,
        message: 'Get all comment of user',
      });
    } catch (err) {
      next(err);
    }
  },
};
