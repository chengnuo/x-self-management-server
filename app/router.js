'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;
  router.get('/', controller.home.index);
  router.get('/homeGetData', controller.home.homeGetData);
  router.get('/user', controller.user.index);
  router.post('/user/signIn', controller.user.signIn); // 登录
  router.post('/user/signOut', controller.user.signOut); // 登出
  router.post('/user/userInfo', controller.user.userInfo); // 用户信息
  router.get('/user/userInfo/:id', controller.user.userInfo); // 用户信息
};
