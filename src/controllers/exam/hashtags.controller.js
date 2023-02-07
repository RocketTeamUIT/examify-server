const Op = require('sequelize').Op;
const db = require('../../models/index');

module.exports = {
  getAllHashtag: async (req, res, next) => {
    try {
      listHashtagData = await db.Hashtag.findAll();

      res.status(200).json({
        status: 200,
        data: listHashtagData,
      });
    } catch (err) {
      next(err);
    }
  },

  getHashtag: async (req, res, next) => {
    try {
      const hashtagId = req?.params?.id;

      const hashtagData = await db.Hashtag.findOne({
        where: {
          id: hashtagId,
        },
      });

      res.status(200).json({
        status: 200,
        data: hashtagData,
      });
    } catch (err) {
      next(err);
    }
  },

  createHashtag: async (req, res, next) => {
    try {
      const { name } = req.body;

      const newHashtag = await db.Hashtag.create({ name });

      res.status(200).json({
        status: 200,
        data: newHashtag,
        message: 'created a hashtag success!',
      });
    } catch (err) {
      next(err);
    }
  },

  updateHashtag: async (req, res, next) => {
    try {
      const hashtagId = req?.params?.id;
      const { name } = req.body;

      await db.Hashtag.update({ name }, { where: { id: hashtagId } });

      res.status(200).json({
        status: 200,
        message: 'updated a hashtag success!',
      });
    } catch (err) {
      next(err);
    }
  },

  deleteHashtag: async (req, res, next) => {
    try {
      const hashtagId = req?.params?.id;

      // delete reference of question refer to hashtag.
      await db.Question.update(
        {
          hashtagId: null,
        },
        {
          where: {
            hashtagId,
          },
        },
      );

      //  delete hashtag
      await db.Hashtag.destroy({
        where: {
          id: hashtagId,
        },
      });

      res.status(200).json({
        status: 200,
        message: 'deleted a hashtag success!',
      });
    } catch (err) {
      next(err);
    }
  },
};
