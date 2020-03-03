'use strict';

// const moment = require('moment');

module.exports = app => {
  const {
    STRING,
    INTEGER,
    DATE,
  } = app.Sequelize;

  const User = app.model.define('user', {
    id: {
      type: INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    name: STRING(255),
    phone: STRING(255),
    password: STRING(255),
    token: STRING(255),
    avatarUrl: {
      type: STRING,
      field: 'avatar_url',
    },
    createdAt: {
      type: DATE,
      field: 'created_at',
    },
    updatedAt: {
      type: DATE,
      field: 'updated_at',
    },
    deletedAt: {
      type: INTEGER,
    },
    // age: INTEGER,
    // created_at: {
    //   type: DATE,
    //   get() {
    //     return moment(this.getDataValue('createdAt')).format('YYYY-MM-DD HH:mm:ss');
    //   },
    // },
    // updated_at: {
    //   type: DATE,
    //   get() {
    //     return moment(this.getDataValue('updatedAt')).format('YYYY-MM-DD HH:mm:ss');
    //   },
    // },
  }, {
    timestamps: true, // 自动维护时间戳 [ created_at、updated_at ]
    // 禁止修改表名，默认情况下，sequelize将自动将所有传递的模型名称（define的第一个参数）转换为复数
    // 但是为了安全着想，复数的转换可能会发生变化，所以禁止该行为
    freezeTableName: true,
  });

  return User;
};
