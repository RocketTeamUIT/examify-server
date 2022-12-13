const { Op, Sequelize } = require('sequelize');
const db = require('../models/index');
const connectDB = require('../config/connectDB');
const createError = require('http-errors');

const getAllCommentsBelongToCourse = async (type, page, userId, courseId) => {
  try {
    const nameOrderBy = type === 'latest' ? 'created_at' : 'total_like';

    // Get parent comment list from course Id
    const commentList = await db.Comment.findAll({
      include: [
        {
          model: db.User,
          as: 'user',
          attributes: ['id', 'avt', 'lastName', 'firstName'],
          include: [
            {
              model: db.Rank,
              as: 'rank',
              attributes: ['rankId', 'rankName'],
            },
          ],
        },
      ],
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
        respondId: null,
      },
      order: [[nameOrderBy, 'DESC']],
      nest: true,
      raw: true,
    });

    // Get id from parent comment list
    const parentCommentIdList = commentList.map((commentItem) => commentItem.commentId);

    // Get all reply comment from parent comment
    const childCommentList = await db.Comment.findAll({
      include: [
        {
          model: db.User,
          as: 'user',
          attributes: ['id', 'avt', 'lastName', 'firstName'],
          include: [
            {
              model: db.Rank,
              as: 'rank',
              attributes: ['rankId', 'rankName'],
            },
          ],
        },
      ],
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
        respondId: {
          [Op.in]: parentCommentIdList,
        },
      },
      nest: true,
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

    // Get total comments
    const totalComment = await db.Comment.count({
      where: {
        courseId: courseId,
        respondId: null,
      },
    });

    return Promise.resolve({ commentList, totalComment });
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
      include: [
        {
          model: db.User,
          as: 'user',
          attributes: ['id', 'avt', 'lastName', 'firstName'],
          include: [
            {
              model: db.Rank,
              as: 'rank',
              attributes: ['rankId', 'rankName'],
            },
          ],
        },
      ],
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
      nest: true,
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

const deleteComment = async (userId, commentId) => {
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
      throw createError.BadRequest('Users can only delete their own comments');
    }

    // Query delete
    await db.Comment.destroy({
      where: {
        commentId,
        userId,
      },
    });
  } catch (err) {
    throw err;
  }
};

module.exports = {
  getAllCommentsBelongToCourse,
  createNewComment,
  getOneComment,
  updateContentComment,
  deleteComment,
};
