/* eslint valid-jsdoc: "off" */

'use strict';

/**
 * @param {Egg.EggAppInfo} appInfo app info
 */
module.exports = appInfo => {
  /**
   * built-in config
   * @type {Egg.EggAppConfig}
   **/
  const config = exports = {};

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_1582740352011_9785';

  // add your middleware config here
  config.middleware = [];

  // config.mysql = {
  //   client: {
  //     // host
  //     host: '127.0.0.1',
  //     // 端口号
  //     port: '3306',
  //     // 用户名
  //     user: 'root',
  //     // 密码
  //     password: 'root',
  //     // 数据库名
  //     database: 'x_self_management',
  //   },
  //   // 是否加载到 app 上，默认开启
  //   app: true,
  //   // 是否加载到 agent 上，默认关闭
  //   agent: false,
  // };

  // jwt 自我管理 - https://www.cmd5.com/
  config.jwt = {
    secret: '9057f282255bbe2a5a9c7e0da259eb67',
  };

  config.sequelize = {
    dialect: 'mysql',
    host: '127.0.0.1',
    port: 3306,
    database: 'x_self_management',
    username: 'root',
    password: 'root',
    // 是否自动进行下划线转换（这里是因为DB默认的命名规则是下划线方式，而我们使用的大多数是驼峰方式）
    // underscored: true,
    // 时区，sequelize有很多自动时间的方法，都是和时区相关的，记得设置成东8区（+08:00）
    timezone: '+08:00',
    // define: { // https://segmentfault.com/q/1010000019835309/a-1020000019836455
    //   raw: true,
    //   underscored: false,
    //   freezeTableName: true,
    //   charset: 'utf8',
    //   dialectOptions: {
    //     dateStrings: true,
    //     typeCast: true,
    //     collate: 'utf8_general_ci',
    //   },
    //   timestamps: false,
    // },
    // define: {
    //   timestamps: true,
    //   // paranoid: true,
    //   createdAt: 'createdAt',
    //   updatedAt: 'updatedAt',
    //   avatarUrl: 'avatarUrl',
    //   // deletedAt: 'deleted_at',
    //   underscored: true,
    // },

    // // 添加这个配置-使用sequelize操作数据库 时间格式化-https://segmentfault.com/a/1190000020009630
    dialectOptions: {
      dateStrings: true,
      typeCast: true,
    },
  };


  // token 去掉csrf验证
  config.security = {
    csrf: {
      enable: false,
      ignoreJSON: true,
      // headerName: 'x-csrf-token', // 通过 header 传递 CSRF token 的默认字段为 x-csrf-token
      // ignoreJSON: true,
    },
    // 白名单
    // domainWhiteList: [ 'http://auth.vquery.com:7001', 'http://a.vquery.com:7001' ],
    // withCredentials: true,
    domainWhiteList: [
      'http://localhost:8000',
      'http://localhost:8080',
      'http://localhost:7001',
      'http://localhost:9528',
      '.vquery.com',
      'blog.vquery.com',
      'http://139.199.221.174:8000',
    ], // security whitelist, starts with '.'
  };

  // # 黑白名单 {app_root}/config/config.default.js
  config.cors = {
    // 'origin': 'http://auth.vquery.com:7001',
    allowMethods: 'GET,HEAD,PUT,POST,DELETE,PATCH,OPTIONS',
    credentials: true,
    // 'allowHeaders': 'Origin, X-Requested-With, Content-Type, Accept',
    // 'withCredentials': true,
  };

  // add your user config here
  const userConfig = {
    // myAppName: 'egg',
  };

  return {
    ...config,
    ...userConfig,
  };
};
