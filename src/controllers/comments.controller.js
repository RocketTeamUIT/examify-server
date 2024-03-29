const connectDB = require('../config/connectDB');
const {
  getAllCommentsBelongToCourse,
  createNewComment,
  getOneComment,
  updateContentComment,
  deleteComment,
} = require('../services/comment.service');

module.exports = {
  getOneComment: async (req, res, next) => {
    try {
      // Get userId from middleware check login
      let userId = -1;
      if (req?.payload?.user?.id !== undefined) userId = req.payload.user.id;

      // Get comment id from req.params
      const commentId = Number(req.params.commentId);

      // Get comment
      const comment = await getOneComment(userId, commentId);

      res.status(200).json({
        status: 200,
        data: comment,
      });
    } catch (err) {
      next(err);
    }
  },
  getAllCommentOfUser: async (req, res, next) => {
    try {
      // Get TYPE query parameters from req.query
      let type = req.query.type || 'latest';
      if (!['latest', 'popular'].includes(type)) {
        type = 'latest';
      }

      // Get PAGE query parameters from req.query
      let page = Number(req.query.page) || 1;
      if (!Number.isInteger(page)) {
        page = 1;
      }

      // Get userId from middleware check login
      let userId = -1;
      if (req?.payload?.user?.id !== undefined) userId = req.payload.user.id;

      // Get course id from req.params
      const courseId = Number(req.params.courseId);

      // Get all comments from courseId
      const { totalComment, commentList, totalRootComment } = await getAllCommentsBelongToCourse(
        type,
        page,
        userId,
        courseId,
      );

      res.status(200).json({
        status: 200,
        data: {
          commentList,
          totalRootComment,
          totalComment,
        },
      });
    } catch (err) {
      next(err);
    }
  },
  userLike: async (req, res, next) => {
    try {
      // Get userId from access token
      const { id: userId } = req.payload.user;

      // Get commentId from req.params
      const commentId = Number(req.params.commentId);

      // Raw query call procedure like comment
      const query = await connectDB.sequelize.query(`CALL proc_like_comment(${userId}, ${commentId})`);

      res.status(200).json({
        status: 200,
        message: 'User already liked',
      });
    } catch (err) {
      next(err);
    }
  },
  userUnlike: async (req, res, next) => {
    try {
      // Get userId from access token
      const { id: userId } = req.payload.user;

      // Get commentId from req.params
      const commentId = Number(req.params.commentId);

      // Raw query call procedure like comment
      const query = await connectDB.sequelize.query(`CALL proc_unlike_comment(${userId}, ${commentId})`);

      res.status(200).json({
        status: 200,
        message: 'User already unliked',
      });
    } catch (err) {
      next(err);
    }
  },
  createNewComment: async (req, res, next) => {
    try {
      // Get userId from access token
      const { id: userId } = req.payload.user;

      // Get info from req.body
      const { courseId, content } = req.body;
      const respondId = req?.body?.respondId || null;

      // Create new comment
      const newComment = await createNewComment(userId, courseId, content, respondId);

      res.status(201).json({
        status: 201,
        message: 'Create new comment successfully',
        data: newComment,
      });
    } catch (err) {
      next(err);
    }
  },
  updateContentComment: async (req, res, next) => {
    try {
      // Get userId from access token
      const { id: userId } = req.payload.user;

      // Get commentId from path parameters
      const commentId = Number(req.params.commentId);

      // Get info from req.body
      const newContent = req.body.newContent;

      updateContentComment(userId, commentId, newContent);

      res.status(200).json({
        status: 200,
        message: 'Update content comment successfully',
      });
    } catch (err) {
      next(err);
    }
  },
  deleteComment: async (req, res, next) => {
    try {
      // Get userId from access token
      const { id: userId } = req.payload.user;

      // Get commentId from path parameters
      const commentId = Number(req.params.commentId);

      await deleteComment(userId, commentId);

      res.status(200).json({
        status: 200,
        message: 'Delete successfully',
      });
    } catch (err) {
      next(err);
    }
  },
};
