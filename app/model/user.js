'use strict';

// const moment = require('moment');

module.exports = app => {
  const {
    STRING,
    INTEGER,
    DATE,
  } = app.Sequelize;

  const User = app.model.define('x_user_users', {
    id: {
      type: INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    name: STRING(255),
    phone: STRING(255),
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
  });

  return User;
};
