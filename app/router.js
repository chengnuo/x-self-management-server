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
  router.post('/user/getList', controller.user.getList); // 用户列表
  router.post('/user/create', controller.user.create); // 用户创建
  router.post('/user/update', controller.user.update); // 用户更新
  router.post('/user/destroy', controller.user.destroy); // 用户删除
};
