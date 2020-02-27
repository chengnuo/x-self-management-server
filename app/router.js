'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;
  router.get('/', controller.home.index);
  router.get('/homeGetData', controller.home.homeGetData);
  router.get('/user', controller.user.index);
};
