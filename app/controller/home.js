'use strict';

const Controller = require('egg').Controller;

class HomeController extends Controller {
  async index() {
    const { ctx } = this;
    ctx.body = 'hi, egg';
  }
  async homeGetData() {
    const {
      ctx,
    } = this;
    const getData = await this.app.mysql.get('x_user_users', {
      id: 1,
    }); // you can access to simple database instance by using app.mysql.
    console.log('getData', getData);
    ctx.body = {
      data: getData,
    };
  }
}

module.exports = HomeController;
