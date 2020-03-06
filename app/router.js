'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;
  const checktoken = app.middleware.checktoken();
  router.get('/', controller.home.index);
  router.get('/api/home/homeGetData', controller.home.homeGetData);
  // router.get('/user', controller.user.index);
  router.post('/api/user/signIn', controller.user.signIn); // 登录
  router.post('/api/user/signOut', controller.user.signOut); // 登出
  // router.post('/user/userInfo', controller.user.userInfo); // 用户信息
  // router.get('/user/userInfo/:id', controller.user.userInfo); // 用户信息
  // router.post('/user/getList', controller.user.getList); // 用户列表
  // router.post('/user/create', controller.user.create); // 用户创建
  // router.post('/user/update', controller.user.update); // 用户更新
  // router.post('/user/destroy', controller.user.destroy); // 用户删除
  router.resources('user', '/api/user', checktoken, controller.user);
  router.resources('npmjs', '/api/npmjs', checktoken, controller.npmjs);
};
