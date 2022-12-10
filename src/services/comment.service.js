const { Op, Sequelize } = require('sequelize');
const db = require('../models/index');
const connectDB = require('../config/connectDB');
const createError = require('http-errors');

const getAllCommentsBelongToCourse = async (type, page, userId, courseId) => {
  try {
    const nameOrderBy = type === 'latest' ? 'created_at' : 'total_like';

    // Get parent comment list from course Id
    const commentList = await db.Comment.findAll({
      attributes: {
        include: [
          [
            Sequelize.literal(
              `CASE WHEN fn_check_user_like(${userId}, ${
                connectDB.sequelize.col('comment_id').col
              }) = true THEN true ELSE false END`,
            ),
            'hasLiked',
          ],
        ],
      },
      limit: 10,
      offset: 10 * (page - 1),
      where: {
        courseId: courseId,
      },
      order: [[nameOrderBy, 'DESC']],
      raw: true,
    });

    // Get id from parent comment list
    const parentCommentIdList = commentList.map((commentItem) => commentItem.commentId);

    // Get all reply comment from parent comment
    const childCommentList = await db.Comment.findAll({
      where: {
        respondId: {
          [Op.in]: parentCommentIdList,
        },
      },
      raw: true,
    });

    // Mapping between reply and parent comment
    const childCommentMappingList = parentCommentIdList.map((item) => {
      const commentBelongToRespondId = childCommentList.filter(
        (childCommentItem) => childCommentItem.respondId === item,
      );

      return {
        respondId: item,
        childComment: commentBelongToRespondId,
      };
    });

    // Add child comment to comment list
    commentList.forEach((commentItem, index) => {
      commentItem.childComment = childCommentMappingList[index].childComment;
    });

    return Promise.resolve(commentList);
  } catch (err) {
    throw createError.InternalServerError("Maybe there's something wrong with our server");
  }
};

const createNewComment = async (userId, courseId, content, respondId) => {
  try {
    // Check if respondId !== null, we validate 'reply comment with courseId must match parent comment'
    if (respondId === null) {
      // if respondId === null -> oke no problem -> create new comment
      newComment = await db.Comment.create({
        userId,
        courseId,
        content,
        respondId,
      });
    } else {
      // Given respondId from 'Reply comment', query parent comment
      const parentComment = await db.Comment.findOne({
        where: {
          commentId: respondId,
        },
        raw: true,
      });

      // Check match
      if (parentComment.courseId !== courseId) {
        throw createError.BadRequest('Reply comment with courseId must match parent comment');
      }

      // Valid -> create new comment
      newComment = await db.Comment.create({
        userId,
        courseId,
        content,
        respondId,
      });

      return Promise.resolve(newComment);
    }
  } catch (err) {
    throw err;
  }
};

const getOneComment = async (userId, commentId) => {
  try {
    const comment = await db.Comment.findOne({
      attributes: {
        include: [
          [
            Sequelize.literal(
              `CASE WHEN fn_check_user_like(${userId}, ${
                connectDB.sequelize.col('comment_id').col
              }) = true THEN true ELSE false END`,
            ),
            'hasLiked',
          ],
        ],
      },
      where: {
        commentId,
      },
      raw: true,
    });

    return Promise.resolve(comment);
  } catch (err) {
    throw createError.InternalServerError("Maybe there's something wrong with our server");
  }
};

const updateContentComment = async (userId, commentId, newContent) => {
  try {
    // Check if comment belong to user ?
    const commentRecord = await db.Comment.findOne({
      where: {
        commentId,
        userId,
      },
      raw: true,
    });

    if (commentRecord === null) {
      throw createError.BadRequest('Users can only edit their own comments');
    }

    // Query update
    await db.Comment.update(
      { content: newContent },
      {
        where: {
          commentId,
          userId,
        },
      },
    );
  } catch (err) {
    throw err;
  }
};

module.exports = {
  getAllCommentsBelongToCourse,
  createNewComment,
  getOneComment,
  updateContentComment,
};
