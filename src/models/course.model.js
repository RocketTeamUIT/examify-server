const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../config/connectDB');

class Course extends Model {
  // Add associate here...
  static associate(models) {
    Course.hasMany(models.Chapter, { foreignKey: 'courseId' });
    Course.belongsToMany(models.User, { through: models.Comment, foreignKey: 'courseId' });
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
      allowNull: false,
    },

    image: {
      type: DataTypes.STRING,
      field: 'image',
      allowNull: false,
    },

    level: {
      type: DataTypes.STRING,
      field: 'level',
      allowNull: false,
    },

    charges: {
      type: DataTypes.BOOLEAN,
      field: 'charges',
      allowNull: false,
    },

    pointToUnlock: {
      type: DataTypes.INTEGER,
      field: 'point_to_unlock',
    },

    pointReward: {
      type: DataTypes.INTEGER,
      field: 'point_reward',
      allowNull: false,
    },

    quantityRating: {
      type: DataTypes.INTEGER,
      field: 'quantity_rating',
      allowNull: false,
      defaultValue: 0,
    },

    avgRating: {
      type: DataTypes.INTEGER,
      field: 'avg_rating',
      allowNull: false,
      defaultValue: 0,
    },

    participants: {
      type: DataTypes.INTEGER,
      field: 'participants',
      allowNull: false,
      defaultValue: 0,
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
      allowNull: false,
      defaultValue: 0,
    },

    totalLesson: {
      type: DataTypes.INTEGER,
      field: 'total_lesson',
      allowNull: false,
      defaultValue: 0,
    },

    totalVideoTime: {
      type: DataTypes.INTEGER,
      field: 'total_video_time',
      allowNull: false,
      defaultValue: 0,
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
