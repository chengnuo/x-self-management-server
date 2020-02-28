'use strict';

/** @type Egg.EggPlugin */
// module.exports = {
//   // had enabled by egg
//   // static: {
//   //   enable: true,
//   // }
//   mysql: {
//     enable: true,
//     package: 'egg-mysql',
//   },
// };

// exports.mysql = {
//   enable: true,
//   package: 'egg-mysql',
// };

exports.sequelize = {
  enable: true,
  package: 'egg-sequelize',
};


// 解决 invalid csrf token
exports.security = {
  enable: true,
  package: 'egg-security',
};

// 黑白名单 {app_root}/config/plugin.js
exports.cors = {
  enable: true,
  package: 'egg-cors',
};