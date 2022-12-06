const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class Course extends Model {
  static associate(models) {
    Course.hasMany(models.Chapter, { foreignKey: 'courseId', as: 'chapterList' });
    Course.hasMany(models.JoinCourse, { foreignKey: 'courseId' });
    Course.hasMany(models.Rating, { foreignKey: 'courseId' });
    // Course.hasMany(models.Comment, { foreignKey: 'courseId' });
    // Course.belongsTo(models.User, { foreignKey: 'createBy' });
  }
}

Course.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
      field: 'course_id',
    },

    name: {
      type: DataTypes.STRING,
      field: 'name',
    },

    image: {
      type: DataTypes.STRING,
      field: 'image',
    },

    level: {
      type: DataTypes.STRING,
      field: 'level',
    },

    charges: {
      type: DataTypes.BOOLEAN,
      field: 'charges',
    },

    pointToUnlock: {
      type: DataTypes.INTEGER,
      field: 'point_to_unlock',
    },

    pointReward: {
      type: DataTypes.INTEGER,
      field: 'point_reward',
    },

    quantityRating: {
      type: DataTypes.INTEGER,
      field: 'quantity_rating',
    },

    avgRating: {
      type: DataTypes.INTEGER,
      field: 'avg_rating',
    },

    participants: {
      type: DataTypes.INTEGER,
      field: 'participants',
    },

    price: {
      type: DataTypes.INTEGER,
      field: 'price',
    },

    discount: {
      type: DataTypes.INTEGER,
      field: 'discount',
    },

    totalChapter: {
      type: DataTypes.INTEGER,
      field: 'total_chapter',
    },

    totalLesson: {
      type: DataTypes.INTEGER,
      field: 'total_lesson',
    },

    totalVideoTime: {
      type: DataTypes.INTEGER,
      field: 'total_video_time',
    },

    achieves: {
      type: DataTypes.STRING,
      field: 'achieves',
    },

    description: {
      type: DataTypes.STRING,
      field: 'description',
    },

    createBy: {
      type: DataTypes.STRING,
      field: 'created_by',
    },

    createdAt: {
      type: DataTypes.DATE,
      field: 'created_at',
    },

    updatedAt: {
      type: DataTypes.DATE,
      field: 'updated_at',
    },
  },
  {
    sequelize,
    timestamps: true,
    modelName: 'Course',
    tableName: 'course',
  },
);

module.exports = Course;
